Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4317E2D99
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 21:06:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628363.979788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05ri-0008JM-V7; Mon, 06 Nov 2023 20:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628363.979788; Mon, 06 Nov 2023 20:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05ri-0008He-SB; Mon, 06 Nov 2023 20:06:30 +0000
Received: by outflank-mailman (input) for mailman id 628363;
 Mon, 06 Nov 2023 20:06:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHvK=GT=casper.srs.infradead.org=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hS-0001Ig-GC
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:54 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a9ea761-7cde-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:55:48 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fb-007taV-FP; Mon, 06 Nov 2023 19:54:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fb-001GON-2E; Mon, 06 Nov 2023 19:53:59 +0000
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
X-Inumbo-ID: 7a9ea761-7cde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=q0R/vGQ9T82wbQo8p5ZlrUQuMaAjQBGhQrtm5gCHFCU=; b=YK3C7Jenk8mKIqGsUPnTM8EyMw
	POLjAyOcSK0W2nDQyOB2QKERFVOXLtAM8+Eia0Y14pKOJNsATlJqpxv6JlVEbkDNYtghyf1UmyRQX
	PrB/HF2paV+1bsRVE6RKGuXAGQuamQ9TQ81HyyI7hmWIZBK29wXf0aaQAsBc/ZXJ3Nf+6i5U2t6E1
	7KVtgPm3H/8Ud8rHHF3VHKZceX6K/IMgYs0/Q/IrNufePqWlNamLXvESBdKCwjSiY6/zMkMGq+v26
	m+dGAQv/40uXcGzWgcW1RTl7euzbtf1m8nckwmOYBYK6bX/OJeLw/JVvqBx9i2vuxPgRTVnuGEJb9
	hwMMKwyQ==;
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
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
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
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
Subject: [PATCH for-8.3 v2 25/46] hw/net/smc91c111: use qemu_configure_nic_device()
Date: Mon,  6 Nov 2023 19:49:30 +0000
Message-ID: <20231106195352.301038-26-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Some callers instantiate the device unconditionally, others will do so only
if there is a NICInfo to go with it. This appears to be fairly random, but
preserve the existing behaviour for now.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/gumstix.c           |  6 ++----
 hw/arm/integratorcp.c      |  5 +++--
 hw/arm/mainstone.c         |  3 +--
 hw/arm/realview.c          | 25 ++++++++++---------------
 hw/arm/versatilepb.c       | 15 ++++-----------
 hw/net/smc91c111.c         |  5 ++---
 include/hw/net/smc91c111.h |  2 +-
 7 files changed, 23 insertions(+), 38 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 2ca4140c9f..f58c4da7f9 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -74,8 +74,7 @@ static void connex_init(MachineState *machine)
                           FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0);
 
     /* Interrupt line of NIC is connected to GPIO line 36 */
-    smc91c111_init(&nd_table[0], 0x04000300,
-                    qdev_get_gpio_in(cpu->gpio, 36));
+    smc91c111_init(0x04000300, qdev_get_gpio_in(cpu->gpio, 36));
 }
 
 static void verdex_init(MachineState *machine)
@@ -98,8 +97,7 @@ static void verdex_init(MachineState *machine)
                           FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0);
 
     /* Interrupt line of NIC is connected to GPIO line 99 */
-    smc91c111_init(&nd_table[0], 0x04000300,
-                    qdev_get_gpio_in(cpu->gpio, 99));
+    smc91c111_init(0x04000300, qdev_get_gpio_in(cpu->gpio, 99));
 }
 
 static void connex_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index d176e9af7e..29bc128992 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -669,8 +669,9 @@ static void integratorcp_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x1d000000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[25]);
 
-    if (nd_table[0].used)
-        smc91c111_init(&nd_table[0], 0xc8000000, pic[27]);
+    if (qemu_find_nic_info("smc91c111", true, NULL)) {
+        smc91c111_init(0xc8000000, pic[27]);
+    }
 
     sysbus_create_simple("pl110", 0xc0000000, pic[22]);
 
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 68329c4617..84dbb6e525 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -153,8 +153,7 @@ static void mainstone_common_init(MachineState *machine,
             qdev_get_gpio_in(mst_irq, S1_IRQ),
             qdev_get_gpio_in(mst_irq, S1_CD_IRQ));
 
