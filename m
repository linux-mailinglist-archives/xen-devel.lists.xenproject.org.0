Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB87B044EC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 18:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042961.1413070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubLca-0000lD-FB; Mon, 14 Jul 2025 16:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042961.1413070; Mon, 14 Jul 2025 16:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubLca-0000iS-Bg; Mon, 14 Jul 2025 16:01:40 +0000
Received: by outflank-mailman (input) for mailman id 1042961;
 Mon, 14 Jul 2025 16:01:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8GEK=Z3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ubLcY-0000iM-FR
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 16:01:38 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0fa4c71-60cb-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 18:01:35 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so777569266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 09:01:35 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e8fd9dsm827707966b.23.2025.07.14.09.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 09:01:31 -0700 (PDT)
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
X-Inumbo-ID: d0fa4c71-60cb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752508894; x=1753113694; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46sHLw1/D6O4NF/l4Zz6IHyL7WGvG2s5DX83shnsUeM=;
        b=mX7zkv0IiwR3QfAS8TyPwNFigfTMNVzQw5O7/0vuwZ8NSiq5DGlZGFNd/+bdqQx2tV
         fznjGYQZ5cjiVEYK2fpW50nmuuXaINcdxejwxn1+ARX87eDptSGY4NCz1F35lxYOV7b2
         MKqCuktiWmR8irEO6z0wtvxRh1uvt6JZBkQAuEJ1ApYM64oyowBkeqL3AapdSc5ggq9G
         nQ3adTgXNfPTqKWnIwQmN30nA679QWOPxgE00WJvU6jiAhw478aU7Fi18zdFwG9xDBK1
         w135ETRf8zAic27PEpthMkzSV1ew6bZu29o/70z/Zbg9Zce+VGRXj/otTT/QnAb4tk9b
         9t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752508894; x=1753113694;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=46sHLw1/D6O4NF/l4Zz6IHyL7WGvG2s5DX83shnsUeM=;
        b=QidznWLqzVHEU802YwLVx2iogkYxt0rLAl6VhWS6A/qGmb4F7pPG9oZkJvnNpgGUpp
         o3dVauQhAj6ZsWjDqKtupIJ/bI+QRzuVhVdbUAPCoatlF+3iGX55DHT20nY6GoEdeG0u
         g2nBn3CPTq3Qf9FW5k2Vu2h5Q7J2xOHCoJy44MrG5Vm86iyOfszW+Swerqys8QSy1Qof
         tNsF9cl88dDP7CT82SHnC1LhSlMq8fFOFGFjC1bojjWFVWwHkbnsPFwZCtmVtHRkrWIS
         LrHc2wJaLoAlm+HFVkYVptSjZtH5tJeuDknI6r3DN1r1yWjnbK3wrtMBfojL4kejyqwU
         TZug==
X-Forwarded-Encrypted: i=1; AJvYcCXzbM/05YM/7tjdhliuw+WvtEf3Dp5aWoEWwTisdK3QBQrumDOYNcRbuh+3lbYyUoYa58EtpH/Ss50=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAzyR46p65VlPo1T4OgaZaVHGbO5Lir2r0Acq/C9yYz+WJP0jE
	2Aa88EWB5h1xk5JpiSEMnvbAaL5WMK1NcuG5LTk2STLAv8i6mMGCi18z
X-Gm-Gg: ASbGnctzqPR8SpE/PPpQImynwpLfwrxztcSeCV1F1J4LSETd87ecBEXRk+RvW30+3ux
	EP5l/w7jUgJgYafaUYt38tFwwzOF5YtLPZqZjEashu0v8Jbhn9CDEfoxhzcJH8e7iZ/tvZU0J7t
	LojlLWkx5E27Tp1XlGL2WQ8/9QHhCogYHfVwM0f6PFFmeP3MmzwQozU0ASDV2DuLveBnAK/Qodg
	HPVxWm5hrM09aQ5rPsz4MH/AaE5tNtA63BOYEhgOhjZst56xn7GybkcJTaxjt8OzbzmYBQrbtH5
	lPqYg5up077b2f92cFCKIDbhxPN+1MO+FEj6aBVfde+wrLTEAzQd0z0AFT/IcTJbQKqrxXyLFXO
	FtMTcGxXP+0cHQSgZXbQBDI39fwGT/anhg4zEvDyn3ESx38iTfGSs8AVBtSlPrb6zTfBN8q8=
