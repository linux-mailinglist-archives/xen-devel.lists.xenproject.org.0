Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E612613E8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 17:56:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFfyQ-0005q4-I0; Tue, 08 Sep 2020 15:55:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFfyO-0005nx-Sk
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 15:55:56 +0000
X-Inumbo-ID: 6fb941a8-1ee9-4229-a4bc-6c98a38ea6e2
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6fb941a8-1ee9-4229-a4bc-6c98a38ea6e2;
 Tue, 08 Sep 2020 15:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599580556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VUrfo15vNafeYg0h4TuIp0D8UFhdJzYacZhDlojTCw=;
 b=N9l4M5mocEv80Jjtzlp8AjaUn59I9cCtFVCqy+n19SFTUK1640WEGVnXvsCsZ2Hecs0Trc
 z2uW/OBMNOOX58RbYuES+so/itSRQsIf8EL/Zj/7ehFHwYB7jef6SxQi2pNnniFjMW4poq
 Ex/NWClQIhAxienqouxQQgui0sJQyzY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-OeTm29O6MAqpEFnvKadfAQ-1; Tue, 08 Sep 2020 11:55:54 -0400
X-MC-Unique: OeTm29O6MAqpEFnvKadfAQ-1
Received: by mail-wr1-f69.google.com with SMTP id x15so6257997wrm.7
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 08:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8VUrfo15vNafeYg0h4TuIp0D8UFhdJzYacZhDlojTCw=;
 b=E7N7arQh3ZH5vEBzijfa3MeDK2v1ZQ2Dpo6ljfF2MoJhZeXz50vPwutGFNZ/45QHpR
 d3D883VjRbdUcfQVFV7d8viaWN+w5GI2AXWriAY/UKdmzxap+ybUdex8zzozDnDzAw4V
 YcTuL1RjD6BpMy1O7GgEQE5HQCrGR/4LkpC6OzhlOfbN6UmNJ1McXDMovmX+2j3cAVDI
 7OtRyAXUDlZZp9XepNYEV/ZOGjUWSjlxhzmygEB8RO776pTAgY3QDPJgfIe6U1a9JDlA
 jzpFx+JW1j4p2voIr/QfzxAGaF46kp5WIuJ5OvEdBe6R3xbliMsuZI50yCGrLhTPBd4W
 Va4w==
X-Gm-Message-State: AOAM531oso7E+iQEMx70/E+6r9zSAvr8rwCZrLN3ZCu2+kGsHZl9KL/f
 374QHbQci1p8WdplC8XpW9YIjj+92jUiSO9ZDJX22O3AMChb8/3PQfJbAAJASsd1Hlu55l34Wox
 BDbA1Jv7pUdpWxLgdYcnHvsX7Cvs=
X-Received: by 2002:a5d:49d2:: with SMTP id t18mr270730wrs.99.1599580552696;
 Tue, 08 Sep 2020 08:55:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEdHc1pv7BGXCTe+BIUfFARswN/4qnGyClHhLRspWocVPg/ArmCIreq1geKKgL3FqYCE8gsQ==
X-Received: by 2002:a5d:49d2:: with SMTP id t18mr270716wrs.99.1599580552510;
 Tue, 08 Sep 2020 08:55:52 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id o5sm31934683wmc.33.2020.09.08.08.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:55:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 4/6] stubs: Split accelerator / hardware related stubs
Date: Tue,  8 Sep 2020 17:55:28 +0200
Message-Id: <20200908155530.249806-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908155530.249806-1-philmd@redhat.com>
References: <20200908155530.249806-1-philmd@redhat.com>
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


