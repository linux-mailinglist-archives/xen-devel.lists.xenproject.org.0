Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31079976DC1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 17:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797631.1207623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solkY-0004mj-AH; Thu, 12 Sep 2024 15:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797631.1207623; Thu, 12 Sep 2024 15:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solkY-0004kV-7e; Thu, 12 Sep 2024 15:28:50 +0000
Received: by outflank-mailman (input) for mailman id 797631;
 Thu, 12 Sep 2024 15:28:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1solkW-0004kP-P6
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 15:28:48 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b40f6284-711b-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 17:28:47 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8d64b27c45so175546066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 08:28:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c7286esm752638766b.138.2024.09.12.08.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 08:28:46 -0700 (PDT)
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
X-Inumbo-ID: b40f6284-711b-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726154927; x=1726759727; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=otP4eCGgN7TZUYGfEy7TN1KyTpOa37YhD8CqlGtu0pg=;
        b=UpB9+4tbpyum2ePx6jtxIdYXk570/tOY6itBKRgfd3rUP4DT6RX7AJicpQs7AiJcuQ
         5CH948e65GIT14pRz467JL6/USCJktTKMLJWeUx5bDTlzK7+KGSQBh6WfMVoeuetppwt
         9F+32dF+Vagu0KdA7i4tDW3ypRWjusw240gUuLIY61eIZGdR4HJq1wKHvOd2XHghRi5H
         vFXV/veakxQb3IMoL02u5qeHa86koYmpsSur8T5o5ywrkba1Q9mFUZOnGtIKNi7ONxDM
         smItLzHzX9Bfa8wIknG/OY/YlzVXa9EClD9bvgbO31udZ3SDYUqbfh33dObKC7zfmTh9
         UkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726154927; x=1726759727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otP4eCGgN7TZUYGfEy7TN1KyTpOa37YhD8CqlGtu0pg=;
        b=bU3AH0MAtTZjAhJQZDIbLXJhPvdK/nGZ47mO64nRMbPfkA8IILgyhQ4fVnnHTV32zh
         agHbb4t+H0Kdt79i5FYGs+a3o55X9f8xY93mGIZ5AQbCiJHrP+m13mPxfBUzA01FC6VW
         +9FoQlybhCduEBYujvGAnMDM/neyEctG2r2vW0WVodWITrPXWnU784In6oQd5CuChLYW
         iY+kbGGYyfP2ASdU/ID50TXe91YBF5CgR+0zedfjwYUS4b0L1ALByRw/Ntb6RwOUTDIT
         kS6LBX5imI3bI03K6cc8Pz6jgmI3RNXfIJnwu7tFqJh2i2rVHwJUg9kqGQe1eOGTNufG
         cJ/A==
X-Forwarded-Encrypted: i=1; AJvYcCXpPBsvbuRlzt/auF1zCVpaagXqxu6Eo69wAXCGbqKovwt+ZuAEsRTGERQYpS4pQay2gzI68FRc2TI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIOSHsEQ/gNx+xMo9E2ZEYn821RZe10pnRNqy7u2fA+qIH0CK1
	jVXJc++myXari0Y1XsL2hwRTUVdwItM3Ov5nYeQy1q/h1n0pQFo/6YX9nN+v5Q==
X-Google-Smtp-Source: AGHT+IHAWqsBc/5C8j4MKpAMDeUrz6NhXIuXV8Dn0XWOYwJj9dJ+Qc7ujeIuMqyRqAcTJFm3q9aKPA==
X-Received: by 2002:a17:907:e21b:b0:a86:842a:104a with SMTP id a640c23a62f3a-a9029636efbmr308551566b.57.1726154926492;
        Thu, 12 Sep 2024 08:28:46 -0700 (PDT)
Message-ID: <9764051a-c4a7-4c3d-9760-1f80d5faa559@suse.com>
Date: Thu, 12 Sep 2024 17:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/common: move device initialization code to
 common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1726048521.git.oleksii.kurochko@gmail.com>
 <128d17f3625807a26875b7a419fb56610424b18c.1726048521.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <128d17f3625807a26875b7a419fb56610424b18c.1726048521.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2024 12:04, Oleksii Kurochko wrote:
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>  obj-$(CONFIG_CORE_PARKING) += core_parking.o
>  obj-y += cpu.o
>  obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
> +obj-$(call or,$(CONFIG_HAS_DEVICE_TREE),$(CONFIG_HAS_ACPI)) += device.o

I can't spot any HAS_ACPI in the tree. And if this was switched to CONFIG_ACPI
I'd further ask why the file needs building on x86.

Also I think I'd prefer to avoid the of the "or" macro here:

obj-$(CONFIG_ACPI) += device.o
obj-$(CONFIG_HAS_DEVICE_TREE) += device.o

ought to be quite fine. There's de-duplication somewhere for what $(obj-y) lists.

> --- /dev/null
> +++ b/xen/common/device.c
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Based on the code from:
> + *   xen/arch/arm/device.c
> + */
> +
> +#include <xen/bug.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +
> +#include <asm-generic/device.h>
> +
> +#ifdef CONFIG_ACPI
> +extern const struct acpi_device_desc _asdevice[], _aedevice[];

Why does this live separately here, rather than ...

> +#endif
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +
> +extern const struct device_desc _sdevice[], _edevice[];

... like this ...

> +int __init device_init(struct dt_device_node *dev, enum device_class class,
> +                       const void *data)
> +{
> +    const struct device_desc *desc;
> +
> +    ASSERT(dev != NULL);
> +
> +    if ( !dt_device_is_available(dev) || dt_device_for_passthrough(dev) )
> +        return  -ENODEV;
> +
> +    for ( desc = _sdevice; desc != _edevice; desc++ )
> +    {
> +        if ( desc->class != class )
> +            continue;
> +
> +        if ( dt_match_node(desc->dt_match, dev) )
> +        {
> +            ASSERT(desc->init != NULL);
> +
> +            return desc->init(dev, data);
> +        }
> +    }
> +
> +    return -EBADF;
> +}
> +
> +enum device_class device_get_class(const struct dt_device_node *dev)
> +{
> +    const struct device_desc *desc;
> +
> +    ASSERT(dev != NULL);
> +
> +    for ( desc = _sdevice; desc != _edevice; desc++ )
> +    {
> +        if ( dt_match_node(desc->dt_match, dev) )
> +            return desc->class;
> +    }
> +
> +    return DEVICE_UNKNOWN;
> +}
> +
> +#endif
> +
> +#ifdef CONFIG_ACPI

... in the section where it's needed? Leaving just one #ifdef for ACPI.

Jan

