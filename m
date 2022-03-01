Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A374D4C9972
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 00:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281866.480391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPC5F-0005Vx-0t; Tue, 01 Mar 2022 23:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281866.480391; Tue, 01 Mar 2022 23:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPC5E-0005U5-T2; Tue, 01 Mar 2022 23:39:08 +0000
Received: by outflank-mailman (input) for mailman id 281866;
 Tue, 01 Mar 2022 23:39:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fFui=TM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nPC5C-0005Tz-LQ
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 23:39:06 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c67c8ccf-99b8-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 00:39:02 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C988B81E9D;
 Tue,  1 Mar 2022 23:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE21C340EE;
 Tue,  1 Mar 2022 23:38:59 +0000 (UTC)
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
X-Inumbo-ID: c67c8ccf-99b8-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646177940;
	bh=a2y6xAFIOwCSjNYbPnSQHd9gSgww/81hSTr9siF2xhM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mjU+egZsXUNWk+KWaUHasjtpGCGb09OXqlPk5qt1FNDJ02cYF9LHo1wtZdeccd43x
	 lFCWj4Z+N0HVsokoxSXQmdYsmgNXGZx3zfXtQKkVxRYL6rFLdaIaFGftUQhTW+3rjY
	 mzDQxGXIaHro1yiKDpd2f1BshphCCkTIXsVr2mMwLM8jOTMF/+KKVBlnbEfw61HecN
	 y+GHBux85NrcFA97a5nqbIPS24n3/oJiEpocZU15EiPWxxXsAQjs/lU+ludlPps1MX
	 rlENSdDMvWi7Nl593JNwZg3Z2FVS4vB7y0CGh1rU47GoZiZ7vMMNUgWHwojFQeTlmG
	 f0X76oF1dauDw==
Date: Tue, 1 Mar 2022 15:38:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Penny Zheng <Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>, 
    nd <nd@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
In-Reply-To: <PAXPR08MB742081D5E3C94801350C4A739E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2203011455500.3261@ubuntu-linux-20-04-desktop>
References: <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com> <alpine.DEB.2.22.394.2202241606450.239973@ubuntu-linux-20-04-desktop> <AS1PR08MB74269923288B75097392BDD99E3E9@AS1PR08MB7426.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202251214210.239973@ubuntu-linux-20-04-desktop> <PAXPR08MB742081D5E3C94801350C4A739E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1877311929-1646175755=:3261"
Content-ID: <alpine.DEB.2.22.394.2203011505530.3261@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1877311929-1646175755=:3261
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2203011505531.3261@ubuntu-linux-20-04-desktop>

