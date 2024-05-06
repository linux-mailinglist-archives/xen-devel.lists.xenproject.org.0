Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BCC8BCE40
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 14:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717614.1119994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3xfb-0006jF-2j; Mon, 06 May 2024 12:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717614.1119994; Mon, 06 May 2024 12:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3xfa-0006hL-Vz; Mon, 06 May 2024 12:42:14 +0000
Received: by outflank-mailman (input) for mailman id 717614;
 Mon, 06 May 2024 12:42:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3xfZ-0006hF-FG
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 12:42:13 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e8bcfa4-0ba6-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 14:42:11 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41c1b75ca31so13285125e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 05:42:11 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d10-20020a05600c3aca00b00418e4cc9de7sm19628689wms.7.2024.05.06.05.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 05:42:10 -0700 (PDT)
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
X-Inumbo-ID: 0e8bcfa4-0ba6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714999330; x=1715604130; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q6S8tN0PqUfWdBDz4LYEnqY2T5KjG/5O0y44awgmZBk=;
        b=mA6fE7RQipQDTPBwzdhz1Ejc4htv5ML9LgNIWhARp5hqij+VgnF87IHQZMdiDwrlFQ
         H6P7NmND8Oi3NMg/yDhzySHwZFEjl9kUUNPXTsCgrW5pP+o3XMjQi4y4QyZ39SUg7NiZ
         63uI3m6m/Rp+9EYpfYQGudCKYiPxSfTPRYIYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714999330; x=1715604130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6S8tN0PqUfWdBDz4LYEnqY2T5KjG/5O0y44awgmZBk=;
        b=P5lfrX8NzVAToQ0sJz1xvkqm8JkbSgWe3ZYgduWVDhx/Ki6rHdv1Y+oz/gajaLUeC3
         Gq39BtekN74sLRH6m9Io45LvE3sYcOL4x0SawGHk30YRSMTSfKPHBW50IX/hS1f4RMa7
         dH3qrs11xDSM8l8rc17nc977TjZeupYuchS32evxXi/BtaBWVXeRYC++tJ7xuEARDC9v
         sp7tsIrGKJbMEzBXMLthupxrrb9JgJcDz3h8G0Ppru9nHzHZYYkVkgh65//gkzcRvtll
         JdYJ9zHC25jB9kSv+uiZ7+M3vWODSMDALiN+b9hYgSA4Ax+gVKg9bvAfiJ/KNZM8/7wl
         1nUw==
X-Gm-Message-State: AOJu0YzGq2vuffyz5U+V1WYBwVuKOfto84u0vhcmoJwMiX4NNB0GYXFD
	ilyXnkzYQvPJ0wh0b4gSe4+gS1+fS+svyKjaIYb67MCTfZRrOc8F+Nm+TKWm0ng=
X-Google-Smtp-Source: AGHT+IH9EKQc2r2CMZ2jiGPEoRkY88zsw2uViGhGuKiiPjYbA4remP977CoWSC3O6ec50nyxwUoWaA==
X-Received: by 2002:a05:600c:4711:b0:41a:c170:701f with SMTP id v17-20020a05600c471100b0041ac170701fmr7637618wmo.38.1714999330380;
        Mon, 06 May 2024 05:42:10 -0700 (PDT)
Date: Mon, 6 May 2024 14:42:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 05/12] IOMMU: rename and re-type ats_enabled
Message-ID: <ZjjQIaxEwS6b-swj@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <7f11ca06-9bed-443b-9c79-0e62b71a1f96@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f11ca06-9bed-443b-9c79-0e62b71a1f96@suse.com>

On Thu, Feb 15, 2024 at 11:15:39AM +0100, Jan Beulich wrote:
> Make the variable a tristate, with (as done elsewhere) a negative value
> meaning "default". Since all use sites need looking at, also rename it
> to match our usual "opt_*" pattern. While touching it, also move it to
> .data.ro_after_init.

I guess I need to look at further patches, as given the feedback on
the past version I think we agreed we want to set ATS unconditionally
disabled by default, and hence I'm not sure I see the point of the
tri-state if enabling ATS will require an explicit opt-in on the
command line (ats=1).

> The only place it retains boolean nature is pci_ats_device(), for now.
> 
> In AMD code re-order conditionals to have the config space accesses
> after (cheaper) flag checks.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> In domain_context_mapping_one() I'm a little puzzled that translation
> type is selected based on only IOMMU and global properties, i.e. not
> taking the device itself into account.

Is it maybe fine do set DEV_IOTLB unconditionally as long as the IOMMU
supports it, and then let the device decide whether it wants to issue
translated or non-translated requests depending on whether it supports
(and enables) ATS?

I think it would be best to limit this strictly to devices that have
ATS enabled.

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

If having a tri-state is required, won't it be best to decide on a
binary value at init time, so that runtime functions can handle
opt_ats as a boolean?

Otherwise we are open coding the default expectation of what -1
implies (disabled) in all use sites.

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

Might be easier to just use:

dte->i = use_ats(pdev, iommu, ivrs_dev);

>  
>          spin_unlock_irqrestore(&iommu->lock, flags);
>  
> @@ -257,7 +257,7 @@ static int __must_check amd_iommu_setup_
>                                           ACPI_IVHD_SYSTEM_MGMT));
>  
>          if ( use_ats(pdev, iommu, ivrs_dev) )
> -            ASSERT(dte->i == ats_enabled);
> +            ASSERT(dte->i);

ASSERT(dte->i == use_ats(pdev, iommu, ivrs_dev));

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

Can't you remove that check altogether now, since you are adding an
opt_ats check to use_ats()?

Thanks, Roger.

