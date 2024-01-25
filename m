Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422C683C769
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 17:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671617.1045044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT29N-0002Td-GP; Thu, 25 Jan 2024 16:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671617.1045044; Thu, 25 Jan 2024 16:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT29N-0002Rq-DY; Thu, 25 Jan 2024 16:00:21 +0000
Received: by outflank-mailman (input) for mailman id 671617;
 Thu, 25 Jan 2024 16:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT29M-0002Re-AU
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 16:00:20 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d64edbce-bb9a-11ee-8a42-1f161083a0e0;
 Thu, 25 Jan 2024 17:00:19 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cf372b8b88so9514911fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 08:00:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j2-20020a6b3102000000b007bf197d6ca8sm7411664ioa.25.2024.01.25.08.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 08:00:18 -0800 (PST)
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
X-Inumbo-ID: d64edbce-bb9a-11ee-8a42-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706198418; x=1706803218; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qDLNJiSQ8imt2bLpfcLEQ4kFYJtLrv523F/k+eVGwmo=;
        b=Ku/u4OPM+hMcQqKK3hcFScBA+chwIHrl9lzv/oAf6aNQ2i2GRTQeDJKpBhSPFRUXZd
         41KcSpS7txEA8amX6ulucBL4cgnHCagGezJ7tAoVZnYZ7fEpr4KwSKpirbhxETgzeSW7
         eFinSFOVvNK89D154bcg6dYCpTpZ1OkAoBcVEGB0EJ4mCQZzrNbU/gbnSQZ9OFzGMJwL
         TT7QcgDD91x4VI+WbzAwX4fDjN4OYJqfhI8w7hYMYTAhmOKnThMg5FLa/qTOavYaUTN/
         YFsiC1lW/vTlSq97CUa+cd72HTWJOm9BaZQEUULiUUiDT8iz6wzP0xPlVQ5aM+CSuCsM
         ywhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706198418; x=1706803218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDLNJiSQ8imt2bLpfcLEQ4kFYJtLrv523F/k+eVGwmo=;
        b=uqdgf4GuywfuifnrLWDULrLED1do0H0D9Ztu7xY58gVxNLo2ckhJ1O5gZsCrj1Q/sl
         wsJhQR3PR0IC6qHZFgQUpvhPx8qFMHGCl5N5j1UJFygQrooXhx31HVLTNJShOsfVIekq
         GW5Vt0+vQfeL+qYnIkSvAdcBCPtmhEbtP2ZqfNMikNo2z+zHLmNF3asK/gnW8hJneF/T
         gVtyo6M2CjUe3RmyhGlg58UWRJ8NPB5YaaiAVfyFLgcCWJSch8FxvYKFdyAnLyXt+wHK
         FuwbJjvCVnHbpeo4jCNwVwqBXDS/cXt0GHGCow1tZVLo4IsyD8s5lbfM9XkaPOVWI865
         PwPQ==
X-Gm-Message-State: AOJu0YyRF93xYx7pmaUJ6DSry2E+LLfFblNgs3wEmCwAGkyv0SO5kSf3
	RE8cVo+eH4Ijj8q+NgM1fMr8I/CKvWNg407FcKAolUZsN0xM3llw1uJtNxX6Fw==
X-Google-Smtp-Source: AGHT+IElXlHNdBX0EkXvZw84KF29OQhHoHURyIc2Hh7WKtDv6RqWM3DLAoS/lRgsCFJDDI6LMZ8YKA==
X-Received: by 2002:a2e:878d:0:b0:2cc:c567:e539 with SMTP id n13-20020a2e878d000000b002ccc567e539mr796743lji.101.1706198418541;
        Thu, 25 Jan 2024 08:00:18 -0800 (PST)
Message-ID: <ec947a93-3026-4119-84dc-09785fab8f7f@suse.com>
Date: Thu, 25 Jan 2024 17:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 11/15] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-12-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240109215145.430207-12-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2024 22:51, Stewart Hildebrand wrote:
> --- a/xen/drivers/Kconfig
> +++ b/xen/drivers/Kconfig
> @@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
>  config HAS_VPCI
>  	bool
>  
> +config HAS_VPCI_GUEST_SUPPORT
> +	bool
> +	depends on HAS_VPCI

Wouldn't this better be "select", or even just "imply"?

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -40,6 +40,49 @@ extern vpci_register_init_t *const __start_vpci_array[];
>  extern vpci_register_init_t *const __end_vpci_array[];
>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +static int add_virtual_device(struct pci_dev *pdev)
> +{
> +    struct domain *d = pdev->domain;
> +    unsigned int new_dev_number;
> +
> +    if ( is_hardware_domain(d) )
> +        return 0;
> +
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
> +    /*
> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
> +     * there are multi-function ones which are not yet supported.
> +     */
> +    if ( pdev->info.is_extfn && !pdev->info.is_virtfn )
> +    {
> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
> +                 &pdev->sbdf);

The message suggests you ought to check pdev->devfn to have the low
three bits clear. Yet what you check are two booleans.

Further doesn't this require the multi-function bit to be emulated
clear? And finally don't you then also need to disallow assignment of
devices with phantom functions?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -484,6 +484,14 @@ struct domain
>       * 2. pdev->vpci->lock
>       */
>      rwlock_t pci_lock;
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    /*
> +     * The bitmap which shows which device numbers are already used by the
> +     * virtual PCI bus topology and is used to assign a unique SBDF to the
> +     * next passed through virtual PCI device.
> +     */
> +    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
> +#endif
>  #endif

With this the 2nd #endif would likely better gain a comment.

> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -21,6 +21,13 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>  
>  #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
>  
> +/*
> + * Maximum number of devices supported by the virtual bus topology:
> + * each PCI bus supports 32 devices/slots at max or up to 256 when
> + * there are multi-function ones which are not yet supported.
> + */
> +#define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)

The limit being this means only bus 0 / seg 0 is supported, which I
think the comment would better also say. (In add_virtual_device(),
which has a similar comment, there's then at least a 2nd one saying
so.)

Jan

