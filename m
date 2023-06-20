Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D057372E7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552121.862070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAg-00048i-5M; Tue, 20 Jun 2023 17:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552121.862070; Tue, 20 Jun 2023 17:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAf-00044W-Vz; Tue, 20 Jun 2023 17:29:37 +0000
Received: by outflank-mailman (input) for mailman id 552121;
 Tue, 20 Jun 2023 17:29:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7j-0004q1-5N
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:35 +0000
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [2607:f8b0:4864:20::112d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9927badf-0f8f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:26:32 +0200 (CEST)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-561b7729a12so88482187b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:32 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:31 -0700 (PDT)
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
X-Inumbo-ID: 9927badf-0f8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281991; x=1689873991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtxBS4t7Cp6zwlgH6yFPLtcHEBS+l3bJvetWgivlgAc=;
        b=DXr1jJKf7Pnlc0opub8mlP8txDB++zKhqESKRyN5fEU/XmhzGk0Ki4Pgl0faNoVtIp
         9MVCQzOaaYq9Hafn00UmZw0xdLJv/Y+B/4KkvWPiSqIWM0G6n20EJX52qbK2hpf6aX8m
         VDfU8rjLroEhv8iPcEaV3/cfwx+epSNs1PBG8UUWPukiReaCYRd3fhbHAr++IpPrRHEx
         7XjvEz+gRa4OveWFoJTqEg3KncaTM1bX0Za+tf05gn17TvkPoZ9JxORSmhvGEn2O+VCL
         v7HKZOb9XKZJVXJoLLIOF1wZH8LH4n4ZvvfDWHj/tMJ9JW/g1OCOcEbQMQTxeS5XPML7
         TsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281991; x=1689873991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtxBS4t7Cp6zwlgH6yFPLtcHEBS+l3bJvetWgivlgAc=;
        b=P7Ou51Q+Yt6yN+xL2X9AIV+UlG9JxxI86fAexHH7N4ZdM/fdgzHjfkDRLPOlS4U5sC
         a3t/nACXbj+CDaQgPVynp6uuJEgT//FA09ehIERR0MgVJfvzKhbNP96DBd7b3wJ9UdAj
         cgy1BNg/4ju8UhoXVvw3WmcF0puQiORsZkLmoPUNo+ke2kwatupt1J3qt5LJom+VnW2b
         YX8wjxxUjkbIPuaP3dNfnOz8h1jadsdAUsbl3fRi5DNFKRv/4iBIGadMMCDAHe/lXpN0
         TDENpV9M2PKFh5AicjBZCAqQ/a9DcSKxvYjZHTiR2JLiMZj57reyqyf9LTglIuedRp+3
         7llw==
X-Gm-Message-State: AC+VfDy3FZ3wVSfgO9CYJHoR+0QFOmLKNYyNTqyWZo7JbCiS1rmXWXF9
	3qrux4gFnHMIZX+RY2E1M7A=
X-Google-Smtp-Source: ACHHUZ5bilXSKSkByz0RaH7wiwsEk1kQjzttcfCjKeTvwtAuolFbt15zpQmnjABm1+bdn7RNwdCaMQ==
X-Received: by 2002:a0d:ccc3:0:b0:56c:e480:2b2b with SMTP id o186-20020a0dccc3000000b0056ce4802b2bmr21843674ywd.12.1687281991477;
        Tue, 20 Jun 2023 10:26:31 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 18/23] xen/pt: add VC/VC9/MFVC PCIe Extended Capabilities descriptors and sizing
Date: Tue, 20 Jun 2023 13:24:52 -0400
Message-Id: <3cc4807a182443d70c560090828f780719a531cf.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Virtual Channel/MFVC capabilities are relatively useless for emulation
(passing through accesses to them should be enough in most cases) yet they
have hardest format of all PCIe Extended Capabilities, mostly because
VC capability format allows the sparse config space layout with gaps
between the parts which make up the VC capability.

We have the main capability body followed by variable number of entries
where each entry may additionally reference the arbitration table outside
main capability body. There are no constrains on these arbitration table
offsets -- in theory, they may reside outside the VC capability range
anywhere in PCIe extended config space. Also, every arbitration table size
is not fixed - it depends on current VC/Port Arbitration Select field
value.

