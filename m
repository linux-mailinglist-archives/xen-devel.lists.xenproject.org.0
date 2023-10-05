Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF51D7B9CE8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 14:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612968.953166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoNBa-0001zm-Et; Thu, 05 Oct 2023 12:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612968.953166; Thu, 05 Oct 2023 12:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoNBa-0001xk-CI; Thu, 05 Oct 2023 12:10:34 +0000
Received: by outflank-mailman (input) for mailman id 612968;
 Thu, 05 Oct 2023 12:10:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qoNBZ-0001xd-2p
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 12:10:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoNBY-0003Q6-HK; Thu, 05 Oct 2023 12:10:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoNBY-0001m4-9w; Thu, 05 Oct 2023 12:10:32 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=1vgTfI8qVhRHaJsHZBMMituiTbzrxTYmvG1a8c7wtaE=; b=wGdt0IT3KHdhzhnOUd5feKCBdy
	vTnGrjMeG9MiwKXBOlrt3WgFXIw22cPJgbxSoy4DrLjo4ME3lswxFHQCwyKHsDM66H2Ez+MZhnkZG
	zAxqYsUKCf2ei6+cSZ1msaM0yinqTigaMmzDGWAT1HBzcu1OU6obZ6Rr91jSnlHw3xi0=;
Message-ID: <f196e4ac-c458-4c4e-8dd7-4a7b53c763c3@xen.org>
Date: Thu, 5 Oct 2023 13:10:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] mem_sharing/fork: do not attempt to populate
 vcpu_info page
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 henry.wang@arm.com, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <20231002151127.71020-2-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231002151127.71020-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

While preparing to commit this series, I have noticed that there are no 
Acked-by/Reviewed-by from Tamas (or at least not present in my inbox).

@Tamas, can you provide one?

Cheers,

On 02/10/2023 16:11, Roger Pau Monne wrote:
> Instead let map_vcpu_info() and it's call to get_page_from_gfn()
> populate the page in the child as needed.  Also remove the bogus
> copy_domain_page(): should be placed before the call to map_vcpu_info(),
> as the later can update the contents of the vcpu_info page.
> 
> Note that this eliminates a bug in copy_vcpu_settings(): The function did
> allocate a new page regardless of the GFN already having a mapping, thus in
> particular breaking the case of two vCPU-s having their info areas on the same
> page.
> 
> Fixes: 41548c5472a3 ('mem_sharing: VM forking')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Only build tested.
> ---
> Changes since v4:
>   - New in this version.
> ---
>   xen/arch/x86/mm/mem_sharing.c | 36 ++++++-----------------------------
>   1 file changed, 6 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index ae5366d4476e..5f8f1fb4d871 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1689,48 +1689,24 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
>       unsigned int i;
>       struct p2m_domain *p2m = p2m_get_hostp2m(cd);
>       int ret = -EINVAL;
> +    mfn_t vcpu_info_mfn;
>   
>       for ( i = 0; i < cd->max_vcpus; i++ )
>       {
>           struct vcpu *d_vcpu = d->vcpu[i];
>           struct vcpu *cd_vcpu = cd->vcpu[i];
> -        mfn_t vcpu_info_mfn;
>   
>           if ( !d_vcpu || !cd_vcpu )
>               continue;
>   
> -        /* Copy & map in the vcpu_info page if the guest uses one */
> +        /* Map in the vcpu_info page if the guest uses one */
>           vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
>           if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
>           {
> -            mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
> -
> -            /* Allocate & map the page for it if it hasn't been already */
> -            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
> -            {
> -                gfn_t gfn = mfn_to_gfn(d, vcpu_info_mfn);
> -                unsigned long gfn_l = gfn_x(gfn);
> -                struct page_info *page;
> -
> -                if ( !(page = alloc_domheap_page(cd, 0)) )
> -                    return -ENOMEM;
> -
> -                new_vcpu_info_mfn = page_to_mfn(page);
> -                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
> -
> -                ret = p2m->set_entry(p2m, gfn, new_vcpu_info_mfn,
> -                                     PAGE_ORDER_4K, p2m_ram_rw,
> -                                     p2m->default_access, -1);
> -                if ( ret )
> -                    return ret;
> -
> -                ret = map_vcpu_info(cd_vcpu, gfn_l,
> -                                    PAGE_OFFSET(d_vcpu->vcpu_info));
> -                if ( ret )
> -                    return ret;
> -            }
> -
> -            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
> +            ret = map_vcpu_info(cd_vcpu, mfn_to_gfn(d, vcpu_info_mfn),
> +                                PAGE_OFFSET(d_vcpu->vcpu_info));
> +            if ( ret )
> +                return ret;
>           }
>   
>           ret = copy_vpmu(d_vcpu, cd_vcpu);

-- 
Julien Grall

