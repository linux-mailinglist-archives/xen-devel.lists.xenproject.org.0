Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0543D989CD4
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 10:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807119.1218376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBpY-0004eV-Nu; Mon, 30 Sep 2024 08:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807119.1218376; Mon, 30 Sep 2024 08:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBpY-0004bm-L0; Mon, 30 Sep 2024 08:32:32 +0000
Received: by outflank-mailman (input) for mailman id 807119;
 Mon, 30 Sep 2024 08:32:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svBpX-0004bg-GL
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 08:32:31 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88146e6d-7f06-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 10:32:30 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5398b589032so2429490e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 01:32:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2775b3csm493541266b.27.2024.09.30.01.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 01:32:29 -0700 (PDT)
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
X-Inumbo-ID: 88146e6d-7f06-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727685149; x=1728289949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VwR1c99uznRvNM+FbO2dctBNmFZh1L2rgGnUbF5ia24=;
        b=eerxMwgAEy/5z1bhvvzB9/LNkTDFgwNuKYjzeJxCl5hpyzJREp3HVqBH9Q2pTtNI5x
         XMykia4MlQyZMJlKARp0KB7X9tTDd41e9Jaa5Jr+R2gGBSJd7CHyVMq9sBKfRDv/09iH
         KR7+C/IdUCjTXBKd2RVWHUY9HbeYMsXPZzk66kw0gPs8c++461b1jfecJQugTAq+nD+2
         f9pH6uoFYyU4SjT9bspCtBBv4ThbmXM1F82KNWhwgkyVPD23ukG9wFtILAfZFfQa2dw0
         0HkySusNwNhwo7qNQuuuMjeskvnalyu1X1tgNqGeVIX+vMBdGUAm8l/U/SUoUf128ePq
         K83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727685149; x=1728289949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwR1c99uznRvNM+FbO2dctBNmFZh1L2rgGnUbF5ia24=;
        b=S+gRsOMAwtKstC+fMV/DLLhbm5XwP1dfZf6hkDQizJlWzgEgVTsupp91Coe9MimmMB
         o46VDAE/pHIkjGRZB8ELXRwtCOoK3RjVY/fHM3ED0rM+QAlllOQ8ySJ4F14VEiaLnSZW
         EG0I9KY0ntD6XeElDBpU106gwBRgBPjNM9dvlnE5x2zxvZ8iltUK1SbapzySyWv63iCw
         uHIAs59f41apR1nyQDYNYetqSsjHbgNJYo0QFGdeZ9PvZtpwVmGtT7OXF0zKXUkcUezK
         jyZoUkoUaNV3VFugXnCtUImAjBH82JEVzurvDsrw6VtUl37FbpthrQBOS2ct5PDx4Pkh
         tqbA==
X-Forwarded-Encrypted: i=1; AJvYcCWM2WuhD45pYHERH3hlQppizVBWB/M05s91Omym/bb4y9eoiHQ7KTT7vU4k8pN2NmZ9MtC+ykRDLbI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFp4np3BtLJlvExFjXQeKFfJaFYL8EZMl+VEHIFVWQznFAr92N
	AlzTmTw+y5UfC0VPNM2y3MJCWTQED5GKQ7VpG6749rS2ANTA340+TxsxPU5edg==
X-Google-Smtp-Source: AGHT+IE9tnfEK0l82S2G6VWVKCh76kEfNqj+Y/Y9ME9cWmSUYgqvoqvENwlt0xOiaTmcOKcgCQjXWg==
X-Received: by 2002:a05:6512:3c8f:b0:535:6aa8:dc49 with SMTP id 2adb3069b0e04-5389fc3441bmr7058864e87.9.1727685149518;
        Mon, 30 Sep 2024 01:32:29 -0700 (PDT)
