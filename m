Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825538516E6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 15:20:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679591.1057087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZX9v-0007Wb-8x; Mon, 12 Feb 2024 14:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679591.1057087; Mon, 12 Feb 2024 14:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZX9v-0007Ub-5J; Mon, 12 Feb 2024 14:19:47 +0000
Received: by outflank-mailman (input) for mailman id 679591;
 Mon, 12 Feb 2024 14:19:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZX9t-0007UV-U2
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 14:19:45 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4d7957f-c9b1-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 15:19:44 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so2118998f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 06:19:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ch16-20020a5d5d10000000b0033b58cbf3ebsm6953562wrb.26.2024.02.12.06.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 06:19:43 -0800 (PST)
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
X-Inumbo-ID: c4d7957f-c9b1-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707747584; x=1708352384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JulKx+SVt0hyNzIkagwD5rYYirJi6m5LCwZwtfnX1AQ=;
        b=UXhindaLqirT+xi/Pnh2KSMbmo7+IUNo38H39SN4PdHwhTXiZsExUhv/7zG0q12Ha4
         rQG/qhNo4vBCmJapcptVONz6S875I4dZWB/r1s9FOfdWtxWnwAEi9wjaRqC/jLbuE6Vz
         7ovyxYtbXzsKEPUoO1KOOrYe6oD6j9I6o5UbhLPcPt2VefBrpBKNdW1iAP0TybRWMphn
         oyMM7/ePhzCnN8DWXDKnBZF0F6g+TEYurVy3qMg1JWmPgdNyK8rWiPex1mECnN9+1wae
         4xuibFXVasS+SPcK0ZlOHZONmFLXJuah4kq98x+m2SHe05EQkxZeHwouKYLqG8Ee4vnu
         /7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707747584; x=1708352384;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JulKx+SVt0hyNzIkagwD5rYYirJi6m5LCwZwtfnX1AQ=;
        b=vE9vEvKsSEm29UAWwNzf7ohqBh828xEajrgIPvHzg6b/mq9USKub1IZ2eXGqvE/S4+
         2bDpsB2Vaj5kTBrnt+OrpTWVGFAHl33ZslpVZeQsMwqcws6HdWHbrOafNzmYd8gxdIcv
         3L9V2Ni+0QjFYAYy0w+zej1MKh37SBpWgJoSnfqTjZXpdBEH7EFKUwZ592bbW7dp+ccW
         oXcYo+tWbGDaruUVSsQs9LTaMV3jNlzuNi/dG6epuPL/xooe2SiAPKHwD72gf/bAnN8z
         I+N0aO72kuKOpQxUP/uwPjpN7IaOYhcAwj9SnJ985dmmqp+SKJFUfdMPpy39f+t9mAZ1
         xl7g==
X-Gm-Message-State: AOJu0YxQnxSDTautVwqr77oyC43UtxWMLNgTKtquskkfYGSTL4T0tJIg
	JRjs3tCiRWumfZdVzfa1TmhIAl/2oMB2ehMdXRXKr7ZCBj2NrbSuvmE1qnfaAQ==
X-Google-Smtp-Source: AGHT+IEODM4Kfye65a1Z1bbCV33+qT+Zr0+2Dpo5GuSlAqGhr8OHowtoUCjbHZBo8E7wA/6ox9QSTA==
X-Received: by 2002:adf:fd10:0:b0:33b:3c9b:683e with SMTP id e16-20020adffd10000000b0033b3c9b683emr5264964wrr.64.1707747583834;
        Mon, 12 Feb 2024 06:19:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfmGKlIKpAF5erHXbhdwRgDRXH1aL4ShKCnBQVK1Wph4wkO9kzzRM/OcnD3zvRKLNq+UU6UhuiQLMRFrD/VNxYE/2C6ouihnG6/36WedtCgsAeUGuxoDHSBHX/hjxHMwEJelG87t0qTEjKL+1bPELd0dJ2JM5CcmcJIq9p7RtGLDJOWiLsVADfWQIzcNIaoEUO3JTYoNqYt4rbs5E=
Message-ID: <94a9353f-1dd0-4957-af2c-281f9b3bbe7c@suse.com>
Date: Mon, 12 Feb 2024 15:19:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] xen/asm-generic: introduce generic device.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
 <4ecb5e5f4a1dbf585ac7a9ebe40b5fd8e4709182.1707499278.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4ecb5e5f4a1dbf585ac7a9ebe40b5fd8e4709182.1707499278.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.02.2024 19:00, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/device.h
> @@ -0,0 +1,149 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_DEVICE_H__
> +#define __ASM_GENERIC_DEVICE_H__
> +
> +#include <xen/stdbool.h>
> +
> +enum device_type
> +{
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    DEV_DT,
> +#endif
> +    DEV_PCI
> +};
> +
> +enum device_class
> +{
> +    DEVICE_SERIAL,
> +    DEVICE_IOMMU,
> +    DEVICE_INTERRUPT_CONTROLLER,
> +    DEVICE_PCI_HOSTBRIDGE,
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
> +#define DT_DEVICE_START(name_, namestr_, class_)            \

I don't think the trailing underscores are needed or helpful here
(or in the ACPI counterpart), ...

> +static const struct device_desc __dev_desc_##name_ __used   \
> +__section(".dev.info") = {                                  \
> +    .name = namestr_,                                       \
> +    .class = class_,

... seeing this all it would have taken was to avoid the two words
"name" and "class" (by e.g. using "ident" and "cls").

Nevertheless:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

