Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CACAFA324DE
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 12:28:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886353.1296018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAuJ-0006Hv-Nv; Wed, 12 Feb 2025 11:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886353.1296018; Wed, 12 Feb 2025 11:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAuJ-0006FR-KD; Wed, 12 Feb 2025 11:27:55 +0000
Received: by outflank-mailman (input) for mailman id 886353;
 Wed, 12 Feb 2025 11:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiAuH-0006FL-UY
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 11:27:53 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 653c5375-e934-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 12:27:51 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d9837f201aso1482977a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 03:27:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de50b1cafesm9114267a12.78.2025.02.12.03.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:27:50 -0800 (PST)
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
X-Inumbo-ID: 653c5375-e934-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739359671; x=1739964471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XE+rteD5OcY9P8FpjnAIR9UTjWZs0VgduUmZ0kLxGSo=;
        b=fWR9SdtpnJKFOXF3PJy5WZT90KIoVEoOJdITkyfGLvuA7dWMlWfnNPn3z9Bln8g9Ev
         0IHJZufrceYALhsXkwTVJehbblJxdX6v63iCoYMKkBDaT+PsmbnIhGip4Wx4CAvaM3gr
         q7wK/4DV9nmleGgiOXpUYzATY5bwB3ADzfJmLp6PlSO5OR4fqxaID8+j5xtlPEGTJWUU
         dWqzAavXTPv5OObbofWWYzt5QprkzN59QILqZl38zkX+8JNwFkYAkonj7b1yIfDDhywE
         bzg9XUTRmQ9Mj43NuNuFv5IFW5rhZZWsLxt6bnqeL8iAmTX20h2poGdeghD1HDLr0vBJ
         JxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359671; x=1739964471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XE+rteD5OcY9P8FpjnAIR9UTjWZs0VgduUmZ0kLxGSo=;
        b=hKtj0fxUn5A+IbgXhH//DI5j+C7az1zaPA3W5BKr6GdIJ8gOTg+rAAW1Lt2/e/Oc0x
         xD5i8ghDncUYNkOJ9PyKtCFpCmqu/X4Dj0pDTZJZfF48RaMhTahlrF+Uu4NNL0Jan/yp
         ACekxMUv474NoT74x5zgJzkAByHY9c4CF2s9LEua9Kbc0FUmp7fVrQgVHD054PwoJ0r6
         HjneYSenNV94qWNC8Z5Ax/SJPEaCRJJbpJla0QtFLcIiZ4h6IpyDukYGYB0uLG4RnHHK
         uIoaB1/gr89WxhVulKjCgit0F0KzaeyaPzqpHVUfbjj37hHdRu5hOMHg7Vyr6Exno6mP
         jyGg==
X-Forwarded-Encrypted: i=1; AJvYcCUVU3bpBuj1BsvNSRXuGUQkA1m3OS8sfUBt+gtXiOi2NV+MqCjrrcrMfYhQsAE1YHIXpCIxXm3zzps=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4S6XChAFjQhqL7VdjL765tcVzx0KIdCnyaqIQiXj0uoLLVL6O
	DCM8njkrc7PA0UvrMfA4ao3xknCVMP+0RJfmfLWEzxEnAGmx3JlekgOQ57W2mQ==
X-Gm-Gg: ASbGnctdnFI406PgCnwK32/lGTr4StgIQbql69kjyq9G6w26KKhazTEsKgmdzqxQ7OG
	9Hi/5Oo7FoSm+4MnOr19TuRoTJLpJ5AFL2rkjc5lOxvynqNGDHnNdSagLfFYqxf/wLpXMI6pnOV
	r31gFyyq7B4Rui12TrxLbTx4Pr1tyzQQIfe9BcghvnRGeqfz5CYo8TxZdjJqYvfrhmJXI2Hq3AK
	rTbGBwF9MLBu8lH1BdUpkDtpRIY7fEmakN5ZWf0bdrgE64SrtOA6MPcJx6BNwCb+K5pbzSfziT3
	EZKhXG9RYWC69ulz9SrWPcEYshmEviqxcZV0SRdo+4z7RfTRM8AnrZIaIp4HqUxAYe3+nVkZQs4
	6
