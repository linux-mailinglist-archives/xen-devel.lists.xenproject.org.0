Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 147EB7E2DA2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 21:07:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628374.979818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05sf-0001c0-Mp; Mon, 06 Nov 2023 20:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628374.979818; Mon, 06 Nov 2023 20:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05sf-0001Zw-IB; Mon, 06 Nov 2023 20:07:29 +0000
Received: by outflank-mailman (input) for mailman id 628374;
 Mon, 06 Nov 2023 20:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwd5=GT=desiato.srs.infradead.org=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hN-0001Ig-FK
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:49 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7797d83a-7cde-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:55:42 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fc-00AkG3-38; Mon, 06 Nov 2023 19:54:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fc-001GOj-0X; Mon, 06 Nov 2023 19:54:00 +0000
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
X-Inumbo-ID: 7797d83a-7cde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Jxij+S2rfNvx9smk2rq4E6p1vQ2IBZRLtKjjuNaESe0=; b=J6F/YyAH/jx1Xnu0nwmkVlLLZR
	pEswynx78j+BxXrSprmpbB98QVZpHz5coTHg+rJye7skkR4cRnVBzVqPYFPCDGeFeGzhnKaMLTU3I
	Na1KhproVJR0IY0PcJxyikz2ngGannldbG4kvqAY/Yvi8jUrenBSzQkHJ4yDz0BKxOkJeDBE7fZKD
	7+mL/Nwc4AkGo9+OD7G3ww/v9KhV6/qaNWLOGw443LVqSWsZIXgysaC7vx2n7x2p6SXSkQ1lau6d7
	1mQfWYIIRrGXl+afi28C//fzxyDmM63NpAifDYm5YjOFpOY2n5VvZP6W0LiAVPOZYnRQI+CT3dUFF
	YYYIYP6w==;
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
Subject: [PATCH for-8.3 v2 30/46] hw/arm: use qemu_configure_nic_device()
Date: Mon,  6 Nov 2023 19:49:35 +0000
Message-ID: <20231106195352.301038-31-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
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
index eae3639da2..6808143a07 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -499,14 +499,12 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
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
@@ -524,7 +522,6 @@ static MemoryRegion *make_eth_usb(MPS2TZMachineState *mms, void *opaque,
      * irqs[] is the ethernet IRQ.
      */
     SysBusDevice *s;
-    NICInfo *nd = &nd_table[0];
 
     memory_region_init(&mms->eth_usb_container, OBJECT(mms),
                        "mps2-tz-eth-usb-container", 0x200000);
@@ -533,9 +530,8 @@ static MemoryRegion *make_eth_usb(MPS2TZMachineState *mms, void *opaque,
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
index 9703bfb97f..a60139ce53 100644
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
index 4f74a64a0d..c9561995ae 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -249,18 +249,13 @@ static void versal_create_gems(Versal *s, qemu_irq *pic)
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
2.41.0


