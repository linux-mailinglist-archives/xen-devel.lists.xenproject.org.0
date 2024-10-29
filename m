Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5685A9B4FF4
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 17:58:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827740.1242439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5pXB-0006kA-Gz; Tue, 29 Oct 2024 16:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827740.1242439; Tue, 29 Oct 2024 16:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5pXB-0006hs-EM; Tue, 29 Oct 2024 16:57:33 +0000
Received: by outflank-mailman (input) for mailman id 827740;
 Tue, 29 Oct 2024 16:57:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5pXA-0006hm-B5
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 16:57:32 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0efd14e-9616-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 17:57:28 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d4c482844so3845115f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 09:57:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058bb4724sm13040431f8f.115.2024.10.29.09.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 09:57:27 -0700 (PDT)
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
X-Inumbo-ID: e0efd14e-9616-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzAiLCJoZWxvIjoibWFpbC13cjEteDQzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUwZWZkMTRlLTk2MTYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjIxMDQ4LjEyMjA1OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730221047; x=1730825847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6NucgID8J5ityhR2WJFGL+nL4hY1wKvgFcUA5lB8oPk=;
        b=czMqhpw325GyMaHHsp+mwqsX5yCbtmR6TwluUm7SOdRx+uwXIiMfX+xreknkxmMcZc
         3oAnngHQQvkkQrcGZKip7utIU0Bs3vNY4cH3LExgztJMQldZISRwopBnpoLPfIbSF88U
         HVNpzEhR2bcFmbfGEqN5f9R4NSvfUStqRhWRuIZwZBeh9G7+B7YWPy15KDT6WU3SWNRg
         lXUY41iqTRS1RFzz7YmvV3V85y6qiUhaibieu8kLG7OJSsEE8i1nstLYOJ1TQLfNdZzX
         gX3Z2VlIyXcpALH8VecFPyxkfOuo2eAGvXJ9iNovwgKZx8FkqKIjH9SXC4Pzi51XCX6g
         Sojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730221047; x=1730825847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NucgID8J5ityhR2WJFGL+nL4hY1wKvgFcUA5lB8oPk=;
        b=wK/q1rHdu4IAbN0+gx+FngMUyyCt3cvZnLFmskZd5pe9tQjdj0OpKhkhM84HMKipFL
         h1uoAcODjDx9tQq+TqcUXY6a82P24KpwPzJt7K0LYBEgiVFm4tgKUqJguUdXiquMXg5u
         mqgJ/7Akb3pCG7rD2BLca21KcA5LoKs7MSJvRqSEy6uPoGvCPp3dXfTI7VXaisuj+TGP
         wYng5HD3KRbhlc7/SvDM3ZMYVpE7hwUqz6vXb/kk/kjQo4tf0pGntNoBsOCVy0FUJsIH
         Ij81kFv4ApIitMQgqYt5AVvlgDrnmPKFDVD85t1ileCeMhdTbvX8vSLvzpqCG5evl4mZ
         hjnw==
X-Forwarded-Encrypted: i=1; AJvYcCVAoaR88lmlmFLsvZ2BuVFucm6R4WcvoswRlq7v4p7vtKxawbXeRuM+mgn7JrJXj4AWCddIdz0TViA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJqVX+CtNroS7JwjIhpMk1lF+tDqa6ut85pASvJy6fPS4uLgmc
	dMDjw4zvTMTJfyeqUQ2cBVnWzdykyx1yT6KCPs84kVAIN+LvZy/laW4JLNwM8Q==
X-Google-Smtp-Source: AGHT+IH/OTZ7td2uNGxzS1nyiJamwqQJNUUUGT4dLuhgQfnbuL9fwOM3koJb9tumMFhw4Gzeaq/g5A==
X-Received: by 2002:adf:9bd4:0:b0:37d:4e74:687 with SMTP id ffacd0b85a97d-380611e1392mr9095287f8f.41.1730221047392;
        Tue, 29 Oct 2024 09:57:27 -0700 (PDT)
Message-ID: <a5539c03-4e19-4739-95cf-439aa0bea9a3@suse.com>
Date: Tue, 29 Oct 2024 17:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/common: move gic_preinit() to common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <b1ded26dcebf9a3228fe4062825273720e0c59fe.1730220384.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b1ded26dcebf9a3228fe4062825273720e0c59fe.1730220384.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2024 17:47, Oleksii Kurochko wrote:
> --- a/xen/common/device.c
> +++ b/xen/common/device.c
> @@ -4,10 +4,14 @@
>   *   xen/arch/arm/device.c
>   */
>  
> +#include <xen/acpi.h>
>  #include <xen/bug.h>
>  #include <xen/device_tree.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
> +#include <xen/kernel.h>
> +#include <xen/lib.h>
> +#include <xen/types.h>

I don't think non-ACPI configs should include xen/acpi.h here. Surely this
can be moved down into the ACPI-only code section?

> @@ -56,6 +60,40 @@ enum device_class device_get_class(const struct dt_device_node *dev)
>      return DEVICE_UNKNOWN;
>  }
>  
> +static void __init ic_dt_preinit(void)
> +{
> +    struct dt_device_node *node;
> +    uint8_t num_gics = 0;
> +
> +    dt_for_each_device_node( dt_host, node )
> +    {
> +        if ( !dt_get_property(node, "interrupt-controller", NULL) )
> +            continue;
> +
> +        if ( !dt_get_parent(node) )
> +            continue;
> +
> +        if ( !device_init(node, DEVICE_INTERRUPT_CONTROLLER, NULL) )
> +        {
> +            /* NOTE: Only one GIC is supported */
> +            num_gics = 1;
> +            break;
> +        }
> +    }
> +
> +    if ( !num_gics )
> +        panic("Unable to find compatible interrupt contoller"
> +              "in the device tree\n");
> +
> +    /* Set the interrupt controller as the primary interrupt controller */
> +    dt_interrupt_controller = node;
> +    dt_device_set_used_by(node, DOMID_XEN);
> +}
> +
> +#else /* !CONFIG_HAS_DEVICE_TREE */
> +
> +static void __init ic_dt_preinit(void) { }
> +
>  #endif

While for DT I can only guess that the IC is common across platforms, ...

> @@ -79,4 +117,31 @@ int __init acpi_device_init(enum device_class class, const void *data, int class
>      return -EBADF;
>  }
>  
> +static void __init ic_acpi_preinit(void)
> +{
> +    struct acpi_subtable_header *header;
> +    struct acpi_madt_generic_distributor *dist;
> +
> +    header = acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_DISTRIBUTOR, 0);
> +    if ( !header )
> +        panic("No valid interrupt controller entries exists\n");
> +
> +    dist = container_of(header, struct acpi_madt_generic_distributor, header);
> +
> +    if ( acpi_device_init(DEVICE_INTERRUPT_CONTROLLER, NULL, dist->version) )
> +        panic("Unable to find compatible interrupt controller"
> +              "in the ACPI table\n");
> +}
> +#else /* !CONFIG_ACPI */
> +
> +static void __init ic_acpi_preinit(void) { }
> +
>  #endif

... simply deriving from x86 (and IA-64) it's clear it isn't for ACPI. I'm
therefore unconvinced placing this in common code is appropriate.

Jan

