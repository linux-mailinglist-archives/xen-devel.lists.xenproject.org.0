Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDDB7372C6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:26:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552079.862000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7b-0008BT-H2; Tue, 20 Jun 2023 17:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552079.862000; Tue, 20 Jun 2023 17:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7b-00088i-9h; Tue, 20 Jun 2023 17:26:27 +0000
Received: by outflank-mailman (input) for mailman id 552079;
 Tue, 20 Jun 2023 17:26:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7Z-0005Q4-G5
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:25 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 947a6d3e-0f8f-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 19:26:24 +0200 (CEST)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5728df0a7d9so39840357b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:24 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:23 -0700 (PDT)
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
X-Inumbo-ID: 947a6d3e-0f8f-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281983; x=1689873983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUH0LrDNCluOY2g7IZF9uazabmu57c7aIkRqhWuUoW4=;
        b=iwRwRTaFQJfYCfdFgHs5hBrVVJyyLJCQKXLzDjc2uw1+9/aIo5cnUv+/xiPHbxjuh2
         XFwA15wc+YNcwlq8WwcGhVyB1lz9VsRgzw4+XvIpPjE8ExRcuEvjNOBNE0RQ57VEEDNJ
         64EPpQNaQEYzxkQ3c/wV95dN8zfhpngMP2nU9OZ/liVkq+4MPfn3nPH+QPU4ginQEKvn
         U8V7lDKGEZ9gP08J4zgUGhm2JE9iozhSVNTDMielRBCFN0rxFigIZOc94CQIhyYeuQPR
         hxGZm6uHroeQ+mGmjc3xBa9l0n2oo9PXJfgI65Ux8poxJl/JDEtJvcHnMCpECNXdCZx2
         LiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281983; x=1689873983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUH0LrDNCluOY2g7IZF9uazabmu57c7aIkRqhWuUoW4=;
        b=Pz6i8/RVg5DWZMZ4Phw45JRcjHkY74lq+SWcK4tOKSd4ozeYDuMda6AcDw+uptmlVF
         o+cR9hjN3vVEVDbNjKWVSdYkhxtziOTXHuljWpl9ss01HhRdXWfsBv8MItBvYeDpXg9+
         8bvKuveMEIAkA4LAePzI0GKOmwxDJvWBnKFRswJZtfab2RMLtnG8ARflGOF6nmxIPQH1
         jIMlbc1Z8FlXfMraWN6Oxps8BW3U/FbFxUr+4sO3CwlsCGOPTIV5pvJW54P7EiCNFyAi
         LhsCeFMDSOgdIyDcv024eSgluuMUVnzJq4No+iiuPZSOx0HZwgsHsiAQWe4DqnWZgxfg
         odYQ==
X-Gm-Message-State: AC+VfDz/kHTzUOEL8X6mVf1/jXWpbbskZGAoCkOVyJNZCjrsETqDFlo9
	xr7GhYoSWMz1Wf04F0DqfRs=
X-Google-Smtp-Source: ACHHUZ7H14tCE3HKsTlD/gtaiOjoMH3zAfVEsd3ThHpqpefM/jk8OkdgqNWhx9f/7UfbiTzox58o8A==
X-Received: by 2002:a81:5215:0:b0:56c:e2c1:6695 with SMTP id g21-20020a815215000000b0056ce2c16695mr12352572ywb.50.1687281983595;
        Tue, 20 Jun 2023 10:26:23 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 14/23] xen/pt: add fixed-size PCIe Extended Capabilities descriptors
Date: Tue, 20 Jun 2023 13:24:48 -0400
Message-Id: <ddd201fc1ee529a90861aabdf0479e8b1d382bf3.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds description structures for all fixed-size PCIe Extended
Capabilities.

For every capability register group, only 2 registers are emulated
currently: Capability ID (16 bit) and Next Capability Offset/Version (16
bit). Both needed to implement selective capability hiding. All other
registers are passed through at the moment (unless they belong to
a "hardwired" capability which is hidden)

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/xen/xen_pt_config_init.c | 183 ++++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 20b5561d25..69d8857c66 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1669,6 +1669,37 @@ static XenPTRegInfo xen_pt_ext_cap_emu_reg_vendor[] = {
         .size = 0,
     },
 };
+
+/* Common reg static information table for all passthru-type
+ * PCIe Extended Capabilities. Only Extended Cap ID and
+ * Next pointer are handled (to support capability hiding).
+ */
+static XenPTRegInfo xen_pt_ext_cap_emu_reg_dummy[] = {
+    {
+        .offset     = XEN_PCIE_CAP_ID,
+        .size       = 2,
+        .init_val   = 0x0000,
+        .ro_mask    = 0xFFFF,
+        .emu_mask   = 0xFFFF,
+        .init       = xen_pt_ext_cap_capid_reg_init,
+        .u.w.read   = xen_pt_word_reg_read,
+        .u.w.write  = xen_pt_word_reg_write,
+    },
+    {
+        .offset     = XEN_PCIE_CAP_LIST_NEXT,
+        .size       = 2,
+        .init_val   = 0x0000,
+        .ro_mask    = 0xFFFF,
+        .emu_mask   = 0xFFFF,
+        .init       = xen_pt_ext_cap_ptr_reg_init,
+        .u.w.read   = xen_pt_word_reg_read,
+        .u.w.write  = xen_pt_word_reg_write,
+    },
+    {
+        .size = 0,
+    },
+};
+
 /****************************
  * Capabilities
  */
@@ -1945,6 +1976,158 @@ static const XenPTRegGroupInfo xen_pt_emu_reg_grps[] = {
         .size_init   = xen_pt_ext_cap_vendor_size_init,
         .emu_regs    = xen_pt_ext_cap_emu_reg_vendor,
     },
+    /* Device Serial Number Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_DSN),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_DSN_SIZEOF,       /*0x0C*/
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Power Budgeting Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_PWR),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_PWR_SIZEOF,       /*0x10*/
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Root Complex Internal Link Control Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_RCILC),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x0C,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Root Complex Event Collector Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_RCEC),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x08,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Root Complex Register Block Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_RCRB),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x14,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Configuration Access Correlation Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_CAC),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x08,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Alternate Routing ID Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_ARI),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_ARI_SIZEOF,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Address Translation Services Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_ATS),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_ATS_SIZEOF,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Single Root I/O Virtualization Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_SRIOV),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_SRIOV_SIZEOF,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Page Request Interface Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_PRI),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_PRI_SIZEOF,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Latency Tolerance Reporting Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_LTR),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_LTR_SIZEOF,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Secondary PCIe Capability Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_SECPCI),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x10,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Process Address Space ID Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_PASID),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_PASID_SIZEOF,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* L1 PM Substates Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_L1SS),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x10,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Precision Time Measurement Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_PTM),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x0C,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* M-PCIe Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(0x20),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x1C,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* LN Requester (LNR) Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(0x1C),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x08,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Function Readiness Status (FRS) Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(0x21),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x10,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Readiness Time Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(0x22),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x0C,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
     {
         .grp_size = 0,
     },
-- 
2.34.1


