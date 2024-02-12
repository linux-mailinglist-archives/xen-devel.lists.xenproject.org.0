Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A11850FDB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 10:40:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679425.1056865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSn9-0001qB-1m; Mon, 12 Feb 2024 09:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679425.1056865; Mon, 12 Feb 2024 09:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSn8-0001nQ-Ur; Mon, 12 Feb 2024 09:39:58 +0000
Received: by outflank-mailman (input) for mailman id 679425;
 Mon, 12 Feb 2024 09:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IbWo=JV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rZSn8-0001nK-Dr
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 09:39:58 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae47314e-c98a-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 10:39:56 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a36126ee41eso386296466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 01:39:56 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 st10-20020a170907c08a00b00a3c5e6515d0sm26099ejc.24.2024.02.12.01.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 01:39:55 -0800 (PST)
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
X-Inumbo-ID: ae47314e-c98a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707730796; x=1708335596; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3VAFCSbbbrHScA37MngxsDzGnmc1khZJpSHHyywTSog=;
        b=tUuQ62yTwbNhIQww6WBHN0xgahdMRQyTZAP5W9rTj83vbT1sOeRRtlQcUeaZ3ZUGch
         hl6Ki1WkO8vozOb8/mBdJFxVH9Blm/B+R8ZoZbqMPz4lvO6JMtUhhM5Hxe6H5a/Y8rZ9
         qL98muGkNqxQKal3qDfj2PoMZbgHg54QWr+x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707730796; x=1708335596;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3VAFCSbbbrHScA37MngxsDzGnmc1khZJpSHHyywTSog=;
        b=fhVX+LGJ8QPnAaEdsHhJG3TUpXXy/aQTovmvPhGJWC7116OfPXPoYu8Q1g79UKkf7m
         A91pKWEMCKQgHA6+3znq3OVK5Emqv/g3G81w9nPM5CQQsj4uCzHhpSL7w64LW1NwbeQ8
         iaQxJhVmpmEEcghJIuUonHg3f/fOQT77HwnHNAiHEOfONl365KqdaIq+pGzDEJ2IcdJu
         2T6fHty9VqpFnIB6IOl+kUS9TZBe3T2/yvNtilZA2oe840ysPLynbbh4O5xBS7gxQaIH
         fDa+3vE0f0cuxeMCwLa2Axr0A3LPf5LYn3RFTln8sLMYJEOko9LPykJHIeMU2yJcb0xI
         G5BA==
X-Gm-Message-State: AOJu0YzBNgK4nDIXTFpIZM3KbdWCY94SncqFo60BL9mVyNzpyMnFn/3V
	5hEqv2Vw1jthqCkE39aYBnTTX3XstDUSNriSm6vcRH0Aswf6dvaj+nWcDwY3vWc=
X-Google-Smtp-Source: AGHT+IEAahnidk9VcHFd4s75uh1e1phYpGWuYesYKYDabpgBPcVHh2tWxvLeUj8U/9id8HT2kUoStw==
X-Received: by 2002:a17:906:1999:b0:a36:50fb:37ef with SMTP id g25-20020a170906199900b00a3650fb37efmr4117291ejd.28.1707730795717;
        Mon, 12 Feb 2024 01:39:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgFtFFtEtD2mHGf2yGl1jBRoh/JgKaK6IJ7Qh0XNhSqV1ZUz3TZwsb3OUpjAHhU1V1yDlCa4qTQt1oYrImWTYNbqMTZoz5Svq5/5gfhXG2+6m3i+pV0Ex2XeoN372u31d+WYU+282rRabGcXhy
Date: Mon, 12 Feb 2024 10:39:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/7] IOMMU: rename and re-type ats_enabled
Message-ID: <ZcnnautuDD2qluQm@macbook>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <467d24e1-8ed3-4dda-a334-70ff747bf94b@suse.com>
 <ZcS_uC2t96Lh720Y@macbook>
 <4179ded9-36b8-4d47-997b-40d056e033af@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4179ded9-36b8-4d47-997b-40d056e033af@suse.com>

On Thu, Feb 08, 2024 at 04:49:46PM +0100, Jan Beulich wrote:
> On 08.02.2024 12:49, Roger Pau Monné wrote:
> > On Mon, Feb 05, 2024 at 02:55:43PM +0100, Jan Beulich wrote:
> >> Make the variable a tristate, with (as done elsewhere) a negative value
> >> meaning "default". Since all use sites need looking at, also rename it
> >> to match our usual "opt_*" pattern. While touching it, also move it to
> >> .data.ro_after_init.
> >>
> >> The only place it retains boolean nature is pci_ats_device(), for now.
> > 
> > Why does it retain the boolean nature in pci_ats_device()?
> > 
> > I assume this is to avoid having to touch the line again in a further
> > patch, as given the current logic pci_ats_device() would also want to
> > treat -1 as ATS disabled.
> 
> No, then I would need to touch the line. The function wants to treat
> -1 as "maybe enabled", so the caller can know whether a device is an
> ATS device regardless of whether ATS use is fully off, or only
> "soft-off".

