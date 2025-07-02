Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477CDAF1203
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 12:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030913.1404600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWup6-00087N-7L; Wed, 02 Jul 2025 10:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030913.1404600; Wed, 02 Jul 2025 10:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWup6-00084i-4O; Wed, 02 Jul 2025 10:36:16 +0000
Received: by outflank-mailman (input) for mailman id 1030913;
 Wed, 02 Jul 2025 10:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWup3-00084b-Qd
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 10:36:13 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ff35516-5730-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 12:36:13 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a50fc819f2so4720435f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 03:36:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c15233d0sm14278442a91.46.2025.07.02.03.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 03:36:11 -0700 (PDT)
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
X-Inumbo-ID: 5ff35516-5730-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751452572; x=1752057372; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ntQp08buacX2lmdd69usgp3NpBWbOgMuRCtNXh+KVyc=;
        b=TzHh2qUF5KyciImTxQlPBSCXNawh0NqZ/ry3ttjbaiWNvdsA7Fhl+nQJF0pvW17kdF
         ke6RLZmB0ijkgmNzHKBPNucZJOwercNE8T3kp9wfDm1S2uKrqTvn+CnveJ2vXu0CVSgj
         z5TQLO3tA6pAyRykviwzRSFVTIOk1JblNMTzyFoPoFRxZXSgIKJBSCmrlBVaH+leMrqj
         tatosQ63zGPm4uYlro7gn1sCjoWS4tHOezRi6XoQ0CiV0bRR1bMt5tgnoyp1c5KD2x6J
         fV/O07tTK0mnDO+UTO3CnvJ9MHG+qwkHwiDsJeVp4M+9Ne8M5/CxiS/NZTPyzRHyyJMu
         W+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751452572; x=1752057372;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntQp08buacX2lmdd69usgp3NpBWbOgMuRCtNXh+KVyc=;
        b=dqhYMtXXMzKTX3hCbWYuRmAhG6Kl6lJtvpM38Kifil1NsvmVPASjkz9T19Ze4sLwo8
         NTUjdAY6qEu8aOjcH4xahNJNM3WvHyfNtQNMxCukqXUeijf5A3RUYfhbHBxGzaczI2Cr
         nquKNjhoH/Jmhqq9mjGlIXQj8l11keYdlff/ehYcfFZAGJrXbk65vxcYL/M2MHVJugzI
         f7dU0ae/Z98oAhssbKo37fXEZwB5rwZHcicrOR5IKxJx8ALilHLHu22e+7B81rAVlHbZ
         h9IlaDkesW6G/qfxToRIDxPrkrYJD484qDH5lNcH50+599RNhTKuFAYjUx02gWQJJuIy
         Es9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXNohKw0Fpx2NfDXJIUXBVeP1o0pVTkK9at/vCT4z820AWlE7vvj/n9lyXg4Ob53w/g/6dIZMgX6E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNgFZ+2xLb/WHvZGuBMVk20vbkNebKJdJSZX8JRiwyxV3s4nh4
	vHId3wJnwgzuu5K2hLnYRxZZ5vT6+UjRr+UqO+Uue4aoGmXJ7gq/zQnI2mjiszZQfQ==
X-Gm-Gg: ASbGncubX+Zkaddl7ZpFY640LHOr6XFLD3EMd2+kn247MXIXyzqo28BH9LeF+VU1edg
	zM2EAEWFl/sKh8YGYsT/0dBCCGv3/IhWoJk2mek7ENqumXyx+mRnESaezoe9Rb4MaB/9RDEq5ME
	WRWt+66b4n2dTY4rhw8/5+uqqGa9RMAb5VlNBjuFEiw5HIvOl/65e8275RcsnOERLXrVWfcrWTW
	7DELu1NMGItWD9V6t9UW6mgXENR4lkZqwN0RNTHqHafuJrVlUlbflXR96SKAL1xF9govQmtp9JU
	gQuLwQJEr9Zjl+Vs1gR7bZf5D4+D1imDNeeFzkEOxwEUBm+sYs7dcD7ONtTQnU48pxwZI2kf1y1
	ni2aNuekyKAx4sgOgBymWuvHfflHuvRtbprNzvDRPiO4JY3Q=
