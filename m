Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C59CEA19D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 16:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194328.1512737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vabwp-0000SX-7M; Tue, 30 Dec 2025 15:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194328.1512737; Tue, 30 Dec 2025 15:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vabwp-0000PZ-3r; Tue, 30 Dec 2025 15:47:47 +0000
Received: by outflank-mailman (input) for mailman id 1194328;
 Tue, 30 Dec 2025 15:47:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKsM=7E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vabwo-0000PT-2G
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 15:47:46 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1631057-e596-11f0-9ccf-f158ae23cfc8;
 Tue, 30 Dec 2025 16:47:43 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b73161849e1so1942597166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 07:47:43 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b916b82e7sm37697467a12.35.2025.12.30.07.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 07:47:42 -0800 (PST)
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
X-Inumbo-ID: e1631057-e596-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109663; x=1767714463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tOsiXWkT3Vqpa3svg0cuIKul62QT5OR/bwWYKUwEdSg=;
        b=KJJN6LvJs1fNZHlZkEf9pHZ5O99Nyg4j3miAGkioCFOj8GfQayda42FYSgGylQi+uC
         i8tn7Xfi6d487/S92FFtX2VwdjxD/1+eoqDVfjW9XV1cQXBZEfPrwNFShaiZ4S4DW+17
         mm4MOhCEIOaaBY8fQ8Db79SJ1rlpAbE70xrh4h0pX13hu5HuECVwT+RHneP/FAJEZVJg
         Krtfyhjn0SotJSuPtqlQprwiLIP6R60p9uuGdDX54r+g3eYgWU1j1vu7x6htBEi0DaRm
         os3G8ZLQOrG17uCNShHcGiVGyoiMz5RkKuRnbT3uFTehFf07kEwiO/5GNUCI9hDzUf3q
         sofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109663; x=1767714463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOsiXWkT3Vqpa3svg0cuIKul62QT5OR/bwWYKUwEdSg=;
        b=R7kQ6KVToJFdyrj6dhj1kim9WLfkLGfDO1AlD4OjiGopxDcikNeJRZJfYg62z0joln
         0+l/tPUOsBmycO3mXSZaO850Kzg7X6AMSNG/PqlaOig1QRK6iavob1Q3UKWvjGkzmuQc
         tg7qP4GuN//6ToPndZInINBCB4cRm/4Up8dlCOCEbZtHGfPLHzbOFrwaSp7YQ738LzxZ
         UffgMngR6euRGHCIlDFifeUWrEsdRZV2uc7N7dQ5wVLbiNXyw3COW3ZAenEG5Lzp/X7y
         Gl2eOgx/uScTwTUxV04MjciOVj8ylN7xhQv0QtGjipRHBcVpUk9mkYsZXD5mzZFVkHLx
         1zHg==
X-Forwarded-Encrypted: i=1; AJvYcCUUlENODTYGpscody0+BaFU7bwO7lFHJkAuZ1zQW3506gxBVylGoRL063TC1X7WjPZN+cySYX52tBs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEAs0btQCxqQWLi/FPO3Ma+nnLuu6JJ0I0lU8lexSE5qasCZ9P
	SPgPAbYmiF3UmDkUx43veGwXx26+6lzOA/zUy0/QfVRv7LPnwDRwP7G3
X-Gm-Gg: AY/fxX5PvTWoOto2welyNPAlpUE2hPRbpuBY6YokTbvmSkDXEefIpYAF7NyfDpyISvh
	XVuGvLsezcxIW0X5dizHD8huG6lAA+zFfZrZIvXbYNmiJqk+qsEqGdets4R54NSiqgzY7FXyJle
	CRev0mNufdEXEW/fLD+GIi8j1BBYjo3YAyqIRIE+P3HLjFUT062UdvAqSyve8uqWiajeGv8/AMF
	Stze6fQuDqRKs4GmOHAaxaUmtLqb7tRjErjoBCoC4dQghm7wFizLYNw30jKoNhB33NEK14lEpaD
	kDipQ+571O8iBI13P/eJEwbEcAdWJLL2yBDQcnGy9g9rLN3M4qgZurFgjMnALdXGQwM0v1WrtPQ
	h9LsF1VHFbYCLPpMb042lziM1c7fz3UE0WjsO7yiz0slCaVwaBOMPIEGEzfcNq7rKfY7hHhJEKE
	hPDNCAWpVqzCiCsiXgqe2trPUHNCqt0ckuLwNV/68CiET2mE1l7XKjiY32OzcDfVwGVqTDMLctB
	Q==
X-Google-Smtp-Source: AGHT+IGUbcJE3QohoLaY3SzT83eik/wP+7hWm52vIoDKF9L8N2yTrhsAOtFze7fRGHC+9Y+594C4Gw==
X-Received: by 2002:a17:907:3e15:b0:b73:70db:4994 with SMTP id a640c23a62f3a-b803705dbc5mr2620079666b.34.1767109663026;
        Tue, 30 Dec 2025 07:47:43 -0800 (PST)
Message-ID: <ff4b8b38-3621-4ad9-8f43-d134c4e70567@gmail.com>
Date: Tue, 30 Dec 2025 16:47:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] xen/riscv: introduce metadata table to store P2M
 type
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766406895.git.oleksii.kurochko@gmail.com>
 <127d893e3b6a0da1195f9a128c8d0591e6ef473d.1766406895.git.oleksii.kurochko@gmail.com>
 <0a4fb29a-a0b5-4e20-91c4-425702677d11@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0a4fb29a-a0b5-4e20-91c4-425702677d11@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/29/25 4:13 PM, Jan Beulich wrote:
> On 22.12.2025 17:37, Oleksii Kurochko wrote:
>> @@ -370,24 +396,96 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
>>       return pg;
>>   }
>>   
>> -static int p2m_set_type(pte_t *pte, p2m_type_t t)
>> +/*
>> + * `pte` – PTE entry for which the type `t` will be stored.
>> + *
>> + * If `t` >= p2m_first_external, a valid `ctx` must be provided.
>> + */
>> +static void p2m_set_type(pte_t *pte, p2m_type_t t,
>> +                         const struct p2m_pte_ctx *ctx)
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
>> +        /*
>> +         * Since p2m_alloc_page() initializes an allocated page with
>> +         * zeros, p2m_invalid is expected to have the value 0 as well.
>> +         */
>> +        BUILD_BUG_ON(p2m_invalid);
>> +
>> +        ASSERT(ctx->p2m);
> I think I previously asked for this to be moved out of the if(). Else you
> may not notice a caller side issue until a point where a metadata page
> actually needs allocating. (This could simply be folded into the earlier
> ASSERT().)

I think that I understand your intention and okay to fold ASSERT(ctx->p2m)
into the earlier ASSERT().
Just want to note that generally if the metadata page has been already
allocated and then p2m_set_type() will be called with ctx->p2m == NULL then
nothing serious will happen as basically ctx->p2m is needed in this function
only for allocation of metadata page.

~ Oleksii