X-Google-Smtp-Source: AGHT+IEEDWqMJ9DmsuvQiUe5Ikq3mimpAJBtDTKN0XVlTNNSNwvsMxnE26Ah87wiJLnDRTHYbdw07g==
X-Received: by 2002:a17:907:e90:b0:ae3:c5b3:3810 with SMTP id a640c23a62f3a-ae6fc6f5e8fmr1235994366b.13.1752508892296;
        Mon, 14 Jul 2025 09:01:32 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------mXCczpN0ZJMtUTLvEMBzk881"
Message-ID: <e5b90a21-03fd-4aef-b35a-f767d34c5dde@gmail.com>
Date: Mon, 14 Jul 2025 18:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/17] xen/riscv: Implement p2m_free_entry() and
 related helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <67148a7cceffdcbc5d8a51cd6af0a0c83e5b93bc.1749555949.git.oleksii.kurochko@gmail.com>
 <ec05b4c8-c328-4dc3-9f35-207421990893@suse.com>
 <de4ce9e3-c858-4ef6-917e-c9dd05bca02e@gmail.com>
 <9b84393c-37a7-4621-a7bb-3249e28fb69e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9b84393c-37a7-4621-a7bb-3249e28fb69e@suse.com>

This is a multi-part message in MIME format.
--------------mXCczpN0ZJMtUTLvEMBzk881
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/14/25 9:15 AM, Jan Beulich wrote:
> On 11.07.2025 17:56, Oleksii Kurochko wrote:
>> On 7/1/25 4:23 PM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> +/*
>>>> + * In the case of the P2M, the valid bit is used for other purpose. Use
>>>> + * the type to check whether an entry is valid.
>>>> + */
>>>>    static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>    {
>>>> -    panic("%s: isn't implemented for now\n", __func__);
>>>> +    return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>> +}
>>> No checking of the valid bit?
>> As mentioned in the comment, only the P2M type should be checked, since the
>> valid bit is used for other purposes we discussed earlier, for example, to
>> track whether pages were accessed by a guest domain, or to support certain
>> table invalidation optimizations (1) and (2).
>> So, in this case, we only need to consider whether the entry is invalid
>> from the P2M perspective.
>>
>> (1)https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1245
>> (2)https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1386
> And there can be e.g. entries with the valid bit set and the type being
> p2m_invalid?

It shouldn't be so, at least, at the moment, I don't know such cases.

> IOW there's no short-circuiting possible in any of the
> possible cases, avoiding the radix tree lookup in at least some of the
> cases?

Yes, I’ve implemented such optimization. I started using two free bits
in the PTE for some “popular” types:
   static p2m_type_t p2m_get_type(struct p2m_domain *p2m, pte_t pte)
   {
       p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
   
       if ( type == p2m_device_tree_type )
       {
	  ...
           ptr = radix_tree_lookup(&p2m->p2m_types, gfn_x(gfn));
           ...
           return radix_tree_ptr_to_int(ptr);
       }
   
       return type;
   }
   
   /*
    * In the case of the P2M, the valid bit is used for other purpose. Use
    * the type to check whether an entry is valid.
    */
   static inline bool p2m_is_valid(struct p2m_domain *p2m, pte_t pte)
   {
       return p2m_get_type(p2m, pte) != p2m_invalid;
   }


