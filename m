Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19F983E0E7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 18:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672430.1046497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQND-00022w-Aa; Fri, 26 Jan 2024 17:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672430.1046497; Fri, 26 Jan 2024 17:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQND-000200-6w; Fri, 26 Jan 2024 17:52:15 +0000
Received: by outflank-mailman (input) for mailman id 672430;
 Fri, 26 Jan 2024 17:52:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPDA=JE=casper.srs.infradead.org=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ4z-0004m7-PX
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:25 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffb7e35e-bc70-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 18:33:21 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ48-0000000EKUB-0emG; Fri, 26 Jan 2024 17:32:33 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ46-00000001elD-3aD3;
 Fri, 26 Jan 2024 17:32:30 +0000
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
X-Inumbo-ID: ffb7e35e-bc70-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=uxZ4mGKFLew5MTQuKKAqXya97kMNkAzbjIcyINbmJGE=; b=L789Dzt6MRyCiK291RHRqqMe+V
	Srde9pmzJin4uUey0pMnEejE6xMp/9M6g9l8tUpziOzuA1LQmG6rsV3bmoeH8/PT+8JfpGSUEFn5l
	KxevtOxzueFYY2OObJ6DIyZ+82yb9ytGPa+mQTtz19N3nWl+4/q/3wIcad7/RyYkvIeZscD1AYX1D
	ZDDDvEFxB4zmkvOJJ44emRqdLNkEefIa4QpkmBquuL1m0pNRPsbTylK21NAJ3DbQoxa93w8Wxy/WM
	UDxk8pkVmj4SueJNAqldB8zJeNLBWFacCReO65PwoSiWKbu+ybgxJaJ4uYzWsw0+hY35mfFeiGZNr
	UTejY6hA==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Helge Deller <deller@gmx.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	Thomas Huth <huth@tuxfamily.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jason Wang <jasowang@redhat.com>,
	Jia Liu <proljc@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 00/47] Rework matching of network devices to -nic options
Date: Fri, 26 Jan 2024 17:24:37 +0000
Message-ID: <20240126173228.394202-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


Most platforms iterating directly over the nd_table[] are doing one of 
two things. Either they are creating the NIC for their platform and want
to find a matching -nic configuration for it, if such exists. Or they
are only going to create that platform NIC if a matching config *does*
exist.

All of those can be converted to the new qemu_configure_nic_device()
and qemu_create_nic_device() functions. The latter of which will call
qdev_new() to create the device (and apply the config) if a matching
NIC config does exist for it. The existing behaviour of each platform
has been preserved for now, despite it being apparently fairly random.

PCI and indeed XenBus can use a qemu_create_nic_bus_devices() which will 
create all NICs that live on a given bus type. That covers most 
platforms, but some PCI platforms do something special with the first 
NIC of a given type, placing it in the slot where it would have been on 
the real hardware. There were various inconsistencies in the way the 
platforms did so, and whether they cared what model the NIC was. Those 
subtle behavioural changes I *have* allowed to change, and now the 
pci_init_nic_slot() function will pick the first NIC that the user 
specified which isn't explicitly *not* the default type, and put that
in the specified slot.

The tests for npcm7xx used to lament that they had to instantiate both
NICs even when they wanted to test only the second, because there was
no way to specify which hardware devices gets which configuration. I
made that untrue, by allowing 'emc0' and 'emc1' aliases, and fixed up
the test accordingly.

There are one or two special cases which want to do special things with
the MAC address of the primary NIC, to set up a system identification
(or force it to use an Apple OUI, in the case of m68k/q400). All those
work out relatively cleanly too.

And I can clean up the ugly patch which fixed up the Xen network device 
handling, and replace it with a simple call to the new 
qemu_create_nic_bus_devices() function.

I suspect that we can remove the pci_init_nic_devices() from platform
code and just do it later, except for platforms which *care* which
PCI bus the dynamic devices go on (is that just sun4u which puts its
primary NIC onto a different bus?).

Finally, while we're at it, clean up -nic model=help to only print
the device models which are actually usable on the given platform
rather than just listing them *all*.

