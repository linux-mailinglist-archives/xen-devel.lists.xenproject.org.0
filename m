Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A111BCB0ACE
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 18:10:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181987.1504947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1Dv-0002u2-Bp; Tue, 09 Dec 2025 17:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181987.1504947; Tue, 09 Dec 2025 17:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1Dv-0002qc-7b; Tue, 09 Dec 2025 17:10:03 +0000
Received: by outflank-mailman (input) for mailman id 1181987;
 Tue, 09 Dec 2025 17:10:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCN0=6P=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vT1Dt-0002Xq-WB
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 17:10:02 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e517e678-d521-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 18:10:00 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6418738efa0so10391355a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 09:10:00 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2edad10sm14300377a12.9.2025.12.09.09.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 09:09:59 -0800 (PST)
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
X-Inumbo-ID: e517e678-d521-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765300200; x=1765905000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oaSGgoAW1hCnthIvUzdOaTGDvHd8cPDHsMIoTvubhEc=;
        b=hTrohlvhkl6iGdSUVZX3P1lCQE6qVaeR0CP1Lihmc1ffTztVCqwKnkruRFt6S3DqOq
         Yp31ayUML/qikcLAnR+hSS53LdisUv+fOaa6ocD7jF2OGYs/wB9TWclLeS3621JdSHPe
         WLm8v6DfFQDx6oTMW2F69si8MqHBXAkHhhO6XVUvTn83hJVaPwDPDSHC7yFrNDRF/ABf
         /eI22BdSE/on1KfvwbIulvy6Pw1RDy7B9zVktXQHzvONJ/chs7ZaKQS/r1wyIlokmUrf
         QrHGUjP7IqqOAliaqwIVTZ+okghgRw57IEV1Vaib8wooYS8qd9heaR/uMRQHgQTABTLK
         aMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765300200; x=1765905000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaSGgoAW1hCnthIvUzdOaTGDvHd8cPDHsMIoTvubhEc=;
        b=U39s0cr9Ik1G2B/Xp+VNYkxtYZ6BldrE49DC3zmJr/tqAg4l67VcpkbT7hPcAGPeaS
         t8rkDaq8XwBEF83FXOHUwa7yXOOm3+ZyVTs0NIsSU4RlmUqpk2cVvaWyJMNw8Nueds/U
         mHc2DHtZeuuFNQ0PnKr2vVbuhliFlglqGaN/QYfVbcRwCtonIajzLX3LkQHrPWPhNQr+
         JjoUmYivYVbM3mYHDMiCofXO9tQzql01usNvgfUHPf1IxSeDuYP512hdO289q2fsNR4m
         +qtj1bSaLRXT1uwm1MOxAlw6//1tTtlJpQLZcJeFzmpACZWoH5CkmhoGtLQv8cb2df3D
         lkHg==
X-Forwarded-Encrypted: i=1; AJvYcCUfvoCRlKsRz4NH+uUmADrp80Pk5VqHc8/7NkuPRheW/WyblWYdLqrIijOVbtnVz/0My5RqTBO5/is=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYeFuwWKKYhzHZVw8ItE0ylyUrIV2gT0ZYERdssTA7rhgv5dWu
	UnwiZXANeLD4Wj2OLAoFqgFIvfZAdKye/BzQjOGFEClEmsTD1TZOTqPS
X-Gm-Gg: ASbGncsbhdTwRJRmJB8gDxEie3LEyLLOqQTrSyXh6tg8NDNX+Z55yDH1LzHoWboQC/E
	IWNuNfFvtptK/DafS7LXYuGDcTfo6g2QibAupve326yOEmGcc6a9djWICFfvh9Ywie9w6z8pjjJ
	hhXzYgH73lVyn7Lb+5BRTbGrBueZQV3OW1juCA7nKXZgOHCAR8irj8NCo0O5WT21GLl403lIW5P
	O/4WANgkCbc9aCRpjS2A9AxLBLAFTQSScjRW+0dA14DCinLDVOCFlb074+spf3rWWHRjaOG44vx
	Ejx6NH98W9p9ENaEs+4+7vhPkOyFcaph73ZWtZ0T6DJMbtobGfgu5n5h6kYeCHvLGfDTLlR/m+l
	WrIczmo/FySdmzYUU3g/1YfQUpgcs13md0hyORYjh4jNQyqSQ8IxgGg8xMwfJIU7aV1h0ZH0A7a
	eYE6zm2ugY096rVlxKXHrj8vVp11UF+066hNj63LjbHe9wVedL7G3QV3uT3cgn