On Tue, 1 Mar 2022, Wei Chen wrote:
> > On Fri, 25 Feb 2022, Wei Chen wrote:
> > > > Hi Wei,
> > > >
> > > > This is extremely exciting, thanks for the very nice summary!
> > > >
> > > >
> > > > On Thu, 24 Feb 2022, Wei Chen wrote:
> > > > > # Proposal for Porting Xen to Armv8-R64
> > > > >
> > > > > This proposal will introduce the PoC work of porting Xen to Armv8-
> > R64,
> > > > > which includes:
> > > > > - The changes of current Xen capability, like Xen build system,
> > memory
> > > > >   management, domain management, vCPU context switch.
> > > > > - The expanded Xen capability, like static-allocation and direct-map.
> > > > >
> > > > > ***Notes:***
> > > > > 1. ***This proposal only covers the work of porting Xen to Armv8-
> > R64***
> > > > >    ***single CPU. Xen SMP support on Armv8-R64 relates to Armv8-R***
> > > > >    ***Trusted-Frimware (TF-R). This is an external dependency,***
> > > > >    ***so we think the discussion of Xen SMP support on Armv8-R64***
> > > > >    ***should be started when single-CPU support is complete.***
> > > > > 2. ***This proposal will not touch xen-tools. In current stage,***
> > > > >    ***Xen on Armv8-R64 only support dom0less, all guests should***
> > > > >    ***be booted from device tree.***
> > > > >
> > > > > ## 1. Essential Background
> > > > >
> > > > > ### 1.1. Armv8-R64 Profile
> > > > > The Armv-R architecture profile was designed to support use cases
> > that
> > > > > have a high sensitivity to deterministic execution. (e.g. Fuel
> > Injection,
> > > > > Brake control, Drive trains, Motor control etc)
> > > > >
> > > > > Arm announced Armv8-R in 2013, it is the latest generation Arm
> > > > architecture
> > > > > targeted at the Real-time profile. It introduces virtualization at
> > the
> > > > highest
> > > > > security level while retaining the Protected Memory System
> > Architecture
> > > > (PMSA)
> > > > > based on a Memory Protection Unit (MPU). In 2020, Arm announced
> > Cortex-
> > > > R82,
> > > > > which is the first Arm 64-bit Cortex-R processor based on Armv8-R64.
> > > > >
> > > > > - The latest Armv8-R64 document can be found here:
> > > > >   [Arm Architecture Reference Manual Supplement - Armv8, for Armv8-R
> > > > AArch64 architecture
> > > > profile](https://developer.arm.com/documentation/ddi0600/latest/).
> > > > >
> > > > > - Armv-R Architecture progression:
> > > > >   Armv7-R -> Armv8-R AArch32 -> Armv8 AArch64
> > > > >   The following figure is a simple comparison of "R" processors
> > based on
> > > > >   different Armv-R Architectures.
> > > > >   ![image](https://drive.google.com/uc?export=view&id=1nE5RAXaX8zY2K
> > PZ8i
> > > > mBpbvIr2eqBguEB)
> > > > >
> > > > > - The Armv8-R architecture evolved additional features on top of
> > Armv7-R:
> > > > >     - An exception model that is compatible with the Armv8-A model
> > > > >     - Virtualization with support for guest operating systems
> > > > >         - PMSA virtualization using MPUs In EL2.
> > > > > - The new features of Armv8-R64 architecture
> > > > >     - Adds support for the 64-bit A64 instruction set, previously
> > Armv8-
> > > > R
> > > > >       only supported A32.
> > > > >     - Supports up to 48-bit physical addressing, previously up to
> > 32-bit
> > > > >       addressing was supported.
> > > > >     - Optional Arm Neon technology and Advanced SIMD
> > > > >     - Supports three Exception Levels (ELs)
> > > > >         - Secure EL2 - The Highest Privilege, MPU only, for firmware,
> > > > hypervisor
> > > > >         - Secure EL1 - RichOS (MMU) or RTOS (MPU)
> > > > >         - Secure EL0 - Application Workloads
> > > > >     - Optionally supports Virtual Memory System Architecture at S-
> > EL1/S-
> > > > EL0.
> > > > >       This means it's possible to run rich OS kernels - like Linux -
> > > > either
> > > > >       bare-metal or as a guest.
> > > > > - Differences with the Armv8-A AArch64 architecture
> > > > >     - Supports only a single Security state - Secure. There is not
> > Non-
> > > > Secure
> > > > >       execution state supported.
> > > > >     - EL3 is not supported, EL2 is mandatory. This means secure EL2
> > is
> > > > the
> > > > >       highest EL.
> > > > >     - Supports the A64 ISA instruction
> > > > >         - With a small set of well-defined differences
> > > > >     - Provides a PMSA (Protected Memory System Architecture) based
> > > > >       virtualization model.
> > > > >         - As opposed to Armv8-A AArch64's VMSA based Virtualization
> > > > >         - Can support address bits up to 52 if FEAT_LPA is enabled,
> > > > >           otherwise 48 bits.
> > > > >         - Determines the access permissions and memory attributes of
> > > > >           the target PA.
> > > > >         - Can implement PMSAv8-64 at EL1 and EL2
> > > > >             - Address translation flat-maps the VA to the PA for EL2
> > > > Stage 1.
> > > > >             - Address translation flat-maps the VA to the PA for EL1
> > > > Stage 1.
> > > > >             - Address translation flat-maps the IPA to the PA for
> > EL1
> > > > Stage 2.
> > > > >     - PMSA in EL1 & EL2 is configurable, VMSA in EL1 is configurable.
> > > > >
> > > > > ### 1.2. Xen Challenges with PMSA Virtualization
> > > > > Xen is PMSA unaware Type-1 Hypervisor, it will need modifications to
> > run
> > > > > with an MPU and host multiple guest OSes.
> > > > >
> > > > > - No MMU at EL2:
> > > > >     - No EL2 Stage 1 address translation
> > > > >         - Xen provides fixed ARM64 virtual memory layout as basis of
> > EL2
> > > > >           stage 1 address translation, which is not applicable on
> > MPU
> > > > system,
> > > > >           where there is no virtual addressing. As a result, any
> > > > operation
> > > > >           involving transition from PA to VA, like ioremap, needs
> > > > modification
> > > > >           on MPU system.
> > > > >     - Xen's run-time addresses are the same as the link time
> > addresses.
> > > > >         - Enable PIC (position-independent code) on a real-time
> > target
> > > > >           processor probably very rare.
> > > > >     - Xen will need to use the EL2 MPU memory region descriptors to
> > > > manage
> > > > >       access permissions and attributes for accesses made by VMs at
> > > > EL1/0.
> > > > >         - Xen currently relies on MMU EL1 stage 2 table to manage
> > these
> > > > >           accesses.
> > > > > - No MMU Stage 2 translation at EL1:
> > > > >     - A guest doesn't have an independent guest physical address
> > space
> > > > >     - A guest can not reuse the current Intermediate Physical
> > Address
> > > > >       memory layout
> > > > >     - A guest uses physical addresses to access memory and devices
> > > > >     - The MPU at EL2 manages EL1 stage 2 access permissions and
> > > > attributes
> > > > > - There are a limited number of MPU protection regions at both EL2
> > and
> > > > EL1:
> > > > >     - Architecturally, the maximum number of protection regions is
> > 256,
> > > > >       typical implementations have 32.
> > > > >     - By contrast, Xen does not need to consider the number of page
> > > > table
> > > > >       entries in theory when using MMU.
> > > > > - The MPU protection regions at EL2 need to be shared between the
> > > > hypervisor
> > > > >   and the guest stage 2.
> > > > >     - Requires careful consideration - may impact feature 'fullness'
> > of
> > > > both
> > > > >       the hypervisor and the guest
> > > > >     - By contrast, when using MMU, Xen has standalone P2M table for
> > > > guest
> > > > >       stage 2 accesses.
> > > > >
> > > > > ## 2. Proposed changes of Xen
> > > > > ### **2.1. Changes of build system:**
> > > > >
> > > > > - ***Introduce new Kconfig options for Armv8-R64***:
> > > > >   Unlike Armv8-A, because lack of MMU support on Armv8-R64, we may
> > not
> > > > >   expect one Xen binary to run on all machines. Xen images are not
> > > > common
> > > > >   across Armv8-R64 platforms. Xen must be re-built for different
> > Armv8-
> > > > R64
> > > > >   platforms. Because these platforms may have different memory
> > layout
> > > > and
> > > > >   link address.
> > > > >     - `ARM64_V8R`:
> > > > >       This option enables Armv8-R profile for Arm64. Enabling this
> > > > option
> > > > >       results in selecting MPU. This Kconfig option is used to gate
> > some
> > > > >       Armv8-R64 specific code except MPU code, like some code for
> > Armv8-
> > > > R64
> > > > >       only system ID registers access.
> > > > >
> > > > >     - `ARM_MPU`
> > > > >       This option enables MPU on ARMv8-R architecture. Enabling this
> > > > option
> > > > >       results in disabling MMU. This Kconfig option is used to gate
> > some
> > > > >       ARM_MPU specific code. Once when this Kconfig option has been
> > > > enabled,
> > > > >       the MMU relate code will not be built for Armv8-R64. The
> > reason
> > > > why
> > > > >       not depends on runtime detection to select MMU or MPU is that,
> > we
> > > > don't
> > > > >       think we can use one image for both Armv8-R64 and Armv8-A64.
> > > > Another
> > > > >       reason that we separate MPU and V8R in provision to allow to
> > > > support MPU
> > > > >       on 32bit Arm one day.
> > > > >
> > > > >     - `XEN_START_ADDRESS`
> > > > >       This option allows to set the custom address at which Xen will
> > be
> > > > >       linked. This address must be aligned to a page size. Xen's
> > run-
> > > > time
> > > > >       addresses are the same as the link time addresses. Different
> > > > platforms
> > > > >       may have differnt memory layout. This Kconfig option provides
> > > > users
> > > > >       the ability to select proper link addresses for their boards.
> > > > >       ***Notes: Fixed link address means the Xen binary could not
> > be***
> > > > >       ***relocated by EFI loader. So in current stage, Xen could
> > not***
> > > > >       ***be launched as an EFI application on Armv8-R64.***
> > > > >
> > > > >     - `ARM_MPU_NORMAL_MEMORY_START` and `ARM_MPU_NORMAL_MEMORY_END`
> > > > >       `ARM_MPU_DEVICE_MEMORY_START` and `ARM_MPU_DEVICE_MEMORY_END`
> > > > >       These Kconfig options allow to set memory regions for Xen code,
> > > > data
> > > > >       and device memory. Before parsing memory information from
> > device
> > > > tree,
> > > > >       Xen will use the values that stored in these options to setup
> > > > boot-time
> > > > >       MPU configuration. Why we need a boot-time MPU configuration?
> > > > >       1. More deterministic: Arm MPU supports background regions,
> > > > >          if we don't configure the MPU regions and don't enable MPU.
> > > > >          We can enable MPU background regions. But that means all
> > RAM
> > > > >          is RWX. Random values in RAM or maliciously embedded data
> > can
> > > > >          be exploited. Using these Kconfig options allow users to
> > have
> > > > >          a deterministic RAM area to execute code.
> > > > >       2. More compatible: On some Armv8-R64 platforms, if the MPU is
> > > > >          disabled, the `dc zva` instruction will make the system
> > halt.
> > > > >          And this instruction will be embedded in some built-in
> > > > functions,
> > > > >          like `memory set`. If we use `-ddont_use_dc` to rebuild GCC,
> > > > >          the built-in functions will not contain `dc zva`. However,
> > it
> > > > is
> > > > >          obviously unlikely that we will be able to recompile all
> > GCC
> > > > >          for ARMv8-R64.
> > > > >       3. One optional idea:
> > > > >           We can map `XEN_START_ADDRESS` to `XEN_START_ADDRESS +
> > 2MB` or
> > > > >           `XEN_START_ADDRESS` to `XEN_START_ADDRESS + image_end` for
> > > > >           MPU normal memory. It's enough to support Xen run in boot
> > time.
> > > >
> > > > I can imagine that we need to have a different Xen build for each
> > > > ARMv8-R platform. Do you envision that XEN_START_ADDRESS and
> > > > ARM_MPU_*_MEMORY_START/END are preconfigured based on the platform
> > > > choice at build time? I don't think we want a user to provide all of
> > > > those addresses by hand, right?
> > >
> > > Yes, this is in our TODO list. We want to reuse current arm/platforms
> > and
> > > Kconfig menu for Armv8-R.
> > 
> > OK, good
> > 
> > 
> > > > The next question is whether we could automatically generate
> > > > XEN_START_ADDRESS and ARM_MPU_*_MEMORY_START/END based on the platform
> > > > device tree at build time (at build time, not runtime). That would
> > > > make things a lot easier and it is also aligned with the way Zephyr
> > and
> > > > other RTOSes and baremetal apps work.
> > >
> > > It's a considerable option. But here we may encounter some problems need
> > > to be solved first:
> > > 1. Does CONFIG_DTB must be selected by default on Armv8-R? Without
> > firmware
> > >    or bootloader (like u-boot), we have to build DTB into Xen binary.
> > 
> > CONFIG_DTB should trigger runtime support for device tree, while here we
> > are talking about build time support for device tree. It is very
> > different.
> > 
> > Just to make an example, the whole build-time device tree could be
> > scanned by Makefiles and other scripts, leading to C header files
> > generations, but no code in Xen to parse device tree at all.
> > 
> > DTB ---> Makefiles/scripts ---> .h files ---> Makefiles/scripts ---> xen
> > 
> 
> Yes, this is feasible.
> 
> > 
> > I am not saying this is the best way to do it, I am only pointing out
> > that build-time device tree does not imply run-time device tree. Also,
> > it doesn't imply a DTB built-in the Xen binary (although that is also an
> > option).
> > 
> 
> I agree.
> 
> > The way many baremetal OSes and RTOSes work is that they take a DTB as
> > input to the build *only*. From the DTB, the build-time make system
> > generates #defines and header files that are imported in C.
> > 
> > The resulting RTOS binary doesn't need support for DTB, because all the
> > right addresses have already been provided as #define by the Make
> > system.
> > 
> > I don't think we need to go to the extreme of removing DTB support from
> > Xen on ARMv8-R. I am only saying that if we add build-time device tree
> > support it would make it easier to support multiple boards without
> > having to have platform files in Xen for each of them, and we can do
> > that without any impact on runtime device tree parsing.
> > 
> 
> As V8R's use cases maybe mainly focus on some real-time/critical scenarios,
> this may be a better method than platform files. We don't need to maintain
> the platform related definitions header files. Xen also can skip the some
> platform information parsing in boot time. This will increase the boot speed
> of Xen in real-time/critical scenarios.

