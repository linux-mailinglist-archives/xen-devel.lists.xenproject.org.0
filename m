Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3136AAB06A2
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 01:40:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979667.1366174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDAqY-0007xp-5a; Thu, 08 May 2025 23:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979667.1366174; Thu, 08 May 2025 23:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDAqY-0007w1-2b; Thu, 08 May 2025 23:40:10 +0000
Received: by outflank-mailman (input) for mailman id 979667;
 Thu, 08 May 2025 23:40:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QXoN=XY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDAqW-0007vv-M8
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 23:40:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c30d66d6-2c65-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 01:40:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 87E745C64F1;
 Thu,  8 May 2025 23:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24035C4CEE7;
 Thu,  8 May 2025 23:40:00 +0000 (UTC)
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
X-Inumbo-ID: c30d66d6-2c65-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747601;
	bh=mZxVjGpeSSpFLUdqkfS8uq9d2sBJk5V9W2sj3YRjbsQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nmWQYDDV33llq5/hzdJbYU83g66ERcuU1WGWZtl3UMoOpwgJfPIxI0X9rlrWb89vu
	 TSGgxfYmHMTsU6bqCGUZjiyMznHAQIv+LBW2+HV0XTGltUYIrmwNdcSj8h7Ppo3OJg
	 blOI9eJ8/gcwHb3htCEBfTar5gKxeFo45s17PMrXatMwLRv5t8Au51n5k1rFlnw2n7
	 rypE7YOmIlovxbZ5QX7Yzw9bsXsICkJY31fSkz9LKoAuDhS57uoVb/koSnZR84fo8I
	 /b7RUoVzEMsUPbHd7gMXI8jXYAL0IQkVKJjnupv7QqAs9mUR+5mWEoF66/seuItPEm
	 OXGbPELyIahEQ==
Date: Thu, 8 May 2025 16:39:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 5/6] xen/arm: exclude xen,reg from domU extended
 regions
