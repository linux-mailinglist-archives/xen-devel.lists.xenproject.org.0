Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BF855F0E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:21:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681538.1060375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYrt-0008My-Qm; Thu, 15 Feb 2024 10:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681538.1060375; Thu, 15 Feb 2024 10:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYrt-0008LI-O4; Thu, 15 Feb 2024 10:21:25 +0000
Received: by outflank-mailman (input) for mailman id 681538;
 Thu, 15 Feb 2024 10:21:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raYrs-0008L9-V4
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:21:24 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f83dc56a-cbeb-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 11:21:23 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-410ca9e851bso5272565e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:21:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs3-20020a056000070300b0033b45bdb2a1sm1361072wrb.4.2024.02.15.02.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:21:23 -0800 (PST)
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
X-Inumbo-ID: f83dc56a-cbeb-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707992483; x=1708597283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N3l8wUaqMtyLaCRIRS8lSh4Ne9ru/GH+EJfrXDmyju4=;
        b=BPSV9rEcj+nPEX5azL/t7m5W9DwWB0o23ugBOrdTxPPDP9GoCley6Xu0a8OibhddSA
         tK/A/fajo9W/u+QdScw/sR66NaqvpgPt6bzRYXHE3JNgADoTb+xbmBfcM/o1E2y2QrdD
         O0WSRLmMJ0O5+ou8G886jQ55DRRPUyA5F7RZdF+OmyfEMPvXAZGmeSV+mV+/KvaTQa/T
         gtz7xGPrYkdJsBOXjVA7pHXgPKVuQALL9eQ3nA8bu5tluL8v6O6eQd6URMEHZIpdumTw
         dJShRwT6MPy2o9r7ZNBWUvNR6/O2TXKHfNUImJ9dItv2NI2WxINSXmnnjndX+SiupaXe
         naVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707992483; x=1708597283;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3l8wUaqMtyLaCRIRS8lSh4Ne9ru/GH+EJfrXDmyju4=;
        b=Ubj6tUNWSbtPH1SPvAzaoerBNC4KtGPXj5ZwJEJzPfHeLTD6v+v3hEnK+nKUj6yCRP
         WCBEZ9tyUVoa186URuaw4/L87MGO0w+o/xN1KkssrFFNv6dBVuavLNNYiuFk6c7jB+x0
         JJLQZdFgxIRi0LxUDoWU63v0kPCxHgRLwk0Kf1WOcoUBatlgT/0p2drENiNEUeg43ggU
         bFsYMCgNl3R38w27LFXwDtNxpRzwCoLHKG87nlvTj5NPunEgAlDnF6zAivycMriNbrM9
         tSPamr6/O7/7kaQtChnuhE55dObIbaW4O999AuVz3wX223OsRCLwIT7p2fpbbL4HIGCc
         C6HA==
X-Gm-Message-State: AOJu0YyNw+TQNWfHMWiyT878dl+cCo9xTpiC9wj0lg/8248W4j89G+TX
	/EJ2iffTN5ufubh89CjXNdi2mppFD29otpKo4zRN6DVhWQPQ38M+w7pNl2fEPoek/flFZxBYb/w
	=
X-Google-Smtp-Source: AGHT+IFL2iJPTr6GYhtNeC1yWcFw0ohjZJJ4fYABDUYx2yjcSZqcO8gPjTqvc4RMYB7yxQ3Qph0NEQ==
X-Received: by 2002:a5d:6dad:0:b0:33b:15fc:22bc with SMTP id u13-20020a5d6dad000000b0033b15fc22bcmr1250271wrs.52.1707992483406;
        Thu, 15 Feb 2024 02:21:23 -0800 (PST)
Message-ID: <1696d71e-4925-432f-bca1-126e4f9d61d9@suse.com>
Date: Thu, 15 Feb 2024 11:21:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] IOMMU: rename and re-type ats_enabled
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <7f11ca06-9bed-443b-9c79-0e62b71a1f96@suse.com>
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
In-Reply-To: <7f11ca06-9bed-443b-9c79-0e62b71a1f96@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.02.2024 11:15, Jan Beulich wrote:
> Make the variable a tristate, with (as done elsewhere) a negative value
> meaning "default". Since all use sites need looking at, also rename it
> to match our usual "opt_*" pattern. While touching it, also move it to
> .data.ro_after_init.
> 
> The only place it retains boolean nature is pci_ats_device(), for now.
> 
> In AMD code re-order conditionals to have the config space accesses
> after (cheaper) flag checks.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm sorry, forgot to Cc Andrew for the AMD IOMMU part of the changes.

