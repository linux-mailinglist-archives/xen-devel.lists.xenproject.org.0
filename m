Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C7982F225
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 17:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667845.1039520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPm0c-00082f-Lu; Tue, 16 Jan 2024 16:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667845.1039520; Tue, 16 Jan 2024 16:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPm0c-0007zT-Iu; Tue, 16 Jan 2024 16:09:50 +0000
Received: by outflank-mailman (input) for mailman id 667845;
 Tue, 16 Jan 2024 16:09:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjSB=I2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPm0b-0007zN-1l
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 16:09:49 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab8906d8-b489-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 17:09:47 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cdb50d8982so30890761fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 08:09:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n15-20020a5e8c0f000000b007bf60293ea3sm145171ioj.9.2024.01.16.08.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 08:09:46 -0800 (PST)
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
X-Inumbo-ID: ab8906d8-b489-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705421387; x=1706026187; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XPWajAfCByrDeumb5zJNtaMGK4gS/onriFTtCLTohA0=;
        b=Ykj8xjtavax+7zHQdxK63FVMXwqPcPLuQ4myfFrn5a//VUN5r2JUKL4/z+HQ6qyQ5h
         9Z/5KUNQwgLJtWmCD7VIuSvomnjcNvM3JZCs1CZxqaoTNqbWvsR96L78YejwBXYuAOeH
         atSghYd9kmfGdyMsZMo4Y1FAqWI7nkrV3v+oDpjDf6oNk4MVDfH3cM+LVbdpzquZXaJT
         5DQgJmWvkOcPIjfJnuzLN89Jb+6ce+qyTVxnym7cx5sY3WIIuV9GrPelNcMvE2sVj9pL
         V2Lfs19D57u+cKYX3ioUzhdUcNHZYZpsmn7P9CxCe5hhXs0cNtABnvx+q3/dHGPsFKk+
         ruGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705421387; x=1706026187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPWajAfCByrDeumb5zJNtaMGK4gS/onriFTtCLTohA0=;
        b=MsMh1m9c+jhcRtxV0JGYWHnpr+nIzNEDeCurMWO9+v+/9moYuCaQOAGN+qgAs4lWgh
         xCK5Vb/+iLyOh+jS/ApvjjLRUEDEMJDSMCgXjFatpcLTabONlCict2e8JGLUsH8lD5NF
         6uw8SMRit/wsbw0Jco6Y41XhhL4+vNAQ7T6qF083Oo46dgsONbFqsNCMFvrELAoqwGQ/
         EX8z1B5xGZ/ObGAZPaTK1J1oViOwF9GlXuZbZghErhCDfgaUg7KzT/G957lZ1Qi85I0P
         idustnxUwjr+XaRM/8sbtaY4X2Ds7l8nPHDnwp7r5lY3G63mXElLFAATRYFFUc9XjOrO
         +DRQ==
X-Gm-Message-State: AOJu0YwqNpu8MdRIfTZNgIeE5b0ETe4wJg5gMsSxmgAp0R2prCsdZ+Qi
	fCTl5oCEbUB0I8oy/DZF90DZAyNQES59
X-Google-Smtp-Source: AGHT+IEVYDnz+3IktX+A6A7sMI+eSg1oSSiRAyHJ/DKJh9BJGwVywZ3EcETBc9642cAd+1w6NIPFqg==
X-Received: by 2002:a2e:9e4b:0:b0:2cd:299e:bd28 with SMTP id g11-20020a2e9e4b000000b002cd299ebd28mr3295472ljk.59.1705421387250;
        Tue, 16 Jan 2024 08:09:47 -0800 (PST)
Message-ID: <39c97d1e-05f5-46b1-a242-7fc8d5639af5@suse.com>
Date: Tue, 16 Jan 2024 17:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/34] xen/riscv: introduce io.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <5d2c032481792a3fe5bd5f1cae42d95f6e9b54b1.1703255175.git.oleksii.kurochko@gmail.com>
 <895a60ba-547c-4064-9e4b-4ebf07dea5fb@suse.com>
 <c9977188e834f15e84d785e6cc1dc51d49da63d2.camel@gmail.com>
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
In-Reply-To: <c9977188e834f15e84d785e6cc1dc51d49da63d2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.01.2024 16:20, Oleksii wrote:
> On Mon, 2024-01-15 at 17:57 +0100, Jan Beulich wrote:
>> On 22.12.2023 16:12, Oleksii Kurochko wrote:
>>> +/*
>>> + * Unordered I/O memory access primitives.  These are even more
>>> relaxed than
>>> + * the relaxed versions, as they don't even order accesses between
>>> successive
>>> + * operations to the I/O regions.
>>> + */
>>> +#define readb_cpu(c)		({ u8  __r = __raw_readb(c); __r;
>>> })
>>> +#define readw_cpu(c)		({ u16 __r = le16_to_cpu((__force
>>> __le16)__raw_readw(c)); __r; })
>>> +#define readl_cpu(c)		({ u32 __r = le32_to_cpu((__force
>>> __le32)__raw_readl(c)); __r; })
>>> +
>>> +#define
>>> writeb_cpu(v,c)		((void)__raw_writeb((v),(c)))
>>> +#define
>>> writew_cpu(v,c)		((void)__raw_writew((__force u16)cpu_to_le16(v),(c)))
>>> +#define
>>> writel_cpu(v,c)		((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
>>> +
>>> +#ifdef CONFIG_64BIT
>>> +#define readq_cpu(c)		({ u64 __r = le64_to_cpu((__force
>>> __le64)__raw_readq(c)); __r; })
>>> +#define
>>> writeq_cpu(v,c)		((void)__raw_writeq((__force u64)cpu_to_le64(v),(c)))
>>> +#endif
>>
>> How come there are endianness assumptions here on the MMIO accessed?
> It is a hard story.
> 
> As you might expect it was copy from Linux Kernel where it was decided
> to follow only LE way:
> https://patchwork.kernel.org/project/linux-riscv/patch/20190411115623.5749-3-hch@lst.de/
> One of the answers of the author of the commit:
>     And we don't know if Linux will be around if that ever changes.
>     The point is:
>      a) the current RISC-V spec is LE only
>      b) the current linux port is LE only except for this little bit
>     There is no point in leaving just this bitrotting code around.  It
>     just confuses developers, (very very slightly) slows down compiles
>     and will bitrot.  It also won't be any significant help to a future
>     developer down the road doing a hypothetical BE RISC-V Linux port.

Reads to me like a justification to _omit_ the cpu_to_le<N>().

Jan

