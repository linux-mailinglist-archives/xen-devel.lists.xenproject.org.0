Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCFFBB1329
	for <lists+xen-devel@lfdr.de>; Wed, 01 Oct 2025 18:00:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134933.1472431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3zFY-0001m5-0c; Wed, 01 Oct 2025 16:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134933.1472431; Wed, 01 Oct 2025 16:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3zFX-0001jf-Ty; Wed, 01 Oct 2025 16:00:15 +0000
Received: by outflank-mailman (input) for mailman id 1134933;
 Wed, 01 Oct 2025 16:00:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y+Zy=4K=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v3zFW-0001jZ-1W
 for xen-devel@lists.xenproject.org; Wed, 01 Oct 2025 16:00:14 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5a99393-9edf-11f0-9809-7dc792cee155;
 Wed, 01 Oct 2025 18:00:11 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-63667e8069aso82553a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Oct 2025 09:00:11 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4847e3ff48sm21472266b.11.2025.10.01.09.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 09:00:09 -0700 (PDT)
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
X-Inumbo-ID: b5a99393-9edf-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759334410; x=1759939210; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrGO518AIO8kLmdVlaQSVxC6u+6nohA0wtzY60NXNmw=;
        b=G60JeW5d2Hz56mFzWHkj4VL7NhrrEkRwwpXaTpWdj7hsyV5+DEgfLhXJ3VQ4rdC5Re
         ZtfUlrzecl4yypundCNL/SN5cmi13WkavZxSNQ1KTuJdtA877EzGnObDpz3gLXmwPVvg
         1y4DrQhfJLOXntEhhsJBUl2XFaDkpBLgkdxlTDvBSADnLnhEkaBOW2jrZ6lDvkj+ezHH
         FaTOysP6QawsaixKWQJLSh0TLY77KAEu7TRzyG4ETv8jn5mNodJFpPyAAAEqWkh2KNHI
         GIMRw96bb8xRmoeYP6QTDNn9Gl6tdS9+PrpDipbYqe3mTowQ4riGY2wPC85xmv9/NuTd
         2i7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759334410; x=1759939210;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QrGO518AIO8kLmdVlaQSVxC6u+6nohA0wtzY60NXNmw=;
        b=DFU1HPn9LMjUwOJMP3vo+Vo5dfe3amHCrUmjQ2bN560FAtQEEdWrOuk6ibxutOaeXP
         wOjXko7P1s4ooxq4KB3wBeZZ8t5qN1PLyISlMLW1ORdSiSnVVncvbsADLMV/peilm+dG
         tkdfYzFj3GF005mk556VMCZHQ4Ra4HKf01Cgnsdi8uDqHtsl4T9LqS3lubS1c24J6c2S
         L9wUljs5cbb6iPes3NXjJBTs5xElKH2K9FvnTm5z1yQlRXnkzLJi6ypyjoI7t0FJixTj
         +UPWHDKqAg799Dup8NsY389Q8YI0wV0kt7rUMhuh3b/AqHqg3hn6K+2JqDLXX8tBmpzd
         7SmA==
X-Forwarded-Encrypted: i=1; AJvYcCWFWJ5CNh66CF0MMcN+9lgMxaG4x02j+9kq/K0Ya3K09OfVu8pB+GA8360x7zBogJ4Icn2tSfNCW04=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPfOPDNvh0akua9GccrETrgdmNUW6WPsdG7dUXfT/i2hvDbroX
	yhQ1+s4GQAJs0AMlNZCFU/858IfsC0C5rZITIc/SfR/Jl4gzS9RWmBc/
X-Gm-Gg: ASbGncvbqt7dVGL0YXQ3BnxjJp3LY+QX+PJeIIE+kWoFidvwOJlbn5zYflyapLiF8Ku
	omDiMsvutd+nFWSOPLt0X8fl3cLYAynjKUTLvNUKT46v1m2KJmURzNziKL7KCDy2BTFDNBfM8hz
	AA0mDtXwhVtngd/8So9DdCAysG8Tbda5GXCWC9QLoHVbJ5bB6N8VKrTf+Og9Wa5jjrz5YTbnmrv
	6a0xIauBPq62Nx8PWPSSMjejzUQ0OtcXdM+2BiJIXZdOz4mbBiEF8pEBtQ2KQvdIhKi5YG8FV6d
	Xs4S4+9LE9DPfPhBxr9CXSjdDG5jndJN/Ygc8FmJJhvENZiYEz8XN2GxBiJrHdwgB9jSowsKKr8
	1YZ+5st5YV6Ou1IIgUBXDypVV/EyWiVJifjSGskQTNnqfjcJ8XxDSkFFuG4SPjW4yKj+naPndIu
	MFxdJW5mbjvLUqyUR8ukhqFH8u
