Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943DAA2A71D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 12:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882751.1292852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfzqj-0007zM-IR; Thu, 06 Feb 2025 11:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882751.1292852; Thu, 06 Feb 2025 11:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfzqj-0007wg-FT; Thu, 06 Feb 2025 11:15:13 +0000
Received: by outflank-mailman (input) for mailman id 882751;
 Thu, 06 Feb 2025 11:15:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfzqi-0007wY-1V
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 11:15:12 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a15a5c6b-e47b-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 12:15:11 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso706451f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 03:15:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f8921bsm84093466b.66.2025.02.06.03.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 03:15:09 -0800 (PST)
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
X-Inumbo-ID: a15a5c6b-e47b-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738840510; x=1739445310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yb9nXFyTgT3ZoR/VG06jPj7w3dvnWZRkSUGNk4XbJPQ=;
        b=YO+4cKYJtLXXOwFPvDSD8LUgxyI/QyJ1RQL3sQ0E3is0ZZ6yi292AbJnDeVAG1EShZ
         Jg8Cl0CCNn+4/4mPg+nB3t3OoFCCGOCiToo9uHOQcDgEj532TMu13KMurfEHSRZZSQEv
         sUmUCLoWpXIk9q1PcGysiyEM3zvzeLu+KUb4guaChyluC0RbhsKSYVwipyz21dD1/aQ3
         mPDqIHS913qfldAcwIoqfxIUJV2XU9JbnQgSbFWf+plzUZ6kpnKXyOTSX8a2AO1Ipi1j
         +lITwxAL9b+sfsZnhIWexzaKfr3+C+Gpm5l/LenbNvUJyNMbFzcAlsJQFLNTYbAdDuLd
         ki7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738840510; x=1739445310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yb9nXFyTgT3ZoR/VG06jPj7w3dvnWZRkSUGNk4XbJPQ=;
        b=V7OG40kfCtentVNmlzoXnIrKB04T4n0LUtsG4cV5zE8di1zOQt0Lw2GGc6SjywKCwq
         mSR7hRd+XHYoPfKb61nHV2snlgoTHw8up/5VtwtZYVIniCYGTcprVb7GjCx+SrQkJ6qh
         BunxiDSWeAzs8ExigXPZjI0V2NdYxG5pZil32bXXj+FfbS5Ji1tdYPoH4tH44S4N17Yr
         5qQDv52m6gDCgz1m5G81aYHTWwneIfjwfqQpajsigWGmhLJ2/5wM+nv6v4EXhznG/jNf
         5MUvvWsgA/xSPVggsRxyTa4A8JWDshATEVbtyN7uay7fttPfFNIbkGT63G32JcO83c9m
         yFHA==
X-Forwarded-Encrypted: i=1; AJvYcCVudmYaAiqMnMZi8rAAGOj63AHIzMp6mwIL3J96rGGE3I707DaTPH80s6jubQ5pCS9HnLzCE2IAzx0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaqxJm1FFeBxCq6xpb1ijeZuQZ8CnqOFKnQ+3I0kbazRG7UjaS
	eGeshlQlJow08Spwpfk+p734HT7u0kqkV10Mk6Mp8Z+ppXzRFeVi/ggowIngjw==
X-Gm-Gg: ASbGncuZKF93oVoO4T+J3N0QWSLK4Vl0DdWj+ZSkMRFu8LomF0kc++FE2zZPECe+HYH
	MOdU8oOvhnG9hW38uOXB1rTWoxb8SlF1HrrVRLQ3fmTbLWF+3dClR12ThsFzLk5ajgvS0UtRXGc
	B3yyMmvZn2XTduB82mZtNDYccOberhs8nz976HG8Pdl4eMi0mIUJ+Es07SrlEfXKTpN4Ma4v1HQ
	g+6YLmn1XT2yWfxi5CHWTjelVRICMk5vKGdtqX1/IcUEF3NrvNH/iPbyx9Hiz3+nAyKYYyyEt0w
	60Yj1KtKMjhZgt1W36FhcPQYFOD4oOjZDFYceYzlmB8/i2Gpd4OIeeUTekPZ6HZf/Q9vPY0QtnQ
	S
X-Google-Smtp-Source: AGHT+IEDrnz6wB9GaTA+pX6OV9CPASBR0uVHwkLvylhZDQC0ZE8YjH8RuWGl28GkIuRBGbm381oxDA==
X-Received: by 2002:a5d:588c:0:b0:38d:af14:cb1 with SMTP id ffacd0b85a97d-38db49240camr5904436f8f.54.1738840510489;
        Thu, 06 Feb 2025 03:15:10 -0800 (PST)
Message-ID: <1bd07ce5-d5a9-4a60-b703-9861780692c6@suse.com>
Date: Thu, 6 Feb 2025 12:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for 4.20? 1/3] xen/riscv: implement software page table
 walking
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738587493.git.oleksii.kurochko@gmail.com>
 <a4f0b312351e5f6a9e57f50ebbc3bda8a72c18bb.1738587493.git.oleksii.kurochko@gmail.com>
 <475fc7fc-87ab-493e-8bef-eddeaa64aa54@suse.com>
 <c0d9a023-566b-4559-b6e3-e04cf34c6206@gmail.com>
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
In-Reply-To: <c0d9a023-566b-4559-b6e3-e04cf34c6206@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.02.2025 17:55, Oleksii Kurochko wrote:
> On 2/4/25 2:50 PM, Jan Beulich wrote:
>> On 03.02.2025 14:12, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/mm.h
>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>> @@ -156,6 +156,10 @@ static inline struct page_info *virt_to_page(const void *v)
>>>       return frametable_virt_start + PFN_DOWN(va - directmap_virt_start);
>>>   }
>>>   
>>> +#include <asm/page.h>
>> asm/page.h already includes asm/mm.h, so you're introducing a circular
>> dependency here (much of which the patch description is about, so it's
>> unclear why you didn't solve this another way). Afaict ...
>>
>>> +pte_t * pt_walk(vaddr_t va, unsigned int *pte_level);
>> ... it's pte_t that presents a problem here. Why not simply put the
>> declaration in asm/page.h (and drop all the secondary changes that
>> don't really belong in this patch anyway)?
> 
> In the patch 2 it is used for implementing vmap_to_mfn():
> 
>    static inline mfn_t vmap_to_mfn_(vaddr_t va)
>    {
>        pte_t *entry = pt_walk(va, NULL);
> 
>        BUG_ON(!pte_is_mapping(*entry));
> 
>        return mfn_from_pte(*entry);
>    }
> 
>    #define vmap_to_mfn(va)     vmap_to_mfn_((vaddr_t)va)mfn_from_pte
> 
> what leads to including of <asm/page.h> in <asm/mm.h>.
> 
> As an option, if to move the following to <asm/page.h>:
>    #define vmap_to_mfn(va)     vmap_to_mfn_((vaddr_t)va)
>    #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
> the circular dependency could be dropped.

I wouldn't like that, but it's an option, yes. Alternatives I can think of
right away:
- put the helper function an asm/page.h, but keep the macros where they are,
- convert the helper function to a helper macro.

Jan