And now we can make nd_table[] and nb_nics static in net/net.c because
nothing else has any business poking at them directly.

 v4: Fix LASI_82596 build and rework HPPA machine support for it.
     Slight improvement to ISA NE2000 error handling in hw/i386/pc.c.
     Document new functions better in include/net/net.h.
          
 v3: Rebase to 8.2

 v2: Some build fixes after better coverage testing, revert the Xen fix
     in this series because I'm putting the less invasive hack into 8.2
     (hopefully).


David Woodhouse (47):
      net: add qemu_{configure,create}_nic_device(), qemu_find_nic_info()
      net: report list of available models according to platform
      net: add qemu_create_nic_bus_devices()
      hw/pci: add pci_init_nic_devices(), pci_init_nic_in_slot()
      hw/i386/pc: use qemu_get_nic_info() and pci_init_nic_devices()
      hw/xen: use qemu_create_nic_bus_devices() to instantiate Xen NICs
      hw/alpha/dp264: use pci_init_nic_devices()
      hw/arm/sbsa-ref: use pci_init_nic_devices()
      hw/arm/virt: use pci_init_nic_devices()
      hw/hppa: use pci_init_nic_devices()
      hw/loongarch: use pci_init_nic_devices()
      hw/mips/fuloong2e: use pci_init_nic_devices()
      hw/mips/malta: use pci_init_nic_devices()
      hw/mips/loongson3_virt: use pci_init_nic_devices()
      hw/ppc/prep: use pci_init_nic_devices()
      hw/ppc/spapr: use qemu_get_nic_info() and pci_init_nic_devices()
      hw/ppc: use pci_init_nic_devices()
      hw/sh4/r2d: use pci_init_nic_devices()
      hw/sparc64/sun4u: use pci_init_nic_devices()
      hw/xtensa/virt: use pci_init_nic_devices()
      hw/arm/allwinner: use qemu_configure_nic_device()
      hw/arm/aspeed: use qemu_configure_nic_device()
      hw/arm/exynos4: use qemu_create_nic_device()
      hw/arm/fsl: use qemu_configure_nic_device()
      hw/net/smc91c111: use qemu_configure_nic_device()
      hw/net/lan9118: use qemu_configure_nic_device()
      hw/arm/highbank: use qemu_create_nic_device()
      hw/arm/npcm7xx: use qemu_configure_nic_device, allow emc0/emc1 as aliases
      hw/arm/stellaris: use qemu_find_nic_info()
      hw/arm: use qemu_configure_nic_device()
      hw/net/etraxfs-eth: use qemu_configure_nic_device()
      hw/m68k/mcf5208: use qemu_create_nic_device()
      hw/m68k/q800: use qemu_find_nic_info()
      hw/microblaze: use qemu_configure_nic_device()
      hw/mips/mipssim: use qemu_create_nic_device()
      hw/mips/jazz: use qemu_find_nic_info()
      hw/net/lasi_i82596: Re-enable build
      hw/net/lasi_i82596: use qemu_create_nic_device()
      hw/openrisc/openrisc_sim: use qemu_create_nic_device()
      hw/riscv: use qemu_configure_nic_device()
      hw/s390x/s390-virtio-ccw: use qemu_create_nic_device()
      hw/sparc/sun4m: use qemu_find_nic_info()
      hw/xtensa/xtfpga: use qemu_create_nic_device()
      net: remove qemu_check_nic_model()
      hw/pci: remove pci_nic_init_nofail()
      net: remove qemu_show_nic_models(), qemu_find_nic_model()
      net: make nb_nics and nd_table[] static in net/net.c

 hw/alpha/dp264.c                         |   4 +-
 hw/arm/allwinner-a10.c                   |   6 +-
 hw/arm/allwinner-h3.c                    |   6 +-
 hw/arm/allwinner-r40.c                   |  27 +---
 hw/arm/aspeed.c                          |   9 +-
 hw/arm/exynos4_boards.c                  |   6 +-
 hw/arm/fsl-imx25.c                       |   2 +-
 hw/arm/fsl-imx6.c                        |   2 +-
 hw/arm/fsl-imx6ul.c                      |   2 +-
 hw/arm/fsl-imx7.c                        |   2 +-
 hw/arm/gumstix.c                         |   6 +-
 hw/arm/highbank.c                        |  12 +-
 hw/arm/integratorcp.c                    |   5 +-
 hw/arm/kzm.c                             |   4 +-
 hw/arm/mainstone.c                       |   3 +-
 hw/arm/mps2-tz.c                         |   8 +-
 hw/arm/mps2.c                            |   2 +-
 hw/arm/msf2-soc.c                        |   6 +-
 hw/arm/musicpal.c                        |   3 +-
 hw/arm/npcm7xx.c                         |  16 +-
 hw/arm/realview.c                        |  25 ++-
 hw/arm/sbsa-ref.c                        |   4 +-
 hw/arm/stellaris.c                       |  30 +++-
 hw/arm/versatilepb.c                     |  15 +-
 hw/arm/vexpress.c                        |   4 +-
 hw/arm/virt.c                            |   4 +-
 hw/arm/xilinx_zynq.c                     |  11 +-
 hw/arm/xlnx-versal.c                     |   7 +-
 hw/arm/xlnx-zynqmp.c                     |   8 +-
 hw/cris/axis_dev88.c                     |   9 +-
 hw/hppa/machine.c                        |  14 +-
 hw/i386/pc.c                             |  38 +++--
 hw/i386/pc_piix.c                        |   2 +-
 hw/i386/pc_q35.c                         |   2 +-
 hw/loongarch/virt.c                      |   4 +-
 hw/m68k/mcf5208.c                        |  19 +--
 hw/m68k/q800.c                           |  29 ++--
 hw/microblaze/petalogix_ml605_mmu.c      |   3 +-
 hw/microblaze/petalogix_s3adsp1800_mmu.c |   3 +-
 hw/mips/fuloong2e.c                      |  16 +-
 hw/mips/jazz.c                           |  15 +-
 hw/mips/loongson3_virt.c                 |   4 +-
 hw/mips/malta.c                          |  15 +-
 hw/mips/mipssim.c                        |  13 +-
 hw/net/etraxfs_eth.c                     |   5 +-
 hw/net/lan9118.c                         |   5 +-
 hw/net/lasi_i82596.c                     |  13 +-
 hw/net/meson.build                       |   2 +-
 hw/net/smc91c111.c                       |   5 +-
 hw/openrisc/openrisc_sim.c               |  18 +--
 hw/pci/pci.c                             |  73 +++------
 hw/ppc/e500.c                            |   4 +-
 hw/ppc/mac_newworld.c                    |   4 +-
 hw/ppc/mac_oldworld.c                    |   4 +-
 hw/ppc/ppc440_bamboo.c                   |  14 +-
 hw/ppc/prep.c                            |   8 +-
 hw/ppc/spapr.c                           |  18 +--
 hw/riscv/microchip_pfsoc.c               |  14 +-
 hw/riscv/sifive_u.c                      |   7 +-
 hw/s390x/s390-virtio-ccw.c               |  11 +-
 hw/sh4/r2d.c                             |   6 +-
 hw/sparc/sun4m.c                         |  20 ++-
 hw/sparc64/sun4u.c                       |  27 +---
 hw/xen/xen-bus.c                         |   6 +-
 hw/xen/xen_devconfig.c                   |  25 ---
 hw/xenpv/xen_machine_pv.c                |   9 --
 hw/xtensa/virt.c                         |   4 +-
 hw/xtensa/xtfpga.c                       |  13 +-
 include/hw/cris/etraxfs.h                |   2 +-
 include/hw/i386/pc.h                     |   4 +-
 include/hw/net/lan9118.h                 |   2 +-
 include/hw/net/lasi_82596.h              |   4 +-
 include/hw/net/ne2000-isa.h              |   2 -
 include/hw/net/smc91c111.h               |   2 +-
 include/hw/pci/pci.h                     |   7 +-
 include/hw/xen/xen-bus.h                 |   2 +-
 include/hw/xen/xen-legacy-backend.h      |   1 -
 include/net/net.h                        |  70 ++++++++-
 net/net.c                                | 253 +++++++++++++++++++++++++------
 system/globals.c                         |   2 -
 tests/qtest/npcm7xx_emc-test.c           |  18 +--
 81 files changed, 547 insertions(+), 562 deletions(-)


