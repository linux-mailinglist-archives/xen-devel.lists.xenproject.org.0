Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE7CF4188
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 15:25:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195430.1513370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vclW2-0007eE-GF; Mon, 05 Jan 2026 14:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195430.1513370; Mon, 05 Jan 2026 14:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vclW2-0007bd-DI; Mon, 05 Jan 2026 14:25:02 +0000
Received: by outflank-mailman (input) for mailman id 1195430;
 Mon, 05 Jan 2026 14:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vclW1-0007ak-KZ
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 14:25:01 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51a2fe92-ea42-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 15:25:00 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47d59da3d81so8844815e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 06:25:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab33f5sm100662528f8f.41.2026.01.05.06.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 06:24:59 -0800 (PST)
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
X-Inumbo-ID: 51a2fe92-ea42-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767623100; x=1768227900; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3gMqLT/CFiOQX20PMXoEv4yOZ+d5HtUyUw7rUQE9dAE=;
        b=QuyCZq3geUzUtJsdUMHR80f55+YHwscm+KoYmjN350OYnwkFx+mc9FTlyERVmfwEDR
         DRshI+MypPOtTwjDLi+o1WXjf03wG8j7FM/t7TGen+9jK7ec35uBX7O9SpPH+7Hs0py0
         UKeG4Me7a799Zr7OT6qhoSTo794jmM3DmkscEfkwzvf3pS2J5CakBrRV1QYoFbb8vqPG
         gwD+VwbAPVzPSLhYEUSF/ln60EZoWsXbFr2GlPhe4A2o0NTxC+WS0FR0oL8VQW9NsXR4
         smB6aIJLlCkTfQJ1Kke9sZZyYABpZj+ZjaSjVpBI1suKLJTkOVC3zTfTkMhjZh8kSN19
         5rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623100; x=1768227900;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gMqLT/CFiOQX20PMXoEv4yOZ+d5HtUyUw7rUQE9dAE=;
        b=nyLzz08NBvCQnGYS92mXXiFzYSwEb7Zm6xWg4qOQrCUiafYhTtGcG2DQV+kFxn0H4q
         tbNvrZM95HHkZ6y2GZuXlllFD3LtT86VmCuVawPp982I+urFa2YghtEEGkqBW/MzHt5I
         8wnytPZKd5klNeMdLD9eTr7fDjOb6lquE7hwy5s470s+qbhiyFOMnThbrqXw1TYdZNoG
         wQVgG/YnZMuh39a9UE2s0LAcn1T0E1InZFeudovoHkUKg+0bX3A63ZFm3SIHvUK/wWtv
         +gdmlqmLFlRel3lVU5vOB4/bLXXrfYnT8w9nhrpa1soDK8tfynBrLwtoERGW9qA7m88D
         534w==
X-Forwarded-Encrypted: i=1; AJvYcCX5J0BMujHMLd1AR9L0d3g5Pc36cbDHfn4yeZzp1P+zMwflemrgGihc/YP85qy7/jmhu+pmJHS8q7Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7APKEBmRg4rMLku3Eg3SXhvE04OkmnfH5D0n67ykBzCS4Ev/s
	Q/iiTspDf/AP9u8rIcBucUBHL3cs6fcyd/jP1kmLW91txhFuvfQHmbX7IYCana4doA==
X-Gm-Gg: AY/fxX4EpOGOzmHIvis9NejWJ5yrFtf/KRl1DdBmD7Rlt+6FFRjXNC5bP/RB2Sv1wNc
	h5dntUmgOjlxqdhJNQbNXOSAIfXUUn9PV6ptGKzFfHxCUln/oFDA7kMU90XrNZrpCVAKQOVLhDL
	ds6q6A2QZpoKPhV0xYtNEOEhDOVbk46iD5d46lC50Pnv0Aj3rdYxExNXs0fp4J0USBqpUrJ6fdR
	87/n1c/KcTUoxGqNTvoXu2ovZiaX7FGGwg+h2oMPkzjXb/AeCwSgU+RRzCvUHbDJQxtSzANBCAd
	86xxUJpIDGAKYqhdl9MDnHCwUab45G4hgy8ZNfPC+atKYSfqounEmP5642sGAZuKrPaKJ7sfK/F
	lw6lxY3cmR6ssB/oH3Buss5f6pU8wtvQbGEYZp5iIQuE41Pl95fMmp8lh3lX0GnmWv3hcKMH2K5
	MiPDSfKbJpmtkfm0bJCEe9N4GS87GlSShCYw+wcQ0R/U4B6IAT3lGxLORCi7kF3fN8/kvyCO5N8
	bM=
