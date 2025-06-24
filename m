Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72D7AE6716
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 15:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023738.1399790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU43Z-0000Np-Pw; Tue, 24 Jun 2025 13:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023738.1399790; Tue, 24 Jun 2025 13:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU43Z-0000M5-NE; Tue, 24 Jun 2025 13:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1023738;
 Tue, 24 Jun 2025 13:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uU43Y-0000Lz-76
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 13:51:24 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ff90791-5102-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 15:51:22 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so394483f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 06:51:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749b5e42ad8sm1940971b3a.70.2025.06.24.06.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 06:51:21 -0700 (PDT)
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
X-Inumbo-ID: 4ff90791-5102-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750773082; x=1751377882; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mMqvgfXFjuXxBYcGdcH4uhQW/vj09bAHSO+7Phn8pFI=;
        b=bqvIqdk0JgLppiv3m0s+YEaD7L387vpgpyiaZIkHiWBwtw0bMe3zt+i84uzxL2+FCv
         9WMvVCL8jxX6KLGCyt7RjZy9ciz/GsKor3ZN1akn6CblMvjGnZotdclHUMTeRLOVmgbl
         XxdPhzubaNleMXJ+TCcBTSBOh7b2rF60/asMKPM8sFSeVRR3oJEjXvrRpA/zJ3XnkFq0
         h7Rlj3dgH2xP5XHeGFKHRlqSUlD/rvbWV9dYQ+kXf95d07k/Fk2pqGZcYmhA9v+Y4a7Q
         h8KaVD55tYxq9z2eJg+a2XQpi7VWvBzdGaTQCZqfkyneuBzttvrFipPcNLA5wpVUu0sU
         adMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773082; x=1751377882;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMqvgfXFjuXxBYcGdcH4uhQW/vj09bAHSO+7Phn8pFI=;
        b=u5Ra4v5F6l0vTov0fA/T2umLNKEmhM8rpPncOkx6whChpw2NP9to7y1/QARSNH1zmq
         ZFutgYjNWgtOrvLuU1Yxc2/Z5/6rbEXfeswbI0PyloikBHGP6lQoqpA7on8/18Yj7hWw
         r/g22uA4vUtbl7YH7y7fK3Zxjih/o/o4zbt6b9QVFbZhe6z8U9fBQaGb6Tpc8nPvMptm
         ZE4mQHcb+suXZ+2TZ8qwpg0U9v2GnXJ776VdQFjXXoL/HFc0DYK6T/zFYuDjprdDTipi
         q6vPdPy6IXoFzuWlf3BHB5y9scvAIPruOvB7/7bBr+fTS3ZAetPsfmBMtad8LpWXEy28
         hOIg==
X-Forwarded-Encrypted: i=1; AJvYcCVl81fHT0k8hSZsw8oz002tjv3RQ5D56+CKb4ujXj7kkWcJjAHvepChRPdv60XYT9egOjG146FYanU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywk5d25jvV78U07QPXf2qFAZSGji3QKCHPwqB9QOFAzJUapG1eW
	jG/mw/IW5UoId+i9aqXcwYYvhcZm8dGTMYhytsuz7Ng2V9z9rOsyIXyI59wpRe22ag==
X-Gm-Gg: ASbGnctiYvf1+9IKAM24c8e3kQFokC7Kepm5bxXyjBfAPnsJ4lgT48t0v7XayBc8VrA
	5lwMC7x8kNJsTEYCO1fp4g1u/LvbFqwg4caHS/uH9IbtCKmEyKP05oK2WYSvVBroEGNG33v7OjO
	kmut0peGuB7jz+RFRYuQuHYpHpx+g0rXQ9QCrFDvsBh6RDs+eL+qUid7saCwvjogxe1W0jfxqLw
	sX6JEgWvKTizI+pdtZBKfl5HqEol2c6jaBQ4TcwcWep99tMPQIRjkTx0ShLXUZCYQ4tBpZWQSxB
	Wgi/edPjwwM3D9FphGGDaVySw6F+Za0PFs5pygjikNIucP16dwPR80yePfrhwpMR3hlnj1yBkdb
	qhkGzbbirSWghp8/bIi2uc3HX+9il4mcF1AXba+5Qbj2/CIE=
X-Google-Smtp-Source: AGHT+IHcVYqdVUM3GAGxo0KiVxKpr9hWtlOI8hMw7Wre/7/20c8QcnlbyG/ELJx8/NyMvp1veusJUg==
X-Received: by 2002:a05:6000:40c7:b0:3a4:d3ff:cef2 with SMTP id ffacd0b85a97d-3a6d12d8000mr13627227f8f.27.1750773081719;
        Tue, 24 Jun 2025 06:51:21 -0700 (PDT)
Message-ID: <d179e5e5-605f-45a8-9b7d-01dd13359faf@suse.com>
Date: Tue, 24 Jun 2025 15:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] pdx: allow per-arch optimization of PDX conversion
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
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-6-roger.pau@citrix.com>
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
In-Reply-To: <20250620111130.29057-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2025 13:11, Roger Pau Monne wrote:
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
> +#define PDX_ASM_GOTO_SKIP                           \
> +    asm_inline goto (                               \
> +        ALTERNATIVE(                                \
> +            "",                                     \
> +            "jmp %l[skip]",                         \
> +            ALT_NOT(X86_FEATURE_PDX_COMPRESSION))   \
> +        : : : : skip )

Did you consider passing the label name as argument to the macro? That way ...

> +static inline unsigned long pfn_to_pdx(unsigned long pfn)
> +{
> +    PDX_ASM_GOTO_SKIP;
> +
> +    return pfn_to_pdx_xlate(pfn);
> +
> + skip:
> +    return pfn;
> +}

... the labels here and below then wouldn't look unused.

The other slight anomaly with this is that we're wasting 2 or 5 bytes of
code space. Yet I guess that's an acceptable price to pay for keeping the
actual translation code in C (rather than in assembly).

Jan

