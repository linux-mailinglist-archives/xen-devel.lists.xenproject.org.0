Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB283E0A3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 18:42:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672353.1046335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQDx-0006MB-61; Fri, 26 Jan 2024 17:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672353.1046335; Fri, 26 Jan 2024 17:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQDx-0006KQ-2S; Fri, 26 Jan 2024 17:42:41 +0000
Received: by outflank-mailman (input) for mailman id 672353;
 Fri, 26 Jan 2024 17:42:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46+y=JE=desiato.srs.infradead.org=BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ5K-0004m7-TS
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:46 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07d62993-bc71-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 18:33:34 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ4A-000000069Uo-1wNQ; Fri, 26 Jan 2024 17:32:35 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ49-00000001emu-1BWn;
 Fri, 26 Jan 2024 17:32:33 +0000
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
X-Inumbo-ID: 07d62993-bc71-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=XxeZylvTDcaTa4u01FHqxu7ZZ2gT6dnZZU6JU8VOb4A=; b=jl+BB+Hf/RPEXoObcS5J1tHM7N
	KA5dLm2rkV0PD+4PcWbFue9D0OsBIxsTlMB4PA7J02YJNwuJlMaw6pHOsM+CVrRIG8Xqx2Df4AuMt
	H9soHKIaV/NUpJdrDvsBquAyZQ4Z8hIgI3oKwRG7puLS9LgfS9SHkXmFIv7cdAnY4NbxlqR7piaz5
	6Y2EIWO/akbzRSBXFX49VJcv5V4eA4xK5f85LLf2yQfMYIc8g/fpl5hvcCwIkZ+/+28ujB/hAjiIs
	Koz4p39k4rrcla0Lg777d/+5nxhGcqIT5xK7CNgkvzwXxNpf5H9GaQwg18tFi7Lw7rDhhC+DV0ljV
	UTGVcioQ==;
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
	xen-devel@lists.xenproject.org,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v4 26/47] hw/net/lan9118: use qemu_configure_nic_device()
Date: Fri, 26 Jan 2024 17:25:03 +0000
Message-ID: <20240126173228.394202-27-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

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
index 9be91ebeaa..2ccd6f8a76 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -113,8 +113,8 @@ static void kzm_init(MachineState *machine)
         alias_offset += ram[i].size;
     }
 
-    if (nd_table[0].used) {
-        lan9118_init(&nd_table[0], KZM_LAN9118_ADDR,
+    if (qemu_find_nic_info("lan9118", true, NULL)) {
+        lan9118_init(KZM_LAN9118_ADDR,
                      qdev_get_gpio_in(DEVICE(&s->soc.avic), 52));
     }
 
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index bd873cc5de..50919ee46d 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -456,7 +456,7 @@ static void mps2_common_init(MachineState *machine)
     /* In hardware this is a LAN9220; the LAN9118 is software compatible
      * except that it doesn't support the checksum-offload feature.
      */
-    lan9118_init(&nd_table[0], mmc->ethernet_base,
+    lan9118_init(mmc->ethernet_base,
                  qdev_get_gpio_in(armv7m,
                                   mmc->fpga_type == FPGA_AN511 ? 47 : 13));
 
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 6e7529d98f..1f88da3702 100644
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
index fd981f4c33..1e02e0965f 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -679,8 +679,8 @@ static void vexpress_common_init(MachineState *machine)
     memory_region_add_subregion(sysmem, map[VE_VIDEORAM], &vms->vram);
 
     /* 0x4e000000 LAN9118 Ethernet */
-    if (nd_table[0].used) {
-        lan9118_init(&nd_table[0], map[VE_ETHERNET], pic[15]);
+    if (qemu_find_nic_info("lan9118", true, NULL)) {
+        lan9118_init(map[VE_ETHERNET], pic[15]);
     }
 
     /* VE_USB: not modelled */
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 598dd79e17..47ff25b441 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1408,14 +1408,13 @@ static void lan9118_register_types(void)
 
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
2.43.0


