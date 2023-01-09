Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C428663392
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 22:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474053.734952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF07o-0008Ks-9G; Mon, 09 Jan 2023 21:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474053.734952; Mon, 09 Jan 2023 21:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF07o-0008IJ-5a; Mon, 09 Jan 2023 21:56:12 +0000
Received: by outflank-mailman (input) for mailman id 474053;
 Mon, 09 Jan 2023 21:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=szyx=5G=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pF07l-0008ID-UZ
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 21:56:10 +0000
Received: from sonic312-24.consmr.mail.gq1.yahoo.com
 (sonic312-24.consmr.mail.gq1.yahoo.com [98.137.69.205])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69b3da00-9068-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 22:56:06 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Mon, 9 Jan 2023 21:56:03 +0000
Received: by hermes--production-ne1-7b69748c4d-drrwg (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3063e915763b79494c5a1a49c3c8038d; 
 Mon, 09 Jan 2023 21:55:58 +0000 (UTC)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 69b3da00-9068-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673301363; bh=XmjEY3smFSBeH1GvhJfSTsSYJbxF46CwAKG5dAKcmRI=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=XQ4jxMvUKo2m81vt7fXP25qsUhR1PI6kigX4sFvJZ89oiNMiM0L1oeUygYTBH2w/MnnXB6LLsgprZ1eETJsBJUZU7unMRYVFvuQgiqKSfGq6k0lfkLJA/XuPjLw/OVCPMwELYfwhfWvqJhRygAW2g21Onrw4Kdjo0yOI5Hc0dr5X0Y+qMuutFrGDVLUOFIjiOfwXvLISDGUrKqH4QWciOB9bpYFw1UsQiax8pWoKDgTEM7SqdJH8jMcOdo62agw/QY2eYzmMTZLv8wfSxF7izdB90v6dCbENHe5FqRFKmjMyMZK+wFUodJE1LWuv3CBfY3fD0Bnn/qlBrqb3PPtrbQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673301363; bh=lcJGVb/afW/9QWvR+7d3BL+WwFDW/zQtJ9DNlrryTAD=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=QOgQo3tegk8jmBv3Ng7w79LJ/aNZzX5ERi9ymMQFCrWbayQ8uUhDFy0obt6l2lWh2qOHi1fd0LHR93v7XeI9OREnDWnXEVMs2yUZJk5NYDwKtqMRsBjK+TRmMq5lLv0YjnlPIN+FuBaa/P8esnQ3iFqaJ6kEmLPH/ebhYypsHFaL7EhDWTj2YdS6910kIBJo1yUbfe7V3bRH1GAszdULZEUUNHZ2kM8CcksfbHeK0b2CRgIK/aWdevby31waCzAPrfnCwxt6HHtKovcC4b162AwrEyWXRaXdRAIYomU5Wu2aLZ5dFxZ7nPjOKAi2c5y0/SlzRy2xCD8cDmj766CObg==
X-YMail-OSG: jD7hKu8VM1l0oOLuaqgRaeb30aQv6Qp.ODCmKP8f6Q9mBSVWzcsfDNYVsykA2ho
 behgY_jMFk_aXME9xrjnRS_UbMzJzOjYrDdoHuBBzXjRybX5ZJpAKTcm5mQC_sDQTYgOe.ec_iAM
 Myn.yvyAZfixP0ZhyiSdQHFTK4O7S1mYEbP_EnvNTk1wCOGbXUWhRrwUwfT7ysui.KhNPs4WfHNE
 ss69qDq30QYPN.igM4i96y25hYBsFq9PPfxFB7Lj07UuZt7Y9dzwZo14h77gQ6KOw4p0GuHrcNIp
 OL_JGjZOopff5u5r__uhwXfmZVS9mH5QdZf4HePHJbfgydDeo8DCbqlxl9FSCeMBB.8ly6bOnY1L
 fNW9Mq5UyvPhekEHUZa.cr1Plr6__p3mLtRSkefaiL8NldguAqJxo7J.2GWQjFItbcRwNuekenlP
 uqfUoZ_WITspASb_vkBokN3PhGG7UwY.4InnuWo3wNlez3CtngNLdJy0n59mgEb9ODF3tv96dXAx
 2Z3OEyVG7Rx4F0ceHoO9l4h_GVKrkX326EfaLiYvWeqAxw27WRowzgPWhcJjnk90pQSacKJnQhgV
 YUUDyV13LFZmhT56JVJ5ZsS8hOh0b3O1lFxsrUcP17XrLk1cd3ExodjeHQy9KqmVQUftBIGeXOhC
 wi8zEb.Og9kAVPf88sGf0uCFmn8egoa4F03lP4p0bBLeIUWPc19V9Nxoq0ubKb77g0ZDNbGM6WgP
 TzOou3wKPVh6EVSQFmExoBO.KvctLL5GwwwUtb1U4joolbv2p.AIeleTYmoetMIF7vWRhnsnffXj
 PnxAYJSGenBv17Y6fL9GsxI6VEQDYEUwgkCB_IZnFQIVz4j2eAfjV46LMX7kfAqPTvMQ0fjRet1L
 .4PDQda5tboB8o1lJN29wjT7m_LI_.y5MY33uUWbqS87og.ChzviNmVN8R3MQwYtFecpX0PhyvnP
 4kOnn5qRgEaC0aL9wSR6G6X44ucjrtWUXvsjLxRib91kWnnvxP3qajCnnUMbCgG51Q1ZByeE6zpW
 YdJO.EFMvbsk_P1uCPdJY2ruXmtNf6NhfiSQBXd9Rc.sCZXJz38sR0_Yj2IXUuIVWGVTo.KyIbwa
 aKctdmpnN0MLzBy4SxVkXP9RmSAXpKDQDDqkSI3_FmU_2jYvrSlEORoJUta44jh_CmzLGD9D9RpE
 GtYlfbu73Wvr_OR3UqtG97pTwxWzct9qsFmGqcTrnJ1jSVqCHvFXpZMYfQ10Fs5UzBalA5qi01zC
 u7DJo2ajgyrXRVAHpMatMXzxXVTSOJaI2o6b_5NADyxHasar5U8EfUQxOA2T9mm9jwwnei9kaPuH
 X19Poc7zTetiMVRLtEgBfMYJfOyq2CTMpOpaWRD6Uh6ZgWi8l9NysycpuGVsH.ecj2KqwtZ5oJFW
 KcnTKZUoL8epoDkWNWXNQxAgUcJPHwtDzoogyzwTqpEf1SQBQ0QRH4Ec7XacoBtCYNXfFCs28x_o
 eBVi9bI0v8e8u6TtjoN9gumUJ5RBlvxoMd90_CdiQ3Kki5XA1yDZKNPEDogWz1n2rqbppweaOIjx
 LibIevRK3I86zHkKsWZc4I5XDQCOpNm7oiPn2kuvDstRyZM.TVLVC3FbZEO.oV2z7pMdLeVVj_uq
 ncCUF1idA.F1GO3HcwrmBWdPzlNjxIt_Iy.jlgrNBCMLadpHitdH7vEK2LptFnVlmLIvug1EYBO.
 sDyWyOOPhrH_N07SPb2UnXVnT4YHflcctzylOwYjtZoiDaSX1fuhiUwt1OFopV2la7OTn0cOPBKS
 qF8mpGMgHwAHLd.4Z5U.QsTaSvLwTn.o3twGe0jZ4PqP1bAXGFNn4rIZMoRfcUZbwUxlNRhtfvLP
 wkmzXtBeNTcgzlwsJTBOXU9cSb3ufinbkNSBzifJsp49v4jCV4cPTchJtB1xbu5S3ikvCpvNILpI
 MX_XcDsT7s.YlEqNQYFtA6vILJifBpdjyErNLDcVyru7a9CvXniTmoJebP.gF8al7iHYJiSVUAG2
 Vrz_zgbHeYkJvq6Wa1hERRnpXFjSXOOC36mIep93Mpy4QDHLRagXhPJURx7znW._g989jDQjb0oO
 Nq7_Fza3JFyu2L2y75ql9ZE8IlrcIoF0da8gd8KrS_b7jWGHQ7K0LWi9GnomoOcMs1b26_Q_Ir1n
 FOHmWVywIISIOGTISU2ulzbCuvDunxL6flF5FMPvYLqr0hs4RFfQEJPaahPD1GXbDmudEP2YvCR9
 Yhgn1kyE-
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v7] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Date: Mon,  9 Jan 2023 16:55:42 -0500
Message-Id: <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz.ref@aol.com>

Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
as noted in docs/igd-assign.txt in the Qemu source code.

