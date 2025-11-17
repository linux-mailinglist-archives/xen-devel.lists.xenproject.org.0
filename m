Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAF9C6606D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 20:52:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164246.1491248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL5GT-0001u0-U3; Mon, 17 Nov 2025 19:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164246.1491248; Mon, 17 Nov 2025 19:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL5GT-0001r2-R2; Mon, 17 Nov 2025 19:51:53 +0000
Received: by outflank-mailman (input) for mailman id 1164246;
 Mon, 17 Nov 2025 19:51:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lv5t=5Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vL5GS-0001qv-4t
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 19:51:52 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daa3ca6e-c3ee-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 20:51:48 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-644f90587e5so731139a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 11:51:48 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d82cfsm10807522a12.2.2025.11.17.11.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 11:51:47 -0800 (PST)
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
X-Inumbo-ID: daa3ca6e-c3ee-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763409108; x=1764013908; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjoGkDvae6RfLSbYL4XeH5Br+4Cwl/SnfmCZQAV9ESs=;
        b=TG/7k18x/86Q9sH1XbKydkHG3QGgzHoVHJ64EkdmkQdncfJrhqyhBd2ZdB5mhsuydV
         XuPV7RsVNgdRaG19cU1l+ZFOmReIr8qlOCVZ++8wHySd1zzsexqGLSJc/Ee9dE0Pj4YD
         zY3+5aew6j5kqPl3gV2+DzfF17OT0QvrO1kRQX8RyKs5jz49qEPNwnj5EGZTGkQqYixR
         QMrwvrBG5jQwe8Eh2W7pQrOMIkSK3WqFzGwCVKtb/mBCvF6O4jydmeVIruweVGwsTnp6
         Yk3A6hgu2dChfDQAVuC5biI27Y5b+NaMbVF9ZqkzFbPJaqXn+8jGBk5jT0u9pu0NKIFt
         nWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763409108; x=1764013908;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PjoGkDvae6RfLSbYL4XeH5Br+4Cwl/SnfmCZQAV9ESs=;
        b=PALhI8/IzxgvmPus3uSARw+Pcz9ObKCHiT75HBMnHYrWBk/rcuvTfBuFpCnshNIP/E
         I1Md8nc5bJ2fnteT20q1veQ1HqYxaHM+sTn4xlaXv9n9vhWwZdvuhmNLLUy+wr2A4m6M
         NVvunqF9i0DUjr9wYQclPZrPwjOy7ErcTqKZjzYVdZ2JsYupyo4GBvE9dmQ5W8ZBpen9
         KBNrXixqYlyHlQyTdQBA4K+cEzQA8TTLOSmamA77TkitneRweFg3p5lAwGnAdpT7shQo
         NzAmm8VEMdK+322EM1z+A3JTpC88kE66GMijzSZxCpw404PubQ0mTAOj+ynAwR6qUldC
         mEgg==
X-Forwarded-Encrypted: i=1; AJvYcCXFm0eOLUSFocvK4WqALIWOJpbgt90UMYW4nHoKCuEPC4U2ZVFdeG/OcqUMe2CHwMkzGAxCyGVRSmo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2OBm/PJZS/ZLhbhJ7y5Nmx2qVss8KI/U1bNcnal89+nnXBpe6
	K0ZCAMfOrTFMkD/m6oWVx7/Uhf60JwME6nhBiVlIsoTXSj50P7v5a3J3
X-Gm-Gg: ASbGncufgdTe9qkNAm206D9Z9+c0pUQlIsoRMyf+WwV2khyetG6Mp4I4EGBOe9d8P8A
	RWXpd0u71x+byHwKiVhMcSztigKDZR9RmJ6HwLFJlDv948sNabjcF0FCzszh1gCVkQiaaiy9Vb0
	0aZC06Uj/qStGUwRFpdQJGxxVsksJXBK1p0qIFBigiWoUThjSDyYC5ck0TAiBCeQH/TGJi8rMdK
	SbR9Uc91PLMA5HobXqRKNLqLqqZLr9Qi764fS48EZssMpWM+3EaXvRGX8DGK2o5/kpBaAEiWnhu
	hbxpHzUiC4B3qoicwQhgOSnmP3Ctttd0KC4+UBVgJy7UdMtw/J4KMN/sD3IhhZgg123Uc+I6XwM
	ZEsjxJh+f+8kF15IyPwYoqz5nz5Z2DgYk9BNHkPm6od3FBjWOhwua7U0Q9q4pwPhc9Zm9WRkx08
	rtjSGEQjgdasSeoAL03wcNFcj20cufzKk461cKbUGwVhVNZNG4NPmuWO1z+aax8LPDarJl01O+d
	0lEZvg4Wg==