X-Google-Smtp-Source: AGHT+IFiNejXPqZCFF7kgjutfJwiiYN1oKp7Y2hqpLFNHSmtqheHa3jDNqTIHeGTsaNaNUakpzYqeA==
X-Received: by 2002:a05:6402:50ce:b0:641:66cc:9d91 with SMTP id 4fb4d7f45d1cf-6491a90f87emr9708939a12.27.1765300199459;
        Tue, 09 Dec 2025 09:09:59 -0800 (PST)
Message-ID: <36be69fb-9362-43a4-8308-1e62be60d27f@gmail.com>
Date: Tue, 9 Dec 2025 18:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/19] xen/riscv: introduce metadata table to store P2M
 type
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <2c41da84b3e7fb0f6e6c3c856bff6edaf9e1d505.1763986955.git.oleksii.kurochko@gmail.com>
 <889df78f-7196-4b44-9558-fb83f432e18a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <889df78f-7196-4b44-9558-fb83f432e18a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/9/25 2:47 PM, Jan Beulich wrote:
> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>> @@ -374,24 +399,107 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
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
>> +static void p2m_set_type(pte_t *pte, p2m_type_t t,
>> +                         struct p2m_pte_ctx *ctx,
>> +                         struct p2m_domain *p2m)
> I assume you having struct p2m_domain * separate from ctx here is because the
> "get" counterpart wouldn't need it. The same is true for the level member,
> though. I wonder therefore whether putting p2m in pte_ctx as well wouldn't
> make for an overall cleaner interface. (But this is truly just a thought; I
> don#t mean to insist here.)

I think it really makes sense to put p2m into pte_ctx.

Besides simplifying p2m_{set,get}_type(), it will also allow us to drop the p2m
argument from p2m_pte_from_mfn().

Let’s make this change now.

>>   {
>> -    int rc = 0;
>> +    struct page_info **md_pg;
>> +    struct md_t *metadata = NULL;
>>   
>> -    if ( t > p2m_first_external )
>> -        panic("unimplemeted\n");
>> -    else
>> -        pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>> +    ASSERT(p2m);
>>   
>> -    return rc;
>> +    /*
>> +     * It is sufficient to compare ctx->index with PAGETABLE_ENTRIES because,
>> +     * even for the p2m root page table (which is a 16 KB page allocated as
>> +     * four 4 KB pages), calc_offset() guarantees that the page-table index
>> +     * will always fall within the range [0, 511].
>> +     */
>> +    ASSERT(ctx && ctx->index < PAGETABLE_ENTRIES);
>> +
>> +    /*
>> +     * At the moment, p2m_get_root_pointer() returns one of four possible p2m
>> +     * root pages, so there is no need to search for the correct ->pt_page
>> +     * here.
>> +     * Non-root page tables are 4 KB pages, so simply using ->pt_page is
>> +     * sufficient.
>> +     */
>> +    md_pg = &ctx->pt_page->v.md.pg;
>> +
>> +    if ( !*md_pg && (t >= p2m_first_external) )
>> +    {
>> +        BUG_ON(ctx->level > P2M_MAX_SUPPORTED_LEVEL_MAPPING);
>> +
>> +        if ( ctx->level <= P2M_MAX_SUPPORTED_LEVEL_MAPPING )
>> +        {
>> +            /*
>> +             * Since p2m_alloc_page() initializes an allocated page with zeros, p2m_invalid
>> +             * is expected to have the value 0 as well. This ensures that if a metadata
>> +             * page is accessed before being properly initialized, the correct type
>> +             * (p2m_invalid in this case) will be returned.
>> +             */
> Nit: Line length.
>
> Also imo "properly initialized" is ambiguous. The clearing of the page can already
> count as such. No access to the page may happen ahead of this clearing.

I will drop then this part of the comment:
+               This ensures that if a metadata
+             * page is accessed before being properly initialized, the correct type
+             * (p2m_invalid in this case) will be returned.

>
>> +            BUILD_BUG_ON(p2m_invalid);
>> +
>> +            *md_pg = p2m_alloc_page(p2m);
>> +            if ( !*md_pg )
>> +            {
>> +                printk("%pd: can't allocate metadata page\n", p2m->domain);
>> +                domain_crash(p2m->domain);
>> +
>> +                return;
>> +            }
>> +        }
>> +    }
>> +
>> +    if ( *md_pg )
>> +        metadata = __map_domain_page(*md_pg);
>> +
>> +    if ( t >= p2m_first_external )
>> +    {
>> +        metadata[ctx->index].type = t;
>> +
>> +        t = p2m_ext_storage;
>> +    }
>> +    else if ( metadata )
>> +        metadata[ctx->index].type = p2m_invalid;
>> +
>> +    pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>> +
>> +    unmap_domain_page(metadata);
>>   }
> Just to mention (towards future work): Once a metadata page goes back to be
> entirely zero-filled, it could as well be hooked off and returned to the pool.
> Not doing so may mean detaining an unused page indefinitely.

Won’t that already happen when p2m_free_table() is called?

p2m_free_table() calls p2m_free_page(p2m, tbl_pg->v.md.pg), which in turn calls
paging_free_page(), and that returns the page to the pool by doing:
     page_list_add_tail(pg, &d->arch.paging.freelist);

>
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
>> +    /*
>> +     * Since the PTE is initialized with all zeros by default, p2m_invalid must
>> +     * have the value 0. This ensures that if p2m_get_type() is called for a GFN
>> +     * that hasn't been initialized, the correct type (p2m_invalid in this case)
>> +     * will be returned. It also guarantees that metadata won't be touched when
>> +     * the GFN hasn't been initialized.
>> +     */
>> +    BUILD_BUG_ON(p2m_invalid);
> I don't think comment and BUILD_BUG_ON() need repeating here. That's relevant
> only when (zero-)initializing the page.
>
>>       if ( type == p2m_ext_storage )
>> -        panic("unimplemented\n");
>> +    {
>> +        const struct md_t *md = __map_domain_page(ctx->pt_page->v.md.pg);
>> +
>> +        type = md[ctx->index].type;
> In exchange you may want to assert here that the type found is
>> = p2m_first_external (as - supposedly - guaranteed by p2m_set_type()).

Make sense, will add the following after type = ...:
         /*
          * Since p2m_set_type() guarantees that the type will be greater than
          * p2m_first_external, just check that we received a valid type here.
          */
         ASSERT(type > p2m_first_external);

>> @@ -792,6 +952,13 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>>           pte = *entry;
>>           pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
>>   
>> +        if ( MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
>> +        {
>> +            p2m_pte_ctx.index = i;
>> +
>> +            p2m_set_type(&pte, old_type, &p2m_pte_ctx, p2m);
> In order to re-use p2m_pte_ctx across multiple iterations without fully re-
> initializing, you want the respective parameter of p2m_set_type() be pointer-
> to-const.

Good point. I will update prototype of p2m_set_type() to:

static void p2m_set_type(...
                          const struct p2m_pte_ctx *ctx)

>
>> @@ -894,13 +1061,21 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>       {
>>           /* We need to split the original page. */
>>           pte_t split_pte = *entry;
>> +        struct page_info *tbl_pg = mfn_to_page(domain_page_map_to_mfn(table));
>>   
>>           ASSERT(pte_is_superpage(*entry, level));
>>   
>> -        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
>> +        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets,
>> +                                  tbl_pg) )
>>           {
>> +            struct p2m_pte_ctx tmp_ctx = {
>> +                .pt_page = tbl_pg,
>> +                .index = offsets[level],
>> +                .level = level,
>> +            };
> This, ...
>
>> @@ -938,7 +1113,13 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>           p2m_clean_pte(entry, p2m->clean_dcache);
>>       else
>>       {
>> -        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
>> +        struct p2m_pte_ctx tmp_ctx = {
>> +            .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
>> +            .index = offsets[level],
>> +            .level = level,
>> +        };
> ... this, and ...
>
>> @@ -974,7 +1155,15 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>       if ( pte_is_valid(orig_pte) &&
>>            (!pte_is_valid(*entry) ||
>>             !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte))) )
>> -        p2m_free_subtree(p2m, orig_pte, level);
>> +    {
>> +        struct p2m_pte_ctx tmp_ctx = {
>> +            .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
>> +            .index = offsets[level],
>> +            .level = level,
>> +        };
> ... this initializer are identical. Perhaps (sorry) it wasn't a good idea
> after all to move the context variable from function scope to the more
> narrow ones?

Probably, but I’m not 100% sure that making it a function-scope variable would be better.
Essentially, it would only help eliminate the last two declarations of `tmp_ctx`:
     struct p2m_pte_ctx tmp_ctx = {
         .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
         .index = offsets[level],
         .level = level,
     };

It would also require re-initializing (or as an option it could done once after the
superpage breakup happened; please look the diff below) all the fields (except the
newly added `tmp_ctx.p2m`) inside the case where a superpage breakup is needed:
     /*
      * If we are here with level > target, we must be at a leaf node,
      * and we need to break up the superpage.
      */
     if (level > target)
In this case, `index`, `level`, and `pt_page` will be changed.

It seems slightly better to use a function-scope variable, so I can rework the code to have
the following:
@@ -1049,6 +1047,8 @@ static int p2m_set_entry(struct p2m_domain *p2m,
  
      entry = table + offsets[level];
  
+    tmp_ctx.p2m = p2m;
+
      /*
       * If we are here with level > target, we must be at a leaf node,
       * and we need to break up the superpage.
@@ -1064,11 +1064,9 @@ static int p2m_set_entry(struct p2m_domain *p2m,
          if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets,
                                    tbl_pg) )
          {
-            struct p2m_pte_ctx tmp_ctx = {
-                .pt_page = tbl_pg,
-                .index = offsets[level],
-                .level = level,
-            };
+            tmp_ctx.pt_page = tbl_pg;
+            tmp_ctx.index = offsets[level];
+            tmp_ctx.level = level;
  
              /* Free the allocated sub-tree */
              p2m_free_subtree(p2m, split_pte, &tmp_ctx);
@@ -1097,6 +1095,10 @@ static int p2m_set_entry(struct p2m_domain *p2m,
          entry = table + offsets[level];
      }
  
+    tmp_ctx.pt_page = mfn_to_page(domain_page_map_to_mfn(table));
+    tmp_ctx.index = offsets[level];
+    tmp_ctx.level = level;
+
      /*
       * We should always be there with the correct level because all the
       * intermediate tables have been installed if necessary.
@@ -1109,13 +1111,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
          p2m_clean_pte(entry, p2m->clean_dcache);
      else
      {
-        struct p2m_pte_ctx tmp_ctx = {
-            .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
-            .index = offsets[level],
-            .level = level,
-        };
-
-        pte_t pte = p2m_pte_from_mfn(mfn, t, &tmp_ctx, p2m);
+        pte_t pte = p2m_pte_from_mfn(mfn, t, &tmp_ctx);
  
          p2m_write_pte(entry, pte, p2m->clean_dcache);
  
@@ -1152,12 +1148,6 @@ static int p2m_set_entry(struct p2m_domain *p2m,
           (!pte_is_valid(*entry) ||
            !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte))) )
      {
-        struct p2m_pte_ctx tmp_ctx = {
-            .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
-            .index = offsets[level],
-            .level = level,
-        };
-
          p2m_free_subtree(p2m, orig_pte, &tmp_ctx);
      }
  
@@ -1363,6 +1353,7 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
                  .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
                  .index = offsets[level],
                  .level = level,
+                .p2m = p2m,
              };
  
              *t = p2m_get_type(entry, &p2m_pte_ctx);

Does it make sense?

Thanks.

~ Oleksii


