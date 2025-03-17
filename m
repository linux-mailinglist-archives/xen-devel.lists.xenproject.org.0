Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5469DA65605
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 16:40:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917214.1322177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCZd-0003o9-23; Mon, 17 Mar 2025 15:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917214.1322177; Mon, 17 Mar 2025 15:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCZc-0003l3-Ux; Mon, 17 Mar 2025 15:40:16 +0000
Received: by outflank-mailman (input) for mailman id 917214;
 Mon, 17 Mar 2025 15:40:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuCZc-0003kx-4d
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 15:40:16 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b60f185-0346-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 16:40:14 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3996af42857so202496f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 08:40:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975b34sm15458763f8f.55.2025.03.17.08.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:40:08 -0700 (PDT)
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
X-Inumbo-ID: 1b60f185-0346-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742226008; x=1742830808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QPt7KF+lNJEyOT0Ld0v1dwJXVJeRy5UpOiPKFqyk38A=;
        b=KGEpnO0AclJ0tDffSWMCYJJ6XIfIFKKHMVvZ5VFs7lTjwF23FPbTEchjgB3X96bmcs
         IuYn8YA1vl9R9RUkKn7uixjIiYYB/ruGFw5+YMHblXeExpWbVCObyU/28SQiwiBacL3X
         6fro98K14Fqh0ibIbqPa73UQ+L/jjIstLU+Bh32YGh78SL6D1fJ8EpjRCfQl0CF3kv7x
         llayhLFz6YEYSHHbJYfnaGOwQMqvJJF4/oT0jXuGAXxpu/HaT/S7YXbh0QueeBlV7xQs
         zf1uXIssLLoVcuR2ZtUrq8BoaaO0Jxa3+296kXxuzWJ4PDC+Ib0lpAnGXH+1oSKZmcjl
         fo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226008; x=1742830808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPt7KF+lNJEyOT0Ld0v1dwJXVJeRy5UpOiPKFqyk38A=;
        b=sbFF68sDJKKE3tUsPEkJCKyFSaBIrGvz32z2w8Bo/BGJQ+QGQAK1y+GdDOmV9VFKMm
         oqtSC1nVvcoXN4PVCvbAzXFWuiCG2O5pVohdVrbEQb0rWzTU8JA6K56u0HR1OUzPYfYX
         blnvjK85RAns57ptT9ZBjJUZvKG5OO5XtbSa//fYBFeU+NTNnzusRzwnD5pv1pW7eLv7
         C9PPzq6voYEbjMGPIWBeaV0hSemfgLOXAgFo7IbW840fBTI13h4BOvUEm9NwSFR9bTDI
         TuVNJA+/ghXFWUdv0ci1b8Sl2Ym2wCKlmiPtObndfEAqPFkzpBRJTHhcgpGFvXoKJHJ7
         jcOA==
X-Forwarded-Encrypted: i=1; AJvYcCU+y0QkXtVZYrbLDLUrvqvUijw2d2RaXhw9loErUut3yBnYTCJ1j+aOYqehU+mLmuuRCfBFzKSQH/E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw71AZP71pdrigUKDwuW+ZCDZSHILn5nWrVRHVlUm926VnNYfJl
	hfba02SBnFjFQjY9TExYRwmAh1M9a7cXhuKupbIX/l5K5W3cPvVI5vWx2Xmtug==
X-Gm-Gg: ASbGncuKxaZQK3ap+2mYi4g97KFcnJRTwZZMs0j8htSGhS++958V/Nd78eaKABg/yGL
	8kvjqC2aa58YKAQ7aY0Ww4XmRq8otjhXQLpd7CV4fvrU/u0EKnh9znPHv8GmjgkDrreR8rbbP8r
	InzzZNB5F332Q/hGWsOaWuHpz2FaaC8SVivoccmETtguoqm+GNjnF8tKwsskjCeF2KTvlh6cOix
	JEKQjsCSqVRPCAB/VtDd9dJJk4diKYkULidLv2HeR+9Fl5JilujvRk9Rah+zWdsgHZV0ViJh5QL
	qGlR7GtanZb7kDJ45HAQ9qWtoB32Ec8kvdMp3nfL29OPL574V8GT+kBf5RYeVS+bc1eCbv75fAD
	aWfAwChkcDHOKxWAhuQolp0m7EzT+Vg==
X-Google-Smtp-Source: AGHT+IFOTgigvQ4nIOlYoVa2D/ADiTxNAky8eUy9TLZmh/pkW522xiy9YrH8/RiyqzLqsIx0J0Sx0A==
X-Received: by 2002:a05:6000:1acd:b0:390:dec3:2780 with SMTP id ffacd0b85a97d-3971dae92ddmr15016362f8f.24.1742226008623;
        Mon, 17 Mar 2025 08:40:08 -0700 (PDT)
Message-ID: <9187583f-a4d0-429e-a666-113c4f8aabaa@suse.com>
Date: Mon, 17 Mar 2025 16:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] xen/riscv: implement basic aplic_preinit()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
 <6e2212313a47772d6929ae76f5e4be0f365766e9.1741709885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6e2212313a47772d6929ae76f5e4be0f365766e9.1741709885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 17:19, Oleksii Kurochko wrote:
> Based on the code from [1] provided by Romain Caritey from Microchip
> with some minor changes():

"Based on", to me at least, suggests an import from some other project. The
reference looks to be to a Xen tree though. With that, a proper description
would then be needed here, rather than a list of differences.

> --- /dev/null
> +++ b/xen/arch/riscv/aplic.c
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/aplic.c
> + *
> + * RISC-V Advanced Platform-Level Interrupt Controller support
> + *
> + * Copyright (c) 2023-2024 Microchip.
> + * Copyright (c) 2024 Vates
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
> +    .hw_version = INTC_APLIC,
> +    .node = NULL

This latter one can be omitted.

> +};
> +
> +static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
> +{
> +    if ( aplic_info.node )
> +    {
> +        printk("XEN doesn't support more than one S mode APLIC\n");
> +        return -ENODEV;
> +    }
> +
> +    /* don't process if APLIC node is not for S mode */
> +    if ( dt_get_property(node, "riscv,children", NULL) )
> +        return -ENODEV;
> +
> +    aplic_info.node = node;
> +
> +    return 0;
> +}
> +
> +static const struct dt_device_match aplic_dt_match[] __initconst =
> +{
> +    DT_MATCH_COMPATIBLE("riscv,aplic"),

Iirc this requires use of __initconstrel, which would also be nice to
be put between type and identifier.

> +    { /* sentinel */ },
> +};
> +
> +DT_DEVICE_START(aplic, "APLIC", DEVICE_INTERRUPT_CONTROLLER)
> +        .dt_match = aplic_dt_match,
> +        .init = aplic_preinit,

Nit: Indentation looks too deep here.

Jan