To simplify things, this patch assume that changing VC/Port Arbitration
Select value (i.e. resizing arbitration tables) do not cause arbitration
table offsets to change. Normally the device must place arbitration tables
considering their maximum size, not current one. Maximum arbitration table
size depends on VC/Port Arbitration Capability bitmask -- this is what
actually used to calculate the arbitration table size.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/xen/xen_pt_config_init.c | 191 ++++++++++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index c5157ee3ee..4e14adf2b2 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -2114,6 +2114,173 @@ static int xen_pt_ext_cap_rebar_size_init(XenPCIPassthroughState *s,
     return ret;
 }
 
+/* get VC/VC9/MFVC Extended Capability register group size */
+static uint32_t get_arb_table_len_max(XenPCIPassthroughState *s,
+                                      uint32_t max_bit_supported,
+                                      uint32_t arb_cap)
+{
+    int n_bit;
+    uint32_t table_max_size = 0;
+
+    if (!arb_cap) {
+        return 0;
+    }
+
+    for (n_bit = 7; n_bit >= 0 && !(arb_cap & (1 << n_bit)); n_bit--);
+
+    if (n_bit > max_bit_supported) {
+        XEN_PT_ERR(&s->dev, "Warning: encountered unknown VC arbitration "
+                   "capability supported: 0x%02x\n", (uint8_t) arb_cap);
+    }
+
+    switch (n_bit) {
+    case 0: break;
+    case 1: return 32;
+    case 2: return 64;
+    case 3: /*128 too*/
+    case 4: return 128;
+    default:
+        table_max_size = 8 << n_bit;
+    }
+
+    return table_max_size;
+}
+
+#define GET_ARB_TABLE_OFFSET(x)           (((x) >> 24) * 0x10)
+#define GET_VC_ARB_CAPABILITY(x)          ((x) & 0xFF)
+#define ARB_TABLE_ENTRY_SIZE_BITS(x)      (1 << (((x) & PCI_VC_CAP1_ARB_SIZE)\
+                                          >> 10))
+static int xen_pt_ext_cap_vchan_size_init(XenPCIPassthroughState *s,
+                                          const XenPTRegGroupInfo *grp_reg,
+                                          uint32_t base_offset,
+                                          uint32_t *size)
+{
+    uint32_t header;
+    uint32_t vc_cap_max_size = PCIE_CONFIG_SPACE_SIZE - base_offset;
+    uint32_t next_ptr;
+    uint32_t arb_table_start_max = 0, arb_table_end_max = 0;
+    uint32_t port_vc_cap1, port_vc_cap2, vc_rsrc_cap;
+    uint32_t ext_vc_count = 0;
+    uint32_t arb_table_entry_size;  /* in bits */
+    const char *cap_name;
+    int ret;
+    int i;
+
+    ret = xen_host_pci_get_long(&s->real_device, base_offset, &header);
+    if (ret) {
+        goto err_read;
+    }
+
+    next_ptr = PCI_EXT_CAP_NEXT(header);
+
+    switch (PCI_EXT_CAP_ID(header)) {
+    case PCI_EXT_CAP_ID_VC:
+    case PCI_EXT_CAP_ID_VC9:
+        cap_name = "Virtual Channel";
+        break;
+    case PCI_EXT_CAP_ID_MFVC:
+        cap_name = "Multi-Function VC";
+        break;
+    default:
+        XEN_PT_ERR(&s->dev, "Unknown VC Extended Capability ID "
+                   "encountered: 0x%04x\n", PCI_EXT_CAP_ID(header));
+        return -1;
+    }
+
+    if (next_ptr && next_ptr > base_offset) {
+        vc_cap_max_size = next_ptr - base_offset;
+    }
+
+    ret = xen_host_pci_get_long(&s->real_device,
+                                base_offset + PCI_VC_PORT_CAP1,
+                                &port_vc_cap1);
+    if (ret) {
+        goto err_read;
+    }
+
+    ret = xen_host_pci_get_long(&s->real_device,
+                                base_offset + PCI_VC_PORT_CAP2,
+                                &port_vc_cap2);
+    if (ret) {
+        goto err_read;
+    }
+
+    ext_vc_count = port_vc_cap1 & PCI_VC_CAP1_EVCC;
+
+    arb_table_start_max = GET_ARB_TABLE_OFFSET(port_vc_cap2);
+
+    /* check arbitration table offset for validity */
+    if (arb_table_start_max >= vc_cap_max_size) {
+        XEN_PT_ERR(&s->dev, "Warning: VC arbitration table offset points "
+                   "outside the expected range: %#04x\n",
+                   (uint16_t) arb_table_start_max);
+        /* skip this arbitration table */
+        arb_table_start_max = 0;
+    }
+
+    if (arb_table_start_max) {
+        uint32_t vc_arb_cap = GET_VC_ARB_CAPABILITY(port_vc_cap2);
+        uint32_t num_phases = get_arb_table_len_max(s, 3, vc_arb_cap);
+        uint32_t arb_tbl_sz = QEMU_ALIGN_UP(num_phases * 4, 32) / 8;
+
+        arb_table_end_max = base_offset + arb_table_start_max + arb_tbl_sz;
+    }
+
+    /* get Function/Port Arbitration Table Entry size */
+    arb_table_entry_size = ARB_TABLE_ENTRY_SIZE_BITS(port_vc_cap1);
+
+    /* process all VC Resource entries */
+    for (i = 0; i < ext_vc_count; i++) {
+        uint32_t arb_table_offset;
+
+        /* read VC Resource Capability */
+        ret = xen_host_pci_get_long(&s->real_device,
+            base_offset + PCI_VC_RES_CAP + i * PCI_CAP_VC_PER_VC_SIZEOF,
+            &vc_rsrc_cap);
+        if (ret) {
+            goto err_read;
+        }
+
+        arb_table_offset = GET_ARB_TABLE_OFFSET(vc_rsrc_cap);
+
+        if (arb_table_offset > arb_table_start_max) {
+            /* check arbitration table offset for validity */
+            if (arb_table_offset >= vc_cap_max_size) {
+                XEN_PT_ERR(&s->dev, "Warning: Port/Function arbitration table "
+                           "offset points outside the expected range: %#04x\n",
+                           (uint16_t) arb_table_offset);
+                /* skip this arbitration table */
+                arb_table_offset = 0;
+            } else {
+                arb_table_start_max = arb_table_offset;
+            }
+
+            if (arb_table_offset) {
+                uint32_t vc_arb_cap = GET_VC_ARB_CAPABILITY(vc_rsrc_cap);
+                uint32_t num_phases = get_arb_table_len_max(s, 5, vc_arb_cap);
+                uint32_t arb_tbl_sz =
+                    QEMU_ALIGN_UP(num_phases * arb_table_entry_size, 32) / 8;
+
+                arb_table_end_max = base_offset + arb_table_offset + arb_tbl_sz;
+            }
+        }
+    }
+
+    if (arb_table_end_max) {
+        *size = arb_table_end_max - base_offset;
+    } else {
+        *size = PCI_CAP_VC_BASE_SIZEOF +
+                ext_vc_count * PCI_CAP_VC_PER_VC_SIZEOF;
+    }
+
+    log_pcie_extended_cap(s, cap_name, base_offset, *size);
+    return 0;
+
+err_read:
+    XEN_PT_ERR(&s->dev, "Error while reading VC Extended Capability\n");
+    return ret;
+}
+
 static const XenPTRegGroupInfo xen_pt_emu_reg_grps[] = {
     /* Header Type0 reg group */
     {
@@ -2452,6 +2619,30 @@ static const XenPTRegGroupInfo xen_pt_emu_reg_grps[] = {
         .grp_size   = 0xFF,
         .size_init  = xen_pt_ext_cap_rebar_size_init,
     },
+    /* Virtual Channel Extended Capability reg group (2) */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_VC),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_vchan_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Virtual Channel Extended Capability reg group (9) */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_VC9),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_vchan_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Multi-Function Virtual Channel Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_MFVC),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_vchan_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
     {
         .grp_size = 0,
     },
-- 
2.34.1


