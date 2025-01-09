Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6822DA074E1
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 12:39:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868256.1279790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqsX-00013t-84; Thu, 09 Jan 2025 11:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868256.1279790; Thu, 09 Jan 2025 11:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqsX-00011R-4f; Thu, 09 Jan 2025 11:39:09 +0000
Received: by outflank-mailman (input) for mailman id 868256;
 Thu, 09 Jan 2025 11:39:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L5Ho=UB=bounce.vates.tech=bounce-md_30504962.677fb558.v1-5baddbac78034d9b9528adcbd1fb4e16@srs-se1.protection.inumbo.net>)
 id 1tVqsW-0000Vv-2V
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 11:39:08 +0000
Received: from mail134-8.atl141.mandrillapp.com
 (mail134-8.atl141.mandrillapp.com [198.2.134.8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54cfc87e-ce7e-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 12:39:06 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-8.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4YTN944dvqz3sNF3J
 for <xen-devel@lists.xenproject.org>; Thu,  9 Jan 2025 11:39:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5baddbac78034d9b9528adcbd1fb4e16; Thu, 09 Jan 2025 11:39:04 +0000
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
X-Inumbo-ID: 54cfc87e-ce7e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736422744; x=1736683244;
	bh=GB2IXALSZwQ6L6N+NFfbr5YEU5a2ocAWK0V0XWGm/NA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ffX7gGRNQcD6akYmPZUh+Y6LdE7e5B/jopVosLvI+7ms0MeAmEAMYt+sbvfpgFHHk
	 zkZnsdxt7kRjRfpT4HYKdEWDlaVap/wjxlUantX4buy72+nIuE47DM3MoRyGBGI1cy
	 HWyK06Z8nn1iXp9bQGx92zMvK7CP0BoPfQJy4ZSsjoctaW5J/rCvXE1Mic6Hm9FO/q
	 9YFsg512rd/wPlr+sFM4ZuxXcJ3C/w+wYfu8D6O+cZgTtbAbRFhLg9uVRay02b/owB
	 33f8IvjEPY1PGgw+/swRoQlwKQdTT+rgegpLEm0Dqo1JR11FSQgKtpaSsMosxPWUED
	 vfFwSL+2WKZxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736422744; x=1736683244; i=teddy.astie@vates.tech;
	bh=GB2IXALSZwQ6L6N+NFfbr5YEU5a2ocAWK0V0XWGm/NA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yNU2irGYiGTdFhVGndScrLK2LU4Szo1OeP8wEIpb3cIYSBAKpyCTeARmCZpCXj+8p
	 5HiQ0wCC5Q0PMRd+j1yaDD24Uazb14jAnDgrOaDslkbH1/ad//qmsjYh7eRGpl2jeY
	 fgn0G7adN74He2AHYZTrhBlJ9xcNcPsUWBzQTPtZVsTjOKxFfOsGdzykZe3UOltqVE
	 fCBD82M6aDbC80oyqmH/LkjpoRBm+s3up9iwqjhMlF41DvSkhpC/V2kMP99gFDnl9E
	 AdCIf0qi++aUSwT6Y4vJNquPKetVmU1/FvTypuOv8aDYgvreRjc4hnykyJr8/MWtpj
	 vonn6B1putm5g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20RFC=20PATCH=20v4=200/5]=20IOMMU=20subsystem=20redesign=20and=20PV-IOMMU=20interface?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736422742651
Message-Id: <c0b9fbdb-87db-4f31-8069-0c2d1c4ad4cd@vates.tech>
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Lukasz Hawrylko" <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Mateusz=20M=C3=B3wka?=" <mateusz.mowka@intel.com>
References: <cover.1730718102.git.teddy.astie@vates.tech> <Z38-y9xR-6C_sARJ@mail-itl>
In-Reply-To: <Z38-y9xR-6C_sARJ@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5baddbac78034d9b9528adcbd1fb4e16?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250109:md
Date: Thu, 09 Jan 2025 11:39:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Thanks for your review.

> Hi,
> 
> I finally got time to try this revision (sorry it took so long!). My
> goal was to test it this time with some HVM domU too. I didn't get very
> far...
> 
> Issues I hit:
> 
> 1. AMD IOMMU driver is not converted (fails to build), for now disabled
>     CONFIG_AMD_IOMMU.

I haven't really worked on the AMD-Vi code yet. I have plans for it but 
there is some specific bits to deal with (especially regarding interrupt 
remapping), that I planned to discuss especially during the Xen Project 
Winter Summit 2025.

> 2. PV shim build fails (linker fails to find p2m_add_identity_entry
>     symbol referenced from iommu.c)

I haven't considered PV shim yet, so I am not really surprised that 
there are some issues with it. We probably want to expose some PV-IOMMU 
features for PV guests under PV shim, but it probably needs some 
specific code for it.

> 3. Xen complains on boot about missing endbr64 (surprisingly, it didn't
>     exploded):
> 
>      (XEN) alt table ffff82d0404234d8 -> ffff82d040432d82
>      (XEN) altcall iommu_get_max_iova+0x11/0x30 dest iommu.c#intel_iommu_get_max_iova has no endbr64
>      (XEN) altcall context.c#iommu_reattach_phantom+0x30/0x50 dest iommu.c#intel_iommu_add_devfn has no endbr64
>      (XEN) altcall context.c#iommu_detach_phantom+0x25/0x40 dest iommu.c#intel_iommu_remove_devfn has no endbr64
>      (XEN) altcall iommu_context_init+0x27/0x40 dest iommu.c#intel_iommu_context_init has no endbr64
>      (XEN) altcall iommu_attach_context+0x3c/0xd0 dest iommu.c#intel_iommu_attach has no endbr64
>      (XEN) altcall context.c#iommu_attach_context.cold+0x1d/0x53 dest iommu.c#intel_iommu_detach has no endbr64
>      (XEN) altcall iommu_detach_context+0x37/0xa0 dest iommu.c#intel_iommu_detach has no endbr64
>      (XEN) altcall iommu_reattach_context+0x95/0x240 dest iommu.c#intel_iommu_reattach has no endbr64
>      (XEN) altcall context.c#iommu_reattach_context.cold+0x29/0x110 dest iommu.c#intel_iommu_reattach has no endbr64
>      (XEN) altcall iommu_context_teardown+0x3f/0xa0 dest iommu.c#intel_iommu_context_teardown has no endbr64
>      (XEN) altcall pci.c#deassign_device+0x99/0x270 dest iommu.c#intel_iommu_add_devfn has no endbr64
> 

I also see that, but I am not sure what I need to do to fix it.

> 4. Starting a HVM domU with PCI device fails with:
> 
>      libxl: libxl_pci.c:1552:pci_add_dm_done: Domain 1:xc_assign_device failed: No space left on device
>      libxl: libxl_pci.c:1875:device_pci_add_done: Domain 1:libxl__device_pci_add failed for PCI device 0:aa:0.0 (rc -3)
>      libxl: libxl_create.c:2061:domcreate_attach_devices: Domain 1:unable to add pci devices
> > I didn't change anything in the toolstack - maybe default context needs
> to be initialized somehow? But the docs suggest the default context
> should work out of the box. On the other hand, changelog for v4 says
> some parts are moved to the toolstack, but I don't see any changes in
> tools/ in this series...
> 

I only tried stuff inside Dom0, but I haven't really tried passing 
through a device. I think I missed some step regarding quarantine domain 
initialization, which is probably why you have "-ENOSPC" here. You can 
try in the meantime to set "quarantine=0" to disable this part to see if 
it progresses further.

I will plan to do some testing on usual PCI passthrough to see if there 
are issues there.

> FWIW The exact version I tried is this (this series, on top of staging +
> qubes patches):
> https://github.com/QubesOS/qubes-vmm-xen/pull/200
> At this stage, dom0 kernel didn't have PV-IOMMU driver included yet.
> 
> Full Xen log, with some debug info collected:
> https://gist.github.com/marmarek/e7ac2571df033c7181bf03f21aa5f9ab
> 

Thanks
Teddy



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

