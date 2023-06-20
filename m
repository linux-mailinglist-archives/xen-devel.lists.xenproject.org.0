Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D0D7372E2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552103.862016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAT-0002IE-DY; Tue, 20 Jun 2023 17:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552103.862016; Tue, 20 Jun 2023 17:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAT-0002Fu-7U; Tue, 20 Jun 2023 17:29:25 +0000
Received: by outflank-mailman (input) for mailman id 552103;
 Tue, 20 Jun 2023 17:29:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7k-0004q1-9f
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:36 +0000
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [2607:f8b0:4864:20::a36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a4881d5-0f8f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:26:34 +0200 (CEST)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-4715758343aso1420761e0c.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:34 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:32 -0700 (PDT)
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
X-Inumbo-ID: 9a4881d5-0f8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281993; x=1689873993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHujXKoC6+pvKbdfEDtYmXpzoxjEyy+YGxjQhJLOU0Y=;
        b=GM+CG3fWRPKOG4chiQRmboIRPep8REP/M8D+0GeYUmtTHRWf/d2klrmsavq5Cp+SFY
         mXAFc+c517Cql+9sL95wm3ozozHbV5djHykxm4q5KD0NDvXGtC1ci5gDMQklVHI43Hgx
         t+oy7zCw3J2vA2BJ3qzL6GWWzcGm2cLxOLwt/v1wZy1LBC7ya0d8jYzgjvAluAc/XA02
         apVxuVVCddQCVq++rywBUAd7/un/VWrrvZUlvF7NqPObTXgXUSwO+3yOHWRyjSzYNT7Q
         7TdzzijFwWvqNgZMM2RnbbVcIe3wCN87Fx5KMzW6GW2mXeAIuTNl0fB/g5pBSAYVpVj1
         /TBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281993; x=1689873993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHujXKoC6+pvKbdfEDtYmXpzoxjEyy+YGxjQhJLOU0Y=;
        b=QcStLAMYwZnx7kmRBXauEH2NtL2pSbqN86nZTCM3OdH/UIpxPZEe2MikbvxGGWOEfo
         SUHByn6FzEea+jRZ4tlug6+cDW5h5MCnXoL7Sz2zTxB3pDHxhRbXdtWVeGmR84TKwS2M
         ycFK8SU0pQBHbWGDJo6smXZ4kgrpXCFaP8pvO87W1YQqivMD1QkFMYmzABsJMzcoZq5c
         wPN/1X5Y6WCOlxdE0dngAOixUxEDtBbaehrxfwYxlUvqhL9/9W7XOtu6eoLxSDQaLz5W
         7CardVHvWz9CdWYl9d2J8/1EQRwu3s6GwcvgQ01PMTTMYqhsOMgCeRX+p/KtHbtelILb
         bzMQ==
X-Gm-Message-State: AC+VfDyRfPvbvhleWetcjyqsCQk8jn5zFlnsGMs4KbjgiecUxTZ8Xyqh
	l//aE0A1k6Lb4D7zGygNxdE=
X-Google-Smtp-Source: ACHHUZ5QiJc1oXfSp4p9cZik4NYdz6sPHMrvS71pbTKO/RMTg1uRBBt5TM62D7CH5DnCPiKqY10dDg==
X-Received: by 2002:a1f:5c93:0:b0:464:7682:3506 with SMTP id q141-20020a1f5c93000000b0046476823506mr4435739vkb.12.1687281993305;
        Tue, 20 Jun 2023 10:26:33 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 19/23] xen/pt: Fake capability id
Date: Tue, 20 Jun 2023 13:24:53 -0400
Message-Id: <65b91216c1337b560548f39978d41c988b498517.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some PCIe capabilities needed to be faked for the xen implementation to work.

This is the situation when we were asked to hide (aka
"hardwire to 0") some PCIe ext capability, but it was located
at offset 0x100 in PCIe config space. In this case we can't
simply exclude it from the linked list of capabilities
(as it is the first entry in the list), so we must fake its
Capability ID in PCIe Extended Capability header, leaving
the Next Ptr field intact while returning zeroes on attempts
to read capability body (writes are ignored).

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/xen/xen_pt_config_init.c | 72 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 4e14adf2b2..41b43b9445 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 #include "qemu/timer.h"
 #include "xen_pt.h"