Currently, when the xl toolstack is used to configure a Xen HVM guest with
Intel IGD passthrough to the guest with the Qemu upstream device model,
a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
a different slot. This problem often prevents the guest from booting.

The only available workaround is not good: Configure Xen HVM guests to use
the old and no longer maintained Qemu traditional device model available
from xenbits.xen.org which does reserve slot 2 for the Intel IGD.

To implement this feature in the Qemu upstream device model for Xen HVM
guests, introduce the following new functions, types, and macros:

* XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
* XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
* typedef XenPTQdevRealize function pointer
* XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
* xen_igd_reserve_slot and xen_igd_clear_slot functions

The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
the xl toolstack with the gfx_passthru option enabled, which sets the
igd-passthru=on option to Qemu for the Xen HVM machine type.

The new xen_igd_reserve_slot function also needs to be implemented in
hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
in which case it does nothing.

The new xen_igd_clear_slot function overrides qdev->realize of the parent
PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
created in hw/i386/pc_piix.c for the case when igd-passthru=on.

Move the call to xen_host_pci_device_get, and the associated error
handling, from xen_pt_realize to the new xen_igd_clear_slot function to
initialize the device class and vendor values which enables the checks for
the Intel IGD to succeed. The verification that the host device is an
Intel IGD to be passed through is done by checking the domain, bus, slot,
and function values as well as by checking that gfx_passthru is enabled,
the device class is VGA, and the device vendor in Intel.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Notes that might be helpful to reviewers of patched code in hw/xen:

