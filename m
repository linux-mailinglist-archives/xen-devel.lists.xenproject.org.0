Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ACEB14E4A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 15:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062684.1428417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkG7-0004A5-Jb; Tue, 29 Jul 2025 13:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062684.1428417; Tue, 29 Jul 2025 13:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkG7-00047H-Gi; Tue, 29 Jul 2025 13:20:47 +0000
Received: by outflank-mailman (input) for mailman id 1062684;
 Tue, 29 Jul 2025 13:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugkG5-000476-MO
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 13:20:45 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d17ddb48-6c7e-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 15:20:38 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b78127c5d1so1841808f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 06:20:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e8872568esm8014317a91.34.2025.07.29.06.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 06:20:37 -0700 (PDT)
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
X-Inumbo-ID: d17ddb48-6c7e-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753795238; x=1754400038; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n2lB8ry6OUYD/+ITb5OQ9s6PVlxPyubkKnOvWuHuxIo=;
        b=NCt5ls8yfK4VetDOT2nGe+Rbcd3QAweN4vVvCLWck9VtULY5cTxJOG42R/CO7DxOCA
         Pi1WV9WQq0vafkGO9DGqdAYJJE8+eyq8cwExWAhiYRt/IZS47tj8Xr1du1IXogG0zTzE
         WGZOhLrGp2wLe9njcwDGVT9MBAHTpdRCVh2gr9gcOLnSqL3ke7pnrEbwT+PtXBGVq5mo
         bWWzBiEMP4dTLmqkcFrXikWVO7SJwogwuW7Ha14kdUPeM51dUlqL3QixeuZtlxTteNaP
         XJFEAhOMeSaCrQvnNtYiL+ClEx6aaBLk6ASZQMg8uUPyIE/rkdmTUCnAOogbqLAqWpl4
         Uo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753795238; x=1754400038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2lB8ry6OUYD/+ITb5OQ9s6PVlxPyubkKnOvWuHuxIo=;
        b=S0Zko5yP5G+OBKoaUVlPykqaEHZMvjjcoS38jOZAk2zicVp8YJYsnVJ2+2IgrzxEUk
         aL7/FNoZEn5MK0BVDU6uNOHjA+qe84/yjkxJLzjVVch0EZ7LlBoHtUNoaZGUPiwh9KXb
         r9MwOM0WUPK/BrkvcdOQf8EgC5ArGKcRGT7H4WWgXTokPhY1VzE707lmCpvpZsrl1upJ
         jkSQr5vFpcEikFtYwGfr3s0g7phkejUT2eS3l7/WycYwOJKsmX1+a9URPBp1pdYhqLQ1
         umTm8IAY+Gdx1A/aRE4ApFI5GBSQByhb6nejb3wVZvuzAjpfVdZsh5vaPTx9Xx07vElN
         YMDw==
X-Forwarded-Encrypted: i=1; AJvYcCU/nNPQ+4kdOPtMyW8/mwKgIUvFOvhoi5meiRXVHSDBcdgZVrCkIoBjUmumrCe1QdlIFGrLS1QfJOM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3lGMzfbrxyQCJfQ/cbcMqT9/oAP5B7T6YhlNNd+SOG7ShabY4
	U6vJPH3aJxDBvE1DFELN87LOmjH/I8zeK/DByKIg2BikQbxYak7jaEg1uayOpTXM7A==
X-Gm-Gg: ASbGncvSqpma8oWwybJn792GT7M6kmWEZu9cXHmpJghAq8klwrWHYV9TSdUKOgzLvTD
	eb97hrRQoasti9YsBNsjWCzY3tbcsE07kKzPUmmkhmRWsX0K+1u3G9WxJLzo1ywv5+IkP7+nEQS
	vI/KD5t2MHZYqpDCeIUvgIfFxCbhkLqcZdzNBYXq36JcGoLBD4mXx7wX0rtkHU24XdPXSSDbTpU
	qICB+LuyFqdpJNk8SXWUvabLaaEpoGNBBA18gFam43NMpTNCVNf0mBuwebcJSV4StulHu4yH7wD
	zVdaYq7U2GtQEPiq8ih9ugB/6wF7nvkwU9i69I2uHG8eF7vhC9otN6Y9nxJMqPw8ch/WoeANMLY
	sAmWoRG2ebeRCMui1/fATsK4WkME260Qvvc2J+0C3n99tZh5wqc97ymvsVe0gVGgecRNpBTlmbI
	pHWwoQqD4=
X-Google-Smtp-Source: AGHT+IHm1sMIdk0TDh4ZLRVY5ZA61ivXnDnDQaBS3lNtjzKvsqzxWzjflfb168p+RI1YXmAdLqYGmw==
X-Received: by 2002:a05:6000:2407:b0:3b7:6d94:a032 with SMTP id ffacd0b85a97d-3b7765e6ba2mr10401888f8f.3.1753795237804;
        Tue, 29 Jul 2025 06:20:37 -0700 (PDT)
Message-ID: <b80aed6c-7229-4697-9736-3528474ac738@suse.com>
Date: Tue, 29 Jul 2025 15:20:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] pdx: allow per-arch optimization of PDX conversion
 helpers
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20250724110416.2081-1-roger.pau@citrix.com>
 <20250724110416.2081-5-roger.pau@citrix.com>
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
In-Reply-To: <20250724110416.2081-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.07.2025 13:04, Roger Pau Monne wrote:
> There are four performance critical PDX conversion helpers that do the PFN
> to/from PDX and the physical addresses to/from directmap offsets
> translations.
> 
> In the absence of an active PDX compression, those functions would still do
> the calculations needed, just to return the same input value as no
> translation is in place and hence PFN and PDX spaces are identity mapped.
> 
> To reduce the overhead of having to do the pointless calculations allow
> architectures to implement the translation helpers in a per-arch header.
> Rename the existing conversion functions to add a trailing _xlate suffix,
> so that the per-arch headers can define the non suffixed versions.
> 
> Currently only x86 implements meaningful custom handlers to short circuit
> the translation when not active, using asm goto.  Other architectures use a
> generic header that maps the non-xlate to the xlate variants to keep the
> previous behavior.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/pdx.h
> @@ -0,0 +1,75 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef X86_PDX_H
> +#define X86_PDX_H
> +
> +#ifndef CONFIG_PDX_NONE
> +
> +#include <asm/alternative.h>
> +
> +/*
> + * Introduce a macro to avoid repeating the same asm goto block in each helper.
> + * Note the macro is strictly tied to the code in the helpers.
> + */
> +#define PDX_ASM_GOTO(label)                         \
> +    asm_inline goto (                               \
> +        ALTERNATIVE(                                \
> +            "",                                     \
> +            "jmp %l0",                              \
> +            ALT_NOT(X86_FEATURE_PDX_COMPRESSION))   \
> +        : : : : label )

Considering the uses of the macro, it seems likely that in some of the cases the
label will be within reach of a short JMP (opcode 0xEB), while the assembler will
be unable to encode it like that (for living in a separate section, far off from
the place the code will be copied to). That's likely okay for now, but we may
want to eliminate this minor ineffeciency later on.

Jan

