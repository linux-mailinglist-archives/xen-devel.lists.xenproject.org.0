Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32750AAD5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 23:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310473.527330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nheT4-0007g0-GZ; Thu, 21 Apr 2022 21:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310473.527330; Thu, 21 Apr 2022 21:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nheT4-0007ds-CN; Thu, 21 Apr 2022 21:36:02 +0000
Received: by outflank-mailman (input) for mailman id 310473;
 Thu, 21 Apr 2022 21:36:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nheT2-0007dm-DV
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 21:36:00 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 080406e3-c1bb-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 23:35:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 58800B82970;
 Thu, 21 Apr 2022 21:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0C2C385A7;
 Thu, 21 Apr 2022 21:35:55 +0000 (UTC)
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
X-Inumbo-ID: 080406e3-c1bb-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650576956;
	bh=yXB4mQK4iaZ2rCsosmZLTLjlMBo2v1CK80qV0ZcfujI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o3DJitXgswCZQbbk3JfpP8rXuwPW7tYpiUNH8IXKg398s2xQPolGhkQ0w4dOblcQA
	 2qxsHbix79le9SC35/WErytfU9+z4ug/vTxOfWtRdcn0tpuAfbDN67mG5fS+cUdKB5
	 BHO7/3J47AhKDpb+7Y3ft+zZRkTf/7bi1ESkP9ljgmwYHn1KXqwpz0MA2A1gm3V2tT
	 4DuJK+tNzpgsHVyJTtmO9XugL2ARkoyGLva9/f85tzv2Y2KKR2a8a1xSVwZLLXN5f/
	 VUozOXByubZhWGchT2q3xNe3bxHAuRyzK6wZ7j4n5x3TTbWEolnACtSWblEE3O+ZlF
	 vOxhd7SPe7B2A==
Date: Thu, 21 Apr 2022 14:35:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, nd@arm.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 03/10] xen/arm: add CONFIG_ARM_EFI to stub EFI API
In-Reply-To: <265745cb-40f4-22d8-8c85-ffc89b2baf04@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204211435460.915916@ubuntu-linux-20-04-desktop>
References: <20220418090735.3940393-1-wei.chen@arm.com> <20220418090735.3940393-4-wei.chen@arm.com> <alpine.DEB.2.22.394.2204201724430.915916@ubuntu-linux-20-04-desktop> <265745cb-40f4-22d8-8c85-ffc89b2baf04@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Apr 2022, Wei Chen wrote:
> Hi Stefano,
> 
> On 2022/4/21 8:25, Stefano Stabellini wrote:
> > On Mon, 18 Apr 2022, Wei Chen wrote:
> > > x86 is using compiler feature testing to decide EFI
> > > build enable or not. When EFI build is disabled, x86
> > > will use a efi/stub.c file to replace efi/runtime.c
> > > for build objects. Following this idea, we introduce
> > > a stub file for Arm, but use CONFIG_ARM_EFI to decide
> > > EFI build enable or not.
> > > 
> > > Signed-off-by: Wei Chen <wei.chen@arm.com>
> > > ---
> > > v1 -> v2:
> > > 1. Use CONFIG_ARM_EFI to replace CONFIG_EFI
> > > 2. Remove help text and make CONFIG_ARM_EFI invisible.
> > > 3. Merge one following patch:
> > >     xen/arm: introduce a stub file for non-EFI architectures
> > > 4. Use the common stub.c instead of creating new one.
> > > ---
> > >   xen/arch/arm/Kconfig      | 5 +++++
> > >   xen/arch/arm/Makefile     | 2 +-
> > >   xen/arch/arm/efi/Makefile | 5 +++++
> > >   3 files changed, 11 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > index ecfa6822e4..5f1b0121b0 100644
> > > --- a/xen/arch/arm/Kconfig
> > > +++ b/xen/arch/arm/Kconfig
> > > @@ -6,6 +6,7 @@ config ARM_64
> > >   	def_bool y
> > >   	depends on !ARM_32
> > >   	select 64BIT
> > > +	select ARM_EFI
> > >   	select HAS_FAST_MULTIPLY
> > >     config ARM
> > > @@ -33,6 +34,10 @@ config ACPI
> > >   	  Advanced Configuration and Power Interface (ACPI) support for Xen is
> > >   	  an alternative to device tree on ARM64.
> > >   +config ARM_EFI
> > > +	bool
> > > +	depends on ARM_64
> > 
> > As ARM_EFI is selected by ARM_64 and it cannot be enable via a menu (it
> > is hidden) there is no need for the "depends" line here
> > 
> 
> Ok, I will remove it.
> 
> > 
> > >   config GICV3
> > >   	bool "GICv3 driver"
> > >   	depends on ARM_64 && !NEW_VGIC
> > > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > > index 1d862351d1..bb7a6151c1 100644
> > > --- a/xen/arch/arm/Makefile
> > > +++ b/xen/arch/arm/Makefile
> > > @@ -1,6 +1,5 @@
> > >   obj-$(CONFIG_ARM_32) += arm32/
> > >   obj-$(CONFIG_ARM_64) += arm64/
> > > -obj-$(CONFIG_ARM_64) += efi/
> > >   obj-$(CONFIG_ACPI) += acpi/
> > >   obj-$(CONFIG_HAS_PCI) += pci/
> > >   ifneq ($(CONFIG_NO_PLAT),y)
> > > @@ -20,6 +19,7 @@ obj-y += domain.o
> > >   obj-y += domain_build.init.o
> > >   obj-y += domctl.o
> > >   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
> > > +obj-y += efi/
> > >   obj-y += gic.o
> > >   obj-y += gic-v2.o
> > >   obj-$(CONFIG_GICV3) += gic-v3.o
> > > diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
> > > index 4313c39066..75ef180233 100644
> > > --- a/xen/arch/arm/efi/Makefile
> > > +++ b/xen/arch/arm/efi/Makefile
> > > @@ -1,4 +1,9 @@
> > >   include $(srctree)/common/efi/efi-common.mk
> > >   +ifeq ($(CONFIG_ARM_EFI),y)
> > >   obj-y += $(EFIOBJ-y)
> > >   obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
> > > +else
> > > +EFIOBJ-y += stub.o
> > > +obj-y += stub.o
> > 
> > The change to EFIOBJ-y is not needed here as EFIOBJ-y is not used.
> > Only obj-y += stub.o should be enough
> > 
> 
> I add stub.o to EFIOBJ-y that's because I want to use the clean-files
> in efi-common.mk. Otherwise the link of stub.c in arm/efi will not
> be cleaned in "make clean".

I see. Makes sense.

