Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4ED7E2E05
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 21:16:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628478.979997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r060v-0006Z8-93; Mon, 06 Nov 2023 20:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628478.979997; Mon, 06 Nov 2023 20:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r060v-0006X8-69; Mon, 06 Nov 2023 20:16:01 +0000
Received: by outflank-mailman (input) for mailman id 628478;
 Mon, 06 Nov 2023 20:16:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwd5=GT=desiato.srs.infradead.org=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hJ-0001Ig-EN
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:45 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7636bf0b-7cde-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:55:41 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fa-00AkFb-1y; Mon, 06 Nov 2023 19:53:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fZ-001GMo-1x; Mon, 06 Nov 2023 19:53:57 +0000
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
X-Inumbo-ID: 7636bf0b-7cde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=U9HaIssH58wcf3kdA9UwHwQ4m5fDVnktA3V3gnm0GPk=; b=STONSx2GTmWGB8ZjHot2dssO0q
	ZMbNmU2Aj1xfjeFjVptjUHGMDCNfmHEeHiXWrQOeGrnuu4lIAPs47AXJus1Mdu1b/yvv7nkzLbvVK
	ggOliQYM8trHhpghqfnshlFXUBurYa15bwTXwDV3BE3QNhUM1RRXjsaCYdWvCD577kfCxiuN2aO+f
	7v+SVNTdzneSbb6q+s9U7CQeQGjFztXIms64KzOd+TeG2LGgs++svtU2rYaqkr8euM4niKQ5dRvxP
	LQ5G8dnY53KfUZOUICk7e70f4dliDqjMJTJK4taT0nTYbxVOhd16CEO1gqhuq4IYh+zPQX7anYyVG
	WQAnuMWQ==;
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
Subject: [PATCH for-8.3 v2 04/46] hw/pci: add pci_init_nic_devices(), pci_init_nic_in_slot()
Date: Mon,  6 Nov 2023 19:49:09 +0000
Message-ID: <20231106195352.301038-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The loop over nd_table[] to add PCI NICs is repeated in quite a few
places. Add a helper function to do it.

Some platforms also try to instantiate a specific model in a specific
slot, to match the real hardware. Add pci_init_nic_in_slot() for that
purpose.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/pci/pci.c         | 45 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/pci/pci.h |  4 +++-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 885c04b6f5..5703266c0b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1925,6 +1925,51 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
     return pci_dev;
 }
 
+void pci_init_nic_devices(PCIBus *bus, const char *default_model)
+{
+    qemu_create_nic_bus_devices(&bus->qbus, TYPE_PCI_DEVICE, default_model,
+                                "virtio", "virtio-net-pci");
+}
+
+bool pci_init_nic_in_slot(PCIBus *rootbus, const char *model,
+                          const char *alias, const char *devaddr)
+{
+    NICInfo *nd = qemu_find_nic_info(model, true, alias);
+    int dom, busnr, devfn;
+    PCIDevice *pci_dev;
+    unsigned slot;
+    PCIBus *bus;
+
+    if (!nd) {
+        return false;
+    }
+
+    if (!devaddr || pci_parse_devaddr(devaddr, &dom, &busnr, &slot, NULL) < 0) {
+        error_report("Invalid PCI device address %s for device %s",
+                     devaddr, model);
+        exit(1);
+    }
+
+    if (dom != 0) {
+        error_report("No support for non-zero PCI domains");
+        exit(1);
+    }
+
+    devfn = PCI_DEVFN(slot, 0);
+
+    bus = pci_find_bus_nr(rootbus, busnr);
+    if (!bus) {
+        error_report("Invalid PCI device address %s for device %s",
+                     devaddr, model);
+        exit(1);
+    }
+
+    pci_dev = pci_new(devfn, model);
+    qdev_set_nic_properties(&pci_dev->qdev, nd);
+    pci_realize_and_unref(pci_dev, bus, &error_fatal);
+    return true;
+}
+
 PCIDevice *pci_vga_init(PCIBus *bus)
 {
     vga_interface_created = true;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index ea5aff118b..684d49bdcd 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -317,7 +317,9 @@ void pci_device_reset(PCIDevice *dev);
 PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
                                const char *default_model,
                                const char *default_devaddr);
-
+void pci_init_nic_devices(PCIBus *bus, const char *default_model);
+bool pci_init_nic_in_slot(PCIBus *rootbus, const char *default_model,
+                          const char *alias, const char *devaddr);
 PCIDevice *pci_vga_init(PCIBus *bus);
 
 static inline PCIBus *pci_get_bus(const PCIDevice *dev)
-- 
2.41.0