The new functions and types are based on recommendations from Qemu docs:
https://qemu.readthedocs.io/en/latest/devel/qom.html

Notes that might be helpful to reviewers of patched code in hw/i386:

The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
not affect builds that do not have CONFIG_XEN defined.

xen_igd_gfx_pt_enabled() in the patched hw/i386/pc_piix.c file is an
existing function that is only true when Qemu is built with
xen-pci-passthrough enabled and the administrator has configured the Xen
HVM guest with Qemu's igd-passthru=on option.

v2: Remove From: <email address> tag at top of commit message

v3: Changed the test for the Intel IGD in xen_igd_clear_slot:

    if (is_igd_vga_passthrough(&s->real_device) &&
        (s->real_device.vendor_id == PCI_VENDOR_ID_INTEL)) {

    is changed to

    if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
        && (s->hostaddr.function == 0)) {

    I hoped that I could use the test in v2, since it matches the
    other tests for the Intel IGD in Qemu and Xen, but those tests
    do not work because the necessary data structures are not set with
    their values yet. So instead use the test that the administrator
    has enabled gfx_passthru and the device address on the host is
    02.0. This test does detect the Intel IGD correctly.

v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
    email address to match the address used by the same author in commits
    be9c61da and c0e86b76
    
    Change variable for XEN_PT_DEVICE_CLASS: xptc changed to xpdc

v5: The patch of xen_pt.c was re-worked to allow a more consistent test
    for the Intel IGD that uses the same criteria as in other places.
    This involved moving the call to xen_host_pci_device_get from
    xen_pt_realize to xen_igd_clear_slot and updating the checks for the
    Intel IGD in xen_igd_clear_slot:
    
    if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
        && (s->hostaddr.function == 0)) {

    is changed to

    if (is_igd_vga_passthrough(&s->real_device) &&
        s->real_device.domain == 0 && s->real_device.bus == 0 &&
        s->real_device.dev == 2 && s->real_device.func == 0 &&
        s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {

    Added an explanation for the move of xen_host_pci_device_get from
    xen_pt_realize to xen_igd_clear_slot to the commit message.

    Rebase.

v6: Fix logging by removing these lines from the move from xen_pt_realize
    to xen_igd_clear_slot that was done in v5:

    XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
               " to devfn 0x%x\n",
               s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
               s->dev.devfn);

    This log needs to be in xen_pt_realize because s->dev.devfn is not
    set yet in xen_igd_clear_slot.

v7: Inhibit out of context log message and needless processing by
    adding 2 lines at the top of the new xen_igd_clear_slot function:

    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
        return;

    Rebase. This removed an unnecessary header file from xen_pt.h 

 hw/i386/pc_piix.c    | 127 ++++++++++++++++++++++++++++++++-----------
 hw/xen/xen_pt.c      |  49 ++++++++++++++---
 hw/xen/xen_pt.h      |  16 ++++++
 hw/xen/xen_pt_stub.c |   4 ++
 4 files changed, 154 insertions(+), 42 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b48047f50c..34a9736b5e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -32,6 +32,7 @@
 #include "hw/i386/pc.h"
 #include "hw/i386/apic.h"
 #include "hw/pci-host/i440fx.h"
+#include "hw/rtc/mc146818rtc.h"
 #include "hw/southbridge/piix.h"
 #include "hw/display/ramfb.h"
 #include "hw/firmware/smbios.h"
@@ -40,16 +41,16 @@
 #include "hw/usb.h"
 #include "net/net.h"
 #include "hw/ide/pci.h"
-#include "hw/ide/piix.h"
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
 #include "hw/sysbus.h"
+#include "hw/i2c/i2c.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/xen/xen-x86.h"
+#include "hw/xen/xen.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
-#include "hw/acpi/piix4.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/xen.h"
@@ -66,6 +67,7 @@
 #include "kvm/kvm-cpu.h"
 
 #define MAX_IDE_BUS 2
+#define XEN_IOAPIC_NUM_PIRQS 128ULL
 
 #ifdef CONFIG_IDE_ISA
 static const int ide_iobase[MAX_IDE_BUS] = { 0x1f0, 0x170 };
@@ -73,6 +75,32 @@ static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
 static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
 #endif
 
+/*
+ * Return the global irq number corresponding to a given device irq
+ * pin. We could also use the bus number to have a more precise mapping.
+ */
+static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
+{
+    int slot_addend;
+    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
+    return (pci_intx + slot_addend) & 3;
+}
+
+static void piix_intx_routing_notifier_xen(PCIDevice *dev)
+{
+    int i;
+
+    /* Scan for updates to PCI link routes (0x60-0x63). */
+    for (i = 0; i < PIIX_NUM_PIRQS; i++) {
+        uint8_t v = dev->config_read(dev, PIIX_PIRQCA + i, 1);
+        if (v & 0x80) {
+            v = 0;
+        }
+        v &= 0xf;
+        xen_set_pci_link_route(i, v);
+    }
+}
+
 /* PC hardware initialisation */
 static void pc_init1(MachineState *machine,
                      const char *host_type, const char *pci_type)
@@ -84,7 +112,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *system_io = get_system_io();
     PCIBus *pci_bus;
     ISABus *isa_bus;
-    int piix3_devfn = -1;
+    Object *piix4_pm;
     qemu_irq smi_irq;
     GSIState *gsi_state;
     BusState *idebus[MAX_IDE_BUS];
@@ -205,10 +233,9 @@ static void pc_init1(MachineState *machine,
     gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
 
     if (pcmc->pci_enabled) {
-        PIIX3State *piix3;
+        DeviceState *dev;
         PCIDevice *pci_dev;
-        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
-                                         : TYPE_PIIX3_DEVICE;
+        int i;
 
         pci_bus = i440fx_init(pci_type,
                               i440fx_host,
@@ -216,21 +243,65 @@ static void pc_init1(MachineState *machine,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
                               pci_memory, ram_memory);
+        pci_bus_map_irqs(pci_bus,
+                         xen_enabled() ? xen_pci_slot_get_pirq
+                                       : pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
-        piix3 = PIIX3_PCI_DEVICE(pci_dev);
-        piix3->pic = x86ms->gsi;
-        piix3_devfn = piix3->dev.devfn;
-        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
+        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
+        object_property_set_bool(OBJECT(pci_dev), "has-usb",
+                                 machine_usb(machine), &error_abort);
+        object_property_set_bool(OBJECT(pci_dev), "has-acpi",
+                                 x86_machine_is_acpi_enabled(x86ms),
+                                 &error_abort);
+        qdev_prop_set_uint32(DEVICE(pci_dev), "smb_io_base", 0xb100);
+        object_property_set_bool(OBJECT(pci_dev), "smm-enabled",
+                                 x86_machine_is_smm_enabled(x86ms),
+                                 &error_abort);
+        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
+
+        if (xen_enabled()) {
+            pci_device_set_intx_routing_notifier(
+                        pci_dev, piix_intx_routing_notifier_xen);
+
+            /*
+             * Xen supports additional interrupt routes from the PCI devices to
+             * the IOAPIC: the four pins of each PCI device on the bus are also
+             * connected to the IOAPIC directly.
+             * These additional routes can be discovered through ACPI.
+             */
+            pci_bus_irqs(pci_bus, xen_intx_set_irq, pci_dev,
+                         XEN_IOAPIC_NUM_PIRQS);
+        }
+
+        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pic"));
+        for (i = 0; i < ISA_NUM_IRQS; i++) {
+            qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
+        }
+        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(pci_dev), "isa.0"));
+        rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
+                                                             "rtc"));
+        piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
+        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
+        pci_ide_create_devs(PCI_DEVICE(dev));
+        idebus[0] = qdev_get_child_bus(dev, "ide.0");
+        idebus[1] = qdev_get_child_bus(dev, "ide.1");
     } else {
         pci_bus = NULL;
+        piix4_pm = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
+        isa_bus_irqs(isa_bus, x86ms->gsi);
+
+        rtc_state = isa_new(TYPE_MC146818_RTC);
+        qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
+        isa_realize_and_unref(rtc_state, isa_bus, &error_fatal);
+
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
+        idebus[0] = NULL;
+        idebus[1] = NULL;
     }
-    isa_bus_irqs(isa_bus, x86ms->gsi);
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
         pc_i8259_create(isa_bus, gsi_state->i8259_irq);
@@ -252,18 +323,12 @@ static void pc_init1(MachineState *machine,
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
                          0x4);
 
     pc_nic_init(pcmc, isa_bus, pci_bus);
 
     if (pcmc->pci_enabled) {
-        PCIDevice *dev;
-
-        dev = pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PIIX3_IDE);
-        pci_ide_create_devs(dev);
-        idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
-        idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
         pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
     }
 #ifdef CONFIG_IDE_ISA
