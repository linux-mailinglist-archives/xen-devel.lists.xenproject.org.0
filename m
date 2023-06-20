Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A26D7372BF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:26:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552066.861940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7O-00062U-Bs; Tue, 20 Jun 2023 17:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552066.861940; Tue, 20 Jun 2023 17:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7O-0005zo-8v; Tue, 20 Jun 2023 17:26:14 +0000
Received: by outflank-mailman (input) for mailman id 552066;
 Tue, 20 Jun 2023 17:26:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7M-0004q1-OZ
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:12 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bddd98e-0f8f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:26:10 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-763a8918cbeso155210185a.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:10 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:08 -0700 (PDT)
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
X-Inumbo-ID: 8bddd98e-0f8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281969; x=1689873969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxaTb/29l3CebuyhwApqyR6VcKjgYqFWVhZRRk7NUds=;
        b=UFwApTqEw15ynGiEMn4zGI1aRFSQUGsmKdhJK7bY8DvDybKXYs/QI0p/LA5BZIs0eo
         r4K3I7UnCrrl4ZIipvzffx4/tipAi6+P7+pjmEQi23LTYqE8nBmFG/9rdPuiN9zFzt9M
         UnDbRDx4B509g2OsHTMYvs6QnAcLHZ6xyNsN1ZmQDHcNDbOvIGQdiI2rRNmFwXzbmaEJ
         4ma5FkfJ73AyHagCUq4UUuGWnk4Skt3LBSLD2io6CYEmHhdm9lXfxTwNLXs3mxlSuArE
         FJXjdyn8A7I1jaWErgjnbUBY9TRfRhVuuT4ZpQkxrVzKFWtmmgF8E4VkQHjeVaNSpUNK
         eTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281969; x=1689873969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxaTb/29l3CebuyhwApqyR6VcKjgYqFWVhZRRk7NUds=;
        b=bZxfuHC/9MOMf+BdXVDIXWYd05uabOZFRdDtGb6/aMj1z2JljG9mRagne2gUqxIAS7
         Wfzi0I2P3qKLh5GPUdbD5XFbntgTTT/dpiVZduFXo9T0yneDA8e8AInMDo6QxCuKLKiP
         KvQi5yBxpauI/aRYgBltWsIwm6BogNobpj47ikE8MM7OvZKiCb/yLg4cvxF3oKE6yUaS
         kLqEOF4qmfIGSqcaLeeOkxV195StqmQRL8Ufw8DITk6Q0KFZ2dFNJ4U0Aj+P9hrikEHv
         CzineQOGsq6FDcG74R//0w1LetPYPHu7zpfKtPBIxSuAU25PQccp91AadxDVgGu+dbn4
         hfnQ==
X-Gm-Message-State: AC+VfDzrrcHv50i1gw1YF5qMWlJPkBgThfsUZskRDKr+c2in8X5kGqnZ
	yERjAXg7u8gWM3M4Exntte8=
X-Google-Smtp-Source: ACHHUZ7qEQizJx1HhPJarTNwVXdhkGcdKmod3Rc2GPN945a78/sJmry1z4uw6lP6dXJOmmKm7jBB9w==
X-Received: by 2002:a05:620a:25c8:b0:763:b475:90ef with SMTP id y8-20020a05620a25c800b00763b47590efmr1998867qko.69.1687281969191;
        Tue, 20 Jun 2023 10:26:09 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 07/23] xen/pt: avoid reading PCIe device type and cap version multiple times
Date: Tue, 20 Jun 2023 13:24:41 -0400
Message-Id: <a5a163f1ab4e90f07e6c9c316ba395dbceaa3d3c.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_pt_config_init.c reads Device/Port Type and Capability version fields
in many places. Two functions are used for this purpose:
get_capability_version and get_device_type. These functions perform PCI
conf space reading every time they're called. Another bad thing is that
these functions know nothing about where PCI Expess Capability is located,
so its offset must be provided explicitly in function arguments. Their
typical usage is like this:
    uint8_t cap_ver = get_capability_version(s, real_offset - reg->offset);
    uint8_t dev_type = get_device_type(s, real_offset - reg->offset);

To avoid this, the PCI Express Capability register now being read only
once and stored in  XenHostPCIDevice structure (pcie_flags field). The
capabiliy offset parameter is no longer needed, simplifying functions
usage. Also, get_device_type and get_capability_version were renamed
to more descriptive get_pcie_device_type and get_pcie_capability_version.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/xen/xen-host-pci-device.c | 15 +++++++++++++++
 hw/xen/xen-host-pci-device.h |  1 +
 hw/xen/xen_pt_config_init.c  | 34 ++++++++++++++--------------------
 3 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
