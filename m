Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D40450C0D0
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 22:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311242.528389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni0Ey-00039y-Ai; Fri, 22 Apr 2022 20:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311242.528389; Fri, 22 Apr 2022 20:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni0Ey-000371-7L; Fri, 22 Apr 2022 20:50:56 +0000
Received: by outflank-mailman (input) for mailman id 311242;
 Fri, 22 Apr 2022 20:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0EE=VA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ni0Ex-00036s-Bj
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 20:50:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e591712b-c27d-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 22:50:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 811C961E2E;
 Fri, 22 Apr 2022 20:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA93C385A4;
 Fri, 22 Apr 2022 20:50:50 +0000 (UTC)
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
X-Inumbo-ID: e591712b-c27d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650660650;
	bh=gFSZw1Eb+mNPjde0203NmcMSAeWbwTZAL8XaqiiefaA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MP55Ki1tdZUrSBQnPWt2qCAKbsLQkw/nf8VuC32V1kwaQ8iWPDsg9QJM3fu3wr67x
	 lb9NlZmuM39Dpw6X/WZeOSOZIdz9SDMSu+0CFJIZkrwfjzunHD9GnOHJp5fUZKsNK+
	 +/wj3WMf/ddGwo4mclvD+/U4c/2Hxeblx/xfRk1yUuhyj3rCBJydJj1HQkh+epQfGI
	 ib1yXRrbYRutHCnrCu6zAtuO2WfcwuBP3Vunfv5gtRwYp0OjSIGho57dTs2YYfUmao
	 U0hKFYZCXqoVrdMmsfxvjG9kVQcR5SQQXog5/9brk4Qt90fdskLvFSfbRMEur1j0os
	 lP2fosh+xFqDQ==
