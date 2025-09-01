Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CBCB3EB5F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 17:49:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105148.1456111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6mL-0000ea-8x; Mon, 01 Sep 2025 15:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105148.1456111; Mon, 01 Sep 2025 15:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6mL-0000cT-5R; Mon, 01 Sep 2025 15:49:09 +0000
Received: by outflank-mailman (input) for mailman id 1105148;
 Mon, 01 Sep 2025 15:49:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut6mJ-0000c9-6o
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 15:49:07 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ca4fd5b-874b-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 17:48:59 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b0431c12df3so153055866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 08:48:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b02d8812161sm599091866b.73.2025.09.01.08.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 08:48:58 -0700 (PDT)
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
X-Inumbo-ID: 2ca4fd5b-874b-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756741738; x=1757346538; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+hPA0mW/bm6dUbRMya6CeQQl1OcdMHsjeOFXQMYk/+c=;
        b=e4ay2zBeCyjV3fixgNtm9FHX53lY8Xw8WXqLwy9PbGRzXi0DeyabR/jSZt4r6vNm9g
         vyidTmIOFoi8yHrKtE+lcy+BGaLZJz4zsmVAhXWjGhUF5tMWcWCt6ptkRVN1kTPti0w+
         NKysu6ZmH9BqmwPbO0MyoG6tspkljKwTPlgscI2fqL3fZnzi0dlmFfXdtJpgLOVnK0Er
         LmnbCXFP+GDXiAptKP0YNQMDwmHspqk8qhAnwSLvjRKNzDDygFrGasVey2WOZdIx6ZP4
         vCw2Vitlqh2V3RT/TXL+dvFObKEPOzkATNFwwNWS80EfS72oLXPReELcJBBAUO0eDybm
         5Jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756741738; x=1757346538;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hPA0mW/bm6dUbRMya6CeQQl1OcdMHsjeOFXQMYk/+c=;
        b=RvzDVvvsYJO5vcVbblowK/im567kBEYonnjd0v8mB/GIUbZk7JNrt+JEs2dFY6EWUZ
         9nld242yGBOnwKN2nFbSBwuGmzi8fOjQUuEVi6Fp8hn4DKFujdeR1Pk+x7kdI8LKDrcy
         Beu4SOgk0VWRky97L2qw4Qttx8fgcNb3YsyxQsxYNDPSP8vKlkrzuxgQKYYe3QrvvwBv
         REhNjP6B7asZPQNxIi89CukCVcozsFiHVFlNOUNlq+pSiEJMrbcuHTbEOtSHbvIn6qan
         3hm9g6E6jGJqS6X2XtD7sGAHvMgCXudeNzLR6A64Jl46i8vJAmEZ9+ZPrjRrvgQX8aPT
         Pr1g==
X-Forwarded-Encrypted: i=1; AJvYcCUsN+8AiJ9U6bkr6cs9dsNA9QcuG/hryAplBpO412TzjCm0WRibe5a4BMNYEiYr85CO+im3WNfsaDc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxX+3/dH++hxGwjvwcNZ/RN9f4tkaNyRxln9ldyBjyw0t/khoOW
	gfygdToOTTkZ3RUIUc3YR+LhJoc1vVprlgXzhYW3HetgEdfMMT5X3WG2eJICfwb2QA==
X-Gm-Gg: ASbGnctylVKV1jCefrcLSin2XTQzGod+OKWA3uAbAvSkQxx65dbz7eLordpQaYYXrGR
	TOoIhoAR/f1FNiXnk0zIpfbrPPG/CI+Qzvtiz3b/MsruaMlf0opHk64sHApPpOBFBZ2jXl7E0vS
	1rpvdY97KcM8K0QTn/YGqsmn1D6gB8rTvYFvRcVtA9GQUVTRsG+f92g5C18Rl2m3HYsPAG8Dk3O
	WmnRG4jtlR/7m87lSxPnvzsXsr7jn92nk4IDkduSpXKC65R1/NuAPDhN9W5/lZ++kav2goovBbi
	TDqQJRle06htMjIdUSSYKRRGkej8Y8TrgRvXJJLt25CZ82kPLlu1Vfh8Fb/VzRiFB+WvvyIKp78
	niyCehNDOmGV/uMDJnP8IJbKCCi1KoA/qMuWsiACn8oOPZ6jiEmf6Chw8Wln5V95n+/abcRSKPt
	aFR7UvnpKEDPDGCnQZSg==
