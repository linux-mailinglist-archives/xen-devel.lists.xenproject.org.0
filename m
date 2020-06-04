Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DAC1EE55C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 15:31:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgpxM-0002Nr-PT; Thu, 04 Jun 2020 13:30:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbTH=7R=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jgpxL-0002Nl-1f
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 13:30:51 +0000
X-Inumbo-ID: 9ac63d76-a667-11ea-9947-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ac63d76-a667-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 13:30:50 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XE7ialVyZEW8eWC7san8djLnSSs3Mf4xl9IuDfkBvl91ONgwbprqOHlnc26hz5SO7BFPX974Uv
 gfyrC2PSOCFNdBeLraRWrSWDzYW5M33JsI2b2jM6rI7ewWZjBpYhJt7Seq2DJS0q8kMpLRbXq3
 Bnw6rhgUNg15FOM5RbFOoRl42owJERjY56GgtUgQp0zC2TOZ0P4Dye5KbaefC4Oi4NG+tFi38P
 4kBEJfb/MXOvw+7oXWy8dzyOaSvJ10c3t3NZSs2Huij9fMbEZS5TIQaTlhN0wwmRbOwh4xlpEV
 QuU=
X-SBRS: 2.7
X-MesageID: 19475987
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,472,1583211600"; d="scan'208";a="19475987"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4] xen: fix build without pci passthrough
Date: Thu, 4 Jun 2020 14:30:42 +0100
Message-ID: <20200604133042.3380585-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <159120627656.23398.3742621530752770397@45ef0f9c86ae>
References: <159120627656.23398.3742621530752770397@45ef0f9c86ae>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo
 Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Xen PCI passthrough support may not be available and thus the global
variable "has_igd_gfx_passthru" might be compiled out. Common code
should not access it in that case.

Unfortunately, we can't use CONFIG_XEN_PCI_PASSTHROUGH directly in
xen-common.c so this patch instead move access to the
has_igd_gfx_passthru variable via function and those functions are
also implemented as stubs. The stubs will be used when QEMU is built
without passthrough support.

Now, when one will want to enable igd-passthru via the -machine
property, they will get an error message if QEMU is built without
passthrough support.

Fixes: 46472d82322d0 ('xen: convert "-machine igd-passthru" to an accelerator property')
Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Paul Durrant <paul@xen.org>
Tested-by: Roger Pau Monné <roger.pau@citrix.com>
---

