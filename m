Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327AAC58BF0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 17:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161894.1489719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJaFQ-0005BI-VM; Thu, 13 Nov 2025 16:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161894.1489719; Thu, 13 Nov 2025 16:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJaFQ-00058s-Sh; Thu, 13 Nov 2025 16:32:36 +0000
Received: by outflank-mailman (input) for mailman id 1161894;
 Thu, 13 Nov 2025 16:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJaFP-00058m-8M
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 16:32:35 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58c81fcb-c0ae-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 17:32:29 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b72dc0c15abso177304566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 08:32:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa80cb6sm199876866b.7.2025.11.13.08.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 08:32:28 -0800 (PST)
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
X-Inumbo-ID: 58c81fcb-c0ae-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763051549; x=1763656349; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pO9PWYp2GxSvCVeZ6/i8fZoRm/iwcK6eNCraz+viP8s=;
        b=CxfGC+iwwH3y9r4zP3LH/C/lY2/Eevvn8i+jr8nQqwpwA2B6lqGhk+Tb5Zawruljn6
         mTFCIHK8nvWdJKU4cESYnVPlrhosmkqyeN3kx2i8bVeFVhAklo+dbEHrZO433CZNuhIY
         ew3OtxvDltXeKR+TwBcXorvCt3xFwVkpLhG9U2K55GRu+GViKNTp7xVj2QgcBV0yH3w2
         XMGrovKhv3ofphk0gQWNorewchjbg8DDc2x6Sg83zwlYqJAvBeJ3oBYy5IF5TZ53kh9F
         WEIflcDZG4MTQ2C/n4E1jwF47cQqQAKequTyoKEhJjNHrlnW6sHq4x9DZsXOUkkVlc9W
         3zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763051549; x=1763656349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pO9PWYp2GxSvCVeZ6/i8fZoRm/iwcK6eNCraz+viP8s=;
        b=P5Yc3LADgAcaFBfmbwWeYDeYCtayvMnb/A/O17fZuks20/OW5GBV/78lTnpsf29CaA
         hfbvvM7DfIFc2fYpkfcv1LNwOI/DnZfm4Qx/o2xnylk7E+hXhv0Zftr/feSaGV4zNz+6
         +Sc9j2Vp//FdjpA2MmngIKrvctxE1pr2EVQ6wohfaEVRjF5rD9chV1FKMQYraErWgwez
         fN9n6Xp35tNApb2HxjC0ereNVyFLbQUnXzFmwfmWl/Y1UXGLgoz5+xZrNuZfMMdOQdlj
         bQXiNQE1IbZcSr0+7E644800P/9zwgiAtEjRQUvdwdkGEp1bTDFmDEnX0bODvaM2P5vR
         vKgA==
X-Forwarded-Encrypted: i=1; AJvYcCXSxoMXL5XyQ9rEZB9BgoArfEXMyjl0HkvFIZRkvedtPOwCG1fUFK8lDvaGpyJup6BRTcCYJcQAJdc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOjJ82yOpqc0WvLPgMkF/2mLZv9Cv8S+EUYPyaWojSCm1t8TWu
	vpsoVYZ07dqoZo5mlxkyXS8If7aOqvQKqUvr1vbZ5oycaaU2Vz7rdYpbQsBOnTJG4Q==
X-Gm-Gg: ASbGnctTaoU6P60xcYm+IFj1VZ9HQIRGoHREYFQ3RahhEzfl5IZaRiKxIxp930ULZIc
	MYOrCOt+5QepUB/ZF2sV/qdu2eRmBeCoydgRDWvp1ZEcuBPT561gq0neCfuHbUIGdexDYXocu3A
	TcN2++Uey+MuO01bE6m7ViMfEkT4mBulB1kOVDCaHF0Lr88G8eLZxUrrAYDqlZHwlHBsGdrQe97
	9jUIpOpmZBhUxc9nC5By1nQHTSs3nkz1ch5oN53Uv0/+r4UIFGm7fwhd8YOgBUS0WQDpG6CF5Ue
	3zUT9cxOcpwtTMB0/v7ZoIGJFVWslEND7tSonyUsJw19F/IqsIr/+NBXIMDOahedYo6veyDgZFe
	rgwwipA/xo0HnSSPZkuvBQIhQmwgphL2hgx8bpESsh4/Md8aQ1F8ZbdBjSj/Re7QS1w589Tq7TY
	y/+FEHDW0NjB2KSDXBZRRZL3H/HHyKu71dPle+oy0eORCdfpPae6oKsvyH04sJjJz0y3cmDuXsu
	no=
X-Google-Smtp-Source: AGHT+IFKkf4ufZs1iO69+Vbt4q6kxi4vMf/vehrzjgH7uy2I1+yaf5nFiUlxDM+ChMHR15txMjIqRQ==
X-Received: by 2002:a17:906:6a13:b0:b72:190d:b645 with SMTP id a640c23a62f3a-b7331aec3b2mr795052366b.57.1763051548932;
        Thu, 13 Nov 2025 08:32:28 -0800 (PST)
