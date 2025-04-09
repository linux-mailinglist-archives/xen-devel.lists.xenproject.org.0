Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2B5A821AB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 12:05:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943731.1342383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SIv-0007sI-VC; Wed, 09 Apr 2025 10:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943731.1342383; Wed, 09 Apr 2025 10:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SIv-0007pd-Ri; Wed, 09 Apr 2025 10:05:09 +0000
Received: by outflank-mailman (input) for mailman id 943731;
 Wed, 09 Apr 2025 10:05:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2SIv-0007pX-2z
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 10:05:09 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cf3e80c-152a-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 12:05:06 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso37562475e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 03:05:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075a593sm14804205e9.25.2025.04.09.03.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 03:05:05 -0700 (PDT)
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
X-Inumbo-ID: 1cf3e80c-152a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744193106; x=1744797906; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+MZ9LDlQVLzJKHK3NbI489Yx+hBmX1ikt6QAEymnCZ4=;
        b=ETvmZhZl/i0jTMu9YP6JA/Zm8wtMg1IeVpCBYXcbwsNRxm5/P6tmzcyfZPmvmTbDCU
         1hqPuZqueL5/rujHqR1whQFmbUUbj21MHbbRH4FHUbKaqPeTLkQZu8DcEWUmwwAjQQtU
         nW7qxjwQhfivaVy/0yWicsibXSabHpUTKk6fawT0L0KtJh6ykbi2gspiAZibSuNTXrN6
         vzxBzyMQjrnCk+Dml9YoPUuoz25cAVyZs1zhq+0i3BcnAnAJHT4oCtImTDHOohxarnPZ
         FMRInbh/IxWZvt/6Z8G3i5PThcriA19rGVzh6GoVl4KpZ/qGCzm6gWhR4qJAsr1GWv+I
         QMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744193106; x=1744797906;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MZ9LDlQVLzJKHK3NbI489Yx+hBmX1ikt6QAEymnCZ4=;
        b=MiIR7kH99CYcc6LO1AXNgq2cpfUc/LnaavBTRsEngsvRIm5k7D9/ek0yC+C+30qfKQ
         iRLNP+g/+9TttErg/e2kN9/2iTIBOQSP+PJ50CfXfw00y9ev1krVAlKVQV143vLKDjB3
         aAamu+WTzFxIbkjpHASxAjjDZkIHPp6Az4OqLjo0aUP8vSqf4kNpgHIE88oO16+GrotT
         raNgHffLe/Ad3zO5/TgzK9e8AxLfsYx3BWU/+7LBymF+v6QZcreZooptSoMFecFU40H4
         B0JnzwO4ZUf2pHAghIRVxOM3ZIRiE1xeWWgDmwOXS+rZamI1VYKaqvD6sGzZInxRiYdt
         A3nA==
X-Forwarded-Encrypted: i=1; AJvYcCVkUnBuyHRymjR5+Bz7kw1u1SkR+KkKmSciM7FnCjqhsBfKZwcGIL+f6MOxZkTupz7vIlaU2qWlHdo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyK2thDLCPM4YY8sgDT/cBhBGUX90j9YBtrpkk8DedYwT87FhDh
	UOHy9ZjITwxwq6NxtgI9/637srzzPWUcgWv18e0+Y8vTGiQm4148lnKHhnTE4g==
X-Gm-Gg: ASbGncsu9t3ukbNvuW4VwM/9gC+ZhkMuDWk0S58ssoGeWh5+T1tgj8yOr/PNIbmxBR/
	KD6jmCP+VuFp4O0AknLAwJb57lus9haFQrDLZdCd8N+17HQI6iEiX8eaUd0NwPZ3ggL++5DuvXk
	xhv0fOPeh2owqzl0r4VfM9r7O9VIAQhImhQU+pU8WuALRcmvveMNmRuwFuhJk4eVQ8lIAs9wZZU
	vg2mqJZuAzRzaHVEbshy9vkCaqtYKUjjvcHK9/Na/NGmynYd97YE2Ulo0TBp/0fUWghdqiN6t/Y
	SJaxGGm6rRMIHBYm615QNZbm57gXgceB0d65fpC9r1YqBlbxjjuUA+13hA1ZdHvXh48zX2xHd86
	7E6QNFu8oHicxGfMR19yK0B9tBQ==
X-Google-Smtp-Source: AGHT+IErNWXpyMTxwRgUr2hbvUpv+Fw/FkUwSN/akl0zSUlwJziWYsIpIgP7DRjTOhQ9UjJnd24fTg==
X-Received: by 2002:a05:600c:1913:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-43f1ed6e71cmr16549325e9.28.1744193106274;
        Wed, 09 Apr 2025 03:05:06 -0700 (PDT)
