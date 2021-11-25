Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F9A45DEA9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 17:37:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231669.401034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqHkg-00027S-IY; Thu, 25 Nov 2021 16:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231669.401034; Thu, 25 Nov 2021 16:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqHkg-00025M-Fa; Thu, 25 Nov 2021 16:37:38 +0000
Received: by outflank-mailman (input) for mailman id 231669;
 Thu, 25 Nov 2021 16:37:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mqHkf-00025G-DU
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 16:37:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mqHkd-0007NU-NJ; Thu, 25 Nov 2021 16:37:35 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.27.59]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mqHkd-0003M0-G4; Thu, 25 Nov 2021 16:37:35 +0000
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
	bh=CYelhxn4OiwKEN/9oIQEGc/JGQ3fKJNBYoUXj157tUs=; b=lCUTuGXZP+4OFzOQ+/jcHAqCXi
	KcXVvWaaDqbttA1PReIGoPSs+Riv/HItinUYESyPY4P7ZiD92qVWJ9gBZLj2w1lZMmK/wzyOKBiJr
	g/2fjoP7PHYRPKO1qC/NkvL97IWI8uIkcHUlWSA10V5A/jvYAOV2bHLIKr9AP5nvyDek=;
Message-ID: <da172ad3-47b8-8e60-c70a-4275aeb9efd7@xen.org>
Date: Thu, 25 Nov 2021 16:37:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

Sorry for the delay. I was waiting for XSA-387 to go out before answering.

On 13/09/2021 07:41, Jan Beulich wrote:
> Without holding appropriate locks, attempting to remove a prior mapping
> of the underlying page is pointless, as the same (or another) mapping
> could be re-established by a parallel request on another vCPU. Move the
> code to Arm's gnttab_set_frame_gfn(). Of course this new placement
> doesn't improve things in any way as far as the security of grant status
> frame mappings goes (see XSA-379). Proper locking would be needed here
> to allow status frames to be mapped securely.
> 
> In turn this then requires replacing the other use in
> gnttab_unpopulate_status_frames(), which yet in turn requires adjusting
> x86's gnttab_set_frame_gfn(). Note that with proper locking inside
> guest_physmap_remove_page() combined with checking the GFN's mapping
> there against the passed in MFN, there then is no issue with the
> involved multiple gnttab_set_frame_gfn()-s potentially returning varying

Do you mean gnttab_get_frame_gfn()?

