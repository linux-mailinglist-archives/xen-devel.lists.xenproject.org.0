Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57896678066
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483027.748951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3X-0001Pq-0d; Mon, 23 Jan 2023 15:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483027.748951; Mon, 23 Jan 2023 15:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3W-0001LS-QW; Mon, 23 Jan 2023 15:48:22 +0000
Received: by outflank-mailman (input) for mailman id 483027;
 Mon, 23 Jan 2023 15:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kihy=5U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pJz3V-0000MU-Lt
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:48:21 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56be8a4d-9b35-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 16:48:11 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id hw16so31558504ejc.10
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:48:19 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b007bd28b50305sm22170978eje.200.2023.01.23.07.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:48:18 -0800 (PST)
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
X-Inumbo-ID: 56be8a4d-9b35-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzd4gFUIBqg+ZHD9eDkWBdjmYnoZGDhG9GSzcFzYQKg=;
        b=ETabNKT0EsSZcg15EdQF7dFCM9/xiqUlEIWdA2DWtS5tL9/T5ibgP30fXWC/9WZVJl
         18jmVJaFmqGlvDg/zkXGZcHWjRDlkao01TQGZyZArYNvKMtwgAqCbldtwmyscHyyZFb7
         snpK8rXogh46SgegLnBG/UPTEgeFyyNdyqJefHnYrbfe5MlqOfV7Tf9XmcsYPJ4lCl0T
         znmCxVp/aRl/DcejlPKG7POpNdalluMuldgC6B6gR05SAwICtVkfkS4kwri38rP1tgC5
         BlefBNdlRWRR8D2N7pStaU8hT+058YVUk12ZxQieUUEHfNChQvlORjK2hnCpyaRbjnhK
         hJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzd4gFUIBqg+ZHD9eDkWBdjmYnoZGDhG9GSzcFzYQKg=;
        b=N3Gsw9zl0pFfDnUGAmiCp+GSFhtOQMcvg1WrFR3QJLKAY3UKszUNGMl45hpxKYaFjD
         /cUav8Xj4Q/vVByts4LDlKv5J1MUXMMIk1YyA5DEAdEKBuYKZdQ4y+c1eqQwra6E7ghF
         3dmlz/tCrgmJ+JUGxkF3QIJMmMeiujsYX/QVeNgd47yW7UAqtHpeqdt5hkYdDHZlcwTz
         c0IkENlLW92uA11aV6syY510qWsGR9yrpEtLW7m2WuKH/6nEh5e/kqO05O1K7v0k6i+w
         Ygg85oBebcedKiN5xEfrEbVPC6ZKwiFQIB7o1L8BIo3a8gR9Erui52wh/Xyyj5+UO86g
         zm3Q==
X-Gm-Message-State: AFqh2krNVWWZQKfJ7kEOF1Vbxmfc5WJm0ymMuCqwyzQdIPi0o/2WVO5i
	YowvgnyYSS6+M8Sbt5oLHRaVMID/V4kghes/
X-Google-Smtp-Source: AMrXdXuoiU5iC1OsinUzS2gN900TrrzR7pYn/wJvPrR27p8cQgk49O2CCW3ZKOJgKiy1L4wIQIxxsw==
X-Received: by 2002:a17:907:d40c:b0:872:af53:a028 with SMTP id vi12-20020a170907d40c00b00872af53a028mr24373339ejc.61.1674488899145;
        Mon, 23 Jan 2023 07:48:19 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v4 05/11] tools: add support for cache coloring configuration
Date: Mon, 23 Jan 2023 16:47:29 +0100
Message-Id: <20230123154735.74832-6-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new "llc_colors" parameter that defines the LLC color assignment for
a domain. The user can specify one or more color ranges using the same
syntax used everywhere else for color config described in the
documentation.
The parameter is defined as a list of strings that represent the color
ranges.

Documentation is also added.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v4:
- removed overlapping color ranges checks during parsing
- moved hypercall buffer initialization in libxenctrl
---
 docs/man/xl.cfg.5.pod.in         | 10 +++++++++
 tools/libs/ctrl/xc_domain.c      | 17 ++++++++++++++
 tools/libs/light/libxl_create.c  |  2 ++
 tools/libs/light/libxl_types.idl |  1 +
 tools/xl/xl_parse.c              | 38 +++++++++++++++++++++++++++++++-
 5 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 024bceeb61..96f9249c3d 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2903,6 +2903,16 @@ Currently, only the "sbsa_uart" model is supported for ARM.
 
 =back
 
