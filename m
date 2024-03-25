Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FBF889416
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 08:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697586.1088459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rof1u-0003JH-UT; Mon, 25 Mar 2024 07:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697586.1088459; Mon, 25 Mar 2024 07:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rof1u-0003H7-R8; Mon, 25 Mar 2024 07:46:02 +0000
Received: by outflank-mailman (input) for mailman id 697586;
 Mon, 25 Mar 2024 07:46:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rof1t-0003H1-D3
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 07:46:01 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8fe43e5-ea7b-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 08:46:00 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51381021af1so6146273e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 00:46:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n19-20020a170906119300b00a4660b63502sm2787957eja.12.2024.03.25.00.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 00:45:59 -0700 (PDT)
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
X-Inumbo-ID: b8fe43e5-ea7b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711352759; x=1711957559; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yb8CcBgcLohDb7X/nt8CRDOZcP5NhK4eWvJ8+1TfBPY=;
        b=UaPfIpjMB9oNCYAA4KpoRfNNj8YefWb3MHJWYcBwojXT7fr762bhJMfOc+J+rlVTcR
         YN6p9zFYs0aHp4vJ81YJIsLncC8/9ybQNEwyTYejF9GpV4CMyyrWr3X4m8I3TcNLFoZ6
         2A4np5mikQyOZW4r7LqVvXe1RvmEy62eloQCWg/gPV04rnIbVzkH4se1aq3cNAVgANPX
         C5uzhGD8umdiefmLcyu6fptcA5l9lV5qnJLeFn9qXDVwaeZspZJgXQ5MQOU4Gv9HDQRW
         618hz9GriQP6OukE7vCJPJr7RynfAairXqgsO5vEFsUJXMW06t8ZwlXelQklyj1uh5Zw
         ogdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711352759; x=1711957559;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yb8CcBgcLohDb7X/nt8CRDOZcP5NhK4eWvJ8+1TfBPY=;
        b=AcbPlo7pPE8bfsix8EG13QPDfFmJAyL2ne5w1Mkxaz/9s0+7Cz6feEN+UBMpQzTz8+
         4ANdnpZqlU8AEfkDCxRFcoBj3RMIzHLsNcpnya0lQLUTeD6htpK2IUT/wifVIR2jk3PS
         3GAZbN/uyMk4eqwUcuOl40gsvG9f+nefkhS36j33NwmO+Oamc2AE7G6AnwA9i1SrO0SY
         ihNUdcqQXQ+7mZEGOg9O5sR6+Q9bAw6/yJADlzNyMiDS07uE2wBW3JB/sRLCYK/SPSxT
         uBu7BEfJSMekYis561Pt9XRsKXUat7xy/KdoSgRIZkbk6J5akaKE+0i2Kgck5Vzx03d9
         2FOA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ3xeewSbzO9RBJK0131B4Tfp8+btESSnOPcXThi7b299snndcQ83i/6gRZL3sGZV6ranx3TbLQkJb9WHGN/MY+17AeGEvuZtzWnG1+gc=
X-Gm-Message-State: AOJu0Yy5wwpFaYPunEH2tJkE/c3xgjDxo5oXITWp4oUg8Ld63jwPJ5Bm
	9eLhN1NLzpY4JvP4hYU5vUL2fUsBozE6MN/qc/7o1fQx3f4ey6YHN8Tnvm6CKw==
X-Google-Smtp-Source: AGHT+IEltR00OIpIpmIOnz13CIUGNx3hzKHB7smB3WtwDwQpfqeODvSp1271FCXvqFSDH9KNXBuDNg==
X-Received: by 2002:ac2:446b:0:b0:515:8dd3:e94d with SMTP id y11-20020ac2446b000000b005158dd3e94dmr3949052lfl.68.1711352759472;
        Mon, 25 Mar 2024 00:45:59 -0700 (PDT)
Message-ID: <b0e4d3e0-f760-4ba2-a90b-f8c5ddb676ad@suse.com>
Date: Mon, 25 Mar 2024 08:46:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240319205849.115884-1-jason.andryuk@amd.com>
 <20240319205849.115884-4-jason.andryuk@amd.com>
 <ad5ef9ee-d509-435d-943c-8d7005c823d2@suse.com>
 <183f17a2-cc7b-46c6-81b5-ac1f5daacb7b@amd.com>
 <63cad597-b48f-43df-8d53-0ee8c1aa744d@amd.com>
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
In-Reply-To: <63cad597-b48f-43df-8d53-0ee8c1aa744d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.03.2024 15:24, Jason Andryuk wrote:
> On 2024-03-21 09:45, Jason Andryuk wrote:
>> On 2024-03-20 10:39, Jan Beulich wrote:
>>> On 19.03.2024 21:58, Jason Andryuk wrote:
> 
>>>> @@ -536,6 +565,10 @@ elf_errorstatus elf_xen_parse(struct elf_binary 
>>>> *elf,
>>>>       parms->p2m_base = UNSET_ADDR;
>>>>       parms->elf_paddr_offset = UNSET_ADDR;
>>>>       parms->phys_entry = UNSET_ADDR32;
>>>> +    parms->phys_min = 0;
>>>> +    parms->phys_max = 0xffffffff;
>>>> +    parms->phys_align = 0x200000;
>>>
>>> I think this wants to be MB(2) (requiring a pre-patch to centralize MB()
>>> in the tool stack to tools/include/xen-tools/common-macros.h). And I
>>> further think this needs to be an arch-specific constant, even if right
>>> now the note is expected to be present only for x86. Which then also
>>> needs saying ...
> 
> Are you thinking something like the following in libelf-dominfo.c:
> 
> #define X86_PHYS_ALIGN_DEFAULT MB(2)
> #define X86_PHYS_MAX_DEFAULT (GB(4) - 1)
> 
> and setting as:
> parms->phys_max = X86_PHYS_MAX_DEFAULT;
> parms->phys_align = X86_PHYS_ALIGN_DEFAULT;
> 
> libelf is arch neutral, so there isn't a natural place to introduce 
> arch-specific defines.  Or were you looking for each arch to set it?  We 
> only care about x86 right now, so we can do something like:
> 
> #if x86
> #define ARCH_PHYS_MAX_DEFAULT   (GB(4) - 1)
> #define ARCH_PHYS_ALIGN_DEFAULT MB(2)
> #else
> #define ARCH_PHYS_MAX_DEFAULT   0
> #define ARCH_PHYS_ALIGN_DEFAULT 0
> #endif

More like the latter. The former only if the phys_* fields themselves were
to also become x86-only.

As you say, libelf in its present shape doesn't easily lend itself to such
arch-specifics.

Jan

