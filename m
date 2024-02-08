Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1D184E002
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 12:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678152.1055225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY2u5-0001uJ-1L; Thu, 08 Feb 2024 11:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678152.1055225; Thu, 08 Feb 2024 11:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY2u4-0001sH-Ux; Thu, 08 Feb 2024 11:49:16 +0000
Received: by outflank-mailman (input) for mailman id 678152;
 Thu, 08 Feb 2024 11:49:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mdps=JR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rY2u4-0001sB-32
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 11:49:16 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1492fcfe-c678-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 12:49:14 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a2a17f3217aso213966966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 03:49:14 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 gq12-20020a170906e24c00b00a3816515cd4sm1812331ejb.116.2024.02.08.03.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 03:49:13 -0800 (PST)
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
X-Inumbo-ID: 1492fcfe-c678-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707392953; x=1707997753; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+qTxWUbBQSGBGPIVl5GZg1+uuCSi3J+TktZnHjRxE9M=;
        b=h6LJJ9qPugvfPaNhBvaM9yz9ThtDWATfd+ndD+ZZnWK86CaIbq9nxurMkeqFoEki7I
         bBm/BC3r98hK/CL38uq68Ga7SE64mf7eoVAhW32xJFPKSAjTL8E/U2x/oR8+ydTps5k+
         5eT9hVytKNuqZHtKR7pN/qZoZaGbDGx/Sm0nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707392953; x=1707997753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qTxWUbBQSGBGPIVl5GZg1+uuCSi3J+TktZnHjRxE9M=;
        b=tTye5RFwIcVWckj65mPSZATHdWo99ZYO+v+veWDeGBbRHPx9JiGRO3ZFHNbhYXiF8X
         dzWa1OVMmWovpc16cIUnACb1NfdFFay+GJJGr4KLBVBgXpUMdY8Ps4lqPRyUZXI8zV3c
         DVGZ17K/HfUSOy5AjIh7w2Mll7cAC40tvL3K0TzOu7F7zzamPNlevck0LicPWJqd+5LC
         e/kWgwGXj3hFK4eon2lOD0mZ5QFPETAXbkShxurpS9fU0bAPCXoP3mQD1tR2/9oYpujF
         HoSZROmuej6Dk8stVhrvTvoz7XRsDQ4Cl8FxtcGKjwHNY+rMmu4N6gkPA+6iuoZ8X3eg
         ldSQ==
X-Gm-Message-State: AOJu0YxdHOLYwwWTE3IRAyUOW2b6kvmrpSYGDAUpgE7xseDoVMgZohkt
	LEmhWWjnTmil+WvhloMtncoCvX+XmUbl90R2GiTwLte4/XSHqOyVbFoqGSfriU0=
X-Google-Smtp-Source: AGHT+IG3YqqOqA3vyZLfdBck11XK0C/kfM3095U73ByEA4rdmtCfav1RdTGNwjLP/HSrQanUPdPy3A==
X-Received: by 2002:a17:906:bcf8:b0:a37:9aaa:9c2e with SMTP id op24-20020a170906bcf800b00a379aaa9c2emr5831131ejb.76.1707392953426;
        Thu, 08 Feb 2024 03:49:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYncylOMhE0q91k9VsqA3fkEsFUDT9HNq+qpPsjOhonilGGNymndN1cQlehoVnUiWzyI0yoaP38ivPY8rEXJIzid8E+tVouyBtutKQMTCXSImJZLgsI2e00ow8bKi11tT6X8WUGqpwIw+4spAE
Date: Thu, 8 Feb 2024 12:49:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/7] IOMMU: rename and re-type ats_enabled
Message-ID: <ZcS_uC2t96Lh720Y@macbook>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <467d24e1-8ed3-4dda-a334-70ff747bf94b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <467d24e1-8ed3-4dda-a334-70ff747bf94b@suse.com>

On Mon, Feb 05, 2024 at 02:55:43PM +0100, Jan Beulich wrote:
> Make the variable a tristate, with (as done elsewhere) a negative value
> meaning "default". Since all use sites need looking at, also rename it
> to match our usual "opt_*" pattern. While touching it, also move it to
> .data.ro_after_init.
> 
> The only place it retains boolean nature is pci_ats_device(), for now.

Why does it retain the boolean nature in pci_ats_device()?

I assume this is to avoid having to touch the line again in a further
patch, as given the current logic pci_ats_device() would also want to
treat -1 as ATS disabled.

I think this is all fine because you add additional opt_ats > 0 checks
before the call to pci_ats_device(), but would be good to know this is
the intention.

> In AMD code re-order conditionals to have the config space accesses
> after (cheaper) flag checks.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> In domain_context_mapping_one() I'm a little puzzled that translation
> type is selected based on only IOMMU and global properties, i.e. not
> taking the device itself into account.

That seems like a bug to me, we should check that the device supports
ATS (and has it enabled) before setting the translation type to
CONTEXT_TT_DEV_IOTLB unconditionally.  We should likely use
ats_device() instead of ats_enabled in domain_context_mapping_one().

There's also IMO a second bug here, which is that we possibly attempt
to flush the device IOTLB before having ATS enabled.  We flush the
device TLB in domain_context_mapping_one(), yet ATS is enabled by the
caller afterwards (see domain_context_mapping()).

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
> @@ -185,10 +185,11 @@ static int __must_check amd_iommu_setup_
>          dte->ex = ivrs_dev->dte_allow_exclusion;
>          dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
>  
> -        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> +        if ( opt_ats > 0 &&
>               !ivrs_dev->block_ats &&
> -             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
> -            dte->i = ats_enabled;
> +             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> +             pci_ats_device(iommu->seg, bus, pdev->devfn) )
> +            dte->i = true;
>  
>          spin_unlock_irqrestore(&iommu->lock, flags);
>  
> @@ -248,10 +249,11 @@ static int __must_check amd_iommu_setup_
>          ASSERT(dte->sys_mgt == MASK_EXTR(ivrs_dev->device_flags,
>                                           ACPI_IVHD_SYSTEM_MGMT));
>  
> -        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> +        if ( opt_ats > 0 &&
>               !ivrs_dev->block_ats &&
> -             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
> -            ASSERT(dte->i == ats_enabled);
> +             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> +             pci_ats_device(iommu->seg, bus, pdev->devfn) )
> +            ASSERT(dte->i);
>  
>          spin_unlock_irqrestore(&iommu->lock, flags);
>  
> @@ -268,9 +270,10 @@ static int __must_check amd_iommu_setup_
>  
>      ASSERT(pcidevs_locked());
>  
> -    if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> +    if ( opt_ats > 0 &&
>           !ivrs_dev->block_ats &&
>           iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> +         pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>           !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )

Seeing that this same set of conditions is used in 3 different checks,
could we add a wrapper for it?

opt_ats > 0 && !ivrs_dev->block_ats &&
iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
pci_ats_device(iommu->seg, bus, pdev->devfn)

pci_device_ats_capable()? or some such.

Thanks, Roger.

