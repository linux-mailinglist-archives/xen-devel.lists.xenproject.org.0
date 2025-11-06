Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A368C3B290
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 14:19:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156923.1485874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGztD-000081-3D; Thu, 06 Nov 2025 13:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156923.1485874; Thu, 06 Nov 2025 13:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGztC-00005K-W3; Thu, 06 Nov 2025 13:18:58 +0000
Received: by outflank-mailman (input) for mailman id 1156923;
 Thu, 06 Nov 2025 13:18:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGztB-00005E-Fd
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 13:18:57 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25c92d12-bb13-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 14:18:56 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-477549b3082so8831875e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 05:18:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4776363da40sm44448765e9.2.2025.11.06.05.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 05:18:55 -0800 (PST)
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
X-Inumbo-ID: 25c92d12-bb13-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762435136; x=1763039936; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kf+xTHewW8FtuWWe56OR9g8lpuB4nQz/BrnLaPkG8VM=;
        b=BDFj63wIZWcyrbq5mJvWkrBJcB77zRqwKnYEUW4o/LCNfrHAJGlLTKS+fO8c1G5KJn
         lMAYA73Yh2D7e6t8q7HEZVChH3oe+91Lf9HfykobBIGEvXDHWZEiEGtfIqt81f3+dtSt
         VYw+ObIiyMjwiIsNArPFLNS2yjbcFttynZyN6GGjGrnRMjPR4hKVwCXfFXBm1pXpIEV/
         LHOnWzN02O8uQIFADEoorQ/qPqBPDRMHEuTtEMDEQ0pGbQgVZc52GfwtaDWLyOedsoVR
         PBcuDc7BZUXORBaqS1f4Qy4tZPeV0xRu21Yqcoy0JMHjVhh34CiIz9QNjqjgS6gplDjT
         pxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762435136; x=1763039936;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kf+xTHewW8FtuWWe56OR9g8lpuB4nQz/BrnLaPkG8VM=;
        b=tTanRQkVj0MCtzHJBl44Z906D5UeWTRF2tvUrcQBsCiCEQGo5V0fEiRxHDX72At97P
         46wushq/Ve7Xlt67OTdZH9MTRfjSgiwVAMiFPDaHHYaFw70cOOenc4vAOJsbqM7j3txj
         uiTkbiBWmt5BFQWC9j47hDm4YHgd6XM7pzT0sEuMWC6oaGzKSPPDHA9IaZPM8ige98UI
         jrn0Zgd3s8VMaAdOYwp3cQ0D/CO7JqdKdI4OiGYX1jH8ZPheXwjBq9Y4FAUI6QdzCyXm
         cMqJxi9QgMy79bCTZOurZbpCfcppeeyeoMHuFh7B0R7PJmPAMnfUzKgy20EzBtsmgF8K
         3zFA==
X-Forwarded-Encrypted: i=1; AJvYcCXQV49bNy2Smw+XomkP9TJoTcBD2ezoFIY3FTJdZJGqcL+tpPOtlO/LoNDZwBx7fWMcfZWJiZUW9CI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6TlQ8Dhfu3W1YQ0oIHb2ZXTD5Tc5ZMjJ5wDx/EVe21crLW55W
	ABzPqO2NYOW9nGLEYrf9xyQqtfO6MRhhn8JiwVXsvwB42UFSk7H0l8PXP3QWo62x+g==
X-Gm-Gg: ASbGnct0IACFPJxG2oOExEtrK+rpz7XjL+hoFoKTR1rpQGxrZWqdT0A3kxbU8a7SpHU
	KoxXvXYHyz1MIP22bCZ1ZJDX7mIiFjlCyHSanKQNPYc+pFChEkJC2k4MUjKkkoFEAXk8FqehC0S
	7PDHlT9NX+vRhD8BuAC3wGAP3eNCd5Wow6ed0JFGq6qSPIIBLrlULsx8ZXg+8IEd+6nFKY8cABz
	yKxSn2x59SLotCsTK7t4lsbsRc/OBfa0I6vYYoQNETLNrnoHAh1zuwFebEdAuxouKrAM1LeopgN
	oSznGREpIRDvgWSlzCjVsPuag1etSDmN2SVOUZcgOUKbx6uRjn1a+uLHfFc+9WdbZFl12zU+ifp
	jB4TEMW+3XjeRiIVUG04R+1H2mYlrXYrN+jQ3ZN/QNJjN9w6ib+whFLgWkLjpih51F+dC90fuMb
	efyJAY5sfzgI/8JDpVTPJzOe94dbwuKBLVCNddoRK9vY1sBkOIXvFZB4vNgjO2
