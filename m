Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ED97D2440
	for <lists+xen-devel@lfdr.de>; Sun, 22 Oct 2023 18:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620800.966687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qub3Q-0002Vc-94; Sun, 22 Oct 2023 16:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620800.966687; Sun, 22 Oct 2023 16:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qub3Q-0002Tc-6F; Sun, 22 Oct 2023 16:11:52 +0000
Received: by outflank-mailman (input) for mailman id 620800;
 Sun, 22 Oct 2023 16:11:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZR7=GE=casper.srs.infradead.org=BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1quam7-0006wY-2b
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 15:53:59 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36209b85-70f3-11ee-98d5-6d05b1d4d9a1;
 Sun, 22 Oct 2023 17:53:58 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1quakJ-008TGZ-OI; Sun, 22 Oct 2023 15:52:07 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakJ-001qa0-16; Sun, 22 Oct 2023 16:52:07 +0100
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
X-Inumbo-ID: 36209b85-70f3-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=rUpd9lT/62EWfZvMuWHRTq23AphmaFPcKQZSk/5bZnU=; b=vp/q7TUe6Zc6kDLwHXFkmkm/lQ
	7O62P5nNr0Z2egFDK/w3Rogh2x2lxfFIW54BCtvZGWnbDBqfc/g2VCUPW4sThB/iCMZc5d1FRgs91
	xYLmMAAxavSq96ILSh2FHPG2TwZ77iGYyo7CeCsRceNh2S3OMTM8ebRxuN38D0U4eLEgO2GYDlou2
	v9Hosc4I6XuumUkQTfDcsd3kxT5gZhI1ND/3STQUru/c36GVMaARdhyHvPtgVIsY6MIY6fndoc79v
	uyPQQVdQOQlPbikqi4UZWcqfYKrJ5qiTLAX/rtreT3DtJKxsvRNVdEUB9G3NGZ2I2DAgj8PNV2PWI
	QHDMz5Fw==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>,
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
Subject: [PATCH 26/45] hw/net/lan9118: use qemu_configure_nic_device()
Date: Sun, 22 Oct 2023 16:51:41 +0100
Message-Id: <20231022155200.436340-27-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Some callers instantiate the device unconditionally, others will do so only
if there is a NICInfo to go with it. This appears to be fairly random, but
preseve the existing behaviour for now.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/kzm.c             | 4 ++--
 hw/arm/mps2.c            | 2 +-
 hw/arm/realview.c        | 6 ++----
 hw/arm/vexpress.c        | 4 ++--
 hw/net/lan9118.c         | 5 ++---
 include/hw/net/lan9118.h | 2 +-
 6 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index b1b281c9ac..9f2d120f57 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -112,8 +112,8 @@ static void kzm_init(MachineState *machine)
         alias_offset += ram[i].size;
     }
 
-    if (nd_table[0].used) {
-        lan9118_init(&nd_table[0], KZM_LAN9118_ADDR,
+    if (qemu_find_nic_info("lan9118", true, NULL)) {
+        lan9118_init(KZM_LAN9118_ADDR,
                      qdev_get_gpio_in(DEVICE(&s->soc.avic), 52));
     }
 
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index d92fd60684..cb3da1ef5c 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -458,7 +458,7 @@ static void mps2_common_init(MachineState *machine)
     /* In hardware this is a LAN9220; the LAN9118 is software compatible
      * except that it doesn't support the checksum-offload feature.
      */
-    lan9118_init(&nd_table[0], mmc->ethernet_base,
+    lan9118_init(mmc->ethernet_base,
                  qdev_get_gpio_in(armv7m,
                                   mmc->fpga_type == FPGA_AN511 ? 47 : 13));
 
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 591f50581e..68f8aefac3 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -84,7 +84,6 @@ static void realview_init(MachineState *machine,
     SysBusDevice *busdev;
     qemu_irq pic[64];
     PCIBus *pci_bus = NULL;
-    NICInfo *nd;
     DriveInfo *dinfo;
     I2CBus *i2c;
     int n;
@@ -295,10 +294,9 @@ static void realview_init(MachineState *machine,
         }
     }
 
-    nd = qemu_find_nic_info(is_pb ? "lan9118" : "smc91c111", true, NULL);
-    if (nd) {
+    if (qemu_find_nic_info(is_pb ? "lan9118" : "smc91c111", true, NULL)) {
         if (is_pb) {
-            lan9118_init(nd, 0x4e000000, pic[28]);
+            lan9118_init(0x4e000000, pic[28]);
         } else {
             smc91c111_init(0x4e000000, pic[28]);
         }
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 8ff37f52ca..4a6cb3bdf5 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -686,8 +686,8 @@ static void vexpress_common_init(MachineState *machine)
     memory_region_add_subregion(sysmem, map[VE_VIDEORAM], &vms->vram);
 
     /* 0x4e000000 LAN9118 Ethernet */
-    if (nd_table[0].used) {
-        lan9118_init(&nd_table[0], map[VE_ETHERNET], pic[15]);
+    if (qemu_find_nic_info("lan9118", true, NULL)) {
+        lan9118_init(map[VE_ETHERNET], pic[15]);
     }
 
     /* VE_USB: not modelled */
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index e5c4af182d..42fe5efd8c 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1407,14 +1407,13 @@ static void lan9118_register_types(void)
 
 /* Legacy helper function.  Should go away when machine config files are
    implemented.  */
-void lan9118_init(NICInfo *nd, uint32_t base, qemu_irq irq)
+void lan9118_init(uint32_t base, qemu_irq irq)
 {
     DeviceState *dev;
     SysBusDevice *s;
 
-    qemu_check_nic_model(nd, "lan9118");
     dev = qdev_new(TYPE_LAN9118);
-    qdev_set_nic_properties(dev, nd);
+    qemu_configure_nic_device(dev, true, NULL);
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, base);
diff --git a/include/hw/net/lan9118.h b/include/hw/net/lan9118.h
index 3d0c67f339..4bf9da7a63 100644
--- a/include/hw/net/lan9118.h
+++ b/include/hw/net/lan9118.h
@@ -15,6 +15,6 @@
 
 #define TYPE_LAN9118 "lan9118"
 
-void lan9118_init(NICInfo *, uint32_t, qemu_irq);
+void lan9118_init(uint32_t, qemu_irq);
 
 #endif
-- 
2.40.1


