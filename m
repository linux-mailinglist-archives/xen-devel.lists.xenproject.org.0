Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6D98279C7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 21:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663954.1034003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwhN-000326-8W; Mon, 08 Jan 2024 20:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663954.1034003; Mon, 08 Jan 2024 20:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwhN-00030P-5g; Mon, 08 Jan 2024 20:58:17 +0000
Received: by outflank-mailman (input) for mailman id 663954;
 Mon, 08 Jan 2024 20:58:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNLN=IS=desiato.srs.infradead.org=BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwb0-0000R5-Bl
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:42 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b79074fd-ae67-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 21:51:38 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rMwYj-007wXL-2q; Mon, 08 Jan 2024 20:49:22 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYi-002NEJ-2l; Mon, 08 Jan 2024 20:49:20 +0000
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
X-Inumbo-ID: b79074fd-ae67-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=rSgtkPSzwnCHxRJZGHve2nBAqz1Yf5otlux10XTm0DE=; b=XUNhWfKg0/8oGgchc9BRQErx+S
	Ji3UyzRWU7NPjSFZRXdaCPXuq5PQ6AFNg+56fe8aw99Pxx8iDU0ET5Rav+aKqUsR2xFcUHfow245F
	Aa7JV42ypanOZ8kJ7JhfhAPMA5gQQU0BwxeF0tjx2qTjaKgqa/W5/v0dUgCWkTcCYIV8fgcUAQASG
	ioRWEkquMOfRIiwRNSmwYoSeKIBvKuhlJKvi0y9p0WAIxg5M0OA4nxjM2RaR4TFgmEXK7mPs9y2wW
	mhOYt+AgqjXpI3deNFFKMSeISUyQ35oyMjbOJnjsVlnko+LvjCykihLraUJNBb8+92QU2XzM/Te95
	1zXtrasg==;
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
Subject: [PATCH v3 06/46] hw/xen: use qemu_create_nic_bus_devices() to instantiate Xen NICs
Date: Mon,  8 Jan 2024 20:26:35 +0000
Message-ID: <20240108204909.564514-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

When instantiating XenBus itself, for each NIC which is configured with
either the model unspecified, or set to to "xen" or "xen-net-device",
create a corresponding xen-net-device for it.

Now we can revert the previous more hackish version which relied on the
platform code explicitly registering the NICs on its own XenBus, having
returned the BusState* from xen_bus_init() itself.

This also fixes the setup for Xen PV guests, which was previously broken
in various ways and never actually managed to peer with the netdev.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/pc.c                        | 13 ++-----------
 hw/i386/pc_piix.c                   |  2 +-
 hw/i386/pc_q35.c                    |  2 +-
 hw/xen/xen-bus.c                    |  6 ++++--
 hw/xen/xen_devconfig.c              | 25 -------------------------
 hw/xenpv/xen_machine_pv.c           |  9 ---------
 include/hw/i386/pc.h                |  4 +---
 include/hw/xen/xen-bus.h            |  2 +-
 include/hw/xen/xen-legacy-backend.h |  1 -
 9 files changed, 10 insertions(+), 54 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d80c536d88..3d5e29ce22 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1268,7 +1268,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         if (pcms->bus) {
             pci_create_simple(pcms->bus, -1, "xen-platform");
         }
-        pcms->xenbus = xen_bus_init();
+        xen_bus_init();
         xen_be_init();
     }
 #endif
@@ -1296,8 +1296,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
                     pcms->vmport != ON_OFF_AUTO_ON);
 }
 
-void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus,
-                 BusState *xen_bus)
+void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus)
 {
     MachineClass *mc = MACHINE_CLASS(pcmc);
     bool default_is_ne2k = g_str_equal(mc->default_nic, TYPE_ISA_NE2000);
@@ -1305,14 +1304,6 @@ void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus,
 
     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_NIC);
 
-    if (xen_bus) {
-        while (nc = qemu_find_nic_info("xen-net-device", true, NULL)) {
-            DeviceState *dev = qdev_new("xen-net-device");
-            qdev_set_nic_properties(dev, nd);
-            qdev_realize_and_unref(dev, xen_bus, &error_fatal);
-        }
-    }
-
     while ((nd = qemu_find_nic_info(TYPE_ISA_NE2000, default_is_ne2k, NULL))) {
         pc_init_ne2k_isa(isa_bus, nd);
     }
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 042c13cdbc..aaf2c2521f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -342,7 +342,7 @@ static void pc_init1(MachineState *machine,
     pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
                          0x4);
 
