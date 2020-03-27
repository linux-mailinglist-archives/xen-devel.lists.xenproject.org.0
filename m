Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FF51955C9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 11:56:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHmbn-0006JR-EK; Fri, 27 Mar 2020 10:53:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xJX5=5M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHmbm-0006JM-3s
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 10:53:02 +0000
X-Inumbo-ID: 207870ae-7019-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 207870ae-7019-11ea-b34e-bc764e2007e4;
 Fri, 27 Mar 2020 10:53:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 74321AF55;
 Fri, 27 Mar 2020 10:53:00 +0000 (UTC)
To: julien@xen.org
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-10-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bae1a883-45ad-344d-ecbf-4eddc7627182@suse.com>
Date: Fri, 27 Mar 2020 11:52:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200322161418.31606-10-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 09/17] xen/x86: Reduce the number of use of
 l*e_{from, get}_pfn()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.03.2020 17:14, julien@xen.org wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1138,7 +1138,7 @@ static int
>  get_page_from_l2e(
>      l2_pgentry_t l2e, mfn_t l2mfn, struct domain *d, unsigned int flags)
>  {
> -    unsigned long mfn = l2e_get_pfn(l2e);
> +    mfn_t mfn = l2e_get_mfn(l2e);
>      int rc;
>  
>      if ( unlikely((l2e_get_flags(l2e) & L2_DISALLOW_MASK)) )
> @@ -1150,7 +1150,7 @@ get_page_from_l2e(
>  
>      ASSERT(!(flags & PTF_preemptible));
>  
> -    rc = get_page_and_type_from_mfn(_mfn(mfn), PGT_l1_page_table, d, flags);
> +    rc = get_page_and_type_from_mfn(mfn, PGT_l1_page_table, d, flags);

To bring this better in line with the L3 and L4 counterparts,
could you please drop the local variable instead? Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

