Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D47372C3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552075.861980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7V-0007LW-SK; Tue, 20 Jun 2023 17:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552075.861980; Tue, 20 Jun 2023 17:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7V-0007HO-MF; Tue, 20 Jun 2023 17:26:21 +0000
Received: by outflank-mailman (input) for mailman id 552075;
 Tue, 20 Jun 2023 17:26:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7U-0004q1-Gr
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:20 +0000
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [2607:f8b0:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90d758ef-0f8f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:26:18 +0200 (CEST)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6b5853a140cso1750519a34.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:18 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:17 -0700 (PDT)
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
X-Inumbo-ID: 90d758ef-0f8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281977; x=1689873977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HvrCL8rOJsuiwOG3muIoVRllaEm248y0LD47Kgrft0=;
        b=nmgU4y9Ln0rtIz80PAR3vTp7t61K68cxtW9WeRAqn7eaE3uMj1tya6GoffQApOwPAD
         kwbpLr9u2Y90w7sOrUMa+ArGM8Ep49feEFdPQONaGxHoMfoLK1N63oRqHGJpxj4lCw2C
         eIX4N0M/EYtGsqpl9NfqIMVk+rbdMPaJbFUp8SNYa5mPbJB2q99z+qXsrJQXNFsxMyB1
         NP+HYGwDfrCjlZ9JQZC6nHfjzf++zIthNMA0BoriKULZyJhp7bWZlO2SJbBUy/CXTPpV
         urJ/7Hw4lJxU78QQ1byX2mi/JGovBTW7NtftPygrxBG8yIV8IPUBkt4HtpgLWeu9wQdm
         3Oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281977; x=1689873977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HvrCL8rOJsuiwOG3muIoVRllaEm248y0LD47Kgrft0=;
        b=Oi5FKrVTmpSxxFKlfA40ZibIQfGHAEhD/SuXb1CjYi7LLpiK/491SH47q14BlCsFmR
         9wJor+u64ezeY8D+LrPabUuMszeFlrhqyBbugCVWUiZohMRQwwwbkHWLJ2hDjvzrFaY2
         eydNvNMrp+F6dUNYFWK0onDmPQbonkpwKUwTHqG6R5Gbty1mv91iCka473rzE2ZJi+ob
         LkNHFnQ7OA9tvqqNjaHU3rIcpcEx0zZRO+sSymCH6hc7mJKW4xVCI8pgVKBQ56lYTfbm
         us96r7L9E9gwlIKHY03YJpKSxi4QulUvsRW+3ZSKTJRKnAZ+GT0B7K3eJ501Bvcy497Z
         Ex2A==
X-Gm-Message-State: AC+VfDzoSWnV5T1xyenCqEJ4OCUOlRPj4VCxI379SmfWlYqKEzfAdFIE
	VLn2o6/h5IRqIGubxqL4WX0=
X-Google-Smtp-Source: ACHHUZ6Qt7O71pC+krywoR4rbBwRp9dAu+gyJXT+ubbJS5lT0aUS37r2zV6kUeMl6FXGYYhiuV77iQ==
X-Received: by 2002:a05:6358:455:b0:12b:e9fd:4b53 with SMTP id 21-20020a056358045500b0012be9fd4b53mr8661292rwe.22.1687281977366;
        Tue, 20 Jun 2023 10:26:17 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 11/23] xen/pt: handle PCIe Extended Capabilities Next register
Date: Tue, 20 Jun 2023 13:24:45 -0400
Message-Id: <8687512cd728cd0ad00d9a7d35cd3ce5c3a2c2ca.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch adds new xen_pt_ext_cap_ptr_reg_init function which is used
to initialize the emulated next pcie extended capability pointer.

Primary mission of this function is to have a method to selectively hide
some extended capabilities from the capability linked list, skipping them
by altering the Next capability pointer value.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/xen/xen_pt_config_init.c | 87 +++++++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 32 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 34ed9c25c5..ed36edbc4a 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -27,7 +27,10 @@
 
 static int xen_pt_ptr_reg_init(XenPCIPassthroughState *s, XenPTRegInfo *reg,
                                uint32_t real_offset, uint32_t *data);