@@ -289,21 +354,9 @@ static void pc_init1(MachineState *machine,
     }
 #endif
 
-    if (pcmc->pci_enabled && machine_usb(machine)) {
-        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
-    }
-
-    if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
-        PCIDevice *piix4_pm;
-
+    if (piix4_pm) {
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
-        piix4_pm = pci_new(piix3_devfn + 3, TYPE_PIIX4_PM);
-        qdev_prop_set_uint32(DEVICE(piix4_pm), "smb_io_base", 0xb100);
-        qdev_prop_set_bit(DEVICE(piix4_pm), "smm-enabled",
-                          x86_machine_is_smm_enabled(x86ms));
-        pci_realize_and_unref(piix4_pm, pci_bus, &error_fatal);
 
-        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
@@ -315,7 +368,7 @@ static void pc_init1(MachineState *machine,
                                  object_property_allow_set_link,
                                  OBJ_PROP_LINK_STRONG);
         object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
-                                 OBJECT(piix4_pm), &error_abort);
+                                 piix4_pm, &error_abort);
     }
 
     if (machine->nvdimms_state->is_enabled) {
@@ -405,6 +458,9 @@ static void pc_xen_hvm_init(MachineState *machine)
     }
 
     pc_xen_hvm_init_pci(machine);
+    if (xen_igd_gfx_pt_enabled()) {
+        xen_igd_reserve_slot(pcms->bus);
+    }
     pci_create_simple(pcms->bus, -1, "xen-platform");
 }
 #endif
