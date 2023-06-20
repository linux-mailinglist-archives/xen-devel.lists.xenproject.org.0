Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C2A73728D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551987.861810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyn-00060e-Lt; Tue, 20 Jun 2023 17:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551987.861810; Tue, 20 Jun 2023 17:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyn-0005ww-Hk; Tue, 20 Jun 2023 17:17:21 +0000
Received: by outflank-mailman (input) for mailman id 551987;
 Tue, 20 Jun 2023 17:17:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBeym-0005iB-E0
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:17:20 +0000
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f6b5504-0f8e-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 19:17:19 +0200 (CEST)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-bd20beffda6so5024182276.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:17:19 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 f81-20020a25cf54000000b00bcc0f2e4f05sm461938ybg.59.2023.06.20.10.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:17:17 -0700 (PDT)
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
X-Inumbo-ID: 4f6b5504-0f8e-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281438; x=1689873438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71wJeWz39VGTUAbQYnJ9ZhVkru2e1DXrr/8wkpMAFSE=;
        b=Y4gEQTo99sIEQ8rxDDG725536/rWjZR54ENbe76sUGh+PGbAjliL1qCqiWOe6Qzgh9
         GXciLFxNuaHB5OqQ0X6Px2hxfUAkPqtR/lfHqnComRd/oQA3PtQlKt3kOspdv7LvgeYj
         f1Teoygg0ojiVTm8ukxqqjNSYuxvYnP+rIkgw5HNzzcY5NzyQZtoZgdyhq/jYFymFOvw
         6Z94JqzQ+yEZJSWuFjmj4g7TPpv3dvXn4wNI6almEBepcIw0mtxJtq7frt+HTS87SjrN
         hQ0pAz4Ql0zB4YYNcQ/lKdQUTU9gqv38Q52rh5k+sa1GJ1nTdLK/OJAZvjVBHdYVh9lv
         1yNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281438; x=1689873438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71wJeWz39VGTUAbQYnJ9ZhVkru2e1DXrr/8wkpMAFSE=;
        b=BzHXokCvCKHukpSgK0PBqX3Dwgp+G3LhefH6MJQHjB0oZnHO1yEsLjpTZhtPNj5G7j
         YRCuE07anSI8Fw2mPinUyG5SOL6mkEvl5s4N52lxH0rgtbYsmoOAqJj2jI+33EzL84iP
         B/dkkjTwg5FgvnefX0LTjtalwW/f/rJz1n08M+yx3y4U44A/T6Ac+S22h2aahLVJOGfx
         KDGj0qDMO2ErRbUTruwl9NZoCE1ozemjJGuHVr9ACJZ6ZjwX2D2rkkS/U9mqwv5Oti+e
         M1GD5vQCuSVHjtrV0bAYMULIF9P2MM3sNWxqAzks4wMZDfag3il+qV6sjYmhwvUhBZeu
         qFBg==
X-Gm-Message-State: AC+VfDxL5feFoiWA9Mor9pzx4oe/IGS5mvOVgyPV0qkaVsuzPUtkXel1
	G7ebZmsf+NzlFC/9R0NRSQANUYanyGJRRg==
X-Google-Smtp-Source: ACHHUZ714SARpqWWDQ1jBaXWwkZB5255LtKrzZ/wi+Iij9hYFPgy3Dz/ylSoqvYbEYcHUTqMcDEy0g==
X-Received: by 2002:a25:6b4d:0:b0:bcb:3094:6aec with SMTP id o13-20020a256b4d000000b00bcb30946aecmr9363032ybm.15.1687281437834;
        Tue, 20 Jun 2023 10:17:17 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 03/12] hvmloader: add function to query an emulated machine type (i440/Q35)
Date: Tue, 20 Jun 2023 13:15:43 -0400
Message-Id: <d8adad3733b18b3539334721fc61b2e0d08f2736.1687215890.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687215890.git.jupham125@gmail.com>
References: <cover.1687215890.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a new function get_pc_machine_type() which allows to determine
the emulated chipset type. Supported return values:

- MACHINE_TYPE_I440
- MACHINE_TYPE_Q35
- MACHINE_TYPE_UNKNOWN, results in the error message being printed
  followed by calling BUG() in hvmloader.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 tools/firmware/hvmloader/pci_regs.h |  4 +++
 tools/firmware/hvmloader/util.c     | 47 +++++++++++++++++++++++++++++
 tools/firmware/hvmloader/util.h     |  8 +++++
 3 files changed, 59 insertions(+)

diff --git a/tools/firmware/hvmloader/pci_regs.h b/tools/firmware/hvmloader/pci_regs.h
index 7bf2d873ab..4d4dc0cd01 100644
--- a/tools/firmware/hvmloader/pci_regs.h
+++ b/tools/firmware/hvmloader/pci_regs.h
@@ -107,6 +107,10 @@
 
 #define PCI_INTEL_OPREGION 0xfc /* 4 bits */
 
+#define PCI_VENDOR_ID_INTEL              0x8086
+#define PCI_DEVICE_ID_INTEL_82441        0x1237
+#define PCI_DEVICE_ID_INTEL_Q35_MCH      0x29c0
+
 #endif /* __HVMLOADER_PCI_REGS_H__ */
 
 /*
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index e82047d993..a8685ee23a 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -22,6 +22,7 @@
 #include "hypercall.h"
 #include "ctype.h"
 #include "vnuma.h"
+#include "pci_regs.h"
 #include <acpi2_0.h>
 #include <libacpi.h>
 #include <stdint.h>
@@ -735,6 +736,52 @@ void __bug(const char *file, int line)
     crash();
 }
 
+
+static int machine_type = MACHINE_TYPE_UNDEFINED;
+
+int get_pc_machine_type(void)
+{
+    uint16_t vendor_id;
+    uint16_t device_id;
+
+    if (machine_type != MACHINE_TYPE_UNDEFINED)
+        return machine_type;
+
+    machine_type = MACHINE_TYPE_UNKNOWN;
+
+    vendor_id = pci_readw(0, PCI_VENDOR_ID);
+    device_id = pci_readw(0, PCI_DEVICE_ID);
+
+    /* only Intel platforms are emulated currently */
+    if (vendor_id == PCI_VENDOR_ID_INTEL)
+    {
+        switch (device_id)
+        {
+        case PCI_DEVICE_ID_INTEL_82441:
+            machine_type = MACHINE_TYPE_I440;
+            printf("Detected i440 chipset\n");
+            break;
+
+        case PCI_DEVICE_ID_INTEL_Q35_MCH:
+            machine_type = MACHINE_TYPE_Q35;
+            printf("Detected Q35 chipset\n");
+            break;
+
+        default:
+            break;
+        }
+    }
+
+    if (machine_type == MACHINE_TYPE_UNKNOWN)
+    {
+        printf("Unknown emulated chipset encountered, VID=%04Xh, DID=%04Xh\n",
+               vendor_id, device_id);
+        BUG();
+    }
+
+    return machine_type;
+}
+
 static void validate_hvm_info(struct hvm_info_table *t)
 {
     uint8_t *ptr = (uint8_t *)t;
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 87be213dec..f6a6cc3421 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -90,6 +90,14 @@ void pci_write(uint32_t devfn, uint32_t reg, uint32_t len, uint32_t val);
 #define pci_writew(devfn, reg, val) pci_write(devfn, reg, 2, (uint16_t)(val))
 #define pci_writel(devfn, reg, val) pci_write(devfn, reg, 4, (uint32_t)(val))
 
+/* Emulated machine types */
+#define MACHINE_TYPE_UNDEFINED      0
+#define MACHINE_TYPE_I440           1
+#define MACHINE_TYPE_Q35            2
+#define MACHINE_TYPE_UNKNOWN        (-1)
+
+int get_pc_machine_type(void);
+
 /* Get a pointer to the shared-info page */
 struct shared_info *get_shared_info(void) __attribute__ ((const));
 
-- 
2.34.1


