Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFD0851845
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 16:39:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679666.1057247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZYOL-0002uc-Ev; Mon, 12 Feb 2024 15:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679666.1057247; Mon, 12 Feb 2024 15:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZYOL-0002sg-C5; Mon, 12 Feb 2024 15:38:45 +0000
Received: by outflank-mailman (input) for mailman id 679666;
 Mon, 12 Feb 2024 15:38:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IbWo=JV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rZYOK-0002sX-54
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 15:38:44 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb9b5521-c9bc-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 16:38:40 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-410db155e57so6696735e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 07:38:40 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 je11-20020a05600c1f8b00b00410885ba8casm7714743wmb.39.2024.02.12.07.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 07:38:39 -0800 (PST)
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
X-Inumbo-ID: cb9b5521-c9bc-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707752320; x=1708357120; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sN0aDPuErzB0rLLjDfP31AhY1wWx/5dUNIrbT7KkRJw=;
        b=CT9xRslVu2v3E+DosIo9bwvEKaiYZu6kLNWLEVTrU+z4HHzfaALMUFnIcnfgwiZrpE
         y4jfbFEy166xN2FrO3I9u758IDGwJNrRqkYRId+KcjQCfP9lDGsU0wM/p6Pe4Q5REO3w
         YV11hWGQESY6C7kEJo8jcc+KEDaNEN+nDcjNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707752320; x=1708357120;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sN0aDPuErzB0rLLjDfP31AhY1wWx/5dUNIrbT7KkRJw=;
        b=PheIxaHGsTF66MsC94DLVzcNHhwk7vgqL2GFZ1JtJkpDRFOfnz7vcwaf28gTYjS7zO
         xROp9YY5PWcs13HdmefGTVfeNMU0dItkjThNI5kBJMEiAFkgIUL1ENQPVZmrKofVAGql
         Kq2V4p2IMviaBDqiXG9kQzptT6fJEjth5Sxr+BGRNYmZ0MrFdfbNqLwcnR32GrMKzOLU
         UyZR/jZFb+QN5UX/d8zVD+kTBxJx5+x3cj/lI83OUJK0upQBGhx4WZfMO0WPUMSh7D6f
         BQ1nYIPaLXrsdnL0M3ESOMuh+MYi9PctUJL6I1/RnzDxysM7CpTpQ22dmxFGrHWVz4pa
         z5ZQ==
X-Gm-Message-State: AOJu0YwISjfFz+oUkGjwcDZBKPjLVGUPGYUS84kYNO8mGCI5H0r3NcTQ
	LaLSINdjUcEYBF3Bj8vK5hp3N3Pi87K+zW75jq3FOt139X10J7Y6WCMs5imq2Gp83+3T1xke0sL
	x
X-Google-Smtp-Source: AGHT+IF+J3FtfNQv4zbYmq83MibN1zsuNiyYiDAmjrf4dQuGKs+g0k9GzS85PPU8eILbUVGUdRCReQ==
X-Received: by 2002:a05:600c:c12:b0:410:a138:7447 with SMTP id fm18-20020a05600c0c1200b00410a1387447mr5093101wmb.27.1707752319800;
        Mon, 12 Feb 2024 07:38:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+J78BSTrMzJQSAXwiU/iguBJkeBo6HhU5EJU/na9F2LPoPPEZvHZKql/Xen3EdnS6ckTGHtpZMXfKuuEEsLl/GIXtepWiHqOCP9xU3Qg14RCN0xfFSX8EBUC+Q7lSP91pYsAuGYVDqW4RpTQq
Date: Mon, 12 Feb 2024 16:38:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/7] IOMMU: rename and re-type ats_enabled
Message-ID: <Zco7fvp1nPVlLtRy@macbook>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <467d24e1-8ed3-4dda-a334-70ff747bf94b@suse.com>
 <ZcS_uC2t96Lh720Y@macbook>
 <4179ded9-36b8-4d47-997b-40d056e033af@suse.com>
 <ZcnnautuDD2qluQm@macbook>
 <2fccd004-b35a-4cde-afbb-722cb2413902@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fccd004-b35a-4cde-afbb-722cb2413902@suse.com>