Notes:
    v4:
    - fix build when Xen headers aren't available.
      By building stubs/xen-pt.c only when CONFIG_XEN=y
      (The alternative would be to move the prototypes used by the stub into
      xen.h, which doesn't depends on xen headers.)
    
    Changes in v3:
    - reworked to use stubs instead of #ifdef CONFIG_XEN_PCI_PASSTHROUGH
      CONFIG_XEN_PCI_PASSTHROUGH isn't available in xen-common.c
    
      moving CONFIG_XEN_PCI_PASSTHROUGH to be in config_host_mak isn't
      really possible, or at least I didn't managed to make that work.

 hw/i386/pc_piix.c   |  2 +-
 hw/xen/xen-common.c |  4 ++--
 hw/xen/xen_pt.c     | 12 +++++++++++-
 hw/xen/xen_pt.h     |  6 ++++--
 stubs/Makefile.objs |  1 +
 stubs/xen-pt.c      | 22 ++++++++++++++++++++++
 6 files changed, 41 insertions(+), 6 deletions(-)
 create mode 100644 stubs/xen-pt.c

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index f66e1d73ce0b..347fb8c6c807 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -375,7 +375,7 @@ static void pc_init_isa(MachineState *machine)
 #ifdef CONFIG_XEN
 static void pc_xen_hvm_init_pci(MachineState *machine)
 {
-    const char *pci_type = has_igd_gfx_passthru ?
+    const char *pci_type = xen_igd_gfx_pt_enabled() ?
                 TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE : TYPE_I440FX_PCI_DEVICE;
 
     pc_init1(machine,
diff --git a/hw/xen/xen-common.c b/hw/xen/xen-common.c
index 70564cc952d5..dd2c22cc4c0b 100644
--- a/hw/xen/xen-common.c
+++ b/hw/xen/xen-common.c
@@ -129,12 +129,12 @@ static void xen_change_state_handler(void *opaque, int running,
 
 static bool xen_get_igd_gfx_passthru(Object *obj, Error **errp)
 {
-    return has_igd_gfx_passthru;
+    return xen_igd_gfx_pt_enabled();
 }
 
 static void xen_set_igd_gfx_passthru(Object *obj, bool value, Error **errp)
 {
-    has_igd_gfx_passthru = value;
+    xen_igd_gfx_pt_set(value, errp);
 }
 
 static void xen_setup_post(MachineState *ms, AccelState *accel)
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 81d5ad8da7f0..ab84443d5ec8 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -65,7 +65,17 @@
 #include "qemu/range.h"
 #include "exec/address-spaces.h"
 
-bool has_igd_gfx_passthru;
+static bool has_igd_gfx_passthru;
+
+bool xen_igd_gfx_pt_enabled(void)
+{
+    return has_igd_gfx_passthru;
+}
+
+void xen_igd_gfx_pt_set(bool value, Error **errp)
+{
+    has_igd_gfx_passthru = value;
+}
 
 #define XEN_PT_NR_IRQS (256)
 static uint8_t xen_pt_mapped_machine_irq[XEN_PT_NR_IRQS] = {0};
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 179775db7b22..6e9cec95f3b7 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -5,6 +5,9 @@
 #include "hw/pci/pci.h"
 #include "xen-host-pci-device.h"
 
+bool xen_igd_gfx_pt_enabled(void);
+void xen_igd_gfx_pt_set(bool value, Error **errp);
+
 void xen_pt_log(const PCIDevice *d, const char *f, ...) GCC_FMT_ATTR(2, 3);
 
 #define XEN_PT_ERR(d, _f, _a...) xen_pt_log(d, "%s: Error: "_f, __func__, ##_a)
@@ -322,10 +325,9 @@ extern void *pci_assign_dev_load_option_rom(PCIDevice *dev,
                                             unsigned int domain,
                                             unsigned int bus, unsigned int slot,
                                             unsigned int function);
-extern bool has_igd_gfx_passthru;
 static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
 {
-    return (has_igd_gfx_passthru
+    return (xen_igd_gfx_pt_enabled()
             && ((dev->class_code >> 0x8) == PCI_CLASS_DISPLAY_VGA));
 }
 int xen_pt_register_vga_regions(XenHostPCIDevice *dev);
diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index 6a9e3135e8f9..e0427158132f 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -40,6 +40,7 @@ stub-obj-y += target-get-monitor-def.o
 stub-obj-y += vmgenid.o
 stub-obj-y += xen-common.o
 stub-obj-y += xen-hvm.o
+stub-obj-$(CONFIG_XEN) += xen-pt.o
 stub-obj-y += pci-host-piix.o
 stub-obj-y += ram-block.o
 stub-obj-y += ramfb.o
diff --git a/stubs/xen-pt.c b/stubs/xen-pt.c
new file mode 100644
index 000000000000..2d8cac8d54b9
--- /dev/null
+++ b/stubs/xen-pt.c
@@ -0,0 +1,22 @@
+/*
+ * Copyright (C) 2020       Citrix Systems UK Ltd.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/xen/xen_pt.h"
+#include "qapi/error.h"
+
+bool xen_igd_gfx_pt_enabled(void)
+{
+    return false;
+}
+
+void xen_igd_gfx_pt_set(bool value, Error **errp)
+{
+    if (value) {
+        error_setg(errp, "Xen PCI passthrough support not built in");
+    }
+}
-- 
Anthony PERARD


