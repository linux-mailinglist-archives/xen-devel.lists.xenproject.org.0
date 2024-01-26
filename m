Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98D783E071
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 18:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672300.1046272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ9c-0000JI-GS; Fri, 26 Jan 2024 17:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672300.1046272; Fri, 26 Jan 2024 17:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ9c-0000GA-C1; Fri, 26 Jan 2024 17:38:12 +0000
Received: by outflank-mailman (input) for mailman id 672300;
 Fri, 26 Jan 2024 17:38:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46+y=JE=desiato.srs.infradead.org=BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ5F-0004Zo-H9
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:41 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09d5377a-bc71-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 18:33:37 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ4A-000000069Ur-1kMQ; Fri, 26 Jan 2024 17:32:35 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ49-00000001enD-2h7N;
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
X-Inumbo-ID: 09d5377a-bc71-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9AgdaOipdb6TGOSEWyyxp0UQ70Ve7tuTnzaE+SJ5a7E=; b=RlSA+UTC7q9ijwbfNI7o2GxGTF
	ocvo504Xgs4S2Tq0KHotB1jIDV5dmolR2QzaSmqS3e5rpERnX+ZMvN4EzOjcldhT6VgL4oGjne8cv
	Spzg/M2YUy89r04o6P2VaDUd1J2hjtG4kJAhaide9arKLAsN+fXCndAj2U8Ot/6jtbzOpkQWNFx7a
	55V4Ewas7pbb76OVI4/T3uf3AE7Q5IeDPOtiCP3C8JAcEY6mN/UfIZrzXpDoX3Idkk3eboixD368U
	+5Ywg/7bzEhjlmVFzQsgeDsWCsJfAt8EiBTcE9HDKmdToVy/Nn+0sv9dd0NijVU4mkDsJhJwwr8DF
	3pG2chQA==;
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
Subject: [PATCH v4 30/47] hw/arm: use qemu_configure_nic_device()
Date: Fri, 26 Jan 2024 17:25:07 +0000
Message-ID: <20240126173228.394202-31-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/mps2-tz.c     |  8 ++------
 hw/arm/msf2-soc.c    |  6 +-----
 hw/arm/musicpal.c    |  3 +--
 hw/arm/xilinx_zynq.c | 11 ++++-------
 hw/arm/xlnx-versal.c |  7 +------
 hw/arm/xlnx-zynqmp.c |  8 +-------
 6 files changed, 10 insertions(+), 33 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 5d8cdc1a4c..a2d18afd79 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -503,14 +503,12 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
                                   const PPCExtraData *extradata)
 {
     SysBusDevice *s;
-    NICInfo *nd = &nd_table[0];
 
     /* In hardware this is a LAN9220; the LAN9118 is software compatible
      * except that it doesn't support the checksum-offload feature.
      */
-    qemu_check_nic_model(nd, "lan9118");
     mms->lan9118 = qdev_new(TYPE_LAN9118);
-    qdev_set_nic_properties(mms->lan9118, nd);
+    qemu_configure_nic_device(mms->lan9118, true, NULL);
 
     s = SYS_BUS_DEVICE(mms->lan9118);
     sysbus_realize_and_unref(s, &error_fatal);
@@ -528,7 +526,6 @@ static MemoryRegion *make_eth_usb(MPS2TZMachineState *mms, void *opaque,
      * irqs[] is the ethernet IRQ.
      */
     SysBusDevice *s;
-    NICInfo *nd = &nd_table[0];
 
     memory_region_init(&mms->eth_usb_container, OBJECT(mms),
                        "mps2-tz-eth-usb-container", 0x200000);
@@ -537,9 +534,8 @@ static MemoryRegion *make_eth_usb(MPS2TZMachineState *mms, void *opaque,
      * In hardware this is a LAN9220; the LAN9118 is software compatible
      * except that it doesn't support the checksum-offload feature.
      */
-    qemu_check_nic_model(nd, "lan9118");
     mms->lan9118 = qdev_new(TYPE_LAN9118);
-    qdev_set_nic_properties(mms->lan9118, nd);
+    qemu_configure_nic_device(mms->lan9118, true, NULL);
 
     s = SYS_BUS_DEVICE(mms->lan9118);
     sysbus_realize_and_unref(s, &error_fatal);
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index b5fe9f364d..35bf1d64e1 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -197,12 +197,8 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         g_free(bus_name);
     }
 
-    /* FIXME use qdev NIC properties instead of nd_table[] */
-    if (nd_table[0].used) {
-        qemu_check_nic_model(&nd_table[0], TYPE_MSS_EMAC);
-        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
-    }
     dev = DEVICE(&s->emac);
+    qemu_configure_nic_device(dev, true, NULL);
     object_property_set_link(OBJECT(&s->emac), "ahb-bus",
                              OBJECT(get_system_memory()), &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->emac), errp)) {
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 3200c9f68a..8781e99d27 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1286,9 +1286,8 @@ static void musicpal_init(MachineState *machine)
     }
     sysbus_create_simple(TYPE_MV88W8618_FLASHCFG, MP_FLASHCFG_BASE, NULL);
 