Message-ID: <223f03ce-e157-4583-9b64-3cff0cd5823d@suse.com>
Date: Wed, 9 Apr 2025 12:05:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: Increase XEN_VIRT_SIZE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <808d1b346bc90dde38fd19a6b92ab78d78e42936.1743766932.git.oleksii.kurochko@gmail.com>
 <e5f6ccb3-498f-44cf-8c06-61fa502d93db@suse.com>
 <f35a9969-6154-4e9a-b997-16ca135e85ee@gmail.com>
 <8b2e50f2-1f89-41df-be88-afc9ef24b51a@suse.com>
 <c3b1be9a-d5f5-4cac-a675-7485a99bf51c@gmail.com>
 <fde6c1c2-c439-4020-9301-025b7e8af804@suse.com>
 <3bd6cdb7-8de0-4559-bc56-b20c52fd73db@gmail.com>
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
In-Reply-To: <3bd6cdb7-8de0-4559-bc56-b20c52fd73db@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2025 11:06, Oleksii Kurochko wrote:
> On 4/8/25 4:04 PM, Jan Beulich wrote:
>> On 08.04.2025 15:46, Oleksii Kurochko wrote:
>>> On 4/8/25 2:02 PM, Jan Beulich wrote:
>>>> On 08.04.2025 13:51, Oleksii Kurochko wrote:
>>>>> On 4/7/25 12:09 PM, Jan Beulich wrote:
>>>>>> On 04.04.2025 18:04, Oleksii Kurochko wrote:
>>>>>>> --- a/xen/arch/riscv/mm.c
>>>>>>> +++ b/xen/arch/riscv/mm.c
>>>>>>> @@ -31,20 +31,27 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>>>>>>>     #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>>>>>>>     
>>>>>>>     /*
>>>>>>> - * It is expected that Xen won't be more then 2 MB.
>>>>>>> + * It is expected that Xen won't be more then XEN_VIRT_SIZE MB.
>>>>>>>      * The check in xen.lds.S guarantees that.
>>>>>>> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
>>>>>>> - * One for each page level table with PAGE_SIZE = 4 Kb.
>>>>>>>      *
>>>>>>> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
>>>>>>> + * Root page table is shared with the initial mapping and is declared
>>>>>>> + * separetely. (look at stage1_pgtbl_root)
>>>>>>>      *
>>>>>>> - * It might be needed one more page table in case when Xen load address
>>>>>>> - * isn't 2 MB aligned.
>>>>>>> + * An amount of page tables between root page table and L0 page table
>>>>>>> + * (in the case of Sv39 it covers L1 table):
>>>>>>> + *   (CONFIG_PAGING_LEVELS - 2) are needed for an identity mapping and
>>>>>>> + *   the same amount are needed for Xen.
>>>>>>>      *
>>>>>>> - * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
>>>>>>> - * except that the root page table is shared with the initial mapping
>>>>>>> + * An amount of L0 page tables:
>>>>>>> + *   (512 entries of one L0 page table covers 2MB == 1<<XEN_PT_LEVEL_SHIFT(1))
>>>>>>> + *   XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1) are needed for Xen and
>>>>>>> + *   one L0 is needed for indenity mapping.
>>>>>>> + *
>>>>>>> + *   It might be needed one more page table in case when Xen load
>>>>>>> + *   address isn't 2 MB aligned.
>>>>>> Shouldn't we guarantee that?
>>>>> I think it's sufficient to guarantee 4KB alignment.
>>>>>
>>>>> The only real benefit I see in enforcing larger alignment is that it likely enables
>>>>> the use of superpages for mapping, which would reduce TLB pressure.
>>>>> But perhaps I'm missing something?
>>>> No, it's indeed mainly that.
>>> But then the linker address and the load address should both be aligned to a 2MB or 1GB boundary.
>>> This likely isn't an issue at all, but could it be a problem if we require 1GB alignment for the
>>> load address? In that case, might it be difficult for the platform to find a suitable place in
>>> memory to load Xen for some reason? (I don't think so but maybe I'm missing something)
>> Why would load address need to be 1Gb aligned? That (as well as 2Mb-)alignment
>> matters only once you set up paging?
> 
> Mostly yes, it matters only once during paging set up.
> 
> I was thinking that if, one day, 2MB (or larger) alignment is used and the load address isn't
> properly aligned, some space in a page might be lost.
> (The word "should" above wasn't entirely accurate.)

Actually I think I was wrong with my question. Load address of course matters to
a sufficient degree, especially if at 2Mb boundaries to want to be able to change
what permissions to use (without sacrificing the 2Mb mappings).

Jan

