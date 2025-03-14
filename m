Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B77A617A3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914927.1320562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8s2-0000Tj-AZ; Fri, 14 Mar 2025 17:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914927.1320562; Fri, 14 Mar 2025 17:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8s2-0000Qn-65; Fri, 14 Mar 2025 17:30:54 +0000
Received: by outflank-mailman (input) for mailman id 914927;
 Fri, 14 Mar 2025 17:30:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt8nQ-0003IK-KG
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:26:08 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a4edf74-00f9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:26:08 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac298c8fa50so442965766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:26:08 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeb24sm250677566b.9.2025.03.14.10.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:26:06 -0700 (PDT)
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
X-Inumbo-ID: 6a4edf74-00f9-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741973167; x=1742577967; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ad2q/lNaa8nGqhVkQjql1BQSL/I28Cvr3/N4q8Vco4=;
        b=U76r3I6gjKJm5jsbFB+qyFaRosiiox8NSIaBK0B43EKgDLzREQDZcua8x2aaLhTZjN
         DXRNaDiT2T83HqWirelVMZ4OOHkg3OqyFmruFdLu+M8E5M/bNye5qb+TJ3KNqeQoQUO9
         5FYIS2A6JW8qnhFgj+VjP8pTfLNcnsutkkcOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973167; x=1742577967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ad2q/lNaa8nGqhVkQjql1BQSL/I28Cvr3/N4q8Vco4=;
        b=TTm3QDa09IuVsAYtaXBPjyh6tXijax0LiBavLut621cJYr9lefgJvu6LotSFyQH76q
         1VuyqtxNLbFw3PrXYN8oSycxbEczWSwnwMvGDeWwxLCCAPp0cKVZXE1ooEoTV1R951lk
         sAIg1/FSJ5XVuJbEwTdtPLwCXwCGhEV65B/BSFzoK1euolrQLEKw9OWZQpR+BtDgyJ1z
         xb8IUUgdUZL/9PmFSpt+FgULVexL3hq2WzcU3nKWqK7GUQeoVuWVA74mzBPdiLVIp6V4
         Fl/ajOh19gnR2NvMh7Ag+/MAd8OmGx/sV6ByMd7D3J+opThv9m0qWtI0m7BVCilxmmdr
         wW1w==
X-Gm-Message-State: AOJu0YyA2D5Bt6VLVG4gvHUVJmhtevao9QPa0k8gvuXiMswGW9Wd1lH9
	6mt2w9kTqfLsa6st8GwzkmWZWZAmzFvsqjUPehUBMQq73RVdgAV8MVEXM2GAyXNL2/ZGYSzpKAA
	h
X-Gm-Gg: ASbGncuA2t3o09Q4ytA8LM9fMVROZwWbVa76TcvO2nPIfbTyTlPl8aEq67mO/M7rKk7
	TkD+E6ZwsIl3m8gtJFEp6kBGshvQhZRMg4eZzDvdxTWJg493ohAggEsLb8Jiyg5gCPsToSwna+v
	gU002/0TTvMinkK3p0l9fdtQse4R4CljCLsjrH9Vy2JmJ38V6WvTy49SAt8Zb2wzEEq4+XPMCRI
	e3Fg1WOSm8PoNXfyerVGNa2XLRox1fo9IUnVWaVg5aOw8jOV6wKnFeZkTIo0eOkxkoFNlOg5VE6
	OCFrods7Z7T9lldrtmgLGxk/x7w/svV7IIxON/zl+6/EnRgV8Uu2jZ49N3wqdW/QaqQ=
X-Google-Smtp-Source: AGHT+IGnOtlOn5MCkxiSggIOkGMsP3nNHIaHWre+D8PwogdaxXdi3HQeeBQNfbBXkVi4PeSs/lvyKw==
X-Received: by 2002:a17:907:7fa1:b0:ac2:4fe0:1dae with SMTP id a640c23a62f3a-ac3302c7536mr424144566b.24.1741973167063;
        Fri, 14 Mar 2025 10:26:07 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 10/11] tools/xl: Expose a "claim_on_node" setting in xl.cfg
