Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108B2923D49
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 14:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752427.1160647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOcJk-0006S9-9e; Tue, 02 Jul 2024 12:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752427.1160647; Tue, 02 Jul 2024 12:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOcJk-0006Qe-79; Tue, 02 Jul 2024 12:09:04 +0000
Received: by outflank-mailman (input) for mailman id 752427;
 Tue, 02 Jul 2024 12:09:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOcJi-0006QW-SO
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 12:09:02 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de8c3425-386b-11ef-92e8-0d9d20120eaa;
 Tue, 02 Jul 2024 14:09:01 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ee794ebffbso5157461fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 05:09:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c91d3eb9bbsm8610400a91.57.2024.07.02.05.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 05:09:00 -0700 (PDT)
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
X-Inumbo-ID: de8c3425-386b-11ef-92e8-0d9d20120eaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719922141; x=1720526941; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+B5UEdBNB8m8SCNDBeeR4SjGQqZb2u8/uqsY1b2HPdQ=;
        b=CBJZPzskuS+43MiGfi1iNtD1hWc477qQcvBlV1crzO/sc1WcHFk6EpMXwQTXTmaW4l
         FNqbwtX9OYVYBq4P1zE66PxJ8Q3XaBY7TIlrkCdhCXBWN/4HWMoVUoSOJ7iopdrZ0oCq
         UVLNGfB1mKZ19dh2JA8JAiJtVSbfOcov02zKS8fX4Xq9T2zs3uIGg1uq9At9adhxQFpR
         j5UIMPQxhitzmdM/P3JPr6HW1DCIcB3dD/kT3H9Z0hrHxutrpOzf1QjgKdRRp8eoFaMl
         jMS51eSPl6TOFxpV6W7BGlIEUCSognBh0HwMDcRaiilfFx+0M99nxSI1ExvGD21+v1Y+
         Hhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719922141; x=1720526941;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+B5UEdBNB8m8SCNDBeeR4SjGQqZb2u8/uqsY1b2HPdQ=;
        b=Z/7sCQysldo0vBAwSvrjeNMPGgcbOLF6OYm8VWat/2HpflKxyzyClVCHcfGVB4IGjd
         E7uCon3wibYN/l0Fy4TobYv6DaFEqveLyLyiY1cCgNNtuFuTWiwnxIVI+VhHu3GTnzKY
         WglG1Gc3N9M3NfFY1UiVTXlH/EQ1aUBN2tDsTdeYNa6PhRIlztCBelRaK2yFIYDAksYn
         w0NHdErKYn5e8ISpdzPe9IovlijR3ATRdFQd2wk56rXPGRv3zVVjF4rQwLcze0JS3ggR
         3JtHhgqbV+KdCF7MK1/6zf1eTHYvvJhlHgbAwzb9Z315jBibg/R7XvOa9+Ups0ETwvCY
         JQzw==
X-Forwarded-Encrypted: i=1; AJvYcCWwROOJguDEohViSR+30FZ2BDlYGy5Cv9qb37vg+lJn6RtnAXXZjATuEdT23x8LV31UqwuXi1ofApTVXrAKHZfM5Bi+j0sleDIVmkcnYOM=
X-Gm-Message-State: AOJu0YyUl9sU6Sv7WhlwfwfXrg0NAH8zOkBoSN4NKHS2J+/r66eJiv9p
	CJsYc3iMW+gg2pSRTXUoerqR+nXAfZG/J3weN3Zdu99qrYzOizVgOOl3heTlEA==
X-Google-Smtp-Source: AGHT+IGr0o8B6CJyIMM6yMJGvZuX3uJ/YBIUx0UkexKQSbmYj2R61sV9/pwI+QiQwoJ5ge5Hssmr7g==
X-Received: by 2002:a2e:87cb:0:b0:2ec:5843:2fb8 with SMTP id 38308e7fff4ca-2ee5e6f6144mr63562531fa.42.1719922141240;
        Tue, 02 Jul 2024 05:09:01 -0700 (PDT)
Message-ID: <15d42265-0aec-40c1-b468-e6ebaabffbeb@suse.com>
Date: Tue, 2 Jul 2024 14:08:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 8/9] xen/riscv: introduce ANDN_INSN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
 <07c628e8552f6e31a07e4261b273553cb4a3669b.1719917348.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <07c628e8552f6e31a07e4261b273553cb4a3669b.1719917348.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2024 13:01, Oleksii Kurochko wrote:
> RISC-V does a conditional toolchain for the Zbb extension
> (xen/arch/riscv/rules.mk), but unconditionally uses the
> ANDN instruction in emulate_xchg_1_2().
> 
> Fixes: 51dabd6312c ("xen/riscv: introduce cmpxchg.h")
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Suggested-By: Jan Beulich <jbeulich@suse.com>

Hmm, meant to say that for the earlier patch already: A Suggested-by:
after an S-o-b is somewhat odd. You can't have signed off a change
before it was suggested, as you can't possibly have written it then.
Otoh I'm not sure tagging me is appropriate here anyway.

> --- a/xen/arch/riscv/include/asm/cmpxchg.h
> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> @@ -18,6 +18,19 @@
>          : "r" (new) \
>          : "memory" );
>  
> +/*
> + * To not face an issue that gas doesn't understand ANDN instruction
> + * it is encoded using .insn directive.
> + */
> +#ifdef __riscv_zbb
> +#define ANDN_INSN(rd, rs1, rs2)                 \
> +    ".insn r 0x33, 0x7, 0x20, " rd ", " rs1 ", " rs2 "\n"

Why 0x33? Just like in the other patch you used MISC_MEM (as suggested,
for being more descriptive), you want to use OP here. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>
(and I'd certainly be okay making the change while committing)

Jan