Date: Fri, 22 Apr 2022 13:50:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftB
In-Reply-To: <cdfe5b2c-3973-03d4-8fb2-dc8eab73b8b0@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204221338430.915916@ubuntu-linux-20-04-desktop>
References: <PAXPR08MB742064F5F00A18E09DEF66B69E1A9@PAXPR08MB7420.eurprd08.prod.outlook.com> <alpine.DEB.2.22.394.2204141613340.915916@ubuntu-linux-20-04-desktop> <cdfe5b2c-3973-03d4-8fb2-dc8eab73b8b0@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Apr 2022, Wei Chen wrote:
> On 2022/4/15 8:41, Stefano Stabellini wrote:
> > On Fri, 25 Mar 2022, Wei Chen wrote:
> > > # Proposal for Porting Xen to Armv8-R64
> > > 
> ...
> > > ## 2. Proposed changes of Xen
> > > ### **2.1. Changes of build system:**
> > > 
> > > - ***Introduce new Kconfig options for Armv8-R64***:
> > >    Unlike Armv8-A, because lack of MMU support on Armv8-R64, we may not
> > >    expect one Xen binary to run on all machines. Xen images are not common
> > >    across Armv8-R64 platforms. Xen must be re-built for different
> > > Armv8-R64
> > >    platforms. Because these platforms may have different memory layout and
> > >    link address.
> > >      - `ARM64_V8R`:
> > >        This option enables Armv8-R profile for Arm64. Enabling this option
> > >        results in selecting MPU. This Kconfig option is used to gate some
> > >        Armv8-R64 specific code except MPU code, like some code for
> > > Armv8-R64
> > >        only system ID registers access.
> > > 
> > >      - `ARM_MPU`
> > >        This option enables MPU on Armv8-R architecture. Enabling this
> > > option
> > >        results in disabling MMU. This Kconfig option is used to gate some
> > >        ARM_MPU specific code. Once when this Kconfig option has been
> > > enabled,
> > >        the MMU relate code will not be built for Armv8-R64. The reason why
> > >        not depends on runtime detection to select MMU or MPU is that, we
> > > don't
> > >        think we can use one image for both Armv8-R64 and Armv8-A64.
> > > Another
> > >        reason that we separate MPU and V8R in provision to allow to
> > > support MPU
> > >        on 32bit Arm one day.
> > > 
> > >    ***Try to use `if ( IS_ENABLED(CONFIG_ARMXXXX) )` instead of
> > > spreading***
> > >    ***`#ifdef CONFIG_ARMXXXX` everywhere, if it is possible.***
> > > 
> > > - ***About Xen start address for Armv8-R64***:
> > >    On Armv8-A, Xen has a fixed virtual start address (link address too) on
> > > all
> > >    Armv8-A platforms. In an MMU based system, Xen can map its loaded
> > > address
> > >    to this virtual start address. On Armv8-A platforms, the Xen start
> > > address
> > >    does not need to be configurable. But on Armv8-R platforms, they don't
> > > have
> > >    MMU to map loaded address to a fixed virtual address. And different
> > > platforms
> > >    will have very different address space layout, so it's impossible for
> > > Xen to
> > >    specify a fixed physical address for all Armv8-R platforms' start
> > > address.
> > > 
> > >    - `XEN_START_ADDRESS`
> > >      This option allows to set the custom address at which Xen will be
> > >      linked. This address must be aligned to a page size. Xen's run-time
> > >      addresses are the same as the link time addresses.
> > >      ***Notes: Fixed link address means the Xen binary could not be***
> > >      ***relocated by EFI loader. So in current stage, Xen could not***
> > >      ***be launched as an EFI application on Armv8-R64.(TODO#3.3)***
> > > 
> > >      - Provided by platform files.
> > >        We can reuse the existed arm/platforms store platform specific
> > > files.
> > >        And `XEN_START_ADDRESS` is one kind of platform specific
> > > information.
> > >        So we can use platform file to define default `XEN_START_ADDRESS`
> > > for
> > >        each platform.
> > > 
> > >      - Provided by Kconfig.
> > >        This option can be an independent or a supplymental option. Users
> > > can
> > >        define a customized `XEN_START_ADDRESS` to override the default
> > > value
> > >        in platform's file.
> > > 
> > >      - Generated from device tree by build scripts (optional)
> > >        Vendors who want to enable Xen on their Armv8-R platforms, they can
> > >        use some tools/scripts to parse their boards device tree to
> > > generate
> > >        the basic platform information. These tools/scripts do not
> > > necessarily
> > >        need to be integrated in Xen, but Xen can give some recommended
> > >        configuration. For example, Xen can recommend Armv8-R platforms to
> > > use
> > >        lowest ram start address + 2MB as the default Xen start address.
> > >        The generated platform files can be placed to arm/platforms for
> > >        maintenance.
> > > 
> > >      - Enable Xen PIC/PIE (optional)
> > >        We have mentioned about PIC/PIE in section 1.2. With PIC/PIE
> > > support,
> > >        Xen can run from everywhere it has been loaded. But it's rare to
> > > use
> > >        PIC/PIE on a real-time system (code size, more memory access). So a
> > >        partial PIC/PIE image maybe better (see 3. TODO section). But
> > > partial
> > >        PIC/PIE image may not solve this Xen start address issue.
> > 
> > I like the description of the XEN_START_ADDRESS problem and solutions.
> > 
> > For the initial implementation, a platform file is fine. We need to
> > start easy.
> > 
> > Afterwards, I think it would be far better to switch to a script that
> > automatically generates XEN_START_ADDRESS from the host device tree.
> > Also, if we provide a way to customize the start address via Kconfig,
> > then the script that reads the device tree could simply output the right
> > CONFIG_* option for Xen to build. It wouldn't even have to generate an
> > header file.
> 
> Ok,I will update the proposal to create two steps for XEN_START_ADDRESS:
> stage 1: Use the platform files for XEN_START_ADDRESS. If no platform
>          has been selected, provide Kconfig option for users to do
>          customization.
> stage 2: Try to switch to use scripts that can automatically generate
>          XEN_START_ADDRESS from the host device tree. But still keep
>          Kconfig customization option.
> 
> And for the PIC/PIE option,I will move it to TODO list so that we
> have records for future discussions.Becuase this feature for an
> MPU system, its priority is not very high.

That sounds good to me

 
> > > - ***About MPU initialization before parsing device tree***:
> > >        Before Xen can start parsing information from device tree and use
> > >        this information to setup MPU, Xen need an initial MPU state. This
> > >        is because:
> > >        1. More deterministic: Arm MPU supports background regions, if we
> > >           don't configure the MPU regions and don't enable MPU. The
> > > default
> > >           MPU background attributes will take effect. The default
> > > background
> > >           attributes are `IMPLEMENTATION DEFINED`. That means all RAM
> > > regions
> > >           may be configured to device memory and RWX. Random values in RAM
> > > or
> > >           maliciously embedded data can be exploited.
> > >        2. More compatible: On some Armv8-R64 platforms, if MPU is
> > > disabled,
> > >           the `dc zva` instruction will make the system halt (This is one
> > >           side effect of MPU background attributes, the RAM has been
> > > configured
> > >           as device memory). And this instruction will be embedded in some
> > >           built-in functions, like `memory set`. If we use `-ddont_use_dc`
> > > to
> > >           rebuild GCC, the built-in functions will not contain `dc zva`.
> > >           However, it is obviously unlikely that we will be able to
> > > recompile
> > >           all GCC for ARMv8-R64.
> > > 
> > >      - Reuse `XEN_START_ADDRESS`
> > >        In the very beginning of Xen boot, Xen just need to cover a limited
> > >        memory range and very few devices (actually only UART device). So
> > > we
> > >        can use two MPU regions to map:
> > >        1. `XEN_START_ADDRESS` to `XEN_START_ADDRESS + 2MB` or.
> > >           `XEN_START_ADDRESS` to `XEN_START_ADDRESS + image_size`as
> > >           normal memory.
> > >        2. `UART` MMIO region base to `UART` MMIO region end to device
> > > memory.
> > >        These two are enough to support Xen run in boot time. And we don't
> > > need
> > >        to provide additional platform information for initial normal
> > > memory
> > >        and device memory regions. In current PoC we have used this option
> > >        for implementation, and it's the same as Armv8-A.
> > > 
> > >      - Additional platform information for initial MPU state
> > >        Introduce some macros to allow users to set initial normal
> > >        memory regions:
> > >        `ARM_MPU_NORMAL_MEMORY_START` and `ARM_MPU_NORMAL_MEMORY_END`
> > >        and device memory:
> > >        `ARM_MPU_DEVICE_MEMORY_START` and `ARM_MPU_DEVICE_MEMORY_END`
> > >        These macros are the same platform specific information as
> > >        `XEN_START_ADDRESS`, so the options#1/#2/#3 of generating
> > >        `XEN_START_ADDRESS` also can be applied to these macros.
> > >        ***From our current PoC work, we think these macros may***
> > >        ***not be necessary. But we still place them here to see***
> > >        ***whether the community will have some different scenarios***
> > >        ***that we haven't considered.***
> > 
> > I think it is fine for now. And their values could be automatically
> > generated by the same script that will automatically generate
> > XEN_START_ADDRESS from the host device tree.
> > 
> 
> Ok, we will keep current PoC "Reuse `XEN_START_ADDRESS`" for
> day1 patch. We will update the proposal to address it. And place
> script generatation in stage2.
> 
> > 
> > > - ***Define new system registers for compiliers***:
> > >    Armv8-R64 is based on Armv8.4. That means we will use some Armv8.4
> > >    specific system registers. As Armv8-R64 only have secure state, so
> > >    at least, `VSTCR_EL2` and `VSCTLR_EL2` will be used for Xen. And the
> > >    first GCC version that supports Armv8.4 is GCC 8.1. In addition to
> > >    these, PMSA of Armv8-R64 introduced lots of MPU related system
> > > registers:
> > >    `PRBAR_ELx`, `PRBARx_ELx`, `PRLAR_ELx`, `PRLARx_ELx`, `PRENR_ELx` and
> > >    `MPUIR_ELx`. But the first GCC version to support these system
> > > registers
> > >    is GCC 11. So we have two ways to make compilers to work properly with
> > >    these system registers.
> > >    1. Bump GCC version to GCC 11.
> > >       The pros of this method is that, we don't need to encode these
> > >       system registers in macros by ourselves. But the cons are that,
> > >       we have to update Makefiles to support GCC 11 for Armv8-R64.
> > >       1.1. Check the GCC version 11 for Armv8-R64.
> > >       1.2. Add march=armv8r to CFLAGS for Armv8-R64.
> > >       1.3. Solve the confliction of march=armv8r and mcpu=generic
> > >      These changes will affect common Makefiles, not only Arm Makefiles.
> > >      And GCC 11 is new, lots of toolchains and Distro haven't supported
> > > it.
> > > 
> > >    2. Encode new system registers in macros ***(preferred)***
> > >          ```
> > >          /* Virtualization Secure Translation Control Register */
> > >          #define VSTCR_EL2  S3_4_C2_C6_2
> > >          /* Virtualization System Control Register */
> > >          #define VSCTLR_EL2 S3_4_C2_C0_0
> > >          /* EL1 MPU Protection Region Base Address Register encode */
> > >          #define PRBAR_EL1  S3_0_C6_C8_0
> > >          ...
> > >          /* EL2 MPU Protection Region Base Address Register encode */
> > >          #define PRBAR_EL2  S3_4_C6_C8_0
> > >          ...
> > >          ```
> > >       If we encode all above system registers, we don't need to bump GCC
> > >       version. And the common CFLAGS Xen is using still can be applied to
> > >       Armv8-R64. We don't need to modify Makefiles to add specific CFLAGS.
> > >       ***Notes:***
> > >       ***Armv8-R AArch64 supports the A64 ISA instruction set with***
> > >       ***some modifications:***
> > >       ***Redefines DMB, DSB, and adds an DFB. But actually, the***
> > >       ***encodings of DMB and DSB are still the same with A64.***
> > >       ***And DFB is an alias of DSB #12. In this case, we think***
> > >       ***we don't need a new architecture specific flag to***
> > >       ***generate new instructions for Armv8-R.***
> > 
> > I think that for the initial implementation either way is fine. I agree
> > that macros would be better than requiring GCC 11.
> > 
> 
> Ok. We will use macros in day1. We can have a standalone patch set
> to bump GCC version in the future. Based on some of the attempts we've
> made, it will affect some makefile scripts of common and other
> architectures.
> 
> 
> > 
> > > ### **2.2. Changes of the initialization process**
> > > 
> > > **A sample device tree of memory layout restriction**:
> > > ```
> > > chosen {
> > >      ...
> > >      /*
> > >       * Define a section to place boot modules,
> > >       * all boot modules must be placed in this section.
> > >       */
> > >      mpu,boot-module-section = <0x10000000 0x10000000>;
> > >      /*
> > >       * Define a section to cover all guest RAM. All guest RAM must be
> > > located
> > >       * within this section. The pros is that, in best case, we can only
> > > have
> > >       * one MPU protection region to map all guest RAM for Xen.
> > >       */
> > >      mpu,guest-memory-section = <0x20000000 0x30000000>;
> > >      /*
> > >       * Define a memory section that can cover all device memory that
> > >       * will be used in Xen.
> > >       */
> > >      mpu,device-memory-section = <0x80000000 0x7ffff000>;
> > >      /* Define a section for Xen heap */
> > >      xen,static-mem = <0x50000000 0x20000000>;
> > > 
> > >      domU1 {
> > >          ...
> > >          #xen,static-mem-address-cells = <0x01>;
> > >          #xen,static-mem-size-cells = <0x01>;
> > >          /* Statically allocated guest memory, within
> > > mpu,guest-memory-section */
> > >          xen,static-mem = <0x30000000 0x1f000000>;
> > > 
> > >          module@11000000 {
> > >              compatible = "multiboot,kernel\0multiboot,module";
> > >              /* Boot module address, within mpu,boot-module-section */
> > >              reg = <0x11000000 0x3000000>;
> > >              ...
> > >          };
> > > 
> > >          module@10FF0000 {
> > >                  compatible = "multiboot,device-tree\0multiboot,module";
> > >                  /* Boot module address, within mpu,boot-module-section */
> > >                  reg = <0x10ff0000 0x10000>;
> > >                  ...
> > >          };
> > >      };
> > > };
> > > ```
> > > It's little hard for users to compose such a device tree by hand. Based
> > > on the discussion of Draft-A, Xen community suggested users to use some
> > > tools like
> > > [imagebuilder](https://gitlab.com/ViryaOS/imagebuilder/-/blob/master/scripts/uboot-script-gen#L390)
> > > to generate the above device tree properties.
> > > Please goto TODO#3.3 section to get more details of this suggestion.
> > 
> > Yes, I think we'll need an ImageBuilder script to populate these entries
> > automatically. With George's help, I moved ImageBuilder to Xen Project.
> > This is the new repository: https://gitlab.com/xen-project/imagebuilder
> > 
> > The script to generate mpu,boot-module-section and the other mpu
> > addresses could be the same ImageBuilder script that generates also
> > XEN_START_ADDRESS.
> > 
> 
> That's great, I will update the link in proposal.
> 
> > 
> > > ### **2.4. Changes of memory management**
> > > Xen is coupled with VMSA, in order to port Xen to Armv8-R64, we have to
> > > decouple Xen from VMSA. And give Xen the ablity to manage memory in PMSA.
> ...          ```
> > > 
> > > ### **2.5. Changes of guest management**
> ...
> > > 
> > > ### **2.6. Changes of exception trap**
> ...
> > > 
> > > ### **2.5. Changes of device driver**
> ...
> > > 
> > > ## 3. TODO
> ...
> > > 
> > > ### 3.1. Alternative framework support
> ...
> > > 
> > > ### 3.2. Xen Event Channel Support
> ...
> > > ### 3.3. Xen Partial PIC/PIE
> ...
> > > 
> > > ### 3.4. A tool to generate Armv8-R Xen device tree
> > > 1. Use a tool to generate above device tree property.
> > >     This tool will have some similar inputs as below:
> > >     ---
> > >     DEVICE_TREE="fvp_baremetal.dtb"
> > >     XEN="4.16-2022.1/xen"
> > > 
> > >     NUM_DOMUS=1
> > >     DOMU_KERNEL[0]="4.16-2022.1/Image-domU"
> > >     DOMU_RAMDISK[0]="4.16-2022.1/initrd.cpio"
> > >     DOMU_PASSTHROUGH_DTB[0]="4.16-2022.1/passthrough-example-dev.dtb"
> > >     DOMU_RAM_BASE[0]=0x30000000
> > >     DOMU_RAM_SIZE[0]=0x1f000000
> > >     ---
> > >     Using above inputs, the tool can generate a device tree similar as
> > >     we have described in sample.
> > > 
> > >     - `mpu,guest-memory-section`:
> > >     This section will cover all guests' RAM (`xen,static-mem` defined
> > > regions
> > >     in all DomU nodes). All guest RAM must be located within this section.
> > >     In the best case, we can only have one MPU protection region to map
> > > all
> > >     guests' RAM for Xen.
> > > 
> > >     If users set `DOMU_RAM_BASE` and `DOMU_RAM_SIZE`, these will be
> > > converted
> > >     to the base and size of `xen,static-mem`. This tool will scan all
> > >     `xen, static-mem` in DomU nodes to determin the base and size of
> > >     `mpu,guest-memory-section`. If there is any other kind of memory usage
> > >     has been detected in this section, this tool can report an error.
> > >     Except build time check, Xen also need to do runtime check to prevent
> > > a
> > >     bad device tree that generated by malicious tools.
> > > 
> > >     If users set `DOMU_RAM_SIZE` only, this will be converted to the size
> > > of
> > >     `xen,static-mem` only. Xen will allocate the guest memory in runtime,
> > > but
> > >     not from Xen heap. `mpu,guest-memory-section` will be caculated in
> > > runtime
> > >     too. The property in device tree doesn't need or will be ignored by
> > > Xen.
> > 
> > I am fine with this. You should also know that there was a recent
> > discussion about adding something like:
> > 
> > # address size address size ...
> > DOMU_STATIC_MEM_RANGES[0]="0xe000000 0x1000000 0xa0000000 0x30000000"
> > 
> > to the ImageBuilder config file.
> > 
> 
> Thanks for this update : )
> 
> > 
> > >     - `mpu,boot-module-section`:
> > >     This section will be used to store the boot modules like DOMU_KERNEL,
> > >     DOMU_RAMDISK, and DOMU_PASSTHROUGH_DTB. Xen keeps all boot modules in
> > >     this section to meet the requirement of DomU restart on Armv8-R. In
> > >     current stage, we don't have a privilege domain like Dom0 that can
> > >     access filesystem to reload DomU images.
> > > 
> > >     And in current Xen code, the base and size are mandatory for boot
> > > modules
> > >     If users don't specify the base of each boot module, the tool will
> > >     allocte a base for each module. And the tool will generate the
> > >     `mpu,boot-module-section` region, when it finishs boot module memory
> > >     allocation.
> > > 
> > >     Users also can specify the base and size of each boot module, these
> > > will
> > >     be converted to the base and size of module's `reg` directly. The tool
> > >     will scan all modules `reg` in DomU nodes to generate the base and
> > > size of
> > >     `mpu,boot-module-section`. If there is any kind of other memory usage
> > >     has been detected in this section, this tool can report an error.
> > >     Except build time check, Xen also need to do runtime check to prevent
> > > a
> > >     bad device tree that generated by malicious tools.
> > 
> > Xen should always check for the validity of its input. However I should
> > point out that there is no "malicious tool" in this picture because a
> > malicious entity with access to the tool would also have access to Xen
> > directly, so they might as well replace the Xen binary.
> > 
> 
> Ok, I will drop the "malicious tools". But I think the "bug tools" still
> can be possible : )
> 
> > 
> > >     - `mpu,device-memory-section`:
> > >     This section will cover all device memory that will be used in Xen.
> > > Like
> > >     `UART`, `GIC`, `SMMU` and other devices. We haven't considered
> > > multiple
> > >     `mpu,device-memory-section` scenarios. The devices' memory and RAM are
> > >     interleaving in physical address space, it would be required to use
> > >     multiple `mpu,device-memory-section` to cover all devices. This layout
> > >     is common on Armv8-A system, especially in server. But it's rare in
> > >     Armv8-R. So in current stage, we don't want to allow multiple
> > >     `mpu,device-memory-section`. The tool can scan baremetal device tree
> > >     to sort all devices' memory ranges. And calculate a proper region for
> > >     `mpu,device-memory-section`. If it find Xen need multiple
> > >     `mpu,device-memory-section`, it can report an unsupported error.
> > > 
> > > 2. Use a tool to generate device tree property and platform files
> > >     This opinion still uses the same inputs as opinion#1. But this tool
> > > only
> > >     generates `xen,static-mem` and `module` nodes in DomU nodes, it will
> > > not
> > >     generate `mpu,guest-memory-section`, `mpu,boot-module-section` and
> > >     `mpu,device-memory-section` properties in device tree. This will
> > >     generate following macros:
> > >     `MPU_GUEST_MEMORY_SECTION_BASE`, `MPU_GUEST_MEMORY_SECTION_SIZE`
> > >     `MPU_BOOT_MODULE_SECTION_BASE`, `MPU_BOOT_MODULE_SECTION_SIZE`
> > >     `MPU_DEVICE_MEMORY_SECTION_BASE`, `MPU_DEVICE_MEMORY_SECTION_SIZE`
> > >     in platform files in build time. In runtime, Xen will skip the device
> > >     tree parsing for `mpu,guest-memory-section`, `mpu,boot-module-section`
> > >     and `mpu,device-memory-section`. And instead Xen will use these macros
> > >     to do runtime check.
> > >     But, this also means these macros only exist in local build system,
> > >     these macros will not be maintained in Xen repo.
> > 
> > Yes this makes sense to me.
> > 
> > I think we should add both scripts to the imagebuilder repository. This
> > way, they could share code easily, and we can keep the documentation in
> > a single place.
> 
> Can I understand your comments like, we can support above two options.
> Users can select to use either way. If the select the option#2 script,
> MPU_GUEST_MEMORY_SECTION_BASE will be detected by Xen code, and Xen
> can bypass the device tree parser. If Xen can't detected
> MPU_GUEST_MEMORY_SECTION_BASE, Xen can treat that users selected to
> use option#1 scripts, Xen will do DT parser.

Yes, that is what I meant. Both options are acceptable and we could
support both. The main difference for the user is that option #2
requires a Xen build after running ImageBuilder, while option #1 might
not.

Of course you don't have to implement both options right away. If you
have to pick one for the initial implementation I think it might be
easier to use option 1 as it is more similar to the current way of doing
things.