Message-ID: <7d81564c-d7c0-47f4-9f2c-bf4508a0a870@suse.com>
Date: Thu, 13 Nov 2025 17:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 01/18] xen/riscv: detect and initialize G-stage mode
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <2b21348b3300c741b276a47d5942e71d306846eb.1760974017.git.oleksii.kurochko@gmail.com>
 <8b204b21-80fb-408d-972e-8f183eb45dfc@suse.com>
 <6938d333-816d-49f8-9945-db9d4b17f1f1@gmail.com>
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
In-Reply-To: <6938d333-816d-49f8-9945-db9d4b17f1f1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2025 17:18, Oleksii Kurochko wrote:
> On 11/6/25 2:43 PM, Jan Beulich wrote:
>> On 20.10.2025 17:57, Oleksii Kurochko wrote:
>>> Changes in V5:
>>>   - Add static and __initconst for local variable modes[] in
>>>     gstage_mode_detect().
>>>   - Change type for gstage_mode from 'unsigned long' to 'unsigned char'.
>>>   - Update the comment inisde defintion if modes[] variable in
>>>     gstage_mode_detect():
>>>     - Add information about Bare mode.
>>>     - Drop "a paged virtual-memory scheme described in Section 10.3" as it isn't
>>>       relevant here.
>>>   - Drop printing of function name when chosen G-stage mode message is printed.
>>>   - Drop the call of gstage_mode_detect() from start_xen(). It will be added into
>>>     p2m_init() when the latter will be introduced.
>> Well, thanks, but ...
>>
>>>   - Introduce pre_gstage_init().
>> ... the same comment that I gave before now applies here: This doesn't look to
>> belong directly in start_xen(). In x86'es terms I'd say this is a tiny part of
>> paging_init().
> 
> Does it only the question of function naming now?

Not just, no. My point is that you shouldn't pollute start_xen() with calls to
dozens of special-purpose functions. There wants to be one call dealing with
everything guest-mm related, I think.

> IMO, ideally it would be nice to have it in p2m_init(), but there is no a lot of
> sense to detect supported modes each time a domain is constructed. And it is the
> reason why I put directly to start_xen().

No per-domain function wants to be used for this, I agree. Hence why I pointed
you at x86'es paging_init().

>>> --- /dev/null
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -0,0 +1,96 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include <xen/init.h>
>>> +#include <xen/lib.h>
>>> +#include <xen/macros.h>
>>> +#include <xen/sections.h>
>>> +
>>> +#include <asm/csr.h>
>>> +#include <asm/flushtlb.h>
>>> +#include <asm/riscv_encoding.h>
>>> +
>>> +unsigned char __ro_after_init gstage_mode;
>>> +
>>> +static void __init gstage_mode_detect(void)
>>> +{
>>> +    static const struct {
>>> +        unsigned char mode;
>>> +        unsigned int paging_levels;
>>> +        const char name[8];
>>> +    } modes[] __initconst = {
>>> +        /*
>>> +         * Based on the RISC-V spec:
>>> +         *   Bare mode is always supported, regardless of SXLEN.
>>> +         *   When SXLEN=32, the only other valid setting for MODE is Sv32.
>>> +         *   When SXLEN=64, three paged virtual-memory schemes are defined:
>>> +         *   Sv39, Sv48, and Sv57.
>>> +         */
>>> +#ifdef CONFIG_RISCV_32
>>> +        { HGATP_MODE_SV32X4, 2, "Sv32x4" }
>>> +#else
>>> +        { HGATP_MODE_SV39X4, 3, "Sv39x4" },
>>> +        { HGATP_MODE_SV48X4, 4, "Sv48x4" },
>>> +        { HGATP_MODE_SV57X4, 5, "Sv57x4" },
>>> +#endif
>>> +    };
>>> +
>>> +    unsigned int mode_idx;
>>> +
>>> +    gstage_mode = HGATP_MODE_OFF;
>> Why is this not the variable's initializer?
> 
> Good point. It should be the variable's initializer.
> 
>>> +    for ( mode_idx = 0; mode_idx < ARRAY_SIZE(modes); mode_idx++ )
>>> +    {
>>> +        unsigned long mode = modes[mode_idx].mode;
>>> +
>>> +        csr_write(CSR_HGATP, MASK_INSR(mode, HGATP_MODE_MASK));
>>> +
>>> +        if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
>>> +        {
>>> +            gstage_mode = mode;
>>> +            break;
>>> +        }
>>> +    }
>> I take it that using the first available mode is only transient. To support bigger
>> guests, you may need to pick 48x4 or even 57x4 no matter that 39x4 is available.
> 
> I considered traversing the|modes[]| array in the opposite order so that the largest
> mode would be checked first. However, I decided that 39x4 is sufficiently large and
> provides a good balance between the number of page tables and supported address
> space, at least for now.
> 
>> I wonder whether you wouldn't be better off recording all supported modes right
>> away.
> 
> What would be the use case for recording and storing all supported modes?
> For example, would it be used to indicate which mode is preferable for a guest
> domain via the device tree?

Why device tree? That's what's exposed to guests, isn't it? Here we talk about
what Xen uses to run guests. And that can vary from guest to guest.

> Also, I’d like to note that it probably doesn’t make much sense to record all
> supported modes. If we traverse the|modes[]| array in the opposite order—checking
> |Sv57| first—then, according to the RISC-V specification:
> - Implementations that support Sv57 must also support Sv48.
> - Implementations that support Sv48 must also support Sv39.
> So if Sv57 is supported then lower modes are supported too. (except Sv32 for RV32)
> 
> Based on this, it seems reasonable to start checking from Sv57, right?

No. Bigger guests want running in 48x4, huge ones in 57x4 (each: if available),
and most ones in 39x4. It doesn't matter what direction you do the checks, you
want to know what you have available.

Jan