In-Reply-To: <20250508132040.532898-6-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505081639510.3879245@ubuntu-linux-20-04-desktop>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com> <20250508132040.532898-6-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 May 2025, Stewart Hildebrand wrote:
> When a device is passed through to a dom0less domU, the xen,reg ranges
> may overlap with the extended regions. Remove xen,reg from extended
> regions.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Not sure if we need a Fixes: tag, but if we do:
> Fixes: 2a2447757b3c ("xen/arm: implement domU extended regions")
> 
> v1->v2:
> * adjust commit message to not mention xen,reg-cacheable
> * don't call rangeset_destroy() in construct_dom0()
> * rebase
> 
> I investigated an alternate approach of parsing the partial device tree
> again to scan for xen,reg properties, but it resulted in quite a lot of
> code duplication. Adding a rangeset pointer to "struct kernel_info" has
> a much smaller diffstat, and then we avoid the need to parse the partial
> device tree a second time.
> 
> I discovered this issue when booting a dom0less domU with a device
> passed through. Partial device tree excerpt:
> 
>     passthrough {
>         ... <snip> ...
> 
>         axi_uart16550_0: serial@a0001000 {
>             clocks = <&uart_fixed_clk>;
>             compatible = "ns16550a";
>             interrupt-parent = <&gic>;
>             interrupts = <0 89 4>;
>             reg = <0x0 0xa0001000 0x0 0x1000>;
>             reg-shift = <2>;
> 
>             xen,reg = <0x0 0xa0001000 0x00 0x1000 0x0 0xa0001000>;
>             xen,path = "/amba_pl@0/serial@a0000000";
>             xen,force-assign-without-iommu;
>         };
>     };
> 
> The domU was assigned an extended region overlapping with MMIO of the
> passed through device:
> 
> (XEN) d1: extended region 0: 0xa0000000->0x100000000
> (XEN) d1: extended region 1: 0x200000000->0xf000000000
> 
> The domU panicked when attempting to initialize the device:
> 
> [    3.490068] a0001000.serial: ttyS0 at MMIO 0xa0001000 (irq = 15, base_baud = 6249375) is a 16550A
> [    3.498843] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> [    3.498853] Mem abort info:
> [    3.498855]   ESR = 0x0000000096000044
> [    3.498859]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    3.498864]   SET = 0, FnV = 0
> [    3.498867]   EA = 0, S1PTW = 0
> [    3.498870]   FSC = 0x04: level 0 translation fault
> [    3.498874] Data abort info:
> [    3.498876]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
> [    3.498879]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
> [    3.498884]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    3.498888] [0000000000000010] user address but active_mm is swapper
> [    3.498894] Internal error: Oops: 0000000096000044 [#1] SMP
> [    3.498899] Modules linked in:
> [    3.498908] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.10-stew #1
> [    3.498917] pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    3.498924] pc : mem_serial_out+0x18/0x20
> [    3.498936] lr : serial8250_do_set_mctrl+0x6c/0xc0
> [    3.498943] sp : ffff800081bab6d0
> [    3.498946] x29: ffff800081bab6d0 x28: ffff8000815e0dc8 x27: ffff000001c29c60
> [    3.498957] x26: 0000000000000000 x25: ffff00000347b900 x24: ffff000005504c00
> [    3.498968] x23: ffff00000347b800 x22: 0000000000000000 x21: ffff800081b69d78
> [    3.498978] x20: ffff800081b69d78 x19: 0000000000000000 x18: ffffffffffffffff
> [    3.498989] x17: 3d20647561625f65 x16: 736162202c353120 x15: 3d20717269282030
> [    3.498999] x14: 3030313030306178 x13: ffff800081a21ff0 x12: 00000000000007fe
> [    3.499010] x11: 00000000000002aa x10: ffff800081a4dff0 x9 : ffff800081a21ff0
> [    3.499020] x8 : 00000000fffff7ff x7 : ffff800081a4dff0 x6 : 0000000000000008
> [    3.499030] x5 : 0000000000000000 x4 : ffff800080797584 x3 : 0000000000000002
> [    3.499040] x2 : 0000000000000000 x1 : 0000000000000010 x0 : 0000000000000000
> [    3.499050] Call trace:
> [    3.499053]  mem_serial_out+0x18/0x20
> [    3.499059]  serial8250_set_mctrl+0x34/0x40
> [    3.499065]  serial_core_register_port+0x534/0x7dc
> [    3.499075]  serial_ctrl_register_port+0x10/0x1c
> [    3.499084]  uart_add_one_port+0x10/0x1c
> [    3.499092]  serial8250_register_8250_port+0x308/0x4c0
> [    3.499102]  of_platform_serial_probe+0x2c4/0x48c
> [    3.499110]  platform_probe+0x68/0xdc
> [    3.499120]  really_probe+0xbc/0x298
> [    3.499128]  __driver_probe_device+0x78/0x12c
> [    3.499135]  driver_probe_device+0xdc/0x160
> [    3.499142]  __driver_attach+0x94/0x19c
> [    3.499149]  bus_for_each_dev+0x74/0xd0
> [    3.499155]  driver_attach+0x24/0x30
> [    3.499162]  bus_add_driver+0xe4/0x208
> [    3.499168]  driver_register+0x60/0x128
> [    3.499176]  __platform_driver_register+0x24/0x30
> [    3.499184]  of_platform_serial_driver_init+0x1c/0x28
> [    3.499192]  do_one_initcall+0x6c/0x1b0
> [    3.499199]  kernel_init_freeable+0x178/0x258
> [    3.499209]  kernel_init+0x20/0x1d0
> [    3.499218]  ret_from_fork+0x10/0x20
> [    3.499228] Code: f9400800 1ac32021 8b21c001 d50332bf (39000022)
> [    3.499233] ---[ end trace 0000000000000000 ]---
> [    3.499237] note: swapper/0[1] exited with irqs disabled
> [    3.499247] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    3.499251] SMP: stopping secondary CPUs
> [    3.499284] Kernel Offset: disabled
> [    3.499286] CPU features: 0x00,00000080,00200000,0200420b
> [    3.499292] Memory Limit: none
> [    3.792412] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> ---
>  xen/arch/arm/domain_build.c             |  7 +++++++
>  xen/common/device-tree/dom0less-build.c | 19 ++++++++++++++++++-
>  xen/include/xen/fdt-kernel.h            |  1 +
>  3 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 05a77a4f92c6..b189a7cfae9f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -973,6 +973,13 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>      if ( res )
>          goto out;
>  
> +    if ( kinfo->xen_reg_assigned )
> +    {
> +        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
> +        if ( res )
> +            goto out;
> +    }
> +
>      res = rangeset_report_ranges(mem_holes, 0,
>                                   PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
>                                   add_ext_regions, ext_regions);
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 4aa36c8ef33f..2c56f13771ab 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -146,6 +146,14 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>      int res;
>      paddr_t mstart, size, gstart;
>  
> +    if ( !kinfo->xen_reg_assigned )
> +    {
> +        kinfo->xen_reg_assigned = rangeset_new(NULL, NULL, 0);
> +
> +        if ( !kinfo->xen_reg_assigned )
> +            return -ENOMEM;
> +    }
> +
>      /* xen,reg specifies where to map the MMIO region */
>      cell = (const __be32 *)xen_reg->data;
>      len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
> @@ -187,6 +195,11 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>                     mstart, gstart);
>              return -EFAULT;
>          }
> +
> +        res = rangeset_add_range(kinfo->xen_reg_assigned, PFN_DOWN(gstart),
> +                                 PFN_DOWN(gstart + size - 1));
> +        if ( res )
> +            return res;
>      }
>  
>      /*
> @@ -814,7 +827,11 @@ static int __init construct_domU(struct domain *d,
>  
>      domain_vcpu_affinity(d, node);
>  
> -    return alloc_xenstore_params(&kinfo);
> +    rc = alloc_xenstore_params(&kinfo);
> +
> +    rangeset_destroy(kinfo.xen_reg_assigned);
> +
> +    return rc;
>  }
>  
>  void __init create_domUs(void)
> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
> index 7a6cd67c22f1..1939c3ebf7dc 100644
> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -24,6 +24,7 @@ struct kernel_info {
>  #ifdef CONFIG_STATIC_SHM
>      struct shared_meminfo shm_mem;
>  #endif
> +    struct rangeset *xen_reg_assigned;
>  
>      /* kernel entry point */
>      paddr_t entry;
> -- 
> 2.49.0
> 

