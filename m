Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0236FA71A0D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 16:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927963.1330730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSXS-0002H7-MM; Wed, 26 Mar 2025 15:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927963.1330730; Wed, 26 Mar 2025 15:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSXS-0002Ef-JG; Wed, 26 Mar 2025 15:19:30 +0000
Received: by outflank-mailman (input) for mailman id 927963;
 Wed, 26 Mar 2025 15:19:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txSXS-0002EZ-0R
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 15:19:30 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b387afca-0a55-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 16:19:25 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so52096495e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 08:19:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efeacasm5116095e9.23.2025.03.26.08.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 08:19:23 -0700 (PDT)
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
X-Inumbo-ID: b387afca-0a55-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743002364; x=1743607164; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XGBNjc/7bYFUGFiPOag7QmYgqexvjJu7OxOL4dSG6lk=;
        b=RYZ1p7bFT/A+URzW/uR1vAS2HjdLJ2jM2kbYxfgwtWWqim5gjBIQB1qIHwU0hv1ThC
         wXxPL/v4jjBnxI3oChAIzjHqctnrDRMRLC1VgJ/OhwCif0UV9N8rsaQ39BizNJ6eHmla
         AH2rYJD7qGBQL+Qi0TK75whFgrPphZLoqCUdlcelsSvVbpgSyENYqIYROtp3qIqaWlSI
         zYH7CQuKwCWPsZ/NTdwD1uT8JjN+ilRODAY3DpbwfNnxAzx5FsDHshBsCgLZ4KZA3CJs
         F9utztwxEMbRsgHRgbQhgZUjW5aEUPxWpVZNb0uVUs3tMK1Trw2tNzBPqRXW5MjZhSB9
         VhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743002364; x=1743607164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGBNjc/7bYFUGFiPOag7QmYgqexvjJu7OxOL4dSG6lk=;
        b=ZfGyfNUu6BRGxcCRodlFueXwBlg7fpbdUCn+mqFDQPXktZv6gref8mVzahHGGl2iu5
         tfObA34JMn8IQx86MFqdgS7O27tAKQiuvahN8n2fafCaqTA/PCYaxllGZY/rd1sZ3xyT
         ZB0ZAnLv/9wG1ow7VmcKSRyxaXEnv1y5x0zbbxNzUxmp/zyQpCB7S4eArGjatO+OdwG+
         +Gu5xzsWRDKSap1IIkw1NLaBgEZ2Kh0DgcX6takohtwyTQqsiDdrdPAsY2eBN5HhSjT3
         iVPhpxIEmS6BLsDZZLk1347A/yH1WrAcCKdlUtcjBC5flHnUX4JpWXyt475bUFpp+c9O
         L+tA==
X-Forwarded-Encrypted: i=1; AJvYcCWNbWYzLTnYSiPGs0M2qRdKtX3bSMoHVH7k+VmCICc0j7xusL4zJsXI9Lau1XMaR5Z3f4rAn/mbneY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEgmzUItfc38YM8WliNQHpRaBXPDvkdFE7kVeQyfiIKvISriAg
	7Uv3qgbg9NHXEUnZvkDDcsHp6JP1WvlSGAX/cM8j9jpruR0XwkmzBKU68742gA==
X-Gm-Gg: ASbGncvL3gmJwu3YC4EaFxSYatumMLpTxP+GeWNLMVIEyVoKDEbNUaZ7EaHrbzlaT4O
	x6TqGDWv1tU0i8oAjmN6bXev9HiK3X509HhHP8hG/x5Xk+NmASvj8ygIGZjz7bk2cs+TxgqW394
	n82YaDxK+JobvtWBBmYidafn0lGS5MAML4OI4UgwPax21bN7fheJqRQPrFMEnOrfrht3kcBt3sm
	7JqLt4f2UJAx9TjCxurpE5JCoq1fmEUxAGGnoFNZ3FPHxdOO6Goyu1PI03Vqr/oN5JuBLRU5lNd
	AFyRFVIiAq2XmmKw5GTLyEYvMnOzp8908PicjQ/pyHz944GLgQ1fGub0Gjg9VpnglE15h8la9jw
	F8Rv+Ol1/dGaB0F4E+0E0qZxrUtuw9w==
X-Google-Smtp-Source: AGHT+IFkffpDSzO9ATtlqXkLmzWd3vbnMRC+H7wNo5WNOmvM+0E6AbIz2a3H1b9d1gXjsdDVGg3zKg==
X-Received: by 2002:a05:600c:1f0c:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-43d555b7ec9mr176600835e9.8.1743002364390;
        Wed, 26 Mar 2025 08:19:24 -0700 (PDT)
Message-ID: <e9fddc7d-feb3-4fd0-830f-de4b7ef17bba@suse.com>
Date: Wed, 26 Mar 2025 16:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/riscv: implement basic aplic_preinit()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
 <f0945e3a41e911b5dfd005a8d15aa0d668d8e3cf.1742918184.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f0945e3a41e911b5dfd005a8d15aa0d668d8e3cf.1742918184.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2025 18:36, Oleksii Kurochko wrote:
> Introduce preinitialization stuff for the RISC-V Advanced Platform-Level
> Interrupt Controller (APLIC) in Xen:
>  - Implementing the APLIC pre-initialization function (`aplic_preinit()`),
>    ensuring that only one APLIC instance is supported in S mode.
>  - Initialize APLIC's correspoinding DT node.
>  - Declaring the DT device match table for APLIC.
>  - Setting `aplic_info.hw_version` during its declaration.
>  - Declaring an APLIC device.
> 
> Since Microchip originally developed aplic.c [1], an internal discussion
> with them led to the decision to use the MIT license instead of the default
> GPL-2.0-only.
> 
> [1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/7cfb4bd4748ca268142497ac5c327d2766fb342d
> 
> Signed-off-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

You recall that From: != 1st S-o-b is unusual, and wants some explanation.
IOW it's unclear who the original author of this patch is.

> --- /dev/null
> +++ b/xen/arch/riscv/aplic.c
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/aplic.c
> + *
> + * RISC-V Advanced Platform-Level Interrupt Controller support
> + *
> + * Copyright (c) 2023-2024 Microchip.
> + * Copyright (c) 2024-2025 Vates
> + */
> +
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/types.h>
> +
> +#include <asm/device.h>
> +#include <asm/intc.h>
> +
> +static struct intc_info aplic_info = {
> +    .hw_version = INTC_APLIC
> +};

Is this going to be written to (much) post-init? IOW - __read_mostly or
even __ro_after_init?

With authorship clarified and this variable adjusted according to whatever
the longer term use of it is
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

