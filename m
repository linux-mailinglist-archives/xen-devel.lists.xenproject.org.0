Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1072A9E857
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 08:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970061.1358840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9I64-0001Dq-Mk; Mon, 28 Apr 2025 06:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970061.1358840; Mon, 28 Apr 2025 06:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9I64-0001Ai-K8; Mon, 28 Apr 2025 06:36:08 +0000
Received: by outflank-mailman (input) for mailman id 970061;
 Mon, 28 Apr 2025 06:36:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9I62-0001Ac-Cn
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 06:36:06 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06e17db0-23fb-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 08:35:50 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so3347901f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 27 Apr 2025 23:35:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8c95dsm9971401f8f.3.2025.04.27.23.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Apr 2025 23:35:50 -0700 (PDT)
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
X-Inumbo-ID: 06e17db0-23fb-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745822150; x=1746426950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JvQlf7d7ws5QQg8boRng+OFq9yx/9MvD4gaKrMnhkEY=;
        b=a59cYc0kW+84CoTEh5Sv8qfQfV4Po0tQLRp4oKMjFiSfbZCV0zBb9aEDLwOUrCRCrZ
         GhfBwMa7+pGkR6kO3hIdWxChc80Ie0PLdIPcPcj58LmTgnvurVrDkmiVyYo1cSYTWh2/
         58adZD0y/5mmrmDzUWmRp7kR0KpsBNlNzqJzUTUb4tOEyCfNAwbxt5wUsui/P3hGSDTN
         uf6K0kmYzBqffxs2ENIGCrq1rqenenGyIlVvKzuFCbslqf7fIee6Fv3PIDx9ZC5ulwg/
         MrjoGlnyER7j7S67LkJ/qJYYeNAMcU4XH8TAfcVCJrcirZJdsmT7HmU0j+MzjzvbgNdI
         JDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822150; x=1746426950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvQlf7d7ws5QQg8boRng+OFq9yx/9MvD4gaKrMnhkEY=;
        b=IYIB5nSp+B6WybAqBnJOvpTxzRqF1W+B1mWeKGQIPuNAhysrx+DIkiblGudR1lexqN
         bjP9eL4bWAZe8yNHZs/xkrFgxxa79kUyOy1W0+RhuAVN8HfgBAS3lQ960y2sDzEfGmHX
         XG3pqqUcJkubtO6hA5/MuGwuCuCS4Vjb/imUnku2OlEYYMh3Vjg6hetHqPa73qsi9o5Y
         idEey3cP/tY+oZ8LglMN4eHvrpgcRVNyHFarc34YP1WbJ6VjdPcBAM7wpGxf42xx8P70
         khxZyYxbMiupOycUtw/ehYaZ2pMd2K/rzJSs86yuOQ9kGBdvEYgjPY9ewLxsQoLqHFIR
         21zw==
X-Forwarded-Encrypted: i=1; AJvYcCW8VDZVRdDgOe9k4t0hKEszRxxGmf3HYPzqmywWhHVXX+sZ0uFcl0JnQPEsOi+oyQnvq2CMwlRSYfk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylA7b0AN7EEMOaeoGmlUDS0kALJ4YBd2HA7bg+LrvETtjC3ra7
	H12tyAjhukk8dNQp+7CD/aAtfy87mRmCCClScO2Uu53o+Bz3ZDkm3D0I5CUDLg==
X-Gm-Gg: ASbGnctzx7QbZBLkkG19KkaW3VCQnVZ0Mp1+Vs0y1bSytzArN90JMFeF0tBfoxZ9CaZ
	0SUiaq3/C+V6m4C7Owsva3NV0y9oa3wb2Y3CioYR1P9Ln36hrglJ8ZOQdseM3Gu9xMVpIkiUt2s
	aRAdjy/YLSXCM30MHcXsWYRrQK4Hm50hJp2cp+zznRmYMZ1qyoKpw9JiYBBtVHuzzDZEctEOhsT
	/HjdNglesl4GgFy7jGkKGuLofnCBpamo57oSWlMXma4lVaJ9OahaozI3pBhhNti0DwpSZcIE3r4
	K2Hp3iCDRg1Y2pjwedu1iGJpEvFs6oixtfWvhVgYBJB43GpHTW1l/1ZOA9tPK0nQ/tT4zXcalSi
	UVOVBNY1Cg9f6wgTwXeABjh7EwQ==