Date: Fri, 14 Mar 2025 17:25:01 +0000
Message-ID: <20250314172502.53498-11-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose a setting to explicitly select a NUMA node for created domains

If the hypervisor can't reserve enough memory in the relevant NUMA node
it fails the claim early. Also, disable automatic NUMA placement when
this new option is enabled.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/xenguest.h             |  7 +++++++
 tools/libs/guest/xg_dom_core.c       |  1 +
 tools/libs/guest/xg_dom_x86.c        | 18 +++++++++---------
 tools/libs/light/libxl_dom.c         |  2 ++
 tools/libs/light/libxl_types.idl     |  3 ++-
 tools/xl/xl_parse.c                  | 11 +++++++++++
 8 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 90846ea8e882..9204020224d5 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1108,6 +1108,7 @@ x.LlcColors[i] = uint32(v)
 if err := x.ClaimMode.fromC(&xc.claim_mode);err != nil {
 return fmt.Errorf("converting field ClaimMode: %v", err)
 }
+x.ClaimOnNode = uint32(xc.claim_on_node)
 x.EventChannels = uint32(xc.event_channels)
 x.Kernel = C.GoString(xc.kernel)
 x.Cmdline = C.GoString(xc.cmdline)
@@ -1472,6 +1473,7 @@ cLlcColors[i] = C.uint32_t(v)
 if err := x.ClaimMode.toC(&xc.claim_mode); err != nil {
 return fmt.Errorf("converting field ClaimMode: %v", err)
 }
+xc.claim_on_node = C.uint32_t(x.ClaimOnNode)
 xc.event_channels = C.uint32_t(x.EventChannels)
 if x.Kernel != "" {
 xc.kernel = C.CString(x.Kernel)}
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index e7667f1ce3a3..1c6319200411 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -577,6 +577,7 @@ Irqs []uint32
 Iomem []IomemRange
 LlcColors []uint32
 ClaimMode Defbool