X-Google-Smtp-Source: AGHT+IH+fdRfcBCukzIsGk399FOjXEq0KhGtbIBIP5/3pvuj0TH43P/3Sjqc74tqdIAD2Ie5RM8C3g==
X-Received: by 2002:a17:907:720a:b0:b24:3412:7cfe with SMTP id a640c23a62f3a-b46ea41438amr498584166b.63.1759334410144;
        Wed, 01 Oct 2025 09:00:10 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------U0qwSMVDpHxIxb8hFquya0WM"
Message-ID: <5142b7c4-ab2e-4f73-a60d-3d23fe255ca7@gmail.com>
Date: Wed, 1 Oct 2025 18:00:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/18] xen/riscv: introduce metadata table to store P2M
 type
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <f1e346b228ea76eb5bd988e8aab0062cbea58c9d.1758145428.git.oleksii.kurochko@gmail.com>
 <4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com>

This is a multi-part message in MIME format.
--------------U0qwSMVDpHxIxb8hFquya0WM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/23/25 12:41 AM, Jan Beulich wrote:
> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>
>> +/*
>> + * `pte` – PTE entry for which the type `t` will be stored.
>> + *
>> + * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided;
>> + * otherwise, they may be NULL.
>> + */
>> +static void p2m_set_type(pte_t *pte, const p2m_type_t t,
>> +                         struct p2m_pte_ctx *ctx,
>> +                         struct p2m_domain *p2m)
>>   {
>> -    int rc = 0;
>> +    /*
>> +    * For the root page table (16 KB in size), we need to select the correct
>> +    * metadata table, since allocations are 4 KB each. In total, there are
>> +    * 4 tables of 4 KB each.
>> +    * For none-root page table index of ->pt_page[] will be always 0 as
>> +    * index won't be higher then 511. ASSERT() below verifies that.
>> +    */
>> +    struct page_info **md_pg =
>> +        &ctx->pt_page[ctx->index / PAGETABLE_ENTRIES].v.md.metadata;
>> +    pte_t *metadata = NULL;
>> +
>> +     /* Be sure that an index correspondent to page level is passed. */
>> +    ASSERT(ctx->index <= P2M_PAGETABLE_ENTRIES(ctx->level));
> Doesn't this need to be < ?

Yeah, it should be <.

>
>> +    if ( !*md_pg && (t >= p2m_first_external) )
>> +    {
>> +        /*
>> +         * Ensure that when `t` is stored outside the PTE bits
>> +         * (i.e. `t == p2m_ext_storage` or higher),
>> +         * both `ctx` and `p2m` are provided.
>> +         */
>> +        ASSERT(p2m && ctx);
> Imo this would want to be checked whenever t > p2m_first_external, no
> matter whether a metadata page was already allocated.

I think that|ctx| should be checked before this|if| condition, since it is
used to obtain the proper metadata page.

The check for|p2m| can remain inside the|if| condition, as it is essentially
only needed for allocating a metadata page.

>
>> -    if ( t > p2m_first_external )
>> -        panic("unimplemeted\n");
>> -    else
>> +        if ( ctx->level <= P2M_SUPPORTED_LEVEL_MAPPING )
>> +        {
>> +            struct domain *d = p2m->domain;
>> +
>> +            *md_pg = p2m_alloc_table(p2m);
>> +            if ( !*md_pg )
>> +            {
>> +                printk("%s: can't allocate extra memory for dom%d\n",
>> +                        __func__, d->domain_id);
>> +                domain_crash(d);
>> +            }
>> +        }
>> +        else
>> +            /*
>> +             * It is not legal to set a type for an entry which shouldn't
>> +             * be mapped.
>> +             */
>> +            ASSERT_UNREACHABLE();
> Something not being legal doesn't mean it can't happen. Imo in this case
> BUG_ON() (in place of the if() above) would be better.
>
>> +    }
>> +
>> +    if ( *md_pg )
>> +        metadata = __map_domain_page(*md_pg);
>> +
>> +    if ( t < p2m_first_external )
>> +    {
>>           pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>   
>> -    return rc;
>> +        if ( metadata )
>> +            metadata[ctx->index].pte = p2m_invalid;
>> +    }
>> +    else
>> +    {
>> +        pte->pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
>> +
>> +        metadata[ctx->index].pte = t;
> Afaict metadata can still be NULL when you get here.

It shouldn't be, because when this line is executed, the metadata page already
exists or was allocated at the start of p2m_set_type().

>
>> +    }
>> +
>> +    if ( metadata )
>> +        unmap_domain_page(metadata);
> According to the x86 implementation, passing NULL here ought to be fine,
> so no if() needed.

With the current one implementation for RISC-V (CONFIG_ARCH_MAP_DOMAIN_PAGE=n so
unmap_domain_page() does nothing), it is fine too.

>
>>   }
>>   
>> -static p2m_type_t p2m_get_type(const pte_t pte)
>> +/*
>> + * `pte` -> PTE entry that stores the PTE's type.
>> + *
>> + * If the PTE's type is `p2m_ext_storage`, `ctx` should be provided;
>> + * otherwise it could be NULL.
>> + */
>> +static p2m_type_t p2m_get_type(const pte_t pte, const struct p2m_pte_ctx *ctx)
>>   {
>>       p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
>>   
>>       if ( type == p2m_ext_storage )
>> -        panic("unimplemented\n");
>> +    {
>> +        pte_t *md = __map_domain_page(ctx->pt_page->v.md.metadata);
> Pointer-to-const?
>
>> +        type = md[ctx->index].pte;
>> +        unmap_domain_page(ctx->pt_page->v.md.metadata);
> I'm pretty sure you want to pass md here, not the pointer you passed
> into __map_domain_page().

Oh, right. It should be `md`.

>
>> @@ -381,7 +465,10 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
>>       }
>>   }
>>   
>> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>> +static pte_t p2m_pte_from_mfn(const mfn_t mfn, const p2m_type_t t,
>> +                              struct p2m_pte_ctx *p2m_pte_ctx,
>> +                              const bool is_table,
> Do you really need both "is_table" and the context pointer? Couldn't
> the "is intermediate page table" case be identified by a NULL context
> and/or p2m pointer?

Good point. I will drop is_table.

>
> Also why "const" all of the sudden?

Because nothing of that is going to be changed in p2m_pte_from_mfn(). To have
diff clearer, I can revert these changes.

>
>> @@ -435,22 +527,47 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
>>       return pg;
>>   }
>>   
>> + * Link this metadata page to page table page's list field.
>> + */
>> +static struct page_info *p2m_alloc_table(struct p2m_domain *p2m)
>> +{
>> +    struct page_info *page_tbl = p2m_alloc_page(p2m);
>> +
>> +    if ( !page_tbl )
>> +        return NULL;
>> +
>> +    clear_and_clean_page(page_tbl, p2m->clean_dcache);
>> +
>> +    return page_tbl;
>> +}
> ... the function is needed in the first place.

