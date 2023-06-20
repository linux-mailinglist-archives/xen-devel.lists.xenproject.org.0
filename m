Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1747372E1
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552105.862030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAW-0002ni-KP; Tue, 20 Jun 2023 17:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552105.862030; Tue, 20 Jun 2023 17:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAW-0002kN-H1; Tue, 20 Jun 2023 17:29:28 +0000
Received: by outflank-mailman (input) for mailman id 552105;
 Tue, 20 Jun 2023 17:29:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7c-0004q1-Nw
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:28 +0000
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [2607:f8b0:4864:20::1133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95a531e3-0f8f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:26:26 +0200 (CEST)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5707b429540so62318627b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:26 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:25 -0700 (PDT)
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
X-Inumbo-ID: 95a531e3-0f8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281985; x=1689873985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZtR49Wj+BsujqlKtwlIvLXrUvLyGZ/7NrGzguEb9A0=;
        b=rxOo0tXcKfS1IYKEXuRJnHwkAChp/cBkhBvjJfVCWGOzcsHGlCZ6l3tNOl0XO8izkf
         9Ua5For1WY8+nDPZPjKubfsBDBU/BzDNa6nmgGSAIshSBmPHoYrQPtjQl0y1Xheg+pE8
         mM18gyjsk2UTfcWTS2tbtC/0QL/fxAXqEYd0vMsCcXesrSzdEw4xpnL1uHCir3pVNz7k
         fO0iYsRcdwiWniF2hmpqKPZiwJcE4Ct8XbLtn4XH9Vidk+E4PIB7BHmUoGSLo1GRK+Pl
         BVW1BZbGXKhPuDybfQm9FQoZV3aTssCTg85XrL/1IVvdxnV3aGq8D/bcziQJXFRksMgz
         9cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281985; x=1689873985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZtR49Wj+BsujqlKtwlIvLXrUvLyGZ/7NrGzguEb9A0=;
        b=b939cd+6hQl2RJcO0q6JzHnlMJ9rVoZTCy2OGWkNqdtBzXu1hPNAp83n+PpB8SoMcG
         QXLxbONHWFuCxeFPgxKJmHcd8mCSvuoc2zqsKnZ0Nq0etd25AmNtQQAcCp53KerMlIdx
         Tg8TlDlfxTkJLFFxchoqLlyK9o3rWqqJdRWEMyRzzH4OQqHremepAHWaC8Wirm808lAL
         GF7qguPHZeo7TkFI/N5fS+fMM3ljiUTyNswcSxdYJrQiF7SE6kvq74t8SBfFWPbwSkSr
         V3JrEN17dyExF+tyUS9O57uAm9CgXWAQRhvMLv1PPNwQExYzKPLGJvtqrJ96+dy41MRk
         56cA==
X-Gm-Message-State: AC+VfDzdQArY9IWEOrPNvQUTf3DIEKYKn293NjY2Rr4Bbj/hM2yFTsqZ
	Wagx4jYzz0f4wDszkUT2iO0=
X-Google-Smtp-Source: ACHHUZ7vnof2FXuOFDNyhaBtlcGPG7xrWzUFudElGDOK5WYidGkK2Dmf/59suWaFDE/d1Yxi9aEXng==
X-Received: by 2002:a0d:cbcb:0:b0:56c:e5a3:3e09 with SMTP id n194-20020a0dcbcb000000b0056ce5a33e09mr21057302ywd.15.1687281985609;
        Tue, 20 Jun 2023 10:26:25 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 15/23] xen/pt: add AER PCIe Extended Capability descriptor and sizing
Date: Tue, 20 Jun 2023 13:24:49 -0400
Message-Id: <adf11b407bbb7c8fd2815559329b7a3d4e5b0f1e.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch provides Advanced Error Reporting PCIe Extended Capability
description structure and corresponding capability sizing function.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/xen/xen_pt_config_init.c | 72 +++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 69d8857c66..9fd0531bc4 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1861,6 +1861,70 @@ static int xen_pt_msix_size_init(XenPCIPassthroughState *s,
 }
 
 
+/* get Advanced Error Reporting Extended Capability register group size */
+#define PCI_ERR_CAP_TLP_PREFIX_LOG      (1U << 11)
+#define PCI_DEVCAP2_END_END_TLP_PREFIX  (1U << 21)
+static int xen_pt_ext_cap_aer_size_init(XenPCIPassthroughState *s,
+                                        const XenPTRegGroupInfo *grp_reg,
+                                        uint32_t base_offset,
+                                        uint32_t *size)
+{
+    uint8_t dev_type = get_pcie_device_type(s);
+    uint32_t aer_caps = 0;
+    uint32_t sz = 0;
+    int pcie_cap_pos;
+    uint32_t devcaps2;
+    int ret = 0;
+
+    pcie_cap_pos = xen_host_pci_find_next_cap(&s->real_device, 0,
+                                              PCI_CAP_ID_EXP);
+    if (!pcie_cap_pos) {
+        XEN_PT_ERR(&s->dev,
+                   "Cannot find a required PCI Express Capability\n");
+        return -1;
+    }
+
+    if (get_pcie_capability_version(s) > 1) {
+        ret = xen_host_pci_get_long(&s->real_device,
+                                    pcie_cap_pos + PCI_EXP_DEVCAP2,
+                                    &devcaps2);
+        if (ret) {
+            XEN_PT_ERR(&s->dev, "Error while reading Device "
+                       "Capabilities 2 Register \n");
+            return -1;
+        }
+    }
+
+    if (devcaps2 & PCI_DEVCAP2_END_END_TLP_PREFIX) {
+        ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + PCI_ERR_CAP,
+                                    &aer_caps);
+        if (ret) {
+            XEN_PT_ERR(&s->dev,
+                       "Error while reading AER Extended Capability\n");
+            return -1;
+        }
+
+        if (aer_caps & PCI_ERR_CAP_TLP_PREFIX_LOG) {
+            sz = 0x48;
+        }
+    }
+
+    if (!sz) {
+        if (dev_type == PCI_EXP_TYPE_ROOT_PORT ||
+            dev_type == PCI_EXP_TYPE_RC_EC) {
+            sz = 0x38;
+        } else {
+            sz = 0x2C;
+        }
+    }
+
+    *size = sz;
+
+    log_pcie_extended_cap(s, "AER", base_offset, *size);
+    return ret;
+}
+
 static const XenPTRegGroupInfo xen_pt_emu_reg_grps[] = {
     /* Header Type0 reg group */
     {
@@ -2128,6 +2192,14 @@ static const XenPTRegGroupInfo xen_pt_emu_reg_grps[] = {
         .size_init  = xen_pt_reg_grp_size_init,
         .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
     },
+    /* Advanced Error Reporting Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_ERR),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_aer_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
     {
         .grp_size = 0,
     },
-- 
2.34.1


