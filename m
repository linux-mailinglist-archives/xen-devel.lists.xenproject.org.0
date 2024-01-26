Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEAE83E0AC
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 18:43:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672366.1046360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQEl-00080t-2n; Fri, 26 Jan 2024 17:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672366.1046360; Fri, 26 Jan 2024 17:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQEk-0007vi-Ui; Fri, 26 Jan 2024 17:43:30 +0000
Received: by outflank-mailman (input) for mailman id 672366;
 Fri, 26 Jan 2024 17:43:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPDA=JE=casper.srs.infradead.org=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ4s-0004Zo-PM
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:18 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd88dcc9-bc70-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 18:33:17 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ48-0000000EKUE-0fRh; Fri, 26 Jan 2024 17:32:33 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ47-00000001elS-1KpR;
 Fri, 26 Jan 2024 17:32:31 +0000
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
X-Inumbo-ID: fd88dcc9-bc70-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=aYJS/1ZmHvWqcX4ZFiiuaV9MoKjFfmvD/b97zwR6RTs=; b=D64f2o9ExjTpXRh6lNheHhod11
	XLpJhKTr1/lZ/clcWVHv+r0qH+hO9IuX+5OCKW5QJDKRgIlMeO3iBkxLep82231pjtiQUg/SOyZ+3
	kjhYLEKlDpIMgbFMrc8eYUxT4T8BGApCoyxV8aAB2/qvZUVpaASy7tZZMOxv7/BwJeSYZ/WieflzD
	/vCQ5+IuDJHnHL+ksoy+2BpeR5ZcOp5mCPGHs8j+26cZsHFYatY5+TeRVWxRD3Ho5bnXnogPiHuc8
	WSVGXMZp17QLskVWHPyiskERlqsA36ZvCQf/XY5SJw5rEWhvHK2BKKZ4JwepyYFw8DtXSoYj/1ob7
	vYN8tDSQ==;
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
Subject: [PATCH v4 05/47] hw/i386/pc: use qemu_get_nic_info() and pci_init_nic_devices()
Date: Fri, 26 Jan 2024 17:24:42 +0000
Message-ID: <20240126173228.394202-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Eliminate direct access to nd_table[] and nb_nics by processing the the
Xen and ISA NICs first and then calling pci_init_nic_devices() for the
rest.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/pc.c                | 31 +++++++++++++++++++------------
 include/hw/net/ne2000-isa.h |  2 --
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 803244e5cc..ebb0b1c667 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -654,15 +654,19 @@ static const int ne2000_io[NE2000_NB_MAX] = { 0x300, 0x320, 0x340, 0x360,
                                               0x280, 0x380 };
 static const int ne2000_irq[NE2000_NB_MAX] = { 9, 10, 11, 3, 4, 5 };
 
-static void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
+static gboolean pc_init_ne2k_isa(ISABus *bus, NICInfo *nd, Error **errp)
 {
     static int nb_ne2k = 0;
 
-    if (nb_ne2k == NE2000_NB_MAX)
-        return;
+    if (nb_ne2k == NE2000_NB_MAX) {
+        error_setg(errp,
+                   "maximum number of ISA NE2000 devices exceeded");
+        return false;
+    }
     isa_ne2000_init(bus, ne2000_io[nb_ne2k],
                     ne2000_irq[nb_ne2k], nd);
     nb_ne2k++;
+    return true;
 }
 
 void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
@@ -1297,23 +1301,26 @@ void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus,
                  BusState *xen_bus)
 {
     MachineClass *mc = MACHINE_CLASS(pcmc);
-    int i;
+    bool default_is_ne2k = g_str_equal(mc->default_nic, TYPE_ISA_NE2000);
+    NICInfo *nd;
 
     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_NIC);
-    for (i = 0; i < nb_nics; i++) {
-        NICInfo *nd = &nd_table[i];
-        const char *model = nd->model ? nd->model : mc->default_nic;
 
-        if (xen_bus && (!nd->model || g_str_equal(model, "xen-net-device"))) {
+    if (xen_bus) {
+        while ((nd = qemu_find_nic_info("xen-net-device", true, NULL))) {
             DeviceState *dev = qdev_new("xen-net-device");
             qdev_set_nic_properties(dev, nd);
             qdev_realize_and_unref(dev, xen_bus, &error_fatal);
-        } else if (g_str_equal(model, "ne2k_isa")) {
-            pc_init_ne2k_isa(isa_bus, nd);
-        } else {
-            pci_nic_init_nofail(nd, pci_bus, model, NULL);
         }
     }
+
+    while ((nd = qemu_find_nic_info(TYPE_ISA_NE2000, default_is_ne2k, NULL))) {
+        pc_init_ne2k_isa(isa_bus, nd, &error_fatal);
+    }
+
+    /* Anything remaining should be a PCI NIC */
+    pci_init_nic_devices(pci_bus, mc->default_nic);
+
     rom_reset_order_override();
 }
 
diff --git a/include/hw/net/ne2000-isa.h b/include/hw/net/ne2000-isa.h
index af59ee0b02..73bae10ad1 100644
--- a/include/hw/net/ne2000-isa.h
+++ b/include/hw/net/ne2000-isa.h
@@ -22,8 +22,6 @@ static inline ISADevice *isa_ne2000_init(ISABus *bus, int base, int irq,
 {
     ISADevice *d;
 
-    qemu_check_nic_model(nd, "ne2k_isa");
-
     d = isa_try_new(TYPE_ISA_NE2000);
     if (d) {
         DeviceState *dev = DEVICE(d);
-- 
2.43.0


