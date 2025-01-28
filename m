Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BB4A205A7
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 09:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878291.1288454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcgcy-0004jZ-N2; Tue, 28 Jan 2025 08:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878291.1288454; Tue, 28 Jan 2025 08:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcgcy-0004hA-Ja; Tue, 28 Jan 2025 08:07:20 +0000
Received: by outflank-mailman (input) for mailman id 878291;
 Tue, 28 Jan 2025 08:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcgcw-0004h4-SB
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 08:07:18 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e360ad58-dd4e-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 09:07:16 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so1159480566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 00:07:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760ab363sm734376666b.114.2025.01.28.00.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 00:07:15 -0800 (PST)
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
X-Inumbo-ID: e360ad58-dd4e-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738051636; x=1738656436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SQoNSt0lnND6dkyY2wW+hgZ69iufxKrBF7yRz4FxbLs=;
        b=SOCGvBBXT8CdCag/zf1mzL1bLXoYd0dlF1bcHq6UV8p9LLQLb16gzNHJUHMUsd8i3b
         T/Wqc739xLS2Z6vC351JxDvICr1HCqtjWyCadcEWO2HeUgzCLwRLTWtZVqfhhT6BrdLQ
         etvaV1EkGbL4+I9XgXeVTNLb44SbLDpNBoOts6ILCmsikm/xbGQfBbQNZ/eHUyuaOPqO
         sYQfkbejtk4LeedJQq1ZQO2jai4+FWX01qimqgKdahYZ+tMqxjBtPGZP/9/RaH2cPF2N
         Gto/seIQd6JVAVYsLgYKqIeEOlu23e6a4u2S5CPvaOBGQiwDJDf3yYXpdKU2GhjMsgow
         u7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738051636; x=1738656436;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQoNSt0lnND6dkyY2wW+hgZ69iufxKrBF7yRz4FxbLs=;
        b=U24TmCUVoxV1Ic01swDKORDhUk0+6ghXiw6YjwyCiqBvss6jOeaGSt3kirdjfVgpMP
         zUuvtwTQAY/w9y7zsfC1WyvH6uu7nkHaWPbFMkcvzcr3l2dBhvMpajDZuAIg4dqY5+0y
         9GAdqtPVRTVMTHhCUNIGqRRGClNWpjVmhPpVzI/4YM9ahvH6odBPHK6xGNzYQQ1lsSyM
         KR1IwQm959wt+v70Gc9p5miQQ+5MgWp1EB6ZX7xaFa+sOvCL1OVZmlYMyC1Bdjw+izI5
         KMyNvxxSqTD38JfdFZZqK0rykWlAi1lipfZ1U7NULI02lhhxNet/Mf40gFCWS7urp9+L
         bqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW4V63XQaol+YWQY3ayT5DPgLxS7wb9LystwdqNABPmSVPZDF1SrVNdoigBfFNH700V3A7M3AkhsI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9iCAns05uwT3MP2g38UcNoFOZaAFsr3QAaEmPGdK+gn638+IW
	JIL6x+rHOIRH5vMA56rCN4LF3eSd7bhkbQp4wuShLoVgpJnhgwDzl/YlJoH3FA==
X-Gm-Gg: ASbGncsf0brgGArMG1H5WRamJPpSRuZgjKa5nwqood2rzuYkOt+q0yw4mM2S66qVMDV
	9PjMX5W4yY7kgtoV0oUQLBrWiHwoHhkGTgEas8tin2Rr3v/CeFaSctNRSD7v2PTsCtIKxk1I7NX
	qLaRkaYB6gUM9hTU3E64yI3r/oq2yUACN5ecplQeTtSmU0ECeg2pCP5fCr8qd4VGP5Jxg8i5jE0
	THz0dj3Jy2LzsErVW2+beU4Hl/Kk+hHjdno+EiWMZ2KCC0SFI7+iGrNBq0qp7DzQA3R2jhEZCFV
	xFkGm/FvjCm12YkaFA1EJj7w3TQ0TZdtJlyxCv7/QvabTd9965USsaBiSmh5UgmtJpL94+11KC+
	AAQBuDh7kwn4=
