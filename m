Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B07372E0
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:29:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552101.862010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAT-0002Fn-5a; Tue, 20 Jun 2023 17:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552101.862010; Tue, 20 Jun 2023 17:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAS-0002DQ-W2; Tue, 20 Jun 2023 17:29:24 +0000
Received: by outflank-mailman (input) for mailman id 552101;
 Tue, 20 Jun 2023 17:29:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7Y-0004q1-MX
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:24 +0000
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [2607:f8b0:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9329ca32-0f8f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:26:22 +0200 (CEST)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6b57d9043e4so1892872a34.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:22 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:20 -0700 (PDT)
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
X-Inumbo-ID: 9329ca32-0f8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281981; x=1689873981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K61wLAMvxduhXajLJmXKkCD2KgQmA24lyEh8ZOauW3g=;
        b=IX6OWGyMDuquswGxYoFJvDL0Ts6f749+YDHQGq/VK7v6MzucLGn3mJLNRgyBXD73nh
         I/uap9v+a/tpM5eiSkd2OkS0iQARyHW6tg8ULcTLPED98ouQUyuWH2UQR8ZlORK0Cr6B
         BDgLegkcEOk635hmIGl+Bwtfz5e1hT96JE/JDmGP0Bqw0e7cIkLr/RU266DuT5tbGceb
         zRUNYzhZb93MyWsSOjfGJeeGl5aBmP4hUNJ3PbRSOE6eRw3nAOQED29dYWIme6OHtNXm
         5ulmEwaOXRsnulp5JjUk1Y9/q/G60rjQqvx5duoVQR4CjtOtUdcENi3WHS3YKVj8zhvS
         WFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281981; x=1689873981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K61wLAMvxduhXajLJmXKkCD2KgQmA24lyEh8ZOauW3g=;
        b=djD44MFWJm0v3nw6RQEDi/69ILS2qwgrWYKx6HZRor/NOJHXsut8FtzKC4xP1Dldv4
         cBqk4kHLZZuxhh8BJKN9mQx77OS5KD2gZ5cAKSXocXYyNsq+rmgxetLxAbYOICshjATd
         VYT6MntJQILChifhpusoF9Z1mACNLltcrH2yIuOQh3R4UUWWbEulZFihuFzIvWbQJAJz
         IAyqOz4JyPJkni9h1pTIl9WrlCM6adGfsH2IogsSUwxjmCvCs6+i/PNOJ7xQotnOAKmV
         iLfQP0f8HluwbV30cXvRD8eRGZVJMMM0GvpjrHJJMpJnuwrgLqkSJGVtnh8XFnn7XCTo
         wqiQ==
X-Gm-Message-State: AC+VfDyudPLOCvEykoZ3moXIQSeG+S/r7CXY1p+FdN3W5gOkru4qlfcd
	FLLHsC6ZHW89fveF+jNS4oo=
X-Google-Smtp-Source: ACHHUZ5spqw7iFHqYn8GRj32Nl0UI37k62ovrhkdOFMHxlCYXYMjF7pxPN/co2hG4xEewZ4G5pFXTg==
X-Received: by 2002:a05:6358:1a84:b0:130:e675:3e8c with SMTP id gm4-20020a0563581a8400b00130e6753e8cmr4571923rwb.28.1687281981240;
        Tue, 20 Jun 2023 10:26:21 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 13/23] xen/pt: add Vendor-specific PCIe Extended Capability descriptor and sizing
Date: Tue, 20 Jun 2023 13:24:47 -0400
Message-Id: <ead3c0639b91d0d0c12f91f3f1b4024547a9a0b4.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch provides Vendor-specific PCIe Extended Capability description
structure and corresponding sizing function. In this particular case the
size of the Vendor capability is available in the VSEC Length field.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/xen/xen_pt_config_init.c | 71 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index ed36edbc4a..20b5561d25 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -124,6 +124,17 @@ static uint32_t get_throughable_mask(const XenPCIPassthroughState *s,
     return throughable_mask & valid_mask;
 }
 
+static void log_pcie_extended_cap(XenPCIPassthroughState *s,
+                                  const char *cap_name,
+                                  uint32_t base_offset, uint32_t size)
+{
+    if (size) {
+        XEN_PT_LOG(&s->dev, "Found PCIe Extended Capability: %s at 0x%04x, "
+                            "size 0x%x bytes\n", cap_name,
+                            (uint16_t) base_offset, size);
+    }
+}
+
 /****************
  * general register functions
  */
@@ -1622,6 +1633,42 @@ static XenPTRegInfo xen_pt_emu_reg_igd_opregion[] = {
     },
 };
 
+/* Vendor-specific Ext Capability Structure reg static information table */
+static XenPTRegInfo xen_pt_ext_cap_emu_reg_vendor[] = {
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
+        .offset     = PCI_VNDR_HEADER,
+        .size       = 4,
+        .init_val   = 0x00000000,
+        .ro_mask    = 0xFFFFFFFF,
+        .emu_mask   = 0x00000000,
+        .init       = xen_pt_common_reg_init,
+        .u.dw.read  = xen_pt_long_reg_read,
+        .u.dw.write = xen_pt_long_reg_write,
+    },
+    {
+        .size = 0,
+    },
+};
 /****************************
  * Capabilities
  */
@@ -1647,9 +1694,23 @@ static int xen_pt_vendor_size_init(XenPCIPassthroughState *s,
     return ret;
 }
 
+static int xen_pt_ext_cap_vendor_size_init(XenPCIPassthroughState *s,
+                                           const XenPTRegGroupInfo *grp_reg,
+                                           uint32_t base_offset,
+                                           uint32_t *size)
 {
-    return xen_host_pci_get_byte(&s->real_device, base_offset + 0x02, size);
+    uint32_t vsec_hdr = 0;
+    int ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + PCI_VNDR_HEADER,
+                                    &vsec_hdr);
+
+    *size = PCI_VNDR_HEADER_LEN(vsec_hdr);
+
+    log_pcie_extended_cap(s, "Vendor-specific", base_offset, *size);
+
+    return ret;
 }
+
 /* get PCI Express Capability Structure register group size */
 static int xen_pt_pcie_size_init(XenPCIPassthroughState *s,
                                  const XenPTRegGroupInfo *grp_reg,
@@ -1876,6 +1937,14 @@ static const XenPTRegGroupInfo xen_pt_emu_reg_grps[] = {
         .size_init   = xen_pt_reg_grp_size_init,
         .emu_regs    = xen_pt_emu_reg_igd_opregion,
     },
+    /* Vendor-specific Extended Capability reg group */
+    {
+        .grp_id      = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_VNDR),
+        .grp_type    = XEN_PT_GRP_TYPE_EMU,
+        .grp_size    = 0xFF,
+        .size_init   = xen_pt_ext_cap_vendor_size_init,
+        .emu_regs    = xen_pt_ext_cap_emu_reg_vendor,
+    },
     {
         .grp_size = 0,
     },
-- 
2.34.1


