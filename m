Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE734B09D3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 10:47:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269744.463830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI62G-0001e4-Gg; Thu, 10 Feb 2022 09:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269744.463830; Thu, 10 Feb 2022 09:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI62G-0001b5-Cr; Thu, 10 Feb 2022 09:46:44 +0000
Received: by outflank-mailman (input) for mailman id 269744;
 Thu, 10 Feb 2022 09:46:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nI62F-0001ax-0u
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 09:46:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nI62D-000737-NJ; Thu, 10 Feb 2022 09:46:41 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.7.236.14])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nI62D-0006dK-Gr; Thu, 10 Feb 2022 09:46:41 +0000
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
	bh=dYhjtJhu5wn3T+7sDZVqBgNk8j7dobj8Z28WoXChp2E=; b=DiBjlfeVx9x7AMsWMUalXJU69T
	wvXG0r6UYGIi7ouQ8EbF8Hm+cmKM3HSZrJGr9y8rJwNY8Zi0kMehbmIPElqA7S4cVDQgoudNmRiDa
	aKEscZ9/k6lTvm+HQ5ouuq6GkKVcYVwKFmiBSFn9DH1F+UAOMRm7Avn0k9X5IuRRoIAE=;
Message-ID: <a104d3ea-170e-8175-ac04-abfcebb4ae29@xen.org>
Date: Thu, 10 Feb 2022 09:46:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a54213c4-1c68-694e-c130-d95faeef3953@xen.org>
 <78d94e1e-6db4-25c1-adb8-e4bdbfe42774@epam.com>
 <82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org>
 <79fbf83e-d25e-2634-9769-8e07634bfd63@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <79fbf83e-d25e-2634-9769-8e07634bfd63@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08/02/2022 19:50, Oleksandr Tyshchenko wrote:
> 
> On 08.02.22 13:58, Julien Grall wrote:
>> Hi,
> 
> Hi Julien

Hi,

>>
>>
>> (Jan please confirm) If I am not mistaken, on x86, a read to the M2P
>> is not always protected. But they have code within the P2M lock to
>> check any difference (see p2m_remove_page()). I think we would need
>> the same, so we don't end up to introduce a behavior similar to what
>> XSA-387 has fixed on x86.
> 
> 
> ... OK, I assume you are speaking about the check in the loop that was
> added by the following commit:
> c65ea16dbcafbe4fe21693b18f8c2a3c5d14600e "x86/p2m: don't assert that the
> passed in MFN matches for a remove"

Yes, this is the one I Have in mind.

> Also, I assume we need that check in the same place on Arm (with P2M
> lock held), which, I think, could be p2m_remove_mapping().

I believe so. Can you do some testing to check this would not break 
other types of mapping? (Booting a guest and using PV device should be 
enough).

> 
> I ported the check from x86 code, but this is not a verbatim copy due to
> the difference in local P2M helpers/macro between arches, also I have
> skipped a part of that check "|| t == p2m_mmio_direct" which was added
> by one of the follow-up commit:
> 753cb68e653002e89fdcd1c80e52905fdbfb78cb "x86/p2m: guard (in particular)
> identity mapping entries"
> since I have no idea whether we need the same on Arm.

I am not entirely sure. For now, I would drop it so long the behavior 
stay the same (i.e. it will go ahead with removing the mappings).t.

