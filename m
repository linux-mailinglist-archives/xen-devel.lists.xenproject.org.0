Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5657372BC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552057.861910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf6z-0004rn-A9; Tue, 20 Jun 2023 17:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552057.861910; Tue, 20 Jun 2023 17:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf6z-0004q8-6K; Tue, 20 Jun 2023 17:25:49 +0000
Received: by outflank-mailman (input) for mailman id 552057;
 Tue, 20 Jun 2023 17:25:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf6y-0004q1-Hx
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:25:48 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d88d7d6-0f8f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:25:46 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-7624e8ceef7so372280285a.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:25:46 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:25:44 -0700 (PDT)
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
X-Inumbo-ID: 7d88d7d6-0f8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281945; x=1689873945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzWA4Xdu5chmj9W8/SSvQqa9W/rPnPlBar7MYCHNXR4=;
        b=nkl7c5jtmMqYWfcMCRh68XOL/ki9yoAqUWOOUdZYbHgQNtTW4Muko67OQmS60sOvg+
         ggRq408cyY7W+oRbCFRd76IoQNOKl3V2vHKQHkvFccUNpu87dQ4GpH4aMYwPfdI5J+x7
         fcVLBDtSLZCDXn3bXtIhHZ8ck7SFK/Mb/3LxBDBj76WswWRaSgSnrP3N3tDB9v9vant9
         qq7YVX5+7iRJOD80LEHirfoFLBmQhRuBppzU5bTVbMqOeOcCNyiVGTUMQeYNW6keD053
         wCMSFBO6mI5oqXjKQb80eh8jC0vmXZevKVW2FVEz8ctN2t8vOjb7GxNcXPRc2f+uwre3
         xplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281945; x=1689873945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzWA4Xdu5chmj9W8/SSvQqa9W/rPnPlBar7MYCHNXR4=;
        b=DfC5BfLNPRUpaPmqBB3HMpwNy1L87jI5IGJ0lJVeqMTLWdH2GZH2vhw5Jf0TrWczXH
         tq0iX+MbiUTqCG+b/KpYy/yfdbgii0zuDkRlF/QGhZAxZ0BViHycigu4arWBKUFghU9n
         Or0P+Ew6nX+gT/fnmI6plCZ/pA5eqf31ynIOebJHbN9ZnZYRfD/f1EGvcZs0JCQewxOd
         IwjpyXg1gcQiz6hsGI1EDtE6snNEhNz0JKi1ZsJbhDgsCitNITkZdmljhxQAqZsc2Y74
         dWKrncpUAw8Rba8tWZzqjbeWjimkW2a6ImkEN3354FRN4p2pyPx4Z23PbVLUBV4Hq148
         r/jg==
X-Gm-Message-State: AC+VfDx/tPikEUJRxROL5InAOo5Lbyi/cMUHJ0wQ88kRnjJCXnSji53f
	2gauWSKbHbqI67LG1pJ3PN4=
X-Google-Smtp-Source: ACHHUZ6JBmTkFy7A8F5kZ4X/2RW/8CZZjXWkzqR1U6M/mNyG75yHCAfIog0YjAv0K3OGN+9EpieONQ==
X-Received: by 2002:a05:620a:3d0d:b0:75f:403:77a8 with SMTP id tq13-20020a05620a3d0d00b0075f040377a8mr4458855qkn.31.1687281945053;
        Tue, 20 Jun 2023 10:25:45 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 01/23] pc/xen: Xen Q35 support: provide IRQ handling for PCI devices
Date: Tue, 20 Jun 2023 13:24:34 -0400
Message-Id: <1c547c5581ce6192b70c68f39de108cdb2c73f7e.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The primary difference in PCI device IRQ management between Xen HVM and
QEMU is that Xen PCI IRQs are "device-centric" while QEMU PCI IRQs are
"chipset-centric". Namely, Xen uses PCI device BDF and INTx as coordinates
to assert IRQ while QEMU finds out to which chipset PIRQ the IRQ is routed
through the hierarchy of PCI buses and manages IRQ assertion on chipset
side (as PIRQ inputs).

Two callback functions are used for this purpose: .map_irq and .set_irq
(named after corresponding structure fields). Corresponding Xen-specific
callback functions are piix3_set_irq() and pci_slot_get_pirq(). In Xen
case these functions do not operate on pirq pin numbers. Instead, they use
a specific value to pass BDF/INTx information between .map_irq and
.set_irq -- PCI device devfn and INTx pin number are combined into
pseudo-PIRQ in pci_slot_get_pirq, which piix3_set_irq later decodes back
into devfn and INTx number for passing to *set_pci_intx_level() call.

