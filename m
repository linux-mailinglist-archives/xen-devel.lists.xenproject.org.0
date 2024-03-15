Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BF487CBC2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 12:00:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693754.1082269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hw-0002H1-19; Fri, 15 Mar 2024 10:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693754.1082269; Fri, 15 Mar 2024 10:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hv-0002DT-Nv; Fri, 15 Mar 2024 10:59:47 +0000
Received: by outflank-mailman (input) for mailman id 693754;
 Fri, 15 Mar 2024 10:59:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnwS=KV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rl5Ht-0000xG-4b
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:59:45 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20d5b4fc-e2bb-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 11:59:43 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a449c5411e1so254277066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:59:43 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 en6-20020a17090728c600b00a465a012cf1sm1621493ejc.18.2024.03.15.03.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 03:59:42 -0700 (PDT)
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
X-Inumbo-ID: 20d5b4fc-e2bb-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710500382; x=1711105182; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3HBQ0ayQI+jR97F8fnT64pMvcLpR1MuWmyK0hTevP0=;
        b=lJVaGOeaGqFFyHaPYECJvNAl1xuaSje39MiGwLNYKUv79a+L9qsqGmNjajZ4WxFgkf
         OEXgOjoncKPl63PVMJKjnmYPhjYftrsiIBXxyUvFQPpC+9j1WOldu6hMC4qfGkkfO5va
         DptznaZRZWtDdYXm8LLKlkGSgTnBTQJIChrsOb03U4eXTI9aAVbF2wLVALqHWHSXDgiO
         MUYDoaF6PdsJMMgXISt6c3gBX0FD/ux4g0oRALNWZVYbl517fASslvkJjwt+MsExLDc8
         m1p9JnUYKkvdB4YhsmUm1FUYBA/sMGYAJFQ179ynydzfIM/9PcoGGrjmOnaaczHgcMqk
         wRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500382; x=1711105182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3HBQ0ayQI+jR97F8fnT64pMvcLpR1MuWmyK0hTevP0=;
        b=UtmLMxtbd+9tgDWDg3MObJh9+Ng8jThvSfBRY6pkOO2OPDQc6cgZoYNlGkzfbZTUR5
         FxDwIVZsjCZEOaKyUj23cBKexT76v43AXIrmAxon0w5knGbNf4I36LmeS9E+BW4+Joyg
         SHMwlBOAj6ky1T3NfSbqQR03JgnnmVRgMEPtWhcASo3MsYMuMF8qW68a5H/5YQ0Pvo80
         H3yMXt9kUaDzkCSCF6V6Ib6xHGhBi03XFMQX/87sbvGARM0qm94RTkJhVyNgbCOKr5CI
         /m5jgBD8d9Nrj1BpPNuCsDCHghYqkPHjbkKb2OhhjyJl++vmO3LCP8PcpZaKBQ83DjMk
         gSlw==
X-Gm-Message-State: AOJu0YzY78gMuM78WqctGiHU9x8AYohK/BVexi+1dQUY6vYMmZpIAvgW
	VdHXwINtTtlNacZWdk/PnLy4uoJkPK68b0iZIldobSzPZoiNvDCWm9AhvwfEJzO1+AqexrtUrYF
	c/kE=
X-Google-Smtp-Source: AGHT+IGLfdJySe4LkA0Tpn+tYU9zpv7/iHI6deZJiDkyG3TOMq4zlrYZ8SVbRMpY54Rzpxqu2oeWKw==
X-Received: by 2002:a17:906:c2d0:b0:a43:5bc6:17f3 with SMTP id ch16-20020a170906c2d000b00a435bc617f3mr2734090ejb.6.1710500382346;
        Fri, 15 Mar 2024 03:59:42 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v7 06/14] tools: add support for cache coloring configuration
Date: Fri, 15 Mar 2024 11:58:54 +0100
Message-Id: <20240315105902.160047-7-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
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
v7:
- removed unneeded NULL check before xc_hypercall_buffer_free() in
  xc_domain_set_llc_colors()
v6:
- no edits
v5:
- added LIBXL_HAVE_BUILDINFO_LLC_COLORS
- moved color configuration in xc_domain_set_llc_colors() cause of the new
  hypercall
v4:
- removed overlapping color ranges checks during parsing
- moved hypercall buffer initialization in libxenctrl
---
 docs/man/xl.cfg.5.pod.in         | 10 +++++++++
 tools/include/libxl.h            |  5 +++++
 tools/include/xenctrl.h          |  9 ++++++++
 tools/libs/ctrl/xc_domain.c      | 35 +++++++++++++++++++++++++++++
 tools/libs/light/libxl_create.c  |  9 ++++++++
 tools/libs/light/libxl_types.idl |  1 +
 tools/xl/xl_parse.c              | 38 +++++++++++++++++++++++++++++++-
 7 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 039e057318..941de07408 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3070,6 +3070,16 @@ raised.
 
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
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 62cb07dea6..49521e5da4 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1368,6 +1368,11 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst, const libxl_mac *src);
  */
 #define LIBXL_HAVE_BUILDINFO_HVM_SYSTEM_FIRMWARE
 
