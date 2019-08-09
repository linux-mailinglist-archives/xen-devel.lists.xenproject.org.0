Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F7687013
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 05:12:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvvDm-0002Wd-97; Fri, 09 Aug 2019 03:05:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TVGo=WF=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
 id 1hvvDk-0002WY-5F
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 03:05:36 +0000
X-Inumbo-ID: 84ff0b1e-ba52-11e9-a454-f77ad83dd1f6
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84ff0b1e-ba52-11e9-a454-f77ad83dd1f6;
 Fri, 09 Aug 2019 03:05:21 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 464VV33dpMz9sNp; Fri,  9 Aug 2019 13:05:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565319915;
 bh=kdnxIXhNQj2U8PEXQDYlSdPN67cUR04Ir9o4sAQDdS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eDfXIigtPMVlBRKtls2C4XzHlVbZK+AAWte7Nd6GC74GojhEF7+Ln7JxlTmvqnl8V
 Fr8XFTcn62Y2r0GcennRBHz+qQ1I8WdGiHczG5/V/f4jMS4P3UivTugK4W4xMBMYxH
 +Tq7yWQZLlW6ZV3PQqD24llOVxD+GRVt6BQ/n0qs=
Date: Fri, 9 Aug 2019 10:35:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: tony.nguyen@bt.com
Message-ID: <20190809003556.GG5465@umbus.fritz.box>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166709139.77390@bt.com>
MIME-Version: 1.0
In-Reply-To: <1565166709139.77390@bt.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 17/26] exec: Replace
 device_endian with MemOp
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, imammedo@redhat.com, sagark@eecs.berkeley.edu,
 david@redhat.com, jasowang@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, laurent@vivier.eu,
 keith.busch@intel.com, jcmvbkbc@gmail.com, frederic.konrad@adacore.com,
 pbonzini@redhat.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 gxt@mprc.pku.edu.cn, pburton@wavecomp.com, marex@denx.de, robh@kernel.org,
 hare@suse.com, sstabellini@kernel.org, berto@igalia.com, proljc@gmail.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, mreitz@redhat.com, hpoussin@reactos.org,
 joel@jms.id.au, anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 philmd@redhat.com, green@moxielogic.com, atar4qemu@gmail.com,
 antonynpavlov@gmail.com, jiri@resnulli.us, ehabkost@redhat.com,
 minyard@acm.org, sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, yuval.shaia@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, shorne@gmail.com,
 sundeep.lkml@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 crwulff@gmail.com, qemu-riscv@nongnu.org, xiaoguangrong.eric@gmail.com,
 i.mitsyanko@gmail.com, lersek@redhat.com, cohuck@redhat.com,
 alex.williamson@redhat.com, Andrew.Baumann@microsoft.com, jcd@tribudubois.net,
 andrew@aj.id.au, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 kbastian@mail.uni-paderborn.de, jan.kiszka@web.de, stefanb@linux.ibm.com,
 andrew.smirnov@gmail.com, aurelien@aurel32.net, clg@kaod.org
Content-Type: multipart/mixed; boundary="===============0621110564176322967=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0621110564176322967==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Content-Disposition: inline


--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2019 at 08:31:52AM +0000, tony.nguyen@bt.com wrote:
> Simplify endianness comparisons with consistent use of the more
> expressive MemOp.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com

ppc parts

Acked-by: David Gibson <david@gibson.dropbear.id.au>

I think some of the DEVICE_NATIVE_ENDIAN / MO_TE ones are probably
wrong, but that's not within scope of this patch to fix.

