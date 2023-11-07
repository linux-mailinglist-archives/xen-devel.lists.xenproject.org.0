Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0E27E37A4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 10:22:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628629.980273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0IHq-0001ft-G2; Tue, 07 Nov 2023 09:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628629.980273; Tue, 07 Nov 2023 09:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0IHq-0001Y5-CJ; Tue, 07 Nov 2023 09:22:18 +0000
Received: by outflank-mailman (input) for mailman id 628629;
 Tue, 07 Nov 2023 09:22:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vjcX=GU=casper.srs.infradead.org=BATV+0fd401c0b30749933da3+7380+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r0IHp-0001Vh-5T
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 09:22:17 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23fb82cd-7d4f-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 10:22:15 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r0IHN-00BPkW-UH; Tue, 07 Nov 2023 09:21:50 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r0IHO-001hKg-0o; Tue, 07 Nov 2023 09:21:50 +0000
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
X-Inumbo-ID: 23fb82cd-7d4f-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=kWdbDjeYz0afnZnwtIhprW3R32uFeN2KMkLsabrtTH8=; b=Cw1GeOn4kpo8cW2cKosb3qe9MO
	dyfGbnQtiq55C/Sw5Cvina+fKES9cSV1XfsFJKhXJ8bfrclHP+3L26I7mgvzz36dYJllEEnQVMFsF
	HoV0m5bq0JsQl3wDWE5ikNkzgPrAOk2jazWS6AWFEzKvMquaosPtu882fXTRAIxIGqEUyNlJ36lK8
	73fT2RuvI8EN9w/U/J7MLWSnVhqkU01k8NGlVQJcCpkFdGpvaMLJAoJ3YqsH3oyip60Pp8NsU4Znu
	kxLCpOt+uhIAe47HC6/wZ/m+fAP8JC3j4vMJILoOf02sh1d0Nu5BWz4neZVPHvWNLeYVLXgUeQCiN
	hD6B72zA==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org
Subject: [PULL 13/15] hw/i386/pc: support '-nic' for xen-net-device
Date: Tue,  7 Nov 2023 09:21:45 +0000
Message-ID: <20231107092149.404842-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107092149.404842-1-dwmw2@infradead.org>
References: <20231107092149.404842-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The default NIC creation seems a bit hackish to me. I don't understand
why each platform has to call pci_nic_init_nofail() from a point in the
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
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/pc.c             | 11 ++++++++---
 hw/i386/pc_piix.c        |  2 +-
 hw/i386/pc_q35.c         |  2 +-
 hw/xen/xen-bus.c         |  4 +++-
 include/hw/i386/pc.h     |  4 +++-
 include/hw/xen/xen-bus.h |  2 +-
 6 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1aef21aa2c..188bc9d0f8 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1261,7 +1261,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         if (pcms->bus) {
             pci_create_simple(pcms->bus, -1, "xen-platform");
         }
-        xen_bus_init();
+        pcms->xenbus = xen_bus_init();
         xen_be_init();
     }
 #endif
@@ -1289,7 +1289,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
                     pcms->vmport != ON_OFF_AUTO_ON);
 }
 
-void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus)
+void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus,
+                 BusState *xen_bus)
 {
     MachineClass *mc = MACHINE_CLASS(pcmc);
     int i;
@@ -1299,7 +1300,11 @@ void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus)
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
index 26e161beb9..eace854335 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -342,7 +342,7 @@ static void pc_init1(MachineState *machine,
     pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
                          0x4);
 
-    pc_nic_init(pcmc, isa_bus, pci_bus);
+    pc_nic_init(pcmc, isa_bus, pci_bus, pcms->xenbus);
 
     if (pcmc->pci_enabled) {
         pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 597943ff1b..4f3e5412f6 100644
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
index cc6f1b362f..4973e7d9c9 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -1133,11 +1133,13 @@ static void xen_register_types(void)
 
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
index 29a9724524..a10ceeabbf 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -33,6 +33,7 @@ typedef struct PCMachineState {
 
     /* Pointers to devices and objects: */
     PCIBus *bus;
+    BusState *xenbus;
     I2CBus *smbus;
     PFlashCFI01 *flash[2];
     ISADevice *pcspk;
@@ -184,7 +185,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
 void pc_cmos_init(PCMachineState *pcms,
                   BusState *ide0, BusState *ide1,
                   ISADevice *s);
-void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus);
+void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus,
+                 BusState *xen_bus);
 
 void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs);
 
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 38d40afa37..334ddd1ff6 100644
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
2.41.0