X-Google-Smtp-Source: AGHT+IFpcjE2oY6M7gVXUKupJbg5rvL6XiXArh5mVhBMBnxG8ArsvqRG3SHFvxWK3QPfgVRVKQdgxA==
X-Received: by 2002:a05:6402:34d1:b0:5de:a972:8c7 with SMTP id 4fb4d7f45d1cf-5deae09ac04mr2270410a12.5.1739359671274;
        Wed, 12 Feb 2025 03:27:51 -0800 (PST)
Message-ID: <e7d67dd8-5ec1-43e5-b0a1-58302bc67fa0@suse.com>
Date: Wed, 12 Feb 2025 12:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v3 1/3] xen/riscv: implement software page table
 walking
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738933678.git.oleksii.kurochko@gmail.com>
 <e78679b00df63bde40eb3a4d97e3ab9d1faf9382.1738933678.git.oleksii.kurochko@gmail.com>
 <c6916159-d314-4121-b1aa-f5fd26bdb7b1@suse.com>
 <78b67cb7-5bc0-4292-987f-d22e199d83ae@gmail.com>
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
In-Reply-To: <78b67cb7-5bc0-4292-987f-d22e199d83ae@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2025 12:13, Oleksii Kurochko wrote:
> 
> On 2/10/25 5:32 PM, Jan Beulich wrote:
>> On 07.02.2025 14:13, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/pt.c
>>> +++ b/xen/arch/riscv/pt.c
>>> @@ -185,6 +185,57 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
>>>       return XEN_TABLE_NORMAL;
>>>   }
>>>   
>>> +/*
>>> + * _pt_walk() performs software page table walking and returns the pte_t of
>>> + * a leaf node or the leaf-most not-present pte_t if no leaf node is found
>>> + * for further analysis.
>>> + * Additionally, _pt_walk() returns the level of the found pte.
>> That's optional, which I think wants expressing here.
>>
>>> + */
>>> +static pte_t *_pt_walk(vaddr_t va, unsigned int *pte_level)
>>> +{
>>> +    const mfn_t root = get_root_page();
>>> +    unsigned int level;
>>> +    pte_t *table;
>>> +
>>> +    DECLARE_OFFSETS(offsets, va);
>>> +
>>> +    table = map_table(root);
>> This mapping operation doesn't look to have a counterpart. Aiui ...
>>
>>> +    /*
>>> +     * Find `table` of an entry which corresponds to `va` by iterating for each
>>> +     * page level and checking if the entry points to a next page table or
>>> +     * to a page.
>>> +     *
>>> +     * Two cases are possible:
>>> +     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was found;
>>> +     *   (Despite the name) XEN_TABLE_SUPER_PAGE also covers 4K mappings. If
>>> +     *   pt_next_level() is called for page table level 0, it results in the
>>> +     *   entry being a pointer to a leaf node, thereby returning
>>> +     *   XEN_TABLE_SUPER_PAGE, despite of the fact this leaf covers 4k mapping.
>>> +     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
>>> +     *   mapped.
>>> +     */
>>> +    for ( level = HYP_PT_ROOT_LEVEL; ; --level )
>>> +    {
>>> +        int ret = pt_next_level(false, &table, offsets[level]);
>> ... the mapping may be replaced here, but a new mapping will then still
>> be held by this function and ...
>>
>>> +        if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
>>> +            break;
>>> +
>>> +        ASSERT(level);
>>> +    }
>>> +
>>> +    if ( pte_level )
>>> +        *pte_level = level;
>>> +
>>> +    return table + offsets[level];
>>> +}
>> ... the final one then be transferred to the caller.
>>
>>> +pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
>>> +{
>>> +    return *_pt_walk(va, pte_level);
>>> +}
>> Hence aiui there needs to be an unmap operation here.
> 
> As _pt_walk() returns page table entry, it is needed to transform entry to table.
> 
> Do we have any function in Xen for that?

I don't understand. Both unmap_domain_page() and pmap_unmap() ignore
the low bits of the passed in address.

Jan

> Or the best I can do is:
>    pte_t *table = *_pt_walk(va, pte_level) - TABLE_OFFSET(pt_linear_offset(*pte_level, va)
> (of course, it is needed to check if pte_level isn't null and do some extra actions if it is NULL)
> 
> As an option, as all page tables are PAGE_SIZE aligned, we could use PAGE_OFFSET():
>   pte_t *entry = _pt_walk(va, pte_level);
>   pte_t *table = PAGE_OFFSET(entry);
> 
> ~ Oleksii
> 
> 


