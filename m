Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D643E84424F
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 15:55:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674062.1048731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVByj-00068d-C1; Wed, 31 Jan 2024 14:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674062.1048731; Wed, 31 Jan 2024 14:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVByj-00066X-96; Wed, 31 Jan 2024 14:54:17 +0000
Received: by outflank-mailman (input) for mailman id 674062;
 Wed, 31 Jan 2024 14:54:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVByh-00066R-VY
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 14:54:16 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99156081-c048-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 15:54:13 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40fafced243so13053805e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 06:54:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b0040ebfbff33csm1832617wmq.36.2024.01.31.06.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 06:54:12 -0800 (PST)
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
X-Inumbo-ID: 99156081-c048-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706712853; x=1707317653; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DzTqN1m7ZLlfGb8HuWhZyM4OgtgLBJGoLectBaavm4M=;
        b=Bp29OaZsD19pIanU0KIiKUiT3wEz47CPtMjKdfHR/FvnYC1++rYxaPw02HW9+b5NI7
         ICIWtUkS3xWCy5zWCsU7M0bsMiQGJRXKGDr47V6AZfiMOLkRdg4M29ZMdeOwAtYJgR8R
         u7lqbS2+suhrn3p161j3XZXr2sH+heLEcgCWu+07L8NGaLDWCbhf8E4bfTUddHCb7vC5
         qYY18kvQRfYHtz4kurj4P6ombak9J12LaGBB9zxgG+Da9v1Xn1hWaXnO7XD9JyC2XTn2
         2uZVyJw5nkS9tINwFH/es1hRsvKLMX/dCczQAIcglERK9oCyx1CmUU+bLy9y/RWpPxDA
         /Iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706712853; x=1707317653;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DzTqN1m7ZLlfGb8HuWhZyM4OgtgLBJGoLectBaavm4M=;
        b=Ruq392wt4GZzYVpiT7GOKqxMkiXQPS7xEJfmfy9hpwV6CCNuill9g2XHoI7IAWuVXF
         P02UBgzqBcHthvFgNNeuCyNoCVDTdK0X0ZK2TtBJopqIgbO3QT5GGl6O+ZPq8iVN7i45
         LjJuGA4vayV1dnR8KbuRBZ2V8Mf/+2bu2MjAOKNGsSPpwoRdxHqbjiLbs9UUyuF4i734
         qhmfKqdqk2RG7RrJqqVYAxqYg9Bl+YsEU+L/3rsgKsCxmuzADIxyKxghIB0kuWl0voUn
         bEnv1aqVhvr39IeeBNya01WuO/TN5RYKSvWbjquziHphtTbCguJXzbheaeX15UszGbJ0
         YRow==
X-Gm-Message-State: AOJu0YxrOt4/13m8jJ3lY7yLa9sPxipd79uYkFw3aI/QrSvHO8yqDpTT
	aZr8b6GmtPP2rk8iGIYqpiShHPtijcxyQk4VZ+6RY4kWhw3E8kPah/AAvU/IUA==
X-Google-Smtp-Source: AGHT+IFutC55kQydBv1kZRK/PDDI7B9DI1tFsl43zkwNY6h88JV9uadZwUkAPqUKEtjVInE6F09kxA==
X-Received: by 2002:a05:600c:3b20:b0:40f:af67:5275 with SMTP id m32-20020a05600c3b2000b0040faf675275mr1589223wms.4.1706712852963;
        Wed, 31 Jan 2024 06:54:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVAxkZLbqkQRh3YFSPELGgcGSIS7gTzNAxeNPps0al+vYsmNRXAZaHkhfOPcG9eIdJV7tTwt5+Cqp5M8U1p1TkftycdKp+n39MUiC9HpBr3px+6cMIG/A1UIHEijNk+AVpXP6WWuTZf9K7/bYar5s9mcriAnMANlKR3/+zinj9h7xf44L8HVwdxrtIVNpep2y9LmXkKHktjT744y7s=
Message-ID: <392e3c39-e984-4e4c-8ca9-f4a2f2ea86cf@suse.com>
Date: Wed, 31 Jan 2024 15:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] xen/asm-generic: introduce generic device.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1706281994.git.oleksii.kurochko@gmail.com>
 <621ff5bd992ea8e6202ec03fa52c0e09aacd8f83.1706281994.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <621ff5bd992ea8e6202ec03fa52c0e09aacd8f83.1706281994.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.01.2024 16:42, Oleksii Kurochko wrote:
> Arm, PPC and RISC-V use the same device.h thereby device.h
> was moved to asm-generic.

It's not "move" anymore with the splitting off of the Arm and PPC
parts. For reasons mentioned before, I'm not exactly happy with
it not being a move anymore, but I expect you were asked to split.

> Arm's device.h was taken as a base with
> the following changes:
>  - #ifdef PCI related things.

