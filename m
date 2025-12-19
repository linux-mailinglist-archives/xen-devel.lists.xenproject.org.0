Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFF3CCF7DD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 11:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190567.1510958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWY9I-00033Z-58; Fri, 19 Dec 2025 10:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190567.1510958; Fri, 19 Dec 2025 10:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWY9I-00031O-2L; Fri, 19 Dec 2025 10:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1190567;
 Fri, 19 Dec 2025 10:55:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWY9G-00031I-Eh
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 10:55:50 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47456f62-dcc9-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 11:55:49 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b7ffa5d1b80so196715166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 02:55:49 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ae2d5dsm204291566b.27.2025.12.19.02.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 02:55:48 -0800 (PST)
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
X-Inumbo-ID: 47456f62-dcc9-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766141749; x=1766746549; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Ur6798BnclouuYiImlBcVcxis6pdIIRSDP0zFqrMhY=;
        b=mOZPSolUgm6eYsy+k/L8PjfCPhnxnN1CErFrrGNDpzagtYjc0I5L39Kxm4r5IdQPUq
         ZuAL1qc74Hkvmf+j+i9oHELEHDJFi7R6k7mKdt/2vK8Rxr6tgjNy3tA8KSGBpNghlqfH
         0598VkUS+mMUXJiap8AQlwguOWYRhu5PX34XPZu5p5wTxlCl4bhi5v9sGZK9n+jy5mXN
         qrYG+WBIUKc8K5qlN5xlFUbFQRWCF6uaYxakzNfQf7CAvOKWiGZEYXcIok7a3OMw9rg5
         pExh8ckCPJgi1jamT3lbmXlqyOt8xo+mkIGnnlzoUj+IHDTGiLyhZvpCJeYNXYdIkf6R
         NkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766141749; x=1766746549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ur6798BnclouuYiImlBcVcxis6pdIIRSDP0zFqrMhY=;
        b=snGm9JEp10iPouoYJH5eQNoAW/jaKLR2mq94VpRbwgUTFkV8ENsePuPTq7ztCHNHeZ
         oaXh9tEruCLNdCpAna50lU6GpXWOg1Q/LBF3SaNgUsNP3sblSymjw4NpF1EzNCgo6c7g
         HAZWWFxI3PQysSdhtzsAGjFdiP02h6Lo4Cx8mt6dSFnoOLUj5uAmnWOCLDujnQdD+Mbb
         YkYFo18XHDqaJwuqd2IFFiC4OSWAh8UCZlj6HgX9UgjqDdgxo4JlStsPQTlQzrwqDYM0
         6uOTdTd7OuTUffuo/TuEx2cZmPwOADomqK+/enSH1s3TQWwP4iKC0uEX7avIDfTwIEsL
         yPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjO2IaJ+/AC5Tw4+Mpu6STviEqY37nmEYRx5kGenhTsO+r9fND5c2izzVVslUWOhPQx1uDN0VZV+4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQIyL/VA91wCv5PfQMiSk3UjJdMyN67KjkmWgLU+OjOIGRRPqS
	KffAeKehoHRQCO+1igG0gIfBPN80QpVTN2OoYNp7F8bKMcM6BgfxXIyt
X-Gm-Gg: AY/fxX67Yzlpr+7mhSDu2XNTGctMB+0o7BXP4ockIRK4gvE1NRLK28od4ABUc3a4nKB
	cPSZP3TEEB8dh6J+OewpOfy3+vDxY7xPDcba9YWTerOcgK25r/cWO/bS1Wb0Ui5DCNb3AUvmEGN
	sdPrjWkCFLYzhJ6ILOVHTGP0P9tvvHMhnyxQnZBi5lJdAnuWGgFgGYmiLF2tJj1FtLp9QGydDJO
	TDcVtw4tnLWUOCqoL82pr9Ky66h4jvSbuKyEcmDF7p+DRNlBgHW1MrMjxNdPvvDTFQ3rTt9SfKj
	jSq0utpZgFmUNylm1Bep6U4rA5dxn/uOQTzoOM4ju84S1Uq4+fYsMwLDSKVtBfCX/oVW6cW5RHU
	jfcA0Qbl7v7yg6MuDRZ80Ve81Ym+VV7lIEpUXpxJcufZR1ToCVGXIqv0zI4k9/2UkuItUjKkDbo
	qhRkG36Kvv5DXjlB3yxGoWb61jeBGbesiyDYWemX0gWupHka0DFvqcYzDmR/2hakun
X-Google-Smtp-Source: AGHT+IFcJ6xiPSbR0WzJJNqZkrQYHIebuO/jVD7RQPLAo85NR5Pv9uYQHG1AIflEsYYIoTfV01uj7w==
X-Received: by 2002:a17:907:72c8:b0:b73:6d56:7459 with SMTP id a640c23a62f3a-b803717a112mr228985666b.38.1766141748370;
        Fri, 19 Dec 2025 02:55:48 -0800 (PST)
Message-ID: <635f5dd1-3d9c-48cd-9184-cc493d844a89@gmail.com>
Date: Fri, 19 Dec 2025 11:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 18/19] xen/riscv: introduce metadata table to store P2M
 type
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
 <b1e4ed0bb4e2f47a7cdb6afe4b9b05462e00fc84.1765879052.git.oleksii.kurochko@gmail.com>
 <c7a00f3e-cbbf-46b3-8d37-ed4565a9314a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c7a00f3e-cbbf-46b3-8d37-ed4565a9314a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/18/25 2:16 PM, Jan Beulich wrote:
