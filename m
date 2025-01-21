Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2536AA17E3A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 14:00:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875422.1285864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taDrA-0001xu-KP; Tue, 21 Jan 2025 12:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875422.1285864; Tue, 21 Jan 2025 12:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taDrA-0001wQ-Ha; Tue, 21 Jan 2025 12:59:48 +0000
Received: by outflank-mailman (input) for mailman id 875422;
 Tue, 21 Jan 2025 12:59:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jEc5=UN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1taDr9-0001wK-Gn
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 12:59:47 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9664e1c8-d7f7-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 13:59:45 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab2e308a99bso1162453566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 04:59:45 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384ce2295sm759220466b.64.2025.01.21.04.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 04:59:44 -0800 (PST)
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
X-Inumbo-ID: 9664e1c8-d7f7-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737464385; x=1738069185; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yYbG1mnwBwoO1fMs1J6m/ZrdDQNxIQ0sdrUC4ehUK/w=;
        b=hoaXvtoh/l6GcVJ/q/cMA4GGJFi4NSfXLkpQIdo1orbrfiZ4rrdCHeqjNschGVxmbU
         8YNTQlY7DIhnHbiNt+tPz2UbWM1xXSBRfwTAuncBmchzXGRiXRo42N+SzeG6j6pxH8Zn
         H5PlNPmyrvM/z0Xst/AOAXd4nIknXbPMm4SiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737464385; x=1738069185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYbG1mnwBwoO1fMs1J6m/ZrdDQNxIQ0sdrUC4ehUK/w=;
        b=scZXSy7snk8i+/DE4cBNy1aUIr1y/Ax7uEwhz6zUXG7b3srrsP5tRBQWCme9kf/RSn
         46EFD1rEjcqDSKw3qKq1NrkWE8fEVdzG9ibS9rNgGRyT0UR0+DgZ/oQKJ71IgEEsdIrF
         Fve/1Ty0fE3YjaHbCagzb2c9ZfQmy4k28ND0KUw7uAx0Ez6E7vC5kYaLAcwL142bp1gE
         K8YHm7rzcN2nfodbFJPYoML3IsLGTLHeKrj6rWLHM57mBxnGg33sEm4FgmppEr72n4X8
         I4EN5L26T/HofJ97iqzOWhgsgBBAgfOuQq00rL19HKv7oh3/P8A2ztk1HWV6VIrrigE8
         mrpA==
X-Forwarded-Encrypted: i=1; AJvYcCWg9nMDQNbSe5dxnBheXQVa9jRn68SZ1Y7Iu0R5Ee6igFTQMxwfHS3PXVrIcnmr7NVk/EqnQtMY1mk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmGTIGS5PszqP+MWMYrvT4Do3vFzCv0DQuiOIWK5aDy7I8y4LY
	CXbwjzJbwBodf2TsVmTy/494e7jRAhehu0iUdMS7O05AIsubU2byDSzLWlfeqRs=
X-Gm-Gg: ASbGnctuj25a21LwyS7mIpPbfZfo1fIVPetNooZ444xXxSMX+6nuttibt0w80jpERlL
	LEKZHxb/zxq0kdeZBs8hLiyhchl9mIxEPI6XhIi2BpEXjWYDu6epgHfzpLvHGNZPhVj4CFXC6HN
	OMnfR/BW+gaAoXWIGr/md3oZ2mezweXHeYY9zG/voFP0ompfuXziu2RtZcfgA4d7t3Hp4ALwf+R
	YPrElqx1iCZAe3QIK3PEOTDRcVBjcjigXr/f3tW6LQDcmZ/MRxhZJr3ZmTigBV6GxpXlM4cB7k=
X-Google-Smtp-Source: AGHT+IGUDKYXpqQYnT9OkILoYpDC7XluPZv2Uu7/XCHA3FA71ofupfDZOrPYO5gzyG5h6rHAH90SpQ==
X-Received: by 2002:a17:907:6e8e:b0:ab3:4d1e:4606 with SMTP id a640c23a62f3a-ab38cbaa4d8mr1589695366b.3.1737464384524;
        Tue, 21 Jan 2025 04:59:44 -0800 (PST)
Date: Tue, 21 Jan 2025 13:59:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v5 1/3] x86/iommu: Disable IOMMU if cx16 isn't
 supported
Message-ID: <Z4-aPzCoegbp5T19@macbook.local>
References: <cover.1713433029.git.teddy.astie@vates.tech>
 <4656eab84f7b4b807fc61f54b9ba5c0fc4fae64d.1713433029.git.teddy.astie@vates.tech>
 <8cab0372-8c40-4648-bdbe-ff56844f289d@suse.com>
 <Z4-AbI2oKWCR5bws@macbook.local>
 <885982e1-fb1b-4b6a-a0bf-2251e5d9acf1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <885982e1-fb1b-4b6a-a0bf-2251e5d9acf1@suse.com>

On Tue, Jan 21, 2025 at 12:20:17PM +0100, Jan Beulich wrote:
> On 21.01.2025 12:09, Roger Pau Monné wrote:
> > On Wed, Apr 24, 2024 at 04:27:10PM +0200, Jan Beulich wrote:
> >> On 18.04.2024 13:57, Teddy Astie wrote:
> >>> All hardware with VT-d/AMD-Vi has CMPXCHG16B support. Check this at
> >>> initialisation time, and remove the effectively-dead logic for the
> >>> non-cx16 case.
> >>
> >> As before: What about Xen itself running virtualized, and the underlying
> >> hypervisor surfacing an IOMMU but not CX16? It may be okay to ignore the
> >> IOMMU in such an event, but by not mentioning the case you give the
> >> appearance of not having considered it at all.
> >>
> >>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> >>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> >>> @@ -305,6 +305,12 @@ static int __init cf_check iov_detect(void)
> >>>      if ( !iommu_enable && !iommu_intremap )
> >>>          return 0;
> >>>  
> >>> +    if ( unlikely(!cpu_has_cx16) )
> >>> +    {
> >>> +        printk("AMD-Vi: CPU doesn't support CMPXCHG16B, disabling\n");
> >>> +        return -ENODEV;
> >>> +    }
> >>> +
> >>>      if ( (init_done ? amd_iommu_init_late()
> >>>                      : amd_iommu_init(false)) != 0 )
> >>>      {
> >>
> >> I did previously point out (and that's even visible in patch context here)
> >> that the per-vendor .setup() hooks aren't necessarily the first thing to
> >> run. Please can you make sure you address (verbally or by code) prior to
> >> submitting new versions?
> > 
> > I've re-visiting this as part of my other IOMMU IRTE atomic update
> > fix.
> > 
> > Would you prefer the check for CX16 be in the common x86
> > iommu_hardware_setup()?  That would be kind of layering violation, as
> > in principle a further IOMMU implementation on x86 might not require
> > CX16.  However I find it very unlikely, and hence I would be fine in
> > placing the check in iommu_hardware_setup() if you prefer it there.
> 
> No. The check needs replicating into the other hook that may run first,
> ->supports_x2apic(). And the ->enable_x2apic() hooks may want to gain
> respective assertions then.

Oh, I see.  So you either want patch 3 ahead of this, or both patches
merged into a single one.

Thanks, Roger.