Well, not really, with ...

>  - #ifdef ACPI related things.
>  - Rename #ifdef guards.
>  - Add SPDX tag.
>  - #ifdef CONFIG_HAS_DEVICE_TREE related things.
>  - #ifdef-ing iommu related things with CONFIG_HAS_PASSTHROUGH.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V7:
>  - keeping DEVICE_PCI_HOSTBRIDGE available for every build based on the reply:
>     https://lore.kernel.org/xen-devel/926a5c12-7f02-42ec-92a8-1c82d060c710@xen.org/

... this. Specifically ...

> --- /dev/null
> +++ b/xen/include/asm-generic/device.h
> @@ -0,0 +1,162 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_DEVICE_H__
> +#define __ASM_GENERIC_DEVICE_H__
> +
> +#include <xen/stdbool.h>
> +
> +/*
> + * DEV_TYPE_MAX is currently not in use, but it was added because the enum may
> + * be empty when !HAS_DEVICE_TREE and !HAS_PCI, which could lead to
> + * a compilation error.
> + */
> +enum device_type
> +{
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    DEV_DT,
> +#endif
> +
> +#ifdef CONFIG_HAS_PCI
> +    DEV_PCI,
> +#endif

... this is now inconsistent with ...

> +    DEV_TYPE_MAX,
> +};
> +
> +enum device_class
> +{
> +    DEVICE_SERIAL,
> +    DEVICE_IOMMU,
> +    DEVICE_INTERRUPT_CONTROLLER,
> +    DEVICE_PCI_HOSTBRIDGE,

... this. Either we want PCI-related #ifdef-ary, or we don't. There
shouldn't be a mix (unless there's a good reason).

Also the use of blank lines inside the earlier enum would better be
consistent.

> +    /* Use for error */
> +    DEVICE_UNKNOWN,
> +};
> +
> +struct dev_archdata {
> +#ifdef CONFIG_HAS_PASSTHROUGH
> +    void *iommu;    /* IOMMU private data */
> +#endif
> +};
> +
> +/* struct device - The basic device structure */
> +struct device
> +{
> +    enum device_type type;
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
> +#endif
> +    struct dev_archdata archdata;
> +#ifdef CONFIG_HAS_PASSTHROUGH
> +    struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
> +#endif
> +};
> +
> +typedef struct device device_t;
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +
> +#include <xen/device_tree.h>
> +
> +#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
> +
> +/**
> + *  device_init - Initialize a device
> + *  @dev: device to initialize
> + *  @class: class of the device (serial, network...)
> + *  @data: specific data for initializing the device
> + *
> + *  Return 0 on success.
> + */
> +int device_init(struct dt_device_node *dev, enum device_class class,
> +                const void *data);
> +
> +/**
> + * device_get_type - Get the type of the device
> + * @dev: device to match
> + *
> + * Return the device type on success or DEVICE_ANY on failure
> + */
> +enum device_class device_get_class(const struct dt_device_node *dev);
> +
> +#define DT_DEVICE_START(_name, _namestr, _class)                    \

Would be really nice if in the course of generalization these leading
underscores would also disappear. Yes, that'll require changing two
of the names more than just to drop the underscores, to account for ...

> +static const struct device_desc __dev_desc_##_name __used           \
> +__section(".dev.info") = {                                          \
> +    .name = _namestr,                                               \
> +    .class = _class,                                                \

... these field names.

Also there's a strack backslash on the last line above.

Both comments similarly apply to the ACPI stuff further down.

> +#define DT_DEVICE_END                                               \
> +};
> +
> +#else /* !CONFIG_HAS_DEVICE_TREE */
> +#define dev_is_dt(dev) ((void)(dev), false)
> +#endif /* CONFIG_HAS_DEVICE_TREE */
> +
> +#ifdef CONFIG_HAS_PCI
> +#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
> +#else
> +#define dev_is_pci(dev) ((void)(dev), false)
> +#endif
> +
> +struct device_desc {
> +    /* Device name */
> +    const char *name;
> +    /* Device class */
> +    enum device_class class;
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +
> +    /* List of devices supported by this driver */
> +    const struct dt_device_match *dt_match;
> +    /*
> +     * Device initialization.
> +     *
> +     * -EAGAIN is used to indicate that device probing is deferred.
> +     */
> +    int (*init)(struct dt_device_node *dev, const void *data);
> +
> +#endif
> +};
> +
> +#ifdef CONFIG_ACPI
> +
> +struct acpi_device_desc {
> +    /* Device name */
> +    const char *name;
> +    /* Device class */
> +    enum device_class class;

I understand it's this way on Arm right now, and I'm also not going
to insist that you do anything about it right here, but it's still
odd that struct device_desc doesn't simply have a union to cover for
both DT and ACPI.

Jan

