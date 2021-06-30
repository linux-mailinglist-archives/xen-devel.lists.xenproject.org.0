Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2D53B7B1C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 02:44:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148099.273568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyOKA-0005Az-3W; Wed, 30 Jun 2021 00:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148099.273568; Wed, 30 Jun 2021 00:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyOKA-000594-0C; Wed, 30 Jun 2021 00:43:30 +0000
Received: by outflank-mailman (input) for mailman id 148099;
 Wed, 30 Jun 2021 00:43:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZaJs=LY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lyOK7-00058y-In
 for xen-devel@lists.xen.org; Wed, 30 Jun 2021 00:43:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e25435b7-e2bb-4986-91f5-e5ddef50724f;
 Wed, 30 Jun 2021 00:43:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 365A461584;
 Wed, 30 Jun 2021 00:43:25 +0000 (UTC)
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
X-Inumbo-ID: e25435b7-e2bb-4986-91f5-e5ddef50724f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625013805;
	bh=nifXhRNkDUFY6e07rBpxMiom6KNdsFobBAMY357YZOc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NPIaFHQh3qvY4MLjJQcJH8Gh0EF+VuTM+ndy88BROb1H+mnWY6xerzPCzpmP5PKFW
	 rzGIjxggupzQE4bV3AVoxKdusDPsihfxF6zUvjRzJ4dqduxjp+dWLFTCNPfgpTAwox
	 ItgC3oCowtMd2PIVSPf3mte4c5JNUAsWLZ543sc+Mo1RZvRrHmnF1jSxw709b9pMMA
	 SgLPPVw2LRvJO06c+dI8wtPoyTVlCfpPtXGMs3RgKFulWFhzuTGpLpc2qXRCGVN5lM
	 NMxtWQ3Aad21dfBK6I2wOsgd+hpche/71RsC0CocNwQ7WTAvP484FCsaEM56DmeVVC
	 4P7xRT3AzEDEQ==
Date: Tue, 29 Jun 2021 17:43:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: will@kernel.org, julien.thierry.kdev@gmail.com, Wei.Chen@arm.com
cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
    "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, 
    "jean-philippe@linaro.org" <jean-philippe@linaro.org>, 
    Julien Grall <julien@xen.org>, Andre Przywara <Andre.Przywara@arm.com>, 
    Marc Zyngier <maz@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: Re: [Kvmtool] Some thoughts on using kvmtool Virtio for Xen
In-Reply-To: <DB9PR08MB6857B375207376D8320AFBA89E309@DB9PR08MB6857.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2106291716560.9437@sstabellini-ThinkPad-T480s>
References: <DB9PR08MB6857B375207376D8320AFBA89E309@DB9PR08MB6857.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Wei,

Sorry for the late reply.


On Tue, 15 Jun 2021, Wei Chen wrote:
> Hi,
> 
> I have some thoughts of using kvmtool Virtio implementation
> for Xen. I copied my markdown file to this email. If you have
> time, could you please help me review it?
> 
> Any feedback is welcome!
> 
> # Some thoughts on using kvmtool Virtio for Xen
> ## Background
> 
> Xen community is working on adding VIRTIO capability to Xen. And we're working
> on VIRTIO backend of Xen. But except QEMU can support virtio-net for x86-xen,
> there is not any VIRTIO backend can support Xen. Because of the community's
> strong voice of Out-of-QEMU, we want to find a light weight VIRTIO backend to
> support Xen.
> 
> We have an idea of utilizing the virtio implementaton of kvmtool for Xen. And
> We know there was some agreement that kvmtool won't try to be a full QEMU
> alternative. So we have written two proposals in following content for
> communities to discuss in public:
> 
> ## Proposals
> ### 1. Introduce a new "dm-only" command
> 1. Introduce a new "dm-only" command to provide a pure device model mode. In
>    this mode, kvmtool only handles IO request. VM creation and initialization
>    will be bypassed.
> 
>     * We will rework the interface between the virtio code and the rest of
>     kvmtool, to use just the minimal set of information. At the end, there
>     would be MMIO accesses and shared memory that control the device model,
>     so that could be abstracted to do away with any KVM specifics at all. If
>     this is workable, we will send the first set of patches to introduce this
>     interface, and adapt the existing kvmtool to it. Then later we will can
>     add Xen support on top of it.
> 
>     About Xen support, we will detect the presence of Xen libraries, also
>     allow people to ignore them, as kvmtoll do with optional features like
>     libz or libaio.
> 
>     Idealy, we want to move all code replying on Xen libraries to a set of
>     new files. In this case, thes files can only be compiled when Xen
>     libraries are detected. But if we can't decouple this code completely,
>     we may introduce a bit of #ifdefs to protect this code.
> 
>     If kvm or other VMM do not need "dm-only" mode. Or "dm-only" can not
>     work without Xen libraries. We will make "dm-only" command depends on
>     the presence of Xen libraries.
> 
>     So a normal compile (without the Xen libraries installed) would create
>     a binary as close as possible to the current code, and only the people
>     who having Xen libraries installed would ever generate a "dm-only"
>     capable kvmtool.
> 
> ### 2. Abstract kvmtool virtio implementation as a library
> 1. Add a kvmtool Makefile target to generate a virtio library. In this
>    scenario, not just Xen, but any project else want to provide a
>    userspace virtio backend service can link to this virtio libraris.
>    These users would benefit from the VIRTIO implementation of kvmtool
>    and will participate in improvements, upgrades, and maintenance of
>    the VIRTIO libraries.
> 
>     * In this case, Xen part code will not upstream to kvmtool repo,
>       it would then be natural parts of the xen repo, in xen/tools or
>       maintained in other repo.
> 
>       We will have a completely separate VIRTIO backend for Xen, just
>       linking to kvmtool's VIRTIO library.
> 
>     * The main changes of kvmtool would be:
>         1. Still need to rework the interface between the virtio code
>            and the rest of kvmtool, to abstract the whole virtio
>            implementation into a library
>         2. Modify current build system to add a new virtio library target.