Jan

> ---
> In domain_context_mapping_one() I'm a little puzzled that translation
> type is selected based on only IOMMU and global properties, i.e. not
> taking the device itself into account.
> ---
> v2: Re-base over new earlier patches.
> 
> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> @@ -282,7 +282,7 @@ void amd_iommu_flush_iotlb(u8 devfn, con
>      struct amd_iommu *iommu;
>      unsigned int req_id, queueid, maxpend;
>  
> -    if ( !ats_enabled )
> +    if ( opt_ats <= 0 )
>          return;
>  
>      if ( !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn) )
> @@ -340,7 +340,7 @@ static void _amd_iommu_flush_pages(struc
>          flush_command_buffer(iommu, 0);
>      }
>  
> -    if ( ats_enabled )
> +    if ( opt_ats > 0 )
>      {
>          amd_iommu_flush_all_iotlbs(d, daddr, order);
>  
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -119,7 +119,7 @@ static bool use_ats(
>      const struct amd_iommu *iommu,
>      const struct ivrs_mappings *ivrs_dev)
>  {
> -    return !ivrs_dev->block_ats &&
> +    return opt_ats > 0 && !ivrs_dev->block_ats &&
>             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
>             pci_ats_device(iommu->seg, pdev->bus, pdev->devfn);
>  }
> @@ -196,7 +196,7 @@ static int __must_check amd_iommu_setup_
>          dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
>  
>          if ( use_ats(pdev, iommu, ivrs_dev) )
> -            dte->i = ats_enabled;
> +            dte->i = true;
>  
>          spin_unlock_irqrestore(&iommu->lock, flags);
>  
> @@ -257,7 +257,7 @@ static int __must_check amd_iommu_setup_
>                                           ACPI_IVHD_SYSTEM_MGMT));
>  
>          if ( use_ats(pdev, iommu, ivrs_dev) )
> -            ASSERT(dte->i == ats_enabled);
> +            ASSERT(dte->i);
>  
>          spin_unlock_irqrestore(&iommu->lock, flags);
>  
> --- a/xen/drivers/passthrough/ats.c
> +++ b/xen/drivers/passthrough/ats.c
> @@ -18,8 +18,8 @@
>  #include <xen/pci_regs.h>
>  #include "ats.h"
>  
> -bool __read_mostly ats_enabled;
> -boolean_param("ats", ats_enabled);
> +int8_t __ro_after_init opt_ats = -1;
> +boolean_param("ats", opt_ats);
>  
>  int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list)
>  {
> --- a/xen/drivers/passthrough/ats.h
> +++ b/xen/drivers/passthrough/ats.h
> @@ -22,7 +22,7 @@
>  #define ATS_QUEUE_DEPTH_MASK     0x1f
>  #define ATS_ENABLE               (1<<15)
>  
> -extern bool ats_enabled;
> +extern int8_t opt_ats;
>  
>  int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list);
>  void disable_ats_device(struct pci_dev *pdev);
> @@ -43,7 +43,7 @@ static inline int pci_ats_enabled(int se
>  
>  static inline int pci_ats_device(int seg, int bus, int devfn)
>  {
> -    if ( !ats_enabled )
> +    if ( !opt_ats )
>          return 0;
>  
>      return pci_find_ext_capability(PCI_SBDF(seg, bus, devfn),
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1543,7 +1543,7 @@ int domain_context_mapping_one(
>          }
>  
>          context_set_address_root(lctxt, root);
> -        if ( ats_enabled && ecap_dev_iotlb(iommu->ecap) )
> +        if ( opt_ats > 0 && ecap_dev_iotlb(iommu->ecap) )
>              context_set_translation_type(lctxt, CONTEXT_TT_DEV_IOTLB);
>          else
>              context_set_translation_type(lctxt, CONTEXT_TT_MULTI_LEVEL);
> --- a/xen/drivers/passthrough/vtd/x86/ats.c
> +++ b/xen/drivers/passthrough/vtd/x86/ats.c
> @@ -46,7 +46,7 @@ int ats_device(const struct pci_dev *pde
>      struct acpi_drhd_unit *ats_drhd;
>      unsigned int pos, expfl = 0;
>  
> -    if ( !ats_enabled || !iommu_qinval )
> +    if ( opt_ats <= 0 || !iommu_qinval )
>          return 0;
>  
>      if ( !ecap_queued_inval(drhd->iommu->ecap) ||
> 


