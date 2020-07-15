Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE7220DD3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 15:16:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvhGc-0000yw-Qe; Wed, 15 Jul 2020 13:16:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvhGc-0000yr-7a
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 13:16:10 +0000
X-Inumbo-ID: 58e2b88e-c69d-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58e2b88e-c69d-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 13:16:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0DD46B6F9;
 Wed, 15 Jul 2020 13:16:12 +0000 (UTC)
Subject: Re: [PATCH v7 14/15] x86: switch to use domheap page for page tables
To: Hongyan Xia <hx242@xen.org>
References: <cover.1590750232.git.hongyxia@amazon.com>
 <85808fae77da535b2997bede8965d22d5c80c5d3.1590750232.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f402905-adba-130f-b000-a98f7e607d2d@suse.com>
Date: Wed, 15 Jul 2020 15:16:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <85808fae77da535b2997bede8965d22d5c80c5d3.1590750232.git.hongyxia@amazon.com>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 13:11, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a sufficiently minor remark:

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4918,10 +4918,11 @@ mfn_t alloc_xen_pagetable_new(void)
>  {
>      if ( system_state != SYS_STATE_early_boot )
>      {
> -        void *ptr = alloc_xenheap_page();
>  
> -        BUG_ON(!hardware_domain && !ptr);
> -        return ptr ? virt_to_mfn(ptr) : INVALID_MFN;
> +        struct page_info *pg = alloc_domheap_page(NULL, 0);
> +
> +        BUG_ON(!hardware_domain && !pg);
> +        return pg ? page_to_mfn(pg) : INVALID_MFN;

pg doesn't even get de-referenced, let alone modified. Hence it
would better be pointer-to-const, despite this possibly feeling a
little odd to some of us given this is a freshly allocated page.

Jan

