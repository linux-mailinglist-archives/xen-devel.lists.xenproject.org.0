Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F389B30E2
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 13:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826474.1240758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PAe-0008Ux-Jd; Mon, 28 Oct 2024 12:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826474.1240758; Mon, 28 Oct 2024 12:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PAe-0008S9-Gt; Mon, 28 Oct 2024 12:48:32 +0000
Received: by outflank-mailman (input) for mailman id 826474;
 Mon, 28 Oct 2024 12:48:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5PAc-0008Ra-6G
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 12:48:30 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee4af18a-952a-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 13:48:29 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37d49ffaba6so2999714f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 05:48:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bdafsm9410148f8f.30.2024.10.28.05.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 05:48:28 -0700 (PDT)
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
X-Inumbo-ID: ee4af18a-952a-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730119708; x=1730724508; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HVV0i1f9aQh1KEK0+Ek6PfNU2orVxs3qS14p3Ydb8pA=;
        b=SeI2IW57ZMagBFef38ed1/gO4x+S03uN8KyPXeQ5A6xN6VjMGozRXPZ6EAsd1V18zD
         Vt7QSPklMbqRDPna1uh2H7hgGgyVuNjRSnZtaURtckYN2Y5JiTL941SlVX1YRrG438af
         prunrwan1CPTuQajM2xbbJkbg2WDA7a51LmZ/1OwHQm41uzuUhxMcaJ0rCCrN3EwlFAC
         ypAmQez208jV3Kfpa7PTGcy37mzn4SQEBK/KYXUqsHA6qOWVUyOCWwoagEgli6pOA782
         DCjkIqB4JerIkR28YGEcqSfwesc/wJpp+glbnET+UaDoSnc+IDJ0FPryhygrLH0FaQtN
         Y02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119708; x=1730724508;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVV0i1f9aQh1KEK0+Ek6PfNU2orVxs3qS14p3Ydb8pA=;
        b=gd77lSBAMmXMWVpsL5iiz76b1zR8ngPNdMk9GjjxTknRDoPra8vT2iZbo17KG8EQ09
         UYSCtQKvmRwZIMMdSyDNGrQs/nBAfmO0BJMlEf9p3rVKVx1YiYcB9j6CrpBY8OSoM9fn
         O14w7Q9cwIMdygULo3SSAJ4izN2ztPukqNTKn1lorP4MxOc5ZwwLr2ZG0E7FW7bnMHVn
         FOI6GQMvmljZC6n4wullPyZs3mKf2lYQ08Qr5aycS/L4EuEEJUN6HHyj77C6ONWu+8NR
         diOs83OjSmrGv0le1WHO6zebXkyMheBQnP7TjzxRjHVAcaAABU27jusGun3OBH9K43gk
         oOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQkCtTS+OB3kR87p5puZTTX+7nG1Uc97f8BeD2HERSZ8tDjpYk0hIo0TWwwApXHePO+FCTfVfspTk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9nQ0GNHc/0Yvu2owmsR98Jb6RKctNXjuXS0e/623mOcmkr1ti
	8c90ZnsFFbcrRjQrf75kLwS0AIXaAZyLFnh0YRcuEsJ2FC82dYfk49us+P/88w==
X-Google-Smtp-Source: AGHT+IGYa4BEUHV65d+VfslMNcHWdxTibRMLZvBxVP/NmH+EjVgeB3HZ4RnYQuaN8L+9Bg2iukjYvQ==
X-Received: by 2002:adf:e851:0:b0:37d:45f0:b33 with SMTP id ffacd0b85a97d-380610e6444mr5752486f8f.9.1730119708604;
        Mon, 28 Oct 2024 05:48:28 -0700 (PDT)
Message-ID: <51632c96-9a12-4656-b8f8-1631c11a3a19@suse.com>
Date: Mon, 28 Oct 2024 13:48:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: remove usage of VLA arrays
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241028114831.27487-1-roger.pau@citrix.com>
 <3828ba9f-9bc8-4b65-a42f-b67ef061be52@citrix.com>
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
In-Reply-To: <3828ba9f-9bc8-4b65-a42f-b67ef061be52@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.10.2024 13:03, Andrew Cooper wrote:
> On 28/10/2024 11:48 am, Roger Pau Monne wrote:
>> Clang 19 complains with the following error when building libxl:
>>
>> libxl_utils.c:48:15: error: variable length array folded to constant array as an extension [-Werror,-Wgnu-folding-constant]
>>    48 |     char path[strlen("/local/domain") + 12];
>>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Replace the usage of strlen() with ARRAY_SIZE(), which allows the literal
>> string length to be known at build time.  Note ARRAY_SIZE() accounts for the
>> NUL terminator while strlen() didn't, hence subtract 1 from the total size
>> calculation.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  tools/libs/light/libxl_utils.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_utils.c
>> index 10398a6c8611..b3f5e751cc3f 100644
>> --- a/tools/libs/light/libxl_utils.c
>> +++ b/tools/libs/light/libxl_utils.c
>> @@ -45,7 +45,7 @@ unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb, unsigned
>>  char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
>>  {
>>      unsigned int len;
>> -    char path[strlen("/local/domain") + 12];
>> +    char path[ARRAY_SIZE("/local/domain") + 11];
>>      char *s;
>>  
>>      snprintf(path, sizeof(path), "/local/domain/%d/name", domid);
>> @@ -141,7 +141,7 @@ int libxl_cpupool_qualifier_to_cpupoolid(libxl_ctx *ctx, const char *p,
>>  char *libxl_cpupoolid_to_name(libxl_ctx *ctx, uint32_t poolid)
>>  {
>>      unsigned int len;
>> -    char path[strlen("/local/pool") + 12];
>> +    char path[ARRAY_SIZE("/local/pool") + 11];
>>      char *s;
>>  
>>      snprintf(path, sizeof(path), "/local/pool/%d/name", poolid);
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Although I have a minor preference for sizeof() as suggested by Frediano.
> 
> Can fix on commit, if you're happy?

Please can we stick to ARRAY_SIZE() when it comes to strings? It's the
same as sizeof() when the base type is char, but the difference becomes
relevant if the base type was e.g. wchar_t.

Jan

