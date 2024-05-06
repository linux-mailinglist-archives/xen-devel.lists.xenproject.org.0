Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E88BCF35
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 15:39:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717664.1120090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yYN-0003Yt-IH; Mon, 06 May 2024 13:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717664.1120090; Mon, 06 May 2024 13:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yYN-0003Wv-FD; Mon, 06 May 2024 13:38:51 +0000
Received: by outflank-mailman (input) for mailman id 717664;
 Mon, 06 May 2024 13:38:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3yYM-0003Wp-51
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 13:38:50 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f74b8557-0bad-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 15:38:47 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41e82b78387so12843775e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 06:38:48 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 u9-20020adfa189000000b0034bc5934bf8sm10759564wru.31.2024.05.06.06.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 06:38:47 -0700 (PDT)
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
X-Inumbo-ID: f74b8557-0bad-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715002727; x=1715607527; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WA3PJewGWcJ0vSMf1oiWHFOn6W9zm43WZOEYmSc5W+k=;
        b=tt1VfIEtxULEd+5P2mzS4rDGezvFC3On1FU8e4eJISmSR0U/xoJgTbph1J7IAo+8qt
         wDKB7lysewwy6r+maml88vhe58Qo7QsdYeglUiP/m/EkW8hzAS/cAKA8w7exr7jHnrDp
         qXTvKdgZZqQVMM2un7E+M8ny+X0QLaOVy4HVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715002727; x=1715607527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA3PJewGWcJ0vSMf1oiWHFOn6W9zm43WZOEYmSc5W+k=;
        b=d5xo+Y4aiGuJ6t/koi97OQDpbsNqGyJgecA3M88Sarig6lmYgOiATPrBfhST3I/Sga
         fL9cdYLSQkfjPIKHyqgzp18Heq3s5wA9mPOXCcdD6uIWoBpVVvC5iJGa7XJuFAR4j8xS
         q9UsRVC4AN2+GeU/j8XAeIgbgAqlVlfP3d60yqZbHHmJokZqJn8rj1qWWl+3JyzHQ2F3
         OJxsikDzHVjg9iy1PtLowFqBoDEJ30v09GBScyIZ4Cz0pLOUIAuGrOdbfAYshri/Dj7R
         miPknesheeWA0bKvEsmP9T3wtECu1tELGQnQvSrEopESl05Gn9IyjqnGqbDTEbNZe4Ff
         F5Ow==
X-Gm-Message-State: AOJu0YxOWdtDqQhJgR87dZOmfTKFaLIib/z+BPRpx8jUw7bRFcuUhfKj
	nmoQY4o8ZLhL5DZnQhyTNH5IFq5yIPbf6QuAqcsf/UPE8tg15KJg6fb+/sQLK3lJiK3UbyiOe4R
	B
X-Google-Smtp-Source: AGHT+IEo/chnw6rYpHAYwTydwUAMg61gZeznYY3GDrNYu59TykV32hwiqFrNrKpksXj9V7I/PI1bLA==
X-Received: by 2002:a05:6000:49:b0:34a:3f3d:bb22 with SMTP id k9-20020a056000004900b0034a3f3dbb22mr8007514wrx.26.1715002727272;
        Mon, 06 May 2024 06:38:47 -0700 (PDT)
Date: Mon, 6 May 2024 15:38:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 06/12] VT-d: respect ACPI SATC's ATC_REQUIRED flag
Message-ID: <ZjjdZRPluS0YIazc@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <e98daa41-c6b6-4f4e-b41d-84006011068d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e98daa41-c6b6-4f4e-b41d-84006011068d@suse.com>

On Thu, Feb 15, 2024 at 11:16:11AM +0100, Jan Beulich wrote:
> When the flag is set, permit Dom0 to control the device (no worse than
> what we had before and in line with other "best effort" behavior we use
> when it comes to Dom0),

I think we should somehow be able to signal dom0 that this device
might not operate as expected, otherwise dom0 might use it and the
device could silently malfunction due to ATS not being enabled.

Otherwise we should just hide the device from dom0.

I assume setting the IOMMU context entry to passthrough mode would
also be fine for such devices that require ATS?

