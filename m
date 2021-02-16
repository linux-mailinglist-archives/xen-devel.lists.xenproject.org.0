Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EDA31CABD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 13:49:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85724.160622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBzmi-00064C-RD; Tue, 16 Feb 2021 12:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85724.160622; Tue, 16 Feb 2021 12:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBzmi-00063n-Nl; Tue, 16 Feb 2021 12:48:56 +0000
Received: by outflank-mailman (input) for mailman id 85724;
 Tue, 16 Feb 2021 12:48:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jGlc=HS=runbox.com=m.v.b@srs-us1.protection.inumbo.net>)
 id 1lBzmg-00063i-H8
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 12:48:55 +0000
Received: from aibo.runbox.com (unknown [91.220.196.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0471b6f0-6bbe-4215-9ad4-c8f5733e4933;
 Tue, 16 Feb 2021 12:48:51 +0000 (UTC)
Received: from [10.9.9.74] (helo=submission03.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <m.v.b@runbox.com>)
 id 1lBzmZ-0005SJ-Sk; Tue, 16 Feb 2021 13:48:48 +0100
Received: by submission03.runbox with esmtpsa [Authenticated alias (536975)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lBzmY-0002Xj-7s; Tue, 16 Feb 2021 13:48:46 +0100
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
X-Inumbo-ID: 0471b6f0-6bbe-4215-9ad4-c8f5733e4933
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=f+nKs8JpK4wFd/s5GZi1+0U4NVGMehxgEcNl1XW0KAo=; b=mDOzVrKoeD08JED7svMnb7Q645
	3qinbUo4jpPJKhIojrnEOITbmyE60csS5s0vLvUeJaxtbFOExvq33FK5BwPgH0vR7ybn8hdqU84rR
	R61nQII2iMxDMy0155EJK/OJ2VG6udUKex7eN7YgAhLldusW8SmyOUzbJn4Mw2lSfoDk6+FZW21/3
	K8+zbxO0VI0hJ8RdDzCQDUbWKOn8jjXwNqKFBPLJ/WFILEW3kMHJB3WsTAy7QaJp+Ej86moPODbni
	JhW5v6RCwhSDlZdILKaQ1SCbk32OR5VYc2rgQKaWIyi7OCZnprIGfPfL70BInqWtr3arZn9XYxGxI
	wfYE+dtA==;
Subject: Re: [PATCH 1/1] x86/ept: Fix buggy XSA-321 backport
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
 jbeulich@suse.com
References: <20210215234619.245422-1-m.v.b@runbox.com>
 <20210215234619.245422-2-m.v.b@runbox.com> <YCuOQ3qpFD6RgIld@Air-de-Roger>
From: "M. Vefa Bicakci" <m.v.b@runbox.com>
Message-ID: <5517e20e-c485-7016-da89-81570cc43b3b@runbox.com>
Date: Tue, 16 Feb 2021 07:48:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCuOQ3qpFD6RgIld@Air-de-Roger>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 16/02/2021 04.20, Roger Pau Monné wrote:
> On Mon, Feb 15, 2021 at 06:46:19PM -0500, M. Vefa Bicakci wrote:
>> This commit aims to fix commit a852040fe3ab ("x86/ept: flush cache when
>> modifying PTEs and sharing page tables"). The aforementioned commit is
>> for the stable-4.9 branch of Xen and is a backported version of commit
>> c23274fd0412 ("x86/ept: flush cache when modifying PTEs and sharing page
>> tables"), which was for Xen 4.14.0-rc5 and which fixes the security
>> issue reported by XSA-321.
>>
>> Prior to the latter commit, the function atomic_write_ept_entry in Xen
>> 4.14.y consisted mostly of a call to p2m_entry_modify followed by an
>> atomic replacement of a page table entry, and the latter commit adds
>> a call to iommu_sync_cache for a specific condition:
>>
>>     static int atomic_write_ept_entry(struct p2m_domain *p2m,
>>                                       ept_entry_t *entryptr, ept_entry_t new,
>>                                       int level)
>>     {
>>         int rc = p2m_entry_modify(p2m, new.sa_p2mt, entryptr->sa_p2mt,
>>                                   _mfn(new.mfn), _mfn(entryptr->mfn), level + 1);
>>
>>         if ( rc )
>>             return rc;
>>
>>         write_atomic(&entryptr->epte, new.epte);
>>
>>    +    /* snipped comment block */
>>    +    if ( !new.recalc && iommu_use_hap_pt(p2m->domain) )
>>    +        iommu_sync_cache(entryptr, sizeof(*entryptr));
>>    +
>>         return 0;
>>     }
>>
>> However, the backport to Xen 4.9.y is a bit different because
>> atomic_write_ept_entry does not consist solely of a call to
>> p2m_entry_modify, which does not exist in Xen 4.9.y. I am quoting from
>> Xen 4.8.y for convenience:
>>
>>     static int atomic_write_ept_entry(ept_entry_t *entryptr, ept_entry_t new,
>>                                       int level)
>>     {
>>         int rc;
>>         unsigned long oldmfn = mfn_x(INVALID_MFN);
>>         bool_t check_foreign = (new.mfn != entryptr->mfn ||
>>                                 new.sa_p2mt != entryptr->sa_p2mt);
>>
>>         if ( level )
>>         {
>>             ASSERT(!is_epte_superpage(&new) || !p2m_is_foreign(new.sa_p2mt));
>>             write_atomic(&entryptr->epte, new.epte);
>>             return 0;
>>         }
>>
>>         if ( unlikely(p2m_is_foreign(new.sa_p2mt)) )
>>         {
>>             rc = -EINVAL;
>>             if ( !is_epte_present(&new) )
>>                     goto out;
>>
>>             if ( check_foreign )
>>             {
>>                 struct domain *fdom;
>>
>>                 if ( !mfn_valid(new.mfn) )
>>                     goto out;
>>
>>                 rc = -ESRCH;
>>                 fdom = page_get_owner(mfn_to_page(new.mfn));
>>                 if ( fdom == NULL )
>>                     goto out;
>>
>>                 /* get refcount on the page */
>>                 rc = -EBUSY;
>>                 if ( !get_page(mfn_to_page(new.mfn), fdom) )
>>                     goto out;
>>             }
>>         }
>>
>>         if ( unlikely(p2m_is_foreign(entryptr->sa_p2mt)) && check_foreign )
>>             oldmfn = entryptr->mfn;
>>
>>         write_atomic(&entryptr->epte, new.epte);
>>
>>    +    /* snipped comment block */
>>    +    if ( !new.recalc && iommu_hap_pt_share )
>>    +        iommu_sync_cache(entryptr, sizeof(*entryptr));
>>    +
>>         if ( unlikely(oldmfn != mfn_x(INVALID_MFN)) )
>>             put_page(mfn_to_page(oldmfn));
>>
>>         rc = 0;
>>
>>      out:
>>         if ( rc )
>>             gdprintk(XENLOG_ERR, "epte o:%"PRIx64" n:%"PRIx64" rc:%d\n",
>>                      entryptr->epte, new.epte, rc);
>>         return rc;
>>     }
>>
>> Based on inspection of the p2m_entry_modify function in Xen 4.14.1, it
>> appears that the part of atomic_write_ept_entry above the call to
>> write_atomic is encapsulated by p2m_entry_modify, which uncovers one
>> issue with the backport: In Xen 4.14, if p2m_entry_modify returns early
>> without an error, then the calls to write_atomic and iommu_sync_cache
>> will still occur (assuming that the corresponding if condition is
>> satisfied), whereas in Xen 4.9.y, there is a code path that can skip the
>> call to iommu_sync_cache, in case the variable level is not zero:
>>
>>    if ( level )
>>    {
>>       ASSERT(!is_epte_superpage(&new) || !p2m_is_foreign(new.sa_p2mt));
>>       write_atomic(&entryptr->epte, new.epte);
>>       return 0;
>>    }
>>
>> This patch reorganizes the atomic_write_ept_entry to ensure that the
>> call to iommu_sync_cache is not inadvertently skipped.
> 
> IMO this is likely too much change in a single patch, iff we really
> wanted to do this you should have a pre-patch that re-arranges the
> code without any functional change followed by a patch that fixes the
> issue.

Thank you for the feedback; this is a good point.

> In any case I think this is too much change, so I would go for a
> smaller fix like my proposal below. Can you please test it?

Thank you! I will test your patch later today, and I will report
back by tomorrow.

>> Furthermore, in Xen 4.14.1, p2m_entry_modify calls
>>
>>    put_page(mfn_to_page(oldmfn));
>>
>> before the potential call to iommu_sync_cache in atomic_write_ept_entry.
>> I am not sufficiently familiar with Xen to determine if this is a
>> significant behavioural change, but this patch makes Xen 4.9.y similar
>> to Xen 4.14.1 in that regard as well, by further re-organizing the code
>> in atomic_write_ept_entry.
> 
> Well, that put_page is only relevant to PVH dom0, but you shouldn't
> remove it. The put_page call in newer versions has been moved by
> commit ce0224bf96a1a1f82 into p2m_entry_modify.

Ah, but my patch moves the call to put_page to a location above the
call to iommu_sync_cache, to make the code a bit similar to the same
function in Xen 4.14. This may not be necessary, though. This goes back
to your aforementioned point about having two separate patches, as my
patch does not make the move of the call to put_page obvious. In any
case, let's focus on your patch.

> Here is my proposed fix, I think we could even do away with the else
> branch, but if level is != 0 p2m_is_foreign should be false, so we
> avoid an extra check.
>
> Thanks, Roger.

I will test this. Thanks again! I really appreciate that you have
have taken the time and effort.

Vefa

> ---8<---
> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
> index 036771f43c..086739ffdd 100644
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -56,11 +56,8 @@ static int atomic_write_ept_entry(ept_entry_t *entryptr, ept_entry_t new,
>       if ( level )
>       {
>           ASSERT(!is_epte_superpage(&new) || !p2m_is_foreign(new.sa_p2mt));
> -        write_atomic(&entryptr->epte, new.epte);
> -        return 0;
>       }
> -
> -    if ( unlikely(p2m_is_foreign(new.sa_p2mt)) )
> +    else if ( unlikely(p2m_is_foreign(new.sa_p2mt)) )
>       {
>           rc = -EINVAL;
>           if ( !is_epte_present(&new) )
> 

