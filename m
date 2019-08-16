Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D528FF6F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 11:50:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyYnu-0002yL-2H; Fri, 16 Aug 2019 09:45:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyYbg-0001jU-Ql
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 09:33:12 +0000
X-Inumbo-ID: dc367348-c008-11e9-a661-bc764e2007e4
Received: from smtpe1.intersmtp.com (unknown [213.121.35.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc367348-c008-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 09:33:10 +0000 (UTC)
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 BWP09926078.bt.com (10.36.82.109) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 10:32:26 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 10:33:05 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 10:33:04 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 33/42] exec: Replace device_endian with
 MemOp
Thread-Index: AQHVVBWaFVF+f9qANUCvvyD/694zuw==
Date: Fri, 16 Aug 2019 09:33:04 +0000
Message-ID: <1565947981050.26795@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 16 Aug 2019 09:45:48 +0000
Subject: [Xen-devel] [Qemu-devel] [PATCH v7 33/42] exec: Replace
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 philmd@redhat.com, amarkovic@wavecomp.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, pburton@wavecomp.com, sagark@eecs.berkeley.edu,
 green@moxielogic.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 gxt@mprc.pku.edu.cn, robh@kernel.org, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, balrogg@gmail.com,
 Andrew.Baumann@microsoft.com, mreitz@redhat.com, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 jslaby@suse.cz, marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Content-Type: multipart/mixed; boundary="===============8201054812744716714=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8201054812744716714==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156594798105026795btcom_"

--_000_156594798105026795btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Simplify endianness comparisons with consistent use of the more
expressive MemOp.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 exec.c                              |   8 +--
 hw/acpi/core.c                      |   6 +--
 hw/acpi/cpu.c                       |   2 +-
 hw/acpi/cpu_hotplug.c               |   2 +-
 hw/acpi/ich9.c                      |   4 +-
 hw/acpi/memory_hotplug.c            |   2 +-
 hw/acpi/nvdimm.c                    |   2 +-
 hw/acpi/pcihp.c                     |   2 +-
 hw/acpi/piix4.c                     |   2 +-
 hw/acpi/tco.c                       |   2 +-
 hw/adc/stm32f2xx_adc.c              |   2 +-
 hw/alpha/pci.c                      |   6 +--
 hw/alpha/typhoon.c                  |   6 +--
 hw/arm/allwinner-a10.c              |   2 +-
 hw/arm/armv7m.c                     |   2 +-
 hw/arm/aspeed.c                     |   2 +-
 hw/arm/aspeed_soc.c                 |   2 +-
 hw/arm/exynos4210.c                 |   2 +-
 hw/arm/highbank.c                   |   2 +-
 hw/arm/integratorcp.c               |   6 +--
 hw/arm/kzm.c                        |   2 +-
 hw/arm/msf2-soc.c                   |   2 +-
 hw/arm/musicpal.c                   |  20 +++----
 hw/arm/omap1.c                      |  40 +++++++-------
 hw/arm/omap2.c                      |  10 ++--
 hw/arm/omap_sx1.c                   |   2 +-
 hw/arm/palm.c                       |   2 +-
 hw/arm/pxa2xx.c                     |  20 +++----
 hw/arm/pxa2xx_gpio.c                |   2 +-
 hw/arm/pxa2xx_pic.c                 |   2 +-
 hw/arm/smmuv3.c                     |   2 +-
 hw/arm/spitz.c                      |   2 +-
 hw/arm/stellaris.c                  |   8 +--
 hw/arm/strongarm.c                  |  12 ++---
 hw/arm/versatilepb.c                |   2 +-
 hw/audio/ac97.c                     |   4 +-
 hw/audio/cs4231.c                   |   2 +-
 hw/audio/es1370.c                   |   2 +-
 hw/audio/intel-hda.c                |   2 +-
 hw/audio/marvell_88w8618.c          |   2 +-
 hw/audio/milkymist-ac97.c           |   2 +-
 hw/audio/pl041.c                    |   2 +-
 hw/block/fdc.c                      |   4 +-
 hw/block/nvme.c                     |   4 +-
 hw/block/onenand.c                  |   2 +-
 hw/block/pflash_cfi01.c             |   2 +-
 hw/block/pflash_cfi02.c             |   2 +-
 hw/char/bcm2835_aux.c               |   2 +-
 hw/char/cadence_uart.c              |   2 +-
 hw/char/cmsdk-apb-uart.c            |   2 +-
 hw/char/debugcon.c                  |   2 +-
 hw/char/digic-uart.c                |   2 +-
 hw/char/escc.c                      |   2 +-
 hw/char/etraxfs_ser.c               |   2 +-
 hw/char/exynos4210_uart.c           |   2 +-
 hw/char/grlib_apbuart.c             |   2 +-
 hw/char/imx_serial.c                |   2 +-
 hw/char/lm32_uart.c                 |   2 +-
 hw/char/mcf_uart.c                  |   2 +-
 hw/char/milkymist-uart.c            |   2 +-
 hw/char/nrf51_uart.c                |   2 +-
 hw/char/omap_uart.c                 |   6 +--
 hw/char/parallel.c                  |   2 +-
 hw/char/pl011.c                     |   2 +-
 hw/char/serial.c                    |  10 ++--
 hw/char/sh_serial.c                 |   2 +-
 hw/char/stm32f2xx_usart.c           |   2 +-
 hw/char/xilinx_uartlite.c           |   2 +-
 hw/core/empty_slot.c                |   2 +-
 hw/cris/axis_dev88.c                |   4 +-
 hw/display/ati.c                    |   2 +-
 hw/display/bcm2835_fb.c             |   2 +-
 hw/display/bochs-display.c          |   4 +-
 hw/display/cg3.c                    |   2 +-
 hw/display/cirrus_vga.c             |  10 ++--
 hw/display/edid-region.c            |   2 +-
 hw/display/exynos4210_fimd.c        |   2 +-
 hw/display/g364fb.c                 |   2 +-
 hw/display/jazz_led.c               |   2 +-
 hw/display/milkymist-tmu2.c         |   2 +-
 hw/display/milkymist-vgafb.c        |   2 +-
 hw/display/omap_dss.c               |  10 ++--
 hw/display/omap_lcdc.c              |   2 +-
 hw/display/pl110.c                  |   2 +-
 hw/display/pxa2xx_lcd.c             |   2 +-
 hw/display/sm501.c                  |  10 ++--
 hw/display/tc6393xb.c               |   2 +-
 hw/display/tcx.c                    |  14 ++---
 hw/display/vga-isa-mm.c             |   2 +-
 hw/display/vga-pci.c                |   6 +--
 hw/display/vga.c                    |   2 +-
 hw/display/vmware_vga.c             |   2 +-
 hw/display/xlnx_dp.c                |   8 +--
 hw/dma/bcm2835_dma.c                |   4 +-
 hw/dma/etraxfs_dma.c                |   8 +--
 hw/dma/i8257.c                      |   4 +-
 hw/dma/omap_dma.c                   |   4 +-
 hw/dma/pl080.c                      |   2 +-
 hw/dma/pl330.c                      |   2 +-
 hw/dma/puv3_dma.c                   |   2 +-
 hw/dma/pxa2xx_dma.c                 |   2 +-
 hw/dma/rc4030.c                     |   4 +-
 hw/dma/sparc32_dma.c                |   2 +-
 hw/dma/xilinx_axidma.c              |   2 +-
 hw/dma/xlnx-zdma.c                  |   2 +-
 hw/dma/xlnx-zynq-devcfg.c           |   2 +-
 hw/dma/xlnx_dpdma.c                 |   2 +-
 hw/gpio/bcm2835_gpio.c              |   2 +-
 hw/gpio/imx_gpio.c                  |   2 +-
 hw/gpio/mpc8xxx.c                   |   2 +-
 hw/gpio/nrf51_gpio.c                |   2 +-
 hw/gpio/omap_gpio.c                 |   6 +--
 hw/gpio/pl061.c                     |   2 +-
 hw/gpio/puv3_gpio.c                 |   2 +-
 hw/gpio/zaurus.c                    |   2 +-
 hw/hppa/dino.c                      |   6 +--
 hw/hppa/machine.c                   |   2 +-
 hw/hppa/pci.c                       |   6 +--
 hw/hyperv/hyperv_testdev.c          |   2 +-
 hw/i2c/aspeed_i2c.c                 |   4 +-
 hw/i2c/exynos4210_i2c.c             |   2 +-
 hw/i2c/imx_i2c.c                    |   2 +-
 hw/i2c/microbit_i2c.c               |   2 +-
 hw/i2c/mpc_i2c.c                    |   2 +-
 hw/i2c/omap_i2c.c                   |   2 +-
 hw/i2c/pm_smbus.c                   |   2 +-
 hw/i2c/ppc4xx_i2c.c                 |   2 +-
 hw/i2c/versatile_i2c.c              |   2 +-
 hw/i386/amd_iommu.c                 |   4 +-
 hw/i386/intel_iommu.c               |   4 +-
 hw/i386/kvm/apic.c                  |   2 +-
 hw/i386/kvmvapic.c                  |   2 +-
 hw/i386/pc.c                        |   6 +--
 hw/i386/vmport.c                    |   2 +-
 hw/i386/xen/xen_apic.c              |   2 +-
 hw/i386/xen/xen_platform.c          |   4 +-
 hw/i386/xen/xen_pvdevice.c          |   2 +-
 hw/ide/ahci-allwinner.c             |   2 +-
 hw/ide/ahci.c                       |   4 +-
 hw/ide/macio.c                      |   2 +-
 hw/ide/mmio.c                       |   4 +-
 hw/ide/pci.c                        |   6 +--
 hw/ide/sii3112.c                    |   2 +-
 hw/input/milkymist-softusb.c        |   2 +-
 hw/input/pckbd.c                    |   6 +--
 hw/input/pl050.c                    |   2 +-
 hw/input/pxa2xx_keypad.c            |   2 +-
 hw/intc/allwinner-a10-pic.c         |   2 +-
 hw/intc/apic.c                      |   2 +-
 hw/intc/arm_gic.c                   |  12 ++---
 hw/intc/arm_gicv2m.c                |   2 +-
 hw/intc/arm_gicv3.c                 |   4 +-
 hw/intc/arm_gicv3_its_common.c      |   2 +-
 hw/intc/armv7m_nvic.c               |   6 +--
 hw/intc/aspeed_vic.c                |   2 +-
 hw/intc/bcm2835_ic.c                |   2 +-
 hw/intc/bcm2836_control.c           |   2 +-
 hw/intc/etraxfs_pic.c               |   2 +-
 hw/intc/exynos4210_combiner.c       |   2 +-
 hw/intc/grlib_irqmp.c               |   2 +-
 hw/intc/heathrow_pic.c              |   2 +-
 hw/intc/imx_avic.c                  |   2 +-
 hw/intc/imx_gpcv2.c                 |   2 +-
 hw/intc/ioapic.c                    |   2 +-
 hw/intc/mips_gic.c                  |   2 +-
 hw/intc/omap_intc.c                 |   4 +-
 hw/intc/ompic.c                     |   2 +-
 hw/intc/openpic.c                   |  20 +++----
 hw/intc/openpic_kvm.c               |   2 +-
 hw/intc/pl190.c                     |   2 +-
 hw/intc/pnv_xive.c                  |  14 ++---
 hw/intc/puv3_intc.c                 |   2 +-
 hw/intc/sh_intc.c                   |   2 +-
 hw/intc/slavio_intctl.c             |   4 +-
 hw/intc/xics_pnv.c                  |   2 +-
 hw/intc/xilinx_intc.c               |   2 +-
 hw/intc/xive.c                      |   6 +--
 hw/intc/xlnx-pmu-iomod-intc.c       |   2 +-
 hw/intc/xlnx-zynqmp-ipi.c           |   2 +-
 hw/ipack/tpci200.c                  |  10 ++--
 hw/ipmi/isa_ipmi_bt.c               |   2 +-
 hw/ipmi/isa_ipmi_kcs.c              |   2 +-
 hw/isa/lpc_ich9.c                   |   4 +-
 hw/isa/pc87312.c                    |   2 +-
 hw/isa/vt82c686.c                   |   2 +-
 hw/m68k/mcf5206.c                   |   2 +-
 hw/m68k/mcf5208.c                   |   4 +-
 hw/m68k/mcf_intc.c                  |   2 +-
 hw/microblaze/petalogix_ml605_mmu.c |   2 +-
 hw/mips/boston.c                    |   6 +--
 hw/mips/gt64xxx_pci.c               |   2 +-
 hw/mips/mips_jazz.c                 |   8 +--
 hw/mips/mips_malta.c                |   4 +-
 hw/mips/mips_r4k.c                  |   2 +-
 hw/misc/a9scu.c                     |   2 +-
 hw/misc/applesmc.c                  |   6 +--
 hw/misc/arm11scu.c                  |   2 +-
 hw/misc/arm_integrator_debug.c      |   2 +-
 hw/misc/arm_l2x0.c                  |   2 +-
 hw/misc/arm_sysctl.c                |   2 +-
 hw/misc/armsse-cpuid.c              |   2 +-
 hw/misc/armsse-mhu.c                |   2 +-
 hw/misc/aspeed_scu.c                |   2 +-
 hw/misc/aspeed_sdmc.c               |   2 +-
 hw/misc/aspeed_xdma.c               |   2 +-
 hw/misc/bcm2835_mbox.c              |   2 +-
 hw/misc/bcm2835_property.c          |   2 +-
 hw/misc/bcm2835_rng.c               |   2 +-
 hw/misc/debugexit.c                 |   2 +-
 hw/misc/eccmemctl.c                 |   4 +-
 hw/misc/edu.c                       |   2 +-
 hw/misc/exynos4210_clk.c            |   2 +-
 hw/misc/exynos4210_pmu.c            |   2 +-
 hw/misc/exynos4210_rng.c            |   2 +-
 hw/misc/grlib_ahb_apb_pnp.c         |   4 +-
 hw/misc/imx25_ccm.c                 |   2 +-
 hw/misc/imx2_wdt.c                  |   2 +-
 hw/misc/imx31_ccm.c                 |   2 +-
 hw/misc/imx6_ccm.c                  |   4 +-
 hw/misc/imx6_src.c                  |   2 +-
 hw/misc/imx6ul_ccm.c                |   4 +-
 hw/misc/imx7_ccm.c                  |   4 +-
 hw/misc/imx7_gpr.c                  |   2 +-
 hw/misc/imx7_snvs.c                 |   2 +-
 hw/misc/iotkit-secctl.c             |   4 +-
 hw/misc/iotkit-sysctl.c             |   2 +-
 hw/misc/iotkit-sysinfo.c            |   2 +-
 hw/misc/ivshmem.c                   |   2 +-
 hw/misc/macio/cuda.c                |   2 +-
 hw/misc/macio/gpio.c                |   2 +-
 hw/misc/macio/mac_dbdma.c           |   2 +-
 hw/misc/macio/macio.c               |   2 +-
 hw/misc/macio/pmu.c                 |   2 +-
 hw/misc/milkymist-hpdmc.c           |   2 +-
 hw/misc/milkymist-pfpu.c            |   2 +-
 hw/misc/mips_cmgcr.c                |   2 +-
 hw/misc/mips_cpc.c                  |   2 +-
 hw/misc/mips_itu.c                  |   4 +-
 hw/misc/mos6522.c                   |   2 +-
 hw/misc/mps2-fpgaio.c               |   2 +-
 hw/misc/mps2-scc.c                  |   2 +-
 hw/misc/msf2-sysreg.c               |   2 +-
 hw/misc/mst_fpga.c                  |   6 +--
 hw/misc/nrf51_rng.c                 |   2 +-
 hw/misc/omap_gpmc.c                 |   6 +--
 hw/misc/omap_l4.c                   |   2 +-
 hw/misc/omap_sdrc.c                 |   2 +-
 hw/misc/omap_tap.c                  |   2 +-
 hw/misc/pc-testdev.c                |  10 ++--
 hw/misc/pci-testdev.c               |   4 +-
 hw/misc/puv3_pm.c                   |   2 +-
 hw/misc/slavio_misc.c               |  16 +++---
 hw/misc/stm32f2xx_syscfg.c          |   2 +-
 hw/misc/tz-mpc.c                    |   4 +-
 hw/misc/tz-msc.c                    |   2 +-
 hw/misc/tz-ppc.c                    |   2 +-
 hw/misc/unimp.c                     |   2 +-
 hw/misc/zynq-xadc.c                 |   2 +-
 hw/misc/zynq_slcr.c                 |   2 +-
 hw/moxie/moxiesim.c                 |   2 +-
 hw/net/allwinner_emac.c             |   2 +-
 hw/net/cadence_gem.c                |   2 +-
 hw/net/can/can_kvaser_pci.c         |   6 +--
 hw/net/can/can_mioe3680_pci.c       |   4 +-
 hw/net/can/can_pcm3680_pci.c        |   4 +-
 hw/net/dp8393x.c                    |   2 +-
 hw/net/e1000.c                      |   4 +-
 hw/net/e1000e.c                     |   4 +-
 hw/net/eepro100.c                   |   2 +-
 hw/net/etraxfs_eth.c                |   2 +-
 hw/net/fsl_etsec/etsec.c            |   2 +-
 hw/net/ftgmac100.c                  |   2 +-
 hw/net/imx_fec.c                    |   2 +-
 hw/net/lan9118.c                    |   4 +-
 hw/net/lance.c                      |   2 +-
 hw/net/mcf_fec.c                    |   2 +-
 hw/net/milkymist-minimac2.c         |   2 +-
 hw/net/ne2000.c                     |   2 +-
 hw/net/pcnet-pci.c                  |   4 +-
 hw/net/rocker/rocker.c              |   2 +-
 hw/net/rtl8139.c                    |   2 +-
 hw/net/smc91c111.c                  |   2 +-
 hw/net/stellaris_enet.c             |   2 +-
 hw/net/sungem.c                     |  12 ++---
 hw/net/sunhme.c                     |  10 ++--
 hw/net/vmxnet3.c                    |   4 +-
 hw/net/xgmac.c                      |   2 +-
 hw/net/xilinx_axienet.c             |   2 +-
 hw/net/xilinx_ethlite.c             |   2 +-
 hw/nios2/10m50_devboard.c           |   2 +-
 hw/nvram/ds1225y.c                  |   2 +-
 hw/nvram/fw_cfg.c                   |   8 +--
 hw/nvram/mac_nvram.c                |   2 +-
 hw/nvram/nrf51_nvm.c                |   8 +--
 hw/openrisc/openrisc_sim.c          |   2 +-
 hw/pci-host/bonito.c                |  10 ++--
 hw/pci-host/designware.c            |   6 +--
 hw/pci-host/piix.c                  |   2 +-
 hw/pci-host/ppce500.c               |   2 +-
 hw/pci-host/prep.c                  |   4 +-
 hw/pci-host/q35.c                   |   4 +-
 hw/pci-host/sabre.c                 |   4 +-
 hw/pci-host/uninorth.c              |   4 +-
 hw/pci-host/versatile.c             |   4 +-
 hw/pci/msix.c                       |   4 +-
 hw/pci/pci_host.c                   |   8 +--
 hw/pci/pcie_host.c                  |   2 +-
 hw/pci/shpc.c                       |   2 +-
 hw/pcmcia/pxa2xx.c                  |   6 +--
 hw/ppc/e500.c                       |   4 +-
 hw/ppc/mpc8544_guts.c               |   2 +-
 hw/ppc/pnv_core.c                   |   6 +--
 hw/ppc/pnv_lpc.c                    |   8 +--
 hw/ppc/pnv_occ.c                    |   4 +-
 hw/ppc/pnv_psi.c                    |   8 +--
 hw/ppc/pnv_xscom.c                  |   2 +-
 hw/ppc/ppc405_boards.c              |   4 +-
 hw/ppc/ppc405_uc.c                  |  14 ++---
 hw/ppc/ppc440_bamboo.c              |   4 +-
 hw/ppc/ppc440_pcix.c                |   4 +-
 hw/ppc/ppc4xx_pci.c                 |   2 +-
 hw/ppc/ppce500_spin.c               |   2 +-
 hw/ppc/sam460ex.c                   |   4 +-
 hw/ppc/spapr_pci.c                  |   2 +-
 hw/ppc/virtex_ml507.c               |   2 +-
 hw/rdma/vmw/pvrdma_main.c           |   4 +-
 hw/riscv/sifive_clint.c             |   2 +-
 hw/riscv/sifive_gpio.c              |   2 +-
 hw/riscv/sifive_plic.c              |   2 +-
 hw/riscv/sifive_prci.c              |   2 +-
 hw/riscv/sifive_test.c              |   2 +-
 hw/riscv/sifive_uart.c              |   2 +-
 hw/riscv/virt.c                     |   2 +-
 hw/s390x/s390-pci-bus.c             |   2 +-
 hw/scsi/esp-pci.c                   |   2 +-
 hw/scsi/esp.c                       |   2 +-
 hw/scsi/lsi53c895a.c                |   6 +--
 hw/scsi/megasas.c                   |   6 +--
 hw/scsi/mptsas.c                    |   6 +--
 hw/scsi/vmw_pvscsi.c                |   2 +-
 hw/sd/bcm2835_sdhost.c              |   2 +-
 hw/sd/milkymist-memcard.c           |   2 +-
 hw/sd/omap_mmc.c                    |   2 +-
 hw/sd/pl181.c                       |   2 +-
 hw/sd/pxa2xx_mmci.c                 |   2 +-
 hw/sd/sdhci.c                       |   4 +-
 hw/sh4/r2d.c                        |   2 +-
 hw/sh4/sh7750.c                     |   4 +-
 hw/sh4/sh_pci.c                     |   2 +-
 hw/sparc/sun4m_iommu.c              |   2 +-
 hw/sparc64/niagara.c                |   2 +-
 hw/sparc64/sun4u.c                  |   4 +-
 hw/sparc64/sun4u_iommu.c            |   2 +-
 hw/ssi/aspeed_smc.c                 |   6 +--
 hw/ssi/imx_spi.c                    |   2 +-
 hw/ssi/mss-spi.c                    |   2 +-
 hw/ssi/omap_spi.c                   |   2 +-
 hw/ssi/pl022.c                      |   2 +-
 hw/ssi/stm32f2xx_spi.c              |   2 +-
 hw/ssi/xilinx_spi.c                 |   2 +-
 hw/ssi/xilinx_spips.c               |   8 +--
 hw/timer/a9gtimer.c                 |   4 +-
 hw/timer/allwinner-a10-pit.c        |   2 +-
 hw/timer/altera_timer.c             |   2 +-
 hw/timer/arm_mptimer.c              |   4 +-
 hw/timer/arm_timer.c                |   4 +-
 hw/timer/armv7m_systick.c           |   2 +-
 hw/timer/aspeed_rtc.c               |   2 +-
 hw/timer/aspeed_timer.c             |   2 +-
 hw/timer/cadence_ttc.c              |   2 +-
 hw/timer/cmsdk-apb-dualtimer.c      |   2 +-
 hw/timer/cmsdk-apb-timer.c          |   2 +-
 hw/timer/digic-timer.c              |   2 +-
 hw/timer/etraxfs_timer.c            |   2 +-
 hw/timer/exynos4210_mct.c           |   2 +-
 hw/timer/exynos4210_pwm.c           |   2 +-
 hw/timer/exynos4210_rtc.c           |   2 +-
 hw/timer/grlib_gptimer.c            |   2 +-
 hw/timer/hpet.c                     |   2 +-
 hw/timer/i8254.c                    |   2 +-
 hw/timer/imx_epit.c                 |   2 +-
 hw/timer/imx_gpt.c                  |   2 +-
 hw/timer/lm32_timer.c               |   2 +-
 hw/timer/m48t59.c                   |   4 +-
 hw/timer/mc146818rtc.c              |   2 +-
 hw/timer/milkymist-sysctl.c         |   2 +-
 hw/timer/mss-timer.c                |   2 +-
 hw/timer/nrf51_timer.c              |   2 +-
 hw/timer/omap_gptimer.c             |   2 +-
 hw/timer/omap_synctimer.c           |   2 +-
 hw/timer/pl031.c                    |   2 +-
 hw/timer/puv3_ost.c                 |   2 +-
 hw/timer/pxa2xx_timer.c             |   2 +-
 hw/timer/sh_timer.c                 |   2 +-
 hw/timer/slavio_timer.c             |   2 +-
 hw/timer/stm32f2xx_timer.c          |   2 +-
 hw/timer/sun4v-rtc.c                |   2 +-
 hw/timer/xilinx_timer.c             |   2 +-
 hw/timer/xlnx-zynqmp-rtc.c          |   2 +-
 hw/tpm/tpm_crb.c                    |   2 +-
 hw/tpm/tpm_tis.c                    |   2 +-
 hw/usb/chipidea.c                   |   4 +-
 hw/usb/hcd-ehci-sysbus.c            |   2 +-
 hw/usb/hcd-ehci.c                   |   6 +--
 hw/usb/hcd-ohci.c                   |   2 +-
 hw/usb/hcd-uhci.c                   |   2 +-
 hw/usb/hcd-xhci.c                   |  10 ++--
 hw/usb/tusb6010.c                   |   2 +-
 hw/vfio/common.c                    |   2 +-
 hw/vfio/pci-quirks.c                |  26 ++++-----
 hw/vfio/pci.c                       |   4 +-
 hw/virtio/virtio-mmio.c             |   2 +-
 hw/virtio/virtio-pci.c              |  12 ++---
 hw/watchdog/cmsdk-apb-watchdog.c    |   2 +-
 hw/watchdog/wdt_aspeed.c            |   2 +-
 hw/watchdog/wdt_i6300esb.c          |   2 +-
 hw/xen/xen_pt.c                     |   2 +-
 hw/xen/xen_pt_msi.c                 |   2 +-
 hw/xtensa/mx_pic.c                  |   2 +-
 hw/xtensa/xtfpga.c                  |   6 +--
 include/exec/cpu-common.h           |   4 +-
 include/exec/memory.h               |   2 +-
 include/hw/char/serial.h            |   2 +-
 ioport.c                            |   4 +-
 memory.c                            |  10 ++--
 memory_ldst.inc.c                   | 103 +++++++++++++++++---------------=
----
 426 files changed, 773 insertions(+), 776 deletions(-)

diff --git a/exec.c b/exec.c
index 9f69197..303f9a7 100644
--- a/exec.c
+++ b/exec.c
@@ -2796,7 +2796,7 @@ static bool notdirty_mem_accepts(void *opaque, hwaddr=
 addr,
 static const MemoryRegionOps notdirty_mem_ops =3D {
     .write =3D notdirty_mem_write,
     .valid.accepts =3D notdirty_mem_accepts,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
@@ -2925,7 +2925,7 @@ static MemTxResult watch_mem_write(void *opaque, hwad=
dr addr,
 static const MemoryRegionOps watch_mem_ops =3D {
     .read_with_attrs =3D watch_mem_read,
     .write_with_attrs =3D watch_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
@@ -3001,7 +3001,7 @@ static const MemoryRegionOps subpage_ops =3D {
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 8,
     .valid.accepts =3D subpage_accepts,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static int subpage_register (subpage_t *mmio, uint32_t start, uint32_t end=
,
@@ -3076,7 +3076,7 @@ static bool readonly_mem_accepts(void *opaque, hwaddr=
 addr,
 static const MemoryRegionOps readonly_mem_ops =3D {
     .write =3D readonly_mem_write,
     .valid.accepts =3D readonly_mem_accepts,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 228828a..971095d 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -463,7 +463,7 @@ static const MemoryRegionOps acpi_pm_evt_ops =3D {
     .write =3D acpi_pm_evt_write,
     .valid.min_access_size =3D 2,
     .valid.max_access_size =3D 2,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 void acpi_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
@@ -532,7 +532,7 @@ static const MemoryRegionOps acpi_pm_tmr_ops =3D {
     .write =3D acpi_pm_tmr_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 void acpi_pm_tmr_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
@@ -604,7 +604,7 @@ static const MemoryRegionOps acpi_pm_cnt_ops =3D {
     .write =3D acpi_pm_cnt_write,
     .valid.min_access_size =3D 2,
     .valid.max_access_size =3D 2,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 7a90c8f..be6b802 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -179,7 +179,7 @@ static void cpu_hotplug_wr(void *opaque, hwaddr addr, u=
int64_t data,
 static const MemoryRegionOps cpu_hotplug_ops =3D {
     .read =3D cpu_hotplug_rd,
     .write =3D cpu_hotplug_wr,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
index 5243918..f7746d4 100644
--- a/hw/acpi/cpu_hotplug.c
+++ b/hw/acpi/cpu_hotplug.c
@@ -49,7 +49,7 @@ static void cpu_status_write(void *opaque, hwaddr addr, u=
int64_t data,
 static const MemoryRegionOps AcpiCpuHotplug_ops =3D {
     .read =3D cpu_status_read,
     .write =3D cpu_status_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index e53dfe1..29cef74 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -74,7 +74,7 @@ static const MemoryRegionOps ich9_gpe_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 1,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t ich9_smi_readl(void *opaque, hwaddr addr, unsigned width)
@@ -115,7 +115,7 @@ static const MemoryRegionOps ich9_smi_ops =3D {
     .write =3D ich9_smi_writel,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 void ich9_pm_iospace_update(ICH9LPCPMRegs *pm, uint32_t pm_io_base)
diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 297812d..475fd64 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -201,7 +201,7 @@ static void acpi_memory_hotplug_write(void *opaque, hwa=
ddr addr, uint64_t data,
 static const MemoryRegionOps acpi_memory_hotplug_ops =3D {
     .read =3D acpi_memory_hotplug_read,
     .write =3D acpi_memory_hotplug_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 9fdad6d..b7fe093 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -911,7 +911,7 @@ exit:
 static const MemoryRegionOps nvdimm_dsm_ops =3D {
     .read =3D nvdimm_dsm_read,
     .write =3D nvdimm_dsm_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 613406d..5597b29 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -353,7 +353,7 @@ static void pci_write(void *opaque, hwaddr addr, uint64=
_t data,
 static const MemoryRegionOps acpi_pcihp_io_ops =3D {
     .read =3D pci_read,
     .write =3D pci_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index ec4e186..871e026 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -597,7 +597,7 @@ static const MemoryRegionOps piix4_gpe_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 1,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };


diff --git a/hw/acpi/tco.c b/hw/acpi/tco.c
index acfb65e..0a0a670 100644
--- a/hw/acpi/tco.c
+++ b/hw/acpi/tco.c
@@ -215,7 +215,7 @@ static const MemoryRegionOps tco_io_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 2,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 void acpi_pm_tco_init(TCOIORegs *tr, MemoryRegion *parent)
diff --git a/hw/adc/stm32f2xx_adc.c b/hw/adc/stm32f2xx_adc.c
index c93b60e..53717be 100644
--- a/hw/adc/stm32f2xx_adc.c
+++ b/hw/adc/stm32f2xx_adc.c
@@ -245,7 +245,7 @@ static void stm32f2xx_adc_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps stm32f2xx_adc_ops =3D {
     .read =3D stm32f2xx_adc_read,
     .write =3D stm32f2xx_adc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_stm32f2xx_adc =3D {
diff --git a/hw/alpha/pci.c b/hw/alpha/pci.c
index fb902bb..7bd9e58 100644
--- a/hw/alpha/pci.c
+++ b/hw/alpha/pci.c
@@ -27,7 +27,7 @@ static void ignore_write(void *opaque, hwaddr addr, uint6=
4_t v, unsigned size)
 const MemoryRegionOps alpha_pci_ignore_ops =3D {
     .read =3D ignore_read,
     .write =3D ignore_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
@@ -57,7 +57,7 @@ static void bw_conf1_write(void *opaque, hwaddr addr,
 const MemoryRegionOps alpha_pci_conf1_ops =3D {
     .read =3D bw_conf1_read,
     .write =3D bw_conf1_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
@@ -80,7 +80,7 @@ static void special_write(void *opaque, hwaddr addr,
 const MemoryRegionOps alpha_pci_iack_ops =3D {
     .read =3D iack_read,
     .write =3D special_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 3f34a51..6551594 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -568,7 +568,7 @@ static MemTxResult pchip_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps cchip_ops =3D {
     .read_with_attrs =3D cchip_read,
     .write_with_attrs =3D cchip_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
@@ -582,7 +582,7 @@ static const MemoryRegionOps cchip_ops =3D {
 static const MemoryRegionOps dchip_ops =3D {
     .read =3D dchip_read,
     .write =3D dchip_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
@@ -596,7 +596,7 @@ static const MemoryRegionOps dchip_ops =3D {
 static const MemoryRegionOps pchip_ops =3D {
     .read_with_attrs =3D pchip_read,
     .write_with_attrs =3D pchip_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 35e906c..db38315 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -114,7 +114,7 @@ static void aw_a10_realize(DeviceState *dev, Error **er=
rp)

     /* FIXME use a qdev chardev prop instead of serial_hd() */
     serial_mm_init(get_system_memory(), AW_A10_UART0_REG_BASE, 2, s->irq[1=
],
-                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   115200, serial_hd(0), MO_TE);
 }

 static void aw_a10_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index b9efad6..9bce022 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -86,7 +86,7 @@ static MemTxResult bitband_write(void *opaque, hwaddr off=
set, uint64_t value,
 static const MemoryRegionOps bitband_ops =3D {
     .read_with_attrs =3D bitband_read,
     .write_with_attrs =3D bitband_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 4,
     .valid.min_access_size =3D 1,
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 843b708..c0ccb35 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -105,7 +105,7 @@ static void max_ram_write(void *opaque, hwaddr offset, =
uint64_t value,
 static const MemoryRegionOps max_ram_ops =3D {
     .read =3D max_ram_read,
     .write =3D max_ram_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 #define FIRMWARE_ADDR 0x0
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index c6fb370..9437b9d 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -331,7 +331,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error =
**errp)
     if (serial_hd(0)) {
         qemu_irq uart5 =3D aspeed_soc_get_irq(s, ASPEED_UART5);
         serial_mm_init(get_system_memory(), sc->info->memmap[ASPEED_UART5]=
, 2,
-                       uart5, 38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+                       uart5, 38400, serial_hd(0), MO_LE);
     }

     /* I2C */
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index becd864..c1ce423 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -119,7 +119,7 @@ static void exynos4210_chipid_and_omr_write(void *opaqu=
e, hwaddr offset,
 static const MemoryRegionOps exynos4210_chipid_and_omr_ops =3D {
     .read =3D exynos4210_chipid_and_omr_read,
     .write =3D exynos4210_chipid_and_omr_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         .max_access_size =3D 1,
     }
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index def0f1c..0d1b699 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -148,7 +148,7 @@ static uint64_t hb_regs_read(void *opaque, hwaddr offse=
t,
 static const MemoryRegionOps hb_mem_ops =3D {
     .read =3D hb_regs_read,
     .write =3D hb_regs_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 #define TYPE_HIGHBANK_REGISTERS "highbank-regs"
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 200c010..260d928 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -259,7 +259,7 @@ static void integratorcm_write(void *opaque, hwaddr off=
set,
 static const MemoryRegionOps integratorcm_ops =3D {
     .read =3D integratorcm_read,
     .write =3D integratorcm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void integratorcm_init(Object *obj)
@@ -435,7 +435,7 @@ static void icp_pic_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps icp_pic_ops =3D {
     .read =3D icp_pic_read,
     .write =3D icp_pic_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void icp_pic_init(Object *obj)
@@ -527,7 +527,7 @@ static void icp_control_write(void *opaque, hwaddr offs=
et,
 static const MemoryRegionOps icp_control_ops =3D {
     .read =3D icp_control_read,
     .write =3D icp_control_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void icp_control_mmc_wprot(void *opaque, int line, int level)
diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 59d2102..836c1a7 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -122,7 +122,7 @@ static void kzm_init(MachineState *machine)
     if (serial_hd(2)) { /* touchscreen */
         serial_mm_init(get_system_memory(), KZM_FPGA_ADDR+0x10, 0,
                        qdev_get_gpio_in(DEVICE(&s->soc.avic), 52),
-                       14745600, serial_hd(2), DEVICE_NATIVE_ENDIAN);
+                       14745600, serial_hd(2), MO_TE);
     }

     kzm_binfo.ram_size =3D machine->ram_size;
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 1ccb644..30ea87f 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -139,7 +139,7 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Er=
ror **errp)
         if (serial_hd(i)) {
             serial_mm_init(get_system_memory(), uart_addr[i], 2,
                            qdev_get_gpio_in(armv7m, uart_irq[i]),
-                           115200, serial_hd(i), DEVICE_NATIVE_ENDIAN);
+                           115200, serial_hd(i), MO_TE);
         }
     }

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 95d56f3..e20f0a9 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -366,7 +366,7 @@ static void mv88w8618_eth_write(void *opaque, hwaddr of=
fset,
 static const MemoryRegionOps mv88w8618_eth_ops =3D {
     .read =3D mv88w8618_eth_read,
     .write =3D mv88w8618_eth_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void eth_cleanup(NetClientState *nc)
@@ -612,7 +612,7 @@ static void musicpal_lcd_write(void *opaque, hwaddr off=
set,
 static const MemoryRegionOps musicpal_lcd_ops =3D {
     .read =3D musicpal_lcd_read,
     .write =3D musicpal_lcd_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const GraphicHwOps musicpal_gfx_ops =3D {
@@ -753,7 +753,7 @@ static void mv88w8618_pic_reset(DeviceState *d)
 static const MemoryRegionOps mv88w8618_pic_ops =3D {
     .read =3D mv88w8618_pic_read,
     .write =3D mv88w8618_pic_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void mv88w8618_pic_init(Object *obj)
@@ -917,7 +917,7 @@ static void mv88w8618_pit_reset(DeviceState *d)
 static const MemoryRegionOps mv88w8618_pit_ops =3D {
     .read =3D mv88w8618_pit_read,
     .write =3D mv88w8618_pit_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void mv88w8618_pit_init(Object *obj)
@@ -1021,7 +1021,7 @@ static void mv88w8618_flashcfg_write(void *opaque, hw=
addr offset,
 static const MemoryRegionOps mv88w8618_flashcfg_ops =3D {
     .read =3D mv88w8618_flashcfg_read,
     .write =3D mv88w8618_flashcfg_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void mv88w8618_flashcfg_init(Object *obj)
@@ -1094,7 +1094,7 @@ static void musicpal_misc_write(void *opaque, hwaddr =
offset,
 static const MemoryRegionOps musicpal_misc_ops =3D {
     .read =3D musicpal_misc_read,
     .write =3D musicpal_misc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void musicpal_misc_init(Object *obj)
@@ -1142,7 +1142,7 @@ static void mv88w8618_wlan_write(void *opaque, hwaddr=
 offset,
 static const MemoryRegionOps mv88w8618_wlan_ops =3D {
     .read =3D mv88w8618_wlan_read,
     .write =3Dmv88w8618_wlan_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void mv88w8618_wlan_realize(DeviceState *dev, Error **errp)
@@ -1339,7 +1339,7 @@ static void musicpal_gpio_write(void *opaque, hwaddr =
offset,
 static const MemoryRegionOps musicpal_gpio_ops =3D {
     .read =3D musicpal_gpio_read,
     .write =3D musicpal_gpio_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void musicpal_gpio_reset(DeviceState *d)
@@ -1609,11 +1609,11 @@ static void musicpal_init(MachineState *machine)

     if (serial_hd(0)) {
         serial_mm_init(address_space_mem, MP_UART1_BASE, 2, pic[MP_UART1_I=
RQ],
-                       1825000, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                       1825000, serial_hd(0), MO_TE);
     }
     if (serial_hd(1)) {
         serial_mm_init(address_space_mem, MP_UART2_BASE, 2, pic[MP_UART2_I=
RQ],
-                       1825000, serial_hd(1), DEVICE_NATIVE_ENDIAN);
+                       1825000, serial_hd(1), MO_TE);
     }

     /* Register flash */
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 28fbe27..174a000 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -252,7 +252,7 @@ static void omap_mpu_timer_write(void *opaque, hwaddr a=
ddr,
 static const MemoryRegionOps omap_mpu_timer_ops =3D {
     .read =3D omap_mpu_timer_read,
     .write =3D omap_mpu_timer_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void omap_mpu_timer_reset(struct omap_mpu_timer_s *s)
@@ -375,7 +375,7 @@ static void omap_wd_timer_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps omap_wd_timer_ops =3D {
     .read =3D omap_wd_timer_read,
     .write =3D omap_wd_timer_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_wd_timer_reset(struct omap_watchdog_timer_s *s)
@@ -487,7 +487,7 @@ static void omap_os_timer_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps omap_os_timer_ops =3D {
     .read =3D omap_os_timer_read,
     .write =3D omap_os_timer_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_os_timer_reset(struct omap_32khz_timer_s *s)
@@ -714,7 +714,7 @@ static void omap_ulpd_pm_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps omap_ulpd_pm_ops =3D {
     .read =3D omap_ulpd_pm_read,
     .write =3D omap_ulpd_pm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_ulpd_pm_reset(struct omap_mpu_state_s *mpu)
@@ -948,7 +948,7 @@ static void omap_pin_cfg_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps omap_pin_cfg_ops =3D {
     .read =3D omap_pin_cfg_read,
     .write =3D omap_pin_cfg_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_pin_cfg_reset(struct omap_mpu_state_s *mpu)
@@ -1039,7 +1039,7 @@ static void omap_id_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_id_ops =3D {
     .read =3D omap_id_read,
     .write =3D omap_id_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_id_init(MemoryRegion *memory, struct omap_mpu_state_s *mp=
u)
@@ -1128,7 +1128,7 @@ static void omap_mpui_write(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps omap_mpui_ops =3D {
     .read =3D omap_mpui_read,
     .write =3D omap_mpui_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_mpui_reset(struct omap_mpu_state_s *s)
@@ -1231,7 +1231,7 @@ static void omap_tipb_bridge_write(void *opaque, hwad=
dr addr,
 static const MemoryRegionOps omap_tipb_bridge_ops =3D {
     .read =3D omap_tipb_bridge_read,
     .write =3D omap_tipb_bridge_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_tipb_bridge_reset(struct omap_tipb_bridge_s *s)
@@ -1336,7 +1336,7 @@ static void omap_tcmi_write(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps omap_tcmi_ops =3D {
     .read =3D omap_tcmi_read,
     .write =3D omap_tcmi_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_tcmi_reset(struct omap_mpu_state_s *mpu)
@@ -1431,7 +1431,7 @@ static void omap_dpll_write(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps omap_dpll_ops =3D {
     .read =3D omap_dpll_read,
     .write =3D omap_dpll_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_dpll_reset(struct dpll_ctl_s *s)
@@ -1743,7 +1743,7 @@ static void omap_clkm_write(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps omap_clkm_ops =3D {
     .read =3D omap_clkm_read,
     .write =3D omap_clkm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static uint64_t omap_clkdsp_read(void *opaque, hwaddr addr,
@@ -1832,7 +1832,7 @@ static void omap_clkdsp_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps omap_clkdsp_ops =3D {
     .read =3D omap_clkdsp_read,
     .write =3D omap_clkdsp_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_clkm_reset(struct omap_mpu_state_s *s)
@@ -2077,7 +2077,7 @@ static void omap_mpuio_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps omap_mpuio_ops  =3D {
     .read =3D omap_mpuio_read,
     .write =3D omap_mpuio_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_mpuio_reset(struct omap_mpuio_s *s)
@@ -2283,7 +2283,7 @@ static void omap_uwire_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps omap_uwire_ops =3D {
     .read =3D omap_uwire_read,
     .write =3D omap_uwire_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_uwire_reset(struct omap_uwire_s *s)
@@ -2394,7 +2394,7 @@ static void omap_pwl_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_pwl_ops =3D {
     .read =3D omap_pwl_read,
     .write =3D omap_pwl_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_pwl_reset(struct omap_pwl_s *s)
@@ -2512,7 +2512,7 @@ static void omap_pwt_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_pwt_ops =3D {
     .read =3Domap_pwt_read,
     .write =3D omap_pwt_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_pwt_reset(struct omap_pwt_s *s)
@@ -2849,7 +2849,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_rtc_ops =3D {
     .read =3D omap_rtc_read,
     .write =3D omap_rtc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_rtc_tick(void *opaque)
@@ -3447,7 +3447,7 @@ static void omap_mcbsp_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps omap_mcbsp_ops =3D {
     .read =3D omap_mcbsp_read,
     .write =3D omap_mcbsp_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_mcbsp_reset(struct omap_mcbsp_s *s)
@@ -3639,7 +3639,7 @@ static void omap_lpg_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_lpg_ops =3D {
     .read =3D omap_lpg_read,
     .write =3D omap_lpg_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_lpg_clk_update(void *opaque, int line, int on)
@@ -3692,7 +3692,7 @@ static void omap_mpui_io_write(void *opaque, hwaddr a=
ddr,
 static const MemoryRegionOps omap_mpui_io_ops =3D {
     .read =3D omap_mpui_io_read,
     .write =3D omap_mpui_io_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_setup_mpui_io(MemoryRegion *system_memory,
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 87ced7f..b1e1d3e 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -593,7 +593,7 @@ static void omap_eac_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_eac_ops =3D {
     .read =3D omap_eac_read,
     .write =3D omap_eac_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static struct omap_eac_s *omap_eac_init(struct omap_target_agent_s *ta,
@@ -744,7 +744,7 @@ static void omap_sti_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_sti_ops =3D {
     .read =3D omap_sti_read,
     .write =3D omap_sti_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static uint64_t omap_sti_fifo_read(void *opaque, hwaddr addr,
@@ -785,7 +785,7 @@ static void omap_sti_fifo_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps omap_sti_fifo_ops =3D {
     .read =3D omap_sti_fifo_read,
     .write =3D omap_sti_fifo_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static struct omap_sti_s *omap_sti_init(struct omap_target_agent_s *ta,
@@ -1724,7 +1724,7 @@ static void omap_prcm_write(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps omap_prcm_ops =3D {
     .read =3D omap_prcm_read,
     .write =3D omap_prcm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_prcm_reset(struct omap_prcm_s *s)
@@ -2124,7 +2124,7 @@ static const MemoryRegionOps omap_sysctl_ops =3D {
     .write =3D omap_sysctl_writefn,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_sysctl_reset(struct omap_sysctl_s *s)
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index cae78d0..5566407 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -83,7 +83,7 @@ static void static_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps static_ops =3D {
     .read =3D static_read,
     .write =3D static_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 #define sdram_size 0x02000000
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 9eb9612..78337c3 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -53,7 +53,7 @@ static const MemoryRegionOps static_ops =3D {
     .write =3D static_write,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 /* Palm Tunsgten|E support */
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index e2e43ae..e9daa88 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -149,7 +149,7 @@ static void pxa2xx_pm_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps pxa2xx_pm_ops =3D {
     .read =3D pxa2xx_pm_read,
     .write =3D pxa2xx_pm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_pxa2xx_pm =3D {
@@ -215,7 +215,7 @@ static void pxa2xx_cm_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps pxa2xx_cm_ops =3D {
     .read =3D pxa2xx_cm_read,
     .write =3D pxa2xx_cm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_pxa2xx_cm =3D {
@@ -439,7 +439,7 @@ static void pxa2xx_mm_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps pxa2xx_mm_ops =3D {
     .read =3D pxa2xx_mm_read,
     .write =3D pxa2xx_mm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_pxa2xx_mm =3D {
@@ -738,7 +738,7 @@ static void pxa2xx_ssp_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps pxa2xx_ssp_ops =3D {
     .read =3D pxa2xx_ssp_read,
     .write =3D pxa2xx_ssp_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void pxa2xx_ssp_reset(DeviceState *d)
@@ -1105,7 +1105,7 @@ static void pxa2xx_rtc_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps pxa2xx_rtc_ops =3D {
     .read =3D pxa2xx_rtc_read,
     .write =3D pxa2xx_rtc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void pxa2xx_rtc_init(Object *obj)
@@ -1426,7 +1426,7 @@ static void pxa2xx_i2c_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps pxa2xx_i2c_ops =3D {
     .read =3D pxa2xx_i2c_read,
     .write =3D pxa2xx_i2c_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_pxa2xx_i2c_slave =3D {
@@ -1684,7 +1684,7 @@ static void pxa2xx_i2s_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps pxa2xx_i2s_ops =3D {
     .read =3D pxa2xx_i2s_read,
     .write =3D pxa2xx_i2s_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_pxa2xx_i2s =3D {
@@ -1921,7 +1921,7 @@ static void pxa2xx_fir_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps pxa2xx_fir_ops =3D {
     .read =3D pxa2xx_fir_read,
     .write =3D pxa2xx_fir_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static int pxa2xx_fir_is_empty(void *opaque)
@@ -2110,7 +2110,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
             serial_mm_init(address_space, pxa270_serial[i].io_base, 2,
                            qdev_get_gpio_in(s->pic, pxa270_serial[i].irqn)=
,
                            14857000 / 16, serial_hd(i),
-                           DEVICE_NATIVE_ENDIAN);
+                           MO_TE);
         } else {
             break;
         }
@@ -2234,7 +2234,7 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space,=
 unsigned int sdram_size)
             serial_mm_init(address_space, pxa255_serial[i].io_base, 2,
                            qdev_get_gpio_in(s->pic, pxa255_serial[i].irqn)=
,
                            14745600 / 16, serial_hd(i),
-                           DEVICE_NATIVE_ENDIAN);
+                           MO_TE);
         } else {
             break;
         }
diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
index d1fc9cb..36ffb93 100644
--- a/hw/arm/pxa2xx_gpio.c
+++ b/hw/arm/pxa2xx_gpio.c
@@ -256,7 +256,7 @@ static void pxa2xx_gpio_write(void *opaque, hwaddr offs=
et,
 static const MemoryRegionOps pxa_gpio_ops =3D {
     .read =3D pxa2xx_gpio_read,
     .write =3D pxa2xx_gpio_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 DeviceState *pxa2xx_gpio_init(hwaddr base,
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 2f4b461..0d95605 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -256,7 +256,7 @@ static const ARMCPRegInfo pxa_pic_cp_reginfo[] =3D {
 static const MemoryRegionOps pxa2xx_pic_ops =3D {
     .read =3D pxa2xx_pic_mem_read,
     .write =3D pxa2xx_pic_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static int pxa2xx_pic_post_load(void *opaque, int version_id)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e96d5be..b5f8b76 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1349,7 +1349,7 @@ static MemTxResult smmu_read_mmio(void *opaque, hwadd=
r offset, uint64_t *data,
 static const MemoryRegionOps smmu_mem_ops =3D {
     .read_with_attrs =3D smmu_read_mmio,
     .write_with_attrs =3D smmu_write_mmio,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 8,
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 723cf5d..17c0d7a 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -145,7 +145,7 @@ enum {
 static const MemoryRegionOps sl_ops =3D {
     .read =3D sl_read,
     .write =3D sl_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void sl_flash_register(PXA2xxState *cpu, int size)
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 499035f..73f0614 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -305,7 +305,7 @@ static void gptm_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps gptm_ops =3D {
     .read =3D gptm_read,
     .write =3D gptm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_stellaris_gptm =3D {
@@ -637,7 +637,7 @@ static void ssys_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps ssys_ops =3D {
     .read =3D ssys_read,
     .write =3D ssys_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void ssys_reset(void *opaque)
@@ -874,7 +874,7 @@ static void stellaris_i2c_reset(stellaris_i2c_state *s)
 static const MemoryRegionOps stellaris_i2c_ops =3D {
     .read =3D stellaris_i2c_read,
     .write =3D stellaris_i2c_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_stellaris_i2c =3D {
@@ -1144,7 +1144,7 @@ static void stellaris_adc_write(void *opaque, hwaddr =
offset,
 static const MemoryRegionOps stellaris_adc_ops =3D {
     .read =3D stellaris_adc_read,
     .write =3D stellaris_adc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_stellaris_adc =3D {
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index fed51a8..f475ccf 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -179,7 +179,7 @@ static void strongarm_pic_mem_write(void *opaque, hwadd=
r offset,
 static const MemoryRegionOps strongarm_pic_ops =3D {
     .read =3D strongarm_pic_mem_read,
     .write =3D strongarm_pic_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void strongarm_pic_initfn(Object *obj)
@@ -379,7 +379,7 @@ static void strongarm_rtc_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps strongarm_rtc_ops =3D {
     .read =3D strongarm_rtc_read,
     .write =3D strongarm_rtc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void strongarm_rtc_init(Object *obj)
@@ -627,7 +627,7 @@ static void strongarm_gpio_write(void *opaque, hwaddr o=
ffset,
 static const MemoryRegionOps strongarm_gpio_ops =3D {
     .read =3D strongarm_gpio_read,
     .write =3D strongarm_gpio_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static DeviceState *strongarm_gpio_init(hwaddr base,
@@ -820,7 +820,7 @@ static void strongarm_ppc_write(void *opaque, hwaddr of=
fset,
 static const MemoryRegionOps strongarm_ppc_ops =3D {
     .read =3D strongarm_ppc_read,
     .write =3D strongarm_ppc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void strongarm_ppc_init(Object *obj)
@@ -1225,7 +1225,7 @@ static void strongarm_uart_write(void *opaque, hwaddr=
 addr,
 static const MemoryRegionOps strongarm_uart_ops =3D {
     .read =3D strongarm_uart_read,
     .write =3D strongarm_uart_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void strongarm_uart_init(Object *obj)
@@ -1514,7 +1514,7 @@ static void strongarm_ssp_write(void *opaque, hwaddr =
addr,
 static const MemoryRegionOps strongarm_ssp_ops =3D {
     .read =3D strongarm_ssp_read,
     .write =3D strongarm_ssp_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static int strongarm_ssp_post_load(void *opaque, int version_id)
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index e585711..7ed7ff2 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -149,7 +149,7 @@ static void vpb_sic_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps vpb_sic_ops =3D {
     .read =3D vpb_sic_read,
     .write =3D vpb_sic_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void vpb_sic_init(Object *obj)
diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index fb98da2..e115550 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -1275,7 +1275,7 @@ static const MemoryRegionOps ac97_io_nam_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t nabm_read(void *opaque, hwaddr addr, unsigned size)
@@ -1324,7 +1324,7 @@ static const MemoryRegionOps ac97_io_nabm_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void ac97_on_reset (DeviceState *dev)
diff --git a/hw/audio/cs4231.c b/hw/audio/cs4231.c
index 8946648..3164561 100644
--- a/hw/audio/cs4231.c
+++ b/hw/audio/cs4231.c
@@ -132,7 +132,7 @@ static void cs_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps cs_mem_ops =3D {
     .read =3D cs_mem_read,
     .write =3D cs_mem_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static const VMStateDescription vmstate_cs4231 =3D {
diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 260c142..b94db3b 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -774,7 +774,7 @@ static const MemoryRegionOps es1370_io_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription vmstate_es1370_channel =3D {
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index b78baac..1dbd741 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -1068,7 +1068,7 @@ static const MemoryRegionOps intel_hda_mmio_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 /* --------------------------------------------------------------------- *=
/
diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index a79e0b1..359e926 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -240,7 +240,7 @@ static void mv88w8618_audio_reset(DeviceState *d)
 static const MemoryRegionOps mv88w8618_audio_ops =3D {
     .read =3D mv88w8618_audio_read,
     .write =3D mv88w8618_audio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void mv88w8618_audio_init(Object *obj)
diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c
index 56feca2..9982e88 100644
--- a/hw/audio/milkymist-ac97.c
+++ b/hw/audio/milkymist-ac97.c
@@ -176,7 +176,7 @@ static const MemoryRegionOps ac97_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void ac97_in_cb(void *opaque, int avail_b)
diff --git a/hw/audio/pl041.c b/hw/audio/pl041.c
index b59a4f8..bf09ab1 100644
--- a/hw/audio/pl041.c
+++ b/hw/audio/pl041.c
@@ -519,7 +519,7 @@ static void pl041_device_reset(DeviceState *d)
 static const MemoryRegionOps pl041_ops =3D {
     .read =3D pl041_read,
     .write =3D pl041_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void pl041_init(Object *obj)
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 9b24cb9..f87fbac 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -981,13 +981,13 @@ static void fdctrl_write_mem (void *opaque, hwaddr re=
g,
 static const MemoryRegionOps fdctrl_mem_ops =3D {
     .read =3D fdctrl_read_mem,
     .write =3D fdctrl_write_mem,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const MemoryRegionOps fdctrl_mem_strict_ops =3D {
     .read =3D fdctrl_read_mem,
     .write =3D fdctrl_write_mem,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 36d6a8b..7d71e59 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1272,7 +1272,7 @@ static void nvme_mmio_write(void *opaque, hwaddr addr=
, uint64_t data,
 static const MemoryRegionOps nvme_mmio_ops =3D {
     .read =3D nvme_mmio_read,
     .write =3D nvme_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 2,
         .max_access_size =3D 8,
@@ -1295,7 +1295,7 @@ static uint64_t nvme_cmb_read(void *opaque, hwaddr ad=
dr, unsigned size)
 static const MemoryRegionOps nvme_cmb_ops =3D {
     .read =3D nvme_cmb_read,
     .write =3D nvme_cmb_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 66152e7..c987c7c 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -769,7 +769,7 @@ static void onenand_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps onenand_ops =3D {
     .read =3D onenand_read,
     .write =3D onenand_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void onenand_realize(DeviceState *dev, Error **errp)
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index a1ec1fa..aa51958 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -694,7 +694,7 @@ static MemTxResult pflash_mem_write_with_attrs(void *op=
aque, hwaddr addr, uint64
 static const MemoryRegionOps pflash_cfi01_ops =3D {
     .read_with_attrs =3D pflash_mem_read_with_attrs,
     .write_with_attrs =3D pflash_mem_write_with_attrs,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 42886f6..80c4091 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -713,7 +713,7 @@ static const MemoryRegionOps pflash_cfi02_ops =3D {
     .write =3D pflash_write,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
index 94679d2..f3c2947 100644
--- a/hw/char/bcm2835_aux.c
+++ b/hw/char/bcm2835_aux.c
@@ -244,7 +244,7 @@ static void bcm2835_aux_receive(void *opaque, const uin=
t8_t *buf, int size)
 static const MemoryRegionOps bcm2835_aux_ops =3D {
     .read =3D bcm2835_aux_read,
     .write =3D bcm2835_aux_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 6c7b904..bcb2d37 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -457,7 +457,7 @@ static uint64_t uart_read(void *opaque, hwaddr offset,
 static const MemoryRegionOps uart_ops =3D {
     .read =3D uart_read,
     .write =3D uart_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void cadence_uart_reset(DeviceState *dev)
diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
index 606c9cc..e3ef1eb 100644
--- a/hw/char/cmsdk-apb-uart.c
+++ b/hw/char/cmsdk-apb-uart.c
@@ -298,7 +298,7 @@ static void uart_write(void *opaque, hwaddr offset, uin=
t64_t value,
 static const MemoryRegionOps uart_ops =3D {
     .read =3D uart_read,
     .write =3D uart_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void cmsdk_apb_uart_reset(DeviceState *dev)
diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index e1b6d11..1f1cfc5 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -82,7 +82,7 @@ static const MemoryRegionOps debugcon_ops =3D {
     .write =3D debugcon_ioport_write,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 1,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void debugcon_realize_core(DebugconState *s, Error **errp)
diff --git a/hw/char/digic-uart.c b/hw/char/digic-uart.c
index e4ac843..863f467 100644
--- a/hw/char/digic-uart.c
+++ b/hw/char/digic-uart.c
@@ -110,7 +110,7 @@ static const MemoryRegionOps uart_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static int uart_can_rx(void *opaque)
diff --git a/hw/char/escc.c b/hw/char/escc.c
index 36182d9..0868efa 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -574,7 +574,7 @@ static uint64_t escc_mem_read(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps escc_mem_ops =3D {
     .read =3D escc_mem_read,
     .write =3D escc_mem_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
index cda687b..bc94aea 100644
--- a/hw/char/etraxfs_ser.c
+++ b/hw/char/etraxfs_ser.c
@@ -155,7 +155,7 @@ ser_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps ser_ops =3D {
     .read =3D ser_read,
     .write =3D ser_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index c5700ee..3497e5b 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -481,7 +481,7 @@ static uint64_t exynos4210_uart_read(void *opaque, hwad=
dr offset,
 static const MemoryRegionOps exynos4210_uart_ops =3D {
     .read =3D exynos4210_uart_read,
     .write =3D exynos4210_uart_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .max_access_size =3D 4,
         .unaligned =3D false
diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index 119fc84..c82e474 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -237,7 +237,7 @@ static void grlib_apbuart_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps grlib_apbuart_ops =3D {
     .write      =3D grlib_apbuart_write,
     .read       =3D grlib_apbuart_read,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void grlib_apbuart_realize(DeviceState *dev, Error **errp)
diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index 7c66551..0da6c82 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -332,7 +332,7 @@ static void imx_event(void *opaque, int event)
 static const struct MemoryRegionOps imx_serial_ops =3D {
     .read =3D imx_serial_read,
     .write =3D imx_serial_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void imx_serial_realize(DeviceState *dev, Error **errp)
diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
index 2fe5f60..5ec5dc2 100644
--- a/hw/char/lm32_uart.c
+++ b/hw/char/lm32_uart.c
@@ -205,7 +205,7 @@ static void uart_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps uart_ops =3D {
     .read =3D uart_read,
     .write =3D uart_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
index 7b06110..9ea74de 100644
--- a/hw/char/mcf_uart.c
+++ b/hw/char/mcf_uart.c
@@ -286,7 +286,7 @@ static void mcf_uart_receive(void *opaque, const uint8_=
t *buf, int size)
 static const MemoryRegionOps mcf_uart_ops =3D {
     .read =3D mcf_uart_read,
     .write =3D mcf_uart_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void mcf_uart_instance_init(Object *obj)
diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c
index bdb8282..38d12b7 100644
--- a/hw/char/milkymist-uart.c
+++ b/hw/char/milkymist-uart.c
@@ -156,7 +156,7 @@ static const MemoryRegionOps uart_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void uart_rx(void *opaque, const uint8_t *buf, int size)
diff --git a/hw/char/nrf51_uart.c b/hw/char/nrf51_uart.c
index c90b491..6a72813 100644
--- a/hw/char/nrf51_uart.c
+++ b/hw/char/nrf51_uart.c
@@ -189,7 +189,7 @@ static void uart_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps uart_ops =3D {
     .read =3D  uart_read,
     .write =3D uart_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void nrf51_uart_reset(DeviceState *dev)
diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c
index b3bb1cf..2de1abc 100644
--- a/hw/char/omap_uart.c
+++ b/hw/char/omap_uart.c
@@ -64,7 +64,7 @@ struct omap_uart_s *omap_uart_init(hwaddr base,
     s->serial =3D serial_mm_init(get_system_memory(), base, 2, irq,
                                omap_clk_getrate(fclk)/16,
                                chr ?: qemu_chr_new(label, "null", NULL),
-                               DEVICE_NATIVE_ENDIAN);
+                               MO_TE);
     return s;
 }

@@ -156,7 +156,7 @@ static void omap_uart_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_uart_ops =3D {
     .read =3D omap_uart_read,
     .write =3D omap_uart_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 struct omap_uart_s *omap2_uart_init(MemoryRegion *sysmem,
@@ -184,5 +184,5 @@ void omap_uart_attach(struct omap_uart_s *s, Chardev *c=
hr)
     s->serial =3D serial_mm_init(get_system_memory(), s->base, 2, s->irq,
                                omap_clk_getrate(s->fclk) / 16,
                                chr ?: qemu_chr_new("null", "null", NULL),
-                               DEVICE_NATIVE_ENDIAN);
+                               MO_TE);
 }
diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index 1cd4c54..32552db 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -588,7 +588,7 @@ static const MemoryRegionOps parallel_mm_ops =3D {
     .write =3D parallel_mm_writefn,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 /* If fd is zero, it means that the parallel device uses the console */
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 5fb95d2..96bd35d 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -287,7 +287,7 @@ static void pl011_event(void *opaque, int event)
 static const MemoryRegionOps pl011_ops =3D {
     .read =3D pl011_read,
     .write =3D pl011_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription vmstate_pl011 =3D {
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 521c76b..5d6a329 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -973,7 +973,7 @@ const MemoryRegionOps serial_io_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 SerialState *serial_init(int base, qemu_irq irq, int baudbase,
@@ -1016,14 +1016,14 @@ static const MemoryRegionOps serial_mm_ops[2] =3D {
     [0] =3D {
         .read =3D serial_mm_read,
         .write =3D serial_mm_write,
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
         .valid.max_access_size =3D 8,
         .impl.max_access_size =3D 8,
     },
     [1] =3D {
         .read =3D serial_mm_read,
         .write =3D serial_mm_write,
-        .endianness =3D DEVICE_BIG_ENDIAN,
+        .endianness =3D MO_BE,
         .valid.max_access_size =3D 8,
         .impl.max_access_size =3D 8,
     },
@@ -1032,7 +1032,7 @@ static const MemoryRegionOps serial_mm_ops[2] =3D {
 SerialState *serial_mm_init(MemoryRegion *address_space,
                             hwaddr base, int it_shift,
                             qemu_irq irq, int baudbase,
-                            Chardev *chr, enum device_endian end)
+                            Chardev *chr, MemOp end)
 {
     SerialState *s;

@@ -1047,7 +1047,7 @@ SerialState *serial_mm_init(MemoryRegion *address_spa=
ce,
     vmstate_register(NULL, base, &vmstate_serial, s);

     memory_region_init_io(&s->io, NULL,
-                          &serial_mm_ops[end =3D=3D DEVICE_BIG_ENDIAN],
+                          &serial_mm_ops[end =3D=3D MO_BE],
                           s, "serial", 8 << it_shift);
     memory_region_add_subregion(address_space, base, &s->io);
     return s;
diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 67740b7..f789c06 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -367,7 +367,7 @@ static void sh_serial_event(void *opaque, int event)
 static const MemoryRegionOps sh_serial_ops =3D {
     .read =3D sh_serial_read,
     .write =3D sh_serial_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 void sh_serial_init(MemoryRegion *sysmem,
diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
index 40c365b..65fd733 100644
--- a/hw/char/stm32f2xx_usart.c
+++ b/hw/char/stm32f2xx_usart.c
@@ -187,7 +187,7 @@ static void stm32f2xx_usart_write(void *opaque, hwaddr =
addr,
 static const MemoryRegionOps stm32f2xx_usart_ops =3D {
     .read =3D stm32f2xx_usart_read,
     .write =3D stm32f2xx_usart_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static Property stm32f2xx_usart_properties[] =3D {
diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index 880962a..48f2b85 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -166,7 +166,7 @@ uart_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps uart_ops =3D {
     .read =3D uart_read,
     .write =3D uart_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4
diff --git a/hw/core/empty_slot.c b/hw/core/empty_slot.c
index c694532..245a333 100644
--- a/hw/core/empty_slot.c
+++ b/hw/core/empty_slot.c
@@ -50,7 +50,7 @@ static void empty_slot_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps empty_slot_ops =3D {
     .read =3D empty_slot_read,
     .write =3D empty_slot_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 void empty_slot_init(hwaddr addr, uint64_t slot_size)
diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index 940c7dd..a98ffd3 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -83,7 +83,7 @@ nand_write(void *opaque, hwaddr addr, uint64_t value,
 static const MemoryRegionOps nand_ops =3D {
     .read =3D nand_read,
     .write =3D nand_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 struct tempsensor_t
@@ -235,7 +235,7 @@ static void gpio_write(void *opaque, hwaddr addr, uint6=
4_t value,
 static const MemoryRegionOps gpio_ops =3D {
     .read =3D gpio_read,
     .write =3D gpio_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/display/ati.c b/hw/display/ati.c
index a747c4c..ef37e8d 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -810,7 +810,7 @@ static void ati_mm_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps ati_mm_ops =3D {
     .read =3D ati_mm_read,
     .write =3D ati_mm_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void ati_vga_realize(PCIDevice *dev, Error **errp)
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 2311ec7..78dc827 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -340,7 +340,7 @@ static void bcm2835_fb_write(void *opaque, hwaddr offse=
t, uint64_t value,
 static const MemoryRegionOps bcm2835_fb_ops =3D {
     .read =3D bcm2835_fb_read,
     .write =3D bcm2835_fb_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 8e83b51..a5ae83b 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -106,7 +106,7 @@ static const MemoryRegionOps bochs_display_vbe_ops =3D =
{
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 2,
     .impl.max_access_size =3D 2,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t bochs_display_qext_read(void *ptr, hwaddr addr,
@@ -147,7 +147,7 @@ static const MemoryRegionOps bochs_display_qext_ops =3D=
 {
     .write =3D bochs_display_qext_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static int bochs_display_get_mode(BochsDisplayState *s,
diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index a7340dc..dade07d 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -267,7 +267,7 @@ static void cg3_reg_write(void *opaque, hwaddr addr, ui=
nt64_t val,
 static const MemoryRegionOps cg3_reg_ops =3D {
     .read =3D cg3_reg_read,
     .write =3D cg3_reg_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 2e4911a..03123ba 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -2123,7 +2123,7 @@ static void cirrus_vga_mem_write(void *opaque,
 static const MemoryRegionOps cirrus_vga_mem_ops =3D {
     .read =3D cirrus_vga_mem_read,
     .write =3D cirrus_vga_mem_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -2436,7 +2436,7 @@ static void cirrus_linear_bitblt_write(void *opaque,
 static const MemoryRegionOps cirrus_linear_bitblt_io_ops =3D {
     .read =3D cirrus_linear_bitblt_read,
     .write =3D cirrus_linear_bitblt_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -2736,7 +2736,7 @@ static void cirrus_mmio_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps cirrus_mmio_io_ops =3D {
     .read =3D cirrus_mmio_read,
     .write =3D cirrus_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -2847,7 +2847,7 @@ static void cirrus_reset(void *opaque)
 static const MemoryRegionOps cirrus_linear_io_ops =3D {
     .read =3D cirrus_linear_read,
     .write =3D cirrus_linear_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -2857,7 +2857,7 @@ static const MemoryRegionOps cirrus_linear_io_ops =3D=
 {
 static const MemoryRegionOps cirrus_vga_io_ops =3D {
     .read =3D cirrus_vga_ioport_read,
     .write =3D cirrus_vga_ioport_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/display/edid-region.c b/hw/display/edid-region.c
index d0d31ba..094b200 100644
--- a/hw/display/edid-region.c
+++ b/hw/display/edid-region.c
@@ -21,7 +21,7 @@ static const MemoryRegionOps edid_region_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 1,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 void qemu_edid_region_io(MemoryRegion *region, Object *owner,
diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 61f7408..cdd2977 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1818,7 +1818,7 @@ static const MemoryRegionOps exynos4210_fimd_mmio_ops=
 =3D {
         .max_access_size =3D 4,
         .unaligned =3D false
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static int exynos4210_fimd_load(void *opaque, int version_id)
diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index 1774b44..3b02d3f 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -428,7 +428,7 @@ static void g364fb_ctrl_write(void *opaque,
 static const MemoryRegionOps g364fb_ctrl_ops =3D {
     .read =3D g364fb_ctrl_read,
     .write =3D g364fb_ctrl_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
 };
diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
index 783189e..6f3e626 100644
--- a/hw/display/jazz_led.c
+++ b/hw/display/jazz_led.c
@@ -72,7 +72,7 @@ static void jazz_led_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps led_ops =3D {
     .read =3D jazz_led_read,
     .write =3D jazz_led_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 1,
 };
diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
index e1ed018..ed39a14 100644
--- a/hw/display/milkymist-tmu2.c
+++ b/hw/display/milkymist-tmu2.c
@@ -434,7 +434,7 @@ static const MemoryRegionOps tmu2_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void milkymist_tmu2_reset(DeviceState *d)
diff --git a/hw/display/milkymist-vgafb.c b/hw/display/milkymist-vgafb.c
index dce1dd7..1c7fc17 100644
--- a/hw/display/milkymist-vgafb.c
+++ b/hw/display/milkymist-vgafb.c
@@ -269,7 +269,7 @@ static const MemoryRegionOps vgafb_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void milkymist_vgafb_reset(DeviceState *d)
diff --git a/hw/display/omap_dss.c b/hw/display/omap_dss.c
index 601f178..cb6b882 100644
--- a/hw/display/omap_dss.c
+++ b/hw/display/omap_dss.c
@@ -245,7 +245,7 @@ static void omap_diss_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_diss_ops =3D {
     .read =3D omap_diss_read,
     .write =3D omap_diss_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static uint64_t omap_disc_read(void *opaque, hwaddr addr,
@@ -589,7 +589,7 @@ static void omap_disc_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_disc_ops =3D {
     .read =3D omap_disc_read,
     .write =3D omap_disc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_rfbi_transfer_stop(struct omap_dss_s *s)
@@ -865,7 +865,7 @@ static void omap_rfbi_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_rfbi_ops =3D {
     .read =3D omap_rfbi_read,
     .write =3D omap_rfbi_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static uint64_t omap_venc_read(void *opaque, hwaddr addr,
@@ -988,7 +988,7 @@ static void omap_venc_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_venc_ops =3D {
     .read =3D omap_venc_read,
     .write =3D omap_venc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static uint64_t omap_im3_read(void *opaque, hwaddr addr,
@@ -1042,7 +1042,7 @@ static void omap_im3_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_im3_ops =3D {
     .read =3D omap_im3_read,
     .write =3D omap_im3_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 struct omap_dss_s *omap_dss_init(struct omap_target_agent_s *ta,
diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index 07a5eff..d5d316f 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -330,7 +330,7 @@ static void omap_lcdc_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_lcdc_ops =3D {
     .read =3D omap_lcdc_read,
     .write =3D omap_lcdc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 void omap_lcdc_reset(struct omap_lcd_panel_s *s)
diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index d0c6317..49fae37 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -471,7 +471,7 @@ static void pl110_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl110_ops =3D {
     .read =3D pl110_read,
     .write =3D pl110_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void pl110_mux_ctrl_set(void *opaque, int line, int level)
diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index b83f807..fc2a3c4 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -567,7 +567,7 @@ static void pxa2xx_lcdc_write(void *opaque, hwaddr offs=
et,
 static const MemoryRegionOps pxa2xx_lcdc_ops =3D {
     .read =3D pxa2xx_lcdc_read,
     .write =3D pxa2xx_lcdc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 /* Load new palette for a given DMA channel, convert to internal format */
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 5918f59..b147d98 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -967,7 +967,7 @@ static const MemoryRegionOps sm501_system_config_ops =
=3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t sm501_i2c_read(void *opaque, hwaddr addr, unsigned size)
@@ -1070,7 +1070,7 @@ static const MemoryRegionOps sm501_i2c_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint32_t sm501_palette_read(void *opaque, hwaddr addr)
@@ -1358,7 +1358,7 @@ static const MemoryRegionOps sm501_disp_ctrl_ops =3D =
{
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
@@ -1533,7 +1533,7 @@ static const MemoryRegionOps sm501_2d_engine_ops =3D =
{
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 /* draw line functions for all console modes */
@@ -1961,7 +1961,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Er=
ror **errp)
     if (s->chr_state) {
         serial_mm_init(&s->state.mmio_region, SM501_UART0, 2,
                        NULL, /* TODO : chain irq to IRL */
-                       115200, s->chr_state, DEVICE_LITTLE_ENDIAN);
+                       115200, s->chr_state, MO_LE);
     }
 }

diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 6bc3360..1374c59 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -547,7 +547,7 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sysmem, uint=
32_t base, qemu_irq irq)
     static const MemoryRegionOps tc6393xb_ops =3D {
         .read =3D tc6393xb_readb,
         .write =3D tc6393xb_writeb,
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
         .impl =3D {
             .min_access_size =3D 1,
             .max_access_size =3D 1,
diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index cdabcbc..3a841dc 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -462,7 +462,7 @@ static void tcx_dac_writel(void *opaque, hwaddr addr, u=
int64_t val,
 static const MemoryRegionOps tcx_dac_ops =3D {
     .read =3D tcx_dac_readl,
     .write =3D tcx_dac_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -543,7 +543,7 @@ static void tcx_rstip_writel(void *opaque, hwaddr addr,
 static const MemoryRegionOps tcx_stip_ops =3D {
     .read =3D tcx_stip_readl,
     .write =3D tcx_stip_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -553,7 +553,7 @@ static const MemoryRegionOps tcx_stip_ops =3D {
 static const MemoryRegionOps tcx_rstip_ops =3D {
     .read =3D tcx_stip_readl,
     .write =3D tcx_rstip_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -635,7 +635,7 @@ static void tcx_rblit_writel(void *opaque, hwaddr addr,
 static const MemoryRegionOps tcx_blit_ops =3D {
     .read =3D tcx_blit_readl,
     .write =3D tcx_blit_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -645,7 +645,7 @@ static const MemoryRegionOps tcx_blit_ops =3D {
 static const MemoryRegionOps tcx_rblit_ops =3D {
     .read =3D tcx_blit_readl,
     .write =3D tcx_rblit_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -707,7 +707,7 @@ static void tcx_thc_writel(void *opaque, hwaddr addr,
 static const MemoryRegionOps tcx_thc_ops =3D {
     .read =3D tcx_thc_readl,
     .write =3D tcx_thc_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -729,7 +729,7 @@ static void tcx_dummy_writel(void *opaque, hwaddr addr,
 static const MemoryRegionOps tcx_dummy_ops =3D {
     .read =3D tcx_dummy_readl,
     .write =3D tcx_dummy_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
index 215e649..58e299b 100644
--- a/hw/display/vga-isa-mm.c
+++ b/hw/display/vga-isa-mm.c
@@ -60,7 +60,7 @@ static const MemoryRegionOps vga_mm_ctrl_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void vga_mm_init(ISAVGAMMState *s, hwaddr vram_base,
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index dedac5d..c893968 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -110,7 +110,7 @@ static const MemoryRegionOps pci_vga_ioport_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 2,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t pci_vga_bochs_read(void *ptr, hwaddr addr,
@@ -140,7 +140,7 @@ static const MemoryRegionOps pci_vga_bochs_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 2,
     .impl.max_access_size =3D 2,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t pci_vga_qext_read(void *ptr, hwaddr addr, unsigned size)
@@ -194,7 +194,7 @@ static const MemoryRegionOps pci_vga_qext_ops =3D {
     .write =3D pci_vga_qext_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 void pci_std_vga_mmio_region_init(VGACommonState *s,
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 910a23c..046bbfa 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -2062,7 +2062,7 @@ static void vga_mem_write(void *opaque, hwaddr addr,
 const MemoryRegionOps vga_mem_ops =3D {
     .read =3D vga_mem_read,
     .write =3D vga_mem_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 249a179..e534a33 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -1280,7 +1280,7 @@ static void vmsvga_io_write(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps vmsvga_io_ops =3D {
     .read =3D vmsvga_io_read,
     .write =3D vmsvga_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index cc5b650..9fbfc0b 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -301,7 +301,7 @@ static void xlnx_dp_audio_write(void *opaque, hwaddr of=
fset, uint64_t value,
 static const MemoryRegionOps audio_ops =3D {
     .read =3D xlnx_dp_audio_read,
     .write =3D xlnx_dp_audio_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static inline uint32_t xlnx_dp_audio_get_volume(XlnxDPState *s,
@@ -876,7 +876,7 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, =
uint64_t value,
 static const MemoryRegionOps dp_ops =3D {
     .read =3D xlnx_dp_read,
     .write =3D xlnx_dp_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -991,7 +991,7 @@ static uint64_t xlnx_dp_vblend_read(void *opaque, hwadd=
r offset,
 static const MemoryRegionOps vblend_ops =3D {
     .read =3D xlnx_dp_vblend_read,
     .write =3D xlnx_dp_vblend_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1104,7 +1104,7 @@ static uint64_t xlnx_dp_avbufm_read(void *opaque, hwa=
ddr offset,
 static const MemoryRegionOps avbufm_ops =3D {
     .read =3D xlnx_dp_avbufm_read,
     .write =3D xlnx_dp_avbufm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index 907d25c..7844b61 100644
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -288,7 +288,7 @@ static void bcm2835_dma15_write(void *opaque, hwaddr of=
fset, uint64_t value,
 static const MemoryRegionOps bcm2835_dma0_ops =3D {
     .read =3D bcm2835_dma0_read,
     .write =3D bcm2835_dma0_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
@@ -296,7 +296,7 @@ static const MemoryRegionOps bcm2835_dma0_ops =3D {
 static const MemoryRegionOps bcm2835_dma15_ops =3D {
     .read =3D bcm2835_dma15_read,
     .write =3D bcm2835_dma15_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index df3ba09..61f7200 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -695,10 +695,10 @@ dma_write(void *opaque, hwaddr addr,
 }

 static const MemoryRegionOps dma_ops =3D {
- .read =3D dma_read,
- .write =3D dma_write,
- .endianness =3D DEVICE_LITTLE_ENDIAN,
- .valid =3D {
+    .read =3D dma_read,
+    .write =3D dma_write,
+    .endianness =3D MO_LE,
+    .valid =3D {
  .min_access_size =3D 1,
  .max_access_size =3D 4
  }
diff --git a/hw/dma/i8257.c b/hw/dma/i8257.c
index 30a3442..cf71c47 100644
--- a/hw/dma/i8257.c
+++ b/hw/dma/i8257.c
@@ -475,7 +475,7 @@ static int i8257_phony_handler(void *opaque, int nchan,=
 int dma_pos,
 static const MemoryRegionOps channel_io_ops =3D {
     .read =3D i8257_read_chan,
     .write =3D i8257_write_chan,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -499,7 +499,7 @@ static const MemoryRegionPortio pageh_portio_list[] =3D=
 {
 static const MemoryRegionOps cont_io_ops =3D {
     .read =3D i8257_read_cont,
     .write =3D i8257_write_cont,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index eab83c5..16cc7df 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -1552,7 +1552,7 @@ static void omap_dma_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_dma_ops =3D {
     .read =3D omap_dma_read,
     .write =3D omap_dma_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_dma_request(void *opaque, int drq, int req)
@@ -2073,7 +2073,7 @@ static void omap_dma4_write(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps omap_dma4_ops =3D {
     .read =3D omap_dma4_read,
     .write =3D omap_dma4_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 struct soc_dma_s *omap_dma4_init(hwaddr base, qemu_irq *irqs,
diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 644eadb..cf6161c 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -346,7 +346,7 @@ static void pl080_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl080_ops =3D {
     .read =3D pl080_read,
     .write =3D pl080_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void pl080_reset(DeviceState *dev)
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 4c51f2d..d8bf16e 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1493,7 +1493,7 @@ static uint64_t pl330_iomem_read(void *opaque, hwaddr=
 offset,
 static const MemoryRegionOps pl330_ops =3D {
     .read =3D pl330_iomem_read,
     .write =3D pl330_iomem_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c
index 7002373..2f16944 100644
--- a/hw/dma/puv3_dma.c
+++ b/hw/dma/puv3_dma.c
@@ -75,7 +75,7 @@ static const MemoryRegionOps puv3_dma_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void puv3_dma_realize(DeviceState *dev, Error **errp)
diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
index d6fb957..fa1c38f 100644
--- a/hw/dma/pxa2xx_dma.c
+++ b/hw/dma/pxa2xx_dma.c
@@ -424,7 +424,7 @@ static void pxa2xx_dma_write(void *opaque, hwaddr offse=
t,
 static const MemoryRegionOps pxa2xx_dma_ops =3D {
     .read =3D pxa2xx_dma_read,
     .write =3D pxa2xx_dma_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void pxa2xx_dma_request(void *opaque, int req_num, int on)
diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index 155af9b..631880d 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -387,7 +387,7 @@ static const MemoryRegionOps rc4030_ops =3D {
     .write =3D rc4030_write,
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void update_jazz_irq(rc4030State *s)
@@ -490,7 +490,7 @@ static const MemoryRegionOps jazzio_ops =3D {
     .write =3D jazzio_write,
     .impl.min_access_size =3D 2,
     .impl.max_access_size =3D 2,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static IOMMUTLBEntry rc4030_dma_translate(IOMMUMemoryRegion *iommu, hwaddr=
 addr,
diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index 6b32372..b028100 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -224,7 +224,7 @@ static void dma_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps dma_mem_ops =3D {
     .read =3D dma_mem_read,
     .write =3D dma_mem_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 921be17..da79828 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -512,7 +512,7 @@ static void axidma_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps axidma_ops =3D {
     .read =3D axidma_read,
     .write =3D axidma_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index 51e1ead..ecf4ff6 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -742,7 +742,7 @@ static void zdma_write(void *opaque, hwaddr addr, uint6=
4_t value,
 static const MemoryRegionOps zdma_ops =3D {
     .read =3D zdma_read,
     .write =3D zdma_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
index 7a03ce1..a14c966 100644
--- a/hw/dma/xlnx-zynq-devcfg.c
+++ b/hw/dma/xlnx-zynq-devcfg.c
@@ -319,7 +319,7 @@ static const RegisterAccessInfo xlnx_zynq_devcfg_regs_i=
nfo[] =3D {
 static const MemoryRegionOps xlnx_zynq_devcfg_reg_ops =3D {
     .read =3D register_read_memory,
     .write =3D register_write_memory,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index e834f81..47a0a82 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -552,7 +552,7 @@ static void xlnx_dpdma_write(void *opaque, hwaddr offse=
t,
 static const MemoryRegionOps dma_ops =3D {
     .read =3D xlnx_dpdma_read,
     .write =3D xlnx_dpdma_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/gpio/bcm2835_gpio.c b/hw/gpio/bcm2835_gpio.c
index ba8dd6c..8b072f5 100644
--- a/hw/gpio/bcm2835_gpio.c
+++ b/hw/gpio/bcm2835_gpio.c
@@ -275,7 +275,7 @@ static void bcm2835_gpio_reset(DeviceState *dev)
 static const MemoryRegionOps bcm2835_gpio_ops =3D {
     .read =3D bcm2835_gpio_read,
     .write =3D bcm2835_gpio_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_bcm2835_gpio =3D {
diff --git a/hw/gpio/imx_gpio.c b/hw/gpio/imx_gpio.c
index a51af72..d60e5d3 100644
--- a/hw/gpio/imx_gpio.c
+++ b/hw/gpio/imx_gpio.c
@@ -267,7 +267,7 @@ static const MemoryRegionOps imx_gpio_ops =3D {
     .write =3D imx_gpio_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_imx_gpio =3D {
diff --git a/hw/gpio/mpc8xxx.c b/hw/gpio/mpc8xxx.c
index 6ff56dc..76d9eb8 100644
--- a/hw/gpio/mpc8xxx.c
+++ b/hw/gpio/mpc8xxx.c
@@ -180,7 +180,7 @@ static void mpc8xxx_gpio_set_irq(void * opaque, int irq=
, int level)
 static const MemoryRegionOps mpc8xxx_gpio_ops =3D {
     .read =3D mpc8xxx_gpio_read,
     .write =3D mpc8xxx_gpio_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void mpc8xxx_gpio_initfn(Object *obj)
diff --git a/hw/gpio/nrf51_gpio.c b/hw/gpio/nrf51_gpio.c
index dd6c16a..f49ef56 100644
--- a/hw/gpio/nrf51_gpio.c
+++ b/hw/gpio/nrf51_gpio.c
@@ -225,7 +225,7 @@ static void nrf51_gpio_write(void *opaque, hwaddr offse=
t,
 static const MemoryRegionOps gpio_ops =3D {
     .read =3D  nrf51_gpio_read,
     .write =3D nrf51_gpio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
 };
diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index e2785c5..7307717 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -177,7 +177,7 @@ static void omap_gpio_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_gpio_ops =3D {
     .read =3D omap_gpio_read,
     .write =3D omap_gpio_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_gpio_reset(struct omap_gpio_s *s)
@@ -592,7 +592,7 @@ static const MemoryRegionOps omap2_gpio_module_ops =3D =
{
     .write =3D omap2_gpio_module_writep,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_gpif_reset(DeviceState *dev)
@@ -675,7 +675,7 @@ static void omap2_gpif_top_write(void *opaque, hwaddr a=
ddr,
 static const MemoryRegionOps omap2_gpif_top_ops =3D {
     .read =3D omap2_gpif_top_read,
     .write =3D omap2_gpif_top_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_gpio_init(Object *obj)
diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index da6ff6a..f41a063 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -339,7 +339,7 @@ static void pl061_set_irq(void * opaque, int irq, int l=
evel)
 static const MemoryRegionOps pl061_ops =3D {
     .read =3D pl061_read,
     .write =3D pl061_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void pl061_luminary_init(Object *obj)
diff --git a/hw/gpio/puv3_gpio.c b/hw/gpio/puv3_gpio.c
index 54d30ca..f1c5120 100644
--- a/hw/gpio/puv3_gpio.c
+++ b/hw/gpio/puv3_gpio.c
@@ -98,7 +98,7 @@ static const MemoryRegionOps puv3_gpio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void puv3_gpio_realize(DeviceState *dev, Error **errp)
diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index 599d862..cc8dc38 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -156,7 +156,7 @@ static void scoop_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps scoop_ops =3D {
     .read =3D scoop_read,
     .write =3D scoop_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void scoop_gpio_set(void *opaque, int line, int level)
diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index e94614a..9369c36 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -309,7 +309,7 @@ static MemTxResult dino_chip_write_with_attrs(void *opa=
que, hwaddr addr,
 static const MemoryRegionOps dino_chip_ops =3D {
     .read_with_attrs =3D dino_chip_read_with_attrs,
     .write_with_attrs =3D dino_chip_write_with_attrs,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
@@ -357,7 +357,7 @@ static void dino_config_data_write(void *opaque, hwaddr=
 addr,
 static const MemoryRegionOps dino_config_data_ops =3D {
     .read =3D dino_config_data_read,
     .write =3D dino_config_data_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t dino_config_addr_read(void *opaque, hwaddr addr, unsigned =
len)
@@ -378,7 +378,7 @@ static const MemoryRegionOps dino_config_addr_ops =3D {
     .write =3D dino_config_addr_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static AddressSpace *dino_pcihost_set_iommu(PCIBus *bus, void *opaque,
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 662838d..974adaa 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -113,7 +113,7 @@ static void machine_hppa_init(MachineState *machine)
     if (serial_hd(0)) {
         uint32_t addr =3D DINO_UART_HPA + 0x800;
         serial_mm_init(addr_space, addr, 0, serial_irq,
-                       115200, serial_hd(0), DEVICE_BIG_ENDIAN);
+                       115200, serial_hd(0), MO_BE);
     }

     /* SCSI disk setup. */
diff --git a/hw/hppa/pci.c b/hw/hppa/pci.c
index b6606d9..4cf8094 100644
--- a/hw/hppa/pci.c
+++ b/hw/hppa/pci.c
@@ -24,7 +24,7 @@ static void ignore_write(void *opaque, hwaddr addr, uint6=
4_t v, unsigned size)
 const MemoryRegionOps hppa_pci_ignore_ops =3D {
     .read =3D ignore_read,
     .write =3D ignore_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
@@ -54,7 +54,7 @@ static void bw_conf1_write(void *opaque, hwaddr addr,
 const MemoryRegionOps hppa_pci_conf1_ops =3D {
     .read =3D bw_conf1_read,
     .write =3D bw_conf1_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
@@ -77,7 +77,7 @@ static void special_write(void *opaque, hwaddr addr,
 const MemoryRegionOps hppa_pci_iack_ops =3D {
     .read =3D iack_read,
     .write =3D special_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/hyperv/hyperv_testdev.c b/hw/hyperv/hyperv_testdev.c
index 0d343a8..823c790 100644
--- a/hw/hyperv/hyperv_testdev.c
+++ b/hw/hyperv/hyperv_testdev.c
@@ -288,7 +288,7 @@ static const MemoryRegionOps synic_test_sint_ops =3D {
     .write =3D hv_test_dev_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void hv_test_dev_realizefn(DeviceState *d, Error **errp)
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 219ad38..f8811c0 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -364,13 +364,13 @@ static void aspeed_i2c_ctrl_write(void *opaque, hwadd=
r offset,
 static const MemoryRegionOps aspeed_i2c_bus_ops =3D {
     .read =3D aspeed_i2c_bus_read,
     .write =3D aspeed_i2c_bus_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps aspeed_i2c_ctrl_ops =3D {
     .read =3D aspeed_i2c_ctrl_read,
     .write =3D aspeed_i2c_ctrl_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription aspeed_i2c_bus_vmstate =3D {
diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
index 70a97a3..0823e66 100644
--- a/hw/i2c/exynos4210_i2c.c
+++ b/hw/i2c/exynos4210_i2c.c
@@ -264,7 +264,7 @@ static void exynos4210_i2c_write(void *opaque, hwaddr o=
ffset,
 static const MemoryRegionOps exynos4210_i2c_ops =3D {
     .read =3D exynos4210_i2c_read,
     .write =3D exynos4210_i2c_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription exynos4210_i2c_vmstate =3D {
diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
index de1107b..8910c50 100644
--- a/hw/i2c/imx_i2c.c
+++ b/hw/i2c/imx_i2c.c
@@ -276,7 +276,7 @@ static const MemoryRegionOps imx_i2c_ops =3D {
     .write =3D imx_i2c_write,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 2,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription imx_i2c_vmstate =3D {
diff --git a/hw/i2c/microbit_i2c.c b/hw/i2c/microbit_i2c.c
index 214be07..e756b1c 100644
--- a/hw/i2c/microbit_i2c.c
+++ b/hw/i2c/microbit_i2c.c
@@ -70,7 +70,7 @@ static void microbit_i2c_write(void *opaque, hwaddr addr,=
 uint64_t data,
 static const MemoryRegionOps microbit_i2c_ops =3D {
     .read =3D microbit_i2c_read,
     .write =3D microbit_i2c_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
 };
diff --git a/hw/i2c/mpc_i2c.c b/hw/i2c/mpc_i2c.c
index 181228d..bfe0663 100644
--- a/hw/i2c/mpc_i2c.c
+++ b/hw/i2c/mpc_i2c.c
@@ -304,7 +304,7 @@ static const MemoryRegionOps i2c_ops =3D {
     .read =3D  mpc_i2c_read,
     .write =3D  mpc_i2c_write,
     .valid.max_access_size =3D 1,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static const VMStateDescription mpc_i2c_vmstate =3D {
diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
index d7ebeae..99a328a 100644
--- a/hw/i2c/omap_i2c.c
+++ b/hw/i2c/omap_i2c.c
@@ -469,7 +469,7 @@ static const MemoryRegionOps omap_i2c_ops =3D {
     .write =3D omap_i2c_writefn,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_i2c_init(Object *obj)
diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
index e48544f..87b35af 100644
--- a/hw/i2c/pm_smbus.c
+++ b/hw/i2c/pm_smbus.c
@@ -451,7 +451,7 @@ static const MemoryRegionOps pm_smbus_ops =3D {
     .write =3D smb_ioport_writeb,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 1,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 bool pm_smbus_vmstate_needed(void)
diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
index 462729d..1ab2381 100644
--- a/hw/i2c/ppc4xx_i2c.c
+++ b/hw/i2c/ppc4xx_i2c.c
@@ -335,7 +335,7 @@ static const MemoryRegionOps ppc4xx_i2c_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 1,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void ppc4xx_i2c_init(Object *o)
diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index c92d3b1..be0f989 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -77,7 +77,7 @@ static void versatile_i2c_write(void *opaque, hwaddr offs=
et,
 static const MemoryRegionOps versatile_i2c_ops =3D {
     .read =3D versatile_i2c_read,
     .write =3D versatile_i2c_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void versatile_i2c_init(Object *obj)
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 4a4e2c7..0612296 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1378,7 +1378,7 @@ static MemTxResult amdvi_mem_ir_read(void *opaque, hw=
addr addr,
 static const MemoryRegionOps amdvi_ir_ops =3D {
     .read_with_attrs =3D amdvi_mem_ir_read,
     .write_with_attrs =3D amdvi_mem_ir_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1452,7 +1452,7 @@ static AddressSpace *amdvi_host_dma_iommu(PCIBus *bus=
, void *opaque, int devfn)
 static const MemoryRegionOps mmio_mem_ops =3D {
     .read =3D amdvi_mmio_read,
     .write =3D amdvi_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index de86f53..e9dd1ab 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2993,7 +2993,7 @@ static const VMStateDescription vtd_vmstate =3D {
 static const MemoryRegionOps vtd_mem_ops =3D {
     .read =3D vtd_mem_read,
     .write =3D vtd_mem_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 8,
@@ -3270,7 +3270,7 @@ static MemTxResult vtd_mem_ir_write(void *opaque, hwa=
ddr addr,
 static const MemoryRegionOps vtd_mem_ir_ops =3D {
     .read_with_attrs =3D vtd_mem_ir_read,
     .write_with_attrs =3D vtd_mem_ir_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
index 91fb622..e645447 100644
--- a/hw/i386/kvm/apic.c
+++ b/hw/i386/kvm/apic.c
@@ -207,7 +207,7 @@ static void kvm_apic_mem_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps kvm_apic_io_ops =3D {
     .read =3D kvm_apic_mem_read,
     .write =3D kvm_apic_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void kvm_apic_reset(APICCommonState *s)
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 9c2ab4a..9c65e41 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -717,7 +717,7 @@ static uint64_t vapic_read(void *opaque, hwaddr addr, u=
nsigned size)
 static const MemoryRegionOps vapic_ops =3D {
     .write =3D vapic_write,
     .read =3D vapic_read,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void vapic_realize(DeviceState *dev, Error **errp)
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 549c437..c2507b5 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -813,7 +813,7 @@ static const MemoryRegionOps port92_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void port92_initfn(Object *obj)
@@ -1985,7 +1985,7 @@ DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci=
_bus)
 static const MemoryRegionOps ioport80_io_ops =3D {
     .write =3D ioport80_write,
     .read =3D ioport80_read,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -1995,7 +1995,7 @@ static const MemoryRegionOps ioport80_io_ops =3D {
 static const MemoryRegionOps ioportF0_io_ops =3D {
     .write =3D ioportF0_write,
     .read =3D ioportF0_read,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index 3bf8cfe..a30032d 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -139,7 +139,7 @@ static const MemoryRegionOps vmport_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void vmport_realizefn(DeviceState *dev, Error **errp)
diff --git a/hw/i386/xen/xen_apic.c b/hw/i386/xen/xen_apic.c
index 7c7a60b..2a28057 100644
--- a/hw/i386/xen/xen_apic.c
+++ b/hw/i386/xen/xen_apic.c
@@ -36,7 +36,7 @@ static void xen_apic_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps xen_apic_io_ops =3D {
     .read =3D xen_apic_mem_read,
     .write =3D xen_apic_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void xen_apic_realize(DeviceState *dev, Error **errp)
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 7a972e4..af56c59 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -329,7 +329,7 @@ static const MemoryRegionOps platform_fixed_io_ops =3D =
{
         .max_access_size =3D 4,
         .unaligned =3D true,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void platform_fixed_ioport_init(PCIXenPlatformState* s)
@@ -427,7 +427,7 @@ static void platform_mmio_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps platform_mmio_handler =3D {
     .read =3D &platform_mmio_read,
     .write =3D &platform_mmio_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void platform_mmio_setup(PCIXenPlatformState *d)
diff --git a/hw/i386/xen/xen_pvdevice.c b/hw/i386/xen/xen_pvdevice.c
index 23748f3..b65fdd2 100644
--- a/hw/i386/xen/xen_pvdevice.c
+++ b/hw/i386/xen/xen_pvdevice.c
@@ -69,7 +69,7 @@ static void xen_pv_mmio_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps xen_pv_mmio_ops =3D {
     .read =3D &xen_pv_mmio_read,
     .write =3D &xen_pv_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription vmstate_xen_pvdevice =3D {
diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c
index de08d87..714267c 100644
--- a/hw/ide/ahci-allwinner.c
+++ b/hw/ide/ahci-allwinner.c
@@ -82,7 +82,7 @@ static const MemoryRegionOps allwinner_ahci_mem_ops =3D {
     .write =3D allwinner_ahci_mem_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void allwinner_ahci_init(Object *obj)
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 00ba422..871b75b 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -521,7 +521,7 @@ static void ahci_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps ahci_mem_ops =3D {
     .read =3D ahci_mem_read,
     .write =3D ahci_mem_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t ahci_idp_read(void *opaque, hwaddr addr,
@@ -557,7 +557,7 @@ static void ahci_idp_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps ahci_idp_ops =3D {
     .read =3D ahci_idp_read,
     .write =3D ahci_idp_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };


diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 54571fe..b1dbe8d 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -351,7 +351,7 @@ static const MemoryRegionOps pmac_ide_ops =3D {
     .write =3D pmac_ide_write,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription vmstate_pmac =3D {
diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index 70a5801..88b71e6 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -84,7 +84,7 @@ static void mmio_ide_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps mmio_ide_ops =3D {
     .read =3D mmio_ide_read,
     .write =3D mmio_ide_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t mmio_ide_status_read(void *opaque, hwaddr addr,
@@ -104,7 +104,7 @@ static void mmio_ide_cmd_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps mmio_ide_cs_ops =3D {
     .read =3D mmio_ide_status_read,
     .write =3D mmio_ide_cmd_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription vmstate_ide_mmio =3D {
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 4c6fb9a..7cb42f4 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -62,7 +62,7 @@ static void pci_ide_cmd_write(void *opaque, hwaddr addr,
 const MemoryRegionOps pci_ide_cmd_le_ops =3D {
     .read =3D pci_ide_cmd_read,
     .write =3D pci_ide_cmd_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t pci_ide_data_read(void *opaque, hwaddr addr, unsigned size=
)
@@ -100,7 +100,7 @@ static void pci_ide_data_write(void *opaque, hwaddr add=
r,
 const MemoryRegionOps pci_ide_data_le_ops =3D {
     .read =3D pci_ide_data_read,
     .write =3D pci_ide_data_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void bmdma_start_dma(IDEDMA *dma, IDEState *s,
@@ -338,7 +338,7 @@ static void bmdma_addr_write(void *opaque, hwaddr addr,
 MemoryRegionOps bmdma_addr_ioport_ops =3D {
     .read =3D bmdma_addr_read,
     .write =3D bmdma_addr_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static bool ide_bmdma_current_needed(void *opaque)
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index d7590d4..30635e1 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -208,7 +208,7 @@ static void sii3112_reg_write(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps sii3112_reg_ops =3D {
     .read =3D sii3112_reg_read,
     .write =3D sii3112_reg_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 /* the PCI irq level is the logical OR of the two channels */
diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb.c
index f779cd4..f4e38f7 100644
--- a/hw/input/milkymist-softusb.c
+++ b/hw/input/milkymist-softusb.c
@@ -127,7 +127,7 @@ softusb_write(void *opaque, hwaddr addr, uint64_t value=
,
 static const MemoryRegionOps softusb_mmio_ops =3D {
     .read =3D softusb_read,
     .write =3D softusb_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 47a606f..dd78587 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -456,7 +456,7 @@ static const MemoryRegionOps i8042_mmio_ops =3D {
     .write =3D kbd_mm_writefn,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
@@ -518,7 +518,7 @@ static const MemoryRegionOps i8042_data_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps i8042_cmd_ops =3D {
@@ -528,7 +528,7 @@ static const MemoryRegionOps i8042_cmd_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void i8042_initfn(Object *obj)
diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 4c0fe0b..28936ef 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -137,7 +137,7 @@ static void pl050_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl050_ops =3D {
     .read =3D pl050_read,
     .write =3D pl050_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void pl050_realize(DeviceState *dev, Error **errp)
diff --git a/hw/input/pxa2xx_keypad.c b/hw/input/pxa2xx_keypad.c
index 93db9ed..c68f229 100644
--- a/hw/input/pxa2xx_keypad.c
+++ b/hw/input/pxa2xx_keypad.c
@@ -285,7 +285,7 @@ static void pxa2xx_keypad_write(void *opaque, hwaddr of=
fset,
 static const MemoryRegionOps pxa2xx_keypad_ops =3D {
     .read =3D pxa2xx_keypad_read,
     .write =3D pxa2xx_keypad_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_pxa2xx_keypad =3D {
diff --git a/hw/intc/allwinner-a10-pic.c b/hw/intc/allwinner-a10-pic.c
index 080bdd7..bb406e8 100644
--- a/hw/intc/allwinner-a10-pic.c
+++ b/hw/intc/allwinner-a10-pic.c
@@ -137,7 +137,7 @@ static void aw_a10_pic_write(void *opaque, hwaddr offse=
t, uint64_t value,
 static const MemoryRegionOps aw_a10_pic_ops =3D {
     .read =3D aw_a10_pic_read,
     .write =3D aw_a10_pic_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_aw_a10_pic =3D {
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index bce8991..6379c66 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -878,7 +878,7 @@ static const MemoryRegionOps apic_io_ops =3D {
     .impl.max_access_size =3D 4,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void apic_realize(DeviceState *dev, Error **errp)
diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 283a63a..f66710e 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1999,38 +1999,38 @@ static const MemoryRegionOps gic_ops[2] =3D {
     {
         .read_with_attrs =3D gic_dist_read,
         .write_with_attrs =3D gic_dist_write,
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
     },
     {
         .read_with_attrs =3D gic_thiscpu_read,
         .write_with_attrs =3D gic_thiscpu_write,
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
     }
 };

 static const MemoryRegionOps gic_cpu_ops =3D {
     .read_with_attrs =3D gic_do_cpu_read,
     .write_with_attrs =3D gic_do_cpu_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps gic_virt_ops[2] =3D {
     {
         .read_with_attrs =3D gic_thiscpu_hyp_read,
         .write_with_attrs =3D gic_thiscpu_hyp_write,
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
     },
     {
         .read_with_attrs =3D gic_thisvcpu_read,
         .write_with_attrs =3D gic_thisvcpu_write,
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
     }
 };

 static const MemoryRegionOps gic_viface_ops =3D {
     .read_with_attrs =3D gic_do_hyp_read,
     .write_with_attrs =3D gic_do_hyp_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void arm_gic_realize(DeviceState *dev, Error **errp)
diff --git a/hw/intc/arm_gicv2m.c b/hw/intc/arm_gicv2m.c
index 05f299f..5906828 100644
--- a/hw/intc/arm_gicv2m.c
+++ b/hw/intc/arm_gicv2m.c
@@ -126,7 +126,7 @@ static void gicv2m_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps gicv2m_ops =3D {
     .read =3D gicv2m_read,
     .write =3D gicv2m_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void gicv2m_realize(DeviceState *dev, Error **errp)
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 9b4d5ba..3e6526d 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -352,12 +352,12 @@ static const MemoryRegionOps gic_ops[] =3D {
     {
         .read_with_attrs =3D gicv3_dist_read,
         .write_with_attrs =3D gicv3_dist_write,
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
     },
     {
         .read_with_attrs =3D gicv3_redist_read,
         .write_with_attrs =3D gicv3_redist_write,
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
     }
 };

diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.=
c
index efb3d51..fcbbe6d 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -95,7 +95,7 @@ static MemTxResult gicv3_its_trans_write(void *opaque, hw=
addr offset,
 static const MemoryRegionOps gicv3_its_trans_ops =3D {
     .read_with_attrs =3D gicv3_its_trans_read,
     .write_with_attrs =3D gicv3_its_trans_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops)
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 237ccef..975d7cc 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2334,7 +2334,7 @@ static MemTxResult nvic_sysreg_write(void *opaque, hw=
addr addr,
 static const MemoryRegionOps nvic_sysreg_ops =3D {
     .read_with_attrs =3D nvic_sysreg_read,
     .write_with_attrs =3D nvic_sysreg_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static MemTxResult nvic_sysreg_ns_write(void *opaque, hwaddr addr,
@@ -2381,7 +2381,7 @@ static MemTxResult nvic_sysreg_ns_read(void *opaque, =
hwaddr addr,
 static const MemoryRegionOps nvic_sysreg_ns_ops =3D {
     .read_with_attrs =3D nvic_sysreg_ns_read,
     .write_with_attrs =3D nvic_sysreg_ns_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static MemTxResult nvic_systick_write(void *opaque, hwaddr addr,
@@ -2412,7 +2412,7 @@ static MemTxResult nvic_systick_read(void *opaque, hw=
addr addr,
 static const MemoryRegionOps nvic_systick_ops =3D {
     .read_with_attrs =3D nvic_systick_read,
     .write_with_attrs =3D nvic_systick_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static int nvic_post_load(void *opaque, int version_id)
diff --git a/hw/intc/aspeed_vic.c b/hw/intc/aspeed_vic.c
index 266a309..2556b54 100644
--- a/hw/intc/aspeed_vic.c
+++ b/hw/intc/aspeed_vic.c
@@ -283,7 +283,7 @@ static void aspeed_vic_write(void *opaque, hwaddr offse=
t, uint64_t data,
 static const MemoryRegionOps aspeed_vic_ops =3D {
     .read =3D aspeed_vic_read,
     .write =3D aspeed_vic_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
     .valid.unaligned =3D false,
diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c
index 61d3764..918f46b 100644
--- a/hw/intc/bcm2835_ic.c
+++ b/hw/intc/bcm2835_ic.c
@@ -168,7 +168,7 @@ static void bcm2835_ic_write(void *opaque, hwaddr offse=
t, uint64_t val,
 static const MemoryRegionOps bcm2835_ic_ops =3D {
     .read =3D bcm2835_ic_read,
     .write =3D bcm2835_ic_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
index 66417c8..14774a7 100644
--- a/hw/intc/bcm2836_control.c
+++ b/hw/intc/bcm2836_control.c
@@ -302,7 +302,7 @@ static void bcm2836_control_write(void *opaque, hwaddr =
offset,
 static const MemoryRegionOps bcm2836_control_ops =3D {
     .read =3D bcm2836_control_read,
     .write =3D bcm2836_control_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/intc/etraxfs_pic.c b/hw/intc/etraxfs_pic.c
index d4a27d1..ba15146 100644
--- a/hw/intc/etraxfs_pic.c
+++ b/hw/intc/etraxfs_pic.c
@@ -111,7 +111,7 @@ static void pic_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps pic_ops =3D {
     .read =3D pic_read,
     .write =3D pic_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index 6fed0e8..3e7294b 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -401,7 +401,7 @@ static void exynos4210_combiner_reset(DeviceState *d)
 static const MemoryRegionOps exynos4210_combiner_ops =3D {
     .read =3D exynos4210_combiner_read,
     .write =3D exynos4210_combiner_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 /*
diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index 21c77a5..3d6002b 100644
--- a/hw/intc/grlib_irqmp.c
+++ b/hw/intc/grlib_irqmp.c
@@ -313,7 +313,7 @@ static void grlib_irqmp_write(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps grlib_irqmp_ops =3D {
     .read =3D grlib_irqmp_read,
     .write =3D grlib_irqmp_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/intc/heathrow_pic.c b/hw/intc/heathrow_pic.c
index c282ac4..083be15 100644
--- a/hw/intc/heathrow_pic.c
+++ b/hw/intc/heathrow_pic.c
@@ -109,7 +109,7 @@ static uint64_t heathrow_read(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps heathrow_ops =3D {
     .read =3D heathrow_read,
     .write =3D heathrow_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void heathrow_set_irq(void *opaque, int num, int level)
diff --git a/hw/intc/imx_avic.c b/hw/intc/imx_avic.c
index 4bef842..3e0b622 100644
--- a/hw/intc/imx_avic.c
+++ b/hw/intc/imx_avic.c
@@ -308,7 +308,7 @@ static void imx_avic_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps imx_avic_ops =3D {
     .read =3D imx_avic_read,
     .write =3D imx_avic_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void imx_avic_reset(DeviceState *dev)
diff --git a/hw/intc/imx_gpcv2.c b/hw/intc/imx_gpcv2.c
index f37e6b5..f047bf1 100644
--- a/hw/intc/imx_gpcv2.c
+++ b/hw/intc/imx_gpcv2.c
@@ -64,7 +64,7 @@ static void imx_gpcv2_write(void *opaque, hwaddr offset,
 static const struct MemoryRegionOps imx_gpcv2_ops =3D {
     .read =3D imx_gpcv2_read,
     .write =3D imx_gpcv2_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index e99c37c..1603f4d 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -403,7 +403,7 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t va=
l,
 static const MemoryRegionOps ioapic_io_ops =3D {
     .read =3D ioapic_mem_read,
     .write =3D ioapic_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void ioapic_machine_done_notify(Notifier *notifier, void *data)
diff --git a/hw/intc/mips_gic.c b/hw/intc/mips_gic.c
index 33ab51c..9d93664 100644
--- a/hw/intc/mips_gic.c
+++ b/hw/intc/mips_gic.c
@@ -385,7 +385,7 @@ static void gic_reset(void *opaque)
 static const MemoryRegionOps gic_ops =3D {
     .read =3D gic_read,
     .write =3D gic_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         .max_access_size =3D 8,
     },
diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index 053e67c..07aa4df 100644
--- a/hw/intc/omap_intc.c
+++ b/hw/intc/omap_intc.c
@@ -330,7 +330,7 @@ static void omap_inth_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_inth_mem_ops =3D {
     .read =3D omap_inth_read,
     .write =3D omap_inth_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -606,7 +606,7 @@ static void omap2_inth_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap2_inth_mem_ops =3D {
     .read =3D omap2_inth_read,
     .write =3D omap2_inth_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/intc/ompic.c b/hw/intc/ompic.c
index 9cb310a..32c37ce 100644
--- a/hw/intc/ompic.c
+++ b/hw/intc/ompic.c
@@ -95,7 +95,7 @@ static void ompic_write(void *opaque, hwaddr addr, uint64=
_t data, unsigned size)
 static const MemoryRegionOps ompic_ops =3D {
     .read =3D ompic_read,
     .write =3D ompic_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         .max_access_size =3D 8,
     },
diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 9b4fc6c..b573202 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -1148,7 +1148,7 @@ static uint64_t openpic_cpu_read(void *opaque, hwaddr=
 addr, unsigned len)
 static const MemoryRegionOps openpic_glb_ops_le =3D {
     .write =3D openpic_gbl_write,
     .read  =3D openpic_gbl_read,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1158,7 +1158,7 @@ static const MemoryRegionOps openpic_glb_ops_le =3D {
 static const MemoryRegionOps openpic_glb_ops_be =3D {
     .write =3D openpic_gbl_write,
     .read  =3D openpic_gbl_read,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1168,7 +1168,7 @@ static const MemoryRegionOps openpic_glb_ops_be =3D {
 static const MemoryRegionOps openpic_tmr_ops_le =3D {
     .write =3D openpic_tmr_write,
     .read  =3D openpic_tmr_read,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1178,7 +1178,7 @@ static const MemoryRegionOps openpic_tmr_ops_le =3D {
 static const MemoryRegionOps openpic_tmr_ops_be =3D {
     .write =3D openpic_tmr_write,
     .read  =3D openpic_tmr_read,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1188,7 +1188,7 @@ static const MemoryRegionOps openpic_tmr_ops_be =3D {
 static const MemoryRegionOps openpic_cpu_ops_le =3D {
     .write =3D openpic_cpu_write,
     .read  =3D openpic_cpu_read,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1198,7 +1198,7 @@ static const MemoryRegionOps openpic_cpu_ops_le =3D {
 static const MemoryRegionOps openpic_cpu_ops_be =3D {
     .write =3D openpic_cpu_write,
     .read  =3D openpic_cpu_read,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1208,7 +1208,7 @@ static const MemoryRegionOps openpic_cpu_ops_be =3D {
 static const MemoryRegionOps openpic_src_ops_le =3D {
     .write =3D openpic_src_write,
     .read  =3D openpic_src_read,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1218,7 +1218,7 @@ static const MemoryRegionOps openpic_src_ops_le =3D {
 static const MemoryRegionOps openpic_src_ops_be =3D {
     .write =3D openpic_src_write,
     .read  =3D openpic_src_read,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1228,7 +1228,7 @@ static const MemoryRegionOps openpic_src_ops_be =3D {
 static const MemoryRegionOps openpic_msi_ops_be =3D {
     .read =3D openpic_msi_read,
     .write =3D openpic_msi_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1238,7 +1238,7 @@ static const MemoryRegionOps openpic_msi_ops_be =3D {
 static const MemoryRegionOps openpic_summary_ops_be =3D {
     .read =3D openpic_summary_read,
     .write =3D openpic_summary_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
index 49fc6fa..4581121 100644
--- a/hw/intc/openpic_kvm.c
+++ b/hw/intc/openpic_kvm.c
@@ -109,7 +109,7 @@ static uint64_t kvm_openpic_read(void *opaque, hwaddr a=
ddr, unsigned size)
 static const MemoryRegionOps kvm_openpic_mem_ops =3D {
     .write =3D kvm_openpic_write,
     .read  =3D kvm_openpic_read,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/intc/pl190.c b/hw/intc/pl190.c
index e6eab1e..6d1bbb1 100644
--- a/hw/intc/pl190.c
+++ b/hw/intc/pl190.c
@@ -220,7 +220,7 @@ static void pl190_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl190_ops =3D {
     .read =3D pl190_read,
     .write =3D pl190_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void pl190_reset(DeviceState *d)
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 4dc92ef..edea170 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -1186,7 +1186,7 @@ static uint64_t pnv_xive_ic_reg_read(void *opaque, hw=
addr offset, unsigned size)
 static const MemoryRegionOps pnv_xive_ic_reg_ops =3D {
     .read =3D pnv_xive_ic_reg_read,
     .write =3D pnv_xive_ic_reg_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
@@ -1285,7 +1285,7 @@ static uint64_t pnv_xive_ic_notify_read(void *opaque,=
 hwaddr addr,
 static const MemoryRegionOps pnv_xive_ic_notify_ops =3D {
     .read =3D pnv_xive_ic_notify_read,
     .write =3D pnv_xive_ic_notify_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
@@ -1319,7 +1319,7 @@ static uint64_t pnv_xive_ic_lsi_read(void *opaque, hw=
addr addr, unsigned size)
 static const MemoryRegionOps pnv_xive_ic_lsi_ops =3D {
     .read =3D pnv_xive_ic_lsi_read,
     .write =3D pnv_xive_ic_lsi_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
@@ -1384,7 +1384,7 @@ static uint64_t xive_tm_indirect_read(void *opaque, h=
waddr offset,
 static const MemoryRegionOps xive_tm_indirect_ops =3D {
     .read =3D xive_tm_indirect_read,
     .write =3D xive_tm_indirect_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
@@ -1418,7 +1418,7 @@ static void pnv_xive_xscom_write(void *opaque, hwaddr=
 addr,
 static const MemoryRegionOps pnv_xive_xscom_ops =3D {
     .read =3D pnv_xive_xscom_read,
     .write =3D pnv_xive_xscom_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
@@ -1514,7 +1514,7 @@ static void pnv_xive_vc_write(void *opaque, hwaddr of=
fset,
 static const MemoryRegionOps pnv_xive_vc_ops =3D {
     .read =3D pnv_xive_vc_read,
     .write =3D pnv_xive_vc_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
@@ -1549,7 +1549,7 @@ static void pnv_xive_pc_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps pnv_xive_pc_ops =3D {
     .read =3D pnv_xive_pc_read,
     .write =3D pnv_xive_pc_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
diff --git a/hw/intc/puv3_intc.c b/hw/intc/puv3_intc.c
index 97999cc..feadc2c 100644
--- a/hw/intc/puv3_intc.c
+++ b/hw/intc/puv3_intc.c
@@ -100,7 +100,7 @@ static const MemoryRegionOps puv3_intc_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void puv3_intc_realize(DeviceState *dev, Error **errp)
diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index bac7886..3bf8868 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -289,7 +289,7 @@ static void sh_intc_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps sh_intc_ops =3D {
     .read =3D sh_intc_read,
     .write =3D sh_intc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 struct intc_source *sh_intc_source(struct intc_desc *desc, intc_enum id)
diff --git a/hw/intc/slavio_intctl.c b/hw/intc/slavio_intctl.c
index ca52875..5a09e8b 100644
--- a/hw/intc/slavio_intctl.c
+++ b/hw/intc/slavio_intctl.c
@@ -134,7 +134,7 @@ static void slavio_intctl_mem_writel(void *opaque, hwad=
dr addr,
 static const MemoryRegionOps slavio_intctl_mem_ops =3D {
     .read =3D slavio_intctl_mem_readl,
     .write =3D slavio_intctl_mem_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -204,7 +204,7 @@ static void slavio_intctlm_mem_writel(void *opaque, hwa=
ddr addr,
 static const MemoryRegionOps slavio_intctlm_mem_ops =3D {
     .read =3D slavio_intctlm_mem_readl,
     .write =3D slavio_intctlm_mem_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/intc/xics_pnv.c b/hw/intc/xics_pnv.c
index 67f2702..7acd6ec 100644
--- a/hw/intc/xics_pnv.c
+++ b/hw/intc/xics_pnv.c
@@ -149,7 +149,7 @@ bad_access:
 static const MemoryRegionOps pnv_icp_ops =3D {
     .read =3D pnv_icp_read,
     .write =3D pnv_icp_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
index d5363e9..61034d9 100644
--- a/hw/intc/xilinx_intc.c
+++ b/hw/intc/xilinx_intc.c
@@ -142,7 +142,7 @@ pic_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps pic_ops =3D {
     .read =3D pic_read,
     .write =3D pic_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index da148e9..7eff6c4 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -479,7 +479,7 @@ static uint64_t xive_tm_read(void *opaque, hwaddr offse=
t, unsigned size)
 const MemoryRegionOps xive_tm_ops =3D {
     .read =3D xive_tm_read,
     .write =3D xive_tm_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
@@ -969,7 +969,7 @@ out:
 static const MemoryRegionOps xive_source_esb_ops =3D {
     .read =3D xive_source_esb_read,
     .write =3D xive_source_esb_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
@@ -1664,7 +1664,7 @@ static void xive_end_source_write(void *opaque, hwadd=
r addr,
 static const MemoryRegionOps xive_end_source_ops =3D {
     .read =3D xive_end_source_read,
     .write =3D xive_end_source_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
diff --git a/hw/intc/xlnx-pmu-iomod-intc.c b/hw/intc/xlnx-pmu-iomod-intc.c
index 0b8ff89..c4bab81 100644
--- a/hw/intc/xlnx-pmu-iomod-intc.c
+++ b/hw/intc/xlnx-pmu-iomod-intc.c
@@ -464,7 +464,7 @@ static void xlnx_pmu_io_intc_reset(DeviceState *dev)
 static const MemoryRegionOps xlnx_pmu_io_intc_ops =3D {
     .read =3D register_read_memory,
     .write =3D register_write_memory,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/intc/xlnx-zynqmp-ipi.c b/hw/intc/xlnx-zynqmp-ipi.c
index 0dad6c0..7ac94bb 100644
--- a/hw/intc/xlnx-zynqmp-ipi.c
+++ b/hw/intc/xlnx-zynqmp-ipi.c
@@ -295,7 +295,7 @@ static void xlnx_zynqmp_obs_handler(void *opaque, int n=
, int level)
 static const MemoryRegionOps xlnx_zynqmp_ipi_ops =3D {
     .read =3D register_read_memory,
     .write =3D register_write_memory,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
index d4d8510..8bf866c 100644
--- a/hw/ipack/tpci200.c
+++ b/hw/ipack/tpci200.c
@@ -524,7 +524,7 @@ static void tpci200_write_las3(void *opaque, hwaddr add=
r, uint64_t val,
 static const MemoryRegionOps tpci200_cfg_ops =3D {
     .read =3D tpci200_read_cfg,
     .write =3D tpci200_write_cfg,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D  {
         .min_access_size =3D 1,
         .max_access_size =3D 4
@@ -538,7 +538,7 @@ static const MemoryRegionOps tpci200_cfg_ops =3D {
 static const MemoryRegionOps tpci200_las0_ops =3D {
     .read =3D tpci200_read_las0,
     .write =3D tpci200_write_las0,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D  {
         .min_access_size =3D 2,
         .max_access_size =3D 2
@@ -548,7 +548,7 @@ static const MemoryRegionOps tpci200_las0_ops =3D {
 static const MemoryRegionOps tpci200_las1_ops =3D {
     .read =3D tpci200_read_las1,
     .write =3D tpci200_write_las1,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D  {
         .min_access_size =3D 1,
         .max_access_size =3D 2
@@ -558,7 +558,7 @@ static const MemoryRegionOps tpci200_las1_ops =3D {
 static const MemoryRegionOps tpci200_las2_ops =3D {
     .read =3D tpci200_read_las2,
     .write =3D tpci200_write_las2,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D  {
         .min_access_size =3D 1,
         .max_access_size =3D 2
@@ -568,7 +568,7 @@ static const MemoryRegionOps tpci200_las2_ops =3D {
 static const MemoryRegionOps tpci200_las3_ops =3D {
     .read =3D tpci200_read_las3,
     .write =3D tpci200_write_las3,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D  {
         .min_access_size =3D 1,
         .max_access_size =3D 1
diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index 1846d5b..4fefbcf 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -320,7 +320,7 @@ static const MemoryRegionOps ipmi_bt_io_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void ipmi_bt_set_atn(IPMIInterface *ii, int val, int irq)
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index 068f341..2671fdc 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -313,7 +313,7 @@ const MemoryRegionOps ipmi_kcs_io_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void ipmi_kcs_set_atn(IPMIInterface *ii, int val, int irq)
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index a7081bd..1a9e66e 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -569,7 +569,7 @@ static void ich9_lpc_reset(DeviceState *qdev)
 static const MemoryRegionOps rcrb_mmio_ops =3D {
     .read =3D ich9_cc_read,
     .write =3D ich9_cc_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void ich9_lpc_machine_ready(Notifier *n, void *opaque)
@@ -620,7 +620,7 @@ static uint64_t ich9_rst_cnt_read(void *opaque, hwaddr =
addr, unsigned len)
 static const MemoryRegionOps ich9_rst_cnt_ops =3D {
     .read =3D ich9_rst_cnt_read,
     .write =3D ich9_rst_cnt_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN
+    .endianness =3D MO_LE
 };

 static void ich9_lpc_get_sci_int(Object *obj, Visitor *v, const char *name=
,
diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
index 85dbc94..8718b2d 100644
--- a/hw/isa/pc87312.c
+++ b/hw/isa/pc87312.c
@@ -265,7 +265,7 @@ static uint64_t pc87312_io_read(void *opaque, hwaddr ad=
dr, unsigned int size)
 static const MemoryRegionOps pc87312_io_ops =3D {
     .read  =3D pc87312_io_read,
     .write =3D pc87312_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index adf65d3..13828d3 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -108,7 +108,7 @@ static uint64_t superio_ioport_readb(void *opaque, hwad=
dr addr, unsigned size)
 static const MemoryRegionOps superio_ops =3D {
     .read =3D superio_ioport_readb,
     .write =3D superio_ioport_writeb,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 1c17f83..1b7712e 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -548,7 +548,7 @@ static const MemoryRegionOps m5206_mbar_ops =3D {
     .write =3D m5206_mbar_writefn,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 qemu_irq *mcf5206_init(MemoryRegion *sysmem, uint32_t base, M68kCPU *cpu)
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 6f6efae..7fdeb16 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -138,7 +138,7 @@ static uint64_t m5208_timer_read(void *opaque, hwaddr a=
ddr,
 static const MemoryRegionOps m5208_timer_ops =3D {
     .read =3D m5208_timer_read,
     .write =3D m5208_timer_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static uint64_t m5208_sys_read(void *opaque, hwaddr addr,
@@ -172,7 +172,7 @@ static void m5208_sys_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps m5208_sys_ops =3D {
     .read =3D m5208_sys_read,
     .write =3D m5208_sys_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
diff --git a/hw/m68k/mcf_intc.c b/hw/m68k/mcf_intc.c
index a613aed..c38a347 100644
--- a/hw/m68k/mcf_intc.c
+++ b/hw/m68k/mcf_intc.c
@@ -159,7 +159,7 @@ static void mcf_intc_reset(DeviceState *dev)
 static const MemoryRegionOps mcf_intc_ops =3D {
     .read =3D mcf_intc_read,
     .write =3D mcf_intc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void mcf_intc_instance_init(Object *obj)
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_=
ml605_mmu.c
index a88bf16..857c659 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -122,7 +122,7 @@ petalogix_ml605_init(MachineState *machine)

     serial_mm_init(address_space_mem, UART16550_BASEADDR + 0x1000, 2,
                    irq[UART16550_IRQ], 115200, serial_hd(0),
-                   DEVICE_LITTLE_ENDIAN);
+                   MO_LE);

     /* 2 timers at irq 2 @ 100 Mhz.  */
     dev =3D qdev_create(NULL, "xlnx.xps-timer");
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 9eeccbe..89babaa 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -165,7 +165,7 @@ static void boston_lcd_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps boston_lcd_ops =3D {
     .read =3D boston_lcd_read,
     .write =3D boston_lcd_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static uint64_t boston_platreg_read(void *opaque, hwaddr addr,
@@ -244,7 +244,7 @@ static void boston_platreg_write(void *opaque, hwaddr a=
ddr,
 static const MemoryRegionOps boston_platreg_ops =3D {
     .read =3D boston_platreg_read,
     .write =3D boston_platreg_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const TypeInfo boston_device =3D {
@@ -504,7 +504,7 @@ static void boston_mach_init(MachineState *machine)

     s->uart =3D serial_mm_init(sys_mem, 0x17ffe000, 2,
                              get_cps_irq(&s->cps, 3), 10000000,
-                             serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                             serial_hd(0), MO_TE);

     lcd =3D g_new(MemoryRegion, 1);
     memory_region_init_io(lcd, NULL, &boston_lcd_ops, s, "boston-lcd", 0x8=
);
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 2fa313f..7ed4d5c 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -972,7 +972,7 @@ static uint64_t gt64120_readl(void *opaque,
 static const MemoryRegionOps isd_mem_ops =3D {
     .read =3D gt64120_readl,
     .write =3D gt64120_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index fa8775d..397c96e 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -84,7 +84,7 @@ static void rtc_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps rtc_ops =3D {
     .read =3D rtc_read,
     .write =3D rtc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static uint64_t dma_dummy_read(void *opaque, hwaddr addr,
@@ -105,7 +105,7 @@ static void dma_dummy_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps dma_dummy_ops =3D {
     .read =3D dma_dummy_read,
     .write =3D dma_dummy_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 #define MAGNUM_BIOS_SIZE_MAX 0x7e000
@@ -320,12 +320,12 @@ static void mips_jazz_init(MachineState *machine,
     if (serial_hd(0)) {
         serial_mm_init(address_space, 0x80006000, 0,
                        qdev_get_gpio_in(rc4030, 8), 8000000/16,
-                       serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                       serial_hd(0), MO_TE);
     }
     if (serial_hd(1)) {
         serial_mm_init(address_space, 0x80007000, 0,
                        qdev_get_gpio_in(rc4030, 9), 8000000/16,
-                       serial_hd(1), DEVICE_NATIVE_ENDIAN);
+                       serial_hd(1), MO_TE);
     }

     /* Parallel port */
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 20e019b..efb6690 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -511,7 +511,7 @@ static void malta_fpga_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps malta_fpga_ops =3D {
     .read =3D malta_fpga_read,
     .write =3D malta_fpga_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void malta_fpga_reset(void *opaque)
@@ -572,7 +572,7 @@ static MaltaFPGAState *malta_fpga_init(MemoryRegion *ad=
dress_space,
                              malta_fgpa_display_event, NULL, s, NULL, true=
);

     s->uart =3D serial_mm_init(address_space, base + 0x900, 3, uart_irq,
-                             230400, uart_chr, DEVICE_NATIVE_ENDIAN);
+                             230400, uart_chr, MO_TE);

     malta_fpga_reset(s);
     qemu_register_reset(malta_fpga_reset, s);
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index 93dbf76..a013ac7 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -70,7 +70,7 @@ static uint64_t mips_qemu_read (void *opaque, hwaddr addr=
,
 static const MemoryRegionOps mips_qemu_ops =3D {
     .read =3D mips_qemu_read,
     .write =3D mips_qemu_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 typedef struct ResetData {
diff --git a/hw/misc/a9scu.c b/hw/misc/a9scu.c
index 3de8cd3..2b96f1c 100644
--- a/hw/misc/a9scu.c
+++ b/hw/misc/a9scu.c
@@ -94,7 +94,7 @@ static void a9_scu_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps a9_scu_ops =3D {
     .read =3D a9_scu_read,
     .write =3D a9_scu_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void a9_scu_reset(DeviceState *dev)
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 6c91f29..086d05c 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -285,7 +285,7 @@ static void qdev_applesmc_isa_reset(DeviceState *dev)
 static const MemoryRegionOps applesmc_data_io_ops =3D {
     .write =3D applesmc_io_data_write,
     .read =3D applesmc_io_data_read,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -295,7 +295,7 @@ static const MemoryRegionOps applesmc_data_io_ops =3D {
 static const MemoryRegionOps applesmc_cmd_io_ops =3D {
     .write =3D applesmc_io_cmd_write,
     .read =3D applesmc_io_cmd_read,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -305,7 +305,7 @@ static const MemoryRegionOps applesmc_cmd_io_ops =3D {
 static const MemoryRegionOps applesmc_err_io_ops =3D {
     .write =3D applesmc_io_err_write,
     .read =3D applesmc_io_err_read,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/misc/arm11scu.c b/hw/misc/arm11scu.c
index 59fd7c0..840a308 100644
--- a/hw/misc/arm11scu.c
+++ b/hw/misc/arm11scu.c
@@ -57,7 +57,7 @@ static void mpcore_scu_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps mpcore_scu_ops =3D {
     .read =3D mpcore_scu_read,
     .write =3D mpcore_scu_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void arm11_scu_realize(DeviceState *dev, Error **errp)
diff --git a/hw/misc/arm_integrator_debug.c b/hw/misc/arm_integrator_debug.=
c
index 2646107..917fe1f 100644
--- a/hw/misc/arm_integrator_debug.c
+++ b/hw/misc/arm_integrator_debug.c
@@ -73,7 +73,7 @@ static void intdbg_control_write(void *opaque, hwaddr off=
set,
 static const MemoryRegionOps intdbg_control_ops =3D {
     .read =3D intdbg_control_read,
     .write =3D intdbg_control_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void intdbg_control_init(Object *obj)
diff --git a/hw/misc/arm_l2x0.c b/hw/misc/arm_l2x0.c
index 72ecf46..8e63393 100644
--- a/hw/misc/arm_l2x0.c
+++ b/hw/misc/arm_l2x0.c
@@ -157,7 +157,7 @@ static void l2x0_priv_reset(DeviceState *dev)
 static const MemoryRegionOps l2x0_mem_ops =3D {
     .read =3D l2x0_priv_read,
     .write =3D l2x0_priv_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
  };

 static void l2x0_priv_init(Object *obj)
diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
index 457dfad..736a708 100644
--- a/hw/misc/arm_sysctl.c
+++ b/hw/misc/arm_sysctl.c
@@ -561,7 +561,7 @@ static void arm_sysctl_write(void *opaque, hwaddr offse=
t,
 static const MemoryRegionOps arm_sysctl_ops =3D {
     .read =3D arm_sysctl_read,
     .write =3D arm_sysctl_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void arm_sysctl_gpio_set(void *opaque, int line, int level)
diff --git a/hw/misc/armsse-cpuid.c b/hw/misc/armsse-cpuid.c
index 05c08f3..3da0f02 100644
--- a/hw/misc/armsse-cpuid.c
+++ b/hw/misc/armsse-cpuid.c
@@ -84,7 +84,7 @@ static void armsse_cpuid_write(void *opaque, hwaddr offse=
t,
 static const MemoryRegionOps armsse_cpuid_ops =3D {
     .read =3D armsse_cpuid_read,
     .write =3D armsse_cpuid_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     /* byte/halfword accesses are just zero-padded on reads and writes */
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
diff --git a/hw/misc/armsse-mhu.c b/hw/misc/armsse-mhu.c
index 514321a..b57f892 100644
--- a/hw/misc/armsse-mhu.c
+++ b/hw/misc/armsse-mhu.c
@@ -139,7 +139,7 @@ static void armsse_mhu_write(void *opaque, hwaddr offse=
t,
 static const MemoryRegionOps armsse_mhu_ops =3D {
     .read =3D armsse_mhu_read,
     .write =3D armsse_mhu_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 71a0d4b..fca5fe5 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -276,7 +276,7 @@ static void aspeed_scu_write(void *opaque, hwaddr offse=
t, uint64_t data,
 static const MemoryRegionOps aspeed_scu_ops =3D {
     .read =3D aspeed_scu_read,
     .write =3D aspeed_scu_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
     .valid.unaligned =3D false,
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index b84676d..6444afb 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -169,7 +169,7 @@ static void aspeed_sdmc_write(void *opaque, hwaddr addr=
, uint64_t data,
 static const MemoryRegionOps aspeed_sdmc_ops =3D {
     .read =3D aspeed_sdmc_read,
     .write =3D aspeed_sdmc_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/misc/aspeed_xdma.c b/hw/misc/aspeed_xdma.c
index eebd4ad..3568a40 100644
--- a/hw/misc/aspeed_xdma.c
+++ b/hw/misc/aspeed_xdma.c
@@ -106,7 +106,7 @@ static void aspeed_xdma_write(void *opaque, hwaddr addr=
, uint64_t val,
 static const MemoryRegionOps aspeed_xdma_ops =3D {
     .read =3D aspeed_xdma_read,
     .write =3D aspeed_xdma_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
index a87da5e..0e19b3f 100644
--- a/hw/misc/bcm2835_mbox.c
+++ b/hw/misc/bcm2835_mbox.c
@@ -237,7 +237,7 @@ static void bcm2835_mbox_write(void *opaque, hwaddr off=
set,
 static const MemoryRegionOps bcm2835_mbox_ops =3D {
     .read =3D bcm2835_mbox_read,
     .write =3D bcm2835_mbox_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 0bf789c..0085902 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -343,7 +343,7 @@ static void bcm2835_property_write(void *opaque, hwaddr=
 offset,
 static const MemoryRegionOps bcm2835_property_ops =3D {
     .read =3D bcm2835_property_read,
     .write =3D bcm2835_property_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c
index e882c87..8e0b329 100644
--- a/hw/misc/bcm2835_rng.c
+++ b/hw/misc/bcm2835_rng.c
@@ -91,7 +91,7 @@ static void bcm2835_rng_write(void *opaque, hwaddr offset=
,
 static const MemoryRegionOps bcm2835_rng_ops =3D {
     .read =3D bcm2835_rng_read,
     .write =3D bcm2835_rng_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_bcm2835_rng =3D {
diff --git a/hw/misc/debugexit.c b/hw/misc/debugexit.c
index 8e4a2fc..c34960e 100644
--- a/hw/misc/debugexit.c
+++ b/hw/misc/debugexit.c
@@ -40,7 +40,7 @@ static const MemoryRegionOps debug_exit_ops =3D {
     .write =3D debug_exit_write,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void debug_exit_realizefn(DeviceState *d, Error **errp)
diff --git a/hw/misc/eccmemctl.c b/hw/misc/eccmemctl.c
index 8386db0..f01b397 100644
--- a/hw/misc/eccmemctl.c
+++ b/hw/misc/eccmemctl.c
@@ -228,7 +228,7 @@ static uint64_t ecc_mem_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps ecc_mem_ops =3D {
     .read =3D ecc_mem_read,
     .write =3D ecc_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -257,7 +257,7 @@ static uint64_t ecc_diag_mem_read(void *opaque, hwaddr =
addr,
 static const MemoryRegionOps ecc_diag_mem_ops =3D {
     .read =3D ecc_diag_mem_read,
     .write =3D ecc_diag_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index 3b6dba2..73252d0 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -294,7 +294,7 @@ static void edu_mmio_write(void *opaque, hwaddr addr, u=
int64_t val,
 static const MemoryRegionOps edu_mmio_ops =3D {
     .read =3D edu_mmio_read,
     .write =3D edu_mmio_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 8,
diff --git a/hw/misc/exynos4210_clk.c b/hw/misc/exynos4210_clk.c
index 821d9ea..b83bb88 100644
--- a/hw/misc/exynos4210_clk.c
+++ b/hw/misc/exynos4210_clk.c
@@ -100,7 +100,7 @@ static void exynos4210_clk_write(void *opaque, hwaddr o=
ffset,
 static const MemoryRegionOps exynos4210_clk_ops =3D {
     .read =3D exynos4210_clk_read,
     .write =3D exynos4210_clk_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
index 8712774..75617f9 100644
--- a/hw/misc/exynos4210_pmu.c
+++ b/hw/misc/exynos4210_pmu.c
@@ -457,7 +457,7 @@ static void exynos4210_pmu_write(void *opaque, hwaddr o=
ffset,
 static const MemoryRegionOps exynos4210_pmu_ops =3D {
     .read =3D exynos4210_pmu_read,
     .write =3D exynos4210_pmu_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/misc/exynos4210_rng.c b/hw/misc/exynos4210_rng.c
index b88fe3a..644f647 100644
--- a/hw/misc/exynos4210_rng.c
+++ b/hw/misc/exynos4210_rng.c
@@ -215,7 +215,7 @@ static void exynos4210_rng_write(void *opaque, hwaddr o=
ffset,
 static const MemoryRegionOps exynos4210_rng_ops =3D {
     .read =3D exynos4210_rng_read,
     .write =3D exynos4210_rng_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void exynos4210_rng_reset(DeviceState *dev)
diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
index 7338461..a85624e 100644
--- a/hw/misc/grlib_ahb_apb_pnp.c
+++ b/hw/misc/grlib_ahb_apb_pnp.c
@@ -137,7 +137,7 @@ static uint64_t grlib_ahb_pnp_read(void *opaque, hwaddr=
 offset, unsigned size)

 static const MemoryRegionOps grlib_ahb_pnp_ops =3D {
     .read       =3D grlib_ahb_pnp_read,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void grlib_ahb_pnp_realize(DeviceState *dev, Error **errp)
@@ -233,7 +233,7 @@ static uint64_t grlib_apb_pnp_read(void *opaque, hwaddr=
 offset, unsigned size)

 static const MemoryRegionOps grlib_apb_pnp_ops =3D {
     .read       =3D grlib_apb_pnp_read,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void grlib_apb_pnp_realize(DeviceState *dev, Error **errp)
diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c
index 693ea81..9a7fbe7 100644
--- a/hw/misc/imx25_ccm.c
+++ b/hw/misc/imx25_ccm.c
@@ -266,7 +266,7 @@ static void imx25_ccm_write(void *opaque, hwaddr offset=
, uint64_t value,
 static const struct MemoryRegionOps imx25_ccm_ops =3D {
     .read =3D imx25_ccm_read,
     .write =3D imx25_ccm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/misc/imx2_wdt.c b/hw/misc/imx2_wdt.c
index 5576778..07e97a2 100644
--- a/hw/misc/imx2_wdt.c
+++ b/hw/misc/imx2_wdt.c
@@ -37,7 +37,7 @@ static void imx2_wdt_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps imx2_wdt_ops =3D {
     .read  =3D imx2_wdt_read,
     .write =3D imx2_wdt_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/misc/imx31_ccm.c b/hw/misc/imx31_ccm.c
index 38a19aa..08a5969 100644
--- a/hw/misc/imx31_ccm.c
+++ b/hw/misc/imx31_ccm.c
@@ -292,7 +292,7 @@ static void imx31_ccm_write(void *opaque, hwaddr offset=
, uint64_t value,
 static const struct MemoryRegionOps imx31_ccm_ops =3D {
     .read =3D imx31_ccm_read,
     .write =3D imx31_ccm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 9478007..e93f4a1 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -696,7 +696,7 @@ static void imx6_analog_write(void *opaque, hwaddr offs=
et, uint64_t value,
 static const struct MemoryRegionOps imx6_ccm_ops =3D {
     .read =3D imx6_ccm_read,
     .write =3D imx6_ccm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         /*
          * Our device would not work correctly if the guest was doing
@@ -713,7 +713,7 @@ static const struct MemoryRegionOps imx6_ccm_ops =3D {
 static const struct MemoryRegionOps imx6_analog_ops =3D {
     .read =3D imx6_analog_read,
     .write =3D imx6_analog_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index 878ffcd..85f40ac 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -262,7 +262,7 @@ static void imx6_src_write(void *opaque, hwaddr offset,=
 uint64_t value,
 static const struct MemoryRegionOps imx6_src_ops =3D {
     .read =3D imx6_src_read,
     .write =3D imx6_src_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/misc/imx6ul_ccm.c b/hw/misc/imx6ul_ccm.c
index 37b472d..88acb69 100644
--- a/hw/misc/imx6ul_ccm.c
+++ b/hw/misc/imx6ul_ccm.c
@@ -801,7 +801,7 @@ static void imx6ul_analog_write(void *opaque, hwaddr of=
fset, uint64_t value,
 static const struct MemoryRegionOps imx6ul_ccm_ops =3D {
     .read =3D imx6ul_ccm_read,
     .write =3D imx6ul_ccm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         /*
          * Our device would not work correctly if the guest was doing
@@ -818,7 +818,7 @@ static const struct MemoryRegionOps imx6ul_ccm_ops =3D =
{
 static const struct MemoryRegionOps imx6ul_analog_ops =3D {
     .read =3D imx6ul_analog_read,
     .write =3D imx6ul_analog_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/misc/imx7_ccm.c b/hw/misc/imx7_ccm.c
index d9bdcf1..3305316 100644
--- a/hw/misc/imx7_ccm.c
+++ b/hw/misc/imx7_ccm.c
@@ -116,7 +116,7 @@ static void imx7_set_clr_tog_write(void *opaque, hwaddr=
 offset,
 static const struct MemoryRegionOps imx7_set_clr_tog_ops =3D {
     .read =3D imx7_set_clr_tog_read,
     .write =3D imx7_set_clr_tog_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         /*
          * Our device would not work correctly if the guest was doing
@@ -132,7 +132,7 @@ static const struct MemoryRegionOps imx7_set_clr_tog_op=
s =3D {

 static const struct MemoryRegionOps imx7_digprog_ops =3D {
     .read =3D imx7_set_clr_tog_read,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/misc/imx7_gpr.c b/hw/misc/imx7_gpr.c
index 09d57d4..3cb144b 100644
--- a/hw/misc/imx7_gpr.c
+++ b/hw/misc/imx7_gpr.c
@@ -79,7 +79,7 @@ static void imx7_gpr_write(void *opaque, hwaddr offset,
 static const struct MemoryRegionOps imx7_gpr_ops =3D {
     .read =3D imx7_gpr_read,
     .write =3D imx7_gpr_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/misc/imx7_snvs.c b/hw/misc/imx7_snvs.c
index 55b962a..373d586 100644
--- a/hw/misc/imx7_snvs.c
+++ b/hw/misc/imx7_snvs.c
@@ -37,7 +37,7 @@ static void imx7_snvs_write(void *opaque, hwaddr offset,
 static const struct MemoryRegionOps imx7_snvs_ops =3D {
     .read =3D imx7_snvs_read,
     .write =3D imx7_snvs_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index 58fd94b..7cb1424 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -560,7 +560,7 @@ static MemTxResult iotkit_secctl_ns_write(void *opaque,=
 hwaddr addr,
 static const MemoryRegionOps iotkit_secctl_s_ops =3D {
     .read_with_attrs =3D iotkit_secctl_s_read,
     .write_with_attrs =3D iotkit_secctl_s_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
@@ -570,7 +570,7 @@ static const MemoryRegionOps iotkit_secctl_s_ops =3D {
 static const MemoryRegionOps iotkit_secctl_ns_ops =3D {
     .read_with_attrs =3D iotkit_secctl_ns_read,
     .write_with_attrs =3D iotkit_secctl_ns_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 00d4faa..6969a18 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -388,7 +388,7 @@ static void iotkit_sysctl_write(void *opaque, hwaddr of=
fset,
 static const MemoryRegionOps iotkit_sysctl_ops =3D {
     .read =3D iotkit_sysctl_read,
     .write =3D iotkit_sysctl_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     /* byte/halfword accesses are just zero-padded on reads and writes */
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
index 3e1cf0e..7f4133f 100644
--- a/hw/misc/iotkit-sysinfo.c
+++ b/hw/misc/iotkit-sysinfo.c
@@ -88,7 +88,7 @@ static void iotkit_sysinfo_write(void *opaque, hwaddr off=
set,
 static const MemoryRegionOps iotkit_sysinfo_ops =3D {
     .read =3D iotkit_sysinfo_read,
     .write =3D iotkit_sysinfo_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     /* byte/halfword accesses are just zero-padded on reads and writes */
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index f9cc66a..bc69cd7 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -275,7 +275,7 @@ static uint64_t ivshmem_io_read(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps ivshmem_mmio_ops =3D {
     .read =3D ivshmem_io_read,
     .write =3D ivshmem_io_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index 4f532ef..ad6d6b5 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -477,7 +477,7 @@ static void mos6522_cuda_write(void *opaque, hwaddr add=
r, uint64_t val,
 static const MemoryRegionOps mos6522_cuda_ops =3D {
     .read =3D mos6522_cuda_read,
     .write =3D mos6522_cuda_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c
index 31811ab..c4c9a68 100644
--- a/hw/misc/macio/gpio.c
+++ b/hw/misc/macio/gpio.c
@@ -144,7 +144,7 @@ static uint64_t macio_gpio_read(void *opaque, hwaddr ad=
dr, unsigned size)
 static const MemoryRegionOps macio_gpio_ops =3D {
     .read =3D macio_gpio_read,
     .write =3D macio_gpio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/misc/macio/mac_dbdma.c b/hw/misc/macio/mac_dbdma.c
index 548625a..4554b28 100644
--- a/hw/misc/macio/mac_dbdma.c
+++ b/hw/misc/macio/mac_dbdma.c
@@ -793,7 +793,7 @@ static uint64_t dbdma_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps dbdma_ops =3D {
     .read =3D dbdma_read,
     .write =3D dbdma_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 8249209..693bb26 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -284,7 +284,7 @@ static uint64_t timer_read(void *opaque, hwaddr addr, u=
nsigned size)
 static const MemoryRegionOps timer_ops =3D {
     .read =3D timer_read,
     .write =3D timer_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void macio_newworld_realize(PCIDevice *d, Error **errp)
diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
index 753561d..fb0d132 100644
--- a/hw/misc/macio/pmu.c
+++ b/hw/misc/macio/pmu.c
@@ -664,7 +664,7 @@ static void mos6522_pmu_write(void *opaque, hwaddr addr=
, uint64_t val,
 static const MemoryRegionOps mos6522_pmu_ops =3D {
     .read =3D mos6522_pmu_read,
     .write =3D mos6522_pmu_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/misc/milkymist-hpdmc.c b/hw/misc/milkymist-hpdmc.c
index 701c79e..33ecefb 100644
--- a/hw/misc/milkymist-hpdmc.c
+++ b/hw/misc/milkymist-hpdmc.c
@@ -113,7 +113,7 @@ static const MemoryRegionOps hpdmc_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void milkymist_hpdmc_reset(DeviceState *d)
diff --git a/hw/misc/milkymist-pfpu.c b/hw/misc/milkymist-pfpu.c
index 1c27f1a..e7c777b 100644
--- a/hw/misc/milkymist-pfpu.c
+++ b/hw/misc/milkymist-pfpu.c
@@ -475,7 +475,7 @@ static const MemoryRegionOps pfpu_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void milkymist_pfpu_reset(DeviceState *d)
diff --git a/hw/misc/mips_cmgcr.c b/hw/misc/mips_cmgcr.c
index edec164..f09cf1f 100644
--- a/hw/misc/mips_cmgcr.c
+++ b/hw/misc/mips_cmgcr.c
@@ -170,7 +170,7 @@ static void gcr_write(void *opaque, hwaddr addr, uint64=
_t data, unsigned size)
 static const MemoryRegionOps gcr_ops =3D {
     .read =3D gcr_read,
     .write =3D gcr_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         .max_access_size =3D 8,
     },
diff --git a/hw/misc/mips_cpc.c b/hw/misc/mips_cpc.c
index 446b1ad..2244ee4 100644
--- a/hw/misc/mips_cpc.c
+++ b/hw/misc/mips_cpc.c
@@ -111,7 +111,7 @@ static uint64_t cpc_read(void *opaque, hwaddr offset, u=
nsigned size)
 static const MemoryRegionOps cpc_ops =3D {
     .read =3D cpc_read,
     .write =3D cpc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         .max_access_size =3D 8,
     },
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index e8ba4a3..7369d7c 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -141,7 +141,7 @@ static const MemoryRegionOps itc_tag_ops =3D {
     .impl =3D {
         .max_access_size =3D 8,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static inline uint32_t get_num_cells(MIPSITUState *s)
@@ -482,7 +482,7 @@ static void itc_storage_write(void *opaque, hwaddr addr=
, uint64_t data,
 static const MemoryRegionOps itc_storage_ops =3D {
     .read =3D itc_storage_read,
     .write =3D itc_storage_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void itc_reset_cells(MIPSITUState *s)
diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index e72ed69..60f4208 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -364,7 +364,7 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t =
val, unsigned size)
 static const MemoryRegionOps mos6522_ops =3D {
     .read =3D mos6522_read,
     .write =3D mos6522_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index b97ad42..7d894e4 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -220,7 +220,7 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offs=
et, uint64_t value,
 static const MemoryRegionOps mps2_fpgaio_ops =3D {
     .read =3D mps2_fpgaio_read,
     .write =3D mps2_fpgaio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void mps2_fpgaio_reset(DeviceState *dev)
diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index 1fdf5d2..9a089e3 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -215,7 +215,7 @@ static void mps2_scc_write(void *opaque, hwaddr offset,=
 uint64_t value,
 static const MemoryRegionOps mps2_scc_ops =3D {
     .read =3D mps2_scc_read,
     .write =3D mps2_scc_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void mps2_scc_reset(DeviceState *dev)
diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
index 21a2863..33282dc 100644
--- a/hw/misc/msf2-sysreg.c
+++ b/hw/misc/msf2-sysreg.c
@@ -94,7 +94,7 @@ static void msf2_sysreg_write(void *opaque, hwaddr offset=
,
 static const MemoryRegionOps sysreg_ops =3D {
     .read =3D msf2_sysreg_read,
     .write =3D msf2_sysreg_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void msf2_sysreg_init(Object *obj)
diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c
index fd18303..d339380 100644
--- a/hw/misc/mst_fpga.c
+++ b/hw/misc/mst_fpga.c
@@ -189,9 +189,9 @@ mst_fpga_writeb(void *opaque, hwaddr addr, uint64_t val=
ue,
 }

 static const MemoryRegionOps mst_fpga_ops =3D {
- .read =3D mst_fpga_readb,
- .write =3D mst_fpga_writeb,
- .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .read =3D mst_fpga_readb,
+    .write =3D mst_fpga_writeb,
+    .endianness =3D MO_TE,
 };

 static int mst_fpga_post_load(void *opaque, int version_id)
diff --git a/hw/misc/nrf51_rng.c b/hw/misc/nrf51_rng.c
index 96ef433..9614446 100644
--- a/hw/misc/nrf51_rng.c
+++ b/hw/misc/nrf51_rng.c
@@ -137,7 +137,7 @@ static void rng_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps rng_ops =3D {
     .read =3D  rng_read,
     .write =3D rng_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4
 };
diff --git a/hw/misc/omap_gpmc.c b/hw/misc/omap_gpmc.c
index 84f9e4c..00da920 100644
--- a/hw/misc/omap_gpmc.c
+++ b/hw/misc/omap_gpmc.c
@@ -212,7 +212,7 @@ static void omap_nand_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_nand_ops =3D {
     .read =3D omap_nand_read,
     .write =3D omap_nand_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void fill_prefetch_fifo(struct omap_gpmc_s *s)
@@ -369,7 +369,7 @@ static void omap_gpmc_prefetch_write(void *opaque, hwad=
dr addr,
 static const MemoryRegionOps omap_prefetch_ops =3D {
     .read =3D omap_gpmc_prefetch_read,
     .write =3D omap_gpmc_prefetch_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 1,
 };
@@ -819,7 +819,7 @@ static void omap_gpmc_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_gpmc_ops =3D {
     .read =3D omap_gpmc_read,
     .write =3D omap_gpmc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 struct omap_gpmc_s *omap_gpmc_init(struct omap_mpu_state_s *mpu,
diff --git a/hw/misc/omap_l4.c b/hw/misc/omap_l4.c
index c217728..c09cbad 100644
--- a/hw/misc/omap_l4.c
+++ b/hw/misc/omap_l4.c
@@ -107,7 +107,7 @@ static void omap_l4ta_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_l4ta_ops =3D {
     .read =3D omap_l4ta_read,
     .write =3D omap_l4ta_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 struct omap_target_agent_s *omap_l4ta_get(struct omap_l4_s *bus,
diff --git a/hw/misc/omap_sdrc.c b/hw/misc/omap_sdrc.c
index 7b38c55..f9863de 100644
--- a/hw/misc/omap_sdrc.c
+++ b/hw/misc/omap_sdrc.c
@@ -152,7 +152,7 @@ static void omap_sdrc_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_sdrc_ops =3D {
     .read =3D omap_sdrc_read,
     .write =3D omap_sdrc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 struct omap_sdrc_s *omap_sdrc_init(MemoryRegion *sysmem,
diff --git a/hw/misc/omap_tap.c b/hw/misc/omap_tap.c
index 3f595e8..d005ac2 100644
--- a/hw/misc/omap_tap.c
+++ b/hw/misc/omap_tap.c
@@ -106,7 +106,7 @@ static void omap_tap_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_tap_ops =3D {
     .read =3D omap_tap_read,
     .write =3D omap_tap_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 void omap_tap_init(struct omap_target_agent_s *ta,
diff --git a/hw/misc/pc-testdev.c b/hw/misc/pc-testdev.c
index 1f9abd5..34a9227 100644
--- a/hw/misc/pc-testdev.c
+++ b/hw/misc/pc-testdev.c
@@ -78,7 +78,7 @@ static const MemoryRegionOps test_irq_ops =3D {
     .write =3D test_irq_line_write,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 1,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void test_ioport_write(void *opaque, hwaddr addr, uint64_t data,
@@ -104,7 +104,7 @@ static uint64_t test_ioport_read(void *opaque, hwaddr a=
ddr, unsigned len)
 static const MemoryRegionOps test_ioport_ops =3D {
     .read =3D test_ioport_read,
     .write =3D test_ioport_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps test_ioport_byte_ops =3D {
@@ -114,7 +114,7 @@ static const MemoryRegionOps test_ioport_byte_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 1,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t test_flush_page_read(void *opaque, hwaddr addr, unsigned s=
ize)
@@ -142,7 +142,7 @@ static const MemoryRegionOps test_flush_ops =3D {
     .write =3D test_flush_page_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t test_iomem_read(void *opaque, hwaddr addr, unsigned len)
@@ -165,7 +165,7 @@ static void test_iomem_write(void *opaque, hwaddr addr,=
 uint64_t val,
 static const MemoryRegionOps test_iomem_ops =3D {
     .read =3D test_iomem_read,
     .write =3D test_iomem_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void testdev_realizefn(DeviceState *d, Error **errp)
diff --git a/hw/misc/pci-testdev.c b/hw/misc/pci-testdev.c
index d4d89df..ee9c575 100644
--- a/hw/misc/pci-testdev.c
+++ b/hw/misc/pci-testdev.c
@@ -222,7 +222,7 @@ pci_testdev_pio_write(void *opaque, hwaddr addr, uint64=
_t val,
 static const MemoryRegionOps pci_testdev_mmio_ops =3D {
     .read =3D pci_testdev_read,
     .write =3D pci_testdev_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -232,7 +232,7 @@ static const MemoryRegionOps pci_testdev_mmio_ops =3D {
 static const MemoryRegionOps pci_testdev_pio_ops =3D {
     .read =3D pci_testdev_read,
     .write =3D pci_testdev_pio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/misc/puv3_pm.c b/hw/misc/puv3_pm.c
index cd82b69..b7ad46f 100644
--- a/hw/misc/puv3_pm.c
+++ b/hw/misc/puv3_pm.c
@@ -118,7 +118,7 @@ static const MemoryRegionOps puv3_pm_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void puv3_pm_realize(DeviceState *dev, Error **errp)
diff --git a/hw/misc/slavio_misc.c b/hw/misc/slavio_misc.c
index 9c2cf04..bbff86f 100644
--- a/hw/misc/slavio_misc.c
+++ b/hw/misc/slavio_misc.c
@@ -142,7 +142,7 @@ static uint64_t slavio_cfg_mem_readb(void *opaque, hwad=
dr addr,
 static const MemoryRegionOps slavio_cfg_mem_ops =3D {
     .read =3D slavio_cfg_mem_readb,
     .write =3D slavio_cfg_mem_writeb,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -172,7 +172,7 @@ static uint64_t slavio_diag_mem_readb(void *opaque, hwa=
ddr addr,
 static const MemoryRegionOps slavio_diag_mem_ops =3D {
     .read =3D slavio_diag_mem_readb,
     .write =3D slavio_diag_mem_writeb,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -202,7 +202,7 @@ static uint64_t slavio_mdm_mem_readb(void *opaque, hwad=
dr addr,
 static const MemoryRegionOps slavio_mdm_mem_ops =3D {
     .read =3D slavio_mdm_mem_readb,
     .write =3D slavio_mdm_mem_writeb,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -240,7 +240,7 @@ static uint64_t slavio_aux1_mem_readb(void *opaque, hwa=
ddr addr,
 static const MemoryRegionOps slavio_aux1_mem_ops =3D {
     .read =3D slavio_aux1_mem_readb,
     .write =3D slavio_aux1_mem_writeb,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -277,7 +277,7 @@ static uint64_t slavio_aux2_mem_readb(void *opaque, hwa=
ddr addr,
 static const MemoryRegionOps slavio_aux2_mem_ops =3D {
     .read =3D slavio_aux2_mem_readb,
     .write =3D slavio_aux2_mem_writeb,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -305,7 +305,7 @@ static uint64_t apc_mem_readb(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps apc_mem_ops =3D {
     .read =3D apc_mem_readb,
     .write =3D apc_mem_writeb,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -350,7 +350,7 @@ static void slavio_sysctrl_mem_writel(void *opaque, hwa=
ddr addr,
 static const MemoryRegionOps slavio_sysctrl_mem_ops =3D {
     .read =3D slavio_sysctrl_mem_readl,
     .write =3D slavio_sysctrl_mem_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -392,7 +392,7 @@ static void slavio_led_mem_writew(void *opaque, hwaddr =
addr,
 static const MemoryRegionOps slavio_led_mem_ops =3D {
     .read =3D slavio_led_mem_readw,
     .write =3D slavio_led_mem_writew,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 2,
         .max_access_size =3D 2,
diff --git a/hw/misc/stm32f2xx_syscfg.c b/hw/misc/stm32f2xx_syscfg.c
index aa59b43..1efe7e2 100644
--- a/hw/misc/stm32f2xx_syscfg.c
+++ b/hw/misc/stm32f2xx_syscfg.c
@@ -126,7 +126,7 @@ static void stm32f2xx_syscfg_write(void *opaque, hwaddr=
 addr,
 static const MemoryRegionOps stm32f2xx_syscfg_ops =3D {
     .read =3D stm32f2xx_syscfg_read,
     .write =3D stm32f2xx_syscfg_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void stm32f2xx_syscfg_init(Object *obj)
diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index 45a3e31..2924fc2 100644
--- a/hw/misc/tz-mpc.c
+++ b/hw/misc/tz-mpc.c
@@ -332,7 +332,7 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwadd=
r addr,
 static const MemoryRegionOps tz_mpc_reg_ops =3D {
     .read_with_attrs =3D tz_mpc_reg_read,
     .write_with_attrs =3D tz_mpc_reg_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
@@ -408,7 +408,7 @@ static MemTxResult tz_mpc_mem_blocked_write(void *opaqu=
e, hwaddr addr,
 static const MemoryRegionOps tz_mpc_mem_blocked_ops =3D {
     .read_with_attrs =3D tz_mpc_mem_blocked_read,
     .write_with_attrs =3D tz_mpc_mem_blocked_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 8,
     .impl.min_access_size =3D 1,
diff --git a/hw/misc/tz-msc.c b/hw/misc/tz-msc.c
index 52b96ba..bf68480 100644
--- a/hw/misc/tz-msc.c
+++ b/hw/misc/tz-msc.c
@@ -206,7 +206,7 @@ static MemTxResult tz_msc_write(void *opaque, hwaddr ad=
dr, uint64_t val,
 static const MemoryRegionOps tz_msc_ops =3D {
     .read_with_attrs =3D tz_msc_read,
     .write_with_attrs =3D tz_msc_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void tz_msc_reset(DeviceState *dev)
diff --git a/hw/misc/tz-ppc.c b/hw/misc/tz-ppc.c
index 2a14a26..fd2bb07 100644
--- a/hw/misc/tz-ppc.c
+++ b/hw/misc/tz-ppc.c
@@ -179,7 +179,7 @@ static MemTxResult tz_ppc_write(void *opaque, hwaddr ad=
dr, uint64_t val,
 static const MemoryRegionOps tz_ppc_ops =3D {
     .read_with_attrs =3D tz_ppc_read,
     .write_with_attrs =3D tz_ppc_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static bool tz_ppc_dummy_accepts(void *opaque, hwaddr addr,
diff --git a/hw/misc/unimp.c b/hw/misc/unimp.c
index 7f8e42c..2991bce 100644
--- a/hw/misc/unimp.c
+++ b/hw/misc/unimp.c
@@ -47,7 +47,7 @@ static const MemoryRegionOps unimp_ops =3D {
     .impl.max_access_size =3D 8,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 8,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void unimp_realize(DeviceState *dev, Error **errp)
diff --git a/hw/misc/zynq-xadc.c b/hw/misc/zynq-xadc.c
index f1e4860..1fefac4 100644
--- a/hw/misc/zynq-xadc.c
+++ b/hw/misc/zynq-xadc.c
@@ -251,7 +251,7 @@ static void zynq_xadc_write(void *opaque, hwaddr offset=
, uint64_t val,
 static const MemoryRegionOps xadc_ops =3D {
     .read =3D zynq_xadc_read,
     .write =3D zynq_xadc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void zynq_xadc_init(Object *obj)
diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index 6b51ae5..75a01d0 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -415,7 +415,7 @@ static void zynq_slcr_write(void *opaque, hwaddr offset=
,
 static const MemoryRegionOps slcr_ops =3D {
     .read =3D zynq_slcr_read,
     .write =3D zynq_slcr_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void zynq_slcr_init(Object *obj)
diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index d771d39..be6888c 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -141,7 +141,7 @@ static void moxiesim_init(MachineState *machine)
     /* A single 16450 sits at offset 0x3f8.  */
     if (serial_hd(0)) {
         serial_mm_init(address_space_mem, 0x3f8, 0, env->irq[4],
-                       8000000/16, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+                       8000000 / 16, serial_hd(0), MO_LE);
     }
 }

diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
index 97e22e7..075334e 100644
--- a/hw/net/allwinner_emac.c
+++ b/hw/net/allwinner_emac.c
@@ -418,7 +418,7 @@ static void aw_emac_set_link(NetClientState *nc)
 static const MemoryRegionOps aw_emac_mem_ops =3D {
     .read =3D aw_emac_read,
     .write =3D aw_emac_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index d412085..fb00600 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1515,7 +1515,7 @@ static void gem_write(void *opaque, hwaddr offset, ui=
nt64_t val,
 static const MemoryRegionOps gem_ops =3D {
     .read =3D gem_read,
     .write =3D gem_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void gem_set_link(NetClientState *nc)
diff --git a/hw/net/can/can_kvaser_pci.c b/hw/net/can/can_kvaser_pci.c
index df639f8..8661c17 100644
--- a/hw/net/can/can_kvaser_pci.c
+++ b/hw/net/can/can_kvaser_pci.c
@@ -190,7 +190,7 @@ static void kvaser_pci_xilinx_io_write(void *opaque, hw=
addr addr, uint64_t data,
 static const MemoryRegionOps kvaser_pci_s5920_io_ops =3D {
     .read =3D kvaser_pci_s5920_io_read,
     .write =3D kvaser_pci_s5920_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -200,7 +200,7 @@ static const MemoryRegionOps kvaser_pci_s5920_io_ops =
=3D {
 static const MemoryRegionOps kvaser_pci_sja_io_ops =3D {
     .read =3D kvaser_pci_sja_io_read,
     .write =3D kvaser_pci_sja_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .max_access_size =3D 1,
     },
@@ -209,7 +209,7 @@ static const MemoryRegionOps kvaser_pci_sja_io_ops =3D =
{
 static const MemoryRegionOps kvaser_pci_xilinx_io_ops =3D {
     .read =3D kvaser_pci_xilinx_io_read,
     .write =3D kvaser_pci_xilinx_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .max_access_size =3D 1,
     },
diff --git a/hw/net/can/can_mioe3680_pci.c b/hw/net/can/can_mioe3680_pci.c
index 7af0993..013dae3 100644
--- a/hw/net/can/can_mioe3680_pci.c
+++ b/hw/net/can/can_mioe3680_pci.c
@@ -135,7 +135,7 @@ static void mioe3680_pci_sja2_io_write(void *opaque, hw=
addr addr, uint64_t data,
 static const MemoryRegionOps mioe3680_pci_sja1_io_ops =3D {
     .read =3D mioe3680_pci_sja1_io_read,
     .write =3D mioe3680_pci_sja1_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .max_access_size =3D 1,
     },
@@ -144,7 +144,7 @@ static const MemoryRegionOps mioe3680_pci_sja1_io_ops =
=3D {
 static const MemoryRegionOps mioe3680_pci_sja2_io_ops =3D {
     .read =3D mioe3680_pci_sja2_io_read,
     .write =3D mioe3680_pci_sja2_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .max_access_size =3D 1,
     },
diff --git a/hw/net/can/can_pcm3680_pci.c b/hw/net/can/can_pcm3680_pci.c
index 3f7312a..2207b5b 100644
--- a/hw/net/can/can_pcm3680_pci.c
+++ b/hw/net/can/can_pcm3680_pci.c
@@ -135,7 +135,7 @@ static void pcm3680i_pci_sja2_io_write(void *opaque, hw=
addr addr, uint64_t data,
 static const MemoryRegionOps pcm3680i_pci_sja1_io_ops =3D {
     .read =3D pcm3680i_pci_sja1_io_read,
     .write =3D pcm3680i_pci_sja1_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .max_access_size =3D 1,
     },
@@ -144,7 +144,7 @@ static const MemoryRegionOps pcm3680i_pci_sja1_io_ops =
=3D {
 static const MemoryRegionOps pcm3680i_pci_sja2_io_ops =3D {
     .read =3D pcm3680i_pci_sja2_io_read,
     .write =3D pcm3680i_pci_sja2_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .max_access_size =3D 1,
     },
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index bdb0b3b..b5c191c 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -651,7 +651,7 @@ static const MemoryRegionOps dp8393x_ops =3D {
     .write =3D dp8393x_write,
     .impl.min_access_size =3D 2,
     .impl.max_access_size =3D 2,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void dp8393x_watchdog(void *opaque)
diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index a023ceb..4605407 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1341,7 +1341,7 @@ e1000_mmio_read(void *opaque, hwaddr addr, unsigned s=
ize)
 static const MemoryRegionOps e1000_mmio_ops =3D {
     .read =3D e1000_mmio_read,
     .write =3D e1000_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1368,7 +1368,7 @@ static void e1000_io_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps e1000_io_ops =3D {
     .read =3D e1000_io_read,
     .write =3D e1000_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static bool is_version_1(void *opaque, int version_id)
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 581f7d0..abcd6d3 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -179,7 +179,7 @@ e1000e_io_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps mmio_ops =3D {
     .read =3D e1000e_mmio_read,
     .write =3D e1000e_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -189,7 +189,7 @@ static const MemoryRegionOps mmio_ops =3D {
 static const MemoryRegionOps io_ops =3D {
     .read =3D e1000e_io_read,
     .write =3D e1000e_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 6607c91..b0d3265 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -1601,7 +1601,7 @@ static void eepro100_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps eepro100_ops =3D {
     .read =3D eepro100_read,
     .write =3D eepro100_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static ssize_t nic_receive(NetClientState *nc, const uint8_t * buf, size_t=
 size)
diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index 4cfbf11..f748f5e 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -569,7 +569,7 @@ static void eth_set_link(NetClientState *nc)
 static const MemoryRegionOps eth_ops =3D {
     .read =3D eth_read,
     .write =3D eth_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index 2a8b99a..9e5f1cb 100644
--- a/hw/net/fsl_etsec/etsec.c
+++ b/hw/net/fsl_etsec/etsec.c
@@ -281,7 +281,7 @@ static void etsec_write(void     *opaque,
 static const MemoryRegionOps etsec_ops =3D {
     .read =3D etsec_read,
     .write =3D etsec_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index d2cded5..6d0d6a4 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -979,7 +979,7 @@ static const MemoryRegionOps ftgmac100_ops =3D {
     .write =3D ftgmac100_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void ftgmac100_cleanup(NetClientState *nc)
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 76d42c8..5d9d67b 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1278,7 +1278,7 @@ static const MemoryRegionOps imx_eth_ops =3D {
     .write                 =3D imx_eth_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness            =3D DEVICE_LITTLE_ENDIAN,
+    .endianness            =3D MO_LE,
 };

 static void imx_eth_cleanup(NetClientState *nc)
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index bb1bbb3..7e805b0 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1304,13 +1304,13 @@ static uint64_t lan9118_16bit_mode_read(void *opaqu=
e, hwaddr offset,
 static const MemoryRegionOps lan9118_mem_ops =3D {
     .read =3D lan9118_readl,
     .write =3D lan9118_writel,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps lan9118_16bit_mem_ops =3D {
     .read =3D lan9118_16bit_mode_read,
     .write =3D lan9118_16bit_mode_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static NetClientInfo net_lan9118_info =3D {
diff --git a/hw/net/lance.c b/hw/net/lance.c
index d95f170..943155b 100644
--- a/hw/net/lance.c
+++ b/hw/net/lance.c
@@ -74,7 +74,7 @@ static uint64_t lance_mem_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps lance_mem_ops =3D {
     .read =3D lance_mem_read,
     .write =3D lance_mem_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 2,
         .max_access_size =3D 2,
diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
index 78468fa..bf37375 100644
--- a/hw/net/mcf_fec.c
+++ b/hw/net/mcf_fec.c
@@ -624,7 +624,7 @@ static ssize_t mcf_fec_receive(NetClientState *nc, cons=
t uint8_t *buf, size_t si
 static const MemoryRegionOps mcf_fec_ops =3D {
     .read =3D mcf_fec_read,
     .write =3D mcf_fec_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static NetClientInfo net_mcf_fec_info =3D {
diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 41ef7a4..40aee51 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -431,7 +431,7 @@ static const MemoryRegionOps minimac2_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void milkymist_minimac2_reset(DeviceState *d)
diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 1cf4b57..8fe407b 100644
--- a/hw/net/ne2000.c
+++ b/hw/net/ne2000.c
@@ -686,7 +686,7 @@ static void ne2000_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps ne2000_ops =3D {
     .read =3D ne2000_read,
     .write =3D ne2000_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 /***********************************************************/
diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
index 600d09c..41bfa37 100644
--- a/hw/net/pcnet-pci.c
+++ b/hw/net/pcnet-pci.c
@@ -137,7 +137,7 @@ static void pcnet_ioport_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps pcnet_io_ops =3D {
     .read =3D pcnet_ioport_read,
     .write =3D pcnet_ioport_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription vmstate_pci_pcnet =3D {
@@ -160,7 +160,7 @@ static const MemoryRegionOps pcnet_mmio_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void pci_physical_memory_write(void *dma_opaque, hwaddr addr,
diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index bd54612..2fe64db 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -1196,7 +1196,7 @@ static uint64_t rocker_mmio_read(void *opaque, hwaddr=
 addr, unsigned size)
 static const MemoryRegionOps rocker_mmio_ops =3D {
     .read =3D rocker_mmio_read,
     .write =3D rocker_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 8,
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 0927317..f51bc7c 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -3311,7 +3311,7 @@ static const MemoryRegionOps rtl8139_io_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void rtl8139_timer(void *opaque)
diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 49e4bf5..5b81b9a 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -757,7 +757,7 @@ static const MemoryRegionOps smc91c111_mem_ops =3D {
     .write =3D smc91c111_writefn,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static NetClientInfo net_smc91c111_info =3D {
diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 15ec227..f9c5572 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -456,7 +456,7 @@ static void stellaris_enet_write(void *opaque, hwaddr o=
ffset,
 static const MemoryRegionOps stellaris_enet_ops =3D {
     .read =3D stellaris_enet_read,
     .write =3D stellaris_enet_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void stellaris_enet_reset(DeviceState *dev)
diff --git a/hw/net/sungem.c b/hw/net/sungem.c
index 89bcf74..549fd2d 100644
--- a/hw/net/sungem.c
+++ b/hw/net/sungem.c
@@ -924,7 +924,7 @@ static uint64_t sungem_mmio_greg_read(void *opaque, hwa=
ddr addr, unsigned size)
 static const MemoryRegionOps sungem_mmio_greg_ops =3D {
     .read =3D sungem_mmio_greg_read,
     .write =3D sungem_mmio_greg_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -993,7 +993,7 @@ static uint64_t sungem_mmio_txdma_read(void *opaque, hw=
addr addr, unsigned size)
 static const MemoryRegionOps sungem_mmio_txdma_ops =3D {
     .read =3D sungem_mmio_txdma_read,
     .write =3D sungem_mmio_txdma_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1066,7 +1066,7 @@ static uint64_t sungem_mmio_rxdma_read(void *opaque, =
hwaddr addr, unsigned size)
 static const MemoryRegionOps sungem_mmio_rxdma_ops =3D {
     .read =3D sungem_mmio_rxdma_read,
     .write =3D sungem_mmio_rxdma_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1163,7 +1163,7 @@ static uint64_t sungem_mmio_mac_read(void *opaque, hw=
addr addr, unsigned size)
 static const MemoryRegionOps sungem_mmio_mac_ops =3D {
     .read =3D sungem_mmio_mac_read,
     .write =3D sungem_mmio_mac_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1229,7 +1229,7 @@ static uint64_t sungem_mmio_mif_read(void *opaque, hw=
addr addr, unsigned size)
 static const MemoryRegionOps sungem_mmio_mif_ops =3D {
     .read =3D sungem_mmio_mif_read,
     .write =3D sungem_mmio_mif_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1284,7 +1284,7 @@ static uint64_t sungem_mmio_pcs_read(void *opaque, hw=
addr addr, unsigned size)
 static const MemoryRegionOps sungem_mmio_pcs_ops =3D {
     .read =3D sungem_mmio_pcs_read,
     .write =3D sungem_mmio_pcs_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index 8b8603e..2df010d 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -287,7 +287,7 @@ static uint64_t sunhme_seb_read(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps sunhme_seb_ops =3D {
     .read =3D sunhme_seb_read,
     .write =3D sunhme_seb_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -330,7 +330,7 @@ static uint64_t sunhme_etx_read(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps sunhme_etx_ops =3D {
     .read =3D sunhme_etx_read,
     .write =3D sunhme_etx_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -363,7 +363,7 @@ static uint64_t sunhme_erx_read(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps sunhme_erx_ops =3D {
     .read =3D sunhme_erx_read,
     .write =3D sunhme_erx_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -406,7 +406,7 @@ static uint64_t sunhme_mac_read(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps sunhme_mac_ops =3D {
     .read =3D sunhme_mac_read,
     .write =3D sunhme_mac_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -528,7 +528,7 @@ static uint64_t sunhme_mif_read(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps sunhme_mif_ops =3D {
     .read =3D sunhme_mif_read,
     .write =3D sunhme_mif_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 10d01d0..cc64b91 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -2159,7 +2159,7 @@ vmxnet3_msix_load(QEMUFile *f, void *opaque, int vers=
ion_id)
 static const MemoryRegionOps b0_ops =3D {
     .read =3D vmxnet3_io_bar0_read,
     .write =3D vmxnet3_io_bar0_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
             .min_access_size =3D 4,
             .max_access_size =3D 4,
@@ -2169,7 +2169,7 @@ static const MemoryRegionOps b0_ops =3D {
 static const MemoryRegionOps b1_ops =3D {
     .read =3D vmxnet3_io_bar1_read,
     .write =3D vmxnet3_io_bar1_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
             .min_access_size =3D 4,
             .max_access_size =3D 4,
diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
index f49df95..edcc4b2 100644
--- a/hw/net/xgmac.c
+++ b/hw/net/xgmac.c
@@ -309,7 +309,7 @@ static void enet_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps enet_mem_ops =3D {
     .read =3D enet_read,
     .write =3D enet_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static int eth_can_rx(XgmacState *s)
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index feeaca6..4df665f 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -661,7 +661,7 @@ static void enet_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps enet_ops =3D {
     .read =3D enet_read,
     .write =3D enet_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static int eth_can_rx(XilinxAXIEnet *s)
diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 8f3a8f8..e1fb6b8 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -167,7 +167,7 @@ eth_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps eth_ops =3D {
     .read =3D eth_read,
     .write =3D eth_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 2c3388f..112fe40 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -91,7 +91,7 @@ static void nios2_10m50_ghrd_init(MachineState *machine)

     /* Register: Altera 16550 UART */
     serial_mm_init(address_space_mem, 0xf8001600, 2, irq[1], 115200,
-                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   serial_hd(0), MO_TE);

     /* Register: Timer sys_clk_timer  */
     dev =3D qdev_create(NULL, "ALTR.timer");
diff --git a/hw/nvram/ds1225y.c b/hw/nvram/ds1225y.c
index fd49283..7afeffa 100644
--- a/hw/nvram/ds1225y.c
+++ b/hw/nvram/ds1225y.c
@@ -69,7 +69,7 @@ static const MemoryRegionOps nvram_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static int nvram_post_load(void *opaque, int version_id)
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index dcfd6d2..438e8d4 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -523,14 +523,14 @@ static bool fw_cfg_comb_valid(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps fw_cfg_ctl_mem_ops =3D {
     .read =3D fw_cfg_ctl_mem_read,
     .write =3D fw_cfg_ctl_mem_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid.accepts =3D fw_cfg_ctl_mem_valid,
 };

 static const MemoryRegionOps fw_cfg_data_mem_ops =3D {
     .read =3D fw_cfg_data_read,
     .write =3D fw_cfg_data_mem_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -541,14 +541,14 @@ static const MemoryRegionOps fw_cfg_data_mem_ops =3D =
{
 static const MemoryRegionOps fw_cfg_comb_mem_ops =3D {
     .read =3D fw_cfg_data_read,
     .write =3D fw_cfg_comb_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.accepts =3D fw_cfg_comb_valid,
 };

 static const MemoryRegionOps fw_cfg_dma_mem_ops =3D {
     .read =3D fw_cfg_dma_mem_read,
     .write =3D fw_cfg_dma_mem_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid.accepts =3D fw_cfg_dma_mem_valid,
     .valid.max_access_size =3D 8,
     .impl.max_access_size =3D 8,
diff --git a/hw/nvram/mac_nvram.c b/hw/nvram/mac_nvram.c
index a60426c..028d167 100644
--- a/hw/nvram/mac_nvram.c
+++ b/hw/nvram/mac_nvram.c
@@ -76,7 +76,7 @@ static const MemoryRegionOps macio_nvram_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 1,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static const VMStateDescription vmstate_macio_nvram =3D {
diff --git a/hw/nvram/nrf51_nvm.c b/hw/nvram/nrf51_nvm.c
index eca0cb3..557b1d1 100644
--- a/hw/nvram/nrf51_nvm.c
+++ b/hw/nvram/nrf51_nvm.c
@@ -96,7 +96,7 @@ static const MemoryRegionOps ficr_ops =3D {
     .write =3D ficr_write,
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN
+    .endianness =3D MO_LE
 };

 /*
@@ -189,7 +189,7 @@ static const MemoryRegionOps uicr_ops =3D {
     .write =3D uicr_write,
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN
+    .endianness =3D MO_LE
 };


@@ -268,7 +268,7 @@ static const MemoryRegionOps io_ops =3D {
         .write =3D io_write,
         .impl.min_access_size =3D 4,
         .impl.max_access_size =3D 4,
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
 };


@@ -301,7 +301,7 @@ static const MemoryRegionOps flash_ops =3D {
     .write =3D flash_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void nrf51_nvm_init(Object *obj)
diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index b85f0df..e0de12b 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -164,7 +164,7 @@ static void openrisc_sim_init(MachineState *machine)
     }

     serial_mm_init(get_system_memory(), 0x90000000, 0, serial_irq,
-                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   115200, serial_hd(0), MO_TE);

     openrisc_load_kernel(ram_size, kernel_filename);
 }
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index dde4437..1625118 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -311,7 +311,7 @@ static uint64_t bonito_readl(void *opaque, hwaddr addr,
 static const MemoryRegionOps bonito_ops =3D {
     .read =3D bonito_readl,
     .write =3D bonito_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -344,7 +344,7 @@ static uint64_t bonito_pciconf_readl(void *opaque, hwad=
dr addr,
 static const MemoryRegionOps bonito_pciconf_ops =3D {
     .read =3D bonito_pciconf_readl,
     .write =3D bonito_pciconf_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -381,7 +381,7 @@ static void bonito_ldma_writel(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps bonito_ldma_ops =3D {
     .read =3D bonito_ldma_readl,
     .write =3D bonito_ldma_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -418,7 +418,7 @@ static void bonito_cop_writel(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps bonito_cop_ops =3D {
     .read =3D bonito_cop_readl,
     .write =3D bonito_cop_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -524,7 +524,7 @@ static const MemoryRegionOps bonito_spciconf_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 #define BONITO_IRQ_BASE 32
diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 9ae8c0d..bf3ff13 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -75,7 +75,7 @@ static void designware_pcie_root_msi_write(void *opaque, =
hwaddr addr,

 static const MemoryRegionOps designware_pci_host_msi_ops =3D {
     .write =3D designware_pcie_root_msi_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -235,7 +235,7 @@ static void designware_pcie_root_data_write(void *opaqu=
e, hwaddr addr,
 static const MemoryRegionOps designware_pci_host_conf_ops =3D {
     .read =3D designware_pcie_root_data_read,
     .write =3D designware_pcie_root_data_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
@@ -620,7 +620,7 @@ static void designware_pcie_host_mmio_write(void *opaqu=
e, hwaddr addr,
 static const MemoryRegionOps designware_pci_mmio_ops =3D {
     .read       =3D designware_pcie_host_mmio_read,
     .write      =3D designware_pcie_host_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index d9c70f7..c817fa5 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -691,7 +691,7 @@ static uint64_t rcr_read(void *opaque, hwaddr addr, uns=
igned len)
 static const MemoryRegionOps rcr_ops =3D {
     .read =3D rcr_read,
     .write =3D rcr_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN
+    .endianness =3D MO_LE
 };

 static void piix3_realize(PCIDevice *dev, Error **errp)
diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
index 21eaa30..4c19008 100644
--- a/hw/pci-host/ppce500.c
+++ b/hw/pci-host/ppce500.c
@@ -338,7 +338,7 @@ static void pci_reg_write4(void *opaque, hwaddr addr,
 static const MemoryRegionOps e500_pci_reg_ops =3D {
     .read =3D pci_reg_read4,
     .write =3D pci_reg_write4,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static int mpc85xx_pci_map_irq(PCIDevice *pci_dev, int pin)
diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index c564f23..bf94693 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -108,7 +108,7 @@ static uint64_t raven_pci_io_read(void *opaque, hwaddr =
addr,
 static const MemoryRegionOps raven_pci_io_ops =3D {
     .read =3D raven_pci_io_read,
     .write =3D raven_pci_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t raven_intack_read(void *opaque, hwaddr addr,
@@ -186,7 +186,7 @@ static void raven_io_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps raven_io_ops =3D {
     .read =3D raven_io_read,
     .write =3D raven_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl.max_access_size =3D 4,
     .valid.unaligned =3D true,
 };
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index fd20f72..edab9aa 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -288,12 +288,12 @@ static void tseg_blackhole_write(void *opaque, hwaddr=
 addr, uint64_t val,
 static const MemoryRegionOps tseg_blackhole_ops =3D {
     .read =3D tseg_blackhole_read,
     .write =3D tseg_blackhole_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 /* PCIe MMCFG */
diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c
index 2cec111..de12397 100644
--- a/hw/pci-host/sabre.c
+++ b/hw/pci-host/sabre.c
@@ -247,7 +247,7 @@ static uint64_t sabre_config_read(void *opaque,
 static const MemoryRegionOps sabre_config_ops =3D {
     .read =3D sabre_config_read,
     .write =3D sabre_config_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void sabre_pci_config_write(void *opaque, hwaddr addr,
@@ -368,7 +368,7 @@ static void sabre_reset(DeviceState *d)
 static const MemoryRegionOps pci_config_ops =3D {
     .read =3D sabre_pci_config_read,
     .write =3D sabre_pci_config_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void sabre_realize(DeviceState *dev, Error **errp)
diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index 680fefd..0a51d2b 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -108,7 +108,7 @@ static uint64_t unin_data_read(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps unin_data_ops =3D {
     .read =3D unin_data_read,
     .write =3D unin_data_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void pci_unin_init_irqs(UNINHostState *s)
@@ -564,7 +564,7 @@ static uint64_t unin_read(void *opaque, hwaddr addr, un=
signed size)
 static const MemoryRegionOps unin_ops =3D {
     .read =3D unin_read,
     .write =3D unin_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void unin_init(Object *obj)
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index e7017f3..acc9982 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -240,7 +240,7 @@ static uint64_t pci_vpb_reg_read(void *opaque, hwaddr a=
ddr,
 static const MemoryRegionOps pci_vpb_reg_ops =3D {
     .read =3D pci_vpb_reg_read,
     .write =3D pci_vpb_reg_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -306,7 +306,7 @@ static uint64_t pci_vpb_config_read(void *opaque, hwadd=
r addr,
 static const MemoryRegionOps pci_vpb_config_ops =3D {
     .read =3D pci_vpb_config_read,
     .write =3D pci_vpb_config_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static int pci_vpb_map_irq(PCIDevice *d, int irq_num)
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index d39dcf3..e9acb1e 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -195,7 +195,7 @@ static void msix_table_mmio_write(void *opaque, hwaddr =
addr,
 static const MemoryRegionOps msix_table_mmio_ops =3D {
     .read =3D msix_table_mmio_read,
     .write =3D msix_table_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -223,7 +223,7 @@ static void msix_pba_mmio_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps msix_pba_mmio_ops =3D {
     .read =3D msix_pba_mmio_read,
     .write =3D msix_pba_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index c5f9244..fc1b837 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -190,25 +190,25 @@ static uint64_t pci_host_data_read(void *opaque,
 const MemoryRegionOps pci_host_conf_le_ops =3D {
     .read =3D pci_host_config_read,
     .write =3D pci_host_config_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 const MemoryRegionOps pci_host_conf_be_ops =3D {
     .read =3D pci_host_config_read,
     .write =3D pci_host_config_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 const MemoryRegionOps pci_host_data_le_ops =3D {
     .read =3D pci_host_data_read,
     .write =3D pci_host_data_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 const MemoryRegionOps pci_host_data_be_ops =3D {
     .read =3D pci_host_data_read,
     .write =3D pci_host_data_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static const TypeInfo pci_host_type_info =3D {
diff --git a/hw/pci/pcie_host.c b/hw/pci/pcie_host.c
index d6768b8..5e120dc 100644
--- a/hw/pci/pcie_host.c
+++ b/hw/pci/pcie_host.c
@@ -72,7 +72,7 @@ static uint64_t pcie_mmcfg_data_read(void *opaque,
 static const MemoryRegionOps pcie_mmcfg_ops =3D {
     .read =3D pcie_mmcfg_data_read,
     .write =3D pcie_mmcfg_data_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void pcie_host_init(Object *obj)
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 5a10c6e..6c56edb 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -477,7 +477,7 @@ static void shpc_mmio_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps shpc_mmio_ops =3D {
     .read =3D shpc_mmio_read,
     .write =3D shpc_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         /* SHPC ECN requires dword accesses, but the original 1.0 spec doe=
sn't.
          * It's easier to suppport all sizes than worry about it. */
diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c
index 8993b78..4d7002e 100644
--- a/hw/pcmcia/pxa2xx.c
+++ b/hw/pcmcia/pxa2xx.c
@@ -117,19 +117,19 @@ static void pxa2xx_pcmcia_io_write(void *opaque, hwad=
dr offset,
 static const MemoryRegionOps pxa2xx_pcmcia_common_ops =3D {
     .read =3D pxa2xx_pcmcia_common_read,
     .write =3D pxa2xx_pcmcia_common_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN
+    .endianness =3D MO_TE
 };

 static const MemoryRegionOps pxa2xx_pcmcia_attr_ops =3D {
     .read =3D pxa2xx_pcmcia_attr_read,
     .write =3D pxa2xx_pcmcia_attr_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN
+    .endianness =3D MO_TE
 };

 static const MemoryRegionOps pxa2xx_pcmcia_io_ops =3D {
     .read =3D pxa2xx_pcmcia_io_read,
     .write =3D pxa2xx_pcmcia_io_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN
+    .endianness =3D MO_TE
 };

 static void pxa2xx_pcmcia_set_irq(void *opaque, int line, int level)
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index a3eac7f..d1f3749 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -927,13 +927,13 @@ void ppce500_init(MachineState *machine)
     if (serial_hd(0)) {
         serial_mm_init(ccsr_addr_space, MPC8544_SERIAL0_REGS_OFFSET,
                        0, qdev_get_gpio_in(mpicdev, 42), 399193,
-                       serial_hd(0), DEVICE_BIG_ENDIAN);
+                       serial_hd(0), MO_BE);
     }

     if (serial_hd(1)) {
         serial_mm_init(ccsr_addr_space, MPC8544_SERIAL1_REGS_OFFSET,
                        0, qdev_get_gpio_in(mpicdev, 42), 399193,
-                       serial_hd(1), DEVICE_BIG_ENDIAN);
+                       serial_hd(1), MO_BE);
     }
         /* I2C */
     dev =3D qdev_create(NULL, "mpc-i2c");
diff --git a/hw/ppc/mpc8544_guts.c b/hw/ppc/mpc8544_guts.c
index 2b7cc14..758d4ae 100644
--- a/hw/ppc/mpc8544_guts.c
+++ b/hw/ppc/mpc8544_guts.c
@@ -111,7 +111,7 @@ static void mpc8544_guts_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps mpc8544_guts_ops =3D {
     .read =3D mpc8544_guts_read,
     .write =3D mpc8544_guts_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index c6411ec..ff06eef 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -98,7 +98,7 @@ static const MemoryRegionOps pnv_core_power8_xscom_ops =
=3D {
     .valid.max_access_size =3D 8,
     .impl.min_access_size =3D 8,
     .impl.max_access_size =3D 8,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };


@@ -156,7 +156,7 @@ static const MemoryRegionOps pnv_core_power9_xscom_ops =
=3D {
     .valid.max_access_size =3D 8,
     .impl.min_access_size =3D 8,
     .impl.max_access_size =3D 8,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void pnv_realize_vcpu(PowerPCCPU *cpu, PnvChip *chip, Error **errp)
@@ -377,7 +377,7 @@ static const MemoryRegionOps pnv_quad_xscom_ops =3D {
     .valid.max_access_size =3D 8,
     .impl.min_access_size =3D 8,
     .impl.max_access_size =3D 8,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void pnv_quad_realize(DeviceState *dev, Error **errp)
diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index a9f150c..503e5a5 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -336,7 +336,7 @@ static const MemoryRegionOps pnv_lpc_xscom_ops =3D {
     .valid.max_access_size =3D 8,
     .impl.min_access_size =3D 8,
     .impl.max_access_size =3D 8,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static uint64_t pnv_lpc_mmio_read(void *opaque, hwaddr addr, unsigned size=
)
@@ -404,7 +404,7 @@ static const MemoryRegionOps pnv_lpc_mmio_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void pnv_lpc_eval_irqs(PnvLpcController *lpc)
@@ -507,7 +507,7 @@ static void lpc_hc_write(void *opaque, hwaddr addr, uin=
t64_t val,
 static const MemoryRegionOps lpc_hc_ops =3D {
     .read =3D lpc_hc_read,
     .write =3D lpc_hc_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -586,7 +586,7 @@ static void opb_master_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps opb_master_ops =3D {
     .read =3D opb_master_read,
     .write =3D opb_master_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/ppc/pnv_occ.c b/hw/ppc/pnv_occ.c
index 636f91f..78a2a0b 100644
--- a/hw/ppc/pnv_occ.c
+++ b/hw/ppc/pnv_occ.c
@@ -91,7 +91,7 @@ static const MemoryRegionOps pnv_occ_power8_xscom_ops =3D=
 {
     .valid.max_access_size =3D 8,
     .impl.min_access_size =3D 8,
     .impl.max_access_size =3D 8,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void pnv_occ_power8_class_init(ObjectClass *klass, void *data)
@@ -162,7 +162,7 @@ static const MemoryRegionOps pnv_occ_power9_xscom_ops =
=3D {
     .valid.max_access_size =3D 8,
     .impl.min_access_size =3D 8,
     .impl.max_access_size =3D 8,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void pnv_occ_power9_class_init(ObjectClass *klass, void *data)
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index d7b6f5d..3e1946c 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -417,7 +417,7 @@ static void pnv_psi_mmio_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps psi_mmio_ops =3D {
     .read =3D pnv_psi_mmio_read,
     .write =3D pnv_psi_mmio_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
@@ -442,7 +442,7 @@ static void pnv_psi_xscom_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps pnv_psi_xscom_ops =3D {
     .read =3D pnv_psi_xscom_read,
     .write =3D pnv_psi_xscom_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
@@ -737,7 +737,7 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwaddr =
addr,
 static const MemoryRegionOps pnv_psi_p9_mmio_ops =3D {
     .read =3D pnv_psi_p9_mmio_read,
     .write =3D pnv_psi_p9_mmio_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
@@ -774,7 +774,7 @@ static void pnv_psi_p9_xscom_write(void *opaque, hwaddr=
 addr,
 static const MemoryRegionOps pnv_psi_p9_xscom_ops =3D {
     .read =3D pnv_psi_p9_xscom_read,
     .write =3D pnv_psi_p9_xscom_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index 2b81c75..7c93228 100644
--- a/hw/ppc/pnv_xscom.c
+++ b/hw/ppc/pnv_xscom.c
@@ -210,7 +210,7 @@ const MemoryRegionOps pnv_xscom_ops =3D {
     .valid.max_access_size =3D 8,
     .impl.min_access_size =3D 8,
     .impl.max_access_size =3D 8,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp)
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 13318a9..672c664 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -110,7 +110,7 @@ static const MemoryRegionOps ref405ep_fpga_ops =3D {
     .impl.max_access_size =3D 1,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void ref405ep_fpga_reset (void *opaque)
@@ -382,7 +382,7 @@ static const MemoryRegionOps taihu_cpld_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void taihu_cpld_reset (void *opaque)
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index edb6b2d..3e6c8fd 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -334,7 +334,7 @@ static const MemoryRegionOps opba_ops =3D {
     .impl.max_access_size =3D 1,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void ppc4xx_opba_reset (void *opaque)
@@ -723,7 +723,7 @@ static void ppc405_gpio_write(void *opaque, hwaddr addr=
, uint64_t value,
 static const MemoryRegionOps ppc405_gpio_ops =3D {
     .read =3D ppc405_gpio_read,
     .write =3D ppc405_gpio_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void ppc405_gpio_reset (void *opaque)
@@ -1105,7 +1105,7 @@ static const MemoryRegionOps gpt_ops =3D {
     .write =3D ppc4xx_gpt_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void ppc4xx_gpt_cb (void *opaque)
@@ -1482,12 +1482,12 @@ CPUPPCState *ppc405cr_init(MemoryRegion *address_sp=
ace_mem,
     if (serial_hd(0) !=3D NULL) {
         serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
-                       DEVICE_BIG_ENDIAN);
+                       MO_BE);
     }
     if (serial_hd(1) !=3D NULL) {
         serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
-                       DEVICE_BIG_ENDIAN);
+                       MO_BE);
     }
     /* IIC controller */
     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500, pic[2]);
@@ -1845,12 +1845,12 @@ CPUPPCState *ppc405ep_init(MemoryRegion *address_sp=
ace_mem,
     if (serial_hd(0) !=3D NULL) {
         serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
-                       DEVICE_BIG_ENDIAN);
+                       MO_BE);
     }
     if (serial_hd(1) !=3D NULL) {
         serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
-                       DEVICE_BIG_ENDIAN);
+                       MO_BE);
     }
     /* OCM */
     ppc405_ocm_init(env);
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index b4da099..c5904aa 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -234,12 +234,12 @@ static void bamboo_init(MachineState *machine)
     if (serial_hd(0) !=3D NULL) {
         serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
-                       DEVICE_BIG_ENDIAN);
+                       MO_BE);
     }
     if (serial_hd(1) !=3D NULL) {
         serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
-                       DEVICE_BIG_ENDIAN);
+                       MO_BE);
     }

     if (pcibus) {
diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index ca54631..a6e7280 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -393,7 +393,7 @@ static uint64_t ppc440_pcix_reg_read4(void *opaque, hwa=
ddr addr,
 static const MemoryRegionOps pci_reg_ops =3D {
     .read =3D ppc440_pcix_reg_read4,
     .write =3D ppc440_pcix_reg_write4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void ppc440_pcix_reset(DeviceState *dev)
@@ -464,7 +464,7 @@ static uint64_t pci_host_data_read(void *opaque,
 const MemoryRegionOps ppc440_pcix_host_data_ops =3D {
     .read =3D pci_host_data_read,
     .write =3D pci_host_data_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void ppc440_pcix_realize(DeviceState *dev, Error **errp)
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index e7cf8d5..ceca956 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -227,7 +227,7 @@ static uint64_t ppc4xx_pci_reg_read4(void *opaque, hwad=
dr offset,
 static const MemoryRegionOps pci_reg_ops =3D {
     .read =3D ppc4xx_pci_reg_read4,
     .write =3D ppc4xx_pci_reg_write4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void ppc4xx_pci_reset(void *opaque)
diff --git a/hw/ppc/ppce500_spin.c b/hw/ppc/ppce500_spin.c
index 0060fcb..d4fa92f 100644
--- a/hw/ppc/ppce500_spin.c
+++ b/hw/ppc/ppce500_spin.c
@@ -173,7 +173,7 @@ static uint64_t spin_read(void *opaque, hwaddr addr, un=
signed len)
 static const MemoryRegionOps spin_rw_ops =3D {
     .read =3D spin_read,
     .write =3D spin_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void ppce500_spin_initfn(Object *obj)
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index fbcddc5..b0a22ed 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -412,12 +412,12 @@ static void sam460ex_init(MachineState *machine)
     if (serial_hd(0) !=3D NULL) {
         serial_mm_init(address_space_mem, 0x4ef600300, 0, uic[1][1],
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
-                       DEVICE_BIG_ENDIAN);
+                       MO_BE);
     }
     if (serial_hd(1) !=3D NULL) {
         serial_mm_init(address_space_mem, 0x4ef600400, 0, uic[0][1],
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
-                       DEVICE_BIG_ENDIAN);
+                       MO_BE);
     }

     /* Load U-Boot image. */
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 9003fe9..16df70c 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -763,7 +763,7 @@ static const MemoryRegionOps spapr_msi_ops =3D {
     /* There is no .read as the read result is undefined by PCI spec */
     .read =3D NULL,
     .write =3D spapr_msi_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN
+    .endianness =3D MO_LE
 };

 /*
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 834053a..9f8a73c 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -242,7 +242,7 @@ static void virtex_init(MachineState *machine)
     }

     serial_mm_init(address_space_mem, UART16550_BASEADDR, 2, irq[UART16550=
_IRQ],
-                   115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+                   115200, serial_hd(0), MO_LE);

     /* 2 timers at irq 2 @ 62 Mhz.  */
     dev =3D qdev_create(NULL, "xlnx.xps-timer");
diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index adcf79c..fb09241 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -439,7 +439,7 @@ static void pvrdma_regs_write(void *opaque, hwaddr addr=
, uint64_t val,
 static const MemoryRegionOps regs_ops =3D {
     .read =3D pvrdma_regs_read,
     .write =3D pvrdma_regs_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D sizeof(uint32_t),
         .max_access_size =3D sizeof(uint32_t),
@@ -507,7 +507,7 @@ static void pvrdma_uar_write(void *opaque, hwaddr addr,=
 uint64_t val,
 static const MemoryRegionOps uar_ops =3D {
     .read =3D pvrdma_uar_read,
     .write =3D pvrdma_uar_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D sizeof(uint32_t),
         .max_access_size =3D sizeof(uint32_t),
diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
index 591d70d..7ab6d79 100644
--- a/hw/riscv/sifive_clint.c
+++ b/hw/riscv/sifive_clint.c
@@ -176,7 +176,7 @@ static void sifive_clint_write(void *opaque, hwaddr add=
r, uint64_t value,
 static const MemoryRegionOps sifive_clint_ops =3D {
     .read =3D sifive_clint_read,
     .write =3D sifive_clint_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/riscv/sifive_gpio.c b/hw/riscv/sifive_gpio.c
index 06bd811..61c7103 100644
--- a/hw/riscv/sifive_gpio.c
+++ b/hw/riscv/sifive_gpio.c
@@ -272,7 +272,7 @@ static void sifive_gpio_write(void *opaque, hwaddr offs=
et,
 static const MemoryRegionOps gpio_ops =3D {
     .read =3D  sifive_gpio_read,
     .write =3D sifive_gpio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
 };
diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index 0950e89..5f156e8 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -354,7 +354,7 @@ err:
 static const MemoryRegionOps sifive_plic_ops =3D {
     .read =3D sifive_plic_read,
     .write =3D sifive_plic_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c
index f406682..6dc1461 100644
--- a/hw/riscv/sifive_prci.c
+++ b/hw/riscv/sifive_prci.c
@@ -73,7 +73,7 @@ static void sifive_prci_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps sifive_prci_ops =3D {
     .read =3D sifive_prci_read,
     .write =3D sifive_prci_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
index 24a04d7..a7a8e73 100644
--- a/hw/riscv/sifive_test.c
+++ b/hw/riscv/sifive_test.c
@@ -51,7 +51,7 @@ static void sifive_test_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps sifive_test_ops =3D {
     .read =3D sifive_test_read,
     .write =3D sifive_test_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
index 3b3f94f..fa1ba98 100644
--- a/hw/riscv/sifive_uart.c
+++ b/hw/riscv/sifive_uart.c
@@ -132,7 +132,7 @@ uart_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps uart_ops =3D {
     .read =3D uart_read,
     .write =3D uart_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 25faf3b..3283954 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -502,7 +502,7 @@ static void riscv_virt_board_init(MachineState *machine=
)

     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(s->plic), UART0_IRQ), 399193,
-        serial_hd(0), DEVICE_LITTLE_ENDIAN);
+        serial_hd(0), MO_LE);

     g_free(plic_hart_config);
 }
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 2c6e084..451c279 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -689,7 +689,7 @@ static uint64_t s390_msi_ctrl_read(void *opaque, hwaddr=
 addr, unsigned size)
 static const MemoryRegionOps s390_msi_ctrl_ops =3D {
     .write =3D s390_msi_ctrl_write,
     .read =3D s390_msi_ctrl_read,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 void s390_pci_iommu_enable(S390PCIIOMMU *iommu)
diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 342f500..e7804a8 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -291,7 +291,7 @@ static void esp_pci_dma_memory_write(void *opaque, uint=
8_t *buf, int len)
 static const MemoryRegionOps esp_pci_io_ops =3D {
     .read =3D esp_pci_io_read,
     .write =3D esp_pci_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 7508d03..fec501c 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -635,7 +635,7 @@ static uint64_t sysbus_esp_mem_read(void *opaque, hwadd=
r addr,
 static const MemoryRegionOps sysbus_esp_mem_ops =3D {
     .read =3D sysbus_esp_mem_read,
     .write =3D sysbus_esp_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid.accepts =3D esp_mem_accepts,
 };

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 10468c1..7e17555 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -2091,7 +2091,7 @@ static uint64_t lsi_mmio_read(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps lsi_mmio_ops =3D {
     .read =3D lsi_mmio_read,
     .write =3D lsi_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -2115,7 +2115,7 @@ static uint64_t lsi_ram_read(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps lsi_ram_ops =3D {
     .read =3D lsi_ram_read,
     .write =3D lsi_ram_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t lsi_io_read(void *opaque, hwaddr addr,
@@ -2135,7 +2135,7 @@ static void lsi_io_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps lsi_io_ops =3D {
     .read =3D lsi_io_read,
     .write =3D lsi_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 0c43999..f06b7c6 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -2153,7 +2153,7 @@ static void megasas_mmio_write(void *opaque, hwaddr a=
ddr,
 static const MemoryRegionOps megasas_mmio_ops =3D {
     .read =3D megasas_mmio_read,
     .write =3D megasas_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
@@ -2175,7 +2175,7 @@ static void megasas_port_write(void *opaque, hwaddr a=
ddr,
 static const MemoryRegionOps megasas_port_ops =3D {
     .read =3D megasas_port_read,
     .write =3D megasas_port_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -2197,7 +2197,7 @@ static void megasas_queue_write(void *opaque, hwaddr =
addr,
 static const MemoryRegionOps megasas_queue_ops =3D {
     .read =3D megasas_queue_read,
     .write =3D megasas_queue_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 8,
         .max_access_size =3D 8,
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 3f94d5a..c3d8144 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -1085,7 +1085,7 @@ static void mptsas_mmio_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps mptsas_mmio_ops =3D {
     .read =3D mptsas_mmio_read,
     .write =3D mptsas_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1095,7 +1095,7 @@ static const MemoryRegionOps mptsas_mmio_ops =3D {
 static const MemoryRegionOps mptsas_port_ops =3D {
     .read =3D mptsas_mmio_read,
     .write =3D mptsas_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -1120,7 +1120,7 @@ static void mptsas_diag_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps mptsas_diag_ops =3D {
     .read =3D mptsas_diag_read,
     .write =3D mptsas_diag_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 14641df..9600846 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -1086,7 +1086,7 @@ pvscsi_cleanup_msi(PVSCSIState *s)
 static const MemoryRegionOps pvscsi_ops =3D {
         .read =3D pvscsi_io_read,
         .write =3D pvscsi_io_write,
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
         .impl =3D {
                 .min_access_size =3D 4,
                 .max_access_size =3D 4,
diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
index 2778fb0..f799c37 100644
--- a/hw/sd/bcm2835_sdhost.c
+++ b/hw/sd/bcm2835_sdhost.c
@@ -370,7 +370,7 @@ static void bcm2835_sdhost_write(void *opaque, hwaddr o=
ffset,
 static const MemoryRegionOps bcm2835_sdhost_ops =3D {
     .read =3D bcm2835_sdhost_read,
     .write =3D bcm2835_sdhost_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static const VMStateDescription vmstate_bcm2835_sdhost =3D {
diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index b8d2347..52e3037 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -236,7 +236,7 @@ static const MemoryRegionOps memcard_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void milkymist_memcard_reset(DeviceState *d)
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index d0c98ca..9a9626d 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -570,7 +570,7 @@ static void omap_mmc_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps omap_mmc_ops =3D {
     .read =3D omap_mmc_read,
     .write =3D omap_mmc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void omap_mmc_cover_cb(void *opaque, int line, int level)
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index f2027aa..2ee759a 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -449,7 +449,7 @@ static void pl181_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl181_ops =3D {
     .read =3D pl181_read,
     .write =3D pl181_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void pl181_reset(DeviceState *d)
diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 81ff5ce..c9ffeb9 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -472,7 +472,7 @@ static void pxa2xx_mmci_write(void *opaque,
 static const MemoryRegionOps pxa2xx_mmci_ops =3D {
     .read =3D pxa2xx_mmci_read,
     .write =3D pxa2xx_mmci_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 7b80b1d..664dcf3 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1286,7 +1286,7 @@ static const MemoryRegionOps sdhci_mmio_ops =3D {
         .max_access_size =3D 4,
         .unaligned =3D false
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
@@ -1741,7 +1741,7 @@ static const MemoryRegionOps usdhc_mmio_ops =3D {
         .max_access_size =3D 4,
         .unaligned =3D false
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void imx_usdhc_init(Object *obj)
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index f22c79c..1e7d693 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -176,7 +176,7 @@ static const MemoryRegionOps r2d_fpga_ops =3D {
     .write =3D r2d_fpga_write,
     .impl.min_access_size =3D 2,
     .impl.max_access_size =3D 2,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static qemu_irq *r2d_fpga_init(MemoryRegion *sysmem,
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index 2fb6e61..20f5816 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -487,7 +487,7 @@ static const MemoryRegionOps sh7750_mem_ops =3D {
     .write =3D sh7750_mem_writefn,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 /* sh775x interrupt controller tables for sh_intc.c
@@ -748,7 +748,7 @@ static void sh7750_mmct_write(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps sh7750_mmct_ops =3D {
     .read =3D sh7750_mmct_read,
     .write =3D sh7750_mmct_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
index b15f264..4006210 100644
--- a/hw/sh4/sh_pci.c
+++ b/hw/sh4/sh_pci.c
@@ -103,7 +103,7 @@ static uint64_t sh_pci_reg_read (void *p, hwaddr addr,
 static const MemoryRegionOps sh_pci_reg_ops =3D {
     .read =3D sh_pci_reg_read,
     .write =3D sh_pci_reg_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/sparc/sun4m_iommu.c b/hw/sparc/sun4m_iommu.c
index 45a61ec..61a7493 100644
--- a/hw/sparc/sun4m_iommu.c
+++ b/hw/sparc/sun4m_iommu.c
@@ -235,7 +235,7 @@ static void iommu_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps iommu_mem_ops =3D {
     .read =3D iommu_mem_read,
     .write =3D iommu_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index dc0ce7e..dc5bb11 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -158,7 +158,7 @@ static void niagara_init(MachineState *machine)
     }
     if (serial_hd(0)) {
         serial_mm_init(sysmem, NIAGARA_UART_BASE, 0, NULL, 115200,
-                       serial_hd(0), DEVICE_BIG_ENDIAN);
+                       serial_hd(0), MO_BE);
     }
     create_unimplemented_device("sun4v-iob", NIAGARA_IOBBASE, NIAGARA_IOBS=
IZE);
     sun4v_rtc_init(NIAGARA_RTC_BASE);
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 5d87be8..9016271 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -249,7 +249,7 @@ static void power_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps power_mem_ops =3D {
     .read =3D power_mem_read,
     .write =3D power_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -320,7 +320,7 @@ static void ebus_realize(PCIDevice *pci_dev, Error **er=
rp)
     i =3D 0;
     if (s->console_serial_base) {
         serial_mm_init(pci_address_space(pci_dev), s->console_serial_base,
-                       0, NULL, 115200, serial_hd(i), DEVICE_BIG_ENDIAN);
+                       0, NULL, 115200, serial_hd(i), MO_BE);
         i++;
     }
     serial_hds_isa_init(s->isa_bus, i, MAX_ISA_SERIAL_PORTS);
diff --git a/hw/sparc64/sun4u_iommu.c b/hw/sparc64/sun4u_iommu.c
index 9178277..5073098 100644
--- a/hw/sparc64/sun4u_iommu.c
+++ b/hw/sparc64/sun4u_iommu.c
@@ -280,7 +280,7 @@ static uint64_t iommu_mem_read(void *opaque, hwaddr add=
r, unsigned size)
 static const MemoryRegionOps iommu_mem_ops =3D {
     .read =3D iommu_mem_read,
     .write =3D iommu_mem_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void iommu_reset(DeviceState *d)
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 81f2fb7..fc33c80 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -399,7 +399,7 @@ static void aspeed_smc_flash_default_write(void *opaque=
, hwaddr addr,
 static const MemoryRegionOps aspeed_smc_flash_default_ops =3D {
     .read =3D aspeed_smc_flash_default_read,
     .write =3D aspeed_smc_flash_default_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
@@ -707,7 +707,7 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr=
 addr, uint64_t data,
 static const MemoryRegionOps aspeed_smc_flash_ops =3D {
     .read =3D aspeed_smc_flash_read,
     .write =3D aspeed_smc_flash_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
@@ -818,7 +818,7 @@ static void aspeed_smc_write(void *opaque, hwaddr addr,=
 uint64_t data,
 static const MemoryRegionOps aspeed_smc_ops =3D {
     .read =3D aspeed_smc_read,
     .write =3D aspeed_smc_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.unaligned =3D true,
 };

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 5cec9b5..9b4ec27 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -397,7 +397,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, =
uint64_t value,
 static const struct MemoryRegionOps imx_spi_ops =3D {
     .read =3D imx_spi_read,
     .write =3D imx_spi_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
index 71fd138..1d56199 100644
--- a/hw/ssi/mss-spi.c
+++ b/hw/ssi/mss-spi.c
@@ -359,7 +359,7 @@ static void spi_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps spi_ops =3D {
     .read =3D spi_read,
     .write =3D spi_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4
diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
index f278a55..749c2ea 100644
--- a/hw/ssi/omap_spi.c
+++ b/hw/ssi/omap_spi.c
@@ -342,7 +342,7 @@ static void omap_mcspi_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps omap_mcspi_ops =3D {
     .read =3D omap_mcspi_read,
     .write =3D omap_mcspi_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 struct omap_mcspi_s *omap_mcspi_init(struct omap_target_agent_s *ta, int c=
hnum,
diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
index 10d1995..4c7e312 100644
--- a/hw/ssi/pl022.c
+++ b/hw/ssi/pl022.c
@@ -226,7 +226,7 @@ static void pl022_reset(DeviceState *dev)
 static const MemoryRegionOps pl022_ops =3D {
     .read =3D pl022_read,
     .write =3D pl022_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static int pl022_post_load(void *opaque, int version_id)
diff --git a/hw/ssi/stm32f2xx_spi.c b/hw/ssi/stm32f2xx_spi.c
index e1e5ab5..f1ae1cf 100644
--- a/hw/ssi/stm32f2xx_spi.c
+++ b/hw/ssi/stm32f2xx_spi.c
@@ -166,7 +166,7 @@ static void stm32f2xx_spi_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps stm32f2xx_spi_ops =3D {
     .read =3D stm32f2xx_spi_read,
     .write =3D stm32f2xx_spi_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription vmstate_stm32f2xx_spi =3D {
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index 1379cb1..f21c5e0 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -313,7 +313,7 @@ done:
 static const MemoryRegionOps spi_ops =3D {
     .read =3D spi_read,
     .write =3D spi_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8cadc4e..ed5ea17 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1029,7 +1029,7 @@ no_reg_update:
 static const MemoryRegionOps spips_ops =3D {
     .read =3D xilinx_spips_read,
     .write =3D xilinx_spips_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void xilinx_qspips_invalidate_mmio_ptr(XilinxQSPIPS *q)
@@ -1120,13 +1120,13 @@ static void xlnx_zynqmp_qspips_write(void *opaque, =
hwaddr addr,
 static const MemoryRegionOps qspips_ops =3D {
     .read =3D xilinx_spips_read,
     .write =3D xilinx_qspips_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps xlnx_zynqmp_qspips_ops =3D {
     .read =3D xlnx_zynqmp_qspips_read,
     .write =3D xlnx_zynqmp_qspips_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 #define LQSPI_CACHE_SIZE 1024
@@ -1238,7 +1238,7 @@ static MemTxResult lqspi_write(void *opaque, hwaddr o=
ffset, uint64_t value,
 static const MemoryRegionOps lqspi_ops =3D {
     .read_with_attrs =3D lqspi_read,
     .write_with_attrs =3D lqspi_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 8bb5f6e..032e2fd 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -254,7 +254,7 @@ static const MemoryRegionOps a9_gtimer_this_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps a9_gtimer_ops =3D {
@@ -264,7 +264,7 @@ static const MemoryRegionOps a9_gtimer_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void a9_gtimer_reset(DeviceState *dev)
diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
index 763e109..6bc32d1 100644
--- a/hw/timer/allwinner-a10-pit.c
+++ b/hw/timer/allwinner-a10-pit.c
@@ -178,7 +178,7 @@ static void a10_pit_write(void *opaque, hwaddr offset, =
uint64_t value,
 static const MemoryRegionOps a10_pit_ops =3D {
     .read =3D a10_pit_read,
     .write =3D a10_pit_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static Property a10_pit_properties[] =3D {
diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c
index 5c1d9e4..74771af 100644
--- a/hw/timer/altera_timer.c
+++ b/hw/timer/altera_timer.c
@@ -145,7 +145,7 @@ static void timer_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps timer_ops =3D {
     .read =3D timer_read,
     .write =3D timer_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4
diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index 9397218..85f7938 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -190,7 +190,7 @@ static const MemoryRegionOps arm_thistimer_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps timerblock_ops =3D {
@@ -200,7 +200,7 @@ static const MemoryRegionOps timerblock_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void timerblock_reset(TimerBlock *tb)
diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 22ce3ff..1d44041 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -265,7 +265,7 @@ static void sp804_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps sp804_ops =3D {
     .read =3D sp804_read,
     .write =3D sp804_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription vmstate_sp804 =3D {
@@ -346,7 +346,7 @@ static void icp_pit_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps icp_pit_ops =3D {
     .read =3D icp_pit_read,
     .write =3D icp_pit_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void icp_pit_init(Object *obj)
diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 3c34fd0..63cf8b9 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -191,7 +191,7 @@ static MemTxResult systick_write(void *opaque, hwaddr a=
ddr,
 static const MemoryRegionOps systick_ops =3D {
     .read_with_attrs =3D systick_read,
     .write_with_attrs =3D systick_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/timer/aspeed_rtc.c b/hw/timer/aspeed_rtc.c
index c528e47..33098bf 100644
--- a/hw/timer/aspeed_rtc.c
+++ b/hw/timer/aspeed_rtc.c
@@ -130,7 +130,7 @@ static void aspeed_rtc_reset(DeviceState *d)
 static const MemoryRegionOps aspeed_rtc_ops =3D {
     .read =3D aspeed_rtc_read,
     .write =3D aspeed_rtc_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription vmstate_aspeed_rtc =3D {
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 29cc5e8..1aca23d 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -448,7 +448,7 @@ static void aspeed_timer_write(void *opaque, hwaddr off=
set, uint64_t value,
 static const MemoryRegionOps aspeed_timer_ops =3D {
     .read =3D aspeed_timer_read,
     .write =3D aspeed_timer_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
     .valid.unaligned =3D false,
diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
index d422efe..795e834 100644
--- a/hw/timer/cadence_ttc.c
+++ b/hw/timer/cadence_ttc.c
@@ -389,7 +389,7 @@ static void cadence_ttc_write(void *opaque, hwaddr offs=
et,
 static const MemoryRegionOps cadence_ttc_ops =3D {
     .read =3D cadence_ttc_read,
     .write =3D cadence_ttc_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void cadence_timer_reset(CadenceTimerState *s)
diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.=
c
index 383f6e1..f8c4e83 100644
--- a/hw/timer/cmsdk-apb-dualtimer.c
+++ b/hw/timer/cmsdk-apb-dualtimer.c
@@ -373,7 +373,7 @@ static void cmsdk_apb_dualtimer_write(void *opaque, hwa=
ddr offset,
 static const MemoryRegionOps cmsdk_apb_dualtimer_ops =3D {
     .read =3D cmsdk_apb_dualtimer_read,
     .write =3D cmsdk_apb_dualtimer_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     /* byte/halfword accesses are just zero-padded on reads and writes */
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index 2e7318b..b9c1677 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -169,7 +169,7 @@ static void cmsdk_apb_timer_write(void *opaque, hwaddr =
offset, uint64_t value,
 static const MemoryRegionOps cmsdk_apb_timer_ops =3D {
     .read =3D cmsdk_apb_timer_read,
     .write =3D cmsdk_apb_timer_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void cmsdk_apb_timer_tick(void *opaque)
diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c
index c818ed1..4c387f2 100644
--- a/hw/timer/digic-timer.c
+++ b/hw/timer/digic-timer.c
@@ -121,7 +121,7 @@ static const MemoryRegionOps digic_timer_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void digic_timer_init(Object *obj)
diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 53834e1..56324fc 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -297,7 +297,7 @@ timer_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps timer_ops =3D {
     .read =3D timer_read,
     .write =3D timer_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 874c7b8..0fc67e5 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1412,7 +1412,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr=
 offset,
 static const MemoryRegionOps exynos4210_mct_ops =3D {
     .read =3D exynos4210_mct_read,
     .write =3D exynos4210_mct_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 /* MCT init */
diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index 9bc0327..5df719a 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -375,7 +375,7 @@ static void exynos4210_pwm_reset(DeviceState *d)
 static const MemoryRegionOps exynos4210_pwm_ops =3D {
     .read =3D exynos4210_pwm_read,
     .write =3D exynos4210_pwm_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 /*
diff --git a/hw/timer/exynos4210_rtc.c b/hw/timer/exynos4210_rtc.c
index 0ecedf7..f62277c 100644
--- a/hw/timer/exynos4210_rtc.c
+++ b/hw/timer/exynos4210_rtc.c
@@ -544,7 +544,7 @@ static void exynos4210_rtc_reset(DeviceState *d)
 static const MemoryRegionOps exynos4210_rtc_ops =3D {
     .read =3D exynos4210_rtc_read,
     .write =3D exynos4210_rtc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 /*
diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index dc3b028..0c32f64 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -313,7 +313,7 @@ static void grlib_gptimer_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps grlib_gptimer_ops =3D {
     .read =3D grlib_gptimer_read,
     .write =3D grlib_gptimer_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 8268b24..a1299ec 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -675,7 +675,7 @@ static const MemoryRegionOps hpet_ram_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void hpet_reset(DeviceState *d)
diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
index 0972c47..4f19817 100644
--- a/hw/timer/i8254.c
+++ b/hw/timer/i8254.c
@@ -315,7 +315,7 @@ static const MemoryRegionOps pit_ioport_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void pit_post_load(PITCommonState *s)
diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index a87dc06..eedfe44 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -282,7 +282,7 @@ static void imx_epit_cmp(void *opaque)
 static const MemoryRegionOps imx_epit_ops =3D {
     .read =3D imx_epit_read,
     .write =3D imx_epit_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription vmstate_imx_timer_epit =3D {
diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 4eca249..b98138e 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -474,7 +474,7 @@ static void imx_gpt_timeout(void *opaque)
 static const MemoryRegionOps imx_gpt_ops =3D {
     .read =3D imx_gpt_read,
     .write =3D imx_gpt_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };


diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c
index 88d2ee0..afa4e7e 100644
--- a/hw/timer/lm32_timer.c
+++ b/hw/timer/lm32_timer.c
@@ -144,7 +144,7 @@ static void timer_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps timer_ops =3D {
     .read =3D timer_read,
     .write =3D timer_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/timer/m48t59.c b/hw/timer/m48t59.c
index 030c887..8bfbc36 100644
--- a/hw/timer/m48t59.c
+++ b/hw/timer/m48t59.c
@@ -518,7 +518,7 @@ static const MemoryRegionOps nvram_ops =3D {
     .impl.max_access_size =3D 1,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static const VMStateDescription vmstate_m48t59 =3D {
@@ -559,7 +559,7 @@ const MemoryRegionOps m48t59_io_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 /* Initialisation routine */
diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
index ce4550b..8ccd950 100644
--- a/hw/timer/mc146818rtc.c
+++ b/hw/timer/mc146818rtc.c
@@ -930,7 +930,7 @@ static const MemoryRegionOps cmos_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void rtc_get_date(Object *obj, struct tm *current_tm, Error **errp)
diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
index c1d715f..a184cfe 100644
--- a/hw/timer/milkymist-sysctl.c
+++ b/hw/timer/milkymist-sysctl.c
@@ -220,7 +220,7 @@ static const MemoryRegionOps sysctl_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 static void timer0_hit(void *opaque)
diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
index 26a51f1..ebf2434 100644
--- a/hw/timer/mss-timer.c
+++ b/hw/timer/mss-timer.c
@@ -197,7 +197,7 @@ timer_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps timer_ops =3D {
     .read =3D timer_read,
     .write =3D timer_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4
diff --git a/hw/timer/nrf51_timer.c b/hw/timer/nrf51_timer.c
index 29fb81a..26204fa 100644
--- a/hw/timer/nrf51_timer.c
+++ b/hw/timer/nrf51_timer.c
@@ -300,7 +300,7 @@ static void nrf51_timer_write(void *opaque, hwaddr offs=
et,
 static const MemoryRegionOps rng_ops =3D {
     .read =3D  nrf51_timer_read,
     .write =3D nrf51_timer_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
 };
diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c
index ae2dc99..c745eab 100644
--- a/hw/timer/omap_gptimer.c
+++ b/hw/timer/omap_gptimer.c
@@ -488,7 +488,7 @@ static const MemoryRegionOps omap_gp_timer_ops =3D {
     .write =3D omap_gp_timer_writefn,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 struct omap_gp_timer_s *omap_gp_timer_init(struct omap_target_agent_s *ta,
diff --git a/hw/timer/omap_synctimer.c b/hw/timer/omap_synctimer.c
index 0d75a90..f98a20a 100644
--- a/hw/timer/omap_synctimer.c
+++ b/hw/timer/omap_synctimer.c
@@ -94,7 +94,7 @@ static const MemoryRegionOps omap_synctimer_ops =3D {
     .write =3D omap_synctimer_writefn,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 struct omap_synctimer_s *omap_synctimer_init(struct omap_target_agent_s *t=
a,
diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
index 62b0fab..6cbee0c 100644
--- a/hw/timer/pl031.c
+++ b/hw/timer/pl031.c
@@ -175,7 +175,7 @@ static void pl031_write(void * opaque, hwaddr offset,
 static const MemoryRegionOps pl031_ops =3D {
     .read =3D pl031_read,
     .write =3D pl031_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void pl031_init(Object *obj)
diff --git a/hw/timer/puv3_ost.c b/hw/timer/puv3_ost.c
index 4a8ae37..97195b3 100644
--- a/hw/timer/puv3_ost.c
+++ b/hw/timer/puv3_ost.c
@@ -98,7 +98,7 @@ static const MemoryRegionOps puv3_ost_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void puv3_ost_tick(void *opaque)
diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index 8c1ef43..0d2afac 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -399,7 +399,7 @@ static void pxa2xx_timer_write(void *opaque, hwaddr off=
set,
 static const MemoryRegionOps pxa2xx_timer_ops =3D {
     .read =3D pxa2xx_timer_read,
     .write =3D pxa2xx_timer_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void pxa2xx_timer_tick(void *opaque)
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 91b18ba..e6804f3 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -302,7 +302,7 @@ static void tmu012_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps tmu012_ops =3D {
     .read =3D tmu012_read,
     .write =3D tmu012_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 void tmu012_init(MemoryRegion *sysmem, hwaddr base,
diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index 005fd59..27bba42 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -319,7 +319,7 @@ static void slavio_timer_mem_writel(void *opaque, hwadd=
r addr,
 static const MemoryRegionOps slavio_timer_mem_ops =3D {
     .read =3D slavio_timer_mem_readl,
     .write =3D slavio_timer_mem_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
index ecfcdad..6a1ebe3 100644
--- a/hw/timer/stm32f2xx_timer.c
+++ b/hw/timer/stm32f2xx_timer.c
@@ -265,7 +265,7 @@ static void stm32f2xx_timer_write(void *opaque, hwaddr =
offset,
 static const MemoryRegionOps stm32f2xx_timer_ops =3D {
     .read =3D stm32f2xx_timer_read,
     .write =3D stm32f2xx_timer_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription vmstate_stm32f2xx_timer =3D {
diff --git a/hw/timer/sun4v-rtc.c b/hw/timer/sun4v-rtc.c
index 6b7ca75..4c3a236 100644
--- a/hw/timer/sun4v-rtc.c
+++ b/hw/timer/sun4v-rtc.c
@@ -48,7 +48,7 @@ static void sun4v_rtc_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps sun4v_rtc_ops =3D {
     .read =3D sun4v_rtc_read,
     .write =3D sun4v_rtc_write,
-    .endianness =3D DEVICE_BIG_ENDIAN,
+    .endianness =3D MO_BE,
 };

 void sun4v_rtc_init(hwaddr addr)
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 16bcd03..ab4c543 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -187,7 +187,7 @@ timer_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps timer_ops =3D {
     .read =3D timer_read,
     .write =3D timer_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/timer/xlnx-zynqmp-rtc.c b/hw/timer/xlnx-zynqmp-rtc.c
index 36daf0c..ebfc53a 100644
--- a/hw/timer/xlnx-zynqmp-rtc.c
+++ b/hw/timer/xlnx-zynqmp-rtc.c
@@ -173,7 +173,7 @@ static void rtc_reset(DeviceState *dev)
 static const MemoryRegionOps rtc_ops =3D {
     .read =3D register_read_memory,
     .write =3D register_write_memory,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index db0e3e7..c73873a 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -180,7 +180,7 @@ static void tpm_crb_mmio_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps tpm_crb_memory_ops =3D {
     .read =3D tpm_crb_mmio_read,
     .write =3D tpm_crb_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index d6b3212..7984f82 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -846,7 +846,7 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr add=
r,
 static const MemoryRegionOps tpm_tis_memory_ops =3D {
     .read =3D tpm_tis_mmio_read,
     .write =3D tpm_tis_mmio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4,
diff --git a/hw/usb/chipidea.c b/hw/usb/chipidea.c
index 3dcd22c..5085a7f 100644
--- a/hw/usb/chipidea.c
+++ b/hw/usb/chipidea.c
@@ -35,7 +35,7 @@ static void chipidea_write(void *opaque, hwaddr offset,
 static const struct MemoryRegionOps chipidea_ops =3D {
     .read =3D chipidea_read,
     .write =3D chipidea_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         /*
          * Our device would not work correctly if the guest was doing
@@ -76,7 +76,7 @@ static void chipidea_dc_write(void *opaque, hwaddr offset=
,
 static const struct MemoryRegionOps chipidea_dc_ops =3D {
     .read =3D chipidea_dc_read,
     .write =3D chipidea_dc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .impl =3D {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index cd1f3c7..88e53f6 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -223,7 +223,7 @@ static const MemoryRegionOps fusbh200_ehci_mmio_ops =3D=
 {
     .write =3D fusbh200_ehci_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void fusbh200_ehci_init(Object *obj)
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 62dab05..79ce13d 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -2357,7 +2357,7 @@ static const MemoryRegionOps ehci_mmio_caps_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 1,
     .impl.max_access_size =3D 1,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps ehci_mmio_opreg_ops =3D {
@@ -2365,7 +2365,7 @@ static const MemoryRegionOps ehci_mmio_opreg_ops =3D =
{
     .write =3D ehci_opreg_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps ehci_mmio_port_ops =3D {
@@ -2373,7 +2373,7 @@ static const MemoryRegionOps ehci_mmio_port_ops =3D {
     .write =3D ehci_port_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static USBPortOps ehci_port_ops =3D {
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 4f6fdbc..9d7cc15 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1774,7 +1774,7 @@ static void ohci_async_cancel_device(OHCIState *ohci,=
 USBDevice *dev)
 static const MemoryRegionOps ohci_mem_ops =3D {
     .read =3D ohci_mem_read,
     .write =3D ohci_mem_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static USBPortOps ohci_port_ops =3D {
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 98bd5cf..1f0aa49 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -1196,7 +1196,7 @@ static const MemoryRegionOps uhci_ioport_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 2,
     .impl.max_access_size =3D 2,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static USBPortOps uhci_port_ops =3D {
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 5894a18..24d4a85 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -3161,7 +3161,7 @@ static const MemoryRegionOps xhci_cap_ops =3D {
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps xhci_oper_ops =3D {
@@ -3169,7 +3169,7 @@ static const MemoryRegionOps xhci_oper_ops =3D {
     .write =3D xhci_oper_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps xhci_port_ops =3D {
@@ -3177,7 +3177,7 @@ static const MemoryRegionOps xhci_port_ops =3D {
     .write =3D xhci_port_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps xhci_runtime_ops =3D {
@@ -3185,7 +3185,7 @@ static const MemoryRegionOps xhci_runtime_ops =3D {
     .write =3D xhci_runtime_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const MemoryRegionOps xhci_doorbell_ops =3D {
@@ -3193,7 +3193,7 @@ static const MemoryRegionOps xhci_doorbell_ops =3D {
     .write =3D xhci_doorbell_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void xhci_attach(USBPort *usbport)
diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
index a61b0f6..3819198 100644
--- a/hw/usb/tusb6010.c
+++ b/hw/usb/tusb6010.c
@@ -678,7 +678,7 @@ static const MemoryRegionOps tusb_async_ops =3D {
     .write =3D tusb_async_writefn,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void tusb_otg_tick(void *opaque)
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a859298..8954530 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -274,7 +274,7 @@ uint64_t vfio_region_read(void *opaque,
 const MemoryRegionOps vfio_region_ops =3D {
     .read =3D vfio_region_read,
     .write =3D vfio_region_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index fb3cc33..d5c0268 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -150,7 +150,7 @@ static void vfio_generic_window_quirk_address_write(voi=
d *opaque, hwaddr addr,
 static const MemoryRegionOps vfio_generic_window_address_quirk =3D {
     .read =3D vfio_generic_window_quirk_address_read,
     .write =3D vfio_generic_window_quirk_address_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t vfio_generic_window_quirk_data_read(void *opaque,
@@ -193,7 +193,7 @@ static void vfio_generic_window_quirk_data_write(void *=
opaque, hwaddr addr,
 static const MemoryRegionOps vfio_generic_window_data_quirk =3D {
     .read =3D vfio_generic_window_quirk_data_read,
     .write =3D vfio_generic_window_quirk_data_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 /*
@@ -243,7 +243,7 @@ static void vfio_generic_quirk_mirror_write(void *opaqu=
e, hwaddr addr,
 static const MemoryRegionOps vfio_generic_mirror_quirk =3D {
     .read =3D vfio_generic_quirk_mirror_read,
     .write =3D vfio_generic_quirk_mirror_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 /* Is range1 fully contained within range2?  */
@@ -278,7 +278,7 @@ static uint64_t vfio_ati_3c3_quirk_read(void *opaque,

 static const MemoryRegionOps vfio_ati_3c3_quirk =3D {
     .read =3D vfio_ati_3c3_quirk_read,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static VFIOQuirk *vfio_quirk_alloc(int nr_mem)
@@ -605,7 +605,7 @@ static void vfio_nvidia_3d4_quirk_write(void *opaque, h=
waddr addr,
 static const MemoryRegionOps vfio_nvidia_3d4_quirk =3D {
     .read =3D vfio_nvidia_3d4_quirk_read,
     .write =3D vfio_nvidia_3d4_quirk_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t vfio_nvidia_3d0_quirk_read(void *opaque,
@@ -663,7 +663,7 @@ static void vfio_nvidia_3d0_quirk_write(void *opaque, h=
waddr addr,
 static const MemoryRegionOps vfio_nvidia_3d0_quirk =3D {
     .read =3D vfio_nvidia_3d0_quirk_read,
     .write =3D vfio_nvidia_3d0_quirk_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void vfio_vga_probe_nvidia_3d0_quirk(VFIOPCIDevice *vdev)
@@ -752,7 +752,7 @@ static void vfio_nvidia_bar5_quirk_master_write(void *o=
paque, hwaddr addr,
 static const MemoryRegionOps vfio_nvidia_bar5_quirk_master =3D {
     .read =3D vfio_nvidia_bar5_quirk_master_read,
     .write =3D vfio_nvidia_bar5_quirk_master_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t vfio_nvidia_bar5_quirk_enable_read(void *opaque,
@@ -779,7 +779,7 @@ static void vfio_nvidia_bar5_quirk_enable_write(void *o=
paque, hwaddr addr,
 static const MemoryRegionOps vfio_nvidia_bar5_quirk_enable =3D {
     .read =3D vfio_nvidia_bar5_quirk_enable_read,
     .write =3D vfio_nvidia_bar5_quirk_enable_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void vfio_probe_nvidia_bar5_quirk(VFIOPCIDevice *vdev, int nr)
@@ -929,7 +929,7 @@ static void vfio_nvidia_quirk_mirror_write(void *opaque=
, hwaddr addr,
 static const MemoryRegionOps vfio_nvidia_mirror_quirk =3D {
     .read =3D vfio_generic_quirk_mirror_read,
     .write =3D vfio_nvidia_quirk_mirror_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void vfio_nvidia_bar0_quirk_reset(VFIOPCIDevice *vdev, VFIOQuirk *q=
uirk)
@@ -1090,7 +1090,7 @@ static const MemoryRegionOps vfio_rtl_address_quirk =
=3D {
         .max_access_size =3D 4,
         .unaligned =3D false,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t vfio_rtl8168_quirk_data_read(void *opaque,
@@ -1130,7 +1130,7 @@ static const MemoryRegionOps vfio_rtl_data_quirk =3D =
{
         .max_access_size =3D 4,
         .unaligned =3D false,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void vfio_probe_rtl8168_bar2_quirk(VFIOPCIDevice *vdev, int nr)
@@ -1526,7 +1526,7 @@ static void vfio_igd_quirk_data_write(void *opaque, h=
waddr addr,
 static const MemoryRegionOps vfio_igd_data_quirk =3D {
     .read =3D vfio_igd_quirk_data_read,
     .write =3D vfio_igd_quirk_data_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static uint64_t vfio_igd_quirk_index_read(void *opaque,
@@ -1554,7 +1554,7 @@ static void vfio_igd_quirk_index_write(void *opaque, =
hwaddr addr,
 static const MemoryRegionOps vfio_igd_index_quirk =3D {
     .read =3D vfio_igd_quirk_index_read,
     .write =3D vfio_igd_quirk_index_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index d7a4e18..dab2a89 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -879,7 +879,7 @@ static void vfio_rom_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps vfio_rom_ops =3D {
     .read =3D vfio_rom_read,
     .write =3D vfio_rom_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
@@ -1027,7 +1027,7 @@ uint64_t vfio_vga_read(void *opaque, hwaddr addr, uns=
igned size)
 static const MemoryRegionOps vfio_vga_ops =3D {
     .read =3D vfio_vga_read,
     .write =3D vfio_vga_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 /*
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 97b7f35..84a3f5e 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -313,7 +313,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offs=
et, uint64_t value,
 static const MemoryRegionOps virtio_mem_ops =3D {
     .read =3D virtio_mmio_read,
     .write =3D virtio_mmio_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void virtio_mmio_update_irq(DeviceState *opaque, uint16_t vector)
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 25875c8..b929e44 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -484,7 +484,7 @@ static const MemoryRegionOps virtio_pci_config_ops =3D =
{
         .min_access_size =3D 1,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static MemoryRegion *virtio_address_space_lookup(VirtIOPCIProxy *proxy,
@@ -1387,7 +1387,7 @@ static void virtio_pci_modern_regions_init(VirtIOPCIP=
roxy *proxy)
             .min_access_size =3D 1,
             .max_access_size =3D 4,
         },
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
     };
     static const MemoryRegionOps isr_ops =3D {
         .read =3D virtio_pci_isr_read,
@@ -1396,7 +1396,7 @@ static void virtio_pci_modern_regions_init(VirtIOPCIP=
roxy *proxy)
             .min_access_size =3D 1,
             .max_access_size =3D 4,
         },
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
     };
     static const MemoryRegionOps device_ops =3D {
         .read =3D virtio_pci_device_read,
@@ -1405,7 +1405,7 @@ static void virtio_pci_modern_regions_init(VirtIOPCIP=
roxy *proxy)
             .min_access_size =3D 1,
             .max_access_size =3D 4,
         },
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
     };
     static const MemoryRegionOps notify_ops =3D {
         .read =3D virtio_pci_notify_read,
@@ -1414,7 +1414,7 @@ static void virtio_pci_modern_regions_init(VirtIOPCIP=
roxy *proxy)
             .min_access_size =3D 1,
             .max_access_size =3D 4,
         },
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
     };
     static const MemoryRegionOps notify_pio_ops =3D {
         .read =3D virtio_pci_notify_read,
@@ -1423,7 +1423,7 @@ static void virtio_pci_modern_regions_init(VirtIOPCIP=
roxy *proxy)
             .min_access_size =3D 1,
             .max_access_size =3D 4,
         },
-        .endianness =3D DEVICE_LITTLE_ENDIAN,
+        .endianness =3D MO_LE,
     };


diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watch=
dog.c
index 54ac393..fcfa3b4 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -261,7 +261,7 @@ bad_offset:
 static const MemoryRegionOps cmsdk_apb_watchdog_ops =3D {
     .read =3D cmsdk_apb_watchdog_read,
     .write =3D cmsdk_apb_watchdog_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     /* byte/halfword accesses are just zero-padded on reads and writes */
     .impl.min_access_size =3D 4,
     .impl.max_access_size =3D 4,
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 57fe24a..775f73e 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -202,7 +202,7 @@ static const VMStateDescription vmstate_aspeed_wdt =3D =
{
 static const MemoryRegionOps aspeed_wdt_ops =3D {
     .read =3D aspeed_wdt_read,
     .write =3D aspeed_wdt_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
     .valid.unaligned =3D false,
diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index 6780f01..11cb1ed 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -398,7 +398,7 @@ static const MemoryRegionOps i6300esb_ops =3D {
     .write =3D i6300esb_mem_writefn,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
 };

 static const VMStateDescription vmstate_i6300esb =3D {
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 5539d56..215b615 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -436,7 +436,7 @@ static void xen_pt_bar_write(void *o, hwaddr addr, uint=
64_t val,
 }

 static const MemoryRegionOps ops =3D {
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .read =3D xen_pt_bar_read,
     .write =3D xen_pt_bar_write,
 };
diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
index fb4b887..d12cc1f 100644
--- a/hw/xen/xen_pt_msi.c
+++ b/hw/xen/xen_pt_msi.c
@@ -507,7 +507,7 @@ static bool pci_msix_accepts(void *opaque, hwaddr addr,
 static const MemoryRegionOps pci_msix_ops =3D {
     .read =3D pci_msix_read,
     .write =3D pci_msix_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/xtensa/mx_pic.c b/hw/xtensa/mx_pic.c
index 7075db9..9f11231 100644
--- a/hw/xtensa/mx_pic.c
+++ b/hw/xtensa/mx_pic.c
@@ -266,7 +266,7 @@ static void xtensa_mx_pic_ext_reg_write(void *opaque, h=
waddr offset,
 static const MemoryRegionOps xtensa_mx_pic_ops =3D {
     .read =3D xtensa_mx_pic_ext_reg_read,
     .write =3D xtensa_mx_pic_ext_reg_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
     .valid =3D {
         .unaligned =3D true,
     },
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index f7f3e11..3d4a44a 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -117,7 +117,7 @@ static void xtfpga_fpga_write(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps xtfpga_fpga_ops =3D {
     .read =3D xtfpga_fpga_read,
     .write =3D xtfpga_fpga_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static XtfpgaFpgaState *xtfpga_fpga_init(MemoryRegion *address_space,
@@ -212,7 +212,7 @@ static void xtfpga_io_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps xtfpga_io_ops =3D {
     .read =3D xtfpga_io_read,
     .write =3D xtfpga_io_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machin=
e)
@@ -311,7 +311,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, M=
achineState *machine)
     }

     serial_mm_init(system_io, 0x0d050020, 2, extints[0],
-                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   115200, serial_hd(0), MO_TE);

     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (dinfo) {
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index c388453..01a29ba 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -27,9 +27,9 @@ enum device_endian {
 };

 #if defined(HOST_WORDS_BIGENDIAN)
-#define DEVICE_HOST_ENDIAN DEVICE_BIG_ENDIAN
+#define DEVICE_HOST_ENDIAN MO_BE
 #else
-#define DEVICE_HOST_ENDIAN DEVICE_LITTLE_ENDIAN
+#define DEVICE_HOST_ENDIAN MO_LE
 #endif

 /* address in the RAM (different from a physical address) */
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 975b86a..d7acf6a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -168,7 +168,7 @@ struct MemoryRegionOps {
                                     unsigned size,
                                     MemTxAttrs attrs);

-    enum device_endian endianness;
+    MemOp endianness;
     /* Guest-visible constraints: */
     struct {
         /* If nonzero, specify bounds on access sizes beyond which a machi=
ne
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index abd5cf7..3a12485 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -92,7 +92,7 @@ SerialState *serial_init(int base, qemu_irq irq, int baud=
base,
 SerialState *serial_mm_init(MemoryRegion *address_space,
                             hwaddr base, int it_shift,
                             qemu_irq irq, int baudbase,
-                            Chardev *chr, enum device_endian end);
+                            Chardev *chr, MemOp end);

 /* serial-isa.c */

diff --git a/ioport.c b/ioport.c
index 04e360e..e5713e8 100644
--- a/ioport.c
+++ b/ioport.c
@@ -51,7 +51,7 @@ static void unassigned_io_write(void *opaque, hwaddr addr=
, uint64_t val,
 const MemoryRegionOps unassigned_io_ops =3D {
     .read =3D unassigned_io_read,
     .write =3D unassigned_io_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 void cpu_outb(uint32_t addr, uint8_t val)
@@ -213,7 +213,7 @@ static void portio_write(void *opaque, hwaddr addr, uin=
t64_t data,
 static const MemoryRegionOps portio_ops =3D {
     .read =3D portio_read,
     .write =3D portio_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .endianness =3D MO_LE,
     .valid.unaligned =3D true,
     .impl.unaligned =3D true,
 };
diff --git a/memory.c b/memory.c
index 89ea4fb..3cabb52 100644
--- a/memory.c
+++ b/memory.c
@@ -346,18 +346,18 @@ static void flatview_simplify(FlatView *view)
 static bool memory_region_big_endian(MemoryRegion *mr)
 {
 #ifdef TARGET_WORDS_BIGENDIAN
-    return mr->ops->endianness !=3D DEVICE_LITTLE_ENDIAN;
+    return mr->ops->endianness !=3D MO_LE;
 #else
-    return mr->ops->endianness =3D=3D DEVICE_BIG_ENDIAN;
+    return mr->ops->endianness =3D=3D MO_BE;
 #endif
 }

 static bool memory_region_wrong_endianness(MemoryRegion *mr)
 {
 #ifdef TARGET_WORDS_BIGENDIAN
-    return mr->ops->endianness =3D=3D DEVICE_LITTLE_ENDIAN;
+    return mr->ops->endianness =3D=3D MO_LE;
 #else
-    return mr->ops->endianness =3D=3D DEVICE_BIG_ENDIAN;
+    return mr->ops->endianness =3D=3D MO_BE;
 #endif
 }

@@ -1307,7 +1307,7 @@ static bool unassigned_mem_accepts(void *opaque, hwad=
dr addr,

 const MemoryRegionOps unassigned_mem_ops =3D {
     .valid.accepts =3D unassigned_mem_accepts,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D MO_TE,
 };

 static uint64_t memory_region_ram_device_read(void *opaque,
diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
index de658c4..8fc790f 100644
--- a/memory_ldst.inc.c
+++ b/memory_ldst.inc.c
@@ -21,8 +21,7 @@

 /* warning: addr must be aligned */
 static inline uint32_t glue(address_space_ldl_internal, SUFFIX)(ARG1_DECL,
-    hwaddr addr, MemTxAttrs attrs, MemTxResult *result,
-    enum device_endian endian)
+    hwaddr addr, MemTxAttrs attrs, MemTxResult *result, MemOp endian)
 {
     uint8_t *ptr;
     uint64_t val;
@@ -40,11 +39,11 @@ static inline uint32_t glue(address_space_ldl_internal,=
 SUFFIX)(ARG1_DECL,
         /* I/O case */
         r =3D memory_region_dispatch_read(mr, addr1, &val, MO_32, attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
+        if (endian =3D=3D MO_LE) {
             val =3D bswap32(val);
         }
 #else
-        if (endian =3D=3D DEVICE_BIG_ENDIAN) {
+        if (endian =3D=3D MO_BE) {
             val =3D bswap32(val);
         }
 #endif
@@ -52,10 +51,10 @@ static inline uint32_t glue(address_space_ldl_internal,=
 SUFFIX)(ARG1_DECL,
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
         switch (endian) {
-        case DEVICE_LITTLE_ENDIAN:
+        case MO_LE:
             val =3D ldl_le_p(ptr);
             break;
-        case DEVICE_BIG_ENDIAN:
+        case MO_BE:
             val =3D ldl_be_p(ptr);
             break;
         default:
@@ -78,27 +77,26 @@ uint32_t glue(address_space_ldl, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_ldl_internal, SUFFIX)(ARG1, addr, attrs, res=
ult,
-                                                    DEVICE_NATIVE_ENDIAN);
+                                                    MO_TE);
 }

 uint32_t glue(address_space_ldl_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_ldl_internal, SUFFIX)(ARG1, addr, attrs, res=
ult,
-                                                    DEVICE_LITTLE_ENDIAN);
+                                                    MO_LE);
 }

 uint32_t glue(address_space_ldl_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_ldl_internal, SUFFIX)(ARG1, addr, attrs, res=
ult,
-                                                    DEVICE_BIG_ENDIAN);
+                                                    MO_BE);
 }

 /* warning: addr must be aligned */
 static inline uint64_t glue(address_space_ldq_internal, SUFFIX)(ARG1_DECL,
-    hwaddr addr, MemTxAttrs attrs, MemTxResult *result,
-    enum device_endian endian)
+    hwaddr addr, MemTxAttrs attrs, MemTxResult *result, MemOp endian)
 {
     uint8_t *ptr;
     uint64_t val;
@@ -116,11 +114,11 @@ static inline uint64_t glue(address_space_ldq_interna=
l, SUFFIX)(ARG1_DECL,
         /* I/O case */
         r =3D memory_region_dispatch_read(mr, addr1, &val, MO_64, attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
+        if (endian =3D=3D MO_LE) {
             val =3D bswap64(val);
         }
 #else
-        if (endian =3D=3D DEVICE_BIG_ENDIAN) {
+        if (endian =3D=3D MO_BE) {
             val =3D bswap64(val);
         }
 #endif
@@ -128,10 +126,10 @@ static inline uint64_t glue(address_space_ldq_interna=
l, SUFFIX)(ARG1_DECL,
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
         switch (endian) {
-        case DEVICE_LITTLE_ENDIAN:
+        case MO_LE:
             val =3D ldq_le_p(ptr);
             break;
-        case DEVICE_BIG_ENDIAN:
+        case MO_BE:
             val =3D ldq_be_p(ptr);
             break;
         default:
@@ -154,21 +152,21 @@ uint64_t glue(address_space_ldq, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_ldq_internal, SUFFIX)(ARG1, addr, attrs, res=
ult,
-                                                    DEVICE_NATIVE_ENDIAN);
+                                                    MO_TE);
 }

 uint64_t glue(address_space_ldq_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_ldq_internal, SUFFIX)(ARG1, addr, attrs, res=
ult,
-                                                    DEVICE_LITTLE_ENDIAN);
+                                                    MO_LE);
 }

 uint64_t glue(address_space_ldq_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_ldq_internal, SUFFIX)(ARG1, addr, attrs, res=
ult,
-                                                    DEVICE_BIG_ENDIAN);
+                                                    MO_BE);
 }

 uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
@@ -207,8 +205,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,

 /* warning: addr must be aligned */
 static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL=
,
-    hwaddr addr, MemTxAttrs attrs, MemTxResult *result,
-    enum device_endian endian)
+    hwaddr addr, MemTxAttrs attrs, MemTxResult *result, MemOp endian)
 {
     uint8_t *ptr;
     uint64_t val;
@@ -226,11 +223,11 @@ static inline uint32_t glue(address_space_lduw_intern=
al, SUFFIX)(ARG1_DECL,
         /* I/O case */
         r =3D memory_region_dispatch_read(mr, addr1, &val, MO_16, attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
+        if (endian =3D=3D MO_LE) {
             val =3D bswap16(val);
         }
 #else
-        if (endian =3D=3D DEVICE_BIG_ENDIAN) {
+        if (endian =3D=3D MO_BE) {
             val =3D bswap16(val);
         }
 #endif
@@ -238,10 +235,10 @@ static inline uint32_t glue(address_space_lduw_intern=
al, SUFFIX)(ARG1_DECL,
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
         switch (endian) {
-        case DEVICE_LITTLE_ENDIAN:
+        case MO_LE:
             val =3D lduw_le_p(ptr);
             break;
-        case DEVICE_BIG_ENDIAN:
+        case MO_BE:
             val =3D lduw_be_p(ptr);
             break;
         default:
@@ -264,21 +261,21 @@ uint32_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, re=
sult,
-                                                     DEVICE_NATIVE_ENDIAN)=
;
+                                                     MO_TE);
 }

 uint32_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, re=
sult,
-                                                     DEVICE_LITTLE_ENDIAN)=
;
+                                                     MO_LE);
 }

 uint32_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, re=
sult,
-                                       DEVICE_BIG_ENDIAN);
+                                       MO_BE);
 }

 /* warning: addr must be aligned. The ram page is not masked as dirty
@@ -322,8 +319,8 @@ void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL=
,

 /* warning: addr must be aligned */
 static inline void glue(address_space_stl_internal, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs,
-    MemTxResult *result, enum device_endian endian)
+    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result,
+    MemOp endian)
 {
     uint8_t *ptr;
     MemoryRegion *mr;
@@ -338,11 +335,11 @@ static inline void glue(address_space_stl_internal, S=
UFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

 #if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
+        if (endian =3D=3D MO_LE) {
             val =3D bswap32(val);
         }
 #else
-        if (endian =3D=3D DEVICE_BIG_ENDIAN) {
+        if (endian =3D=3D MO_BE) {
             val =3D bswap32(val);
         }
 #endif
@@ -351,10 +348,10 @@ static inline void glue(address_space_stl_internal, S=
UFFIX)(ARG1_DECL,
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
         switch (endian) {
-        case DEVICE_LITTLE_ENDIAN:
+        case MO_LE:
             stl_le_p(ptr, val);
             break;
-        case DEVICE_BIG_ENDIAN:
+        case MO_BE:
             stl_be_p(ptr, val);
             break;
         default:
@@ -377,21 +374,21 @@ void glue(address_space_stl, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stl_internal, SUFFIX)(ARG1, addr, val, attrs,
-                                             result, DEVICE_NATIVE_ENDIAN)=
;
+                                             result, MO_TE);
 }

 void glue(address_space_stl_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
 {
-    glue(address_space_stl_internal, SUFFIX)(ARG1, addr, val, attrs,
-                                             result, DEVICE_LITTLE_ENDIAN)=
;
+    glue(address_space_stl_internal, SUFFIX)(ARG1, addr, val, attrs, resul=
t,
+                                             MO_LE);
 }

 void glue(address_space_stl_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stl_internal, SUFFIX)(ARG1, addr, val, attrs,
-                                             result, DEVICE_BIG_ENDIAN);
+                                             result, MO_BE);
 }

 void glue(address_space_stb, SUFFIX)(ARG1_DECL,
@@ -428,7 +425,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL,
 /* warning: addr must be aligned */
 static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs,
-    MemTxResult *result, enum device_endian endian)
+    MemTxResult *result, MemOp endian)
 {
     uint8_t *ptr;
     MemoryRegion *mr;
@@ -443,11 +440,11 @@ static inline void glue(address_space_stw_internal, S=
UFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

 #if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
+        if (endian =3D=3D MO_LE) {
             val =3D bswap16(val);
         }
 #else
-        if (endian =3D=3D DEVICE_BIG_ENDIAN) {
+        if (endian =3D=3D MO_BE) {
             val =3D bswap16(val);
         }
 #endif
@@ -456,10 +453,10 @@ static inline void glue(address_space_stw_internal, S=
UFFIX)(ARG1_DECL,
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
         switch (endian) {
-        case DEVICE_LITTLE_ENDIAN:
+        case MO_LE:
             stw_le_p(ptr, val);
             break;
-        case DEVICE_BIG_ENDIAN:
+        case MO_BE:
             stw_be_p(ptr, val);
             break;
         default:
@@ -482,26 +479,26 @@ void glue(address_space_stw, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, resul=
t,
-                                             DEVICE_NATIVE_ENDIAN);
+                                             MO_TE);
 }

 void glue(address_space_stw_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, resul=
t,
-                                             DEVICE_LITTLE_ENDIAN);
+                                             MO_LE);
 }

 void glue(address_space_stw_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, resul=
t,
-                               DEVICE_BIG_ENDIAN);
+                               MO_BE);
 }

 static void glue(address_space_stq_internal, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs,
-    MemTxResult *result, enum device_endian endian)
+    MemTxResult *result, MemOp endian)
 {
     uint8_t *ptr;
     MemoryRegion *mr;
@@ -516,11 +513,11 @@ static void glue(address_space_stq_internal, SUFFIX)(=
ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

 #if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
+        if (endian =3D=3D MO_LE) {
             val =3D bswap64(val);
         }
 #else
-        if (endian =3D=3D DEVICE_BIG_ENDIAN) {
+        if (endian =3D=3D MO_BE) {
             val =3D bswap64(val);
         }
 #endif
@@ -529,10 +526,10 @@ static void glue(address_space_stq_internal, SUFFIX)(=
ARG1_DECL,
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
         switch (endian) {
-        case DEVICE_LITTLE_ENDIAN:
+        case MO_LE:
             stq_le_p(ptr, val);
             break;
-        case DEVICE_BIG_ENDIAN:
+        case MO_BE:
             stq_be_p(ptr, val);
             break;
         default:
@@ -555,21 +552,21 @@ void glue(address_space_stq, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stq_internal, SUFFIX)(ARG1, addr, val, attrs, resul=
t,
-                                             DEVICE_NATIVE_ENDIAN);
+                                             MO_TE);
 }

 void glue(address_space_stq_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stq_internal, SUFFIX)(ARG1, addr, val, attrs, resul=
t,
-                                             DEVICE_LITTLE_ENDIAN);
+                                             MO_LE);
 }

 void glue(address_space_stq_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stq_internal, SUFFIX)(ARG1, addr, val, attrs, resul=
t,
-                                             DEVICE_BIG_ENDIAN);
+                                             MO_BE);
 }

 #undef ARG1_DECL
--
1.8.3.1




--_000_156594798105026795btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div style=3D"color: rgb(33, 33, 33);"><font size=3D"2"><span style=3D"font=
-size:10pt;">
<div class=3D"PlainText">
<div><span style=3D"font-size: 10pt;">Simplify endianness comparisons with =
consistent use of the more</span><br>
</div>
<div>expressive MemOp.</div>
<div><br>
</div>
<div>Suggested-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</=
div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>Acked-by: David Gibson &lt;david@gibson.dropbear.id.au&gt;</div>
<div>---</div>
<div>&nbsp;exec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 8 &#43;--</div>
<div>&nbsp;hw/acpi/core.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/acpi/cpu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/acpi/cpu_hotplug.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/acpi/ich9.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/acpi/memory_hotplug.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/acpi/nvdimm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/acpi/pcihp.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/acpi/piix4.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/acpi/tco.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/adc/stm32f2xx_adc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/alpha/pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/alpha/typhoon.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/arm/allwinner-a10.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/armv7m.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/aspeed.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/aspeed_soc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/exynos4210.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/highbank.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/integratorcp.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/arm/kzm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/msf2-soc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/musicpal.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp;20 &#43;&#43;&#43;----</div>
<div>&nbsp;hw/arm/omap1.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;40 &#43;&#43;&#43;&#43;&#43;&#43;&#43;--=
-----</div>
<div>&nbsp;hw/arm/omap2.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;10 &#43;&#43;--</div>
<div>&nbsp;hw/arm/omap_sx1.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/palm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/pxa2xx.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp;20 &#43;&#43;&#43;----</div>
<div>&nbsp;hw/arm/pxa2xx_gpio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/pxa2xx_pic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/smmuv3.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/spitz.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/arm/stellaris.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 8 &#43;--</div>
<div>&nbsp;hw/arm/strongarm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp;12 &#43;&#43;---</div>
<div>&nbsp;hw/arm/versatilepb.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/audio/ac97.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/audio/cs4231.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/audio/es1370.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/audio/intel-hda.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/audio/marvell_88w8618.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/audio/milkymist-ac97.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/audio/pl041.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/block/fdc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/block/nvme.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/block/onenand.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/block/pflash_cfi01.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/block/pflash_cfi02.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/bcm2835_aux.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/cadence_uart.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/cmsdk-apb-uart.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/debugcon.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/digic-uart.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/escc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/etraxfs_ser.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/exynos4210_uart.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/grlib_apbuart.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/imx_serial.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/lm32_uart.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/mcf_uart.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/milkymist-uart.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/nrf51_uart.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/omap_uart.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/char/parallel.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/pl011.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/serial.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp;10 &#43;&#43;--</div>
<div>&nbsp;hw/char/sh_serial.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/stm32f2xx_usart.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/char/xilinx_uartlite.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/core/empty_slot.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/cris/axis_dev88.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/display/ati.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/display/bcm2835_fb.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/display/bochs-display.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 4 &#43;-</div>
<div>&nbsp;hw/display/cg3.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/display/cirrus_vga.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp;10 &#43;&#43;--</div>
<div>&nbsp;hw/display/edid-region.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/display/exynos4210_fimd.c &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;=
 2 &#43;-</div>
<div>&nbsp;hw/display/g364fb.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/display/jazz_led.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/display/milkymist-tmu2.c &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;=
 2 &#43;-</div>
<div>&nbsp;hw/display/milkymist-vgafb.c &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;=
 2 &#43;-</div>
<div>&nbsp;hw/display/omap_dss.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp;10 &#43;&#43;--</div>
<div>&nbsp;hw/display/omap_lcdc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/display/pl110.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/display/pxa2xx_lcd.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/display/sm501.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp;10 &#43;&#43;--</div>
<div>&nbsp;hw/display/tc6393xb.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/display/tcx.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp;14 &#43;&#43;---</div>
<div>&nbsp;hw/display/vga-isa-mm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/display/vga-pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/display/vga.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/display/vmware_vga.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/display/xlnx_dp.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 8 &#43;--</div>
<div>&nbsp;hw/dma/bcm2835_dma.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/dma/etraxfs_dma.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 8 &#43;--</div>
<div>&nbsp;hw/dma/i8257.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/dma/omap_dma.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/dma/pl080.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/dma/pl330.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/dma/puv3_dma.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/dma/pxa2xx_dma.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/dma/rc4030.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/dma/sparc32_dma.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/dma/xilinx_axidma.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/dma/xlnx-zdma.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/dma/xlnx-zynq-devcfg.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/dma/xlnx_dpdma.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/gpio/bcm2835_gpio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/gpio/imx_gpio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/gpio/mpc8xxx.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/gpio/nrf51_gpio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/gpio/omap_gpio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/gpio/pl061.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/gpio/puv3_gpio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/gpio/zaurus.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/hppa/dino.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/hppa/machine.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/hppa/pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/hyperv/hyperv_testdev.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/i2c/aspeed_i2c.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/i2c/exynos4210_i2c.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/i2c/imx_i2c.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/i2c/microbit_i2c.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/i2c/mpc_i2c.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/i2c/omap_i2c.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/i2c/pm_smbus.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/i2c/ppc4xx_i2c.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/i2c/versatile_i2c.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/i386/amd_iommu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/i386/intel_iommu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/i386/kvm/apic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/i386/kvmvapic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/i386/pc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/i386/vmport.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/i386/xen/xen_apic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/i386/xen/xen_platform.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 4 &#43;-</div>
<div>&nbsp;hw/i386/xen/xen_pvdevice.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ide/ahci-allwinner.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ide/ahci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/ide/macio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ide/mmio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/ide/pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/ide/sii3112.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/input/milkymist-softusb.c &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;=
 2 &#43;-</div>
<div>&nbsp;hw/input/pckbd.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/input/pl050.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/input/pxa2xx_keypad.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/allwinner-a10-pic.c &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;=
 2 &#43;-</div>
<div>&nbsp;hw/intc/apic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/arm_gic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp;12 &#43;&#43;---</div>
<div>&nbsp;hw/intc/arm_gicv2m.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/arm_gicv3.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/intc/arm_gicv3_its_common.c &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#=
43;-</div>
<div>&nbsp;hw/intc/armv7m_nvic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/intc/aspeed_vic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/bcm2835_ic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/bcm2836_control.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/etraxfs_pic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/exynos4210_combiner.c &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#=
43;-</div>
<div>&nbsp;hw/intc/grlib_irqmp.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/heathrow_pic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/imx_avic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/imx_gpcv2.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/ioapic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/mips_gic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/omap_intc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/intc/ompic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/openpic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp;20 &#43;&#43;&#43;----</div>
<div>&nbsp;hw/intc/openpic_kvm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/pl190.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/pnv_xive.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp;14 &#43;&#43;---</div>
<div>&nbsp;hw/intc/puv3_intc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/sh_intc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/slavio_intctl.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/intc/xics_pnv.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/xilinx_intc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/intc/xive.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/intc/xlnx-pmu-iomod-intc.c &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#=
43;-</div>
<div>&nbsp;hw/intc/xlnx-zynqmp-ipi.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ipack/tpci200.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp;10 &#43;&#43;--</div>
<div>&nbsp;hw/ipmi/isa_ipmi_bt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ipmi/isa_ipmi_kcs.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/isa/lpc_ich9.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/isa/pc87312.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/isa/vt82c686.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/m68k/mcf5206.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/m68k/mcf5208.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/m68k/mcf_intc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/microblaze/petalogix_ml605_mmu.c | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/mips/boston.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/mips/gt64xxx_pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/mips/mips_jazz.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 8 &#43;--</div>
<div>&nbsp;hw/mips/mips_malta.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/mips/mips_r4k.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/a9scu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/applesmc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/misc/arm11scu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/arm_integrator_debug.c &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#=
43;-</div>
<div>&nbsp;hw/misc/arm_l2x0.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/arm_sysctl.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/armsse-cpuid.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/armsse-mhu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/aspeed_scu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/aspeed_sdmc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/aspeed_xdma.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/bcm2835_mbox.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/bcm2835_property.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/bcm2835_rng.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/debugexit.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/eccmemctl.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/misc/edu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/exynos4210_clk.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/exynos4210_pmu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/exynos4210_rng.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/grlib_ahb_apb_pnp.c &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;=
 4 &#43;-</div>
<div>&nbsp;hw/misc/imx25_ccm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/imx2_wdt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/imx31_ccm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/imx6_ccm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/misc/imx6_src.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/imx6ul_ccm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/misc/imx7_ccm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/misc/imx7_gpr.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/imx7_snvs.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/iotkit-secctl.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/misc/iotkit-sysctl.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/iotkit-sysinfo.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/ivshmem.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/macio/cuda.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/macio/gpio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/macio/mac_dbdma.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/macio/macio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/macio/pmu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/milkymist-hpdmc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/milkymist-pfpu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/mips_cmgcr.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/mips_cpc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/mips_itu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/misc/mos6522.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/mps2-fpgaio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/mps2-scc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/msf2-sysreg.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/mst_fpga.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/misc/nrf51_rng.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/omap_gpmc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/misc/omap_l4.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/omap_sdrc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/omap_tap.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/pc-testdev.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp;10 &#43;&#43;--</div>
<div>&nbsp;hw/misc/pci-testdev.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/misc/puv3_pm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/slavio_misc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp;16 &#43;&#43;&#43;---</div>
<div>&nbsp;hw/misc/stm32f2xx_syscfg.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/tz-mpc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/misc/tz-msc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/tz-ppc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/unimp.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/zynq-xadc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/misc/zynq_slcr.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/moxie/moxiesim.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/allwinner_emac.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/cadence_gem.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/can/can_kvaser_pci.c &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;=
 6 &#43;--</div>
<div>&nbsp;hw/net/can/can_mioe3680_pci.c &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#=
43;-</div>
<div>&nbsp;hw/net/can/can_pcm3680_pci.c &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;=
 4 &#43;-</div>
<div>&nbsp;hw/net/dp8393x.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/e1000.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/net/e1000e.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/net/eepro100.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/etraxfs_eth.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/fsl_etsec/etsec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/ftgmac100.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/imx_fec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/lan9118.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/net/lance.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/mcf_fec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/milkymist-minimac2.c &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;=
 2 &#43;-</div>
<div>&nbsp;hw/net/ne2000.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/pcnet-pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/net/rocker/rocker.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/rtl8139.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/smc91c111.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/stellaris_enet.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/sungem.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp;12 &#43;&#43;---</div>
<div>&nbsp;hw/net/sunhme.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp;10 &#43;&#43;--</div>
<div>&nbsp;hw/net/vmxnet3.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/net/xgmac.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/xilinx_axienet.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/net/xilinx_ethlite.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/nios2/10m50_devboard.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/nvram/ds1225y.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/nvram/fw_cfg.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 8 &#43;--</div>
<div>&nbsp;hw/nvram/mac_nvram.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/nvram/nrf51_nvm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 8 &#43;--</div>
<div>&nbsp;hw/openrisc/openrisc_sim.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/pci-host/bonito.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp;10 &#43;&#43;--</div>
<div>&nbsp;hw/pci-host/designware.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/pci-host/piix.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/pci-host/ppce500.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/pci-host/prep.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/pci-host/q35.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/pci-host/sabre.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/pci-host/uninorth.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/pci-host/versatile.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/pci/msix.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/pci/pci_host.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 8 &#43;--</div>
<div>&nbsp;hw/pci/pcie_host.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/pci/shpc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/pcmcia/pxa2xx.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/ppc/e500.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/ppc/mpc8544_guts.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ppc/pnv_core.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/ppc/pnv_lpc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 8 &#43;--</div>
<div>&nbsp;hw/ppc/pnv_occ.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/ppc/pnv_psi.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 8 &#43;--</div>
<div>&nbsp;hw/ppc/pnv_xscom.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ppc/ppc405_boards.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/ppc/ppc405_uc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp;14 &#43;&#43;---</div>
<div>&nbsp;hw/ppc/ppc440_bamboo.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/ppc/ppc440_pcix.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/ppc/ppc4xx_pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ppc/ppce500_spin.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ppc/sam460ex.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/ppc/spapr_pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ppc/virtex_ml507.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/rdma/vmw/pvrdma_main.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 4 &#43;-</div>
<div>&nbsp;hw/riscv/sifive_clint.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/riscv/sifive_gpio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/riscv/sifive_plic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/riscv/sifive_prci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/riscv/sifive_test.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/riscv/sifive_uart.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/riscv/virt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/s390x/s390-pci-bus.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/scsi/esp-pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/scsi/esp.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/scsi/lsi53c895a.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/scsi/megasas.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/scsi/mptsas.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/scsi/vmw_pvscsi.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/sd/bcm2835_sdhost.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/sd/milkymist-memcard.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/sd/omap_mmc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/sd/pl181.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/sd/pxa2xx_mmci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/sd/sdhci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/sh4/r2d.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/sh4/sh7750.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/sh4/sh_pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/sparc/sun4m_iommu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/sparc64/niagara.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/sparc64/sun4u.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/sparc64/sun4u_iommu.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ssi/aspeed_smc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/ssi/imx_spi.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ssi/mss-spi.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ssi/omap_spi.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ssi/pl022.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ssi/stm32f2xx_spi.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ssi/xilinx_spi.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/ssi/xilinx_spips.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 8 &#43;--</div>
<div>&nbsp;hw/timer/a9gtimer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/timer/allwinner-a10-pit.c &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;=
 2 &#43;-</div>
<div>&nbsp;hw/timer/altera_timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/arm_mptimer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/timer/arm_timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/timer/armv7m_systick.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/aspeed_rtc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/aspeed_timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/cadence_ttc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/cmsdk-apb-dualtimer.c &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#=
43;-</div>
<div>&nbsp;hw/timer/cmsdk-apb-timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/digic-timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/etraxfs_timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/exynos4210_mct.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/exynos4210_pwm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/exynos4210_rtc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/grlib_gptimer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/hpet.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/i8254.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/imx_epit.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/imx_gpt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/lm32_timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/m48t59.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/timer/mc146818rtc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/milkymist-sysctl.c &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;=
 2 &#43;-</div>
<div>&nbsp;hw/timer/mss-timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/nrf51_timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/omap_gptimer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/omap_synctimer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/pl031.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/puv3_ost.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/pxa2xx_timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/sh_timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/slavio_timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/stm32f2xx_timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/sun4v-rtc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/xilinx_timer.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/timer/xlnx-zynqmp-rtc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/tpm/tpm_crb.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/tpm/tpm_tis.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/usb/chipidea.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/usb/hcd-ehci-sysbus.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/usb/hcd-ehci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 6 &#43;--</div>
<div>&nbsp;hw/usb/hcd-ohci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/usb/hcd-uhci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/usb/hcd-xhci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp;10 &#43;&#43;--</div>
<div>&nbsp;hw/usb/tusb6010.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/vfio/common.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/vfio/pci-quirks.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp;26 &#43;&#43;&#43;&#43;-----</div>
<div>&nbsp;hw/vfio/pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;hw/virtio/virtio-mmio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/virtio/virtio-pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp;12 &#43;&#43;---</div>
<div>&nbsp;hw/watchdog/cmsdk-apb-watchdog.c &nbsp; &nbsp;| &nbsp; 2 &#43;-<=
/div>
<div>&nbsp;hw/watchdog/wdt_aspeed.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/watchdog/wdt_i6300esb.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 &#43;-</div>
<div>&nbsp;hw/xen/xen_pt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/xen/xen_pt_msi.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/xtensa/mx_pic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;hw/xtensa/xtfpga.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 6 &#43;--</div>
<div>&nbsp;include/exec/cpu-common.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 4 &#43;-</div>
<div>&nbsp;include/exec/memory.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;include/hw/char/serial.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;ioport.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;10 &#43;&#43;--</div>
<div>&nbsp;memory_ldst.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | 103 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;-------------------</div>
<div>&nbsp;426 files changed, 773 insertions(&#43;), 776 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/exec.c b/exec.c</div>
<div>index 9f69197..303f9a7 100644</div>
<div>--- a/exec.c</div>
<div>&#43;&#43;&#43; b/exec.c</div>
<div>@@ -2796,7 &#43;2796,7 @@ static bool notdirty_mem_accepts(void *opaqu=
e, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps notdirty_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D notdirty_mem_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.accepts =3D notdirty_mem_accepts,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -2925,7 &#43;2925,7 @@ static MemTxResult watch_mem_write(void *opa=
que, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps watch_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D watch_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D watch_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -3001,7 &#43;3001,7 @@ static const MemoryRegionOps subpage_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.accepts =3D subpage_accepts,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int subpage_register (subpage_t *mmio, uint32_t start, ui=
nt32_t end,</div>
<div>@@ -3076,7 &#43;3076,7 @@ static bool readonly_mem_accepts(void *opaqu=
e, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps readonly_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D readonly_mem_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.accepts =3D readonly_mem_accepts,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>diff --git a/hw/acpi/core.c b/hw/acpi/core.c</div>
<div>index 228828a..971095d 100644</div>
<div>--- a/hw/acpi/core.c</div>
<div>&#43;&#43;&#43; b/hw/acpi/core.c</div>
<div>@@ -463,7 &#43;463,7 @@ static const MemoryRegionOps acpi_pm_evt_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D acpi_pm_evt_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 2,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void acpi_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_s=
ci,</div>
<div>@@ -532,7 &#43;532,7 @@ static const MemoryRegionOps acpi_pm_tmr_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D acpi_pm_tmr_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void acpi_pm_tmr_init(ACPIREGS *ar, acpi_update_sci_fn update_sc=
i,</div>
<div>@@ -604,7 &#43;604,7 @@ static const MemoryRegionOps acpi_pm_cnt_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D acpi_pm_cnt_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 2,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,</div>
<div>diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c</div>
<div>index 7a90c8f..be6b802 100644</div>
<div>--- a/hw/acpi/cpu.c</div>
<div>&#43;&#43;&#43; b/hw/acpi/cpu.c</div>
<div>@@ -179,7 &#43;179,7 @@ static void cpu_hotplug_wr(void *opaque, hwadd=
r addr, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps cpu_hotplug_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cpu_hotplug_rd,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cpu_hotplug_wr,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c</div>
<div>index 5243918..f7746d4 100644</div>
<div>--- a/hw/acpi/cpu_hotplug.c</div>
<div>&#43;&#43;&#43; b/hw/acpi/cpu_hotplug.c</div>
<div>@@ -49,7 &#43;49,7 @@ static void cpu_status_write(void *opaque, hwadd=
r addr, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps AcpiCpuHotplug_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cpu_status_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cpu_status_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c</div>
<div>index e53dfe1..29cef74 100644</div>
<div>--- a/hw/acpi/ich9.c</div>
<div>&#43;&#43;&#43; b/hw/acpi/ich9.c</div>
<div>@@ -74,7 &#43;74,7 @@ static const MemoryRegionOps ich9_gpe_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 1,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t ich9_smi_readl(void *opaque, hwaddr addr, unsign=
ed width)</div>
<div>@@ -115,7 &#43;115,7 @@ static const MemoryRegionOps ich9_smi_ops =3D =
{</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ich9_smi_writel,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void ich9_pm_iospace_update(ICH9LPCPMRegs *pm, uint32_t pm_io_ba=
se)</div>
<div>diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c</div>
<div>index 297812d..475fd64 100644</div>
<div>--- a/hw/acpi/memory_hotplug.c</div>
<div>&#43;&#43;&#43; b/hw/acpi/memory_hotplug.c</div>
<div>@@ -201,7 &#43;201,7 @@ static void acpi_memory_hotplug_write(void *op=
aque, hwaddr addr, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps acpi_memory_hotplug_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D acpi_memory_hotplug_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D acpi_memory_hotplug_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c</div>
<div>index 9fdad6d..b7fe093 100644</div>
<div>--- a/hw/acpi/nvdimm.c</div>
<div>&#43;&#43;&#43; b/hw/acpi/nvdimm.c</div>
<div>@@ -911,7 &#43;911,7 @@ exit:</div>
<div>&nbsp;static const MemoryRegionOps nvdimm_dsm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D nvdimm_dsm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D nvdimm_dsm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c</div>
<div>index 613406d..5597b29 100644</div>
<div>--- a/hw/acpi/pcihp.c</div>
<div>&#43;&#43;&#43; b/hw/acpi/pcihp.c</div>
<div>@@ -353,7 &#43;353,7 @@ static void pci_write(void *opaque, hwaddr add=
r, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps acpi_pcihp_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c</div>
<div>index ec4e186..871e026 100644</div>
<div>--- a/hw/acpi/piix4.c</div>
<div>&#43;&#43;&#43; b/hw/acpi/piix4.c</div>
<div>@@ -597,7 &#43;597,7 @@ static const MemoryRegionOps piix4_gpe_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 1,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>diff --git a/hw/acpi/tco.c b/hw/acpi/tco.c</div>
<div>index acfb65e..0a0a670 100644</div>
<div>--- a/hw/acpi/tco.c</div>
<div>&#43;&#43;&#43; b/hw/acpi/tco.c</div>
<div>@@ -215,7 &#43;215,7 @@ static const MemoryRegionOps tco_io_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 2,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void acpi_pm_tco_init(TCOIORegs *tr, MemoryRegion *parent)</div>
<div>diff --git a/hw/adc/stm32f2xx_adc.c b/hw/adc/stm32f2xx_adc.c</div>
<div>index c93b60e..53717be 100644</div>
<div>--- a/hw/adc/stm32f2xx_adc.c</div>
<div>&#43;&#43;&#43; b/hw/adc/stm32f2xx_adc.c</div>
<div>@@ -245,7 &#43;245,7 @@ static void stm32f2xx_adc_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps stm32f2xx_adc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D stm32f2xx_adc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D stm32f2xx_adc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_stm32f2xx_adc =3D {</div=
>
<div>diff --git a/hw/alpha/pci.c b/hw/alpha/pci.c</div>
<div>index fb902bb..7bd9e58 100644</div>
<div>--- a/hw/alpha/pci.c</div>
<div>&#43;&#43;&#43; b/hw/alpha/pci.c</div>
<div>@@ -27,7 &#43;27,7 @@ static void ignore_write(void *opaque, hwaddr ad=
dr, uint64_t v, unsigned size)</div>
<div>&nbsp;const MemoryRegionOps alpha_pci_ignore_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ignore_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ignore_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -57,7 &#43;57,7 @@ static void bw_conf1_write(void *opaque, hwaddr =
addr,</div>
<div>&nbsp;const MemoryRegionOps alpha_pci_conf1_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bw_conf1_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bw_conf1_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -80,7 &#43;80,7 @@ static void special_write(void *opaque, hwaddr a=
ddr,</div>
<div>&nbsp;const MemoryRegionOps alpha_pci_iack_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D iack_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D special_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c</div>
<div>index 3f34a51..6551594 100644</div>
<div>--- a/hw/alpha/typhoon.c</div>
<div>&#43;&#43;&#43; b/hw/alpha/typhoon.c</div>
<div>@@ -568,7 &#43;568,7 @@ static MemTxResult pchip_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps cchip_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D cchip_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D cchip_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -582,7 &#43;582,7 @@ static const MemoryRegionOps cchip_ops =3D {</=
div>
<div>&nbsp;static const MemoryRegionOps dchip_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D dchip_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D dchip_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -596,7 &#43;596,7 @@ static const MemoryRegionOps dchip_ops =3D {</=
div>
<div>&nbsp;static const MemoryRegionOps pchip_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D pchip_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D pchip_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c</div>
<div>index 35e906c..db38315 100644</div>
<div>--- a/hw/arm/allwinner-a10.c</div>
<div>&#43;&#43;&#43; b/hw/arm/allwinner-a10.c</div>
<div>@@ -114,7 &#43;114,7 @@ static void aw_a10_realize(DeviceState *dev, E=
rror **errp)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* FIXME use a qdev chardev prop instead of serial=
_hd() */</div>
<div>&nbsp; &nbsp; &nbsp;serial_mm_init(get_system_memory(), AW_A10_UART0_R=
EG_BASE, 2, s-&gt;irq[1],</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 11520=
0, serial_hd(0), DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1=
15200, serial_hd(0), MO_TE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void aw_a10_class_init(ObjectClass *oc, void *data)</div>
<div>diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c</div>
<div>index b9efad6..9bce022 100644</div>
<div>--- a/hw/arm/armv7m.c</div>
<div>&#43;&#43;&#43; b/hw/arm/armv7m.c</div>
<div>@@ -86,7 &#43;86,7 @@ static MemTxResult bitband_write(void *opaque, h=
waddr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps bitband_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D bitband_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D bitband_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c</div>
<div>index 843b708..c0ccb35 100644</div>
<div>--- a/hw/arm/aspeed.c</div>
<div>&#43;&#43;&#43; b/hw/arm/aspeed.c</div>
<div>@@ -105,7 &#43;105,7 @@ static void max_ram_write(void *opaque, hwaddr=
 offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps max_ram_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D max_ram_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D max_ram_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;#define FIRMWARE_ADDR 0x0</div>
<div>diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c</div>
<div>index c6fb370..9437b9d 100644</div>
<div>--- a/hw/arm/aspeed_soc.c</div>
<div>&#43;&#43;&#43; b/hw/arm/aspeed_soc.c</div>
<div>@@ -331,7 &#43;331,7 @@ static void aspeed_soc_realize(DeviceState *de=
v, Error **errp)</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(0)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_irq uart5 =3D aspeed_soc_get_ir=
q(s, ASPEED_UART5);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(get_system_memory(), =
sc-&gt;info-&gt;memmap[ASPEED_UART5], 2,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; uart5, 38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; uart5, 38400, serial_hd(0), MO_LE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* I2C */</div>
<div>diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c</div>
<div>index becd864..c1ce423 100644</div>
<div>--- a/hw/arm/exynos4210.c</div>
<div>&#43;&#43;&#43; b/hw/arm/exynos4210.c</div>
<div>@@ -119,7 &#43;119,7 @@ static void exynos4210_chipid_and_omr_write(vo=
id *opaque, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps exynos4210_chipid_and_omr_ops =3D {=
</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D exynos4210_chipid_and_omr_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D exynos4210_chipid_and_omr_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c</div>
<div>index def0f1c..0d1b699 100644</div>
<div>--- a/hw/arm/highbank.c</div>
<div>&#43;&#43;&#43; b/hw/arm/highbank.c</div>
<div>@@ -148,7 &#43;148,7 @@ static uint64_t hb_regs_read(void *opaque, hwa=
ddr offset,</div>
<div>&nbsp;static const MemoryRegionOps hb_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D hb_regs_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D hb_regs_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;#define TYPE_HIGHBANK_REGISTERS &quot;highbank-regs&quot;</div>
<div>diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c</div>
<div>index 200c010..260d928 100644</div>
<div>--- a/hw/arm/integratorcp.c</div>
<div>&#43;&#43;&#43; b/hw/arm/integratorcp.c</div>
<div>@@ -259,7 &#43;259,7 @@ static void integratorcm_write(void *opaque, h=
waddr offset,</div>
<div>&nbsp;static const MemoryRegionOps integratorcm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D integratorcm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D integratorcm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void integratorcm_init(Object *obj)</div>
<div>@@ -435,7 &#43;435,7 @@ static void icp_pic_write(void *opaque, hwaddr=
 offset,</div>
<div>&nbsp;static const MemoryRegionOps icp_pic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D icp_pic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D icp_pic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void icp_pic_init(Object *obj)</div>
<div>@@ -527,7 &#43;527,7 @@ static void icp_control_write(void *opaque, hw=
addr offset,</div>
<div>&nbsp;static const MemoryRegionOps icp_control_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D icp_control_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D icp_control_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void icp_control_mmc_wprot(void *opaque, int line, int le=
vel)</div>
<div>diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c</div>
<div>index 59d2102..836c1a7 100644</div>
<div>--- a/hw/arm/kzm.c</div>
<div>&#43;&#43;&#43; b/hw/arm/kzm.c</div>
<div>@@ -122,7 &#43;122,7 @@ static void kzm_init(MachineState *machine)</d=
iv>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(2)) { /* touchscreen */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(get_system_memory(), =
KZM_FPGA_ADDR&#43;0x10, 0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; qdev_get_gpio_in(DEVICE(&amp;s-&gt;soc.avic), 52),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; 14745600, serial_hd(2), DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; 14745600, serial_hd(2), MO_TE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;kzm_binfo.ram_size =3D machine-&gt;ram_size;</div>
<div>diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c</div>
<div>index 1ccb644..30ea87f 100644</div>
<div>--- a/hw/arm/msf2-soc.c</div>
<div>&#43;&#43;&#43; b/hw/arm/msf2-soc.c</div>
<div>@@ -139,7 &#43;139,7 @@ static void m2sxxx_soc_realize(DeviceState *de=
v_soc, Error **errp)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (serial_hd(i)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(get_sys=
tem_memory(), uart_addr[i], 2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; qdev_get_gpio_in(armv7m, uart_irq[i]),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; 115200, serial_hd(i), DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; 115200, serial_hd(i), MO_TE);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c</div>
<div>index 95d56f3..e20f0a9 100644</div>
<div>--- a/hw/arm/musicpal.c</div>
<div>&#43;&#43;&#43; b/hw/arm/musicpal.c</div>
<div>@@ -366,7 &#43;366,7 @@ static void mv88w8618_eth_write(void *opaque, =
hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps mv88w8618_eth_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mv88w8618_eth_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mv88w8618_eth_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void eth_cleanup(NetClientState *nc)</div>
<div>@@ -612,7 &#43;612,7 @@ static void musicpal_lcd_write(void *opaque, h=
waddr offset,</div>
<div>&nbsp;static const MemoryRegionOps musicpal_lcd_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D musicpal_lcd_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D musicpal_lcd_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const GraphicHwOps musicpal_gfx_ops =3D {</div>
<div>@@ -753,7 &#43;753,7 @@ static void mv88w8618_pic_reset(DeviceState *d=
)</div>
<div>&nbsp;static const MemoryRegionOps mv88w8618_pic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mv88w8618_pic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mv88w8618_pic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void mv88w8618_pic_init(Object *obj)</div>
<div>@@ -917,7 &#43;917,7 @@ static void mv88w8618_pit_reset(DeviceState *d=
)</div>
<div>&nbsp;static const MemoryRegionOps mv88w8618_pit_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mv88w8618_pit_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mv88w8618_pit_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void mv88w8618_pit_init(Object *obj)</div>
<div>@@ -1021,7 &#43;1021,7 @@ static void mv88w8618_flashcfg_write(void *o=
paque, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps mv88w8618_flashcfg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mv88w8618_flashcfg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mv88w8618_flashcfg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void mv88w8618_flashcfg_init(Object *obj)</div>
<div>@@ -1094,7 &#43;1094,7 @@ static void musicpal_misc_write(void *opaque=
, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps musicpal_misc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D musicpal_misc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D musicpal_misc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void musicpal_misc_init(Object *obj)</div>
<div>@@ -1142,7 &#43;1142,7 @@ static void mv88w8618_wlan_write(void *opaqu=
e, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps mv88w8618_wlan_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mv88w8618_wlan_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3Dmv88w8618_wlan_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void mv88w8618_wlan_realize(DeviceState *dev, Error **err=
p)</div>
<div>@@ -1339,7 &#43;1339,7 @@ static void musicpal_gpio_write(void *opaque=
, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps musicpal_gpio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D musicpal_gpio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D musicpal_gpio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void musicpal_gpio_reset(DeviceState *d)</div>
<div>@@ -1609,11 &#43;1609,11 @@ static void musicpal_init(MachineState *ma=
chine)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(0)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, MP=
_UART1_BASE, 2, pic[MP_UART1_IRQ],</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; 1825000, serial_hd(0), DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; 1825000, serial_hd(0), MO_TE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(1)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, MP=
_UART2_BASE, 2, pic[MP_UART2_IRQ],</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; 1825000, serial_hd(1), DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; 1825000, serial_hd(1), MO_TE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Register flash */</div>
<div>diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c</div>
<div>index 28fbe27..174a000 100644</div>
<div>--- a/hw/arm/omap1.c</div>
<div>&#43;&#43;&#43; b/hw/arm/omap1.c</div>
<div>@@ -252,7 &#43;252,7 @@ static void omap_mpu_timer_write(void *opaque,=
 hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_mpu_timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_mpu_timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_mpu_timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_mpu_timer_reset(struct omap_mpu_timer_s *s)</di=
v>
<div>@@ -375,7 &#43;375,7 @@ static void omap_wd_timer_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_wd_timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_wd_timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_wd_timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_wd_timer_reset(struct omap_watchdog_timer_s *s)=
</div>
<div>@@ -487,7 &#43;487,7 @@ static void omap_os_timer_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_os_timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_os_timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_os_timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_os_timer_reset(struct omap_32khz_timer_s *s)</d=
iv>
<div>@@ -714,7 &#43;714,7 @@ static void omap_ulpd_pm_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_ulpd_pm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_ulpd_pm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_ulpd_pm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_ulpd_pm_reset(struct omap_mpu_state_s *mpu)</di=
v>
<div>@@ -948,7 &#43;948,7 @@ static void omap_pin_cfg_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_pin_cfg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_pin_cfg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_pin_cfg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_pin_cfg_reset(struct omap_mpu_state_s *mpu)</di=
v>
<div>@@ -1039,7 &#43;1039,7 @@ static void omap_id_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_id_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_id_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_id_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_id_init(MemoryRegion *memory, struct omap_mpu_s=
tate_s *mpu)</div>
<div>@@ -1128,7 &#43;1128,7 @@ static void omap_mpui_write(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_mpui_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_mpui_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_mpui_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_mpui_reset(struct omap_mpu_state_s *s)</div>
<div>@@ -1231,7 &#43;1231,7 @@ static void omap_tipb_bridge_write(void *opa=
que, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_tipb_bridge_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_tipb_bridge_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_tipb_bridge_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_tipb_bridge_reset(struct omap_tipb_bridge_s *s)=
</div>
<div>@@ -1336,7 &#43;1336,7 @@ static void omap_tcmi_write(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_tcmi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_tcmi_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_tcmi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_tcmi_reset(struct omap_mpu_state_s *mpu)</div>
<div>@@ -1431,7 &#43;1431,7 @@ static void omap_dpll_write(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_dpll_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_dpll_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_dpll_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_dpll_reset(struct dpll_ctl_s *s)</div>
<div>@@ -1743,7 &#43;1743,7 @@ static void omap_clkm_write(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_clkm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_clkm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_clkm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t omap_clkdsp_read(void *opaque, hwaddr addr,</div=
>
<div>@@ -1832,7 &#43;1832,7 @@ static void omap_clkdsp_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_clkdsp_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_clkdsp_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_clkdsp_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_clkm_reset(struct omap_mpu_state_s *s)</div>
<div>@@ -2077,7 &#43;2077,7 @@ static void omap_mpuio_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_mpuio_ops &nbsp;=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_mpuio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_mpuio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_mpuio_reset(struct omap_mpuio_s *s)</div>
<div>@@ -2283,7 &#43;2283,7 @@ static void omap_uwire_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_uwire_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_uwire_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_uwire_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_uwire_reset(struct omap_uwire_s *s)</div>
<div>@@ -2394,7 &#43;2394,7 @@ static void omap_pwl_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_pwl_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_pwl_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_pwl_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_pwl_reset(struct omap_pwl_s *s)</div>
<div>@@ -2512,7 &#43;2512,7 @@ static void omap_pwt_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_pwt_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3Domap_pwt_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_pwt_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_pwt_reset(struct omap_pwt_s *s)</div>
<div>@@ -2849,7 &#43;2849,7 @@ static void omap_rtc_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_rtc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_rtc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_rtc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_rtc_tick(void *opaque)</div>
<div>@@ -3447,7 &#43;3447,7 @@ static void omap_mcbsp_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_mcbsp_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_mcbsp_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_mcbsp_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_mcbsp_reset(struct omap_mcbsp_s *s)</div>
<div>@@ -3639,7 &#43;3639,7 @@ static void omap_lpg_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_lpg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_lpg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_lpg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_lpg_clk_update(void *opaque, int line, int on)<=
/div>
<div>@@ -3692,7 &#43;3692,7 @@ static void omap_mpui_io_write(void *opaque,=
 hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_mpui_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_mpui_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_mpui_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_setup_mpui_io(MemoryRegion *system_memory,</div=
>
<div>diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c</div>
<div>index 87ced7f..b1e1d3e 100644</div>
<div>--- a/hw/arm/omap2.c</div>
<div>&#43;&#43;&#43; b/hw/arm/omap2.c</div>
<div>@@ -593,7 &#43;593,7 @@ static void omap_eac_write(void *opaque, hwadd=
r addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_eac_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_eac_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_eac_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static struct omap_eac_s *omap_eac_init(struct omap_target_agent=
_s *ta,</div>
<div>@@ -744,7 &#43;744,7 @@ static void omap_sti_write(void *opaque, hwadd=
r addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_sti_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_sti_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_sti_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t omap_sti_fifo_read(void *opaque, hwaddr addr,</d=
iv>
<div>@@ -785,7 &#43;785,7 @@ static void omap_sti_fifo_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_sti_fifo_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_sti_fifo_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_sti_fifo_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static struct omap_sti_s *omap_sti_init(struct omap_target_agent=
_s *ta,</div>
<div>@@ -1724,7 &#43;1724,7 @@ static void omap_prcm_write(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_prcm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_prcm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_prcm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_prcm_reset(struct omap_prcm_s *s)</div>
<div>@@ -2124,7 &#43;2124,7 @@ static const MemoryRegionOps omap_sysctl_ops=
 =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_sysctl_writefn,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_sysctl_reset(struct omap_sysctl_s *s)</div>
<div>diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c</div>
<div>index cae78d0..5566407 100644</div>
<div>--- a/hw/arm/omap_sx1.c</div>
<div>&#43;&#43;&#43; b/hw/arm/omap_sx1.c</div>
<div>@@ -83,7 &#43;83,7 @@ static void static_write(void *opaque, hwaddr of=
fset,</div>
<div>&nbsp;static const MemoryRegionOps static_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D static_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D static_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;#define sdram_size<span class=3D"Apple-tab-span" style=3D"white-=
space:pre"> </span>
0x02000000</div>
<div>diff --git a/hw/arm/palm.c b/hw/arm/palm.c</div>
<div>index 9eb9612..78337c3 100644</div>
<div>--- a/hw/arm/palm.c</div>
<div>&#43;&#43;&#43; b/hw/arm/palm.c</div>
<div>@@ -53,7 &#43;53,7 @@ static const MemoryRegionOps static_ops =3D {</d=
iv>
<div>&nbsp; &nbsp; &nbsp;.write =3D static_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/* Palm Tunsgten|E support */</div>
<div>diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c</div>
<div>index e2e43ae..e9daa88 100644</div>
<div>--- a/hw/arm/pxa2xx.c</div>
<div>&#43;&#43;&#43; b/hw/arm/pxa2xx.c</div>
<div>@@ -149,7 &#43;149,7 @@ static void pxa2xx_pm_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_pm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_pm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_pm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_pxa2xx_pm =3D {</div>
<div>@@ -215,7 &#43;215,7 @@ static void pxa2xx_cm_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_cm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_cm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_cm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_pxa2xx_cm =3D {</div>
<div>@@ -439,7 &#43;439,7 @@ static void pxa2xx_mm_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_mm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_mm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_mm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_pxa2xx_mm =3D {</div>
<div>@@ -738,7 &#43;738,7 @@ static void pxa2xx_ssp_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_ssp_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_ssp_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_ssp_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pxa2xx_ssp_reset(DeviceState *d)</div>
<div>@@ -1105,7 &#43;1105,7 @@ static void pxa2xx_rtc_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_rtc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_rtc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_rtc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pxa2xx_rtc_init(Object *obj)</div>
<div>@@ -1426,7 &#43;1426,7 @@ static void pxa2xx_i2c_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_i2c_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_i2c_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_i2c_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_pxa2xx_i2c_slave =3D {</=
div>
<div>@@ -1684,7 &#43;1684,7 @@ static void pxa2xx_i2s_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_i2s_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_i2s_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_i2s_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_pxa2xx_i2s =3D {</div>
<div>@@ -1921,7 &#43;1921,7 @@ static void pxa2xx_fir_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_fir_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_fir_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_fir_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int pxa2xx_fir_is_empty(void *opaque)</div>
<div>@@ -2110,7 &#43;2110,7 @@ PXA2xxState *pxa270_init(MemoryRegion *addre=
ss_space,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address=
_space, pxa270_serial[i].io_base, 2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; qdev_get_gpio_in(s-&gt;pic, pxa270_serial[i].ir=
qn),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; 14857000 / 16, serial_hd(i),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; MO_TE);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -2234,7 &#43;2234,7 @@ PXA2xxState *pxa255_init(MemoryRegion *addre=
ss_space, unsigned int sdram_size)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address=
_space, pxa255_serial[i].io_base, 2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; qdev_get_gpio_in(s-&gt;pic, pxa255_serial[i].ir=
qn),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; 14745600 / 16, serial_hd(i),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; MO_TE);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c</div>
<div>index d1fc9cb..36ffb93 100644</div>
<div>--- a/hw/arm/pxa2xx_gpio.c</div>
<div>&#43;&#43;&#43; b/hw/arm/pxa2xx_gpio.c</div>
<div>@@ -256,7 &#43;256,7 @@ static void pxa2xx_gpio_write(void *opaque, hw=
addr offset,</div>
<div>&nbsp;static const MemoryRegionOps pxa_gpio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_gpio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_gpio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;DeviceState *pxa2xx_gpio_init(hwaddr base,</div>
<div>diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c</div>
<div>index 2f4b461..0d95605 100644</div>
<div>--- a/hw/arm/pxa2xx_pic.c</div>
<div>&#43;&#43;&#43; b/hw/arm/pxa2xx_pic.c</div>
<div>@@ -256,7 &#43;256,7 @@ static const ARMCPRegInfo pxa_pic_cp_reginfo[]=
 =3D {</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_pic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_pic_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_pic_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int pxa2xx_pic_post_load(void *opaque, int version_id)</d=
iv>
<div>diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c</div>
<div>index e96d5be..b5f8b76 100644</div>
<div>--- a/hw/arm/smmuv3.c</div>
<div>&#43;&#43;&#43; b/hw/arm/smmuv3.c</div>
<div>@@ -1349,7 &#43;1349,7 @@ static MemTxResult smmu_read_mmio(void *opaq=
ue, hwaddr offset, uint64_t *data,</div>
<div>&nbsp;static const MemoryRegionOps smmu_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D smmu_read_mmio,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D smmu_write_mmio,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c</div>
<div>index 723cf5d..17c0d7a 100644</div>
<div>--- a/hw/arm/spitz.c</div>
<div>&#43;&#43;&#43; b/hw/arm/spitz.c</div>
<div>@@ -145,7 &#43;145,7 @@ enum {</div>
<div>&nbsp;static const MemoryRegionOps sl_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sl_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sl_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void sl_flash_register(PXA2xxState *cpu, int size)</div>
<div>diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c</div>
<div>index 499035f..73f0614 100644</div>
<div>--- a/hw/arm/stellaris.c</div>
<div>&#43;&#43;&#43; b/hw/arm/stellaris.c</div>
<div>@@ -305,7 &#43;305,7 @@ static void gptm_write(void *opaque, hwaddr of=
fset,</div>
<div>&nbsp;static const MemoryRegionOps gptm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D gptm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D gptm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_stellaris_gptm =3D {</di=
v>
<div>@@ -637,7 &#43;637,7 @@ static void ssys_write(void *opaque, hwaddr of=
fset,</div>
<div>&nbsp;static const MemoryRegionOps ssys_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ssys_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ssys_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ssys_reset(void *opaque)</div>
<div>@@ -874,7 &#43;874,7 @@ static void stellaris_i2c_reset(stellaris_i2c_=
state *s)</div>
<div>&nbsp;static const MemoryRegionOps stellaris_i2c_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D stellaris_i2c_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D stellaris_i2c_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_stellaris_i2c =3D {</div=
>
<div>@@ -1144,7 &#43;1144,7 @@ static void stellaris_adc_write(void *opaque=
, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps stellaris_adc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D stellaris_adc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D stellaris_adc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_stellaris_adc =3D {</div=
>
<div>diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c</div>
<div>index fed51a8..f475ccf 100644</div>
<div>--- a/hw/arm/strongarm.c</div>
<div>&#43;&#43;&#43; b/hw/arm/strongarm.c</div>
<div>@@ -179,7 &#43;179,7 @@ static void strongarm_pic_mem_write(void *opaq=
ue, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps strongarm_pic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D strongarm_pic_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D strongarm_pic_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void strongarm_pic_initfn(Object *obj)</div>
<div>@@ -379,7 &#43;379,7 @@ static void strongarm_rtc_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps strongarm_rtc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D strongarm_rtc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D strongarm_rtc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void strongarm_rtc_init(Object *obj)</div>
<div>@@ -627,7 &#43;627,7 @@ static void strongarm_gpio_write(void *opaque,=
 hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps strongarm_gpio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D strongarm_gpio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D strongarm_gpio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static DeviceState *strongarm_gpio_init(hwaddr base,</div>
<div>@@ -820,7 &#43;820,7 @@ static void strongarm_ppc_write(void *opaque, =
hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps strongarm_ppc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D strongarm_ppc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D strongarm_ppc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void strongarm_ppc_init(Object *obj)</div>
<div>@@ -1225,7 &#43;1225,7 @@ static void strongarm_uart_write(void *opaqu=
e, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps strongarm_uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D strongarm_uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D strongarm_uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void strongarm_uart_init(Object *obj)</div>
<div>@@ -1514,7 &#43;1514,7 @@ static void strongarm_ssp_write(void *opaque=
, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps strongarm_ssp_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D strongarm_ssp_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D strongarm_ssp_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int strongarm_ssp_post_load(void *opaque, int version_id)=
</div>
<div>diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c</div>
<div>index e585711..7ed7ff2 100644</div>
<div>--- a/hw/arm/versatilepb.c</div>
<div>&#43;&#43;&#43; b/hw/arm/versatilepb.c</div>
<div>@@ -149,7 &#43;149,7 @@ static void vpb_sic_write(void *opaque, hwaddr=
 offset,</div>
<div>&nbsp;static const MemoryRegionOps vpb_sic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vpb_sic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vpb_sic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void vpb_sic_init(Object *obj)</div>
<div>diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c</div>
<div>index fb98da2..e115550 100644</div>
<div>--- a/hw/audio/ac97.c</div>
<div>&#43;&#43;&#43; b/hw/audio/ac97.c</div>
<div>@@ -1275,7 &#43;1275,7 @@ static const MemoryRegionOps ac97_io_nam_ops=
 =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t nabm_read(void *opaque, hwaddr addr, unsigned si=
ze)</div>
<div>@@ -1324,7 &#43;1324,7 @@ static const MemoryRegionOps ac97_io_nabm_op=
s =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ac97_on_reset (DeviceState *dev)</div>
<div>diff --git a/hw/audio/cs4231.c b/hw/audio/cs4231.c</div>
<div>index 8946648..3164561 100644</div>
<div>--- a/hw/audio/cs4231.c</div>
<div>&#43;&#43;&#43; b/hw/audio/cs4231.c</div>
<div>@@ -132,7 &#43;132,7 @@ static void cs_mem_write(void *opaque, hwaddr =
addr,</div>
<div>&nbsp;static const MemoryRegionOps cs_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cs_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cs_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_cs4231 =3D {</div>
<div>diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c</div>
<div>index 260c142..b94db3b 100644</div>
<div>--- a/hw/audio/es1370.c</div>
<div>&#43;&#43;&#43; b/hw/audio/es1370.c</div>
<div>@@ -774,7 &#43;774,7 @@ static const MemoryRegionOps es1370_io_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_es1370_channel =3D {</di=
v>
<div>diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c</div>
<div>index b78baac..1dbd741 100644</div>
<div>--- a/hw/audio/intel-hda.c</div>
<div>&#43;&#43;&#43; b/hw/audio/intel-hda.c</div>
<div>@@ -1068,7 &#43;1068,7 @@ static const MemoryRegionOps intel_hda_mmio_=
ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/* -------------------------------------------------------------=
-------- */</div>
<div>diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c</=
div>
<div>index a79e0b1..359e926 100644</div>
<div>--- a/hw/audio/marvell_88w8618.c</div>
<div>&#43;&#43;&#43; b/hw/audio/marvell_88w8618.c</div>
<div>@@ -240,7 &#43;240,7 @@ static void mv88w8618_audio_reset(DeviceState =
*d)</div>
<div>&nbsp;static const MemoryRegionOps mv88w8618_audio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mv88w8618_audio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mv88w8618_audio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void mv88w8618_audio_init(Object *obj)</div>
<div>diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c</di=
v>
<div>index 56feca2..9982e88 100644</div>
<div>--- a/hw/audio/milkymist-ac97.c</div>
<div>&#43;&#43;&#43; b/hw/audio/milkymist-ac97.c</div>
<div>@@ -176,7 &#43;176,7 @@ static const MemoryRegionOps ac97_mmio_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ac97_in_cb(void *opaque, int avail_b)</div>
<div>diff --git a/hw/audio/pl041.c b/hw/audio/pl041.c</div>
<div>index b59a4f8..bf09ab1 100644</div>
<div>--- a/hw/audio/pl041.c</div>
<div>&#43;&#43;&#43; b/hw/audio/pl041.c</div>
<div>@@ -519,7 &#43;519,7 @@ static void pl041_device_reset(DeviceState *d)=
</div>
<div>&nbsp;static const MemoryRegionOps pl041_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl041_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl041_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl041_init(Object *obj)</div>
<div>diff --git a/hw/block/fdc.c b/hw/block/fdc.c</div>
<div>index 9b24cb9..f87fbac 100644</div>
<div>--- a/hw/block/fdc.c</div>
<div>&#43;&#43;&#43; b/hw/block/fdc.c</div>
<div>@@ -981,13 &#43;981,13 @@ static void fdctrl_write_mem (void *opaque, =
hwaddr reg,</div>
<div>&nbsp;static const MemoryRegionOps fdctrl_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D fdctrl_read_mem,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D fdctrl_write_mem,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps fdctrl_mem_strict_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D fdctrl_read_mem,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D fdctrl_write_mem,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/block/nvme.c b/hw/block/nvme.c</div>
<div>index 36d6a8b..7d71e59 100644</div>
<div>--- a/hw/block/nvme.c</div>
<div>&#43;&#43;&#43; b/hw/block/nvme.c</div>
<div>@@ -1272,7 &#43;1272,7 @@ static void nvme_mmio_write(void *opaque, hw=
addr addr, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps nvme_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D nvme_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D nvme_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -1295,7 &#43;1295,7 @@ static uint64_t nvme_cmb_read(void *opaque, =
hwaddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps nvme_cmb_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D nvme_cmb_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D nvme_cmb_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>diff --git a/hw/block/onenand.c b/hw/block/onenand.c</div>
<div>index 66152e7..c987c7c 100644</div>
<div>--- a/hw/block/onenand.c</div>
<div>&#43;&#43;&#43; b/hw/block/onenand.c</div>
<div>@@ -769,7 &#43;769,7 @@ static void onenand_write(void *opaque, hwaddr=
 addr,</div>
<div>&nbsp;static const MemoryRegionOps onenand_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D onenand_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D onenand_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void onenand_realize(DeviceState *dev, Error **errp)</div=
>
<div>diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c</div>
<div>index a1ec1fa..aa51958 100644</div>
<div>--- a/hw/block/pflash_cfi01.c</div>
<div>&#43;&#43;&#43; b/hw/block/pflash_cfi01.c</div>
<div>@@ -694,7 &#43;694,7 @@ static MemTxResult pflash_mem_write_with_attrs=
(void *opaque, hwaddr addr, uint64</div>
<div>&nbsp;static const MemoryRegionOps pflash_cfi01_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D pflash_mem_read_with_attrs,</=
div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D pflash_mem_write_with_attrs,=
</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pflash_cfi01_realize(DeviceState *dev, Error **errp)=
</div>
<div>diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c</div>
<div>index 42886f6..80c4091 100644</div>
<div>--- a/hw/block/pflash_cfi02.c</div>
<div>&#43;&#43;&#43; b/hw/block/pflash_cfi02.c</div>
<div>@@ -713,7 &#43;713,7 @@ static const MemoryRegionOps pflash_cfi02_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pflash_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pflash_cfi02_realize(DeviceState *dev, Error **errp)=
</div>
<div>diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c</div>
<div>index 94679d2..f3c2947 100644</div>
<div>--- a/hw/char/bcm2835_aux.c</div>
<div>&#43;&#43;&#43; b/hw/char/bcm2835_aux.c</div>
<div>@@ -244,7 &#43;244,7 @@ static void bcm2835_aux_receive(void *opaque, =
const uint8_t *buf, int size)</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_aux_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_aux_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_aux_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c</div>
<div>index 6c7b904..bcb2d37 100644</div>
<div>--- a/hw/char/cadence_uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/cadence_uart.c</div>
<div>@@ -457,7 &#43;457,7 @@ static uint64_t uart_read(void *opaque, hwaddr=
 offset,</div>
<div>&nbsp;static const MemoryRegionOps uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void cadence_uart_reset(DeviceState *dev)</div>
<div>diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c</div>
<div>index 606c9cc..e3ef1eb 100644</div>
<div>--- a/hw/char/cmsdk-apb-uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/cmsdk-apb-uart.c</div>
<div>@@ -298,7 &#43;298,7 @@ static void uart_write(void *opaque, hwaddr of=
fset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void cmsdk_apb_uart_reset(DeviceState *dev)</div>
<div>diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c</div>
<div>index e1b6d11..1f1cfc5 100644</div>
<div>--- a/hw/char/debugcon.c</div>
<div>&#43;&#43;&#43; b/hw/char/debugcon.c</div>
<div>@@ -82,7 &#43;82,7 @@ static const MemoryRegionOps debugcon_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp;.write =3D debugcon_ioport_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 1,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void debugcon_realize_core(DebugconState *s, Error **errp=
)</div>
<div>diff --git a/hw/char/digic-uart.c b/hw/char/digic-uart.c</div>
<div>index e4ac843..863f467 100644</div>
<div>--- a/hw/char/digic-uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/digic-uart.c</div>
<div>@@ -110,7 &#43;110,7 @@ static const MemoryRegionOps uart_mmio_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int uart_can_rx(void *opaque)</div>
<div>diff --git a/hw/char/escc.c b/hw/char/escc.c</div>
<div>index 36182d9..0868efa 100644</div>
<div>--- a/hw/char/escc.c</div>
<div>&#43;&#43;&#43; b/hw/char/escc.c</div>
<div>@@ -574,7 &#43;574,7 @@ static uint64_t escc_mem_read(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps escc_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D escc_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D escc_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c</div>
<div>index cda687b..bc94aea 100644</div>
<div>--- a/hw/char/etraxfs_ser.c</div>
<div>&#43;&#43;&#43; b/hw/char/etraxfs_ser.c</div>
<div>@@ -155,7 &#43;155,7 @@ ser_write(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps ser_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ser_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ser_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c</di=
v>
<div>index c5700ee..3497e5b 100644</div>
<div>--- a/hw/char/exynos4210_uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/exynos4210_uart.c</div>
<div>@@ -481,7 &#43;481,7 @@ static uint64_t exynos4210_uart_read(void *opa=
que, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps exynos4210_uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D exynos4210_uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D exynos4210_uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.unaligned =3D false</div>
<div>diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c</div>
<div>index 119fc84..c82e474 100644</div>
<div>--- a/hw/char/grlib_apbuart.c</div>
<div>&#43;&#43;&#43; b/hw/char/grlib_apbuart.c</div>
<div>@@ -237,7 &#43;237,7 @@ static void grlib_apbuart_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps grlib_apbuart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write &nbsp; &nbsp; &nbsp;=3D grlib_apbuart_write=
,</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp; &nbsp; &nbsp; =3D grlib_apbuart_read,=
</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void grlib_apbuart_realize(DeviceState *dev, Error **errp=
)</div>
<div>diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c</div>
<div>index 7c66551..0da6c82 100644</div>
<div>--- a/hw/char/imx_serial.c</div>
<div>&#43;&#43;&#43; b/hw/char/imx_serial.c</div>
<div>@@ -332,7 &#43;332,7 @@ static void imx_event(void *opaque, int event)=
</div>
<div>&nbsp;static const struct MemoryRegionOps imx_serial_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx_serial_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_serial_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void imx_serial_realize(DeviceState *dev, Error **errp)</=
div>
<div>diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c</div>
<div>index 2fe5f60..5ec5dc2 100644</div>
<div>--- a/hw/char/lm32_uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/lm32_uart.c</div>
<div>@@ -205,7 &#43;205,7 @@ static void uart_write(void *opaque, hwaddr ad=
dr,</div>
<div>&nbsp;static const MemoryRegionOps uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c</div>
<div>index 7b06110..9ea74de 100644</div>
<div>--- a/hw/char/mcf_uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/mcf_uart.c</div>
<div>@@ -286,7 &#43;286,7 @@ static void mcf_uart_receive(void *opaque, con=
st uint8_t *buf, int size)</div>
<div>&nbsp;static const MemoryRegionOps mcf_uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mcf_uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mcf_uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void mcf_uart_instance_init(Object *obj)</div>
<div>diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c</div>
<div>index bdb8282..38d12b7 100644</div>
<div>--- a/hw/char/milkymist-uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/milkymist-uart.c</div>
<div>@@ -156,7 &#43;156,7 @@ static const MemoryRegionOps uart_mmio_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void uart_rx(void *opaque, const uint8_t *buf, int size)<=
/div>
<div>diff --git a/hw/char/nrf51_uart.c b/hw/char/nrf51_uart.c</div>
<div>index c90b491..6a72813 100644</div>
<div>--- a/hw/char/nrf51_uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/nrf51_uart.c</div>
<div>@@ -189,7 &#43;189,7 @@ static void uart_write(void *opaque, hwaddr ad=
dr,</div>
<div>&nbsp;static const MemoryRegionOps uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D &nbsp;uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void nrf51_uart_reset(DeviceState *dev)</div>
<div>diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c</div>
<div>index b3bb1cf..2de1abc 100644</div>
<div>--- a/hw/char/omap_uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/omap_uart.c</div>
<div>@@ -64,7 &#43;64,7 @@ struct omap_uart_s *omap_uart_init(hwaddr base,<=
/div>
<div>&nbsp; &nbsp; &nbsp;s-&gt;serial =3D serial_mm_init(get_system_memory(=
), base, 2, irq,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; omap_clk_getrate(fclk)/16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; chr ?: qemu_chr_new(label, &quot;=
null&quot;, NULL),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MO_TE);</div>
<div>&nbsp; &nbsp; &nbsp;return s;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -156,7 &#43;156,7 @@ static void omap_uart_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;struct omap_uart_s *omap2_uart_init(MemoryRegion *sysmem,</div>
<div>@@ -184,5 &#43;184,5 @@ void omap_uart_attach(struct omap_uart_s *s, C=
hardev *chr)</div>
<div>&nbsp; &nbsp; &nbsp;s-&gt;serial =3D serial_mm_init(get_system_memory(=
), s-&gt;base, 2, s-&gt;irq,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; omap_clk_getrate(s-&gt;fclk) / 16=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; chr ?: qemu_chr_new(&quot;null&qu=
ot;, &quot;null&quot;, NULL),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MO_TE);</div>
<div>&nbsp;}</div>
<div>diff --git a/hw/char/parallel.c b/hw/char/parallel.c</div>
<div>index 1cd4c54..32552db 100644</div>
<div>--- a/hw/char/parallel.c</div>
<div>&#43;&#43;&#43; b/hw/char/parallel.c</div>
<div>@@ -588,7 &#43;588,7 @@ static const MemoryRegionOps parallel_mm_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D parallel_mm_writefn,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/* If fd is zero, it means that the parallel device uses the con=
sole */</div>
<div>diff --git a/hw/char/pl011.c b/hw/char/pl011.c</div>
<div>index 5fb95d2..96bd35d 100644</div>
<div>--- a/hw/char/pl011.c</div>
<div>&#43;&#43;&#43; b/hw/char/pl011.c</div>
<div>@@ -287,7 &#43;287,7 @@ static void pl011_event(void *opaque, int even=
t)</div>
<div>&nbsp;static const MemoryRegionOps pl011_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl011_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl011_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_pl011 =3D {</div>
<div>diff --git a/hw/char/serial.c b/hw/char/serial.c</div>
<div>index 521c76b..5d6a329 100644</div>
<div>--- a/hw/char/serial.c</div>
<div>&#43;&#43;&#43; b/hw/char/serial.c</div>
<div>@@ -973,7 &#43;973,7 @@ const MemoryRegionOps serial_io_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;SerialState *serial_init(int base, qemu_irq irq, int baudbase,</=
div>
<div>@@ -1016,14 &#43;1016,14 @@ static const MemoryRegionOps serial_mm_ops=
[2] =3D {</div>
<div>&nbsp; &nbsp; &nbsp;[0] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D serial_mm_read,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write =3D serial_mm_write,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>&nbsp; &nbsp; &nbsp;[1] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D serial_mm_read,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write =3D serial_mm_write,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>@@ -1032,7 &#43;1032,7 @@ static const MemoryRegionOps serial_mm_ops[2=
] =3D {</div>
<div>&nbsp;SerialState *serial_mm_init(MemoryRegion *address_space,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr base, int it_shift,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_irq irq, int baudbase,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;Chardev *chr, enum device_endian end)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Chardev *chr, MemOp end)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;SerialState *s;</div>
<div>&nbsp;</div>
<div>@@ -1047,7 &#43;1047,7 @@ SerialState *serial_mm_init(MemoryRegion *ad=
dress_space,</div>
<div>&nbsp; &nbsp; &nbsp;vmstate_register(NULL, base, &amp;vmstate_serial, =
s);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;memory_region_init_io(&amp;s-&gt;io, NULL,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;&amp;serial_mm_ops[end =3D=3D DEVICE_BIG_ENDIAN],</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;&amp;serial_mm_ops[end =3D=3D MO_BE],</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;s, &quot;serial&quot;, 8 &lt;&lt; it_shift);</di=
v>
<div>&nbsp; &nbsp; &nbsp;memory_region_add_subregion(address_space, base, &=
amp;s-&gt;io);</div>
<div>&nbsp; &nbsp; &nbsp;return s;</div>
<div>diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c</div>
<div>index 67740b7..f789c06 100644</div>
<div>--- a/hw/char/sh_serial.c</div>
<div>&#43;&#43;&#43; b/hw/char/sh_serial.c</div>
<div>@@ -367,7 &#43;367,7 @@ static void sh_serial_event(void *opaque, int =
event)</div>
<div>&nbsp;static const MemoryRegionOps sh_serial_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sh_serial_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sh_serial_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void sh_serial_init(MemoryRegion *sysmem,</div>
<div>diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c</di=
v>
<div>index 40c365b..65fd733 100644</div>
<div>--- a/hw/char/stm32f2xx_usart.c</div>
<div>&#43;&#43;&#43; b/hw/char/stm32f2xx_usart.c</div>
<div>@@ -187,7 &#43;187,7 @@ static void stm32f2xx_usart_write(void *opaque=
, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps stm32f2xx_usart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D stm32f2xx_usart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D stm32f2xx_usart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static Property stm32f2xx_usart_properties[] =3D {</div>
<div>diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c</di=
v>
<div>index 880962a..48f2b85 100644</div>
<div>--- a/hw/char/xilinx_uartlite.c</div>
<div>&#43;&#43;&#43; b/hw/char/xilinx_uartlite.c</div>
<div>@@ -166,7 &#43;166,7 @@ uart_write(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/core/empty_slot.c b/hw/core/empty_slot.c</div>
<div>index c694532..245a333 100644</div>
<div>--- a/hw/core/empty_slot.c</div>
<div>&#43;&#43;&#43; b/hw/core/empty_slot.c</div>
<div>@@ -50,7 &#43;50,7 @@ static void empty_slot_write(void *opaque, hwadd=
r addr,</div>
<div>&nbsp;static const MemoryRegionOps empty_slot_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D empty_slot_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D empty_slot_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void empty_slot_init(hwaddr addr, uint64_t slot_size)</div>
<div>diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c</div>
<div>index 940c7dd..a98ffd3 100644</div>
<div>--- a/hw/cris/axis_dev88.c</div>
<div>&#43;&#43;&#43; b/hw/cris/axis_dev88.c</div>
<div>@@ -83,7 &#43;83,7 @@ nand_write(void *opaque, hwaddr addr, uint64_t v=
alue,</div>
<div>&nbsp;static const MemoryRegionOps nand_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D nand_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D nand_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;struct tempsensor_t</div>
<div>@@ -235,7 &#43;235,7 @@ static void gpio_write(void *opaque, hwaddr ad=
dr, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps gpio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D gpio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D gpio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/display/ati.c b/hw/display/ati.c</div>
<div>index a747c4c..ef37e8d 100644</div>
<div>--- a/hw/display/ati.c</div>
<div>&#43;&#43;&#43; b/hw/display/ati.c</div>
<div>@@ -810,7 &#43;810,7 @@ static void ati_mm_write(void *opaque, hwaddr =
addr,</div>
<div>&nbsp;static const MemoryRegionOps ati_mm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ati_mm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ati_mm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ati_vga_realize(PCIDevice *dev, Error **errp)</div>
<div>diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c</div>
<div>index 2311ec7..78dc827 100644</div>
<div>--- a/hw/display/bcm2835_fb.c</div>
<div>&#43;&#43;&#43; b/hw/display/bcm2835_fb.c</div>
<div>@@ -340,7 &#43;340,7 @@ static void bcm2835_fb_write(void *opaque, hwa=
ddr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_fb_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_fb_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_fb_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c</=
div>
<div>index 8e83b51..a5ae83b 100644</div>
<div>--- a/hw/display/bochs-display.c</div>
<div>&#43;&#43;&#43; b/hw/display/bochs-display.c</div>
<div>@@ -106,7 &#43;106,7 @@ static const MemoryRegionOps bochs_display_vbe=
_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 2,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t bochs_display_qext_read(void *ptr, hwaddr addr,<=
/div>
<div>@@ -147,7 &#43;147,7 @@ static const MemoryRegionOps bochs_display_qex=
t_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bochs_display_qext_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int bochs_display_get_mode(BochsDisplayState *s,</div>
<div>diff --git a/hw/display/cg3.c b/hw/display/cg3.c</div>
<div>index a7340dc..dade07d 100644</div>
<div>--- a/hw/display/cg3.c</div>
<div>&#43;&#43;&#43; b/hw/display/cg3.c</div>
<div>@@ -267,7 &#43;267,7 @@ static void cg3_reg_write(void *opaque, hwaddr=
 addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps cg3_reg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cg3_reg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cg3_reg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c</div>
<div>index 2e4911a..03123ba 100644</div>
<div>--- a/hw/display/cirrus_vga.c</div>
<div>&#43;&#43;&#43; b/hw/display/cirrus_vga.c</div>
<div>@@ -2123,7 &#43;2123,7 @@ static void cirrus_vga_mem_write(void *opaqu=
e,</div>
<div>&nbsp;static const MemoryRegionOps cirrus_vga_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cirrus_vga_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cirrus_vga_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -2436,7 &#43;2436,7 @@ static void cirrus_linear_bitblt_write(void =
*opaque,</div>
<div>&nbsp;static const MemoryRegionOps cirrus_linear_bitblt_io_ops =3D {</=
div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cirrus_linear_bitblt_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cirrus_linear_bitblt_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -2736,7 &#43;2736,7 @@ static void cirrus_mmio_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps cirrus_mmio_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cirrus_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cirrus_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -2847,7 &#43;2847,7 @@ static void cirrus_reset(void *opaque)</div>
<div>&nbsp;static const MemoryRegionOps cirrus_linear_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cirrus_linear_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cirrus_linear_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -2857,7 &#43;2857,7 @@ static const MemoryRegionOps cirrus_linear_i=
o_ops =3D {</div>
<div>&nbsp;static const MemoryRegionOps cirrus_vga_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cirrus_vga_ioport_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cirrus_vga_ioport_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/display/edid-region.c b/hw/display/edid-region.c</div>
<div>index d0d31ba..094b200 100644</div>
<div>--- a/hw/display/edid-region.c</div>
<div>&#43;&#43;&#43; b/hw/display/edid-region.c</div>
<div>@@ -21,7 &#43;21,7 @@ static const MemoryRegionOps edid_region_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 1,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void qemu_edid_region_io(MemoryRegion *region, Object *owner,</d=
iv>
<div>diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd=
.c</div>
<div>index 61f7408..cdd2977 100644</div>
<div>--- a/hw/display/exynos4210_fimd.c</div>
<div>&#43;&#43;&#43; b/hw/display/exynos4210_fimd.c</div>
<div>@@ -1818,7 &#43;1818,7 @@ static const MemoryRegionOps exynos4210_fimd=
_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.unaligned =3D false</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int exynos4210_fimd_load(void *opaque, int version_id)</d=
iv>
<div>diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c</div>
<div>index 1774b44..3b02d3f 100644</div>
<div>--- a/hw/display/g364fb.c</div>
<div>&#43;&#43;&#43; b/hw/display/g364fb.c</div>
<div>@@ -428,7 &#43;428,7 @@ static void g364fb_ctrl_write(void *opaque,</d=
iv>
<div>&nbsp;static const MemoryRegionOps g364fb_ctrl_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D g364fb_ctrl_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D g364fb_ctrl_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c</div>
<div>index 783189e..6f3e626 100644</div>
<div>--- a/hw/display/jazz_led.c</div>
<div>&#43;&#43;&#43; b/hw/display/jazz_led.c</div>
<div>@@ -72,7 &#43;72,7 @@ static void jazz_led_write(void *opaque, hwaddr =
addr,</div>
<div>&nbsp;static const MemoryRegionOps led_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D jazz_led_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D jazz_led_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 1,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c=
</div>
<div>index e1ed018..ed39a14 100644</div>
<div>--- a/hw/display/milkymist-tmu2.c</div>
<div>&#43;&#43;&#43; b/hw/display/milkymist-tmu2.c</div>
<div>@@ -434,7 &#43;434,7 @@ static const MemoryRegionOps tmu2_mmio_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void milkymist_tmu2_reset(DeviceState *d)</div>
<div>diff --git a/hw/display/milkymist-vgafb.c b/hw/display/milkymist-vgafb=
.c</div>
<div>index dce1dd7..1c7fc17 100644</div>
<div>--- a/hw/display/milkymist-vgafb.c</div>
<div>&#43;&#43;&#43; b/hw/display/milkymist-vgafb.c</div>
<div>@@ -269,7 &#43;269,7 @@ static const MemoryRegionOps vgafb_mmio_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void milkymist_vgafb_reset(DeviceState *d)</div>
<div>diff --git a/hw/display/omap_dss.c b/hw/display/omap_dss.c</div>
<div>index 601f178..cb6b882 100644</div>
<div>--- a/hw/display/omap_dss.c</div>
<div>&#43;&#43;&#43; b/hw/display/omap_dss.c</div>
<div>@@ -245,7 &#43;245,7 @@ static void omap_diss_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_diss_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_diss_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_diss_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t omap_disc_read(void *opaque, hwaddr addr,</div>
<div>@@ -589,7 &#43;589,7 @@ static void omap_disc_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_disc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_disc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_disc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_rfbi_transfer_stop(struct omap_dss_s *s)</div>
<div>@@ -865,7 &#43;865,7 @@ static void omap_rfbi_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_rfbi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_rfbi_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_rfbi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t omap_venc_read(void *opaque, hwaddr addr,</div>
<div>@@ -988,7 &#43;988,7 @@ static void omap_venc_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_venc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_venc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_venc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t omap_im3_read(void *opaque, hwaddr addr,</div>
<div>@@ -1042,7 &#43;1042,7 @@ static void omap_im3_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_im3_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_im3_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_im3_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;struct omap_dss_s *omap_dss_init(struct omap_target_agent_s *ta,=
</div>
<div>diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c</div>
<div>index 07a5eff..d5d316f 100644</div>
<div>--- a/hw/display/omap_lcdc.c</div>
<div>&#43;&#43;&#43; b/hw/display/omap_lcdc.c</div>
<div>@@ -330,7 &#43;330,7 @@ static void omap_lcdc_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_lcdc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_lcdc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_lcdc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void omap_lcdc_reset(struct omap_lcd_panel_s *s)</div>
<div>diff --git a/hw/display/pl110.c b/hw/display/pl110.c</div>
<div>index d0c6317..49fae37 100644</div>
<div>--- a/hw/display/pl110.c</div>
<div>&#43;&#43;&#43; b/hw/display/pl110.c</div>
<div>@@ -471,7 &#43;471,7 @@ static void pl110_write(void *opaque, hwaddr o=
ffset,</div>
<div>&nbsp;static const MemoryRegionOps pl110_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl110_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl110_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl110_mux_ctrl_set(void *opaque, int line, int level=
)</div>
<div>diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c</div>
<div>index b83f807..fc2a3c4 100644</div>
<div>--- a/hw/display/pxa2xx_lcd.c</div>
<div>&#43;&#43;&#43; b/hw/display/pxa2xx_lcd.c</div>
<div>@@ -567,7 &#43;567,7 @@ static void pxa2xx_lcdc_write(void *opaque, hw=
addr offset,</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_lcdc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_lcdc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_lcdc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/* Load new palette for a given DMA channel, convert to internal=
 format */</div>
<div>diff --git a/hw/display/sm501.c b/hw/display/sm501.c</div>
<div>index 5918f59..b147d98 100644</div>
<div>--- a/hw/display/sm501.c</div>
<div>&#43;&#43;&#43; b/hw/display/sm501.c</div>
<div>@@ -967,7 &#43;967,7 @@ static const MemoryRegionOps sm501_system_conf=
ig_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t sm501_i2c_read(void *opaque, hwaddr addr, unsign=
ed size)</div>
<div>@@ -1070,7 &#43;1070,7 @@ static const MemoryRegionOps sm501_i2c_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint32_t sm501_palette_read(void *opaque, hwaddr addr)</d=
iv>
<div>@@ -1358,7 &#43;1358,7 @@ static const MemoryRegionOps sm501_disp_ctrl=
_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,<=
/div>
<div>@@ -1533,7 &#43;1533,7 @@ static const MemoryRegionOps sm501_2d_engine=
_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/* draw line functions for all console modes */</div>
<div>@@ -1961,7 &#43;1961,7 @@ static void sm501_realize_sysbus(DeviceState=
 *dev, Error **errp)</div>
<div>&nbsp; &nbsp; &nbsp;if (s-&gt;chr_state) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(&amp;s-&gt;state.mmio=
_region, SM501_UART0, 2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; NULL, /* TODO : chain irq to IRL */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; 115200, s-&gt;chr_state, DEVICE_LITTLE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; 115200, s-&gt;chr_state, MO_LE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c</div>
<div>index 6bc3360..1374c59 100644</div>
<div>--- a/hw/display/tc6393xb.c</div>
<div>&#43;&#43;&#43; b/hw/display/tc6393xb.c</div>
<div>@@ -547,7 &#43;547,7 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sys=
mem, uint32_t base, qemu_irq irq)</div>
<div>&nbsp; &nbsp; &nbsp;static const MemoryRegionOps tc6393xb_ops =3D {</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D tc6393xb_readb,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write =3D tc6393xb_writeb,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1=
,</div>
<div>diff --git a/hw/display/tcx.c b/hw/display/tcx.c</div>
<div>index cdabcbc..3a841dc 100644</div>
<div>--- a/hw/display/tcx.c</div>
<div>&#43;&#43;&#43; b/hw/display/tcx.c</div>
<div>@@ -462,7 &#43;462,7 @@ static void tcx_dac_writel(void *opaque, hwadd=
r addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps tcx_dac_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tcx_dac_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tcx_dac_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -543,7 &#43;543,7 @@ static void tcx_rstip_writel(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps tcx_stip_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tcx_stip_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tcx_stip_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -553,7 &#43;553,7 @@ static const MemoryRegionOps tcx_stip_ops =3D =
{</div>
<div>&nbsp;static const MemoryRegionOps tcx_rstip_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tcx_stip_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tcx_rstip_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -635,7 &#43;635,7 @@ static void tcx_rblit_writel(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps tcx_blit_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tcx_blit_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tcx_blit_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -645,7 &#43;645,7 @@ static const MemoryRegionOps tcx_blit_ops =3D =
{</div>
<div>&nbsp;static const MemoryRegionOps tcx_rblit_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tcx_blit_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tcx_rblit_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -707,7 &#43;707,7 @@ static void tcx_thc_writel(void *opaque, hwadd=
r addr,</div>
<div>&nbsp;static const MemoryRegionOps tcx_thc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tcx_thc_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tcx_thc_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -729,7 &#43;729,7 @@ static void tcx_dummy_writel(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps tcx_dummy_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tcx_dummy_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tcx_dummy_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c</div>
<div>index 215e649..58e299b 100644</div>
<div>--- a/hw/display/vga-isa-mm.c</div>
<div>&#43;&#43;&#43; b/hw/display/vga-isa-mm.c</div>
<div>@@ -60,7 &#43;60,7 @@ static const MemoryRegionOps vga_mm_ctrl_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void vga_mm_init(ISAVGAMMState *s, hwaddr vram_base,</div=
>
<div>diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c</div>
<div>index dedac5d..c893968 100644</div>
<div>--- a/hw/display/vga-pci.c</div>
<div>&#43;&#43;&#43; b/hw/display/vga-pci.c</div>
<div>@@ -110,7 &#43;110,7 @@ static const MemoryRegionOps pci_vga_ioport_op=
s =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 2,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t pci_vga_bochs_read(void *ptr, hwaddr addr,</div>
<div>@@ -140,7 &#43;140,7 @@ static const MemoryRegionOps pci_vga_bochs_ops=
 =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 2,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t pci_vga_qext_read(void *ptr, hwaddr addr, unsign=
ed size)</div>
<div>@@ -194,7 &#43;194,7 @@ static const MemoryRegionOps pci_vga_qext_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_vga_qext_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void pci_std_vga_mmio_region_init(VGACommonState *s,</div>
<div>diff --git a/hw/display/vga.c b/hw/display/vga.c</div>
<div>index 910a23c..046bbfa 100644</div>
<div>--- a/hw/display/vga.c</div>
<div>&#43;&#43;&#43; b/hw/display/vga.c</div>
<div>@@ -2062,7 &#43;2062,7 @@ static void vga_mem_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;const MemoryRegionOps vga_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vga_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vga_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c</div>
<div>index 249a179..e534a33 100644</div>
<div>--- a/hw/display/vmware_vga.c</div>
<div>&#43;&#43;&#43; b/hw/display/vmware_vga.c</div>
<div>@@ -1280,7 &#43;1280,7 @@ static void vmsvga_io_write(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps vmsvga_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vmsvga_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vmsvga_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c</div>
<div>index cc5b650..9fbfc0b 100644</div>
<div>--- a/hw/display/xlnx_dp.c</div>
<div>&#43;&#43;&#43; b/hw/display/xlnx_dp.c</div>
<div>@@ -301,7 &#43;301,7 @@ static void xlnx_dp_audio_write(void *opaque, =
hwaddr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps audio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xlnx_dp_audio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xlnx_dp_audio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static inline uint32_t xlnx_dp_audio_get_volume(XlnxDPState *s,<=
/div>
<div>@@ -876,7 &#43;876,7 @@ static void xlnx_dp_write(void *opaque, hwaddr=
 offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps dp_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xlnx_dp_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xlnx_dp_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -991,7 &#43;991,7 @@ static uint64_t xlnx_dp_vblend_read(void *opaq=
ue, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps vblend_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xlnx_dp_vblend_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xlnx_dp_vblend_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1104,7 &#43;1104,7 @@ static uint64_t xlnx_dp_avbufm_read(void *op=
aque, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps avbufm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xlnx_dp_avbufm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xlnx_dp_avbufm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c</div>
<div>index 907d25c..7844b61 100644</div>
<div>--- a/hw/dma/bcm2835_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/bcm2835_dma.c</div>
<div>@@ -288,7 &#43;288,7 @@ static void bcm2835_dma15_write(void *opaque, =
hwaddr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_dma0_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_dma0_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_dma0_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>@@ -296,7 &#43;296,7 @@ static const MemoryRegionOps bcm2835_dma0_ops =
=3D {</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_dma15_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_dma15_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_dma15_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c</div>
<div>index df3ba09..61f7200 100644</div>
<div>--- a/hw/dma/etraxfs_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/etraxfs_dma.c</div>
<div>@@ -695,10 &#43;695,10 @@ dma_write(void *opaque, hwaddr addr,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps dma_ops =3D {</div>
<div>-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>.rea=
d =3D dma_read,</div>
<div>-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>.wri=
te =3D dma_write,</div>
<div>-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>.end=
ianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>.val=
id =3D {</div>
<div>&#43; &nbsp; &nbsp;.read =3D dma_read,</div>
<div>&#43; &nbsp; &nbsp;.write =3D dma_write,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&#43; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.min_access_size =3D 1,</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.max_access_size =3D 4</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>}</div>
<div>diff --git a/hw/dma/i8257.c b/hw/dma/i8257.c</div>
<div>index 30a3442..cf71c47 100644</div>
<div>--- a/hw/dma/i8257.c</div>
<div>&#43;&#43;&#43; b/hw/dma/i8257.c</div>
<div>@@ -475,7 &#43;475,7 @@ static int i8257_phony_handler(void *opaque, i=
nt nchan, int dma_pos,</div>
<div>&nbsp;static const MemoryRegionOps channel_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D i8257_read_chan,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D i8257_write_chan,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -499,7 &#43;499,7 @@ static const MemoryRegionPortio pageh_portio_l=
ist[] =3D {</div>
<div>&nbsp;static const MemoryRegionOps cont_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D i8257_read_cont,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D i8257_write_cont,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c</div>
<div>index eab83c5..16cc7df 100644</div>
<div>--- a/hw/dma/omap_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/omap_dma.c</div>
<div>@@ -1552,7 &#43;1552,7 @@ static void omap_dma_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_dma_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_dma_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_dma_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_dma_request(void *opaque, int drq, int req)</di=
v>
<div>@@ -2073,7 &#43;2073,7 @@ static void omap_dma4_write(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_dma4_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_dma4_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_dma4_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;struct soc_dma_s *omap_dma4_init(hwaddr base, qemu_irq *irqs,</d=
iv>
<div>diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c</div>
<div>index 644eadb..cf6161c 100644</div>
<div>--- a/hw/dma/pl080.c</div>
<div>&#43;&#43;&#43; b/hw/dma/pl080.c</div>
<div>@@ -346,7 &#43;346,7 @@ static void pl080_write(void *opaque, hwaddr o=
ffset,</div>
<div>&nbsp;static const MemoryRegionOps pl080_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl080_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl080_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl080_reset(DeviceState *dev)</div>
<div>diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c</div>
<div>index 4c51f2d..d8bf16e 100644</div>
<div>--- a/hw/dma/pl330.c</div>
<div>&#43;&#43;&#43; b/hw/dma/pl330.c</div>
<div>@@ -1493,7 &#43;1493,7 @@ static uint64_t pl330_iomem_read(void *opaqu=
e, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps pl330_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl330_iomem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl330_iomem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c</div>
<div>index 7002373..2f16944 100644</div>
<div>--- a/hw/dma/puv3_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/puv3_dma.c</div>
<div>@@ -75,7 &#43;75,7 @@ static const MemoryRegionOps puv3_dma_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void puv3_dma_realize(DeviceState *dev, Error **errp)</di=
v>
<div>diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c</div>
<div>index d6fb957..fa1c38f 100644</div>
<div>--- a/hw/dma/pxa2xx_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/pxa2xx_dma.c</div>
<div>@@ -424,7 &#43;424,7 @@ static void pxa2xx_dma_write(void *opaque, hwa=
ddr offset,</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_dma_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_dma_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_dma_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pxa2xx_dma_request(void *opaque, int req_num, int on=
)</div>
<div>diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c</div>
<div>index 155af9b..631880d 100644</div>
<div>--- a/hw/dma/rc4030.c</div>
<div>&#43;&#43;&#43; b/hw/dma/rc4030.c</div>
<div>@@ -387,7 &#43;387,7 @@ static const MemoryRegionOps rc4030_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp;.write =3D rc4030_write,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void update_jazz_irq(rc4030State *s)</div>
<div>@@ -490,7 &#43;490,7 @@ static const MemoryRegionOps jazzio_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp;.write =3D jazzio_write,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 2,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static IOMMUTLBEntry rc4030_dma_translate(IOMMUMemoryRegion *iom=
mu, hwaddr addr,</div>
<div>diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c</div>
<div>index 6b32372..b028100 100644</div>
<div>--- a/hw/dma/sparc32_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/sparc32_dma.c</div>
<div>@@ -224,7 &#43;224,7 @@ static void dma_mem_write(void *opaque, hwaddr=
 addr,</div>
<div>&nbsp;static const MemoryRegionOps dma_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D dma_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D dma_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c</div>
<div>index 921be17..da79828 100644</div>
<div>--- a/hw/dma/xilinx_axidma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/xilinx_axidma.c</div>
<div>@@ -512,7 &#43;512,7 @@ static void axidma_write(void *opaque, hwaddr =
addr,</div>
<div>&nbsp;static const MemoryRegionOps axidma_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D axidma_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D axidma_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void xilinx_axidma_realize(DeviceState *dev, Error **errp=
)</div>
<div>diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c</div>
<div>index 51e1ead..ecf4ff6 100644</div>
<div>--- a/hw/dma/xlnx-zdma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/xlnx-zdma.c</div>
<div>@@ -742,7 &#43;742,7 @@ static void zdma_write(void *opaque, hwaddr ad=
dr, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps zdma_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D zdma_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D zdma_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c</di=
v>
<div>index 7a03ce1..a14c966 100644</div>
<div>--- a/hw/dma/xlnx-zynq-devcfg.c</div>
<div>&#43;&#43;&#43; b/hw/dma/xlnx-zynq-devcfg.c</div>
<div>@@ -319,7 &#43;319,7 @@ static const RegisterAccessInfo xlnx_zynq_devc=
fg_regs_info[] =3D {</div>
<div>&nbsp;static const MemoryRegionOps xlnx_zynq_devcfg_reg_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp;.read =3D register_read_memory,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D register_write_memory,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c</div>
<div>index e834f81..47a0a82 100644</div>
<div>--- a/hw/dma/xlnx_dpdma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/xlnx_dpdma.c</div>
<div>@@ -552,7 &#43;552,7 @@ static void xlnx_dpdma_write(void *opaque, hwa=
ddr offset,</div>
<div>&nbsp;static const MemoryRegionOps dma_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xlnx_dpdma_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xlnx_dpdma_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/gpio/bcm2835_gpio.c b/hw/gpio/bcm2835_gpio.c</div>
<div>index ba8dd6c..8b072f5 100644</div>
<div>--- a/hw/gpio/bcm2835_gpio.c</div>
<div>&#43;&#43;&#43; b/hw/gpio/bcm2835_gpio.c</div>
<div>@@ -275,7 &#43;275,7 @@ static void bcm2835_gpio_reset(DeviceState *de=
v)</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_gpio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_gpio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_gpio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_bcm2835_gpio =3D {</div>
<div>diff --git a/hw/gpio/imx_gpio.c b/hw/gpio/imx_gpio.c</div>
<div>index a51af72..d60e5d3 100644</div>
<div>--- a/hw/gpio/imx_gpio.c</div>
<div>&#43;&#43;&#43; b/hw/gpio/imx_gpio.c</div>
<div>@@ -267,7 &#43;267,7 @@ static const MemoryRegionOps imx_gpio_ops =3D =
{</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_gpio_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_imx_gpio =3D {</div>
<div>diff --git a/hw/gpio/mpc8xxx.c b/hw/gpio/mpc8xxx.c</div>
<div>index 6ff56dc..76d9eb8 100644</div>
<div>--- a/hw/gpio/mpc8xxx.c</div>
<div>&#43;&#43;&#43; b/hw/gpio/mpc8xxx.c</div>
<div>@@ -180,7 &#43;180,7 @@ static void mpc8xxx_gpio_set_irq(void * opaque=
, int irq, int level)</div>
<div>&nbsp;static const MemoryRegionOps mpc8xxx_gpio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mpc8xxx_gpio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mpc8xxx_gpio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void mpc8xxx_gpio_initfn(Object *obj)</div>
<div>diff --git a/hw/gpio/nrf51_gpio.c b/hw/gpio/nrf51_gpio.c</div>
<div>index dd6c16a..f49ef56 100644</div>
<div>--- a/hw/gpio/nrf51_gpio.c</div>
<div>&#43;&#43;&#43; b/hw/gpio/nrf51_gpio.c</div>
<div>@@ -225,7 &#43;225,7 @@ static void nrf51_gpio_write(void *opaque, hwa=
ddr offset,</div>
<div>&nbsp;static const MemoryRegionOps gpio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D &nbsp;nrf51_gpio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D nrf51_gpio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c</div>
<div>index e2785c5..7307717 100644</div>
<div>--- a/hw/gpio/omap_gpio.c</div>
<div>&#43;&#43;&#43; b/hw/gpio/omap_gpio.c</div>
<div>@@ -177,7 &#43;177,7 @@ static void omap_gpio_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_gpio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_gpio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_gpio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_gpio_reset(struct omap_gpio_s *s)</div>
<div>@@ -592,7 &#43;592,7 @@ static const MemoryRegionOps omap2_gpio_module=
_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap2_gpio_module_writep,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_gpif_reset(DeviceState *dev)</div>
<div>@@ -675,7 &#43;675,7 @@ static void omap2_gpif_top_write(void *opaque,=
 hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap2_gpif_top_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap2_gpif_top_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap2_gpif_top_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_gpio_init(Object *obj)</div>
<div>diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c</div>
<div>index da6ff6a..f41a063 100644</div>
<div>--- a/hw/gpio/pl061.c</div>
<div>&#43;&#43;&#43; b/hw/gpio/pl061.c</div>
<div>@@ -339,7 &#43;339,7 @@ static void pl061_set_irq(void * opaque, int i=
rq, int level)</div>
<div>&nbsp;static const MemoryRegionOps pl061_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl061_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl061_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl061_luminary_init(Object *obj)</div>
<div>diff --git a/hw/gpio/puv3_gpio.c b/hw/gpio/puv3_gpio.c</div>
<div>index 54d30ca..f1c5120 100644</div>
<div>--- a/hw/gpio/puv3_gpio.c</div>
<div>&#43;&#43;&#43; b/hw/gpio/puv3_gpio.c</div>
<div>@@ -98,7 &#43;98,7 @@ static const MemoryRegionOps puv3_gpio_ops =3D {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void puv3_gpio_realize(DeviceState *dev, Error **errp)</d=
iv>
<div>diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c</div>
<div>index 599d862..cc8dc38 100644</div>
<div>--- a/hw/gpio/zaurus.c</div>
<div>&#43;&#43;&#43; b/hw/gpio/zaurus.c</div>
<div>@@ -156,7 &#43;156,7 @@ static void scoop_write(void *opaque, hwaddr a=
ddr,</div>
<div>&nbsp;static const MemoryRegionOps scoop_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D scoop_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D scoop_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void scoop_gpio_set(void *opaque, int line, int level)</d=
iv>
<div>diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c</div>
<div>index e94614a..9369c36 100644</div>
<div>--- a/hw/hppa/dino.c</div>
<div>&#43;&#43;&#43; b/hw/hppa/dino.c</div>
<div>@@ -309,7 &#43;309,7 @@ static MemTxResult dino_chip_write_with_attrs(=
void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps dino_chip_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D dino_chip_read_with_attrs,</d=
iv>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D dino_chip_write_with_attrs,<=
/div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -357,7 &#43;357,7 @@ static void dino_config_data_write(void *opaqu=
e, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps dino_config_data_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D dino_config_data_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D dino_config_data_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t dino_config_addr_read(void *opaque, hwaddr addr,=
 unsigned len)</div>
<div>@@ -378,7 &#43;378,7 @@ static const MemoryRegionOps dino_config_addr_=
ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D dino_config_addr_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static AddressSpace *dino_pcihost_set_iommu(PCIBus *bus, void *o=
paque,</div>
<div>diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c</div>
<div>index 662838d..974adaa 100644</div>
<div>--- a/hw/hppa/machine.c</div>
<div>&#43;&#43;&#43; b/hw/hppa/machine.c</div>
<div>@@ -113,7 &#43;113,7 @@ static void machine_hppa_init(MachineState *ma=
chine)</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(0)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint32_t addr =3D DINO_UART_HPA &#43=
; 0x800;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(addr_space, addr, 0, =
serial_irq,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; 115200, serial_hd(0), DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; 115200, serial_hd(0), MO_BE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* SCSI disk setup. */</div>
<div>diff --git a/hw/hppa/pci.c b/hw/hppa/pci.c</div>
<div>index b6606d9..4cf8094 100644</div>
<div>--- a/hw/hppa/pci.c</div>
<div>&#43;&#43;&#43; b/hw/hppa/pci.c</div>
<div>@@ -24,7 &#43;24,7 @@ static void ignore_write(void *opaque, hwaddr ad=
dr, uint64_t v, unsigned size)</div>
<div>&nbsp;const MemoryRegionOps hppa_pci_ignore_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ignore_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ignore_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -54,7 &#43;54,7 @@ static void bw_conf1_write(void *opaque, hwaddr =
addr,</div>
<div>&nbsp;const MemoryRegionOps hppa_pci_conf1_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bw_conf1_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bw_conf1_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -77,7 &#43;77,7 @@ static void special_write(void *opaque, hwaddr a=
ddr,</div>
<div>&nbsp;const MemoryRegionOps hppa_pci_iack_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D iack_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D special_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/hyperv/hyperv_testdev.c b/hw/hyperv/hyperv_testdev.c</=
div>
<div>index 0d343a8..823c790 100644</div>
<div>--- a/hw/hyperv/hyperv_testdev.c</div>
<div>&#43;&#43;&#43; b/hw/hyperv/hyperv_testdev.c</div>
<div>@@ -288,7 &#43;288,7 @@ static const MemoryRegionOps synic_test_sint_o=
ps =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D hv_test_dev_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void hv_test_dev_realizefn(DeviceState *d, Error **errp)<=
/div>
<div>diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c</div>
<div>index 219ad38..f8811c0 100644</div>
<div>--- a/hw/i2c/aspeed_i2c.c</div>
<div>&#43;&#43;&#43; b/hw/i2c/aspeed_i2c.c</div>
<div>@@ -364,13 &#43;364,13 @@ static void aspeed_i2c_ctrl_write(void *opaq=
ue, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps aspeed_i2c_bus_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aspeed_i2c_bus_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aspeed_i2c_bus_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps aspeed_i2c_ctrl_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aspeed_i2c_ctrl_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aspeed_i2c_ctrl_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription aspeed_i2c_bus_vmstate =3D {</di=
v>
<div>diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c</div>
<div>index 70a97a3..0823e66 100644</div>
<div>--- a/hw/i2c/exynos4210_i2c.c</div>
<div>&#43;&#43;&#43; b/hw/i2c/exynos4210_i2c.c</div>
<div>@@ -264,7 &#43;264,7 @@ static void exynos4210_i2c_write(void *opaque,=
 hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps exynos4210_i2c_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D exynos4210_i2c_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D exynos4210_i2c_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription exynos4210_i2c_vmstate =3D {</di=
v>
<div>diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c</div>
<div>index de1107b..8910c50 100644</div>
<div>--- a/hw/i2c/imx_i2c.c</div>
<div>&#43;&#43;&#43; b/hw/i2c/imx_i2c.c</div>
<div>@@ -276,7 &#43;276,7 @@ static const MemoryRegionOps imx_i2c_ops =3D {=
</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_i2c_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 2,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription imx_i2c_vmstate =3D {</div>
<div>diff --git a/hw/i2c/microbit_i2c.c b/hw/i2c/microbit_i2c.c</div>
<div>index 214be07..e756b1c 100644</div>
<div>--- a/hw/i2c/microbit_i2c.c</div>
<div>&#43;&#43;&#43; b/hw/i2c/microbit_i2c.c</div>
<div>@@ -70,7 &#43;70,7 @@ static void microbit_i2c_write(void *opaque, hwa=
ddr addr, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps microbit_i2c_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D microbit_i2c_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D microbit_i2c_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/i2c/mpc_i2c.c b/hw/i2c/mpc_i2c.c</div>
<div>index 181228d..bfe0663 100644</div>
<div>--- a/hw/i2c/mpc_i2c.c</div>
<div>&#43;&#43;&#43; b/hw/i2c/mpc_i2c.c</div>
<div>@@ -304,7 &#43;304,7 @@ static const MemoryRegionOps i2c_ops =3D {</di=
v>
<div>&nbsp; &nbsp; &nbsp;.read =3D &nbsp;mpc_i2c_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D &nbsp;mpc_i2c_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 1,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription mpc_i2c_vmstate =3D {</div>
<div>diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c</div>
<div>index d7ebeae..99a328a 100644</div>
<div>--- a/hw/i2c/omap_i2c.c</div>
<div>&#43;&#43;&#43; b/hw/i2c/omap_i2c.c</div>
<div>@@ -469,7 &#43;469,7 @@ static const MemoryRegionOps omap_i2c_ops =3D =
{</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_i2c_writefn,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_i2c_init(Object *obj)</div>
<div>diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c</div>
<div>index e48544f..87b35af 100644</div>
<div>--- a/hw/i2c/pm_smbus.c</div>
<div>&#43;&#43;&#43; b/hw/i2c/pm_smbus.c</div>
<div>@@ -451,7 &#43;451,7 @@ static const MemoryRegionOps pm_smbus_ops =3D =
{</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D smb_ioport_writeb,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 1,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;bool pm_smbus_vmstate_needed(void)</div>
<div>diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c</div>
<div>index 462729d..1ab2381 100644</div>
<div>--- a/hw/i2c/ppc4xx_i2c.c</div>
<div>&#43;&#43;&#43; b/hw/i2c/ppc4xx_i2c.c</div>
<div>@@ -335,7 &#43;335,7 @@ static const MemoryRegionOps ppc4xx_i2c_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 1,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ppc4xx_i2c_init(Object *o)</div>
<div>diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c</div>
<div>index c92d3b1..be0f989 100644</div>
<div>--- a/hw/i2c/versatile_i2c.c</div>
<div>&#43;&#43;&#43; b/hw/i2c/versatile_i2c.c</div>
<div>@@ -77,7 &#43;77,7 @@ static void versatile_i2c_write(void *opaque, hw=
addr offset,</div>
<div>&nbsp;static const MemoryRegionOps versatile_i2c_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D versatile_i2c_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D versatile_i2c_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void versatile_i2c_init(Object *obj)</div>
<div>diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c</div>
<div>index 4a4e2c7..0612296 100644</div>
<div>--- a/hw/i386/amd_iommu.c</div>
<div>&#43;&#43;&#43; b/hw/i386/amd_iommu.c</div>
<div>@@ -1378,7 &#43;1378,7 @@ static MemTxResult amdvi_mem_ir_read(void *o=
paque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps amdvi_ir_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D amdvi_mem_ir_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D amdvi_mem_ir_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1452,7 &#43;1452,7 @@ static AddressSpace *amdvi_host_dma_iommu(PC=
IBus *bus, void *opaque, int devfn)</div>
<div>&nbsp;static const MemoryRegionOps mmio_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D amdvi_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D amdvi_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c</div>
<div>index de86f53..e9dd1ab 100644</div>
<div>--- a/hw/i386/intel_iommu.c</div>
<div>&#43;&#43;&#43; b/hw/i386/intel_iommu.c</div>
<div>@@ -2993,7 &#43;2993,7 @@ static const VMStateDescription vtd_vmstate =
=3D {</div>
<div>&nbsp;static const MemoryRegionOps vtd_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vtd_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vtd_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -3270,7 &#43;3270,7 @@ static MemTxResult vtd_mem_ir_write(void *op=
aque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps vtd_mem_ir_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D vtd_mem_ir_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D vtd_mem_ir_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c</div>
<div>index 91fb622..e645447 100644</div>
<div>--- a/hw/i386/kvm/apic.c</div>
<div>&#43;&#43;&#43; b/hw/i386/kvm/apic.c</div>
<div>@@ -207,7 &#43;207,7 @@ static void kvm_apic_mem_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps kvm_apic_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D kvm_apic_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D kvm_apic_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void kvm_apic_reset(APICCommonState *s)</div>
<div>diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c</div>
<div>index 9c2ab4a..9c65e41 100644</div>
<div>--- a/hw/i386/kvmvapic.c</div>
<div>&#43;&#43;&#43; b/hw/i386/kvmvapic.c</div>
<div>@@ -717,7 &#43;717,7 @@ static uint64_t vapic_read(void *opaque, hwadd=
r addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps vapic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vapic_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vapic_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void vapic_realize(DeviceState *dev, Error **errp)</div>
<div>diff --git a/hw/i386/pc.c b/hw/i386/pc.c</div>
<div>index 549c437..c2507b5 100644</div>
<div>--- a/hw/i386/pc.c</div>
<div>&#43;&#43;&#43; b/hw/i386/pc.c</div>
<div>@@ -813,7 &#43;813,7 @@ static const MemoryRegionOps port92_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void port92_initfn(Object *obj)</div>
<div>@@ -1985,7 &#43;1985,7 @@ DeviceState *pc_vga_init(ISABus *isa_bus, PC=
IBus *pci_bus)</div>
<div>&nbsp;static const MemoryRegionOps ioport80_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ioport80_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ioport80_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -1995,7 &#43;1995,7 @@ static const MemoryRegionOps ioport80_io_ops=
 =3D {</div>
<div>&nbsp;static const MemoryRegionOps ioportF0_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ioportF0_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ioportF0_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c</div>
<div>index 3bf8cfe..a30032d 100644</div>
<div>--- a/hw/i386/vmport.c</div>
<div>&#43;&#43;&#43; b/hw/i386/vmport.c</div>
<div>@@ -139,7 &#43;139,7 @@ static const MemoryRegionOps vmport_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void vmport_realizefn(DeviceState *dev, Error **errp)</di=
v>
<div>diff --git a/hw/i386/xen/xen_apic.c b/hw/i386/xen/xen_apic.c</div>
<div>index 7c7a60b..2a28057 100644</div>
<div>--- a/hw/i386/xen/xen_apic.c</div>
<div>&#43;&#43;&#43; b/hw/i386/xen/xen_apic.c</div>
<div>@@ -36,7 &#43;36,7 @@ static void xen_apic_mem_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps xen_apic_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xen_apic_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xen_apic_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void xen_apic_realize(DeviceState *dev, Error **errp)</di=
v>
<div>diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c</=
div>
<div>index 7a972e4..af56c59 100644</div>
<div>--- a/hw/i386/xen/xen_platform.c</div>
<div>&#43;&#43;&#43; b/hw/i386/xen/xen_platform.c</div>
<div>@@ -329,7 &#43;329,7 @@ static const MemoryRegionOps platform_fixed_io=
_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.unaligned =3D true,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void platform_fixed_ioport_init(PCIXenPlatformState* s)</=
div>
<div>@@ -427,7 &#43;427,7 @@ static void platform_mmio_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps platform_mmio_handler =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D &amp;platform_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D &amp;platform_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void platform_mmio_setup(PCIXenPlatformState *d)</div>
<div>diff --git a/hw/i386/xen/xen_pvdevice.c b/hw/i386/xen/xen_pvdevice.c</=
div>
<div>index 23748f3..b65fdd2 100644</div>
<div>--- a/hw/i386/xen/xen_pvdevice.c</div>
<div>&#43;&#43;&#43; b/hw/i386/xen/xen_pvdevice.c</div>
<div>@@ -69,7 &#43;69,7 @@ static void xen_pv_mmio_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps xen_pv_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D &amp;xen_pv_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D &amp;xen_pv_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_xen_pvdevice =3D {</div>
<div>diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c</div>
<div>index de08d87..714267c 100644</div>
<div>--- a/hw/ide/ahci-allwinner.c</div>
<div>&#43;&#43;&#43; b/hw/ide/ahci-allwinner.c</div>
<div>@@ -82,7 &#43;82,7 @@ static const MemoryRegionOps allwinner_ahci_mem_=
ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D allwinner_ahci_mem_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void allwinner_ahci_init(Object *obj)</div>
<div>diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c</div>
<div>index 00ba422..871b75b 100644</div>
<div>--- a/hw/ide/ahci.c</div>
<div>&#43;&#43;&#43; b/hw/ide/ahci.c</div>
<div>@@ -521,7 &#43;521,7 @@ static void ahci_mem_write(void *opaque, hwadd=
r addr,</div>
<div>&nbsp;static const MemoryRegionOps ahci_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ahci_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ahci_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t ahci_idp_read(void *opaque, hwaddr addr,</div>
<div>@@ -557,7 &#43;557,7 @@ static void ahci_idp_write(void *opaque, hwadd=
r addr,</div>
<div>&nbsp;static const MemoryRegionOps ahci_idp_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ahci_idp_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ahci_idp_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>diff --git a/hw/ide/macio.c b/hw/ide/macio.c</div>
<div>index 54571fe..b1dbe8d 100644</div>
<div>--- a/hw/ide/macio.c</div>
<div>&#43;&#43;&#43; b/hw/ide/macio.c</div>
<div>@@ -351,7 &#43;351,7 @@ static const MemoryRegionOps pmac_ide_ops =3D =
{</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pmac_ide_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_pmac =3D {</div>
<div>diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c</div>
<div>index 70a5801..88b71e6 100644</div>
<div>--- a/hw/ide/mmio.c</div>
<div>&#43;&#43;&#43; b/hw/ide/mmio.c</div>
<div>@@ -84,7 &#43;84,7 @@ static void mmio_ide_write(void *opaque, hwaddr =
addr,</div>
<div>&nbsp;static const MemoryRegionOps mmio_ide_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mmio_ide_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mmio_ide_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t mmio_ide_status_read(void *opaque, hwaddr addr,<=
/div>
<div>@@ -104,7 &#43;104,7 @@ static void mmio_ide_cmd_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps mmio_ide_cs_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mmio_ide_status_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mmio_ide_cmd_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_ide_mmio =3D {</div>
<div>diff --git a/hw/ide/pci.c b/hw/ide/pci.c</div>
<div>index 4c6fb9a..7cb42f4 100644</div>
<div>--- a/hw/ide/pci.c</div>
<div>&#43;&#43;&#43; b/hw/ide/pci.c</div>
<div>@@ -62,7 &#43;62,7 @@ static void pci_ide_cmd_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;const MemoryRegionOps pci_ide_cmd_le_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_ide_cmd_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_ide_cmd_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t pci_ide_data_read(void *opaque, hwaddr addr, uns=
igned size)</div>
<div>@@ -100,7 &#43;100,7 @@ static void pci_ide_data_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;const MemoryRegionOps pci_ide_data_le_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_ide_data_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_ide_data_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void bmdma_start_dma(IDEDMA *dma, IDEState *s,</div>
<div>@@ -338,7 &#43;338,7 @@ static void bmdma_addr_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;MemoryRegionOps bmdma_addr_ioport_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bmdma_addr_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bmdma_addr_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static bool ide_bmdma_current_needed(void *opaque)</div>
<div>diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c</div>
<div>index d7590d4..30635e1 100644</div>
<div>--- a/hw/ide/sii3112.c</div>
<div>&#43;&#43;&#43; b/hw/ide/sii3112.c</div>
<div>@@ -208,7 &#43;208,7 @@ static void sii3112_reg_write(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps sii3112_reg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sii3112_reg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sii3112_reg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/* the PCI irq level is the logical OR of the two channels */</d=
iv>
<div>diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb=
.c</div>
<div>index f779cd4..f4e38f7 100644</div>
<div>--- a/hw/input/milkymist-softusb.c</div>
<div>&#43;&#43;&#43; b/hw/input/milkymist-softusb.c</div>
<div>@@ -127,7 &#43;127,7 @@ softusb_write(void *opaque, hwaddr addr, uint6=
4_t value,</div>
<div>&nbsp;static const MemoryRegionOps softusb_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D softusb_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D softusb_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c</div>
<div>index 47a606f..dd78587 100644</div>
<div>--- a/hw/input/pckbd.c</div>
<div>&#43;&#43;&#43; b/hw/input/pckbd.c</div>
<div>@@ -456,7 &#43;456,7 @@ static const MemoryRegionOps i8042_mmio_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D kbd_mm_writefn,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,</div>
<div>@@ -518,7 &#43;518,7 @@ static const MemoryRegionOps i8042_data_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps i8042_cmd_ops =3D {</div>
<div>@@ -528,7 &#43;528,7 @@ static const MemoryRegionOps i8042_cmd_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void i8042_initfn(Object *obj)</div>
<div>diff --git a/hw/input/pl050.c b/hw/input/pl050.c</div>
<div>index 4c0fe0b..28936ef 100644</div>
<div>--- a/hw/input/pl050.c</div>
<div>&#43;&#43;&#43; b/hw/input/pl050.c</div>
<div>@@ -137,7 &#43;137,7 @@ static void pl050_write(void *opaque, hwaddr o=
ffset,</div>
<div>&nbsp;static const MemoryRegionOps pl050_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl050_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl050_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl050_realize(DeviceState *dev, Error **errp)</div>
<div>diff --git a/hw/input/pxa2xx_keypad.c b/hw/input/pxa2xx_keypad.c</div>
<div>index 93db9ed..c68f229 100644</div>
<div>--- a/hw/input/pxa2xx_keypad.c</div>
<div>&#43;&#43;&#43; b/hw/input/pxa2xx_keypad.c</div>
<div>@@ -285,7 &#43;285,7 @@ static void pxa2xx_keypad_write(void *opaque, =
hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_keypad_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_keypad_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_keypad_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_pxa2xx_keypad =3D {</div=
>
<div>diff --git a/hw/intc/allwinner-a10-pic.c b/hw/intc/allwinner-a10-pic.c=
</div>
<div>index 080bdd7..bb406e8 100644</div>
<div>--- a/hw/intc/allwinner-a10-pic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/allwinner-a10-pic.c</div>
<div>@@ -137,7 &#43;137,7 @@ static void aw_a10_pic_write(void *opaque, hwa=
ddr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps aw_a10_pic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aw_a10_pic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aw_a10_pic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_aw_a10_pic =3D {</div>
<div>diff --git a/hw/intc/apic.c b/hw/intc/apic.c</div>
<div>index bce8991..6379c66 100644</div>
<div>--- a/hw/intc/apic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/apic.c</div>
<div>@@ -878,7 &#43;878,7 @@ static const MemoryRegionOps apic_io_ops =3D {=
</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void apic_realize(DeviceState *dev, Error **errp)</div>
<div>diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c</div>
<div>index 283a63a..f66710e 100644</div>
<div>--- a/hw/intc/arm_gic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/arm_gic.c</div>
<div>@@ -1999,38 &#43;1999,38 @@ static const MemoryRegionOps gic_ops[2] =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read_with_attrs =3D gic_dist_read,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write_with_attrs =3D gic_dist_write=
,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>&nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read_with_attrs =3D gic_thiscpu_rea=
d,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write_with_attrs =3D gic_thiscpu_wr=
ite,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps gic_cpu_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D gic_do_cpu_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D gic_do_cpu_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps gic_virt_ops[2] =3D {</div>
<div>&nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read_with_attrs =3D gic_thiscpu_hyp=
_read,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write_with_attrs =3D gic_thiscpu_hy=
p_write,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>&nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read_with_attrs =3D gic_thisvcpu_re=
ad,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write_with_attrs =3D gic_thisvcpu_w=
rite,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps gic_viface_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D gic_do_hyp_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D gic_do_hyp_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void arm_gic_realize(DeviceState *dev, Error **errp)</div=
>
<div>diff --git a/hw/intc/arm_gicv2m.c b/hw/intc/arm_gicv2m.c</div>
<div>index 05f299f..5906828 100644</div>
<div>--- a/hw/intc/arm_gicv2m.c</div>
<div>&#43;&#43;&#43; b/hw/intc/arm_gicv2m.c</div>
<div>@@ -126,7 &#43;126,7 @@ static void gicv2m_write(void *opaque, hwaddr =
offset,</div>
<div>&nbsp;static const MemoryRegionOps gicv2m_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D gicv2m_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D gicv2m_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void gicv2m_realize(DeviceState *dev, Error **errp)</div>
<div>diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c</div>
<div>index 9b4d5ba..3e6526d 100644</div>
<div>--- a/hw/intc/arm_gicv3.c</div>
<div>&#43;&#43;&#43; b/hw/intc/arm_gicv3.c</div>
<div>@@ -352,12 &#43;352,12 @@ static const MemoryRegionOps gic_ops[] =3D {=
</div>
<div>&nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read_with_attrs =3D gicv3_dist_read=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write_with_attrs =3D gicv3_dist_wri=
te,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>&nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read_with_attrs =3D gicv3_redist_re=
ad,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write_with_attrs =3D gicv3_redist_w=
rite,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_co=
mmon.c</div>
<div>index efb3d51..fcbbe6d 100644</div>
<div>--- a/hw/intc/arm_gicv3_its_common.c</div>
<div>&#43;&#43;&#43; b/hw/intc/arm_gicv3_its_common.c</div>
<div>@@ -95,7 &#43;95,7 @@ static MemTxResult gicv3_its_trans_write(void *o=
paque, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps gicv3_its_trans_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D gicv3_its_trans_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D gicv3_its_trans_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps=
 *ops)</div>
<div>diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c</div>
<div>index 237ccef..975d7cc 100644</div>
<div>--- a/hw/intc/armv7m_nvic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/armv7m_nvic.c</div>
<div>@@ -2334,7 &#43;2334,7 @@ static MemTxResult nvic_sysreg_write(void *o=
paque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps nvic_sysreg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D nvic_sysreg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D nvic_sysreg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static MemTxResult nvic_sysreg_ns_write(void *opaque, hwaddr add=
r,</div>
<div>@@ -2381,7 &#43;2381,7 @@ static MemTxResult nvic_sysreg_ns_read(void =
*opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps nvic_sysreg_ns_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D nvic_sysreg_ns_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D nvic_sysreg_ns_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static MemTxResult nvic_systick_write(void *opaque, hwaddr addr,=
</div>
<div>@@ -2412,7 &#43;2412,7 @@ static MemTxResult nvic_systick_read(void *o=
paque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps nvic_systick_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D nvic_systick_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D nvic_systick_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int nvic_post_load(void *opaque, int version_id)</div>
<div>diff --git a/hw/intc/aspeed_vic.c b/hw/intc/aspeed_vic.c</div>
<div>index 266a309..2556b54 100644</div>
<div>--- a/hw/intc/aspeed_vic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/aspeed_vic.c</div>
<div>@@ -283,7 &#43;283,7 @@ static void aspeed_vic_write(void *opaque, hwa=
ddr offset, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps aspeed_vic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aspeed_vic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aspeed_vic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.unaligned =3D false,</div>
<div>diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c</div>
<div>index 61d3764..918f46b 100644</div>
<div>--- a/hw/intc/bcm2835_ic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/bcm2835_ic.c</div>
<div>@@ -168,7 &#43;168,7 @@ static void bcm2835_ic_write(void *opaque, hwa=
ddr offset, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_ic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_ic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_ic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c</di=
v>
<div>index 66417c8..14774a7 100644</div>
<div>--- a/hw/intc/bcm2836_control.c</div>
<div>&#43;&#43;&#43; b/hw/intc/bcm2836_control.c</div>
<div>@@ -302,7 &#43;302,7 @@ static void bcm2836_control_write(void *opaque=
, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps bcm2836_control_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2836_control_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2836_control_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/intc/etraxfs_pic.c b/hw/intc/etraxfs_pic.c</div>
<div>index d4a27d1..ba15146 100644</div>
<div>--- a/hw/intc/etraxfs_pic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/etraxfs_pic.c</div>
<div>@@ -111,7 &#43;111,7 @@ static void pic_write(void *opaque, hwaddr add=
r,</div>
<div>&nbsp;static const MemoryRegionOps pic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combin=
er.c</div>
<div>index 6fed0e8..3e7294b 100644</div>
<div>--- a/hw/intc/exynos4210_combiner.c</div>
<div>&#43;&#43;&#43; b/hw/intc/exynos4210_combiner.c</div>
<div>@@ -401,7 &#43;401,7 @@ static void exynos4210_combiner_reset(DeviceSt=
ate *d)</div>
<div>&nbsp;static const MemoryRegionOps exynos4210_combiner_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D exynos4210_combiner_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D exynos4210_combiner_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/*</div>
<div>diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c</div>
<div>index 21c77a5..3d6002b 100644</div>
<div>--- a/hw/intc/grlib_irqmp.c</div>
<div>&#43;&#43;&#43; b/hw/intc/grlib_irqmp.c</div>
<div>@@ -313,7 &#43;313,7 @@ static void grlib_irqmp_write(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps grlib_irqmp_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D grlib_irqmp_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D grlib_irqmp_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/intc/heathrow_pic.c b/hw/intc/heathrow_pic.c</div>
<div>index c282ac4..083be15 100644</div>
<div>--- a/hw/intc/heathrow_pic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/heathrow_pic.c</div>
<div>@@ -109,7 &#43;109,7 @@ static uint64_t heathrow_read(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps heathrow_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D heathrow_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D heathrow_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void heathrow_set_irq(void *opaque, int num, int level)</=
div>
<div>diff --git a/hw/intc/imx_avic.c b/hw/intc/imx_avic.c</div>
<div>index 4bef842..3e0b622 100644</div>
<div>--- a/hw/intc/imx_avic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/imx_avic.c</div>
<div>@@ -308,7 &#43;308,7 @@ static void imx_avic_write(void *opaque, hwadd=
r offset,</div>
<div>&nbsp;static const MemoryRegionOps imx_avic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx_avic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_avic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void imx_avic_reset(DeviceState *dev)</div>
<div>diff --git a/hw/intc/imx_gpcv2.c b/hw/intc/imx_gpcv2.c</div>
<div>index f37e6b5..f047bf1 100644</div>
<div>--- a/hw/intc/imx_gpcv2.c</div>
<div>&#43;&#43;&#43; b/hw/intc/imx_gpcv2.c</div>
<div>@@ -64,7 &#43;64,7 @@ static void imx_gpcv2_write(void *opaque, hwaddr=
 offset,</div>
<div>&nbsp;static const struct MemoryRegionOps imx_gpcv2_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx_gpcv2_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_gpcv2_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c</div>
<div>index e99c37c..1603f4d 100644</div>
<div>--- a/hw/intc/ioapic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/ioapic.c</div>
<div>@@ -403,7 &#43;403,7 @@ ioapic_mem_write(void *opaque, hwaddr addr, ui=
nt64_t val,</div>
<div>&nbsp;static const MemoryRegionOps ioapic_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ioapic_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ioapic_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ioapic_machine_done_notify(Notifier *notifier, void =
*data)</div>
<div>diff --git a/hw/intc/mips_gic.c b/hw/intc/mips_gic.c</div>
<div>index 33ab51c..9d93664 100644</div>
<div>--- a/hw/intc/mips_gic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/mips_gic.c</div>
<div>@@ -385,7 &#43;385,7 @@ static void gic_reset(void *opaque)</div>
<div>&nbsp;static const MemoryRegionOps gic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D gic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D gic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c</div>
<div>index 053e67c..07aa4df 100644</div>
<div>--- a/hw/intc/omap_intc.c</div>
<div>&#43;&#43;&#43; b/hw/intc/omap_intc.c</div>
<div>@@ -330,7 &#43;330,7 @@ static void omap_inth_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_inth_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_inth_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_inth_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -606,7 &#43;606,7 @@ static void omap2_inth_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap2_inth_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap2_inth_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap2_inth_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/intc/ompic.c b/hw/intc/ompic.c</div>
<div>index 9cb310a..32c37ce 100644</div>
<div>--- a/hw/intc/ompic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/ompic.c</div>
<div>@@ -95,7 &#43;95,7 @@ static void ompic_write(void *opaque, hwaddr add=
r, uint64_t data, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps ompic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ompic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ompic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c</div>
<div>index 9b4fc6c..b573202 100644</div>
<div>--- a/hw/intc/openpic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/openpic.c</div>
<div>@@ -1148,7 &#43;1148,7 @@ static uint64_t openpic_cpu_read(void *opaqu=
e, hwaddr addr, unsigned len)</div>
<div>&nbsp;static const MemoryRegionOps openpic_glb_ops_le =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D openpic_gbl_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp;=3D openpic_gbl_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1158,7 &#43;1158,7 @@ static const MemoryRegionOps openpic_glb_ops=
_le =3D {</div>
<div>&nbsp;static const MemoryRegionOps openpic_glb_ops_be =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D openpic_gbl_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp;=3D openpic_gbl_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1168,7 &#43;1168,7 @@ static const MemoryRegionOps openpic_glb_ops=
_be =3D {</div>
<div>&nbsp;static const MemoryRegionOps openpic_tmr_ops_le =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D openpic_tmr_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp;=3D openpic_tmr_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1178,7 &#43;1178,7 @@ static const MemoryRegionOps openpic_tmr_ops=
_le =3D {</div>
<div>&nbsp;static const MemoryRegionOps openpic_tmr_ops_be =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D openpic_tmr_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp;=3D openpic_tmr_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1188,7 &#43;1188,7 @@ static const MemoryRegionOps openpic_tmr_ops=
_be =3D {</div>
<div>&nbsp;static const MemoryRegionOps openpic_cpu_ops_le =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D openpic_cpu_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp;=3D openpic_cpu_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1198,7 &#43;1198,7 @@ static const MemoryRegionOps openpic_cpu_ops=
_le =3D {</div>
<div>&nbsp;static const MemoryRegionOps openpic_cpu_ops_be =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D openpic_cpu_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp;=3D openpic_cpu_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1208,7 &#43;1208,7 @@ static const MemoryRegionOps openpic_cpu_ops=
_be =3D {</div>
<div>&nbsp;static const MemoryRegionOps openpic_src_ops_le =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D openpic_src_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp;=3D openpic_src_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1218,7 &#43;1218,7 @@ static const MemoryRegionOps openpic_src_ops=
_le =3D {</div>
<div>&nbsp;static const MemoryRegionOps openpic_src_ops_be =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D openpic_src_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp;=3D openpic_src_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1228,7 &#43;1228,7 @@ static const MemoryRegionOps openpic_src_ops=
_be =3D {</div>
<div>&nbsp;static const MemoryRegionOps openpic_msi_ops_be =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D openpic_msi_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D openpic_msi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1238,7 &#43;1238,7 @@ static const MemoryRegionOps openpic_msi_ops=
_be =3D {</div>
<div>&nbsp;static const MemoryRegionOps openpic_summary_ops_be =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D openpic_summary_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D openpic_summary_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c</div>
<div>index 49fc6fa..4581121 100644</div>
<div>--- a/hw/intc/openpic_kvm.c</div>
<div>&#43;&#43;&#43; b/hw/intc/openpic_kvm.c</div>
<div>@@ -109,7 &#43;109,7 @@ static uint64_t kvm_openpic_read(void *opaque,=
 hwaddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps kvm_openpic_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D kvm_openpic_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp;=3D kvm_openpic_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/intc/pl190.c b/hw/intc/pl190.c</div>
<div>index e6eab1e..6d1bbb1 100644</div>
<div>--- a/hw/intc/pl190.c</div>
<div>&#43;&#43;&#43; b/hw/intc/pl190.c</div>
<div>@@ -220,7 &#43;220,7 @@ static void pl190_write(void *opaque, hwaddr o=
ffset,</div>
<div>&nbsp;static const MemoryRegionOps pl190_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl190_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl190_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl190_reset(DeviceState *d)</div>
<div>diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c</div>
<div>index 4dc92ef..edea170 100644</div>
<div>--- a/hw/intc/pnv_xive.c</div>
<div>&#43;&#43;&#43; b/hw/intc/pnv_xive.c</div>
<div>@@ -1186,7 &#43;1186,7 @@ static uint64_t pnv_xive_ic_reg_read(void *o=
paque, hwaddr offset, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps pnv_xive_ic_reg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pnv_xive_ic_reg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pnv_xive_ic_reg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -1285,7 &#43;1285,7 @@ static uint64_t pnv_xive_ic_notify_read(void=
 *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pnv_xive_ic_notify_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pnv_xive_ic_notify_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pnv_xive_ic_notify_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -1319,7 &#43;1319,7 @@ static uint64_t pnv_xive_ic_lsi_read(void *o=
paque, hwaddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps pnv_xive_ic_lsi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pnv_xive_ic_lsi_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pnv_xive_ic_lsi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -1384,7 &#43;1384,7 @@ static uint64_t xive_tm_indirect_read(void *=
opaque, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps xive_tm_indirect_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xive_tm_indirect_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xive_tm_indirect_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -1418,7 &#43;1418,7 @@ static void pnv_xive_xscom_write(void *opaqu=
e, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pnv_xive_xscom_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pnv_xive_xscom_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pnv_xive_xscom_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -1514,7 &#43;1514,7 @@ static void pnv_xive_vc_write(void *opaque, =
hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps pnv_xive_vc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pnv_xive_vc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pnv_xive_vc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -1549,7 &#43;1549,7 @@ static void pnv_xive_pc_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pnv_xive_pc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pnv_xive_pc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pnv_xive_pc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>diff --git a/hw/intc/puv3_intc.c b/hw/intc/puv3_intc.c</div>
<div>index 97999cc..feadc2c 100644</div>
<div>--- a/hw/intc/puv3_intc.c</div>
<div>&#43;&#43;&#43; b/hw/intc/puv3_intc.c</div>
<div>@@ -100,7 &#43;100,7 @@ static const MemoryRegionOps puv3_intc_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void puv3_intc_realize(DeviceState *dev, Error **errp)</d=
iv>
<div>diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c</div>
<div>index bac7886..3bf8868 100644</div>
<div>--- a/hw/intc/sh_intc.c</div>
<div>&#43;&#43;&#43; b/hw/intc/sh_intc.c</div>
<div>@@ -289,7 &#43;289,7 @@ static void sh_intc_write(void *opaque, hwaddr=
 offset,</div>
<div>&nbsp;static const MemoryRegionOps sh_intc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sh_intc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sh_intc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;struct intc_source *sh_intc_source(struct intc_desc *desc, intc_=
enum id)</div>
<div>diff --git a/hw/intc/slavio_intctl.c b/hw/intc/slavio_intctl.c</div>
<div>index ca52875..5a09e8b 100644</div>
<div>--- a/hw/intc/slavio_intctl.c</div>
<div>&#43;&#43;&#43; b/hw/intc/slavio_intctl.c</div>
<div>@@ -134,7 &#43;134,7 @@ static void slavio_intctl_mem_writel(void *opa=
que, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps slavio_intctl_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D slavio_intctl_mem_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D slavio_intctl_mem_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -204,7 &#43;204,7 @@ static void slavio_intctlm_mem_writel(void *op=
aque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps slavio_intctlm_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D slavio_intctlm_mem_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D slavio_intctlm_mem_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/intc/xics_pnv.c b/hw/intc/xics_pnv.c</div>
<div>index 67f2702..7acd6ec 100644</div>
<div>--- a/hw/intc/xics_pnv.c</div>
<div>&#43;&#43;&#43; b/hw/intc/xics_pnv.c</div>
<div>@@ -149,7 &#43;149,7 @@ bad_access:</div>
<div>&nbsp;static const MemoryRegionOps pnv_icp_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pnv_icp_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pnv_icp_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c</div>
<div>index d5363e9..61034d9 100644</div>
<div>--- a/hw/intc/xilinx_intc.c</div>
<div>&#43;&#43;&#43; b/hw/intc/xilinx_intc.c</div>
<div>@@ -142,7 &#43;142,7 @@ pic_write(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/intc/xive.c b/hw/intc/xive.c</div>
<div>index da148e9..7eff6c4 100644</div>
<div>--- a/hw/intc/xive.c</div>
<div>&#43;&#43;&#43; b/hw/intc/xive.c</div>
<div>@@ -479,7 &#43;479,7 @@ static uint64_t xive_tm_read(void *opaque, hwa=
ddr offset, unsigned size)</div>
<div>&nbsp;const MemoryRegionOps xive_tm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xive_tm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xive_tm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -969,7 &#43;969,7 @@ out:</div>
<div>&nbsp;static const MemoryRegionOps xive_source_esb_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xive_source_esb_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xive_source_esb_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -1664,7 &#43;1664,7 @@ static void xive_end_source_write(void *opaq=
ue, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps xive_end_source_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xive_end_source_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xive_end_source_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>diff --git a/hw/intc/xlnx-pmu-iomod-intc.c b/hw/intc/xlnx-pmu-iomod-in=
tc.c</div>
<div>index 0b8ff89..c4bab81 100644</div>
<div>--- a/hw/intc/xlnx-pmu-iomod-intc.c</div>
<div>&#43;&#43;&#43; b/hw/intc/xlnx-pmu-iomod-intc.c</div>
<div>@@ -464,7 &#43;464,7 @@ static void xlnx_pmu_io_intc_reset(DeviceState=
 *dev)</div>
<div>&nbsp;static const MemoryRegionOps xlnx_pmu_io_intc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D register_read_memory,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D register_write_memory,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/intc/xlnx-zynqmp-ipi.c b/hw/intc/xlnx-zynqmp-ipi.c</di=
v>
<div>index 0dad6c0..7ac94bb 100644</div>
<div>--- a/hw/intc/xlnx-zynqmp-ipi.c</div>
<div>&#43;&#43;&#43; b/hw/intc/xlnx-zynqmp-ipi.c</div>
<div>@@ -295,7 &#43;295,7 @@ static void xlnx_zynqmp_obs_handler(void *opaq=
ue, int n, int level)</div>
<div>&nbsp;static const MemoryRegionOps xlnx_zynqmp_ipi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D register_read_memory,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D register_write_memory,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c</div>
<div>index d4d8510..8bf866c 100644</div>
<div>--- a/hw/ipack/tpci200.c</div>
<div>&#43;&#43;&#43; b/hw/ipack/tpci200.c</div>
<div>@@ -524,7 &#43;524,7 @@ static void tpci200_write_las3(void *opaque, h=
waddr addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps tpci200_cfg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tpci200_read_cfg,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tpci200_write_cfg,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>@@ -538,7 &#43;538,7 @@ static const MemoryRegionOps tpci200_cfg_ops =
=3D {</div>
<div>&nbsp;static const MemoryRegionOps tpci200_las0_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tpci200_read_las0,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tpci200_write_las0,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 2</div>
<div>@@ -548,7 &#43;548,7 @@ static const MemoryRegionOps tpci200_las0_ops =
=3D {</div>
<div>&nbsp;static const MemoryRegionOps tpci200_las1_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tpci200_read_las1,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tpci200_write_las1,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 2</div>
<div>@@ -558,7 &#43;558,7 @@ static const MemoryRegionOps tpci200_las1_ops =
=3D {</div>
<div>&nbsp;static const MemoryRegionOps tpci200_las2_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tpci200_read_las2,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tpci200_write_las2,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 2</div>
<div>@@ -568,7 &#43;568,7 @@ static const MemoryRegionOps tpci200_las2_ops =
=3D {</div>
<div>&nbsp;static const MemoryRegionOps tpci200_las3_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tpci200_read_las3,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tpci200_write_las3,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1</div>
<div>diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c</div>
<div>index 1846d5b..4fefbcf 100644</div>
<div>--- a/hw/ipmi/isa_ipmi_bt.c</div>
<div>&#43;&#43;&#43; b/hw/ipmi/isa_ipmi_bt.c</div>
<div>@@ -320,7 &#43;320,7 @@ static const MemoryRegionOps ipmi_bt_io_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ipmi_bt_set_atn(IPMIInterface *ii, int val, int irq)=
</div>
<div>diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c</div>
<div>index 068f341..2671fdc 100644</div>
<div>--- a/hw/ipmi/isa_ipmi_kcs.c</div>
<div>&#43;&#43;&#43; b/hw/ipmi/isa_ipmi_kcs.c</div>
<div>@@ -313,7 &#43;313,7 @@ const MemoryRegionOps ipmi_kcs_io_ops =3D {</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ipmi_kcs_set_atn(IPMIInterface *ii, int val, int irq=
)</div>
<div>diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c</div>
<div>index a7081bd..1a9e66e 100644</div>
<div>--- a/hw/isa/lpc_ich9.c</div>
<div>&#43;&#43;&#43; b/hw/isa/lpc_ich9.c</div>
<div>@@ -569,7 &#43;569,7 @@ static void ich9_lpc_reset(DeviceState *qdev)<=
/div>
<div>&nbsp;static const MemoryRegionOps rcrb_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ich9_cc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ich9_cc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ich9_lpc_machine_ready(Notifier *n, void *opaque)</d=
iv>
<div>@@ -620,7 &#43;620,7 @@ static uint64_t ich9_rst_cnt_read(void *opaque=
, hwaddr addr, unsigned len)</div>
<div>&nbsp;static const MemoryRegionOps ich9_rst_cnt_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ich9_rst_cnt_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ich9_rst_cnt_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ich9_lpc_get_sci_int(Object *obj, Visitor *v, const =
char *name,</div>
<div>diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c</div>
<div>index 85dbc94..8718b2d 100644</div>
<div>--- a/hw/isa/pc87312.c</div>
<div>&#43;&#43;&#43; b/hw/isa/pc87312.c</div>
<div>@@ -265,7 &#43;265,7 @@ static uint64_t pc87312_io_read(void *opaque, =
hwaddr addr, unsigned int size)</div>
<div>&nbsp;static const MemoryRegionOps pc87312_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp;=3D pc87312_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pc87312_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c</div>
<div>index adf65d3..13828d3 100644</div>
<div>--- a/hw/isa/vt82c686.c</div>
<div>&#43;&#43;&#43; b/hw/isa/vt82c686.c</div>
<div>@@ -108,7 &#43;108,7 @@ static uint64_t superio_ioport_readb(void *opa=
que, hwaddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps superio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D superio_ioport_readb,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D superio_ioport_writeb,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c</div>
<div>index 1c17f83..1b7712e 100644</div>
<div>--- a/hw/m68k/mcf5206.c</div>
<div>&#43;&#43;&#43; b/hw/m68k/mcf5206.c</div>
<div>@@ -548,7 &#43;548,7 @@ static const MemoryRegionOps m5206_mbar_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D m5206_mbar_writefn,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;qemu_irq *mcf5206_init(MemoryRegion *sysmem, uint32_t base, M68k=
CPU *cpu)</div>
<div>diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c</div>
<div>index 6f6efae..7fdeb16 100644</div>
<div>--- a/hw/m68k/mcf5208.c</div>
<div>&#43;&#43;&#43; b/hw/m68k/mcf5208.c</div>
<div>@@ -138,7 &#43;138,7 @@ static uint64_t m5208_timer_read(void *opaque,=
 hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps m5208_timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D m5208_timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D m5208_timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t m5208_sys_read(void *opaque, hwaddr addr,</div>
<div>@@ -172,7 &#43;172,7 @@ static void m5208_sys_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps m5208_sys_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D m5208_sys_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D m5208_sys_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void mcf5208_sys_init(MemoryRegion *address_space, qemu_i=
rq *pic)</div>
<div>diff --git a/hw/m68k/mcf_intc.c b/hw/m68k/mcf_intc.c</div>
<div>index a613aed..c38a347 100644</div>
<div>--- a/hw/m68k/mcf_intc.c</div>
<div>&#43;&#43;&#43; b/hw/m68k/mcf_intc.c</div>
<div>@@ -159,7 &#43;159,7 @@ static void mcf_intc_reset(DeviceState *dev)</=
div>
<div>&nbsp;static const MemoryRegionOps mcf_intc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mcf_intc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mcf_intc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void mcf_intc_instance_init(Object *obj)</div>
<div>diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petal=
ogix_ml605_mmu.c</div>
<div>index a88bf16..857c659 100644</div>
<div>--- a/hw/microblaze/petalogix_ml605_mmu.c</div>
<div>&#43;&#43;&#43; b/hw/microblaze/petalogix_ml605_mmu.c</div>
<div>@@ -122,7 &#43;122,7 @@ petalogix_ml605_init(MachineState *machine)</d=
iv>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, UART16550_BASEAD=
DR &#43; 0x1000, 2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
irq[UART16550_IRQ], 115200, serial_hd(0),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DEVIC=
E_LITTLE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; M=
O_LE);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* 2 timers at irq 2 @ 100 Mhz. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;dev =3D qdev_create(NULL, &quot;xlnx.xps-timer&quo=
t;);</div>
<div>diff --git a/hw/mips/boston.c b/hw/mips/boston.c</div>
<div>index 9eeccbe..89babaa 100644</div>
<div>--- a/hw/mips/boston.c</div>
<div>&#43;&#43;&#43; b/hw/mips/boston.c</div>
<div>@@ -165,7 &#43;165,7 @@ static void boston_lcd_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps boston_lcd_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D boston_lcd_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D boston_lcd_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t boston_platreg_read(void *opaque, hwaddr addr,</=
div>
<div>@@ -244,7 &#43;244,7 @@ static void boston_platreg_write(void *opaque,=
 hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps boston_platreg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D boston_platreg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D boston_platreg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const TypeInfo boston_device =3D {</div>
<div>@@ -504,7 &#43;504,7 @@ static void boston_mach_init(MachineState *mac=
hine)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;s-&gt;uart =3D serial_mm_init(sys_mem, 0x17ffe000,=
 2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; get_cps_irq(&amp;s-&gt;cps, 3), 10000000=
,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; serial_hd(0), DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; serial_hd(0), MO_TE);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;lcd =3D g_new(MemoryRegion, 1);</div>
<div>&nbsp; &nbsp; &nbsp;memory_region_init_io(lcd, NULL, &amp;boston_lcd_o=
ps, s, &quot;boston-lcd&quot;, 0x8);</div>
<div>diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c</div>
<div>index 2fa313f..7ed4d5c 100644</div>
<div>--- a/hw/mips/gt64xxx_pci.c</div>
<div>&#43;&#43;&#43; b/hw/mips/gt64xxx_pci.c</div>
<div>@@ -972,7 &#43;972,7 @@ static uint64_t gt64120_readl(void *opaque,</d=
iv>
<div>&nbsp;static const MemoryRegionOps isd_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D gt64120_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D gt64120_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)<=
/div>
<div>diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c</div>
<div>index fa8775d..397c96e 100644</div>
<div>--- a/hw/mips/mips_jazz.c</div>
<div>&#43;&#43;&#43; b/hw/mips/mips_jazz.c</div>
<div>@@ -84,7 &#43;84,7 @@ static void rtc_write(void *opaque, hwaddr addr,=
</div>
<div>&nbsp;static const MemoryRegionOps rtc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D rtc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D rtc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t dma_dummy_read(void *opaque, hwaddr addr,</div>
<div>@@ -105,7 &#43;105,7 @@ static void dma_dummy_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps dma_dummy_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D dma_dummy_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D dma_dummy_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;#define MAGNUM_BIOS_SIZE_MAX 0x7e000</div>
<div>@@ -320,12 &#43;320,12 @@ static void mips_jazz_init(MachineState *mac=
hine,</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(0)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address_space, 0x8000=
6000, 0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; qdev_get_gpio_in(rc4030, 8), 8000000/16,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; serial_hd(0), DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; serial_hd(0), MO_TE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(1)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address_space, 0x8000=
7000, 0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; qdev_get_gpio_in(rc4030, 9), 8000000/16,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; serial_hd(1), DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; serial_hd(1), MO_TE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Parallel port */</div>
<div>diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c</div>
<div>index 20e019b..efb6690 100644</div>
<div>--- a/hw/mips/mips_malta.c</div>
<div>&#43;&#43;&#43; b/hw/mips/mips_malta.c</div>
<div>@@ -511,7 &#43;511,7 @@ static void malta_fpga_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps malta_fpga_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D malta_fpga_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D malta_fpga_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void malta_fpga_reset(void *opaque)</div>
<div>@@ -572,7 &#43;572,7 @@ static MaltaFPGAState *malta_fpga_init(MemoryR=
egion *address_space,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; malta_fgpa_display_event, NULL, s, NULL,=
 true);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;s-&gt;uart =3D serial_mm_init(address_space, base =
&#43; 0x900, 3, uart_irq,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; 230400, uart_chr, DEVICE_NATIVE_ENDIAN);</div=
>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 230400, uart_chr, MO_TE);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;malta_fpga_reset(s);</div>
<div>&nbsp; &nbsp; &nbsp;qemu_register_reset(malta_fpga_reset, s);</div>
<div>diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c</div>
<div>index 93dbf76..a013ac7 100644</div>
<div>--- a/hw/mips/mips_r4k.c</div>
<div>&#43;&#43;&#43; b/hw/mips/mips_r4k.c</div>
<div>@@ -70,7 &#43;70,7 @@ static uint64_t mips_qemu_read (void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps mips_qemu_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mips_qemu_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mips_qemu_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;typedef struct ResetData {</div>
<div>diff --git a/hw/misc/a9scu.c b/hw/misc/a9scu.c</div>
<div>index 3de8cd3..2b96f1c 100644</div>
<div>--- a/hw/misc/a9scu.c</div>
<div>&#43;&#43;&#43; b/hw/misc/a9scu.c</div>
<div>@@ -94,7 &#43;94,7 @@ static void a9_scu_write(void *opaque, hwaddr of=
fset,</div>
<div>&nbsp;static const MemoryRegionOps a9_scu_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D a9_scu_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D a9_scu_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void a9_scu_reset(DeviceState *dev)</div>
<div>diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c</div>
<div>index 6c91f29..086d05c 100644</div>
<div>--- a/hw/misc/applesmc.c</div>
<div>&#43;&#43;&#43; b/hw/misc/applesmc.c</div>
<div>@@ -285,7 &#43;285,7 @@ static void qdev_applesmc_isa_reset(DeviceStat=
e *dev)</div>
<div>&nbsp;static const MemoryRegionOps applesmc_data_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D applesmc_io_data_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D applesmc_io_data_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -295,7 &#43;295,7 @@ static const MemoryRegionOps applesmc_data_io_=
ops =3D {</div>
<div>&nbsp;static const MemoryRegionOps applesmc_cmd_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D applesmc_io_cmd_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D applesmc_io_cmd_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -305,7 &#43;305,7 @@ static const MemoryRegionOps applesmc_cmd_io_o=
ps =3D {</div>
<div>&nbsp;static const MemoryRegionOps applesmc_err_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D applesmc_io_err_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D applesmc_io_err_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/misc/arm11scu.c b/hw/misc/arm11scu.c</div>
<div>index 59fd7c0..840a308 100644</div>
<div>--- a/hw/misc/arm11scu.c</div>
<div>&#43;&#43;&#43; b/hw/misc/arm11scu.c</div>
<div>@@ -57,7 &#43;57,7 @@ static void mpcore_scu_write(void *opaque, hwadd=
r offset,</div>
<div>&nbsp;static const MemoryRegionOps mpcore_scu_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mpcore_scu_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mpcore_scu_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void arm11_scu_realize(DeviceState *dev, Error **errp)</d=
iv>
<div>diff --git a/hw/misc/arm_integrator_debug.c b/hw/misc/arm_integrator_d=
ebug.c</div>
<div>index 2646107..917fe1f 100644</div>
<div>--- a/hw/misc/arm_integrator_debug.c</div>
<div>&#43;&#43;&#43; b/hw/misc/arm_integrator_debug.c</div>
<div>@@ -73,7 &#43;73,7 @@ static void intdbg_control_write(void *opaque, h=
waddr offset,</div>
<div>&nbsp;static const MemoryRegionOps intdbg_control_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D intdbg_control_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D intdbg_control_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void intdbg_control_init(Object *obj)</div>
<div>diff --git a/hw/misc/arm_l2x0.c b/hw/misc/arm_l2x0.c</div>
<div>index 72ecf46..8e63393 100644</div>
<div>--- a/hw/misc/arm_l2x0.c</div>
<div>&#43;&#43;&#43; b/hw/misc/arm_l2x0.c</div>
<div>@@ -157,7 &#43;157,7 @@ static void l2x0_priv_reset(DeviceState *dev)<=
/div>
<div>&nbsp;static const MemoryRegionOps l2x0_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D l2x0_priv_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D l2x0_priv_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; };</div>
<div>&nbsp;</div>
<div>&nbsp;static void l2x0_priv_init(Object *obj)</div>
<div>diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c</div>
<div>index 457dfad..736a708 100644</div>
<div>--- a/hw/misc/arm_sysctl.c</div>
<div>&#43;&#43;&#43; b/hw/misc/arm_sysctl.c</div>
<div>@@ -561,7 &#43;561,7 @@ static void arm_sysctl_write(void *opaque, hwa=
ddr offset,</div>
<div>&nbsp;static const MemoryRegionOps arm_sysctl_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D arm_sysctl_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D arm_sysctl_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void arm_sysctl_gpio_set(void *opaque, int line, int leve=
l)</div>
<div>diff --git a/hw/misc/armsse-cpuid.c b/hw/misc/armsse-cpuid.c</div>
<div>index 05c08f3..3da0f02 100644</div>
<div>--- a/hw/misc/armsse-cpuid.c</div>
<div>&#43;&#43;&#43; b/hw/misc/armsse-cpuid.c</div>
<div>@@ -84,7 &#43;84,7 @@ static void armsse_cpuid_write(void *opaque, hwa=
ddr offset,</div>
<div>&nbsp;static const MemoryRegionOps armsse_cpuid_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D armsse_cpuid_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D armsse_cpuid_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;/* byte/halfword accesses are just zero-padded on =
reads and writes */</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>diff --git a/hw/misc/armsse-mhu.c b/hw/misc/armsse-mhu.c</div>
<div>index 514321a..b57f892 100644</div>
<div>--- a/hw/misc/armsse-mhu.c</div>
<div>&#43;&#43;&#43; b/hw/misc/armsse-mhu.c</div>
<div>@@ -139,7 &#43;139,7 @@ static void armsse_mhu_write(void *opaque, hwa=
ddr offset,</div>
<div>&nbsp;static const MemoryRegionOps armsse_mhu_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D armsse_mhu_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D armsse_mhu_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c</div>
<div>index 71a0d4b..fca5fe5 100644</div>
<div>--- a/hw/misc/aspeed_scu.c</div>
<div>&#43;&#43;&#43; b/hw/misc/aspeed_scu.c</div>
<div>@@ -276,7 &#43;276,7 @@ static void aspeed_scu_write(void *opaque, hwa=
ddr offset, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps aspeed_scu_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aspeed_scu_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aspeed_scu_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.unaligned =3D false,</div>
<div>diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c</div>
<div>index b84676d..6444afb 100644</div>
<div>--- a/hw/misc/aspeed_sdmc.c</div>
<div>&#43;&#43;&#43; b/hw/misc/aspeed_sdmc.c</div>
<div>@@ -169,7 &#43;169,7 @@ static void aspeed_sdmc_write(void *opaque, hw=
addr addr, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps aspeed_sdmc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aspeed_sdmc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aspeed_sdmc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/misc/aspeed_xdma.c b/hw/misc/aspeed_xdma.c</div>
<div>index eebd4ad..3568a40 100644</div>
<div>--- a/hw/misc/aspeed_xdma.c</div>
<div>&#43;&#43;&#43; b/hw/misc/aspeed_xdma.c</div>
<div>@@ -106,7 &#43;106,7 @@ static void aspeed_xdma_write(void *opaque, hw=
addr addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps aspeed_xdma_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aspeed_xdma_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aspeed_xdma_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c</div>
<div>index a87da5e..0e19b3f 100644</div>
<div>--- a/hw/misc/bcm2835_mbox.c</div>
<div>&#43;&#43;&#43; b/hw/misc/bcm2835_mbox.c</div>
<div>@@ -237,7 &#43;237,7 @@ static void bcm2835_mbox_write(void *opaque, h=
waddr offset,</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_mbox_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_mbox_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_mbox_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c</=
div>
<div>index 0bf789c..0085902 100644</div>
<div>--- a/hw/misc/bcm2835_property.c</div>
<div>&#43;&#43;&#43; b/hw/misc/bcm2835_property.c</div>
<div>@@ -343,7 &#43;343,7 @@ static void bcm2835_property_write(void *opaqu=
e, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_property_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_property_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_property_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c</div>
<div>index e882c87..8e0b329 100644</div>
<div>--- a/hw/misc/bcm2835_rng.c</div>
<div>&#43;&#43;&#43; b/hw/misc/bcm2835_rng.c</div>
<div>@@ -91,7 &#43;91,7 @@ static void bcm2835_rng_write(void *opaque, hwad=
dr offset,</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_rng_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_rng_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_rng_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_bcm2835_rng =3D {</div>
<div>diff --git a/hw/misc/debugexit.c b/hw/misc/debugexit.c</div>
<div>index 8e4a2fc..c34960e 100644</div>
<div>--- a/hw/misc/debugexit.c</div>
<div>&#43;&#43;&#43; b/hw/misc/debugexit.c</div>
<div>@@ -40,7 &#43;40,7 @@ static const MemoryRegionOps debug_exit_ops =3D =
{</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D debug_exit_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void debug_exit_realizefn(DeviceState *d, Error **errp)</=
div>
<div>diff --git a/hw/misc/eccmemctl.c b/hw/misc/eccmemctl.c</div>
<div>index 8386db0..f01b397 100644</div>
<div>--- a/hw/misc/eccmemctl.c</div>
<div>&#43;&#43;&#43; b/hw/misc/eccmemctl.c</div>
<div>@@ -228,7 &#43;228,7 @@ static uint64_t ecc_mem_read(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps ecc_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ecc_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ecc_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -257,7 &#43;257,7 @@ static uint64_t ecc_diag_mem_read(void *opaque=
, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps ecc_diag_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ecc_diag_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ecc_diag_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/misc/edu.c b/hw/misc/edu.c</div>
<div>index 3b6dba2..73252d0 100644</div>
<div>--- a/hw/misc/edu.c</div>
<div>&#43;&#43;&#43; b/hw/misc/edu.c</div>
<div>@@ -294,7 &#43;294,7 @@ static void edu_mmio_write(void *opaque, hwadd=
r addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps edu_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D edu_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D edu_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>diff --git a/hw/misc/exynos4210_clk.c b/hw/misc/exynos4210_clk.c</div>
<div>index 821d9ea..b83bb88 100644</div>
<div>--- a/hw/misc/exynos4210_clk.c</div>
<div>&#43;&#43;&#43; b/hw/misc/exynos4210_clk.c</div>
<div>@@ -100,7 &#43;100,7 @@ static void exynos4210_clk_write(void *opaque,=
 hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps exynos4210_clk_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D exynos4210_clk_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D exynos4210_clk_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c</div>
<div>index 8712774..75617f9 100644</div>
<div>--- a/hw/misc/exynos4210_pmu.c</div>
<div>&#43;&#43;&#43; b/hw/misc/exynos4210_pmu.c</div>
<div>@@ -457,7 &#43;457,7 @@ static void exynos4210_pmu_write(void *opaque,=
 hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps exynos4210_pmu_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D exynos4210_pmu_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D exynos4210_pmu_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/misc/exynos4210_rng.c b/hw/misc/exynos4210_rng.c</div>
<div>index b88fe3a..644f647 100644</div>
<div>--- a/hw/misc/exynos4210_rng.c</div>
<div>&#43;&#43;&#43; b/hw/misc/exynos4210_rng.c</div>
<div>@@ -215,7 &#43;215,7 @@ static void exynos4210_rng_write(void *opaque,=
 hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps exynos4210_rng_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D exynos4210_rng_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D exynos4210_rng_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void exynos4210_rng_reset(DeviceState *dev)</div>
<div>diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c=
</div>
<div>index 7338461..a85624e 100644</div>
<div>--- a/hw/misc/grlib_ahb_apb_pnp.c</div>
<div>&#43;&#43;&#43; b/hw/misc/grlib_ahb_apb_pnp.c</div>
<div>@@ -137,7 &#43;137,7 @@ static uint64_t grlib_ahb_pnp_read(void *opaqu=
e, hwaddr offset, unsigned size)</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps grlib_ahb_pnp_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp; &nbsp; &nbsp; =3D grlib_ahb_pnp_read,=
</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void grlib_ahb_pnp_realize(DeviceState *dev, Error **errp=
)</div>
<div>@@ -233,7 &#43;233,7 @@ static uint64_t grlib_apb_pnp_read(void *opaqu=
e, hwaddr offset, unsigned size)</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps grlib_apb_pnp_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp; &nbsp; &nbsp; =3D grlib_apb_pnp_read,=
</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void grlib_apb_pnp_realize(DeviceState *dev, Error **errp=
)</div>
<div>diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c</div>
<div>index 693ea81..9a7fbe7 100644</div>
<div>--- a/hw/misc/imx25_ccm.c</div>
<div>&#43;&#43;&#43; b/hw/misc/imx25_ccm.c</div>
<div>@@ -266,7 &#43;266,7 @@ static void imx25_ccm_write(void *opaque, hwad=
dr offset, uint64_t value,</div>
<div>&nbsp;static const struct MemoryRegionOps imx25_ccm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx25_ccm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx25_ccm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>diff --git a/hw/misc/imx2_wdt.c b/hw/misc/imx2_wdt.c</div>
<div>index 5576778..07e97a2 100644</div>
<div>--- a/hw/misc/imx2_wdt.c</div>
<div>&#43;&#43;&#43; b/hw/misc/imx2_wdt.c</div>
<div>@@ -37,7 &#43;37,7 @@ static void imx2_wdt_write(void *opaque, hwaddr =
addr,</div>
<div>&nbsp;static const MemoryRegionOps imx2_wdt_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp;=3D imx2_wdt_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx2_wdt_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>diff --git a/hw/misc/imx31_ccm.c b/hw/misc/imx31_ccm.c</div>
<div>index 38a19aa..08a5969 100644</div>
<div>--- a/hw/misc/imx31_ccm.c</div>
<div>&#43;&#43;&#43; b/hw/misc/imx31_ccm.c</div>
<div>@@ -292,7 &#43;292,7 @@ static void imx31_ccm_write(void *opaque, hwad=
dr offset, uint64_t value,</div>
<div>&nbsp;static const struct MemoryRegionOps imx31_ccm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx31_ccm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx31_ccm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c</div>
<div>index 9478007..e93f4a1 100644</div>
<div>--- a/hw/misc/imx6_ccm.c</div>
<div>&#43;&#43;&#43; b/hw/misc/imx6_ccm.c</div>
<div>@@ -696,7 &#43;696,7 @@ static void imx6_analog_write(void *opaque, hw=
addr offset, uint64_t value,</div>
<div>&nbsp;static const struct MemoryRegionOps imx6_ccm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx6_ccm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx6_ccm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>@@ -713,7 &#43;713,7 @@ static const struct MemoryRegionOps imx6_ccm_o=
ps =3D {</div>
<div>&nbsp;static const struct MemoryRegionOps imx6_analog_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx6_analog_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx6_analog_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c</div>
<div>index 878ffcd..85f40ac 100644</div>
<div>--- a/hw/misc/imx6_src.c</div>
<div>&#43;&#43;&#43; b/hw/misc/imx6_src.c</div>
<div>@@ -262,7 &#43;262,7 @@ static void imx6_src_write(void *opaque, hwadd=
r offset, uint64_t value,</div>
<div>&nbsp;static const struct MemoryRegionOps imx6_src_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx6_src_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx6_src_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>diff --git a/hw/misc/imx6ul_ccm.c b/hw/misc/imx6ul_ccm.c</div>
<div>index 37b472d..88acb69 100644</div>
<div>--- a/hw/misc/imx6ul_ccm.c</div>
<div>&#43;&#43;&#43; b/hw/misc/imx6ul_ccm.c</div>
<div>@@ -801,7 &#43;801,7 @@ static void imx6ul_analog_write(void *opaque, =
hwaddr offset, uint64_t value,</div>
<div>&nbsp;static const struct MemoryRegionOps imx6ul_ccm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx6ul_ccm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx6ul_ccm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>@@ -818,7 &#43;818,7 @@ static const struct MemoryRegionOps imx6ul_ccm=
_ops =3D {</div>
<div>&nbsp;static const struct MemoryRegionOps imx6ul_analog_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx6ul_analog_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx6ul_analog_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>diff --git a/hw/misc/imx7_ccm.c b/hw/misc/imx7_ccm.c</div>
<div>index d9bdcf1..3305316 100644</div>
<div>--- a/hw/misc/imx7_ccm.c</div>
<div>&#43;&#43;&#43; b/hw/misc/imx7_ccm.c</div>
<div>@@ -116,7 &#43;116,7 @@ static void imx7_set_clr_tog_write(void *opaqu=
e, hwaddr offset,</div>
<div>&nbsp;static const struct MemoryRegionOps imx7_set_clr_tog_ops =3D {</=
div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx7_set_clr_tog_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx7_set_clr_tog_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>@@ -132,7 &#43;132,7 @@ static const struct MemoryRegionOps imx7_set_c=
lr_tog_ops =3D {</div>
<div>&nbsp;</div>
<div>&nbsp;static const struct MemoryRegionOps imx7_digprog_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx7_set_clr_tog_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/misc/imx7_gpr.c b/hw/misc/imx7_gpr.c</div>
<div>index 09d57d4..3cb144b 100644</div>
<div>--- a/hw/misc/imx7_gpr.c</div>
<div>&#43;&#43;&#43; b/hw/misc/imx7_gpr.c</div>
<div>@@ -79,7 &#43;79,7 @@ static void imx7_gpr_write(void *opaque, hwaddr =
offset,</div>
<div>&nbsp;static const struct MemoryRegionOps imx7_gpr_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx7_gpr_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx7_gpr_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>diff --git a/hw/misc/imx7_snvs.c b/hw/misc/imx7_snvs.c</div>
<div>index 55b962a..373d586 100644</div>
<div>--- a/hw/misc/imx7_snvs.c</div>
<div>&#43;&#43;&#43; b/hw/misc/imx7_snvs.c</div>
<div>@@ -37,7 &#43;37,7 @@ static void imx7_snvs_write(void *opaque, hwaddr=
 offset,</div>
<div>&nbsp;static const struct MemoryRegionOps imx7_snvs_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx7_snvs_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx7_snvs_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c</div>
<div>index 58fd94b..7cb1424 100644</div>
<div>--- a/hw/misc/iotkit-secctl.c</div>
<div>&#43;&#43;&#43; b/hw/misc/iotkit-secctl.c</div>
<div>@@ -560,7 &#43;560,7 @@ static MemTxResult iotkit_secctl_ns_write(void=
 *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps iotkit_secctl_s_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D iotkit_secctl_s_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D iotkit_secctl_s_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>@@ -570,7 &#43;570,7 @@ static const MemoryRegionOps iotkit_secctl_s_o=
ps =3D {</div>
<div>&nbsp;static const MemoryRegionOps iotkit_secctl_ns_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D iotkit_secctl_ns_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D iotkit_secctl_ns_write,</div=
>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c</div>
<div>index 00d4faa..6969a18 100644</div>
<div>--- a/hw/misc/iotkit-sysctl.c</div>
<div>&#43;&#43;&#43; b/hw/misc/iotkit-sysctl.c</div>
<div>@@ -388,7 &#43;388,7 @@ static void iotkit_sysctl_write(void *opaque, =
hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps iotkit_sysctl_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D iotkit_sysctl_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D iotkit_sysctl_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;/* byte/halfword accesses are just zero-padded on =
reads and writes */</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c</div>
<div>index 3e1cf0e..7f4133f 100644</div>
<div>--- a/hw/misc/iotkit-sysinfo.c</div>
<div>&#43;&#43;&#43; b/hw/misc/iotkit-sysinfo.c</div>
<div>@@ -88,7 &#43;88,7 @@ static void iotkit_sysinfo_write(void *opaque, h=
waddr offset,</div>
<div>&nbsp;static const MemoryRegionOps iotkit_sysinfo_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D iotkit_sysinfo_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D iotkit_sysinfo_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;/* byte/halfword accesses are just zero-padded on =
reads and writes */</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c</div>
<div>index f9cc66a..bc69cd7 100644</div>
<div>--- a/hw/misc/ivshmem.c</div>
<div>&#43;&#43;&#43; b/hw/misc/ivshmem.c</div>
<div>@@ -275,7 &#43;275,7 @@ static uint64_t ivshmem_io_read(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps ivshmem_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ivshmem_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ivshmem_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c</div>
<div>index 4f532ef..ad6d6b5 100644</div>
<div>--- a/hw/misc/macio/cuda.c</div>
<div>&#43;&#43;&#43; b/hw/misc/macio/cuda.c</div>
<div>@@ -477,7 &#43;477,7 @@ static void mos6522_cuda_write(void *opaque, h=
waddr addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps mos6522_cuda_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mos6522_cuda_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mos6522_cuda_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c</div>
<div>index 31811ab..c4c9a68 100644</div>
<div>--- a/hw/misc/macio/gpio.c</div>
<div>&#43;&#43;&#43; b/hw/misc/macio/gpio.c</div>
<div>@@ -144,7 &#43;144,7 @@ static uint64_t macio_gpio_read(void *opaque, =
hwaddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps macio_gpio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D macio_gpio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D macio_gpio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/misc/macio/mac_dbdma.c b/hw/misc/macio/mac_dbdma.c</di=
v>
<div>index 548625a..4554b28 100644</div>
<div>--- a/hw/misc/macio/mac_dbdma.c</div>
<div>&#43;&#43;&#43; b/hw/misc/macio/mac_dbdma.c</div>
<div>@@ -793,7 &#43;793,7 @@ static uint64_t dbdma_read(void *opaque, hwadd=
r addr,</div>
<div>&nbsp;static const MemoryRegionOps dbdma_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D dbdma_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D dbdma_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c</div>
<div>index 8249209..693bb26 100644</div>
<div>--- a/hw/misc/macio/macio.c</div>
<div>&#43;&#43;&#43; b/hw/misc/macio/macio.c</div>
<div>@@ -284,7 &#43;284,7 @@ static uint64_t timer_read(void *opaque, hwadd=
r addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void macio_newworld_realize(PCIDevice *d, Error **errp)</=
div>
<div>diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c</div>
<div>index 753561d..fb0d132 100644</div>
<div>--- a/hw/misc/macio/pmu.c</div>
<div>&#43;&#43;&#43; b/hw/misc/macio/pmu.c</div>
<div>@@ -664,7 &#43;664,7 @@ static void mos6522_pmu_write(void *opaque, hw=
addr addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps mos6522_pmu_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mos6522_pmu_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mos6522_pmu_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/misc/milkymist-hpdmc.c b/hw/misc/milkymist-hpdmc.c</di=
v>
<div>index 701c79e..33ecefb 100644</div>
<div>--- a/hw/misc/milkymist-hpdmc.c</div>
<div>&#43;&#43;&#43; b/hw/misc/milkymist-hpdmc.c</div>
<div>@@ -113,7 &#43;113,7 @@ static const MemoryRegionOps hpdmc_mmio_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void milkymist_hpdmc_reset(DeviceState *d)</div>
<div>diff --git a/hw/misc/milkymist-pfpu.c b/hw/misc/milkymist-pfpu.c</div>
<div>index 1c27f1a..e7c777b 100644</div>
<div>--- a/hw/misc/milkymist-pfpu.c</div>
<div>&#43;&#43;&#43; b/hw/misc/milkymist-pfpu.c</div>
<div>@@ -475,7 &#43;475,7 @@ static const MemoryRegionOps pfpu_mmio_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void milkymist_pfpu_reset(DeviceState *d)</div>
<div>diff --git a/hw/misc/mips_cmgcr.c b/hw/misc/mips_cmgcr.c</div>
<div>index edec164..f09cf1f 100644</div>
<div>--- a/hw/misc/mips_cmgcr.c</div>
<div>&#43;&#43;&#43; b/hw/misc/mips_cmgcr.c</div>
<div>@@ -170,7 &#43;170,7 @@ static void gcr_write(void *opaque, hwaddr add=
r, uint64_t data, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps gcr_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D gcr_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D gcr_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>diff --git a/hw/misc/mips_cpc.c b/hw/misc/mips_cpc.c</div>
<div>index 446b1ad..2244ee4 100644</div>
<div>--- a/hw/misc/mips_cpc.c</div>
<div>&#43;&#43;&#43; b/hw/misc/mips_cpc.c</div>
<div>@@ -111,7 &#43;111,7 @@ static uint64_t cpc_read(void *opaque, hwaddr =
offset, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps cpc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cpc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cpc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c</div>
<div>index e8ba4a3..7369d7c 100644</div>
<div>--- a/hw/misc/mips_itu.c</div>
<div>&#43;&#43;&#43; b/hw/misc/mips_itu.c</div>
<div>@@ -141,7 &#43;141,7 @@ static const MemoryRegionOps itc_tag_ops =3D {=
</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static inline uint32_t get_num_cells(MIPSITUState *s)</div>
<div>@@ -482,7 &#43;482,7 @@ static void itc_storage_write(void *opaque, hw=
addr addr, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps itc_storage_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D itc_storage_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D itc_storage_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void itc_reset_cells(MIPSITUState *s)</div>
<div>diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c</div>
<div>index e72ed69..60f4208 100644</div>
<div>--- a/hw/misc/mos6522.c</div>
<div>&#43;&#43;&#43; b/hw/misc/mos6522.c</div>
<div>@@ -364,7 &#43;364,7 @@ void mos6522_write(void *opaque, hwaddr addr, =
uint64_t val, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps mos6522_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mos6522_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mos6522_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c</div>
<div>index b97ad42..7d894e4 100644</div>
<div>--- a/hw/misc/mps2-fpgaio.c</div>
<div>&#43;&#43;&#43; b/hw/misc/mps2-fpgaio.c</div>
<div>@@ -220,7 &#43;220,7 @@ static void mps2_fpgaio_write(void *opaque, hw=
addr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps mps2_fpgaio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mps2_fpgaio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mps2_fpgaio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void mps2_fpgaio_reset(DeviceState *dev)</div>
<div>diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c</div>
<div>index 1fdf5d2..9a089e3 100644</div>
<div>--- a/hw/misc/mps2-scc.c</div>
<div>&#43;&#43;&#43; b/hw/misc/mps2-scc.c</div>
<div>@@ -215,7 &#43;215,7 @@ static void mps2_scc_write(void *opaque, hwadd=
r offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps mps2_scc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mps2_scc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mps2_scc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void mps2_scc_reset(DeviceState *dev)</div>
<div>diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c</div>
<div>index 21a2863..33282dc 100644</div>
<div>--- a/hw/misc/msf2-sysreg.c</div>
<div>&#43;&#43;&#43; b/hw/misc/msf2-sysreg.c</div>
<div>@@ -94,7 &#43;94,7 @@ static void msf2_sysreg_write(void *opaque, hwad=
dr offset,</div>
<div>&nbsp;static const MemoryRegionOps sysreg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D msf2_sysreg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D msf2_sysreg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void msf2_sysreg_init(Object *obj)</div>
<div>diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c</div>
<div>index fd18303..d339380 100644</div>
<div>--- a/hw/misc/mst_fpga.c</div>
<div>&#43;&#43;&#43; b/hw/misc/mst_fpga.c</div>
<div>@@ -189,9 &#43;189,9 @@ mst_fpga_writeb(void *opaque, hwaddr addr, uin=
t64_t value,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps mst_fpga_ops =3D {</div>
<div>-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>.rea=
d =3D mst_fpga_readb,</div>
<div>-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>.wri=
te =3D mst_fpga_writeb,</div>
<div>-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>.end=
ianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.read =3D mst_fpga_readb,</div>
<div>&#43; &nbsp; &nbsp;.write =3D mst_fpga_writeb,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int mst_fpga_post_load(void *opaque, int version_id)</div=
>
<div>diff --git a/hw/misc/nrf51_rng.c b/hw/misc/nrf51_rng.c</div>
<div>index 96ef433..9614446 100644</div>
<div>--- a/hw/misc/nrf51_rng.c</div>
<div>&#43;&#43;&#43; b/hw/misc/nrf51_rng.c</div>
<div>@@ -137,7 &#43;137,7 @@ static void rng_write(void *opaque, hwaddr off=
set,</div>
<div>&nbsp;static const MemoryRegionOps rng_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D &nbsp;rng_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D rng_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/misc/omap_gpmc.c b/hw/misc/omap_gpmc.c</div>
<div>index 84f9e4c..00da920 100644</div>
<div>--- a/hw/misc/omap_gpmc.c</div>
<div>&#43;&#43;&#43; b/hw/misc/omap_gpmc.c</div>
<div>@@ -212,7 &#43;212,7 @@ static void omap_nand_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_nand_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_nand_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_nand_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void fill_prefetch_fifo(struct omap_gpmc_s *s)</div>
<div>@@ -369,7 &#43;369,7 @@ static void omap_gpmc_prefetch_write(void *opa=
que, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_prefetch_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_gpmc_prefetch_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_gpmc_prefetch_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 1,</div>
<div>&nbsp;};</div>
<div>@@ -819,7 &#43;819,7 @@ static void omap_gpmc_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_gpmc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_gpmc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_gpmc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;struct omap_gpmc_s *omap_gpmc_init(struct omap_mpu_state_s *mpu,=
</div>
<div>diff --git a/hw/misc/omap_l4.c b/hw/misc/omap_l4.c</div>
<div>index c217728..c09cbad 100644</div>
<div>--- a/hw/misc/omap_l4.c</div>
<div>&#43;&#43;&#43; b/hw/misc/omap_l4.c</div>
<div>@@ -107,7 &#43;107,7 @@ static void omap_l4ta_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_l4ta_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_l4ta_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_l4ta_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;struct omap_target_agent_s *omap_l4ta_get(struct omap_l4_s *bus,=
</div>
<div>diff --git a/hw/misc/omap_sdrc.c b/hw/misc/omap_sdrc.c</div>
<div>index 7b38c55..f9863de 100644</div>
<div>--- a/hw/misc/omap_sdrc.c</div>
<div>&#43;&#43;&#43; b/hw/misc/omap_sdrc.c</div>
<div>@@ -152,7 &#43;152,7 @@ static void omap_sdrc_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_sdrc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_sdrc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_sdrc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;struct omap_sdrc_s *omap_sdrc_init(MemoryRegion *sysmem,</div>
<div>diff --git a/hw/misc/omap_tap.c b/hw/misc/omap_tap.c</div>
<div>index 3f595e8..d005ac2 100644</div>
<div>--- a/hw/misc/omap_tap.c</div>
<div>&#43;&#43;&#43; b/hw/misc/omap_tap.c</div>
<div>@@ -106,7 &#43;106,7 @@ static void omap_tap_write(void *opaque, hwadd=
r addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_tap_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_tap_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_tap_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void omap_tap_init(struct omap_target_agent_s *ta,</div>
<div>diff --git a/hw/misc/pc-testdev.c b/hw/misc/pc-testdev.c</div>
<div>index 1f9abd5..34a9227 100644</div>
<div>--- a/hw/misc/pc-testdev.c</div>
<div>&#43;&#43;&#43; b/hw/misc/pc-testdev.c</div>
<div>@@ -78,7 &#43;78,7 @@ static const MemoryRegionOps test_irq_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp;.write =3D test_irq_line_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 1,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void test_ioport_write(void *opaque, hwaddr addr, uint64_=
t data,</div>
<div>@@ -104,7 &#43;104,7 @@ static uint64_t test_ioport_read(void *opaque,=
 hwaddr addr, unsigned len)</div>
<div>&nbsp;static const MemoryRegionOps test_ioport_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D test_ioport_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D test_ioport_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps test_ioport_byte_ops =3D {</div>
<div>@@ -114,7 &#43;114,7 @@ static const MemoryRegionOps test_ioport_byte_=
ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 1,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t test_flush_page_read(void *opaque, hwaddr addr, =
unsigned size)</div>
<div>@@ -142,7 &#43;142,7 @@ static const MemoryRegionOps test_flush_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D test_flush_page_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t test_iomem_read(void *opaque, hwaddr addr, unsig=
ned len)</div>
<div>@@ -165,7 &#43;165,7 @@ static void test_iomem_write(void *opaque, hwa=
ddr addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps test_iomem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D test_iomem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D test_iomem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void testdev_realizefn(DeviceState *d, Error **errp)</div=
>
<div>diff --git a/hw/misc/pci-testdev.c b/hw/misc/pci-testdev.c</div>
<div>index d4d89df..ee9c575 100644</div>
<div>--- a/hw/misc/pci-testdev.c</div>
<div>&#43;&#43;&#43; b/hw/misc/pci-testdev.c</div>
<div>@@ -222,7 &#43;222,7 @@ pci_testdev_pio_write(void *opaque, hwaddr add=
r, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps pci_testdev_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_testdev_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_testdev_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -232,7 &#43;232,7 @@ static const MemoryRegionOps pci_testdev_mmio_=
ops =3D {</div>
<div>&nbsp;static const MemoryRegionOps pci_testdev_pio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_testdev_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_testdev_pio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/misc/puv3_pm.c b/hw/misc/puv3_pm.c</div>
<div>index cd82b69..b7ad46f 100644</div>
<div>--- a/hw/misc/puv3_pm.c</div>
<div>&#43;&#43;&#43; b/hw/misc/puv3_pm.c</div>
<div>@@ -118,7 &#43;118,7 @@ static const MemoryRegionOps puv3_pm_ops =3D {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void puv3_pm_realize(DeviceState *dev, Error **errp)</div=
>
<div>diff --git a/hw/misc/slavio_misc.c b/hw/misc/slavio_misc.c</div>
<div>index 9c2cf04..bbff86f 100644</div>
<div>--- a/hw/misc/slavio_misc.c</div>
<div>&#43;&#43;&#43; b/hw/misc/slavio_misc.c</div>
<div>@@ -142,7 &#43;142,7 @@ static uint64_t slavio_cfg_mem_readb(void *opa=
que, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps slavio_cfg_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D slavio_cfg_mem_readb,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D slavio_cfg_mem_writeb,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -172,7 &#43;172,7 @@ static uint64_t slavio_diag_mem_readb(void *op=
aque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps slavio_diag_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D slavio_diag_mem_readb,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D slavio_diag_mem_writeb,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -202,7 &#43;202,7 @@ static uint64_t slavio_mdm_mem_readb(void *opa=
que, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps slavio_mdm_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D slavio_mdm_mem_readb,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D slavio_mdm_mem_writeb,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -240,7 &#43;240,7 @@ static uint64_t slavio_aux1_mem_readb(void *op=
aque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps slavio_aux1_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D slavio_aux1_mem_readb,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D slavio_aux1_mem_writeb,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -277,7 &#43;277,7 @@ static uint64_t slavio_aux2_mem_readb(void *op=
aque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps slavio_aux2_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D slavio_aux2_mem_readb,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D slavio_aux2_mem_writeb,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -305,7 &#43;305,7 @@ static uint64_t apc_mem_readb(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps apc_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D apc_mem_readb,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D apc_mem_writeb,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -350,7 &#43;350,7 @@ static void slavio_sysctrl_mem_writel(void *op=
aque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps slavio_sysctrl_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D slavio_sysctrl_mem_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D slavio_sysctrl_mem_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -392,7 &#43;392,7 @@ static void slavio_led_mem_writew(void *opaque=
, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps slavio_led_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D slavio_led_mem_readw,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D slavio_led_mem_writew,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 2,</div>
<div>diff --git a/hw/misc/stm32f2xx_syscfg.c b/hw/misc/stm32f2xx_syscfg.c</=
div>
<div>index aa59b43..1efe7e2 100644</div>
<div>--- a/hw/misc/stm32f2xx_syscfg.c</div>
<div>&#43;&#43;&#43; b/hw/misc/stm32f2xx_syscfg.c</div>
<div>@@ -126,7 &#43;126,7 @@ static void stm32f2xx_syscfg_write(void *opaqu=
e, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps stm32f2xx_syscfg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D stm32f2xx_syscfg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D stm32f2xx_syscfg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void stm32f2xx_syscfg_init(Object *obj)</div>
<div>diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c</div>
<div>index 45a3e31..2924fc2 100644</div>
<div>--- a/hw/misc/tz-mpc.c</div>
<div>&#43;&#43;&#43; b/hw/misc/tz-mpc.c</div>
<div>@@ -332,7 &#43;332,7 @@ static MemTxResult tz_mpc_reg_write(void *opaq=
ue, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps tz_mpc_reg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D tz_mpc_reg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D tz_mpc_reg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>@@ -408,7 &#43;408,7 @@ static MemTxResult tz_mpc_mem_blocked_write(vo=
id *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps tz_mpc_mem_blocked_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D tz_mpc_mem_blocked_read,</div=
>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D tz_mpc_mem_blocked_write,</d=
iv>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>diff --git a/hw/misc/tz-msc.c b/hw/misc/tz-msc.c</div>
<div>index 52b96ba..bf68480 100644</div>
<div>--- a/hw/misc/tz-msc.c</div>
<div>&#43;&#43;&#43; b/hw/misc/tz-msc.c</div>
<div>@@ -206,7 &#43;206,7 @@ static MemTxResult tz_msc_write(void *opaque, =
hwaddr addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps tz_msc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D tz_msc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D tz_msc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void tz_msc_reset(DeviceState *dev)</div>
<div>diff --git a/hw/misc/tz-ppc.c b/hw/misc/tz-ppc.c</div>
<div>index 2a14a26..fd2bb07 100644</div>
<div>--- a/hw/misc/tz-ppc.c</div>
<div>&#43;&#43;&#43; b/hw/misc/tz-ppc.c</div>
<div>@@ -179,7 &#43;179,7 @@ static MemTxResult tz_ppc_write(void *opaque, =
hwaddr addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps tz_ppc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D tz_ppc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D tz_ppc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static bool tz_ppc_dummy_accepts(void *opaque, hwaddr addr,</div=
>
<div>diff --git a/hw/misc/unimp.c b/hw/misc/unimp.c</div>
<div>index 7f8e42c..2991bce 100644</div>
<div>--- a/hw/misc/unimp.c</div>
<div>&#43;&#43;&#43; b/hw/misc/unimp.c</div>
<div>@@ -47,7 &#43;47,7 @@ static const MemoryRegionOps unimp_ops =3D {</di=
v>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void unimp_realize(DeviceState *dev, Error **errp)</div>
<div>diff --git a/hw/misc/zynq-xadc.c b/hw/misc/zynq-xadc.c</div>
<div>index f1e4860..1fefac4 100644</div>
<div>--- a/hw/misc/zynq-xadc.c</div>
<div>&#43;&#43;&#43; b/hw/misc/zynq-xadc.c</div>
<div>@@ -251,7 &#43;251,7 @@ static void zynq_xadc_write(void *opaque, hwad=
dr offset, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps xadc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D zynq_xadc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D zynq_xadc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void zynq_xadc_init(Object *obj)</div>
<div>diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c</div>
<div>index 6b51ae5..75a01d0 100644</div>
<div>--- a/hw/misc/zynq_slcr.c</div>
<div>&#43;&#43;&#43; b/hw/misc/zynq_slcr.c</div>
<div>@@ -415,7 &#43;415,7 @@ static void zynq_slcr_write(void *opaque, hwad=
dr offset,</div>
<div>&nbsp;static const MemoryRegionOps slcr_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D zynq_slcr_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D zynq_slcr_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void zynq_slcr_init(Object *obj)</div>
<div>diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c</div>
<div>index d771d39..be6888c 100644</div>
<div>--- a/hw/moxie/moxiesim.c</div>
<div>&#43;&#43;&#43; b/hw/moxie/moxiesim.c</div>
<div>@@ -141,7 &#43;141,7 @@ static void moxiesim_init(MachineState *machin=
e)</div>
<div>&nbsp; &nbsp; &nbsp;/* A single 16450 sits at offset 0x3f8. &nbsp;*/</=
div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(0)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, 0x=
3f8, 0, env-&gt;irq[4],</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; 8000000/16, serial_hd(0), DEVICE_LITTLE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; 8000000 / 16, serial_hd(0), MO_LE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c</div>
<div>index 97e22e7..075334e 100644</div>
<div>--- a/hw/net/allwinner_emac.c</div>
<div>&#43;&#43;&#43; b/hw/net/allwinner_emac.c</div>
<div>@@ -418,7 &#43;418,7 @@ static void aw_emac_set_link(NetClientState *n=
c)</div>
<div>&nbsp;static const MemoryRegionOps aw_emac_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aw_emac_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aw_emac_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c</div>
<div>index d412085..fb00600 100644</div>
<div>--- a/hw/net/cadence_gem.c</div>
<div>&#43;&#43;&#43; b/hw/net/cadence_gem.c</div>
<div>@@ -1515,7 &#43;1515,7 @@ static void gem_write(void *opaque, hwaddr o=
ffset, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps gem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D gem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D gem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void gem_set_link(NetClientState *nc)</div>
<div>diff --git a/hw/net/can/can_kvaser_pci.c b/hw/net/can/can_kvaser_pci.c=
</div>
<div>index df639f8..8661c17 100644</div>
<div>--- a/hw/net/can/can_kvaser_pci.c</div>
<div>&#43;&#43;&#43; b/hw/net/can/can_kvaser_pci.c</div>
<div>@@ -190,7 &#43;190,7 @@ static void kvaser_pci_xilinx_io_write(void *o=
paque, hwaddr addr, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps kvaser_pci_s5920_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D kvaser_pci_s5920_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D kvaser_pci_s5920_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -200,7 &#43;200,7 @@ static const MemoryRegionOps kvaser_pci_s5920_=
io_ops =3D {</div>
<div>&nbsp;static const MemoryRegionOps kvaser_pci_sja_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D kvaser_pci_sja_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D kvaser_pci_sja_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>@@ -209,7 &#43;209,7 @@ static const MemoryRegionOps kvaser_pci_sja_io=
_ops =3D {</div>
<div>&nbsp;static const MemoryRegionOps kvaser_pci_xilinx_io_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp;.read =3D kvaser_pci_xilinx_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D kvaser_pci_xilinx_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>diff --git a/hw/net/can/can_mioe3680_pci.c b/hw/net/can/can_mioe3680_p=
ci.c</div>
<div>index 7af0993..013dae3 100644</div>
<div>--- a/hw/net/can/can_mioe3680_pci.c</div>
<div>&#43;&#43;&#43; b/hw/net/can/can_mioe3680_pci.c</div>
<div>@@ -135,7 &#43;135,7 @@ static void mioe3680_pci_sja2_io_write(void *o=
paque, hwaddr addr, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps mioe3680_pci_sja1_io_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp;.read =3D mioe3680_pci_sja1_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mioe3680_pci_sja1_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>@@ -144,7 &#43;144,7 @@ static const MemoryRegionOps mioe3680_pci_sja1=
_io_ops =3D {</div>
<div>&nbsp;static const MemoryRegionOps mioe3680_pci_sja2_io_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp;.read =3D mioe3680_pci_sja2_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mioe3680_pci_sja2_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>diff --git a/hw/net/can/can_pcm3680_pci.c b/hw/net/can/can_pcm3680_pci=
.c</div>
<div>index 3f7312a..2207b5b 100644</div>
<div>--- a/hw/net/can/can_pcm3680_pci.c</div>
<div>&#43;&#43;&#43; b/hw/net/can/can_pcm3680_pci.c</div>
<div>@@ -135,7 &#43;135,7 @@ static void pcm3680i_pci_sja2_io_write(void *o=
paque, hwaddr addr, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps pcm3680i_pci_sja1_io_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp;.read =3D pcm3680i_pci_sja1_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pcm3680i_pci_sja1_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>@@ -144,7 &#43;144,7 @@ static const MemoryRegionOps pcm3680i_pci_sja1=
_io_ops =3D {</div>
<div>&nbsp;static const MemoryRegionOps pcm3680i_pci_sja2_io_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp;.read =3D pcm3680i_pci_sja2_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pcm3680i_pci_sja2_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c</div>
<div>index bdb0b3b..b5c191c 100644</div>
<div>--- a/hw/net/dp8393x.c</div>
<div>&#43;&#43;&#43; b/hw/net/dp8393x.c</div>
<div>@@ -651,7 &#43;651,7 @@ static const MemoryRegionOps dp8393x_ops =3D {=
</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D dp8393x_write,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 2,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void dp8393x_watchdog(void *opaque)</div>
<div>diff --git a/hw/net/e1000.c b/hw/net/e1000.c</div>
<div>index a023ceb..4605407 100644</div>
<div>--- a/hw/net/e1000.c</div>
<div>&#43;&#43;&#43; b/hw/net/e1000.c</div>
<div>@@ -1341,7 &#43;1341,7 @@ e1000_mmio_read(void *opaque, hwaddr addr, u=
nsigned size)</div>
<div>&nbsp;static const MemoryRegionOps e1000_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D e1000_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D e1000_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1368,7 &#43;1368,7 @@ static void e1000_io_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps e1000_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D e1000_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D e1000_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static bool is_version_1(void *opaque, int version_id)</div>
<div>diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c</div>
<div>index 581f7d0..abcd6d3 100644</div>
<div>--- a/hw/net/e1000e.c</div>
<div>&#43;&#43;&#43; b/hw/net/e1000e.c</div>
<div>@@ -179,7 &#43;179,7 @@ e1000e_io_write(void *opaque, hwaddr addr,</di=
v>
<div>&nbsp;static const MemoryRegionOps mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D e1000e_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D e1000e_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -189,7 &#43;189,7 @@ static const MemoryRegionOps mmio_ops =3D {</d=
iv>
<div>&nbsp;static const MemoryRegionOps io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D e1000e_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D e1000e_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c</div>
<div>index 6607c91..b0d3265 100644</div>
<div>--- a/hw/net/eepro100.c</div>
<div>&#43;&#43;&#43; b/hw/net/eepro100.c</div>
<div>@@ -1601,7 &#43;1601,7 @@ static void eepro100_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps eepro100_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D eepro100_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D eepro100_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static ssize_t nic_receive(NetClientState *nc, const uint8_t * b=
uf, size_t size)</div>
<div>diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c</div>
<div>index 4cfbf11..f748f5e 100644</div>
<div>--- a/hw/net/etraxfs_eth.c</div>
<div>&#43;&#43;&#43; b/hw/net/etraxfs_eth.c</div>
<div>@@ -569,7 &#43;569,7 @@ static void eth_set_link(NetClientState *nc)</=
div>
<div>&nbsp;static const MemoryRegionOps eth_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D eth_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D eth_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c</div>
<div>index 2a8b99a..9e5f1cb 100644</div>
<div>--- a/hw/net/fsl_etsec/etsec.c</div>
<div>&#43;&#43;&#43; b/hw/net/fsl_etsec/etsec.c</div>
<div>@@ -281,7 &#43;281,7 @@ static void etsec_write(void &nbsp; &nbsp; *op=
aque,</div>
<div>&nbsp;static const MemoryRegionOps etsec_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D etsec_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D etsec_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c</div>
<div>index d2cded5..6d0d6a4 100644</div>
<div>--- a/hw/net/ftgmac100.c</div>
<div>&#43;&#43;&#43; b/hw/net/ftgmac100.c</div>
<div>@@ -979,7 &#43;979,7 @@ static const MemoryRegionOps ftgmac100_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ftgmac100_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ftgmac100_cleanup(NetClientState *nc)</div>
<div>diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c</div>
<div>index 76d42c8..5d9d67b 100644</div>
<div>--- a/hw/net/imx_fec.c</div>
<div>&#43;&#43;&#43; b/hw/net/imx_fec.c</div>
<div>@@ -1278,7 &#43;1278,7 @@ static const MemoryRegionOps imx_eth_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp;.write &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; =3D imx_eth_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
=3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;=3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void imx_eth_cleanup(NetClientState *nc)</div>
<div>diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c</div>
<div>index bb1bbb3..7e805b0 100644</div>
<div>--- a/hw/net/lan9118.c</div>
<div>&#43;&#43;&#43; b/hw/net/lan9118.c</div>
<div>@@ -1304,13 &#43;1304,13 @@ static uint64_t lan9118_16bit_mode_read(vo=
id *opaque, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps lan9118_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D lan9118_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D lan9118_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps lan9118_16bit_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D lan9118_16bit_mode_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D lan9118_16bit_mode_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static NetClientInfo net_lan9118_info =3D {</div>
<div>diff --git a/hw/net/lance.c b/hw/net/lance.c</div>
<div>index d95f170..943155b 100644</div>
<div>--- a/hw/net/lance.c</div>
<div>&#43;&#43;&#43; b/hw/net/lance.c</div>
<div>@@ -74,7 &#43;74,7 @@ static uint64_t lance_mem_read(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps lance_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D lance_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D lance_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 2,</div>
<div>diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c</div>
<div>index 78468fa..bf37375 100644</div>
<div>--- a/hw/net/mcf_fec.c</div>
<div>&#43;&#43;&#43; b/hw/net/mcf_fec.c</div>
<div>@@ -624,7 &#43;624,7 @@ static ssize_t mcf_fec_receive(NetClientState =
*nc, const uint8_t *buf, size_t si</div>
<div>&nbsp;static const MemoryRegionOps mcf_fec_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mcf_fec_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mcf_fec_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static NetClientInfo net_mcf_fec_info =3D {</div>
<div>diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c=
</div>
<div>index 41ef7a4..40aee51 100644</div>
<div>--- a/hw/net/milkymist-minimac2.c</div>
<div>&#43;&#43;&#43; b/hw/net/milkymist-minimac2.c</div>
<div>@@ -431,7 &#43;431,7 @@ static const MemoryRegionOps minimac2_ops =3D =
{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void milkymist_minimac2_reset(DeviceState *d)</div>
<div>diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c</div>
<div>index 1cf4b57..8fe407b 100644</div>
<div>--- a/hw/net/ne2000.c</div>
<div>&#43;&#43;&#43; b/hw/net/ne2000.c</div>
<div>@@ -686,7 &#43;686,7 @@ static void ne2000_write(void *opaque, hwaddr =
addr,</div>
<div>&nbsp;static const MemoryRegionOps ne2000_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ne2000_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ne2000_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/***********************************************************/</d=
iv>
<div>diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c</div>
<div>index 600d09c..41bfa37 100644</div>
<div>--- a/hw/net/pcnet-pci.c</div>
<div>&#43;&#43;&#43; b/hw/net/pcnet-pci.c</div>
<div>@@ -137,7 &#43;137,7 @@ static void pcnet_ioport_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pcnet_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pcnet_ioport_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pcnet_ioport_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_pci_pcnet =3D {</div>
<div>@@ -160,7 &#43;160,7 @@ static const MemoryRegionOps pcnet_mmio_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pci_physical_memory_write(void *dma_opaque, hwaddr a=
ddr,</div>
<div>diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c</div>
<div>index bd54612..2fe64db 100644</div>
<div>--- a/hw/net/rocker/rocker.c</div>
<div>&#43;&#43;&#43; b/hw/net/rocker/rocker.c</div>
<div>@@ -1196,7 &#43;1196,7 @@ static uint64_t rocker_mmio_read(void *opaqu=
e, hwaddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps rocker_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D rocker_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D rocker_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c</div>
<div>index 0927317..f51bc7c 100644</div>
<div>--- a/hw/net/rtl8139.c</div>
<div>&#43;&#43;&#43; b/hw/net/rtl8139.c</div>
<div>@@ -3311,7 &#43;3311,7 @@ static const MemoryRegionOps rtl8139_io_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void rtl8139_timer(void *opaque)</div>
<div>diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c</div>
<div>index 49e4bf5..5b81b9a 100644</div>
<div>--- a/hw/net/smc91c111.c</div>
<div>&#43;&#43;&#43; b/hw/net/smc91c111.c</div>
<div>@@ -757,7 &#43;757,7 @@ static const MemoryRegionOps smc91c111_mem_ops=
 =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D smc91c111_writefn,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static NetClientInfo net_smc91c111_info =3D {</div>
<div>diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c</div>
<div>index 15ec227..f9c5572 100644</div>
<div>--- a/hw/net/stellaris_enet.c</div>
<div>&#43;&#43;&#43; b/hw/net/stellaris_enet.c</div>
<div>@@ -456,7 &#43;456,7 @@ static void stellaris_enet_write(void *opaque,=
 hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps stellaris_enet_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D stellaris_enet_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D stellaris_enet_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void stellaris_enet_reset(DeviceState *dev)</div>
<div>diff --git a/hw/net/sungem.c b/hw/net/sungem.c</div>
<div>index 89bcf74..549fd2d 100644</div>
<div>--- a/hw/net/sungem.c</div>
<div>&#43;&#43;&#43; b/hw/net/sungem.c</div>
<div>@@ -924,7 &#43;924,7 @@ static uint64_t sungem_mmio_greg_read(void *op=
aque, hwaddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps sungem_mmio_greg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sungem_mmio_greg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sungem_mmio_greg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -993,7 &#43;993,7 @@ static uint64_t sungem_mmio_txdma_read(void *o=
paque, hwaddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps sungem_mmio_txdma_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sungem_mmio_txdma_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sungem_mmio_txdma_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1066,7 &#43;1066,7 @@ static uint64_t sungem_mmio_rxdma_read(void =
*opaque, hwaddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps sungem_mmio_rxdma_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sungem_mmio_rxdma_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sungem_mmio_rxdma_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1163,7 &#43;1163,7 @@ static uint64_t sungem_mmio_mac_read(void *o=
paque, hwaddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps sungem_mmio_mac_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sungem_mmio_mac_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sungem_mmio_mac_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1229,7 &#43;1229,7 @@ static uint64_t sungem_mmio_mif_read(void *o=
paque, hwaddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps sungem_mmio_mif_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sungem_mmio_mif_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sungem_mmio_mif_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1284,7 &#43;1284,7 @@ static uint64_t sungem_mmio_pcs_read(void *o=
paque, hwaddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps sungem_mmio_pcs_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sungem_mmio_pcs_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sungem_mmio_pcs_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c</div>
<div>index 8b8603e..2df010d 100644</div>
<div>--- a/hw/net/sunhme.c</div>
<div>&#43;&#43;&#43; b/hw/net/sunhme.c</div>
<div>@@ -287,7 &#43;287,7 @@ static uint64_t sunhme_seb_read(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps sunhme_seb_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sunhme_seb_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sunhme_seb_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -330,7 &#43;330,7 @@ static uint64_t sunhme_etx_read(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps sunhme_etx_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sunhme_etx_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sunhme_etx_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -363,7 &#43;363,7 @@ static uint64_t sunhme_erx_read(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps sunhme_erx_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sunhme_erx_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sunhme_erx_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -406,7 &#43;406,7 @@ static uint64_t sunhme_mac_read(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps sunhme_mac_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sunhme_mac_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sunhme_mac_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -528,7 &#43;528,7 @@ static uint64_t sunhme_mif_read(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps sunhme_mif_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sunhme_mif_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sunhme_mif_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c</div>
<div>index 10d01d0..cc64b91 100644</div>
<div>--- a/hw/net/vmxnet3.c</div>
<div>&#43;&#43;&#43; b/hw/net/vmxnet3.c</div>
<div>@@ -2159,7 &#43;2159,7 @@ vmxnet3_msix_load(QEMUFile *f, void *opaque,=
 int version_id)</div>
<div>&nbsp;static const MemoryRegionOps b0_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vmxnet3_io_bar0_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vmxnet3_io_bar0_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4=
,</div>
<div>@@ -2169,7 &#43;2169,7 @@ static const MemoryRegionOps b0_ops =3D {</d=
iv>
<div>&nbsp;static const MemoryRegionOps b1_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vmxnet3_io_bar1_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vmxnet3_io_bar1_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4=
,</div>
<div>diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c</div>
<div>index f49df95..edcc4b2 100644</div>
<div>--- a/hw/net/xgmac.c</div>
<div>&#43;&#43;&#43; b/hw/net/xgmac.c</div>
<div>@@ -309,7 &#43;309,7 @@ static void enet_write(void *opaque, hwaddr ad=
dr,</div>
<div>&nbsp;static const MemoryRegionOps enet_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D enet_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D enet_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int eth_can_rx(XgmacState *s)</div>
<div>diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c</div>
<div>index feeaca6..4df665f 100644</div>
<div>--- a/hw/net/xilinx_axienet.c</div>
<div>&#43;&#43;&#43; b/hw/net/xilinx_axienet.c</div>
<div>@@ -661,7 &#43;661,7 @@ static void enet_write(void *opaque, hwaddr ad=
dr,</div>
<div>&nbsp;static const MemoryRegionOps enet_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D enet_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D enet_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int eth_can_rx(XilinxAXIEnet *s)</div>
<div>diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c</div>
<div>index 8f3a8f8..e1fb6b8 100644</div>
<div>--- a/hw/net/xilinx_ethlite.c</div>
<div>&#43;&#43;&#43; b/hw/net/xilinx_ethlite.c</div>
<div>@@ -167,7 &#43;167,7 @@ eth_write(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps eth_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D eth_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D eth_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c</di=
v>
<div>index 2c3388f..112fe40 100644</div>
<div>--- a/hw/nios2/10m50_devboard.c</div>
<div>&#43;&#43;&#43; b/hw/nios2/10m50_devboard.c</div>
<div>@@ -91,7 &#43;91,7 @@ static void nios2_10m50_ghrd_init(MachineState *=
machine)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Register: Altera 16550 UART */</div>
<div>&nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, 0xf8001600, 2, i=
rq[1], 115200,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; seria=
l_hd(0), DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; s=
erial_hd(0), MO_TE);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Register: Timer sys_clk_timer &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;dev =3D qdev_create(NULL, &quot;ALTR.timer&quot;);=
</div>
<div>diff --git a/hw/nvram/ds1225y.c b/hw/nvram/ds1225y.c</div>
<div>index fd49283..7afeffa 100644</div>
<div>--- a/hw/nvram/ds1225y.c</div>
<div>&#43;&#43;&#43; b/hw/nvram/ds1225y.c</div>
<div>@@ -69,7 &#43;69,7 @@ static const MemoryRegionOps nvram_ops =3D {</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int nvram_post_load(void *opaque, int version_id)</div>
<div>diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c</div>
<div>index dcfd6d2..438e8d4 100644</div>
<div>--- a/hw/nvram/fw_cfg.c</div>
<div>&#43;&#43;&#43; b/hw/nvram/fw_cfg.c</div>
<div>@@ -523,14 &#43;523,14 @@ static bool fw_cfg_comb_valid(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps fw_cfg_ctl_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D fw_cfg_ctl_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D fw_cfg_ctl_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.accepts =3D fw_cfg_ctl_mem_valid,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps fw_cfg_data_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D fw_cfg_data_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D fw_cfg_data_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -541,14 &#43;541,14 @@ static const MemoryRegionOps fw_cfg_data_mem=
_ops =3D {</div>
<div>&nbsp;static const MemoryRegionOps fw_cfg_comb_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D fw_cfg_data_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D fw_cfg_comb_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.accepts =3D fw_cfg_comb_valid,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps fw_cfg_dma_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D fw_cfg_dma_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D fw_cfg_dma_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.accepts =3D fw_cfg_dma_mem_valid,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>diff --git a/hw/nvram/mac_nvram.c b/hw/nvram/mac_nvram.c</div>
<div>index a60426c..028d167 100644</div>
<div>--- a/hw/nvram/mac_nvram.c</div>
<div>&#43;&#43;&#43; b/hw/nvram/mac_nvram.c</div>
<div>@@ -76,7 &#43;76,7 @@ static const MemoryRegionOps macio_nvram_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 1,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_macio_nvram =3D {</div>
<div>diff --git a/hw/nvram/nrf51_nvm.c b/hw/nvram/nrf51_nvm.c</div>
<div>index eca0cb3..557b1d1 100644</div>
<div>--- a/hw/nvram/nrf51_nvm.c</div>
<div>&#43;&#43;&#43; b/hw/nvram/nrf51_nvm.c</div>
<div>@@ -96,7 &#43;96,7 @@ static const MemoryRegionOps ficr_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp;.write =3D ficr_write,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/*</div>
<div>@@ -189,7 &#43;189,7 @@ static const MemoryRegionOps uicr_ops =3D {</d=
iv>
<div>&nbsp; &nbsp; &nbsp;.write =3D uicr_write,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>@@ -268,7 &#43;268,7 @@ static const MemoryRegionOps io_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write =3D io_write,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>@@ -301,7 &#43;301,7 @@ static const MemoryRegionOps flash_ops =3D {</=
div>
<div>&nbsp; &nbsp; &nbsp;.write =3D flash_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void nrf51_nvm_init(Object *obj)</div>
<div>diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c</=
div>
<div>index b85f0df..e0de12b 100644</div>
<div>--- a/hw/openrisc/openrisc_sim.c</div>
<div>&#43;&#43;&#43; b/hw/openrisc/openrisc_sim.c</div>
<div>@@ -164,7 &#43;164,7 @@ static void openrisc_sim_init(MachineState *ma=
chine)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;serial_mm_init(get_system_memory(), 0x90000000, 0,=
 serial_irq,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 11520=
0, serial_hd(0), DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1=
15200, serial_hd(0), MO_TE);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;openrisc_load_kernel(ram_size, kernel_filename);</=
div>
<div>&nbsp;}</div>
<div>diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c</div>
<div>index dde4437..1625118 100644</div>
<div>--- a/hw/pci-host/bonito.c</div>
<div>&#43;&#43;&#43; b/hw/pci-host/bonito.c</div>
<div>@@ -311,7 &#43;311,7 @@ static uint64_t bonito_readl(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps bonito_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bonito_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bonito_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -344,7 &#43;344,7 @@ static uint64_t bonito_pciconf_readl(void *opa=
que, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps bonito_pciconf_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bonito_pciconf_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bonito_pciconf_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -381,7 &#43;381,7 @@ static void bonito_ldma_writel(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps bonito_ldma_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bonito_ldma_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bonito_ldma_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -418,7 &#43;418,7 @@ static void bonito_cop_writel(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps bonito_cop_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bonito_cop_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bonito_cop_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -524,7 &#43;524,7 @@ static const MemoryRegionOps bonito_spciconf_o=
ps =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;#define BONITO_IRQ_BASE 32</div>
<div>diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c</div>
<div>index 9ae8c0d..bf3ff13 100644</div>
<div>--- a/hw/pci-host/designware.c</div>
<div>&#43;&#43;&#43; b/hw/pci-host/designware.c</div>
<div>@@ -75,7 &#43;75,7 @@ static void designware_pcie_root_msi_write(void =
*opaque, hwaddr addr,</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps designware_pci_host_msi_ops =3D {</=
div>
<div>&nbsp; &nbsp; &nbsp;.write =3D designware_pcie_root_msi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -235,7 &#43;235,7 @@ static void designware_pcie_root_data_write(vo=
id *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps designware_pci_host_conf_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp;.read =3D designware_pcie_root_data_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D designware_pcie_root_data_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -620,7 &#43;620,7 @@ static void designware_pcie_host_mmio_write(vo=
id *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps designware_pci_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp; &nbsp; &nbsp; =3D designware_pcie_hos=
t_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write &nbsp; &nbsp; &nbsp;=3D designware_pcie_hos=
t_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c</div>
<div>index d9c70f7..c817fa5 100644</div>
<div>--- a/hw/pci-host/piix.c</div>
<div>&#43;&#43;&#43; b/hw/pci-host/piix.c</div>
<div>@@ -691,7 &#43;691,7 @@ static uint64_t rcr_read(void *opaque, hwaddr =
addr, unsigned len)</div>
<div>&nbsp;static const MemoryRegionOps rcr_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D rcr_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D rcr_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void piix3_realize(PCIDevice *dev, Error **errp)</div>
<div>diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c</div>
<div>index 21eaa30..4c19008 100644</div>
<div>--- a/hw/pci-host/ppce500.c</div>
<div>&#43;&#43;&#43; b/hw/pci-host/ppce500.c</div>
<div>@@ -338,7 &#43;338,7 @@ static void pci_reg_write4(void *opaque, hwadd=
r addr,</div>
<div>&nbsp;static const MemoryRegionOps e500_pci_reg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_reg_read4,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_reg_write4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int mpc85xx_pci_map_irq(PCIDevice *pci_dev, int pin)</div=
>
<div>diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c</div>
<div>index c564f23..bf94693 100644</div>
<div>--- a/hw/pci-host/prep.c</div>
<div>&#43;&#43;&#43; b/hw/pci-host/prep.c</div>
<div>@@ -108,7 &#43;108,7 @@ static uint64_t raven_pci_io_read(void *opaque=
, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps raven_pci_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D raven_pci_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D raven_pci_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t raven_intack_read(void *opaque, hwaddr addr,</di=
v>
<div>@@ -186,7 &#43;186,7 @@ static void raven_io_write(void *opaque, hwadd=
r addr,</div>
<div>&nbsp;static const MemoryRegionOps raven_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D raven_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D raven_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.unaligned =3D true,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c</div>
<div>index fd20f72..edab9aa 100644</div>
<div>--- a/hw/pci-host/q35.c</div>
<div>&#43;&#43;&#43; b/hw/pci-host/q35.c</div>
<div>@@ -288,12 &#43;288,12 @@ static void tseg_blackhole_write(void *opaqu=
e, hwaddr addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps tseg_blackhole_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tseg_blackhole_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tseg_blackhole_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/* PCIe MMCFG */</div>
<div>diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c</div>
<div>index 2cec111..de12397 100644</div>
<div>--- a/hw/pci-host/sabre.c</div>
<div>&#43;&#43;&#43; b/hw/pci-host/sabre.c</div>
<div>@@ -247,7 &#43;247,7 @@ static uint64_t sabre_config_read(void *opaque=
,</div>
<div>&nbsp;static const MemoryRegionOps sabre_config_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sabre_config_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sabre_config_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void sabre_pci_config_write(void *opaque, hwaddr addr,</d=
iv>
<div>@@ -368,7 &#43;368,7 @@ static void sabre_reset(DeviceState *d)</div>
<div>&nbsp;static const MemoryRegionOps pci_config_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sabre_pci_config_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sabre_pci_config_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void sabre_realize(DeviceState *dev, Error **errp)</div>
<div>diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c</div>
<div>index 680fefd..0a51d2b 100644</div>
<div>--- a/hw/pci-host/uninorth.c</div>
<div>&#43;&#43;&#43; b/hw/pci-host/uninorth.c</div>
<div>@@ -108,7 &#43;108,7 @@ static uint64_t unin_data_read(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps unin_data_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D unin_data_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D unin_data_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pci_unin_init_irqs(UNINHostState *s)</div>
<div>@@ -564,7 &#43;564,7 @@ static uint64_t unin_read(void *opaque, hwaddr=
 addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps unin_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D unin_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D unin_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void unin_init(Object *obj)</div>
<div>diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c</div>
<div>index e7017f3..acc9982 100644</div>
<div>--- a/hw/pci-host/versatile.c</div>
<div>&#43;&#43;&#43; b/hw/pci-host/versatile.c</div>
<div>@@ -240,7 &#43;240,7 @@ static uint64_t pci_vpb_reg_read(void *opaque,=
 hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pci_vpb_reg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_vpb_reg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_vpb_reg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -306,7 &#43;306,7 @@ static uint64_t pci_vpb_config_read(void *opaq=
ue, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pci_vpb_config_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_vpb_config_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_vpb_config_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int pci_vpb_map_irq(PCIDevice *d, int irq_num)</div>
<div>diff --git a/hw/pci/msix.c b/hw/pci/msix.c</div>
<div>index d39dcf3..e9acb1e 100644</div>
<div>--- a/hw/pci/msix.c</div>
<div>&#43;&#43;&#43; b/hw/pci/msix.c</div>
<div>@@ -195,7 &#43;195,7 @@ static void msix_table_mmio_write(void *opaque=
, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps msix_table_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D msix_table_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D msix_table_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -223,7 &#43;223,7 @@ static void msix_pba_mmio_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps msix_pba_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D msix_pba_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D msix_pba_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c</div>
<div>index c5f9244..fc1b837 100644</div>
<div>--- a/hw/pci/pci_host.c</div>
<div>&#43;&#43;&#43; b/hw/pci/pci_host.c</div>
<div>@@ -190,25 &#43;190,25 @@ static uint64_t pci_host_data_read(void *opa=
que,</div>
<div>&nbsp;const MemoryRegionOps pci_host_conf_le_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_host_config_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_host_config_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;const MemoryRegionOps pci_host_conf_be_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_host_config_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_host_config_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;const MemoryRegionOps pci_host_data_le_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_host_data_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_host_data_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;const MemoryRegionOps pci_host_data_be_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_host_data_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_host_data_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const TypeInfo pci_host_type_info =3D {</div>
<div>diff --git a/hw/pci/pcie_host.c b/hw/pci/pcie_host.c</div>
<div>index d6768b8..5e120dc 100644</div>
<div>--- a/hw/pci/pcie_host.c</div>
<div>&#43;&#43;&#43; b/hw/pci/pcie_host.c</div>
<div>@@ -72,7 &#43;72,7 @@ static uint64_t pcie_mmcfg_data_read(void *opaqu=
e,</div>
<div>&nbsp;static const MemoryRegionOps pcie_mmcfg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pcie_mmcfg_data_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pcie_mmcfg_data_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pcie_host_init(Object *obj)</div>
<div>diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c</div>
<div>index 5a10c6e..6c56edb 100644</div>
<div>--- a/hw/pci/shpc.c</div>
<div>&#43;&#43;&#43; b/hw/pci/shpc.c</div>
<div>@@ -477,7 &#43;477,7 @@ static void shpc_mmio_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps shpc_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D shpc_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D shpc_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* SHPC ECN requires dword accesses,=
 but the original 1.0 spec doesn't.</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * It's easier to suppport all sizes=
 than worry about it. */</div>
<div>diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c</div>
<div>index 8993b78..4d7002e 100644</div>
<div>--- a/hw/pcmcia/pxa2xx.c</div>
<div>&#43;&#43;&#43; b/hw/pcmcia/pxa2xx.c</div>
<div>@@ -117,19 &#43;117,19 @@ static void pxa2xx_pcmcia_io_write(void *opa=
que, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_pcmcia_common_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_pcmcia_common_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_pcmcia_common_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_pcmcia_attr_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_pcmcia_attr_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_pcmcia_attr_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_pcmcia_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_pcmcia_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_pcmcia_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pxa2xx_pcmcia_set_irq(void *opaque, int line, int le=
vel)</div>
<div>diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c</div>
<div>index a3eac7f..d1f3749 100644</div>
<div>--- a/hw/ppc/e500.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/e500.c</div>
<div>@@ -927,13 &#43;927,13 @@ void ppce500_init(MachineState *machine)</di=
v>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(0)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(ccsr_addr_space, MPC8=
544_SERIAL0_REGS_OFFSET,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; 0, qdev_get_gpio_in(mpicdev, 42), 399193,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; serial_hd(0), DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; serial_hd(0), MO_BE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(1)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(ccsr_addr_space, MPC8=
544_SERIAL1_REGS_OFFSET,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; 0, qdev_get_gpio_in(mpicdev, 42), 399193,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; serial_hd(1), DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; serial_hd(1), MO_BE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I2C */</div>
<div>&nbsp; &nbsp; &nbsp;dev =3D qdev_create(NULL, &quot;mpc-i2c&quot;);</d=
iv>
<div>diff --git a/hw/ppc/mpc8544_guts.c b/hw/ppc/mpc8544_guts.c</div>
<div>index 2b7cc14..758d4ae 100644</div>
<div>--- a/hw/ppc/mpc8544_guts.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/mpc8544_guts.c</div>
<div>@@ -111,7 &#43;111,7 @@ static void mpc8544_guts_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps mpc8544_guts_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mpc8544_guts_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mpc8544_guts_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c</div>
<div>index c6411ec..ff06eef 100644</div>
<div>--- a/hw/ppc/pnv_core.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/pnv_core.c</div>
<div>@@ -98,7 &#43;98,7 @@ static const MemoryRegionOps pnv_core_power8_xsc=
om_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>@@ -156,7 &#43;156,7 @@ static const MemoryRegionOps pnv_core_power9_x=
scom_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pnv_realize_vcpu(PowerPCCPU *cpu, PnvChip *chip, Err=
or **errp)</div>
<div>@@ -377,7 &#43;377,7 @@ static const MemoryRegionOps pnv_quad_xscom_op=
s =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pnv_quad_realize(DeviceState *dev, Error **errp)</di=
v>
<div>diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c</div>
<div>index a9f150c..503e5a5 100644</div>
<div>--- a/hw/ppc/pnv_lpc.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/pnv_lpc.c</div>
<div>@@ -336,7 &#43;336,7 @@ static const MemoryRegionOps pnv_lpc_xscom_ops=
 =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t pnv_lpc_mmio_read(void *opaque, hwaddr addr, uns=
igned size)</div>
<div>@@ -404,7 &#43;404,7 @@ static const MemoryRegionOps pnv_lpc_mmio_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pnv_lpc_eval_irqs(PnvLpcController *lpc)</div>
<div>@@ -507,7 &#43;507,7 @@ static void lpc_hc_write(void *opaque, hwaddr =
addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps lpc_hc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D lpc_hc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D lpc_hc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -586,7 &#43;586,7 @@ static void opb_master_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps opb_master_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D opb_master_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D opb_master_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/ppc/pnv_occ.c b/hw/ppc/pnv_occ.c</div>
<div>index 636f91f..78a2a0b 100644</div>
<div>--- a/hw/ppc/pnv_occ.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/pnv_occ.c</div>
<div>@@ -91,7 &#43;91,7 @@ static const MemoryRegionOps pnv_occ_power8_xsco=
m_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pnv_occ_power8_class_init(ObjectClass *klass, void *=
data)</div>
<div>@@ -162,7 &#43;162,7 @@ static const MemoryRegionOps pnv_occ_power9_xs=
com_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pnv_occ_power9_class_init(ObjectClass *klass, void *=
data)</div>
<div>diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c</div>
<div>index d7b6f5d..3e1946c 100644</div>
<div>--- a/hw/ppc/pnv_psi.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/pnv_psi.c</div>
<div>@@ -417,7 &#43;417,7 @@ static void pnv_psi_mmio_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps psi_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pnv_psi_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pnv_psi_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -442,7 &#43;442,7 @@ static void pnv_psi_xscom_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pnv_psi_xscom_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pnv_psi_xscom_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pnv_psi_xscom_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -737,7 &#43;737,7 @@ static void pnv_psi_p9_mmio_write(void *opaque=
, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pnv_psi_p9_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pnv_psi_p9_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pnv_psi_p9_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -774,7 &#43;774,7 @@ static void pnv_psi_p9_xscom_write(void *opaqu=
e, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pnv_psi_p9_xscom_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pnv_psi_p9_xscom_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pnv_psi_p9_xscom_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c</div>
<div>index 2b81c75..7c93228 100644</div>
<div>--- a/hw/ppc/pnv_xscom.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/pnv_xscom.c</div>
<div>@@ -210,7 &#43;210,7 @@ const MemoryRegionOps pnv_xscom_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **err=
p)</div>
<div>diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c</div>
<div>index 13318a9..672c664 100644</div>
<div>--- a/hw/ppc/ppc405_boards.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/ppc405_boards.c</div>
<div>@@ -110,7 &#43;110,7 @@ static const MemoryRegionOps ref405ep_fpga_ops=
 =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ref405ep_fpga_reset (void *opaque)</div>
<div>@@ -382,7 &#43;382,7 @@ static const MemoryRegionOps taihu_cpld_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void taihu_cpld_reset (void *opaque)</div>
<div>diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c</div>
<div>index edb6b2d..3e6c8fd 100644</div>
<div>--- a/hw/ppc/ppc405_uc.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/ppc405_uc.c</div>
<div>@@ -334,7 &#43;334,7 @@ static const MemoryRegionOps opba_ops =3D {</d=
iv>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ppc4xx_opba_reset (void *opaque)</div>
<div>@@ -723,7 &#43;723,7 @@ static void ppc405_gpio_write(void *opaque, hw=
addr addr, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps ppc405_gpio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ppc405_gpio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ppc405_gpio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ppc405_gpio_reset (void *opaque)</div>
<div>@@ -1105,7 &#43;1105,7 @@ static const MemoryRegionOps gpt_ops =3D {</=
div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ppc4xx_gpt_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ppc4xx_gpt_cb (void *opaque)</div>
<div>@@ -1482,12 &#43;1482,12 @@ CPUPPCState *ppc405cr_init(MemoryRegion *a=
ddress_space_mem,</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(0) !=3D NULL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, 0x=
ef600300, 0, pic[0],</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; PPC_SERIAL_MM_BAUDBASE, serial_hd(0),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; MO_BE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(1) !=3D NULL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, 0x=
ef600400, 0, pic[1],</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; PPC_SERIAL_MM_BAUDBASE, serial_hd(1),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; MO_BE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;/* IIC controller */</div>
<div>&nbsp; &nbsp; &nbsp;sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500, =
pic[2]);</div>
<div>@@ -1845,12 &#43;1845,12 @@ CPUPPCState *ppc405ep_init(MemoryRegion *a=
ddress_space_mem,</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(0) !=3D NULL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, 0x=
ef600300, 0, pic[0],</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; PPC_SERIAL_MM_BAUDBASE, serial_hd(0),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; MO_BE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(1) !=3D NULL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, 0x=
ef600400, 0, pic[1],</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; PPC_SERIAL_MM_BAUDBASE, serial_hd(1),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; MO_BE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;/* OCM */</div>
<div>&nbsp; &nbsp; &nbsp;ppc405_ocm_init(env);</div>
<div>diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c</div>
<div>index b4da099..c5904aa 100644</div>
<div>--- a/hw/ppc/ppc440_bamboo.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/ppc440_bamboo.c</div>
<div>@@ -234,12 &#43;234,12 @@ static void bamboo_init(MachineState *machin=
e)</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(0) !=3D NULL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, 0x=
ef600300, 0, pic[0],</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; PPC_SERIAL_MM_BAUDBASE, serial_hd(0),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; MO_BE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(1) !=3D NULL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, 0x=
ef600400, 0, pic[1],</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; PPC_SERIAL_MM_BAUDBASE, serial_hd(1),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; MO_BE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (pcibus) {</div>
<div>diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c</div>
<div>index ca54631..a6e7280 100644</div>
<div>--- a/hw/ppc/ppc440_pcix.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/ppc440_pcix.c</div>
<div>@@ -393,7 &#43;393,7 @@ static uint64_t ppc440_pcix_reg_read4(void *op=
aque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pci_reg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ppc440_pcix_reg_read4,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ppc440_pcix_reg_write4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ppc440_pcix_reset(DeviceState *dev)</div>
<div>@@ -464,7 &#43;464,7 @@ static uint64_t pci_host_data_read(void *opaqu=
e,</div>
<div>&nbsp;const MemoryRegionOps ppc440_pcix_host_data_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_host_data_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_host_data_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ppc440_pcix_realize(DeviceState *dev, Error **errp)<=
/div>
<div>diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c</div>
<div>index e7cf8d5..ceca956 100644</div>
<div>--- a/hw/ppc/ppc4xx_pci.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/ppc4xx_pci.c</div>
<div>@@ -227,7 &#43;227,7 @@ static uint64_t ppc4xx_pci_reg_read4(void *opa=
que, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps pci_reg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ppc4xx_pci_reg_read4,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ppc4xx_pci_reg_write4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ppc4xx_pci_reset(void *opaque)</div>
<div>diff --git a/hw/ppc/ppce500_spin.c b/hw/ppc/ppce500_spin.c</div>
<div>index 0060fcb..d4fa92f 100644</div>
<div>--- a/hw/ppc/ppce500_spin.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/ppce500_spin.c</div>
<div>@@ -173,7 &#43;173,7 @@ static uint64_t spin_read(void *opaque, hwaddr=
 addr, unsigned len)</div>
<div>&nbsp;static const MemoryRegionOps spin_rw_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D spin_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D spin_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ppce500_spin_initfn(Object *obj)</div>
<div>diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c</div>
<div>index fbcddc5..b0a22ed 100644</div>
<div>--- a/hw/ppc/sam460ex.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/sam460ex.c</div>
<div>@@ -412,12 &#43;412,12 @@ static void sam460ex_init(MachineState *mach=
ine)</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(0) !=3D NULL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, 0x=
4ef600300, 0, uic[1][1],</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; PPC_SERIAL_MM_BAUDBASE, serial_hd(0),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; MO_BE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(1) !=3D NULL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, 0x=
4ef600400, 0, uic[0][1],</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; PPC_SERIAL_MM_BAUDBASE, serial_hd(1),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; MO_BE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Load U-Boot image. */</div>
<div>diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c</div>
<div>index 9003fe9..16df70c 100644</div>
<div>--- a/hw/ppc/spapr_pci.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/spapr_pci.c</div>
<div>@@ -763,7 &#43;763,7 @@ static const MemoryRegionOps spapr_msi_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp;/* There is no .read as the read result is undefin=
ed by PCI spec */</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D NULL,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D spapr_msi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/*</div>
<div>diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c</div>
<div>index 834053a..9f8a73c 100644</div>
<div>--- a/hw/ppc/virtex_ml507.c</div>
<div>&#43;&#43;&#43; b/hw/ppc/virtex_ml507.c</div>
<div>@@ -242,7 &#43;242,7 @@ static void virtex_init(MachineState *machine)=
</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;serial_mm_init(address_space_mem, UART16550_BASEAD=
DR, 2, irq[UART16550_IRQ],</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 11520=
0, serial_hd(0), DEVICE_LITTLE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1=
15200, serial_hd(0), MO_LE);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* 2 timers at irq 2 @ 62 Mhz. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;dev =3D qdev_create(NULL, &quot;xlnx.xps-timer&quo=
t;);</div>
<div>diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c</di=
v>
<div>index adcf79c..fb09241 100644</div>
<div>--- a/hw/rdma/vmw/pvrdma_main.c</div>
<div>&#43;&#43;&#43; b/hw/rdma/vmw/pvrdma_main.c</div>
<div>@@ -439,7 &#43;439,7 @@ static void pvrdma_regs_write(void *opaque, hw=
addr addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps regs_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pvrdma_regs_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pvrdma_regs_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D sizeof(uint32_t=
),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D sizeof(uint32_t=
),</div>
<div>@@ -507,7 &#43;507,7 @@ static void pvrdma_uar_write(void *opaque, hwa=
ddr addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps uar_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pvrdma_uar_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pvrdma_uar_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D sizeof(uint32_t=
),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D sizeof(uint32_t=
),</div>
<div>diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c</div>
<div>index 591d70d..7ab6d79 100644</div>
<div>--- a/hw/riscv/sifive_clint.c</div>
<div>&#43;&#43;&#43; b/hw/riscv/sifive_clint.c</div>
<div>@@ -176,7 &#43;176,7 @@ static void sifive_clint_write(void *opaque, h=
waddr addr, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps sifive_clint_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sifive_clint_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sifive_clint_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/riscv/sifive_gpio.c b/hw/riscv/sifive_gpio.c</div>
<div>index 06bd811..61c7103 100644</div>
<div>--- a/hw/riscv/sifive_gpio.c</div>
<div>&#43;&#43;&#43; b/hw/riscv/sifive_gpio.c</div>
<div>@@ -272,7 &#43;272,7 @@ static void sifive_gpio_write(void *opaque, hw=
addr offset,</div>
<div>&nbsp;static const MemoryRegionOps gpio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D &nbsp;sifive_gpio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sifive_gpio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c</div>
<div>index 0950e89..5f156e8 100644</div>
<div>--- a/hw/riscv/sifive_plic.c</div>
<div>&#43;&#43;&#43; b/hw/riscv/sifive_plic.c</div>
<div>@@ -354,7 &#43;354,7 @@ err:</div>
<div>&nbsp;static const MemoryRegionOps sifive_plic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sifive_plic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sifive_plic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c</div>
<div>index f406682..6dc1461 100644</div>
<div>--- a/hw/riscv/sifive_prci.c</div>
<div>&#43;&#43;&#43; b/hw/riscv/sifive_prci.c</div>
<div>@@ -73,7 &#43;73,7 @@ static void sifive_prci_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps sifive_prci_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sifive_prci_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sifive_prci_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c</div>
<div>index 24a04d7..a7a8e73 100644</div>
<div>--- a/hw/riscv/sifive_test.c</div>
<div>&#43;&#43;&#43; b/hw/riscv/sifive_test.c</div>
<div>@@ -51,7 &#43;51,7 @@ static void sifive_test_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps sifive_test_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sifive_test_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sifive_test_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c</div>
<div>index 3b3f94f..fa1ba98 100644</div>
<div>--- a/hw/riscv/sifive_uart.c</div>
<div>&#43;&#43;&#43; b/hw/riscv/sifive_uart.c</div>
<div>@@ -132,7 &#43;132,7 @@ uart_write(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c</div>
<div>index 25faf3b..3283954 100644</div>
<div>--- a/hw/riscv/virt.c</div>
<div>&#43;&#43;&#43; b/hw/riscv/virt.c</div>
<div>@@ -502,7 &#43;502,7 @@ static void riscv_virt_board_init(MachineState=
 *machine)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;serial_mm_init(system_memory, memmap[VIRT_UART0].b=
ase,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0, qdev_get_gpio_in(DEVICE(s-&gt;pli=
c), UART0_IRQ), 399193,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;serial_hd(0), DEVICE_LITTLE_ENDIAN);</div=
>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;serial_hd(0), MO_LE);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;g_free(plic_hart_config);</div>
<div>&nbsp;}</div>
<div>diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c</div>
<div>index 2c6e084..451c279 100644</div>
<div>--- a/hw/s390x/s390-pci-bus.c</div>
<div>&#43;&#43;&#43; b/hw/s390x/s390-pci-bus.c</div>
<div>@@ -689,7 &#43;689,7 @@ static uint64_t s390_msi_ctrl_read(void *opaqu=
e, hwaddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps s390_msi_ctrl_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D s390_msi_ctrl_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D s390_msi_ctrl_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void s390_pci_iommu_enable(S390PCIIOMMU *iommu)</div>
<div>diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c</div>
<div>index 342f500..e7804a8 100644</div>
<div>--- a/hw/scsi/esp-pci.c</div>
<div>&#43;&#43;&#43; b/hw/scsi/esp-pci.c</div>
<div>@@ -291,7 &#43;291,7 @@ static void esp_pci_dma_memory_write(void *opa=
que, uint8_t *buf, int len)</div>
<div>&nbsp;static const MemoryRegionOps esp_pci_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D esp_pci_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D esp_pci_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c</div>
<div>index 7508d03..fec501c 100644</div>
<div>--- a/hw/scsi/esp.c</div>
<div>&#43;&#43;&#43; b/hw/scsi/esp.c</div>
<div>@@ -635,7 &#43;635,7 @@ static uint64_t sysbus_esp_mem_read(void *opaq=
ue, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps sysbus_esp_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sysbus_esp_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sysbus_esp_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.accepts =3D esp_mem_accepts,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c</div>
<div>index 10468c1..7e17555 100644</div>
<div>--- a/hw/scsi/lsi53c895a.c</div>
<div>&#43;&#43;&#43; b/hw/scsi/lsi53c895a.c</div>
<div>@@ -2091,7 &#43;2091,7 @@ static uint64_t lsi_mmio_read(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps lsi_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D lsi_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D lsi_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -2115,7 &#43;2115,7 @@ static uint64_t lsi_ram_read(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps lsi_ram_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D lsi_ram_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D lsi_ram_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t lsi_io_read(void *opaque, hwaddr addr,</div>
<div>@@ -2135,7 &#43;2135,7 @@ static void lsi_io_write(void *opaque, hwadd=
r addr,</div>
<div>&nbsp;static const MemoryRegionOps lsi_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D lsi_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D lsi_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c</div>
<div>index 0c43999..f06b7c6 100644</div>
<div>--- a/hw/scsi/megasas.c</div>
<div>&#43;&#43;&#43; b/hw/scsi/megasas.c</div>
<div>@@ -2153,7 &#43;2153,7 @@ static void megasas_mmio_write(void *opaque,=
 hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps megasas_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D megasas_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D megasas_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>@@ -2175,7 &#43;2175,7 @@ static void megasas_port_write(void *opaque,=
 hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps megasas_port_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D megasas_port_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D megasas_port_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -2197,7 &#43;2197,7 @@ static void megasas_queue_write(void *opaque=
, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps megasas_queue_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D megasas_queue_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D megasas_queue_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c</div>
<div>index 3f94d5a..c3d8144 100644</div>
<div>--- a/hw/scsi/mptsas.c</div>
<div>&#43;&#43;&#43; b/hw/scsi/mptsas.c</div>
<div>@@ -1085,7 &#43;1085,7 @@ static void mptsas_mmio_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps mptsas_mmio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mptsas_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mptsas_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1095,7 &#43;1095,7 @@ static const MemoryRegionOps mptsas_mmio_ops=
 =3D {</div>
<div>&nbsp;static const MemoryRegionOps mptsas_port_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mptsas_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mptsas_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -1120,7 &#43;1120,7 @@ static void mptsas_diag_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps mptsas_diag_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mptsas_diag_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mptsas_diag_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c</div>
<div>index 14641df..9600846 100644</div>
<div>--- a/hw/scsi/vmw_pvscsi.c</div>
<div>&#43;&#43;&#43; b/hw/scsi/vmw_pvscsi.c</div>
<div>@@ -1086,7 &#43;1086,7 @@ pvscsi_cleanup_msi(PVSCSIState *s)</div>
<div>&nbsp;static const MemoryRegionOps pvscsi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D pvscsi_io_read,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write =3D pvscsi_io_write,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_acc=
ess_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_acc=
ess_size =3D 4,</div>
<div>diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c</div>
<div>index 2778fb0..f799c37 100644</div>
<div>--- a/hw/sd/bcm2835_sdhost.c</div>
<div>&#43;&#43;&#43; b/hw/sd/bcm2835_sdhost.c</div>
<div>@@ -370,7 &#43;370,7 @@ static void bcm2835_sdhost_write(void *opaque,=
 hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_sdhost_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_sdhost_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_sdhost_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_bcm2835_sdhost =3D {</di=
v>
<div>diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c</di=
v>
<div>index b8d2347..52e3037 100644</div>
<div>--- a/hw/sd/milkymist-memcard.c</div>
<div>&#43;&#43;&#43; b/hw/sd/milkymist-memcard.c</div>
<div>@@ -236,7 &#43;236,7 @@ static const MemoryRegionOps memcard_mmio_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void milkymist_memcard_reset(DeviceState *d)</div>
<div>diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c</div>
<div>index d0c98ca..9a9626d 100644</div>
<div>--- a/hw/sd/omap_mmc.c</div>
<div>&#43;&#43;&#43; b/hw/sd/omap_mmc.c</div>
<div>@@ -570,7 &#43;570,7 @@ static void omap_mmc_write(void *opaque, hwadd=
r offset,</div>
<div>&nbsp;static const MemoryRegionOps omap_mmc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_mmc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_mmc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void omap_mmc_cover_cb(void *opaque, int line, int level)=
</div>
<div>diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c</div>
<div>index f2027aa..2ee759a 100644</div>
<div>--- a/hw/sd/pl181.c</div>
<div>&#43;&#43;&#43; b/hw/sd/pl181.c</div>
<div>@@ -449,7 &#43;449,7 @@ static void pl181_write(void *opaque, hwaddr o=
ffset,</div>
<div>&nbsp;static const MemoryRegionOps pl181_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl181_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl181_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl181_reset(DeviceState *d)</div>
<div>diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c</div>
<div>index 81ff5ce..c9ffeb9 100644</div>
<div>--- a/hw/sd/pxa2xx_mmci.c</div>
<div>&#43;&#43;&#43; b/hw/sd/pxa2xx_mmci.c</div>
<div>@@ -472,7 &#43;472,7 @@ static void pxa2xx_mmci_write(void *opaque,</d=
iv>
<div>&nbsp;static const MemoryRegionOps pxa2xx_mmci_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_mmci_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_mmci_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,</div>
<div>diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c</div>
<div>index 7b80b1d..664dcf3 100644</div>
<div>--- a/hw/sd/sdhci.c</div>
<div>&#43;&#43;&#43; b/hw/sd/sdhci.c</div>
<div>@@ -1286,7 &#43;1286,7 @@ static const MemoryRegionOps sdhci_mmio_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.unaligned =3D false</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void sdhci_init_readonly_registers(SDHCIState *s, Error *=
*errp)</div>
<div>@@ -1741,7 &#43;1741,7 @@ static const MemoryRegionOps usdhc_mmio_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.unaligned =3D false</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void imx_usdhc_init(Object *obj)</div>
<div>diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c</div>
<div>index f22c79c..1e7d693 100644</div>
<div>--- a/hw/sh4/r2d.c</div>
<div>&#43;&#43;&#43; b/hw/sh4/r2d.c</div>
<div>@@ -176,7 &#43;176,7 @@ static const MemoryRegionOps r2d_fpga_ops =3D =
{</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D r2d_fpga_write,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 2,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static qemu_irq *r2d_fpga_init(MemoryRegion *sysmem,</div>
<div>diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c</div>
<div>index 2fb6e61..20f5816 100644</div>
<div>--- a/hw/sh4/sh7750.c</div>
<div>&#43;&#43;&#43; b/hw/sh4/sh7750.c</div>
<div>@@ -487,7 &#43;487,7 @@ static const MemoryRegionOps sh7750_mem_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sh7750_mem_writefn,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/* sh775x interrupt controller tables for sh_intc.c</div>
<div>@@ -748,7 &#43;748,7 @@ static void sh7750_mmct_write(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps sh7750_mmct_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sh7750_mmct_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sh7750_mmct_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)</=
div>
<div>diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c</div>
<div>index b15f264..4006210 100644</div>
<div>--- a/hw/sh4/sh_pci.c</div>
<div>&#43;&#43;&#43; b/hw/sh4/sh_pci.c</div>
<div>@@ -103,7 &#43;103,7 @@ static uint64_t sh_pci_reg_read (void *p, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps sh_pci_reg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sh_pci_reg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sh_pci_reg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/sparc/sun4m_iommu.c b/hw/sparc/sun4m_iommu.c</div>
<div>index 45a61ec..61a7493 100644</div>
<div>--- a/hw/sparc/sun4m_iommu.c</div>
<div>&#43;&#43;&#43; b/hw/sparc/sun4m_iommu.c</div>
<div>@@ -235,7 &#43;235,7 @@ static void iommu_mem_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps iommu_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D iommu_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D iommu_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c</div>
<div>index dc0ce7e..dc5bb11 100644</div>
<div>--- a/hw/sparc64/niagara.c</div>
<div>&#43;&#43;&#43; b/hw/sparc64/niagara.c</div>
<div>@@ -158,7 &#43;158,7 @@ static void niagara_init(MachineState *machine=
)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (serial_hd(0)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(sysmem, NIAGARA_UART_=
BASE, 0, NULL, 115200,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; serial_hd(0), DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; serial_hd(0), MO_BE);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;create_unimplemented_device(&quot;sun4v-iob&quot;,=
 NIAGARA_IOBBASE, NIAGARA_IOBSIZE);</div>
<div>&nbsp; &nbsp; &nbsp;sun4v_rtc_init(NIAGARA_RTC_BASE);</div>
<div>diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c</div>
<div>index 5d87be8..9016271 100644</div>
<div>--- a/hw/sparc64/sun4u.c</div>
<div>&#43;&#43;&#43; b/hw/sparc64/sun4u.c</div>
<div>@@ -249,7 &#43;249,7 @@ static void power_mem_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps power_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D power_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D power_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -320,7 &#43;320,7 @@ static void ebus_realize(PCIDevice *pci_dev, E=
rror **errp)</div>
<div>&nbsp; &nbsp; &nbsp;i =3D 0;</div>
<div>&nbsp; &nbsp; &nbsp;if (s-&gt;console_serial_base) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;serial_mm_init(pci_address_space(pci=
_dev), s-&gt;console_serial_base,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; 0, NULL, 115200, serial_hd(i), DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; 0, NULL, 115200, serial_hd(i), MO_BE);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i&#43;&#43;;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;serial_hds_isa_init(s-&gt;isa_bus, i, MAX_ISA_SERI=
AL_PORTS);</div>
<div>diff --git a/hw/sparc64/sun4u_iommu.c b/hw/sparc64/sun4u_iommu.c</div>
<div>index 9178277..5073098 100644</div>
<div>--- a/hw/sparc64/sun4u_iommu.c</div>
<div>&#43;&#43;&#43; b/hw/sparc64/sun4u_iommu.c</div>
<div>@@ -280,7 &#43;280,7 @@ static uint64_t iommu_mem_read(void *opaque, h=
waddr addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps iommu_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D iommu_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D iommu_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void iommu_reset(DeviceState *d)</div>
<div>diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c</div>
<div>index 81f2fb7..fc33c80 100644</div>
<div>--- a/hw/ssi/aspeed_smc.c</div>
<div>&#43;&#43;&#43; b/hw/ssi/aspeed_smc.c</div>
<div>@@ -399,7 &#43;399,7 @@ static void aspeed_smc_flash_default_write(voi=
d *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps aspeed_smc_flash_default_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aspeed_smc_flash_default_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aspeed_smc_flash_default_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -707,7 &#43;707,7 @@ static void aspeed_smc_flash_write(void *opaqu=
e, hwaddr addr, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps aspeed_smc_flash_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aspeed_smc_flash_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aspeed_smc_flash_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -818,7 &#43;818,7 @@ static void aspeed_smc_write(void *opaque, hwa=
ddr addr, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps aspeed_smc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aspeed_smc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aspeed_smc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.unaligned =3D true,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c</div>
<div>index 5cec9b5..9b4ec27 100644</div>
<div>--- a/hw/ssi/imx_spi.c</div>
<div>&#43;&#43;&#43; b/hw/ssi/imx_spi.c</div>
<div>@@ -397,7 &#43;397,7 @@ static void imx_spi_write(void *opaque, hwaddr=
 offset, uint64_t value,</div>
<div>&nbsp;static const struct MemoryRegionOps imx_spi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx_spi_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_spi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c</div>
<div>index 71fd138..1d56199 100644</div>
<div>--- a/hw/ssi/mss-spi.c</div>
<div>&#43;&#43;&#43; b/hw/ssi/mss-spi.c</div>
<div>@@ -359,7 &#43;359,7 @@ static void spi_write(void *opaque, hwaddr add=
r,</div>
<div>&nbsp;static const MemoryRegionOps spi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D spi_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D spi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c</div>
<div>index f278a55..749c2ea 100644</div>
<div>--- a/hw/ssi/omap_spi.c</div>
<div>&#43;&#43;&#43; b/hw/ssi/omap_spi.c</div>
<div>@@ -342,7 &#43;342,7 @@ static void omap_mcspi_write(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps omap_mcspi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D omap_mcspi_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_mcspi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;struct omap_mcspi_s *omap_mcspi_init(struct omap_target_agent_s =
*ta, int chnum,</div>
<div>diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c</div>
<div>index 10d1995..4c7e312 100644</div>
<div>--- a/hw/ssi/pl022.c</div>
<div>&#43;&#43;&#43; b/hw/ssi/pl022.c</div>
<div>@@ -226,7 &#43;226,7 @@ static void pl022_reset(DeviceState *dev)</div=
>
<div>&nbsp;static const MemoryRegionOps pl022_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl022_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl022_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int pl022_post_load(void *opaque, int version_id)</div>
<div>diff --git a/hw/ssi/stm32f2xx_spi.c b/hw/ssi/stm32f2xx_spi.c</div>
<div>index e1e5ab5..f1ae1cf 100644</div>
<div>--- a/hw/ssi/stm32f2xx_spi.c</div>
<div>&#43;&#43;&#43; b/hw/ssi/stm32f2xx_spi.c</div>
<div>@@ -166,7 &#43;166,7 @@ static void stm32f2xx_spi_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps stm32f2xx_spi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D stm32f2xx_spi_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D stm32f2xx_spi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_stm32f2xx_spi =3D {</div=
>
<div>diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c</div>
<div>index 1379cb1..f21c5e0 100644</div>
<div>--- a/hw/ssi/xilinx_spi.c</div>
<div>&#43;&#43;&#43; b/hw/ssi/xilinx_spi.c</div>
<div>@@ -313,7 &#43;313,7 @@ done:</div>
<div>&nbsp;static const MemoryRegionOps spi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D spi_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D spi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c</div>
<div>index 8cadc4e..ed5ea17 100644</div>
<div>--- a/hw/ssi/xilinx_spips.c</div>
<div>&#43;&#43;&#43; b/hw/ssi/xilinx_spips.c</div>
<div>@@ -1029,7 &#43;1029,7 @@ no_reg_update:</div>
<div>&nbsp;static const MemoryRegionOps spips_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xilinx_spips_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xilinx_spips_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void xilinx_qspips_invalidate_mmio_ptr(XilinxQSPIPS *q)</=
div>
<div>@@ -1120,13 &#43;1120,13 @@ static void xlnx_zynqmp_qspips_write(void =
*opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps qspips_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xilinx_spips_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xilinx_qspips_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps xlnx_zynqmp_qspips_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xlnx_zynqmp_qspips_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xlnx_zynqmp_qspips_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;#define LQSPI_CACHE_SIZE 1024</div>
<div>@@ -1238,7 &#43;1238,7 @@ static MemTxResult lqspi_write(void *opaque,=
 hwaddr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps lqspi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D lqspi_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D lqspi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c</div>
<div>index 8bb5f6e..032e2fd 100644</div>
<div>--- a/hw/timer/a9gtimer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/a9gtimer.c</div>
<div>@@ -254,7 &#43;254,7 @@ static const MemoryRegionOps a9_gtimer_this_op=
s =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps a9_gtimer_ops =3D {</div>
<div>@@ -264,7 &#43;264,7 @@ static const MemoryRegionOps a9_gtimer_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void a9_gtimer_reset(DeviceState *dev)</div>
<div>diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit=
.c</div>
<div>index 763e109..6bc32d1 100644</div>
<div>--- a/hw/timer/allwinner-a10-pit.c</div>
<div>&#43;&#43;&#43; b/hw/timer/allwinner-a10-pit.c</div>
<div>@@ -178,7 &#43;178,7 @@ static void a10_pit_write(void *opaque, hwaddr=
 offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps a10_pit_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D a10_pit_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D a10_pit_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static Property a10_pit_properties[] =3D {</div>
<div>diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c</div>
<div>index 5c1d9e4..74771af 100644</div>
<div>--- a/hw/timer/altera_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/altera_timer.c</div>
<div>@@ -145,7 &#43;145,7 @@ static void timer_write(void *opaque, hwaddr a=
ddr,</div>
<div>&nbsp;static const MemoryRegionOps timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c</div>
<div>index 9397218..85f7938 100644</div>
<div>--- a/hw/timer/arm_mptimer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/arm_mptimer.c</div>
<div>@@ -190,7 &#43;190,7 @@ static const MemoryRegionOps arm_thistimer_ops=
 =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps timerblock_ops =3D {</div>
<div>@@ -200,7 &#43;200,7 @@ static const MemoryRegionOps timerblock_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void timerblock_reset(TimerBlock *tb)</div>
<div>diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c</div>
<div>index 22ce3ff..1d44041 100644</div>
<div>--- a/hw/timer/arm_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/arm_timer.c</div>
<div>@@ -265,7 &#43;265,7 @@ static void sp804_write(void *opaque, hwaddr o=
ffset,</div>
<div>&nbsp;static const MemoryRegionOps sp804_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sp804_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sp804_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_sp804 =3D {</div>
<div>@@ -346,7 &#43;346,7 @@ static void icp_pit_write(void *opaque, hwaddr=
 offset,</div>
<div>&nbsp;static const MemoryRegionOps icp_pit_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D icp_pit_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D icp_pit_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void icp_pit_init(Object *obj)</div>
<div>diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c</di=
v>
<div>index 3c34fd0..63cf8b9 100644</div>
<div>--- a/hw/timer/armv7m_systick.c</div>
<div>&#43;&#43;&#43; b/hw/timer/armv7m_systick.c</div>
<div>@@ -191,7 &#43;191,7 @@ static MemTxResult systick_write(void *opaque,=
 hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps systick_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D systick_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D systick_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/timer/aspeed_rtc.c b/hw/timer/aspeed_rtc.c</div>
<div>index c528e47..33098bf 100644</div>
<div>--- a/hw/timer/aspeed_rtc.c</div>
<div>&#43;&#43;&#43; b/hw/timer/aspeed_rtc.c</div>
<div>@@ -130,7 &#43;130,7 @@ static void aspeed_rtc_reset(DeviceState *d)</=
div>
<div>&nbsp;static const MemoryRegionOps aspeed_rtc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aspeed_rtc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aspeed_rtc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_aspeed_rtc =3D {</div>
<div>diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c</div>
<div>index 29cc5e8..1aca23d 100644</div>
<div>--- a/hw/timer/aspeed_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/aspeed_timer.c</div>
<div>@@ -448,7 &#43;448,7 @@ static void aspeed_timer_write(void *opaque, h=
waddr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps aspeed_timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aspeed_timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aspeed_timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.unaligned =3D false,</div>
<div>diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c</div>
<div>index d422efe..795e834 100644</div>
<div>--- a/hw/timer/cadence_ttc.c</div>
<div>&#43;&#43;&#43; b/hw/timer/cadence_ttc.c</div>
<div>@@ -389,7 &#43;389,7 @@ static void cadence_ttc_write(void *opaque, hw=
addr offset,</div>
<div>&nbsp;static const MemoryRegionOps cadence_ttc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cadence_ttc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cadence_ttc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void cadence_timer_reset(CadenceTimerState *s)</div>
<div>diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualt=
imer.c</div>
<div>index 383f6e1..f8c4e83 100644</div>
<div>--- a/hw/timer/cmsdk-apb-dualtimer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/cmsdk-apb-dualtimer.c</div>
<div>@@ -373,7 &#43;373,7 @@ static void cmsdk_apb_dualtimer_write(void *op=
aque, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps cmsdk_apb_dualtimer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cmsdk_apb_dualtimer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cmsdk_apb_dualtimer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;/* byte/halfword accesses are just zero-padded on =
reads and writes */</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c</=
div>
<div>index 2e7318b..b9c1677 100644</div>
<div>--- a/hw/timer/cmsdk-apb-timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/cmsdk-apb-timer.c</div>
<div>@@ -169,7 &#43;169,7 @@ static void cmsdk_apb_timer_write(void *opaque=
, hwaddr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps cmsdk_apb_timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cmsdk_apb_timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cmsdk_apb_timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void cmsdk_apb_timer_tick(void *opaque)</div>
<div>diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c</div>
<div>index c818ed1..4c387f2 100644</div>
<div>--- a/hw/timer/digic-timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/digic-timer.c</div>
<div>@@ -121,7 &#43;121,7 @@ static const MemoryRegionOps digic_timer_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void digic_timer_init(Object *obj)</div>
<div>diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c</div>
<div>index 53834e1..56324fc 100644</div>
<div>--- a/hw/timer/etraxfs_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/etraxfs_timer.c</div>
<div>@@ -297,7 &#43;297,7 @@ timer_write(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c</di=
v>
<div>index 874c7b8..0fc67e5 100644</div>
<div>--- a/hw/timer/exynos4210_mct.c</div>
<div>&#43;&#43;&#43; b/hw/timer/exynos4210_mct.c</div>
<div>@@ -1412,7 &#43;1412,7 @@ static void exynos4210_mct_write(void *opaqu=
e, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps exynos4210_mct_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D exynos4210_mct_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D exynos4210_mct_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/* MCT init */</div>
<div>diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c</di=
v>
<div>index 9bc0327..5df719a 100644</div>
<div>--- a/hw/timer/exynos4210_pwm.c</div>
<div>&#43;&#43;&#43; b/hw/timer/exynos4210_pwm.c</div>
<div>@@ -375,7 &#43;375,7 @@ static void exynos4210_pwm_reset(DeviceState *=
d)</div>
<div>&nbsp;static const MemoryRegionOps exynos4210_pwm_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D exynos4210_pwm_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D exynos4210_pwm_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/*</div>
<div>diff --git a/hw/timer/exynos4210_rtc.c b/hw/timer/exynos4210_rtc.c</di=
v>
<div>index 0ecedf7..f62277c 100644</div>
<div>--- a/hw/timer/exynos4210_rtc.c</div>
<div>&#43;&#43;&#43; b/hw/timer/exynos4210_rtc.c</div>
<div>@@ -544,7 &#43;544,7 @@ static void exynos4210_rtc_reset(DeviceState *=
d)</div>
<div>&nbsp;static const MemoryRegionOps exynos4210_rtc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D exynos4210_rtc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D exynos4210_rtc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/*</div>
<div>diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c</div>
<div>index dc3b028..0c32f64 100644</div>
<div>--- a/hw/timer/grlib_gptimer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/grlib_gptimer.c</div>
<div>@@ -313,7 &#43;313,7 @@ static void grlib_gptimer_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps grlib_gptimer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D grlib_gptimer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D grlib_gptimer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c</div>
<div>index 8268b24..a1299ec 100644</div>
<div>--- a/hw/timer/hpet.c</div>
<div>&#43;&#43;&#43; b/hw/timer/hpet.c</div>
<div>@@ -675,7 &#43;675,7 @@ static const MemoryRegionOps hpet_ram_ops =3D =
{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void hpet_reset(DeviceState *d)</div>
<div>diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c</div>
<div>index 0972c47..4f19817 100644</div>
<div>--- a/hw/timer/i8254.c</div>
<div>&#43;&#43;&#43; b/hw/timer/i8254.c</div>
<div>@@ -315,7 &#43;315,7 @@ static const MemoryRegionOps pit_ioport_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pit_post_load(PITCommonState *s)</div>
<div>diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c</div>
<div>index a87dc06..eedfe44 100644</div>
<div>--- a/hw/timer/imx_epit.c</div>
<div>&#43;&#43;&#43; b/hw/timer/imx_epit.c</div>
<div>@@ -282,7 &#43;282,7 @@ static void imx_epit_cmp(void *opaque)</div>
<div>&nbsp;static const MemoryRegionOps imx_epit_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx_epit_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_epit_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_imx_timer_epit =3D {</di=
v>
<div>diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c</div>
<div>index 4eca249..b98138e 100644</div>
<div>--- a/hw/timer/imx_gpt.c</div>
<div>&#43;&#43;&#43; b/hw/timer/imx_gpt.c</div>
<div>@@ -474,7 &#43;474,7 @@ static void imx_gpt_timeout(void *opaque)</div=
>
<div>&nbsp;static const MemoryRegionOps imx_gpt_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx_gpt_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_gpt_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c</div>
<div>index 88d2ee0..afa4e7e 100644</div>
<div>--- a/hw/timer/lm32_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/lm32_timer.c</div>
<div>@@ -144,7 &#43;144,7 @@ static void timer_write(void *opaque, hwaddr a=
ddr,</div>
<div>&nbsp;static const MemoryRegionOps timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/timer/m48t59.c b/hw/timer/m48t59.c</div>
<div>index 030c887..8bfbc36 100644</div>
<div>--- a/hw/timer/m48t59.c</div>
<div>&#43;&#43;&#43; b/hw/timer/m48t59.c</div>
<div>@@ -518,7 &#43;518,7 @@ static const MemoryRegionOps nvram_ops =3D {</=
div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_m48t59 =3D {</div>
<div>@@ -559,7 &#43;559,7 @@ const MemoryRegionOps m48t59_io_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/* Initialisation routine */</div>
<div>diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c</div>
<div>index ce4550b..8ccd950 100644</div>
<div>--- a/hw/timer/mc146818rtc.c</div>
<div>&#43;&#43;&#43; b/hw/timer/mc146818rtc.c</div>
<div>@@ -930,7 &#43;930,7 @@ static const MemoryRegionOps cmos_ops =3D {</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void rtc_get_date(Object *obj, struct tm *current_tm, Err=
or **errp)</div>
<div>diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c=
</div>
<div>index c1d715f..a184cfe 100644</div>
<div>--- a/hw/timer/milkymist-sysctl.c</div>
<div>&#43;&#43;&#43; b/hw/timer/milkymist-sysctl.c</div>
<div>@@ -220,7 &#43;220,7 @@ static const MemoryRegionOps sysctl_mmio_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void timer0_hit(void *opaque)</div>
<div>diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c</div>
<div>index 26a51f1..ebf2434 100644</div>
<div>--- a/hw/timer/mss-timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/mss-timer.c</div>
<div>@@ -197,7 &#43;197,7 @@ timer_write(void *opaque, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/timer/nrf51_timer.c b/hw/timer/nrf51_timer.c</div>
<div>index 29fb81a..26204fa 100644</div>
<div>--- a/hw/timer/nrf51_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/nrf51_timer.c</div>
<div>@@ -300,7 &#43;300,7 @@ static void nrf51_timer_write(void *opaque, hw=
addr offset,</div>
<div>&nbsp;static const MemoryRegionOps rng_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D &nbsp;nrf51_timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D nrf51_timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c</div>
<div>index ae2dc99..c745eab 100644</div>
<div>--- a/hw/timer/omap_gptimer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/omap_gptimer.c</div>
<div>@@ -488,7 &#43;488,7 @@ static const MemoryRegionOps omap_gp_timer_ops=
 =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_gp_timer_writefn,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;struct omap_gp_timer_s *omap_gp_timer_init(struct omap_target_ag=
ent_s *ta,</div>
<div>diff --git a/hw/timer/omap_synctimer.c b/hw/timer/omap_synctimer.c</di=
v>
<div>index 0d75a90..f98a20a 100644</div>
<div>--- a/hw/timer/omap_synctimer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/omap_synctimer.c</div>
<div>@@ -94,7 &#43;94,7 @@ static const MemoryRegionOps omap_synctimer_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D omap_synctimer_writefn,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;struct omap_synctimer_s *omap_synctimer_init(struct omap_target_=
agent_s *ta,</div>
<div>diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c</div>
<div>index 62b0fab..6cbee0c 100644</div>
<div>--- a/hw/timer/pl031.c</div>
<div>&#43;&#43;&#43; b/hw/timer/pl031.c</div>
<div>@@ -175,7 &#43;175,7 @@ static void pl031_write(void * opaque, hwaddr =
offset,</div>
<div>&nbsp;static const MemoryRegionOps pl031_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl031_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl031_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl031_init(Object *obj)</div>
<div>diff --git a/hw/timer/puv3_ost.c b/hw/timer/puv3_ost.c</div>
<div>index 4a8ae37..97195b3 100644</div>
<div>--- a/hw/timer/puv3_ost.c</div>
<div>&#43;&#43;&#43; b/hw/timer/puv3_ost.c</div>
<div>@@ -98,7 &#43;98,7 @@ static const MemoryRegionOps puv3_ost_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void puv3_ost_tick(void *opaque)</div>
<div>diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c</div>
<div>index 8c1ef43..0d2afac 100644</div>
<div>--- a/hw/timer/pxa2xx_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/pxa2xx_timer.c</div>
<div>@@ -399,7 &#43;399,7 @@ static void pxa2xx_timer_write(void *opaque, h=
waddr offset,</div>
<div>&nbsp;static const MemoryRegionOps pxa2xx_timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pxa2xx_timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pxa2xx_timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pxa2xx_timer_tick(void *opaque)</div>
<div>diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c</div>
<div>index 91b18ba..e6804f3 100644</div>
<div>--- a/hw/timer/sh_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/sh_timer.c</div>
<div>@@ -302,7 &#43;302,7 @@ static void tmu012_write(void *opaque, hwaddr =
offset,</div>
<div>&nbsp;static const MemoryRegionOps tmu012_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tmu012_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tmu012_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void tmu012_init(MemoryRegion *sysmem, hwaddr base,</div>
<div>diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c</div>
<div>index 005fd59..27bba42 100644</div>
<div>--- a/hw/timer/slavio_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/slavio_timer.c</div>
<div>@@ -319,7 &#43;319,7 @@ static void slavio_timer_mem_writel(void *opaq=
ue, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps slavio_timer_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D slavio_timer_mem_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D slavio_timer_mem_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c</=
div>
<div>index ecfcdad..6a1ebe3 100644</div>
<div>--- a/hw/timer/stm32f2xx_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/stm32f2xx_timer.c</div>
<div>@@ -265,7 &#43;265,7 @@ static void stm32f2xx_timer_write(void *opaque=
, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps stm32f2xx_timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D stm32f2xx_timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D stm32f2xx_timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_stm32f2xx_timer =3D {</d=
iv>
<div>diff --git a/hw/timer/sun4v-rtc.c b/hw/timer/sun4v-rtc.c</div>
<div>index 6b7ca75..4c3a236 100644</div>
<div>--- a/hw/timer/sun4v-rtc.c</div>
<div>&#43;&#43;&#43; b/hw/timer/sun4v-rtc.c</div>
<div>@@ -48,7 &#43;48,7 @@ static void sun4v_rtc_write(void *opaque, hwaddr=
 addr,</div>
<div>&nbsp;static const MemoryRegionOps sun4v_rtc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sun4v_rtc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sun4v_rtc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void sun4v_rtc_init(hwaddr addr)</div>
<div>diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c</div>
<div>index 16bcd03..ab4c543 100644</div>
<div>--- a/hw/timer/xilinx_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/xilinx_timer.c</div>
<div>@@ -187,7 &#43;187,7 @@ timer_write(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/timer/xlnx-zynqmp-rtc.c b/hw/timer/xlnx-zynqmp-rtc.c</=
div>
<div>index 36daf0c..ebfc53a 100644</div>
<div>--- a/hw/timer/xlnx-zynqmp-rtc.c</div>
<div>&#43;&#43;&#43; b/hw/timer/xlnx-zynqmp-rtc.c</div>
<div>@@ -173,7 &#43;173,7 @@ static void rtc_reset(DeviceState *dev)</div>
<div>&nbsp;static const MemoryRegionOps rtc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D register_read_memory,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D register_write_memory,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c</div>
<div>index db0e3e7..c73873a 100644</div>
<div>--- a/hw/tpm/tpm_crb.c</div>
<div>&#43;&#43;&#43; b/hw/tpm/tpm_crb.c</div>
<div>@@ -180,7 &#43;180,7 @@ static void tpm_crb_mmio_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps tpm_crb_memory_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tpm_crb_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tpm_crb_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c</div>
<div>index d6b3212..7984f82 100644</div>
<div>--- a/hw/tpm/tpm_tis.c</div>
<div>&#43;&#43;&#43; b/hw/tpm/tpm_tis.c</div>
<div>@@ -846,7 &#43;846,7 @@ static void tpm_tis_mmio_write(void *opaque, h=
waddr addr,</div>
<div>&nbsp;static const MemoryRegionOps tpm_tis_memory_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tpm_tis_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tpm_tis_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/usb/chipidea.c b/hw/usb/chipidea.c</div>
<div>index 3dcd22c..5085a7f 100644</div>
<div>--- a/hw/usb/chipidea.c</div>
<div>&#43;&#43;&#43; b/hw/usb/chipidea.c</div>
<div>@@ -35,7 &#43;35,7 @@ static void chipidea_write(void *opaque, hwaddr =
offset,</div>
<div>&nbsp;static const struct MemoryRegionOps chipidea_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D chipidea_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D chipidea_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>@@ -76,7 &#43;76,7 @@ static void chipidea_dc_write(void *opaque, hwad=
dr offset,</div>
<div>&nbsp;static const struct MemoryRegionOps chipidea_dc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D chipidea_dc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D chipidea_dc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c</div>
<div>index cd1f3c7..88e53f6 100644</div>
<div>--- a/hw/usb/hcd-ehci-sysbus.c</div>
<div>&#43;&#43;&#43; b/hw/usb/hcd-ehci-sysbus.c</div>
<div>@@ -223,7 &#43;223,7 @@ static const MemoryRegionOps fusbh200_ehci_mmi=
o_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D fusbh200_ehci_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void fusbh200_ehci_init(Object *obj)</div>
<div>diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c</div>
<div>index 62dab05..79ce13d 100644</div>
<div>--- a/hw/usb/hcd-ehci.c</div>
<div>&#43;&#43;&#43; b/hw/usb/hcd-ehci.c</div>
<div>@@ -2357,7 &#43;2357,7 @@ static const MemoryRegionOps ehci_mmio_caps_=
ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 1,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps ehci_mmio_opreg_ops =3D {</div>
<div>@@ -2365,7 &#43;2365,7 @@ static const MemoryRegionOps ehci_mmio_opreg=
_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ehci_opreg_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps ehci_mmio_port_ops =3D {</div>
<div>@@ -2373,7 &#43;2373,7 @@ static const MemoryRegionOps ehci_mmio_port_=
ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ehci_port_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static USBPortOps ehci_port_ops =3D {</div>
<div>diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c</div>
<div>index 4f6fdbc..9d7cc15 100644</div>
<div>--- a/hw/usb/hcd-ohci.c</div>
<div>&#43;&#43;&#43; b/hw/usb/hcd-ohci.c</div>
<div>@@ -1774,7 &#43;1774,7 @@ static void ohci_async_cancel_device(OHCISta=
te *ohci, USBDevice *dev)</div>
<div>&nbsp;static const MemoryRegionOps ohci_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ohci_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ohci_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static USBPortOps ohci_port_ops =3D {</div>
<div>diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c</div>
<div>index 98bd5cf..1f0aa49 100644</div>
<div>--- a/hw/usb/hcd-uhci.c</div>
<div>&#43;&#43;&#43; b/hw/usb/hcd-uhci.c</div>
<div>@@ -1196,7 &#43;1196,7 @@ static const MemoryRegionOps uhci_ioport_ops=
 =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 2,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static USBPortOps uhci_port_ops =3D {</div>
<div>diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c</div>
<div>index 5894a18..24d4a85 100644</div>
<div>--- a/hw/usb/hcd-xhci.c</div>
<div>&#43;&#43;&#43; b/hw/usb/hcd-xhci.c</div>
<div>@@ -3161,7 &#43;3161,7 @@ static const MemoryRegionOps xhci_cap_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps xhci_oper_ops =3D {</div>
<div>@@ -3169,7 &#43;3169,7 @@ static const MemoryRegionOps xhci_oper_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xhci_oper_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps xhci_port_ops =3D {</div>
<div>@@ -3177,7 &#43;3177,7 @@ static const MemoryRegionOps xhci_port_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xhci_port_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps xhci_runtime_ops =3D {</div>
<div>@@ -3185,7 &#43;3185,7 @@ static const MemoryRegionOps xhci_runtime_op=
s =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xhci_runtime_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps xhci_doorbell_ops =3D {</div>
<div>@@ -3193,7 &#43;3193,7 @@ static const MemoryRegionOps xhci_doorbell_o=
ps =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xhci_doorbell_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void xhci_attach(USBPort *usbport)</div>
<div>diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c</div>
<div>index a61b0f6..3819198 100644</div>
<div>--- a/hw/usb/tusb6010.c</div>
<div>&#43;&#43;&#43; b/hw/usb/tusb6010.c</div>
<div>@@ -678,7 &#43;678,7 @@ static const MemoryRegionOps tusb_async_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tusb_async_writefn,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void tusb_otg_tick(void *opaque)</div>
<div>diff --git a/hw/vfio/common.c b/hw/vfio/common.c</div>
<div>index a859298..8954530 100644</div>
<div>--- a/hw/vfio/common.c</div>
<div>&#43;&#43;&#43; b/hw/vfio/common.c</div>
<div>@@ -274,7 &#43;274,7 @@ uint64_t vfio_region_read(void *opaque,</div>
<div>&nbsp;const MemoryRegionOps vfio_region_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_region_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vfio_region_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c</div>
<div>index fb3cc33..d5c0268 100644</div>
<div>--- a/hw/vfio/pci-quirks.c</div>
<div>&#43;&#43;&#43; b/hw/vfio/pci-quirks.c</div>
<div>@@ -150,7 &#43;150,7 @@ static void vfio_generic_window_quirk_address_=
write(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps vfio_generic_window_address_quirk =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_generic_window_quirk_address_read,<=
/div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vfio_generic_window_quirk_address_write=
,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t vfio_generic_window_quirk_data_read(void *opaque=
,</div>
<div>@@ -193,7 &#43;193,7 @@ static void vfio_generic_window_quirk_data_wri=
te(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps vfio_generic_window_data_quirk =3D =
{</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_generic_window_quirk_data_read,</di=
v>
<div>&nbsp; &nbsp; &nbsp;.write =3D vfio_generic_window_quirk_data_write,</=
div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/*</div>
<div>@@ -243,7 &#43;243,7 @@ static void vfio_generic_quirk_mirror_write(vo=
id *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps vfio_generic_mirror_quirk =3D {</di=
v>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_generic_quirk_mirror_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vfio_generic_quirk_mirror_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/* Is range1 fully contained within range2? &nbsp;*/</div>
<div>@@ -278,7 &#43;278,7 @@ static uint64_t vfio_ati_3c3_quirk_read(void *=
opaque,</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps vfio_ati_3c3_quirk =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_ati_3c3_quirk_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static VFIOQuirk *vfio_quirk_alloc(int nr_mem)</div>
<div>@@ -605,7 &#43;605,7 @@ static void vfio_nvidia_3d4_quirk_write(void *=
opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps vfio_nvidia_3d4_quirk =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_nvidia_3d4_quirk_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vfio_nvidia_3d4_quirk_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t vfio_nvidia_3d0_quirk_read(void *opaque,</div>
<div>@@ -663,7 &#43;663,7 @@ static void vfio_nvidia_3d0_quirk_write(void *=
opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps vfio_nvidia_3d0_quirk =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_nvidia_3d0_quirk_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vfio_nvidia_3d0_quirk_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void vfio_vga_probe_nvidia_3d0_quirk(VFIOPCIDevice *vdev)=
</div>
<div>@@ -752,7 &#43;752,7 @@ static void vfio_nvidia_bar5_quirk_master_writ=
e(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps vfio_nvidia_bar5_quirk_master =3D {=
</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_nvidia_bar5_quirk_master_read,</div=
>
<div>&nbsp; &nbsp; &nbsp;.write =3D vfio_nvidia_bar5_quirk_master_write,</d=
iv>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t vfio_nvidia_bar5_quirk_enable_read(void *opaque,=
</div>
<div>@@ -779,7 &#43;779,7 @@ static void vfio_nvidia_bar5_quirk_enable_writ=
e(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps vfio_nvidia_bar5_quirk_enable =3D {=
</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_nvidia_bar5_quirk_enable_read,</div=
>
<div>&nbsp; &nbsp; &nbsp;.write =3D vfio_nvidia_bar5_quirk_enable_write,</d=
iv>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void vfio_probe_nvidia_bar5_quirk(VFIOPCIDevice *vdev, in=
t nr)</div>
<div>@@ -929,7 &#43;929,7 @@ static void vfio_nvidia_quirk_mirror_write(voi=
d *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps vfio_nvidia_mirror_quirk =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_generic_quirk_mirror_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vfio_nvidia_quirk_mirror_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void vfio_nvidia_bar0_quirk_reset(VFIOPCIDevice *vdev, VF=
IOQuirk *quirk)</div>
<div>@@ -1090,7 &#43;1090,7 @@ static const MemoryRegionOps vfio_rtl_addres=
s_quirk =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.unaligned =3D false,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t vfio_rtl8168_quirk_data_read(void *opaque,</div>
<div>@@ -1130,7 &#43;1130,7 @@ static const MemoryRegionOps vfio_rtl_data_q=
uirk =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.unaligned =3D false,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void vfio_probe_rtl8168_bar2_quirk(VFIOPCIDevice *vdev, i=
nt nr)</div>
<div>@@ -1526,7 &#43;1526,7 @@ static void vfio_igd_quirk_data_write(void *=
opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps vfio_igd_data_quirk =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_igd_quirk_data_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vfio_igd_quirk_data_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t vfio_igd_quirk_index_read(void *opaque,</div>
<div>@@ -1554,7 &#43;1554,7 @@ static void vfio_igd_quirk_index_write(void =
*opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps vfio_igd_index_quirk =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_igd_quirk_index_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vfio_igd_quirk_index_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int n=
r)</div>
<div>diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c</div>
<div>index d7a4e18..dab2a89 100644</div>
<div>--- a/hw/vfio/pci.c</div>
<div>&#43;&#43;&#43; b/hw/vfio/pci.c</div>
<div>@@ -879,7 &#43;879,7 @@ static void vfio_rom_write(void *opaque, hwadd=
r addr,</div>
<div>&nbsp;static const MemoryRegionOps vfio_rom_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_rom_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vfio_rom_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void vfio_pci_size_rom(VFIOPCIDevice *vdev)</div>
<div>@@ -1027,7 &#43;1027,7 @@ uint64_t vfio_vga_read(void *opaque, hwaddr =
addr, unsigned size)</div>
<div>&nbsp;static const MemoryRegionOps vfio_vga_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D vfio_vga_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D vfio_vga_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;/*</div>
<div>diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c</div>
<div>index 97b7f35..84a3f5e 100644</div>
<div>--- a/hw/virtio/virtio-mmio.c</div>
<div>&#43;&#43;&#43; b/hw/virtio/virtio-mmio.c</div>
<div>@@ -313,7 &#43;313,7 @@ static void virtio_mmio_write(void *opaque, hw=
addr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps virtio_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D virtio_mmio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D virtio_mmio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void virtio_mmio_update_irq(DeviceState *opaque, uint16_t=
 vector)</div>
<div>diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c</div>
<div>index 25875c8..b929e44 100644</div>
<div>--- a/hw/virtio/virtio-pci.c</div>
<div>&#43;&#43;&#43; b/hw/virtio/virtio-pci.c</div>
<div>@@ -484,7 &#43;484,7 @@ static const MemoryRegionOps virtio_pci_config=
_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static MemoryRegion *virtio_address_space_lookup(VirtIOPCIProxy =
*proxy,</div>
<div>@@ -1387,7 &#43;1387,7 @@ static void virtio_pci_modern_regions_init(V=
irtIOPCIProxy *proxy)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;};</div>
<div>&nbsp; &nbsp; &nbsp;static const MemoryRegionOps isr_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D virtio_pci_isr_read,</div>
<div>@@ -1396,7 &#43;1396,7 @@ static void virtio_pci_modern_regions_init(V=
irtIOPCIProxy *proxy)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;};</div>
<div>&nbsp; &nbsp; &nbsp;static const MemoryRegionOps device_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D virtio_pci_device_read,</d=
iv>
<div>@@ -1405,7 &#43;1405,7 @@ static void virtio_pci_modern_regions_init(V=
irtIOPCIProxy *proxy)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;};</div>
<div>&nbsp; &nbsp; &nbsp;static const MemoryRegionOps notify_ops =3D {</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D virtio_pci_notify_read,</d=
iv>
<div>@@ -1414,7 &#43;1414,7 @@ static void virtio_pci_modern_regions_init(V=
irtIOPCIProxy *proxy)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;};</div>
<div>&nbsp; &nbsp; &nbsp;static const MemoryRegionOps notify_pio_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D virtio_pci_notify_read,</d=
iv>
<div>@@ -1423,7 &#43;1423,7 @@ static void virtio_pci_modern_regions_init(V=
irtIOPCIProxy *proxy)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-=
watchdog.c</div>
<div>index 54ac393..fcfa3b4 100644</div>
<div>--- a/hw/watchdog/cmsdk-apb-watchdog.c</div>
<div>&#43;&#43;&#43; b/hw/watchdog/cmsdk-apb-watchdog.c</div>
<div>@@ -261,7 &#43;261,7 @@ bad_offset:</div>
<div>&nbsp;static const MemoryRegionOps cmsdk_apb_watchdog_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cmsdk_apb_watchdog_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cmsdk_apb_watchdog_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;/* byte/halfword accesses are just zero-padded on =
reads and writes */</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 4,</div>
<div>diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c</div>
<div>index 57fe24a..775f73e 100644</div>
<div>--- a/hw/watchdog/wdt_aspeed.c</div>
<div>&#43;&#43;&#43; b/hw/watchdog/wdt_aspeed.c</div>
<div>@@ -202,7 &#43;202,7 @@ static const VMStateDescription vmstate_aspeed=
_wdt =3D {</div>
<div>&nbsp;static const MemoryRegionOps aspeed_wdt_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aspeed_wdt_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aspeed_wdt_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.unaligned =3D false,</div>
<div>diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c</=
div>
<div>index 6780f01..11cb1ed 100644</div>
<div>--- a/hw/watchdog/wdt_i6300esb.c</div>
<div>&#43;&#43;&#43; b/hw/watchdog/wdt_i6300esb.c</div>
<div>@@ -398,7 &#43;398,7 @@ static const MemoryRegionOps i6300esb_ops =3D =
{</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D i6300esb_mem_writefn,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_i6300esb =3D {</div>
<div>diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c</div>
<div>index 5539d56..215b615 100644</div>
<div>--- a/hw/xen/xen_pt.c</div>
<div>&#43;&#43;&#43; b/hw/xen/xen_pt.c</div>
<div>@@ -436,7 &#43;436,7 @@ static void xen_pt_bar_write(void *o, hwaddr a=
ddr, uint64_t val,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps ops =3D {</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xen_pt_bar_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xen_pt_bar_write,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c</div>
<div>index fb4b887..d12cc1f 100644</div>
<div>--- a/hw/xen/xen_pt_msi.c</div>
<div>&#43;&#43;&#43; b/hw/xen/xen_pt_msi.c</div>
<div>@@ -507,7 &#43;507,7 @@ static bool pci_msix_accepts(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pci_msix_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_msix_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_msix_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/xtensa/mx_pic.c b/hw/xtensa/mx_pic.c</div>
<div>index 7075db9..9f11231 100644</div>
<div>--- a/hw/xtensa/mx_pic.c</div>
<div>&#43;&#43;&#43; b/hw/xtensa/mx_pic.c</div>
<div>@@ -266,7 &#43;266,7 @@ static void xtensa_mx_pic_ext_reg_write(void *=
opaque, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps xtensa_mx_pic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xtensa_mx_pic_ext_reg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xtensa_mx_pic_ext_reg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.unaligned =3D true,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c</div>
<div>index f7f3e11..3d4a44a 100644</div>
<div>--- a/hw/xtensa/xtfpga.c</div>
<div>&#43;&#43;&#43; b/hw/xtensa/xtfpga.c</div>
<div>@@ -117,7 &#43;117,7 @@ static void xtfpga_fpga_write(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps xtfpga_fpga_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xtfpga_fpga_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xtfpga_fpga_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static XtfpgaFpgaState *xtfpga_fpga_init(MemoryRegion *address_s=
pace,</div>
<div>@@ -212,7 &#43;212,7 @@ static void xtfpga_io_write(void *opaque, hwad=
dr addr,</div>
<div>&nbsp;static const MemoryRegionOps xtfpga_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D xtfpga_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D xtfpga_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void xtfpga_init(const XtfpgaBoardDesc *board, MachineSta=
te *machine)</div>
<div>@@ -311,7 &#43;311,7 @@ static void xtfpga_init(const XtfpgaBoardDesc =
*board, MachineState *machine)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;serial_mm_init(system_io, 0x0d050020, 2, extints[0=
],</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 11520=
0, serial_hd(0), DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1=
15200, serial_hd(0), MO_TE);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;dinfo =3D drive_get(IF_PFLASH, 0, 0);</div>
<div>&nbsp; &nbsp; &nbsp;if (dinfo) {</div>
<div>diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h</di=
v>
<div>index c388453..01a29ba 100644</div>
<div>--- a/include/exec/cpu-common.h</div>
<div>&#43;&#43;&#43; b/include/exec/cpu-common.h</div>
<div>@@ -27,9 &#43;27,9 @@ enum device_endian {</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(HOST_WORDS_BIGENDIAN)</div>
<div>-#define DEVICE_HOST_ENDIAN DEVICE_BIG_ENDIAN</div>
<div>&#43;#define DEVICE_HOST_ENDIAN MO_BE</div>
<div>&nbsp;#else</div>
<div>-#define DEVICE_HOST_ENDIAN DEVICE_LITTLE_ENDIAN</div>
<div>&#43;#define DEVICE_HOST_ENDIAN MO_LE</div>
<div>&nbsp;#endif</div>
<div>&nbsp;</div>
<div>&nbsp;/* address in the RAM (different from a physical address) */</di=
v>
<div>diff --git a/include/exec/memory.h b/include/exec/memory.h</div>
<div>index 975b86a..d7acf6a 100644</div>
<div>--- a/include/exec/memory.h</div>
<div>&#43;&#43;&#43; b/include/exec/memory.h</div>
<div>@@ -168,7 &#43;168,7 @@ struct MemoryRegionOps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned size=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MemTxAttrs at=
trs);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;enum device_endian endianness;</div>
<div>&#43; &nbsp; &nbsp;MemOp endianness;</div>
<div>&nbsp; &nbsp; &nbsp;/* Guest-visible constraints: */</div>
<div>&nbsp; &nbsp; &nbsp;struct {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* If nonzero, specify bounds on acc=
ess sizes beyond which a machine</div>
<div>diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h</div>
<div>index abd5cf7..3a12485 100644</div>
<div>--- a/include/hw/char/serial.h</div>
<div>&#43;&#43;&#43; b/include/hw/char/serial.h</div>
<div>@@ -92,7 &#43;92,7 @@ SerialState *serial_init(int base, qemu_irq irq,=
 int baudbase,</div>
<div>&nbsp;SerialState *serial_mm_init(MemoryRegion *address_space,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr base, int it_shift,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_irq irq, int baudbase,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;Chardev *chr, enum device_endian end);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Chardev *chr, MemOp end);</div>
<div>&nbsp;</div>
<div>&nbsp;/* serial-isa.c */</div>
<div>&nbsp;</div>
<div>diff --git a/ioport.c b/ioport.c</div>
<div>index 04e360e..e5713e8 100644</div>
<div>--- a/ioport.c</div>
<div>&#43;&#43;&#43; b/ioport.c</div>
<div>@@ -51,7 &#43;51,7 @@ static void unassigned_io_write(void *opaque, hw=
addr addr, uint64_t val,</div>
<div>&nbsp;const MemoryRegionOps unassigned_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D unassigned_io_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D unassigned_io_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void cpu_outb(uint32_t addr, uint8_t val)</div>
<div>@@ -213,7 &#43;213,7 @@ static void portio_write(void *opaque, hwaddr =
addr, uint64_t data,</div>
<div>&nbsp;static const MemoryRegionOps portio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D portio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D portio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.unaligned =3D true,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.unaligned =3D true,</div>
<div>&nbsp;};</div>
<div>diff --git a/memory.c b/memory.c</div>
<div>index 89ea4fb..3cabb52 100644</div>
<div>--- a/memory.c</div>
<div>&#43;&#43;&#43; b/memory.c</div>
<div>@@ -346,18 &#43;346,18 @@ static void flatview_simplify(FlatView *view=
)</div>
<div>&nbsp;static bool memory_region_big_endian(MemoryRegion *mr)</div>
<div>&nbsp;{</div>
<div>&nbsp;#ifdef TARGET_WORDS_BIGENDIAN</div>
<div>- &nbsp; &nbsp;return mr-&gt;ops-&gt;endianness !=3D DEVICE_LITTLE_END=
IAN;</div>
<div>&#43; &nbsp; &nbsp;return mr-&gt;ops-&gt;endianness !=3D MO_LE;</div>
<div>&nbsp;#else</div>
<div>- &nbsp; &nbsp;return mr-&gt;ops-&gt;endianness =3D=3D DEVICE_BIG_ENDI=
AN;</div>
<div>&#43; &nbsp; &nbsp;return mr-&gt;ops-&gt;endianness =3D=3D MO_BE;</div=
>
<div>&nbsp;#endif</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static bool memory_region_wrong_endianness(MemoryRegion *mr)</di=
v>
<div>&nbsp;{</div>
<div>&nbsp;#ifdef TARGET_WORDS_BIGENDIAN</div>
<div>- &nbsp; &nbsp;return mr-&gt;ops-&gt;endianness =3D=3D DEVICE_LITTLE_E=
NDIAN;</div>
<div>&#43; &nbsp; &nbsp;return mr-&gt;ops-&gt;endianness =3D=3D MO_LE;</div=
>
<div>&nbsp;#else</div>
<div>- &nbsp; &nbsp;return mr-&gt;ops-&gt;endianness =3D=3D DEVICE_BIG_ENDI=
AN;</div>
<div>&#43; &nbsp; &nbsp;return mr-&gt;ops-&gt;endianness =3D=3D MO_BE;</div=
>
<div>&nbsp;#endif</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1307,7 &#43;1307,7 @@ static bool unassigned_mem_accepts(void *opa=
que, hwaddr addr,</div>
<div>&nbsp;</div>
<div>&nbsp;const MemoryRegionOps unassigned_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.valid.accepts =3D unassigned_mem_accepts,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_TE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t memory_region_ram_device_read(void *opaque,</div=
>
<div>diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c</div>
<div>index de658c4..8fc790f 100644</div>
<div>--- a/memory_ldst.inc.c</div>
<div>&#43;&#43;&#43; b/memory_ldst.inc.c</div>
<div>@@ -21,8 &#43;21,7 @@</div>
<div>&nbsp;</div>
<div>&nbsp;/* warning: addr must be aligned */</div>
<div>&nbsp;static inline uint32_t glue(address_space_ldl_internal, SUFFIX)(=
ARG1_DECL,</div>
<div>- &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result,</di=
v>
<div>- &nbsp; &nbsp;enum device_endian endian)</div>
<div>&#43; &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result,=
 MemOp endian)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uint8_t *ptr;</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t val;</div>
<div>@@ -40,11 &#43;39,11 @@ static inline uint32_t glue(address_space_ldl_=
internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr=
, addr1, &amp;val, MO_32, attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {=
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_BIG_ENDIAN) {</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_BE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>@@ -52,10 &#43;51,10 @@ static inline uint32_t glue(address_space_ldl_=
internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (endian) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case DEVICE_LITTLE_ENDIAN:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_LE:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D ldl_le_p(ptr);=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case DEVICE_BIG_ENDIAN:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_BE:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D ldl_be_p(ptr);=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -78,27 &#43;77,26 @@ uint32_t glue(address_space_ldl, SUFFIX)(ARG1_=
DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return glue(address_space_ldl_internal, SUFFIX)(AR=
G1, addr, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MO_TE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;uint32_t glue(address_space_ldl_le, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return glue(address_space_ldl_internal, SUFFIX)(AR=
G1, addr, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DEVICE_LITTLE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MO_LE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;uint32_t glue(address_space_ldl_be, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return glue(address_space_ldl_internal, SUFFIX)(AR=
G1, addr, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MO_BE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* warning: addr must be aligned */</div>
<div>&nbsp;static inline uint64_t glue(address_space_ldq_internal, SUFFIX)(=
ARG1_DECL,</div>
<div>- &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result,</di=
v>
<div>- &nbsp; &nbsp;enum device_endian endian)</div>
<div>&#43; &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result,=
 MemOp endian)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uint8_t *ptr;</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t val;</div>
<div>@@ -116,11 &#43;114,11 @@ static inline uint64_t glue(address_space_ld=
q_internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr=
, addr1, &amp;val, MO_64, attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {=
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_BIG_ENDIAN) {</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_BE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>@@ -128,10 &#43;126,10 @@ static inline uint64_t glue(address_space_ld=
q_internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (endian) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case DEVICE_LITTLE_ENDIAN:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_LE:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D ldq_le_p(ptr);=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case DEVICE_BIG_ENDIAN:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_BE:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D ldq_be_p(ptr);=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -154,21 &#43;152,21 @@ uint64_t glue(address_space_ldq, SUFFIX)(ARG=
1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return glue(address_space_ldq_internal, SUFFIX)(AR=
G1, addr, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MO_TE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;uint64_t glue(address_space_ldq_le, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return glue(address_space_ldq_internal, SUFFIX)(AR=
G1, addr, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DEVICE_LITTLE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MO_LE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;uint64_t glue(address_space_ldq_be, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return glue(address_space_ldq_internal, SUFFIX)(AR=
G1, addr, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MO_BE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,</div>
<div>@@ -207,8 &#43;205,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1=
_DECL,</div>
<div>&nbsp;</div>
<div>&nbsp;/* warning: addr must be aligned */</div>
<div>&nbsp;static inline uint32_t glue(address_space_lduw_internal, SUFFIX)=
(ARG1_DECL,</div>
<div>- &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result,</di=
v>
<div>- &nbsp; &nbsp;enum device_endian endian)</div>
<div>&#43; &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result,=
 MemOp endian)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uint8_t *ptr;</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t val;</div>
<div>@@ -226,11 &#43;223,11 @@ static inline uint32_t glue(address_space_ld=
uw_internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr=
, addr1, &amp;val, MO_16, attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {=
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_BIG_ENDIAN) {</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_BE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>@@ -238,10 &#43;235,10 @@ static inline uint32_t glue(address_space_ld=
uw_internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (endian) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case DEVICE_LITTLE_ENDIAN:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_LE:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D lduw_le_p(ptr)=
;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case DEVICE_BIG_ENDIAN:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_BE:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D lduw_be_p(ptr)=
;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -264,21 &#43;261,21 @@ uint32_t glue(address_space_lduw, SUFFIX)(AR=
G1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return glue(address_space_lduw_internal, SUFFIX)(A=
RG1, addr, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MO_TE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;uint32_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return glue(address_space_lduw_internal, SUFFIX)(A=
RG1, addr, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DEVICE_LITTLE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MO_LE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;uint32_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, MemTxAttrs attrs, MemTxResult *result=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return glue(address_space_lduw_internal, SUFFIX)(A=
RG1, addr, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DEVICE_BIG=
_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MO_BE)=
;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* warning: addr must be aligned. The ram page is not masked as =
dirty</div>
<div>@@ -322,8 &#43;319,8 @@ void glue(address_space_stl_notdirty, SUFFIX)(=
ARG1_DECL,</div>
<div>&nbsp;</div>
<div>&nbsp;/* warning: addr must be aligned */</div>
<div>&nbsp;static inline void glue(address_space_stl_internal, SUFFIX)(ARG1=
_DECL,</div>
<div>- &nbsp; &nbsp;hwaddr addr, uint32_t val, MemTxAttrs attrs,</div>
<div>- &nbsp; &nbsp;MemTxResult *result, enum device_endian endian)</div>
<div>&#43; &nbsp; &nbsp;hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxR=
esult *result,</div>
<div>&#43; &nbsp; &nbsp;MemOp endian)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uint8_t *ptr;</div>
<div>&nbsp; &nbsp; &nbsp;MemoryRegion *mr;</div>
<div>@@ -338,11 &#43;335,11 @@ static inline void glue(address_space_stl_in=
ternal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {=
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_BIG_ENDIAN) {</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_BE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>@@ -351,10 &#43;348,10 @@ static inline void glue(address_space_stl_in=
ternal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (endian) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case DEVICE_LITTLE_ENDIAN:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_LE:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stl_le_p(ptr, val);</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case DEVICE_BIG_ENDIAN:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_BE:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stl_be_p(ptr, val);</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -377,21 &#43;374,21 @@ void glue(address_space_stl, SUFFIX)(ARG1_DE=
CL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTx=
Result *result)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;glue(address_space_stl_internal, SUFFIX)(ARG1, add=
r, val, attrs,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; result, DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; result, MO_TE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void glue(address_space_stl_le, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTx=
Result *result)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;glue(address_space_stl_internal, SUFFIX)(ARG1, addr, va=
l, attrs,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; result, DEVICE_LITTLE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp;glue(address_space_stl_internal, SUFFIX)(ARG1, addr=
, val, attrs, result,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; MO_LE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void glue(address_space_stl_be, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTx=
Result *result)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;glue(address_space_stl_internal, SUFFIX)(ARG1, add=
r, val, attrs,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; result, DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; result, MO_BE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void glue(address_space_stb, SUFFIX)(ARG1_DECL,</div>
<div>@@ -428,7 &#43;425,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL=
,</div>
<div>&nbsp;/* warning: addr must be aligned */</div>
<div>&nbsp;static inline void glue(address_space_stw_internal, SUFFIX)(ARG1=
_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, uint32_t val, MemTxAttrs attrs,</div>
<div>- &nbsp; &nbsp;MemTxResult *result, enum device_endian endian)</div>
<div>&#43; &nbsp; &nbsp;MemTxResult *result, MemOp endian)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uint8_t *ptr;</div>
<div>&nbsp; &nbsp; &nbsp;MemoryRegion *mr;</div>
<div>@@ -443,11 &#43;440,11 @@ static inline void glue(address_space_stw_in=
ternal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {=
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_BIG_ENDIAN) {</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_BE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>@@ -456,10 &#43;453,10 @@ static inline void glue(address_space_stw_in=
ternal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (endian) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case DEVICE_LITTLE_ENDIAN:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_LE:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stw_le_p(ptr, val);</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case DEVICE_BIG_ENDIAN:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_BE:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stw_be_p(ptr, val);</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -482,26 &#43;479,26 @@ void glue(address_space_stw, SUFFIX)(ARG1_DE=
CL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTx=
Result *result)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;glue(address_space_stw_internal, SUFFIX)(ARG1, add=
r, val, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; MO_TE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void glue(address_space_stw_le, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTx=
Result *result)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;glue(address_space_stw_internal, SUFFIX)(ARG1, add=
r, val, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; DEVICE_LITTLE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; MO_LE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void glue(address_space_stw_be, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTx=
Result *result)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;glue(address_space_stw_internal, SUFFIX)(ARG1, add=
r, val, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MO_BE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void glue(address_space_stq_internal, SUFFIX)(ARG1_DECL,<=
/div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, uint64_t val, MemTxAttrs attrs,</div>
<div>- &nbsp; &nbsp;MemTxResult *result, enum device_endian endian)</div>
<div>&#43; &nbsp; &nbsp;MemTxResult *result, MemOp endian)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uint8_t *ptr;</div>
<div>&nbsp; &nbsp; &nbsp;MemoryRegion *mr;</div>
<div>@@ -516,11 &#43;513,11 @@ static void glue(address_space_stq_internal,=
 SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {=
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_BIG_ENDIAN) {</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_BE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>@@ -529,10 &#43;526,10 @@ static void glue(address_space_stq_internal,=
 SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (endian) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case DEVICE_LITTLE_ENDIAN:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_LE:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stq_le_p(ptr, val);</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case DEVICE_BIG_ENDIAN:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_BE:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stq_be_p(ptr, val);</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -555,21 &#43;552,21 @@ void glue(address_space_stq, SUFFIX)(ARG1_DE=
CL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTx=
Result *result)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;glue(address_space_stq_internal, SUFFIX)(ARG1, add=
r, val, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; DEVICE_NATIVE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; MO_TE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void glue(address_space_stq_le, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTx=
Result *result)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;glue(address_space_stq_internal, SUFFIX)(ARG1, add=
r, val, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; DEVICE_LITTLE_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; MO_LE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void glue(address_space_stq_be, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTx=
Result *result)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;glue(address_space_stq_internal, SUFFIX)(ARG1, add=
r, val, attrs, result,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; DEVICE_BIG_ENDIAN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; MO_BE);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;#undef ARG1_DECL</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_156594798105026795btcom_--


--===============8201054812744716714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8201054812744716714==--