-
+static int xen_pt_ext_cap_ptr_reg_init(XenPCIPassthroughState *s,
+                                       XenPTRegInfo *reg,
+                                       uint32_t real_offset,
+                                       uint32_t *data);
 
 /* helper */
 
@@ -1928,48 +1931,68 @@ out:
     return 0;
 }
 
+#define PCIE_EXT_CAP_NEXT_SHIFT 4
+#define PCIE_EXT_CAP_VER_MASK   0xF
 
-/*************
- * Main
- */
-
-static uint8_t find_cap_offset(XenPCIPassthroughState *s, uint8_t cap)
+static int xen_pt_ext_cap_ptr_reg_init(XenPCIPassthroughState *s,
+                                       XenPTRegInfo *reg,
+                                       uint32_t real_offset,
+                                       uint32_t *data)
 {
-    uint8_t id;
-    unsigned max_cap = XEN_PCI_CAP_MAX;
-    uint8_t pos = PCI_CAPABILITY_LIST;
-    uint8_t status = 0;
+    int i, rc;
+    XenHostPCIDevice *d = &s->real_device;
+    uint16_t reg_field;
+    uint16_t cur_offset, version, cap_id;
+    uint32_t header;
 
-    if (xen_host_pci_get_byte(&s->real_device, PCI_STATUS, &status)) {
-        return 0;
-    }
-    if ((status & PCI_STATUS_CAP_LIST) == 0) {
-        return 0;
+    if (real_offset < 0x0010) {
+        XEN_PT_ERR(&s->dev, "Incorrect PCIe extended capability offset "
+                   "encountered: 0x%04x\n", real_offset);
+        return -EINVAL;
     }
 
-    while (max_cap--) {
-        if (xen_host_pci_get_byte(&s->real_device, pos, &pos)) {
-            break;
-        }
-        if (pos < PCI_CONFIG_HEADER_SIZE) {
-            break;
-        }
+    rc = xen_host_pci_get_word(d, real_offset, &reg_field);
+    if (rc)
+        return rc;
 
-        pos &= ~3;
-        if (xen_host_pci_get_byte(&s->real_device,
-                                  pos + PCI_CAP_LIST_ID, &id)) {
-            break;
-        }
+    /* preserve version field */
+    version    = reg_field & PCIE_EXT_CAP_VER_MASK;
+    cur_offset = reg_field >> PCIE_EXT_CAP_NEXT_SHIFT;
 
-        if (id == 0xff) {
-            break;
+    while (cur_offset && cur_offset != 0xFFF) {
+        rc = xen_host_pci_get_long(d, cur_offset, &header);
+        if (rc) {
+            XEN_PT_ERR(&s->dev, "Failed to read PCIe extended capability "
+                       "@0x%x (rc:%d)\n", cur_offset, rc);
+            return rc;
         }
-        if (id == cap) {
-            return pos;
+
+        cap_id = PCI_EXT_CAP_ID(header);
+
+        for (i = 0; xen_pt_emu_reg_grps[i].grp_size != 0; i++) {
+            uint32_t cur_grp_id = xen_pt_emu_reg_grps[i].grp_id;
+
+            if (!IS_PCIE_EXT_CAP_ID(cur_grp_id))
+                continue;
+
+            if (xen_pt_hide_dev_cap(d, cur_grp_id))
+                continue;
+
+            if (GET_PCIE_EXT_CAP_ID(cur_grp_id) == cap_id) {
+                if (xen_pt_emu_reg_grps[i].grp_type == XEN_PT_GRP_TYPE_EMU)
+                    goto out;
+
+                /* skip TYPE_HARDWIRED capability, move the ptr to next one */
+                break;
+            }
         }
 
-        pos += PCI_CAP_LIST_NEXT;
+        /* next capability */
+        cur_offset = PCI_EXT_CAP_NEXT(header);
     }
+
+out:
+    *data = (cur_offset << PCIE_EXT_CAP_NEXT_SHIFT) | version;
     return 0;
 }
 
-- 
2.34.1