@@ -441,6 +497,11 @@ static void pc_i440fx_8_0_machine_options(MachineClass *m)
     pc_i440fx_machine_options(m);
     m->alias = "pc";
     m->is_default = true;
+#ifdef CONFIG_MICROVM_DEFAULT
+    m->is_default = false;
+#else
+    m->is_default = true;
+#endif
 }
 
 DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 0ec7e52183..eff38155ef 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -780,15 +780,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
                s->dev.devfn);
 
-    xen_host_pci_device_get(&s->real_device,
-                            s->hostaddr.domain, s->hostaddr.bus,
-                            s->hostaddr.slot, s->hostaddr.function,
-                            errp);
-    if (*errp) {
-        error_append_hint(errp, "Failed to \"open\" the real pci device");
-        return;
-    }
-
     s->is_virtfn = s->real_device.is_virtfn;
     if (s->is_virtfn) {
         XEN_PT_LOG(d, "%04x:%02x:%02x.%d is a SR-IOV Virtual Function\n",
@@ -950,11 +941,50 @@ static void xen_pci_passthrough_instance_init(Object *obj)
     PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
 }
 
+void xen_igd_reserve_slot(PCIBus *pci_bus)
+{
+    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
+    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
+}
+
+static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
+{
+    ERRP_GUARD();
+    PCIDevice *pci_dev = (PCIDevice *)qdev;
+    XenPCIPassthroughState *s = XEN_PT_DEVICE(pci_dev);
+    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_GET_CLASS(s);
+    PCIBus *pci_bus = pci_get_bus(pci_dev);
+
+    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
+        return;
+
+    xen_host_pci_device_get(&s->real_device,
+                            s->hostaddr.domain, s->hostaddr.bus,
+                            s->hostaddr.slot, s->hostaddr.function,
+                            errp);
+    if (*errp) {
+        error_append_hint(errp, "Failed to \"open\" the real pci device");
+        return;
+    }
+
+    if (is_igd_vga_passthrough(&s->real_device) &&
+        s->real_device.domain == 0 && s->real_device.bus == 0 &&
+        s->real_device.dev == 2 && s->real_device.func == 0 &&
+        s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
+        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
+        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
+    }
+    xpdc->pci_qdev_realize(qdev, errp);
+}
+
 static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
+    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_CLASS(klass);
+    xpdc->pci_qdev_realize = dc->realize;
+    dc->realize = xen_igd_clear_slot;
     k->realize = xen_pt_realize;
     k->exit = xen_pt_unregister_device;
     k->config_read = xen_pt_pci_read_config;
@@ -977,6 +1007,7 @@ static const TypeInfo xen_pci_passthrough_info = {
     .instance_size = sizeof(XenPCIPassthroughState),
     .instance_finalize = xen_pci_passthrough_finalize,
     .class_init = xen_pci_passthrough_class_init,
+    .class_size = sizeof(XenPTDeviceClass),
     .instance_init = xen_pci_passthrough_instance_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index cf10fc7bbf..8c25932b4b 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -2,6 +2,7 @@
 #define XEN_PT_H
 
 #include "hw/xen/xen_common.h"
+#include "hw/pci/pci_bus.h"
 #include "xen-host-pci-device.h"
 #include "qom/object.h"
 
@@ -40,7 +41,20 @@ typedef struct XenPTReg XenPTReg;
 #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
 OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
 
+#define XEN_PT_DEVICE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
+#define XEN_PT_DEVICE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
+
+typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
+
+typedef struct XenPTDeviceClass {
+    PCIDeviceClass parent_class;
+    XenPTQdevRealize pci_qdev_realize;
+} XenPTDeviceClass;
+
 uint32_t igd_read_opregion(XenPCIPassthroughState *s);
+void xen_igd_reserve_slot(PCIBus *pci_bus);
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
 void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
                                            XenHostPCIDevice *dev);
@@ -75,6 +89,8 @@ typedef int (*xen_pt_conf_byte_read)
 
 #define XEN_PCI_INTEL_OPREGION 0xfc
 
+#define XEN_PCI_IGD_SLOT_MASK 0x4UL /* Intel IGD slot_reserved_mask */
+
 typedef enum {
     XEN_PT_GRP_TYPE_HARDWIRED = 0,  /* 0 Hardwired reg group */
     XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
index 2d8cac8d54..5c108446a8 100644
--- a/hw/xen/xen_pt_stub.c
+++ b/hw/xen/xen_pt_stub.c
@@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
         error_setg(errp, "Xen PCI passthrough support not built in");
     }
 }
+
+void xen_igd_reserve_slot(PCIBus *pci_bus)
+{
+}
-- 
2.39.0