I have to admit I'm slightly concerned about this soft-off.  Given the
current status of ATS itself in Xen, and the technology itself, I
think a user should always opt-in to ATS usage.

> > I think this is all fine because you add additional opt_ats > 0 checks
> > before the call to pci_ats_device(), but would be good to know this is
> > the intention.
> 
> Note how amd_iommu_disable_domain_device() does not gain such a
> check, for exactly the reason named above: The function would better
> turn off ATS whenever enabled, no matter for what reason.
> 
> And of course - none of this "soft-off" vs "fully off" matters for
> AMD (which is the only user of the function) right now anyway, seeing
> they don't have an equivalent of the ATC_REQUIRED flag.
> 
> >> In AMD code re-order conditionals to have the config space accesses
> >> after (cheaper) flag checks.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> In domain_context_mapping_one() I'm a little puzzled that translation
> >> type is selected based on only IOMMU and global properties, i.e. not
> >> taking the device itself into account.
> > 
> > That seems like a bug to me, we should check that the device supports
> > ATS (and has it enabled) before setting the translation type to
> > CONTEXT_TT_DEV_IOTLB unconditionally.  We should likely use
> > ats_device() instead of ats_enabled in domain_context_mapping_one().
> 
> Will try to remember to add yet another patch then.
> 
> > There's also IMO a second bug here, which is that we possibly attempt
> > to flush the device IOTLB before having ATS enabled.  We flush the
> > device TLB in domain_context_mapping_one(), yet ATS is enabled by the
> > caller afterwards (see domain_context_mapping()).
> 
> You may be right with this; I'd need to read up on whether such
> flushing is permissible.
> 
> >> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> >> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> >> @@ -185,10 +185,11 @@ static int __must_check amd_iommu_setup_
> >>          dte->ex = ivrs_dev->dte_allow_exclusion;
> >>          dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
> >>  
> >> -        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> >> +        if ( opt_ats > 0 &&
> >>               !ivrs_dev->block_ats &&
> >> -             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
> >> -            dte->i = ats_enabled;
> >> +             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> >> +             pci_ats_device(iommu->seg, bus, pdev->devfn) )
> >> +            dte->i = true;
> >>  
> >>          spin_unlock_irqrestore(&iommu->lock, flags);
> >>  
> >> @@ -248,10 +249,11 @@ static int __must_check amd_iommu_setup_
> >>          ASSERT(dte->sys_mgt == MASK_EXTR(ivrs_dev->device_flags,
> >>                                           ACPI_IVHD_SYSTEM_MGMT));
> >>  
> >> -        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> >> +        if ( opt_ats > 0 &&
> >>               !ivrs_dev->block_ats &&
> >> -             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
> >> -            ASSERT(dte->i == ats_enabled);
> >> +             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> >> +             pci_ats_device(iommu->seg, bus, pdev->devfn) )
> >> +            ASSERT(dte->i);
> >>  
> >>          spin_unlock_irqrestore(&iommu->lock, flags);
> >>  
> >> @@ -268,9 +270,10 @@ static int __must_check amd_iommu_setup_
> >>  
> >>      ASSERT(pcidevs_locked());
> >>  
> >> -    if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> >> +    if ( opt_ats > 0 &&
> >>           !ivrs_dev->block_ats &&
> >>           iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> >> +         pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> >>           !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
> > 
> > Seeing that this same set of conditions is used in 3 different checks,
> > could we add a wrapper for it?
> > 
> > opt_ats > 0 && !ivrs_dev->block_ats &&
> > iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> > pci_ats_device(iommu->seg, bus, pdev->devfn)
> > 
> > pci_device_ats_capable()? or some such.
> 
> I was pondering that, yes (iirc already once when adding block_ats).
> Problem is the name. "capable" isn't quite right when considering
> the tristate opt_ats. And pci_device_may_use_ats() reads, well,
> clumsy to me. If you have any good idea for a name that's fully
> applicable and not odd or overly long, I can certainly introduce
> such a helper.

But if ATS is soft-disabled (-1) or hard disabled (0), it's fine to
consider the devices as not ATS capable for the context here?

Thanks, Roger.