Message-ID: <5565ec42-4985-44a0-a8ac-c348c24dcede@suse.com>
Date: Mon, 30 Sep 2024 10:32:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] device tree mapping
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
 <863cdc98-a811-485d-8c21-fbde9dedd070@suse.com>
 <f12ad3bbe24b611c68be75abeab722571fe4e655.camel@gmail.com>
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
In-Reply-To: <f12ad3bbe24b611c68be75abeab722571fe4e655.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.09.2024 10:24, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-09-30 at 10:17 +0200, Jan Beulich wrote:
>> On 27.09.2024 18:33, Oleksii Kurochko wrote:
>>> Current patch series introduces device tree mapping for RISC-V
>>> and necessary things for that such as:
>>> - Fixmap mapping
>>> - pmap
>>> - Xen page table processing
>>
>> While nothing is being said here towards a dependency, ...
>>
>>> ---
>>> Changes in v8:
>>>  - The following patch was merged to staging:
>>>      [PATCH v5 1/7] xen/riscv: use {read,write}{b,w,l,q}_cpu() to
>>> define {read,write}_atomic()
>>>  - All other changes are patch specific so please look at the
>>> patch.
>>> ---
>>> Changes in v7:
>>>  - Drop the patch "xen/riscv: prevent recursion when ASSERT(),
>>> BUG*(), or panic() are called"
>>>  - All other changes are patch specific so please look at the
>>> patch.
>>> ---
>>> Changes in v6:
>>>  - Add patch to fix recursion when ASSERT(), BUG*(), panic() are
>>> called.
>>>  - Add patch to allow write_atomic() to work with  non-scalar types
>>> for consistence
>>>    with read_atomic().
>>>  - All other changes are patch specific so please look at the
>>> patch. 
>>> ---
>>> Changes in v5:
>>>  - The following patch was merged to staging:
>>>      [PATCH v3 3/9] xen/riscv: enable CONFIG_HAS_DEVICE_TREE
>>>  - Drop depedency from "RISCV basic exception handling
>>> implementation" as
>>>    it was meged to staging branch.
>>>  - All other changes are patch specific so please look at the
>>> patch.
>>> ---
>>> Changes in v4:
>>>  - Drop depedency from common devicre tree patch series as it was
>>> merged to
>>>    staging.
>>>  - Update the cover letter message.
>>>  - All other changes are patch specific so please look at the
>>> patch.
>>> ---
>>> Changes in v3:
>>>  - Introduce SBI RFENCE extension support.
>>>  - Introduce and initialize pcpu_info[] and __cpuid_to_hartid_map[]
>>> and functionality
>>>    to work with this arrays.
>>>  - Make page table handling arch specific instead of trying to make
>>> it generic.
>>>  - All other changes are patch specific so please look at the
>>> patch.
>>> ---
>>> Changes in v2:
>>>  - Update the cover letter message
>>>  - introduce fixmap mapping
>>>  - introduce pmap
>>>  - introduce CONFIG_GENREIC_PT
>>>  - update use early_fdt_map() after MMU is enabled.
>>> ---
>>>
>>> Oleksii Kurochko (7):
>>>   xen/riscv: allow write_atomic() to work with non-scalar types
>>>   xen/riscv: set up fixmap mappings
>>>   xen/riscv: introduce asm/pmap.h header
>>>   xen/riscv: introduce functionality to work with CPU info
>>>   xen/riscv: introduce and initialize SBI RFENCE extension
>>>   xen/riscv: page table handling
>>>   xen/riscv: introduce early_fdt_map()
>>>
>>>  xen/arch/riscv/Kconfig                      |   1 +
>>>  xen/arch/riscv/Makefile                     |   2 +
>>>  xen/arch/riscv/include/asm/atomic.h         |  11 +-
>>>  xen/arch/riscv/include/asm/config.h         |  16 +-
>>>  xen/arch/riscv/include/asm/current.h        |  27 +-
>>>  xen/arch/riscv/include/asm/fixmap.h         |  46 +++
>>>  xen/arch/riscv/include/asm/flushtlb.h       |  15 +
>>>  xen/arch/riscv/include/asm/mm.h             |   6 +
>>>  xen/arch/riscv/include/asm/page.h           |  99 +++++
>>>  xen/arch/riscv/include/asm/pmap.h           |  36 ++
>>>  xen/arch/riscv/include/asm/processor.h      |   3 -
>>>  xen/arch/riscv/include/asm/riscv_encoding.h |   2 +
>>>  xen/arch/riscv/include/asm/sbi.h            |  62 +++
>>>  xen/arch/riscv/include/asm/smp.h            |  18 +
>>>  xen/arch/riscv/mm.c                         | 101 ++++-
>>>  xen/arch/riscv/pt.c                         | 421
>>> ++++++++++++++++++++
>>>  xen/arch/riscv/riscv64/asm-offsets.c        |   3 +
>>>  xen/arch/riscv/riscv64/head.S               |  14 +
>>>  xen/arch/riscv/sbi.c                        | 273 ++++++++++++-
>>>  xen/arch/riscv/setup.c                      |  17 +
>>
>> ... I had to fiddle with three of the patches touching this file, to
>> accommodate for an apparent debugging patch you have in your tree.
>> Please can you make sure to submit patches against plain staging, or
>> to clearly state dependencies?
> I am always trying not to forget to rebase on top of staging for this
> patch series:
> 
> 65c49e7aa2 (HEAD -> riscv-dt-support-v8, origin/riscv-dt-support-v8)
> xen/riscv: introduce early_fdt_map()
> ead52f68ce xen/riscv: page table handling
> c3aba0520f xen/riscv: introduce and initialize SBI RFENCE extension
> 3ffb3ffd38 xen/riscv: introduce functionality to work with CPU info
> 4bfd2bfdb2 xen/riscv: introduce asm/pmap.h header
> 87bc91db10 xen/riscv: set up fixmap mappings
> 09b925f973 xen/riscv: allow write_atomic() to work with non-scalar
> types
> 625ee7650c xen/README: add compiler and binutils versions for RISC-V64
> 5379a23ad7 xen/riscv: test basic exception handling stuff
> 2b6fb9f3c4 (origin/staging, origin/HEAD, staging) blkif: Fix a couple
> of typos
> 6e73a16230 blkif: Fix alignment description for discard request
> 0111c86bfa x86/boot: Refactor BIOS/PVH start

This looks to be a mix of several series. And "xen/riscv: test basic
exception handling stuff" looks to be what the problem was with, as that
wasn't committed yet (and imo also shouldn't be committed, as expressed
before; of course you can try to find someone else to approve it).

Jan