-    pc_nic_init(pcmc, isa_bus, pci_bus, pcms->xenbus);
+    pc_nic_init(pcmc, isa_bus, pci_bus);
 
     if (pcmc->pci_enabled) {
         pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index f43d5142b8..7ca3f465e0 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -340,7 +340,7 @@ static void pc_q35_init(MachineState *machine)
 
     /* the rest devices to which pci devfn is automatically assigned */
     pc_vga_init(isa_bus, host_bus);
-    pc_nic_init(pcmc, isa_bus, host_bus, pcms->xenbus);
+    pc_nic_init(pcmc, isa_bus, host_bus);
 
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 4973e7d9c9..fb82cc33e4 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -19,6 +19,7 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 #include "sysemu/sysemu.h"
+#include "net/net.h"
 #include "trace.h"
 
 static char *xen_device_get_backend_path(XenDevice *xendev)
@@ -1133,7 +1134,7 @@ static void xen_register_types(void)
 
 type_init(xen_register_types)
 
-BusState *xen_bus_init(void)
+void xen_bus_init(void)
 {
     DeviceState *dev = qdev_new(TYPE_XEN_BRIDGE);
     BusState *bus = qbus_new(TYPE_XEN_BUS, dev, NULL);
@@ -1141,5 +1142,6 @@ BusState *xen_bus_init(void)
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     qbus_set_bus_hotplug_handler(bus);
 
-    return bus;
+    qemu_create_nic_bus_devices(bus, TYPE_XEN_DEVICE, "xen-net-device",
+                                "xen", "xen-net-device");
 }
diff --git a/hw/xen/xen_devconfig.c b/hw/xen/xen_devconfig.c
index 3f77c675c6..2150869f60 100644
--- a/hw/xen/xen_devconfig.c
+++ b/hw/xen/xen_devconfig.c
@@ -46,31 +46,6 @@ static int xen_config_dev_all(char *fe, char *be)
 
 /* ------------------------------------------------------------- */
 
-int xen_config_dev_nic(NICInfo *nic)
-{
-    char fe[256], be[256];
-    char mac[20];
-    int vlan_id = -1;
-
-    net_hub_id_for_client(nic->netdev, &vlan_id);
-    snprintf(mac, sizeof(mac), "%02x:%02x:%02x:%02x:%02x:%02x",
-             nic->macaddr.a[0], nic->macaddr.a[1], nic->macaddr.a[2],
-             nic->macaddr.a[3], nic->macaddr.a[4], nic->macaddr.a[5]);
-    xen_pv_printf(NULL, 1, "config nic %d: mac=\"%s\"\n", vlan_id, mac);
-    xen_config_dev_dirs("vif", "qnic", vlan_id, fe, be, sizeof(fe));
-
-    /* frontend */
-    xenstore_write_int(fe, "handle",     vlan_id);
-    xenstore_write_str(fe, "mac",        mac);
-
-    /* backend */
-    xenstore_write_int(be, "handle",     vlan_id);
-    xenstore_write_str(be, "mac",        mac);
-
-    /* common stuff */
-    return xen_config_dev_all(fe, be);
-}
-
 int xen_config_dev_vfb(int vdev, const char *type)
 {
     char fe[256], be[256];
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 9f9f137f99..1130d1a147 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -32,8 +32,6 @@
 
 static void xen_init_pv(MachineState *machine)
 {
-    int i;
-
     setup_xen_backend_ops();
 
     /* Initialize backend core & drivers */
@@ -62,13 +60,6 @@ static void xen_init_pv(MachineState *machine)
         vga_interface_created = true;
     }
 
-    /* configure nics */
-    for (i = 0; i < nb_nics; i++) {
-        if (!nd_table[i].model || 0 != strcmp(nd_table[i].model, "xen"))
-            continue;
-        xen_config_dev_nic(nd_table + i);
-    }
-
     xen_bus_init();
 
     /* config cleanup hook */
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 916af29f7c..ec0e5efcb2 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -33,7 +33,6 @@ typedef struct PCMachineState {
 
     /* Pointers to devices and objects: */
     PCIBus *bus;
-    BusState *xenbus;
     I2CBus *smbus;
     PFlashCFI01 *flash[2];
     ISADevice *pcspk;
@@ -185,8 +184,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
 void pc_cmos_init(PCMachineState *pcms,
                   BusState *ide0, BusState *ide1,
                   ISADevice *s);
-void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus,
-                 BusState *xen_bus);
+void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus);
 
 void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs);
 
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 334ddd1ff6..38d40afa37 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -75,7 +75,7 @@ struct XenBusClass {
 OBJECT_DECLARE_TYPE(XenBus, XenBusClass,
                     XEN_BUS)
 
-BusState *xen_bus_init(void);
+void xen_bus_init(void);
 
 void xen_device_backend_set_state(XenDevice *xendev,
                                   enum xenbus_state state);
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index fc42146bc2..2cca174778 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -81,7 +81,6 @@ extern struct XenDevOps xen_usb_ops;          /* xen-usb.c         */
 
 /* configuration (aka xenbus setup) */
 void xen_config_cleanup(void);
-int xen_config_dev_nic(NICInfo *nic);
 int xen_config_dev_vfb(int vdev, const char *type);
 int xen_config_dev_vkbd(int vdev);
 int xen_config_dev_console(int vdev);
-- 
2.41.0


