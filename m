Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0767D7372E6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552119.862056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAd-0003YO-Qp; Tue, 20 Jun 2023 17:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552119.862056; Tue, 20 Jun 2023 17:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAd-0003UM-LX; Tue, 20 Jun 2023 17:29:35 +0000
Received: by outflank-mailman (input) for mailman id 552119;
 Tue, 20 Jun 2023 17:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7e-0004q1-Nr
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:30 +0000
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [2607:f8b0:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96d93a47-0f8f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:26:28 +0200 (CEST)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6b2a875b1bfso4234793a34.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:28 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:27 -0700 (PDT)
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
X-Inumbo-ID: 96d93a47-0f8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281987; x=1689873987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmwAG6Md0CC+XJeE9pl5kl+Q1W6gqDq1BcbgL+QyAho=;
        b=ojdkKj4dQV1QyhCxug8WoquBpw815OckKFl3hwP7HkoAoa2X4qJP17fjliqnsFTNMW
         ewK+iOGLtIsH/DmfNZ2Nmgz1yNLZvSJRxPH1raGXnZtXltujtz6NOZh2IAbOvEoUB5RU
         Gef26ixeDHQUyCt+MdLqn/Y8AtSbViaFTJQ+edeid3dtdVzA1HOG9Xu+ji71nnMHxcOs
         NiXNBpeYmlhi00nJEXWyOi5N165VFfwgDpzGJ1QRZ21tEhmepre01i/XdLlnPAs+F/T6
         ZPlOPJHormUgTF3gvYnZ4CIoouBD37NlVFXoNd9ezrTSxY1KxlZnNCwo8EeL7E2dz4fK
         ciWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281987; x=1689873987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmwAG6Md0CC+XJeE9pl5kl+Q1W6gqDq1BcbgL+QyAho=;
        b=PlnmObrfxuhFshFD+YHfXf2NlELwRlzzbkobzUaWoNJLWRKOe90irOeYsVFtQOXvQJ
         qZN0TfiPXBgp0apGFdVQ/GQntHJGikW+37vRCeqXy29s0dT2l8BJ56l2GmrhXri6HUa6
         7m7KAYaDQ5uNlsuszUXRKvg7+bLVgBuasGq1JblYhZgJONGm0Dd/S9NtkJC2AgDltrnA
         UwQQ2lu1P4bJzHA8hdf1HmjPsMXYHdOqsdHbzlbLh2UKlnF55zxAeaRZTJMSaLWda61G
         /91pb4XreEyIEW2dZ0kno9+0EVSM4iYKX6FUMcHOhjKGft1Vi4hYuPJk01S92Fhfa13F
         9eWw==
X-Gm-Message-State: AC+VfDxRc48slUsYH9YF8Yu8meSfZxcNNidPu/vUDiPVDYZ3Amo+j2r/
	KF+XyRqJrlq/8fpVnTdyCYJtyKcd1db3ow==
X-Google-Smtp-Source: ACHHUZ7OZCfrEKRiy1peK/z+7dOVkohj0K6JF3B4EUqAq6V/RhqJ229VE/MynC5WaUeVXsnaYNyELQ==
X-Received: by 2002:a05:6359:a12:b0:130:5951:b268 with SMTP id el18-20020a0563590a1200b001305951b268mr5880443rwb.31.1687281987530;
        Tue, 20 Jun 2023 10:26:27 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 16/23] xen/pt: add descriptors and size calculation for RCLD/ACS/PMUX/DPA/MCAST/TPH/DPC PCIe Extended Capabilities
Date: Tue, 20 Jun 2023 13:24:50 -0400
Message-Id: <fd6abb241857963498454da6cc0b448c2e8804a0.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add few more PCIe Extended Capabilities entries to the
xen_pt_emu_reg_grps[] array along with their corresponding *_size_init()
functions.

All these capabilities have non-fixed size but their size calculation
is very simple, hence adding them in a single batch.

