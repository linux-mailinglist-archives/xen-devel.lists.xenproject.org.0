Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1D5AC061B
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993082.1376532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0hK-0005IH-LH; Thu, 22 May 2025 07:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993082.1376532; Thu, 22 May 2025 07:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0hK-0005Gi-Ik; Thu, 22 May 2025 07:50:38 +0000
Received: by outflank-mailman (input) for mailman id 993082;
 Thu, 22 May 2025 07:50:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI0hJ-0005GW-6R
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:50:37 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7065e7eb-36e1-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 09:50:33 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so1305776766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:50:33 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d498f18sm1030321666b.150.2025.05.22.00.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 00:50:32 -0700 (PDT)
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
X-Inumbo-ID: 7065e7eb-36e1-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747900232; x=1748505032; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eUyGdua4W5d8JFvp3f9dAGXjC9yavNqlLQekS0f5fLw=;
        b=fjcvs0MHxPp+JAHtacB0UNJ88WfIc8oUuyyCCldqX9GD/BTfrSrZJ4+YIs3Tc1X9wX
         RqWyO0wAxTvaqM1EwfkkIjXH5aJm6Eu/ZxYtcfd/oe48HXQ/pOY3syFNOn6ZTX0S/lzQ
         00B4e2iIkn/n4wiGE3O6Crv7QifcRoAe20zyzSB2C//z8GD4gJi/tyOalBuJEwUSipj/
         BjZq66ug07JkspRQJuPXQsfbAxdjuSDR07bAfxnbAQ+tBY/i7N3DfJGLKQ3oIkh7SWCy
         qljVcxwA+6a4EGXPV+bQ4qN0wAnrnTE1PJ6iMBiKiUDci2Jbdw19dSuD+GnrA3AW8TQA
         VyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747900232; x=1748505032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUyGdua4W5d8JFvp3f9dAGXjC9yavNqlLQekS0f5fLw=;
        b=HjrMr6/nyMTQScp+I2yFVgCiwWOjJ7SjYzM1CJkrX66YoL6ZifPbOkHdYdAOuhM+ZO
         0Eci8mSANy0uITCo+Z0EP6pTQLk3nYKpaYCcXjj9kYLTroPswS76Am3j6HudvjLFCdye
         M3t0wtC4/K1sHIIeJszvxNie0naLS1jGYDANmoPUsv1jINdkE5iANPkjJT6NjDgJRCbg
         dkff68f77qmCVVBrdBziUALC9CJ8UgkvFKtrpsmmxnJ/lvXqFs5Dns9/ygwkTdlAla1o
         a2lXww83idNqGEvxOD9WAFs4Wr1njJdPMNTGNrZ6iAQurzQOrKglaHwnU/6yvbV53woG
         X4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeWCLoR5SoUH6rr335m7y7nnDcrHUe5a0KTz3HtRgU14L1GRi6voHOxED+WqKxaVWGGx0c2onnypA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsQKpn3O6HmpTgx9ShGGMNk6/qsqVo6+0ldAYi/UTF5QibGz0j
	IsZKZnlu9SY5F1jINS3VKxSHu9PGGz6oe1J+IDv9aiCHOipHhlHRXu7z/KNnioAUxA==
X-Gm-Gg: ASbGncsL/feYrL66Yx1VDUMfFnY+sPRIVl4qFBsLIH+ueQ9OdoldaKD9+QxMs2y0XXF
	mygK3uH3SN9k/mHRKzpdoAdB7rXO1MAhJxtAqoVIyhveJteWwOkVzviW61RVOFpOpi8FZe87jYf
	reIw2UkQxdYcxf3uSdLqjKG/TjfrntW45ZwckRhDEoPwrDOajKC3dNVfGLauMvQP7odNf/WPjmC
	ycB/zp3vEa1Cogmu80uzW/0O99bk9i5Pcnj4NKlWIPdXh+XWwYS4OjPBX+rVUhCcT2dkwPNtO3f
	GGaBnezMC71lACoEtNqx7eGC4/eq3Q/O5Hg1IBi728uKQyhuIvp0s38CActi5g==