> but suppress passing through to DomU-s unless
> ATS can actually be enabled for such devices (and was explicitly enabled
> on the command line).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Re-base over new earlier patches.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -225,7 +225,11 @@ exceptions (watchdog NMIs and unexpected
>  > Default: `false`
>  
>  Permits Xen to set up and use PCI Address Translation Services.  This is a
> -performance optimisation for PCI Passthrough.
> +performance optimisation for PCI Passthrough.  Note that firmware may indicate
> +that certain devices need to have ATS enabled for proper operation. For such
> +devices ATS will be enabled by default, unless the option is used in its
> +negative form.  Such devices will still not be eligible for passing through to
> +guests, unless the option is used in its positive form.
>  
>  **WARNING: Xen cannot currently safely use ATS because of its synchronous wait
>  loops for Queued Invalidation completions.**
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -253,6 +253,24 @@ struct acpi_atsr_unit *acpi_find_matched
>      return all_ports;
>  }
>  
> +const struct acpi_satc_unit *acpi_find_matched_satc_unit(
> +    const struct pci_dev *pdev)
> +{
> +    const struct acpi_satc_unit *satc;
> +
> +    list_for_each_entry ( satc, &acpi_satc_units, list )
> +    {
> +        if ( satc->segment != pdev->seg )
> +            continue;
> +
> +        for ( unsigned int i = 0; i < satc->scope.devices_cnt; ++i )
> +            if ( satc->scope.devices[i] == pdev->sbdf.bdf )
> +                return satc;
> +    }
> +
> +    return NULL;
> +}
> +
>  struct acpi_rhsa_unit *drhd_to_rhsa(const struct acpi_drhd_unit *drhd)
>  {
>      struct acpi_rhsa_unit *rhsa;
> --- a/xen/drivers/passthrough/vtd/dmar.h
> +++ b/xen/drivers/passthrough/vtd/dmar.h
> @@ -112,6 +112,8 @@ struct acpi_satc_unit {
>  
>  struct acpi_drhd_unit *acpi_find_matched_drhd_unit(const struct pci_dev *);
>  struct acpi_atsr_unit *acpi_find_matched_atsr_unit(const struct pci_dev *);
> +const struct acpi_satc_unit *acpi_find_matched_satc_unit(
> +    const struct pci_dev *pdev);
>  
>  #define DMAR_TYPE 1
>  #define RMRR_TYPE 2
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2364,6 +2364,26 @@ static int cf_check intel_iommu_add_devi
>      if ( ret )
>          dprintk(XENLOG_ERR VTDPREFIX, "%pd: context mapping failed\n",
>                  pdev->domain);
> +    else if ( !pdev->broken )
> +    {
> +        const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
> +        const struct acpi_satc_unit *satc = acpi_find_matched_satc_unit(pdev);
> +
> +        /*
> +         * Prevent the device from getting assigned to an unprivileged domain
> +         * when firmware indicates ATS is required, but ATS could not be enabled
> +         * or was not explicitly enabled via command line option.
> +         */
> +        if ( satc && satc->atc_required &&
> +             (!drhd || ats_device(pdev, drhd) <= 0 ||
> +              !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn) ||
> +              opt_ats < 0) )

Do you need the opt_ats check here?

I don't think it's possible for pci_ats_enabled() to return true if
opt_ats is <= 0, and hence the opt_ats < 0 check can be dropped from
the conditional?

> +        {
> +            printk(XENLOG_WARNING "ATS: %pp is not eligible for pass-through\n",
> +                   &pdev->sbdf);
> +            pdev->broken = true;
> +        }
> +    }
>  
>      return ret;
>  }
> @@ -2375,12 +2395,26 @@ static int cf_check intel_iommu_enable_d
>  
>      pci_vtd_quirk(pdev);
>  
> -    if ( ret <= 0 )
> -        return ret;
> +    if ( ret <= 0 ||
> +         (ret = enable_ats_device(pdev, &drhd->iommu->ats_devices)) < 0 ||
> +         opt_ats < 0 )

Shouldn't this be opt_ats <= 0?

> +    {
> +        const struct acpi_satc_unit *satc = acpi_find_matched_satc_unit(pdev);
> +
> +        /*
> +         * Besides in error cases also prevent the device from getting assigned
> +         * to an unprivileged domain when firmware indicates ATS is required,
> +         * but ATS use was not explicitly enabled via command line option.
> +         */
> +        if ( satc && satc->atc_required && !pdev->broken )
> +        {
> +            printk(XENLOG_WARNING "ATS: %pp is not eligible for pass-through\n",
> +                   &pdev->sbdf);
> +            pdev->broken = true;
> +        }

I think the code here could be easier to read if this was put in an
label at the end, and the early return above that you remove becomes a
goto.  But that's a question of taste.

> +    }
>  
> -    ret = enable_ats_device(pdev, &drhd->iommu->ats_devices);
> -
> -    return ret >= 0 ? 0 : ret;
> +    return ret <= 0 ? ret : 0;
>  }
>  
>  static int cf_check intel_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
> --- a/xen/drivers/passthrough/vtd/x86/ats.c
> +++ b/xen/drivers/passthrough/vtd/x86/ats.c
> @@ -45,8 +45,9 @@ int ats_device(const struct pci_dev *pde
>  {
>      struct acpi_drhd_unit *ats_drhd;
>      unsigned int pos, expfl = 0;
> +    const struct acpi_satc_unit *satc;
>  
> -    if ( opt_ats <= 0 || !iommu_qinval )
> +    if ( !opt_ats || !iommu_qinval )
>          return 0;

FWIW, I find this change confusing, hence my request earlier that
opt_ats must be set to 0 or 1 by the point it gets used.

Thanks, Roger.

