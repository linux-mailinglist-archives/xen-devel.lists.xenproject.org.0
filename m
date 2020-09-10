Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD6E264768
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 15:49:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGMwW-0007yW-Bp; Thu, 10 Sep 2020 13:48:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGMwU-0007yP-UP
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 13:48:50 +0000
X-Inumbo-ID: e823070a-2e1b-462c-93f6-2adc45c3fec3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e823070a-2e1b-462c-93f6-2adc45c3fec3;
 Thu, 10 Sep 2020 13:48:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 24542AC1D;
 Thu, 10 Sep 2020 13:49:04 +0000 (UTC)
Subject: Re: [PATCH v5 6/8] common/grant_table: batch flush I/O TLB
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200907074023.1392-1-paul@xen.org>
 <20200907074023.1392-7-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <69b7db3f-2f8d-fa96-f5e9-3cb4e35e9dba@suse.com>
Date: Thu, 10 Sep 2020 15:48:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907074023.1392-7-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.2020 09:40, Paul Durrant wrote:
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -241,7 +241,13 @@ struct gnttab_unmap_common {
>      grant_ref_t ref;
>  };
>  
> -/* Number of unmap operations that are done between each tlb flush */
> +/* Number of map operations that are done between each pre-emption check */
> +#define GNTTAB_MAP_BATCH_SIZE 32
> +
> +/*
> + * Number of unmap operations that are done between each tlb flush and
> + * pre-emption check.
> + */
>  #define GNTTAB_UNMAP_BATCH_SIZE 32

Interesting - I don't think I've ever seen preemption spelled like
this (with a hyphen). In the interest of grep-ability, would you
mind changing to the more "conventional" spelling? Albeit I now
notice we have two such spellings in the tree already ...

> @@ -979,7 +985,7 @@ static unsigned int mapkind(
>  
>  static void
>  map_grant_ref(
> -    struct gnttab_map_grant_ref *op)
> +    struct gnttab_map_grant_ref *op, bool do_flush, unsigned int *flush_flags)

Why two parameters? Simply pass NULL for singletons instead? Although,
you'd need another local variable then, which maybe isn't overly much
nicer.

> @@ -1319,29 +1324,60 @@ static long
>  gnttab_map_grant_ref(
>      XEN_GUEST_HANDLE_PARAM(gnttab_map_grant_ref_t) uop, unsigned int count)
>  {
> -    int i;
> -    struct gnttab_map_grant_ref op;
> +    struct domain *currd = current->domain;

Is this a worthwhile variable to have in this case? It's used
exactly once, granted in the loop body, but still not the inner
one.

> +    unsigned int done = 0;
> +    int rc = 0;
>  
> -    for ( i = 0; i < count; i++ )
> +    while ( count )
>      {
> -        if ( i && hypercall_preempt_check() )
> -            return i;
> +        unsigned int i, c = min_t(unsigned int, count, GNTTAB_MAP_BATCH_SIZE);
> +        unsigned int flush_flags = 0;
>  
> -        if ( unlikely(__copy_from_guest_offset(&op, uop, i, 1)) )
> -            return -EFAULT;
> +        for ( i = 0; i < c; i++ )
> +        {
> +            struct gnttab_map_grant_ref op;
>  
> -        map_grant_ref(&op);
> +            if ( unlikely(__copy_from_guest(&op, uop, 1)) )
> +            {
> +                rc = -EFAULT;
> +                break;
> +            }
>  
> -        if ( unlikely(__copy_to_guest_offset(uop, i, &op, 1)) )
> -            return -EFAULT;
> +            map_grant_ref(&op, c == 1, &flush_flags);
> +
> +            if ( unlikely(__copy_to_guest(uop, &op, 1)) )
> +            {
> +                rc = -EFAULT;
> +                break;
> +            }
> +
> +            guest_handle_add_offset(uop, 1);
> +        }
> +
> +        if ( c > 1 )
> +        {
> +            int err = iommu_iotlb_flush_all(currd, flush_flags);

There's still some double flushing involved in the error case here.
Trying to eliminate this (by having map_grant_ref() write zero
into *flush_flags) may not be overly important, but I thought I'd
still mention it.

Jan