But thanks to your reply, I realized that in the case of|p2m_is_valid()|,
the implementation could be simplified further to:
   /*
    * In the case of the P2M, the valid bit is used for other purpose. Use
    * the type to check whether an entry is valid.
    */
   static inline bool p2m_is_valid(struct p2m_domain *p2m, pte_t pte)
   {
       return MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) != p2m_invalid;
   }

As we care here only about whether the type is|p2m_invalid| or not,
and we don’t need the specific type here if it’s not|p2m_invalid|.

>
>>>> @@ -404,11 +426,127 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>>>>        return GUEST_TABLE_MAP_NONE;
>>>>    }
>>>>    
>>>> +static void p2m_put_foreign_page(struct page_info *pg)
>>>> +{
>>>> +    /*
>>>> +     * It's safe to do the put_page here because page_alloc will
>>>> +     * flush the TLBs if the page is reallocated before the end of
>>>> +     * this loop.
>>>> +     */
>>>> +    put_page(pg);
>>> Is the comment really true? The page allocator will flush the normal
>>> TLBs, but not the stage-2 ones. Yet those are what you care about here,
>>> aiui.
>> In alloc_heap_pages():
>>    ...
>>        if ( need_tlbflush )
>>           filtered_flush_tlb_mask(tlbflush_timestamp);
>>    ...
>>    
>> filtered_flush_tlb_mask() calls arch_flush_tlb_mask().
>>
>> and arch_flush_tlb_mask(), at least, on Arm (I haven't checked x86) is
>> implented as:
>>     void arch_flush_tlb_mask(const cpumask_t *mask)
>>     {
>>         /* No need to IPI other processors on ARM, the processor takes care of it. */
>>         flush_all_guests_tlb();
>>     }
>>
>> So it flushes stage-2 TLB.
> Hmm, okay. And I take it you have the same plan on RISC-V?

Yes, there is such a plan.

>   What I'd like to
> ask for, though, is that the comment (also) mentions where that (guest)
> flushing actually happens. That's not in page_alloc.c, and it also wasn't
> originally intended for guest TLBs to also be flushed from there (as x86 is
> where the flush avoidance machinery originates, which Arm and now also
> RISC-V don't really use).

Sure, it makes sense to update the comment.


>
>>>> +/* Put any references on the single 4K page referenced by mfn. */
>>>> +static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
>>>> +{
>>>> +    /* TODO: Handle other p2m types */
>>>> +
>>>> +    /* Detect the xenheap page and mark the stored GFN as invalid. */
>>>> +    if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
>>>> +        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
>>> Is this a valid thing to do? How do you make sure the respective uses
>>> (in gnttab's shared and status page arrays) are / were also removed?
>> As grant table frame GFN is stored directly in struct page_info instead
>> of keeping it in standalone status/shared arrays, thereby there is no need
>> for status/shared arrays.
> I fear I don't follow. Looking at Arm's header (which I understand you
> derive from), I see
>
> #define gnttab_shared_page(t, i)   virt_to_page((t)->shared_raw[i])
>
> #define gnttab_status_page(t, i)   virt_to_page((t)->status[i])
>
> Are you intending to do things differently?

I missed these arrays... Arm had different arrays:
-    (gt)->arch.shared_gfn = xmalloc_array(gfn_t, ngf_);                  \
-    (gt)->arch.status_gfn = xmalloc_array(gfn_t, nsf_);                  \

I think I don't know the answer to your question, as I'm not deeply familiar
with grant tables and would need to do some additional investigation.

And just to be sure I understand your question correctly: are you asking
whether I marked a page as|INVALID_GFN| while a domain might still be using
it for grant table purposes?

>
>>>> +/* Put any references on the superpage referenced by mfn. */
>>>> +static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
>>>> +{
>>>> +    struct page_info *pg;
>>>> +    unsigned int i;
>>>> +
>>>> +    ASSERT(mfn_valid(mfn));
>>>> +
>>>> +    pg = mfn_to_page(mfn);
>>>> +
>>>> +    for ( i = 0; i < XEN_PT_ENTRIES; i++, pg++ )
>>>> +        p2m_put_foreign_page(pg);
>>>> +}
>>>> +
>>>> +/* Put any references on the page referenced by pte. */
>>>> +static void p2m_put_page(struct p2m_domain *p2m, const pte_t pte,
>>>> +                         unsigned int level)
>>>> +{
>>>> +    mfn_t mfn = pte_get_mfn(pte);
>>>> +    p2m_type_t p2m_type = p2m_type_radix_get(p2m, pte);
>>> This gives you the type of the 1st page. What guarantees that all other pages
>>> in a superpage are of the exact same type?
>> Doesn't superpage mean that all the 4KB pages within that superpage have the
>> same type and contiguous in memory?
> If the mapping is a super-page one - yes. Yet I see nothing super-page-ish
> here.

Probably, I just misunderstood your reply, but there is a check below:
     if ( level == 2 )
         return p2m_put_l2_superpage(mfn, pte.p2m.type);
And I expect that if|level == 2|, it means it is a superpage, which means that
all the 4KB pages within that superpage share the same type and are contiguous
in memory.


>
>>>> +    if ( level == 1 )
>>>> +        return p2m_put_2m_superpage(mfn, p2m_type);
>>>> +    else if ( level == 0 )
>>>> +        return p2m_put_4k_page(mfn, p2m_type);
>>> Use switch() right away?
>> It could be, I think that no big difference at the moment, at least.
>> But I am okay to rework it.
> If you don't want to use switch() here, then my other style nit would
> need giving: Please avoid "else" in situations like this.
>
>>>> +static void p2m_free_page(struct domain *d, struct page_info *pg)
>>>> +{
>>>> +    if ( is_hardware_domain(d) )
>>>> +        free_domheap_page(pg);
>>> Why's the hardware domain different here? It should have a pool just like
>>> all other domains have.
>> Hardware domain (dom0) should be no limit in the number of pages that can
>> be allocated, so allocate p2m pages for hardware domain is done from heap.
>>
>> An idea of p2m pool is to provide a way how to put clear limit and amount
>> to the p2m allocation.
> Well, we had been there on another thread, and I outlined how I think
> Dom0 may want handling.

I think that I don't remember. Could you please remind me what was that thread?
Probably, do you mean this reply:https://lore.kernel.org/xen-devel/cover.1749555949.git.oleksii.kurochko@gmail.com/T/#m4789842aaae1653b91d3368f66cadb0ef87fb17e ?
But this is not really about Dom0 case.

>
>>>>    /* Free pte sub-tree behind an entry */
>>>>    static void p2m_free_entry(struct p2m_domain *p2m,
>>>>                               pte_t entry, unsigned int level)
>>>>    {
>>>> -    panic("%s: hasn't been implemented yet\n", __func__);
>>>> +    unsigned int i;
>>>> +    pte_t *table;
>>>> +    mfn_t mfn;
>>>> +    struct page_info *pg;
>>>> +
>>>> +    /* Nothing to do if the entry is invalid. */
>>>> +    if ( !p2me_is_valid(p2m, entry) )
>>>> +        return;
>>> Does this actually apply to intermediate page tables (which you handle
>>> later in the function), when that's (only) a P2M type check?
>> Yes, any PTE should have V bit set to 1, so from P2M perspective it also
>> should be, at least, not equal to p2m_invalid.
> I don't follow. Where would that type be set? The radix tree being GFN-
> indexed, you would need to "invent" a GFN for every intermediate page table,
> just to be able to (legitimately) invoke the type retrieval function.

Maybe, it is incorrect, but in this patch series the type is set when
|page_to_p2m_table|() is called, which get as an argument a page correspondent
to a table. And then GFN is calculated based on this mfn:
staticpte_tpage_to_p2m_table(structp2m_domain *p2m, structpage_info *page)
{
/*
*Since this function generates a table entry, according to "Encoding
* of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
*to point to the next level of the page table.
* Therefore,to ensure that anentry is a page table entry,
* `p2m_access_n2rwx`is passed to `mfn_to_p2m_entry()` as the access value,
*which overrides whatever was passed as `p2m_type_t` and guarantees that
*the entry is apage table entry by setting r = w = x = 0.
*/
returnp2m_entry_from_mfn(p2m, page_to_mfn(page), p2m_ram_rw, 
p2m_access_n2rwx);
}
where:
   static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t, p2m_access_t a)
   {
       ...
   
       pte_set_mfn(&e, mfn);
   
       BUG_ON(p2m_type_radix_set(p2m, e, t));
   
       return e;
   }
   
and where:
   static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
   {
       int rc;
       gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
   
       rc = radix_tree_insert(&p2m->p2m_types, gfn_x(gfn),
                              radix_tree_int_to_ptr(t));
       ....
   }

But as you mentioned below ...

>   Maybe
> you mean to leverage that (now, i.e. post-v2) you encode some of the types
> directly in the PTE, and p2m_invalid may be one of them. But that wasn't
> the case in the v2 submission, and hence the code looked wrong to me. Which
> in turn suggests that at least some better commentary is going to be needed,
> maybe even some BUILD_BUG_ON().

... p2m_invalid type will be encoded directly in the PTE in the next patch version.

~ Oleksii

--------------mXCczpN0ZJMtUTLvEMBzk881
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/14/25 9:15 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9b84393c-37a7-4621-a7bb-3249e28fb69e@suse.com">
      <pre wrap="" class="moz-quote-pre">On 11.07.2025 17:56, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 7/1/25 4:23 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+/*
+ * In the case of the P2M, the valid bit is used for other purpose. Use
+ * the type to check whether an entry is valid.
+ */
  static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
  {
-    panic("%s: isn't implemented for now\n", __func__);
+    return p2m_type_radix_get(p2m, pte) != p2m_invalid;
+}
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">No checking of the valid bit?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
As mentioned in the comment, only the P2M type should be checked, since the
valid bit is used for other purposes we discussed earlier, for example, to
track whether pages were accessed by a guest domain, or to support certain
table invalidation optimizations (1) and (2).
So, in this case, we only need to consider whether the entry is invalid
from the P2M perspective.

(1)<a class="moz-txt-link-freetext" href="https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1245">https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1245</a>
(2)<a class="moz-txt-link-freetext" href="https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1386">https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1386</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And there can be e.g. entries with the valid bit set and the type being
p2m_invalid? </pre>
    </blockquote>
    <pre>It shouldn't be so, at least, at the moment, I don't know such cases.

</pre>
    <blockquote type="cite"
      cite="mid:9b84393c-37a7-4621-a7bb-3249e28fb69e@suse.com">
      <pre wrap="" class="moz-quote-pre">IOW there's no short-circuiting possible in any of the
possible cases, avoiding the radix tree lookup in at least some of the
cases?</pre>
    </blockquote>
    <pre>Yes, I’ve implemented such optimization. I started using two free bits
in the PTE for some “popular” types:
  static p2m_type_t p2m_get_type(struct p2m_domain *p2m, pte_t pte)
  {
      p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
  
      if ( type == p2m_device_tree_type )
      {
	  ...
          ptr = radix_tree_lookup(&amp;p2m-&gt;p2m_types, gfn_x(gfn));
          ...  
          return radix_tree_ptr_to_int(ptr);
      }
  
      return type;
  }
  
  /*
   * In the case of the P2M, the valid bit is used for other purpose. Use
   * the type to check whether an entry is valid.
   */
  static inline bool p2m_is_valid(struct p2m_domain *p2m, pte_t pte)
  {
      return p2m_get_type(p2m, pte) != p2m_invalid;
  }


But thanks to your reply, I realized that in the case of <code
    data-start="876" data-end="892">p2m_is_valid()</code>,
the implementation could be simplified further to:
  /*
   * In the case of the P2M, the valid bit is used for other purpose. Use
   * the type to check whether an entry is valid.
   */
  static inline bool p2m_is_valid(struct p2m_domain *p2m, pte_t pte)
  {
      return MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) != p2m_invalid;
  }

As we care here only about whether the type is <code data-start="1272"
    data-end="1285">p2m_invalid</code> or not,
and we don’t need the specific type here if it’s not <code
    data-start="1347" data-end="1360">p2m_invalid</code>.

</pre>
    <blockquote type="cite"
      cite="mid:9b84393c-37a7-4621-a7bb-3249e28fb69e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -404,11 +426,127 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
      return GUEST_TABLE_MAP_NONE;
  }
  
+static void p2m_put_foreign_page(struct page_info *pg)
+{
+    /*
+     * It's safe to do the put_page here because page_alloc will
+     * flush the TLBs if the page is reallocated before the end of
+     * this loop.
+     */
+    put_page(pg);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Is the comment really true? The page allocator will flush the normal
TLBs, but not the stage-2 ones. Yet those are what you care about here,
aiui.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
In alloc_heap_pages():
  ...
      if ( need_tlbflush )
         filtered_flush_tlb_mask(tlbflush_timestamp);
  ...
  
filtered_flush_tlb_mask() calls arch_flush_tlb_mask().

and arch_flush_tlb_mask(), at least, on Arm (I haven't checked x86) is
implented as:
   void arch_flush_tlb_mask(const cpumask_t *mask)
   {
       /* No need to IPI other processors on ARM, the processor takes care of it. */
       flush_all_guests_tlb();
   }

So it flushes stage-2 TLB.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmm, okay. And I take it you have the same plan on RISC-V?</pre>
    </blockquote>
    <pre>Yes, there is such a plan.

</pre>
    <blockquote type="cite"
      cite="mid:9b84393c-37a7-4621-a7bb-3249e28fb69e@suse.com">
      <pre wrap="" class="moz-quote-pre"> What I'd like to
ask for, though, is that the comment (also) mentions where that (guest)
flushing actually happens. That's not in page_alloc.c, and it also wasn't
originally intended for guest TLBs to also be flushed from there (as x86 is
where the flush avoidance machinery originates, which Arm and now also
RISC-V don't really use).</pre>
    </blockquote>
    <pre>Sure, it makes sense to update the comment.


</pre>
    <blockquote type="cite"
      cite="mid:9b84393c-37a7-4621-a7bb-3249e28fb69e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+/* Put any references on the single 4K page referenced by mfn. */
+static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
+{
+    /* TODO: Handle other p2m types */
+
+    /* Detect the xenheap page and mark the stored GFN as invalid. */
+    if ( p2m_is_ram(type) &amp;&amp; is_xen_heap_mfn(mfn) )
+        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Is this a valid thing to do? How do you make sure the respective uses
(in gnttab's shared and status page arrays) are / were also removed?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
As grant table frame GFN is stored directly in struct page_info instead
of keeping it in standalone status/shared arrays, thereby there is no need
for status/shared arrays.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I fear I don't follow. Looking at Arm's header (which I understand you
derive from), I see

#define gnttab_shared_page(t, i)   virt_to_page((t)-&gt;shared_raw[i])

#define gnttab_status_page(t, i)   virt_to_page((t)-&gt;status[i])

Are you intending to do things differently?</pre>
    </blockquote>
    <pre>I missed these arrays... Arm had different arrays:
-    (gt)-&gt;arch.shared_gfn = xmalloc_array(gfn_t, ngf_);                  \
-    (gt)-&gt;arch.status_gfn = xmalloc_array(gfn_t, nsf_);                  \

</pre>
    <pre data-start="212" data-end="358">I think I don't know the answer to your question, as I'm not deeply familiar
with grant tables and would need to do some additional investigation.</pre>
    <pre data-start="360" data-end="538">And just to be sure I understand your question correctly: are you asking
whether I marked a page as <code data-start="460" data-end="473">INVALID_GFN</code> while a domain might still be using
it for grant table purposes?

</pre>
    <blockquote type="cite"
      cite="mid:9b84393c-37a7-4621-a7bb-3249e28fb69e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+/* Put any references on the superpage referenced by mfn. */
+static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
+{
+    struct page_info *pg;
+    unsigned int i;
+
+    ASSERT(mfn_valid(mfn));
+
+    pg = mfn_to_page(mfn);
+
+    for ( i = 0; i &lt; XEN_PT_ENTRIES; i++, pg++ )
+        p2m_put_foreign_page(pg);
+}
+
+/* Put any references on the page referenced by pte. */
+static void p2m_put_page(struct p2m_domain *p2m, const pte_t pte,
+                         unsigned int level)
+{
+    mfn_t mfn = pte_get_mfn(pte);
+    p2m_type_t p2m_type = p2m_type_radix_get(p2m, pte);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">This gives you the type of the 1st page. What guarantees that all other pages
in a superpage are of the exact same type?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Doesn't superpage mean that all the 4KB pages within that superpage have the
same type and contiguous in memory?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If the mapping is a super-page one - yes. Yet I see nothing super-page-ish
here.</pre>
    </blockquote>
    <pre>Probably, I just misunderstood your reply, but there is a check below:
    if ( level == 2 )
        return p2m_put_l2_superpage(mfn, pte.p2m.type);
And I expect that if <code data-start="180" data-end="192">level == 2</code>, it means it is a superpage, which means that
all the 4KB pages within that superpage share the same type and are contiguous
in memory.</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:9b84393c-37a7-4621-a7bb-3249e28fb69e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    if ( level == 1 )
+        return p2m_put_2m_superpage(mfn, p2m_type);
+    else if ( level == 0 )
+        return p2m_put_4k_page(mfn, p2m_type);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Use switch() right away?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It could be, I think that no big difference at the moment, at least.
But I am okay to rework it.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If you don't want to use switch() here, then my other style nit would
need giving: Please avoid "else" in situations like this.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static void p2m_free_page(struct domain *d, struct page_info *pg)
+{
+    if ( is_hardware_domain(d) )
+        free_domheap_page(pg);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Why's the hardware domain different here? It should have a pool just like
all other domains have.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Hardware domain (dom0) should be no limit in the number of pages that can
be allocated, so allocate p2m pages for hardware domain is done from heap.

An idea of p2m pool is to provide a way how to put clear limit and amount
to the p2m allocation.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, we had been there on another thread, and I outlined how I think
Dom0 may want handling.</pre>
    </blockquote>
    <pre>I think that I don't remember. Could you please remind me what was that thread?
Probably, do you mean this reply: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1749555949.git.oleksii.kurochko@gmail.com/T/#m4789842aaae1653b91d3368f66cadb0ef87fb17e">https://lore.kernel.org/xen-devel/cover.1749555949.git.oleksii.kurochko@gmail.com/T/#m4789842aaae1653b91d3368f66cadb0ef87fb17e</a> ?
But this is not really about Dom0 case.

</pre>
    <blockquote type="cite"
      cite="mid:9b84393c-37a7-4621-a7bb-3249e28fb69e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">  /* Free pte sub-tree behind an entry */
  static void p2m_free_entry(struct p2m_domain *p2m,
                             pte_t entry, unsigned int level)
  {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    unsigned int i;
+    pte_t *table;
+    mfn_t mfn;
+    struct page_info *pg;
+
+    /* Nothing to do if the entry is invalid. */
+    if ( !p2me_is_valid(p2m, entry) )
+        return;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Does this actually apply to intermediate page tables (which you handle
later in the function), when that's (only) a P2M type check?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes, any PTE should have V bit set to 1, so from P2M perspective it also
should be, at least, not equal to p2m_invalid.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't follow. Where would that type be set? The radix tree being GFN-
indexed, you would need to "invent" a GFN for every intermediate page table,
just to be able to (legitimately) invoke the type retrieval function.</pre>
    </blockquote>
    <pre>Maybe, it is incorrect, but in this patch series the type is set when
<code>page_to_p2m_table</code>() is called, which get as an argument a page correspondent
to a table. And then GFN is calculated based on this mfn:
<span><span class="hljs-type">  static</span><span class=""> </span><span
    class="hljs-type">pte_t</span><span class=""> </span><span
    class="hljs-title.function">page_to_p2m_table</span><span
    class="hljs-params"><span class="hljs-params">(</span><span
    class="hljs-keyword">struct</span><span class="hljs-params"> p2m_domain *p2m, </span><span
    class="hljs-keyword">struct</span><span class="hljs-params"> page_info *page)</span></span></span>
<span><span class="">  {</span></span>
<span><span class="">      </span><span class="hljs-comment"><span
    class="hljs-comment">/*</span></span></span>
<span><span class="hljs-comment">       *</span><span
    class="hljs-comment"> Since this function </span><span
    class="hljs-comment">generates a table entry, according to "Encoding</span></span>
<span><span class="hljs-comment">       * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0</span></span>
<span><span class="hljs-comment">       *</span><span
    class="hljs-comment"> to point to </span><span class="hljs-comment">the next level of the page table.</span></span>
<span><span class="hljs-comment">       * Therefore,</span><span
    class="hljs-comment"> to ensure that </span><span
    class="hljs-comment">an</span><span class="hljs-comment"> entry is a </span><span
    class="hljs-comment">page table entry,</span></span>
<span><span class="hljs-comment">       * `p2m_access_n2rwx`</span><span
    class="hljs-comment"> is passed to </span><span class="hljs-comment">`mfn_to_p2m_entry()` as the access value,</span></span>
<span><span class="hljs-comment">       *</span><span
    class="hljs-comment"> which overrides whatever </span><span
    class="hljs-comment">was passed as `p2m_type_t` and guarantees that</span></span>
<span><span class="hljs-comment">       *</span><span
    class="hljs-comment"> the entry is </span><span class="hljs-comment">a</span><span
    class="hljs-comment"> page table entry </span><span
    class="hljs-comment">by setting r = w = x = 0.</span></span>
<span><span class="hljs-comment">       */</span></span>
<span><span class="">    </span><span class="hljs-keyword">  return</span><span
    class=""> p2m_entry_from_mfn</span><span class="">(p2m, page_to_mfn</span><span
    class="">(page)</span><span class="">, p2m_ram_rw, p2m_access_n2rwx)</span><span
    class="">;</span></span>
<span><span class="">  }
</span></span>
where:
  static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t, p2m_access_t a)
  {
      ...
  
      pte_set_mfn(&amp;e, mfn);
  
      BUG_ON(p2m_type_radix_set(p2m, e, t));
  
      return e;
  }
  
and where:
  static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
  {
      int rc;
      gfn_t gfn = mfn_to_gfn(p2m-&gt;domain, mfn_from_pte(pte));
  
      rc = radix_tree_insert(&amp;p2m-&gt;p2m_types, gfn_x(gfn),
                             radix_tree_int_to_ptr(t));
      ....
  }

But as you mentioned below ...

</pre>
    <blockquote type="cite"
      cite="mid:9b84393c-37a7-4621-a7bb-3249e28fb69e@suse.com">
      <pre wrap="" class="moz-quote-pre"> Maybe
you mean to leverage that (now, i.e. post-v2) you encode some of the types
directly in the PTE, and p2m_invalid may be one of them. But that wasn't
the case in the v2 submission, and hence the code looked wrong to me. Which
in turn suggests that at least some better commentary is going to be needed,
maybe even some BUILD_BUG_ON().</pre>
    </blockquote>
    <pre>... p2m_invalid type will be encoded directly in the PTE in the next patch version.

</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------mXCczpN0ZJMtUTLvEMBzk881--