> values (due to a racing XENMAPSPACE_grant_table request).
> 
> This, as a side effect, does away with gnttab_map_frame() having a local
> variable "gfn" which shadows a function parameter of the same name.
> 
> Together with XSA-379 this points out that XSA-255's addition to
> gnttab_map_frame() was really useless.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -92,7 +92,7 @@ struct grant_table {
>       struct radix_tree_root maptrack_tree;
>   
>       /* Domain to which this struct grant_table belongs. */
> -    const struct domain *domain;
> +    struct domain *domain;
>   
>       struct grant_table_arch arch;
>   };
> @@ -1795,8 +1795,8 @@ gnttab_unpopulate_status_frames(struct d
>           {
>               int rc = gfn_eq(gfn, INVALID_GFN)
>                        ? 0
> -                     : guest_physmap_remove_page(d, gfn,
> -                                                 page_to_mfn(pg), 0);
> +                     : gnttab_set_frame_gfn(gt, true, i, INVALID_GFN,
> +                                            page_to_mfn(pg));
>   
>               if ( rc )
>               {
> @@ -1806,7 +1806,6 @@ gnttab_unpopulate_status_frames(struct d
>                   domain_crash(d);
>                   return rc;
>               }
> -            gnttab_set_frame_gfn(gt, true, i, INVALID_GFN);
>           }
>   
>           BUG_ON(page_get_owner(pg) != d);
> @@ -4132,6 +4131,9 @@ int gnttab_map_frame(struct domain *d, u
>       struct grant_table *gt = d->grant_table;
>       bool status = false;
>   
> +    if ( gfn_eq(gfn, INVALID_GFN) )
> +        return -EINVAL;
> +
>       grant_write_lock(gt);
>   
>       if ( evaluate_nospec(gt->gt_version == 2) && (idx & XENMAPIDX_grant_table_status) )
> @@ -4144,24 +4146,18 @@ int gnttab_map_frame(struct domain *d, u
>       else
>           rc = gnttab_get_shared_frame_mfn(d, idx, mfn);
>   
> -    if ( !rc && paging_mode_translate(d) )
> -    {
> -        gfn_t gfn = gnttab_get_frame_gfn(gt, status, idx);
> -
> -        if ( !gfn_eq(gfn, INVALID_GFN) )
> -            rc = guest_physmap_remove_page(d, gfn, *mfn, 0);
> -    }
> -
>       if ( !rc )
>       {
> +        struct page_info *pg = mfn_to_page(*mfn);
> +
>           /*
>            * Make sure gnttab_unpopulate_status_frames() won't (successfully)
>            * free the page until our caller has completed its operation.
>            */
> -        if ( get_page(mfn_to_page(*mfn), d) )
> -            gnttab_set_frame_gfn(gt, status, idx, gfn);
> -        else
> +        if ( !get_page(pg, d) )
>               rc = -EBUSY;
> +        else if ( (rc = gnttab_set_frame_gfn(gt, status, idx, gfn, *mfn)) )
> +            put_page(pg);
>       }
>   
>       grant_write_unlock(gt);
> --- a/xen/include/asm-arm/grant_table.h
> +++ b/xen/include/asm-arm/grant_table.h
> @@ -71,11 +71,17 @@ int replace_grant_host_mapping(unsigned
>           XFREE((gt)->arch.status_gfn);                                    \
>       } while ( 0 )
>   
> -#define gnttab_set_frame_gfn(gt, st, idx, gfn)                           \
> -    do {                                                                 \
> -        ((st) ? (gt)->arch.status_gfn : (gt)->arch.shared_gfn)[idx] =    \
> -            (gfn);                                                       \
> -    } while ( 0 )
> +#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
> +    ({                                                                   \
> +        int rc_ = 0;                                                     \
> +        gfn_t ogfn = gnttab_get_frame_gfn(gt, st, idx);                  \
> +        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \
> +             (rc_ = guest_physmap_remove_page((gt)->domain, ogfn, mfn,   \
> +                                              0)) == 0 )                 \
> +            ((st) ? (gt)->arch.status_gfn                                \
> +                  : (gt)->arch.shared_gfn)[idx] = (gfn);                 \
> +        rc_;                                                             \
> +    })

I think using a function would make it a bit easier to understand what 
it does.

However... The naming of the function is now quite confusing. The more 
on x86...

>   
>   #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
>      (st) ? gnttab_status_gfn(NULL, gt, idx)                               \
> --- a/xen/include/asm-x86/grant_table.h
> +++ b/xen/include/asm-x86/grant_table.h
> @@ -37,7 +37,12 @@ static inline int replace_grant_host_map
>   
>   #define gnttab_init_arch(gt) 0
>   #define gnttab_destroy_arch(gt) do {} while ( 0 )
> -#define gnttab_set_frame_gfn(gt, st, idx, gfn) do {} while ( 0 )
> +#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
> +    (gfn_eq(gfn, INVALID_GFN)                                            \
> +     ? guest_physmap_remove_page((gt)->domain,                           \
> +                                 gnttab_get_frame_gfn(gt, st, idx),      \
> +                                 mfn, 0)                                 \
> +     : 0 /* Handled in add_to_physmap_one(). */)

... it will end up to remove the mapping. I don't have a better name at 
the moment. However I think this would deserve some documentation in the 
code so one can understand how to implement it for another arch.

>   #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
>       mfn_t mfn_ = (st) ? gnttab_status_mfn(gt, idx)                       \
>                         : gnttab_shared_mfn(gt, idx);                      \
> 

Cheers,

-- 
Julien Grall