I don't really have a preference between the two.

From my past experience with Xen enablement in QEMU, I can say that the
Xen part of receiving IO emulation requests is actually pretty minimal.
See as a reference
https://github.com/qemu/qemu/blob/13d5f87cc3b94bfccc501142df4a7b12fee3a6e7/hw/i386/xen/xen-hvm.c#L1163.
The modifications to rework the internal interfaces that you listed
below are far more "interesting" than the code necessary to receive
emulation requests from Xen.

So it looks like option-1 would be less efforts and fewer code changes
overall to kvmtools. Option-2 is more work. The library could be nice to
have but then we would have to be very careful about the API/ABI,
compatibility, etc.

Will Deacon and Julien Thierry might have an opinion.



> ## Reworking the interface is the common work for above proposals
> **In kvmtool, one virtual device can be separated into three layers:**
> 
> - A device type layer to provide an abstract
>     - Provide interface to collect and store device configuration.
>         Using block device as an example, kvmtool is using disk_image to
>         -  collect and store disk parameters like:
>             -  backend image format: raw, qcow or block device
>             -  backend block device or file image path
>             -  Readonly, direct and etc
>     - Provide operations to interact with real backend devices or services:
>         - provide backend device operations:
>             - block device operations
>             - raw image operations
>             - qcow image operations
> - Hypervisor interfaces
>     - Guest memory mapping and unmapping interfaces
>     - Virtual device register interface
>         - MMIO/PIO space register
>         - IRQ register
>     - Virtual IRQ inject interface
>     - Hypervisor eventfd interface

The "hypervisor interfaces" are the ones that are most interesting as we
need an alternative implementation for Xen for each of them. This is
the part that was a bit more delicate when we added Xen support to QEMU.
Especially the memory mapping and unmapping. All doable but we need
proper abstractions.