index a7021a5d56..63481a859e 100644
--- a/hw/xen/xen-host-pci-device.c
+++ b/hw/xen/xen-host-pci-device.c
@@ -405,6 +405,7 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
 {
     ERRP_GUARD();
     unsigned int v;
+    int pcie_cap_pos;
 
     d->config_fd = -1;
     d->domain = domain;
@@ -449,6 +450,20 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
     d->is_virtfn         = xen_host_pci_dev_is_virtfn(d);
     d->has_pcie_ext_caps = xen_host_pci_dev_has_pcie_ext_caps(d);
 
+    /* read and store PCIe Capabilities field for later use */
+    pcie_cap_pos = xen_host_pci_find_next_cap(d, 0, PCI_CAP_ID_EXP);
+
+    if (pcie_cap_pos) {
+        if (xen_host_pci_get_word(d, pcie_cap_pos + PCI_EXP_FLAGS,
+                                  &d->pcie_flags)) {
+            error_setg(errp, "Unable to read from PCI Express capability "
+                       "structure at 0x%x", pcie_cap_pos);
+            goto error;
+        }
+    } else {
+        d->pcie_flags = 0xFFFF;
+    }
+
     return;
 
 error:
diff --git a/hw/xen/xen-host-pci-device.h b/hw/xen/xen-host-pci-device.h
index 37c5614a24..2884c4b4b9 100644
--- a/hw/xen/xen-host-pci-device.h
+++ b/hw/xen/xen-host-pci-device.h
@@ -27,6 +27,7 @@ typedef struct XenHostPCIDevice {
     uint16_t device_id;
     uint32_t class_code;
     int irq;
+    uint16_t pcie_flags;
 
     XenHostPCIIORegion io_regions[PCI_NUM_REGIONS - 1];
     XenHostPCIIORegion rom;
diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 2b8680b112..47c8482f32 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -832,24 +832,18 @@ static XenPTRegInfo xen_pt_emu_reg_vendor[] = {
  * PCI Express Capability
  */
 
-static inline uint8_t get_capability_version(XenPCIPassthroughState *s,
-                                             uint32_t offset)
+static inline uint8_t get_pcie_capability_version(XenPCIPassthroughState *s)
 {
-    uint8_t flag;
-    if (xen_host_pci_get_byte(&s->real_device, offset + PCI_EXP_FLAGS, &flag)) {
-        return 0;
-    }
-    return flag & PCI_EXP_FLAGS_VERS;
+    assert(s->real_device.pcie_flags != 0xFFFF);
+
+    return (uint8_t) (s->real_device.pcie_flags & PCI_EXP_FLAGS_VERS);
 }
 
-static inline uint8_t get_device_type(XenPCIPassthroughState *s,
-                                      uint32_t offset)
+static inline uint8_t get_pcie_device_type(XenPCIPassthroughState *s)
 {
-    uint8_t flag;
-    if (xen_host_pci_get_byte(&s->real_device, offset + PCI_EXP_FLAGS, &flag)) {
-        return 0;
-    }
-    return (flag & PCI_EXP_FLAGS_TYPE) >> 4;
+    assert(s->real_device.pcie_flags != 0xFFFF);
+
+    return (uint8_t) ((s->real_device.pcie_flags & PCI_EXP_FLAGS_TYPE) >> 4);
 }
 
 /* initialize Link Control register */
@@ -857,8 +851,8 @@ static int xen_pt_linkctrl_reg_init(XenPCIPassthroughState *s,
                                     XenPTRegInfo *reg, uint32_t real_offset,
                                     uint32_t *data)
 {
-    uint8_t cap_ver = get_capability_version(s, real_offset - reg->offset);
-    uint8_t dev_type = get_device_type(s, real_offset - reg->offset);
+    uint8_t cap_ver  = get_pcie_capability_version(s);
+    uint8_t dev_type = get_pcie_device_type(s);
 
     /* no need to initialize in case of Root Complex Integrated Endpoint
      * with cap_ver 1.x
@@ -875,7 +869,7 @@ static int xen_pt_devctrl2_reg_init(XenPCIPassthroughState *s,
                                     XenPTRegInfo *reg, uint32_t real_offset,
                                     uint32_t *data)
 {
-    uint8_t cap_ver = get_capability_version(s, real_offset - reg->offset);
+    uint8_t cap_ver = get_pcie_capability_version(s);
 
     /* no need to initialize in case of cap_ver 1.x */
     if (cap_ver == 1) {
@@ -890,7 +884,7 @@ static int xen_pt_linkctrl2_reg_init(XenPCIPassthroughState *s,
                                      XenPTRegInfo *reg, uint32_t real_offset,
                                      uint32_t *data)
 {
-    uint8_t cap_ver = get_capability_version(s, real_offset - reg->offset);
+    uint8_t cap_ver = get_pcie_capability_version(s);
     uint32_t reg_field = 0;
 
     /* no need to initialize in case of cap_ver 1.x */
@@ -1590,8 +1584,8 @@ static int xen_pt_pcie_size_init(XenPCIPassthroughState *s,
                                  uint32_t base_offset, uint8_t *size)
 {
     PCIDevice *d = PCI_DEVICE(s);
-    uint8_t version = get_capability_version(s, base_offset);
-    uint8_t type = get_device_type(s, base_offset);
+    uint8_t version = get_pcie_capability_version(s);
+    uint8_t type = get_pcie_device_type(s);
     uint8_t pcie_size = 0;
 
 
-- 
2.34.1


