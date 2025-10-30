Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F049C202C4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 14:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153664.1483955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vESPV-0002Lw-IT; Thu, 30 Oct 2025 13:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153664.1483955; Thu, 30 Oct 2025 13:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vESPV-0002KU-FW; Thu, 30 Oct 2025 13:09:49 +0000
Received: by outflank-mailman (input) for mailman id 1153664;
 Thu, 30 Oct 2025 13:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vESPT-0002KO-UU
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 13:09:47 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b484f880-b591-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 14:09:45 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4270491e9easo896895f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 06:09:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429ba92da86sm1703688f8f.31.2025.10.30.06.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 06:09:44 -0700 (PDT)
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
X-Inumbo-ID: b484f880-b591-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761829785; x=1762434585; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fVMmNEu/4TrFECN+HfitaZeeIXxHVaA9jnu8HRKmThI=;
        b=eO7mEODn6jaSfAQjNPFtH2c/u2X1K9DKId0GteDh67N5/FqrNEaFKQSaO0Ww7PsG5z
         703DjtYjJ40W/+Fos25Jm65BVjhJznOJqeisAxbrp73CM2h9prlPSqTqCK6XmfFAZE+T
         NTAFQ6Aoaz9QjUNKolYV6J7PDGiAM1JmfTSgXQ9QCQlM6s+WorvKUnws8H+Ud0gcvBOb
         bPY9+yFvBbAsI/NEt+9uSvOV0HCEeZzVNghse+QvMOJOGONqirJvB+mqQsqel6x/iWL1
         tSVx/H6UHxvZHHqkmHPNszWFAVNQD9NebQSlGkupv1gnDbg7pSWm45ncJA1rinx1srbr
         DcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761829785; x=1762434585;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVMmNEu/4TrFECN+HfitaZeeIXxHVaA9jnu8HRKmThI=;
        b=n+E862Qpa7lwdLa3Y/Sp7/9uoTaHYTSl/SnuWpkoNdWjpGSTO25Nrs5AB++C2xGnCf
         yizg538XcUQzXQSoeW+Vqaiew4643nxV5qDAeLnyDI44ua5cuTVdFtK7YJTNoAa3BjhB
         adCLsMoCG1bE7qHOQSacvavJWhkvVW4StNEpxkjwV8pf5Rgt+UWWa5OQEuaKk9Btxnmy
         ueANZZ6AQYMKEcwPahoPy6iYC+BcD1I8BFXYBNtDJk9nZ2WGgl6XChcjRCkdJt3vc2c2
         g9o9KnK+8xLj6r66RfsBdIp5THxAKa5yIM5iaWjTxDsm/WRA4170aQ2oPIGQ33NKSn/8
         //pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKe/GhIsEMhFwnNtdRecObhRr+i/gcMtOZthZmhPLerTRK2jcr/cGbHeIoFUFJcwZFAcPxKMcqFmE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPig7Pk5B8YKSDiua1AleKnrB01dISEeAWSpco3klT5K2qE1PC
	LGSvM1FgH6hvyIU1AdBaLvRAb+IpT/u/Y7Ee4roZmONeT1ml/aWxKj5cs6ChTL8ybw==
X-Gm-Gg: ASbGncvoZpM8Y2Jg/Xp5a0ijTiIWzNjIfotlYg5ZdCKofW/x1pWKlX8M0BboOEyapre
	5o3bTk3S+11i2SZwzZICoPkm2VKgaA6JM27tbriAIUEs0pJJ2joIdITkfAJSoeFheCHz/zhsiTr
	upUwteVH+AbvGvtCzUXpxEWcABtNOBzv2sQEPqeDiUbf9xo1UFcrcUApeW6YhdfZ6XOQMRIwI96
	TlyOl9uJv49ZwlwM/v9LW/zFv/fRcdQMnUkn8WpGn7hQCShvj3D5H02oYDK9P0InbBty8jEGmKW
	QZpQ2pds0ozEQTHoM3mORf2HIbNqt/GKGsudl/tVbw6WNwGpJIe0ZxERSsxrqmVOQl2jJKFeZbI
	GupvVKklyysOoSY44z6G2acg/CuEynNeTzAp6zdJszpIamsmbXZLZQMFVjwY8Sh0wDiROx52+mz
	9gc6eIuYWM948kHSHgqtnpxVFk6ui8faX/tBGAl1jly7WD6LorZ7AtoXWyO1iJ44qxNxtVkGQ=
X-Google-Smtp-Source: AGHT+IHmiO0cdBrIG9hyQVz82AZVV4W/AjAMjO+3F1arUy/FEmMlYbFOEvEQMjEOIZMhwbNiAow4gA==
X-Received: by 2002:a5d:5f43:0:b0:428:3d66:9f2 with SMTP id ffacd0b85a97d-429b4c97d84mr2627687f8f.41.1761829784605;
        Thu, 30 Oct 2025 06:09:44 -0700 (PDT)
