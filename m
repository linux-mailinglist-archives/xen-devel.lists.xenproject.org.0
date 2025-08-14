Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7938B26A83
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 17:10:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081915.1441871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZaY-0005ni-Ix; Thu, 14 Aug 2025 15:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081915.1441871; Thu, 14 Aug 2025 15:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZaY-0005kf-FR; Thu, 14 Aug 2025 15:09:58 +0000
Received: by outflank-mailman (input) for mailman id 1081915;
 Thu, 14 Aug 2025 15:09:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T7lD=22=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1umZaW-0005kT-Du
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 15:09:56 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc2e3583-7920-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 17:09:55 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb7a7bad8so145368966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 08:09:55 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a39c4sm2620490366b.43.2025.08.14.08.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 08:09:53 -0700 (PDT)
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
X-Inumbo-ID: bc2e3583-7920-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755184195; x=1755788995; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/DHIOMbK4lqQVleLAVjPQs1xd4Au+fYaJGUSMoMWUg=;
        b=i88UWtJ49W9jwcQ8u8eGA7DCiZxa49scS1WJapnn3mKt3tEp81c/4XYwIRF1X63o9C
         DUpE4gZXHAPHqBaRFmk4DS+BfbStO09wxB37pPV6W1QaqXaFy0taUuZ2zvVdbLl8Wwkp
         +I4nSUu153u2nJctiWwkGQpMXjZn1luyKOklPVk6h8U5NnQ9R32xB9h2JZvz74QHR1KM
         CvxlvNws9m1ox6mgO13W5m0hQcv3JgEqd7P6Ha1Xbu6mlRi0nqw0GJtrju0jZGvjxuFF
         DjslurMCmebhUXYCY46sCDAZvqE8TUHpAf1TcmIVLKeo4Hn4ui0bwAMbeFXSrBM2WdDc
         F0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755184195; x=1755788995;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b/DHIOMbK4lqQVleLAVjPQs1xd4Au+fYaJGUSMoMWUg=;
        b=vomHrNtYbXUWnp5o25P5PY4e3Li2raFcnRWKJHTbl0BSu1s13lP/IJIOgMkpJYAH6Z
         scMzW5AhtFpj+N/8MRpdpdUFL/XuQY08FJuCDvXkBDF95X7ChBcKNFAkBLAm7GDaTc78
         Ocm7wCOlN7MA+pwB/JChzuzDa/5T+IxIrFHqI+gasFxLTy3+YkDlmQ36vqdypANtpPdt
         l2wbGHqNeaVrUJ7mOpn5/qYKKAjRnVuwupxZOVqEGB+b/oCfcetl3ZM2DGghLoNGtqHG
         Yuf2tDC6i350ORj7IxhHLdD73S3KI2qE9t+23xNB/Zh4am38xTI55d1z2vyKf0fgES7B
         Y5Sg==
X-Forwarded-Encrypted: i=1; AJvYcCV9FjSXUwwMKwUgko9Li0N5HS7xmOxSfYQmcxqvLMFGmYZU3hTUS9Kh0MmZOX1CAVkHiColhc/MbbM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfGIojIkwBdtR6SBoBjuEdnkDeCpvpmke2VtCZUhe2lny5CGi4
	fVsnuXAELIDgapwzTHg4Pq3v/wuhJCXVOpNKqTmU+W389Z5TgmhIWUcH
X-Gm-Gg: ASbGnctwlQgD/XuQ4zbPOc2viw98fIAfDYBrSr86Melwww+1D2zA0Zpp5txHQAbBf3N
	MUdqj5R4mHN273m0tzYldRhojSAaVBwU7KCzUUjzMV5ZsanVufMnb3yQ5XKfPe5cVmiiGIQmzZH
	tm+/gmEY5hqmRt5tWY3nk3GsRYP9BE/QkqKTtwYzb940P02qX+8Gw0bTiXqHxT6YlcBNvjqkuJn
	caoZaOCGtLUClpkZ6buYC3c/TqpHsg/0FoZYnAsgIQsV9slLCdEh6RNKNmN9K4ynXC1gtsTmz1G
	CFl/2jXQ6ZZWP6+k5KHtZcDKsEoF6pb3+J38JqPA6OcKBEOsaFD3D6MiWtjvN3j2/nYwW1Phvej
	3gKG8TUU6/R998soGbL+w9wdbsOnWvkAIVoYe8uDsjt0i4yPPmhZOoDhvXMlXfyGKBUgTmkqX
