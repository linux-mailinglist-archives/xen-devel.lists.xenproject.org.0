Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D322612AB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 16:26:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFeZj-0004aq-D4; Tue, 08 Sep 2020 14:26:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFeZh-0004aJ-Ij
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 14:26:21 +0000
X-Inumbo-ID: f6bbec68-151e-4afc-be5b-3b166805f1e2
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f6bbec68-151e-4afc-be5b-3b166805f1e2;
 Tue, 08 Sep 2020 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599575180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VUrfo15vNafeYg0h4TuIp0D8UFhdJzYacZhDlojTCw=;
 b=HhGvXUDxQ+4XXUJ0pgoq621A7+XUM026bmF8Xb6po2aQbyRdVxrVaGUwJT2shnxTDAC7z5
 /g0WKWrnXerXuXd/NvURrA3IjySEy4ctquaqNHQ04Npn8klgRMedGsggBbInxxJXzqGv+P
 D6MPtZvjozMaghlZK0qucGVMSMIpax8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-4_URLcswNh6UnT5QO3I2MQ-1; Tue, 08 Sep 2020 10:26:18 -0400
X-MC-Unique: 4_URLcswNh6UnT5QO3I2MQ-1
Received: by mail-wr1-f70.google.com with SMTP id f18so7031393wrv.19
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 07:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8VUrfo15vNafeYg0h4TuIp0D8UFhdJzYacZhDlojTCw=;
 b=Pdy3HvURo417iKsWn/h4LjS3z6IKZ+FAtooObedCa9+Ass+L2fmpVFDU05F2AaqhJy
 veC+SssgmXF/liz9df5JSdnZNEI/v+PBl44EDV9tWuS3rvC6LyVu/z8veV6q0jLBKqlE
 /CfsOsYVfHft9lBmhN5RxCHJwi38RHuhpkFDd/w+dAUt2yNJJBQFCgjZ4L7QZAJeNTNc
 lXI5bCuUs02G+KKYEIuovFA30s/GKoDAu+qQ+ZEr5F1hdop5R1RUHA97UuWa3FrrHBjy
 3frjn4cJ09+ad81ydlfoJctzyqWJR6e2rsd4kx1pQdEk6eCvu7zzJy0eH7ipD313ncYQ
 yotg==
X-Gm-Message-State: AOAM533UXiJPvoIkn6OGs1SOSI/Oe21T+m78HsOBx9H8CB6AG/t8tAP2
 bTaT6FzEm6roQzOZZnGpkO0U9cKteX0cOlq1Pdu8OaG3yGs3bi2CJZ7OMbr3dzjji21OotTVmDS
 biKYEPM9rNDyij8OnysJ7D8hc9G4=
X-Received: by 2002:adf:ded0:: with SMTP id i16mr28998782wrn.372.1599575176516; 
 Tue, 08 Sep 2020 07:26:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkszmGXOLnkk3CcObVMEgsSL3kaacDO7vyqNMMFdP08ftv4yg2yphpdxx/O0+be5EyVAQmTg==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr28998760wrn.372.1599575176292; 
 Tue, 08 Sep 2020 07:26:16 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id 188sm56090648wmz.2.2020.09.08.07.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 07:26:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 3/5] stubs: Split accelerator / hardware related stubs
Date: Tue,  8 Sep 2020 16:25:57 +0200
Message-Id: <20200908142559.192945-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908142559.192945-1-philmd@redhat.com>
References: <20200908142559.192945-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Move hardware stubs unrelated from the accelerator to xen-hw-stub.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 accel/stubs/xen-stub.c | 41 +----------------------------------
 stubs/xen-hw-stub.c    | 49 ++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS            |  1 +
 stubs/meson.build      |  1 +
 4 files changed, 52 insertions(+), 40 deletions(-)
 create mode 100644 stubs/xen-hw-stub.c

diff --git a/accel/stubs/xen-stub.c b/accel/stubs/xen-stub.c
index fa3dddbce57..7ba0b697f49 100644
--- a/accel/stubs/xen-stub.c
+++ b/accel/stubs/xen-stub.c
@@ -6,50 +6,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/xen/xen.h"
+#include "sysemu/xen.h"
 #include "qapi/qapi-commands-misc.h"
 
 bool xen_allowed;
 
-void xenstore_store_pv_console_info(int i, Chardev *chr)
-{
-}
-
-int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
-{
-    return -1;
-}
-
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
-{
-}
-
-void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
-{
-}
-
-void xen_hvm_inject_msi(uint64_t addr, uint32_t data)
-{
-}
-
-int xen_is_pirq_msi(uint32_t msi_data)
-{
-    return 0;
-}
-
-qemu_irq *xen_interrupt_controller_init(void)
-{
-    return NULL;
-}
-
-void xen_register_framebuffer(MemoryRegion *mr)
-{
-}
-
-void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
-{
-}
-
 void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
 {
 }
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
new file mode 100644
index 00000000000..d14efef49e9
--- /dev/null
+++ b/stubs/xen-hw-stub.c
@@ -0,0 +1,49 @@
+/*
+ * Copyright (C) 2014       Citrix Systems UK Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/xen/xen.h"
+
+void xenstore_store_pv_console_info(int i, Chardev *chr)
+{
+}
+
+int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+{
+    return -1;
+}
+
+void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+{
+}
+
+void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
+{
+}
+
+void xen_hvm_inject_msi(uint64_t addr, uint32_t data)
+{
+}
+
+int xen_is_pirq_msi(uint32_t msi_data)
+{
+    return 0;
+}
+
+qemu_irq *xen_interrupt_controller_init(void)
+{
+    return NULL;
+}
+
+void xen_register_framebuffer(MemoryRegion *mr)
+{
+}
+
+void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
+{
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 7d0a5e91e4f..b3366713903 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -480,6 +480,7 @@ F: include/hw/block/dataplane/xen*
 F: include/hw/xen/
 F: include/sysemu/xen.h
 F: include/sysemu/xen-mapcache.h
+F: stubs/xen-hw-stub.c
 
 Guest CPU Cores (HAXM)
 ---------------------
diff --git a/stubs/meson.build b/stubs/meson.build
index e0b322bc282..c3e318a57f3 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -46,4 +46,5 @@ stub_ss.add(files('vm-stop.c'))
 stub_ss.add(files('win32-kbd-hook.c'))
 if have_system
   stub_ss.add(files('semihost.c'))
+  stub_ss.add(when: 'CONFIG_XEN', if_false: files('xen-hw-stub.c'))
 endif
-- 
2.26.2