X-Google-Smtp-Source: AGHT+IHpU8IiDPanCMLgsSJ4So9NkzNYI1iTXldwl49PLS0ncjedA/PYsgVDYaw6ROvzZI+4yhosBw==
X-Received: by 2002:a05:6000:4313:b0:431:cf0:2e8b with SMTP id ffacd0b85a97d-432aa40933cmr10579266f8f.29.1767623100172;
        Mon, 05 Jan 2026 06:25:00 -0800 (PST)
Message-ID: <d995ae85-7f50-422f-89f6-e6ed288276be@suse.com>
Date: Mon, 5 Jan 2026 15:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] xen/riscv: introduce metadata table to store P2M
 type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <ff4b8b38-3621-4ad9-8f43-d134c4e70567@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ff4b8b38-3621-4ad9-8f43-d134c4e70567@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.12.2025 16:47, Oleksii Kurochko wrote:
> 
> On 12/29/25 4:13 PM, Jan Beulich wrote:
>> On 22.12.2025 17:37, Oleksii Kurochko wrote:
>>> @@ -370,24 +396,96 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
>>>       return pg;
>>>   }
>>>   
>>> -static int p2m_set_type(pte_t *pte, p2m_type_t t)
>>> +/*
>>> + * `pte` – PTE entry for which the type `t` will be stored.
>>> + *
>>> + * If `t` >= p2m_first_external, a valid `ctx` must be provided.
>>> + */
>>> +static void p2m_set_type(pte_t *pte, p2m_type_t t,
>>> +                         const struct p2m_pte_ctx *ctx)
>>>   {
>>> -    int rc = 0;
>>> +    struct page_info **md_pg;
>>> +    struct md_t *metadata = NULL;
>>>   
>>> -    if ( t > p2m_first_external )
>>> -        panic("unimplemeted\n");
>>> -    else
>>> -        pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>> +    /*
>>> +     * It is sufficient to compare ctx->index with PAGETABLE_ENTRIES because,
>>> +     * even for the p2m root page table (which is a 16 KB page allocated as
>>> +     * four 4 KB pages), calc_offset() guarantees that the page-table index
>>> +     * will always fall within the range [0, 511].
>>> +     */
>>> +    ASSERT(ctx && ctx->index < PAGETABLE_ENTRIES);
>>>   
>>> -    return rc;
>>> +    /*
>>> +     * At the moment, p2m_get_root_pointer() returns one of four possible p2m
>>> +     * root pages, so there is no need to search for the correct ->pt_page
>>> +     * here.
>>> +     * Non-root page tables are 4 KB pages, so simply using ->pt_page is
>>> +     * sufficient.
>>> +     */
>>> +    md_pg = &ctx->pt_page->v.md.pg;
>>> +
>>> +    if ( !*md_pg && (t >= p2m_first_external) )
>>> +    {
>>> +        /*
>>> +         * Since p2m_alloc_page() initializes an allocated page with
>>> +         * zeros, p2m_invalid is expected to have the value 0 as well.
>>> +         */
>>> +        BUILD_BUG_ON(p2m_invalid);
>>> +
>>> +        ASSERT(ctx->p2m);
>> I think I previously asked for this to be moved out of the if(). Else you
>> may not notice a caller side issue until a point where a metadata page
>> actually needs allocating. (This could simply be folded into the earlier
>> ASSERT().)
> 
> I think that I understand your intention and okay to fold ASSERT(ctx->p2m)
> into the earlier ASSERT().
> Just want to note that generally if the metadata page has been already
> allocated and then p2m_set_type() will be called with ctx->p2m == NULL then
> nothing serious will happen as basically ctx->p2m is needed in this function
> only for allocation of metadata page.

Correct, but how would any particular caller know? Yes, there may be special
cases where a caller does know, but imo the code is going to be more robust
if the check is always being made (forcing all callers to set ->p2m).

Jan

