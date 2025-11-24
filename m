Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD571C7FAC1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 10:41:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170154.1495231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNT3v-0000UQ-9F; Mon, 24 Nov 2025 09:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170154.1495231; Mon, 24 Nov 2025 09:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNT3v-0000SE-6c; Mon, 24 Nov 2025 09:40:47 +0000
Received: by outflank-mailman (input) for mailman id 1170154;
 Mon, 24 Nov 2025 09:40:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNT3u-0000S8-14
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 09:40:46 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4fd85e8-c919-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 10:40:43 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so41275735e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 01:40:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf198a67sm194971805e9.0.2025.11.24.01.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 01:40:40 -0800 (PST)
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
X-Inumbo-ID: a4fd85e8-c919-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763977242; x=1764582042; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YEIyGuupettzazkKcMo45e+hiEQdetGWlZWEx9ACaOU=;
        b=MOACEUL4lYfz7X0ywJy2ad05fYH1GpfjHSv6lR5/KlOpPRP1y56EDybAh5k9rR67ex
         tke29/HOPv6vjrtjnBAsxJn1pPjzpvfwaKepS/P3vYcqXm5X8exPx6S+Ts1pxKGh3492
         HQbpvN7Dvme+UV/5mAt/P3ijRJyeIx02iQ6eeby9Q0VArsh58tg69V2/rLU49vq/tfNj
         Q29/8DSnX9vgBkBDhiRNUUioCRdaRPn7wwO4utBo7L9xUP15wDv52G6ubPIDeBUBgsEv
         UBO/zfGQC661FwGve9/sTRDfL0GMDV68k4n6YyvygvDtRaM+SfmmggO++nvMF8UEqee6
         Udrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763977242; x=1764582042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEIyGuupettzazkKcMo45e+hiEQdetGWlZWEx9ACaOU=;
        b=Mmh/0Kevi38VCYHY790tOvydwzpBD0nUXsOy+MFB50K6zOGTsWzAlzERmauIpXFjv0
         HaXd9FuQoRtI1woFuOjn88oyYdc/Llli8FpFSP4i/J10UKztpmKtiK0wEc/41uJeKVUZ
         wbk7x8LCiepMRXec/jmjjVDfJEGkT1Vo5bbePapd2Uln4C5gQ4qTTD89WYiiOKq+YQYd
         bxWNkxaY33mPcCwYEjm4p/XfuvvRU//DgLMMlOm39o888KhHId2UPLyEeGCzLZQ7Nvxl
         6Y1mBz0QBquL4era4kZ3A13WuD2VHoRriRshx6jAS8z7xpoT8tWOEvjicQI+oZMlgZXA
         chUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm9E+GNX7fcFM2uCCV5RC7NbbN7RoTXQ5zpHd/EBa00dzAG5nXawiZy4/lnG/yEWPQoZIFuEjzy+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxlqsNnZHgMQE62BAmm2i9zq/1Y07vFFdnoDYiz9bjd4aqxO5E
	jhJTBSZrcl+QJEaz6jjSy1zjdG+XrNcHCF3swsPvxSAalvgmxIBgR6YIui9qhjY3RQ==
X-Gm-Gg: ASbGncsl1godYl/n53Y92rP46veDMUevCCF8p8bnaTZO4UjI5VhUIKTdf1dt3eJCNbi
	q7ONB4uNUerNmvr40Lv+rDxE2go7f8LruUcqbb0is9NGeXfKt4DrD0gYVDy7lo5ES5aGefStEtQ
	sLp12iDgddBgNls5UUz3ZJR+180dkZg9f+ymjB/rvPdYD5mwNvvXfeyObDM5j++bU55DUA96JAl
	mM9+UkSsgbTCzBlUlLjzCaUSudOELNZhRlBxfP7Hpn5sv5zHv5Lii0zJTRD6bPL7ByzAaNwqJ3c
	Zwub+2SayrkvF4sM2RzgVk1miUtbr+Gl4Tb8dOL4iYgZKAo6kq2W8ZNnp7AAPTrYkYF+FJI7gHk
	Ui1FHDh/4BjRFEgaAiwVcw0xcGXmeAUwBkFS+sYd2BkKkiz4Sr4iS4+LfMab3zO5DXMqHwT/5kO
	A5AfsEuTFJYP05MXPivszkjdfbgGNaY13Ot4kJ1kNvqJwTgtP5pNGCEdbOi9ciiWXNhD2Rz2mP4
	Co=
