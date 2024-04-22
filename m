Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476018AD0AE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 17:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710036.1109115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryvbB-0003XJ-Fz; Mon, 22 Apr 2024 15:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710036.1109115; Mon, 22 Apr 2024 15:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryvbB-0003VX-DL; Mon, 22 Apr 2024 15:28:53 +0000
Received: by outflank-mailman (input) for mailman id 710036;
 Mon, 22 Apr 2024 15:28:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jl0+=L3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ryvb9-0003VR-Ln
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 15:28:51 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04295006-00bd-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 17:28:49 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41a70466b77so6358265e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 08:28:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b004162d06768bsm20847175wmo.21.2024.04.22.08.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 08:28:48 -0700 (PDT)
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
X-Inumbo-ID: 04295006-00bd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713799728; x=1714404528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/b3TyHbqvF8dmdrig/EEE1vYugsBYcONSOOklsBay4=;
        b=KHS4hl8YnTeJCH1W/HJhlEaiCPlEFpizQqLYaHpSHbmb9wGTx1uONdaXHjQopqb8M0
         ayU7jhZy9bOHiDA95bZUNdFIz+dGJsLLCwqvyBmCBLXrVPhsgGVhaFBOzEE4+bBZej56
         i+jD8op04RPwe0f32VYxxQmMz0+U+gpboQ2mz6CQkTa95lfyiPKmXuMSqCqhbxxbO0B7
         4qbIIN3dQf7pqhMaNQKHqDtx5H3KDdkLGYadaupsoIiVKEGiQNt2Q91DQP4RhJOxrOEh
         aXwMwdG7a1WnvqLlPgWpA3RQCcyy3uv/KJ9WislyJ8rd9Vt9gKv4MRnHoKJqYHjGUW/s
         IM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713799728; x=1714404528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/b3TyHbqvF8dmdrig/EEE1vYugsBYcONSOOklsBay4=;
        b=fv85BayHOOVqtf+dh2Zv/GdLemNW7DBhsYTw7Zc6byy5q2eEU1/+baLS+MkFpv+zAB
         kMUixDZGnVTugtR/z3xVUXJo33wT8/9D06uYNnOvOvEqiQ+1Vsgh2Fvh+X2CQ0BXJG2/
         fwCp7thLPH5WDwCcjbmIeH77ey73UH7o01aAaYgmtSCOJiPtq5trJ2pSVGS6tFX6H12g
         4j0JzQL95Y8Z9hojNK55ePYYsJmoIvIRNOee1ktGEVhPXl1kCJarc2WF2YHJwlLJmE01
         5JsfZhmU92YKqftUq8u/82KSvBcof2DTCe0abg1qOUsZl1G2Chj1h8aPGCKaRJ6U4m5A
         pSJg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3b3POoV0CJHdD2xEckCbgXb5i0flxYhaM0r26R9X8J7lmdSR0LVnPzTmdsxHnOnXmV3dXQOkKxs25JGBRWxE365jVxTzO9T4pVotp98=
X-Gm-Message-State: AOJu0YxUKlUJeDIkvG29wcTZIRCswmTpqtORXpsLCVbs4JbYdv4H7Hht
	SqXwKi5l1WOd51eKpIVeEK/RYUtxYjy+fgEalQhwSUwTLRopnysNDNA9nG5Xow==
X-Google-Smtp-Source: AGHT+IGrq5h994YyhUcysqYoBdHsltCTYY5SNJMUk+1PBO1R/kpUbgiZ/N0ZWoPFfU/Be15w0EsULA==
X-Received: by 2002:a05:600c:4fce:b0:41a:4819:ebf4 with SMTP id o14-20020a05600c4fce00b0041a4819ebf4mr3407145wmq.39.1713799728541;
        Mon, 22 Apr 2024 08:28:48 -0700 (PDT)
Message-ID: <872110e8-3e84-40f8-a33e-34aeabad9fc7@suse.com>
Date: Mon, 22 Apr 2024 17:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC,FUTURE 1/3] domctl/pci: add ability to provide/request a
 virtual SBDF
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231213234345.779722-1-volodymyr_babchuk@epam.com>
 <20231213234345.779722-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20231213234345.779722-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 00:44, Volodymyr Babchuk wrote:
> With CONFIG_HAS_VPCI_GUEST_SUPPORT enabled, hypervisor will assign a
> passed-through PCI device to a guest using virtual/guest SBDF
> number. Right now hypervisor automatically allocates next free
> SBDF. But there are cases mentioned in [1] when user should be able to
> control SBDF assigned to the passed-through device.
> 
> To enable this, extend assign_device domctl call with optional
> parameter virtual_sbdf. When this parameter is set to
> XEN_DOMCTL_DEV_SDBF_ANY, hypervisor will act as previously, but it
> will return allocated vSBDF back to the toolstack. Alternatively,
> toolstack might provide desired vSBDF and hypervisor will try to use
> it, if it is free and falls into permitted range.
> 
> [1] https://lore.kernel.org/all/d6a58e73-da51-40f1-a2f7-576274945585@xen.org/
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