For Xen on Q35 this scheme is still applicable, with the exception that
function names are non-descriptive now and need to be renamed to show
their common i440/Q35 nature. Proposed new names are:

xen_pci_slot_get_pirq --> xen_cmn_pci_slot_get_pirq
xen_piix3_set_irq     --> xen_cmn_set_irq

Another IRQ-related difference between i440 and Q35 is the number of PIRQ
inputs and PIRQ routers (PCI IRQ links in terms of ACPI) available. i440
has 4 PCI interrupt links, while Q35 has 8 (PIRQA...PIRQH).
Currently Xen have support for only 4 PCI links, so we describe only 4 of
8 PCI links in ACPI tables. Also, hvmloader disables PIRQ routing for
PIRQE..PIRQH by writing 80h into corresponding PIRQ[n]_ROUT registers.

All this PCI interrupt routing stuff is largely an ancient legacy from PIC
era. It's hardly worth to extend number of PCI links supported as we
normally deal with APIC mode and/or MSI interrupts.

The only useful thing to do with PIRQE..PIRQH routing currently is to
check if guest actually attempts to use it for some reason (despite ACPI
PCI routing information provided). In this case, a warning is logged.

Things have changed a bit in modern Qemu, and more changes to the IRQ
mapping had to be done inside the lpc_ich9 to write the irqs and setup
the mappings.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/i386/pc_piix.c             |  3 +-
 hw/i386/xen/xen-hvm.c         |  7 +++--
 hw/isa/lpc_ich9.c             | 53 ++++++++++++++++++++++++++++++++---
 hw/isa/piix3.c                |  2 +-
 include/hw/southbridge/ich9.h |  1 +
 include/hw/xen/xen.h          |  4 +--
 stubs/xen-hw-stub.c           |  4 +--
 7 files changed, 61 insertions(+), 13 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index d5b0dcd1fe..8c1b20f3bc 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -62,6 +62,7 @@
 #endif
 #include "hw/xen/xen-x86.h"
 #include "hw/xen/xen.h"
+#include "sysemu/xen.h"
 #include "migration/global_state.h"
 #include "migration/misc.h"
 #include "sysemu/numa.h"
@@ -233,7 +234,7 @@ static void pc_init1(MachineState *machine,
                               x86ms->above_4g_mem_size,
                               pci_memory, ram_memory);
         pci_bus_map_irqs(pci_bus,
-                         xen_enabled() ? xen_pci_slot_get_pirq
+                         xen_enabled() ? xen_cmn_pci_slot_get_pirq
                                        : pc_pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 56641a550e..540ac46639 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -15,6 +15,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "hw/i386/pc.h"
+#include "hw/southbridge/ich9.h"
 #include "hw/irq.h"
 #include "hw/hw.h"
 #include "hw/i386/apic-msidef.h"
@@ -136,14 +137,14 @@ typedef struct XenIOState {
     Notifier wakeup;
 } XenIOState;
 
-/* Xen specific function for piix pci */
+/* Xen-specific functions for pci dev IRQ handling */
 
-int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+int xen_cmn_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
     return irq_num + (PCI_SLOT(pci_dev->devfn) << 2);
 }
 
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+void xen_cmn_set_irq(void *opaque, int irq_num, int level)
 {
     xen_set_pci_intx_level(xen_domid, 0, 0, irq_num >> 2,
                            irq_num & 3, level);
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 9c47a2f6c7..733a99d443 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -51,6 +51,9 @@
 #include "hw/core/cpu.h"
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/cutils.h"
+#include "hw/xen/xen.h"
+#include "sysemu/xen.h"
+#include "hw/southbridge/piix.h"
 #include "hw/acpi/acpi_aml_interface.h"
 #include "trace.h"
 
@@ -535,11 +538,49 @@ static int ich9_lpc_post_load(void *opaque, int version_id)
     return 0;
 }
 
