Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108AC7372E5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:29:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552108.862040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAa-00037k-Tc; Tue, 20 Jun 2023 17:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552108.862040; Tue, 20 Jun 2023 17:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAa-00036A-OL; Tue, 20 Jun 2023 17:29:32 +0000
Received: by outflank-mailman (input) for mailman id 552108;
 Tue, 20 Jun 2023 17:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7k-0005Q4-62
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:36 +0000
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [2607:f8b0:4864:20::112a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aff712f-0f8f-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 19:26:35 +0200 (CEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5702415be17so42877067b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:35 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:34 -0700 (PDT)
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
X-Inumbo-ID: 9aff712f-0f8f-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281994; x=1689873994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQQT2DevBFB3oDkqTww+bCq8Z+NcubvcMEbZ9kPn1/I=;
        b=fstv2AOOVoUWAQIuOJ3m6gjiU4cTxA4w47YkcRP1Rz7FBW/kBHuRMpLSFwMaTEe5b1
         BlytFKX3BaEwTZKAkeW11PgTa8oze9Czt/+yknEl/OEBfvwDwXn7SW3PG/2w8PqeoPvm
         av8TBcXKkS0ciL2D5leUNWfuF+rTprm3u/HkWbPk/mwfGv0uVvN2t3ZSUpWiiVE5OWrW
         icnEMAZo2HF7BoErM6qix14wzc9gUbIHbkcx4ZwzBkJIr1KsPb4CDkdR5gy+OyiVn6w8
         Gh4q7qXxcQBsSJwTex+JKFslShnCOfxKn4FB052N1hJQvrzjk8BGqRy3FVkARemL4CKt
         I4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281994; x=1689873994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQQT2DevBFB3oDkqTww+bCq8Z+NcubvcMEbZ9kPn1/I=;
        b=CaaQBfduo8Mdv4SF19E/xLVyqjOukwcQd7Hl5riK1Hy/O8obsn81d2MrfGi+owudN1
         bWcOJ/GBSF5N4st0kGUaRKOI6tfa5ZJOov5o4SIC/bMWhxmlb7Jm/E9oyBfNAA08UMJL
         O5951wN/1592u2ZGVefm0Er52Wkg8IMxO/9ezKtc+Qit7jvAysl2EaiCWyKyVy3NyHoq
         fd0H/Su8x+cRbPAPP5NPFLXOhdEkjD6doezhfntu/gHuO3cGNmdyTPPYhNCSX15f2Tfv
         3oIEBZDe08DDhzzNIm8dXsamOyNBNC7ix0qpKpvw5pVm+VcArl6qv8vYiw8wbH9YC+qe
         Ri2A==
X-Gm-Message-State: AC+VfDyFPjIlbW20NCdBJoMUKLr3eguiPLS3aYHE1UoqnCoykIt/OD8k
	/BdnJwpMposu53SJnXu2Me0=
X-Google-Smtp-Source: ACHHUZ5TvogazAaiBwei1eL5eky/5rmlzL7gOMXYPR2q+pv034XN8iCHLrs6IQjYOJgREMAVTq8NZw==
X-Received: by 2002:a0d:ea01:0:b0:56c:e5a3:3e1b with SMTP id t1-20020a0dea01000000b0056ce5a33e1bmr12551422ywe.22.1687281994508;
        Tue, 20 Jun 2023 10:26:34 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 20/23] xen platform: unplug ahci object
Date: Tue, 20 Jun 2023 13:24:54 -0400
Message-Id: <9b8183903cbf20db4e2f0dafda9e0ed271a86a8e.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will unplug the ahci device when the Xen driver calls for an unplug.
This has been tested to work in linux and Windows guests.
When q35 is detected, we will remove the ahci controller
with the hard disks.  In the libxl config, cdrom devices
are put on a seperate ahci controller. This allows for 6 cdrom
devices to be added, and 6 qemu hard disks.


Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/i386/xen/xen_platform.c | 19 ++++++++++++++++++-
 hw/pci/pci.c               | 17 +++++++++++++++++
 include/hw/pci/pci.h       |  3 +++
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 57f1d742c1..0375337222 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -34,6 +34,7 @@
 #include "sysemu/block-backend.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "include/hw/i386/pc.h"
 #include "qom/object.h"
 
 #ifdef CONFIG_XEN
@@ -223,6 +224,12 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
         if (flags & UNPLUG_NVME_DISKS) {
             object_unparent(OBJECT(d));
         }
+        break;
+
+    case PCI_CLASS_STORAGE_SATA:
+	if (!aux) {
+            object_unparent(OBJECT(d));
+        }
 
     default:
         break;
@@ -231,7 +238,17 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
 
 static void pci_unplug_disks(PCIBus *bus, uint32_t flags)
 {
-    pci_for_each_device(bus, 0, unplug_disks, &flags);
+    PCIBus *q35 = find_q35();
+    if (q35) {
+        /* When q35 is detected, we will remove the ahci controller
+	 * with the hard disks.  In the libxl config, cdrom devices
+	 * are put on a seperate ahci controller. This allows for 6 cdrom
+	 * devices to be added, and 6 qemu hard disks.
+	 */
+        pci_function_for_one_bus(bus, unplug_disks, &flags);
+    } else {
+        pci_for_each_device(bus, 0, unplug_disks, &flags);
+    }
 }
 
 static void platform_fixed_ioport_writew(void *opaque, uint32_t addr, uint32_t val)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 1cc7c89036..8eac3d751a 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1815,6 +1815,23 @@ void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
     }
 }
 
+void pci_function_for_one_bus(PCIBus *bus,
+                          void (*fn)(PCIBus *b, PCIDevice *d, void *opaque),
+                          void *opaque)
+{
+    bus = pci_find_bus_nr(bus, 0);
+
+    if (bus) {
+        PCIDevice *d;
+
+        d = bus->devices[PCI_DEVFN(4,0)];
+        if (d) {
+            fn(bus, d, opaque);
+            return;
+        }
+    }
+}
+
 void pci_for_each_device_under_bus(PCIBus *bus,
                                    pci_bus_dev_fn fn, void *opaque)
 {
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index e6d0574a29..c53e21082a 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -343,6 +343,9 @@ void pci_for_each_device_under_bus(PCIBus *bus,
 void pci_for_each_device_under_bus_reverse(PCIBus *bus,
                                            pci_bus_dev_fn fn,
                                            void *opaque);
+void pci_function_for_one_bus(PCIBus *bus,
+                         void (*fn)(PCIBus *bus, PCIDevice *d, void *opaque),
+                         void *opaque);
 void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
                                   pci_bus_fn end, void *parent_state);
 PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
-- 
2.34.1