On one hand, it may not seem strictly necessary, but on the
other hand, without it we would need to repeat the pattern of
allocating, clearing, and cleaning a page each time a page table
is allocated. At the moment, I prefer to keep it.
But considering another your comment below ...

>
>> +/*
>> + * Free page table's page and metadata page linked to page table's page.
>> + */
>> +static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
>> +{
>> +    ASSERT(tbl_pg->v.md.metadata);
> Why, when you no longer unconditionally alloc that page?

Agree, there is no need for this ASSERT() as "lazy allocation" is used for
metadata.

>>   static int p2m_create_table(struct p2m_domain *p2m, pte_t *entry)
>>   {
>> -    struct page_info *page;
>> +    struct page_info *page = p2m_alloc_table(p2m);
>>   
>>       ASSERT(!pte_is_valid(*entry));
>>   
>> -    page = p2m_alloc_page(p2m);
>> -    if ( page == NULL )
>> -        return -ENOMEM;
>> -
>> -    clear_and_clean_page(page, p2m->clean_dcache);
>> -
>>       p2m_write_pte(entry, page_to_p2m_table(page), p2m->clean_dcache);
>>   
>>       return 0;
> As per above I don't think any change is needed here.

There are some places in the code where it isn’t necessary to immediately
write the address of a newly allocated page table page into a PTE:
- During superpage splitting: a new page is first allocated for the new
   page table, then it is filled, and only afterwards is the PTE updated
   with the new page table address.
- In p2m_set_type(): when a table is allocated for storing metadata
   (although I think p2m_alloc_page() would work fine here as well),
   there is no need to update any PTE correspondingly.

...
So, I think I can agree that p2m_alloc_table() isn’t really needed.
It should be sufficient to move the clear_and_clean_page(page_tbl, p2m->clean_dcache)
call from p2m_alloc_table() into p2m_alloc_page(), and then just use
p2m_alloc_page() everywhere.

Does the last paragraph make sense?

>> @@ -707,6 +834,22 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>>           pte = *entry;
>>           pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
>>   
>> +        if ( MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
>> +        {
>> +            struct p2m_pte_ctx p2m_pte_ctx = {
>> +                .pt_page = tbl_pg,
>> +                .index = offsets[level],
>> +            };
> Assuming using "level" is correct here (which it looks like it is), ...
>
>> +            p2m_type_t old_type = p2m_get_type(pte, &p2m_pte_ctx);
> ... can't this move ahead of the loop?

Considering that old_type is expected to be the same for all new PTEs, I think
we can move that ahead of the loop. I'll do that.

>
>> +            p2m_pte_ctx.pt_page = page;
>> +            p2m_pte_ctx.index = i;
>> +            p2m_pte_ctx.level = level;
> Whereas - doesn't this need to be "next_level"?

Yes, it should be next_level.

>
>> @@ -718,7 +861,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>>        */
>>       if ( next_level != target )
>>           rv = p2m_split_superpage(p2m, table + offsets[next_level],
>> -                                 level - 1, target, offsets);
>> +                                 level - 1, target, offsets, page);
> And btw (alredy in the earlier patch introducing this code) - why isn't
> it "next_level" here, instead of "level - 1" (if already you have that
> variable)?

Missed to update that part. It should next_level used instead of level - 1.

>
>> @@ -812,13 +955,21 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>       {
>>           /* We need to split the original page. */
>>           pte_t split_pte = *entry;
>> +        struct page_info *tbl_pg = virt_to_page(table);
> This isn't valid on a pointer obtained from map_domain_page().

Oh, sure — virt_to_page() and page_to_virt() should be used only for Xen
heap addresses.

By the way, do we have any documentation, comments, or notes describing
what should be allocated and from where?

Since map_domain_page() returns an address from the direct map region,
should we instead use maddr_to_page(virt_to_maddr(table))?

Thanks for review.

~ Oleksii

--------------U0qwSMVDpHxIxb8hFquya0WM
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
    <div class="moz-cite-prefix">On 9/23/25 12:41 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.09.2025 23:55, Oleksii Kurochko wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * `pte` – PTE entry for which the type `t` will be stored.
+ *
+ * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided;
+ * otherwise, they may be NULL.
+ */
+static void p2m_set_type(pte_t *pte, const p2m_type_t t,
+                         struct p2m_pte_ctx *ctx,
+                         struct p2m_domain *p2m)
 {
-    int rc = 0;
+    /*
+    * For the root page table (16 KB in size), we need to select the correct
+    * metadata table, since allocations are 4 KB each. In total, there are
+    * 4 tables of 4 KB each.
+    * For none-root page table index of -&gt;pt_page[] will be always 0 as
+    * index won't be higher then 511. ASSERT() below verifies that.
+    */
+    struct page_info **md_pg =
+        &amp;ctx-&gt;pt_page[ctx-&gt;index / PAGETABLE_ENTRIES].v.md.metadata;
+    pte_t *metadata = NULL;
+
+     /* Be sure that an index correspondent to page level is passed. */
+    ASSERT(ctx-&gt;index &lt;= P2M_PAGETABLE_ENTRIES(ctx-&gt;level));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Doesn't this need to be &lt; ?</pre>
    </blockquote>
    <pre>Yeah, it should be &lt;. 

</pre>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( !*md_pg &amp;&amp; (t &gt;= p2m_first_external) )
+    {
+        /*
+         * Ensure that when `t` is stored outside the PTE bits
+         * (i.e. `t == p2m_ext_storage` or higher),
+         * both `ctx` and `p2m` are provided.
+         */
+        ASSERT(p2m &amp;&amp; ctx);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Imo this would want to be checked whenever t &gt; p2m_first_external, no
matter whether a metadata page was already allocated.</pre>
    </blockquote>
    <pre data-start="56" data-end="178">I think that <code
    data-start="72" data-end="77">ctx</code> should be checked before this <code
    data-start="108" data-end="112">if</code> condition, since it is
used to obtain the proper metadata page.</pre>
    <pre data-start="180" data-end="307">The check for <code
    data-start="194" data-end="199">p2m</code> can remain inside the <code
    data-start="222" data-end="226">if</code> condition, as it is essentially
only needed for allocating a metadata page.

</pre>
    <pre></pre>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-    if ( t &gt; p2m_first_external )
-        panic("unimplemeted\n");
-    else
+        if ( ctx-&gt;level &lt;= P2M_SUPPORTED_LEVEL_MAPPING )
+        {
+            struct domain *d = p2m-&gt;domain;
+
+            *md_pg = p2m_alloc_table(p2m);
+            if ( !*md_pg )
+            {
+                printk("%s: can't allocate extra memory for dom%d\n",
+                        __func__, d-&gt;domain_id);
+                domain_crash(d);
+            }
+        }
+        else
+            /*
+             * It is not legal to set a type for an entry which shouldn't
+             * be mapped.
+             */
+            ASSERT_UNREACHABLE();
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Something not being legal doesn't mean it can't happen. Imo in this case
BUG_ON() (in place of the if() above) would be better.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    }
+
+    if ( *md_pg )
+        metadata = __map_domain_page(*md_pg);
+
+    if ( t &lt; p2m_first_external )
+    {
         pte-&gt;pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
 
-    return rc;
+        if ( metadata )
+            metadata[ctx-&gt;index].pte = p2m_invalid;
+    }
+    else
+    {
+        pte-&gt;pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
+
+        metadata[ctx-&gt;index].pte = t;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Afaict metadata can still be NULL when you get here.</pre>
    </blockquote>
    <pre>It shouldn't be, because when this line is executed, the metadata page already
exists or was allocated at the start of p2m_set_type().
</pre>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    }
+
+    if ( metadata )
+        unmap_domain_page(metadata);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
According to the x86 implementation, passing NULL here ought to be fine,
so no if() needed.</pre>
    </blockquote>
    <pre>With the current one implementation for RISC-V (CONFIG_ARCH_MAP_DOMAIN_PAGE=n so
unmap_domain_page() does nothing), it is fine too.

</pre>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> }
 
-static p2m_type_t p2m_get_type(const pte_t pte)
+/*
+ * `pte` -&gt; PTE entry that stores the PTE's type.
+ *
+ * If the PTE's type is `p2m_ext_storage`, `ctx` should be provided;
+ * otherwise it could be NULL.
+ */
+static p2m_type_t p2m_get_type(const pte_t pte, const struct p2m_pte_ctx *ctx)
 {
     p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
 
     if ( type == p2m_ext_storage )
-        panic("unimplemented\n");
+    {
+        pte_t *md = __map_domain_page(ctx-&gt;pt_page-&gt;v.md.metadata);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Pointer-to-const?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        type = md[ctx-&gt;index].pte;
+        unmap_domain_page(ctx-&gt;pt_page-&gt;v.md.metadata);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm pretty sure you want to pass md here, not the pointer you passed
into __map_domain_page().</pre>
    </blockquote>
    <pre>Oh, right. It should be `md`.

</pre>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -381,7 +465,10 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
     }
 }
 
-static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
+static pte_t p2m_pte_from_mfn(const mfn_t mfn, const p2m_type_t t,
+                              struct p2m_pte_ctx *p2m_pte_ctx,
+                              const bool is_table,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Do you really need both "is_table" and the context pointer? Couldn't
the "is intermediate page table" case be identified by a NULL context
and/or p2m pointer?</pre>
    </blockquote>
    <pre>Good point. I will drop is_table.

</pre>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">

Also why "const" all of the sudden?</pre>
    </blockquote>
    <pre>Because nothing of that is going to be changed in p2m_pte_from_mfn(). To have
diff clearer, I can revert these changes.

</pre>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -435,22 +527,47 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
     return pg;
 }
 </pre>
      </blockquote>
    </blockquote>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * Link this metadata page to page table page's list field.
+ */
+static struct page_info *p2m_alloc_table(struct p2m_domain *p2m)
+{
+    struct page_info *page_tbl = p2m_alloc_page(p2m);
+
+    if ( !page_tbl )
+        return NULL;
+
+    clear_and_clean_page(page_tbl, p2m-&gt;clean_dcache);
+
+    return page_tbl;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... the function is needed in the first place.</pre>
    </blockquote>
    <pre>On one hand, it may not seem strictly necessary, but on the
other hand, without it we would need to repeat the pattern of
allocating, clearing, and cleaning a page each time a page table
is allocated. At the moment, I prefer to keep it.
But considering another your comment below ...
</pre>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * Free page table's page and metadata page linked to page table's page.
+ */
+static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
+{
+    ASSERT(tbl_pg-&gt;v.md.metadata);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why, when you no longer unconditionally alloc that page?</pre>
    </blockquote>
    <pre>Agree, there is no need for this ASSERT() as "lazy allocation" is used for
metadata.

</pre>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> static int p2m_create_table(struct p2m_domain *p2m, pte_t *entry)
 {
-    struct page_info *page;
+    struct page_info *page = p2m_alloc_table(p2m);
 
     ASSERT(!pte_is_valid(*entry));
 
-    page = p2m_alloc_page(p2m);
-    if ( page == NULL )
-        return -ENOMEM;
-
-    clear_and_clean_page(page, p2m-&gt;clean_dcache);
-
     p2m_write_pte(entry, page_to_p2m_table(page), p2m-&gt;clean_dcache);
 
     return 0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As per above I don't think any change is needed here.</pre>
    </blockquote>
    <pre>There are some places in the code where it isn’t necessary to immediately
write the address of a newly allocated page table page into a PTE:
- During superpage splitting: a new page is first allocated for the new
  page table, then it is filled, and only afterwards is the PTE updated
  with the new page table address.
- In p2m_set_type(): when a table is allocated for storing metadata
  (although I think p2m_alloc_page() would work fine here as well),
  there is no need to update any PTE correspondingly.

...
So, I think I can agree that p2m_alloc_table() isn’t really needed.
It should be sufficient to move the clear_and_clean_page(page_tbl, p2m-&gt;clean_dcache)
call from p2m_alloc_table() into p2m_alloc_page(), and then just use
p2m_alloc_page() everywhere.

Does the last paragraph make sense?

</pre>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -707,6 +834,22 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
         pte = *entry;
         pte_set_mfn(&amp;pte, mfn_add(mfn, i &lt;&lt; level_order));
 
+        if ( MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
+        {
+            struct p2m_pte_ctx p2m_pte_ctx = {
+                .pt_page = tbl_pg,
+                .index = offsets[level],
+            };
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Assuming using "level" is correct here (which it looks like it is), ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            p2m_type_t old_type = p2m_get_type(pte, &amp;p2m_pte_ctx);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... can't this move ahead of the loop?</pre>
    </blockquote>
    <pre>Considering that old_type is expected to be the same for all new PTEs, I think
we can move that ahead of the loop. I'll do that.

</pre>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            p2m_pte_ctx.pt_page = page;
+            p2m_pte_ctx.index = i;
+            p2m_pte_ctx.level = level;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Whereas - doesn't this need to be "next_level"?</pre>
    </blockquote>
    <pre>Yes, it should be next_level.

</pre>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -718,7 +861,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
      */
     if ( next_level != target )
         rv = p2m_split_superpage(p2m, table + offsets[next_level],
-                                 level - 1, target, offsets);
+                                 level - 1, target, offsets, page);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And btw (alredy in the earlier patch introducing this code) - why isn't
it "next_level" here, instead of "level - 1" (if already you have that
variable)?</pre>
    </blockquote>
    <pre>Missed to update that part. It should next_level used instead of level - 1.

</pre>
    <blockquote type="cite"
      cite="mid:4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -812,13 +955,21 @@ static int p2m_set_entry(struct p2m_domain *p2m,
     {
         /* We need to split the original page. */
         pte_t split_pte = *entry;
+        struct page_info *tbl_pg = virt_to_page(table);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This isn't valid on a pointer obtained from map_domain_page().</pre>
    </blockquote>
    <pre>Oh, sure — virt_to_page() and page_to_virt() should be used only for Xen
heap addresses.

By the way, do we have any documentation, comments, or notes describing
what should be allocated and from where?

Since map_domain_page() returns an address from the direct map region,
should we instead use maddr_to_page(virt_to_maddr(table))?

Thanks for review.

~ Oleksii
</pre>
  </body>
</html>

--------------U0qwSMVDpHxIxb8hFquya0WM--

