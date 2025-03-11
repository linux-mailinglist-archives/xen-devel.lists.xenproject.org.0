Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C3CA5BFD3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 12:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907957.1315148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryDf-0000Q8-R5; Tue, 11 Mar 2025 11:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907957.1315148; Tue, 11 Mar 2025 11:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryDf-0000Nn-Ny; Tue, 11 Mar 2025 11:56:23 +0000
Received: by outflank-mailman (input) for mailman id 907957;
 Tue, 11 Mar 2025 11:56:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WQE=V6=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1trxbR-00061U-95
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 11:16:53 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54932f69-fe6a-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 12:16:51 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30762598511so57568661fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 04:16:51 -0700 (PDT)
Received: from epuakyiw0a98.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae45fa8sm1755729e87.52.2025.03.11.04.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 04:16:49 -0700 (PDT)
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
X-Inumbo-ID: 54932f69-fe6a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741691810; x=1742296610; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B96UdKByw6q/7v0qR414AXSgvWpTAQ49fpaibtFfFYs=;
        b=Ld1T7HdYse4bHSpwXfIacLy+h+X30k1aUUxatCAwFgiyyuytBBPg6eyq/zIyEOTQFG
         WItagRCAkjfCncq8gW9conTf/rXS6Vf12f0gn32Yrzownf6ydfYiJJlEgsuthvrnAtL/
         4mf8Osru/mTy+y5jsqc8rG4rR+qlfoz5tx+vAxfVFBsmY9Y5yEHOkl24K/HWOW7sst74
         /Iie6R9C2PVJwybp+At/+JjUHyCzM6RBAtcL1pvf/D//eNCU6EwuprbRuqxHOCfLHFbd
         nnMztfZd03jaYBixZYiQLxjUYl3hWjGG+qyfTtWW86hEKphWMWkz1JHfTBvKEjnG+Ilh
         yhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691810; x=1742296610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B96UdKByw6q/7v0qR414AXSgvWpTAQ49fpaibtFfFYs=;
        b=nhWEBfMEnfV+deqhuWsJZ5VLawTamT6ohSqrxRznQWpLHZU2RoAAz0yGvrC+KHr+9F
         F3MIRgurKN1pmq5QrO+S8U8dXGXa1Dy/F2/FyS75UEkyr0JTYIZ9KB3UGeJVNqUkXDYa
         rf/BKQUmwmz2h0vLzBd3DzuVbCJ23G+m4wzidmIt6vxyLh0h84e58AqER1lHRWheCJmE
         4nbwS3I/UHyrnXBYwNpV+iBPb/9aht1mtBYS94h2S4syDFyPRGWbhBvfVQtqS8zNZBP2
         mtDdcv5UsehWAxKjFMw5XjgfUZZkJ/idoKFh+phQEu9xq+lzJI5wPuqGDdUei96zXje4
         9lcA==
X-Gm-Message-State: AOJu0YzFSgtWZ8PNrLzJQEhlSLeiuFi3zD2VnlC5RX78vvogKVjWFohZ
	OvaEQpvNgJGt49T3kasWCwdcIengbnTnFH2oEI03eE1IPcX9kH0drIx1QQ==
X-Gm-Gg: ASbGncsPv6kte7hD1Kp9g4Tx/4V3vRQYslXLqPno8klrzC7N8glS4WY2+as738UulcR
	rBLkVeMVL/+65KZIE0R/BNHwpzhjL3gXfdL7akYW+Q9NHKZ1xmCIMHEakemCEIvJB1klCCxlgge
	ZkzAuykriFRV5ssOQ/nVMnGEhUCsk6zWQgkh6NykwnrL0l3JxPvpgdW5GVtePvo8AQde4Te0w7N
	evamUpqROGaBuOubLy6ewhH/PF5/tdo3YwugVyjx8ZTyulEUtsr4wvZ6WRoNTboURx9D0X7H7tr
	nRXmlVbP08mavvW6/cmOQTBal8BX7K5ODSYFYyhhDXF0XfHcK1D75NToJg2YXn3L4FSt0CiPTsG
	nFZHdomZp0rKM9nfxaTRDilrtuVE=
X-Google-Smtp-Source: AGHT+IF64v2hXGQ00z9GVEJ8U68hv2KGBZFKEJQrCkpVVAWcuKQkSvBRVsWQkqHjxbSg/SHD3m9UlA==
X-Received: by 2002:a05:6512:b14:b0:544:11cf:10c1 with SMTP id 2adb3069b0e04-54990e641efmr6135062e87.30.1741691809824;
        Tue, 11 Mar 2025 04:16:49 -0700 (PDT)
