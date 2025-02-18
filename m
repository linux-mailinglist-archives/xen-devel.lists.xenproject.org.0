Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FD0A3A381
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 18:04:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892149.1301149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkR0j-0004Yr-81; Tue, 18 Feb 2025 17:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892149.1301149; Tue, 18 Feb 2025 17:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkR0j-0004Vt-4M; Tue, 18 Feb 2025 17:03:53 +0000
Received: by outflank-mailman (input) for mailman id 892149;
 Tue, 18 Feb 2025 17:03:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkR0h-0004Vn-UA
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 17:03:51 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 531575fb-ee1a-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 18:03:50 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5df07041c24so5910413a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 09:03:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece2709a9sm8948253a12.53.2025.02.18.09.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 09:03:49 -0800 (PST)
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
X-Inumbo-ID: 531575fb-ee1a-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739898230; x=1740503030; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BlBrZGvk12uodcCAcji66h2N3ST3jWFo3NYH+m7Nf+o=;
        b=QvcacpXk99m7czRYn09N7TR+EyXfDqUjuKxpPoF2pso/ASfvLOR5YzVGMKLXtaMy4Z
         KIQdj3i4dCHD6vyUGwqyZOkRIWyuZtOewfaOJFKFxldNrqemFmsz5AN2+jDUVoqQwlUI
         n4FvpcKkpkpKaMFMNUfWnunRkUJM4rOlvCvn1ba+M0sq6fF5AuZdVfM3AMn3KlKRepcO
         6L1oMrxti3YeioRLB6HODGEwrzYPlzn8G3QiFSECgm7EUjPkc98kW9kcjGTzi/17gxZ/
         8vT/4NzA2N1qcjH8vGZlz4Rvk6MovlPFzIBMEY01pwCaDWEJnwKkMtEENj57CFZ9hR9f
         pOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739898230; x=1740503030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlBrZGvk12uodcCAcji66h2N3ST3jWFo3NYH+m7Nf+o=;
        b=aNsrpbOFxiOpkfWgun5WnMZNymzjz7t7MoVBTM8G5jqab8AXeJdosUBdOVroXEc7VT
         Brsv2d/nKKdeGxORLl/Sy+PYU5nP7uS6DJyL4fZZGR4MTmWtjCW/EqXauwiZksfT5tcK
         FebHC6ugWude/33JkqimyuBF0EXjzuYpW/2hHstZhTCqLHRBvbQwGwA/d6n4dwNhmwG+
         FddiaOU9m1a09jFuR4nlAof7yaIyHa4ZWLiswA0DSkizkWFyoqfMy/yHUzsiNxytMH48
         nP5bArPiXZchtk5jb+7hm63rJUCbXpe38WtkpOzzFDW256Wg0sC64syPl7heX5dREsyx
         AraA==
X-Forwarded-Encrypted: i=1; AJvYcCUL3dftKWv8La+d9c5RvmJwNUuvglG/OFlI6u/38J+D5lblM+9g+dBWMQDVx16zoTw9F/u73INERhE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzmjkwry7Ru5ZZRsz4r7pOaZ/6btmPZBW6z8Wc3Z9qHHDnV/uXK
	Ug7PaPvY8gpyQl24/ailynpYdPYArh8KT6z8/zZd1QTreOcsQ+vph1CtiXghpg==
X-Gm-Gg: ASbGncv8SM5B7AbNTiFkPqgNRdNfiCKXbDNjomT+TzVzSL+viNOeQ7oKYsowaSGO8rE
	s+qA9JTHjM/AuJatpJtELJqwd4KgVdvZonhTTR97W/pwA/dFcGDbUhlpYFI8QOXFJ9iVCdLmoII
	hqG1X/ELnPlHGOrMNtWt8Q7WjrsZ/W9M+4+D8XkCNTaHFedhwfGeodI18h0ZynsoJ2T6dTyUgSU
	y3/+uQwJTol9m2sGMcC4z0KTHIWUwy0qveag6BY42ujNr/uOL49rI+eqJWd7/KUcy2pgKL8E8fG
	pF742gElKZEUjeJWoQWatPoAqOmxLn/V2Y5RabVHktWKPOHqLN8wm1yks0daGuFIn0w2TZH+8+d
	2
X-Google-Smtp-Source: AGHT+IE5KFIhs+fplNfxOWmqofjSaG5LH/6jtpkScs4/VpKaEz93KV2E2fCMx23StHZBktS3yQZdHA==
X-Received: by 2002:a05:6402:3488:b0:5dc:d8e6:62a7 with SMTP id 4fb4d7f45d1cf-5e03606d67fmr14978483a12.14.1739898229771;
        Tue, 18 Feb 2025 09:03:49 -0800 (PST)
Message-ID: <10155bb3-20c8-4d08-aafc-df41112c91c9@suse.com>
Date: Tue, 18 Feb 2025 18:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v6 1/2] xen/riscv: drop CONFIG_RISCV_ISA_RV64G
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739355004.git.oleksii.kurochko@gmail.com>
 <82c9611b923170b0525a7b76337ef067e359dc96.1739355004.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <82c9611b923170b0525a7b76337ef067e359dc96.1739355004.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.02.2025 17:50, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -28,16 +28,6 @@ choice
>  	help
>  	  This selects the base ISA extensions that Xen will target.
>  
> -config RISCV_ISA_RV64G
> -	bool "RV64G"
> -	help
> -	  Use the RV64I base ISA, plus
> -	  "M" for multiply/divide,
> -	  "A" for atomic instructions,
> -	  “F”/"D" for  {single/double}-precision floating-point instructions,
> -	  "Zicsr" for control and status register access,
> -	  "Zifencei" for instruction-fetch fence.
> -
>  endchoice

Shouldn't the choice be removed altogether then, for now being empty?

> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -6,8 +6,13 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
>  riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
>  
> -riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
> -riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
> +riscv-march-$(CONFIG_RISCV_64) := rv64
> +
> +riscv-march-y := $(riscv-march-y)ima
> +
> +riscv-march-$(CONFIG_RISCV_ISA_C) := $(riscv-march-y)c
> +
> +riscv-march-y := $(riscv-march-y)_zicsr_zifencei

The repeated use of := makes this longer than necessary, and hence harder to
read. I understand using += isn't exactly ideal either, because then on the rhs
no blanks may appear (aiui), being kind of against our style and potentially
hampering readability. Still maybe:

riscv-march-$(CONFIG_RISCV_64) := rv64
riscv-march-y+=ima
riscv-march-$(CONFIG_RISCV_ISA_C)+=c
riscv-march-y+=_zicsr_zifencei

?

Jan