X-Google-Smtp-Source: AGHT+IHF8wMRa1UM63jYdJZADy/11qgzMVsOdyDMNnUU7JgH6+KWrwGeye5zeELI7Yahh/EiougV8Q==
X-Received: by 2002:a05:6402:510f:b0:640:464a:56ce with SMTP id 4fb4d7f45d1cf-64350e0ef8bmr13154256a12.2.1763409107819;
        Mon, 17 Nov 2025 11:51:47 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------93UWKmCx80UaqdW07reU00oC"
Message-ID: <5d4ec4d9-b4c1-4365-a343-f42b390da165@gmail.com>
Date: Mon, 17 Nov 2025 20:51:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 18/18] xen/riscv: introduce metadata table to store
 P2M type
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <d291d2efe7dcc6ddd3d16677a81c57d755c7ada2.1760974017.git.oleksii.kurochko@gmail.com>
 <6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com>

This is a multi-part message in MIME format.
--------------93UWKmCx80UaqdW07reU00oC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/12/25 12:49 PM, Jan Beulich wrote:
> On 20.10.2025 17:58, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -20,6 +20,16 @@
>>   
>>   #define P2M_SUPPORTED_LEVEL_MAPPING 2
>>   
>> +/*
>> + * P2M PTE context is used only when a PTE's P2M type is p2m_ext_storage.
>> + * In this case, the P2M type is stored separately in the metadata page.
>> + */
>> +struct p2m_pte_ctx {
>> +    struct page_info *pt_page;   /* Page table page containing the PTE. */
>> +    unsigned int index;          /* Index of the PTE within that page. */
>> +    unsigned int level;          /* Paging level at which the PTE resides. */
>> +};
>> +
>>   unsigned char __ro_after_init gstage_mode;
>>   unsigned int __ro_after_init gstage_root_level;
>>   
>> @@ -363,24 +373,89 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
>>       return pg;
>>   }
>>   
>> -static int p2m_set_type(pte_t *pte, p2m_type_t t)
>> +/*
>> + * `pte` – PTE entry for which the type `t` will be stored.
>> + *
>> + * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided;
>> + * otherwise, only p2m may be NULL.
>> + */
>> +static void p2m_set_type(pte_t *pte, const p2m_type_t t,
>> +                         struct p2m_pte_ctx *ctx,
>> +                         struct p2m_domain *p2m)
>>   {
>> -    int rc = 0;
>> +    struct page_info **md_pg;
>> +    pte_t *metadata = NULL;
> I'm not convinced it is a good idea to re-use pte_t for this purpose. If you used
> a separate type, and if then you defined that as a bitfield with only a few bits
> dedicated to type, future changes (additions) may be quite a bit easier.

Make sense, then lets go with the following structure:
   struct md_t {
       /*
        * Describes a type stored outside the PTE.
        * Look at the comment above definition of enum p2m_type_t.
        */
       p2m_type_t type : 4;
   };

>
>> -    if ( t > p2m_first_external )
>> -        panic("unimplemeted\n");
>> -    else
>> +    ASSERT(p2m);
>> +
>> +     /* Be sure that an index correspondent to page level is passed. */
>> +    ASSERT(ctx && ctx->index < P2M_PAGETABLE_ENTRIES(ctx->level));
>> +
>> +    /*
>> +     * For the root page table (16 KB in size), we need to select the correct
>> +     * metadata table, since allocations are 4 KB each. In total, there are
>> +     * 4 tables of 4 KB each.
>> +     * For none-root page table index of ->pt_page[] will be always 0 as
>> +     * index won't be higher then 511. ASSERT() above verifies that.
>> +     */
>> +    md_pg = &ctx->pt_page[ctx->index / PAGETABLE_ENTRIES].v.md.pg;
>> +
>> +    if ( !*md_pg && (t >= p2m_first_external) )
>> +    {
>> +        BUG_ON(ctx->level > P2M_SUPPORTED_LEVEL_MAPPING);
>> +
>> +        if ( ctx->level <= P2M_SUPPORTED_LEVEL_MAPPING )
>> +        {
>> +            struct domain *d = p2m->domain;
> This is (if at all) needed only ...
>
>> +            *md_pg = p2m_alloc_page(p2m);
>> +            if ( !*md_pg )
>> +            {
> ... in this more narrow scope.
>
>> +                printk("%s: can't allocate extra memory for dom%d\n",
>> +                       __func__, d->domain_id);
> The logging text isn't specific enough for my taste. For ordinary printk()s I'd
> also recommend against use of __func__ (that's fine for dprintk()).

I will update the message to:
   printk("%pd: can't allocate metadata page\n", p2m->domain);


>
> Also please us %pd in such cases.
>
>> +                domain_crash(d);
>> +
>> +                return;
>> +            }
>> +        }
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
> Shouldn't this be accompanied with a BUILD_BUG_ON(p2m_invalid), as otherwise
> p2m_alloc_page()'s clearing of the page won't have the intended effect?

I think that, at least, at the moment we are always explicitly set p2m type and
do not rely on that by default 0==p2m_invalid.

Just to be safe, I will add after "if ( metadata )" suggested
BUILD_BUG_ON(p2m_invalid):
         if ( metadata )
             metadata[ctx->index].type = p2m_invalid;
         
         /*
          * metadata.type is expected to be p2m_invalid (0) after the page is
          * allocated and zero-initialized in p2m_alloc_page().
          */
         BUILD_BUG_ON(p2m_invalid);
...

>
>> +    }
>> +    else
>> +    {
>> +        pte->pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
>> +
>> +        metadata[ctx->index].pte = t;
> If you set t to p2m_ext_storage here, the pte->pte updating could be moved ...

't' shouldn't be passed as 'p2m_ext_storage'.
For example, in this case we will have that in metadata page we will have type
equal to p2m_ext_storage and then in pte->pte will have the type set to
p2m_ext_storage, and the we end that we don't have a real type stored somewhere.
Even more, metadata.pte shouldn't be used to store p2m_ext_storage, only
p2m_invalid and types mentioned in enum p2m_t after p2m_ext_storage.

>
>> +    }
> ... here, covering both cases. Overally this may then be easier as
>
>      if ( t >= p2m_first_external )
>          metadata[ctx->index].pte = t;
>      else if ( metadata )
>          metadata[ctx->index].pte = p2m_invalid;
>
>      pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>
> Then raising the question whether it couldn't still be the real type that's
> stored in metadata[] even for t < p2m_first_external. That woiuld further
> reduce conditionals.

It would be nice, but I think that at the moment we can’t do that. As I explained
above, 't' should not normally be passed as p2m_ext_storage. If we want to
handle this properly, I would need to update the code to:

     if (!*md_pg && (t > p2m_first_external))

Alternatively, we could set p2m_first_external = p2m_map_foreign_rw instead of
p2m_ext_storage, since p2m_ext_storage is technically just a marker indicating
that the type is stored elsewhere.

We should also add a BUG_ON(t == p2m_ext_storage) before the if-condition
mentioned above.

>
>> @@ -470,7 +545,15 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
>>       }
>>   }
>>   
>> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>> +/*
>> + * If p2m_pte_from_mfn() is called with p2m_pte_ctx = NULL and p2m = NULL,
>> + * it means the function is working with a page table for which the `t`
>> + * should not be applicable. Otherwise, the function is handling a leaf PTE
>> + * for which `t` is applicable.
>> + */
>> +static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
>> +                              struct p2m_pte_ctx *p2m_pte_ctx,
>> +                              struct p2m_domain *p2m)
>>   {
>>       pte_t e = (pte_t) { PTE_VALID };
>>   
>> @@ -478,7 +561,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>>   
>>       ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK) || mfn_eq(mfn, INVALID_MFN));
>>   
>> -    if ( !is_table )
>> +    if ( p2m_pte_ctx && p2m )
>>       {
> Maybe better
>
>      if ( p2m_pte_ctx )
>      {
>          ASSERT(p2m);
>          ...
>
> (if you really think the 2nd check is needed)?

It seems like we don't really need it as p2m_set_type() has the same ASSERT() at the start.
I will double-check why I've added it and drop  if it was not very specific reason.

>
>> @@ -506,12 +589,19 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>>   /* Generate table entry with correct attributes. */
>>   static pte_t page_to_p2m_table(const struct page_info *page)
>>   {
>> -    /*
>> -     * p2m_invalid will be ignored inside p2m_pte_from_mfn() as is_table is
>> -     * set to true and p2m_type_t shouldn't be applied for PTEs which
>> -     * describe an intermidiate table.
>> -     */
>> -    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, true);
>> +    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, NULL, NULL);
>> +}
> How come the comment is dropped? If you deem it unecessary, why was it added
> earlier in this same series?