From: Grygorii Strashko <gragst.linux@gmail.com>
X-Google-Original-From: Grygorii Strashko <grygorii_strashko@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"Roger Pau Monne" <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [RFC PATCH v3 7/7] xen/arm: scmi: generate scmi dt node for DomUs
Date: Tue, 11 Mar 2025 13:16:18 +0200
Message-Id: <20250311111618.1850927-8-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311111618.1850927-1-grygorii_strashko@epam.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

This feature introduces SCMI support for DomU domains with partial SCMI DT
node generation.
During domain creation the following prerequisites are expected:

 - SCMI node template in partial device-tree, which should contain all
 subnodes used by DomU:

/ {
    firmware {
            scmi {
                    scmi_reset: protocol@19 {
			\#reset-cells = <1>;
                    };
                    scmi_clk: protocol@14 {
			\#clock-cells = <1>;
		    };
                    scmi_pinctrl: protocol@19 {
                            sdio_mux: mux {
                            };
                            mux1: mux1 {
                            };
                    };
            };
    };

    passthrough {
            sdio {
                    pinctrl-0 = <&sdio_mux>;
                    resets = <&scmi_reset 0x1>;
                    clocks = <&scmi_clk 0x1>;
            };
	    dev1 {
                 resets = <&scmi_reset 2>;
                 pinctrl-0 = <&mux1>;
            };
   };
};

 - properly defined "arm_sci" property in domain xl.cfg:

 arm_sci = "type=scmi_smc_multiagent,agent_id=2"

 - Platform/Xen DT exposed to Dom0 through Xen hypfs.

The Xen toolstack:

- obtains from Xen information about phys address of the SCMI shmem and
SMC/HVC id used by specified SCMI agent_id (domctl
XEN_DOMCTL_get_sci_info)

- creates the SCMI shmem node in domain DT using predefined guest MMIO
mappings and DT phandle

	GUEST_SCI_SHMEM_BASE xen_mk_ullong(0x22001000)
	GUEST_SCI_SHMEM_SIZE xen_mk_ullong(0x01000)
	GUEST_PHANDLE_SCMI (GUEST_PHANDLE_IOMMU + 1)

- creates SCMI node in domain DT with:
  - "shmem" phandle sets to GUEST_PHANDLE_SCMI
  - "arm,smc-id" sets to SMC/HVC id obtained from Xen
  - parses partial device tree and creates corresponding SCMI subnodes in
  domain DT. All SCMI subnodes properties are copied from Xen DT except
  phandles, which are taken from partial DT.