It's been a hile since this was sent, so comments below may have been given
by others already. I'm sorry for the redundancy if so.

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -37,7 +37,7 @@ extern vpci_register_init_t *const __end_vpci_array[];
>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>  
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> -static int add_virtual_device(struct pci_dev *pdev)
> +static int add_virtual_device(struct pci_dev *pdev, pci_sbdf_t *vsbdf)
>  {
>      struct domain *d = pdev->domain;
>      unsigned int new_dev_number;
> @@ -57,13 +57,35 @@ static int add_virtual_device(struct pci_dev *pdev)
>                   &pdev->sbdf);
>          return -EOPNOTSUPP;
>      }
> -    new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
> -                                         VPCI_MAX_VIRT_DEV);
> -    if ( new_dev_number == VPCI_MAX_VIRT_DEV )
> -        return -ENOSPC;
>  
> -    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
> +    if ( !vsbdf || vsbdf->sbdf == XEN_DOMCTL_DEV_SDBF_ANY )
> +    {
> +        new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
> +                                             VPCI_MAX_VIRT_DEV);
> +        if ( new_dev_number == VPCI_MAX_VIRT_DEV )
> +            return -ENOSPC;
>  
> +        if ( vsbdf )
> +            *vsbdf = PCI_SBDF(0, 0, new_dev_number, 0);
> +    }
> +    else
> +    {
> +        if ( vsbdf->seg != 0 || vsbdf->bus != 0 || vsbdf->fn != 0 )
> +        {
> +            gdprintk(XENLOG_ERR,
> +                     "vSBDF %pp: segment, bus and function should be 0\n",
> +                     vsbdf);
> +            return -EOPNOTSUPP;
> +        }
> +        new_dev_number = vsbdf->dev;
> +        if ( test_bit(new_dev_number, &d->vpci_dev_assigned_map) )
> +        {
> +            gdprintk(XENLOG_ERR, "vSBDF %pp already assigned\n", vsbdf);
> +            return -EOPNOTSUPP;
> +        }
> +    }
> +
> +    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
>      /*
>       * Both segment and bus number are 0:
>       *  - we emulate a single host bridge for the guest, e.g. segment 0

Please can a blank line remain to live ahead of this comment?

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -504,7 +504,12 @@ struct xen_domctl_sendtrigger {
>  
>  
>  /* Assign a device to a guest. Sets up IOMMU structures. */
> -/* XEN_DOMCTL_assign_device */
> +/* XEN_DOMCTL_assign_device
> + * when assigning a PCI device, it is possible to either request
> + * or provide a virtual SBDF. When virtual_sbdf equals to
> + * XEN_DOMCTL_DEV_SDBF_ANY, hypervisor will return allocated
> + * vSBDF back.
> + */
>  /*
>   * XEN_DOMCTL_test_assign_device: Pass DOMID_INVALID to find out whether the
>   * given device is assigned to any DomU at all. Pass a specific domain ID to
> @@ -528,6 +533,8 @@ struct xen_domctl_assign_device {
>      union {
>          struct {
>              uint32_t machine_sbdf;   /* machine PCI ID of assigned device */
> +            uint32_t virtual_sbdf;   /* IN/OUT virtual SBDF of the device */
> +#define XEN_DOMCTL_DEV_SDBF_ANY     0xFFFFFFFF /* request a free SBDF */
>          } pci;

Such a struct change needs to come with an interface version bump, I
guess.

> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -33,7 +33,7 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>                 __used_section(".data.vpci." p) = x
>  
>  /* Assign vPCI to device by adding handlers to device. */
> -int __must_check vpci_assign_device(struct pci_dev *pdev);
> +int __must_check vpci_assign_device(struct pci_dev *pdev, pci_sbdf_t *vsbdf);
>  
>  /* Remove all handlers and free vpci related structures. */
>  void vpci_deassign_device(struct pci_dev *pdev);
> @@ -265,7 +265,7 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
>  #else /* !CONFIG_HAS_VPCI */
>  struct vpci_vcpu {};
>  
> -static inline int vpci_assign_device(struct pci_dev *pdev)
> +static inline int vpci_assign_device(struct pci_dev *pdev, pci_sbdf_t *vsbdf)
>  {
>      return 0;
>  }

Can this stub really return "success" without even touching *vsdbf? At
the very least the public header comment saying "hypervisor will return"
isn't quite right if this path is taken. Perhaps when HAS_VPCI=n there
should be a requirement for the caller to pass NULL? Yet even then the
domctl interface wouldn't do what it (currently) promises. So perhaps
you can't really extend an existing domctl here.

Jan