-    smc91c111_init(&nd_table[0], MST_ETH_PHYS,
-                    qdev_get_gpio_in(mst_irq, ETHERNET_IRQ));
+    smc91c111_init(MST_ETH_PHYS, qdev_get_gpio_in(mst_irq, ETHERNET_IRQ));
 
     mainstone_binfo.board_id = arm_id;
     arm_load_kernel(mpu->cpu, machine, &mainstone_binfo);
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 132217b2ed..6e7529d98f 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -89,7 +89,6 @@ static void realview_init(MachineState *machine,
     I2CBus *i2c;
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
-    int done_nic = 0;
     qemu_irq cpu_irq[4];
     int is_mpcore = 0;
     int is_pb = 0;
@@ -295,24 +294,20 @@ static void realview_init(MachineState *machine,
             n--;
         }
     }
-    for(n = 0; n < nb_nics; n++) {
-        nd = &nd_table[n];
-
-        if (!done_nic && (!nd->model ||
-                    strcmp(nd->model, is_pb ? "lan9118" : "smc91c111") == 0)) {
-            if (is_pb) {
-                lan9118_init(nd, 0x4e000000, pic[28]);
-            } else {
-                smc91c111_init(nd, 0x4e000000, pic[28]);
-            }
-            done_nic = 1;
+
+    nd = qemu_find_nic_info(is_pb ? "lan9118" : "smc91c111", true, NULL);
+    if (nd) {
+        if (is_pb) {
+            lan9118_init(nd, 0x4e000000, pic[28]);
         } else {
-            if (pci_bus) {
-                pci_nic_init_nofail(nd, pci_bus, "rtl8139", NULL);
-            }
+            smc91c111_init(0x4e000000, pic[28]);
         }
     }
 
+    if (pci_bus) {
+        pci_init_nic_devices(pci_bus, "rtl8139");
+    }
+
     dev = sysbus_create_simple(TYPE_ARM_SBCON_I2C, 0x10002000, NULL);
     i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
     i2c_slave_create_simple(i2c, "ds1338", 0x68);
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 2f22dc890f..7bf2ba7c21 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -192,10 +192,8 @@ static void versatile_init(MachineState *machine, int board_id)
     SysBusDevice *busdev;
     DeviceState *pl041;
     PCIBus *pci_bus;
-    NICInfo *nd;
     I2CBus *i2c;
     int n;
-    int done_smc = 0;
     DriveInfo *dinfo;
 
     if (machine->ram_size > 0x10000000) {
@@ -263,16 +261,11 @@ static void versatile_init(MachineState *machine, int board_id)
     sysbus_connect_irq(busdev, 3, sic[30]);
     pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci");
 
-    for(n = 0; n < nb_nics; n++) {
-        nd = &nd_table[n];
-
-        if (!done_smc && (!nd->model || strcmp(nd->model, "smc91c111") == 0)) {
-            smc91c111_init(nd, 0x10010000, sic[25]);
-            done_smc = 1;
-        } else {
-            pci_nic_init_nofail(nd, pci_bus, "rtl8139", NULL);
-        }
+    if (qemu_find_nic_info("smc91c111", true, NULL)) {
+        smc91c111_init(0x10010000, sic[25]);
     }
+    pci_init_nic_devices(pci_bus, "rtl8139");
+
     if (machine_usb(machine)) {
         pci_create_simple(pci_bus, -1, "pci-ohci");
     }
diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index ddbceda967..dec4982cfe 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -817,14 +817,13 @@ static void smc91c111_register_types(void)
 
 /* Legacy helper function.  Should go away when machine config files are
    implemented.  */
-void smc91c111_init(NICInfo *nd, uint32_t base, qemu_irq irq)
+void smc91c111_init(uint32_t base, qemu_irq irq)
 {
     DeviceState *dev;
     SysBusDevice *s;
 
-    qemu_check_nic_model(nd, "smc91c111");
     dev = qdev_new(TYPE_SMC91C111);
-    qdev_set_nic_properties(dev, nd);
+    qemu_configure_nic_device(dev, true, NULL);
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, base);
diff --git a/include/hw/net/smc91c111.h b/include/hw/net/smc91c111.h
index df5b11dcef..dba32a233f 100644
--- a/include/hw/net/smc91c111.h
+++ b/include/hw/net/smc91c111.h
@@ -13,6 +13,6 @@
 
 #include "net/net.h"
 
-void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
+void smc91c111_init(uint32_t, qemu_irq);
 
 #endif
-- 
2.41.0


