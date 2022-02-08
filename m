Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32274AD806
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 12:58:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268263.462064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHP8b-0001uP-5d; Tue, 08 Feb 2022 11:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268263.462064; Tue, 08 Feb 2022 11:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHP8b-0001sN-0m; Tue, 08 Feb 2022 11:58:25 +0000
Received: by outflank-mailman (input) for mailman id 268263;
 Tue, 08 Feb 2022 11:58:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHP8a-0001sH-5I
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 11:58:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHP8Y-0006qt-VA; Tue, 08 Feb 2022 11:58:22 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.10.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHP8Y-0004Gf-Oh; Tue, 08 Feb 2022 11:58:22 +0000
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
	bh=E/NQz5GIoPzXYpvvWOQ3lpEGqJFYgl+m5l35i2/Tl2E=; b=zH4jJxTFiGYcju064dUQseOOJp
	+DNSzWdn3y7Et2cRfGJJyy0EXphtEbJrfu5PHmji7dlXB91NaYdYgI0zMKcRN6qZCG8R5ELpbufHF
	XYVsP3XsxS1uThgHrZIUCP2UHxSs2m8u27lKU0rToTPFdeWBAT/WtFMe/0TP9QZ3Mygc=;
Message-ID: <82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org>
Date: Tue, 8 Feb 2022 11:58:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <78d94e1e-6db4-25c1-adb8-e4bdbfe42774@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 07/02/2022 19:56, Oleksandr Tyshchenko wrote:
> 
> On 07.02.22 19:15, Julien Grall wrote:
>> Hi Oleksandr,
>> On 05/01/2022 23:11, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Rework Arm implementation to store grant table frame GFN
>>> in struct page_info directly instead of keeping it in
>>> standalone status/shared arrays. This patch is based on
>>> the assumption that grant table page is the xenheap page.
>>
>> I would write "grant table pages are xenheap pages" or "a grant table
>> page is a xenheap page".
>>
>> [...]
>>
>>> diff --git a/xen/arch/arm/include/asm/grant_table.h
>>> b/xen/arch/arm/include/asm/grant_table.h
>>> index d31a4d6..d6fda31 100644
>>> --- a/xen/arch/arm/include/asm/grant_table.h
>>> +++ b/xen/arch/arm/include/asm/grant_table.h
>>> @@ -11,11 +11,6 @@
>>>    #define INITIAL_NR_GRANT_FRAMES 1U
>>>    #define GNTTAB_MAX_VERSION 1
>>>    -struct grant_table_arch {
>>> -    gfn_t *shared_gfn;
>>> -    gfn_t *status_gfn;
>>> -};
>>> -
>>>    static inline void gnttab_clear_flags(struct domain *d,
>>>                                          unsigned int mask, uint16_t
>>> *addr)
>>>    {
>>> @@ -46,41 +41,12 @@ int replace_grant_host_mapping(unsigned long
>>> gpaddr, mfn_t mfn,
>>>    #define gnttab_dom0_frames() \
>>>        min_t(unsigned int, opt_max_grant_frames, PFN_DOWN(_etext -
>>> _stext))
>>>    -#define gnttab_init_arch(gt) \
>>> -({ \
>>> -    unsigned int ngf_ =
>>> (gt)->max_grant_frames;                          \
>>> -    unsigned int nsf_ =
>>> grant_to_status_frames(ngf_);                    \
>>> - \
>>> -    (gt)->arch.shared_gfn = xmalloc_array(gfn_t,
>>> ngf_);                  \
>>> -    (gt)->arch.status_gfn = xmalloc_array(gfn_t,
>>> nsf_);                  \
>>> -    if ( (gt)->arch.shared_gfn && (gt)->arch.status_gfn
>>> )                \
>>> - { \
>>> -        while ( ngf_--
>>> )                                                 \
>>> -            (gt)->arch.shared_gfn[ngf_] =
>>> INVALID_GFN;                   \
>>> -        while ( nsf_--
>>> )                                                 \
>>> -            (gt)->arch.status_gfn[nsf_] =
>>> INVALID_GFN;                   \
>>> - } \
>>> - else \
>>> - gnttab_destroy_arch(gt); \
>>> -    (gt)->arch.shared_gfn ? 0 :
>>> -ENOMEM;                                 \
>>> -})
>>> -
>>> -#define gnttab_destroy_arch(gt) \
>>> -    do { \
>>> - XFREE((gt)->arch.shared_gfn); \
>>> - XFREE((gt)->arch.status_gfn); \
>>> -    } while ( 0 )
>>> -
>>>    #define gnttab_set_frame_gfn(gt, st, idx, gfn,
>>> mfn)                      \
>>> ({ \
>>> -        int rc_ =
>>> 0;                                                     \
>>>            gfn_t ogfn = gnttab_get_frame_gfn(gt, st,
>>> idx);                  \
>>> -        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn)
>>> ||           \
>>> -             (rc_ = guest_physmap_remove_page((gt)->domain, ogfn,
>>> mfn,   \
>>> -                                              0)) == 0
>>> )                 \
>>> -            ((st) ?
>>> (gt)->arch.status_gfn                                \
>>> -                  : (gt)->arch.shared_gfn)[idx] =
>>> (gfn);                 \
>>> - rc_; \
>>> +        (!gfn_eq(ogfn, INVALID_GFN) && !gfn_eq(ogfn,
>>> gfn))               \
>>> +         ? guest_physmap_remove_page((gt)->domain, ogfn, mfn,
>>> 0)         \
>>> +         :
>>> 0;                                                            \
>>
>> Given that we are implementing something similar to an M2P, I was
>> expecting the implementation to be pretty much the same as the x86
>> helper.
>>
>> Would you be able to outline why it is different?
> 
> Being honest, I didn't think about it so far.  But, I agree with the
> question.
> 
> It feels to me that Arm variant can now behave as x86 one (as
> xenmem_add_to_physmap_one() now checks for the prior mapping), I mean to
> use INVALID_GFN as an indication to remove a page.
> 
> What do you think?

I will defer that to Jan.

Jan, IIRC you were the one introducing the call to 
guest_physmap_remove_page(). Do you remember why the difference between 
x86 and Arm were necessary?

[...]

>>
>>
>>> + */
>>> +#define PGT_gfn_width     PG_shift(3)
>>> +#define PGT_gfn_mask      ((1UL<<PGT_gfn_width)-1)
>>> +
>>> +#define PGT_INVALID_XENHEAP_GFN   _gfn(PGT_gfn_mask)
>>> +
>>> +/*
>>> + * An arch-specific initialization pattern is needed for the
>>> type_info field
>>> + * as it's GFN portion can contain the valid GFN if page is xenheap
>>> page.
>>> + */
>>> +#define PGT_TYPE_INFO_INIT_PATTERN gfn_x(PGT_INVALID_XENHEAP_GFN)
>>>       /* Cleared when the owning guest 'frees' this page. */
>>>    #define _PGC_allocated    PG_shift(1)
>>> @@ -358,6 +371,25 @@ void clear_and_clean_page(struct page_info *page);
>>>      unsigned int arch_get_dma_bitsize(void);
>>>    +static inline gfn_t page_get_xenheap_gfn(const struct page_info *p)
>>> +{
>>> +    gfn_t gfn_ = _gfn(p->u.inuse.type_info & PGT_gfn_mask);
>>> +
>>> +    ASSERT(is_xen_heap_page(p));
>>> +
>>> +    return gfn_eq(gfn_, PGT_INVALID_XENHEAP_GFN) ? INVALID_GFN : gfn_;
>>> +}
>>> +
>>> +static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>>> +{
>>> +    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN
>>> : gfn;
>>> +
>>> +    ASSERT(is_xen_heap_page(p));
>>> +
>>> +    p->u.inuse.type_info &= ~PGT_gfn_mask;
>>> +    p->u.inuse.type_info |= gfn_x(gfn_);
>>> +}
>>
>> This is not going to be atomic. So can you outline which locking
>> mechanism should be used to protect access (set/get) to the GFN?
> 
> 
> I think, the P2M lock.

Ok. So, looking at the code, most of calls to page_get_xenheap_gfn() are 
not protected with the p2m_lock().

(Jan please confirm) If I am not mistaken, on x86, a read to the M2P is 
not always protected. But they have code within the P2M lock to check 
any difference (see p2m_remove_page()). I think we would need the same, 
so we don't end up to introduce a behavior similar to what XSA-387 has 
fixed on x86.

In addition to that, if p2m_get_xenheap_gfn() is going to be called 
locklessly. Then we need to make sure the update to type_info are 
atomic. This means:
  - p2m_get_xenheap_gfn() should use READ_ONCE().
  - p2m_set_xenheap_gfn() should use WRITE_ONCE(). We might even need to 
use cmpxchg() if there are other update to type_info that are not 
protected. I will let you have a look.

Cheers,

-- 
Julien Grall