X-Google-Smtp-Source: AGHT+IErf09l/WPwljTK0elK/nPmvU+N4JdGN6AUh7m6bJAlzJ3ewO5xR1AIJj80At+kpF91KpVmLA==
X-Received: by 2002:a05:600c:5287:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-4775ce14937mr54056625e9.26.1762435135612;
        Thu, 06 Nov 2025 05:18:55 -0800 (PST)
Message-ID: <9ec406ef-af62-4245-9202-3d70e9550e9d@suse.com>
Date: Thu, 6 Nov 2025 14:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/8] xen/pci: assign discovered devices to hwdom
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
 <ee305fc5b277060a3ae3c7fb26cea6b34920048f.1758618839.git.mykyta_poturai@epam.com>
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
In-Reply-To: <ee305fc5b277060a3ae3c7fb26cea6b34920048f.1758618839.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2025 09:59, Mykyta Poturai wrote:
> @@ -133,6 +134,12 @@ void arch_iommu_domain_destroy(struct domain *d)
>  {
>  }
>  
> +static int iommu_add_hwdom_pci_device(u8 devfn, struct pci_dev *pdev)
> +{
> +    const struct domain_iommu *hd = dom_iommu(hardware_domain);
> +    return iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));

Nit (style): Blank line please between declaration(s) and statement(s). And
blank line please also ahead of the main return statement of a function.

> @@ -142,6 +149,8 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>      if ( iommu_hwdom_reserved == 1 )
>          printk(XENLOG_WARNING "map-reserved dom0-iommu option is not supported on ARM\n");
>      iommu_hwdom_reserved = 0;
> +
> +    setup_hwdom_pci_devices(d, iommu_add_hwdom_pci_device);
With this function being __hwdom_init, why is iommu_add_hwdom_pci_device()
not also given that attribute?

As to cf_check I don't know what the Arm policy is: My suggestion would be
to put that attribute wherever it is (potentially) needed.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -20,6 +20,7 @@
>  #include <xen/pci_ids.h>
>  #include <xen/list.h>
>  #include <xen/prefetch.h>
> +#include <xen/iocap.h>
>  #include <xen/iommu.h>
>  #include <xen/irq.h>
>  #include <xen/param.h>
> @@ -1040,6 +1041,12 @@ enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn)
>      return pos ? DEV_TYPE_PCIe_ENDPOINT : DEV_TYPE_PCI;
>  }
>  
> +static bool pdev_is_endpoint(struct pci_dev *pdev)

__hwdom_init? And parameter pointer-to-const?

> +{
> +    enum pdev_type type = pdev_type(pdev->seg, pdev->bus, pdev->devfn);
> +    return type == DEV_TYPE_PCIe_ENDPOINT || type == DEV_TYPE_PCI;
> +}
> +
>  /*
>   * find the upstream PCIe-to-PCI/PCIX bridge or PCI legacy bridge
>   * return 0: the device is integrated PCI device or PCIe
> @@ -1255,7 +1262,7 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
>                                                  struct pci_dev *pdev)
>  {
>      u8 devfn = pdev->devfn;
> -    int err;
> +    int err, i, rc;

i clearly wants to be of an unsigned type. And rc, afaics, can have its scope
limited to the loop body.

> @@ -1276,6 +1283,34 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
>      if ( err )
>          printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
>                 ctxt->d->domain_id, err);
> +
> +    if ( !hwdom_uses_vpci() )
> +        return;
> +
> +    for ( i = 0; i < PCI_HEADER_NORMAL_NR_BARS; i += rc )
> +    {
> +        uint64_t addr, size;
> +        uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
> +
> +        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE)
> +             == PCI_BASE_ADDRESS_SPACE_IO )

Nit (style): Operator placement again.

> +        {
> +            rc = 1;
> +            continue;
> +        }
> +
> +        rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
> +                              (i == PCI_HEADER_NORMAL_NR_BARS - 1)
> +                                  ? PCI_BAR_LAST : 0);

Nit (style): Indentation again.

> +
> +        if ( !size )
> +            continue;
> +
> +        err = iomem_permit_access(hardware_domain, paddr_to_pfn(addr),
> +                             paddr_to_pfn(PAGE_ALIGN(addr + size - 1)));

And again.

> +        if ( err )
> +            break;
> +    }
>  }

This change supports my comment on the earlier patch, regarding the option
of doing here some of what needs doing, rather than by another round of
iterating all devices.

> @@ -1294,6 +1329,9 @@ static int __hwdom_init cf_check _setup_hwdom_pci_devices(
>              if ( !pdev )
>                  continue;
>  
> +            if ( hwdom_uses_vpci() && !pdev_is_endpoint(pdev) )
> +                continue;
> +
>              if ( !pdev->domain )
>              {
>                  pdev->domain = ctxt->d;

This is (logically) wrong: On x86 PVH Dom0 uses vPCI but wants all devices
to be handed to it. _This_ may be a place where has_vpci_bridge() might
make sense to use (simply by its name, that is).

Jan