- maps the SCMI shmem into DomU GUEST_SCI_SHMEM_BASE address.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 tools/include/xenctrl.h                     |   3 +
 tools/libs/ctrl/xc_domain.c                 |  18 ++
 tools/libs/light/libxl_arm.c                | 294 +++++++++++++++++++-
 tools/libs/light/libxl_create.c             |  12 +
 tools/libs/light/libxl_internal.h           |   3 +
 xen/arch/arm/domctl.c                       |  22 ++
 xen/arch/arm/firmware/scmi-smc-multiagent.c |   2 +
 xen/arch/arm/include/asm/domain.h           |   6 +
 xen/include/public/arch-arm.h               |   4 +
 xen/include/public/device_tree_defs.h       |   1 +
 xen/include/public/domctl.h                 |  11 +
 11 files changed, 365 insertions(+), 11 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 495598123133..54a93431641a 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1205,6 +1205,9 @@ int xc_domain_getvnuma(xc_interface *xch,
 int xc_domain_soft_reset(xc_interface *xch,
                          uint32_t domid);
 
+int xc_domain_get_sci_info(xc_interface *xch, uint32_t domid,
+                           uint64_t *paddr, uint32_t *func_id);
+
 #if defined(__i386__) || defined(__x86_64__)
 /*
  * PC BIOS standard E820 types and structure.
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 2ddc3f4f426d..f4ffab2021cd 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -2229,6 +2229,24 @@ out:
 
     return ret;
 }
+
+int xc_domain_get_sci_info(xc_interface *xch, uint32_t domid,
+                            uint64_t *paddr, uint32_t *func_id)
+{
+    struct xen_domctl domctl = {};
+
+    memset(&domctl, 0, sizeof(domctl));
+    domctl.cmd = XEN_DOMCTL_get_sci_info;
+    domctl.domain = domid;
+
+    if ( do_domctl(xch, &domctl) != 0 )
+        return 1;
+
+    *paddr = domctl.u.sci_info.paddr;
+    *func_id = domctl.u.sci_info.func_id;
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index cdf5edb299af..cc54abc1ea79 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -9,6 +9,7 @@
 #include <libfdt.h>
 #include <assert.h>
 #include <xen/device_tree_defs.h>
+#include <xenhypfs.h>
 
 /*
  * There is no clear requirements for the total size of Virtio MMIO region.
@@ -640,9 +641,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
     int res;
     LOG(DEBUG, "Creating OP-TEE node in dtb");
 
-    res = fdt_begin_node(fdt, "firmware");
-    if (res) return res;
-
     res = fdt_begin_node(fdt, "optee");
     if (res) return res;
 
@@ -655,9 +653,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
     res = fdt_end_node(fdt);
     if (res) return res;
 
-    res = fdt_end_node(fdt);
-    if (res) return res;
-
     return 0;
 }
 
@@ -1191,10 +1186,9 @@ static int copy_node(libxl__gc *gc, void *fdt, void *pfdt,
     return 0;
 }
 
-static int copy_node_by_path(libxl__gc *gc, const char *path,
-                             void *fdt, void *pfdt)
+static int get_path_nodeoff(const char *path, void *pfdt)
 {
-    int nodeoff, r;
+    int nodeoff;
     const char *name = strrchr(path, '/');
 
     if (!name)
@@ -1214,12 +1208,277 @@ static int copy_node_by_path(libxl__gc *gc, const char *path,
     if (strcmp(fdt_get_name(pfdt, nodeoff, NULL), name))
         return -FDT_ERR_NOTFOUND;
 
+    return nodeoff;
+}
+
+static int copy_node_by_path(libxl__gc *gc, const char *path,
+                             void *fdt, void *pfdt)
+{
+    int nodeoff, r;
+
+    nodeoff = get_path_nodeoff(path, pfdt);
+    if (nodeoff < 0)
+        return nodeoff;
+
     r = copy_node(gc, fdt, pfdt, nodeoff, 0);
     if (r) return r;
 
     return 0;
 }
 
+static int map_sci_page(libxl__gc *gc, uint32_t domid, uint64_t paddr,
+                         uint64_t guest_addr)
+{
+    int ret;
+    uint64_t _paddr_pfn = paddr >> XC_PAGE_SHIFT;
+    uint64_t _guest_pfn = guest_addr >> XC_PAGE_SHIFT;
+
+    assert(paddr && guest_addr);
+    LOG(DEBUG, "[%d] mapping sci shmem page %"PRIx64, domid, _paddr_pfn);
+
+    ret = xc_domain_iomem_permission(CTX->xch, domid, _paddr_pfn, 1, 1);
+    if (ret < 0) {
+        LOG(ERROR,
+              "failed give domain access to iomem page %"PRIx64,
+             _paddr_pfn);
+        return ret;
+    }
+
+    ret = xc_domain_memory_mapping(CTX->xch, domid,
+                                   _guest_pfn, _paddr_pfn,
+                                   1, 1);
+    if (ret < 0) {
+        LOG(ERROR,
+              "failed to map to domain iomem page %"PRIx64
+              " to guest address %"PRIx64,
+              _paddr_pfn, _guest_pfn);
+        return ret;
+    }
+
+    return 0;
+}
+
+static int scmi_dt_make_shmem_node(libxl__gc *gc, void *fdt)
+{
+    int res;
+    char buf[64];
+
+    snprintf(buf, sizeof(buf), "scmi-shmem@%llx", GUEST_SCI_SHMEM_BASE);
+
+    res = fdt_begin_node(fdt, buf);
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "arm,scmi-shmem");
+    if (res) return res;
+
+    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+                    GUEST_ROOT_SIZE_CELLS, 1,
+                    GUEST_SCI_SHMEM_BASE, GUEST_SCI_SHMEM_SIZE);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_SCMI);
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
+static const char *name_from_path(const char *path)
+{
+    return strrchr(path, '/') + 1;
+}
+
+static int dt_copy_properties(libxl__gc *gc, void* fdt, void *xen_fdt,
+        const char *full_name)
+{
+    int propoff, nameoff, r, nodeoff;
+    const struct fdt_property *prop;
+
+    LOG(DEBUG, "Copy properties for node: %s", full_name);
+    nodeoff = get_path_nodeoff(full_name, xen_fdt);
+    if (nodeoff < 0)
+        return -FDT_ERR_NOTFOUND;
+
+    for (propoff = fdt_first_property_offset(xen_fdt, nodeoff);
+         propoff >= 0;
+         propoff = fdt_next_property_offset(xen_fdt, propoff)) {
+
+        if (!(prop = fdt_get_property_by_offset(xen_fdt, propoff, NULL)))
+            return -FDT_ERR_INTERNAL;
+
+        nameoff = fdt32_to_cpu(prop->nameoff);
+
+        /* Skipping phandle nodes in xen device-tree */
+        if (strcmp(fdt_string(xen_fdt,nameoff), "phandle") == 0 ||
+            strcmp(fdt_string(xen_fdt, nameoff), "linux,phandle") == 0)
+            continue;
+
+        r = fdt_property(fdt, fdt_string(xen_fdt, nameoff),
+                         prop->data, fdt32_to_cpu(prop->len));
+        if (r) return r;
+    }
+
+    return (propoff != -FDT_ERR_NOTFOUND)? propoff : 0;
+}
+
+static int scmi_dt_scan_node(libxl__gc *gc, void *fdt, void *pfdt,
+                             void *xen_fdt, int nodeoff)
+{
+    int rc;
+    int node_next;
+    char full_name[128];
+    uint32_t phandle;
+
+    node_next = fdt_first_subnode(pfdt, nodeoff);
+    while (node_next > 0)
+    {
+        LOG(ERROR,"Processing node %s",
+                fdt_get_name(pfdt, node_next, NULL));
+
+        phandle = fdt_get_phandle(pfdt, node_next);
+
+        rc = fdt_get_path(pfdt, node_next, full_name, sizeof(full_name));
+        if (rc) return rc;
+
+        rc = fdt_begin_node(fdt, name_from_path(full_name));
+        if (rc) return rc;
+
+        rc = dt_copy_properties(gc, fdt, xen_fdt, full_name);
+        if (rc) return rc;
+
+        if (phandle) {
+            rc = fdt_property_cell(fdt, "phandle", phandle);
+            if (rc) return rc;
+        }
+
+        rc = scmi_dt_scan_node(gc, fdt, pfdt, xen_fdt, node_next);
+        if (rc) return rc;
+
+        rc = fdt_end_node(fdt);
+        if (rc) return rc;
+
+        node_next = fdt_next_subnode(pfdt, node_next);
+    }
+
+    return 0;
+}
+
+static int scmi_hypfs_fdt_check(libxl__gc *gc, void *fdt)
+{
+    int r;
+
+    if (fdt_magic(fdt) != FDT_MAGIC) {
+         LOG(ERROR, "FDT is not a valid Flat Device Tree");
+         return ERROR_FAIL;
+     }
+
+     r = fdt_check_header(fdt);
+     if (r) {
+         LOG(ERROR, "Failed to check the FDT (%d)", r);
+         return ERROR_FAIL;
+     }
+
+     return r;
+}
+
+static int scmi_dt_copy_subnodes(libxl__gc *gc, void *fdt, void *pfdt)
+{
+    struct xenhypfs_handle *hdl;
+    struct xenhypfs_dirent *ent;
+    void *xen_fdt;
+    int rc, nodeoff;
+
+    hdl = xenhypfs_open(NULL, 0);
+    if (!hdl)
+        return -EINVAL;
+
+    xen_fdt = xenhypfs_read_raw(hdl, "/devicetree", &ent);
+    if (!xen_fdt) {
+        rc = errno;
+        LOG(ERROR, "Unable to read hypfs entry: %d", rc);
+        goto out;
+    }
+
+    rc = scmi_hypfs_fdt_check(gc, xen_fdt);
+    if (rc) {
+        LOG(ERROR, "Hypfs device tree is invalid");
+        goto out;
+    }
+
+    nodeoff = get_path_nodeoff("/firmware/scmi", pfdt);
+    if (nodeoff <= 0) {
+        rc = -ENODEV;
+        goto out;
+    }
+
+    rc = scmi_dt_scan_node(gc, fdt, pfdt, xen_fdt, nodeoff);
+
+out:
+    xenhypfs_close(hdl);
+
+    return rc;
+}
+
+static int scmi_dt_create_node(libxl__gc *gc, void *fdt, void *pfdt,
+                               uint32_t func_id)
+{
+    int rc = 0;
+
+    rc = fdt_begin_node(fdt, "scmi");
+    if (rc) return rc;
+
+    rc = fdt_property_compat(gc, fdt, 1, "arm,scmi-smc");
+    if (rc) return rc;
+
+    rc = fdt_property_cell(fdt, "shmem", GUEST_PHANDLE_SCMI);
+    if (rc) return rc;
+
+    rc = fdt_property_cell(fdt, "#addrets-cells", 1);
+    if (rc) return rc;
+
+    rc = fdt_property_cell(fdt, "#size-cells", 0);
+    if (rc) return rc;
+
+    rc = fdt_property_cell(fdt, "arm,smc-id", func_id);
+    if (rc) return rc;
+
+    rc = scmi_dt_copy_subnodes(gc, fdt, pfdt);
+    if (rc) return rc;
+
+    rc = fdt_end_node(fdt);
+    if (rc) return rc;
+
+    return rc;
+}
+
+static int make_firmware_node(libxl__gc *gc, void *fdt, void *pfdt, int tee,
+                              int sci, uint32_t func_id)
+{
+    int res;
+
+    if ((tee == LIBXL_TEE_TYPE_NONE) && (sci == LIBXL_ARM_SCI_TYPE_NONE))
+        return 0;
+
+    res = fdt_begin_node(fdt, "firmware");
+    if (res) return res;
+
+    if (tee == LIBXL_TEE_TYPE_OPTEE) {
+       res = make_optee_node(gc, fdt);
+       if (res) return res;
+    }
+
+    if (sci == LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT) {
+        res = scmi_dt_create_node(gc, fdt, pfdt, func_id);
+        if (res) return res;
+    }
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+    return 0;
+}
+
 /*
  * The partial device tree is not copied entirely. Only the relevant bits are
  * copied to the guest device tree:
@@ -1391,8 +1650,11 @@ next_resize:
         if (info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART)
             FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
 
-        if (info->tee == LIBXL_TEE_TYPE_OPTEE)
-            FDT( make_optee_node(gc, fdt) );
+        if (info->arm_sci.type == LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT)
+            FDT( scmi_dt_make_shmem_node(gc, fdt) );
+
+        FDT( make_firmware_node(gc, fdt, pfdt, info->tee, info->arm_sci.type,
+                state->arm_sci_agent_funcid) );
 
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
@@ -1671,6 +1933,16 @@ int libxl__arch_build_dom_finish(libxl__gc *gc,
 {
     int rc = 0, ret;
 
+    if (info->arm_sci.type == LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT) {
+        ret = map_sci_page(gc, dom->guest_domid, state->arm_sci_agent_paddr,
+                           GUEST_SCI_SHMEM_BASE);
+        if (ret < 0) {
+            LOG(ERROR, "map_sci_page failed\n");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
     if (info->arch_arm.vuart != LIBXL_VUART_TYPE_SBSA_UART) {
         rc = 0;
         goto out;
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index e03599ea99d1..ba26b9784838 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -813,6 +813,18 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
      */
     assert(libxl_domid_valid_guest(*domid));
 