+=over 4
+
+=item B<llc_colors=[ "RANGE", "RANGE", ...]>
+
+Specify the Last Level Cache (LLC) color configuration for the guest.
+B<RANGE> can be either a single color value or a hypen-separated closed
+interval of colors (such as "0-4").
+
+=back
+
 =head3 x86
 
 =over 4
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index e939d07157..064f54c349 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -28,6 +28,20 @@ int xc_domain_create(xc_interface *xch, uint32_t *pdomid,
 {
     int err;
     DECLARE_DOMCTL;
+    DECLARE_HYPERCALL_BUFFER(uint32_t, llc_colors);
+
+    if ( config->num_llc_colors )
+    {
+        size_t bytes = sizeof(uint32_t) * config->num_llc_colors;
+
+        llc_colors = xc_hypercall_buffer_alloc(xch, llc_colors, bytes);
+        if ( llc_colors == NULL ) {
+            PERROR("Could not allocate LLC colors for xc_domain_create");
+            return -ENOMEM;
+        }
+        memcpy(llc_colors, config->llc_colors.p, bytes);
+        set_xen_guest_handle(config->llc_colors, llc_colors);
+    }
 
     domctl.cmd = XEN_DOMCTL_createdomain;
     domctl.domain = *pdomid;
@@ -39,6 +53,9 @@ int xc_domain_create(xc_interface *xch, uint32_t *pdomid,
     *pdomid = (uint16_t)domctl.domain;
     *config = domctl.u.createdomain;
 
+    if ( llc_colors )
+        xc_hypercall_buffer_free(xch, llc_colors);
+
     return 0;
 }
 
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index beec3f6b6f..6d0c768241 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -638,6 +638,8 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
             .cpupool_id = info->poolid,
+            .num_llc_colors = b_info->num_llc_colors,
+            .llc_colors.p = b_info->llc_colors,
         };
 
         if (info->type != LIBXL_DOMAIN_TYPE_PV) {
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 0cfad8508d..1f944ca6d7 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -562,6 +562,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("ioports",          Array(libxl_ioport_range, "num_ioports")),
     ("irqs",             Array(uint32, "num_irqs")),
     ("iomem",            Array(libxl_iomem_range, "num_iomem")),
+    ("llc_colors",       Array(uint32, "num_llc_colors")),
     ("claim_mode",	     libxl_defbool),
     ("event_channels",   uint32),
     ("kernel",           string),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 853e9f357a..0f8c469fb5 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1297,8 +1297,9 @@ void parse_config_data(const char *config_source,
     XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
                    *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
     XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
-                   *mca_caps;
+                   *mca_caps, *llc_colors;
     int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
+    int num_llc_colors;
     int pci_power_mgmt = 0;
     int pci_msitranslate = 0;
     int pci_permissive = 0;
@@ -1447,6 +1448,41 @@ void parse_config_data(const char *config_source,
     if (!xlu_cfg_get_long (config, "maxmem", &l, 0))
         b_info->max_memkb = l * 1024;
 
+    if (!xlu_cfg_get_list(config, "llc_colors", &llc_colors, &num_llc_colors, 0)) {
+        int k, cur_index = 0;
+
+        b_info->num_llc_colors = 0;
+        for (i = 0; i < num_llc_colors; i++) {
+            uint32_t start = 0, end = 0;
+
+            buf = xlu_cfg_get_listitem(llc_colors, i);
+            if (!buf) {
+                fprintf(stderr,
+                        "xl: Can't get element %d in LLC color list\n", i);
+                exit(1);
+            }
+
+            if (sscanf(buf, "%" SCNu32 "-%" SCNu32, &start, &end) != 2) {
+                if (sscanf(buf, "%" SCNu32, &start) != 1) {
+                    fprintf(stderr, "xl: Invalid LLC color range: %s\n", buf);
+                    exit(1);
+                }
+                end = start;
+            } else if (start > end) {
+                fprintf(stderr,
+                        "xl: Start LLC color is greater than end: %s\n", buf);
+                exit(1);
+            }
+
+            b_info->num_llc_colors += (end - start) + 1;
+            b_info->llc_colors = (uint32_t *)realloc(b_info->llc_colors,
+                        sizeof(*b_info->llc_colors) * b_info->num_llc_colors);
+
+            for (k = start; k <= end; k++)
+                b_info->llc_colors[cur_index++] = k;
+        }
+    }
+
     if (!xlu_cfg_get_long (config, "vcpus", &l, 0)) {
         vcpus = l;
         if (libxl_cpu_bitmap_alloc(ctx, &b_info->avail_vcpus, l)) {
-- 
2.34.1