> - An implementation layer to handle guest IO request.
>     - Kvmtool provides virtual devices for guest. Some virtual devices two
>       kinds of implementations:
>         - VIRTIO implementation
>         - Real hardware emulation
> 
> For example, kvmtool console has virtio console and 8250 serial two kinds
> of implementations. These implementation depends on device type parameters
> to create devices, and depends on device type ops to forward data from/to
> real device. And the implementation will invoke hypervisor interfaces to
> map/unmap resources and notify guest.
> 
> In the current kvmtool code, the boundaries between these three layers are
> relatively clear, but there are a few pieces of code that are somewhat
> interleaved, for example:
> - In virtio_blk__init(...) function, the code will use disk_image directly.
>   This data is kvmtool specified. If we want to make VIRTIO implementation
>   become hypervisor agnostic. Such kind of code should be moved to other
>   place. Or we just keep code from virtio_blk__init_one(...) in virtio block
>   implementation, but keep virtio_blk__init(...) in kvmtool specified part
>   code.
> 
> However, in the current VIRTIO device creation and data handling process,
> the device type and hypervisor API used are both exclusive to kvmtool and
> KVM. If we want to use current VIRTIO implementation for other device
> models and hypervisors, it is unlikely to work properly.
> 
> So, the major work of reworking interface is decoupling VIRTIO implementation
> from kvmtool and KVM.
> 
> **Introduce some intermediate data structures to do decouple:**
> 1. Introduce intermedidate type data structures like `virtio_disk_type`,
>    `virtio_net_type`, `virtio_console_type` and etc. These data structures
>    will be the standard device type interfaces between virtio device
>    implementation and hypervisor.  Using virtio_disk_type as an example:
>     ~~~~
>     struct virtio_disk_type {
>         /*
>          * Essential configuration for virtio block device can be got from
>          * kvmtool disk_image. Other hypervisor device model also can use
>          * this data structure to pass necessary parameters for creating
>          * a virtio block device.
>          */
>         struct virtio_blk_cfg vblk_cfg;
>         /*
>          * Virtio block device MMIO address and IRQ line. These two members
>          * are optional. If hypervisor provides allocate_mmio_space and
>          * allocate_irq_line capability and device model doesn't set these
>          * two fields, virtio block implementation will use hypervisor APIs
>          * to allocate MMIO address and IRQ line. If these two fields are
>          * configured, virtio block implementation will use them.
>          */
>         paddr_t addr;
>         uint32_t irq;
>         /*
>          * In kvmtool, this ops will connect to disk_image APIs. Other
>          * hypervisor device model should provide similar APIs for this
>          * ops to interact with real backend device.
>          */
>         struct disk_type_ops {
>             .read
>             .write
>             .flush
>             .wait
>             ...
>         } ops;
>     };
>     ~~~~
> 
> 2. Introduce a intermediate hypervisor data structure. This data structure
>    provides a set of standard hypervisor API interfaces. In virtio
>    implementation, the KVM specified APIs, like kvm_register_mmio, will not
>    be invoked directly. The virtio implementation will use these interfaces
>    to access hypervisor specified APIs. for example `struct vmm_impl`:
>     ~~~~
>     struct vmm_impl {
>         /*
>          * Pointer that link to real hypervisor handle like `struct kvm *kvm`.
>          * This pointer will be passed to the vmm ops;
>          */
>         void *vmm;
>         allocate_irq_line_fn_t(void* vmm, ...);
>         allocate_mmio_space_fn_t(void* vmm, ...);
>         register_mmio_fn_t(void* vmm, ...);
>         map_guest_page_fn_t(void* vmm, ...);
>         unmap_guest_page_fn_t(void* vmm, ...);
>         virtual_irq_inject_fn_t(void* vmm, ...);
>     };
>     ~~~~

Are the map_guest_page and unmap_guest_page functions already called at
the appropriate places for KVM?

If not, the main issue is going to be adding the
map_guest_page/unmap_guest_page calls to the virtio device
implementations.

 
> 3. After decoupled with kvmtool, any hypervisor can use standard `vmm_impl`
>    and `virtio_xxxx_type` interfaces to invoke standard virtio implementation
>    interfaces to create virtio devices.
>     ~~~~
>     /* Prepare VMM interface */
>     struct vmm_impl *vmm = ...;
>     vmm->register_mmio_fn_t = kvm__register_mmio;
>     /* kvm__map_guset_page is a wrapper guest_flat_to_host */
>     vmm->map_guest_page_fn_t = kvm__map_guset_page;
>     ...
> 
>     /* Prepare virtio_disk_type */
>     struct virtio_disk_type *vdisk_type = ...;
>     vdisk_type->vblk_cfg.capacity = disk_image->size / SECTOR_SIZE;
>     ...
>     vdisk_type->ops->read = disk_image__read;
>     vdisk_type->ops->write = disk_image__write;
>     ...
> 
>     /* Invoke VIRTIO implementation API to create a virtio block device */
>     virtio_blk__init_one(vmm, vdisk_type);
>     ~~~~
> 
> VIRTIO block device simple flow before reworking interface:
> https://drive.google.com/file/d/1k0Grd4RSuCmhKUPktHj9FRamEYrPCFkX/view?usp=sharing
> ![image](https://drive.google.com/uc?export=view&id=1k0Grd4RSuCmhKUPktHj9FRamEYrPCFkX)
> 
> VIRTIO block device simple flow after reworking interface:
> https://drive.google.com/file/d/1rMXRvulwlRO39juWf08Wgk3G1NZtG2nL/view?usp=sharing
> ![image](https://drive.google.com/uc?export=view&id=1rMXRvulwlRO39juWf08Wgk3G1NZtG2nL)
> 
> 
> Thanks,
> Wei Chen
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
> 

