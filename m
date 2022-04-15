Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78877501FB4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 02:42:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305175.520052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfA1h-0005XP-3N; Fri, 15 Apr 2022 00:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305175.520052; Fri, 15 Apr 2022 00:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfA1h-0005Uw-07; Fri, 15 Apr 2022 00:41:29 +0000
Received: by outflank-mailman (input) for mailman id 305175;
 Fri, 15 Apr 2022 00:41:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfA1f-0005Uo-GY
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 00:41:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c580f497-bc54-11ec-8fbe-03012f2f19d4;
 Fri, 15 Apr 2022 02:41:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31A79621C9;
 Fri, 15 Apr 2022 00:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379F8C385A1;
 Fri, 15 Apr 2022 00:41:20 +0000 (UTC)
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
X-Inumbo-ID: c580f497-bc54-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649983280;
	bh=RVExx0DiGUmKDlEdUc5y2CAkuSAq5pnnkv1erAyYRNo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PQFPsJOjS5XEp0X0nzDCNiC/q4C0TALGQ+gwsXedxgo4im1ono7NAlpdWFxfwBPEy
	 oY8oGD/SU1Gxj9Z2OF4Uf8oUjjvZvA/LMzZ4EM/euIUgX732ny/JEZaf8CvlirndP1
	 VPvpAYL13ChJdQnNXXC04MXyPj2WwRjSlcOvUoTLYALulsb8Z7CaRXzut2/s2LZT0X
	 Xe8QdE18RwsyPT6pEN9/K/f2+ucAw6luTu0M11frx7Cnnv7tRj9BcZOgXH24A40mQf
	 Mt0mheMMt2Asg/X5IhfVLbdi5J9FLZnyHXv/lhCDH8HogiSU0h8dux29NOtmRvbnFk
	 cYkSedocIDjag==