For every capability register group, only 2 registers are emulated
currently: Capability ID (16 bit) and Next Capability Offset/Version (16
bit). Both needed to implement the selective capability hiding. All other
registers are passed through at the moment (unless they belong to
a capability marked as "hardwired" which is hidden)

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/xen/xen_pt_config_init.c | 224 ++++++++++++++++++++++++++++++++++++
 1 file changed, 224 insertions(+)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 9fd0531bc4..1fba0b9d6c 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1925,6 +1925,174 @@ static int xen_pt_ext_cap_aer_size_init(XenPCIPassthroughState *s,
     return ret;
 }
 
+/* get Root Complex Link Declaration Extended Capability register group size */
+#define RCLD_GET_NUM_ENTRIES(x)     (((x) >> 8) & 0xFF)
+static int xen_pt_ext_cap_rcld_size_init(XenPCIPassthroughState *s,
+                                         const XenPTRegGroupInfo *grp_reg,
+                                         uint32_t base_offset,
+                                         uint32_t *size)
+{
+    uint32_t elem_self_descr = 0;
+
+    int ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + 4,
+                                    &elem_self_descr);
+
+    *size = 0x10 + RCLD_GET_NUM_ENTRIES(elem_self_descr) * 0x10;
+
+    log_pcie_extended_cap(s, "Root Complex Link Declaration",
+                          base_offset, *size);
+    return ret;
+}
+
+/* get Access Control Services Extended Capability register group size */
+#define ACS_VECTOR_SIZE_BITS(x)    ((((x) >> 8) & 0xFF) ?: 256)
+static int xen_pt_ext_cap_acs_size_init(XenPCIPassthroughState *s,
+                                        const XenPTRegGroupInfo *grp_reg,
+                                        uint32_t base_offset,
+                                        uint32_t *size)
+{
+    uint16_t acs_caps = 0;
+
+    int ret = xen_host_pci_get_word(&s->real_device,
+                                    base_offset + PCI_ACS_CAP,
+                                    &acs_caps);
+
+    if (acs_caps & PCI_ACS_EC) {
+        uint32_t vector_sz = ACS_VECTOR_SIZE_BITS(acs_caps);
+
+        *size = PCI_ACS_EGRESS_CTL_V + ((vector_sz + 7) & ~7) / 8;
+    } else {
+        *size = PCI_ACS_EGRESS_CTL_V;
+    }
+
+    log_pcie_extended_cap(s, "ACS", base_offset, *size);
+    return ret;
+}
+
+/* get Multicast Extended Capability register group size */
+static int xen_pt_ext_cap_multicast_size_init(XenPCIPassthroughState *s,
+                                              const XenPTRegGroupInfo *grp_reg,
+                                              uint32_t base_offset,
+                                              uint32_t *size)
+{
+    uint8_t dev_type = get_pcie_device_type(s);
+
+    switch (dev_type) {
+    case PCI_EXP_TYPE_ENDPOINT:
+    case PCI_EXP_TYPE_LEG_END:
+    case PCI_EXP_TYPE_RC_END:
+    case PCI_EXP_TYPE_RC_EC:
+    default:
+        *size = PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF;
+        break;
+
+    case PCI_EXP_TYPE_ROOT_PORT:
+    case PCI_EXP_TYPE_UPSTREAM:
+    case PCI_EXP_TYPE_DOWNSTREAM:
+        *size = 0x30;
+        break;
+    }
+
+    log_pcie_extended_cap(s, "Multicast", base_offset, *size);
+    return 0;
+}
+
+/* get Dynamic Power Allocation Extended Capability register group size */
+static int xen_pt_ext_cap_dpa_size_init(XenPCIPassthroughState *s,
+                                        const XenPTRegGroupInfo *grp_reg,
+                                        uint32_t base_offset,
+                                        uint32_t *size)
+{
+    uint32_t dpa_caps = 0;
+    uint32_t num_entries;
+
+    int ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + PCI_DPA_CAP,
+                                    &dpa_caps);
+
+    num_entries = (dpa_caps & PCI_DPA_CAP_SUBSTATE_MASK) + 1;
+
+    *size = PCI_DPA_BASE_SIZEOF + num_entries /*byte-size registers*/;
+
+    log_pcie_extended_cap(s, "Dynamic Power Allocation", base_offset, *size);
+    return ret;
+}
+
+/* get TPH Requester Extended Capability register group size */
+static int xen_pt_ext_cap_tph_size_init(XenPCIPassthroughState *s,
+                                        const XenPTRegGroupInfo *grp_reg,
+                                        uint32_t base_offset,
+                                        uint32_t *size)
+{
+    uint32_t tph_caps = 0;
+    uint32_t num_entries;
+
+    int ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + PCI_TPH_CAP,
+                                    &tph_caps);
+
+    switch(tph_caps & PCI_TPH_CAP_LOC_MASK) {
+    case PCI_TPH_LOC_CAP:
+        num_entries = (tph_caps & PCI_TPH_CAP_ST_MASK) >> PCI_TPH_CAP_ST_SHIFT;
+        num_entries++;
+        break;
+
+    case PCI_TPH_LOC_NONE:
+    case PCI_TPH_LOC_MSIX:
+    default:
+        /* not in the capability */
+        num_entries = 0;
+    }
+
+    *size = PCI_TPH_BASE_SIZEOF + num_entries * 2;
+
+    log_pcie_extended_cap(s, "TPH Requester", base_offset, *size);
+    return ret;
+}
+
+/* get Downstream Port Containment Extended Capability register group size */
+static int xen_pt_ext_cap_dpc_size_init(XenPCIPassthroughState *s,
+                                        const XenPTRegGroupInfo *grp_reg,
+                                        uint32_t base_offset,
+                                        uint32_t *size)
+{
+    uint16_t dpc_caps = 0;
+
+    int ret = xen_host_pci_get_word(&s->real_device,
+                                    base_offset + PCI_EXP_DPC_CAP,
+                                    &dpc_caps);
+
+    if (dpc_caps & PCI_EXP_DPC_CAP_RP_EXT) {
+        *size = 0x20 + ((dpc_caps & PCI_EXP_DPC_RP_PIO_LOG_SIZE) >> 8) * 4;
+    } else {
+        *size = 0xC;
+    }
+
+    log_pcie_extended_cap(s, "Downstream Port Containment",
+                          base_offset, *size);
+    return ret;
+}
+
+/* get Protocol Multiplexing Extended Capability register group size */
+#define PMUX_GET_NUM_ENTRIES(x)     ((x) & 0x3F)
+static int xen_pt_ext_cap_pmux_size_init(XenPCIPassthroughState *s,
+                                         const XenPTRegGroupInfo *grp_reg,
+                                         uint32_t base_offset,
+                                         uint32_t *size)
+{
+    uint32_t pmux_caps = 0;
+
+    int ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + 4,
+                                    &pmux_caps);
+
+    *size = 0x10 + PMUX_GET_NUM_ENTRIES(pmux_caps) * 4;
+
+    log_pcie_extended_cap(s, "PMUX", base_offset, *size);
+    return ret;
+}
+
 static const XenPTRegGroupInfo xen_pt_emu_reg_grps[] = {
     /* Header Type0 reg group */
     {
@@ -2200,6 +2368,62 @@ static const XenPTRegGroupInfo xen_pt_emu_reg_grps[] = {
         .size_init  = xen_pt_ext_cap_aer_size_init,
         .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
     },
+    /* Root Complex Link Declaration Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_RCLD),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_rcld_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Access Control Services Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_ACS),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_acs_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Multicast Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_MCAST),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_multicast_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Dynamic Power Allocation Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_DPA),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_dpa_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* TPH Requester Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_TPH),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_tph_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Protocol Multiplexing Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_PMUX),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_pmux_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Downstream Port Containment Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_DPC),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_dpc_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
     {
         .grp_size = 0,
     },
-- 
2.34.1