> On 16.12.2025 17:55, Oleksii Kurochko wrote:
>> @@ -370,24 +396,101 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
>>       return pg;
>>   }
>>   
>> -static int p2m_set_type(pte_t *pte, p2m_type_t t)
>> +/*
>> + * `pte` – PTE entry for which the type `t` will be stored.
>> + *
>> + * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided.
> Stale comment? There's no ...
>
>> + */
>> +static void p2m_set_type(pte_t *pte, p2m_type_t t,
>> +                         const struct p2m_pte_ctx *ctx)
> ... "p2m" among the parameters anymore. Furthermore, would any caller pass in
> p2m_ext_storage? Judging from the code you may mean "If `t` is greater or
> equal to `p2m_first_external` ..."

By|p2m |I meant|ctx->p2m|, but I agree it would be better to refer to|ctx->p2m |explicitly or just update the comment to the following:
   * If `t` >= p2m_first_external, a valid `ctx` must be provided.
This looks clear enough to me now.

>
>>   {
>> -    int rc = 0;
>> +    struct page_info **md_pg;
>> +    struct md_t *metadata = NULL;
>>   
>> -    if ( t > p2m_first_external )
>> -        panic("unimplemeted\n");
>> -    else
>> -        pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>> +    /*
>> +     * It is sufficient to compare ctx->index with PAGETABLE_ENTRIES because,
>> +     * even for the p2m root page table (which is a 16 KB page allocated as
>> +     * four 4 KB pages), calc_offset() guarantees that the page-table index
>> +     * will always fall within the range [0, 511].
>> +     */
>> +    ASSERT(ctx && ctx->index < PAGETABLE_ENTRIES);
>>   
>> -    return rc;
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
> With this, ...
>
>> +        if ( ctx->level <= P2M_MAX_SUPPORTED_LEVEL_MAPPING )
> ... this isn't needed (dead code). Things would be different with ASSERT().

Agreed, the|if| condition isn’t needed.

If my understanding is correct, this would be different with|ASSERT()|, because
|ASSERT()| does nothing when|NDEBUG=y|, so an incorrect value of|ctx->level |could be missed, right?

>
> Also, isn't this a requirement independent of P2M type? In which case it should
> be moved out of the if()?

Right, it is independent and should be move out of the if ().

>   Yet then, further code in the function (including in
> the body of this if()) doesn't look to be using ->level. Then why the check?

I agree that, at least, the check should be dropped, and|BUG_ON()| can likely be
dropped as well.|ctx->level| isn’t really something|p2m_set_type()| should care
about, since the PTE is passed as an argument and is therefore expected to be
valid; consequently,|ctx->level| is expected to be valid too.

>> @@ -756,6 +891,10 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>>       unsigned int next_level = level - 1;
>>       unsigned int level_order = P2M_LEVEL_ORDER(next_level);
>>   
>> +    struct p2m_pte_ctx p2m_pte_ctx;
>> +    /* Init with p2m_invalid just to make compiler happy. */
>> +    p2m_type_t old_type = p2m_invalid;
>> +
>>       /*
>>        * This should only be called with target != level and the entry is
>>        * a superpage.
>> @@ -777,6 +916,24 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>>   
>>       table = __map_domain_page(page);
>>   
>> +    p2m_pte_ctx.p2m = p2m;
> To play safe and have all struct fields initialized (all others implicitly),
> better make this the initializer of the variable? Then you could shorten ...
>
>> +    if ( MASK_EXTR(entry->pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
>> +    {
>> +        p2m_pte_ctx.pt_page = tbl_pg;
>> +        p2m_pte_ctx.index = offsets[level];
>> +        /*
>> +         * It doesn't really matter what is a value for a level as
>> +         * p2m_get_type() doesn't need it, so it is initialized just in case.
>> +         */
>> +        p2m_pte_ctx.level = level;
> ... the comment here and really omit the assignment of .level.

Agree, the initializer looks better here, and the assignment could be omitted for now.

I am curious whether|p2m_get_type()| might one day need|p2m_pte_ctx.level|. If so, and
someone were to change|level| between the call to|p2m_get_type()| and the
initialization of|p2m_pte_ctx|, we could run into trouble. Perhaps it is safer to keep
the assignment or would it be enough during code review to check that if|level |changes
between the call to|p2m_get_type()| and the initialization of|p2m_pte_ctx|,|p2m_get_type() |still does not depend on|p2m_pte_ctx->level?|

>
>> @@ -840,6 +1004,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>        * are still allowed.
>>        */
>>       bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
>> +    struct p2m_pte_ctx tmp_ctx;
>>       P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
>>   
>>       ASSERT(p2m_is_write_locked(p2m));
>> @@ -882,6 +1047,8 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>   
>>       entry = table + offsets[level];
>>   
>> +    tmp_ctx.p2m = p2m;
> Again better make this the variable's initializer?

Sure, it would be better.

>
>> @@ -970,7 +1147,9 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>       if ( pte_is_valid(orig_pte) &&
>>            (!pte_is_valid(*entry) ||
>>             !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte))) )
>> -        p2m_free_subtree(p2m, orig_pte, level);
>> +    {
>> +        p2m_free_subtree(p2m, orig_pte, &tmp_ctx);
>> +    }
> Why braces all of the sudden?

Likely I've experimented with something and missed to clean up the code
after the experiments. I'll drop them.

Thanks.

~ Oleksii