X-Google-Smtp-Source: AGHT+IFBgG53KHfbzOEK6+47G4ZE8UmiRXwE3eGohCp3Z2loiHY/kUvdWoaHmdUNS2rqfr7i7pBU8Q==
X-Received: by 2002:a17:907:3e1e:b0:aab:eefd:4ceb with SMTP id a640c23a62f3a-ab38b0a2b92mr4333520966b.10.1738051635876;
        Tue, 28 Jan 2025 00:07:15 -0800 (PST)
Message-ID: <5d2a2c5d-4fa0-44fe-88a8-82a8cf979468@suse.com>
Date: Tue, 28 Jan 2025 09:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: implement software page table walking
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737391102.git.oleksii.kurochko@gmail.com>
 <00dfc71569bc9971b53e29b36a80e9e020ac61ac.1737391102.git.oleksii.kurochko@gmail.com>
 <21bfd2f5-74b8-409e-956c-dd736a3c0be2@suse.com>
 <e2290a2a-a3c0-4cfe-b9e9-8cfec0b194a8@gmail.com>
 <a304e4f0-709f-4fcd-9847-01fe6ab4b98c@suse.com>
 <d9ca4252-1bf0-4257-ad6b-e91240cc5de3@gmail.com>
 <67446e8f-71d4-480e-8566-1a464b6f6639@gmail.com>
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
In-Reply-To: <67446e8f-71d4-480e-8566-1a464b6f6639@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.01.2025 18:41, Oleksii Kurochko wrote:
> 
> On 1/27/25 6:22 PM, Oleksii Kurochko wrote:
>>
>>
>> On 1/27/25 1:57 PM, Jan Beulich wrote:
>>> On 27.01.2025 13:29, Oleksii Kurochko wrote:
>>>> On 1/27/25 11:06 AM, Jan Beulich wrote:
>>>>> On 20.01.2025 17:54, Oleksii Kurochko wrote:
>>>>>> RISC-V doesn't have hardware feature to ask MMU to translate
>>>>>> virtual address to physical address ( like Arm has, for example ),
>>>>>> so software page table walking in implemented.
>>>>>>
>>>>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>>>> ---
>>>>>>    xen/arch/riscv/include/asm/mm.h |  2 ++
>>>>>>    xen/arch/riscv/pt.c             | 56 +++++++++++++++++++++++++++++++++
>>>>>>    2 files changed, 58 insertions(+)
>>>>>>
>>>>>> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
>>>>>> index 292aa48fc1..d46018c132 100644
>>>>>> --- a/xen/arch/riscv/include/asm/mm.h
>>>>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>>>>> @@ -15,6 +15,8 @@
>>>>>>    
>>>>>>    extern vaddr_t directmap_virt_start;
>>>>>>    
>>>>>> +paddr_t pt_walk(vaddr_t va);
>>>>> In the longer run, is returning just the PA really going to be sufficient?
>>>>> If not, perhaps say a word on the limitation in the description.
>>>> In the long run, this function's prototype looks like|paddr_t pt_walk(vaddr_t root, vaddr_t va, bool is_xen)| [1]. However, I'm not sure if it will stay that way,
>>>> as I think|is_xen| could be skipped, since using|map_table()| should be sufficient (as it now considers|system_state|) and I'm not really sure if I need root argument
>>>> as initial goal was to use this function for debug only purposes and I've never used it for guest page table (stage-1) walking.
>>>> Anyway, yes, it is still returning a physical address, and that seems enough to me.
>>>>
>>>> Could you share your thoughts on what I should take into account for returning value, probably, I am missing something really useful?
>>> Often you care about the permissions as well. Sometimes it may even be relevant
>>> to know the (super-)page size of the mapping.
>> Perhaps it would be better to change the prototype to:
>>    bool pt_walk(vaddr_t va, mfn_t *ret_pa);
>> or even
>>    void pt_walk(vaddr_t va, mfn_t *ret_pa);
>>    In this case,|ret_pa = INVALID_MFN| could serve as a signal that|pt_walk()| failed.
>> If there's a need to return permissions or (super-)page size in the future, another argument could be added.
>> What do you think? Would this approach be better?
> 
> We have to return mfn_t or paddr_t as pt_walk() is used invmap_to_mfn().

That use doesn't really limit what the function needs to return. It merely
affects how simple (or complicated) the invocation there would be.

Jan