+    if (d_config->b_info.arm_sci.type == LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT) {
+        ret = xc_domain_get_sci_info(ctx->xch, *domid, &state->arm_sci_agent_paddr,
+                &state->arm_sci_agent_funcid);
+        LOGD(DEBUG, *domid,"sci_agent_paddr = %lx", state->arm_sci_agent_paddr);
+        if (ret) {
+            LOGED(ERROR, *domid, "failed to get sci paddr");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+    }
+
     dom_path = libxl__xs_get_dompath(gc, *domid);
     if (!dom_path) {
         rc = ERROR_FAIL;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index cfac8e18b6d3..349c89a938ca 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1405,6 +1405,9 @@ typedef struct {
      * applicable to the primary domain, not support domains (e.g. stub QEMU). */
     bool restore;
     bool soft_reset;
+
+    uint64_t arm_sci_agent_paddr;
+    uint32_t arm_sci_agent_funcid;
 } libxl__domain_build_state;
 
 _hidden void libxl__domain_build_state_init(libxl__domain_build_state *s);
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index 9d047065ba13..3ac77ea4d497 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -49,6 +49,17 @@ static int handle_vuart_init(struct domain *d,
     return rc;
 }
 
+static int get_sci_info(struct domain *d, struct xen_domctl_sci_info *sci_info)
+{
+#ifdef CONFIG_ARM_SCI
+    sci_info->paddr = d->arch.sci_channel.paddr;
+    sci_info->func_id = d->arch.sci_channel.guest_func_id;
+    return 0;
+#else
+    return -ENODEV;
+#endif
+}
+
 long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
                     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
@@ -179,6 +190,17 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
     }
     case XEN_DOMCTL_dt_overlay:
         return dt_overlay_domctl(d, &domctl->u.dt_overlay);
+
+    case XEN_DOMCTL_get_sci_info:
+    {
+        int rc = get_sci_info(d, &domctl->u.sci_info);
+
+        if ( !rc )
+            rc = copy_to_guest(u_domctl, domctl, 1);
+
+        return rc;
+    }
+
     default:
         return subarch_do_domctl(domctl, d, u_domctl);
     }