X-Google-Smtp-Source: AGHT+IENTdh99KUSlL9O+6IRnyl08rp+9TcyCmFRJJW4DWuX5ic8Frg8SWddyuZ8B1Hq/+6pJ56REA==
X-Received: by 2002:a05:600c:3b01:b0:477:7c45:87b2 with SMTP id 5b1f17b1804b1-477c111607fmr119243405e9.16.1763977242171;
        Mon, 24 Nov 2025 01:40:42 -0800 (PST)
Message-ID: <f75bd206-47a5-450e-a4ab-920dbc4574b0@suse.com>
Date: Mon, 24 Nov 2025 10:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] XEN: enable MC/DC coverage for Clang
To: Saman Dehghan <samaan.dehghan@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3bb418ae6a36a9ac89c697a417fa0745fa9ac702.1763949990.git.samaan.dehghan@gmail.com>
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
In-Reply-To: <3bb418ae6a36a9ac89c697a417fa0745fa9ac702.1763949990.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 03:18, Saman Dehghan wrote:
> Clang >= 18 supports Modified Condition/Decision Coverage (MC/DC).
> This patch enables the detection and usage of this feature when
> compiling Xen with Clang.
> 
> - Update detection logic to check for '-fcoverage-mcdc' when using Clang.

You check for ...

> - Update llvm.c to handle the profile format changes (bitmap section)
>   required for MC/DC.
> - Guard -Wno-error=coverage-too-many-conditions with CONFIG_CC_IS_GCC
>   to avoid passing a GCC-only warning option to Clang
> 
> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> ---
>  xen/Kconfig                |  2 +-
>  xen/Rules.mk               |  1 +
>  xen/arch/x86/Makefile      |  4 +++-
>  xen/common/coverage/llvm.c | 24 +++++++++++++++++++++++-
>  4 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/Kconfig b/xen/Kconfig
> index a5e5af3b76..5508993f02 100644
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -53,7 +53,7 @@ config CC_HAS_ASM_GOTO_OUTPUT
>  
>  # Compiler supports -fcondition-coverage aka MC/DC
>  config CC_HAS_MCDC
> -	def_bool $(cc-option,-fcondition-coverage)
> +	def_bool $(cc-option,-fcondition-coverage) || $(cc-option,-fprofile-instr-generate -fcoverage-mapping -fcoverage-mcdc)

... more than that one option here. Presumably because the option alone
wouldn't be liked by the compiler? (May want mentioning in that part of the
description.)

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -99,7 +99,9 @@ ifneq ($(CONFIG_HVM),y)
>  $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
>  endif
>  ifeq ($(CONFIG_CONDITION_COVERAGE),y)
> -$(obj)/x86_emulate.o: CFLAGS-y += -Wno-error=coverage-too-many-conditions
> +    ifeq ($(CONFIG_CC_IS_GCC),y)
> +        $(obj)/x86_emulate.o: CFLAGS-y += -Wno-error=coverage-too-many-conditions
> +    endif
>  endif

Please can the two conditionals be combined, like I think we do elsewhere:

ifeq ($(CONFIG_CONDITION_COVERAGE)$(CONFIG_CC_IS_GCC),yy)

or

ifeq ($(CONFIG_CONDITION_COVERAGE)_$(CONFIG_CC_IS_GCC),y_y)

?

Jan