> Below the diff I have locally:
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 5646343..90d7563 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1315,11 +1315,32 @@ static inline int p2m_remove_mapping(struct
> domain *d,
>                                         mfn_t mfn)
>    {
>        struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    unsigned long i;
>        int rc;
> 
>        p2m_write_lock(p2m);
> +    for ( i = 0; i < nr; )
> +    {
> +        unsigned int cur_order;
> +        bool valid;
> +        mfn_t mfn_return = p2m_get_entry(p2m, gfn_add(start_gfn, i),
> NULL, NULL,
> +                                         &cur_order, &valid); > +
> +        if ( valid &&

valid is a copy of the LPAE bit valid. This may be 0 if Xen decided to 
clear it (i.e when emulating set/way). Yet the mapping itself is 
considered valid from Xen PoV.

So you want to replace with a different check (see below).

> +             (!mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)) )
> +        {
> +            rc = -EILSEQ;
> +            goto out;
> +        }
> +
> +        i += (1UL << cur_order) -
> +             ((gfn_x(start_gfn) + i) & ((1UL << cur_order) - 1));
> +    }
> +
>        rc = p2m_set_entry(p2m, start_gfn, nr, INVALID_MFN,
>                           p2m_invalid, p2m_access_rwx);
> +
> +out:
>        p2m_write_unlock(p2m);
> 
>        return rc;
> 
> 
> Could you please clarify, is it close to what you had in mind? If yes, I
> am wondering, don't we need this check to be only executed for xenheap
> pages (and, probably, which P2M's entry type in RAM?) rather than for
> all pages?

 From my understanding, for the purpose of this work, we only strictly 
need to check that for xenheap pages.

But I think it would be a good opportunity to harden the P2M code. At 
the moment, on Arm, you can remove any mappings you want (even with the 
wrong helpers). This lead us to a few issues when mapping were overriden 
silently (in particular when building dom0).

So I would say we should enforce it for every RAM mapping. Stefano, 
Bertrand, what do you think?

Note that, I would like to see this change in a separate commit. It will 
be easier to review.

> 
> 
>>
>>
>> In addition to that, if p2m_get_xenheap_gfn() is going to be called
>> locklessly. Then we need to make sure the update to type_info are
>> atomic. This means:
>>   - p2m_get_xenheap_gfn() should use READ_ONCE().
>>   - p2m_set_xenheap_gfn() should use WRITE_ONCE(). We might even need
>> to use cmpxchg() if there are other update to type_info that are not
>> protected. I will let you have a look.
> 
> 
> ... OK, I didn't find READ_ONCE/WRITE_ONCE in Xen. I am wondering, can
> we use ACCESS_ONCE instead?

Yes. Sorry, I keep forgetting we don't have READ_ONCE/WRITE_ONCE in Xen.

> 
> Below the diff I have locally:
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 9e093a6..b18acb7 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -373,7 +373,7 @@ unsigned int arch_get_dma_bitsize(void);
> 
>    static inline gfn_t page_get_xenheap_gfn(const struct page_info *p)
>    {
> -    gfn_t gfn_ = _gfn(p->u.inuse.type_info & PGT_gfn_mask);
> +    gfn_t gfn_ = _gfn(ACCESS_ONCE(p->u.inuse.type_info) & PGT_gfn_mask);
> 
>        ASSERT(is_xen_heap_page(p));
> 
> @@ -383,11 +383,14 @@ static inline gfn_t page_get_xenheap_gfn(const
> struct page_info *p)
>    static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>    {
>        gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN : gfn;
> +    unsigned long type_info;
> 
>        ASSERT(is_xen_heap_page(p));
> 
> -    p->u.inuse.type_info &= ~PGT_gfn_mask;
> -    p->u.inuse.type_info |= gfn_x(gfn_);
> +    type_info = ACCESS_ONCE(p->u.inuse.type_info);
> +    type_info &= ~PGT_gfn_mask;
> +    type_info |= gfn_x(gfn_);
> +    ACCESS_ONCE(p->u.inuse.type_info) = type_info;
>    }
> 
>    #endif /*  __ARCH_ARM_MM__ */
> 
> 
> It is going to be a non-protected write to GFN portion of type_info.

Well no. You are using a Read-Modify-Write operation on type_info. This 
is not atomic and will overwrite any change (if any) done on other part 
of the type_info.

If I am mistaken, there are two other places where type_info is 
modified. One is...


> But, at that time the page is not used yet, so I think this is harmless.
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 50334a0..97cf0d8 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1024,7 +1024,7 @@ static struct page_info *alloc_heap_pages(
>                                     &tlbflush_timestamp);
> 
>             /* Initialise fields which have other uses for free pages. */
> -        pg[i].u.inuse.type_info = 0;
> +        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
>             page_set_owner(&pg[i], NULL);
> 
>         }

... this one. I agree the page is not accessible at this time. So 
page_set_xenheap_gfn() should not be used.

The other one is in share_xen_page_with_guest() which I think is still 
fine because the caller page_set_xenheap_gfn() would need to acquire a 
reference on the page. This is only possible after the count_info is 
updated in share_xen_page_with_guest() *and* there a barrier between the 
type_info and count_info.

I think this behavior should be documented on top of type_info (along 
with the locking). This would be helpful if type_info gain more use in 
the future.

Cheers,

-- 
Julien Grall

