Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12349A719EF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 16:14:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927952.1330721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSRP-0001db-Vk; Wed, 26 Mar 2025 15:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927952.1330721; Wed, 26 Mar 2025 15:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSRP-0001ap-RR; Wed, 26 Mar 2025 15:13:15 +0000
Received: by outflank-mailman (input) for mailman id 927952;
 Wed, 26 Mar 2025 15:13:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txSRO-0001ah-6A
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 15:13:14 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d468a57b-0a54-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 16:13:10 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so5630532f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 08:13:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e65f0sm17195436f8f.74.2025.03.26.08.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 08:13:09 -0700 (PDT)
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
X-Inumbo-ID: d468a57b-0a54-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743001990; x=1743606790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LcNNzFHix/dmgUC3rDZCsnChTjI+jCRZvs1d6v/7WfY=;
        b=KNvRT5NpyGWZqibRBELHYD5TYlb4w/S00dHlr3CPTxEV8j5mmeDYCbx3wLWzEBevAu
         vxyWA9lRXNNxQBGsAydEzXuyi5ptvIJ/PXs8N4f/lY89GDWVtdJVamhvqn+kovqKwjcB
         Q6e3r3/lYPEPE/0Ch2+BuAg0wsQt9eVVe6oQLkwYSuktwRG8R7o4m+8GdKDQlQnFznRe
         8Q7DgRlyG6gBWwDiPuFBr4VFFB1wCNQm7kJ1GLLoUuFny7uZvpT1UpDLxEhTFL6rHPtG
         olEXP92Z43UCFJebbsXUOBfjQXHG9urLx+wz7oZQtOfGaD8+cD+zfpctuvE3oCPLxqcR
         NrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743001990; x=1743606790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcNNzFHix/dmgUC3rDZCsnChTjI+jCRZvs1d6v/7WfY=;
        b=NhKnNpoh8uBHoWRpEyGkkqY9GtkN0IAdgB67ywErQticM/dDtZh67UfTyPS8F7f6wU
         fd0RZmbiFVHO/3VXlvKFHjMgzuPpYDZifGDVGdXxxfyMKwENWzW1FmN+RpPoHgUpbz+q
         g6HrvQDjzur+9foMt0rV5aXnAuLLuzwx9FageBSFMd5mnCBv0ZrKyHXKp4UrH/SpUOc4
         rv9E4wSrKa8Rs6hhp2lpBcgy/G3n2FC6Xw9S4c370GQclrrqtNAscmC/BXcMMiOpjf/Z
         WVa5kiMLEXI+pcfxzHhqxjd8vAdHz3XA/fUbPQybhLsSpHmYSjQAuKkf8XdQvtrt/rVB
         JjIw==
X-Forwarded-Encrypted: i=1; AJvYcCU4j34yu2q2JepM661emB+IZpN5kHLlgQAiaMuTEO6jm0Q55lAWxX5BtSDqnMxUoo1XrQIIRWKU29g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoNhOWnehE/ayOv4GWaotNQHmJWHqkxVX+ZWORbFnZKPfnzbDK
	/3zu4ca1THXtauOPeftiNle/cw/iqriZLKn4ekwBH22NTKR0pCB3x15K22hm5Q==
X-Gm-Gg: ASbGncvdxM82c0EaHrvTxg7TK4qffIIm+WE1gRo77o7uWuvnYzYUo78MebLI4oWbUNl
	ygdKesSziR0QqPfaTErqFvfQ0dlMF1gIlQ1XHtGJogfZS569Enh8p8mE25nGaxc15zQnwB6jFLe
	cEGbZFDZvQcgSNgI9wW7A0jIqeScasIxqjCDTQCuaCjcgnSHxAfe3UH55/WogR8aQQSH60fKRBl
	kefP57eTRl9TYasrQDZN6MyixfwM2Y2IkCt/qPBjwDt2mhMPM7h7bpUpEMkR7R3j6xeEYadcusf
	qOFUeQPCxYt3rys93TEiW8qEFNnYWXzMqAmYPDUeXr1kI60Mi9qWyxZzXc/LTgvU9o7Zbkfw+if
	nSdgTYeR5BefjBh+e2sIAwFmPPpYoTA==
X-Google-Smtp-Source: AGHT+IHpEoAAcxtQqjxyomqK/wbDsASptHmQtkSQx42HPODYpTeshsbNIMgBG9gF+u6hyeL94JKf7A==
X-Received: by 2002:a5d:584b:0:b0:390:f9a5:bd79 with SMTP id ffacd0b85a97d-3997f90ab9emr20882402f8f.26.1743001990060;
        Wed, 26 Mar 2025 08:13:10 -0700 (PDT)
Message-ID: <86c067f2-87ff-4e75-b94a-9d760fc730e5@suse.com>
Date: Wed, 26 Mar 2025 16:13:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/riscv: introduce preinit_xen_time()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2025 18:36, Oleksii Kurochko wrote:
> preinit_xen_time() does two things:
> 1. Parse timebase-frequency properpy of /cpus node to initialize
>    cpu_khz variable.
> 2. Initialize xen_start_clock_cycles with the current time counter
>    value.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>  - Update SPDX tag for time.c
>  - s/read_mostly/__ro_after_init for boot_count variable.
>  - Add declaration of boot_count to asm/time.h.
>  - Rename boot_count to xen_start_clock_cycles.

I'm not going to insist on another name change, but I'm having a hard time
seeing why almost any global variable in Xen would need to have a xen_
prefix. "start" also can be ambiguous, so imo boot_clock_cycles would have
been best.

> --- /dev/null
> +++ b/xen/arch/riscv/time.c
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <xen/device_tree.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/sections.h>
> +
> +unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
> +unsigned long __ro_after_init xen_start_clock_cycles;

For the theoretical at this point case of support RV32, will unsigned long
be wide enough? I.e. is the counter only 32 bits wide when XLEN=32?

> +static __initdata struct dt_device_node *timer;

Please can __initdata (and alike) live at its canonical place, between
type and identifier?

It's also unclear at this point why this needs to be a file scope variable.

> +/* Set up the timer on the boot CPU (early init function) */
> +static void __init preinit_dt_xen_time(void)
> +{
> +    static const struct dt_device_match __initconstrel timer_ids[] =
> +    {
> +        DT_MATCH_PATH("/cpus"),
> +        { /* sentinel */ },
> +    };
> +    uint32_t rate;
> +
> +    timer = dt_find_matching_node(NULL, timer_ids);
> +    if ( !timer )
> +        panic("Unable to find a compatible timer in the device tree\n");
> +
> +    dt_device_set_used_by(timer, DOMID_XEN);
> +
> +    if ( !dt_property_read_u32(timer, "timebase-frequency", &rate) )
> +        panic("Unable to find clock frequency\n");
> +
> +    cpu_khz = rate / 1000;

"rate" being only 32 bits wide, what about clock rates above 4GHz? Or is
this some external clock running at a much lower rate than the CPU would?

> +}
> +
> +void __init preinit_xen_time(void)
> +{
> +    preinit_dt_xen_time();
> +
> +    xen_start_clock_cycles = get_cycles();
> +}

I take it that more stuff is going to be added to this function? Else I
wouldn't see why preinit_dt_xen_time() needed to be a separate function.

Jan