X-Google-Smtp-Source: AGHT+IEoeKkVySC3t2E9exF62m7QFue6AAuVdnqoPW5eTPYk0KGWL+bv3vS+EQNQJ1wAyEmKjd2+qA==
X-Received: by 2002:a17:907:80b:b0:ad2:2fa8:c0a7 with SMTP id a640c23a62f3a-ad536b7c43fmr1981181466b.21.1747900232523;
        Thu, 22 May 2025 00:50:32 -0700 (PDT)
Message-ID: <12e3ad4c-b7cc-4166-940f-b2301349680c@suse.com>
Date: Thu, 22 May 2025 09:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] xen/riscv: dt_processor_hartid() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <5aec324c04c67ba88336244358542f3faa6726b2.1747843009.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5aec324c04c67ba88336244358542f3faa6726b2.1747843009.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 18:03, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/smpboot.c
> +++ b/xen/arch/riscv/smpboot.c
> @@ -1,5 +1,8 @@
>  #include <xen/cpumask.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
>  #include <xen/init.h>
> +#include <xen/types.h>
>  #include <xen/sections.h>

Nit: The latter insertion wants to move one line down. Yet then - isn't
xen/stdint.h sufficient here?

> @@ -14,3 +17,69 @@ void __init smp_prepare_boot_cpu(void)
>      cpumask_set_cpu(0, &cpu_possible_map);
>      cpumask_set_cpu(0, &cpu_online_map);
>  }
> +
> +/**
> + * dt_get_hartid - Get the hartid from a CPU device node
> + *
> + * @cpun: CPU number(logical index) for which device node is required
> + *
> + * Return: The hartid for the CPU node or ~0UL if not found.
> + */
> +static unsigned long dt_get_hartid(const struct dt_device_node *cpun)
> +{
> +    const __be32 *cell;
> +    unsigned int ac;
> +    uint32_t len;
> +
> +    ac = dt_n_addr_cells(cpun);
> +    cell = dt_get_property(cpun, "reg", &len);
> +    if ( !cell || !ac || ((sizeof(*cell) * ac) > len) )

Does DT make any guarantees for this multiplication to not overflow?

> +        return ~0UL;
> +
> +    return dt_read_number(cell, ac);
> +}
> +
> +/*
> + * Returns the hartid of the given device tree node, or -ENODEV if the node
> + * isn't an enabled and valid RISC-V hart node.
> + */
> +int dt_processor_hartid(const struct dt_device_node *node,
> +                        unsigned long *hartid)
> +{
> +    const char *isa;
> +    int ret;
> +
> +    if ( !dt_device_is_compatible(node, "riscv") )
> +    {
> +        printk("Found incompatible CPU\n");
> +        return -ENODEV;
> +    }
> +
> +    *hartid = dt_get_hartid(node);
> +    if ( *hartid == ~0UL )
> +    {
> +        printk("Found CPU without CPU ID\n");
> +        return -ENODATA;
> +    }
> +
> +    if ( !dt_device_is_available(node))
> +    {
> +        printk("CPU with hartid=%lu is not available\n", *hartid);

Considering that hart ID assignment is outside of our control, would we
perhaps better (uniformly) log such using %#lx?

> +        return -ENODEV;
> +    }
> +
> +    if ( (ret = dt_property_read_string(node, "riscv,isa", &isa)) )
> +    {
> +        printk("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hartid);
> +        return ret;
> +    }
> +
> +    if ( isa[0] != 'r' || isa[1] != 'v' )
> +    {
> +        printk("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hartid,
> +               isa);
> +        return -EINVAL;

As before -EINVAL is appropriate when input arguments have wrong values.
Here, however, you found an unexpected value in something the platform
has presented to you. While not entirely appropriate either, maybe
-ENODEV again (if nothing better can be found)?

Jan