On Mon, Feb 12, 2024 at 11:45:33AM +0100, Jan Beulich wrote:
> On 12.02.2024 10:39, Roger Pau Monné wrote:
> > On Thu, Feb 08, 2024 at 04:49:46PM +0100, Jan Beulich wrote:
> >> On 08.02.2024 12:49, Roger Pau Monné wrote:
> >>> On Mon, Feb 05, 2024 at 02:55:43PM +0100, Jan Beulich wrote:
> >>>> Make the variable a tristate, with (as done elsewhere) a negative value
> >>>> meaning "default". Since all use sites need looking at, also rename it
> >>>> to match our usual "opt_*" pattern. While touching it, also move it to
> >>>> .data.ro_after_init.
> >>>>
> >>>> The only place it retains boolean nature is pci_ats_device(), for now.
> >>>
> >>> Why does it retain the boolean nature in pci_ats_device()?
> >>>
> >>> I assume this is to avoid having to touch the line again in a further
> >>> patch, as given the current logic pci_ats_device() would also want to
> >>> treat -1 as ATS disabled.
> >>
> >> No, then I would need to touch the line. The function wants to treat
> >> -1 as "maybe enabled", so the caller can know whether a device is an
> >> ATS device regardless of whether ATS use is fully off, or only
> >> "soft-off".
> > 
> > I have to admit I'm slightly concerned about this soft-off.  Given the
> > current status of ATS itself in Xen, and the technology itself, I
> > think a user should always opt-in to ATS usage.
> 
> The plan is to follow your suggestion in patch 3 and require explicit
> enabling for passing through of such devices. For Dom0, however, I
> think it is important that we respect the firmware request by default.
> The only viable(?!) alternative would be to panic() instead.

Or assign to domIO?

> >>>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> >>>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> >>>> @@ -185,10 +185,11 @@ static int __must_check amd_iommu_setup_
> >>>>          dte->ex = ivrs_dev->dte_allow_exclusion;
> >>>>          dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
> >>>>  
> >>>> -        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> >>>> +        if ( opt_ats > 0 &&
> >>>>               !ivrs_dev->block_ats &&
> >>>> -             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
> >>>> -            dte->i = ats_enabled;
> >>>> +             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> >>>> +             pci_ats_device(iommu->seg, bus, pdev->devfn) )
> >>>> +            dte->i = true;
> >>>>  
> >>>>          spin_unlock_irqrestore(&iommu->lock, flags);
> >>>>  
> >>>> @@ -248,10 +249,11 @@ static int __must_check amd_iommu_setup_
> >>>>          ASSERT(dte->sys_mgt == MASK_EXTR(ivrs_dev->device_flags,
> >>>>                                           ACPI_IVHD_SYSTEM_MGMT));
> >>>>  
> >>>> -        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> >>>> +        if ( opt_ats > 0 &&
> >>>>               !ivrs_dev->block_ats &&
> >>>> -             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
> >>>> -            ASSERT(dte->i == ats_enabled);
> >>>> +             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> >>>> +             pci_ats_device(iommu->seg, bus, pdev->devfn) )
> >>>> +            ASSERT(dte->i);
> >>>>  
> >>>>          spin_unlock_irqrestore(&iommu->lock, flags);
> >>>>  
> >>>> @@ -268,9 +270,10 @@ static int __must_check amd_iommu_setup_
> >>>>  
> >>>>      ASSERT(pcidevs_locked());
> >>>>  
> >>>> -    if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> >>>> +    if ( opt_ats > 0 &&
> >>>>           !ivrs_dev->block_ats &&
> >>>>           iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> >>>> +         pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> >>>>           !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
> >>>
> >>> Seeing that this same set of conditions is used in 3 different checks,
> >>> could we add a wrapper for it?
> >>>
> >>> opt_ats > 0 && !ivrs_dev->block_ats &&
> >>> iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> >>> pci_ats_device(iommu->seg, bus, pdev->devfn)
> >>>
> >>> pci_device_ats_capable()? or some such.
> >>
> >> I was pondering that, yes (iirc already once when adding block_ats).
> >> Problem is the name. "capable" isn't quite right when considering
> >> the tristate opt_ats. And pci_device_may_use_ats() reads, well,
> >> clumsy to me. If you have any good idea for a name that's fully
> >> applicable and not odd or overly long, I can certainly introduce
> >> such a helper.
> > 
> > But if ATS is soft-disabled (-1) or hard disabled (0), it's fine to
> > consider the devices as not ATS capable for the context here?
> 
> I don't like mixing capability and policy aspects into a resulting
> "capable".

IMO we should prefer avoiding code repetition, even if at the cost
of having a handler that have a maybe not ideal naming, but I can't
force you to do that.

Thanks, Roger.