It is still relevant. Something went wrong during rebase and conflict resolving. Thanks for
finding that.

>
>> +static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
>> +
>> +/*
>> + * Free page table's page and metadata page linked to page table's page.
>> + */
>> +static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
>> +{
>> +    if ( tbl_pg->v.md.pg )
>> +        p2m_free_page(p2m, tbl_pg->v.md.pg);
> To play safe, maybe better also clear tbl_pg->v.md.pg?

I thought it would be enough to clear it during allocation in p2m_alloc_page(),
since I'm not sure it is critical if md.pg data were somehow leaked and read.
But to be safer, we can add this here:
    clear_and_clean_page(tbl_pg->v.md.pg, p2m->clean_dcache);

>
>> @@ -749,6 +849,10 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>>       unsigned int next_level = level - 1;
>>       unsigned int level_order = P2M_LEVEL_ORDER(next_level);
>>   
>> +    struct p2m_pte_ctx p2m_pte_ctx;
> I think this would better be one variable instance per scope where it's needed,
> and then using an initzializer. Or else ...
>
>> +    /* Init with p2m_invalid just to make compiler happy. */
>> +    p2m_type_t old_type = p2m_invalid;
>> +
>>       /*
>>        * This should only be called with target != level and the entry is
>>        * a superpage.
>> @@ -770,6 +874,19 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>>   
>>       table = __map_domain_page(page);
>>   
>> +    if ( MASK_EXTR(entry->pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
>> +    {
>> +        p2m_pte_ctx.pt_page = tbl_pg;
>> +        p2m_pte_ctx.index = offsets[level];
>> +        /*
>> +         * It doesn't really matter what is a value for a level as
>> +         * p2m_get_type() doesn't need it, so it is initialized just in case.
>> +         */
>> +        p2m_pte_ctx.level = level;
>> +
>> +        old_type = p2m_get_type(*entry, &p2m_pte_ctx);
>> +    }
>> +
>>       for ( i = 0; i < P2M_PAGETABLE_ENTRIES(next_level); i++ )
>>       {
>>           pte_t *new_entry = table + i;
>> @@ -781,6 +898,15 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>>           pte = *entry;
>>           pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
>>   
>> +        if ( MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
>> +        {
>> +            p2m_pte_ctx.pt_page = page;
>> +            p2m_pte_ctx.index = i;
>> +            p2m_pte_ctx.level = next_level;
> ... why are the loop-invariat fields not filled ahead of the loop here?

Actually, they could be filled before the loop. If I move the initialization of
p2m_pte_ctx.pt_page and p2m_pte_ctx.level ahead of the loop, does it still make
sense to have a separate variable inside
"if (MASK_EXTR(entry->pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage)"?

>
>> @@ -927,7 +1061,13 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>           p2m_clean_pte(entry, p2m->clean_dcache);
>>       else
>>       {
>> -        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
>> +        struct p2m_pte_ctx tmp_ctx = {
>> +            .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
>> +            .index =  offsets[level],
> Nit: Stray blank.
>
>> @@ -1153,7 +1301,14 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>>       if ( pte_is_valid(entry) )
>>       {
>>           if ( t )
>> -            *t = p2m_get_type(entry);
>> +        {
>> +            struct p2m_pte_ctx p2m_pte_ctx = {
>> +                .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
>> +                .index = offsets[level],
>> +            };
> .level not being set here?

It isn't used in the case when p2m_get_type() is called, but just for consistency and to
be sure that nothing will be broken if an implemnatation of p2m_get_type() will change,
I will add:
  .level = level,

Thanks.

~ Oleksii

--------------93UWKmCx80UaqdW07reU00oC
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
    <div class="moz-cite-prefix">On 11/12/25 12:49 PM, Jan Beulich
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.10.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -20,6 +20,16 @@
 
 #define P2M_SUPPORTED_LEVEL_MAPPING 2
 
+/*
+ * P2M PTE context is used only when a PTE's P2M type is p2m_ext_storage.
+ * In this case, the P2M type is stored separately in the metadata page.
+ */
+struct p2m_pte_ctx {
+    struct page_info *pt_page;   /* Page table page containing the PTE. */
+    unsigned int index;          /* Index of the PTE within that page. */
+    unsigned int level;          /* Paging level at which the PTE resides. */
+};
+
 unsigned char __ro_after_init gstage_mode;
 unsigned int __ro_after_init gstage_root_level;
 
@@ -363,24 +373,89 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
     return pg;
 }
 
-static int p2m_set_type(pte_t *pte, p2m_type_t t)
+/*
+ * `pte` – PTE entry for which the type `t` will be stored.
+ *
+ * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided;
+ * otherwise, only p2m may be NULL.
+ */
+static void p2m_set_type(pte_t *pte, const p2m_type_t t,
+                         struct p2m_pte_ctx *ctx,
+                         struct p2m_domain *p2m)
 {
-    int rc = 0;
+    struct page_info **md_pg;
+    pte_t *metadata = NULL;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm not convinced it is a good idea to re-use pte_t for this purpose. If you used
a separate type, and if then you defined that as a bitfield with only a few bits
dedicated to type, future changes (additions) may be quite a bit easier.</pre>
    </blockquote>
    <pre>Make sense, then lets go with the following structure:
  struct md_t {
      /*
       * Describes a type stored outside the PTE.
       * Look at the comment above definition of enum p2m_type_t.
       */
      p2m_type_t type : 4;
  };

</pre>
    <blockquote type="cite"
      cite="mid:6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-    if ( t &gt; p2m_first_external )
-        panic("unimplemeted\n");
-    else
+    ASSERT(p2m);
+
+     /* Be sure that an index correspondent to page level is passed. */
+    ASSERT(ctx &amp;&amp; ctx-&gt;index &lt; P2M_PAGETABLE_ENTRIES(ctx-&gt;level));
+
+    /*
+     * For the root page table (16 KB in size), we need to select the correct
+     * metadata table, since allocations are 4 KB each. In total, there are
+     * 4 tables of 4 KB each.
+     * For none-root page table index of -&gt;pt_page[] will be always 0 as
+     * index won't be higher then 511. ASSERT() above verifies that.
+     */
+    md_pg = &amp;ctx-&gt;pt_page[ctx-&gt;index / PAGETABLE_ENTRIES].v.md.pg;
+
+    if ( !*md_pg &amp;&amp; (t &gt;= p2m_first_external) )
+    {
+        BUG_ON(ctx-&gt;level &gt; P2M_SUPPORTED_LEVEL_MAPPING);
+
+        if ( ctx-&gt;level &lt;= P2M_SUPPORTED_LEVEL_MAPPING )
+        {
+            struct domain *d = p2m-&gt;domain;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is (if at all) needed only ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            *md_pg = p2m_alloc_page(p2m);
+            if ( !*md_pg )
+            {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... in this more narrow scope.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+                printk("%s: can't allocate extra memory for dom%d\n",
+                       __func__, d-&gt;domain_id);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The logging text isn't specific enough for my taste. For ordinary printk()s I'd
also recommend against use of __func__ (that's fine for dprintk()).</pre>
    </blockquote>
    <pre>I will update the message to:
  printk("%pd: can't allocate metadata page\n", p2m-&gt;domain);</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com">
      <pre wrap="" class="moz-quote-pre">

Also please us %pd in such cases.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+                domain_crash(d);
+
+                return;
+            }
+        }
+    }
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Shouldn't this be accompanied with a BUILD_BUG_ON(p2m_invalid), as otherwise
p2m_alloc_page()'s clearing of the page won't have the intended effect?</pre>
    </blockquote>
    <pre>I think that, at least, at the moment we are always explicitly set p2m type and
do not rely on that by default 0==p2m_invalid.

Just to be safe, I will add after "if ( metadata )" suggested
BUILD_BUG_ON(p2m_invalid):
        if ( metadata )
            metadata[ctx-&gt;index].type = p2m_invalid;
        
        /*
         * metadata.type is expected to be p2m_invalid (0) after the page is
         * allocated and zero-initialized in p2m_alloc_page().
         */
        BUILD_BUG_ON(p2m_invalid);
...

</pre>
    <blockquote type="cite"
      cite="mid:6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    }
+    else
+    {
+        pte-&gt;pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
+
+        metadata[ctx-&gt;index].pte = t;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If you set t to p2m_ext_storage here, the pte-&gt;pte updating could be moved ...</pre>
    </blockquote>
    <pre>'t' shouldn't be passed as 'p2m_ext_storage'.
For example, in this case we will have that in metadata page we will have type
equal to p2m_ext_storage and then in pte-&gt;pte will have the type set to
p2m_ext_storage, and the we end that we don't have a real type stored somewhere.
Even more, metadata.pte shouldn't be used to store p2m_ext_storage, only
p2m_invalid and types mentioned in enum p2m_t after p2m_ext_storage.</pre>
    <blockquote type="cite"
      cite="mid:6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... here, covering both cases. Overally this may then be easier as

    if ( t &gt;= p2m_first_external )
        metadata[ctx-&gt;index].pte = t;
    else if ( metadata )
        metadata[ctx-&gt;index].pte = p2m_invalid;

    pte-&gt;pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);

Then raising the question whether it couldn't still be the real type that's
stored in metadata[] even for t &lt; p2m_first_external. That woiuld further
reduce conditionals.</pre>
    </blockquote>
    <pre>It would be nice, but I think that at the moment we can’t do that. As I explained
above, 't' should not normally be passed as p2m_ext_storage. If we want to
handle this properly, I would need to update the code to:

    if (!*md_pg &amp;&amp; (t &gt; p2m_first_external))

Alternatively, we could set p2m_first_external = p2m_map_foreign_rw instead of
p2m_ext_storage, since p2m_ext_storage is technically just a marker indicating
that the type is stored elsewhere.

We should also add a BUG_ON(t == p2m_ext_storage) before the if-condition
mentioned above.
<span class="Y2IQFc" lang="en">

</span></pre>
    <blockquote type="cite"
      cite="mid:6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -470,7 +545,15 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
     }
 }
 
-static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
+/*
+ * If p2m_pte_from_mfn() is called with p2m_pte_ctx = NULL and p2m = NULL,
+ * it means the function is working with a page table for which the `t`
+ * should not be applicable. Otherwise, the function is handling a leaf PTE
+ * for which `t` is applicable.
+ */
+static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
+                              struct p2m_pte_ctx *p2m_pte_ctx,
+                              struct p2m_domain *p2m)
 {
     pte_t e = (pte_t) { PTE_VALID };
 
@@ -478,7 +561,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
 
     ASSERT(!(mfn_to_maddr(mfn) &amp; ~PADDR_MASK) || mfn_eq(mfn, INVALID_MFN));
 
-    if ( !is_table )
+    if ( p2m_pte_ctx &amp;&amp; p2m )
     {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Maybe better

    if ( p2m_pte_ctx )
    {
        ASSERT(p2m);
        ...

(if you really think the 2nd check is needed)?</pre>
    </blockquote>
    <pre>It seems like we don't really need it as p2m_set_type() has the same ASSERT() at the start.
I will double-check why I've added it and drop  if it was not very specific reason.

</pre>
    <blockquote type="cite"
      cite="mid:6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -506,12 +589,19 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
 /* Generate table entry with correct attributes. */
 static pte_t page_to_p2m_table(const struct page_info *page)
 {
-    /*
-     * p2m_invalid will be ignored inside p2m_pte_from_mfn() as is_table is
-     * set to true and p2m_type_t shouldn't be applied for PTEs which
-     * describe an intermidiate table.
-     */
-    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, true);
+    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, NULL, NULL);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How come the comment is dropped? If you deem it unecessary, why was it added
earlier in this same series?</pre>
    </blockquote>
    <pre>It is still relevant. Something went wrong during rebase and conflict resolving. Thanks for
finding that.

</pre>
    <blockquote type="cite"
      cite="mid:6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
+
+/*
+ * Free page table's page and metadata page linked to page table's page.
+ */
+static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
+{
+    if ( tbl_pg-&gt;v.md.pg )
+        p2m_free_page(p2m, tbl_pg-&gt;v.md.pg);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
To play safe, maybe better also clear tbl_pg-&gt;v.md.pg?</pre>
    </blockquote>
    <pre>I thought it would be enough to clear it during allocation in p2m_alloc_page(),
since I'm not sure it is critical if md.pg data were somehow leaked and read.
But to be safer, we can add this here:
   clear_and_clean_page(tbl_pg-&gt;v.md.pg, p2m-&gt;clean_dcache);

</pre>
    <blockquote type="cite"
      cite="mid:6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -749,6 +849,10 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
     unsigned int next_level = level - 1;
     unsigned int level_order = P2M_LEVEL_ORDER(next_level);
 
+    struct p2m_pte_ctx p2m_pte_ctx;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think this would better be one variable instance per scope where it's needed,
and then using an initzializer. Or else ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* Init with p2m_invalid just to make compiler happy. */
+    p2m_type_t old_type = p2m_invalid;
+
     /*
      * This should only be called with target != level and the entry is
      * a superpage.
@@ -770,6 +874,19 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
 
     table = __map_domain_page(page);
 
+    if ( MASK_EXTR(entry-&gt;pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
+    {
+        p2m_pte_ctx.pt_page = tbl_pg;
+        p2m_pte_ctx.index = offsets[level];
+        /*
+         * It doesn't really matter what is a value for a level as
+         * p2m_get_type() doesn't need it, so it is initialized just in case.
+         */
+        p2m_pte_ctx.level = level;
+
+        old_type = p2m_get_type(*entry, &amp;p2m_pte_ctx);
+    }
+
     for ( i = 0; i &lt; P2M_PAGETABLE_ENTRIES(next_level); i++ )
     {
         pte_t *new_entry = table + i;
@@ -781,6 +898,15 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
         pte = *entry;
         pte_set_mfn(&amp;pte, mfn_add(mfn, i &lt;&lt; level_order));
 
+        if ( MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
+        {
+            p2m_pte_ctx.pt_page = page;
+            p2m_pte_ctx.index = i;
+            p2m_pte_ctx.level = next_level;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... why are the loop-invariat fields not filled ahead of the loop here?</pre>
    </blockquote>
    <pre>Actually, they could be filled before the loop. If I move the initialization of
p2m_pte_ctx.pt_page and p2m_pte_ctx.level ahead of the loop, does it still make
sense to have a separate variable inside
"if (MASK_EXTR(entry-&gt;pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage)"?</pre>
    <blockquote type="cite"
      cite="mid:6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -927,7 +1061,13 @@ static int p2m_set_entry(struct p2m_domain *p2m,
         p2m_clean_pte(entry, p2m-&gt;clean_dcache);
     else
     {
-        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
+        struct p2m_pte_ctx tmp_ctx = {
+            .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
+            .index =  offsets[level],
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: Stray blank.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -1153,7 +1301,14 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
     if ( pte_is_valid(entry) )
     {
         if ( t )
-            *t = p2m_get_type(entry);
+        {
+            struct p2m_pte_ctx p2m_pte_ctx = {
+                .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
+                .index = offsets[level],
+            };
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
.level not being set here?</pre>
    </blockquote>
    <pre>It isn't used in the case when p2m_get_type() is called, but just for consistency and to
be sure that nothing will be broken if an implemnatation of p2m_get_type() will change,
I will add: 
 .level = level,

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------93UWKmCx80UaqdW07reU00oC--