X-Google-Smtp-Source: AGHT+IG3vnwsSAFbFujeNGTupttJLmVTFn+aI/sMKLCjDpBzqZuXAm/5xHH6FAoyLDL1yYMe4+fqXA==
X-Received: by 2002:a05:6000:430a:b0:3a0:8495:d66f with SMTP id ffacd0b85a97d-3a08495d6admr1555947f8f.23.1745822150376;
        Sun, 27 Apr 2025 23:35:50 -0700 (PDT)
Message-ID: <a70e8d12-ba4c-4eed-9298-d1d252a32860@suse.com>
Date: Mon, 28 Apr 2025 08:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/14] xen/riscv: implementation of aplic and imsic
 operations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <74a07ed7c596bbcf581010685e01bfdfa19164f5.1744126720.git.oleksii.kurochko@gmail.com>
 <3426df1b-938a-4d20-a533-dd6695473db0@suse.com>
 <5f922b70-d4c2-4e6e-ad05-f91afc70ee73@gmail.com>
 <d63a6410-7053-4f75-aeda-6cd4e36bd302@suse.com>
 <36eaf6df-4474-4252-bc82-054a7d00343a@gmail.com>
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
In-Reply-To: <36eaf6df-4474-4252-bc82-054a7d00343a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.04.2025 21:31, Oleksii Kurochko wrote:
> 
> On 4/22/25 9:02 AM, Jan Beulich wrote:
>> On 18.04.2025 12:43, Oleksii Kurochko wrote:
>>> On 4/15/25 4:53 PM, Jan Beulich wrote:
>>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/imsic.c
>>>>> +++ b/xen/arch/riscv/imsic.c
>>>>> @@ -14,12 +14,68 @@
>>>>>    #include <xen/errno.h>
>>>>>    #include <xen/init.h>
>>>>>    #include <xen/macros.h>
>>>>> +#include <xen/spinlock.h>
>>>>>    #include <xen/xmalloc.h>
>>>>>    
>>>>>    #include <asm/imsic.h>
>>>>>    
>>>>>    static struct imsic_config imsic_cfg;
>>>>>    
>>>>> +#define imsic_csr_set(c, v)     \
>>>>> +do {                            \
>>>>> +    csr_write(CSR_SISELECT, c); \
>>>>> +    csr_set(CSR_SIREG, v);      \
>>>>> +} while (0)
>>>>> +
>>>>> +#define imsic_csr_clear(c, v)   \
>>>>> +do {                            \
>>>>> +    csr_write(CSR_SISELECT, c); \
>>>>> +    csr_clear(CSR_SIREG, v);    \
>>>>> +} while (0)
>>>> Coming back to these (the later patch adds one more here): How expensive are
>>>> these CSR writes? IOW would it perhaps make sense to maintain a local cache
>>>> of the last written SISELECT value, to avoid writing the same one again if
>>>> the same windowed register needs accessing twice in a row?
>>> CSRs belong to the HART, so access to them is very fast.
>> Can you back this by any data? I view CSRs as somewhat similar to x86'es MSRs,
>> and access (writes in particular) to some of them is rather slow.
> 
> CSR read 1 cycle, CSR write 7 cycles on Microchip platform. ~ Oleksii

And that's an in-order platform, i.e. cycle count being all that matters for
performance? No other (e.g. latency) effect on subsequent insns?

Further, how does this compare to the outlined alternative, especially if we
assumed that the respective cacheline would be hot and hence usually in L1
cache?

Jan

