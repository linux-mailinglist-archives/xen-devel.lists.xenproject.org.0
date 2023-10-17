Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADDC7CCA99
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 20:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618331.961864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsoli-0005mE-Fc; Tue, 17 Oct 2023 18:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618331.961864; Tue, 17 Oct 2023 18:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsoli-0005kW-Bm; Tue, 17 Oct 2023 18:26:14 +0000
Received: by outflank-mailman (input) for mailman id 618331;
 Tue, 17 Oct 2023 18:26:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qm1H=F7=casper.srs.infradead.org=BATV+e442e50539a6073fd887+7359+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qsolg-0005jg-QO
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 18:26:12 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a327ac44-6d1a-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 20:26:09 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qsolL-00DrCo-Or; Tue, 17 Oct 2023 18:25:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qsolI-000Pau-2K; Tue, 17 Oct 2023 19:25:48 +0100
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
X-Inumbo-ID: a327ac44-6d1a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=i6ZTV9wtaYV9iGMHjBK+i6c16uQy0HhkOiTbhO1beOA=; b=kgUcqSpB3ZA6qV433Y7zjLuzBw
	WPppw8Z1Zqodeu1n+SgUTO1nCXQZH7RJxqWGZOw0OLAVhBimarKfifrC34uoWrTXlo8lePfvJMqqO
	XlFT/qsz3HrkkrNS5HTi2kyFe+3cyhTkEVPK1KPMNwEssFHL9gOB3erBlaSavxk3wPso+PnrHcDYE
	NZDjIHF9pXhcfNVpF1nChNaK1D+6IVaw2lKMonuPIW7EdBOXJR6utSoD5mi/+JDcpJ+UUU6gRM9lQ
	lT1dkCkvWBJWbdTx15tFxmtYGaGVgoL3NVdKFQ+iWonFAlFHVcvMMwXemBGVjpY6pVkeVnoz14Z6U
	+T9h+UGA==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jason Wang <jasowang@redhat.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 4/4] hw/i386/pc: support '-nic' for xen-net-device
Date: Tue, 17 Oct 2023 19:25:45 +0100
Message-Id: <20231017182545.97973-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231017182545.97973-1-dwmw2@infradead.org>
References: <20231017182545.97973-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The default NIC creation seems a bit hackish to me. I don't understand
why each platform ha to call pci_nic_init_nofail() from a point in the
code where it actually has a pointer to the PCI bus, and then we have
the special cases for things like ne2k_isa.

If qmp_device_add() can *find* the appropriate bus and instantiate
the device on it, why can't we just do that from generic code for
creating the default NICs too?

But that isn't a yak I want to shave today. Add a xenbus field to the
PCMachineState so that it can make its way from pc_basic_device_init()
to pc_nic_init() and be handled as a special case like ne2k_isa is.

Now we can launch emulated Xen guests with '-nic user'.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/pc.c             | 11 ++++++++---
 hw/i386/pc_piix.c        |  2 +-
 hw/i386/pc_q35.c         |  2 +-
 hw/xen/xen-bus.c         |  4 +++-
 include/hw/i386/pc.h     |  4 +++-
 include/hw/xen/xen-bus.h |  2 +-
 6 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index bb3854d1d0..7413ca50c8 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1265,7 +1265,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         if (pcms->bus) {
             pci_create_simple(pcms->bus, -1, "xen-platform");
         }
-        xen_bus_init();
+        pcms->xenbus = xen_bus_init();
         xen_be_init();
     }
 #endif
@@ -1291,7 +1291,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
                     pcms->vmport != ON_OFF_AUTO_ON);
 }
 
-void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus)
+void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus,
+                 BusState *xen_bus)
 {
     MachineClass *mc = MACHINE_CLASS(pcmc);
     int i;
@@ -1301,7 +1302,11 @@ void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus)
         NICInfo *nd = &nd_table[i];
         const char *model = nd->model ? nd->model : mc->default_nic;
 
-        if (g_str_equal(model, "ne2k_isa")) {
+        if (xen_bus && (!nd->model || g_str_equal(model, "xen-net-device"))) {
+            DeviceState *dev = qdev_new("xen-net-device");
+            qdev_set_nic_properties(dev, nd);
+            qdev_realize_and_unref(dev, xen_bus, &error_fatal);
+        } else if (g_str_equal(model, "ne2k_isa")) {
             pc_init_ne2k_isa(isa_bus, nd);
         } else {
             pci_nic_init_nofail(nd, pci_bus, model, NULL);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index e36a3262b2..90b5ae7258 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -322,7 +322,7 @@ static void pc_init1(MachineState *machine,
     pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
                          0x4);
 
-    pc_nic_init(pcmc, isa_bus, pci_bus);
+    pc_nic_init(pcmc, isa_bus, pci_bus, pcms->xenbus);
 
     if (pcmc->pci_enabled) {
         PCIDevice *dev;
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a7386f2ca2..2ed0aab2a7 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -340,7 +340,7 @@ static void pc_q35_init(MachineState *machine)
 
     /* the rest devices to which pci devfn is automatically assigned */
     pc_vga_init(isa_bus, host_bus);
-    pc_nic_init(pcmc, isa_bus, host_bus);
+    pc_nic_init(pcmc, isa_bus, host_bus, pcms->xenbus);
 
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 0da2aa219a..d7823964f8 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -1127,11 +1127,13 @@ static void xen_register_types(void)
 
 type_init(xen_register_types)
 
-void xen_bus_init(void)
+BusState *xen_bus_init(void)
 {
     DeviceState *dev = qdev_new(TYPE_XEN_BRIDGE);
     BusState *bus = qbus_new(TYPE_XEN_BUS, dev, NULL);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     qbus_set_bus_hotplug_handler(bus);
+
+    return bus;
 }
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index bec38cb92c..feabf3d195 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -33,6 +33,7 @@ typedef struct PCMachineState {
 
     /* Pointers to devices and objects: */
     PCIBus *bus;
+    BusState *xenbus;
     I2CBus *smbus;
     PFlashCFI01 *flash[2];
     ISADevice *pcspk;
@@ -182,7 +183,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
 void pc_cmos_init(PCMachineState *pcms,
                   BusState *ide0, BusState *ide1,
                   ISADevice *s);
-void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus);
+void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus,
+                 BusState *xen_bus);
 
 void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs);
 
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index eb440880b5..acad871b80 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -75,7 +75,7 @@ struct XenBusClass {
 OBJECT_DECLARE_TYPE(XenBus, XenBusClass,
                     XEN_BUS)
 
-void xen_bus_init(void);
+BusState *xen_bus_init(void);
 
 void xen_device_backend_set_state(XenDevice *xendev,
                                   enum xenbus_state state);
-- 
2.40.1