+ClaimOnNode uint32
 EventChannels uint32
 Kernel string
 Cmdline string
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b772a..08aae1e24e4c 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -185,6 +185,13 @@ struct xc_dom_image {
     uint32_t guest_domid;
     int claim_enabled; /* 0 by default, 1 enables it */
 
+    /*
+     * Exact NUMA node on which to allocate memory from.
+     *
+     * XC_NUMA_NO_NODE by default.
+     */
+    unsigned int claim_on_node;
+
     int xen_version;
     xen_capabilities_info_t xen_caps;
 
diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
index 595b0a667c03..152ec8ea6591 100644
--- a/tools/libs/guest/xg_dom_core.c
+++ b/tools/libs/guest/xg_dom_core.c
@@ -775,6 +775,7 @@ struct xc_dom_image *xc_dom_allocate(xc_interface *xch,
     dom->parms->p2m_base = UNSET_ADDR;
 
     dom->flags = SIF_VIRT_P2M_4TOOLS;
+    dom->claim_on_node = XC_NUMA_NO_NODE;
 
     dom->alloc_malloc += sizeof(*dom);
     return dom;
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index ac05106a8c1c..4fe816b9bcb4 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -1199,7 +1199,7 @@ static int meminit_pv(struct xc_dom_image *dom)
     if ( dom->claim_enabled )
     {
         rc = xc_domain_claim_pages(dom->xch, dom->guest_domid,
-                                   XC_NUMA_NO_NODE,
+                                   dom->claim_on_node,
                                    dom->total_pages);
         if ( rc )
             return rc;
@@ -1209,9 +1209,10 @@ static int meminit_pv(struct xc_dom_image *dom)
      * that this is a valid state if libxl doesn't provide any
      * vNUMA information.
      *
-     * The dummy values make libxc allocate all pages from
-     * arbitrary physical nodes. This is the expected behaviour if
-     * no vNUMA configuration is provided to libxc.
+     * If there's an outstanding claim on a node, memory is allocated from that
+     * node. Otherwise the dummy values make libxc allocate all pages from
+     * arbitrary physical nodes. This is the expected behaviour if no vNUMA
+     * configuration is provided to libxc and.
      *
      * Note that the following hunk is just for the convenience of
      * allocation code. No defaulting happens in libxc.
@@ -1227,7 +1228,7 @@ static int meminit_pv(struct xc_dom_image *dom)
 
         nr_vnodes = 1;
         vnode_to_pnode = dummy_vnode_to_pnode;
-        vnode_to_pnode[0] = XC_NUMA_NO_NODE;
+        vnode_to_pnode[0] = dom->claim_on_node;
     }
     else
     {
@@ -1357,7 +1358,6 @@ static int meminit_hvm(struct xc_dom_image *dom)
     unsigned long stat_normal_pages = 0, stat_2mb_pages = 0,
         stat_1gb_pages = 0;
     unsigned int memflags = 0;
-    int claim_enabled = dom->claim_enabled;
     uint64_t total_pages;
     xen_vmemrange_t dummy_vmemrange[2];
     unsigned int dummy_vnode_to_pnode[1];
@@ -1397,7 +1397,7 @@ static int meminit_hvm(struct xc_dom_image *dom)
             nr_vmemranges++;
         }
 
-        dummy_vnode_to_pnode[0] = XC_NUMA_NO_NODE;
+        dummy_vnode_to_pnode[0] = dom->claim_on_node;
         nr_vnodes = 1;
         vmemranges = dummy_vmemrange;
         vnode_to_pnode = dummy_vnode_to_pnode;
@@ -1443,8 +1443,8 @@ static int meminit_hvm(struct xc_dom_image *dom)
      * actually allocates memory for the guest. Claiming after memory has been
      * allocated is pointless.
      */
-    if ( claim_enabled ) {
-        rc = xc_domain_claim_pages(xch, domid, XC_NUMA_NO_NODE,
+    if ( dom->claim_enabled ) {
+        rc = xc_domain_claim_pages(xch, domid, dom->claim_on_node,
                                    target_pages - dom->vga_hole_size);
         if ( rc != 0 )
         {
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 94fef374014e..1a5500702239 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -663,6 +663,7 @@ int libxl__build_pv(libxl__gc *gc, uint32_t domid,
     dom->xenstore_evtchn = state->store_port;
     dom->xenstore_domid = state->store_domid;
     dom->claim_enabled = libxl_defbool_val(info->claim_mode);
+    dom->claim_on_node = info->claim_on_node;
     dom->max_vcpus = info->max_vcpus;
 
     if (info->num_vnuma_nodes != 0) {
@@ -1090,6 +1091,7 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
     mem_size = (uint64_t)(info->max_memkb - info->video_memkb) << 10;
     dom->target_pages = (uint64_t)(info->target_memkb - info->video_memkb) >> 2;
     dom->claim_enabled = libxl_defbool_val(info->claim_mode);
+    dom->claim_on_node = info->claim_on_node;
     if (info->u.hvm.mmio_hole_memkb) {
         uint64_t max_ram_below_4g = (1ULL << 32) -
             (info->u.hvm.mmio_hole_memkb << 10);
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index bd4b8721ff19..a252b36c2b5d 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -617,7 +617,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("irqs",             Array(uint32, "num_irqs")),
     ("iomem",            Array(libxl_iomem_range, "num_iomem")),
     ("llc_colors",       Array(uint32, "num_llc_colors")),
-    ("claim_mode",	     libxl_defbool),
+    ("claim_mode",       libxl_defbool),
+    ("claim_on_node",    uint32),
     ("event_channels",   uint32),
     ("kernel",           string),
     ("cmdline",          string),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 089a88935aff..5880a032e6d6 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1558,6 +1558,17 @@ void parse_config_data(const char *config_source,
         exit(1);
 
     libxl_defbool_set(&b_info->claim_mode, claim_mode);
+    e = xlu_cfg_get_bounded_long (config, "claim_on_node", 0,
+                                  254, &l, 1);
+    if (e == ESRCH) /* not specified */
+        b_info->claim_on_node = ~0U;
+    else if (!e) {
+        libxl_defbool_set(&b_info->numa_placement, false);
+        libxl_defbool_set(&b_info->claim_mode, true);
+        b_info->claim_on_node = l;
+    }
+    else
+        exit(1);
 
     if (xlu_cfg_get_string (config, "on_poweroff", &buf, 0))
         buf = "destroy";
-- 
2.48.1