Message-ID: <70e1012a-0839-4721-8014-5ed152c80f34@suse.com>
Date: Thu, 30 Oct 2025 14:09:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/28] xen/domctl: wrap iommu-related domctl op with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-23-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-23-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> Function iommu_do_domctl() is the main entry for all iommu-related domctl-op,
> and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
> Tracking its calling chain, the following functions shall all be wrapped
> with CONFIG_MGMT_HYPERCALLS:
> - iommu_do_pci_domctl
>   - iommu_get_device_group
>     - amd_iommu_group_id/intel_iommu_group_id
>   - device_assigned
>   - assign_device
>     - intel_iommu_assign_device/amd_iommu_assign_device
>   - deassign_device
>     - reassign_device_ownership/reassign_device

Could this PCI related subset and ...

> - make PCI_PASSTHROUGH depend on MGMT_HYPERCALLS
> - iommu_do_dt_domctl
>   - iommu_deassign_dt_device
>     - arm_smmu_reassign_dev
>       - arm_smmu_deassign_dev
>         - arm_smmu_detach_dev
>           - arm_smmu_domain_remove_master
>     - ipmmu_reassign_device
>       - ipmmu_deassign_device
>         - ipmmu_detach_device
>   - iommu_remove_dt_device
>     - iommu_dt_device_is_assigned_locked
>   - dt_find_node_by_gpath

... this DT related subset become separate (prereq) patches? Doing so may also reduce
the number of acks you need to collect on individual patches.

The bullet point in between looks unrelated in this list; it's not about any function,
after all. In fact I was about to complain that the aspect isn't mentioned in the
description, until I spotted the misplaced line.

> - xsm_get_device_group
> - xsm_assign_device
> - xsm_deassign_device
> - xsm_assign_dtdevice
> - xsm_deassign_dtdevice
> Otherwise all the functions will become unreachable when MGMT_HYPERCALLS=n,
> and hence violating Misra rule 2.1
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
> - wrap XEN_DOMCTL_assign_device{test_assign_device,deassign_device,
>  get_device_group}-case transiently
> ---
> v2 -> v3:
> - make PCI_PASSTHROUGH(, then HAS_VPCI_GUEST_SUPPORT) depend on MGMT_HYPERCALLS

Is this correct, though? Isn't PCI pass-through and vPCI guest support also
possible in dom0less / hyperlaunch?

> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -461,6 +461,7 @@ static void amd_iommu_disable_domain_device(const struct domain *domain,
>          spin_unlock_irqrestore(&iommu->lock, flags);
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  static int cf_check reassign_device(
>      struct domain *source, struct domain *target, u8 devfn,
>      struct pci_dev *pdev)
> @@ -550,6 +551,7 @@ static int cf_check amd_iommu_assign_device(
>  
>      return rc;
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */
>  
>  static void cf_check amd_iommu_clear_root_pgtable(struct domain *d)
>  {
> @@ -698,12 +700,14 @@ static int cf_check amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
>      return 0;
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  static int cf_check amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
>  {
>      unsigned int bdf = PCI_BDF(bus, devfn);
>  
>      return (bdf < ivrs_bdf_entries) ? get_dma_requestor_id(seg, bdf) : bdf;
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */

Might be worth moving some code and ...

> @@ -772,14 +776,18 @@ static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
>      .quarantine_init = amd_iommu_quarantine_init,
>      .add_device = amd_iommu_add_device,
>      .remove_device = amd_iommu_remove_device,
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      .assign_device  = amd_iommu_assign_device,
> +#endif
>      .teardown = amd_iommu_domain_destroy,
>      .clear_root_pgtable = amd_iommu_clear_root_pgtable,
>      .map_page = amd_iommu_map_page,
>      .unmap_page = amd_iommu_unmap_page,
>      .iotlb_flush = amd_iommu_flush_iotlb_pages,
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      .reassign_device = reassign_device,
>      .get_device_group_id = amd_iommu_group_id,
> +#endif
>      .enable_x2apic = iov_enable_xt,
>      .update_ire_from_apic = amd_iommu_ioapic_update_ire,
>      .update_ire_from_msi = amd_iommu_msi_msg_update_ire,

... some fields / initializers, such that we get away with a single #ifdef each.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -877,6 +877,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      return ret;
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  /* Caller should hold the pcidevs_lock */
>  static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>                             uint8_t devfn)
> @@ -945,7 +946,6 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>      return ret;
>  }
>  
> -#ifdef CONFIG_MGMT_HYPERCALLS
>  int pci_release_devices(struct domain *d)
>  {
>      int combined_ret;
> @@ -1483,6 +1483,7 @@ static int iommu_remove_device(struct pci_dev *pdev)
>      return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev(pdev));
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  static int device_assigned(u16 seg, u8 bus, u8 devfn)
>  {
>      struct pci_dev *pdev;
> @@ -1646,6 +1647,7 @@ static int iommu_get_device_group(
>  
>      return i;
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */
>  
>  void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
>  {
> @@ -1671,6 +1673,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
>      pcidevs_unlock();
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  int iommu_do_pci_domctl(
>      struct xen_domctl *domctl, struct domain *d,
>      XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> @@ -1804,6 +1807,7 @@ int iommu_do_pci_domctl(
>  
>      return ret;
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */

Same here - the helpers of iommu_do_pci_domctl() would likely best move immediately
ahead of it, so that all can be covered with a single #ifdef.

Jan

