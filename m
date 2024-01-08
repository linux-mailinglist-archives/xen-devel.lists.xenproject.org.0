Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2AB827A12
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 22:14:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664078.1034219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwwp-00038e-C7; Mon, 08 Jan 2024 21:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664078.1034219; Mon, 08 Jan 2024 21:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwwp-000368-9O; Mon, 08 Jan 2024 21:14:15 +0000
Received: by outflank-mailman (input) for mailman id 664078;
 Mon, 08 Jan 2024 21:14:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNLN=IS=desiato.srs.infradead.org=BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwaj-0000R5-AD
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:25 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac861e9a-ae67-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 21:51:19 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rMwYm-007wY2-0K; Mon, 08 Jan 2024 20:49:24 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYl-002NH0-23; Mon, 08 Jan 2024 20:49:23 +0000
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
X-Inumbo-ID: ac861e9a-ae67-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=apktM3rQhqJT/gPdzzrEkhVTg4OW0ilv1ws3zHsGmXQ=; b=f5E8BtrWl0Oi9+DI39I39oIRpP
	rRDUHBUwPpvktpzzw9rTpGQNHL9MgQykQr5OwSCDg+RnjTMxky3qb/VBl2Few1nWUrwYqpreNWf8h
	BUPA/iYnHBul1TWdzNxl00o3hkG7FewYMX4O4NOJJVb0cECNwBfnrtZMr0SUBQNzQLg6jDhhcCKJ+
	UzMGARSFcO311sRBWcSYexrdPs6sr1ek4+TRJr5MYHmyGh6axYw++gap3DTQkmud5eVMqRaA9Jo/3
	AJOsNX0pT3DXRw1t3TIHE5QR+MCf20OVWT/3euGBbUPwEqChZ6IYdT+4EhO4QJqK9NYMWkMbozWCb
	usoYhQ1A==;
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
Subject: [PATCH v3 41/46] hw/sparc/sun4m: use qemu_find_nic_info()
Date: Mon,  8 Jan 2024 20:27:10 +0000
Message-ID: <20240108204909.564514-42-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Obtain the MAC address from the NIC configuration if there is one, or
generate one explicitly so that it can be placed in the PROM.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/sparc/sun4m.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 550af01690..e782c8ec7a 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -299,13 +299,15 @@ static void *iommu_init(hwaddr addr, uint32_t version, qemu_irq irq)
 
 static void *sparc32_dma_init(hwaddr dma_base,
                               hwaddr esp_base, qemu_irq espdma_irq,
-                              hwaddr le_base, qemu_irq ledma_irq, NICInfo *nd)
+                              hwaddr le_base, qemu_irq ledma_irq,
+                              MACAddr *mac)
 {
     DeviceState *dma;
     ESPDMADeviceState *espdma;
     LEDMADeviceState *ledma;
     SysBusESPState *esp;
     SysBusPCNetState *lance;
+    NICInfo *nd = qemu_find_nic_info("lance", true, NULL);
 
     dma = qdev_new(TYPE_SPARC32_DMA);
     espdma = SPARC32_ESPDMA_DEVICE(object_resolve_path_component(
@@ -320,7 +322,14 @@ static void *sparc32_dma_init(hwaddr dma_base,
 
     lance = SYSBUS_PCNET(object_resolve_path_component(
                          OBJECT(ledma), "lance"));
-    qdev_set_nic_properties(DEVICE(lance), nd);
+
+    if (nd) {
+        qdev_set_nic_properties(DEVICE(lance), nd);
+        memcpy(mac->a, nd->macaddr.a, sizeof(mac->a));
+    } else {
+        qemu_macaddr_default_if_unset(mac);
+        qdev_prop_set_macaddr(DEVICE(lance), "mac", mac->a);
+    }
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dma), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dma), 0, dma_base);
@@ -823,7 +832,7 @@ static void sun4m_hw_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
     HostMemoryBackend *ram_memdev = machine->memdev;
-    NICInfo *nd = &nd_table[0];
+    MACAddr hostid;
 
     if (machine->ram_size > hwdef->max_mem) {
         error_report("Too much memory for this machine: %" PRId64 ","
@@ -884,10 +893,9 @@ static void sun4m_hw_init(MachineState *machine)
                         hwdef->iommu_pad_base, hwdef->iommu_pad_len);
     }
 
-    qemu_check_nic_model(nd, TYPE_LANCE);
     sparc32_dma_init(hwdef->dma_base,
                      hwdef->esp_base, slavio_irq[18],
-                     hwdef->le_base, slavio_irq[16], nd);
+                     hwdef->le_base, slavio_irq[16], &hostid);
 
     if (graphic_depth != 8 && graphic_depth != 24) {
         error_report("Unsupported depth: %d", graphic_depth);
@@ -1039,7 +1047,7 @@ static void sun4m_hw_init(MachineState *machine)
                                     machine->initrd_filename,
                                     machine->ram_size, &initrd_size);
 
-    nvram_init(nvram, (uint8_t *)&nd->macaddr, machine->kernel_cmdline,
+    nvram_init(nvram, hostid.a, machine->kernel_cmdline,
                machine->boot_config.order, machine->ram_size, kernel_size,
                graphic_width, graphic_height, graphic_depth,
                hwdef->nvram_machine_id, "Sun4m");
-- 
2.41.0