X-Google-Smtp-Source: AGHT+IFu+oWE/Hh4nPjOIM6dPr4n/hwOkU9PeQYgS8C92nSRqtsBpidK+7wDtCDUDqLSvp3dDSfStA==
X-Received: by 2002:a17:907:944c:b0:afe:d49d:2888 with SMTP id a640c23a62f3a-b01f20e0d46mr805705366b.65.1756741738527;
        Mon, 01 Sep 2025 08:48:58 -0700 (PDT)
Message-ID: <0fa33a24-a6a4-40d9-88a8-af48350e1f4f@suse.com>
Date: Mon, 1 Sep 2025 17:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/9] hvm: Introduce "fixed memory layout" feature
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech>
 <640223e5e7ee18a73f62152dd27883bf5978fbfe.1755785258.git.teddy.astie@vates.tech>
 <5ba550db-5e36-4d98-bce7-cbb3e2d874b9@suse.com>
 <b3c490fc-e1ca-488e-b96c-e059bdbdb466@vates.tech>
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
In-Reply-To: <b3c490fc-e1ca-488e-b96c-e059bdbdb466@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2025 15:32, Teddy Astie wrote:
> Le 28/08/2025 à 14:30, Jan Beulich a écrit :
>> On 21.08.2025 17:25, Teddy Astie wrote:
>>> @@ -686,10 +691,31 @@ static int domain_construct_memmap(libxl__gc *gc,
>>>       /* We always own at least one lowmem entry. */
>>>       unsigned int e820_entries = 1;
>>>       struct e820entry *e820 = NULL;
>>> +    uint64_t highmem_start = ((uint64_t)1 << 32);
>>>       uint64_t highmem_size =
>>>                       dom->highmem_end ? dom->highmem_end - (1ull << 32) : 0;
>>>       uint32_t lowmem_start = dom->device_model ? GUEST_LOW_MEM_START_DEFAULT : 0;
>>>       unsigned page_size = XC_DOM_PAGE_SIZE(dom);
>>> +    /* Special region starts at the first 1G boundary after the highmem */
>>> +    uint64_t special_region_start =
>>> +        (highmem_start + highmem_size + GB(1) - 1) & ~(GB(1) - 1);
>>
>> That is, inaccessible before entering PAE mode?
> 
> Yes, I expect this to be only used by newer guests which hopefully 
> aren't limited to 4G range (i.e supports PAE or long mode). The issue of 
> trying to put that below 4G is that much of the space is already taken 
> for the MMIO hole, so that area would quite complicated with more 
> special regions.

Which excludes any boot loaders simple enough to not even require entering
paging mode.

>>> --- a/xen/include/public/arch-x86/hvm/start_info.h
>>> +++ b/xen/include/public/arch-x86/hvm/start_info.h
>>> @@ -99,6 +99,13 @@
>>>   #define XEN_HVM_MEMMAP_TYPE_DISABLED  6
>>>   #define XEN_HVM_MEMMAP_TYPE_PMEM      7
>>>   
>>> +/* Xen-specific types (OEM-specific range of the ACPI spec) */
>>> +#define XEN_HVM_MEMMAP_TYPE_SHARED_INFO   0xF0000001 /* Shared info page */
>>> +#define XEN_HVM_MEMMAP_TYPE_GRANT_TABLE   0xF0000002 /* Grant table pages */
>>> +#define XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS 0xF0000003 /* Grant table status page (v2) */
>>> +#define XEN_HVM_MEMMAP_TYPE_FOREIGN_REG   0xF0000004 /* Suitable region for grant mappings */
>>> +                                                     /* and foreign mappings */
>>
>> I question it being legitimate for us to introduce new E820 types.
> 
> These E820 types are (at least in ACPI specification) in the OEM-defined 
> range which seems appropriate for me to use for Xen-specific mappings.

Just that we're not an OEM.

Jan