Date: Thu, 14 Apr 2022 17:41:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <Wei.Chen@arm.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftB
In-Reply-To: <PAXPR08MB742064F5F00A18E09DEF66B69E1A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2204141613340.915916@ubuntu-linux-20-04-desktop>
References: <PAXPR08MB742064F5F00A18E09DEF66B69E1A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Mar 2022, Wei Chen wrote:
> # Proposal for Porting Xen to Armv8-R64
> 
> This proposal will introduce the PoC work of porting Xen to Armv8-R64,
> which includes:
> - The changes of current Xen capability, like Xen build system, memory
>   management, domain management, vCPU context switch.
> - The expanded Xen capability, like static-allocation and direct-map.
> 
> ***Notes:***
> 1. ***This proposal only covers the work of porting Xen to Armv8-R64***
>    ***single CPU.Xen SMP support on Armv8-R64 relates to Armv8-R***
>    ***Trusted-Frimware (TF-R). This is an external dependency,***
>    ***so we think the discussion of Xen SMP support on Armv8-R64***
>    ***should be started when single-CPU support is complete.***
> 2. ***This proposal will not touch xen-tools. In current stange,***
>    ***Xen on Armv8-R64 only support dom0less, all guests should***
>    ***be booted from device tree.***
> 
> ## Changelogs
> Draft-A -> Draft-B:
> 1. Update Kconfig options usage.
> 2. Update the section for XEN_START_ADDRESS.
> 3. Add description of MPU initialization before parsing device tree.
> 4. Remove CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS.
> 5. Update the description of ioremap_nocache/cache.
> 6. Update about the free_init_memory on Armv8-R.
> 7. Describe why we need to switch the MPU configuration later.
> 8. Add alternative proposal in TODO.
> 9. Add use tool to generate Xen Armv8-R device tree in TODO.
> 10. Add Xen PIC/PIE discussion in TODO.
> 11. Add Xen event channel support in TODO.
> 
> ## Contributors:
> Wei Chen <Wei.Chen@arm.com>
> Penny Zheng <Penny.Zheng@arm.com>
> 
> ## 1. Essential Background
> 
> ### 1.1. Armv8-R64 Profile
> The Armv-R architecture profile was designed to support use cases that
> have a high sensitivity to deterministic execution. (e.g. Fuel Injection,
> Brake control, Drive trains, Motor control etc)
> 
> Arm announced Armv8-R in 2013, it is the latest generation Arm architecture
> targeted at the Real-time profile. It introduces virtualization at the highest
> security level while retaining the Protected Memory System Architecture (PMSA)
> based on a Memory Protection Unit (MPU). In 2020, Arm announced Cortex-R82,
> which is the first Arm 64-bit Cortex-R processor based on Armv8-R64.
> 
> - The latest Armv8-R64 document can be found here:
>   [Arm Architecture Reference Manual Supplement - Armv8, for Armv8-R AArch64 architecture profile](https://developer.arm.com/documentation/ddi0600/latest/).
> 
> - Armv-R Architecture progression:
>   Armv7-R -> Armv8-R AArch32 -> Armv8 AArch64
>   The following figure is a simple comparison of "R" processors based on
>   different Armv-R Architectures.
>   ![image](https://drive.google.com/uc?export=view&id=1nE5RAXaX8zY2KPZ8imBpbvIr2eqBguEB)
> 
> - The Armv8-R architecture evolved additional features on top of Armv7-R:
>     - An exception model that is compatible with the Armv8-A model
>     - Virtualization with support for guest operating systems
>         - PMSA virtualization using MPUs In EL2.
> - The new features of Armv8-R64 architecture
>     - Adds support for the 64-bit A64 instruction set, previously Armv8-R
>       only supported A32.
>     - Supports up to 48-bit physical addressing, previously up to 32-bit
>       addressing was supported.
>     - Optional Arm Neon technology and Advanced SIMD
>     - Supports three Exception Levels (ELs)
>         - Secure EL2 - The Highest Privilege, MPU only, for firmware, hypervisor
>         - Secure EL1 - RichOS (MMU) or RTOS (MPU)
>         - Secure EL0 - Application Workloads
>     - Optionally supports Virtual Memory System Architecture at S-EL1/S-EL0.
>       This means it's possible to run rich OS kernels - like Linux - either
>       bare-metal or as a guest.
> - Differences with the Armv8-A AArch64 architecture
>     - Supports only a single Security state - Secure. There is not Non-Secure
>       execution state supported.
>     - EL3 is not supported, EL2 is mandatory. This means secure EL2 is the
>       highest EL.
>     - Supports the A64 ISA instruction
>         - With a small set of well-defined differences
>     - Provides a PMSA (Protected Memory System Architecture) based
>       virtualization model.
>         - As opposed to Armv8-A AArch64's VMSA based Virtualization
>         - Can support address bits up to 52 if FEAT_LPA is enabled,
>           otherwise 48 bits.
>         - Determines the access permissions and memory attributes of
>           the target PA.
>         - Can implement PMSAv8-64 at EL1 and EL2
>             - Address translation flat-maps the VA to the PA for EL2 Stage 1.
>             - Address translation flat-maps the VA to the PA for EL1 Stage 1.
>             - Address translation flat-maps the IPA to the PA for EL1 Stage 2.
>     - PMSA in EL1 & EL2 is configurable, VMSA in EL1 is configurable.
> 
> ### 1.2. Xen Challenges with PMSA Virtualization
> Xen is PMSA unaware Type-1 Hypervisor, it will need modifications to run
> with an MPU and host multiple guest OSes.
> 
> - No MMU at EL2:
>     - No EL2 Stage 1 address translation
>         - Xen provides fixed ARM64 virtual memory layout as basis of EL2
>           stage 1 address translation, which is not applicable on MPU system,
>           where there is no virtual addressing. As a result, any operation
>           involving transition from PA to VA, like ioremap, needs modification
>           on MPU system.
>     - Xen's run-time addresses are the same as the link time addresses.
>         - Enable PIC/PIE (position-independent code) on a real-time target
>           processor probably very rare. Further discussion in 2.1 and TODO
>           sections.
>     - Xen will need to use the EL2 MPU memory region descriptors to manage
>       access permissions and attributes for accesses made by VMs at EL1/0.
>         - Xen currently relies on MMU EL1 stage 2 table to manage these
>           accesses.
> - No MMU Stage 2 translation at EL1:
>     - A guest doesn't have an independent guest physical address space
>     - A guest can not reuse the current Intermediate Physical Address
>       memory layout
>     - A guest uses physical addresses to access memory and devices
>     - The MPU at EL2 manages EL1 stage 2 access permissions and attributes
> - There are a limited number of MPU protection regions at both EL2 and EL1:
>     - Architecturally, the maximum number of protection regions is 256,
>       typical implementations have 32.
>     - By contrast, Xen does not need to consider the number of page table
>       entries in theory when using MMU.
> - The MPU protection regions at EL2 need to be shared between the hypervisor
>   and the guest stage 2.
>     - Requires careful consideration - may impact feature 'fullness' of both
>       the hypervisor and the guest
>     - By contrast, when using MMU, Xen has standalone P2M table for guest
>       stage 2 accesses.
> 
> ## 2. Proposed changes of Xen
> ### **2.1. Changes of build system:**
> 
> - ***Introduce new Kconfig options for Armv8-R64***:
>   Unlike Armv8-A, because lack of MMU support on Armv8-R64, we may not
>   expect one Xen binary to run on all machines. Xen images are not common
>   across Armv8-R64 platforms. Xen must be re-built for different Armv8-R64
>   platforms. Because these platforms may have different memory layout and
>   link address.
>     - `ARM64_V8R`:
>       This option enables Armv8-R profile for Arm64. Enabling this option
>       results in selecting MPU. This Kconfig option is used to gate some
>       Armv8-R64 specific code except MPU code, like some code for Armv8-R64
>       only system ID registers access.
> 
>     - `ARM_MPU`
>       This option enables MPU on Armv8-R architecture. Enabling this option
>       results in disabling MMU. This Kconfig option is used to gate some
>       ARM_MPU specific code. Once when this Kconfig option has been enabled,
>       the MMU relate code will not be built for Armv8-R64. The reason why
>       not depends on runtime detection to select MMU or MPU is that, we don't
>       think we can use one image for both Armv8-R64 and Armv8-A64. Another
>       reason that we separate MPU and V8R in provision to allow to support MPU
>       on 32bit Arm one day.
> 
>   ***Try to use `if ( IS_ENABLED(CONFIG_ARMXXXX) )` instead of spreading***
>   ***`#ifdef CONFIG_ARMXXXX` everywhere, if it is possible.***
> 
> - ***About Xen start address for Armv8-R64***:
>   On Armv8-A, Xen has a fixed virtual start address (link address too) on all
>   Armv8-A platforms. In an MMU based system, Xen can map its loaded address
>   to this virtual start address. On Armv8-A platforms, the Xen start address
>   does not need to be configurable. But on Armv8-R platforms, they don't have
>   MMU to map loaded address to a fixed virtual address. And different platforms
>   will have very different address space layout, so it's impossible for Xen to
>   specify a fixed physical address for all Armv8-R platforms' start address.
> 
>   - `XEN_START_ADDRESS`
>     This option allows to set the custom address at which Xen will be
>     linked. This address must be aligned to a page size. Xen's run-time
>     addresses are the same as the link time addresses.
>     ***Notes: Fixed link address means the Xen binary could not be***
>     ***relocated by EFI loader. So in current stage, Xen could not***
>     ***be launched as an EFI application on Armv8-R64.(TODO#3.3)***
> 
>     - Provided by platform files.
>       We can reuse the existed arm/platforms store platform specific files.
>       And `XEN_START_ADDRESS` is one kind of platform specific information.
>       So we can use platform file to define default `XEN_START_ADDRESS` for
>       each platform.
> 
>     - Provided by Kconfig.
>       This option can be an independent or a supplymental option. Users can
>       define a customized `XEN_START_ADDRESS` to override the default value
>       in platform's file.
> 
>     - Generated from device tree by build scripts (optional)
>       Vendors who want to enable Xen on their Armv8-R platforms, they can
>       use some tools/scripts to parse their boards device tree to generate
>       the basic platform information. These tools/scripts do not necessarily
>       need to be integrated in Xen, but Xen can give some recommended
>       configuration. For example, Xen can recommend Armv8-R platforms to use
>       lowest ram start address + 2MB as the default Xen start address.
>       The generated platform files can be placed to arm/platforms for
>       maintenance.
> 
>     - Enable Xen PIC/PIE (optional)
>       We have mentioned about PIC/PIE in section 1.2. With PIC/PIE support,
>       Xen can run from everywhere it has been loaded. But it's rare to use
>       PIC/PIE on a real-time system (code size, more memory access). So a
>       partial PIC/PIE image maybe better (see 3. TODO section). But partial
>       PIC/PIE image may not solve this Xen start address issue.

I like the description of the XEN_START_ADDRESS problem and solutions.

For the initial implementation, a platform file is fine. We need to
start easy.

Afterwards, I think it would be far better to switch to a script that
automatically generates XEN_START_ADDRESS from the host device tree.
Also, if we provide a way to customize the start address via Kconfig,
then the script that reads the device tree could simply output the right
CONFIG_* option for Xen to build. It wouldn't even have to generate an
header file.


> - ***About MPU initialization before parsing device tree***:
>       Before Xen can start parsing information from device tree and use
>       this information to setup MPU, Xen need an initial MPU state. This
>       is because:
>       1. More deterministic: Arm MPU supports background regions, if we
>          don't configure the MPU regions and don't enable MPU. The default
>          MPU background attributes will take effect. The default background
>          attributes are `IMPLEMENTATION DEFINED`. That means all RAM regions
>          may be configured to device memory and RWX. Random values in RAM or
>          maliciously embedded data can be exploited.
>       2. More compatible: On some Armv8-R64 platforms, if MPU is disabled,
>          the `dc zva` instruction will make the system halt (This is one
>          side effect of MPU background attributes, the RAM has been configured
>          as device memory). And this instruction will be embedded in some
>          built-in functions, like `memory set`. If we use `-ddont_use_dc` to
>          rebuild GCC, the built-in functions will not contain `dc zva`.
>          However, it is obviously unlikely that we will be able to recompile
>          all GCC for ARMv8-R64.
> 
>     - Reuse `XEN_START_ADDRESS`
>       In the very beginning of Xen boot, Xen just need to cover a limited
>       memory range and very few devices (actually only UART device). So we
>       can use two MPU regions to map:
>       1. `XEN_START_ADDRESS` to `XEN_START_ADDRESS + 2MB` or.
>          `XEN_START_ADDRESS` to `XEN_START_ADDRESS + image_size`as
>          normal memory.
>       2. `UART` MMIO region base to `UART` MMIO region end to device memory.
>       These two are enough to support Xen run in boot time. And we don't need
>       to provide additional platform information for initial normal memory
>       and device memory regions. In current PoC we have used this option
>       for implementation, and it's the same as Armv8-A.
> 
>     - Additional platform information for initial MPU state
>       Introduce some macros to allow users to set initial normal
>       memory regions:
>       `ARM_MPU_NORMAL_MEMORY_START` and `ARM_MPU_NORMAL_MEMORY_END`
>       and device memory:
>       `ARM_MPU_DEVICE_MEMORY_START` and `ARM_MPU_DEVICE_MEMORY_END`
>       These macros are the same platform specific information as
>       `XEN_START_ADDRESS`, so the options#1/#2/#3 of generating
>       `XEN_START_ADDRESS` also can be applied to these macros.
>       ***From our current PoC work, we think these macros may***
>       ***not be necessary. But we still place them here to see***
>       ***whether the community will have some different scenarios***
>       ***that we haven't considered.***

I think it is fine for now. And their values could be automatically
generated by the same script that will automatically generate
XEN_START_ADDRESS from the host device tree.


> - ***Define new system registers for compiliers***:
>   Armv8-R64 is based on Armv8.4. That means we will use some Armv8.4
>   specific system registers. As Armv8-R64 only have secure state, so
>   at least, `VSTCR_EL2` and `VSCTLR_EL2` will be used for Xen. And the
>   first GCC version that supports Armv8.4 is GCC 8.1. In addition to
>   these, PMSA of Armv8-R64 introduced lots of MPU related system registers:
>   `PRBAR_ELx`, `PRBARx_ELx`, `PRLAR_ELx`, `PRLARx_ELx`, `PRENR_ELx` and
>   `MPUIR_ELx`. But the first GCC version to support these system registers
>   is GCC 11. So we have two ways to make compilers to work properly with
>   these system registers.
>   1. Bump GCC version to GCC 11.
>      The pros of this method is that, we don't need to encode these
>      system registers in macros by ourselves. But the cons are that,
>      we have to update Makefiles to support GCC 11 for Armv8-R64.
>      1.1. Check the GCC version 11 for Armv8-R64.
>      1.2. Add march=armv8r to CFLAGS for Armv8-R64.
>      1.3. Solve the confliction of march=armv8r and mcpu=generic
>     These changes will affect common Makefiles, not only Arm Makefiles.
>     And GCC 11 is new, lots of toolchains and Distro haven't supported it.
> 
>   2. Encode new system registers in macros ***(preferred)***
>         ```
>         /* Virtualization Secure Translation Control Register */
>         #define VSTCR_EL2  S3_4_C2_C6_2
>         /* Virtualization System Control Register */
>         #define VSCTLR_EL2 S3_4_C2_C0_0
>         /* EL1 MPU Protection Region Base Address Register encode */
>         #define PRBAR_EL1  S3_0_C6_C8_0
>         ...
>         /* EL2 MPU Protection Region Base Address Register encode */
>         #define PRBAR_EL2  S3_4_C6_C8_0
>         ...
>         ```
>      If we encode all above system registers, we don't need to bump GCC
>      version. And the common CFLAGS Xen is using still can be applied to
>      Armv8-R64. We don't need to modify Makefiles to add specific CFLAGS.
>      ***Notes:***
>      ***Armv8-R AArch64 supports the A64 ISA instruction set with***
>      ***some modifications:***
>      ***Redefines DMB, DSB, and adds an DFB. But actually, the***
>      ***encodings of DMB and DSB are still the same with A64.***
>      ***And DFB is an alias of DSB #12. In this case, we think***
>      ***we don't need a new architecture specific flag to***
>      ***generate new instructions for Armv8-R.***

I think that for the initial implementation either way is fine. I agree
that macros would be better than requiring GCC 11.


> ### **2.2. Changes of the initialization process**
> In general, we still expect Armv8-R64 and Armv8-A64 to have a consistent
> initialization process. In addition to some architecutre differences, there
> is no more than reusable code that we will distinguish through CONFIG_ARM_MPU
> or CONFIG_ARM64_V8R. We want most of the initialization code to be reusable
> between Armv8-R64 and Armv8-A64.
> 
> - We will reuse the original head.s and setup.c of Arm. But replace the
>   MMU and page table operations in these files with configuration operations
>   for MPU and MPU regions.
> 
> - We provide a boot-time MPU configuration. This MPU configuration will
>   support Xen to finish its initialization. And this boot-time MPU
>   configuration will record the memory regions that will be parsed from
>   device tree.
> 
>   In the end of Xen initialization, we will use a runtime MPU configuration
>   to replace boot-time MPU configuration. The runtime MPU configuration will
>   merge and reorder memory regions to save more MPU regions for guests.
>   ![img](https://drive.google.com/uc?export=view&id=1wTFyK2XfU3lTlH1PqRDoacQVTwUtWIGU)
> 
> - Defer system unpausing domain after free_init_memory.
>   When Xen initialization is about to end, Xen unpauses guests created
>   during initialization. But this will cause some issues. The unpause
>   action occurs before free_init_memory, however the runtime MPU
>   configuration is built after free_init_memory. In Draft-A, we had
>   discussed whether a zeroing operation for init code and data is
>   enough or not. Because I had just given a security reason for doing
>   free_init_memory on Armv8-R (free_init_memory will drop the Xen init
>   code & data, this will reduce the code an attacker can exploit).
>   But I forgot other very important reasons:
>   1. Init code and data will occupy two MPU regions, because they
>      have different memory attributes.
>   2. It's not easy to zero init code section, because it's readonly.
>      We have to update its MPU region to make this section RW. This
>      operation doesn't do much less than free_init_memory.
>   3. Zeroing init code and data will not release the two MPU regions
>      they are using. This would be a very big waste of a limited MPU
>      regions resource.
>   4. Current free_init_memory operation is reusing lots of Armv8-A
>      codes, except re-add init memory to Xen heap. Becuase we're using
>      static heap on Armv8-R.
> 
>   So if the unpaused guests start executing the context switch at this
>   point, then its MPU context will base on the boot-time MPU configuration.
>   Probably it will be inconsistent with runtime MPU configuration, this
>   will cause unexpected problems (This may not happen in a single core
>   system, but on SMP systems, this problem is forseeable, so we hope to
>   solve it at the beginning).
> 
>   Why we need to switch the MPU configuration that late?
>   Because we need to re-order the MPU regions to reduce complexity of runtime
>   MPU regions management.
>   1. In the boot stage, we allocate MPU regions in sequence until the max.
>      Since a few MPU regions will get removed along the way, they will leave
>      holes there. For example, when heap is ready, fdt will be reallocated
>      in the heap, which means the MPU region for device tree is never needed.
>      And also in free_init_memory, although we do not add init memory to heap,
>      we still reclaim the MPU regions they are using. Without ordering, we
>      may need a bitmap to record such information.
> 
>      In context switch, the memory layout is quite different for guest mode
>      and hypervisor mode. When switching to guest mode, only guest RAM,
>      emulated/passthrough devices, etc could be seen, but in hypervisor mode,
>      all Xen used devices and guests RAM shall be seen. And without reordering,
>      we need to iterate all MPU regions to find according regions to disable
>      during runtime context switch, that's definitely a overhead.
> 
>      So we propose an ordering at the tail of the boot time, to put all fixed
>      MPU regions in the head, like xen text/data, etc, and put all flexible
>      ones at tail, like device memory, guests RAM.
> 
>      Then later in runtime, like context switch, we could easily just disable
>      ones from tail and inserts new ones in the tail.
> 
> ### **2.3. Changes to reduce memory fragmentation**
> 
> In general, memory in Xen system can be classified to 4 classes:
> `image sections`, `heap sections`, `guest RAM`, `boot modules (guest Kernel,
> initrd and dtb)`
> 
> Currently, Xen doesn't have any restriction for users how to allocate
> memory for different classes. That means users can place boot modules
> anywhere, can reserve Xen heap memory anywhere and can allocate guest
> memory anywhere.
> 
> In a VMSA system, this would not be too much of a problem, since the
> MMU can manage memory at a granularity of 4KB after all. But in a
> PMSA system, this will be a big problem. On Armv8-R64, the max MPU
> protection regions number has been limited to 256. But in typical
> processor implementations, few processors will design more than 32
> MPU protection regions. Add in the fact that Xen shares MPU protection
> regions with guest's EL1 Stage 2. It becomes even more important
> to properly plan the use of MPU protection regions.
> 
> - An ideal of memory usage layout restriction:
> ![img](https://drive.google.com/uc?export=view&id=1kirOL0Tx2aAypTtd3kXAtd75XtrngcnW)
> 1. Reserve proper MPU regions for Xen image (code, rodata and data + bss).
> 2. Reserve one MPU region for boot modules.
>    That means the placement of all boot modules, include guest kernel,
>    initrd and dtb, will be limited to this MPU region protected area.
> 3. Reserve one or more MPU regions for Xen heap.
>    On Armv8-R64, the guest memory is predefined in device tree, it will
>    not be allocated from heap. Unlike Armv8-A64, we will not move all
>    free memory to heap. We want Xen heap is dertermistic too, so Xen on
>    Armv8-R64 also rely on Xen static heap feature. The memory for Xen
>    heap will be defined in tree too. Considering that physical memory
>    can also be discontinuous, one or more MPU protection regions needs
>    to be reserved for Xen HEAP.
> 4. If we name above used MPU protection regions PART_A, and name left
>    MPU protection regions PART_B:
>    4.1. In hypervisor context, Xen will map left RAM and devices to PART_B.
>         This will give Xen the ability to access whole memory.
>    4.2. In guest context, Xen will create EL1 stage 2 mapping in PART_B.
>         In this case, Xen just need to update PART_B in context switch,
>         but keep PART_A as fixed.
> 
> ***Notes: Static allocation will be mandatory on MPU based systems***
> 
> **A sample device tree of memory layout restriction**:
> ```
> chosen {
>     ...
>     /*
>      * Define a section to place boot modules,
>      * all boot modules must be placed in this section.
>      */
>     mpu,boot-module-section = <0x10000000 0x10000000>;
>     /*
>      * Define a section to cover all guest RAM. All guest RAM must be located
>      * within this section. The pros is that, in best case, we can only have
>      * one MPU protection region to map all guest RAM for Xen.
>      */
>     mpu,guest-memory-section = <0x20000000 0x30000000>;
>     /*
>      * Define a memory section that can cover all device memory that
>      * will be used in Xen.
>      */
>     mpu,device-memory-section = <0x80000000 0x7ffff000>;
>     /* Define a section for Xen heap */
>     xen,static-mem = <0x50000000 0x20000000>;
> 
>     domU1 {
>         ...
>         #xen,static-mem-address-cells = <0x01>;
>         #xen,static-mem-size-cells = <0x01>;
>         /* Statically allocated guest memory, within mpu,guest-memory-section */
>         xen,static-mem = <0x30000000 0x1f000000>;
> 
>         module@11000000 {
>             compatible = "multiboot,kernel\0multiboot,module";
>             /* Boot module address, within mpu,boot-module-section */
>             reg = <0x11000000 0x3000000>;
>             ...
>         };
> 
>         module@10FF0000 {
>                 compatible = "multiboot,device-tree\0multiboot,module";
>                 /* Boot module address, within mpu,boot-module-section */
>                 reg = <0x10ff0000 0x10000>;
>                 ...
>         };
>     };
> };
> ```
> It's little hard for users to compose such a device tree by hand. Based
> on the discussion of Draft-A, Xen community suggested users to use some
> tools like [imagebuilder](https://gitlab.com/ViryaOS/imagebuilder/-/blob/master/scripts/uboot-script-gen#L390) to generate the above device tree properties.
> Please goto TODO#3.3 section to get more details of this suggestion.

Yes, I think we'll need an ImageBuilder script to populate these entries
automatically. With George's help, I moved ImageBuilder to Xen Project.
This is the new repository: https://gitlab.com/xen-project/imagebuilder

The script to generate mpu,boot-module-section and the other mpu
addresses could be the same ImageBuilder script that generates also
XEN_START_ADDRESS.


> ### **2.4. Changes of memory management**
> Xen is coupled with VMSA, in order to port Xen to Armv8-R64, we have to
> decouple Xen from VMSA. And give Xen the ablity to manage memory in PMSA.
> 
> 1. ***Use buddy allocator to manage physical pages for PMSA***
>    From the view of physical page, PMSA and VMSA don't have any difference.
>    So we can reuse buddy allocator on Armv8-R64 to manage physical pages.
>    The difference is that, in VMSA, Xen will map allocated pages to virtual
>    addresses. But in PMSA, Xen just convert the pages to physical address.
> 
> 2. ***Can not use virtual address for memory management***
>    As Armv8-R64 only has PMSA in EL2, Xen loses the ability of using virtual
>    address to manage memory. This brings some problems, some virtual address
>    based features could not work well on Armv8-R64, like `FIXMAP`, `vmap/vumap`,
>    `ioremap` and `alternative`.
> 
>    But the functions or macros of these features are used in lots of common
>    code. So it's not good to use `#ifdef CONFIG_ARM_MPU` to gate relate code
>    everywhere. In this case, we propose to use stub helpers to make the changes
>    transparently to common code.
>    1. For `FIXMAP`, we will use `0` in `FIXMAP_ADDR` for all fixmap operations.
>       This will return physical address directly of fixmapped item.
>    2. For `vmap/vumap`, we will use some empty inline stub helpers:
>         ```
>         static inline void vm_init_type(...) {}
>         static inline void *__vmap(...)
>         {
>             return NULL;
>         }
>         static inline void vunmap(const void *va) {}
>         static inline void *vmalloc(size_t size)
>         {
>             return NULL;
>         }
>         static inline void *vmalloc_xen(size_t size)
>         {
>             return NULL;
>         }
>         static inline void vfree(void *va) {}
>         ```
> 
>    3. For `ioremap`, it depends on `vmap`. As we have make `vmap` to always
>       return `NULL`, they could not work well on Armv8-R64 without changes.
>       `ioremap` will return input address directly. But if some extended
>       functions like `ioremap_nocache`, `ioremap_cache`, need to ask a new
>       memory attributes. As Armv8-R doesn't have infinite MPU regions for
>       Xen to split the memory area from its located MPU region and assign
>       the new attributes to it. So in `ioremap_nocache`, `ioremap_cache`,
>       if the input attributes are different from current memory attributes,
>       these functions will return `NULL`.
>         ```
>         static inline void *ioremap_attr(...)
>         {
>             /* We don't have the ability to change input PA cache attributes */
>             if ( CACHE_ATTR_need_change )
>                 return NULL;
>             return (void *)pa;
>         }
>         static inline void __iomem *ioremap_nocache(...)
>         {
>             return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
>         }
>         static inline void __iomem *ioremap_cache(...)
>         {
>             return ioremap_attr(start, len, PAGE_HYPERVISOR);
>         }
>         static inline void __iomem *ioremap_wc(...)
>         {
>             return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
>         }
>         void *ioremap(...)
>         {
>             return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>         }
> 
>         ```
>     4. For `alternative`, it has been listed in TODO, we will simply disable
>        it on Armv8-R64 in current stage. But simply disable `alternative`
>        will make `cpus_have_const_cap` always return false.
>         ```
>         * System capability check for constant cap */
>         #define cpus_have_const_cap(num) ({                \
>                register_t __ret;                           \
>                                                            \
>                asm volatile (ALTERNATIVE("mov %0, #0",     \
>                                          "mov %0, #1",     \
>                                          num)              \
>                              : "=r" (__ret));              \
>                                                            \
>                 unlikely(__ret);                           \
>                 })
>         ```
>         So, before we have an PMSA `alternative` implementation, we have to
>         implement a separate `cpus_have_const_cap` for Armv8-R64:
>         ```
>         #define cpus_have_const_cap(num) cpus_have_cap(num)
>         ```
> 
> ### **2.5. Changes of guest management**
> Armv8-R64 only supports PMSA in EL2, but it supports configurable
> VMSA or PMSA in EL1. This means Xen will have a new type guest on
> Armv8-R64 - MPU based guest.
> 
> 1. **Add a new domain type - MPU_DOMAIN**
>    When user want to create a guest that will be using MPU in EL1, user
>    should add a `mpu` property in device tree `domU` node, like following
>    example:
>     ```
>     domU2 {
>         compatible = "xen,domain";
>         direct-map;
>         mpu; --> Indicates this domain will use PMSA in EL1.
>         ...
>     };
>     ```
>     Corresponding to `mpu` property in device tree, we also need to introduce
>     a new flag `XEN_DOMCTL_CDF_INTERNAL_mpu` for domain to mark itself as an
>     MPU domain. This flag will be used in domain creation and domain doing
>     vCPU context switch.
>     1. Domain creation need this flag to decide enable PMSA or VMSA in EL1.
>     2. vCPU context switch need this flag to decide save/restore MMU or MPU
>        related registers.
> 
> 2. **Add MPU registers for vCPU to save EL1 MPU context**
>    Current Xen only supports MMU based guest, so it hasn't considered to
>    save/restore MPU context. In this case, we need to add MPU registers
>    to `arch_vcpu`:
>     ```
>     struct arch_vcpu
>     {
>         ...
>     #ifdef CONFIG_ARM_MPU
>         /* Virtualization Translation Control Register */
>         register_t vtcr_el2;
> 
>         /* EL1 MPU regions' registers */
>         pr_t *mpu_regions;
>     #endif
>         ...
>     }
>     ```
>     Armv8-R64 can support max to 256 MPU regions. But that's just theoretical.
>     So we don't want to embed `pr_t mpu_regions[256]` in `arch_vcpu` directly,
>     this will be a memory waste in most cases. Instead we use a pointer in
>     `arch_vcpu` to link with a dynamically allocated `mpu_regions`:
>     ```
>     p->arch.mpu_regions = _xzalloc(sizeof(pr_t) * mpu_regions_count_el1, SMP_CACHE_BYTES);
>     ```
>     As `arch_vcpu` is used very frequently in context switch, so Xen defines
>     `arch_vcpu` as a cache alignment data structure. `mpu_regions` also will
>     be used very frequently in Armv8-R context switch. So we use `_xzalloc`
>     to allocate `SMP_CACHE_BYTES` alignment memory for `mpu_regions`.
> 
>     `mpu_regions_count_el1` can be detected from `MPUIR_EL1` system register
>     in Xen boot stage. The limitation is that, if we define a static
>     `arch_vcpu`, we have to allocate `mpu_regions` before using it.
> 
> 3. **MPU based P2M table management**
>    Armv8-R64 EL2 doesn't have EL1 stage 2 address translation. But through
>    PMSA, it still has the ability to control the permissions and attributes
>    of EL1 stage 2. In this case, we still hope to keep the interface
>    consistent with MMU based P2M as far as possible.
> 
>    p2m->root will point to an allocated memory. In Armv8-A64, this memory
>    is used to save the EL1 stage 2 translation table. But in Armv8-R64,
>    this memory will be used to store EL2 MPU protection regions that are
>    used by guest. During domain creation, Xen will prepare the data in
>    this memory to make guest can access proper RAM and devices. When the
>    guest's vCPU will be scheduled in, this data will be written to MPU
>    protection region registers.
> 
> ### **2.6. Changes of exception trap**
> As Armv8-R64 has compatible excetpion mode with Armv8-A64, so we can reuse most
> of Armv8-A64's exception trap & handler code. But except the trap based on EL1
> stage 2 translation abort.
> 
> In Armv8-A64, we use `FSC_FLT_TRANS`
> ```
>     case FSC_FLT_TRANS:
>         ...
>         if ( is_data )
>         {
>             enum io_state state = try_handle_mmio(regs, hsr, gpa);
>             ...
>         }
> ```
> But for Armv8-R64, we have to use `FSC_FLT_PERM`
> ```
>     case FSC_FLT_PERM:
>         ...
>         if ( is_data )
>         {
>             enum io_state state = try_handle_mmio(regs, hsr, gpa);
>             ...
>         }
> ```
> 
> ### **2.5. Changes of device driver**
> Because Armv8-R64 only has single secure state, this will affect some
> devices that have two secure state, like GIC. But fortunately, most
> vendors will not link a two secure state GIC to Armv8-R64 processors.
> Current GIC driver can work well with single secure state GIC for Armv8-R64.
> 
> ### **2.7. Changes of virtual device**
> Currently, we only support pass-through devices in guest. Becuase event
> channel, xen-bus, xen-storage and other advanced Xen features haven't been
> enabled in Armv8-R64.
> 
> ## 3. TODO
> This section describes some features that are not currently implemented in
> the PoC. Those features are things that should be looked in a second stage
> and will not be part of the initial support of MPU/Armv8-R. Those jobs could
> be done by Arm or any Xen contributors.
> 
> ### 3.1. Alternative framework support
>     On Armv8-A system, `alternative` is depending on `VMAP` function to remap
>     a code section to a new read/write virtual address. But on Armv8-R, we do
>     not have virtual address to do remap. So as an alternative method, we will
>     disable the MPU to make all RAM `RWX` in "apply alternative all patches"
>     progress temporarily.
> 
>     1. Disable MPU -> Code section becomes RWX.
>     2. Apply alternative patches to Xen text.
>     3. Enable MPU -> Code section restores to RX.
> 
>     All memory is RWX, there may be some security risk. But, because
>     "alternative apply patches" happens in Xen init stage, it propoably
>     doesn't matter as much.
> 
> ### 3.2. Xen Event Channel Support
>     In Current RFC patches we haven't enabled the event channel support.
>     But I think it's good opportunity to do some discussion in advanced.
>     On Armv8-R, all VMs are native direct-map, because there is no stage2
>     MMU translation. Current event channel implementation depends on some
>     shared pages between Xen and guest: `shared_info` and per-cpu `vcpu_info`.
> 
>     For `shared_info`, in current implementation, Xen will allocate a page
>     from heap for `shared_info` to store initial meta data. When guest is
>     trying to setup `shared_info`, it will allocate a free gfn and use a
>     hypercall to setup P2M mapping between gfn and `shared_info`.
> 
>     For direct-mapping VM, this will break the direct-mapping concept.
>     And on an MPU based system, like Armv8-R system, this operation will
>     be very unfriendly. Xen need to pop `shared_info` page from Xen heap
>     and insert it to VM P2M pages. If this page is in the middle of
>     Xen heap, this means Xen need to split current heap and use extra
>     MPU regions. Also for the P2M part, this page is unlikely to form
>     a new continuous memory region with the existing p2m pages, and Xen
>     is likely to need another additional MPU region to set it up, which
>     is obviously a waste for limited MPU regions. And This kind of dynamic
>     is quite hard to imagine on an MPU system.

Yeah, it doesn't make any sense for MPU systems


>     For `vcpu_info`, in current implementation, Xen will store `vcpu_info`
>     meta data for all vCPUs in `shared_info`. When guest is trying to setup
>     `vcpu_info`, it will allocate memory for `vcpu_info` from guest side.
>     And then guest will use hypercall to copy meta data from `shared_info`
>     to guest page. After that both Xen `vcpu_info` and guest `vcpu_info`
>     are pointed to the same page that allocated by guest.
> 
>     This implementation has serval benifits:
>     1. There is no waste memory. No extra memory will be allocated from Xen heap.
>     2. There is no P2M remap. This will not break the direct-mapping, and
>        is MPU system friendly.
>     So, on Armv8-R system, we can still keep current implementation for
>     per-cpu `vcpu_info`.
> 
>     So, our proposal is that, can we reuse current implementation idea of
>     `vcpu_info` for `shared_info`? We still allocate one page for
>     `d->shared_info` at domain construction for holding some initial meta-data,
>     using alloc_domheap_pages instead of alloc_xenheap_pages and
>     share_xen_page_with_guest. And when guest allocates a page for
>     `shared_info` and use hypercall to setup it,  We copy the initial data from
>     `d->shared_info` to it. And after copy we can update `d->shared_info` to point
>     to guest allocated 'shared_info' page. In this case, we don't have to think
>     about the fragmentation of Xen heap and p2m and the extra MPU regions.

Yes, I think that would work.

Also I think it should be possible to get rid of the initial
d->shared_info allocation in Xen, given that d->shared_info is for the
benefit of the guest and the guest cannot access it until it makes the
XENMAPSPACE_shared_info hypercall.


>     But here still has some concerns:
>     `d->shared_info` in Xen is accessed without any lock. So it will not be
>     that simple to update `d->shared_info`. It might be possible to protect
>     d->shared_info (or other structure) with a read-write lock.
> 
>     Do we need to add PGT_xxx flags to make it global and stay as much the
>     same with the original op, a simple investigation tells us that it only
>     be referred in `get_page_type`. Since ARM doesn't care about typecounts
>     and always return 1, it doesn't have too much impact.
>
> ### 3.3. Xen Partial PIC/PIE
>     As we have described in `XEN_START_ADDRESS` section. PIC/PIE can solve
>     different platforms have different `XEN_START_ADDRESS` issue. But we
>     also describe some issues to use PIC/PIE in real time systems like
>     Armv8-R platforms.
> 
>     But a partial PIC/PIE support may be needed for Armv8-R. Because Arm
>     [EBBR](https://arm-software.github.io/ebbr/index.html) require Xen
>     on Armv8-R to support EFI boot service. Due to lack of relocation
>     capability, EFI loader could not launch xen.efi on Armv8-R. So maybe
>     we still need a partially supported PIC/PIE. Only some boot code
>     support PIC/PIE to make EFI relocation happy. This boot code will
>     help Xen to check its loaded address and relocate Xen image to Xen's
>     run-time address if need.
> 
> ### 3.4. A tool to generate Armv8-R Xen device tree
> 1. Use a tool to generate above device tree property.
>    This tool will have some similar inputs as below:
>    ---
>    DEVICE_TREE="fvp_baremetal.dtb"
>    XEN="4.16-2022.1/xen"
> 
>    NUM_DOMUS=1
>    DOMU_KERNEL[0]="4.16-2022.1/Image-domU"
>    DOMU_RAMDISK[0]="4.16-2022.1/initrd.cpio"
>    DOMU_PASSTHROUGH_DTB[0]="4.16-2022.1/passthrough-example-dev.dtb"
>    DOMU_RAM_BASE[0]=0x30000000
>    DOMU_RAM_SIZE[0]=0x1f000000
>    ---
>    Using above inputs, the tool can generate a device tree similar as
>    we have described in sample.
> 
>    - `mpu,guest-memory-section`:
>    This section will cover all guests' RAM (`xen,static-mem` defined regions
>    in all DomU nodes). All guest RAM must be located within this section.
>    In the best case, we can only have one MPU protection region to map all
>    guests' RAM for Xen.
> 
>    If users set `DOMU_RAM_BASE` and `DOMU_RAM_SIZE`, these will be converted
>    to the base and size of `xen,static-mem`. This tool will scan all
>    `xen, static-mem` in DomU nodes to determin the base and size of
>    `mpu,guest-memory-section`. If there is any other kind of memory usage
>    has been detected in this section, this tool can report an error.
>    Except build time check, Xen also need to do runtime check to prevent a
>    bad device tree that generated by malicious tools.
> 
>    If users set `DOMU_RAM_SIZE` only, this will be converted to the size of
>    `xen,static-mem` only. Xen will allocate the guest memory in runtime, but
>    not from Xen heap. `mpu,guest-memory-section` will be caculated in runtime
>    too. The property in device tree doesn't need or will be ignored by Xen.

I am fine with this. You should also know that there was a recent
discussion about adding something like:

# address size address size ...
DOMU_STATIC_MEM_RANGES[0]="0xe000000 0x1000000 0xa0000000 0x30000000"

to the ImageBuilder config file.


>    - `mpu,boot-module-section`:
>    This section will be used to store the boot modules like DOMU_KERNEL,
>    DOMU_RAMDISK, and DOMU_PASSTHROUGH_DTB. Xen keeps all boot modules in
>    this section to meet the requirment of DomU restart on Armv8-R. In
>    current stage, we don't have a privilege domain like Dom0 that can
>    access filesystem to reload DomU images.
> 
>    And in current Xen code, the base and size are mandatory for boot modules
>    If users don't specify the base of each boot module, the tool will
>    allocte a base for each module. And the tool will generate the
>    `mpu,boot-module-section` region, when it finishs boot module memory
>    allocation.
> 
>    Users also can specify the base and size of each boot module, these will
>    be converted to the base and size of module's `reg` directly. The tool
>    will scan all modules `reg` in DomU nodes to generate the base and size of
>    `mpu,boot-module-section`. If there is any kind of other memory usage
>    has been detected in this section, this tool can report an error.
>    Except build time check, Xen also need to do runtime check to prevent a
>    bad device tree that generated by malicious tools.

Xen should always check for the validity of its input. However I should
point out that there is no "malicious tool" in this picture because a
malicious entity with access to the tool would also have access to Xen
directly, so they might as well replace the Xen binary.


>    - `mpu,device-memory-section`:
>    This section will cover all device memory that will be used in Xen. Like
>    `UART`, `GIC`, `SMMU` and other devices. We haven't considered multiple
>    `mpu,device-memory-section` scenarios. The devices' memory and RAM are
>    interleaving in physical address space, it would be required to use
>    multiple `mpu,device-memory-section` to cover all devices. This layout
>    is common on Armv8-A system, especially in server. But it's rare in
>    Armv8-R. So in current stage, we don't want to allow multiple
>    `mpu,device-memory-section`. The tool can scan baremetal device tree
>    to sort all devices' memory ranges. And calculate a proper region for
>    `mpu,device-memory-section`. If it find Xen need multiple
>    `mpu,device-memory-section`, it can report an unsupported error.
> 
> 2. Use a tool to generate device tree property and platform files
>    This opinion still uses the same inputs as opinion#1. But this tool only
>    generates `xen,static-mem` and `module` nodes in DomU nodes, it will not
>    generate `mpu,guest-memory-section`, `mpu,boot-module-section` and
>    `mpu,device-memory-section` properties in device tree. This will
>    generate following macros:
>    `MPU_GUEST_MEMORY_SECTION_BASE`, `MPU_GUEST_MEMORY_SECTION_SIZE`
>    `MPU_BOOT_MODULE_SECTION_BASE`, `MPU_BOOT_MODULE_SECTION_SIZE`
>    `MPU_DEVICE_MEMORY_SECTION_BASE`, `MPU_DEVICE_MEMORY_SECTION_SIZE`
>    in platform files in build time. In runtime, Xen will skip the device
>    tree parsing for `mpu,guest-memory-section`, `mpu,boot-module-section`
>    and `mpu,device-memory-section`. And instead Xen will use these macros
>    to do runtime check.
>    But, this also means these macros only exist in local build system,
>    these macros will not be maintained in Xen repo.

Yes this makes sense to me.

I think we should add both scripts to the imagebuilder repository. This
way, they could share code easily, and we can keep the documentation in
a single place.