diff --git a/xen/arch/arm/firmware/scmi-smc-multiagent.c b/xen/arch/arm/firmware/scmi-smc-multiagent.c
index 293fb30fa6c5..c2f43d97d804 100644
--- a/xen/arch/arm/firmware/scmi-smc-multiagent.c
+++ b/xen/arch/arm/firmware/scmi-smc-multiagent.c
@@ -560,6 +560,8 @@ static int scmi_domain_init(struct domain *d,
 
     d->arch.sci_data = channel;
     d->arch.sci_enabled = true;
+    d->arch.sci_channel.paddr = channel->paddr;
+    d->arch.sci_channel.guest_func_id = channel->func_id;
 
     return 0;
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index fa0898b7cf80..511f4aa8ed8d 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -59,6 +59,11 @@ struct paging_domain {
     unsigned long p2m_total_pages;
 };
 
+struct sci_channel {
+    uint32_t guest_func_id;
+    uint64_t paddr;
+};
+
 struct arch_domain
 {
 #ifdef CONFIG_ARM_64
@@ -122,6 +127,7 @@ struct arch_domain
     bool sci_enabled;
     /* ARM SCI driver's specific data */
     void *sci_data;
+    struct sci_channel sci_channel;
 #endif
 
 }  __cacheline_aligned;
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 30e46de6d7a0..a5b22225bf31 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -469,6 +469,10 @@ typedef uint64_t xen_callback_t;
 #define GUEST_PL011_BASE    xen_mk_ullong(0x22000000)
 #define GUEST_PL011_SIZE    xen_mk_ullong(0x00001000)
 
+/* SCI mediator */
+#define GUEST_SCI_SHMEM_BASE xen_mk_ullong(0x22001000)
+#define GUEST_SCI_SHMEM_SIZE xen_mk_ullong(0x01000)
+
 /* Guest PCI-PCIe memory space where config space and BAR will be available.*/
 #define GUEST_VPCI_ADDR_TYPE_MEM            xen_mk_ullong(0x02000000)
 #define GUEST_VPCI_MEM_ADDR                 xen_mk_ullong(0x23000000)
diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/device_tree_defs.h
index 9e80d0499dc3..b8bdfcdcf0b9 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -14,6 +14,7 @@
  */
 #define GUEST_PHANDLE_GIC (65000)
 #define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
+#define GUEST_PHANDLE_SCMI (GUEST_PHANDLE_IOMMU + 1)
 
 #define GUEST_ROOT_ADDRESS_CELLS 2
 #define GUEST_ROOT_SIZE_CELLS 2
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index e2d392d1e5e5..6ef78c241f8c 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1223,6 +1223,13 @@ struct xen_domctl_vmtrace_op {
 #define XEN_DOMCTL_vmtrace_get_option         5
 #define XEN_DOMCTL_vmtrace_set_option         6
 };
+
+/* XEN_DOMCTL_get_sci_info */
+struct xen_domctl_sci_info {
+    uint64_t paddr;
+    uint32_t func_id;
+};
+
 typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
 
@@ -1333,6 +1340,9 @@ struct xen_domctl {
 #define XEN_DOMCTL_dt_overlay                    87
 #define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_set_llc_colors                89
+
+#define XEN_DOMCTL_get_sci_info                  90
+
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1400,6 +1410,7 @@ struct xen_domctl {
         struct xen_domctl_dt_overlay        dt_overlay;
 #endif
         struct xen_domctl_set_llc_colors    set_llc_colors;
+        struct xen_domctl_sci_info          sci_info;
         uint8_t                             pad[128];
     } u;
 };
-- 
2.34.1


