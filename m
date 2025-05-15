Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246CAAB8371
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 12:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985131.1371067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVN9-0004x0-5w; Thu, 15 May 2025 09:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985131.1371067; Thu, 15 May 2025 09:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVN9-0004ue-3I; Thu, 15 May 2025 09:59:27 +0000
Received: by outflank-mailman (input) for mailman id 985131;
 Thu, 15 May 2025 09:59:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFVN7-0004uN-TU
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:59:25 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4839d77d-3173-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 11:59:25 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad21c5d9db2so123488066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:59:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd479sm1078443966b.151.2025.05.15.02.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 02:59:24 -0700 (PDT)
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
X-Inumbo-ID: 4839d77d-3173-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747303165; x=1747907965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s6RtDKy54m9dkYd4udXg1KJZIBZr79kJV4uoqATV6Pw=;
        b=DAzW78B+ds/ndgsYttAOkEtLYyJNWcQzDzj/P8UyGeCJ1BOJbsq77H0YGJXfwwdy13
         bNfsc5ABP7h2aQchLRoe6bJW4d9KYdnattsNJv2naA4wQE6HrXWerYO+retDsOTFjsFH
         zIIdtDUp8qQcl6/6qUYnnCMFVaBGmYS3EvMostOMbIn7JH8GfZ5tedUCsAUXlW7qRkog
         FX8TETRM1So/zVZ6KAfPzWo7AEh05JutpF/aKDSpqhI+d10raB5EOycW5WmUu0DnmPI6
         7C/U8s+xu0u64mhbB5FWFaX3h8PtDBmZ5AKJd8rCMe9JVZlAKb9SxqHxT48V7Non6WTO
         pZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747303165; x=1747907965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6RtDKy54m9dkYd4udXg1KJZIBZr79kJV4uoqATV6Pw=;
        b=c115nk/6rSuOf31mj79H+w5rt7avlDCoVDvDGJLfsZwUgFarlhIkbDD/G2qywYXWCl
         LE44O0l4mOwoxVo69LBSpjlUNKKTZfonlGfPZPzKRId8So74v28edCUftN2Ke+R6tQYx
         1ninPfJ6D/lyK6FpLUq77ssn0IQ+Sjkh3J9PIV/vc8akWFvVVNnaobF5CS/7U9ajPAkI
         8cw2gkF739hi0p5Ag4kfY00exUWEEbaEk7FSzg6fuYLyz2radzROy33w2aix9zkM47gm
         Zmq+ZTvs8D2AxufEIUTU5OrcuWouPanUeUdaQAUHl+A3h8xo1RCwBjyNC8grlT1Uy89m
         CGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKAJq5nEID+OKUU3XmenI2pKA91qEg2PQtXWhBhXVXgP44fn1xIXOLFchATvxU4XFtsBx5tDjXtWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2855yOH5x7zS6Y02LUlhwrJIhiTCjuBym888r4/upoxlskXFn
	YJPwRw8x7k/ZBzMZYiWVGwnbGy5NXv1Fd9lDpl+eRN2kSyLsc3bbMWa/ehBdiQ==
X-Gm-Gg: ASbGncty57HVaVSpxteR++rGlrzDeg+TKBejPyM5iWZ69aR5njZHMOtrn/umuHEvWEa
	E4NwjpW2sLuq4JIuELNig92QRB56cCYzi5jSW4cwpPfnHeMF254dRNeiLYTjNBXNRLvtYCGitL8
	eX9hfZiNB8rt9opFGdUf1OIKivMsIoas1wGB27jfVMgVLOQD36ouifOrk6XaNouKN7dowpSKLWt
	Y5WK/KFvlWXGQ39NxDX6UwW9EMiJct99P0oWvST7m0tlRNFfyoOEVcMpI7o0kqANnvYoHN6NjmU
	Nu0KHSnYhyq4AubZj4B9zHnv6l7XFTasxj7g7B1tVtaHe1HayGOW3rFM8tPNv9LALgJlJetJwLr
	tDg2Hg0izc2FeOqvtgF7+vTOtjzC/H5xA0EPE
X-Google-Smtp-Source: AGHT+IFDDEQGoBAYuj1z8MfpC0CTI8va5irYHNnt7w9SQItIW1ojoGAhmQRxr59ArtXm5F+qtlLPJA==
X-Received: by 2002:a17:906:340a:b0:ad5:e0a:5891 with SMTP id a640c23a62f3a-ad50e0a5b7amr253922366b.1.1747303164655;
        Thu, 15 May 2025 02:59:24 -0700 (PDT)
Message-ID: <b032b85f-df45-4711-a852-a430d0f41044@suse.com>
Date: Thu, 15 May 2025 11:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/16] xen/riscv: add basic UART support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <9fbcd17751fb0b7925d622631acb0030ee110465.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9fbcd17751fb0b7925d622631acb0030ee110465.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -4,12 +4,16 @@
>  #include <xen/bug.h>
>  #include <xen/bootfdt.h>
>  #include <xen/compile.h>
> +#include <xen/console.h>
>  #include <xen/device_tree.h>
>  #include <xen/init.h>
>  #include <xen/irq.h>
>  #include <xen/mm.h>
> +#include <xen/percpu.h>

Why's this needed? I can't spot anything ...

> +#include <xen/serial.h>
>  #include <xen/shutdown.h>
>  #include <xen/smp.h>
> +#include <xen/timer.h>
>  #include <xen/vmap.h>
>  #include <xen/xvmalloc.h>
>  
> @@ -136,8 +140,17 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      intc_preinit();
>  
> +    uart_init();
> +    console_init_preirq();
> +
>      intc_init();
>  
> +    timer_init();
> +
> +    local_irq_enable();
> +
> +    console_init_postirq();
> +
>      printk("All set up\n");
>  
>      machine_halt();

... relevant here. With the need clarified or with the #include dropped:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