+/*
+ * The libxl_domain_build_info has the llc_colors array.
+ */
+#define LIBXL_HAVE_BUILDINFO_LLC_COLORS 1
+
 /*
  * ERROR_REMUS_XXX error code only exists from Xen 4.5, Xen 4.6 and it
  * is changed to ERROR_CHECKPOINT_XXX in Xen 4.7
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2ef8b4e054..2c2a5c4bd4 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2653,6 +2653,15 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
 int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
                          xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
 
+/*
+ * Set LLC colors for a domain.
+ * It can only be used directly after domain creation. An attempt to use it
+ * afterwards will result in an error.
+ */
+int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
+                             const unsigned int *llc_colors,
+                             unsigned int num_llc_colors);
+
 #if defined(__arm__) || defined(__aarch64__)
 int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index f2d9d14b4d..d315cfa6c1 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -2180,6 +2180,41 @@ int xc_domain_soft_reset(xc_interface *xch,
     domctl.domain = domid;
     return do_domctl(xch, &domctl);
 }
+
+int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
+                             const unsigned int *llc_colors,
+                             unsigned int num_llc_colors)
+{
+    struct xen_domctl domctl = {};
+    DECLARE_HYPERCALL_BUFFER(uint32_t, local);
+    int ret = -1;
+
+    if ( num_llc_colors )
+    {
+        size_t bytes = sizeof(uint32_t) * num_llc_colors;
+
+        local = xc_hypercall_buffer_alloc(xch, local, bytes);
+        if ( local == NULL )
+        {
+            PERROR("Could not allocate LLC colors for set_llc_colors");
+            ret = -ENOMEM;
+            goto out;
+        }
+        memcpy(local, llc_colors, bytes);
+        set_xen_guest_handle(domctl.u.set_llc_colors.llc_colors, local);
+    }
+
+    domctl.cmd = XEN_DOMCTL_set_llc_colors;
+    domctl.domain = domid;
+    domctl.u.set_llc_colors.num_llc_colors = num_llc_colors;
+
+    ret = do_domctl(xch, &domctl);
+
+out:
+    xc_hypercall_buffer_free(xch, local);
+
+    return ret;
+}
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 5546335973..79f206f616 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -726,6 +726,15 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             /* A new domain now exists */
             *domid = local_domid;
 
+            ret = xc_domain_set_llc_colors(ctx->xch, local_domid,
+                                           b_info->llc_colors,
+                                           b_info->num_llc_colors);
+            if (ret < 0 && errno != EOPNOTSUPP) {
+                LOGED(ERROR, local_domid, "LLC colors allocation failed");
+                rc = ERROR_FAIL;
+                goto out;
+            }
+
             rc = libxl__is_domid_recent(gc, local_domid, &recent);
             if (rc)
                 goto out;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 470122e768..79118e1582 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -616,6 +616,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("ioports",          Array(libxl_ioport_range, "num_ioports")),
     ("irqs",             Array(uint32, "num_irqs")),
     ("iomem",            Array(libxl_iomem_range, "num_iomem")),
+    ("llc_colors",       Array(uint32, "num_llc_colors")),
     ("claim_mode",	     libxl_defbool),
     ("event_channels",   uint32),
     ("kernel",           string),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 80ffe85f5e..aa9623a6b9 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1294,7 +1294,7 @@ void parse_config_data(const char *config_source,
     XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
                    *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
     XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
-                   *mca_caps, *smbios;
+                   *mca_caps, *smbios, *llc_colors;
     int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
     int num_smbios;
     int pci_power_mgmt = 0;
@@ -1302,6 +1302,7 @@ void parse_config_data(const char *config_source,
     int pci_permissive = 0;
     int pci_seize = 0;
     int i, e;
+    int num_llc_colors;
     char *kernel_basename;
 
     libxl_domain_create_info *c_info = &d_config->c_info;
@@ -1445,6 +1446,41 @@ void parse_config_data(const char *config_source,
     if (!xlu_cfg_get_long (config, "maxmem", &l, 0))
         b_info->max_memkb = l * 1024;
 
+    if (!xlu_cfg_get_list(config, "llc_colors", &llc_colors, &num_llc_colors, 0)) {
+        int cur_index = 0;
+
+        b_info->num_llc_colors = 0;
+        for (i = 0; i < num_llc_colors; i++) {
+            uint32_t start = 0, end = 0, k;
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