> ---
>  exec.c                              |  8 +--
>  hw/acpi/core.c                      |  6 +--
>  hw/acpi/cpu.c                       |  2 +-
>  hw/acpi/cpu_hotplug.c               |  2 +-
>  hw/acpi/ich9.c                      |  4 +-
>  hw/acpi/memory_hotplug.c            |  2 +-
>  hw/acpi/nvdimm.c                    |  2 +-
>  hw/acpi/pcihp.c                     |  2 +-
>  hw/acpi/piix4.c                     |  2 +-
>  hw/acpi/tco.c                       |  2 +-
>  hw/adc/stm32f2xx_adc.c              |  2 +-
>  hw/alpha/pci.c                      |  6 +--
>  hw/alpha/typhoon.c                  |  6 +--
>  hw/arm/allwinner-a10.c              |  2 +-
>  hw/arm/armv7m.c                     |  2 +-
>  hw/arm/aspeed.c                     |  2 +-
>  hw/arm/aspeed_soc.c                 |  2 +-
>  hw/arm/exynos4210.c                 |  2 +-
>  hw/arm/highbank.c                   |  2 +-
>  hw/arm/integratorcp.c               |  6 +--
>  hw/arm/kzm.c                        |  2 +-
>  hw/arm/msf2-soc.c                   |  2 +-
>  hw/arm/musicpal.c                   | 20 ++++----
>  hw/arm/omap1.c                      | 40 +++++++--------
>  hw/arm/omap2.c                      | 10 ++--
>  hw/arm/omap_sx1.c                   |  2 +-
>  hw/arm/palm.c                       |  2 +-
>  hw/arm/pxa2xx.c                     | 22 ++++-----
>  hw/arm/pxa2xx_gpio.c                |  2 +-
>  hw/arm/pxa2xx_pic.c                 |  2 +-
>  hw/arm/smmuv3.c                     |  2 +-
>  hw/arm/spitz.c                      |  2 +-
>  hw/arm/stellaris.c                  |  8 +--
>  hw/arm/strongarm.c                  | 12 ++---
>  hw/arm/versatilepb.c                |  2 +-
>  hw/audio/ac97.c                     |  4 +-
>  hw/audio/cs4231.c                   |  2 +-
>  hw/audio/es1370.c                   |  2 +-
>  hw/audio/intel-hda.c                |  2 +-
>  hw/audio/marvell_88w8618.c          |  2 +-
>  hw/audio/milkymist-ac97.c           |  2 +-
>  hw/audio/pl041.c                    |  2 +-
>  hw/block/fdc.c                      |  4 +-
>  hw/block/nvme.c                     |  4 +-
>  hw/block/onenand.c                  |  2 +-
>  hw/block/pflash_cfi01.c             |  2 +-
>  hw/block/pflash_cfi02.c             |  2 +-
>  hw/char/bcm2835_aux.c               |  2 +-
>  hw/char/cadence_uart.c              |  2 +-
>  hw/char/cmsdk-apb-uart.c            |  2 +-
>  hw/char/debugcon.c                  |  2 +-
>  hw/char/digic-uart.c                |  2 +-
>  hw/char/escc.c                      |  2 +-
>  hw/char/etraxfs_ser.c               |  2 +-
>  hw/char/exynos4210_uart.c           |  2 +-
>  hw/char/grlib_apbuart.c             |  2 +-
>  hw/char/imx_serial.c                |  2 +-
>  hw/char/lm32_uart.c                 |  2 +-
>  hw/char/mcf_uart.c                  |  2 +-
>  hw/char/milkymist-uart.c            |  2 +-
>  hw/char/nrf51_uart.c                |  2 +-
>  hw/char/omap_uart.c                 |  6 +--
>  hw/char/parallel.c                  |  2 +-
>  hw/char/pl011.c                     |  2 +-
>  hw/char/serial.c                    | 10 ++--
>  hw/char/sh_serial.c                 |  2 +-
>  hw/char/stm32f2xx_usart.c           |  2 +-
>  hw/char/xilinx_uartlite.c           |  2 +-
>  hw/core/empty_slot.c                |  2 +-
>  hw/cris/axis_dev88.c                |  4 +-
>  hw/display/ati.c                    |  2 +-
>  hw/display/bcm2835_fb.c             |  2 +-
>  hw/display/bochs-display.c          |  4 +-
>  hw/display/cg3.c                    |  2 +-
>  hw/display/cirrus_vga.c             | 10 ++--
>  hw/display/edid-region.c            |  2 +-
>  hw/display/exynos4210_fimd.c        |  2 +-
>  hw/display/g364fb.c                 |  2 +-
>  hw/display/jazz_led.c               |  2 +-
>  hw/display/milkymist-tmu2.c         |  2 +-
>  hw/display/milkymist-vgafb.c        |  2 +-
>  hw/display/omap_dss.c               | 10 ++--
>  hw/display/omap_lcdc.c              |  2 +-
>  hw/display/pl110.c                  |  2 +-
>  hw/display/pxa2xx_lcd.c             |  2 +-
>  hw/display/sm501.c                  | 10 ++--
>  hw/display/tc6393xb.c               |  2 +-
>  hw/display/tcx.c                    | 14 +++---
>  hw/display/vga-isa-mm.c             |  2 +-
>  hw/display/vga-pci.c                |  6 +--
>  hw/display/vga.c                    |  2 +-
>  hw/display/vmware_vga.c             |  2 +-
>  hw/display/xlnx_dp.c                |  8 +--
>  hw/dma/bcm2835_dma.c                |  4 +-
>  hw/dma/etraxfs_dma.c                |  2 +-
>  hw/dma/i8257.c                      |  4 +-
>  hw/dma/omap_dma.c                   |  4 +-
>  hw/dma/pl080.c                      |  2 +-
>  hw/dma/pl330.c                      |  2 +-
>  hw/dma/puv3_dma.c                   |  2 +-
>  hw/dma/pxa2xx_dma.c                 |  2 +-
>  hw/dma/rc4030.c                     |  4 +-
>  hw/dma/sparc32_dma.c                |  2 +-
>  hw/dma/xilinx_axidma.c              |  2 +-
>  hw/dma/xlnx-zdma.c                  |  2 +-
>  hw/dma/xlnx-zynq-devcfg.c           |  2 +-
>  hw/dma/xlnx_dpdma.c                 |  2 +-
>  hw/gpio/bcm2835_gpio.c              |  2 +-
>  hw/gpio/imx_gpio.c                  |  2 +-
>  hw/gpio/mpc8xxx.c                   |  2 +-
>  hw/gpio/nrf51_gpio.c                |  2 +-
>  hw/gpio/omap_gpio.c                 |  6 +--
>  hw/gpio/pl061.c                     |  2 +-
>  hw/gpio/puv3_gpio.c                 |  2 +-
>  hw/gpio/zaurus.c                    |  2 +-
>  hw/hppa/dino.c                      |  6 +--
>  hw/hppa/machine.c                   |  2 +-
>  hw/hppa/pci.c                       |  6 +--
>  hw/hyperv/hyperv_testdev.c          |  2 +-
>  hw/i2c/aspeed_i2c.c                 |  4 +-
>  hw/i2c/exynos4210_i2c.c             |  2 +-
>  hw/i2c/imx_i2c.c                    |  2 +-
>  hw/i2c/microbit_i2c.c               |  2 +-
>  hw/i2c/mpc_i2c.c                    |  2 +-
>  hw/i2c/omap_i2c.c                   |  2 +-
>  hw/i2c/pm_smbus.c                   |  2 +-
>  hw/i2c/ppc4xx_i2c.c                 |  2 +-
>  hw/i2c/versatile_i2c.c              |  2 +-
>  hw/i386/amd_iommu.c                 |  4 +-
>  hw/i386/intel_iommu.c               |  4 +-
>  hw/i386/kvm/apic.c                  |  2 +-
>  hw/i386/kvmvapic.c                  |  2 +-
>  hw/i386/pc.c                        |  6 +--
>  hw/i386/vmport.c                    |  2 +-
>  hw/i386/xen/xen_apic.c              |  2 +-
>  hw/i386/xen/xen_platform.c          |  4 +-
>  hw/i386/xen/xen_pvdevice.c          |  2 +-
>  hw/ide/ahci-allwinner.c             |  2 +-
>  hw/ide/ahci.c                       |  4 +-
>  hw/ide/macio.c                      |  2 +-
>  hw/ide/mmio.c                       |  4 +-
>  hw/ide/pci.c                        |  6 +--
>  hw/ide/sii3112.c                    |  2 +-
>  hw/input/milkymist-softusb.c        |  2 +-
>  hw/input/pckbd.c                    |  6 +--
>  hw/input/pl050.c                    |  2 +-
>  hw/input/pxa2xx_keypad.c            |  2 +-
>  hw/intc/allwinner-a10-pic.c         |  2 +-
>  hw/intc/apic.c                      |  2 +-
>  hw/intc/arm_gic.c                   | 12 ++---
>  hw/intc/arm_gicv2m.c                |  2 +-
>  hw/intc/arm_gicv3.c                 |  4 +-
>  hw/intc/arm_gicv3_its_common.c      |  2 +-
>  hw/intc/armv7m_nvic.c               |  6 +--
>  hw/intc/aspeed_vic.c                |  2 +-
>  hw/intc/bcm2835_ic.c                |  2 +-
>  hw/intc/bcm2836_control.c           |  2 +-
>  hw/intc/etraxfs_pic.c               |  2 +-
>  hw/intc/exynos4210_combiner.c       |  2 +-
>  hw/intc/grlib_irqmp.c               |  2 +-
>  hw/intc/heathrow_pic.c              |  2 +-
>  hw/intc/imx_avic.c                  |  2 +-
>  hw/intc/imx_gpcv2.c                 |  2 +-
>  hw/intc/ioapic.c                    |  2 +-
>  hw/intc/mips_gic.c                  |  2 +-
>  hw/intc/omap_intc.c                 |  4 +-
>  hw/intc/ompic.c                     |  2 +-
>  hw/intc/openpic.c                   | 20 ++++----
>  hw/intc/openpic_kvm.c               |  2 +-
>  hw/intc/pl190.c                     |  2 +-
>  hw/intc/pnv_xive.c                  | 14 +++---
>  hw/intc/puv3_intc.c                 |  2 +-
>  hw/intc/sh_intc.c                   |  2 +-
>  hw/intc/slavio_intctl.c             |  4 +-
>  hw/intc/xics_pnv.c                  |  2 +-
>  hw/intc/xilinx_intc.c               |  2 +-
>  hw/intc/xive.c                      |  6 +--
>  hw/intc/xlnx-pmu-iomod-intc.c       |  2 +-
>  hw/intc/xlnx-zynqmp-ipi.c           |  2 +-
>  hw/ipack/tpci200.c                  | 10 ++--
>  hw/ipmi/isa_ipmi_bt.c               |  2 +-
>  hw/ipmi/isa_ipmi_kcs.c              |  2 +-
>  hw/isa/lpc_ich9.c                   |  4 +-
>  hw/isa/pc87312.c                    |  2 +-
>  hw/isa/vt82c686.c                   |  2 +-
>  hw/m68k/mcf5206.c                   |  2 +-
>  hw/m68k/mcf5208.c                   |  4 +-
>  hw/m68k/mcf_intc.c                  |  2 +-
>  hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>  hw/mips/boston.c                    |  6 +--
>  hw/mips/gt64xxx_pci.c               |  2 +-
>  hw/mips/mips_jazz.c                 |  8 +--
>  hw/mips/mips_malta.c                |  4 +-
>  hw/mips/mips_r4k.c                  |  2 +-
>  hw/misc/a9scu.c                     |  2 +-
>  hw/misc/applesmc.c                  |  6 +--
>  hw/misc/arm11scu.c                  |  2 +-
>  hw/misc/arm_integrator_debug.c      |  2 +-
>  hw/misc/arm_l2x0.c                  |  2 +-
>  hw/misc/arm_sysctl.c                |  2 +-
>  hw/misc/armsse-cpuid.c              |  2 +-
>  hw/misc/armsse-mhu.c                |  2 +-
>  hw/misc/aspeed_scu.c                |  2 +-
>  hw/misc/aspeed_sdmc.c               |  2 +-
>  hw/misc/aspeed_xdma.c               |  2 +-
>  hw/misc/bcm2835_mbox.c              |  2 +-
>  hw/misc/bcm2835_property.c          |  2 +-
>  hw/misc/bcm2835_rng.c               |  2 +-
>  hw/misc/debugexit.c                 |  2 +-
>  hw/misc/eccmemctl.c                 |  4 +-
>  hw/misc/edu.c                       |  2 +-
>  hw/misc/exynos4210_clk.c            |  2 +-
>  hw/misc/exynos4210_pmu.c            |  2 +-
>  hw/misc/exynos4210_rng.c            |  2 +-
>  hw/misc/grlib_ahb_apb_pnp.c         |  4 +-
>  hw/misc/imx25_ccm.c                 |  2 +-
>  hw/misc/imx2_wdt.c                  |  2 +-
>  hw/misc/imx31_ccm.c                 |  2 +-
>  hw/misc/imx6_ccm.c                  |  4 +-
>  hw/misc/imx6_src.c                  |  2 +-
>  hw/misc/imx6ul_ccm.c                |  4 +-
>  hw/misc/imx7_ccm.c                  |  4 +-
>  hw/misc/imx7_gpr.c                  |  2 +-
>  hw/misc/imx7_snvs.c                 |  2 +-
>  hw/misc/iotkit-secctl.c             |  4 +-
>  hw/misc/iotkit-sysctl.c             |  2 +-
>  hw/misc/iotkit-sysinfo.c            |  2 +-
>  hw/misc/ivshmem.c                   |  2 +-
>  hw/misc/macio/cuda.c                |  2 +-
>  hw/misc/macio/gpio.c                |  2 +-
>  hw/misc/macio/mac_dbdma.c           |  2 +-
>  hw/misc/macio/macio.c               |  2 +-
>  hw/misc/macio/pmu.c                 |  2 +-
>  hw/misc/milkymist-hpdmc.c           |  2 +-
>  hw/misc/milkymist-pfpu.c            |  2 +-
>  hw/misc/mips_cmgcr.c                |  2 +-
>  hw/misc/mips_cpc.c                  |  2 +-
>  hw/misc/mips_itu.c                  |  4 +-
>  hw/misc/mos6522.c                   |  2 +-
>  hw/misc/mps2-fpgaio.c               |  2 +-
>  hw/misc/mps2-scc.c                  |  2 +-
>  hw/misc/msf2-sysreg.c               |  2 +-
>  hw/misc/mst_fpga.c                  |  2 +-
>  hw/misc/nrf51_rng.c                 |  2 +-
>  hw/misc/omap_gpmc.c                 |  6 +--
>  hw/misc/omap_l4.c                   |  2 +-
>  hw/misc/omap_sdrc.c                 |  2 +-
>  hw/misc/omap_tap.c                  |  2 +-
>  hw/misc/pc-testdev.c                | 10 ++--
>  hw/misc/pci-testdev.c               |  4 +-
>  hw/misc/puv3_pm.c                   |  2 +-
>  hw/misc/slavio_misc.c               | 16 +++---
>  hw/misc/stm32f2xx_syscfg.c          |  2 +-
>  hw/misc/tz-mpc.c                    |  4 +-
>  hw/misc/tz-msc.c                    |  2 +-
>  hw/misc/tz-ppc.c                    |  2 +-
>  hw/misc/unimp.c                     |  2 +-
>  hw/misc/zynq-xadc.c                 |  2 +-
>  hw/misc/zynq_slcr.c                 |  2 +-
>  hw/moxie/moxiesim.c                 |  2 +-
>  hw/net/allwinner_emac.c             |  2 +-
>  hw/net/cadence_gem.c                |  2 +-
>  hw/net/can/can_kvaser_pci.c         |  6 +--
>  hw/net/can/can_mioe3680_pci.c       |  4 +-
>  hw/net/can/can_pcm3680_pci.c        |  4 +-
>  hw/net/dp8393x.c                    |  2 +-
>  hw/net/e1000.c                      |  4 +-
>  hw/net/e1000e.c                     |  4 +-
>  hw/net/eepro100.c                   |  2 +-
>  hw/net/etraxfs_eth.c                |  2 +-
>  hw/net/fsl_etsec/etsec.c            |  2 +-
>  hw/net/ftgmac100.c                  |  2 +-
>  hw/net/imx_fec.c                    |  2 +-
>  hw/net/lan9118.c                    |  4 +-
>  hw/net/lance.c                      |  2 +-
>  hw/net/mcf_fec.c                    |  2 +-
>  hw/net/milkymist-minimac2.c         |  2 +-
>  hw/net/ne2000.c                     |  2 +-
>  hw/net/pcnet-pci.c                  |  4 +-
>  hw/net/rocker/rocker.c              |  2 +-
>  hw/net/rtl8139.c                    |  2 +-
>  hw/net/smc91c111.c                  |  2 +-
>  hw/net/stellaris_enet.c             |  2 +-
>  hw/net/sungem.c                     | 12 ++---
>  hw/net/sunhme.c                     | 10 ++--
>  hw/net/vmxnet3.c                    |  4 +-
>  hw/net/xgmac.c                      |  2 +-
>  hw/net/xilinx_axienet.c             |  2 +-
>  hw/net/xilinx_ethlite.c             |  2 +-
>  hw/nios2/10m50_devboard.c           |  2 +-
>  hw/nvram/ds1225y.c                  |  2 +-
>  hw/nvram/fw_cfg.c                   |  8 +--
>  hw/nvram/mac_nvram.c                |  2 +-
>  hw/nvram/nrf51_nvm.c                |  8 +--
>  hw/openrisc/openrisc_sim.c          |  2 +-
>  hw/pci-host/bonito.c                | 10 ++--
>  hw/pci-host/designware.c            |  6 +--
>  hw/pci-host/piix.c                  |  2 +-
>  hw/pci-host/ppce500.c               |  2 +-
>  hw/pci-host/prep.c                  |  4 +-
>  hw/pci-host/q35.c                   |  4 +-
>  hw/pci-host/sabre.c                 |  4 +-
>  hw/pci-host/uninorth.c              |  4 +-
>  hw/pci-host/versatile.c             |  4 +-
>  hw/pci/msix.c                       |  4 +-
>  hw/pci/pci_host.c                   |  8 +--
>  hw/pci/pcie_host.c                  |  2 +-
>  hw/pci/shpc.c                       |  2 +-
>  hw/pcmcia/pxa2xx.c                  |  6 +--
>  hw/ppc/e500.c                       |  4 +-
>  hw/ppc/mpc8544_guts.c               |  2 +-
>  hw/ppc/pnv_core.c                   |  6 +--
>  hw/ppc/pnv_lpc.c                    |  8 +--
>  hw/ppc/pnv_occ.c                    |  4 +-
>  hw/ppc/pnv_psi.c                    |  8 +--
>  hw/ppc/pnv_xscom.c                  |  2 +-
>  hw/ppc/ppc405_boards.c              |  4 +-
>  hw/ppc/ppc405_uc.c                  | 14 +++---
>  hw/ppc/ppc440_bamboo.c              |  4 +-
>  hw/ppc/ppc440_pcix.c                |  4 +-
>  hw/ppc/ppc4xx_pci.c                 |  2 +-
>  hw/ppc/ppce500_spin.c               |  2 +-
>  hw/ppc/sam460ex.c                   |  4 +-
>  hw/ppc/spapr_pci.c                  |  2 +-
>  hw/ppc/virtex_ml507.c               |  2 +-
>  hw/rdma/vmw/pvrdma_main.c           |  4 +-
>  hw/riscv/sifive_clint.c             |  2 +-
>  hw/riscv/sifive_gpio.c              |  2 +-
>  hw/riscv/sifive_plic.c              |  2 +-
>  hw/riscv/sifive_prci.c              |  2 +-
>  hw/riscv/sifive_test.c              |  2 +-
>  hw/riscv/sifive_uart.c              |  2 +-
>  hw/riscv/virt.c                     |  2 +-
>  hw/s390x/s390-pci-bus.c             |  2 +-
>  hw/scsi/esp-pci.c                   |  2 +-
>  hw/scsi/esp.c                       |  2 +-
>  hw/scsi/lsi53c895a.c                |  6 +--
>  hw/scsi/megasas.c                   |  6 +--
>  hw/scsi/mptsas.c                    |  6 +--
>  hw/scsi/vmw_pvscsi.c                |  2 +-
>  hw/sd/bcm2835_sdhost.c              |  2 +-
>  hw/sd/milkymist-memcard.c           |  2 +-
>  hw/sd/omap_mmc.c                    |  2 +-
>  hw/sd/pl181.c                       |  2 +-
>  hw/sd/pxa2xx_mmci.c                 |  2 +-
>  hw/sd/sdhci.c                       |  4 +-
>  hw/sh4/r2d.c                        |  2 +-
>  hw/sh4/sh7750.c                     |  4 +-
>  hw/sh4/sh_pci.c                     |  2 +-
>  hw/sparc/sun4m_iommu.c              |  2 +-
>  hw/sparc64/niagara.c                |  2 +-
>  hw/sparc64/sun4u.c                  |  4 +-
>  hw/sparc64/sun4u_iommu.c            |  2 +-
>  hw/ssi/aspeed_smc.c                 |  6 +--
>  hw/ssi/imx_spi.c                    |  2 +-
>  hw/ssi/mss-spi.c                    |  2 +-
>  hw/ssi/omap_spi.c                   |  2 +-
>  hw/ssi/pl022.c                      |  2 +-
>  hw/ssi/stm32f2xx_spi.c              |  2 +-
>  hw/ssi/xilinx_spi.c                 |  2 +-
>  hw/ssi/xilinx_spips.c               |  8 +--
>  hw/timer/a9gtimer.c                 |  4 +-
>  hw/timer/allwinner-a10-pit.c        |  2 +-
>  hw/timer/altera_timer.c             |  2 +-
>  hw/timer/arm_mptimer.c              |  4 +-
>  hw/timer/arm_timer.c                |  4 +-
>  hw/timer/armv7m_systick.c           |  2 +-
>  hw/timer/aspeed_rtc.c               |  2 +-
>  hw/timer/aspeed_timer.c             |  2 +-
>  hw/timer/cadence_ttc.c              |  2 +-
>  hw/timer/cmsdk-apb-dualtimer.c      |  2 +-
>  hw/timer/cmsdk-apb-timer.c          |  2 +-
>  hw/timer/digic-timer.c              |  2 +-
>  hw/timer/etraxfs_timer.c            |  2 +-
>  hw/timer/exynos4210_mct.c           |  2 +-
>  hw/timer/exynos4210_pwm.c           |  2 +-
>  hw/timer/exynos4210_rtc.c           |  2 +-
>  hw/timer/grlib_gptimer.c            |  2 +-
>  hw/timer/hpet.c                     |  2 +-
>  hw/timer/i8254.c                    |  2 +-
>  hw/timer/imx_epit.c                 |  2 +-
>  hw/timer/imx_gpt.c                  |  2 +-
>  hw/timer/lm32_timer.c               |  2 +-
>  hw/timer/m48t59.c                   |  4 +-
>  hw/timer/mc146818rtc.c              |  2 +-
>  hw/timer/milkymist-sysctl.c         |  2 +-
>  hw/timer/mss-timer.c                |  2 +-
>  hw/timer/nrf51_timer.c              |  2 +-
>  hw/timer/omap_gptimer.c             |  2 +-
>  hw/timer/omap_synctimer.c           |  2 +-
>  hw/timer/pl031.c                    |  2 +-
>  hw/timer/puv3_ost.c                 |  2 +-
>  hw/timer/pxa2xx_timer.c             |  2 +-
>  hw/timer/sh_timer.c                 |  2 +-
>  hw/timer/slavio_timer.c             |  2 +-
>  hw/timer/stm32f2xx_timer.c          |  2 +-
>  hw/timer/sun4v-rtc.c                |  2 +-
>  hw/timer/xilinx_timer.c             |  2 +-
>  hw/timer/xlnx-zynqmp-rtc.c          |  2 +-
>  hw/tpm/tpm_crb.c                    |  2 +-
>  hw/tpm/tpm_tis.c                    |  2 +-
>  hw/usb/chipidea.c                   |  4 +-
>  hw/usb/hcd-ehci-sysbus.c            |  2 +-
>  hw/usb/hcd-ehci.c                   |  6 +--
>  hw/usb/hcd-ohci.c                   |  2 +-
>  hw/usb/hcd-uhci.c                   |  2 +-
>  hw/usb/hcd-xhci.c                   | 10 ++--
>  hw/usb/tusb6010.c                   |  2 +-
>  hw/vfio/common.c                    |  2 +-
>  hw/vfio/pci-quirks.c                | 26 +++++-----
>  hw/vfio/pci.c                       |  4 +-
>  hw/virtio/virtio-mmio.c             |  2 +-
>  hw/virtio/virtio-pci.c              | 12 ++---
>  hw/watchdog/cmsdk-apb-watchdog.c    |  2 +-
>  hw/watchdog/wdt_aspeed.c            |  2 +-
>  hw/watchdog/wdt_i6300esb.c          |  2 +-
>  hw/xen/xen_pt.c                     |  2 +-
>  hw/xen/xen_pt_msi.c                 |  2 +-
>  hw/xtensa/mx_pic.c                  |  2 +-
>  hw/xtensa/xtfpga.c                  |  6 +--
>  include/exec/cpu-common.h           |  4 +-
>  include/exec/memory.h               |  2 +-
>  include/hw/char/serial.h            |  2 +-
>  ioport.c                            |  4 +-
>  memory.c                            | 10 ++--
>  memory_ldst.inc.c                   | 99 ++++++++++++++++++-------------=
------
>  426 files changed, 766 insertions(+), 771 deletions(-)
>=20
> diff --git a/exec.c b/exec.c
> index 9f69197..303f9a7 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2796,7 +2796,7 @@ static bool notdirty_mem_accepts(void *opaque, hwad=
dr addr,
>  static const MemoryRegionOps notdirty_mem_ops =3D {
>      .write =3D notdirty_mem_write,
>      .valid.accepts =3D notdirty_mem_accepts,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 8,
> @@ -2925,7 +2925,7 @@ static MemTxResult watch_mem_write(void *opaque, hw=
addr addr,
>  static const MemoryRegionOps watch_mem_ops =3D {
>      .read_with_attrs =3D watch_mem_read,
>      .write_with_attrs =3D watch_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 8,
> @@ -3001,7 +3001,7 @@ static const MemoryRegionOps subpage_ops =3D {
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 8,
>      .valid.accepts =3D subpage_accepts,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static int subpage_register (subpage_t *mmio, uint32_t start, uint32_t e=
nd,
> @@ -3076,7 +3076,7 @@ static bool readonly_mem_accepts(void *opaque, hwad=
dr addr,
>  static const MemoryRegionOps readonly_mem_ops =3D {
>      .write =3D readonly_mem_write,
>      .valid.accepts =3D readonly_mem_accepts,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 8,
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 228828a..971095d 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -463,7 +463,7 @@ static const MemoryRegionOps acpi_pm_evt_ops =3D {
>      .write =3D acpi_pm_evt_write,
>      .valid.min_access_size =3D 2,
>      .valid.max_access_size =3D 2,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  void acpi_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
> @@ -532,7 +532,7 @@ static const MemoryRegionOps acpi_pm_tmr_ops =3D {
>      .write =3D acpi_pm_tmr_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  void acpi_pm_tmr_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
> @@ -604,7 +604,7 @@ static const MemoryRegionOps acpi_pm_cnt_ops =3D {
>      .write =3D acpi_pm_cnt_write,
>      .valid.min_access_size =3D 2,
>      .valid.max_access_size =3D 2,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 7a90c8f..be6b802 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -179,7 +179,7 @@ static void cpu_hotplug_wr(void *opaque, hwaddr addr,=
 uint64_t data,
>  static const MemoryRegionOps cpu_hotplug_ops =3D {
>      .read =3D cpu_hotplug_rd,
>      .write =3D cpu_hotplug_wr,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> index 5243918..f7746d4 100644
> --- a/hw/acpi/cpu_hotplug.c
> +++ b/hw/acpi/cpu_hotplug.c
> @@ -49,7 +49,7 @@ static void cpu_status_write(void *opaque, hwaddr addr,=
 uint64_t data,
>  static const MemoryRegionOps AcpiCpuHotplug_ops =3D {
>      .read =3D cpu_status_read,
>      .write =3D cpu_status_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index e53dfe1..29cef74 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -74,7 +74,7 @@ static const MemoryRegionOps ich9_gpe_ops =3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 1,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t ich9_smi_readl(void *opaque, hwaddr addr, unsigned width)
> @@ -115,7 +115,7 @@ static const MemoryRegionOps ich9_smi_ops =3D {
>      .write =3D ich9_smi_writel,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  void ich9_pm_iospace_update(ICH9LPCPMRegs *pm, uint32_t pm_io_base)
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index 297812d..475fd64 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -201,7 +201,7 @@ static void acpi_memory_hotplug_write(void *opaque, h=
waddr addr, uint64_t data,
>  static const MemoryRegionOps acpi_memory_hotplug_ops =3D {
>      .read =3D acpi_memory_hotplug_read,
>      .write =3D acpi_memory_hotplug_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 9fdad6d..b7fe093 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -911,7 +911,7 @@ exit:
>  static const MemoryRegionOps nvdimm_dsm_ops =3D {
>      .read =3D nvdimm_dsm_read,
>      .write =3D nvdimm_dsm_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 613406d..5597b29 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -353,7 +353,7 @@ static void pci_write(void *opaque, hwaddr addr, uint=
64_t data,
>  static const MemoryRegionOps acpi_pcihp_io_ops =3D {
>      .read =3D pci_read,
>      .write =3D pci_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index ec4e186..871e026 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -597,7 +597,7 @@ static const MemoryRegionOps piix4_gpe_ops =3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 1,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>=20
> diff --git a/hw/acpi/tco.c b/hw/acpi/tco.c
> index acfb65e..0a0a670 100644
> --- a/hw/acpi/tco.c
> +++ b/hw/acpi/tco.c
> @@ -215,7 +215,7 @@ static const MemoryRegionOps tco_io_ops =3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 2,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  void acpi_pm_tco_init(TCOIORegs *tr, MemoryRegion *parent)
> diff --git a/hw/adc/stm32f2xx_adc.c b/hw/adc/stm32f2xx_adc.c
> index c93b60e..53717be 100644
> --- a/hw/adc/stm32f2xx_adc.c
> +++ b/hw/adc/stm32f2xx_adc.c
> @@ -245,7 +245,7 @@ static void stm32f2xx_adc_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps stm32f2xx_adc_ops =3D {
>      .read =3D stm32f2xx_adc_read,
>      .write =3D stm32f2xx_adc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_stm32f2xx_adc =3D {
> diff --git a/hw/alpha/pci.c b/hw/alpha/pci.c
> index fb902bb..7bd9e58 100644
> --- a/hw/alpha/pci.c
> +++ b/hw/alpha/pci.c
> @@ -27,7 +27,7 @@ static void ignore_write(void *opaque, hwaddr addr, uin=
t64_t v, unsigned size)
>  const MemoryRegionOps alpha_pci_ignore_ops =3D {
>      .read =3D ignore_read,
>      .write =3D ignore_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 8,
> @@ -57,7 +57,7 @@ static void bw_conf1_write(void *opaque, hwaddr addr,
>  const MemoryRegionOps alpha_pci_conf1_ops =3D {
>      .read =3D bw_conf1_read,
>      .write =3D bw_conf1_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
> @@ -80,7 +80,7 @@ static void special_write(void *opaque, hwaddr addr,
>  const MemoryRegionOps alpha_pci_iack_ops =3D {
>      .read =3D iack_read,
>      .write =3D special_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
> index 3f34a51..6551594 100644
> --- a/hw/alpha/typhoon.c
> +++ b/hw/alpha/typhoon.c
> @@ -568,7 +568,7 @@ static MemTxResult pchip_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps cchip_ops =3D {
>      .read_with_attrs =3D cchip_read,
>      .write_with_attrs =3D cchip_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> @@ -582,7 +582,7 @@ static const MemoryRegionOps cchip_ops =3D {
>  static const MemoryRegionOps dchip_ops =3D {
>      .read =3D dchip_read,
>      .write =3D dchip_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> @@ -596,7 +596,7 @@ static const MemoryRegionOps dchip_ops =3D {
>  static const MemoryRegionOps pchip_ops =3D {
>      .read_with_attrs =3D pchip_read,
>      .write_with_attrs =3D pchip_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 35e906c..db38315 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -114,7 +114,7 @@ static void aw_a10_realize(DeviceState *dev, Error **=
errp)
>=20
>      /* FIXME use a qdev chardev prop instead of serial_hd() */
>      serial_mm_init(get_system_memory(), AW_A10_UART0_REG_BASE, 2, s->irq=
[1],
> -                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
> +                   115200, serial_hd(0), MO_TE);
>  }
>=20
>  static void aw_a10_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index b9efad6..9bce022 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -86,7 +86,7 @@ static MemTxResult bitband_write(void *opaque, hwaddr o=
ffset, uint64_t value,
>  static const MemoryRegionOps bitband_ops =3D {
>      .read_with_attrs =3D bitband_read,
>      .write_with_attrs =3D bitband_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 4,
>      .valid.min_access_size =3D 1,
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 843b708..c0ccb35 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -105,7 +105,7 @@ static void max_ram_write(void *opaque, hwaddr offset=
, uint64_t value,
>  static const MemoryRegionOps max_ram_ops =3D {
>      .read =3D max_ram_read,
>      .write =3D max_ram_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  #define FIRMWARE_ADDR 0x0
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index c6fb370..9437b9d 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -331,7 +331,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
>      if (serial_hd(0)) {
>          qemu_irq uart5 =3D aspeed_soc_get_irq(s, ASPEED_UART5);
>          serial_mm_init(get_system_memory(), sc->info->memmap[ASPEED_UART=
5], 2,
> -                       uart5, 38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +                       uart5, 38400, serial_hd(0), MO_LE);
>      }
>=20
>      /* I2C */
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index becd864..c1ce423 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -119,7 +119,7 @@ static void exynos4210_chipid_and_omr_write(void *opa=
que, hwaddr offset,
>  static const MemoryRegionOps exynos4210_chipid_and_omr_ops =3D {
>      .read =3D exynos4210_chipid_and_omr_read,
>      .write =3D exynos4210_chipid_and_omr_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .max_access_size =3D 1,
>      }
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index def0f1c..0d1b699 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -148,7 +148,7 @@ static uint64_t hb_regs_read(void *opaque, hwaddr off=
set,
>  static const MemoryRegionOps hb_mem_ops =3D {
>      .read =3D hb_regs_read,
>      .write =3D hb_regs_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  #define TYPE_HIGHBANK_REGISTERS "highbank-regs"
> diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
> index 200c010..260d928 100644
> --- a/hw/arm/integratorcp.c
> +++ b/hw/arm/integratorcp.c
> @@ -259,7 +259,7 @@ static void integratorcm_write(void *opaque, hwaddr o=
ffset,
>  static const MemoryRegionOps integratorcm_ops =3D {
>      .read =3D integratorcm_read,
>      .write =3D integratorcm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void integratorcm_init(Object *obj)
> @@ -435,7 +435,7 @@ static void icp_pic_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps icp_pic_ops =3D {
>      .read =3D icp_pic_read,
>      .write =3D icp_pic_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void icp_pic_init(Object *obj)
> @@ -527,7 +527,7 @@ static void icp_control_write(void *opaque, hwaddr of=
fset,
>  static const MemoryRegionOps icp_control_ops =3D {
>      .read =3D icp_control_read,
>      .write =3D icp_control_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void icp_control_mmc_wprot(void *opaque, int line, int level)
> diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
> index 59d2102..836c1a7 100644
> --- a/hw/arm/kzm.c
> +++ b/hw/arm/kzm.c
> @@ -122,7 +122,7 @@ static void kzm_init(MachineState *machine)
>      if (serial_hd(2)) { /* touchscreen */
>          serial_mm_init(get_system_memory(), KZM_FPGA_ADDR+0x10, 0,
>                         qdev_get_gpio_in(DEVICE(&s->soc.avic), 52),
> -                       14745600, serial_hd(2), DEVICE_NATIVE_ENDIAN);
> +                       14745600, serial_hd(2), MO_TE);
>      }
>=20
>      kzm_binfo.ram_size =3D machine->ram_size;
> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
> index 1ccb644..30ea87f 100644
> --- a/hw/arm/msf2-soc.c
> +++ b/hw/arm/msf2-soc.c
> @@ -139,7 +139,7 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, =
Error **errp)
>          if (serial_hd(i)) {
>              serial_mm_init(get_system_memory(), uart_addr[i], 2,
>                             qdev_get_gpio_in(armv7m, uart_irq[i]),
> -                           115200, serial_hd(i), DEVICE_NATIVE_ENDIAN);
> +                           115200, serial_hd(i), MO_TE);
>          }
>      }
>=20
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 95d56f3..e20f0a9 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -366,7 +366,7 @@ static void mv88w8618_eth_write(void *opaque, hwaddr =
offset,
>  static const MemoryRegionOps mv88w8618_eth_ops =3D {
>      .read =3D mv88w8618_eth_read,
>      .write =3D mv88w8618_eth_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void eth_cleanup(NetClientState *nc)
> @@ -612,7 +612,7 @@ static void musicpal_lcd_write(void *opaque, hwaddr o=
ffset,
>  static const MemoryRegionOps musicpal_lcd_ops =3D {
>      .read =3D musicpal_lcd_read,
>      .write =3D musicpal_lcd_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const GraphicHwOps musicpal_gfx_ops =3D {
> @@ -753,7 +753,7 @@ static void mv88w8618_pic_reset(DeviceState *d)
>  static const MemoryRegionOps mv88w8618_pic_ops =3D {
>      .read =3D mv88w8618_pic_read,
>      .write =3D mv88w8618_pic_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void mv88w8618_pic_init(Object *obj)
> @@ -917,7 +917,7 @@ static void mv88w8618_pit_reset(DeviceState *d)
>  static const MemoryRegionOps mv88w8618_pit_ops =3D {
>      .read =3D mv88w8618_pit_read,
>      .write =3D mv88w8618_pit_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void mv88w8618_pit_init(Object *obj)
> @@ -1021,7 +1021,7 @@ static void mv88w8618_flashcfg_write(void *opaque, =
hwaddr offset,
>  static const MemoryRegionOps mv88w8618_flashcfg_ops =3D {
>      .read =3D mv88w8618_flashcfg_read,
>      .write =3D mv88w8618_flashcfg_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void mv88w8618_flashcfg_init(Object *obj)
> @@ -1094,7 +1094,7 @@ static void musicpal_misc_write(void *opaque, hwadd=
r offset,
>  static const MemoryRegionOps musicpal_misc_ops =3D {
>      .read =3D musicpal_misc_read,
>      .write =3D musicpal_misc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void musicpal_misc_init(Object *obj)
> @@ -1142,7 +1142,7 @@ static void mv88w8618_wlan_write(void *opaque, hwad=
dr offset,
>  static const MemoryRegionOps mv88w8618_wlan_ops =3D {
>      .read =3D mv88w8618_wlan_read,
>      .write =3Dmv88w8618_wlan_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void mv88w8618_wlan_realize(DeviceState *dev, Error **errp)
> @@ -1339,7 +1339,7 @@ static void musicpal_gpio_write(void *opaque, hwadd=
r offset,
>  static const MemoryRegionOps musicpal_gpio_ops =3D {
>      .read =3D musicpal_gpio_read,
>      .write =3D musicpal_gpio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void musicpal_gpio_reset(DeviceState *d)
> @@ -1609,11 +1609,11 @@ static void musicpal_init(MachineState *machine)
>=20
>      if (serial_hd(0)) {
>          serial_mm_init(address_space_mem, MP_UART1_BASE, 2, pic[MP_UART1=
_IRQ],
> -                       1825000, serial_hd(0), DEVICE_NATIVE_ENDIAN);
> +                       1825000, serial_hd(0), MO_TE);
>      }
>      if (serial_hd(1)) {
>          serial_mm_init(address_space_mem, MP_UART2_BASE, 2, pic[MP_UART2=
_IRQ],
> -                       1825000, serial_hd(1), DEVICE_NATIVE_ENDIAN);
> +                       1825000, serial_hd(1), MO_TE);
>      }
>=20
>      /* Register flash */
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index 28fbe27..174a000 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -252,7 +252,7 @@ static void omap_mpu_timer_write(void *opaque, hwaddr=
 addr,
>  static const MemoryRegionOps omap_mpu_timer_ops =3D {
>      .read =3D omap_mpu_timer_read,
>      .write =3D omap_mpu_timer_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void omap_mpu_timer_reset(struct omap_mpu_timer_s *s)
> @@ -375,7 +375,7 @@ static void omap_wd_timer_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps omap_wd_timer_ops =3D {
>      .read =3D omap_wd_timer_read,
>      .write =3D omap_wd_timer_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_wd_timer_reset(struct omap_watchdog_timer_s *s)
> @@ -487,7 +487,7 @@ static void omap_os_timer_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps omap_os_timer_ops =3D {
>      .read =3D omap_os_timer_read,
>      .write =3D omap_os_timer_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_os_timer_reset(struct omap_32khz_timer_s *s)
> @@ -714,7 +714,7 @@ static void omap_ulpd_pm_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps omap_ulpd_pm_ops =3D {
>      .read =3D omap_ulpd_pm_read,
>      .write =3D omap_ulpd_pm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_ulpd_pm_reset(struct omap_mpu_state_s *mpu)
> @@ -948,7 +948,7 @@ static void omap_pin_cfg_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps omap_pin_cfg_ops =3D {
>      .read =3D omap_pin_cfg_read,
>      .write =3D omap_pin_cfg_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_pin_cfg_reset(struct omap_mpu_state_s *mpu)
> @@ -1039,7 +1039,7 @@ static void omap_id_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_id_ops =3D {
>      .read =3D omap_id_read,
>      .write =3D omap_id_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_id_init(MemoryRegion *memory, struct omap_mpu_state_s *=
mpu)
> @@ -1128,7 +1128,7 @@ static void omap_mpui_write(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps omap_mpui_ops =3D {
>      .read =3D omap_mpui_read,
>      .write =3D omap_mpui_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_mpui_reset(struct omap_mpu_state_s *s)
> @@ -1231,7 +1231,7 @@ static void omap_tipb_bridge_write(void *opaque, hw=
addr addr,
>  static const MemoryRegionOps omap_tipb_bridge_ops =3D {
>      .read =3D omap_tipb_bridge_read,
>      .write =3D omap_tipb_bridge_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_tipb_bridge_reset(struct omap_tipb_bridge_s *s)
> @@ -1336,7 +1336,7 @@ static void omap_tcmi_write(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps omap_tcmi_ops =3D {
>      .read =3D omap_tcmi_read,
>      .write =3D omap_tcmi_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_tcmi_reset(struct omap_mpu_state_s *mpu)
> @@ -1431,7 +1431,7 @@ static void omap_dpll_write(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps omap_dpll_ops =3D {
>      .read =3D omap_dpll_read,
>      .write =3D omap_dpll_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_dpll_reset(struct dpll_ctl_s *s)
> @@ -1743,7 +1743,7 @@ static void omap_clkm_write(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps omap_clkm_ops =3D {
>      .read =3D omap_clkm_read,
>      .write =3D omap_clkm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static uint64_t omap_clkdsp_read(void *opaque, hwaddr addr,
> @@ -1832,7 +1832,7 @@ static void omap_clkdsp_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps omap_clkdsp_ops =3D {
>      .read =3D omap_clkdsp_read,
>      .write =3D omap_clkdsp_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_clkm_reset(struct omap_mpu_state_s *s)
> @@ -2077,7 +2077,7 @@ static void omap_mpuio_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps omap_mpuio_ops  =3D {
>      .read =3D omap_mpuio_read,
>      .write =3D omap_mpuio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_mpuio_reset(struct omap_mpuio_s *s)
> @@ -2283,7 +2283,7 @@ static void omap_uwire_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps omap_uwire_ops =3D {
>      .read =3D omap_uwire_read,
>      .write =3D omap_uwire_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_uwire_reset(struct omap_uwire_s *s)
> @@ -2394,7 +2394,7 @@ static void omap_pwl_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps omap_pwl_ops =3D {
>      .read =3D omap_pwl_read,
>      .write =3D omap_pwl_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_pwl_reset(struct omap_pwl_s *s)
> @@ -2512,7 +2512,7 @@ static void omap_pwt_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps omap_pwt_ops =3D {
>      .read =3Domap_pwt_read,
>      .write =3D omap_pwt_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_pwt_reset(struct omap_pwt_s *s)
> @@ -2849,7 +2849,7 @@ static void omap_rtc_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps omap_rtc_ops =3D {
>      .read =3D omap_rtc_read,
>      .write =3D omap_rtc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_rtc_tick(void *opaque)
> @@ -3447,7 +3447,7 @@ static void omap_mcbsp_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps omap_mcbsp_ops =3D {
>      .read =3D omap_mcbsp_read,
>      .write =3D omap_mcbsp_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_mcbsp_reset(struct omap_mcbsp_s *s)
> @@ -3639,7 +3639,7 @@ static void omap_lpg_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps omap_lpg_ops =3D {
>      .read =3D omap_lpg_read,
>      .write =3D omap_lpg_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_lpg_clk_update(void *opaque, int line, int on)
> @@ -3692,7 +3692,7 @@ static void omap_mpui_io_write(void *opaque, hwaddr=
 addr,
>  static const MemoryRegionOps omap_mpui_io_ops =3D {
>      .read =3D omap_mpui_io_read,
>      .write =3D omap_mpui_io_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_setup_mpui_io(MemoryRegion *system_memory,
> diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
> index 87ced7f..b1e1d3e 100644
> --- a/hw/arm/omap2.c
> +++ b/hw/arm/omap2.c
> @@ -593,7 +593,7 @@ static void omap_eac_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_eac_ops =3D {
>      .read =3D omap_eac_read,
>      .write =3D omap_eac_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static struct omap_eac_s *omap_eac_init(struct omap_target_agent_s *ta,
> @@ -744,7 +744,7 @@ static void omap_sti_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_sti_ops =3D {
>      .read =3D omap_sti_read,
>      .write =3D omap_sti_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static uint64_t omap_sti_fifo_read(void *opaque, hwaddr addr,
> @@ -785,7 +785,7 @@ static void omap_sti_fifo_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps omap_sti_fifo_ops =3D {
>      .read =3D omap_sti_fifo_read,
>      .write =3D omap_sti_fifo_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static struct omap_sti_s *omap_sti_init(struct omap_target_agent_s *ta,
> @@ -1724,7 +1724,7 @@ static void omap_prcm_write(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps omap_prcm_ops =3D {
>      .read =3D omap_prcm_read,
>      .write =3D omap_prcm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_prcm_reset(struct omap_prcm_s *s)
> @@ -2124,7 +2124,7 @@ static const MemoryRegionOps omap_sysctl_ops =3D {
>      .write =3D omap_sysctl_writefn,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_sysctl_reset(struct omap_sysctl_s *s)
> diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
> index cae78d0..5566407 100644
> --- a/hw/arm/omap_sx1.c
> +++ b/hw/arm/omap_sx1.c
> @@ -83,7 +83,7 @@ static void static_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps static_ops =3D {
>      .read =3D static_read,
>      .write =3D static_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  #define sdram_size 0x02000000
> diff --git a/hw/arm/palm.c b/hw/arm/palm.c
> index 9eb9612..78337c3 100644
> --- a/hw/arm/palm.c
> +++ b/hw/arm/palm.c
> @@ -53,7 +53,7 @@ static const MemoryRegionOps static_ops =3D {
>      .write =3D static_write,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  /* Palm Tunsgten|E support */
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index e2e43ae..c04b393 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -149,7 +149,7 @@ static void pxa2xx_pm_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps pxa2xx_pm_ops =3D {
>      .read =3D pxa2xx_pm_read,
>      .write =3D pxa2xx_pm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_pxa2xx_pm =3D {
> @@ -215,7 +215,7 @@ static void pxa2xx_cm_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps pxa2xx_cm_ops =3D {
>      .read =3D pxa2xx_cm_read,
>      .write =3D pxa2xx_cm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_pxa2xx_cm =3D {
> @@ -439,7 +439,7 @@ static void pxa2xx_mm_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps pxa2xx_mm_ops =3D {
>      .read =3D pxa2xx_mm_read,
>      .write =3D pxa2xx_mm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_pxa2xx_mm =3D {
> @@ -738,7 +738,7 @@ static void pxa2xx_ssp_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps pxa2xx_ssp_ops =3D {
>      .read =3D pxa2xx_ssp_read,
>      .write =3D pxa2xx_ssp_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pxa2xx_ssp_reset(DeviceState *d)
> @@ -1105,7 +1105,7 @@ static void pxa2xx_rtc_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps pxa2xx_rtc_ops =3D {
>      .read =3D pxa2xx_rtc_read,
>      .write =3D pxa2xx_rtc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pxa2xx_rtc_init(Object *obj)
> @@ -1426,7 +1426,7 @@ static void pxa2xx_i2c_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps pxa2xx_i2c_ops =3D {
>      .read =3D pxa2xx_i2c_read,
>      .write =3D pxa2xx_i2c_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_pxa2xx_i2c_slave =3D {
> @@ -1684,7 +1684,7 @@ static void pxa2xx_i2s_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps pxa2xx_i2s_ops =3D {
>      .read =3D pxa2xx_i2s_read,
>      .write =3D pxa2xx_i2s_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_pxa2xx_i2s =3D {
> @@ -1921,7 +1921,7 @@ static void pxa2xx_fir_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps pxa2xx_fir_ops =3D {
>      .read =3D pxa2xx_fir_read,
>      .write =3D pxa2xx_fir_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static int pxa2xx_fir_is_empty(void *opaque)
> @@ -2109,8 +2109,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_spac=
e,
>          if (serial_hd(i)) {
>              serial_mm_init(address_space, pxa270_serial[i].io_base, 2,
>                             qdev_get_gpio_in(s->pic, pxa270_serial[i].irq=
n),
> -                           14857000 / 16, serial_hd(i),
> -                           DEVICE_NATIVE_ENDIAN);
> +                           14857000 / 16, serial_hd(i), MO_TE);
>          } else {
>              break;
>          }
> @@ -2233,8 +2232,7 @@ PXA2xxState *pxa255_init(MemoryRegion *address_spac=
e, unsigned int sdram_size)
>          if (serial_hd(i)) {
>              serial_mm_init(address_space, pxa255_serial[i].io_base, 2,
>                             qdev_get_gpio_in(s->pic, pxa255_serial[i].irq=
n),
> -                           14745600 / 16, serial_hd(i),
> -                           DEVICE_NATIVE_ENDIAN);
> +                           14745600 / 16, serial_hd(i), MO_TE);
>          } else {
>              break;
>          }
> diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
> index d1fc9cb..36ffb93 100644
> --- a/hw/arm/pxa2xx_gpio.c
> +++ b/hw/arm/pxa2xx_gpio.c
> @@ -256,7 +256,7 @@ static void pxa2xx_gpio_write(void *opaque, hwaddr of=
fset,
>  static const MemoryRegionOps pxa_gpio_ops =3D {
>      .read =3D pxa2xx_gpio_read,
>      .write =3D pxa2xx_gpio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  DeviceState *pxa2xx_gpio_init(hwaddr base,
> diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
> index 2f4b461..0d95605 100644
> --- a/hw/arm/pxa2xx_pic.c
> +++ b/hw/arm/pxa2xx_pic.c
> @@ -256,7 +256,7 @@ static const ARMCPRegInfo pxa_pic_cp_reginfo[] =3D {
>  static const MemoryRegionOps pxa2xx_pic_ops =3D {
>      .read =3D pxa2xx_pic_mem_read,
>      .write =3D pxa2xx_pic_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static int pxa2xx_pic_post_load(void *opaque, int version_id)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index e96d5be..b5f8b76 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1349,7 +1349,7 @@ static MemTxResult smmu_read_mmio(void *opaque, hwa=
ddr offset, uint64_t *data,
>  static const MemoryRegionOps smmu_mem_ops =3D {
>      .read_with_attrs =3D smmu_read_mmio,
>      .write_with_attrs =3D smmu_write_mmio,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 8,
> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> index 723cf5d..17c0d7a 100644
> --- a/hw/arm/spitz.c
> +++ b/hw/arm/spitz.c
> @@ -145,7 +145,7 @@ enum {
>  static const MemoryRegionOps sl_ops =3D {
>      .read =3D sl_read,
>      .write =3D sl_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void sl_flash_register(PXA2xxState *cpu, int size)
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 499035f..73f0614 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -305,7 +305,7 @@ static void gptm_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps gptm_ops =3D {
>      .read =3D gptm_read,
>      .write =3D gptm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_stellaris_gptm =3D {
> @@ -637,7 +637,7 @@ static void ssys_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps ssys_ops =3D {
>      .read =3D ssys_read,
>      .write =3D ssys_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void ssys_reset(void *opaque)
> @@ -874,7 +874,7 @@ static void stellaris_i2c_reset(stellaris_i2c_state *=
s)
>  static const MemoryRegionOps stellaris_i2c_ops =3D {
>      .read =3D stellaris_i2c_read,
>      .write =3D stellaris_i2c_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_stellaris_i2c =3D {
> @@ -1144,7 +1144,7 @@ static void stellaris_adc_write(void *opaque, hwadd=
r offset,
>  static const MemoryRegionOps stellaris_adc_ops =3D {
>      .read =3D stellaris_adc_read,
>      .write =3D stellaris_adc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_stellaris_adc =3D {
> diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
> index fed51a8..f475ccf 100644
> --- a/hw/arm/strongarm.c
> +++ b/hw/arm/strongarm.c
> @@ -179,7 +179,7 @@ static void strongarm_pic_mem_write(void *opaque, hwa=
ddr offset,
>  static const MemoryRegionOps strongarm_pic_ops =3D {
>      .read =3D strongarm_pic_mem_read,
>      .write =3D strongarm_pic_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void strongarm_pic_initfn(Object *obj)
> @@ -379,7 +379,7 @@ static void strongarm_rtc_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps strongarm_rtc_ops =3D {
>      .read =3D strongarm_rtc_read,
>      .write =3D strongarm_rtc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void strongarm_rtc_init(Object *obj)
> @@ -627,7 +627,7 @@ static void strongarm_gpio_write(void *opaque, hwaddr=
 offset,
>  static const MemoryRegionOps strongarm_gpio_ops =3D {
>      .read =3D strongarm_gpio_read,
>      .write =3D strongarm_gpio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static DeviceState *strongarm_gpio_init(hwaddr base,
> @@ -820,7 +820,7 @@ static void strongarm_ppc_write(void *opaque, hwaddr =
offset,
>  static const MemoryRegionOps strongarm_ppc_ops =3D {
>      .read =3D strongarm_ppc_read,
>      .write =3D strongarm_ppc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void strongarm_ppc_init(Object *obj)
> @@ -1225,7 +1225,7 @@ static void strongarm_uart_write(void *opaque, hwad=
dr addr,
>  static const MemoryRegionOps strongarm_uart_ops =3D {
>      .read =3D strongarm_uart_read,
>      .write =3D strongarm_uart_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void strongarm_uart_init(Object *obj)
> @@ -1514,7 +1514,7 @@ static void strongarm_ssp_write(void *opaque, hwadd=
r addr,
>  static const MemoryRegionOps strongarm_ssp_ops =3D {
>      .read =3D strongarm_ssp_read,
>      .write =3D strongarm_ssp_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static int strongarm_ssp_post_load(void *opaque, int version_id)
> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> index e585711..7ed7ff2 100644
> --- a/hw/arm/versatilepb.c
> +++ b/hw/arm/versatilepb.c
> @@ -149,7 +149,7 @@ static void vpb_sic_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps vpb_sic_ops =3D {
>      .read =3D vpb_sic_read,
>      .write =3D vpb_sic_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void vpb_sic_init(Object *obj)
> diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
> index fb98da2..e115550 100644
> --- a/hw/audio/ac97.c
> +++ b/hw/audio/ac97.c
> @@ -1275,7 +1275,7 @@ static const MemoryRegionOps ac97_io_nam_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t nabm_read(void *opaque, hwaddr addr, unsigned size)
> @@ -1324,7 +1324,7 @@ static const MemoryRegionOps ac97_io_nabm_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void ac97_on_reset (DeviceState *dev)
> diff --git a/hw/audio/cs4231.c b/hw/audio/cs4231.c
> index 8372299..e0b8271 100644
> --- a/hw/audio/cs4231.c
> +++ b/hw/audio/cs4231.c
> @@ -132,7 +132,7 @@ static void cs_mem_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps cs_mem_ops =3D {
>      .read =3D cs_mem_read,
>      .write =3D cs_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_cs4231 =3D {
> diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
> index 260c142..b94db3b 100644
> --- a/hw/audio/es1370.c
> +++ b/hw/audio/es1370.c
> @@ -774,7 +774,7 @@ static const MemoryRegionOps es1370_io_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const VMStateDescription vmstate_es1370_channel =3D {
> diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> index b78baac..1dbd741 100644
> --- a/hw/audio/intel-hda.c
> +++ b/hw/audio/intel-hda.c
> @@ -1068,7 +1068,7 @@ static const MemoryRegionOps intel_hda_mmio_ops =3D=
 {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  /* ---------------------------------------------------------------------=
 */
> diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
> index ff1a0d0..fcff61e 100644
> --- a/hw/audio/marvell_88w8618.c
> +++ b/hw/audio/marvell_88w8618.c
> @@ -240,7 +240,7 @@ static void mv88w8618_audio_reset(DeviceState *d)
>  static const MemoryRegionOps mv88w8618_audio_ops =3D {
>      .read =3D mv88w8618_audio_read,
>      .write =3D mv88w8618_audio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void mv88w8618_audio_init(Object *obj)
> diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c
> index bf6a5a6..46b4f1e 100644
> --- a/hw/audio/milkymist-ac97.c
> +++ b/hw/audio/milkymist-ac97.c
> @@ -176,7 +176,7 @@ static const MemoryRegionOps ac97_mmio_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void ac97_in_cb(void *opaque, int avail_b)
> diff --git a/hw/audio/pl041.c b/hw/audio/pl041.c
> index 59c6ce1..6f16c34 100644
> --- a/hw/audio/pl041.c
> +++ b/hw/audio/pl041.c
> @@ -519,7 +519,7 @@ static void pl041_device_reset(DeviceState *d)
>  static const MemoryRegionOps pl041_ops =3D {
>      .read =3D pl041_read,
>      .write =3D pl041_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pl041_init(Object *obj)
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index 9b24cb9..f87fbac 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -981,13 +981,13 @@ static void fdctrl_write_mem (void *opaque, hwaddr =
reg,
>  static const MemoryRegionOps fdctrl_mem_ops =3D {
>      .read =3D fdctrl_read_mem,
>      .write =3D fdctrl_write_mem,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const MemoryRegionOps fdctrl_mem_strict_ops =3D {
>      .read =3D fdctrl_read_mem,
>      .write =3D fdctrl_write_mem,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 36d6a8b..7d71e59 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1272,7 +1272,7 @@ static void nvme_mmio_write(void *opaque, hwaddr ad=
dr, uint64_t data,
>  static const MemoryRegionOps nvme_mmio_ops =3D {
>      .read =3D nvme_mmio_read,
>      .write =3D nvme_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 2,
>          .max_access_size =3D 8,
> @@ -1295,7 +1295,7 @@ static uint64_t nvme_cmb_read(void *opaque, hwaddr =
addr, unsigned size)
>  static const MemoryRegionOps nvme_cmb_ops =3D {
>      .read =3D nvme_cmb_read,
>      .write =3D nvme_cmb_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 8,
> diff --git a/hw/block/onenand.c b/hw/block/onenand.c
> index b3644f7..f475daa 100644
> --- a/hw/block/onenand.c
> +++ b/hw/block/onenand.c
> @@ -769,7 +769,7 @@ static void onenand_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps onenand_ops =3D {
>      .read =3D onenand_read,
>      .write =3D onenand_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void onenand_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index a1ec1fa..aa51958 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -694,7 +694,7 @@ static MemTxResult pflash_mem_write_with_attrs(void *=
opaque, hwaddr addr, uint64
>  static const MemoryRegionOps pflash_cfi01_ops =3D {
>      .read_with_attrs =3D pflash_mem_read_with_attrs,
>      .write_with_attrs =3D pflash_mem_write_with_attrs,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 42886f6..80c4091 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -713,7 +713,7 @@ static const MemoryRegionOps pflash_cfi02_ops =3D {
>      .write =3D pflash_write,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
> index 94679d2..f3c2947 100644
> --- a/hw/char/bcm2835_aux.c
> +++ b/hw/char/bcm2835_aux.c
> @@ -244,7 +244,7 @@ static void bcm2835_aux_receive(void *opaque, const u=
int8_t *buf, int size)
>  static const MemoryRegionOps bcm2835_aux_ops =3D {
>      .read =3D bcm2835_aux_read,
>      .write =3D bcm2835_aux_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>  };
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index fa25fe2..f280469 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -457,7 +457,7 @@ static uint64_t uart_read(void *opaque, hwaddr offset,
>  static const MemoryRegionOps uart_ops =3D {
>      .read =3D uart_read,
>      .write =3D uart_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void cadence_uart_reset(DeviceState *dev)
> diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
> index 606c9cc..e3ef1eb 100644
> --- a/hw/char/cmsdk-apb-uart.c
> +++ b/hw/char/cmsdk-apb-uart.c
> @@ -298,7 +298,7 @@ static void uart_write(void *opaque, hwaddr offset, u=
int64_t value,
>  static const MemoryRegionOps uart_ops =3D {
>      .read =3D uart_read,
>      .write =3D uart_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void cmsdk_apb_uart_reset(DeviceState *dev)
> diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
> index e1b6d11..1f1cfc5 100644
> --- a/hw/char/debugcon.c
> +++ b/hw/char/debugcon.c
> @@ -82,7 +82,7 @@ static const MemoryRegionOps debugcon_ops =3D {
>      .write =3D debugcon_ioport_write,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 1,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void debugcon_realize_core(DebugconState *s, Error **errp)
> diff --git a/hw/char/digic-uart.c b/hw/char/digic-uart.c
> index e4ac843..863f467 100644
> --- a/hw/char/digic-uart.c
> +++ b/hw/char/digic-uart.c
> @@ -110,7 +110,7 @@ static const MemoryRegionOps uart_mmio_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static int uart_can_rx(void *opaque)
> diff --git a/hw/char/escc.c b/hw/char/escc.c
> index 8ddbb4b..20bd68a 100644
> --- a/hw/char/escc.c
> +++ b/hw/char/escc.c
> @@ -574,7 +574,7 @@ static uint64_t escc_mem_read(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps escc_mem_ops =3D {
>      .read =3D escc_mem_read,
>      .write =3D escc_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
> index 9745bca..e9c283e 100644
> --- a/hw/char/etraxfs_ser.c
> +++ b/hw/char/etraxfs_ser.c
> @@ -155,7 +155,7 @@ ser_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps ser_ops =3D {
>      .read =3D ser_read,
>      .write =3D ser_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
> index c5700ee..3497e5b 100644
> --- a/hw/char/exynos4210_uart.c
> +++ b/hw/char/exynos4210_uart.c
> @@ -481,7 +481,7 @@ static uint64_t exynos4210_uart_read(void *opaque, hw=
addr offset,
>  static const MemoryRegionOps exynos4210_uart_ops =3D {
>      .read =3D exynos4210_uart_read,
>      .write =3D exynos4210_uart_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .max_access_size =3D 4,
>          .unaligned =3D false
> diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
> index c2bb3ac..ede9af3 100644
> --- a/hw/char/grlib_apbuart.c
> +++ b/hw/char/grlib_apbuart.c
> @@ -237,7 +237,7 @@ static void grlib_apbuart_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps grlib_apbuart_ops =3D {
>      .write      =3D grlib_apbuart_write,
>      .read       =3D grlib_apbuart_read,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void grlib_apbuart_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
> index 0655a95..1099b4a 100644
> --- a/hw/char/imx_serial.c
> +++ b/hw/char/imx_serial.c
> @@ -332,7 +332,7 @@ static void imx_event(void *opaque, int event)
>  static const struct MemoryRegionOps imx_serial_ops =3D {
>      .read =3D imx_serial_read,
>      .write =3D imx_serial_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void imx_serial_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
> index d047a44..2f01d9a 100644
> --- a/hw/char/lm32_uart.c
> +++ b/hw/char/lm32_uart.c
> @@ -205,7 +205,7 @@ static void uart_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps uart_ops =3D {
>      .read =3D uart_read,
>      .write =3D uart_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
> index 7b06110..9ea74de 100644
> --- a/hw/char/mcf_uart.c
> +++ b/hw/char/mcf_uart.c
> @@ -286,7 +286,7 @@ static void mcf_uart_receive(void *opaque, const uint=
8_t *buf, int size)
>  static const MemoryRegionOps mcf_uart_ops =3D {
>      .read =3D mcf_uart_read,
>      .write =3D mcf_uart_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void mcf_uart_instance_init(Object *obj)
> diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c
> index 8a78fcc..86d2ad6 100644
> --- a/hw/char/milkymist-uart.c
> +++ b/hw/char/milkymist-uart.c
> @@ -156,7 +156,7 @@ static const MemoryRegionOps uart_mmio_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void uart_rx(void *opaque, const uint8_t *buf, int size)
> diff --git a/hw/char/nrf51_uart.c b/hw/char/nrf51_uart.c
> index c90b491..6a72813 100644
> --- a/hw/char/nrf51_uart.c
> +++ b/hw/char/nrf51_uart.c
> @@ -189,7 +189,7 @@ static void uart_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps uart_ops =3D {
>      .read =3D  uart_read,
>      .write =3D uart_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void nrf51_uart_reset(DeviceState *dev)
> diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c
> index b3bb1cf..2de1abc 100644
> --- a/hw/char/omap_uart.c
> +++ b/hw/char/omap_uart.c
> @@ -64,7 +64,7 @@ struct omap_uart_s *omap_uart_init(hwaddr base,
>      s->serial =3D serial_mm_init(get_system_memory(), base, 2, irq,
>                                 omap_clk_getrate(fclk)/16,
>                                 chr ?: qemu_chr_new(label, "null", NULL),
> -                               DEVICE_NATIVE_ENDIAN);
> +                               MO_TE);
>      return s;
>  }
>=20
> @@ -156,7 +156,7 @@ static void omap_uart_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_uart_ops =3D {
>      .read =3D omap_uart_read,
>      .write =3D omap_uart_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  struct omap_uart_s *omap2_uart_init(MemoryRegion *sysmem,
> @@ -184,5 +184,5 @@ void omap_uart_attach(struct omap_uart_s *s, Chardev =
*chr)
>      s->serial =3D serial_mm_init(get_system_memory(), s->base, 2, s->irq,
>                                 omap_clk_getrate(s->fclk) / 16,
>                                 chr ?: qemu_chr_new("null", "null", NULL),
> -                               DEVICE_NATIVE_ENDIAN);
> +                               MO_TE);
>  }
> diff --git a/hw/char/parallel.c b/hw/char/parallel.c
> index 1cd4c54..32552db 100644
> --- a/hw/char/parallel.c
> +++ b/hw/char/parallel.c
> @@ -588,7 +588,7 @@ static const MemoryRegionOps parallel_mm_ops =3D {
>      .write =3D parallel_mm_writefn,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  /* If fd is zero, it means that the parallel device uses the console */
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index c1ae2f3..51c110c 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -287,7 +287,7 @@ static void pl011_event(void *opaque, int event)
>  static const MemoryRegionOps pl011_ops =3D {
>      .read =3D pl011_read,
>      .write =3D pl011_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_pl011 =3D {
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 7345f69..0b5bbaf 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -973,7 +973,7 @@ const MemoryRegionOps serial_io_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  SerialState *serial_init(int base, qemu_irq irq, int baudbase,
> @@ -1016,14 +1016,14 @@ static const MemoryRegionOps serial_mm_ops[2] =3D=
 {
>      [0] =3D {
>          .read =3D serial_mm_read,
>          .write =3D serial_mm_write,
> -        .endianness =3D DEVICE_LITTLE_ENDIAN,
> +        .endianness =3D MO_LE,
>          .valid.max_access_size =3D 8,
>          .impl.max_access_size =3D 8,
>      },
>      [1] =3D {
>          .read =3D serial_mm_read,
>          .write =3D serial_mm_write,
> -        .endianness =3D DEVICE_BIG_ENDIAN,
> +        .endianness =3D MO_BE,
>          .valid.max_access_size =3D 8,
>          .impl.max_access_size =3D 8,
>      },
> @@ -1032,7 +1032,7 @@ static const MemoryRegionOps serial_mm_ops[2] =3D {
>  SerialState *serial_mm_init(MemoryRegion *address_space,
>                              hwaddr base, int it_shift,
>                              qemu_irq irq, int baudbase,
> -                            Chardev *chr, enum device_endian end)
> +                            Chardev *chr, MemOp end)
>  {
>      SerialState *s;
>=20
> @@ -1047,7 +1047,7 @@ SerialState *serial_mm_init(MemoryRegion *address_s=
pace,
>      vmstate_register(NULL, base, &vmstate_serial, s);
>=20
>      memory_region_init_io(&s->io, NULL,
> -                          &serial_mm_ops[end =3D=3D DEVICE_LITTLE_ENDIAN=
 ? 0 : 1],
> +                          &serial_mm_ops[end =3D=3D MO_LE ? 0 : 1],
>                            s, "serial", 8 << it_shift);
>      memory_region_add_subregion(address_space, base, &s->io);
>      return s;
> diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
> index 67740b7..f789c06 100644
> --- a/hw/char/sh_serial.c
> +++ b/hw/char/sh_serial.c
> @@ -367,7 +367,7 @@ static void sh_serial_event(void *opaque, int event)
>  static const MemoryRegionOps sh_serial_ops =3D {
>      .read =3D sh_serial_read,
>      .write =3D sh_serial_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  void sh_serial_init(MemoryRegion *sysmem,
> diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
> index 40c365b..65fd733 100644
> --- a/hw/char/stm32f2xx_usart.c
> +++ b/hw/char/stm32f2xx_usart.c
> @@ -187,7 +187,7 @@ static void stm32f2xx_usart_write(void *opaque, hwadd=
r addr,
>  static const MemoryRegionOps stm32f2xx_usart_ops =3D {
>      .read =3D stm32f2xx_usart_read,
>      .write =3D stm32f2xx_usart_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static Property stm32f2xx_usart_properties[] =3D {
> diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
> index 880962a..48f2b85 100644
> --- a/hw/char/xilinx_uartlite.c
> +++ b/hw/char/xilinx_uartlite.c
> @@ -166,7 +166,7 @@ uart_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps uart_ops =3D {
>      .read =3D uart_read,
>      .write =3D uart_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4
> diff --git a/hw/core/empty_slot.c b/hw/core/empty_slot.c
> index c694532..245a333 100644
> --- a/hw/core/empty_slot.c
> +++ b/hw/core/empty_slot.c
> @@ -50,7 +50,7 @@ static void empty_slot_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps empty_slot_ops =3D {
>      .read =3D empty_slot_read,
>      .write =3D empty_slot_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  void empty_slot_init(hwaddr addr, uint64_t slot_size)
> diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
> index 940c7dd..a98ffd3 100644
> --- a/hw/cris/axis_dev88.c
> +++ b/hw/cris/axis_dev88.c
> @@ -83,7 +83,7 @@ nand_write(void *opaque, hwaddr addr, uint64_t value,
>  static const MemoryRegionOps nand_ops =3D {
>      .read =3D nand_read,
>      .write =3D nand_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  struct tempsensor_t
> @@ -235,7 +235,7 @@ static void gpio_write(void *opaque, hwaddr addr, uin=
t64_t value,
>  static const MemoryRegionOps gpio_ops =3D {
>      .read =3D gpio_read,
>      .write =3D gpio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/display/ati.c b/hw/display/ati.c
> index a747c4c..ef37e8d 100644
> --- a/hw/display/ati.c
> +++ b/hw/display/ati.c
> @@ -810,7 +810,7 @@ static void ati_mm_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps ati_mm_ops =3D {
>      .read =3D ati_mm_read,
>      .write =3D ati_mm_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void ati_vga_realize(PCIDevice *dev, Error **errp)
> diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
> index 2311ec7..78dc827 100644
> --- a/hw/display/bcm2835_fb.c
> +++ b/hw/display/bcm2835_fb.c
> @@ -340,7 +340,7 @@ static void bcm2835_fb_write(void *opaque, hwaddr off=
set, uint64_t value,
>  static const MemoryRegionOps bcm2835_fb_ops =3D {
>      .read =3D bcm2835_fb_read,
>      .write =3D bcm2835_fb_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>  };
> diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
> index 582133d..366a259 100644
> --- a/hw/display/bochs-display.c
> +++ b/hw/display/bochs-display.c
> @@ -106,7 +106,7 @@ static const MemoryRegionOps bochs_display_vbe_ops =
=3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 2,
>      .impl.max_access_size =3D 2,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t bochs_display_qext_read(void *ptr, hwaddr addr,
> @@ -147,7 +147,7 @@ static const MemoryRegionOps bochs_display_qext_ops =
=3D {
>      .write =3D bochs_display_qext_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static int bochs_display_get_mode(BochsDisplayState *s,
> diff --git a/hw/display/cg3.c b/hw/display/cg3.c
> index a7340dc..dade07d 100644
> --- a/hw/display/cg3.c
> +++ b/hw/display/cg3.c
> @@ -267,7 +267,7 @@ static void cg3_reg_write(void *opaque, hwaddr addr, =
uint64_t val,
>  static const MemoryRegionOps cg3_reg_ops =3D {
>      .read =3D cg3_reg_read,
>      .write =3D cg3_reg_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
> diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
> index 2e4911a..03123ba 100644
> --- a/hw/display/cirrus_vga.c
> +++ b/hw/display/cirrus_vga.c
> @@ -2123,7 +2123,7 @@ static void cirrus_vga_mem_write(void *opaque,
>  static const MemoryRegionOps cirrus_vga_mem_ops =3D {
>      .read =3D cirrus_vga_mem_read,
>      .write =3D cirrus_vga_mem_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -2436,7 +2436,7 @@ static void cirrus_linear_bitblt_write(void *opaque,
>  static const MemoryRegionOps cirrus_linear_bitblt_io_ops =3D {
>      .read =3D cirrus_linear_bitblt_read,
>      .write =3D cirrus_linear_bitblt_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -2736,7 +2736,7 @@ static void cirrus_mmio_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps cirrus_mmio_io_ops =3D {
>      .read =3D cirrus_mmio_read,
>      .write =3D cirrus_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -2847,7 +2847,7 @@ static void cirrus_reset(void *opaque)
>  static const MemoryRegionOps cirrus_linear_io_ops =3D {
>      .read =3D cirrus_linear_read,
>      .write =3D cirrus_linear_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -2857,7 +2857,7 @@ static const MemoryRegionOps cirrus_linear_io_ops =
=3D {
>  static const MemoryRegionOps cirrus_vga_io_ops =3D {
>      .read =3D cirrus_vga_ioport_read,
>      .write =3D cirrus_vga_ioport_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/display/edid-region.c b/hw/display/edid-region.c
> index d0d31ba..094b200 100644
> --- a/hw/display/edid-region.c
> +++ b/hw/display/edid-region.c
> @@ -21,7 +21,7 @@ static const MemoryRegionOps edid_region_ops =3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 1,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  void qemu_edid_region_io(MemoryRegion *region, Object *owner,
> diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
> index 61f7408..cdd2977 100644
> --- a/hw/display/exynos4210_fimd.c
> +++ b/hw/display/exynos4210_fimd.c
> @@ -1818,7 +1818,7 @@ static const MemoryRegionOps exynos4210_fimd_mmio_o=
ps =3D {
>          .max_access_size =3D 4,
>          .unaligned =3D false
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static int exynos4210_fimd_load(void *opaque, int version_id)
> diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
> index 1774b44..3b02d3f 100644
> --- a/hw/display/g364fb.c
> +++ b/hw/display/g364fb.c
> @@ -428,7 +428,7 @@ static void g364fb_ctrl_write(void *opaque,
>  static const MemoryRegionOps g364fb_ctrl_ops =3D {
>      .read =3D g364fb_ctrl_read,
>      .write =3D g364fb_ctrl_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
>  };
> diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
> index 783189e..6f3e626 100644
> --- a/hw/display/jazz_led.c
> +++ b/hw/display/jazz_led.c
> @@ -72,7 +72,7 @@ static void jazz_led_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps led_ops =3D {
>      .read =3D jazz_led_read,
>      .write =3D jazz_led_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 1,
>  };
> diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
> index e1ed018..ed39a14 100644
> --- a/hw/display/milkymist-tmu2.c
> +++ b/hw/display/milkymist-tmu2.c
> @@ -434,7 +434,7 @@ static const MemoryRegionOps tmu2_mmio_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void milkymist_tmu2_reset(DeviceState *d)
> diff --git a/hw/display/milkymist-vgafb.c b/hw/display/milkymist-vgafb.c
> index dce1dd7..1c7fc17 100644
> --- a/hw/display/milkymist-vgafb.c
> +++ b/hw/display/milkymist-vgafb.c
> @@ -269,7 +269,7 @@ static const MemoryRegionOps vgafb_mmio_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void milkymist_vgafb_reset(DeviceState *d)
> diff --git a/hw/display/omap_dss.c b/hw/display/omap_dss.c
> index 601f178..cb6b882 100644
> --- a/hw/display/omap_dss.c
> +++ b/hw/display/omap_dss.c
> @@ -245,7 +245,7 @@ static void omap_diss_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_diss_ops =3D {
>      .read =3D omap_diss_read,
>      .write =3D omap_diss_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static uint64_t omap_disc_read(void *opaque, hwaddr addr,
> @@ -589,7 +589,7 @@ static void omap_disc_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_disc_ops =3D {
>      .read =3D omap_disc_read,
>      .write =3D omap_disc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_rfbi_transfer_stop(struct omap_dss_s *s)
> @@ -865,7 +865,7 @@ static void omap_rfbi_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_rfbi_ops =3D {
>      .read =3D omap_rfbi_read,
>      .write =3D omap_rfbi_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static uint64_t omap_venc_read(void *opaque, hwaddr addr,
> @@ -988,7 +988,7 @@ static void omap_venc_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_venc_ops =3D {
>      .read =3D omap_venc_read,
>      .write =3D omap_venc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static uint64_t omap_im3_read(void *opaque, hwaddr addr,
> @@ -1042,7 +1042,7 @@ static void omap_im3_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps omap_im3_ops =3D {
>      .read =3D omap_im3_read,
>      .write =3D omap_im3_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  struct omap_dss_s *omap_dss_init(struct omap_target_agent_s *ta,
> diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
> index 07a5eff..d5d316f 100644
> --- a/hw/display/omap_lcdc.c
> +++ b/hw/display/omap_lcdc.c
> @@ -330,7 +330,7 @@ static void omap_lcdc_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_lcdc_ops =3D {
>      .read =3D omap_lcdc_read,
>      .write =3D omap_lcdc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  void omap_lcdc_reset(struct omap_lcd_panel_s *s)
> diff --git a/hw/display/pl110.c b/hw/display/pl110.c
> index 2bdfc3c..cec81ba 100644
> --- a/hw/display/pl110.c
> +++ b/hw/display/pl110.c
> @@ -471,7 +471,7 @@ static void pl110_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps pl110_ops =3D {
>      .read =3D pl110_read,
>      .write =3D pl110_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pl110_mux_ctrl_set(void *opaque, int line, int level)
> diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
> index b83f807..fc2a3c4 100644
> --- a/hw/display/pxa2xx_lcd.c
> +++ b/hw/display/pxa2xx_lcd.c
> @@ -567,7 +567,7 @@ static void pxa2xx_lcdc_write(void *opaque, hwaddr of=
fset,
>  static const MemoryRegionOps pxa2xx_lcdc_ops =3D {
>      .read =3D pxa2xx_lcdc_read,
>      .write =3D pxa2xx_lcdc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  /* Load new palette for a given DMA channel, convert to internal format =
*/
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 5918f59..b147d98 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -967,7 +967,7 @@ static const MemoryRegionOps sm501_system_config_ops =
=3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t sm501_i2c_read(void *opaque, hwaddr addr, unsigned size)
> @@ -1070,7 +1070,7 @@ static const MemoryRegionOps sm501_i2c_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint32_t sm501_palette_read(void *opaque, hwaddr addr)
> @@ -1358,7 +1358,7 @@ static const MemoryRegionOps sm501_disp_ctrl_ops =
=3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
> @@ -1533,7 +1533,7 @@ static const MemoryRegionOps sm501_2d_engine_ops =
=3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  /* draw line functions for all console modes */
> @@ -1961,7 +1961,7 @@ static void sm501_realize_sysbus(DeviceState *dev, =
Error **errp)
>      if (s->chr_state) {
>          serial_mm_init(&s->state.mmio_region, SM501_UART0, 2,
>                         NULL, /* TODO : chain irq to IRL */
> -                       115200, s->chr_state, DEVICE_LITTLE_ENDIAN);
> +                       115200, s->chr_state, MO_LE);
>      }
>  }
>=20
> diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
> index 0b7c59c..21109d6 100644
> --- a/hw/display/tc6393xb.c
> +++ b/hw/display/tc6393xb.c
> @@ -547,7 +547,7 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sysmem, ui=
nt32_t base, qemu_irq irq)
>      static const MemoryRegionOps tc6393xb_ops =3D {
>          .read =3D tc6393xb_readb,
>          .write =3D tc6393xb_writeb,
> -        .endianness =3D DEVICE_NATIVE_ENDIAN,
> +        .endianness =3D MO_TE,
>          .impl =3D {
>              .min_access_size =3D 1,
>              .max_access_size =3D 1,
> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index cdabcbc..3a841dc 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -462,7 +462,7 @@ static void tcx_dac_writel(void *opaque, hwaddr addr,=
 uint64_t val,
>  static const MemoryRegionOps tcx_dac_ops =3D {
>      .read =3D tcx_dac_readl,
>      .write =3D tcx_dac_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -543,7 +543,7 @@ static void tcx_rstip_writel(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps tcx_stip_ops =3D {
>      .read =3D tcx_stip_readl,
>      .write =3D tcx_stip_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -553,7 +553,7 @@ static const MemoryRegionOps tcx_stip_ops =3D {
>  static const MemoryRegionOps tcx_rstip_ops =3D {
>      .read =3D tcx_stip_readl,
>      .write =3D tcx_rstip_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -635,7 +635,7 @@ static void tcx_rblit_writel(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps tcx_blit_ops =3D {
>      .read =3D tcx_blit_readl,
>      .write =3D tcx_blit_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -645,7 +645,7 @@ static const MemoryRegionOps tcx_blit_ops =3D {
>  static const MemoryRegionOps tcx_rblit_ops =3D {
>      .read =3D tcx_blit_readl,
>      .write =3D tcx_rblit_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -707,7 +707,7 @@ static void tcx_thc_writel(void *opaque, hwaddr addr,
>  static const MemoryRegionOps tcx_thc_ops =3D {
>      .read =3D tcx_thc_readl,
>      .write =3D tcx_thc_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -729,7 +729,7 @@ static void tcx_dummy_writel(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps tcx_dummy_ops =3D {
>      .read =3D tcx_dummy_readl,
>      .write =3D tcx_dummy_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
> index 215e649..58e299b 100644
> --- a/hw/display/vga-isa-mm.c
> +++ b/hw/display/vga-isa-mm.c
> @@ -60,7 +60,7 @@ static const MemoryRegionOps vga_mm_ctrl_ops =3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void vga_mm_init(ISAVGAMMState *s, hwaddr vram_base,
> diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
> index dedac5d..c893968 100644
> --- a/hw/display/vga-pci.c
> +++ b/hw/display/vga-pci.c
> @@ -110,7 +110,7 @@ static const MemoryRegionOps pci_vga_ioport_ops =3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 2,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t pci_vga_bochs_read(void *ptr, hwaddr addr,
> @@ -140,7 +140,7 @@ static const MemoryRegionOps pci_vga_bochs_ops =3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 2,
>      .impl.max_access_size =3D 2,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t pci_vga_qext_read(void *ptr, hwaddr addr, unsigned size)
> @@ -194,7 +194,7 @@ static const MemoryRegionOps pci_vga_qext_ops =3D {
>      .write =3D pci_vga_qext_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  void pci_std_vga_mmio_region_init(VGACommonState *s,
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index 910a23c..046bbfa 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -2062,7 +2062,7 @@ static void vga_mem_write(void *opaque, hwaddr addr,
>  const MemoryRegionOps vga_mem_ops =3D {
>      .read =3D vga_mem_read,
>      .write =3D vga_mem_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
> index 249a179..e534a33 100644
> --- a/hw/display/vmware_vga.c
> +++ b/hw/display/vmware_vga.c
> @@ -1280,7 +1280,7 @@ static void vmsvga_io_write(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps vmsvga_io_ops =3D {
>      .read =3D vmsvga_io_read,
>      .write =3D vmsvga_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index cc5b650..9fbfc0b 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -301,7 +301,7 @@ static void xlnx_dp_audio_write(void *opaque, hwaddr =
offset, uint64_t value,
>  static const MemoryRegionOps audio_ops =3D {
>      .read =3D xlnx_dp_audio_read,
>      .write =3D xlnx_dp_audio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static inline uint32_t xlnx_dp_audio_get_volume(XlnxDPState *s,
> @@ -876,7 +876,7 @@ static void xlnx_dp_write(void *opaque, hwaddr offset=
, uint64_t value,
>  static const MemoryRegionOps dp_ops =3D {
>      .read =3D xlnx_dp_read,
>      .write =3D xlnx_dp_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -991,7 +991,7 @@ static uint64_t xlnx_dp_vblend_read(void *opaque, hwa=
ddr offset,
>  static const MemoryRegionOps vblend_ops =3D {
>      .read =3D xlnx_dp_vblend_read,
>      .write =3D xlnx_dp_vblend_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1104,7 +1104,7 @@ static uint64_t xlnx_dp_avbufm_read(void *opaque, h=
waddr offset,
>  static const MemoryRegionOps avbufm_ops =3D {
>      .read =3D xlnx_dp_avbufm_read,
>      .write =3D xlnx_dp_avbufm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
> index a39e8f4..2148db1 100644
> --- a/hw/dma/bcm2835_dma.c
> +++ b/hw/dma/bcm2835_dma.c
> @@ -288,7 +288,7 @@ static void bcm2835_dma15_write(void *opaque, hwaddr =
offset, uint64_t value,
>  static const MemoryRegionOps bcm2835_dma0_ops =3D {
>      .read =3D bcm2835_dma0_read,
>      .write =3D bcm2835_dma0_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>  };
> @@ -296,7 +296,7 @@ static const MemoryRegionOps bcm2835_dma0_ops =3D {
>  static const MemoryRegionOps bcm2835_dma15_ops =3D {
>      .read =3D bcm2835_dma15_read,
>      .write =3D bcm2835_dma15_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>  };
> diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
> index 85783eb..bd26769 100644
> --- a/hw/dma/etraxfs_dma.c
> +++ b/hw/dma/etraxfs_dma.c
> @@ -697,7 +697,7 @@ dma_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps dma_ops =3D {
>   .read =3D dma_read,
>   .write =3D dma_write,
> - .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>   .valid =3D {
>   .min_access_size =3D 1,
>   .max_access_size =3D 4
> diff --git a/hw/dma/i8257.c b/hw/dma/i8257.c
> index 30a3442..cf71c47 100644
> --- a/hw/dma/i8257.c
> +++ b/hw/dma/i8257.c
> @@ -475,7 +475,7 @@ static int i8257_phony_handler(void *opaque, int ncha=
n, int dma_pos,
>  static const MemoryRegionOps channel_io_ops =3D {
>      .read =3D i8257_read_chan,
>      .write =3D i8257_write_chan,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -499,7 +499,7 @@ static const MemoryRegionPortio pageh_portio_list[] =
=3D {
>  static const MemoryRegionOps cont_io_ops =3D {
>      .read =3D i8257_read_cont,
>      .write =3D i8257_write_cont,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
> index eab83c5..16cc7df 100644
> --- a/hw/dma/omap_dma.c
> +++ b/hw/dma/omap_dma.c
> @@ -1552,7 +1552,7 @@ static void omap_dma_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps omap_dma_ops =3D {
>      .read =3D omap_dma_read,
>      .write =3D omap_dma_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_dma_request(void *opaque, int drq, int req)
> @@ -2073,7 +2073,7 @@ static void omap_dma4_write(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps omap_dma4_ops =3D {
>      .read =3D omap_dma4_read,
>      .write =3D omap_dma4_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  struct soc_dma_s *omap_dma4_init(hwaddr base, qemu_irq *irqs,
> diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
> index 7e57624..4e80459 100644
> --- a/hw/dma/pl080.c
> +++ b/hw/dma/pl080.c
> @@ -346,7 +346,7 @@ static void pl080_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps pl080_ops =3D {
>      .read =3D pl080_read,
>      .write =3D pl080_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pl080_reset(DeviceState *dev)
> diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
> index a56a3e7..deec0bc 100644
> --- a/hw/dma/pl330.c
> +++ b/hw/dma/pl330.c
> @@ -1493,7 +1493,7 @@ static uint64_t pl330_iomem_read(void *opaque, hwad=
dr offset,
>  static const MemoryRegionOps pl330_ops =3D {
>      .read =3D pl330_iomem_read,
>      .write =3D pl330_iomem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c
> index 122f87a..94947bc 100644
> --- a/hw/dma/puv3_dma.c
> +++ b/hw/dma/puv3_dma.c
> @@ -75,7 +75,7 @@ static const MemoryRegionOps puv3_dma_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void puv3_dma_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
> index d6fb957..fa1c38f 100644
> --- a/hw/dma/pxa2xx_dma.c
> +++ b/hw/dma/pxa2xx_dma.c
> @@ -424,7 +424,7 @@ static void pxa2xx_dma_write(void *opaque, hwaddr off=
set,
>  static const MemoryRegionOps pxa2xx_dma_ops =3D {
>      .read =3D pxa2xx_dma_read,
>      .write =3D pxa2xx_dma_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pxa2xx_dma_request(void *opaque, int req_num, int on)
> diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
> index 155af9b..631880d 100644
> --- a/hw/dma/rc4030.c
> +++ b/hw/dma/rc4030.c
> @@ -387,7 +387,7 @@ static const MemoryRegionOps rc4030_ops =3D {
>      .write =3D rc4030_write,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void update_jazz_irq(rc4030State *s)
> @@ -490,7 +490,7 @@ static const MemoryRegionOps jazzio_ops =3D {
>      .write =3D jazzio_write,
>      .impl.min_access_size =3D 2,
>      .impl.max_access_size =3D 2,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static IOMMUTLBEntry rc4030_dma_translate(IOMMUMemoryRegion *iommu, hwad=
dr addr,
> diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
> index 88765d0..2cc1562 100644
> --- a/hw/dma/sparc32_dma.c
> +++ b/hw/dma/sparc32_dma.c
> @@ -224,7 +224,7 @@ static void dma_mem_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps dma_mem_ops =3D {
>      .read =3D dma_mem_read,
>      .write =3D dma_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 921be17..da79828 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -512,7 +512,7 @@ static void axidma_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps axidma_ops =3D {
>      .read =3D axidma_read,
>      .write =3D axidma_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index 51e1ead..ecf4ff6 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -742,7 +742,7 @@ static void zdma_write(void *opaque, hwaddr addr, uin=
t64_t value,
>  static const MemoryRegionOps zdma_ops =3D {
>      .read =3D zdma_read,
>      .write =3D zdma_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
> index 7a03ce1..a14c966 100644
> --- a/hw/dma/xlnx-zynq-devcfg.c
> +++ b/hw/dma/xlnx-zynq-devcfg.c
> @@ -319,7 +319,7 @@ static const RegisterAccessInfo xlnx_zynq_devcfg_regs=
_info[] =3D {
>  static const MemoryRegionOps xlnx_zynq_devcfg_reg_ops =3D {
>      .read =3D register_read_memory,
>      .write =3D register_write_memory,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
> index e834f81..47a0a82 100644
> --- a/hw/dma/xlnx_dpdma.c
> +++ b/hw/dma/xlnx_dpdma.c
> @@ -552,7 +552,7 @@ static void xlnx_dpdma_write(void *opaque, hwaddr off=
set,
>  static const MemoryRegionOps dma_ops =3D {
>      .read =3D xlnx_dpdma_read,
>      .write =3D xlnx_dpdma_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/gpio/bcm2835_gpio.c b/hw/gpio/bcm2835_gpio.c
> index ba8dd6c..8b072f5 100644
> --- a/hw/gpio/bcm2835_gpio.c
> +++ b/hw/gpio/bcm2835_gpio.c
> @@ -275,7 +275,7 @@ static void bcm2835_gpio_reset(DeviceState *dev)
>  static const MemoryRegionOps bcm2835_gpio_ops =3D {
>      .read =3D bcm2835_gpio_read,
>      .write =3D bcm2835_gpio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_bcm2835_gpio =3D {
> diff --git a/hw/gpio/imx_gpio.c b/hw/gpio/imx_gpio.c
> index a51af72..d60e5d3 100644
> --- a/hw/gpio/imx_gpio.c
> +++ b/hw/gpio/imx_gpio.c
> @@ -267,7 +267,7 @@ static const MemoryRegionOps imx_gpio_ops =3D {
>      .write =3D imx_gpio_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_imx_gpio =3D {
> diff --git a/hw/gpio/mpc8xxx.c b/hw/gpio/mpc8xxx.c
> index 6ff56dc..76d9eb8 100644
> --- a/hw/gpio/mpc8xxx.c
> +++ b/hw/gpio/mpc8xxx.c
> @@ -180,7 +180,7 @@ static void mpc8xxx_gpio_set_irq(void * opaque, int i=
rq, int level)
>  static const MemoryRegionOps mpc8xxx_gpio_ops =3D {
>      .read =3D mpc8xxx_gpio_read,
>      .write =3D mpc8xxx_gpio_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void mpc8xxx_gpio_initfn(Object *obj)
> diff --git a/hw/gpio/nrf51_gpio.c b/hw/gpio/nrf51_gpio.c
> index dd6c16a..f49ef56 100644
> --- a/hw/gpio/nrf51_gpio.c
> +++ b/hw/gpio/nrf51_gpio.c
> @@ -225,7 +225,7 @@ static void nrf51_gpio_write(void *opaque, hwaddr off=
set,
>  static const MemoryRegionOps gpio_ops =3D {
>      .read =3D  nrf51_gpio_read,
>      .write =3D nrf51_gpio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
>  };
> diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
> index e2785c5..7307717 100644
> --- a/hw/gpio/omap_gpio.c
> +++ b/hw/gpio/omap_gpio.c
> @@ -177,7 +177,7 @@ static void omap_gpio_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_gpio_ops =3D {
>      .read =3D omap_gpio_read,
>      .write =3D omap_gpio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_gpio_reset(struct omap_gpio_s *s)
> @@ -592,7 +592,7 @@ static const MemoryRegionOps omap2_gpio_module_ops =
=3D {
>      .write =3D omap2_gpio_module_writep,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_gpif_reset(DeviceState *dev)
> @@ -675,7 +675,7 @@ static void omap2_gpif_top_write(void *opaque, hwaddr=
 addr,
>  static const MemoryRegionOps omap2_gpif_top_ops =3D {
>      .read =3D omap2_gpif_top_read,
>      .write =3D omap2_gpif_top_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_gpio_init(Object *obj)
> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> index 02c01fd..c976233 100644
> --- a/hw/gpio/pl061.c
> +++ b/hw/gpio/pl061.c
> @@ -339,7 +339,7 @@ static void pl061_set_irq(void * opaque, int irq, int=
 level)
>  static const MemoryRegionOps pl061_ops =3D {
>      .read =3D pl061_read,
>      .write =3D pl061_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pl061_luminary_init(Object *obj)
> diff --git a/hw/gpio/puv3_gpio.c b/hw/gpio/puv3_gpio.c
> index 54d30ca..f1c5120 100644
> --- a/hw/gpio/puv3_gpio.c
> +++ b/hw/gpio/puv3_gpio.c
> @@ -98,7 +98,7 @@ static const MemoryRegionOps puv3_gpio_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void puv3_gpio_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
> index f2f1f67..d939004 100644
> --- a/hw/gpio/zaurus.c
> +++ b/hw/gpio/zaurus.c
> @@ -156,7 +156,7 @@ static void scoop_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps scoop_ops =3D {
>      .read =3D scoop_read,
>      .write =3D scoop_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void scoop_gpio_set(void *opaque, int line, int level)
> diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
> index e94614a..9369c36 100644
> --- a/hw/hppa/dino.c
> +++ b/hw/hppa/dino.c
> @@ -309,7 +309,7 @@ static MemTxResult dino_chip_write_with_attrs(void *o=
paque, hwaddr addr,
>  static const MemoryRegionOps dino_chip_ops =3D {
>      .read_with_attrs =3D dino_chip_read_with_attrs,
>      .write_with_attrs =3D dino_chip_write_with_attrs,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
> @@ -357,7 +357,7 @@ static void dino_config_data_write(void *opaque, hwad=
dr addr,
>  static const MemoryRegionOps dino_config_data_ops =3D {
>      .read =3D dino_config_data_read,
>      .write =3D dino_config_data_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t dino_config_addr_read(void *opaque, hwaddr addr, unsigne=
d len)
> @@ -378,7 +378,7 @@ static const MemoryRegionOps dino_config_addr_ops =3D=
 {
>      .write =3D dino_config_addr_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static AddressSpace *dino_pcihost_set_iommu(PCIBus *bus, void *opaque,
> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> index 662838d..974adaa 100644
> --- a/hw/hppa/machine.c
> +++ b/hw/hppa/machine.c
> @@ -113,7 +113,7 @@ static void machine_hppa_init(MachineState *machine)
>      if (serial_hd(0)) {
>          uint32_t addr =3D DINO_UART_HPA + 0x800;
>          serial_mm_init(addr_space, addr, 0, serial_irq,
> -                       115200, serial_hd(0), DEVICE_BIG_ENDIAN);
> +                       115200, serial_hd(0), MO_BE);
>      }
>=20
>      /* SCSI disk setup. */
> diff --git a/hw/hppa/pci.c b/hw/hppa/pci.c
> index b6606d9..4cf8094 100644
> --- a/hw/hppa/pci.c
> +++ b/hw/hppa/pci.c
> @@ -24,7 +24,7 @@ static void ignore_write(void *opaque, hwaddr addr, uin=
t64_t v, unsigned size)
>  const MemoryRegionOps hppa_pci_ignore_ops =3D {
>      .read =3D ignore_read,
>      .write =3D ignore_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 8,
> @@ -54,7 +54,7 @@ static void bw_conf1_write(void *opaque, hwaddr addr,
>  const MemoryRegionOps hppa_pci_conf1_ops =3D {
>      .read =3D bw_conf1_read,
>      .write =3D bw_conf1_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
> @@ -77,7 +77,7 @@ static void special_write(void *opaque, hwaddr addr,
>  const MemoryRegionOps hppa_pci_iack_ops =3D {
>      .read =3D iack_read,
>      .write =3D special_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/hyperv/hyperv_testdev.c b/hw/hyperv/hyperv_testdev.c
> index 0d343a8..823c790 100644
> --- a/hw/hyperv/hyperv_testdev.c
> +++ b/hw/hyperv/hyperv_testdev.c
> @@ -288,7 +288,7 @@ static const MemoryRegionOps synic_test_sint_ops =3D {
>      .write =3D hv_test_dev_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void hv_test_dev_realizefn(DeviceState *d, Error **errp)
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 219ad38..f8811c0 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -364,13 +364,13 @@ static void aspeed_i2c_ctrl_write(void *opaque, hwa=
ddr offset,
>  static const MemoryRegionOps aspeed_i2c_bus_ops =3D {
>      .read =3D aspeed_i2c_bus_read,
>      .write =3D aspeed_i2c_bus_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const MemoryRegionOps aspeed_i2c_ctrl_ops =3D {
>      .read =3D aspeed_i2c_ctrl_read,
>      .write =3D aspeed_i2c_ctrl_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const VMStateDescription aspeed_i2c_bus_vmstate =3D {
> diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
> index 70a97a3..0823e66 100644
> --- a/hw/i2c/exynos4210_i2c.c
> +++ b/hw/i2c/exynos4210_i2c.c
> @@ -264,7 +264,7 @@ static void exynos4210_i2c_write(void *opaque, hwaddr=
 offset,
>  static const MemoryRegionOps exynos4210_i2c_ops =3D {
>      .read =3D exynos4210_i2c_read,
>      .write =3D exynos4210_i2c_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription exynos4210_i2c_vmstate =3D {
> diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
> index ce7a94c..d9900cd 100644
> --- a/hw/i2c/imx_i2c.c
> +++ b/hw/i2c/imx_i2c.c
> @@ -276,7 +276,7 @@ static const MemoryRegionOps imx_i2c_ops =3D {
>      .write =3D imx_i2c_write,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 2,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription imx_i2c_vmstate =3D {
> diff --git a/hw/i2c/microbit_i2c.c b/hw/i2c/microbit_i2c.c
> index 214be07..e756b1c 100644
> --- a/hw/i2c/microbit_i2c.c
> +++ b/hw/i2c/microbit_i2c.c
> @@ -70,7 +70,7 @@ static void microbit_i2c_write(void *opaque, hwaddr add=
r, uint64_t data,
>  static const MemoryRegionOps microbit_i2c_ops =3D {
>      .read =3D microbit_i2c_read,
>      .write =3D microbit_i2c_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
>  };
> diff --git a/hw/i2c/mpc_i2c.c b/hw/i2c/mpc_i2c.c
> index e9a1127..63efec6 100644
> --- a/hw/i2c/mpc_i2c.c
> +++ b/hw/i2c/mpc_i2c.c
> @@ -304,7 +304,7 @@ static const MemoryRegionOps i2c_ops =3D {
>      .read =3D  mpc_i2c_read,
>      .write =3D  mpc_i2c_write,
>      .valid.max_access_size =3D 1,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription mpc_i2c_vmstate =3D {
> diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
> index d7ebeae..99a328a 100644
> --- a/hw/i2c/omap_i2c.c
> +++ b/hw/i2c/omap_i2c.c
> @@ -469,7 +469,7 @@ static const MemoryRegionOps omap_i2c_ops =3D {
>      .write =3D omap_i2c_writefn,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_i2c_init(Object *obj)
> diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
> index e48544f..87b35af 100644
> --- a/hw/i2c/pm_smbus.c
> +++ b/hw/i2c/pm_smbus.c
> @@ -451,7 +451,7 @@ static const MemoryRegionOps pm_smbus_ops =3D {
>      .write =3D smb_ioport_writeb,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 1,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  bool pm_smbus_vmstate_needed(void)
> diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
> index 462729d..1ab2381 100644
> --- a/hw/i2c/ppc4xx_i2c.c
> +++ b/hw/i2c/ppc4xx_i2c.c
> @@ -335,7 +335,7 @@ static const MemoryRegionOps ppc4xx_i2c_ops =3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 1,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void ppc4xx_i2c_init(Object *o)
> diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
> index 1ac2a6f..3738bdd 100644
> --- a/hw/i2c/versatile_i2c.c
> +++ b/hw/i2c/versatile_i2c.c
> @@ -77,7 +77,7 @@ static void versatile_i2c_write(void *opaque, hwaddr of=
fset,
>  static const MemoryRegionOps versatile_i2c_ops =3D {
>      .read =3D versatile_i2c_read,
>      .write =3D versatile_i2c_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void versatile_i2c_init(Object *obj)
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 4a4e2c7..0612296 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -1378,7 +1378,7 @@ static MemTxResult amdvi_mem_ir_read(void *opaque, =
hwaddr addr,
>  static const MemoryRegionOps amdvi_ir_ops =3D {
>      .read_with_attrs =3D amdvi_mem_ir_read,
>      .write_with_attrs =3D amdvi_mem_ir_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1452,7 +1452,7 @@ static AddressSpace *amdvi_host_dma_iommu(PCIBus *b=
us, void *opaque, int devfn)
>  static const MemoryRegionOps mmio_mem_ops =3D {
>      .read =3D amdvi_mmio_read,
>      .write =3D amdvi_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 8,
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index de86f53..e9dd1ab 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -2993,7 +2993,7 @@ static const VMStateDescription vtd_vmstate =3D {
>  static const MemoryRegionOps vtd_mem_ops =3D {
>      .read =3D vtd_mem_read,
>      .write =3D vtd_mem_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 8,
> @@ -3270,7 +3270,7 @@ static MemTxResult vtd_mem_ir_write(void *opaque, h=
waddr addr,
>  static const MemoryRegionOps vtd_mem_ir_ops =3D {
>      .read_with_attrs =3D vtd_mem_ir_read,
>      .write_with_attrs =3D vtd_mem_ir_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
> index 91fb622..e645447 100644
> --- a/hw/i386/kvm/apic.c
> +++ b/hw/i386/kvm/apic.c
> @@ -207,7 +207,7 @@ static void kvm_apic_mem_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps kvm_apic_io_ops =3D {
>      .read =3D kvm_apic_mem_read,
>      .write =3D kvm_apic_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void kvm_apic_reset(APICCommonState *s)
> diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
> index 9c2ab4a..9c65e41 100644
> --- a/hw/i386/kvmvapic.c
> +++ b/hw/i386/kvmvapic.c
> @@ -717,7 +717,7 @@ static uint64_t vapic_read(void *opaque, hwaddr addr,=
 unsigned size)
>  static const MemoryRegionOps vapic_ops =3D {
>      .write =3D vapic_write,
>      .read =3D vapic_read,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void vapic_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 549c437..c2507b5 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -813,7 +813,7 @@ static const MemoryRegionOps port92_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void port92_initfn(Object *obj)
> @@ -1985,7 +1985,7 @@ DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *p=
ci_bus)
>  static const MemoryRegionOps ioport80_io_ops =3D {
>      .write =3D ioport80_write,
>      .read =3D ioport80_read,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -1995,7 +1995,7 @@ static const MemoryRegionOps ioport80_io_ops =3D {
>  static const MemoryRegionOps ioportF0_io_ops =3D {
>      .write =3D ioportF0_write,
>      .read =3D ioportF0_read,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
> index 3bf8cfe..a30032d 100644
> --- a/hw/i386/vmport.c
> +++ b/hw/i386/vmport.c
> @@ -139,7 +139,7 @@ static const MemoryRegionOps vmport_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void vmport_realizefn(DeviceState *dev, Error **errp)
> diff --git a/hw/i386/xen/xen_apic.c b/hw/i386/xen/xen_apic.c
> index 7c7a60b..2a28057 100644
> --- a/hw/i386/xen/xen_apic.c
> +++ b/hw/i386/xen/xen_apic.c
> @@ -36,7 +36,7 @@ static void xen_apic_mem_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps xen_apic_io_ops =3D {
>      .read =3D xen_apic_mem_read,
>      .write =3D xen_apic_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void xen_apic_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 7a972e4..af56c59 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -329,7 +329,7 @@ static const MemoryRegionOps platform_fixed_io_ops =
=3D {
>          .max_access_size =3D 4,
>          .unaligned =3D true,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void platform_fixed_ioport_init(PCIXenPlatformState* s)
> @@ -427,7 +427,7 @@ static void platform_mmio_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps platform_mmio_handler =3D {
>      .read =3D &platform_mmio_read,
>      .write =3D &platform_mmio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void platform_mmio_setup(PCIXenPlatformState *d)
> diff --git a/hw/i386/xen/xen_pvdevice.c b/hw/i386/xen/xen_pvdevice.c
> index 23748f3..b65fdd2 100644
> --- a/hw/i386/xen/xen_pvdevice.c
> +++ b/hw/i386/xen/xen_pvdevice.c
> @@ -69,7 +69,7 @@ static void xen_pv_mmio_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps xen_pv_mmio_ops =3D {
>      .read =3D &xen_pv_mmio_read,
>      .write =3D &xen_pv_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const VMStateDescription vmstate_xen_pvdevice =3D {
> diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c
> index de08d87..714267c 100644
> --- a/hw/ide/ahci-allwinner.c
> +++ b/hw/ide/ahci-allwinner.c
> @@ -82,7 +82,7 @@ static const MemoryRegionOps allwinner_ahci_mem_ops =3D=
 {
>      .write =3D allwinner_ahci_mem_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void allwinner_ahci_init(Object *obj)
> diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> index 00ba422..871b75b 100644
> --- a/hw/ide/ahci.c
> +++ b/hw/ide/ahci.c
> @@ -521,7 +521,7 @@ static void ahci_mem_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps ahci_mem_ops =3D {
>      .read =3D ahci_mem_read,
>      .write =3D ahci_mem_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t ahci_idp_read(void *opaque, hwaddr addr,
> @@ -557,7 +557,7 @@ static void ahci_idp_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps ahci_idp_ops =3D {
>      .read =3D ahci_idp_read,
>      .write =3D ahci_idp_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>=20
> diff --git a/hw/ide/macio.c b/hw/ide/macio.c
> index 54571fe..b1dbe8d 100644
> --- a/hw/ide/macio.c
> +++ b/hw/ide/macio.c
> @@ -351,7 +351,7 @@ static const MemoryRegionOps pmac_ide_ops =3D {
>      .write =3D pmac_ide_write,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const VMStateDescription vmstate_pmac =3D {
> diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
> index 70a5801..88b71e6 100644
> --- a/hw/ide/mmio.c
> +++ b/hw/ide/mmio.c
> @@ -84,7 +84,7 @@ static void mmio_ide_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps mmio_ide_ops =3D {
>      .read =3D mmio_ide_read,
>      .write =3D mmio_ide_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t mmio_ide_status_read(void *opaque, hwaddr addr,
> @@ -104,7 +104,7 @@ static void mmio_ide_cmd_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps mmio_ide_cs_ops =3D {
>      .read =3D mmio_ide_status_read,
>      .write =3D mmio_ide_cmd_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const VMStateDescription vmstate_ide_mmio =3D {
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 4c6fb9a..7cb42f4 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -62,7 +62,7 @@ static void pci_ide_cmd_write(void *opaque, hwaddr addr,
>  const MemoryRegionOps pci_ide_cmd_le_ops =3D {
>      .read =3D pci_ide_cmd_read,
>      .write =3D pci_ide_cmd_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t pci_ide_data_read(void *opaque, hwaddr addr, unsigned si=
ze)
> @@ -100,7 +100,7 @@ static void pci_ide_data_write(void *opaque, hwaddr a=
ddr,
>  const MemoryRegionOps pci_ide_data_le_ops =3D {
>      .read =3D pci_ide_data_read,
>      .write =3D pci_ide_data_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void bmdma_start_dma(IDEDMA *dma, IDEState *s,
> @@ -338,7 +338,7 @@ static void bmdma_addr_write(void *opaque, hwaddr add=
r,
>  MemoryRegionOps bmdma_addr_ioport_ops =3D {
>      .read =3D bmdma_addr_read,
>      .write =3D bmdma_addr_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static bool ide_bmdma_current_needed(void *opaque)
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index d7590d4..30635e1 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -208,7 +208,7 @@ static void sii3112_reg_write(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps sii3112_reg_ops =3D {
>      .read =3D sii3112_reg_read,
>      .write =3D sii3112_reg_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  /* the PCI irq level is the logical OR of the two channels */
> diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb.c
> index f779cd4..f4e38f7 100644
> --- a/hw/input/milkymist-softusb.c
> +++ b/hw/input/milkymist-softusb.c
> @@ -127,7 +127,7 @@ softusb_write(void *opaque, hwaddr addr, uint64_t val=
ue,
>  static const MemoryRegionOps softusb_mmio_ops =3D {
>      .read =3D softusb_read,
>      .write =3D softusb_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index 47a606f..dd78587 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -456,7 +456,7 @@ static const MemoryRegionOps i8042_mmio_ops =3D {
>      .write =3D kbd_mm_writefn,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
> @@ -518,7 +518,7 @@ static const MemoryRegionOps i8042_data_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const MemoryRegionOps i8042_cmd_ops =3D {
> @@ -528,7 +528,7 @@ static const MemoryRegionOps i8042_cmd_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void i8042_initfn(Object *obj)
> diff --git a/hw/input/pl050.c b/hw/input/pl050.c
> index b79bf16..a9565ea 100644
> --- a/hw/input/pl050.c
> +++ b/hw/input/pl050.c
> @@ -137,7 +137,7 @@ static void pl050_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps pl050_ops =3D {
>      .read =3D pl050_read,
>      .write =3D pl050_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pl050_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/input/pxa2xx_keypad.c b/hw/input/pxa2xx_keypad.c
> index 93db9ed..c68f229 100644
> --- a/hw/input/pxa2xx_keypad.c
> +++ b/hw/input/pxa2xx_keypad.c
> @@ -285,7 +285,7 @@ static void pxa2xx_keypad_write(void *opaque, hwaddr =
offset,
>  static const MemoryRegionOps pxa2xx_keypad_ops =3D {
>      .read =3D pxa2xx_keypad_read,
>      .write =3D pxa2xx_keypad_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_pxa2xx_keypad =3D {
> diff --git a/hw/intc/allwinner-a10-pic.c b/hw/intc/allwinner-a10-pic.c
> index 080bdd7..bb406e8 100644
> --- a/hw/intc/allwinner-a10-pic.c
> +++ b/hw/intc/allwinner-a10-pic.c
> @@ -137,7 +137,7 @@ static void aw_a10_pic_write(void *opaque, hwaddr off=
set, uint64_t value,
>  static const MemoryRegionOps aw_a10_pic_ops =3D {
>      .read =3D aw_a10_pic_read,
>      .write =3D aw_a10_pic_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_aw_a10_pic =3D {
> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> index bce8991..6379c66 100644
> --- a/hw/intc/apic.c
> +++ b/hw/intc/apic.c
> @@ -878,7 +878,7 @@ static const MemoryRegionOps apic_io_ops =3D {
>      .impl.max_access_size =3D 4,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void apic_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 77427a4..4d21836 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -1999,38 +1999,38 @@ static const MemoryRegionOps gic_ops[2] =3D {
>      {
>          .read_with_attrs =3D gic_dist_read,
>          .write_with_attrs =3D gic_dist_write,
> -        .endianness =3D DEVICE_NATIVE_ENDIAN,
> +        .endianness =3D MO_TE,
>      },
>      {
>          .read_with_attrs =3D gic_thiscpu_read,
>          .write_with_attrs =3D gic_thiscpu_write,
> -        .endianness =3D DEVICE_NATIVE_ENDIAN,
> +        .endianness =3D MO_TE,
>      }
>  };
>=20
>  static const MemoryRegionOps gic_cpu_ops =3D {
>      .read_with_attrs =3D gic_do_cpu_read,
>      .write_with_attrs =3D gic_do_cpu_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const MemoryRegionOps gic_virt_ops[2] =3D {
>      {
>          .read_with_attrs =3D gic_thiscpu_hyp_read,
>          .write_with_attrs =3D gic_thiscpu_hyp_write,
> -        .endianness =3D DEVICE_NATIVE_ENDIAN,
> +        .endianness =3D MO_TE,
>      },
>      {
>          .read_with_attrs =3D gic_thisvcpu_read,
>          .write_with_attrs =3D gic_thisvcpu_write,
> -        .endianness =3D DEVICE_NATIVE_ENDIAN,
> +        .endianness =3D MO_TE,
>      }
>  };
>=20
>  static const MemoryRegionOps gic_viface_ops =3D {
>      .read_with_attrs =3D gic_do_hyp_read,
>      .write_with_attrs =3D gic_do_hyp_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void arm_gic_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/intc/arm_gicv2m.c b/hw/intc/arm_gicv2m.c
> index 05f299f..5906828 100644
> --- a/hw/intc/arm_gicv2m.c
> +++ b/hw/intc/arm_gicv2m.c
> @@ -126,7 +126,7 @@ static void gicv2m_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps gicv2m_ops =3D {
>      .read =3D gicv2m_read,
>      .write =3D gicv2m_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void gicv2m_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index 66eaa97..e869f16 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -352,12 +352,12 @@ static const MemoryRegionOps gic_ops[] =3D {
>      {
>          .read_with_attrs =3D gicv3_dist_read,
>          .write_with_attrs =3D gicv3_dist_write,
> -        .endianness =3D DEVICE_NATIVE_ENDIAN,
> +        .endianness =3D MO_TE,
>      },
>      {
>          .read_with_attrs =3D gicv3_redist_read,
>          .write_with_attrs =3D gicv3_redist_write,
> -        .endianness =3D DEVICE_NATIVE_ENDIAN,
> +        .endianness =3D MO_TE,
>      }
>  };
>=20
> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_commo=
n.c
> index efb3d51..fcbbe6d 100644
> --- a/hw/intc/arm_gicv3_its_common.c
> +++ b/hw/intc/arm_gicv3_its_common.c
> @@ -95,7 +95,7 @@ static MemTxResult gicv3_its_trans_write(void *opaque, =
hwaddr offset,
>  static const MemoryRegionOps gicv3_its_trans_ops =3D {
>      .read_with_attrs =3D gicv3_its_trans_read,
>      .write_with_attrs =3D gicv3_its_trans_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops)
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 237ccef..975d7cc 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2334,7 +2334,7 @@ static MemTxResult nvic_sysreg_write(void *opaque, =
hwaddr addr,
>  static const MemoryRegionOps nvic_sysreg_ops =3D {
>      .read_with_attrs =3D nvic_sysreg_read,
>      .write_with_attrs =3D nvic_sysreg_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static MemTxResult nvic_sysreg_ns_write(void *opaque, hwaddr addr,
> @@ -2381,7 +2381,7 @@ static MemTxResult nvic_sysreg_ns_read(void *opaque=
, hwaddr addr,
>  static const MemoryRegionOps nvic_sysreg_ns_ops =3D {
>      .read_with_attrs =3D nvic_sysreg_ns_read,
>      .write_with_attrs =3D nvic_sysreg_ns_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static MemTxResult nvic_systick_write(void *opaque, hwaddr addr,
> @@ -2412,7 +2412,7 @@ static MemTxResult nvic_systick_read(void *opaque, =
hwaddr addr,
>  static const MemoryRegionOps nvic_systick_ops =3D {
>      .read_with_attrs =3D nvic_systick_read,
>      .write_with_attrs =3D nvic_systick_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static int nvic_post_load(void *opaque, int version_id)
> diff --git a/hw/intc/aspeed_vic.c b/hw/intc/aspeed_vic.c
> index 266a309..2556b54 100644
> --- a/hw/intc/aspeed_vic.c
> +++ b/hw/intc/aspeed_vic.c
> @@ -283,7 +283,7 @@ static void aspeed_vic_write(void *opaque, hwaddr off=
set, uint64_t data,
>  static const MemoryRegionOps aspeed_vic_ops =3D {
>      .read =3D aspeed_vic_read,
>      .write =3D aspeed_vic_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>      .valid.unaligned =3D false,
> diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c
> index 61d3764..918f46b 100644
> --- a/hw/intc/bcm2835_ic.c
> +++ b/hw/intc/bcm2835_ic.c
> @@ -168,7 +168,7 @@ static void bcm2835_ic_write(void *opaque, hwaddr off=
set, uint64_t val,
>  static const MemoryRegionOps bcm2835_ic_ops =3D {
>      .read =3D bcm2835_ic_read,
>      .write =3D bcm2835_ic_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>  };
> diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
> index 66417c8..14774a7 100644
> --- a/hw/intc/bcm2836_control.c
> +++ b/hw/intc/bcm2836_control.c
> @@ -302,7 +302,7 @@ static void bcm2836_control_write(void *opaque, hwadd=
r offset,
>  static const MemoryRegionOps bcm2836_control_ops =3D {
>      .read =3D bcm2836_control_read,
>      .write =3D bcm2836_control_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>  };
> diff --git a/hw/intc/etraxfs_pic.c b/hw/intc/etraxfs_pic.c
> index 20e1391..9afe1e1 100644
> --- a/hw/intc/etraxfs_pic.c
> +++ b/hw/intc/etraxfs_pic.c
> @@ -111,7 +111,7 @@ static void pic_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps pic_ops =3D {
>      .read =3D pic_read,
>      .write =3D pic_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
> index 6fed0e8..3e7294b 100644
> --- a/hw/intc/exynos4210_combiner.c
> +++ b/hw/intc/exynos4210_combiner.c
> @@ -401,7 +401,7 @@ static void exynos4210_combiner_reset(DeviceState *d)
>  static const MemoryRegionOps exynos4210_combiner_ops =3D {
>      .read =3D exynos4210_combiner_read,
>      .write =3D exynos4210_combiner_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  /*
> diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
> index 21c77a5..3d6002b 100644
> --- a/hw/intc/grlib_irqmp.c
> +++ b/hw/intc/grlib_irqmp.c
> @@ -313,7 +313,7 @@ static void grlib_irqmp_write(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps grlib_irqmp_ops =3D {
>      .read =3D grlib_irqmp_read,
>      .write =3D grlib_irqmp_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/intc/heathrow_pic.c b/hw/intc/heathrow_pic.c
> index c282ac4..083be15 100644
> --- a/hw/intc/heathrow_pic.c
> +++ b/hw/intc/heathrow_pic.c
> @@ -109,7 +109,7 @@ static uint64_t heathrow_read(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps heathrow_ops =3D {
>      .read =3D heathrow_read,
>      .write =3D heathrow_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void heathrow_set_irq(void *opaque, int num, int level)
> diff --git a/hw/intc/imx_avic.c b/hw/intc/imx_avic.c
> index 83a4101..0ad9f54 100644
> --- a/hw/intc/imx_avic.c
> +++ b/hw/intc/imx_avic.c
> @@ -308,7 +308,7 @@ static void imx_avic_write(void *opaque, hwaddr offse=
t,
>  static const MemoryRegionOps imx_avic_ops =3D {
>      .read =3D imx_avic_read,
>      .write =3D imx_avic_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void imx_avic_reset(DeviceState *dev)
> diff --git a/hw/intc/imx_gpcv2.c b/hw/intc/imx_gpcv2.c
> index a83333b..e54b353 100644
> --- a/hw/intc/imx_gpcv2.c
> +++ b/hw/intc/imx_gpcv2.c
> @@ -64,7 +64,7 @@ static void imx_gpcv2_write(void *opaque, hwaddr offset,
>  static const struct MemoryRegionOps imx_gpcv2_ops =3D {
>      .read =3D imx_gpcv2_read,
>      .write =3D imx_gpcv2_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
> index e99c37c..1603f4d 100644
> --- a/hw/intc/ioapic.c
> +++ b/hw/intc/ioapic.c
> @@ -403,7 +403,7 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t =
val,
>  static const MemoryRegionOps ioapic_io_ops =3D {
>      .read =3D ioapic_mem_read,
>      .write =3D ioapic_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void ioapic_machine_done_notify(Notifier *notifier, void *data)
> diff --git a/hw/intc/mips_gic.c b/hw/intc/mips_gic.c
> index 33ab51c..9d93664 100644
> --- a/hw/intc/mips_gic.c
> +++ b/hw/intc/mips_gic.c
> @@ -385,7 +385,7 @@ static void gic_reset(void *opaque)
>  static const MemoryRegionOps gic_ops =3D {
>      .read =3D gic_read,
>      .write =3D gic_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .max_access_size =3D 8,
>      },
> diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
> index 053e67c..07aa4df 100644
> --- a/hw/intc/omap_intc.c
> +++ b/hw/intc/omap_intc.c
> @@ -330,7 +330,7 @@ static void omap_inth_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_inth_mem_ops =3D {
>      .read =3D omap_inth_read,
>      .write =3D omap_inth_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -606,7 +606,7 @@ static void omap2_inth_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps omap2_inth_mem_ops =3D {
>      .read =3D omap2_inth_read,
>      .write =3D omap2_inth_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/intc/ompic.c b/hw/intc/ompic.c
> index 9cb310a..32c37ce 100644
> --- a/hw/intc/ompic.c
> +++ b/hw/intc/ompic.c
> @@ -95,7 +95,7 @@ static void ompic_write(void *opaque, hwaddr addr, uint=
64_t data, unsigned size)
>  static const MemoryRegionOps ompic_ops =3D {
>      .read =3D ompic_read,
>      .write =3D ompic_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .max_access_size =3D 8,
>      },
> diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
> index 9b4fc6c..b573202 100644
> --- a/hw/intc/openpic.c
> +++ b/hw/intc/openpic.c
> @@ -1148,7 +1148,7 @@ static uint64_t openpic_cpu_read(void *opaque, hwad=
dr addr, unsigned len)
>  static const MemoryRegionOps openpic_glb_ops_le =3D {
>      .write =3D openpic_gbl_write,
>      .read  =3D openpic_gbl_read,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1158,7 +1158,7 @@ static const MemoryRegionOps openpic_glb_ops_le =3D=
 {
>  static const MemoryRegionOps openpic_glb_ops_be =3D {
>      .write =3D openpic_gbl_write,
>      .read  =3D openpic_gbl_read,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1168,7 +1168,7 @@ static const MemoryRegionOps openpic_glb_ops_be =3D=
 {
>  static const MemoryRegionOps openpic_tmr_ops_le =3D {
>      .write =3D openpic_tmr_write,
>      .read  =3D openpic_tmr_read,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1178,7 +1178,7 @@ static const MemoryRegionOps openpic_tmr_ops_le =3D=
 {
>  static const MemoryRegionOps openpic_tmr_ops_be =3D {
>      .write =3D openpic_tmr_write,
>      .read  =3D openpic_tmr_read,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1188,7 +1188,7 @@ static const MemoryRegionOps openpic_tmr_ops_be =3D=
 {
>  static const MemoryRegionOps openpic_cpu_ops_le =3D {
>      .write =3D openpic_cpu_write,
>      .read  =3D openpic_cpu_read,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1198,7 +1198,7 @@ static const MemoryRegionOps openpic_cpu_ops_le =3D=
 {
>  static const MemoryRegionOps openpic_cpu_ops_be =3D {
>      .write =3D openpic_cpu_write,
>      .read  =3D openpic_cpu_read,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1208,7 +1208,7 @@ static const MemoryRegionOps openpic_cpu_ops_be =3D=
 {
>  static const MemoryRegionOps openpic_src_ops_le =3D {
>      .write =3D openpic_src_write,
>      .read  =3D openpic_src_read,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1218,7 +1218,7 @@ static const MemoryRegionOps openpic_src_ops_le =3D=
 {
>  static const MemoryRegionOps openpic_src_ops_be =3D {
>      .write =3D openpic_src_write,
>      .read  =3D openpic_src_read,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1228,7 +1228,7 @@ static const MemoryRegionOps openpic_src_ops_be =3D=
 {
>  static const MemoryRegionOps openpic_msi_ops_be =3D {
>      .read =3D openpic_msi_read,
>      .write =3D openpic_msi_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1238,7 +1238,7 @@ static const MemoryRegionOps openpic_msi_ops_be =3D=
 {
>  static const MemoryRegionOps openpic_summary_ops_be =3D {
>      .read =3D openpic_summary_read,
>      .write =3D openpic_summary_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
> index 49fc6fa..4581121 100644
> --- a/hw/intc/openpic_kvm.c
> +++ b/hw/intc/openpic_kvm.c
> @@ -109,7 +109,7 @@ static uint64_t kvm_openpic_read(void *opaque, hwaddr=
 addr, unsigned size)
>  static const MemoryRegionOps kvm_openpic_mem_ops =3D {
>      .write =3D kvm_openpic_write,
>      .read  =3D kvm_openpic_read,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/intc/pl190.c b/hw/intc/pl190.c
> index b4f31ef..2dbe29d 100644
> --- a/hw/intc/pl190.c
> +++ b/hw/intc/pl190.c
> @@ -220,7 +220,7 @@ static void pl190_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps pl190_ops =3D {
>      .read =3D pl190_read,
>      .write =3D pl190_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pl190_reset(DeviceState *d)
> diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
> index 4dc92ef..edea170 100644
> --- a/hw/intc/pnv_xive.c
> +++ b/hw/intc/pnv_xive.c
> @@ -1186,7 +1186,7 @@ static uint64_t pnv_xive_ic_reg_read(void *opaque, =
hwaddr offset, unsigned size)
>  static const MemoryRegionOps pnv_xive_ic_reg_ops =3D {
>      .read =3D pnv_xive_ic_reg_read,
>      .write =3D pnv_xive_ic_reg_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> @@ -1285,7 +1285,7 @@ static uint64_t pnv_xive_ic_notify_read(void *opaqu=
e, hwaddr addr,
>  static const MemoryRegionOps pnv_xive_ic_notify_ops =3D {
>      .read =3D pnv_xive_ic_notify_read,
>      .write =3D pnv_xive_ic_notify_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> @@ -1319,7 +1319,7 @@ static uint64_t pnv_xive_ic_lsi_read(void *opaque, =
hwaddr addr, unsigned size)
>  static const MemoryRegionOps pnv_xive_ic_lsi_ops =3D {
>      .read =3D pnv_xive_ic_lsi_read,
>      .write =3D pnv_xive_ic_lsi_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> @@ -1384,7 +1384,7 @@ static uint64_t xive_tm_indirect_read(void *opaque,=
 hwaddr offset,
>  static const MemoryRegionOps xive_tm_indirect_ops =3D {
>      .read =3D xive_tm_indirect_read,
>      .write =3D xive_tm_indirect_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 8,
> @@ -1418,7 +1418,7 @@ static void pnv_xive_xscom_write(void *opaque, hwad=
dr addr,
>  static const MemoryRegionOps pnv_xive_xscom_ops =3D {
>      .read =3D pnv_xive_xscom_read,
>      .write =3D pnv_xive_xscom_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> @@ -1514,7 +1514,7 @@ static void pnv_xive_vc_write(void *opaque, hwaddr =
offset,
>  static const MemoryRegionOps pnv_xive_vc_ops =3D {
>      .read =3D pnv_xive_vc_read,
>      .write =3D pnv_xive_vc_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> @@ -1549,7 +1549,7 @@ static void pnv_xive_pc_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps pnv_xive_pc_ops =3D {
>      .read =3D pnv_xive_pc_read,
>      .write =3D pnv_xive_pc_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> diff --git a/hw/intc/puv3_intc.c b/hw/intc/puv3_intc.c
> index e2f6d98..670899a 100644
> --- a/hw/intc/puv3_intc.c
> +++ b/hw/intc/puv3_intc.c
> @@ -100,7 +100,7 @@ static const MemoryRegionOps puv3_intc_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void puv3_intc_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
> index bac7886..3bf8868 100644
> --- a/hw/intc/sh_intc.c
> +++ b/hw/intc/sh_intc.c
> @@ -289,7 +289,7 @@ static void sh_intc_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps sh_intc_ops =3D {
>      .read =3D sh_intc_read,
>      .write =3D sh_intc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  struct intc_source *sh_intc_source(struct intc_desc *desc, intc_enum id)
> diff --git a/hw/intc/slavio_intctl.c b/hw/intc/slavio_intctl.c
> index ca52875..5a09e8b 100644
> --- a/hw/intc/slavio_intctl.c
> +++ b/hw/intc/slavio_intctl.c
> @@ -134,7 +134,7 @@ static void slavio_intctl_mem_writel(void *opaque, hw=
addr addr,
>  static const MemoryRegionOps slavio_intctl_mem_ops =3D {
>      .read =3D slavio_intctl_mem_readl,
>      .write =3D slavio_intctl_mem_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -204,7 +204,7 @@ static void slavio_intctlm_mem_writel(void *opaque, h=
waddr addr,
>  static const MemoryRegionOps slavio_intctlm_mem_ops =3D {
>      .read =3D slavio_intctlm_mem_readl,
>      .write =3D slavio_intctlm_mem_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/intc/xics_pnv.c b/hw/intc/xics_pnv.c
> index 67f2702..7acd6ec 100644
> --- a/hw/intc/xics_pnv.c
> +++ b/hw/intc/xics_pnv.c
> @@ -149,7 +149,7 @@ bad_access:
>  static const MemoryRegionOps pnv_icp_ops =3D {
>      .read =3D pnv_icp_read,
>      .write =3D pnv_icp_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
> diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
> index d5363e9..61034d9 100644
> --- a/hw/intc/xilinx_intc.c
> +++ b/hw/intc/xilinx_intc.c
> @@ -142,7 +142,7 @@ pic_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps pic_ops =3D {
>      .read =3D pic_read,
>      .write =3D pic_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index cf77bdb..e2a0802 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -479,7 +479,7 @@ static uint64_t xive_tm_read(void *opaque, hwaddr off=
set, unsigned size)
>  const MemoryRegionOps xive_tm_ops =3D {
>      .read =3D xive_tm_read,
>      .write =3D xive_tm_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 8,
> @@ -950,7 +950,7 @@ out:
>  static const MemoryRegionOps xive_source_esb_ops =3D {
>      .read =3D xive_source_esb_read,
>      .write =3D xive_source_esb_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> @@ -1645,7 +1645,7 @@ static void xive_end_source_write(void *opaque, hwa=
ddr addr,
>  static const MemoryRegionOps xive_end_source_ops =3D {
>      .read =3D xive_end_source_read,
>      .write =3D xive_end_source_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> diff --git a/hw/intc/xlnx-pmu-iomod-intc.c b/hw/intc/xlnx-pmu-iomod-intc.c
> index 0b8ff89..c4bab81 100644
> --- a/hw/intc/xlnx-pmu-iomod-intc.c
> +++ b/hw/intc/xlnx-pmu-iomod-intc.c
> @@ -464,7 +464,7 @@ static void xlnx_pmu_io_intc_reset(DeviceState *dev)
>  static const MemoryRegionOps xlnx_pmu_io_intc_ops =3D {
>      .read =3D register_read_memory,
>      .write =3D register_write_memory,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/intc/xlnx-zynqmp-ipi.c b/hw/intc/xlnx-zynqmp-ipi.c
> index 0dad6c0..7ac94bb 100644
> --- a/hw/intc/xlnx-zynqmp-ipi.c
> +++ b/hw/intc/xlnx-zynqmp-ipi.c
> @@ -295,7 +295,7 @@ static void xlnx_zynqmp_obs_handler(void *opaque, int=
 n, int level)
>  static const MemoryRegionOps xlnx_zynqmp_ipi_ops =3D {
>      .read =3D register_read_memory,
>      .write =3D register_write_memory,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
> index d4d8510..8bf866c 100644
> --- a/hw/ipack/tpci200.c
> +++ b/hw/ipack/tpci200.c
> @@ -524,7 +524,7 @@ static void tpci200_write_las3(void *opaque, hwaddr a=
ddr, uint64_t val,
>  static const MemoryRegionOps tpci200_cfg_ops =3D {
>      .read =3D tpci200_read_cfg,
>      .write =3D tpci200_write_cfg,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D  {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4
> @@ -538,7 +538,7 @@ static const MemoryRegionOps tpci200_cfg_ops =3D {
>  static const MemoryRegionOps tpci200_las0_ops =3D {
>      .read =3D tpci200_read_las0,
>      .write =3D tpci200_write_las0,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D  {
>          .min_access_size =3D 2,
>          .max_access_size =3D 2
> @@ -548,7 +548,7 @@ static const MemoryRegionOps tpci200_las0_ops =3D {
>  static const MemoryRegionOps tpci200_las1_ops =3D {
>      .read =3D tpci200_read_las1,
>      .write =3D tpci200_write_las1,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D  {
>          .min_access_size =3D 1,
>          .max_access_size =3D 2
> @@ -558,7 +558,7 @@ static const MemoryRegionOps tpci200_las1_ops =3D {
>  static const MemoryRegionOps tpci200_las2_ops =3D {
>      .read =3D tpci200_read_las2,
>      .write =3D tpci200_write_las2,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D  {
>          .min_access_size =3D 1,
>          .max_access_size =3D 2
> @@ -568,7 +568,7 @@ static const MemoryRegionOps tpci200_las2_ops =3D {
>  static const MemoryRegionOps tpci200_las3_ops =3D {
>      .read =3D tpci200_read_las3,
>      .write =3D tpci200_write_las3,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D  {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1
> diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
> index 1846d5b..4fefbcf 100644
> --- a/hw/ipmi/isa_ipmi_bt.c
> +++ b/hw/ipmi/isa_ipmi_bt.c
> @@ -320,7 +320,7 @@ static const MemoryRegionOps ipmi_bt_io_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void ipmi_bt_set_atn(IPMIInterface *ii, int val, int irq)
> diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
> index 068f341..2671fdc 100644
> --- a/hw/ipmi/isa_ipmi_kcs.c
> +++ b/hw/ipmi/isa_ipmi_kcs.c
> @@ -313,7 +313,7 @@ const MemoryRegionOps ipmi_kcs_io_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void ipmi_kcs_set_atn(IPMIInterface *ii, int val, int irq)
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index a7081bd..1a9e66e 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -569,7 +569,7 @@ static void ich9_lpc_reset(DeviceState *qdev)
>  static const MemoryRegionOps rcrb_mmio_ops =3D {
>      .read =3D ich9_cc_read,
>      .write =3D ich9_cc_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void ich9_lpc_machine_ready(Notifier *n, void *opaque)
> @@ -620,7 +620,7 @@ static uint64_t ich9_rst_cnt_read(void *opaque, hwadd=
r addr, unsigned len)
>  static const MemoryRegionOps ich9_rst_cnt_ops =3D {
>      .read =3D ich9_rst_cnt_read,
>      .write =3D ich9_rst_cnt_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN
> +    .endianness =3D MO_LE
>  };
>=20
>  static void ich9_lpc_get_sci_int(Object *obj, Visitor *v, const char *na=
me,
> diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
> index 85dbc94..8718b2d 100644
> --- a/hw/isa/pc87312.c
> +++ b/hw/isa/pc87312.c
> @@ -265,7 +265,7 @@ static uint64_t pc87312_io_read(void *opaque, hwaddr =
addr, unsigned int size)
>  static const MemoryRegionOps pc87312_io_ops =3D {
>      .read  =3D pc87312_io_read,
>      .write =3D pc87312_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 12c460590..4281928 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -108,7 +108,7 @@ static uint64_t superio_ioport_readb(void *opaque, hw=
addr addr, unsigned size)
>  static const MemoryRegionOps superio_ops =3D {
>      .read =3D superio_ioport_readb,
>      .write =3D superio_ioport_writeb,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
> index 1c17f83..1b7712e 100644
> --- a/hw/m68k/mcf5206.c
> +++ b/hw/m68k/mcf5206.c
> @@ -548,7 +548,7 @@ static const MemoryRegionOps m5206_mbar_ops =3D {
>      .write =3D m5206_mbar_writefn,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  qemu_irq *mcf5206_init(MemoryRegion *sysmem, uint32_t base, M68kCPU *cpu)
> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
> index 6f6efae..7fdeb16 100644
> --- a/hw/m68k/mcf5208.c
> +++ b/hw/m68k/mcf5208.c
> @@ -138,7 +138,7 @@ static uint64_t m5208_timer_read(void *opaque, hwaddr=
 addr,
>  static const MemoryRegionOps m5208_timer_ops =3D {
>      .read =3D m5208_timer_read,
>      .write =3D m5208_timer_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static uint64_t m5208_sys_read(void *opaque, hwaddr addr,
> @@ -172,7 +172,7 @@ static void m5208_sys_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps m5208_sys_ops =3D {
>      .read =3D m5208_sys_read,
>      .write =3D m5208_sys_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
> diff --git a/hw/m68k/mcf_intc.c b/hw/m68k/mcf_intc.c
> index a613aed..c38a347 100644
> --- a/hw/m68k/mcf_intc.c
> +++ b/hw/m68k/mcf_intc.c
> @@ -159,7 +159,7 @@ static void mcf_intc_reset(DeviceState *dev)
>  static const MemoryRegionOps mcf_intc_ops =3D {
>      .read =3D mcf_intc_read,
>      .write =3D mcf_intc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void mcf_intc_instance_init(Object *obj)
> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogi=
x_ml605_mmu.c
> index a88bf16..857c659 100644
> --- a/hw/microblaze/petalogix_ml605_mmu.c
> +++ b/hw/microblaze/petalogix_ml605_mmu.c
> @@ -122,7 +122,7 @@ petalogix_ml605_init(MachineState *machine)
>=20
>      serial_mm_init(address_space_mem, UART16550_BASEADDR + 0x1000, 2,
>                     irq[UART16550_IRQ], 115200, serial_hd(0),
> -                   DEVICE_LITTLE_ENDIAN);
> +                   MO_LE);
>=20
>      /* 2 timers at irq 2 @ 100 Mhz.  */
>      dev =3D qdev_create(NULL, "xlnx.xps-timer");
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index 9eeccbe..89babaa 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -165,7 +165,7 @@ static void boston_lcd_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps boston_lcd_ops =3D {
>      .read =3D boston_lcd_read,
>      .write =3D boston_lcd_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static uint64_t boston_platreg_read(void *opaque, hwaddr addr,
> @@ -244,7 +244,7 @@ static void boston_platreg_write(void *opaque, hwaddr=
 addr,
>  static const MemoryRegionOps boston_platreg_ops =3D {
>      .read =3D boston_platreg_read,
>      .write =3D boston_platreg_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const TypeInfo boston_device =3D {
> @@ -504,7 +504,7 @@ static void boston_mach_init(MachineState *machine)
>=20
>      s->uart =3D serial_mm_init(sys_mem, 0x17ffe000, 2,
>                               get_cps_irq(&s->cps, 3), 10000000,
> -                             serial_hd(0), DEVICE_NATIVE_ENDIAN);
> +                             serial_hd(0), MO_TE);
>=20
>      lcd =3D g_new(MemoryRegion, 1);
>      memory_region_init_io(lcd, NULL, &boston_lcd_ops, s, "boston-lcd", 0=
x8);
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index 2fa313f..7ed4d5c 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -972,7 +972,7 @@ static uint64_t gt64120_readl(void *opaque,
>  static const MemoryRegionOps isd_mem_ops =3D {
>      .read =3D gt64120_readl,
>      .write =3D gt64120_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
> diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
> index fa8775d..397c96e 100644
> --- a/hw/mips/mips_jazz.c
> +++ b/hw/mips/mips_jazz.c
> @@ -84,7 +84,7 @@ static void rtc_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps rtc_ops =3D {
>      .read =3D rtc_read,
>      .write =3D rtc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static uint64_t dma_dummy_read(void *opaque, hwaddr addr,
> @@ -105,7 +105,7 @@ static void dma_dummy_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps dma_dummy_ops =3D {
>      .read =3D dma_dummy_read,
>      .write =3D dma_dummy_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  #define MAGNUM_BIOS_SIZE_MAX 0x7e000
> @@ -320,12 +320,12 @@ static void mips_jazz_init(MachineState *machine,
>      if (serial_hd(0)) {
>          serial_mm_init(address_space, 0x80006000, 0,
>                         qdev_get_gpio_in(rc4030, 8), 8000000/16,
> -                       serial_hd(0), DEVICE_NATIVE_ENDIAN);
> +                       serial_hd(0), MO_TE);
>      }
>      if (serial_hd(1)) {
>          serial_mm_init(address_space, 0x80007000, 0,
>                         qdev_get_gpio_in(rc4030, 9), 8000000/16,
> -                       serial_hd(1), DEVICE_NATIVE_ENDIAN);
> +                       serial_hd(1), MO_TE);
>      }
>=20
>      /* Parallel port */
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 20e019b..efb6690 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -511,7 +511,7 @@ static void malta_fpga_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps malta_fpga_ops =3D {
>      .read =3D malta_fpga_read,
>      .write =3D malta_fpga_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void malta_fpga_reset(void *opaque)
> @@ -572,7 +572,7 @@ static MaltaFPGAState *malta_fpga_init(MemoryRegion *=
address_space,
>                               malta_fgpa_display_event, NULL, s, NULL, tr=
ue);
>=20
>      s->uart =3D serial_mm_init(address_space, base + 0x900, 3, uart_irq,
> -                             230400, uart_chr, DEVICE_NATIVE_ENDIAN);
> +                             230400, uart_chr, MO_TE);
>=20
>      malta_fpga_reset(s);
>      qemu_register_reset(malta_fpga_reset, s);
> diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
> index 93dbf76..a013ac7 100644
> --- a/hw/mips/mips_r4k.c
> +++ b/hw/mips/mips_r4k.c
> @@ -70,7 +70,7 @@ static uint64_t mips_qemu_read (void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps mips_qemu_ops =3D {
>      .read =3D mips_qemu_read,
>      .write =3D mips_qemu_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  typedef struct ResetData {
> diff --git a/hw/misc/a9scu.c b/hw/misc/a9scu.c
> index 4307f00..a750f0a 100644
> --- a/hw/misc/a9scu.c
> +++ b/hw/misc/a9scu.c
> @@ -94,7 +94,7 @@ static void a9_scu_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps a9_scu_ops =3D {
>      .read =3D a9_scu_read,
>      .write =3D a9_scu_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void a9_scu_reset(DeviceState *dev)
> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> index 2d7eb3c..a577b9e 100644
> --- a/hw/misc/applesmc.c
> +++ b/hw/misc/applesmc.c
> @@ -285,7 +285,7 @@ static void qdev_applesmc_isa_reset(DeviceState *dev)
>  static const MemoryRegionOps applesmc_data_io_ops =3D {
>      .write =3D applesmc_io_data_write,
>      .read =3D applesmc_io_data_read,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -295,7 +295,7 @@ static const MemoryRegionOps applesmc_data_io_ops =3D=
 {
>  static const MemoryRegionOps applesmc_cmd_io_ops =3D {
>      .write =3D applesmc_io_cmd_write,
>      .read =3D applesmc_io_cmd_read,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -305,7 +305,7 @@ static const MemoryRegionOps applesmc_cmd_io_ops =3D {
>  static const MemoryRegionOps applesmc_err_io_ops =3D {
>      .write =3D applesmc_io_err_write,
>      .read =3D applesmc_io_err_read,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/misc/arm11scu.c b/hw/misc/arm11scu.c
> index 84275df..cc7b21e 100644
> --- a/hw/misc/arm11scu.c
> +++ b/hw/misc/arm11scu.c
> @@ -57,7 +57,7 @@ static void mpcore_scu_write(void *opaque, hwaddr offse=
t,
>  static const MemoryRegionOps mpcore_scu_ops =3D {
>      .read =3D mpcore_scu_read,
>      .write =3D mpcore_scu_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void arm11_scu_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/misc/arm_integrator_debug.c b/hw/misc/arm_integrator_debu=
g.c
> index 2646107..917fe1f 100644
> --- a/hw/misc/arm_integrator_debug.c
> +++ b/hw/misc/arm_integrator_debug.c
> @@ -73,7 +73,7 @@ static void intdbg_control_write(void *opaque, hwaddr o=
ffset,
>  static const MemoryRegionOps intdbg_control_ops =3D {
>      .read =3D intdbg_control_read,
>      .write =3D intdbg_control_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void intdbg_control_init(Object *obj)
> diff --git a/hw/misc/arm_l2x0.c b/hw/misc/arm_l2x0.c
> index b88f40a..b071920 100644
> --- a/hw/misc/arm_l2x0.c
> +++ b/hw/misc/arm_l2x0.c
> @@ -157,7 +157,7 @@ static void l2x0_priv_reset(DeviceState *dev)
>  static const MemoryRegionOps l2x0_mem_ops =3D {
>      .read =3D l2x0_priv_read,
>      .write =3D l2x0_priv_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>   };
>=20
>  static void l2x0_priv_init(Object *obj)
> diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
> index 457dfad..736a708 100644
> --- a/hw/misc/arm_sysctl.c
> +++ b/hw/misc/arm_sysctl.c
> @@ -561,7 +561,7 @@ static void arm_sysctl_write(void *opaque, hwaddr off=
set,
>  static const MemoryRegionOps arm_sysctl_ops =3D {
>      .read =3D arm_sysctl_read,
>      .write =3D arm_sysctl_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void arm_sysctl_gpio_set(void *opaque, int line, int level)
> diff --git a/hw/misc/armsse-cpuid.c b/hw/misc/armsse-cpuid.c
> index 05c08f3..3da0f02 100644
> --- a/hw/misc/armsse-cpuid.c
> +++ b/hw/misc/armsse-cpuid.c
> @@ -84,7 +84,7 @@ static void armsse_cpuid_write(void *opaque, hwaddr off=
set,
>  static const MemoryRegionOps armsse_cpuid_ops =3D {
>      .read =3D armsse_cpuid_read,
>      .write =3D armsse_cpuid_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      /* byte/halfword accesses are just zero-padded on reads and writes */
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
> diff --git a/hw/misc/armsse-mhu.c b/hw/misc/armsse-mhu.c
> index 514321a..b57f892 100644
> --- a/hw/misc/armsse-mhu.c
> +++ b/hw/misc/armsse-mhu.c
> @@ -139,7 +139,7 @@ static void armsse_mhu_write(void *opaque, hwaddr off=
set,
>  static const MemoryRegionOps armsse_mhu_ops =3D {
>      .read =3D armsse_mhu_read,
>      .write =3D armsse_mhu_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>  };
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 71a0d4b..fca5fe5 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -276,7 +276,7 @@ static void aspeed_scu_write(void *opaque, hwaddr off=
set, uint64_t data,
>  static const MemoryRegionOps aspeed_scu_ops =3D {
>      .read =3D aspeed_scu_read,
>      .write =3D aspeed_scu_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>      .valid.unaligned =3D false,
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index b84676d..6444afb 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -169,7 +169,7 @@ static void aspeed_sdmc_write(void *opaque, hwaddr ad=
dr, uint64_t data,
>  static const MemoryRegionOps aspeed_sdmc_ops =3D {
>      .read =3D aspeed_sdmc_read,
>      .write =3D aspeed_sdmc_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>  };
> diff --git a/hw/misc/aspeed_xdma.c b/hw/misc/aspeed_xdma.c
> index eebd4ad..3568a40 100644
> --- a/hw/misc/aspeed_xdma.c
> +++ b/hw/misc/aspeed_xdma.c
> @@ -106,7 +106,7 @@ static void aspeed_xdma_write(void *opaque, hwaddr ad=
dr, uint64_t val,
>  static const MemoryRegionOps aspeed_xdma_ops =3D {
>      .read =3D aspeed_xdma_read,
>      .write =3D aspeed_xdma_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>  };
> diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
> index a87da5e..0e19b3f 100644
> --- a/hw/misc/bcm2835_mbox.c
> +++ b/hw/misc/bcm2835_mbox.c
> @@ -237,7 +237,7 @@ static void bcm2835_mbox_write(void *opaque, hwaddr o=
ffset,
>  static const MemoryRegionOps bcm2835_mbox_ops =3D {
>      .read =3D bcm2835_mbox_read,
>      .write =3D bcm2835_mbox_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>  };
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 0bf789c..0085902 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -343,7 +343,7 @@ static void bcm2835_property_write(void *opaque, hwad=
dr offset,
>  static const MemoryRegionOps bcm2835_property_ops =3D {
>      .read =3D bcm2835_property_read,
>      .write =3D bcm2835_property_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>  };
> diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c
> index e882c87..8e0b329 100644
> --- a/hw/misc/bcm2835_rng.c
> +++ b/hw/misc/bcm2835_rng.c
> @@ -91,7 +91,7 @@ static void bcm2835_rng_write(void *opaque, hwaddr offs=
et,
>  static const MemoryRegionOps bcm2835_rng_ops =3D {
>      .read =3D bcm2835_rng_read,
>      .write =3D bcm2835_rng_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_bcm2835_rng =3D {
> diff --git a/hw/misc/debugexit.c b/hw/misc/debugexit.c
> index 8e4a2fc..c34960e 100644
> --- a/hw/misc/debugexit.c
> +++ b/hw/misc/debugexit.c
> @@ -40,7 +40,7 @@ static const MemoryRegionOps debug_exit_ops =3D {
>      .write =3D debug_exit_write,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void debug_exit_realizefn(DeviceState *d, Error **errp)
> diff --git a/hw/misc/eccmemctl.c b/hw/misc/eccmemctl.c
> index 8386db0..f01b397 100644
> --- a/hw/misc/eccmemctl.c
> +++ b/hw/misc/eccmemctl.c
> @@ -228,7 +228,7 @@ static uint64_t ecc_mem_read(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps ecc_mem_ops =3D {
>      .read =3D ecc_mem_read,
>      .write =3D ecc_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -257,7 +257,7 @@ static uint64_t ecc_diag_mem_read(void *opaque, hwadd=
r addr,
>  static const MemoryRegionOps ecc_diag_mem_ops =3D {
>      .read =3D ecc_diag_mem_read,
>      .write =3D ecc_diag_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/misc/edu.c b/hw/misc/edu.c
> index 3b6dba2..73252d0 100644
> --- a/hw/misc/edu.c
> +++ b/hw/misc/edu.c
> @@ -294,7 +294,7 @@ static void edu_mmio_write(void *opaque, hwaddr addr,=
 uint64_t val,
>  static const MemoryRegionOps edu_mmio_ops =3D {
>      .read =3D edu_mmio_read,
>      .write =3D edu_mmio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 8,
> diff --git a/hw/misc/exynos4210_clk.c b/hw/misc/exynos4210_clk.c
> index 821d9ea..b83bb88 100644
> --- a/hw/misc/exynos4210_clk.c
> +++ b/hw/misc/exynos4210_clk.c
> @@ -100,7 +100,7 @@ static void exynos4210_clk_write(void *opaque, hwaddr=
 offset,
>  static const MemoryRegionOps exynos4210_clk_ops =3D {
>      .read =3D exynos4210_clk_read,
>      .write =3D exynos4210_clk_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
> index 8712774..75617f9 100644
> --- a/hw/misc/exynos4210_pmu.c
> +++ b/hw/misc/exynos4210_pmu.c
> @@ -457,7 +457,7 @@ static void exynos4210_pmu_write(void *opaque, hwaddr=
 offset,
>  static const MemoryRegionOps exynos4210_pmu_ops =3D {
>      .read =3D exynos4210_pmu_read,
>      .write =3D exynos4210_pmu_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/misc/exynos4210_rng.c b/hw/misc/exynos4210_rng.c
> index b88fe3a..644f647 100644
> --- a/hw/misc/exynos4210_rng.c
> +++ b/hw/misc/exynos4210_rng.c
> @@ -215,7 +215,7 @@ static void exynos4210_rng_write(void *opaque, hwaddr=
 offset,
>  static const MemoryRegionOps exynos4210_rng_ops =3D {
>      .read =3D exynos4210_rng_read,
>      .write =3D exynos4210_rng_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void exynos4210_rng_reset(DeviceState *dev)
> diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
> index 7338461..a85624e 100644
> --- a/hw/misc/grlib_ahb_apb_pnp.c
> +++ b/hw/misc/grlib_ahb_apb_pnp.c
> @@ -137,7 +137,7 @@ static uint64_t grlib_ahb_pnp_read(void *opaque, hwad=
dr offset, unsigned size)
>=20
>  static const MemoryRegionOps grlib_ahb_pnp_ops =3D {
>      .read       =3D grlib_ahb_pnp_read,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void grlib_ahb_pnp_realize(DeviceState *dev, Error **errp)
> @@ -233,7 +233,7 @@ static uint64_t grlib_apb_pnp_read(void *opaque, hwad=
dr offset, unsigned size)
>=20
>  static const MemoryRegionOps grlib_apb_pnp_ops =3D {
>      .read       =3D grlib_apb_pnp_read,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void grlib_apb_pnp_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c
> index 693ea81..9a7fbe7 100644
> --- a/hw/misc/imx25_ccm.c
> +++ b/hw/misc/imx25_ccm.c
> @@ -266,7 +266,7 @@ static void imx25_ccm_write(void *opaque, hwaddr offs=
et, uint64_t value,
>  static const struct MemoryRegionOps imx25_ccm_ops =3D {
>      .read =3D imx25_ccm_read,
>      .write =3D imx25_ccm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> diff --git a/hw/misc/imx2_wdt.c b/hw/misc/imx2_wdt.c
> index 5576778..07e97a2 100644
> --- a/hw/misc/imx2_wdt.c
> +++ b/hw/misc/imx2_wdt.c
> @@ -37,7 +37,7 @@ static void imx2_wdt_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps imx2_wdt_ops =3D {
>      .read  =3D imx2_wdt_read,
>      .write =3D imx2_wdt_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> diff --git a/hw/misc/imx31_ccm.c b/hw/misc/imx31_ccm.c
> index 38a19aa..08a5969 100644
> --- a/hw/misc/imx31_ccm.c
> +++ b/hw/misc/imx31_ccm.c
> @@ -292,7 +292,7 @@ static void imx31_ccm_write(void *opaque, hwaddr offs=
et, uint64_t value,
>  static const struct MemoryRegionOps imx31_ccm_ops =3D {
>      .read =3D imx31_ccm_read,
>      .write =3D imx31_ccm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
> index 9478007..e93f4a1 100644
> --- a/hw/misc/imx6_ccm.c
> +++ b/hw/misc/imx6_ccm.c
> @@ -696,7 +696,7 @@ static void imx6_analog_write(void *opaque, hwaddr of=
fset, uint64_t value,
>  static const struct MemoryRegionOps imx6_ccm_ops =3D {
>      .read =3D imx6_ccm_read,
>      .write =3D imx6_ccm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> @@ -713,7 +713,7 @@ static const struct MemoryRegionOps imx6_ccm_ops =3D {
>  static const struct MemoryRegionOps imx6_analog_ops =3D {
>      .read =3D imx6_analog_read,
>      .write =3D imx6_analog_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
> index 878ffcd..85f40ac 100644
> --- a/hw/misc/imx6_src.c
> +++ b/hw/misc/imx6_src.c
> @@ -262,7 +262,7 @@ static void imx6_src_write(void *opaque, hwaddr offse=
t, uint64_t value,
>  static const struct MemoryRegionOps imx6_src_ops =3D {
>      .read =3D imx6_src_read,
>      .write =3D imx6_src_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> diff --git a/hw/misc/imx6ul_ccm.c b/hw/misc/imx6ul_ccm.c
> index 37b472d..88acb69 100644
> --- a/hw/misc/imx6ul_ccm.c
> +++ b/hw/misc/imx6ul_ccm.c
> @@ -801,7 +801,7 @@ static void imx6ul_analog_write(void *opaque, hwaddr =
offset, uint64_t value,
>  static const struct MemoryRegionOps imx6ul_ccm_ops =3D {
>      .read =3D imx6ul_ccm_read,
>      .write =3D imx6ul_ccm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> @@ -818,7 +818,7 @@ static const struct MemoryRegionOps imx6ul_ccm_ops =
=3D {
>  static const struct MemoryRegionOps imx6ul_analog_ops =3D {
>      .read =3D imx6ul_analog_read,
>      .write =3D imx6ul_analog_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> diff --git a/hw/misc/imx7_ccm.c b/hw/misc/imx7_ccm.c
> index d9bdcf1..3305316 100644
> --- a/hw/misc/imx7_ccm.c
> +++ b/hw/misc/imx7_ccm.c
> @@ -116,7 +116,7 @@ static void imx7_set_clr_tog_write(void *opaque, hwad=
dr offset,
>  static const struct MemoryRegionOps imx7_set_clr_tog_ops =3D {
>      .read =3D imx7_set_clr_tog_read,
>      .write =3D imx7_set_clr_tog_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> @@ -132,7 +132,7 @@ static const struct MemoryRegionOps imx7_set_clr_tog_=
ops =3D {
>=20
>  static const struct MemoryRegionOps imx7_digprog_ops =3D {
>      .read =3D imx7_set_clr_tog_read,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/misc/imx7_gpr.c b/hw/misc/imx7_gpr.c
> index 09d57d4..3cb144b 100644
> --- a/hw/misc/imx7_gpr.c
> +++ b/hw/misc/imx7_gpr.c
> @@ -79,7 +79,7 @@ static void imx7_gpr_write(void *opaque, hwaddr offset,
>  static const struct MemoryRegionOps imx7_gpr_ops =3D {
>      .read =3D imx7_gpr_read,
>      .write =3D imx7_gpr_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> diff --git a/hw/misc/imx7_snvs.c b/hw/misc/imx7_snvs.c
> index 55b962a..373d586 100644
> --- a/hw/misc/imx7_snvs.c
> +++ b/hw/misc/imx7_snvs.c
> @@ -37,7 +37,7 @@ static void imx7_snvs_write(void *opaque, hwaddr offset,
>  static const struct MemoryRegionOps imx7_snvs_ops =3D {
>      .read =3D imx7_snvs_read,
>      .write =3D imx7_snvs_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
> index 58fd94b..7cb1424 100644
> --- a/hw/misc/iotkit-secctl.c
> +++ b/hw/misc/iotkit-secctl.c
> @@ -560,7 +560,7 @@ static MemTxResult iotkit_secctl_ns_write(void *opaqu=
e, hwaddr addr,
>  static const MemoryRegionOps iotkit_secctl_s_ops =3D {
>      .read_with_attrs =3D iotkit_secctl_s_read,
>      .write_with_attrs =3D iotkit_secctl_s_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
> @@ -570,7 +570,7 @@ static const MemoryRegionOps iotkit_secctl_s_ops =3D {
>  static const MemoryRegionOps iotkit_secctl_ns_ops =3D {
>      .read_with_attrs =3D iotkit_secctl_ns_read,
>      .write_with_attrs =3D iotkit_secctl_ns_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
> diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
> index 00d4faa..6969a18 100644
> --- a/hw/misc/iotkit-sysctl.c
> +++ b/hw/misc/iotkit-sysctl.c
> @@ -388,7 +388,7 @@ static void iotkit_sysctl_write(void *opaque, hwaddr =
offset,
>  static const MemoryRegionOps iotkit_sysctl_ops =3D {
>      .read =3D iotkit_sysctl_read,
>      .write =3D iotkit_sysctl_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      /* byte/halfword accesses are just zero-padded on reads and writes */
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
> diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
> index 3e1cf0e..7f4133f 100644
> --- a/hw/misc/iotkit-sysinfo.c
> +++ b/hw/misc/iotkit-sysinfo.c
> @@ -88,7 +88,7 @@ static void iotkit_sysinfo_write(void *opaque, hwaddr o=
ffset,
>  static const MemoryRegionOps iotkit_sysinfo_ops =3D {
>      .read =3D iotkit_sysinfo_read,
>      .write =3D iotkit_sysinfo_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      /* byte/halfword accesses are just zero-padded on reads and writes */
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index f9cc66a..bc69cd7 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -275,7 +275,7 @@ static uint64_t ivshmem_io_read(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps ivshmem_mmio_ops =3D {
>      .read =3D ivshmem_io_read,
>      .write =3D ivshmem_io_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
> index 4f532ef..ad6d6b5 100644
> --- a/hw/misc/macio/cuda.c
> +++ b/hw/misc/macio/cuda.c
> @@ -477,7 +477,7 @@ static void mos6522_cuda_write(void *opaque, hwaddr a=
ddr, uint64_t val,
>  static const MemoryRegionOps mos6522_cuda_ops =3D {
>      .read =3D mos6522_cuda_read,
>      .write =3D mos6522_cuda_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c
> index 31811ab..c4c9a68 100644
> --- a/hw/misc/macio/gpio.c
> +++ b/hw/misc/macio/gpio.c
> @@ -144,7 +144,7 @@ static uint64_t macio_gpio_read(void *opaque, hwaddr =
addr, unsigned size)
>  static const MemoryRegionOps macio_gpio_ops =3D {
>      .read =3D macio_gpio_read,
>      .write =3D macio_gpio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/misc/macio/mac_dbdma.c b/hw/misc/macio/mac_dbdma.c
> index 548625a..4554b28 100644
> --- a/hw/misc/macio/mac_dbdma.c
> +++ b/hw/misc/macio/mac_dbdma.c
> @@ -793,7 +793,7 @@ static uint64_t dbdma_read(void *opaque, hwaddr addr,
>  static const MemoryRegionOps dbdma_ops =3D {
>      .read =3D dbdma_read,
>      .write =3D dbdma_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index 8249209..693bb26 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -284,7 +284,7 @@ static uint64_t timer_read(void *opaque, hwaddr addr,=
 unsigned size)
>  static const MemoryRegionOps timer_ops =3D {
>      .read =3D timer_read,
>      .write =3D timer_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void macio_newworld_realize(PCIDevice *d, Error **errp)
> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
> index 753561d..fb0d132 100644
> --- a/hw/misc/macio/pmu.c
> +++ b/hw/misc/macio/pmu.c
> @@ -664,7 +664,7 @@ static void mos6522_pmu_write(void *opaque, hwaddr ad=
dr, uint64_t val,
>  static const MemoryRegionOps mos6522_pmu_ops =3D {
>      .read =3D mos6522_pmu_read,
>      .write =3D mos6522_pmu_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/misc/milkymist-hpdmc.c b/hw/misc/milkymist-hpdmc.c
> index 701c79e..33ecefb 100644
> --- a/hw/misc/milkymist-hpdmc.c
> +++ b/hw/misc/milkymist-hpdmc.c
> @@ -113,7 +113,7 @@ static const MemoryRegionOps hpdmc_mmio_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void milkymist_hpdmc_reset(DeviceState *d)
> diff --git a/hw/misc/milkymist-pfpu.c b/hw/misc/milkymist-pfpu.c
> index 1c27f1a..e7c777b 100644
> --- a/hw/misc/milkymist-pfpu.c
> +++ b/hw/misc/milkymist-pfpu.c
> @@ -475,7 +475,7 @@ static const MemoryRegionOps pfpu_mmio_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void milkymist_pfpu_reset(DeviceState *d)
> diff --git a/hw/misc/mips_cmgcr.c b/hw/misc/mips_cmgcr.c
> index edec164..f09cf1f 100644
> --- a/hw/misc/mips_cmgcr.c
> +++ b/hw/misc/mips_cmgcr.c
> @@ -170,7 +170,7 @@ static void gcr_write(void *opaque, hwaddr addr, uint=
64_t data, unsigned size)
>  static const MemoryRegionOps gcr_ops =3D {
>      .read =3D gcr_read,
>      .write =3D gcr_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .max_access_size =3D 8,
>      },
> diff --git a/hw/misc/mips_cpc.c b/hw/misc/mips_cpc.c
> index 446b1ad..2244ee4 100644
> --- a/hw/misc/mips_cpc.c
> +++ b/hw/misc/mips_cpc.c
> @@ -111,7 +111,7 @@ static uint64_t cpc_read(void *opaque, hwaddr offset,=
 unsigned size)
>  static const MemoryRegionOps cpc_ops =3D {
>      .read =3D cpc_read,
>      .write =3D cpc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .max_access_size =3D 8,
>      },
> diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
> index e8ba4a3..7369d7c 100644
> --- a/hw/misc/mips_itu.c
> +++ b/hw/misc/mips_itu.c
> @@ -141,7 +141,7 @@ static const MemoryRegionOps itc_tag_ops =3D {
>      .impl =3D {
>          .max_access_size =3D 8,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static inline uint32_t get_num_cells(MIPSITUState *s)
> @@ -482,7 +482,7 @@ static void itc_storage_write(void *opaque, hwaddr ad=
dr, uint64_t data,
>  static const MemoryRegionOps itc_storage_ops =3D {
>      .read =3D itc_storage_read,
>      .write =3D itc_storage_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void itc_reset_cells(MIPSITUState *s)
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index e72ed69..60f4208 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -364,7 +364,7 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_=
t val, unsigned size)
>  static const MemoryRegionOps mos6522_ops =3D {
>      .read =3D mos6522_read,
>      .write =3D mos6522_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
> index b97ad42..7d894e4 100644
> --- a/hw/misc/mps2-fpgaio.c
> +++ b/hw/misc/mps2-fpgaio.c
> @@ -220,7 +220,7 @@ static void mps2_fpgaio_write(void *opaque, hwaddr of=
fset, uint64_t value,
>  static const MemoryRegionOps mps2_fpgaio_ops =3D {
>      .read =3D mps2_fpgaio_read,
>      .write =3D mps2_fpgaio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void mps2_fpgaio_reset(DeviceState *dev)
> diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
> index 1fdf5d2..9a089e3 100644
> --- a/hw/misc/mps2-scc.c
> +++ b/hw/misc/mps2-scc.c
> @@ -215,7 +215,7 @@ static void mps2_scc_write(void *opaque, hwaddr offse=
t, uint64_t value,
>  static const MemoryRegionOps mps2_scc_ops =3D {
>      .read =3D mps2_scc_read,
>      .write =3D mps2_scc_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void mps2_scc_reset(DeviceState *dev)
> diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
> index 21a2863..33282dc 100644
> --- a/hw/misc/msf2-sysreg.c
> +++ b/hw/misc/msf2-sysreg.c
> @@ -94,7 +94,7 @@ static void msf2_sysreg_write(void *opaque, hwaddr offs=
et,
>  static const MemoryRegionOps sysreg_ops =3D {
>      .read =3D msf2_sysreg_read,
>      .write =3D msf2_sysreg_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void msf2_sysreg_init(Object *obj)
> diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c
> index fd18303..db26d16 100644
> --- a/hw/misc/mst_fpga.c
> +++ b/hw/misc/mst_fpga.c
> @@ -191,7 +191,7 @@ mst_fpga_writeb(void *opaque, hwaddr addr, uint64_t v=
alue,
>  static const MemoryRegionOps mst_fpga_ops =3D {
>   .read =3D mst_fpga_readb,
>   .write =3D mst_fpga_writeb,
> - .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static int mst_fpga_post_load(void *opaque, int version_id)
> diff --git a/hw/misc/nrf51_rng.c b/hw/misc/nrf51_rng.c
> index 96ef433..9614446 100644
> --- a/hw/misc/nrf51_rng.c
> +++ b/hw/misc/nrf51_rng.c
> @@ -137,7 +137,7 @@ static void rng_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps rng_ops =3D {
>      .read =3D  rng_read,
>      .write =3D rng_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4
>  };
> diff --git a/hw/misc/omap_gpmc.c b/hw/misc/omap_gpmc.c
> index 84f9e4c..00da920 100644
> --- a/hw/misc/omap_gpmc.c
> +++ b/hw/misc/omap_gpmc.c
> @@ -212,7 +212,7 @@ static void omap_nand_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_nand_ops =3D {
>      .read =3D omap_nand_read,
>      .write =3D omap_nand_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void fill_prefetch_fifo(struct omap_gpmc_s *s)
> @@ -369,7 +369,7 @@ static void omap_gpmc_prefetch_write(void *opaque, hw=
addr addr,
>  static const MemoryRegionOps omap_prefetch_ops =3D {
>      .read =3D omap_gpmc_prefetch_read,
>      .write =3D omap_gpmc_prefetch_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 1,
>  };
> @@ -819,7 +819,7 @@ static void omap_gpmc_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_gpmc_ops =3D {
>      .read =3D omap_gpmc_read,
>      .write =3D omap_gpmc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  struct omap_gpmc_s *omap_gpmc_init(struct omap_mpu_state_s *mpu,
> diff --git a/hw/misc/omap_l4.c b/hw/misc/omap_l4.c
> index c217728..c09cbad 100644
> --- a/hw/misc/omap_l4.c
> +++ b/hw/misc/omap_l4.c
> @@ -107,7 +107,7 @@ static void omap_l4ta_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_l4ta_ops =3D {
>      .read =3D omap_l4ta_read,
>      .write =3D omap_l4ta_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  struct omap_target_agent_s *omap_l4ta_get(struct omap_l4_s *bus,
> diff --git a/hw/misc/omap_sdrc.c b/hw/misc/omap_sdrc.c
> index 7b38c55..f9863de 100644
> --- a/hw/misc/omap_sdrc.c
> +++ b/hw/misc/omap_sdrc.c
> @@ -152,7 +152,7 @@ static void omap_sdrc_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_sdrc_ops =3D {
>      .read =3D omap_sdrc_read,
>      .write =3D omap_sdrc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  struct omap_sdrc_s *omap_sdrc_init(MemoryRegion *sysmem,
> diff --git a/hw/misc/omap_tap.c b/hw/misc/omap_tap.c
> index 3f595e8..d005ac2 100644
> --- a/hw/misc/omap_tap.c
> +++ b/hw/misc/omap_tap.c
> @@ -106,7 +106,7 @@ static void omap_tap_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps omap_tap_ops =3D {
>      .read =3D omap_tap_read,
>      .write =3D omap_tap_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  void omap_tap_init(struct omap_target_agent_s *ta,
> diff --git a/hw/misc/pc-testdev.c b/hw/misc/pc-testdev.c
> index 1f9abd5..34a9227 100644
> --- a/hw/misc/pc-testdev.c
> +++ b/hw/misc/pc-testdev.c
> @@ -78,7 +78,7 @@ static const MemoryRegionOps test_irq_ops =3D {
>      .write =3D test_irq_line_write,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 1,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void test_ioport_write(void *opaque, hwaddr addr, uint64_t data,
> @@ -104,7 +104,7 @@ static uint64_t test_ioport_read(void *opaque, hwaddr=
 addr, unsigned len)
>  static const MemoryRegionOps test_ioport_ops =3D {
>      .read =3D test_ioport_read,
>      .write =3D test_ioport_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const MemoryRegionOps test_ioport_byte_ops =3D {
> @@ -114,7 +114,7 @@ static const MemoryRegionOps test_ioport_byte_ops =3D=
 {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 1,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t test_flush_page_read(void *opaque, hwaddr addr, unsigned=
 size)
> @@ -142,7 +142,7 @@ static const MemoryRegionOps test_flush_ops =3D {
>      .write =3D test_flush_page_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t test_iomem_read(void *opaque, hwaddr addr, unsigned len)
> @@ -165,7 +165,7 @@ static void test_iomem_write(void *opaque, hwaddr add=
r, uint64_t val,
>  static const MemoryRegionOps test_iomem_ops =3D {
>      .read =3D test_iomem_read,
>      .write =3D test_iomem_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void testdev_realizefn(DeviceState *d, Error **errp)
> diff --git a/hw/misc/pci-testdev.c b/hw/misc/pci-testdev.c
> index d4d89df..ee9c575 100644
> --- a/hw/misc/pci-testdev.c
> +++ b/hw/misc/pci-testdev.c
> @@ -222,7 +222,7 @@ pci_testdev_pio_write(void *opaque, hwaddr addr, uint=
64_t val,
>  static const MemoryRegionOps pci_testdev_mmio_ops =3D {
>      .read =3D pci_testdev_read,
>      .write =3D pci_testdev_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -232,7 +232,7 @@ static const MemoryRegionOps pci_testdev_mmio_ops =3D=
 {
>  static const MemoryRegionOps pci_testdev_pio_ops =3D {
>      .read =3D pci_testdev_read,
>      .write =3D pci_testdev_pio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/misc/puv3_pm.c b/hw/misc/puv3_pm.c
> index b538b4a..f9a13dd 100644
> --- a/hw/misc/puv3_pm.c
> +++ b/hw/misc/puv3_pm.c
> @@ -118,7 +118,7 @@ static const MemoryRegionOps puv3_pm_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void puv3_pm_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/misc/slavio_misc.c b/hw/misc/slavio_misc.c
> index 9c2cf04..bbff86f 100644
> --- a/hw/misc/slavio_misc.c
> +++ b/hw/misc/slavio_misc.c
> @@ -142,7 +142,7 @@ static uint64_t slavio_cfg_mem_readb(void *opaque, hw=
addr addr,
>  static const MemoryRegionOps slavio_cfg_mem_ops =3D {
>      .read =3D slavio_cfg_mem_readb,
>      .write =3D slavio_cfg_mem_writeb,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -172,7 +172,7 @@ static uint64_t slavio_diag_mem_readb(void *opaque, h=
waddr addr,
>  static const MemoryRegionOps slavio_diag_mem_ops =3D {
>      .read =3D slavio_diag_mem_readb,
>      .write =3D slavio_diag_mem_writeb,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -202,7 +202,7 @@ static uint64_t slavio_mdm_mem_readb(void *opaque, hw=
addr addr,
>  static const MemoryRegionOps slavio_mdm_mem_ops =3D {
>      .read =3D slavio_mdm_mem_readb,
>      .write =3D slavio_mdm_mem_writeb,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -240,7 +240,7 @@ static uint64_t slavio_aux1_mem_readb(void *opaque, h=
waddr addr,
>  static const MemoryRegionOps slavio_aux1_mem_ops =3D {
>      .read =3D slavio_aux1_mem_readb,
>      .write =3D slavio_aux1_mem_writeb,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -277,7 +277,7 @@ static uint64_t slavio_aux2_mem_readb(void *opaque, h=
waddr addr,
>  static const MemoryRegionOps slavio_aux2_mem_ops =3D {
>      .read =3D slavio_aux2_mem_readb,
>      .write =3D slavio_aux2_mem_writeb,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -305,7 +305,7 @@ static uint64_t apc_mem_readb(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps apc_mem_ops =3D {
>      .read =3D apc_mem_readb,
>      .write =3D apc_mem_writeb,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -350,7 +350,7 @@ static void slavio_sysctrl_mem_writel(void *opaque, h=
waddr addr,
>  static const MemoryRegionOps slavio_sysctrl_mem_ops =3D {
>      .read =3D slavio_sysctrl_mem_readl,
>      .write =3D slavio_sysctrl_mem_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -392,7 +392,7 @@ static void slavio_led_mem_writew(void *opaque, hwadd=
r addr,
>  static const MemoryRegionOps slavio_led_mem_ops =3D {
>      .read =3D slavio_led_mem_readw,
>      .write =3D slavio_led_mem_writew,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 2,
>          .max_access_size =3D 2,
> diff --git a/hw/misc/stm32f2xx_syscfg.c b/hw/misc/stm32f2xx_syscfg.c
> index aa59b43..1efe7e2 100644
> --- a/hw/misc/stm32f2xx_syscfg.c
> +++ b/hw/misc/stm32f2xx_syscfg.c
> @@ -126,7 +126,7 @@ static void stm32f2xx_syscfg_write(void *opaque, hwad=
dr addr,
>  static const MemoryRegionOps stm32f2xx_syscfg_ops =3D {
>      .read =3D stm32f2xx_syscfg_read,
>      .write =3D stm32f2xx_syscfg_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void stm32f2xx_syscfg_init(Object *obj)
> diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
> index 45a3e31..2924fc2 100644
> --- a/hw/misc/tz-mpc.c
> +++ b/hw/misc/tz-mpc.c
> @@ -332,7 +332,7 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwa=
ddr addr,
>  static const MemoryRegionOps tz_mpc_reg_ops =3D {
>      .read_with_attrs =3D tz_mpc_reg_read,
>      .write_with_attrs =3D tz_mpc_reg_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
> @@ -408,7 +408,7 @@ static MemTxResult tz_mpc_mem_blocked_write(void *opa=
que, hwaddr addr,
>  static const MemoryRegionOps tz_mpc_mem_blocked_ops =3D {
>      .read_with_attrs =3D tz_mpc_mem_blocked_read,
>      .write_with_attrs =3D tz_mpc_mem_blocked_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 8,
>      .impl.min_access_size =3D 1,
> diff --git a/hw/misc/tz-msc.c b/hw/misc/tz-msc.c
> index 52b96ba..bf68480 100644
> --- a/hw/misc/tz-msc.c
> +++ b/hw/misc/tz-msc.c
> @@ -206,7 +206,7 @@ static MemTxResult tz_msc_write(void *opaque, hwaddr =
addr, uint64_t val,
>  static const MemoryRegionOps tz_msc_ops =3D {
>      .read_with_attrs =3D tz_msc_read,
>      .write_with_attrs =3D tz_msc_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void tz_msc_reset(DeviceState *dev)
> diff --git a/hw/misc/tz-ppc.c b/hw/misc/tz-ppc.c
> index 2a14a26..fd2bb07 100644
> --- a/hw/misc/tz-ppc.c
> +++ b/hw/misc/tz-ppc.c
> @@ -179,7 +179,7 @@ static MemTxResult tz_ppc_write(void *opaque, hwaddr =
addr, uint64_t val,
>  static const MemoryRegionOps tz_ppc_ops =3D {
>      .read_with_attrs =3D tz_ppc_read,
>      .write_with_attrs =3D tz_ppc_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static bool tz_ppc_dummy_accepts(void *opaque, hwaddr addr,
> diff --git a/hw/misc/unimp.c b/hw/misc/unimp.c
> index 7f8e42c..2991bce 100644
> --- a/hw/misc/unimp.c
> +++ b/hw/misc/unimp.c
> @@ -47,7 +47,7 @@ static const MemoryRegionOps unimp_ops =3D {
>      .impl.max_access_size =3D 8,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 8,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void unimp_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/misc/zynq-xadc.c b/hw/misc/zynq-xadc.c
> index f1e4860..1fefac4 100644
> --- a/hw/misc/zynq-xadc.c
> +++ b/hw/misc/zynq-xadc.c
> @@ -251,7 +251,7 @@ static void zynq_xadc_write(void *opaque, hwaddr offs=
et, uint64_t val,
>  static const MemoryRegionOps xadc_ops =3D {
>      .read =3D zynq_xadc_read,
>      .write =3D zynq_xadc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void zynq_xadc_init(Object *obj)
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index 6b51ae5..75a01d0 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -415,7 +415,7 @@ static void zynq_slcr_write(void *opaque, hwaddr offs=
et,
>  static const MemoryRegionOps slcr_ops =3D {
>      .read =3D zynq_slcr_read,
>      .write =3D zynq_slcr_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void zynq_slcr_init(Object *obj)
> diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
> index d771d39..be6888c 100644
> --- a/hw/moxie/moxiesim.c
> +++ b/hw/moxie/moxiesim.c
> @@ -141,7 +141,7 @@ static void moxiesim_init(MachineState *machine)
>      /* A single 16450 sits at offset 0x3f8.  */
>      if (serial_hd(0)) {
>          serial_mm_init(address_space_mem, 0x3f8, 0, env->irq[4],
> -                       8000000/16, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +                       8000000 / 16, serial_hd(0), MO_LE);
>      }
>  }
>=20
> diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
> index eecda52..fe02b4b 100644
> --- a/hw/net/allwinner_emac.c
> +++ b/hw/net/allwinner_emac.c
> @@ -418,7 +418,7 @@ static void aw_emac_set_link(NetClientState *nc)
>  static const MemoryRegionOps aw_emac_mem_ops =3D {
>      .read =3D aw_emac_read,
>      .write =3D aw_emac_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index d412085..fb00600 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1515,7 +1515,7 @@ static void gem_write(void *opaque, hwaddr offset, =
uint64_t val,
>  static const MemoryRegionOps gem_ops =3D {
>      .read =3D gem_read,
>      .write =3D gem_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void gem_set_link(NetClientState *nc)
> diff --git a/hw/net/can/can_kvaser_pci.c b/hw/net/can/can_kvaser_pci.c
> index df639f8..8661c17 100644
> --- a/hw/net/can/can_kvaser_pci.c
> +++ b/hw/net/can/can_kvaser_pci.c
> @@ -190,7 +190,7 @@ static void kvaser_pci_xilinx_io_write(void *opaque, =
hwaddr addr, uint64_t data,
>  static const MemoryRegionOps kvaser_pci_s5920_io_ops =3D {
>      .read =3D kvaser_pci_s5920_io_read,
>      .write =3D kvaser_pci_s5920_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -200,7 +200,7 @@ static const MemoryRegionOps kvaser_pci_s5920_io_ops =
=3D {
>  static const MemoryRegionOps kvaser_pci_sja_io_ops =3D {
>      .read =3D kvaser_pci_sja_io_read,
>      .write =3D kvaser_pci_sja_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .max_access_size =3D 1,
>      },
> @@ -209,7 +209,7 @@ static const MemoryRegionOps kvaser_pci_sja_io_ops =
=3D {
>  static const MemoryRegionOps kvaser_pci_xilinx_io_ops =3D {
>      .read =3D kvaser_pci_xilinx_io_read,
>      .write =3D kvaser_pci_xilinx_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .max_access_size =3D 1,
>      },
> diff --git a/hw/net/can/can_mioe3680_pci.c b/hw/net/can/can_mioe3680_pci.c
> index 7af0993..013dae3 100644
> --- a/hw/net/can/can_mioe3680_pci.c
> +++ b/hw/net/can/can_mioe3680_pci.c
> @@ -135,7 +135,7 @@ static void mioe3680_pci_sja2_io_write(void *opaque, =
hwaddr addr, uint64_t data,
>  static const MemoryRegionOps mioe3680_pci_sja1_io_ops =3D {
>      .read =3D mioe3680_pci_sja1_io_read,
>      .write =3D mioe3680_pci_sja1_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .max_access_size =3D 1,
>      },
> @@ -144,7 +144,7 @@ static const MemoryRegionOps mioe3680_pci_sja1_io_ops=
 =3D {
>  static const MemoryRegionOps mioe3680_pci_sja2_io_ops =3D {
>      .read =3D mioe3680_pci_sja2_io_read,
>      .write =3D mioe3680_pci_sja2_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .max_access_size =3D 1,
>      },
> diff --git a/hw/net/can/can_pcm3680_pci.c b/hw/net/can/can_pcm3680_pci.c
> index 3f7312a..2207b5b 100644
> --- a/hw/net/can/can_pcm3680_pci.c
> +++ b/hw/net/can/can_pcm3680_pci.c
> @@ -135,7 +135,7 @@ static void pcm3680i_pci_sja2_io_write(void *opaque, =
hwaddr addr, uint64_t data,
>  static const MemoryRegionOps pcm3680i_pci_sja1_io_ops =3D {
>      .read =3D pcm3680i_pci_sja1_io_read,
>      .write =3D pcm3680i_pci_sja1_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .max_access_size =3D 1,
>      },
> @@ -144,7 +144,7 @@ static const MemoryRegionOps pcm3680i_pci_sja1_io_ops=
 =3D {
>  static const MemoryRegionOps pcm3680i_pci_sja2_io_ops =3D {
>      .read =3D pcm3680i_pci_sja2_io_read,
>      .write =3D pcm3680i_pci_sja2_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .max_access_size =3D 1,
>      },
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index bdb0b3b..b5c191c 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -651,7 +651,7 @@ static const MemoryRegionOps dp8393x_ops =3D {
>      .write =3D dp8393x_write,
>      .impl.min_access_size =3D 2,
>      .impl.max_access_size =3D 2,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void dp8393x_watchdog(void *opaque)
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index a023ceb..4605407 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -1341,7 +1341,7 @@ e1000_mmio_read(void *opaque, hwaddr addr, unsigned=
 size)
>  static const MemoryRegionOps e1000_mmio_ops =3D {
>      .read =3D e1000_mmio_read,
>      .write =3D e1000_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1368,7 +1368,7 @@ static void e1000_io_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps e1000_io_ops =3D {
>      .read =3D e1000_io_read,
>      .write =3D e1000_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static bool is_version_1(void *opaque, int version_id)
> diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
> index 581f7d0..abcd6d3 100644
> --- a/hw/net/e1000e.c
> +++ b/hw/net/e1000e.c
> @@ -179,7 +179,7 @@ e1000e_io_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps mmio_ops =3D {
>      .read =3D e1000e_mmio_read,
>      .write =3D e1000e_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -189,7 +189,7 @@ static const MemoryRegionOps mmio_ops =3D {
>  static const MemoryRegionOps io_ops =3D {
>      .read =3D e1000e_io_read,
>      .write =3D e1000e_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> index 6607c91..b0d3265 100644
> --- a/hw/net/eepro100.c
> +++ b/hw/net/eepro100.c
> @@ -1601,7 +1601,7 @@ static void eepro100_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps eepro100_ops =3D {
>      .read =3D eepro100_read,
>      .write =3D eepro100_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static ssize_t nic_receive(NetClientState *nc, const uint8_t * buf, size=
_t size)
> diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
> index 4cfbf11..f748f5e 100644
> --- a/hw/net/etraxfs_eth.c
> +++ b/hw/net/etraxfs_eth.c
> @@ -569,7 +569,7 @@ static void eth_set_link(NetClientState *nc)
>  static const MemoryRegionOps eth_ops =3D {
>      .read =3D eth_read,
>      .write =3D eth_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
> index 2a8b99a..9e5f1cb 100644
> --- a/hw/net/fsl_etsec/etsec.c
> +++ b/hw/net/fsl_etsec/etsec.c
> @@ -281,7 +281,7 @@ static void etsec_write(void     *opaque,
>  static const MemoryRegionOps etsec_ops =3D {
>      .read =3D etsec_read,
>      .write =3D etsec_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index d2cded5..6d0d6a4 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -979,7 +979,7 @@ static const MemoryRegionOps ftgmac100_ops =3D {
>      .write =3D ftgmac100_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void ftgmac100_cleanup(NetClientState *nc)
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 404154e..eaf73ef 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1278,7 +1278,7 @@ static const MemoryRegionOps imx_eth_ops =3D {
>      .write                 =3D imx_eth_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness            =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness            =3D MO_TE,
>  };
>=20
>  static void imx_eth_cleanup(NetClientState *nc)
> diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> index f6120be..f9b6801 100644
> --- a/hw/net/lan9118.c
> +++ b/hw/net/lan9118.c
> @@ -1304,13 +1304,13 @@ static uint64_t lan9118_16bit_mode_read(void *opa=
que, hwaddr offset,
>  static const MemoryRegionOps lan9118_mem_ops =3D {
>      .read =3D lan9118_readl,
>      .write =3D lan9118_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const MemoryRegionOps lan9118_16bit_mem_ops =3D {
>      .read =3D lan9118_16bit_mode_read,
>      .write =3D lan9118_16bit_mode_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static NetClientInfo net_lan9118_info =3D {
> diff --git a/hw/net/lance.c b/hw/net/lance.c
> index 2978c01..662e444 100644
> --- a/hw/net/lance.c
> +++ b/hw/net/lance.c
> @@ -74,7 +74,7 @@ static uint64_t lance_mem_read(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps lance_mem_ops =3D {
>      .read =3D lance_mem_read,
>      .write =3D lance_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 2,
>          .max_access_size =3D 2,
> diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
> index 78468fa..bf37375 100644
> --- a/hw/net/mcf_fec.c
> +++ b/hw/net/mcf_fec.c
> @@ -624,7 +624,7 @@ static ssize_t mcf_fec_receive(NetClientState *nc, co=
nst uint8_t *buf, size_t si
>  static const MemoryRegionOps mcf_fec_ops =3D {
>      .read =3D mcf_fec_read,
>      .write =3D mcf_fec_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static NetClientInfo net_mcf_fec_info =3D {
> diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
> index 41ef7a4..40aee51 100644
> --- a/hw/net/milkymist-minimac2.c
> +++ b/hw/net/milkymist-minimac2.c
> @@ -431,7 +431,7 @@ static const MemoryRegionOps minimac2_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void milkymist_minimac2_reset(DeviceState *d)
> diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
> index 1cf4b57..8fe407b 100644
> --- a/hw/net/ne2000.c
> +++ b/hw/net/ne2000.c
> @@ -686,7 +686,7 @@ static void ne2000_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps ne2000_ops =3D {
>      .read =3D ne2000_read,
>      .write =3D ne2000_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  /***********************************************************/
> diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
> index 600d09c..41bfa37 100644
> --- a/hw/net/pcnet-pci.c
> +++ b/hw/net/pcnet-pci.c
> @@ -137,7 +137,7 @@ static void pcnet_ioport_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps pcnet_io_ops =3D {
>      .read =3D pcnet_ioport_read,
>      .write =3D pcnet_ioport_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const VMStateDescription vmstate_pci_pcnet =3D {
> @@ -160,7 +160,7 @@ static const MemoryRegionOps pcnet_mmio_ops =3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void pci_physical_memory_write(void *dma_opaque, hwaddr addr,
> diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
> index bd54612..2fe64db 100644
> --- a/hw/net/rocker/rocker.c
> +++ b/hw/net/rocker/rocker.c
> @@ -1196,7 +1196,7 @@ static uint64_t rocker_mmio_read(void *opaque, hwad=
dr addr, unsigned size)
>  static const MemoryRegionOps rocker_mmio_ops =3D {
>      .read =3D rocker_mmio_read,
>      .write =3D rocker_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 8,
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index 0927317..f51bc7c 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -3311,7 +3311,7 @@ static const MemoryRegionOps rtl8139_io_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void rtl8139_timer(void *opaque)
> diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
> index 4a612ee..f7d53bf 100644
> --- a/hw/net/smc91c111.c
> +++ b/hw/net/smc91c111.c
> @@ -757,7 +757,7 @@ static const MemoryRegionOps smc91c111_mem_ops =3D {
>      .write =3D smc91c111_writefn,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static NetClientInfo net_smc91c111_info =3D {
> diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
> index 2f645bf..aac322d 100644
> --- a/hw/net/stellaris_enet.c
> +++ b/hw/net/stellaris_enet.c
> @@ -456,7 +456,7 @@ static void stellaris_enet_write(void *opaque, hwaddr=
 offset,
>  static const MemoryRegionOps stellaris_enet_ops =3D {
>      .read =3D stellaris_enet_read,
>      .write =3D stellaris_enet_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void stellaris_enet_reset(DeviceState *dev)
> diff --git a/hw/net/sungem.c b/hw/net/sungem.c
> index 89bcf74..549fd2d 100644
> --- a/hw/net/sungem.c
> +++ b/hw/net/sungem.c
> @@ -924,7 +924,7 @@ static uint64_t sungem_mmio_greg_read(void *opaque, h=
waddr addr, unsigned size)
>  static const MemoryRegionOps sungem_mmio_greg_ops =3D {
>      .read =3D sungem_mmio_greg_read,
>      .write =3D sungem_mmio_greg_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -993,7 +993,7 @@ static uint64_t sungem_mmio_txdma_read(void *opaque, =
hwaddr addr, unsigned size)
>  static const MemoryRegionOps sungem_mmio_txdma_ops =3D {
>      .read =3D sungem_mmio_txdma_read,
>      .write =3D sungem_mmio_txdma_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1066,7 +1066,7 @@ static uint64_t sungem_mmio_rxdma_read(void *opaque=
, hwaddr addr, unsigned size)
>  static const MemoryRegionOps sungem_mmio_rxdma_ops =3D {
>      .read =3D sungem_mmio_rxdma_read,
>      .write =3D sungem_mmio_rxdma_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1163,7 +1163,7 @@ static uint64_t sungem_mmio_mac_read(void *opaque, =
hwaddr addr, unsigned size)
>  static const MemoryRegionOps sungem_mmio_mac_ops =3D {
>      .read =3D sungem_mmio_mac_read,
>      .write =3D sungem_mmio_mac_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1229,7 +1229,7 @@ static uint64_t sungem_mmio_mif_read(void *opaque, =
hwaddr addr, unsigned size)
>  static const MemoryRegionOps sungem_mmio_mif_ops =3D {
>      .read =3D sungem_mmio_mif_read,
>      .write =3D sungem_mmio_mif_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1284,7 +1284,7 @@ static uint64_t sungem_mmio_pcs_read(void *opaque, =
hwaddr addr, unsigned size)
>  static const MemoryRegionOps sungem_mmio_pcs_ops =3D {
>      .read =3D sungem_mmio_pcs_read,
>      .write =3D sungem_mmio_pcs_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
> index 8b8603e..2df010d 100644
> --- a/hw/net/sunhme.c
> +++ b/hw/net/sunhme.c
> @@ -287,7 +287,7 @@ static uint64_t sunhme_seb_read(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps sunhme_seb_ops =3D {
>      .read =3D sunhme_seb_read,
>      .write =3D sunhme_seb_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -330,7 +330,7 @@ static uint64_t sunhme_etx_read(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps sunhme_etx_ops =3D {
>      .read =3D sunhme_etx_read,
>      .write =3D sunhme_etx_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -363,7 +363,7 @@ static uint64_t sunhme_erx_read(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps sunhme_erx_ops =3D {
>      .read =3D sunhme_erx_read,
>      .write =3D sunhme_erx_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -406,7 +406,7 @@ static uint64_t sunhme_mac_read(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps sunhme_mac_ops =3D {
>      .read =3D sunhme_mac_read,
>      .write =3D sunhme_mac_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -528,7 +528,7 @@ static uint64_t sunhme_mif_read(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps sunhme_mif_ops =3D {
>      .read =3D sunhme_mif_read,
>      .write =3D sunhme_mif_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 10d01d0..cc64b91 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -2159,7 +2159,7 @@ vmxnet3_msix_load(QEMUFile *f, void *opaque, int ve=
rsion_id)
>  static const MemoryRegionOps b0_ops =3D {
>      .read =3D vmxnet3_io_bar0_read,
>      .write =3D vmxnet3_io_bar0_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>              .min_access_size =3D 4,
>              .max_access_size =3D 4,
> @@ -2169,7 +2169,7 @@ static const MemoryRegionOps b0_ops =3D {
>  static const MemoryRegionOps b1_ops =3D {
>      .read =3D vmxnet3_io_bar1_read,
>      .write =3D vmxnet3_io_bar1_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>              .min_access_size =3D 4,
>              .max_access_size =3D 4,
> diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
> index f49df95..edcc4b2 100644
> --- a/hw/net/xgmac.c
> +++ b/hw/net/xgmac.c
> @@ -309,7 +309,7 @@ static void enet_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps enet_mem_ops =3D {
>      .read =3D enet_read,
>      .write =3D enet_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static int eth_can_rx(XgmacState *s)
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index feeaca6..4df665f 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -661,7 +661,7 @@ static void enet_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps enet_ops =3D {
>      .read =3D enet_read,
>      .write =3D enet_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static int eth_can_rx(XilinxAXIEnet *s)
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index 8f3a8f8..e1fb6b8 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -167,7 +167,7 @@ eth_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps eth_ops =3D {
>      .read =3D eth_read,
>      .write =3D eth_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
> index 2c3388f..112fe40 100644
> --- a/hw/nios2/10m50_devboard.c
> +++ b/hw/nios2/10m50_devboard.c
> @@ -91,7 +91,7 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
>=20
>      /* Register: Altera 16550 UART */
>      serial_mm_init(address_space_mem, 0xf8001600, 2, irq[1], 115200,
> -                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
> +                   serial_hd(0), MO_TE);
>=20
>      /* Register: Timer sys_clk_timer  */
>      dev =3D qdev_create(NULL, "ALTR.timer");
> diff --git a/hw/nvram/ds1225y.c b/hw/nvram/ds1225y.c
> index fd49283..7afeffa 100644
> --- a/hw/nvram/ds1225y.c
> +++ b/hw/nvram/ds1225y.c
> @@ -69,7 +69,7 @@ static const MemoryRegionOps nvram_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static int nvram_post_load(void *opaque, int version_id)
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index dcfd6d2..438e8d4 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -523,14 +523,14 @@ static bool fw_cfg_comb_valid(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps fw_cfg_ctl_mem_ops =3D {
>      .read =3D fw_cfg_ctl_mem_read,
>      .write =3D fw_cfg_ctl_mem_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid.accepts =3D fw_cfg_ctl_mem_valid,
>  };
>=20
>  static const MemoryRegionOps fw_cfg_data_mem_ops =3D {
>      .read =3D fw_cfg_data_read,
>      .write =3D fw_cfg_data_mem_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -541,14 +541,14 @@ static const MemoryRegionOps fw_cfg_data_mem_ops =
=3D {
>  static const MemoryRegionOps fw_cfg_comb_mem_ops =3D {
>      .read =3D fw_cfg_data_read,
>      .write =3D fw_cfg_comb_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid.accepts =3D fw_cfg_comb_valid,
>  };
>=20
>  static const MemoryRegionOps fw_cfg_dma_mem_ops =3D {
>      .read =3D fw_cfg_dma_mem_read,
>      .write =3D fw_cfg_dma_mem_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid.accepts =3D fw_cfg_dma_mem_valid,
>      .valid.max_access_size =3D 8,
>      .impl.max_access_size =3D 8,
> diff --git a/hw/nvram/mac_nvram.c b/hw/nvram/mac_nvram.c
> index a60426c..028d167 100644
> --- a/hw/nvram/mac_nvram.c
> +++ b/hw/nvram/mac_nvram.c
> @@ -76,7 +76,7 @@ static const MemoryRegionOps macio_nvram_ops =3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 1,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static const VMStateDescription vmstate_macio_nvram =3D {
> diff --git a/hw/nvram/nrf51_nvm.c b/hw/nvram/nrf51_nvm.c
> index eca0cb3..557b1d1 100644
> --- a/hw/nvram/nrf51_nvm.c
> +++ b/hw/nvram/nrf51_nvm.c
> @@ -96,7 +96,7 @@ static const MemoryRegionOps ficr_ops =3D {
>      .write =3D ficr_write,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN
> +    .endianness =3D MO_LE
>  };
>=20
>  /*
> @@ -189,7 +189,7 @@ static const MemoryRegionOps uicr_ops =3D {
>      .write =3D uicr_write,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN
> +    .endianness =3D MO_LE
>  };
>=20
>=20
> @@ -268,7 +268,7 @@ static const MemoryRegionOps io_ops =3D {
>          .write =3D io_write,
>          .impl.min_access_size =3D 4,
>          .impl.max_access_size =3D 4,
> -        .endianness =3D DEVICE_LITTLE_ENDIAN,
> +        .endianness =3D MO_LE,
>  };
>=20
>=20
> @@ -301,7 +301,7 @@ static const MemoryRegionOps flash_ops =3D {
>      .write =3D flash_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void nrf51_nvm_init(Object *obj)
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index b85f0df..e0de12b 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -164,7 +164,7 @@ static void openrisc_sim_init(MachineState *machine)
>      }
>=20
>      serial_mm_init(get_system_memory(), 0x90000000, 0, serial_irq,
> -                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
> +                   115200, serial_hd(0), MO_TE);
>=20
>      openrisc_load_kernel(ram_size, kernel_filename);
>  }
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index dde4437..1625118 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -311,7 +311,7 @@ static uint64_t bonito_readl(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps bonito_ops =3D {
>      .read =3D bonito_readl,
>      .write =3D bonito_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -344,7 +344,7 @@ static uint64_t bonito_pciconf_readl(void *opaque, hw=
addr addr,
>  static const MemoryRegionOps bonito_pciconf_ops =3D {
>      .read =3D bonito_pciconf_readl,
>      .write =3D bonito_pciconf_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -381,7 +381,7 @@ static void bonito_ldma_writel(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps bonito_ldma_ops =3D {
>      .read =3D bonito_ldma_readl,
>      .write =3D bonito_ldma_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -418,7 +418,7 @@ static void bonito_cop_writel(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps bonito_cop_ops =3D {
>      .read =3D bonito_cop_readl,
>      .write =3D bonito_cop_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -524,7 +524,7 @@ static const MemoryRegionOps bonito_spciconf_ops =3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  #define BONITO_IRQ_BASE 32
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 9ae8c0d..bf3ff13 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -75,7 +75,7 @@ static void designware_pcie_root_msi_write(void *opaque=
, hwaddr addr,
>=20
>  static const MemoryRegionOps designware_pci_host_msi_ops =3D {
>      .write =3D designware_pcie_root_msi_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -235,7 +235,7 @@ static void designware_pcie_root_data_write(void *opa=
que, hwaddr addr,
>  static const MemoryRegionOps designware_pci_host_conf_ops =3D {
>      .read =3D designware_pcie_root_data_read,
>      .write =3D designware_pcie_root_data_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
> @@ -620,7 +620,7 @@ static void designware_pcie_host_mmio_write(void *opa=
que, hwaddr addr,
>  static const MemoryRegionOps designware_pci_mmio_ops =3D {
>      .read       =3D designware_pcie_host_mmio_read,
>      .write      =3D designware_pcie_host_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index d9c70f7..c817fa5 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -691,7 +691,7 @@ static uint64_t rcr_read(void *opaque, hwaddr addr, u=
nsigned len)
>  static const MemoryRegionOps rcr_ops =3D {
>      .read =3D rcr_read,
>      .write =3D rcr_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN
> +    .endianness =3D MO_LE
>  };
>=20
>  static void piix3_realize(PCIDevice *dev, Error **errp)
> diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
> index 21eaa30..4c19008 100644
> --- a/hw/pci-host/ppce500.c
> +++ b/hw/pci-host/ppce500.c
> @@ -338,7 +338,7 @@ static void pci_reg_write4(void *opaque, hwaddr addr,
>  static const MemoryRegionOps e500_pci_reg_ops =3D {
>      .read =3D pci_reg_read4,
>      .write =3D pci_reg_write4,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static int mpc85xx_pci_map_irq(PCIDevice *pci_dev, int pin)
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index c564f23..bf94693 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -108,7 +108,7 @@ static uint64_t raven_pci_io_read(void *opaque, hwadd=
r addr,
>  static const MemoryRegionOps raven_pci_io_ops =3D {
>      .read =3D raven_pci_io_read,
>      .write =3D raven_pci_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t raven_intack_read(void *opaque, hwaddr addr,
> @@ -186,7 +186,7 @@ static void raven_io_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps raven_io_ops =3D {
>      .read =3D raven_io_read,
>      .write =3D raven_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl.max_access_size =3D 4,
>      .valid.unaligned =3D true,
>  };
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 0a010be..27f39eb 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -288,12 +288,12 @@ static void tseg_blackhole_write(void *opaque, hwad=
dr addr, uint64_t val,
>  static const MemoryRegionOps tseg_blackhole_ops =3D {
>      .read =3D tseg_blackhole_read,
>      .write =3D tseg_blackhole_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  /* PCIe MMCFG */
> diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c
> index 2cec111..de12397 100644
> --- a/hw/pci-host/sabre.c
> +++ b/hw/pci-host/sabre.c
> @@ -247,7 +247,7 @@ static uint64_t sabre_config_read(void *opaque,
>  static const MemoryRegionOps sabre_config_ops =3D {
>      .read =3D sabre_config_read,
>      .write =3D sabre_config_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void sabre_pci_config_write(void *opaque, hwaddr addr,
> @@ -368,7 +368,7 @@ static void sabre_reset(DeviceState *d)
>  static const MemoryRegionOps pci_config_ops =3D {
>      .read =3D sabre_pci_config_read,
>      .write =3D sabre_pci_config_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void sabre_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
> index 680fefd..0a51d2b 100644
> --- a/hw/pci-host/uninorth.c
> +++ b/hw/pci-host/uninorth.c
> @@ -108,7 +108,7 @@ static uint64_t unin_data_read(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps unin_data_ops =3D {
>      .read =3D unin_data_read,
>      .write =3D unin_data_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void pci_unin_init_irqs(UNINHostState *s)
> @@ -564,7 +564,7 @@ static uint64_t unin_read(void *opaque, hwaddr addr, =
unsigned size)
>  static const MemoryRegionOps unin_ops =3D {
>      .read =3D unin_read,
>      .write =3D unin_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void unin_init(Object *obj)
> diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
> index 791b321..1310f0c 100644
> --- a/hw/pci-host/versatile.c
> +++ b/hw/pci-host/versatile.c
> @@ -240,7 +240,7 @@ static uint64_t pci_vpb_reg_read(void *opaque, hwaddr=
 addr,
>  static const MemoryRegionOps pci_vpb_reg_ops =3D {
>      .read =3D pci_vpb_reg_read,
>      .write =3D pci_vpb_reg_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -306,7 +306,7 @@ static uint64_t pci_vpb_config_read(void *opaque, hwa=
ddr addr,
>  static const MemoryRegionOps pci_vpb_config_ops =3D {
>      .read =3D pci_vpb_config_read,
>      .write =3D pci_vpb_config_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static int pci_vpb_map_irq(PCIDevice *d, int irq_num)
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index d39dcf3..e9acb1e 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -195,7 +195,7 @@ static void msix_table_mmio_write(void *opaque, hwadd=
r addr,
>  static const MemoryRegionOps msix_table_mmio_ops =3D {
>      .read =3D msix_table_mmio_read,
>      .write =3D msix_table_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -223,7 +223,7 @@ static void msix_pba_mmio_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps msix_pba_mmio_ops =3D {
>      .read =3D msix_pba_mmio_read,
>      .write =3D msix_pba_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> index c5f9244..fc1b837 100644
> --- a/hw/pci/pci_host.c
> +++ b/hw/pci/pci_host.c
> @@ -190,25 +190,25 @@ static uint64_t pci_host_data_read(void *opaque,
>  const MemoryRegionOps pci_host_conf_le_ops =3D {
>      .read =3D pci_host_config_read,
>      .write =3D pci_host_config_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  const MemoryRegionOps pci_host_conf_be_ops =3D {
>      .read =3D pci_host_config_read,
>      .write =3D pci_host_config_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  const MemoryRegionOps pci_host_data_le_ops =3D {
>      .read =3D pci_host_data_read,
>      .write =3D pci_host_data_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  const MemoryRegionOps pci_host_data_be_ops =3D {
>      .read =3D pci_host_data_read,
>      .write =3D pci_host_data_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static const TypeInfo pci_host_type_info =3D {
> diff --git a/hw/pci/pcie_host.c b/hw/pci/pcie_host.c
> index d6768b8..5e120dc 100644
> --- a/hw/pci/pcie_host.c
> +++ b/hw/pci/pcie_host.c
> @@ -72,7 +72,7 @@ static uint64_t pcie_mmcfg_data_read(void *opaque,
>  static const MemoryRegionOps pcie_mmcfg_ops =3D {
>      .read =3D pcie_mmcfg_data_read,
>      .write =3D pcie_mmcfg_data_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void pcie_host_init(Object *obj)
> diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
> index 5a10c6e..6c56edb 100644
> --- a/hw/pci/shpc.c
> +++ b/hw/pci/shpc.c
> @@ -477,7 +477,7 @@ static void shpc_mmio_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps shpc_mmio_ops =3D {
>      .read =3D shpc_mmio_read,
>      .write =3D shpc_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          /* SHPC ECN requires dword accesses, but the original 1.0 spec d=
oesn't.
>           * It's easier to suppport all sizes than worry about it. */
> diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c
> index 8993b78..4d7002e 100644
> --- a/hw/pcmcia/pxa2xx.c
> +++ b/hw/pcmcia/pxa2xx.c
> @@ -117,19 +117,19 @@ static void pxa2xx_pcmcia_io_write(void *opaque, hw=
addr offset,
>  static const MemoryRegionOps pxa2xx_pcmcia_common_ops =3D {
>      .read =3D pxa2xx_pcmcia_common_read,
>      .write =3D pxa2xx_pcmcia_common_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN
> +    .endianness =3D MO_TE
>  };
>=20
>  static const MemoryRegionOps pxa2xx_pcmcia_attr_ops =3D {
>      .read =3D pxa2xx_pcmcia_attr_read,
>      .write =3D pxa2xx_pcmcia_attr_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN
> +    .endianness =3D MO_TE
>  };
>=20
>  static const MemoryRegionOps pxa2xx_pcmcia_io_ops =3D {
>      .read =3D pxa2xx_pcmcia_io_read,
>      .write =3D pxa2xx_pcmcia_io_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN
> +    .endianness =3D MO_TE
>  };
>=20
>  static void pxa2xx_pcmcia_set_irq(void *opaque, int line, int level)
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index a3eac7f..d1f3749 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -927,13 +927,13 @@ void ppce500_init(MachineState *machine)
>      if (serial_hd(0)) {
>          serial_mm_init(ccsr_addr_space, MPC8544_SERIAL0_REGS_OFFSET,
>                         0, qdev_get_gpio_in(mpicdev, 42), 399193,
> -                       serial_hd(0), DEVICE_BIG_ENDIAN);
> +                       serial_hd(0), MO_BE);
>      }
>=20
>      if (serial_hd(1)) {
>          serial_mm_init(ccsr_addr_space, MPC8544_SERIAL1_REGS_OFFSET,
>                         0, qdev_get_gpio_in(mpicdev, 42), 399193,
> -                       serial_hd(1), DEVICE_BIG_ENDIAN);
> +                       serial_hd(1), MO_BE);
>      }
>          /* I2C */
>      dev =3D qdev_create(NULL, "mpc-i2c");
> diff --git a/hw/ppc/mpc8544_guts.c b/hw/ppc/mpc8544_guts.c
> index 2b7cc14..758d4ae 100644
> --- a/hw/ppc/mpc8544_guts.c
> +++ b/hw/ppc/mpc8544_guts.c
> @@ -111,7 +111,7 @@ static void mpc8544_guts_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps mpc8544_guts_ops =3D {
>      .read =3D mpc8544_guts_read,
>      .write =3D mpc8544_guts_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
> index c6411ec..ff06eef 100644
> --- a/hw/ppc/pnv_core.c
> +++ b/hw/ppc/pnv_core.c
> @@ -98,7 +98,7 @@ static const MemoryRegionOps pnv_core_power8_xscom_ops =
=3D {
>      .valid.max_access_size =3D 8,
>      .impl.min_access_size =3D 8,
>      .impl.max_access_size =3D 8,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>=20
> @@ -156,7 +156,7 @@ static const MemoryRegionOps pnv_core_power9_xscom_op=
s =3D {
>      .valid.max_access_size =3D 8,
>      .impl.min_access_size =3D 8,
>      .impl.max_access_size =3D 8,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void pnv_realize_vcpu(PowerPCCPU *cpu, PnvChip *chip, Error **err=
p)
> @@ -377,7 +377,7 @@ static const MemoryRegionOps pnv_quad_xscom_ops =3D {
>      .valid.max_access_size =3D 8,
>      .impl.min_access_size =3D 8,
>      .impl.max_access_size =3D 8,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void pnv_quad_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
> index a9f150c..503e5a5 100644
> --- a/hw/ppc/pnv_lpc.c
> +++ b/hw/ppc/pnv_lpc.c
> @@ -336,7 +336,7 @@ static const MemoryRegionOps pnv_lpc_xscom_ops =3D {
>      .valid.max_access_size =3D 8,
>      .impl.min_access_size =3D 8,
>      .impl.max_access_size =3D 8,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static uint64_t pnv_lpc_mmio_read(void *opaque, hwaddr addr, unsigned si=
ze)
> @@ -404,7 +404,7 @@ static const MemoryRegionOps pnv_lpc_mmio_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void pnv_lpc_eval_irqs(PnvLpcController *lpc)
> @@ -507,7 +507,7 @@ static void lpc_hc_write(void *opaque, hwaddr addr, u=
int64_t val,
>  static const MemoryRegionOps lpc_hc_ops =3D {
>      .read =3D lpc_hc_read,
>      .write =3D lpc_hc_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -586,7 +586,7 @@ static void opb_master_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps opb_master_ops =3D {
>      .read =3D opb_master_read,
>      .write =3D opb_master_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/ppc/pnv_occ.c b/hw/ppc/pnv_occ.c
> index 636f91f..78a2a0b 100644
> --- a/hw/ppc/pnv_occ.c
> +++ b/hw/ppc/pnv_occ.c
> @@ -91,7 +91,7 @@ static const MemoryRegionOps pnv_occ_power8_xscom_ops =
=3D {
>      .valid.max_access_size =3D 8,
>      .impl.min_access_size =3D 8,
>      .impl.max_access_size =3D 8,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void pnv_occ_power8_class_init(ObjectClass *klass, void *data)
> @@ -162,7 +162,7 @@ static const MemoryRegionOps pnv_occ_power9_xscom_ops=
 =3D {
>      .valid.max_access_size =3D 8,
>      .impl.min_access_size =3D 8,
>      .impl.max_access_size =3D 8,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void pnv_occ_power9_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
> index d7b6f5d..3e1946c 100644
> --- a/hw/ppc/pnv_psi.c
> +++ b/hw/ppc/pnv_psi.c
> @@ -417,7 +417,7 @@ static void pnv_psi_mmio_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps psi_mmio_ops =3D {
>      .read =3D pnv_psi_mmio_read,
>      .write =3D pnv_psi_mmio_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> @@ -442,7 +442,7 @@ static void pnv_psi_xscom_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps pnv_psi_xscom_ops =3D {
>      .read =3D pnv_psi_xscom_read,
>      .write =3D pnv_psi_xscom_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> @@ -737,7 +737,7 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwadd=
r addr,
>  static const MemoryRegionOps pnv_psi_p9_mmio_ops =3D {
>      .read =3D pnv_psi_p9_mmio_read,
>      .write =3D pnv_psi_p9_mmio_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> @@ -774,7 +774,7 @@ static void pnv_psi_p9_xscom_write(void *opaque, hwad=
dr addr,
>  static const MemoryRegionOps pnv_psi_p9_xscom_ops =3D {
>      .read =3D pnv_psi_p9_xscom_read,
>      .write =3D pnv_psi_p9_xscom_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>      .valid =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
> index 2b81c75..7c93228 100644
> --- a/hw/ppc/pnv_xscom.c
> +++ b/hw/ppc/pnv_xscom.c
> @@ -210,7 +210,7 @@ const MemoryRegionOps pnv_xscom_ops =3D {
>      .valid.max_access_size =3D 8,
>      .impl.min_access_size =3D 8,
>      .impl.max_access_size =3D 8,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp)
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 13318a9..672c664 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -110,7 +110,7 @@ static const MemoryRegionOps ref405ep_fpga_ops =3D {
>      .impl.max_access_size =3D 1,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void ref405ep_fpga_reset (void *opaque)
> @@ -382,7 +382,7 @@ static const MemoryRegionOps taihu_cpld_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void taihu_cpld_reset (void *opaque)
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index edb6b2d..3e6c8fd 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -334,7 +334,7 @@ static const MemoryRegionOps opba_ops =3D {
>      .impl.max_access_size =3D 1,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void ppc4xx_opba_reset (void *opaque)
> @@ -723,7 +723,7 @@ static void ppc405_gpio_write(void *opaque, hwaddr ad=
dr, uint64_t value,
>  static const MemoryRegionOps ppc405_gpio_ops =3D {
>      .read =3D ppc405_gpio_read,
>      .write =3D ppc405_gpio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void ppc405_gpio_reset (void *opaque)
> @@ -1105,7 +1105,7 @@ static const MemoryRegionOps gpt_ops =3D {
>      .write =3D ppc4xx_gpt_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void ppc4xx_gpt_cb (void *opaque)
> @@ -1482,12 +1482,12 @@ CPUPPCState *ppc405cr_init(MemoryRegion *address_=
space_mem,
>      if (serial_hd(0) !=3D NULL) {
>          serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
>                         PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
> -                       DEVICE_BIG_ENDIAN);
> +                       MO_BE);
>      }
>      if (serial_hd(1) !=3D NULL) {
>          serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
>                         PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
> -                       DEVICE_BIG_ENDIAN);
> +                       MO_BE);
>      }
>      /* IIC controller */
>      sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500, pic[2]);
> @@ -1845,12 +1845,12 @@ CPUPPCState *ppc405ep_init(MemoryRegion *address_=
space_mem,
>      if (serial_hd(0) !=3D NULL) {
>          serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
>                         PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
> -                       DEVICE_BIG_ENDIAN);
> +                       MO_BE);
>      }
>      if (serial_hd(1) !=3D NULL) {
>          serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
>                         PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
> -                       DEVICE_BIG_ENDIAN);
> +                       MO_BE);
>      }
>      /* OCM */
>      ppc405_ocm_init(env);
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index b4da099..c5904aa 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -234,12 +234,12 @@ static void bamboo_init(MachineState *machine)
>      if (serial_hd(0) !=3D NULL) {
>          serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
>                         PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
> -                       DEVICE_BIG_ENDIAN);
> +                       MO_BE);
>      }
>      if (serial_hd(1) !=3D NULL) {
>          serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
>                         PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
> -                       DEVICE_BIG_ENDIAN);
> +                       MO_BE);
>      }
>=20
>      if (pcibus) {
> diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
> index ca54631..a6e7280 100644
> --- a/hw/ppc/ppc440_pcix.c
> +++ b/hw/ppc/ppc440_pcix.c
> @@ -393,7 +393,7 @@ static uint64_t ppc440_pcix_reg_read4(void *opaque, h=
waddr addr,
>  static const MemoryRegionOps pci_reg_ops =3D {
>      .read =3D ppc440_pcix_reg_read4,
>      .write =3D ppc440_pcix_reg_write4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void ppc440_pcix_reset(DeviceState *dev)
> @@ -464,7 +464,7 @@ static uint64_t pci_host_data_read(void *opaque,
>  const MemoryRegionOps ppc440_pcix_host_data_ops =3D {
>      .read =3D pci_host_data_read,
>      .write =3D pci_host_data_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void ppc440_pcix_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index e7cf8d5..ceca956 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -227,7 +227,7 @@ static uint64_t ppc4xx_pci_reg_read4(void *opaque, hw=
addr offset,
>  static const MemoryRegionOps pci_reg_ops =3D {
>      .read =3D ppc4xx_pci_reg_read4,
>      .write =3D ppc4xx_pci_reg_write4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void ppc4xx_pci_reset(void *opaque)
> diff --git a/hw/ppc/ppce500_spin.c b/hw/ppc/ppce500_spin.c
> index 0060fcb..d4fa92f 100644
> --- a/hw/ppc/ppce500_spin.c
> +++ b/hw/ppc/ppce500_spin.c
> @@ -173,7 +173,7 @@ static uint64_t spin_read(void *opaque, hwaddr addr, =
unsigned len)
>  static const MemoryRegionOps spin_rw_ops =3D {
>      .read =3D spin_read,
>      .write =3D spin_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void ppce500_spin_initfn(Object *obj)
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index fbcddc5..b0a22ed 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -412,12 +412,12 @@ static void sam460ex_init(MachineState *machine)
>      if (serial_hd(0) !=3D NULL) {
>          serial_mm_init(address_space_mem, 0x4ef600300, 0, uic[1][1],
>                         PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
> -                       DEVICE_BIG_ENDIAN);
> +                       MO_BE);
>      }
>      if (serial_hd(1) !=3D NULL) {
>          serial_mm_init(address_space_mem, 0x4ef600400, 0, uic[0][1],
>                         PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
> -                       DEVICE_BIG_ENDIAN);
> +                       MO_BE);
>      }
>=20
>      /* Load U-Boot image. */
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 9003fe9..16df70c 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -763,7 +763,7 @@ static const MemoryRegionOps spapr_msi_ops =3D {
>      /* There is no .read as the read result is undefined by PCI spec */
>      .read =3D NULL,
>      .write =3D spapr_msi_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN
> +    .endianness =3D MO_LE
>  };
>=20
>  /*
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 834053a..9f8a73c 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -242,7 +242,7 @@ static void virtex_init(MachineState *machine)
>      }
>=20
>      serial_mm_init(address_space_mem, UART16550_BASEADDR, 2, irq[UART165=
50_IRQ],
> -                   115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +                   115200, serial_hd(0), MO_LE);
>=20
>      /* 2 timers at irq 2 @ 62 Mhz.  */
>      dev =3D qdev_create(NULL, "xlnx.xps-timer");
> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> index adcf79c..fb09241 100644
> --- a/hw/rdma/vmw/pvrdma_main.c
> +++ b/hw/rdma/vmw/pvrdma_main.c
> @@ -439,7 +439,7 @@ static void pvrdma_regs_write(void *opaque, hwaddr ad=
dr, uint64_t val,
>  static const MemoryRegionOps regs_ops =3D {
>      .read =3D pvrdma_regs_read,
>      .write =3D pvrdma_regs_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D sizeof(uint32_t),
>          .max_access_size =3D sizeof(uint32_t),
> @@ -507,7 +507,7 @@ static void pvrdma_uar_write(void *opaque, hwaddr add=
r, uint64_t val,
>  static const MemoryRegionOps uar_ops =3D {
>      .read =3D pvrdma_uar_read,
>      .write =3D pvrdma_uar_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D sizeof(uint32_t),
>          .max_access_size =3D sizeof(uint32_t),
> diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
> index 591d70d..7ab6d79 100644
> --- a/hw/riscv/sifive_clint.c
> +++ b/hw/riscv/sifive_clint.c
> @@ -176,7 +176,7 @@ static void sifive_clint_write(void *opaque, hwaddr a=
ddr, uint64_t value,
>  static const MemoryRegionOps sifive_clint_ops =3D {
>      .read =3D sifive_clint_read,
>      .write =3D sifive_clint_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/riscv/sifive_gpio.c b/hw/riscv/sifive_gpio.c
> index 06bd811..61c7103 100644
> --- a/hw/riscv/sifive_gpio.c
> +++ b/hw/riscv/sifive_gpio.c
> @@ -272,7 +272,7 @@ static void sifive_gpio_write(void *opaque, hwaddr of=
fset,
>  static const MemoryRegionOps gpio_ops =3D {
>      .read =3D  sifive_gpio_read,
>      .write =3D sifive_gpio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
>  };
> diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
> index 0950e89..5f156e8 100644
> --- a/hw/riscv/sifive_plic.c
> +++ b/hw/riscv/sifive_plic.c
> @@ -354,7 +354,7 @@ err:
>  static const MemoryRegionOps sifive_plic_ops =3D {
>      .read =3D sifive_plic_read,
>      .write =3D sifive_plic_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c
> index f406682..6dc1461 100644
> --- a/hw/riscv/sifive_prci.c
> +++ b/hw/riscv/sifive_prci.c
> @@ -73,7 +73,7 @@ static void sifive_prci_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps sifive_prci_ops =3D {
>      .read =3D sifive_prci_read,
>      .write =3D sifive_prci_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
> index 24a04d7..a7a8e73 100644
> --- a/hw/riscv/sifive_test.c
> +++ b/hw/riscv/sifive_test.c
> @@ -51,7 +51,7 @@ static void sifive_test_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps sifive_test_ops =3D {
>      .read =3D sifive_test_read,
>      .write =3D sifive_test_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
> index 3b3f94f..fa1ba98 100644
> --- a/hw/riscv/sifive_uart.c
> +++ b/hw/riscv/sifive_uart.c
> @@ -132,7 +132,7 @@ uart_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps uart_ops =3D {
>      .read =3D uart_read,
>      .write =3D uart_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 25faf3b..3283954 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -502,7 +502,7 @@ static void riscv_virt_board_init(MachineState *machi=
ne)
>=20
>      serial_mm_init(system_memory, memmap[VIRT_UART0].base,
>          0, qdev_get_gpio_in(DEVICE(s->plic), UART0_IRQ), 399193,
> -        serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +        serial_hd(0), MO_LE);
>=20
>      g_free(plic_hart_config);
>  }
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 2c6e084..451c279 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -689,7 +689,7 @@ static uint64_t s390_msi_ctrl_read(void *opaque, hwad=
dr addr, unsigned size)
>  static const MemoryRegionOps s390_msi_ctrl_ops =3D {
>      .write =3D s390_msi_ctrl_write,
>      .read =3D s390_msi_ctrl_read,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  void s390_pci_iommu_enable(S390PCIIOMMU *iommu)
> diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
> index 342f500..e7804a8 100644
> --- a/hw/scsi/esp-pci.c
> +++ b/hw/scsi/esp-pci.c
> @@ -291,7 +291,7 @@ static void esp_pci_dma_memory_write(void *opaque, ui=
nt8_t *buf, int len)
>  static const MemoryRegionOps esp_pci_io_ops =3D {
>      .read =3D esp_pci_io_read,
>      .write =3D esp_pci_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 7508d03..fec501c 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -635,7 +635,7 @@ static uint64_t sysbus_esp_mem_read(void *opaque, hwa=
ddr addr,
>  static const MemoryRegionOps sysbus_esp_mem_ops =3D {
>      .read =3D sysbus_esp_mem_read,
>      .write =3D sysbus_esp_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid.accepts =3D esp_mem_accepts,
>  };
>=20
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index 10468c1..7e17555 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -2091,7 +2091,7 @@ static uint64_t lsi_mmio_read(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps lsi_mmio_ops =3D {
>      .read =3D lsi_mmio_read,
>      .write =3D lsi_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -2115,7 +2115,7 @@ static uint64_t lsi_ram_read(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps lsi_ram_ops =3D {
>      .read =3D lsi_ram_read,
>      .write =3D lsi_ram_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t lsi_io_read(void *opaque, hwaddr addr,
> @@ -2135,7 +2135,7 @@ static void lsi_io_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps lsi_io_ops =3D {
>      .read =3D lsi_io_read,
>      .write =3D lsi_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index 0c43999..f06b7c6 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -2153,7 +2153,7 @@ static void megasas_mmio_write(void *opaque, hwaddr=
 addr,
>  static const MemoryRegionOps megasas_mmio_ops =3D {
>      .read =3D megasas_mmio_read,
>      .write =3D megasas_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> @@ -2175,7 +2175,7 @@ static void megasas_port_write(void *opaque, hwaddr=
 addr,
>  static const MemoryRegionOps megasas_port_ops =3D {
>      .read =3D megasas_port_read,
>      .write =3D megasas_port_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -2197,7 +2197,7 @@ static void megasas_queue_write(void *opaque, hwadd=
r addr,
>  static const MemoryRegionOps megasas_queue_ops =3D {
>      .read =3D megasas_queue_read,
>      .write =3D megasas_queue_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 8,
>          .max_access_size =3D 8,
> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> index 3f94d5a..c3d8144 100644
> --- a/hw/scsi/mptsas.c
> +++ b/hw/scsi/mptsas.c
> @@ -1085,7 +1085,7 @@ static void mptsas_mmio_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps mptsas_mmio_ops =3D {
>      .read =3D mptsas_mmio_read,
>      .write =3D mptsas_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1095,7 +1095,7 @@ static const MemoryRegionOps mptsas_mmio_ops =3D {
>  static const MemoryRegionOps mptsas_port_ops =3D {
>      .read =3D mptsas_mmio_read,
>      .write =3D mptsas_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -1120,7 +1120,7 @@ static void mptsas_diag_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps mptsas_diag_ops =3D {
>      .read =3D mptsas_diag_read,
>      .write =3D mptsas_diag_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
> index 14641df..9600846 100644
> --- a/hw/scsi/vmw_pvscsi.c
> +++ b/hw/scsi/vmw_pvscsi.c
> @@ -1086,7 +1086,7 @@ pvscsi_cleanup_msi(PVSCSIState *s)
>  static const MemoryRegionOps pvscsi_ops =3D {
>          .read =3D pvscsi_io_read,
>          .write =3D pvscsi_io_write,
> -        .endianness =3D DEVICE_LITTLE_ENDIAN,
> +        .endianness =3D MO_LE,
>          .impl =3D {
>                  .min_access_size =3D 4,
>                  .max_access_size =3D 4,
> diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
> index 2778fb0..f799c37 100644
> --- a/hw/sd/bcm2835_sdhost.c
> +++ b/hw/sd/bcm2835_sdhost.c
> @@ -370,7 +370,7 @@ static void bcm2835_sdhost_write(void *opaque, hwaddr=
 offset,
>  static const MemoryRegionOps bcm2835_sdhost_ops =3D {
>      .read =3D bcm2835_sdhost_read,
>      .write =3D bcm2835_sdhost_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_bcm2835_sdhost =3D {
> diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
> index b8d2347..52e3037 100644
> --- a/hw/sd/milkymist-memcard.c
> +++ b/hw/sd/milkymist-memcard.c
> @@ -236,7 +236,7 @@ static const MemoryRegionOps memcard_mmio_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void milkymist_memcard_reset(DeviceState *d)
> diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
> index d0c98ca..9a9626d 100644
> --- a/hw/sd/omap_mmc.c
> +++ b/hw/sd/omap_mmc.c
> @@ -570,7 +570,7 @@ static void omap_mmc_write(void *opaque, hwaddr offse=
t,
>  static const MemoryRegionOps omap_mmc_ops =3D {
>      .read =3D omap_mmc_read,
>      .write =3D omap_mmc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void omap_mmc_cover_cb(void *opaque, int line, int level)
> diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
> index 81b406d..7c632b1 100644
> --- a/hw/sd/pl181.c
> +++ b/hw/sd/pl181.c
> @@ -449,7 +449,7 @@ static void pl181_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps pl181_ops =3D {
>      .read =3D pl181_read,
>      .write =3D pl181_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pl181_reset(DeviceState *d)
> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
> index 81ff5ce..c9ffeb9 100644
> --- a/hw/sd/pxa2xx_mmci.c
> +++ b/hw/sd/pxa2xx_mmci.c
> @@ -472,7 +472,7 @@ static void pxa2xx_mmci_write(void *opaque,
>  static const MemoryRegionOps pxa2xx_mmci_ops =3D {
>      .read =3D pxa2xx_mmci_read,
>      .write =3D pxa2xx_mmci_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 7b80b1d..664dcf3 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1286,7 +1286,7 @@ static const MemoryRegionOps sdhci_mmio_ops =3D {
>          .max_access_size =3D 4,
>          .unaligned =3D false
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
> @@ -1741,7 +1741,7 @@ static const MemoryRegionOps usdhc_mmio_ops =3D {
>          .max_access_size =3D 4,
>          .unaligned =3D false
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void imx_usdhc_init(Object *obj)
> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> index f22c79c..1e7d693 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -176,7 +176,7 @@ static const MemoryRegionOps r2d_fpga_ops =3D {
>      .write =3D r2d_fpga_write,
>      .impl.min_access_size =3D 2,
>      .impl.max_access_size =3D 2,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static qemu_irq *r2d_fpga_init(MemoryRegion *sysmem,
> diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
> index 2fb6e61..20f5816 100644
> --- a/hw/sh4/sh7750.c
> +++ b/hw/sh4/sh7750.c
> @@ -487,7 +487,7 @@ static const MemoryRegionOps sh7750_mem_ops =3D {
>      .write =3D sh7750_mem_writefn,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  /* sh775x interrupt controller tables for sh_intc.c
> @@ -748,7 +748,7 @@ static void sh7750_mmct_write(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps sh7750_mmct_ops =3D {
>      .read =3D sh7750_mmct_read,
>      .write =3D sh7750_mmct_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
> diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
> index b15f264..4006210 100644
> --- a/hw/sh4/sh_pci.c
> +++ b/hw/sh4/sh_pci.c
> @@ -103,7 +103,7 @@ static uint64_t sh_pci_reg_read (void *p, hwaddr addr,
>  static const MemoryRegionOps sh_pci_reg_ops =3D {
>      .read =3D sh_pci_reg_read,
>      .write =3D sh_pci_reg_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/sparc/sun4m_iommu.c b/hw/sparc/sun4m_iommu.c
> index 45a61ec..61a7493 100644
> --- a/hw/sparc/sun4m_iommu.c
> +++ b/hw/sparc/sun4m_iommu.c
> @@ -235,7 +235,7 @@ static void iommu_mem_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps iommu_mem_ops =3D {
>      .read =3D iommu_mem_read,
>      .write =3D iommu_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
> index dc0ce7e..dc5bb11 100644
> --- a/hw/sparc64/niagara.c
> +++ b/hw/sparc64/niagara.c
> @@ -158,7 +158,7 @@ static void niagara_init(MachineState *machine)
>      }
>      if (serial_hd(0)) {
>          serial_mm_init(sysmem, NIAGARA_UART_BASE, 0, NULL, 115200,
> -                       serial_hd(0), DEVICE_BIG_ENDIAN);
> +                       serial_hd(0), MO_BE);
>      }
>      create_unimplemented_device("sun4v-iob", NIAGARA_IOBBASE, NIAGARA_IO=
BSIZE);
>      sun4v_rtc_init(NIAGARA_RTC_BASE);
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index 5d87be8..9016271 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -249,7 +249,7 @@ static void power_mem_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps power_mem_ops =3D {
>      .read =3D power_mem_read,
>      .write =3D power_mem_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> @@ -320,7 +320,7 @@ static void ebus_realize(PCIDevice *pci_dev, Error **=
errp)
>      i =3D 0;
>      if (s->console_serial_base) {
>          serial_mm_init(pci_address_space(pci_dev), s->console_serial_bas=
e,
> -                       0, NULL, 115200, serial_hd(i), DEVICE_BIG_ENDIAN);
> +                       0, NULL, 115200, serial_hd(i), MO_BE);
>          i++;
>      }
>      serial_hds_isa_init(s->isa_bus, i, MAX_ISA_SERIAL_PORTS);
> diff --git a/hw/sparc64/sun4u_iommu.c b/hw/sparc64/sun4u_iommu.c
> index 9178277..5073098 100644
> --- a/hw/sparc64/sun4u_iommu.c
> +++ b/hw/sparc64/sun4u_iommu.c
> @@ -280,7 +280,7 @@ static uint64_t iommu_mem_read(void *opaque, hwaddr a=
ddr, unsigned size)
>  static const MemoryRegionOps iommu_mem_ops =3D {
>      .read =3D iommu_mem_read,
>      .write =3D iommu_mem_write,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static void iommu_reset(DeviceState *d)
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 81f2fb7..fc33c80 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -399,7 +399,7 @@ static void aspeed_smc_flash_default_write(void *opaq=
ue, hwaddr addr,
>  static const MemoryRegionOps aspeed_smc_flash_default_ops =3D {
>      .read =3D aspeed_smc_flash_default_read,
>      .write =3D aspeed_smc_flash_default_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
> @@ -707,7 +707,7 @@ static void aspeed_smc_flash_write(void *opaque, hwad=
dr addr, uint64_t data,
>  static const MemoryRegionOps aspeed_smc_flash_ops =3D {
>      .read =3D aspeed_smc_flash_read,
>      .write =3D aspeed_smc_flash_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
> @@ -818,7 +818,7 @@ static void aspeed_smc_write(void *opaque, hwaddr add=
r, uint64_t data,
>  static const MemoryRegionOps aspeed_smc_ops =3D {
>      .read =3D aspeed_smc_read,
>      .write =3D aspeed_smc_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid.unaligned =3D true,
>  };
>=20
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 5cec9b5..9b4ec27 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -397,7 +397,7 @@ static void imx_spi_write(void *opaque, hwaddr offset=
, uint64_t value,
>  static const struct MemoryRegionOps imx_spi_ops =3D {
>      .read =3D imx_spi_read,
>      .write =3D imx_spi_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
> index 4c9da5d..ecba086 100644
> --- a/hw/ssi/mss-spi.c
> +++ b/hw/ssi/mss-spi.c
> @@ -359,7 +359,7 @@ static void spi_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps spi_ops =3D {
>      .read =3D spi_read,
>      .write =3D spi_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4
> diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
> index f278a55..749c2ea 100644
> --- a/hw/ssi/omap_spi.c
> +++ b/hw/ssi/omap_spi.c
> @@ -342,7 +342,7 @@ static void omap_mcspi_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps omap_mcspi_ops =3D {
>      .read =3D omap_mcspi_read,
>      .write =3D omap_mcspi_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  struct omap_mcspi_s *omap_mcspi_init(struct omap_target_agent_s *ta, int=
 chnum,
> diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
> index fec73ca..9cd9194 100644
> --- a/hw/ssi/pl022.c
> +++ b/hw/ssi/pl022.c
> @@ -226,7 +226,7 @@ static void pl022_reset(DeviceState *dev)
>  static const MemoryRegionOps pl022_ops =3D {
>      .read =3D pl022_read,
>      .write =3D pl022_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static int pl022_post_load(void *opaque, int version_id)
> diff --git a/hw/ssi/stm32f2xx_spi.c b/hw/ssi/stm32f2xx_spi.c
> index 4249101..4f465f4 100644
> --- a/hw/ssi/stm32f2xx_spi.c
> +++ b/hw/ssi/stm32f2xx_spi.c
> @@ -166,7 +166,7 @@ static void stm32f2xx_spi_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps stm32f2xx_spi_ops =3D {
>      .read =3D stm32f2xx_spi_read,
>      .write =3D stm32f2xx_spi_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_stm32f2xx_spi =3D {
> diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
> index 1379cb1..f21c5e0 100644
> --- a/hw/ssi/xilinx_spi.c
> +++ b/hw/ssi/xilinx_spi.c
> @@ -313,7 +313,7 @@ done:
>  static const MemoryRegionOps spi_ops =3D {
>      .read =3D spi_read,
>      .write =3D spi_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index b29e0a4..de66b9d 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -1029,7 +1029,7 @@ no_reg_update:
>  static const MemoryRegionOps spips_ops =3D {
>      .read =3D xilinx_spips_read,
>      .write =3D xilinx_spips_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void xilinx_qspips_invalidate_mmio_ptr(XilinxQSPIPS *q)
> @@ -1120,13 +1120,13 @@ static void xlnx_zynqmp_qspips_write(void *opaque=
, hwaddr addr,
>  static const MemoryRegionOps qspips_ops =3D {
>      .read =3D xilinx_spips_read,
>      .write =3D xilinx_qspips_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const MemoryRegionOps xlnx_zynqmp_qspips_ops =3D {
>      .read =3D xlnx_zynqmp_qspips_read,
>      .write =3D xlnx_zynqmp_qspips_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  #define LQSPI_CACHE_SIZE 1024
> @@ -1238,7 +1238,7 @@ static MemTxResult lqspi_write(void *opaque, hwaddr=
 offset, uint64_t value,
>  static const MemoryRegionOps lqspi_ops =3D {
>      .read_with_attrs =3D lqspi_read,
>      .write_with_attrs =3D lqspi_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
> index 09e2a7b..8071bd2 100644
> --- a/hw/timer/a9gtimer.c
> +++ b/hw/timer/a9gtimer.c
> @@ -254,7 +254,7 @@ static const MemoryRegionOps a9_gtimer_this_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const MemoryRegionOps a9_gtimer_ops =3D {
> @@ -264,7 +264,7 @@ static const MemoryRegionOps a9_gtimer_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void a9_gtimer_reset(DeviceState *dev)
> diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
> index 763e109..6bc32d1 100644
> --- a/hw/timer/allwinner-a10-pit.c
> +++ b/hw/timer/allwinner-a10-pit.c
> @@ -178,7 +178,7 @@ static void a10_pit_write(void *opaque, hwaddr offset=
, uint64_t value,
>  static const MemoryRegionOps a10_pit_ops =3D {
>      .read =3D a10_pit_read,
>      .write =3D a10_pit_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static Property a10_pit_properties[] =3D {
> diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c
> index 5c1d9e4..74771af 100644
> --- a/hw/timer/altera_timer.c
> +++ b/hw/timer/altera_timer.c
> @@ -145,7 +145,7 @@ static void timer_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps timer_ops =3D {
>      .read =3D timer_read,
>      .write =3D timer_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4
> diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
> index 93044aa..0e86be0 100644
> --- a/hw/timer/arm_mptimer.c
> +++ b/hw/timer/arm_mptimer.c
> @@ -190,7 +190,7 @@ static const MemoryRegionOps arm_thistimer_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const MemoryRegionOps timerblock_ops =3D {
> @@ -200,7 +200,7 @@ static const MemoryRegionOps timerblock_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void timerblock_reset(TimerBlock *tb)
> diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
> index f0a7534..0b534c5 100644
> --- a/hw/timer/arm_timer.c
> +++ b/hw/timer/arm_timer.c
> @@ -265,7 +265,7 @@ static void sp804_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps sp804_ops =3D {
>      .read =3D sp804_read,
>      .write =3D sp804_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_sp804 =3D {
> @@ -346,7 +346,7 @@ static void icp_pit_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps icp_pit_ops =3D {
>      .read =3D icp_pit_read,
>      .write =3D icp_pit_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void icp_pit_init(Object *obj)
> diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
> index 9464074..3adb363 100644
> --- a/hw/timer/armv7m_systick.c
> +++ b/hw/timer/armv7m_systick.c
> @@ -191,7 +191,7 @@ static MemTxResult systick_write(void *opaque, hwaddr=
 addr,
>  static const MemoryRegionOps systick_ops =3D {
>      .read_with_attrs =3D systick_read,
>      .write_with_attrs =3D systick_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>  };
> diff --git a/hw/timer/aspeed_rtc.c b/hw/timer/aspeed_rtc.c
> index 19f061c..9f96530 100644
> --- a/hw/timer/aspeed_rtc.c
> +++ b/hw/timer/aspeed_rtc.c
> @@ -130,7 +130,7 @@ static void aspeed_rtc_reset(DeviceState *d)
>  static const MemoryRegionOps aspeed_rtc_ops =3D {
>      .read =3D aspeed_rtc_read,
>      .write =3D aspeed_rtc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_aspeed_rtc =3D {
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 29cc5e8..1aca23d 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -448,7 +448,7 @@ static void aspeed_timer_write(void *opaque, hwaddr o=
ffset, uint64_t value,
>  static const MemoryRegionOps aspeed_timer_ops =3D {
>      .read =3D aspeed_timer_read,
>      .write =3D aspeed_timer_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>      .valid.unaligned =3D false,
> diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
> index 115d935..f049ecc 100644
> --- a/hw/timer/cadence_ttc.c
> +++ b/hw/timer/cadence_ttc.c
> @@ -389,7 +389,7 @@ static void cadence_ttc_write(void *opaque, hwaddr of=
fset,
>  static const MemoryRegionOps cadence_ttc_ops =3D {
>      .read =3D cadence_ttc_read,
>      .write =3D cadence_ttc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void cadence_timer_reset(CadenceTimerState *s)
> diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtime=
r.c
> index 383f6e1..f8c4e83 100644
> --- a/hw/timer/cmsdk-apb-dualtimer.c
> +++ b/hw/timer/cmsdk-apb-dualtimer.c
> @@ -373,7 +373,7 @@ static void cmsdk_apb_dualtimer_write(void *opaque, h=
waddr offset,
>  static const MemoryRegionOps cmsdk_apb_dualtimer_ops =3D {
>      .read =3D cmsdk_apb_dualtimer_read,
>      .write =3D cmsdk_apb_dualtimer_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      /* byte/halfword accesses are just zero-padded on reads and writes */
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
> diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
> index 2e7318b..b9c1677 100644
> --- a/hw/timer/cmsdk-apb-timer.c
> +++ b/hw/timer/cmsdk-apb-timer.c
> @@ -169,7 +169,7 @@ static void cmsdk_apb_timer_write(void *opaque, hwadd=
r offset, uint64_t value,
>  static const MemoryRegionOps cmsdk_apb_timer_ops =3D {
>      .read =3D cmsdk_apb_timer_read,
>      .write =3D cmsdk_apb_timer_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void cmsdk_apb_timer_tick(void *opaque)
> diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c
> index c818ed1..4c387f2 100644
> --- a/hw/timer/digic-timer.c
> +++ b/hw/timer/digic-timer.c
> @@ -121,7 +121,7 @@ static const MemoryRegionOps digic_timer_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void digic_timer_init(Object *obj)
> diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
> index 53834e1..56324fc 100644
> --- a/hw/timer/etraxfs_timer.c
> +++ b/hw/timer/etraxfs_timer.c
> @@ -297,7 +297,7 @@ timer_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps timer_ops =3D {
>      .read =3D timer_read,
>      .write =3D timer_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index 874c7b8..0fc67e5 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -1412,7 +1412,7 @@ static void exynos4210_mct_write(void *opaque, hwad=
dr offset,
>  static const MemoryRegionOps exynos4210_mct_ops =3D {
>      .read =3D exynos4210_mct_read,
>      .write =3D exynos4210_mct_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  /* MCT init */
> diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
> index 9bc0327..5df719a 100644
> --- a/hw/timer/exynos4210_pwm.c
> +++ b/hw/timer/exynos4210_pwm.c
> @@ -375,7 +375,7 @@ static void exynos4210_pwm_reset(DeviceState *d)
>  static const MemoryRegionOps exynos4210_pwm_ops =3D {
>      .read =3D exynos4210_pwm_read,
>      .write =3D exynos4210_pwm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  /*
> diff --git a/hw/timer/exynos4210_rtc.c b/hw/timer/exynos4210_rtc.c
> index 0ecedf7..f62277c 100644
> --- a/hw/timer/exynos4210_rtc.c
> +++ b/hw/timer/exynos4210_rtc.c
> @@ -544,7 +544,7 @@ static void exynos4210_rtc_reset(DeviceState *d)
>  static const MemoryRegionOps exynos4210_rtc_ops =3D {
>      .read =3D exynos4210_rtc_read,
>      .write =3D exynos4210_rtc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  /*
> diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
> index e45a490..13efd6d 100644
> --- a/hw/timer/grlib_gptimer.c
> +++ b/hw/timer/grlib_gptimer.c
> @@ -313,7 +313,7 @@ static void grlib_gptimer_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps grlib_gptimer_ops =3D {
>      .read =3D grlib_gptimer_read,
>      .write =3D grlib_gptimer_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
> index 41024f3..9bd154e 100644
> --- a/hw/timer/hpet.c
> +++ b/hw/timer/hpet.c
> @@ -675,7 +675,7 @@ static const MemoryRegionOps hpet_ram_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void hpet_reset(DeviceState *d)
> diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
> index 0972c47..4f19817 100644
> --- a/hw/timer/i8254.c
> +++ b/hw/timer/i8254.c
> @@ -315,7 +315,7 @@ static const MemoryRegionOps pit_ioport_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void pit_post_load(PITCommonState *s)
> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
> index 7a88316..a286f80 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -282,7 +282,7 @@ static void imx_epit_cmp(void *opaque)
>  static const MemoryRegionOps imx_epit_ops =3D {
>      .read =3D imx_epit_read,
>      .write =3D imx_epit_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_imx_timer_epit =3D {
> diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
> index 3086c03..d1cb371 100644
> --- a/hw/timer/imx_gpt.c
> +++ b/hw/timer/imx_gpt.c
> @@ -474,7 +474,7 @@ static void imx_gpt_timeout(void *opaque)
>  static const MemoryRegionOps imx_gpt_ops =3D {
>      .read =3D imx_gpt_read,
>      .write =3D imx_gpt_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>=20
> diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c
> index 6ce876c..476d6ec 100644
> --- a/hw/timer/lm32_timer.c
> +++ b/hw/timer/lm32_timer.c
> @@ -144,7 +144,7 @@ static void timer_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps timer_ops =3D {
>      .read =3D timer_read,
>      .write =3D timer_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/timer/m48t59.c b/hw/timer/m48t59.c
> index 030c887..8bfbc36 100644
> --- a/hw/timer/m48t59.c
> +++ b/hw/timer/m48t59.c
> @@ -518,7 +518,7 @@ static const MemoryRegionOps nvram_ops =3D {
>      .impl.max_access_size =3D 1,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .endianness =3D MO_BE,
>  };
>=20
>  static const VMStateDescription vmstate_m48t59 =3D {
> @@ -559,7 +559,7 @@ const MemoryRegionOps m48t59_io_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  /* Initialisation routine */
> diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
> index ce4550b..8ccd950 100644
> --- a/hw/timer/mc146818rtc.c
> +++ b/hw/timer/mc146818rtc.c
> @@ -930,7 +930,7 @@ static const MemoryRegionOps cmos_ops =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void rtc_get_date(Object *obj, struct tm *current_tm, Error **err=
p)
> diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
> index a9d2508..a35d5f5 100644
> --- a/hw/timer/milkymist-sysctl.c
> +++ b/hw/timer/milkymist-sysctl.c
> @@ -220,7 +220,7 @@ static const MemoryRegionOps sysctl_mmio_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void timer0_hit(void *opaque)
> diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
> index 6add47a..12cfd5d 100644
> --- a/hw/timer/mss-timer.c
> +++ b/hw/timer/mss-timer.c
> @@ -197,7 +197,7 @@ timer_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps timer_ops =3D {
>      .read =3D timer_read,
>      .write =3D timer_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4
> diff --git a/hw/timer/nrf51_timer.c b/hw/timer/nrf51_timer.c
> index 29fb81a..26204fa 100644
> --- a/hw/timer/nrf51_timer.c
> +++ b/hw/timer/nrf51_timer.c
> @@ -300,7 +300,7 @@ static void nrf51_timer_write(void *opaque, hwaddr of=
fset,
>  static const MemoryRegionOps rng_ops =3D {
>      .read =3D  nrf51_timer_read,
>      .write =3D nrf51_timer_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
>  };
> diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c
> index ae2dc99..c745eab 100644
> --- a/hw/timer/omap_gptimer.c
> +++ b/hw/timer/omap_gptimer.c
> @@ -488,7 +488,7 @@ static const MemoryRegionOps omap_gp_timer_ops =3D {
>      .write =3D omap_gp_timer_writefn,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  struct omap_gp_timer_s *omap_gp_timer_init(struct omap_target_agent_s *t=
a,
> diff --git a/hw/timer/omap_synctimer.c b/hw/timer/omap_synctimer.c
> index 0d75a90..f98a20a 100644
> --- a/hw/timer/omap_synctimer.c
> +++ b/hw/timer/omap_synctimer.c
> @@ -94,7 +94,7 @@ static const MemoryRegionOps omap_synctimer_ops =3D {
>      .write =3D omap_synctimer_writefn,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  struct omap_synctimer_s *omap_synctimer_init(struct omap_target_agent_s =
*ta,
> diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
> index 1a7e2ee..59b5b66 100644
> --- a/hw/timer/pl031.c
> +++ b/hw/timer/pl031.c
> @@ -175,7 +175,7 @@ static void pl031_write(void * opaque, hwaddr offset,
>  static const MemoryRegionOps pl031_ops =3D {
>      .read =3D pl031_read,
>      .write =3D pl031_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pl031_init(Object *obj)
> diff --git a/hw/timer/puv3_ost.c b/hw/timer/puv3_ost.c
> index 4a8ae37..97195b3 100644
> --- a/hw/timer/puv3_ost.c
> +++ b/hw/timer/puv3_ost.c
> @@ -98,7 +98,7 @@ static const MemoryRegionOps puv3_ost_ops =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void puv3_ost_tick(void *opaque)
> diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
> index 8c1ef43..0d2afac 100644
> --- a/hw/timer/pxa2xx_timer.c
> +++ b/hw/timer/pxa2xx_timer.c
> @@ -399,7 +399,7 @@ static void pxa2xx_timer_write(void *opaque, hwaddr o=
ffset,
>  static const MemoryRegionOps pxa2xx_timer_ops =3D {
>      .read =3D pxa2xx_timer_read,
>      .write =3D pxa2xx_timer_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void pxa2xx_timer_tick(void *opaque)
> diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
> index 91b18ba..e6804f3 100644
> --- a/hw/timer/sh_timer.c
> +++ b/hw/timer/sh_timer.c
> @@ -302,7 +302,7 @@ static void tmu012_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps tmu012_ops =3D {
>      .read =3D tmu012_read,
>      .write =3D tmu012_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  void tmu012_init(MemoryRegion *sysmem, hwaddr base,
> diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
> index 005fd59..27bba42 100644
> --- a/hw/timer/slavio_timer.c
> +++ b/hw/timer/slavio_timer.c
> @@ -319,7 +319,7 @@ static void slavio_timer_mem_writel(void *opaque, hwa=
ddr addr,
>  static const MemoryRegionOps slavio_timer_mem_ops =3D {
>      .read =3D slavio_timer_mem_readl,
>      .write =3D slavio_timer_mem_writel,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
> index 4c49dc4..2a52e0d 100644
> --- a/hw/timer/stm32f2xx_timer.c
> +++ b/hw/timer/stm32f2xx_timer.c
> @@ -265,7 +265,7 @@ static void stm32f2xx_timer_write(void *opaque, hwadd=
r offset,
>  static const MemoryRegionOps stm32f2xx_timer_ops =3D {
>      .read =3D stm32f2xx_timer_read,
>      .write =3D stm32f2xx_timer_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static const VMStateDescription vmstate_stm32f2xx_timer =3D {
> diff --git a/hw/timer/sun4v-rtc.c b/hw/timer/sun4v-rtc.c
> index ba62adc..1fb7775 100644
> --- a/hw/timer/sun4v-rtc.c
> +++ b/hw/timer/sun4v-rtc.c
> @@ -48,7 +48,7 @@ static void sun4v_rtc_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps sun4v_rtc_ops =3D {
>      .read =3D sun4v_rtc_read,
>      .write =3D sun4v_rtc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  void sun4v_rtc_init(hwaddr addr)
> diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
> index 16bcd03..ab4c543 100644
> --- a/hw/timer/xilinx_timer.c
> +++ b/hw/timer/xilinx_timer.c
> @@ -187,7 +187,7 @@ timer_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps timer_ops =3D {
>      .read =3D timer_read,
>      .write =3D timer_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/timer/xlnx-zynqmp-rtc.c b/hw/timer/xlnx-zynqmp-rtc.c
> index 36daf0c..ebfc53a 100644
> --- a/hw/timer/xlnx-zynqmp-rtc.c
> +++ b/hw/timer/xlnx-zynqmp-rtc.c
> @@ -173,7 +173,7 @@ static void rtc_reset(DeviceState *dev)
>  static const MemoryRegionOps rtc_ops =3D {
>      .read =3D register_read_memory,
>      .write =3D register_write_memory,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> index db0e3e7..c73873a 100644
> --- a/hw/tpm/tpm_crb.c
> +++ b/hw/tpm/tpm_crb.c
> @@ -180,7 +180,7 @@ static void tpm_crb_mmio_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps tpm_crb_memory_ops =3D {
>      .read =3D tpm_crb_mmio_read,
>      .write =3D tpm_crb_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
> index d6b3212..7984f82 100644
> --- a/hw/tpm/tpm_tis.c
> +++ b/hw/tpm/tpm_tis.c
> @@ -846,7 +846,7 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps tpm_tis_memory_ops =3D {
>      .read =3D tpm_tis_mmio_read,
>      .write =3D tpm_tis_mmio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
> diff --git a/hw/usb/chipidea.c b/hw/usb/chipidea.c
> index 3dcd22c..5085a7f 100644
> --- a/hw/usb/chipidea.c
> +++ b/hw/usb/chipidea.c
> @@ -35,7 +35,7 @@ static void chipidea_write(void *opaque, hwaddr offset,
>  static const struct MemoryRegionOps chipidea_ops =3D {
>      .read =3D chipidea_read,
>      .write =3D chipidea_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> @@ -76,7 +76,7 @@ static void chipidea_dc_write(void *opaque, hwaddr offs=
et,
>  static const struct MemoryRegionOps chipidea_dc_ops =3D {
>      .read =3D chipidea_dc_read,
>      .write =3D chipidea_dc_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .impl =3D {
>          /*
>           * Our device would not work correctly if the guest was doing
> diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
> index cd1f3c7..88e53f6 100644
> --- a/hw/usb/hcd-ehci-sysbus.c
> +++ b/hw/usb/hcd-ehci-sysbus.c
> @@ -223,7 +223,7 @@ static const MemoryRegionOps fusbh200_ehci_mmio_ops =
=3D {
>      .write =3D fusbh200_ehci_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void fusbh200_ehci_init(Object *obj)
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index 62dab05..79ce13d 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -2357,7 +2357,7 @@ static const MemoryRegionOps ehci_mmio_caps_ops =3D=
 {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 1,
>      .impl.max_access_size =3D 1,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const MemoryRegionOps ehci_mmio_opreg_ops =3D {
> @@ -2365,7 +2365,7 @@ static const MemoryRegionOps ehci_mmio_opreg_ops =
=3D {
>      .write =3D ehci_opreg_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const MemoryRegionOps ehci_mmio_port_ops =3D {
> @@ -2373,7 +2373,7 @@ static const MemoryRegionOps ehci_mmio_port_ops =3D=
 {
>      .write =3D ehci_port_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static USBPortOps ehci_port_ops =3D {
> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> index 4f6fdbc..9d7cc15 100644
> --- a/hw/usb/hcd-ohci.c
> +++ b/hw/usb/hcd-ohci.c
> @@ -1774,7 +1774,7 @@ static void ohci_async_cancel_device(OHCIState *ohc=
i, USBDevice *dev)
>  static const MemoryRegionOps ohci_mem_ops =3D {
>      .read =3D ohci_mem_read,
>      .write =3D ohci_mem_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static USBPortOps ohci_port_ops =3D {
> diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
> index 98bd5cf..1f0aa49 100644
> --- a/hw/usb/hcd-uhci.c
> +++ b/hw/usb/hcd-uhci.c
> @@ -1196,7 +1196,7 @@ static const MemoryRegionOps uhci_ioport_ops =3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 2,
>      .impl.max_access_size =3D 2,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static USBPortOps uhci_port_ops =3D {
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index 5894a18..24d4a85 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -3161,7 +3161,7 @@ static const MemoryRegionOps xhci_cap_ops =3D {
>      .valid.max_access_size =3D 4,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const MemoryRegionOps xhci_oper_ops =3D {
> @@ -3169,7 +3169,7 @@ static const MemoryRegionOps xhci_oper_ops =3D {
>      .write =3D xhci_oper_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const MemoryRegionOps xhci_port_ops =3D {
> @@ -3177,7 +3177,7 @@ static const MemoryRegionOps xhci_port_ops =3D {
>      .write =3D xhci_port_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const MemoryRegionOps xhci_runtime_ops =3D {
> @@ -3185,7 +3185,7 @@ static const MemoryRegionOps xhci_runtime_ops =3D {
>      .write =3D xhci_runtime_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const MemoryRegionOps xhci_doorbell_ops =3D {
> @@ -3193,7 +3193,7 @@ static const MemoryRegionOps xhci_doorbell_ops =3D {
>      .write =3D xhci_doorbell_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void xhci_attach(USBPort *usbport)
> diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
> index a61b0f6..3819198 100644
> --- a/hw/usb/tusb6010.c
> +++ b/hw/usb/tusb6010.c
> @@ -678,7 +678,7 @@ static const MemoryRegionOps tusb_async_ops =3D {
>      .write =3D tusb_async_writefn,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void tusb_otg_tick(void *opaque)
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index a859298..8954530 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -274,7 +274,7 @@ uint64_t vfio_region_read(void *opaque,
>  const MemoryRegionOps vfio_region_ops =3D {
>      .read =3D vfio_region_read,
>      .write =3D vfio_region_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 8,
> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
> index fb3cc33..d5c0268 100644
> --- a/hw/vfio/pci-quirks.c
> +++ b/hw/vfio/pci-quirks.c
> @@ -150,7 +150,7 @@ static void vfio_generic_window_quirk_address_write(v=
oid *opaque, hwaddr addr,
>  static const MemoryRegionOps vfio_generic_window_address_quirk =3D {
>      .read =3D vfio_generic_window_quirk_address_read,
>      .write =3D vfio_generic_window_quirk_address_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t vfio_generic_window_quirk_data_read(void *opaque,
> @@ -193,7 +193,7 @@ static void vfio_generic_window_quirk_data_write(void=
 *opaque, hwaddr addr,
>  static const MemoryRegionOps vfio_generic_window_data_quirk =3D {
>      .read =3D vfio_generic_window_quirk_data_read,
>      .write =3D vfio_generic_window_quirk_data_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  /*
> @@ -243,7 +243,7 @@ static void vfio_generic_quirk_mirror_write(void *opa=
que, hwaddr addr,
>  static const MemoryRegionOps vfio_generic_mirror_quirk =3D {
>      .read =3D vfio_generic_quirk_mirror_read,
>      .write =3D vfio_generic_quirk_mirror_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  /* Is range1 fully contained within range2?  */
> @@ -278,7 +278,7 @@ static uint64_t vfio_ati_3c3_quirk_read(void *opaque,
>=20
>  static const MemoryRegionOps vfio_ati_3c3_quirk =3D {
>      .read =3D vfio_ati_3c3_quirk_read,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static VFIOQuirk *vfio_quirk_alloc(int nr_mem)
> @@ -605,7 +605,7 @@ static void vfio_nvidia_3d4_quirk_write(void *opaque,=
 hwaddr addr,
>  static const MemoryRegionOps vfio_nvidia_3d4_quirk =3D {
>      .read =3D vfio_nvidia_3d4_quirk_read,
>      .write =3D vfio_nvidia_3d4_quirk_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t vfio_nvidia_3d0_quirk_read(void *opaque,
> @@ -663,7 +663,7 @@ static void vfio_nvidia_3d0_quirk_write(void *opaque,=
 hwaddr addr,
>  static const MemoryRegionOps vfio_nvidia_3d0_quirk =3D {
>      .read =3D vfio_nvidia_3d0_quirk_read,
>      .write =3D vfio_nvidia_3d0_quirk_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void vfio_vga_probe_nvidia_3d0_quirk(VFIOPCIDevice *vdev)
> @@ -752,7 +752,7 @@ static void vfio_nvidia_bar5_quirk_master_write(void =
*opaque, hwaddr addr,
>  static const MemoryRegionOps vfio_nvidia_bar5_quirk_master =3D {
>      .read =3D vfio_nvidia_bar5_quirk_master_read,
>      .write =3D vfio_nvidia_bar5_quirk_master_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t vfio_nvidia_bar5_quirk_enable_read(void *opaque,
> @@ -779,7 +779,7 @@ static void vfio_nvidia_bar5_quirk_enable_write(void =
*opaque, hwaddr addr,
>  static const MemoryRegionOps vfio_nvidia_bar5_quirk_enable =3D {
>      .read =3D vfio_nvidia_bar5_quirk_enable_read,
>      .write =3D vfio_nvidia_bar5_quirk_enable_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void vfio_probe_nvidia_bar5_quirk(VFIOPCIDevice *vdev, int nr)
> @@ -929,7 +929,7 @@ static void vfio_nvidia_quirk_mirror_write(void *opaq=
ue, hwaddr addr,
>  static const MemoryRegionOps vfio_nvidia_mirror_quirk =3D {
>      .read =3D vfio_generic_quirk_mirror_read,
>      .write =3D vfio_nvidia_quirk_mirror_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void vfio_nvidia_bar0_quirk_reset(VFIOPCIDevice *vdev, VFIOQuirk =
*quirk)
> @@ -1090,7 +1090,7 @@ static const MemoryRegionOps vfio_rtl_address_quirk=
 =3D {
>          .max_access_size =3D 4,
>          .unaligned =3D false,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t vfio_rtl8168_quirk_data_read(void *opaque,
> @@ -1130,7 +1130,7 @@ static const MemoryRegionOps vfio_rtl_data_quirk =
=3D {
>          .max_access_size =3D 4,
>          .unaligned =3D false,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void vfio_probe_rtl8168_bar2_quirk(VFIOPCIDevice *vdev, int nr)
> @@ -1526,7 +1526,7 @@ static void vfio_igd_quirk_data_write(void *opaque,=
 hwaddr addr,
>  static const MemoryRegionOps vfio_igd_data_quirk =3D {
>      .read =3D vfio_igd_quirk_data_read,
>      .write =3D vfio_igd_quirk_data_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static uint64_t vfio_igd_quirk_index_read(void *opaque,
> @@ -1554,7 +1554,7 @@ static void vfio_igd_quirk_index_write(void *opaque=
, hwaddr addr,
>  static const MemoryRegionOps vfio_igd_index_quirk =3D {
>      .read =3D vfio_igd_quirk_index_read,
>      .write =3D vfio_igd_quirk_index_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index d7a4e18..dab2a89 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -879,7 +879,7 @@ static void vfio_rom_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps vfio_rom_ops =3D {
>      .read =3D vfio_rom_read,
>      .write =3D vfio_rom_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
> @@ -1027,7 +1027,7 @@ uint64_t vfio_vga_read(void *opaque, hwaddr addr, u=
nsigned size)
>  static const MemoryRegionOps vfio_vga_ops =3D {
>      .read =3D vfio_vga_read,
>      .write =3D vfio_vga_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  /*
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 97b7f35..84a3f5e 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -313,7 +313,7 @@ static void virtio_mmio_write(void *opaque, hwaddr of=
fset, uint64_t value,
>  static const MemoryRegionOps virtio_mem_ops =3D {
>      .read =3D virtio_mmio_read,
>      .write =3D virtio_mmio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void virtio_mmio_update_irq(DeviceState *opaque, uint16_t vector)
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 25875c8..b929e44 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -484,7 +484,7 @@ static const MemoryRegionOps virtio_pci_config_ops =
=3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 4,
>      },
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static MemoryRegion *virtio_address_space_lookup(VirtIOPCIProxy *proxy,
> @@ -1387,7 +1387,7 @@ static void virtio_pci_modern_regions_init(VirtIOPC=
IProxy *proxy)
>              .min_access_size =3D 1,
>              .max_access_size =3D 4,
>          },
> -        .endianness =3D DEVICE_LITTLE_ENDIAN,
> +        .endianness =3D MO_LE,
>      };
>      static const MemoryRegionOps isr_ops =3D {
>          .read =3D virtio_pci_isr_read,
> @@ -1396,7 +1396,7 @@ static void virtio_pci_modern_regions_init(VirtIOPC=
IProxy *proxy)
>              .min_access_size =3D 1,
>              .max_access_size =3D 4,
>          },
> -        .endianness =3D DEVICE_LITTLE_ENDIAN,
> +        .endianness =3D MO_LE,
>      };
>      static const MemoryRegionOps device_ops =3D {
>          .read =3D virtio_pci_device_read,
> @@ -1405,7 +1405,7 @@ static void virtio_pci_modern_regions_init(VirtIOPC=
IProxy *proxy)
>              .min_access_size =3D 1,
>              .max_access_size =3D 4,
>          },
> -        .endianness =3D DEVICE_LITTLE_ENDIAN,
> +        .endianness =3D MO_LE,
>      };
>      static const MemoryRegionOps notify_ops =3D {
>          .read =3D virtio_pci_notify_read,
> @@ -1414,7 +1414,7 @@ static void virtio_pci_modern_regions_init(VirtIOPC=
IProxy *proxy)
>              .min_access_size =3D 1,
>              .max_access_size =3D 4,
>          },
> -        .endianness =3D DEVICE_LITTLE_ENDIAN,
> +        .endianness =3D MO_LE,
>      };
>      static const MemoryRegionOps notify_pio_ops =3D {
>          .read =3D virtio_pci_notify_read,
> @@ -1423,7 +1423,7 @@ static void virtio_pci_modern_regions_init(VirtIOPC=
IProxy *proxy)
>              .min_access_size =3D 1,
>              .max_access_size =3D 4,
>          },
> -        .endianness =3D DEVICE_LITTLE_ENDIAN,
> +        .endianness =3D MO_LE,
>      };
>=20
>=20
> diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-wat=
chdog.c
> index 54ac393..fcfa3b4 100644
> --- a/hw/watchdog/cmsdk-apb-watchdog.c
> +++ b/hw/watchdog/cmsdk-apb-watchdog.c
> @@ -261,7 +261,7 @@ bad_offset:
>  static const MemoryRegionOps cmsdk_apb_watchdog_ops =3D {
>      .read =3D cmsdk_apb_watchdog_read,
>      .write =3D cmsdk_apb_watchdog_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      /* byte/halfword accesses are just zero-padded on reads and writes */
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 57fe24a..775f73e 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -202,7 +202,7 @@ static const VMStateDescription vmstate_aspeed_wdt =
=3D {
>  static const MemoryRegionOps aspeed_wdt_ops =3D {
>      .read =3D aspeed_wdt_read,
>      .write =3D aspeed_wdt_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
>      .valid.unaligned =3D false,
> diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
> index 6780f01..11cb1ed 100644
> --- a/hw/watchdog/wdt_i6300esb.c
> +++ b/hw/watchdog/wdt_i6300esb.c
> @@ -398,7 +398,7 @@ static const MemoryRegionOps i6300esb_ops =3D {
>      .write =3D i6300esb_mem_writefn,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>  };
>=20
>  static const VMStateDescription vmstate_i6300esb =3D {
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 5539d56..215b615 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -436,7 +436,7 @@ static void xen_pt_bar_write(void *o, hwaddr addr, ui=
nt64_t val,
>  }
>=20
>  static const MemoryRegionOps ops =3D {
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .read =3D xen_pt_bar_read,
>      .write =3D xen_pt_bar_write,
>  };
> diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
> index fb4b887..d12cc1f 100644
> --- a/hw/xen/xen_pt_msi.c
> +++ b/hw/xen/xen_pt_msi.c
> @@ -507,7 +507,7 @@ static bool pci_msix_accepts(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps pci_msix_ops =3D {
>      .read =3D pci_msix_read,
>      .write =3D pci_msix_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/xtensa/mx_pic.c b/hw/xtensa/mx_pic.c
> index 7075db9..9f11231 100644
> --- a/hw/xtensa/mx_pic.c
> +++ b/hw/xtensa/mx_pic.c
> @@ -266,7 +266,7 @@ static void xtensa_mx_pic_ext_reg_write(void *opaque,=
 hwaddr offset,
>  static const MemoryRegionOps xtensa_mx_pic_ops =3D {
>      .read =3D xtensa_mx_pic_ext_reg_read,
>      .write =3D xtensa_mx_pic_ext_reg_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>      .valid =3D {
>          .unaligned =3D true,
>      },
> diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
> index f7f3e11..3d4a44a 100644
> --- a/hw/xtensa/xtfpga.c
> +++ b/hw/xtensa/xtfpga.c
> @@ -117,7 +117,7 @@ static void xtfpga_fpga_write(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps xtfpga_fpga_ops =3D {
>      .read =3D xtfpga_fpga_read,
>      .write =3D xtfpga_fpga_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static XtfpgaFpgaState *xtfpga_fpga_init(MemoryRegion *address_space,
> @@ -212,7 +212,7 @@ static void xtfpga_io_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps xtfpga_io_ops =3D {
>      .read =3D xtfpga_io_read,
>      .write =3D xtfpga_io_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *mach=
ine)
> @@ -311,7 +311,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board,=
 MachineState *machine)
>      }
>=20
>      serial_mm_init(system_io, 0x0d050020, 2, extints[0],
> -                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
> +                   115200, serial_hd(0), MO_TE);
>=20
>      dinfo =3D drive_get(IF_PFLASH, 0, 0);
>      if (dinfo) {
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index c388453..01a29ba 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -27,9 +27,9 @@ enum device_endian {
>  };
>=20
>  #if defined(HOST_WORDS_BIGENDIAN)
> -#define DEVICE_HOST_ENDIAN DEVICE_BIG_ENDIAN
> +#define DEVICE_HOST_ENDIAN MO_BE
>  #else
> -#define DEVICE_HOST_ENDIAN DEVICE_LITTLE_ENDIAN
> +#define DEVICE_HOST_ENDIAN MO_LE
>  #endif
>=20
>  /* address in the RAM (different from a physical address) */
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 975b86a..d7acf6a 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -168,7 +168,7 @@ struct MemoryRegionOps {
>                                      unsigned size,
>                                      MemTxAttrs attrs);
>=20
> -    enum device_endian endianness;
> +    MemOp endianness;
>      /* Guest-visible constraints: */
>      struct {
>          /* If nonzero, specify bounds on access sizes beyond which a mac=
hine
> diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
> index abd5cf7..3a12485 100644
> --- a/include/hw/char/serial.h
> +++ b/include/hw/char/serial.h
> @@ -92,7 +92,7 @@ SerialState *serial_init(int base, qemu_irq irq, int ba=
udbase,
>  SerialState *serial_mm_init(MemoryRegion *address_space,
>                              hwaddr base, int it_shift,
>                              qemu_irq irq, int baudbase,
> -                            Chardev *chr, enum device_endian end);
> +                            Chardev *chr, MemOp end);
>=20
>  /* serial-isa.c */
>=20
> diff --git a/ioport.c b/ioport.c
> index 04e360e..e5713e8 100644
> --- a/ioport.c
> +++ b/ioport.c
> @@ -51,7 +51,7 @@ static void unassigned_io_write(void *opaque, hwaddr ad=
dr, uint64_t val,
>  const MemoryRegionOps unassigned_io_ops =3D {
>      .read =3D unassigned_io_read,
>      .write =3D unassigned_io_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  void cpu_outb(uint32_t addr, uint8_t val)
> @@ -213,7 +213,7 @@ static void portio_write(void *opaque, hwaddr addr, u=
int64_t data,
>  static const MemoryRegionOps portio_ops =3D {
>      .read =3D portio_read,
>      .write =3D portio_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .endianness =3D MO_LE,
>      .valid.unaligned =3D true,
>      .impl.unaligned =3D true,
>  };
> diff --git a/memory.c b/memory.c
> index 89ea4fb..3cabb52 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -346,18 +346,18 @@ static void flatview_simplify(FlatView *view)
>  static bool memory_region_big_endian(MemoryRegion *mr)
>  {
>  #ifdef TARGET_WORDS_BIGENDIAN
> -    return mr->ops->endianness !=3D DEVICE_LITTLE_ENDIAN;
> +    return mr->ops->endianness !=3D MO_LE;
>  #else
> -    return mr->ops->endianness =3D=3D DEVICE_BIG_ENDIAN;
> +    return mr->ops->endianness =3D=3D MO_BE;
>  #endif
>  }
>=20
>  static bool memory_region_wrong_endianness(MemoryRegion *mr)
>  {
>  #ifdef TARGET_WORDS_BIGENDIAN
> -    return mr->ops->endianness =3D=3D DEVICE_LITTLE_ENDIAN;
> +    return mr->ops->endianness =3D=3D MO_LE;
>  #else
> -    return mr->ops->endianness =3D=3D DEVICE_BIG_ENDIAN;
> +    return mr->ops->endianness =3D=3D MO_BE;
>  #endif
>  }
>=20
> @@ -1307,7 +1307,7 @@ static bool unassigned_mem_accepts(void *opaque, hw=
addr addr,
>=20
>  const MemoryRegionOps unassigned_mem_ops =3D {
>      .valid.accepts =3D unassigned_mem_accepts,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D MO_TE,
>  };
>=20
>  static uint64_t memory_region_ram_device_read(void *opaque,
> diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
> index de658c4..d7e28d0 100644
> --- a/memory_ldst.inc.c
> +++ b/memory_ldst.inc.c
> @@ -21,8 +21,7 @@
>=20
>  /* warning: addr must be aligned */
>  static inline uint32_t glue(address_space_ldl_internal, SUFFIX)(ARG1_DEC=
L,
> -    hwaddr addr, MemTxAttrs attrs, MemTxResult *result,
> -    enum device_endian endian)
> +    hwaddr addr, MemTxAttrs attrs, MemTxResult *result, MemOp endian)
>  {
>      uint8_t *ptr;
>      uint64_t val;
> @@ -40,11 +39,11 @@ static inline uint32_t glue(address_space_ldl_interna=
l, SUFFIX)(ARG1_DECL,
>          /* I/O case */
>          r =3D memory_region_dispatch_read(mr, addr1, &val, MO_32, attrs);
>  #if defined(TARGET_WORDS_BIGENDIAN)
> -        if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
> +        if (endian =3D=3D MO_LE) {
>              val =3D bswap32(val);
>          }
>  #else
> -        if (endian =3D=3D DEVICE_BIG_ENDIAN) {
> +        if (endian =3D=3D MO_BE) {
>              val =3D bswap32(val);
>          }
>  #endif
> @@ -52,10 +51,10 @@ static inline uint32_t glue(address_space_ldl_interna=
l, SUFFIX)(ARG1_DECL,
>          /* RAM case */
>          ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
>          switch (endian) {
> -        case DEVICE_LITTLE_ENDIAN:
> +        case MO_LE:
>              val =3D ldl_le_p(ptr);
>              break;
> -        case DEVICE_BIG_ENDIAN:
> +        case MO_BE:
>              val =3D ldl_be_p(ptr);
>              break;
>          default:
> @@ -78,27 +77,26 @@ uint32_t glue(address_space_ldl, SUFFIX)(ARG1_DECL,
>      hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
>  {
>      return glue(address_space_ldl_internal, SUFFIX)(ARG1, addr, attrs, r=
esult,
> -                                                    DEVICE_NATIVE_ENDIAN=
);
> +                                                    MO_TE);
>  }
>=20
>  uint32_t glue(address_space_ldl_le, SUFFIX)(ARG1_DECL,
>      hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
>  {
>      return glue(address_space_ldl_internal, SUFFIX)(ARG1, addr, attrs, r=
esult,
> -                                                    DEVICE_LITTLE_ENDIAN=
);
> +                                                    MO_LE);
>  }
>=20
>  uint32_t glue(address_space_ldl_be, SUFFIX)(ARG1_DECL,
>      hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
>  {
>      return glue(address_space_ldl_internal, SUFFIX)(ARG1, addr, attrs, r=
esult,
> -                                                    DEVICE_BIG_ENDIAN);
> +                                                    MO_BE);
>  }
>=20
>  /* warning: addr must be aligned */
>  static inline uint64_t glue(address_space_ldq_internal, SUFFIX)(ARG1_DEC=
L,
> -    hwaddr addr, MemTxAttrs attrs, MemTxResult *result,
> -    enum device_endian endian)
> +    hwaddr addr, MemTxAttrs attrs, MemTxResult *result, MemOp endian)
>  {
>      uint8_t *ptr;
>      uint64_t val;
> @@ -116,11 +114,11 @@ static inline uint64_t glue(address_space_ldq_inter=
nal, SUFFIX)(ARG1_DECL,
>          /* I/O case */
>          r =3D memory_region_dispatch_read(mr, addr1, &val, MO_64, attrs);
>  #if defined(TARGET_WORDS_BIGENDIAN)
> -        if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
> +        if (endian =3D=3D MO_LE) {
>              val =3D bswap64(val);
>          }
>  #else
> -        if (endian =3D=3D DEVICE_BIG_ENDIAN) {
> +        if (endian =3D=3D MO_BE) {
>              val =3D bswap64(val);
>          }
>  #endif
> @@ -128,10 +126,10 @@ static inline uint64_t glue(address_space_ldq_inter=
nal, SUFFIX)(ARG1_DECL,
>          /* RAM case */
>          ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
>          switch (endian) {
> -        case DEVICE_LITTLE_ENDIAN:
> +        case MO_LE:
>              val =3D ldq_le_p(ptr);
>              break;
> -        case DEVICE_BIG_ENDIAN:
> +        case MO_BE:
>              val =3D ldq_be_p(ptr);
>              break;
>          default:
> @@ -154,21 +152,21 @@ uint64_t glue(address_space_ldq, SUFFIX)(ARG1_DECL,
>      hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
>  {
>      return glue(address_space_ldq_internal, SUFFIX)(ARG1, addr, attrs, r=
esult,
> -                                                    DEVICE_NATIVE_ENDIAN=
);
> +                                                    MO_TE);
>  }
>=20
>  uint64_t glue(address_space_ldq_le, SUFFIX)(ARG1_DECL,
>      hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
>  {
>      return glue(address_space_ldq_internal, SUFFIX)(ARG1, addr, attrs, r=
esult,
> -                                                    DEVICE_LITTLE_ENDIAN=
);
> +                                                    MO_LE);
>  }
>=20
>  uint64_t glue(address_space_ldq_be, SUFFIX)(ARG1_DECL,
>      hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
>  {
>      return glue(address_space_ldq_internal, SUFFIX)(ARG1, addr, attrs, r=
esult,
> -                                                    DEVICE_BIG_ENDIAN);
> +                                                    MO_BE);
>  }
>=20
>  uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
> @@ -207,8 +205,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
>=20
>  /* warning: addr must be aligned */
>  static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DE=
CL,
> -    hwaddr addr, MemTxAttrs attrs, MemTxResult *result,
> -    enum device_endian endian)
> +    hwaddr addr, MemTxAttrs attrs, MemTxResult *result, MemOp endian)
>  {
>      uint8_t *ptr;
>      uint64_t val;
> @@ -226,11 +223,11 @@ static inline uint32_t glue(address_space_lduw_inte=
rnal, SUFFIX)(ARG1_DECL,
>          /* I/O case */
>          r =3D memory_region_dispatch_read(mr, addr1, &val, MO_16, attrs);
>  #if defined(TARGET_WORDS_BIGENDIAN)
> -        if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
> +        if (endian =3D=3D MO_LE) {
>              val =3D bswap16(val);
>          }
>  #else
> -        if (endian =3D=3D DEVICE_BIG_ENDIAN) {
> +        if (endian =3D=3D MO_BE) {
>              val =3D bswap16(val);
>          }
>  #endif
> @@ -238,10 +235,10 @@ static inline uint32_t glue(address_space_lduw_inte=
rnal, SUFFIX)(ARG1_DECL,
>          /* RAM case */
>          ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
>          switch (endian) {
> -        case DEVICE_LITTLE_ENDIAN:
> +        case MO_LE:
>              val =3D lduw_le_p(ptr);
>              break;
> -        case DEVICE_BIG_ENDIAN:
> +        case MO_BE:
>              val =3D lduw_be_p(ptr);
>              break;
>          default:
> @@ -264,21 +261,21 @@ uint32_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
>      hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
>  {
>      return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, =
result,
> -                                                     DEVICE_NATIVE_ENDIA=
N);
> +                                                     MO_TE);
>  }
>=20
>  uint32_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
>      hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
>  {
>      return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, =
result,
> -                                                     DEVICE_LITTLE_ENDIA=
N);
> +                                                     MO_LE);
>  }
>=20
>  uint32_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
>      hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
>  {
>      return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, =
result,
> -                                       DEVICE_BIG_ENDIAN);
> +                                       MO_BE);
>  }
>=20
>  /* warning: addr must be aligned. The ram page is not masked as dirty
> @@ -323,7 +320,7 @@ void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DE=
CL,
>  /* warning: addr must be aligned */
>  static inline void glue(address_space_stl_internal, SUFFIX)(ARG1_DECL,
>      hwaddr addr, uint32_t val, MemTxAttrs attrs,
> -    MemTxResult *result, enum device_endian endian)
> +    MemTxResult *result, MemOp endian)
>  {
>      uint8_t *ptr;
>      MemoryRegion *mr;
> @@ -338,11 +335,11 @@ static inline void glue(address_space_stl_internal,=
 SUFFIX)(ARG1_DECL,
>          release_lock |=3D prepare_mmio_access(mr);
>=20
>  #if defined(TARGET_WORDS_BIGENDIAN)
> -        if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
> +        if (endian =3D=3D MO_LE) {
>              val =3D bswap32(val);
>          }
>  #else
> -        if (endian =3D=3D DEVICE_BIG_ENDIAN) {
> +        if (endian =3D=3D MO_BE) {
>              val =3D bswap32(val);
>          }
>  #endif
> @@ -351,10 +348,10 @@ static inline void glue(address_space_stl_internal,=
 SUFFIX)(ARG1_DECL,
>          /* RAM case */
>          ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
>          switch (endian) {
> -        case DEVICE_LITTLE_ENDIAN:
> +        case MO_LE:
>              stl_le_p(ptr, val);
>              break;
> -        case DEVICE_BIG_ENDIAN:
> +        case MO_BE:
>              stl_be_p(ptr, val);
>              break;
>          default:
> @@ -377,21 +374,21 @@ void glue(address_space_stl, SUFFIX)(ARG1_DECL,
>      hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
>  {
>      glue(address_space_stl_internal, SUFFIX)(ARG1, addr, val, attrs,
> -                                             result, DEVICE_NATIVE_ENDIA=
N);
> +                                             result, MO_TE);
>  }
>=20
>  void glue(address_space_stl_le, SUFFIX)(ARG1_DECL,
>      hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
>  {
>      glue(address_space_stl_internal, SUFFIX)(ARG1, addr, val, attrs,
> -                                             result, DEVICE_LITTLE_ENDIA=
N);
> +                                             result, MO_LE);
>  }
>=20
>  void glue(address_space_stl_be, SUFFIX)(ARG1_DECL,
>      hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
>  {
>      glue(address_space_stl_internal, SUFFIX)(ARG1, addr, val, attrs,
> -                                             result, DEVICE_BIG_ENDIAN);
> +                                             result, MO_BE);
>  }
>=20
>  void glue(address_space_stb, SUFFIX)(ARG1_DECL,
> @@ -428,7 +425,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL,
>  /* warning: addr must be aligned */
>  static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
>      hwaddr addr, uint32_t val, MemTxAttrs attrs,
> -    MemTxResult *result, enum device_endian endian)
> +    MemTxResult *result, MemOp endian)
>  {
>      uint8_t *ptr;
>      MemoryRegion *mr;
> @@ -443,11 +440,11 @@ static inline void glue(address_space_stw_internal,=
 SUFFIX)(ARG1_DECL,
>          release_lock |=3D prepare_mmio_access(mr);
>=20
>  #if defined(TARGET_WORDS_BIGENDIAN)
> -        if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
> +        if (endian =3D=3D MO_LE) {
>              val =3D bswap16(val);
>          }
>  #else
> -        if (endian =3D=3D DEVICE_BIG_ENDIAN) {
> +        if (endian =3D=3D MO_BE) {
>              val =3D bswap16(val);
>          }
>  #endif
> @@ -456,10 +453,10 @@ static inline void glue(address_space_stw_internal,=
 SUFFIX)(ARG1_DECL,
>          /* RAM case */
>          ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
>          switch (endian) {
> -        case DEVICE_LITTLE_ENDIAN:
> +        case MO_LE:
>              stw_le_p(ptr, val);
>              break;
> -        case DEVICE_BIG_ENDIAN:
> +        case MO_BE:
>              stw_be_p(ptr, val);
>              break;
>          default:
> @@ -482,26 +479,26 @@ void glue(address_space_stw, SUFFIX)(ARG1_DECL,
>      hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
>  {
>      glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, res=
ult,
> -                                             DEVICE_NATIVE_ENDIAN);
> +                                             MO_TE);
>  }
>=20
>  void glue(address_space_stw_le, SUFFIX)(ARG1_DECL,
>      hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
>  {
>      glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, res=
ult,
> -                                             DEVICE_LITTLE_ENDIAN);
> +                                             MO_LE);
>  }
>=20
>  void glue(address_space_stw_be, SUFFIX)(ARG1_DECL,
>      hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
>  {
>      glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, res=
ult,
> -                               DEVICE_BIG_ENDIAN);
> +                               MO_BE);
>  }
>=20
>  static void glue(address_space_stq_internal, SUFFIX)(ARG1_DECL,
>      hwaddr addr, uint64_t val, MemTxAttrs attrs,
> -    MemTxResult *result, enum device_endian endian)
> +    MemTxResult *result, MemOp endian)
>  {
>      uint8_t *ptr;
>      MemoryRegion *mr;
> @@ -516,11 +513,11 @@ static void glue(address_space_stq_internal, SUFFIX=
)(ARG1_DECL,
>          release_lock |=3D prepare_mmio_access(mr);
>=20
>  #if defined(TARGET_WORDS_BIGENDIAN)
> -        if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
> +        if (endian =3D=3D MO_LE) {
>              val =3D bswap64(val);
>          }
>  #else
> -        if (endian =3D=3D DEVICE_BIG_ENDIAN) {
> +        if (endian =3D=3D MO_BE) {
>              val =3D bswap64(val);
>          }
>  #endif
> @@ -529,10 +526,10 @@ static void glue(address_space_stq_internal, SUFFIX=
)(ARG1_DECL,
>          /* RAM case */
>          ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
>          switch (endian) {
> -        case DEVICE_LITTLE_ENDIAN:
> +        case MO_LE:
>              stq_le_p(ptr, val);
>              break;
> -        case DEVICE_BIG_ENDIAN:
> +        case MO_BE:
>              stq_be_p(ptr, val);
>              break;
>          default:
> @@ -555,21 +552,21 @@ void glue(address_space_stq, SUFFIX)(ARG1_DECL,
>      hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result)
>  {
>      glue(address_space_stq_internal, SUFFIX)(ARG1, addr, val, attrs, res=
ult,
> -                                             DEVICE_NATIVE_ENDIAN);
> +                                             MO_TE);
>  }
>=20
>  void glue(address_space_stq_le, SUFFIX)(ARG1_DECL,
>      hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result)
>  {
>      glue(address_space_stq_internal, SUFFIX)(ARG1, addr, val, attrs, res=
ult,
> -                                             DEVICE_LITTLE_ENDIAN);
> +                                             MO_LE);
>  }
>=20
>  void glue(address_space_stq_be, SUFFIX)(ARG1_DECL,
>      hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result)
>  {
>      glue(address_space_stq_internal, SUFFIX)(ARG1, addr, val, attrs, res=
ult,
> -                                             DEVICE_BIG_ENDIAN);
> +                                             MO_BE);
>  }
>=20
>  #undef ARG1_DECL

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1Mv+oACgkQbDjKyiDZ
s5IuJw//eDQdSng81oD1feHs19Up7fklCoHxroRspywEkCEmmtltpAUgGkT1k611
M+HMUYAK7a7NmhTDJOKsbE9H4B84+qn4CT6B3bhhQIsae5Xr58l64SqTlShv8SZk
JFya4/y+3T2xGK/fzfjU3Lg/yrActbed+MPmeJu6F+LdHBrHIlhXE95hfVD2U0d5
mMVXWCn/VPhK6nJWGH7I8GkItrV8JAdGlsyHbc5KZHixM6BvRHtGs4uXq/54e0DU
+gGbb/7xdGkmrPTmm5kOICAwL2qow8PFMGuIAVBcf0v037bvxb1Of1ke1RRZCdDg
UQ2ljbaQVfkAQtJxRkO0miECxkB9Rdp9TtQcIb0JQpvYlPLQe2BiNwMp+z2/5Oax
8uSF7b70rxYantA20QZFNuPH5AgI+pxSWbBD8ryp4YKeJq4oyOuC7nXQPl2Xm+sk
kS35WdVM6dHAG+cVQo0E2LZRG1UkhWiMBBImv9uG3tjG9Z3GqpnWCgVOOtf1SlF1
tvRWvKyTL7x/t0GskxIEPGlwhnu1H4BR/+O500XZToDqaN93c9ftEumj4lQ6XOZu
3jVqtq0gjTmUbPcLlsqcJAEZniRKh0AveFwr0vaiZlPcnQh/uGzvkGL/o6zny5Mh
bkFaeFDWY4MvctJfwuDW8kwfSYGd33zzVPiak8BIV0yjR5T0wfk=
=MgI7
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--


--===============0621110564176322967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0621110564176322967==--