-    qemu_check_nic_model(&nd_table[0], "mv88w8618");
     dev = qdev_new(TYPE_MV88W8618_ETH);
-    qdev_set_nic_properties(dev, &nd_table[0]);
+    qemu_configure_nic_device(dev, true, "mv88w8618");
     object_property_set_link(OBJECT(dev), "dma-memory",
                              OBJECT(get_system_memory()), &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index dbb9793aa1..73a6472b91 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -108,16 +108,13 @@ static void zynq_write_board_setup(ARMCPU *cpu,
 
 static struct arm_boot_info zynq_binfo = {};
 
-static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
+static void gem_init(uint32_t base, qemu_irq irq)
 {
     DeviceState *dev;
     SysBusDevice *s;
 
     dev = qdev_new(TYPE_CADENCE_GEM);
-    if (nd->used) {
-        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
-        qdev_set_nic_properties(dev, nd);
-    }
+    qemu_configure_nic_device(dev, true, NULL);
     object_property_set_int(OBJECT(dev), "phy-addr", 7, &error_abort);
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
@@ -279,8 +276,8 @@ static void zynq_init(MachineState *machine)
     sysbus_create_varargs("cadence_ttc", 0xF8002000,
             pic[69-IRQ_OFFSET], pic[70-IRQ_OFFSET], pic[71-IRQ_OFFSET], NULL);
 
-    gem_init(&nd_table[0], 0xE000B000, pic[54-IRQ_OFFSET]);
-    gem_init(&nd_table[1], 0xE000C000, pic[77-IRQ_OFFSET]);
+    gem_init(0xE000B000, pic[54 - IRQ_OFFSET]);
+    gem_init(0xE000C000, pic[77 - IRQ_OFFSET]);
 
     for (n = 0; n < 2; n++) {
         int hci_irq = n ? 79 : 56;
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 9600551c44..01965ddf99 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -254,18 +254,13 @@ static void versal_create_gems(Versal *s, qemu_irq *pic)
         static const int irqs[] = { VERSAL_GEM0_IRQ_0, VERSAL_GEM1_IRQ_0};
         static const uint64_t addrs[] = { MM_GEM0, MM_GEM1 };
         char *name = g_strdup_printf("gem%d", i);
-        NICInfo *nd = &nd_table[i];
         DeviceState *dev;
         MemoryRegion *mr;
 
         object_initialize_child(OBJECT(s), name, &s->lpd.iou.gem[i],
                                 TYPE_CADENCE_GEM);
         dev = DEVICE(&s->lpd.iou.gem[i]);
-        /* FIXME use qdev NIC properties instead of nd_table[] */
-        if (nd->used) {
-            qemu_check_nic_model(nd, "cadence_gem");
-            qdev_set_nic_properties(dev, nd);
-        }
+        qemu_configure_nic_device(dev, true, NULL);
         object_property_set_int(OBJECT(dev), "phy-addr", 23, &error_abort);
         object_property_set_int(OBJECT(dev), "num-priority-queues", 2,
                                 &error_abort);
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 5905a33015..4f1714e4a1 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -616,13 +616,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     }
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
-        NICInfo *nd = &nd_table[i];
-
-        /* FIXME use qdev NIC properties instead of nd_table[] */
-        if (nd->used) {
-            qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
-            qdev_set_nic_properties(DEVICE(&s->gem[i]), nd);
-        }
+        qemu_configure_nic_device(DEVICE(&s->gem[i]), true, NULL);
         object_property_set_int(OBJECT(&s->gem[i]), "revision", GEM_REVISION,
                                 &error_abort);
         object_property_set_int(OBJECT(&s->gem[i]), "phy-addr", 23,
-- 
2.43.0