+#include "xen-host-pci-device.h"
 #include "hw/xen/xen-legacy-backend.h"
 
 #define XEN_PT_MERGE_VALUE(value, data, val_mask) \
@@ -31,6 +32,10 @@ static int xen_pt_ext_cap_ptr_reg_init(XenPCIPassthroughState *s,
                                        XenPTRegInfo *reg,
                                        uint32_t real_offset,
                                        uint32_t *data);
+static int xen_pt_ext_cap_capid_reg_init(XenPCIPassthroughState *s,
+                                         XenPTRegInfo *reg,
+                                         uint32_t real_offset,
+                                         uint32_t *data);
 
 /* helper */
 
@@ -995,6 +1000,17 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
     },
+    /* PCI Express Capabilities Register */
+    {
+        .offset     = PCI_EXP_FLAGS,
+        .size       = 2,
+        .init_val   = 0x0000,
+        .ro_mask    = 0xFFFF,
+        .emu_mask   = 0xFFFF,
+        .init       = xen_pt_pcie_capabilities_reg_init,
+        .u.w.read   = xen_pt_word_reg_read,
+        .u.w.write  = xen_pt_word_reg_write,
+    },
     /* Device Capabilities reg */
     {
         .offset     = PCI_EXP_DEVCAP,
@@ -1633,6 +1649,54 @@ static XenPTRegInfo xen_pt_emu_reg_igd_opregion[] = {
     },
 };
 
+/****************************
+ * Emulated registers for
+ * PCIe Extended Capabilities
+ */
+
+static uint16_t fake_cap_id = XEN_PCIE_FAKE_CAP_ID_BASE;
+
+/* PCIe Extended Capability ID reg */
+static int xen_pt_ext_cap_capid_reg_init(XenPCIPassthroughState *s,
+                                         XenPTRegInfo *reg,
+                                         uint32_t real_offset,
+                                         uint32_t *data)
+{
+    uint16_t reg_field;
+    int rc;
+    XenPTRegGroup *reg_grp_entry = NULL;
+
+    /* use real device register's value as initial value */
+    rc = xen_host_pci_get_word(&s->real_device, real_offset, &reg_field);
+    if (rc) {
+        return rc;
+    }
+
+    reg_grp_entry = xen_pt_find_reg_grp(s, real_offset);
+
+    if (reg_grp_entry) {
+        if (reg_grp_entry->reg_grp->grp_type == XEN_PT_GRP_TYPE_HARDWIRED &&
+            reg_grp_entry->base_offset == PCI_CONFIG_SPACE_SIZE) {
+            /*
+             * This is the situation when we were asked to hide (aka
+             * "hardwire to 0") some PCIe ext capability, but it was located
+             * at offset 0x100 in PCIe config space. In this case we can't
+             * simply exclude it from the linked list of capabilities
+             * (as it is the first entry in the list), so we must fake its
+             * Capability ID in PCIe Extended Capability header, leaving
+             * the Next Ptr field intact while returning zeroes on attempts
+             * to read capability body (writes are ignored).
+             */
+            reg_field = fake_cap_id;
+            /* increment the value in order to have unique Capability IDs */
+            fake_cap_id++;
+        }
+    }
+
+    *data = reg_field;
+    return 0;
+}
+
 /* Vendor-specific Ext Capability Structure reg static information table */
 static XenPTRegInfo xen_pt_ext_cap_emu_reg_vendor[] = {
     {
@@ -2938,7 +3002,13 @@ void xen_pt_config_init(XenPCIPassthroughState *s, Error **errp)
             }
         }
 
-        if (xen_pt_emu_reg_grps[i].grp_type == XEN_PT_GRP_TYPE_EMU) {
+        if (xen_pt_emu_reg_grps[i].grp_type == XEN_PT_GRP_TYPE_EMU ||
+            /*
+             * We need to always emulate the PCIe Extended Capability
+             * header for a hidden capability which starts at offset 0x100
+             */
+            (xen_pt_emu_reg_grps[i].grp_type == XEN_PT_GRP_TYPE_HARDWIRED &&
+            reg_grp_offset == 0x100)) {
             if (xen_pt_emu_reg_grps[i].emu_regs) {
                 int j = 0;
                 XenPTRegInfo *regs = xen_pt_emu_reg_grps[i].emu_regs;
-- 
2.34.1