X-Google-Smtp-Source: AGHT+IGCLnS/E1vBXEtbwzD8hjSZgHopEXCKwdg8jcbGwVohgoCrLj3doNM2Tte5Khyps1xpdq4jWA==
X-Received: by 2002:a17:906:aac8:b0:afc:c736:8b0d with SMTP id a640c23a62f3a-afcc7368bf6mr161934766b.22.1755184194054;
        Thu, 14 Aug 2025 08:09:54 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------vYx2KQ1Dkw3zffA1AKgYiN5b"
Message-ID: <c8a07c48-b79b-4136-a265-91c14bb96c81@gmail.com>
Date: Thu, 14 Aug 2025 17:09:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 13/20] xen/riscv: Implement p2m_free_subtree() and
 related helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <41845723a7b0e3efd09095d13e57aace6f7747ef.1753973161.git.oleksii.kurochko@gmail.com>
 <98dc796e-bb14-435e-8c19-53e5de60cc43@suse.com>
Content-Language: en-US
In-Reply-To: <98dc796e-bb14-435e-8c19-53e5de60cc43@suse.com>

This is a multi-part message in MIME format.
--------------vYx2KQ1Dkw3zffA1AKgYiN5b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/6/25 5:55 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -79,10 +79,20 @@ typedef enum {
>>       p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
>>       p2m_grant_map_rw,   /* Read/write grant mapping */
>>       p2m_grant_map_ro,   /* Read-only grant mapping */
>> +    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
>> +    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
>>   } p2m_type_t;
>>   
>>   #define p2m_mmio_direct p2m_mmio_direct_io
>>   
>> +/*
>> + * Bits 8 and 9 are reserved for use by supervisor software;
>> + * the implementation shall ignore this field.
>> + * We are going to use to save in these bits frequently used types to avoid
>> + * get/set of a type from radix tree.
>> + */
>> +#define P2M_TYPE_PTE_BITS_MASK  0x300
>> +
>>   /* We use bitmaps and mask to handle groups of types */
>>   #define p2m_to_mask(t_) BIT(t_, UL)
>>   
>> @@ -93,10 +103,16 @@ typedef enum {
>>   #define P2M_GRANT_TYPES (p2m_to_mask(p2m_grant_map_rw) | \
>>                            p2m_to_mask(p2m_grant_map_ro))
>>   
>> +                            /* Foreign mappings types */
> Nit: Why so far to the right?
>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -197,6 +197,16 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>       return __map_domain_page(p2m->root + root_table_indx);
>>   }
>>   
>> +static p2m_type_t p2m_get_type(const pte_t pte)
>> +{
>> +    p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
>> +
>> +    if ( type == p2m_ext_storage )
>> +        panic("unimplemented\n");
> That is, as per p2m.h additions you pretend to add support for foreign types
> here, but then you don't?

I count foreign types as p2m_ext_storage type, so a support for them will be added in the patch
[1] of this patch series as a type for p2m_ext_storage type will stored in metadata
due to the lack of free bits in PTE.

[1]https://lore.kernel.org/xen-devel/cover.1753973161.git.oleksii.kurochko@gmail.com/T/#mcc1a0367fdbfbf3ca073f152efa799c1a4354974

>> @@ -248,11 +258,136 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>>       return P2M_TABLE_MAP_NONE;
>>   }
>>   
>> +static void p2m_put_foreign_page(struct page_info *pg)
>> +{
>> +    /*
>> +     * It’s safe to call put_page() here because arch_flush_tlb_mask()
>> +     * will be invoked if the page is reallocated before the end of
>> +     * this loop, which will trigger a flush of the guest TLBs.
>> +     */
>> +    put_page(pg);
>> +}
> How can one know the comment is true? arch_flush_tlb_mask() still lives in
> stubs.c, and hence what it is eventually going to do (something like Arm's
> vs more like x86'es) is entirely unknown right now.

I'll introduce arch_flush_tlb_mask() in this patch in the next version.

>> +/* Put any references on the single 4K page referenced by mfn. */
>> +static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
>> +{
>> +    /* TODO: Handle other p2m types */
>> +
>> +    if ( p2m_is_foreign(type) )
>> +    {
>> +        ASSERT(mfn_valid(mfn));
>> +        p2m_put_foreign_page(mfn_to_page(mfn));
>> +    }
>> +
>> +    /*
>> +     * Detect the xenheap page and mark the stored GFN as invalid.
>> +     * We don't free the underlying page until the guest requested to do so.
>> +     * So we only need to tell the page is not mapped anymore in the P2M by
>> +     * marking the stored GFN as invalid.
>> +     */
>> +    if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
>> +        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
> Isn't this for grants? p2m_is_ram() doesn't cover p2m_grant_map_*.

p2m_is_ram() looks really unnecessary here. I'm thinking if it could be useful
to store for RAM types GFNs too to have something like M2P.

>> +}
>> +
>> +/* Put any references on the superpage referenced by mfn. */
>> +static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
>> +{
>> +    struct page_info *pg;
>> +    unsigned int i;
>> +
>> +    ASSERT(mfn_valid(mfn));
>> +
>> +    pg = mfn_to_page(mfn);
>> +
>> +    for ( i = 0; i < XEN_PT_ENTRIES; i++, pg++ )
>> +        p2m_put_foreign_page(pg);
>> +}
> In p2m_put_4k_page() you check the type, whereas here you don't.

Missed to add that:
       if ( !p2m_is_foreign(type) )
         return;

>> +/* Put any references on the page referenced by pte. */
>> +static void p2m_put_page(const pte_t pte, unsigned int level)
>> +{
>> +    mfn_t mfn = pte_get_mfn(pte);
>> +    p2m_type_t p2m_type = p2m_get_type(pte);
>> +
>> +    ASSERT(pte_is_valid(pte));
>> +
>> +    /*
>> +     * TODO: Currently we don't handle level 2 super-page, Xen is not
>> +     * preemptible and therefore some work is needed to handle such
>> +     * superpages, for which at some point Xen might end up freeing memory
>> +     * and therefore for such a big mapping it could end up in a very long
>> +     * operation.
>> +     */
>> +    switch ( level )
>> +    {
>> +    case 1:
>> +        return p2m_put_2m_superpage(mfn, p2m_type);
>> +
>> +    case 0:
>> +        return p2m_put_4k_page(mfn, p2m_type);
>> +    }
> Yet despite the comment not even an assertion for level 2 and up?

Not sure that an ASSERT() is needed here as a reference(s) for such page(s)
will be put during domain_relinquish_resources() as there we could do preemption.
Something like Arm does here:
   https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c?ref_type=heads#L1587

I'm thinking that probably it makes sense to put only 4k page(s) and
all other cases postpone until domain_relinquish_resources() is called.

>>   /* Free pte sub-tree behind an entry */
>>   static void p2m_free_subtree(struct p2m_domain *p2m,
>>                                pte_t entry, unsigned int level)
>>   {
>> -    panic("%s: hasn't been implemented yet\n", __func__);
>> +    unsigned int i;
>> +    pte_t *table;
>> +    mfn_t mfn;
>> +    struct page_info *pg;
>> +
>> +    /* Nothing to do if the entry is invalid. */
>> +    if ( !pte_is_valid(entry) )
>> +        return;
>> +
>> +    if ( pte_is_superpage(entry, level) || (level == 0) )
> Perhaps swap the two conditions around?
>
>> +    {
>> +#ifdef CONFIG_IOREQ_SERVER
>> +        /*
>> +         * If this gets called then either the entry was replaced by an entry
>> +         * with a different base (valid case) or the shattering of a superpage
>> +         * has failed (error case).
>> +         * So, at worst, the spurious mapcache invalidation might be sent.
>> +         */
>> +        if ( p2m_is_ram(p2m_get_type(p2m, entry)) &&
>> +             domain_has_ioreq_server(p2m->domain) )
>> +            ioreq_request_mapcache_invalidate(p2m->domain);
>> +#endif
>> +
>> +        p2m_put_page(entry, level);
>> +
>> +        return;
>> +    }
>> +
>> +    table = map_domain_page(pte_get_mfn(entry));
>> +    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
>> +        p2m_free_subtree(p2m, table[i], level - 1);
> In p2m_put_page() you comment towards concerns for level >= 2; no similar
> concerns for the resulting recursion here?

This function is generic enough to handle any level.

Except that it is possible that it will be needed, for example, to split 1G mapping
into something smaller then p2m_free_subtree() could be called for freeing a subtree
of 1gb mapping.

>> +    unmap_domain_page(table);
>> +
>> +    /*
>> +     * Make sure all the references in the TLB have been removed before
>> +     * freing the intermediate page table.
>> +     * XXX: Should we defer the free of the page table to avoid the
>> +     * flush?
>> +     */
>> +    p2m_tlb_flush_sync(p2m);
>> +
>> +    mfn = pte_get_mfn(entry);
>> +    ASSERT(mfn_valid(mfn));
>> +
>> +    pg = mfn_to_page(mfn);
>> +
>> +    page_list_del(pg, &p2m->pages);
>> +    p2m_free_page(p2m, pg);
> Once again I wonder whether this code path was actually tested: p2m_free_page()
> also invokes page_list_del(), and double deletions typically won't end very
> well.

Agree, it should be dropped here and left only in p2m_free_page().

It should be tested, I have a test case where I'm chaning MFN so this one should be called:
+    /*
+     * Free the entry only if the original pte was valid and the base
+     * is different (to avoid freeing when permission is changed).
+     */
+    if ( pte_is_valid(orig_pte) &&
+         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
+        p2m_free_subtree(p2m, orig_pte, level);

I will double check.

But I think I was lucky because I've tested only the whole patch series and in one of a
further patches page_list_del(pg, &p2m->pages) is dropped.

~ Oleksii

--------------vYx2KQ1Dkw3zffA1AKgYiN5b
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
    <div class="moz-cite-prefix">On 8/6/25 5:55 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:98dc796e-bb14-435e-8c19-53e5de60cc43@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -79,10 +79,20 @@ typedef enum {
     p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
     p2m_grant_map_rw,   /* Read/write grant mapping */
     p2m_grant_map_ro,   /* Read-only grant mapping */
+    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
+    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
 } p2m_type_t;
 
 #define p2m_mmio_direct p2m_mmio_direct_io
 
+/*
+ * Bits 8 and 9 are reserved for use by supervisor software;
+ * the implementation shall ignore this field.
+ * We are going to use to save in these bits frequently used types to avoid
+ * get/set of a type from radix tree.
+ */
+#define P2M_TYPE_PTE_BITS_MASK  0x300
+
 /* We use bitmaps and mask to handle groups of types */
 #define p2m_to_mask(t_) BIT(t_, UL)
 
@@ -93,10 +103,16 @@ typedef enum {
 #define P2M_GRANT_TYPES (p2m_to_mask(p2m_grant_map_rw) | \
                          p2m_to_mask(p2m_grant_map_ro))
 
+                            /* Foreign mappings types */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Nit: Why so far to the right?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -197,6 +197,16 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m-&gt;root + root_table_indx);
 }
 
+static p2m_type_t p2m_get_type(const pte_t pte)
+{
+    p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
+
+    if ( type == p2m_ext_storage )
+        panic("unimplemented\n");
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">That is, as per p2m.h additions you pretend to add support for foreign types
here, but then you don't?</pre>
    </blockquote>
    <pre>I count foreign types as p2m_ext_storage type, so a support for them will be added in the patch
[1] of this patch series as a type for p2m_ext_storage type will stored in metadata
due to the lack of free bits in PTE.

[1] <a class="moz-txt-link-freetext"
href="https://lore.kernel.org/xen-devel/cover.1753973161.git.oleksii.kurochko@gmail.com/T/#mcc1a0367fdbfbf3ca073f152efa799c1a4354974">https://lore.kernel.org/xen-devel/cover.1753973161.git.oleksii.kurochko@gmail.com/T/#mcc1a0367fdbfbf3ca073f152efa799c1a4354974</a>
</pre>
    <blockquote type="cite"
      cite="mid:98dc796e-bb14-435e-8c19-53e5de60cc43@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -248,11 +258,136 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
     return P2M_TABLE_MAP_NONE;
 }
 
+static void p2m_put_foreign_page(struct page_info *pg)
+{
+    /*
+     * It’s safe to call put_page() here because arch_flush_tlb_mask()
+     * will be invoked if the page is reallocated before the end of
+     * this loop, which will trigger a flush of the guest TLBs.
+     */
+    put_page(pg);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">How can one know the comment is true? arch_flush_tlb_mask() still lives in
stubs.c, and hence what it is eventually going to do (something like Arm's
vs more like x86'es) is entirely unknown right now.</pre>
    </blockquote>
    <pre>I'll introduce arch_flush_tlb_mask() in this patch in the next version.

</pre>
    <blockquote type="cite"
      cite="mid:98dc796e-bb14-435e-8c19-53e5de60cc43@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/* Put any references on the single 4K page referenced by mfn. */
+static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
+{
+    /* TODO: Handle other p2m types */
+
+    if ( p2m_is_foreign(type) )
+    {
+        ASSERT(mfn_valid(mfn));
+        p2m_put_foreign_page(mfn_to_page(mfn));
+    }
+
+    /*
+     * Detect the xenheap page and mark the stored GFN as invalid.
+     * We don't free the underlying page until the guest requested to do so.
+     * So we only need to tell the page is not mapped anymore in the P2M by
+     * marking the stored GFN as invalid.
+     */
+    if ( p2m_is_ram(type) &amp;&amp; is_xen_heap_mfn(mfn) )
+        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Isn't this for grants? p2m_is_ram() doesn't cover p2m_grant_map_*.</pre>
    </blockquote>
    <pre>p2m_is_ram() looks really unnecessary here. I'm thinking if it could be useful
to store for RAM types GFNs too to have something like M2P.
</pre>
    <blockquote type="cite"
      cite="mid:98dc796e-bb14-435e-8c19-53e5de60cc43@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+/* Put any references on the superpage referenced by mfn. */
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">In p2m_put_4k_page() you check the type, whereas here you don't.</pre>
    </blockquote>
    <pre>Missed to add that:
      if ( !p2m_is_foreign(type) )
        return;

</pre>
    <blockquote type="cite"
      cite="mid:98dc796e-bb14-435e-8c19-53e5de60cc43@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/* Put any references on the page referenced by pte. */
+static void p2m_put_page(const pte_t pte, unsigned int level)
+{
+    mfn_t mfn = pte_get_mfn(pte);
+    p2m_type_t p2m_type = p2m_get_type(pte);
+
+    ASSERT(pte_is_valid(pte));
+
+    /*
+     * TODO: Currently we don't handle level 2 super-page, Xen is not
+     * preemptible and therefore some work is needed to handle such
+     * superpages, for which at some point Xen might end up freeing memory
+     * and therefore for such a big mapping it could end up in a very long
+     * operation.
+     */
+    switch ( level )
+    {
+    case 1:
+        return p2m_put_2m_superpage(mfn, p2m_type);
+
+    case 0:
+        return p2m_put_4k_page(mfn, p2m_type);
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Yet despite the comment not even an assertion for level 2 and up?</pre>
    </blockquote>
    <pre>Not sure that an ASSERT() is needed here as a reference(s) for such page(s)
will be put during domain_relinquish_resources() as there we could do preemption.
Something like Arm does here:
  <a class="moz-txt-link-freetext"
href="https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c?ref_type=heads#L1587">https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c?ref_type=heads#L1587</a>

I'm thinking that probably it makes sense to put only 4k page(s) and
all other cases postpone until domain_relinquish_resources() is called.

</pre>
    <blockquote type="cite"
      cite="mid:98dc796e-bb14-435e-8c19-53e5de60cc43@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> /* Free pte sub-tree behind an entry */
 static void p2m_free_subtree(struct p2m_domain *p2m,
                              pte_t entry, unsigned int level)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    unsigned int i;
+    pte_t *table;
+    mfn_t mfn;
+    struct page_info *pg;
+
+    /* Nothing to do if the entry is invalid. */
+    if ( !pte_is_valid(entry) )
+        return;
+
+    if ( pte_is_superpage(entry, level) || (level == 0) )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Perhaps swap the two conditions around?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    {
+#ifdef CONFIG_IOREQ_SERVER
+        /*
+         * If this gets called then either the entry was replaced by an entry
+         * with a different base (valid case) or the shattering of a superpage
+         * has failed (error case).
+         * So, at worst, the spurious mapcache invalidation might be sent.
+         */
+        if ( p2m_is_ram(p2m_get_type(p2m, entry)) &amp;&amp;
+             domain_has_ioreq_server(p2m-&gt;domain) )
+            ioreq_request_mapcache_invalidate(p2m-&gt;domain);
+#endif
+
+        p2m_put_page(entry, level);
+
+        return;
+    }
+
+    table = map_domain_page(pte_get_mfn(entry));
+    for ( i = 0; i &lt; XEN_PT_ENTRIES; i++ )
+        p2m_free_subtree(p2m, table[i], level - 1);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">In p2m_put_page() you comment towards concerns for level &gt;= 2; no similar
concerns for the resulting recursion here?</pre>
    </blockquote>
    <pre>This function is generic enough to handle any level.

Except that it is possible that it will be needed, for example, to split 1G mapping
into something smaller then p2m_free_subtree() could be called for freeing a subtree
of 1gb mapping.

</pre>
    <blockquote type="cite"
      cite="mid:98dc796e-bb14-435e-8c19-53e5de60cc43@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    unmap_domain_page(table);
+
+    /*
+     * Make sure all the references in the TLB have been removed before
+     * freing the intermediate page table.
+     * XXX: Should we defer the free of the page table to avoid the
+     * flush?
+     */
+    p2m_tlb_flush_sync(p2m);
+
+    mfn = pte_get_mfn(entry);
+    ASSERT(mfn_valid(mfn));
+
+    pg = mfn_to_page(mfn);
+
+    page_list_del(pg, &amp;p2m-&gt;pages);
+    p2m_free_page(p2m, pg);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Once again I wonder whether this code path was actually tested: p2m_free_page()
also invokes page_list_del(), and double deletions typically won't end very
well.</pre>
    </blockquote>
    <pre>Agree, it should be dropped here and left only in p2m_free_page().

It should be tested, I have a test case where I'm chaning MFN so this one should be called:
+    /*
+     * Free the entry only if the original pte was valid and the base
+     * is different (to avoid freeing when permission is changed).
+     */
+    if ( pte_is_valid(orig_pte) &amp;&amp;
+         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
+        p2m_free_subtree(p2m, orig_pte, level);

I will double check.

But I think I was lucky because I've tested only the whole patch series and in one of a
further patches page_list_del(pg, &amp;p2m-&gt;pages) is dropped.

~ Oleksii</pre>
  </body>
</html>

--------------vYx2KQ1Dkw3zffA1AKgYiN5b--