+static void ich9_lpc_config_write_xen(PCIDevice *d,
+                                  uint32_t addr, uint32_t val, int len)
+{
+    static bool pirqe_f_warned = false;
+    if (ranges_overlap(addr, len, ICH9_LPC_PIRQA_ROUT, 4)) {
+        /* handle PIRQA..PIRQD routing */
+        /* Scan for updates to PCI link routes (0x60-0x63). */
+        int i;
+        for (i = 0; i < len; i++) {
+            uint8_t v = (val >> (8 * i)) & 0xff;
+            if (v & 0x80) {
+                v = 0;
+            }
+            v &= 0xf;
+            if (((addr + i) >= PIIX_PIRQCA) && ((addr + i) <= PIIX_PIRQCD)) {
+                xen_set_pci_link_route(addr + i - PIIX_PIRQCA, v);
+            }
+        }
+    } else if (ranges_overlap(addr, len, ICH9_LPC_PIRQE_ROUT, 4)) {
+        while (len--) {
+            if (range_covers_byte(ICH9_LPC_PIRQE_ROUT, 4, addr) &&
+                (val & 0x80) == 0) {
+                /* print warning only once */
+                if (!pirqe_f_warned) {
+                    pirqe_f_warned = true;
+                    fprintf(stderr, "WARNING: guest domain attempted to use PIRQ%c "
+                            "routing which is not supported for Xen/Q35 currently\n",
+                            (char)(addr - ICH9_LPC_PIRQE_ROUT + 'E'));
+                    break;
+                }
+            }
+            addr++, val >>= 8;
+        }
+    }
+}
+
 static void ich9_lpc_config_write(PCIDevice *d,
                                   uint32_t addr, uint32_t val, int len)
 {
     ICH9LPCState *lpc = ICH9_LPC_DEVICE(d);
     uint32_t rcba_old = pci_get_long(d->config + ICH9_LPC_RCBA);
+    if (xen_enabled())
+        ich9_lpc_config_write_xen(d, addr, val, len);
 
     pci_default_write_config(d, addr, val, len);
     if (ranges_overlap(addr, len, ICH9_LPC_PMBASE, 4) ||
@@ -731,10 +772,14 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
         return;
     }
 
-    pci_bus_irqs(pci_bus, ich9_lpc_set_irq, d, ICH9_LPC_NB_PIRQS);
-    pci_bus_map_irqs(pci_bus, ich9_lpc_map_irq);
-    pci_bus_set_route_irq_fn(pci_bus, ich9_route_intx_pin_to_irq);
-
+    if (xen_enabled()) {
+        pci_bus_irqs(pci_bus, xen_cmn_set_irq, d, ICH9_XEN_NUM_IRQ_SOURCES);
+        pci_bus_map_irqs(pci_bus, xen_cmn_pci_slot_get_pirq);
+    } else {
+        pci_bus_irqs(pci_bus, ich9_lpc_set_irq, d, ICH9_LPC_NB_PIRQS);
+        pci_bus_map_irqs(pci_bus, ich9_lpc_map_irq);
+        pci_bus_set_route_irq_fn(pci_bus, ich9_route_intx_pin_to_irq);
+    }
     ich9_lpc_pm_init(lpc);
 }
 
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index f9103ea45a..3d0545eb0e 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -420,7 +420,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      * connected to the IOAPIC directly.
      * These additional routes can be discovered through ACPI.
      */
-    pci_bus_irqs(pci_bus, xen_piix3_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, xen_cmn_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
 }
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/southbridge/ich9.h b/include/hw/southbridge/ich9.h
index fd01649d04..07b84d5227 100644
--- a/include/hw/southbridge/ich9.h
+++ b/include/hw/southbridge/ich9.h
@@ -130,6 +130,7 @@ struct ICH9LPCState {
 
 #define ICH9_A2_LPC_REVISION                    0x2
 #define ICH9_LPC_NB_PIRQS                       8       /* PCI A-H */
+#define ICH9_XEN_NUM_IRQ_SOURCES                128
 
 #define ICH9_LPC_PMBASE                         0x40
 #define ICH9_LPC_PMBASE_BASE_ADDRESS_MASK       ICH9_MASK(32, 15, 7)
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 2bd8ec742d..a2c3d98eaa 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -37,9 +37,9 @@ extern uint32_t xen_domid;
 extern enum xen_mode xen_mode;
 extern bool xen_domid_restrict;
 
-int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
+int xen_cmn_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
-void xen_piix3_set_irq(void *opaque, int irq_num, int level);
+void xen_cmn_set_irq(void *opaque, int irq_num, int level);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
 int xen_is_pirq_msi(uint32_t msi_data);
 
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 34a22f2ad7..f06fbf48c8 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -10,12 +10,12 @@
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-x86.h"
 
-int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+int xen_cmn_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
     return -1;
 }
 
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+void xen_cmn_set_irq(void *opaque, int irq_num, int level)
 {
 }
 
-- 
2.34.1


