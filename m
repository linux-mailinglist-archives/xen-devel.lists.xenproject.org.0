Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427DE233CD1
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 03:16:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Jey-0008RF-Rz; Fri, 31 Jul 2020 01:16:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F22U=BK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k1Jex-0008R4-CO
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 01:16:31 +0000
X-Inumbo-ID: 76c934f6-d2cb-11ea-ab62-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76c934f6-d2cb-11ea-ab62-12813bfff9fa;
 Fri, 31 Jul 2020 01:16:30 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A10AC208E4;
 Fri, 31 Jul 2020 01:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596158189;
 bh=oQnDEu+vx9knS9OTqiu3fPGLwbvblGwGetKQP0J6G4U=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=f2OWWMyknAxPzQgwAzEXK5myl9fNMuw6eVOFGvRKygAr9RXWMbDoLW/6ZVdm1wALC
 t7xKBJtuwVYJ4e7yizrIoGI2SptfwLuN5UN3No6hvZdX8W+M0eUOvoGCLbxKAnILxZ
 QFXL9L73I68O2lORjwatHMsZgCOZtqK9wpg9+Mjc=
Date: Thu, 30 Jul 2020 18:16:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: srini@yujala.com
Subject: Re: Porting Xen to Jetson Nano
In-Reply-To: <bd49b460d390cd547ea0ca77e5a20f2d@yujala.com>
Message-ID: <alpine.DEB.2.21.2007301303340.1767@sstabellini-ThinkPad-T480s>
References: <002801d66051$90fe2300$b2fa6900$@yujala.com>
 <9736680b-1c81-652b-552b-4103341bad50@xen.org>
 <000001d661cb$45cdaa10$d168fe30$@yujala.com>
 <5f985a6a-1bd6-9e68-f35f-b0b665688cee@xen.org>
 <67c102642b0932d88ab2f70e96742ef0@yujala.com>
 <alpine.DEB.2.21.2007291756380.1767@sstabellini-ThinkPad-T480s>
 <bd49b460d390cd547ea0ca77e5a20f2d@yujala.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 'Christopher Clark' <christopher.w.clark@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 30 Jul 2020, srini@yujala.com wrote:
> On 2020-07-30 01:27, Stefano Stabellini wrote:
> > On Wed, 29 Jul 2020, srini@yujala.com wrote:
> > > Hi Julien,
> > > 
> > > On 2020-07-24 17:25, Julien Grall wrote:
> > > > On 24/07/2020 16:01, Srinivas Bangalore wrote:
> > > >
> > > > I struggled to find your comment inline as your e-mail client doesn't
> > > > quote my answer. Please configure your e-mail client to use some form
> > > > of quoting (the usual is '>').
> > > >
> > > >
> > > I have switched to a web-based email client, so I hope this is better now.
> > 
> > Seems better, thank you
> > 
> > 
> > > > > (XEN) Freed 296kB init memory.
> > > > > (XEN) dom0 IPA 0x0000000088080000
> > > > > (XEN) P2M @ 0000000803fc3d40 mfn:0x17f0f5
> > > > > (XEN) 0TH[0x0] = 0x004000017f0f377f
> > > > > (XEN) 1ST[0x2] = 0x02c00000800006fd
> > > > > (XEN) Mem access check
> > > > > (XEN) dom0 IPA 0x0000000088080000
> > > > > (XEN) P2M @ 0000000803fc3d40 mfn:0x17f0f5
> > > > > (XEN) 0TH[0x0] = 0x004000017f0f377f
> > > > > (XEN) 1ST[0x2] = 0x02c00000800006fd
> > > > > (XEN) Mem access check
> > > >
> > > > The instruction abort issue looks normal as the mapping is marked as
> > > > non-executable.
> > > >
> > > > Looking at the rest of bits, bits 55:58 indicates the type of mapping
> > > > used. The value suggest the mapping has been considered to be used
> > > > p2m_mmio_direct_c (RW cacheable MMIO). This looks wrong to me because
> > > > RAM should be mapped using p2m_ram_rw.
> > > >
> > > > Looking at your DT, it looks like the region is marked as reserved. On
> > > > Xen 4.8, reserved-memory region are not correctly handled (IIRC this
> > > > was only fixed in Xen 4.13). This should be possible to confirm by
> > > > enable CONFIG_DEVICE_TREE_DEBUG in your .config.
> > > >
> > > > The option will debug more information about the mapping to dom0 on
> > > > your console.
> > > >
> > > > However, given you are using an old release, you are at risk at keep
> > > > finding bugs that have been resolved in more recent releases. It would
> > > > probably better if you switch to Xen 4.14 and report any bug you can
> > > > find there.
> > > >
> > > Ok. I applied to patch series to 4.14. Enabled EARLY_PRINTK, CONFIG_DEBUG
> > > and
> > > DEVICE_TREE_DEBUG.
> > > Here's the log...
> > > 
> > > ## Flattened Device Tree blob at e3500000
> > >    Booting using the fdt blob at 0xe3500000
> > >    reserving fdt memory region: addr=80000000 size=20000
> > >    reserving fdt memory region: addr=e3500000 size=35000
> > >    Loading Device Tree to 00000000fc7f8000, end 00000000fc82ffff ... OK
> > > 
> > > Starting kernel ...
> > > 
> > > - UART enabled -
> > > - Boot CPU booting -
> > > - Current EL 00000008 -
> > > - Initialize CPU -
> > > - Turning on paging -
> > > - Zero BSS -
> > > - Ready -
> > > (XEN) Invalid size for reg
> > > (XEN) fdt: node `reserved-memory': parsing failed
> > > (XEN)
> > > (XEN) MODULE[0]: 00000000e0000000 - 00000000e014b0c8 Xen
> > > (XEN) MODULE[1]: 00000000fc7f8000 - 00000000fc82d000 Device Tree
> > > (XEN)  RESVD[0]: 0000000080000000 - 0000000080020000
> > > (XEN)  RESVD[1]: 00000000e3500000 - 00000000e3535000
> > > (XEN)  RESVD[2]: 00000000fc7f8000 - 00000000fc82d000
> > > (XEN)  RESVD[3]: 0000000040001000 - 000000004003ffff
> > > (XEN)  RESVD[4]: 00000000b0000000 - 00000000b01fffff
> > > (XEN)
> > > (XEN)
> > > (XEN) Command line: console=dtuart sync_console dom0_mem=128M loglvl=debug
> > > guest_loglvl=debug console_to_ring
> > > (XEN) Xen BUG at page_alloc.c:398
> > > (XEN) ----[ Xen-4.14.0  arm64  debug=y   Not tainted ]----
> > > (XEN) CPU:    0
> > > (XEN) PC:     00000000002b7b90 alloc_boot_pages+0x38/0x9c
> > > (XEN) LR:     00000000002cda04
> > > (XEN) SP:     0000000000307d40
> > > (XEN) CPSR:   a00003c9 MODE:64-bit EL2h (Hypervisor, handler)
> > > (XEN)      X0: 000fc80000002000  X1: 0000000000002000  X2:
> > > 0000000000000000
> > > (XEN)      X3: 000fffffffffffff  X4: ffffffffffffffff  X5:
> > > 0000000000000000
> > > (XEN)      X6: 0000000000307df0  X7: 0000000000000003  X8:
> > > 0000000000000008
> > > (XEN)      X9: fffffffffffffffb X10: 0101010101010101 X11:
> > > 0000000000000007
> > > (XEN)     X12: 0000000000000004 X13: ffffffffffffffff X14:
> > > ffffffffff000000
> > > (XEN)     X15: ffffffffffffffff X16: 0000000000000000 X17:
> > > 0000000000000000
> > > (XEN)     X18: 00000000fc834dd0 X19: 00000000002b5000 X20:
> > > 00000000fc7f8000
> > > (XEN)     X21: 00000000fc7f8000 X22: 0000000000000000 X23:
> > > fc80000000000038
> > > (XEN)     X24: 00000000fed9de28 X25: ffffffffffffffff X26:
> > > fc80000002000000
> > > (XEN)     X27: 0000000002000000 X28: 0000000000000000  FP:
> > > 0000000000307d40
> > > (XEN)
> > > (XEN)   VTCR_EL2: 80000000
> > > (XEN)  VTTBR_EL2: 0000000000000000
> > > (XEN)
> > > (XEN)  SCTLR_EL2: 30cd183d
> > > (XEN)    HCR_EL2: 0000000000000038
> > > (XEN)  TTBR0_EL2: 00000000e0145000
> > > (XEN)
> > > (XEN)    ESR_EL2: f2000001
> > > (XEN)  HPFAR_EL2: 0000000000000000
> > > (XEN)    FAR_EL2: 0000000000000000
> > > (XEN)
> > > (XEN) Xen stack trace from sp=0000000000307d40:
> > > (XEN)    0000000000307df0 00000000002cf114 0000000000000000
> > > 0000000000307d68
> > > (XEN)    00000000fc7f8000 00000000002ceeb0 0000000000400000
> > > 00676e69725f6f74
> > > (XEN)    ffffffffffffffff 0000000000000000 0000000000000000
> > > 0000000000307df0
> > > (XEN)    0000000000307df0 00000000002cef58 000000003fffffff
> > > 00000000fc7f8000
> > > (XEN)    00000000fc7f8000 000fc80000002000 0000000000400000
> > > 0080000000000000
> > > (XEN)    0000000000000000 000000000003ffff 00000000fc831170
> > > 00000000002001b8
> > > (XEN)    00000000e0000000 00000000dfe00000 00000000fc7f8000
> > > 0000000000000000
> > > (XEN)    0000000000400000 00000000fed9de28 0000000000000000
> > > 0000000000000000
> > > (XEN)    0000000000000000 0000000000000400 0000000000000000
> > > 0000000000035000
> > > (XEN)    00000000fc7f8000 0000000000000000 0000000000000000
> > > 0000000000000000
> > > (XEN)    0000000000000000 0000000300000000 0000000000000000
> > > 00000040ffffffff
> > > (XEN)    00000000ffffffff 0000000000000000 0000000000000000
> > > 0000000000000000
> > > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > > 0000000000000000
> > > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > > 0000000000000000
> > > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > > 0000000000000000
> > > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > > 0000000000000000
> > > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > > 0000000000000000
> > > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > > 0000000000000000
> > > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > > 0000000000000000
> > > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > > 0000000000000000
> > > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > > 0000000000000000
> > > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > > 0000000000000000
> > > (XEN) Xen call trace:
> > > (XEN)    [<00000000002b7b90>] alloc_boot_pages+0x38/0x9c (PC)
> > > (XEN)    [<00000000002cda04>] setup_frametable_mappings+0xb4/0x310 (LR)
> > > (XEN)    [<00000000002cf114>] start_xen+0x3a0/0xc48
> > > (XEN)    [<00000000002001b8>] arm64/head.o#primary_switched+0x10/0x30
> > > (XEN)
> > > (XEN)
> > > (XEN) ****************************************
> > > (XEN) Panic on CPU 0:
> > > (XEN) Xen BUG at page_alloc.c:398
> > > (XEN) ****************************************
> > > (XEN)
> > > (XEN) Reboot in five seconds...
> > > 
> > > There seems to be a problem with the DT in the 'reserved-memory' node.  I
> > > commented out the fb0-carveout, fb1-carveout sections, recompiled and
> > > tried to
> > > boot again.
> > 
> > Yes, those reserved-memory nodes won't work correctly with Xen
> > unfortunately: they either use "size" instead of "reg" (vpr-carveout) or
> > they specify "no-map". Only regular "reg" reserved memory regions
> > without "no-map" are properly parsed by Xen at the moment.
> > 
> > 
> 
> I'll try to modify the nodes that use 'size and replace with 'reg'.
> 
> > 
> > > This time the log shows the device tree messages (see attached log
> > > file), but Xen fails at this point...
> > > 
> > > (XEN) Allocating PPI 16 for event channel interrupt
> > > (XEN) Create hypervisor node
> > > (XEN) Create PSCI node
> > > (XEN) Create cpus node
> > > (XEN) Create cpu@0 (logical CPUID: 0) node
> > > (XEN) Create cpu@1 (logical CPUID: 1) node
> > > (XEN) Create cpu@2 (logical CPUID: 2) node
> > > (XEN) Create cpu@3 (logical CPUID: 3) node
> > > (XEN) Create memory node (reg size 4, nr cells 4)
> > > (XEN)   Bank 0: 0xe8000000->0xf0000000
> > > (XEN) Create memory node (reg size 4, nr cells 8)
> > > (XEN)   Bank 0: 0x40001000->0x40040000
> > > (XEN)   Bank 1: 0xb0000000->0xb0200000
> > > (XEN) Loading zImage from 00000000e1000000 to
> > > 00000000e8080000-00000000ea23c808
> > > (XEN)
> > > (XEN) ****************************************
> > > (XEN) Panic on CPU 0:
> > > (XEN) Unable to copy the kernel in the hwdom memory
> > > (XEN) ****************************************
> > > (XEN)
> > > 
> > > Device tree and log file attached. Is there an issue with the DT? Any
> > > pointers
> > > on where I should be looking next?
> > 
> > Is it possible that the kernel image was loaded on a memory area not
> > recognized as ram?
> > 
> > So xen/arch/arm/guestcopy.c:translate_get_page fails the check
> > p2m_is_ram?
> > 
> The failure happens before p2m_is_ram is called.
> This line:
> page = get_page_from_gfn(info.gpa.d, paddr_to_pfn(addr), &p2mt, P2M_ALLOC);
> 
> returns a NULL pointer.

Could you add a couple of printks to know exactly where it fails inside
get_page_from_gfn? I imagine it would be somewhere in
xen/arch/arm/p2m.c:p2m_get_page_from_gfn ?


> > That would happen for instance if a device or special node is also
> > covering that address range.
> 
> Is there a way to check such conflicts?

Nothing automatic. I went through the DTS manually and couldn't spot
any conflicts unfortunately.


On a different note, I noticed that you gave 128MB to Dom0 which is not
much; I am saying that because sometimes when you don't give enough
memory to dom0 you get similar errors. Note that it doesn't look like
this is the source of the issue we are seeing here, but I thought it is
worth mentioning.

Also to help with debugging, you might want to use an Image for Dom0,
rather than a zImage, just to eliminate another potential source of
issues.