X-Google-Smtp-Source: AGHT+IERDBpiFrpkvJG9lUJ9CLHG+iXhd3prXOKTtns5slLZY4Ng/ZOfG6x3p06wsbV2mfDVU7REng==
X-Received: by 2002:a05:6000:2289:b0:3a5:5270:c38f with SMTP id ffacd0b85a97d-3b1faa90a51mr1657248f8f.0.1751452572292;
        Wed, 02 Jul 2025 03:36:12 -0700 (PDT)
Message-ID: <1c600e7c-3310-466d-972b-cd34f3353f87@suse.com>
Date: Wed, 2 Jul 2025 12:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] xen/riscv: add new p2m types and helper macros
 for type classification
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <f943c6ce5371258af0f36c2633d542341fcf47b4.1749555949.git.oleksii.kurochko@gmail.com>
 <8f45cffe-e2a2-46e3-8370-2b6b4c86dccf@suse.com>
 <13b80e15-9db9-427d-aaa2-c0389e4c248a@gmail.com>
 <6fafc0b4-cfea-4d67-bef6-4e40d1d3e743@gmail.com>
 <f373045d-4479-4c55-b6cd-3c955e456428@suse.com>
 <f5fc8d66-cb90-4064-a215-8a2ea3705272@gmail.com>
 <2a7515a4-0e86-428f-8239-ae97b976f3f2@suse.com>
 <e9ca6d09-2bf2-453d-9fcb-f837f8fda4db@gmail.com>
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
In-Reply-To: <e9ca6d09-2bf2-453d-9fcb-f837f8fda4db@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 12:13, Oleksii Kurochko wrote:
> 
> On 6/30/25 5:50 PM, Jan Beulich wrote:
>> On 30.06.2025 17:27, Oleksii Kurochko wrote:
>>> On 6/30/25 4:45 PM, Jan Beulich wrote:
>>>> On 30.06.2025 16:38, Oleksii Kurochko wrote:
>>>>> On 6/30/25 4:33 PM, Oleksii Kurochko wrote:
>>>>>> On 6/26/25 4:59 PM, Jan Beulich wrote:
>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>>>>>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>>>>>>> @@ -61,8 +61,28 @@ struct p2m_domain {
>>>>>>>>     typedef enum {
>>>>>>>>         p2m_invalid = 0,    /* Nothing mapped here */
>>>>>>>>         p2m_ram_rw,         /* Normal read/write domain RAM */
>>>>>>>> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
>>>>>>> As indicated before - this type should be added when the special handling that
>>>>>>> it requires is also introduced.
>>>>>> Perhaps, I missed that. I will drop this type for now.
>>>>>>
>>>>>>>> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
>>>>>>> What's the _dev suffix indicating here?
>>>>>> It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
>>>>>> spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
>>>>>> |using PTE_PBMT_IO for |p2m_mmio_direct_dev.
>>>>>>
>>>>>> Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
>>>>> I forgot that p2m_mmio_direct_dev is used by common code for dom0less code (handle_passthrough_prop())
>>>> That'll want abstracting out, I think. I don't view it as helpful to clutter
>>>> RISC-V (and later perhaps also PPC) with Arm-specific terminology.
>>> Would it be better then just rename it to p2m_device? Then it won't clear for Arm which type of MMIO p2m's
>>> types is used as Arm has there MMIO types: *_dev, *_nc, *_c.
>> I don't understand why Arm matters here. P2M types want naming in a way that makes
>> sense for RISC-V.
> 
> It doesn't matter.
> But if we want to change the type name from p2m_mmio_direct_dev to p2m_mmio_direct or p2m_device then it will
> affect Arm too as p2m_mmio_direct_dev is used in dom0less code which is also used by Arm.

As said - imo this needs abstracting away.

> I just re-used p2m_mmio_direct_dev as it looked for me pretty generic and clear for what this type is.
> 
>>> As an option (which I don't really like) it could be "#define p2m_mmio_direct_dev ARCH_specific_name" in
>>> asm/p2m.h to not touch common code.
>> A #define may be needed, but not one to _still_ introduce Arm naming into non-Arm
>> code.
> 
> As I mentioned above that p2m_mmio_direct_dev sounds pretty generic to me and I am okay to use it for
> RISC-V. But if you have better suggestions I will be happy to consider it.

Well, the name we use on x86 (and I think this was quite obviously implied
by earlier replies of mine): p2m_mmio_direct.

Jan

