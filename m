Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7129F7E2DA3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 21:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628382.979828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05tA-0002Wt-1a; Mon, 06 Nov 2023 20:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628382.979828; Mon, 06 Nov 2023 20:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05t9-0002To-V3; Mon, 06 Nov 2023 20:07:59 +0000
Received: by outflank-mailman (input) for mailman id 628382;
 Mon, 06 Nov 2023 20:07:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHvK=GT=casper.srs.infradead.org=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hq-0001Ig-MZ
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:56:18 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b4b9d71-7cde-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:56:16 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fd-007tb0-50; Mon, 06 Nov 2023 19:54:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fd-001GPq-1J; Mon, 06 Nov 2023 19:54:01 +0000
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
X-Inumbo-ID: 8b4b9d71-7cde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=rm/pmqYI6mjjqqrOLmrc9x1lSoz+dJDC9gj42DRuQk0=; b=cu1GrDIiiNZSYoZ345aCg6DSo1
	5BMiXQroAAhwpbCaUDnLB8Q0LNaJRZnP9h4Skn+gKHvDif78f/8+MPLyfoivx+ee7LTUdTv/Oznen
	EjATyhIYuQKLJ/2kh6QnKX82u1VT2V6Hucs8vfcP5FVMnyGZZBKevhKIH/vw60+GjFuZIZrDAr9hu
	KVnLqlvzYHKCJdpaCa7gregdtGgPPRne6UTtmOza/4qCAVsVHdstYnTd5W3+JtOMBMpYdX8jONzWY
	aEO3ZNrFD6CM+ckLYrViJ5Ovh0fHLrTcS8q9s7SH3IdQ7qw4ZzIRABEmF00EaBpqNM+lee7i9OlsJ
	QtTJmxhw==;
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
Subject: [PATCH for-8.3 v2 44/46] hw/pci: remove pci_nic_init_nofail()
Date: Mon,  6 Nov 2023 19:49:49 +0000
Message-ID: <20231106195352.301038-45-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

This function is no longer used.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/pci/pci.c         | 72 --------------------------------------------
 include/hw/pci/pci.h |  3 --
 2 files changed, 75 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 5703266c0b..097609ca54 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1853,78 +1853,6 @@ const pci_class_desc *get_class_desc(int class)
     return desc;
 }
 
-/* Initialize a PCI NIC.  */
-PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
-                               const char *default_model,
-                               const char *default_devaddr)
-{
-    const char *devaddr = nd->devaddr ? nd->devaddr : default_devaddr;
-    GPtrArray *pci_nic_models;
-    PCIBus *bus;
-    PCIDevice *pci_dev;
-    DeviceState *dev;
-    int devfn;
-    int i;
-    int dom, busnr;
-    unsigned slot;
-
-    if (nd->model && !strcmp(nd->model, "virtio")) {
-        g_free(nd->model);
-        nd->model = g_strdup("virtio-net-pci");
-    }
-
-    pci_nic_models = qemu_get_nic_models(TYPE_PCI_DEVICE);
-
-    if (qemu_show_nic_models(nd->model, (const char **)pci_nic_models->pdata)) {
-        exit(0);
-    }
-
-    i = qemu_find_nic_model(nd, (const char **)pci_nic_models->pdata,
-                            default_model);
-    if (i < 0) {
-        exit(1);
-    }
-
-    if (!rootbus) {
-        error_report("No primary PCI bus");
-        exit(1);
-    }
-
-    assert(!rootbus->parent_dev);
-
-    if (!devaddr) {
-        devfn = -1;
-        busnr = 0;
-    } else {
-        if (pci_parse_devaddr(devaddr, &dom, &busnr, &slot, NULL) < 0) {
-            error_report("Invalid PCI device address %s for device %s",
-                         devaddr, nd->model);
-            exit(1);
-        }
-
-        if (dom != 0) {
-            error_report("No support for non-zero PCI domains");
-            exit(1);
-        }
-
-        devfn = PCI_DEVFN(slot, 0);
-    }
-
-    bus = pci_find_bus_nr(rootbus, busnr);
-    if (!bus) {
-        error_report("Invalid PCI device address %s for device %s",
-                     devaddr, nd->model);
-        exit(1);
-    }
-
-    pci_dev = pci_new(devfn, nd->model);
-    dev = &pci_dev->qdev;
-    qdev_set_nic_properties(dev, nd);
-    pci_realize_and_unref(pci_dev, bus, &error_fatal);
-    g_ptr_array_free(pci_nic_models, true);
-    return pci_dev;
-}
-
 void pci_init_nic_devices(PCIBus *bus, const char *default_model)
 {
     qemu_create_nic_bus_devices(&bus->qbus, TYPE_PCI_DEVICE, default_model,
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 684d49bdcd..420cfbb5f8 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -314,9 +314,6 @@ void pci_device_set_intx_routing_notifier(PCIDevice *dev,
                                           PCIINTxRoutingNotifier notifier);
 void pci_device_reset(PCIDevice *dev);
 
-PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
-                               const char *default_model,
-                               const char *default_devaddr);
 void pci_init_nic_devices(PCIBus *bus, const char *default_model);
 bool pci_init_nic_in_slot(PCIBus *rootbus, const char *default_model,
                           const char *alias, const char *devaddr);
-- 
2.41.0