+1


> > >    This
> > >    can guarantee build-time DTB is the same as runtime DTB. But
> > eventually,
> > >    we will have firmware and bootloader before Xen launch (as Arm EBBR's
> > >    requirement). In this case, we may not build DTB into Xen image. And
> > >    we can't guarantee build-time DTB is the same as runtime DTB.
> > 
> > As mentioned, if we have a build-time DTB we might not need a run-time
> > DTB. Secondly, I think it is entirely reasonable to expect that the
> > build-time DTB and the run-time DTB are the same.
> > 
> 
> Yes, if we implement in this way, we should describe it in limitation
> of v8r Xen.
> 
> > It is the same problem with platform files: we have to assume that the
> > information in the platform files matches the runtime DTB.
> > 
> 
> indeed.
> 
> > 
> > > 2. If build-time DTB is the same as runtime DTB, how can we determine
> > >    the XEN_START_ADDRESS in DTB describe memory range? Should we always
> > >    limit Xen to boot from lowest address? Or will we introduce some new
> > >    DT property to specify the Xen start address? I think this DT
> > property
> > >    also can solve above question#1.
> > 
> > The loading address should be automatically chosen by the build scripts.
> > We can do that now with ImageBuilder [1]: it selects a 2MB-aligned
> > address for each binary to load, one by one starting from a 2MB offset
> > from start of memory.
> > 
> > [1] https://gitlab.com/ViryaOS/imagebuilder/-/blob/master/scripts/uboot-
> > script-gen#L390
> > 
> > So the build scripts can select XEN_START_ADDRESS based on the
> > memory node information on the build-time device tree. And there should
> > be no need to add XEN_START_ADDRESS to the runtime device tree.
> > 
> 
> This is fine if there are no explicit restrictions on the platform.
> Some platform may reserve some memory area for something like firmware,
> But I think it's OK, in the worst case, we can hide this area from
> build DTB.
> 
> > 
> > > > The device tree can be given as input to the build system, and the
> > > > Makefiles would take care of generating XEN_START_ADDRESS and
> > > > ARM_MPU_*_MEMORY_START/END based on /memory and other interesting
> > nodes.
> > > >
> > >
> > > If we can solve above questions, yes, device tree is a good idea for
> > > XEN_START_ADDRESS. For ARM_MPU_NORMAL_MEMORY_*, we can get them from
> > > memory nodes, but for ARM_MPU_DEVICE_MEMORY_*, they are not easy for
> > > us to scan all devices' nodes. And it's very tricky, if the memory
> > > regions are interleaved. So in our current RFC code, we select to use
> > > the optional idea:
> > > We map `XEN_START_ADDRESS` to `XEN_START_ADDRESS + 2MB` for MPU normal
> > memory.
> > > But we use mpu,device-memory-section in DT for MPU device memory.
> > 
> > Keep in mind that we are talking about build-time scripts: it doesn't
> > matter if they are slow. We can scan the build-time dtb as many time as
> > needed and generate ARM_MPU_DEVICE_MEMORY_* as appropriate. It might
> > make "make xen" slower but runtime will be unaffected.
> > 
> > So, I don't think this is a problem.
> > 
> 
> OK.
> 
> > 
> > > > > - ***Define new system registers for compilers***:
> > > > >   Armv8-R64 is based on Armv8.4. That means we will use some Armv8.4
> > > > >   specific system registers. As Armv8-R64 only have secure state, so
> > > > >   at least, `VSTCR_EL2` and `VSCTLR_EL2` will be used for Xen. And
> > the
> > > > >   first GCC version that supports Armv8.4 is GCC 8.1. In addition to
> > > > >   these, PMSA of Armv8-R64 introduced lots of MPU related system
> > > > registers:
> > > > >   `PRBAR_ELx`, `PRBARx_ELx`, `PRLAR_ELx`, `PRLARx_ELx`, `PRENR_ELx`
> > and
> > > > >   `MPUIR_ELx`. But the first GCC version to support these system
> > > > registers
> > > > >   is GCC 11. So we have two ways to make compilers to work properly
> > with
> > > > >   these system registers.
> > > > >   1. Bump GCC version to GCC 11.
> > > > >      The pros of this method is that, we don't need to encode these
> > > > >      system registers in macros by ourselves. But the cons are that,
> > > > >      we have to update Makefiles to support GCC 11 for Armv8-R64.
> > > > >      1.1. Check the GCC version 11 for Armv8-R64.
> > > > >      1.2. Add march=armv8r to CFLAGS for Armv8-R64.
> > > > >      1.3. Solve the confliction of march=armv8r and mcpu=generic
> > > > >     These changes will affect common Makefiles, not only Arm
> > Makefiles.
> > > > >     And GCC 11 is new, lots of toolchains and Distro haven't
> > supported
> > > > it.
> > > > >
> > > > >   2. Encode new system registers in macros ***(preferred)***
> > > > >         ```
> > > > >         /* Virtualization Secure Translation Control Register */
> > > > >         #define VSTCR_EL2  S3_4_C2_C6_2
> > > > >         /* Virtualization System Control Register */
> > > > >         #define VSCTLR_EL2 S3_4_C2_C0_0
> > > > >         /* EL1 MPU Protection Region Base Address Register encode */
> > > > >         #define PRBAR_EL1  S3_0_C6_C8_0
> > > > >         ...
> > > > >         /* EL2 MPU Protection Region Base Address Register encode */
> > > > >         #define PRBAR_EL2  S3_4_C6_C8_0
> > > > >         ...
> > > > >         ```
> > > > >      If we encode all above system registers, we don't need to bump
> > GCC
> > > > >      version. And the common CFLAGS Xen is using still can be
> > applied to
> > > > >      Armv8-R64. We don't need to modify Makefiles to add specific
> > CFLAGS.
> > > >
> > > > I think that's fine and we did something similar with the original
> > ARMv7-A
> > > > port if I remember correctly.
> > > >
> > > >
> > > > > ### **2.2. Changes of the initialization process**
> > > > > In general, we still expect Armv8-R64 and Armv8-A64 to have a
> > consistent
> > > > > initialization process. In addition to some architecture differences,
> > > > there
> > > > > is no more than reusable code that we will distinguish through
> > > > CONFIG_ARM_MPU
> > > > > or CONFIG_ARM64_V8R. We want most of the initialization code to be
> > > > reusable
> > > > > between Armv8-R64 and Armv8-A64.
> > > >
> > > > +1
> > > >
> > > >
> > > > > - We will reuse the original head.s and setup.c of Arm. But replace
> > the
> > > > >   MMU and page table operations in these files with configuration
> > > > operations
> > > > >   for MPU and MPU regions.
> > > > >
> > > > > - We provide a boot-time MPU configuration. This MPU configuration
> > will
> > > > >   support Xen to finish its initialization. And this boot-time MPU
> > > > >   configuration will record the memory regions that will be parsed
> > from
> > > > >   device tree.
> > > > >
> > > > >   In the end of Xen initialization, we will use a runtime MPU
> > > > configuration
> > > > >   to replace boot-time MPU configuration. The runtime MPU
> > configuration
> > > > will
> > > > >   merge and reorder memory regions to save more MPU regions for
> > guests.
> > > > >   ![img](https://drive.google.com/uc?export=view&id=1wTFyK2XfU3lTlH1
> > PqRD
> > > > oacQVTwUtWIGU)
> > > > >
> > > > > - Defer system unpausing domain.
> > > > >   When Xen initialization is about to end, Xen unpause guests
> > created
> > > > >   during initialization. But this will cause some issues. The
> > unpause
> > > > >   action occurs before free_init_memory, however the runtime MPU
> > > > configuration
> > > > >   is built after free_init_memory.
> > > > >
> > > > >   So if the unpaused guests start executing the context switch at
> > this
> > > > >   point, then its MPU context will base on the boot-time MPU
> > > > configuration.
> > > > >   Probably it will be inconsistent with runtime MPU configuration,
> > this
> > > > >   will cause unexpected problems (This may not happen in a single
> > core
> > > > >   system, but on SMP systems, this problem is foreseeable, so we
> > hope to
> > > > >   solve it at the beginning).
> > > > >
> > > > > ### **2.3. Changes to reduce memory fragmentation**
> > > > >
> > > > > In general, memory in Xen system can be classified to 4 classes:
> > > > > `image sections`, `heap sections`, `guest RAM`, `boot modules (guest
> > > > Kernel,
> > > > > initrd and dtb)`
> > > > >
> > > > > Currently, Xen doesn't have any restriction for users how to
> > allocate
> > > > > memory for different classes. That means users can place boot
> > modules
> > > > > anywhere, can reserve Xen heap memory anywhere and can allocate
> > guest
> > > > > memory anywhere.
> > > > >
> > > > > In a VMSA system, this would not be too much of a problem, since the
> > > > > MMU can manage memory at a granularity of 4KB after all. But in a
> > > > > PMSA system, this will be a big problem. On Armv8-R64, the max MPU
> > > > > protection regions number has been limited to 256. But in typical
> > > > > processor implementations, few processors will design more than 32
> > > > > MPU protection regions. Add in the fact that Xen shares MPU
> > protection
> > > > > regions with guest's EL1 Stage 2. It becomes even more important
> > > > > to properly plan the use of MPU protection regions.
> > > > >
> > > > > - An ideal of memory usage layout restriction:
> > > > > ![img](https://drive.google.com/uc?export=view&id=1kirOL0Tx2aAypTtd3
> > kXAt
> > > > d75XtrngcnW)
> > > > > 1. Reserve proper MPU regions for Xen image (code, rodata and data +
> > > > bss).
> > > > > 2. Reserve one MPU region for boot modules.
> > > > >    That means the placement of all boot modules, include guest
> > kernel,
> > > > >    initrd and dtb, will be limited to this MPU region protected area.
> > > > > 3. Reserve one or more MPU regions for Xen heap.
> > > > >    On Armv8-R64, the guest memory is predefined in device tree, it
> > will
> > > > >    not be allocated from heap. Unlike Armv8-A64, we will not move
> > all
> > > > >    free memory to heap. We want Xen heap is dertermistic too, so Xen
> > on
> > > > >    Armv8-R64 also rely on Xen static heap feature. The memory for
> > Xen
> > > > >    heap will be defined in tree too. Considering that physical
> > memory
> > > > >    can also be discontinuous, one or more MPU protection regions
> > needs
> > > > >    to be reserved for Xen HEAP.
> > > > > 4. If we name above used MPU protection regions PART_A, and name
> > left
> > > > >    MPU protection regions PART_B:
> > > > >    4.1. In hypervisor context, Xen will map left RAM and devices to
> > > > PART_B.
> > > > >         This will give Xen the ability to access whole memory.
> > > > >    4.2. In guest context, Xen will create EL1 stage 2 mapping in
> > PART_B.
> > > > >         In this case, Xen just need to update PART_B in context
> > switch,
> > > > >         but keep PART_A as fixed.
> > > >
> > > > I think that the memory layout and restrictions that you wrote above
> > > > make sense. I have some comments on the way they are represented in
> > > > device tree, but that's different.
> > > >
> > > >
> > > > > ***Notes: Static allocation will be mandatory on MPU based
> > systems***
> > > > >
> > > > > **A sample device tree of memory layout restriction**:
> > > > > ```
> > > > > chosen {
> > > > >     ...
> > > > >     /*
> > > > >      * Define a section to place boot modules,
> > > > >      * all boot modules must be placed in this section.
> > > > >      */
> > > > >     mpu,boot-module-section = <0x10000000 0x10000000>;
> > > > >     /*
> > > > >      * Define a section to cover all guest RAM. All guest RAM must
> > be
> > > > located
> > > > >      * within this section. The pros is that, in best case, we can
> > only
> > > > have
> > > > >      * one MPU protection region to map all guest RAM for Xen.
> > > > >      */
> > > > >     mpu,guest-memory-section = <0x20000000 0x30000000>;
> > > > >     /*
> > > > >      * Define a memory section that can cover all device memory that
> > > > >      * will be used in Xen.
> > > > >      */
> > > > >     mpu,device-memory-section = <0x80000000 0x7ffff000>;
> > > > >     /* Define a section for Xen heap */
> > > > >     xen,static-mem = <0x50000000 0x20000000>;
> > > >
> > > > As mentioned above, I understand the need for these sections, but why
> > do
> > > > we need to describe them in device tree at all? Could Xen select them
> > by
> > > > itself during boot?
> > >
> > > I think without some inputs, Xen could not do this or will do it in some
> > > assumption. For example, assume the first the boot-module-section
> > determined
> > > by lowest address and highest address of all modules. And the same for
> > > guest-memory-section, calculated from all guest allocated memory regions.
> > 
> > Right, I think that the mpu,boot-module-section should be generated by a
> > set of scripts like ImageBuilder. Something with a list of all the
> > binaries that need to be loaded and also the DTB at build-time.
> > Something like ImageBuilder would have the ability to add
> > "mpu,boot-module-section" to device tree automatically and automatically
> > choose a good address for it.
> > 
> > As an example, today ImageBuilder takes as input a config file like the
> > following:
> > 
> > ---
> > MEMORY_START="0x0"
> > MEMORY_END="0x80000000"
> > 
> > DEVICE_TREE="4.16-2022.1/mpsoc.dtb"
> > XEN="4.16-2022.1/xen"
> > DOM0_KERNEL="4.16-2022.1/Image-dom0-5.16"
> > DOM0_RAMDISK="4.16-2022.1/xen-rootfs.cpio.gz"
> > 
> > NUM_DOMUS=1
> > DOMU_KERNEL[0]="4.16-2022.1/Image-domU"
> > DOMU_RAMDISK[0]="4.16-2022.1/initrd.cpio"
> > DOMU_PASSTHROUGH_DTB[0]="4.16-2022.1/passthrough-example-sram.dtb"
> > ---
> > 
> > And generates a U-Boot boot.scr script with:
> > - load addresses for each binary
> > - commands to edit the DTB to add those addresses to device tree (e.g.
> >   dom0less kernels addresses)
> > 
> > ImageBuilder can also modify the DTB at build time instead (instead of
> > doing it from boot.scr.) See FDTEDIT.
> > 
> > I am not saying we should use ImageBuilder, but it sounds like we need
> > something similar.
> > 
> > 
> 
> Yes, exactly. I have comment on Henry's stack heap RFC to said we need
> a similar tool. Now, here it is : )

Ahah yes :-)

Initially I wrote ImageBuilder because people kept sending me emails to
ask me for help with dom0less and almost always it was an address
loading error.

I would be happy to turn ImageBuilder into something useful for ARMv8-R
as well and add more maintainers from ARM and other companies.


> > > > If not, and considering that we have to generate
> > > > ARM_MPU_*_MEMORY_START/END anyway at build time, would it make sense
> > to
> > > > also generate mpu,guest-memory-section, xen,static-mem, etc. at build
> > > > time rather than passing it via device tree to Xen at runtime?
> > > >
> > >
> > > Did you mean we still add these information in device tree, but for
> > build
> > > time only. In runtime we don't parse them?
> > 
> > Yes, something like that, but see below.
> > 
> > 
> > > > What's the value of doing ARM_MPU_*_MEMORY_START/END at build time and
> > > > everything else at runtime?
> > >
> > > ARM_MPU_*_MEMORY_START/END is defined by platform. But other things are
> > > users customized. They can change their usage without rebuild the image.
> > 
> > Good point.
> > 
> > We don't want to have to rebuild Xen if the user updated a guest kernel,
> > resulting in a larger boot-module-section.
> > 
> > So I think it makes sense that "mpu,boot-module-section" is generated by
> > the scripts (e.g. ImageBuilder) at build time, and Xen reads the
> > property at boot from the runtime device tree.
> > 
> > I think we need to divide the information into two groups:
> > 
> > 
> > # Group1: board info
> > 
> > This information is platform specific and it is not meant to change
> > depending on the VM configuration. Ideally, we build Xen for a platform
> > once, then we can use the same Xen binary together with any combination
> > of dom0/domU kernels and ramdisks.
> > 
> > This kind of information doesn't need to be exposed to the runtime
> > device tree. But we can still use a build-time device tree to generate
> > the addresses if it is convenient.
> > 
> > XEN_START_ADDRESS, ARM_MPU_DEVICE_MEMORY_*, and ARM_MPU_NORMAL_MEMORY_*
> > seem to be part of this group.
> > 
> 
> Yes.
> 
> > 
> > # Group2: boot configuration
> > 
> > This information is about the specific set of binaries and VMs that we
> > need to boot. It is conceptually similar to the dom0less device tree
> > nodes that we already have. If we change one of the VM binaries, we
> > likely have to refresh the information here.
> > 
> > "mpu,boot-module-section" probably belongs to this group (unless we find
> > a way to define "mpu,boot-module-section" generically so that we don't
> > need to change it any time the set of boot modules change.)
> > 
> > 
> 
> I agree.
> 
> > > > It looks like we are forced to have the sections definitions at build
> > > > time because we need them before we can parse device tree. In that
> > case,
> > > > we might as well define all the sections at build time.
> > > >
> > > > But I think it would be even better if Xen could automatically choose
> > > > xen,static-mem, mpu,guest-memory-section, etc. on its own based on the
> > > > regular device tree information (/memory, /amba, etc.), without any
> > need
> > > > for explicitly describing each range with these new properties.
> > > >
> > >
> > > for mpu,guest-memory-section, with the limitations: no other usage
> > between
> > > different guest' memory nodes, this is OK. But for xen,static-mem (heap),
> > > we just want everything on a MPU system is dertermistic. But, of course
> > Xen
> > > can select left memory for heap without static-mem.
> > 
> > It is good that you think they can be chosen by Xen.
> > 
> > Differently from "boot-module-section", which has to do with the boot
> > modules selected by the user for a specific execution,
> > guest-memory-section and static-mem are Xen specific memory
> > policies/allocations.
> > 
> > A user wouldn't know how to fill them in. And I worry that even a script
> 
> But users should know it, because static-mem for guest must be allocated
> in this range. And users take the responsibility to set the DomU's
> static allocate memory ranges.

Let me premise that my goal is to avoid having many users reporting
errors to xen-devel and xen-users when actually it is just a wrong
choice of addresses.

I think we need to make a distinction between addresses for the boot
modules, e.g. addresses where to load xen, the dom0/U kernel, dom0/U
ramdisk in memory at boot time, and VM static memory addresses.

The boot modules addresses are particularly difficult to fill in because
they are many and a small update in one of the modules could invalidate
all the other addresses. This is why I ended up writing ImageBuilder.
Since them, I received several emails from users thanking me for
ImageBuilder :-)

The static VM memory addresses (xen,static-mem) should be a bit easier
to fill in correctly. They are meant to be chosen once, and it shouldn't
happen that an update on a kernel forces the user to change all the VM
static memory addresses. Also, I know that some users actually want to
be able to choose the domU addresses by hand because they have specific
needs. So it is good that we can let the user choose the addresses if
they want to.

With all of that said, I do think that many users won't have an opinion
on the VM static memory addresses and won't know how to choose them.
It would be error prone to let them try to fill them in by hand. So I
was already planning on adding support to ImageBuilder to automatically
generate xen,static-mem for dom0less domains.


Going back to this specific discussion about boot-module-section: I can
see now that, given xen,static-mem is chosen by ImageBuilder (or
similar) and not Xen, then it makes sense to have ImageBuilder (or
similar) also generate boot-module-section.



> > like ImageBuilder wouldn't be the best place to pick these values --
> > they seem too "important" to leave to a script.
> > 
> > But it seems possible to choose the values in Xen:
> > - Xen knows ARM_MPU_NORMAL_MEMORY_* because it was defined at build time
> > - Xen reads boot-module-section from device tree
> > 
> > It should be possible at this point for Xen to pick the best values for
> > guest-memory-section and static-mem based on the memory available.
> > 
> 
> How Xen to pick? Does it mean in static allocation DomU DT node, we just
> need a size, but don't require a start address for static-mem?

Yes the idea was that the user would only provide the size (e.g.
DOMU_STATIC_MEM[1]=1024) and the addresses would be automatically
calculated. But I didn't mean to change the existing xen,static-mem
device tree bindings. So it is best if the xen,static-mem addresses
generation is done by ImageBuilder (or similar tool) instead of Xen.

Sorry for the confusion!


> > > > >     domU1 {
> > > > >         ...
> > > > >         #xen,static-mem-address-cells = <0x01>;
> > > > >         #xen,static-mem-size-cells = <0x01>;
> > > > >         /* Statically allocated guest memory, within mpu,guest-
> > memory-
> > > > section */
> > > > >         xen,static-mem = <0x30000000 0x1f000000>;
> > > > >
> > > > >         module@11000000 {
> > > > >             compatible = "multiboot,kernel\0multiboot,module";
> > > > >             /* Boot module address, within mpu,boot-module-section
> > */
> > > > >             reg = <0x11000000 0x3000000>;
> > > > >             ...
> > > > >         };
> > > > >
> > > > >         module@10FF0000 {
> > > > >                 compatible = "multiboot,device-
> > tree\0multiboot,module";
> > > > >                 /* Boot module address, within mpu,boot-module-
> > section
> > > > */
> > > > >                 reg = <0x10ff0000 0x10000>;
> > > > >                 ...
> > > > >         };
> > > > >     };
> > > > > };
> > > > > ```
--8323329-1877311929-1646175755=:3261--

