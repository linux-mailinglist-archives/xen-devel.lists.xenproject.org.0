Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B109F51A1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 18:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859578.1271743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb21-0007Kt-Rm; Tue, 17 Dec 2024 17:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859578.1271743; Tue, 17 Dec 2024 17:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb21-0007Ao-JR; Tue, 17 Dec 2024 17:06:49 +0000
Received: by outflank-mailman (input) for mailman id 859578;
 Tue, 17 Dec 2024 17:06:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+zK=TK=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNb20-0006B0-99
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 17:06:48 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cb1fec7-bc99-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 18:06:47 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa6aad76beeso774557266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 09:06:47 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab963910f7sm461362666b.166.2024.12.17.09.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 09:06:46 -0800 (PST)
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
X-Inumbo-ID: 4cb1fec7-bc99-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734455207; x=1735060007; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKbMPc6hxIrj5w4kArM2ZAdbV73PCxtXLWMN/R1bwd0=;
        b=j8HzRT3z281SXi1UQbLirdumsLBSd7RWl/fNxUn4JCMxpzfh4Zn1bSvFHAstDGkIpC
         lhvz4/qWBXH/9WGIo2eVrGcpqrErFKSpP+fCEWMqeYAaKclfLmRik9+NazGlOkhpvEDa
         UaKn23dykypgqrDkjtLKZtuAKSHjKKaQbP84TnMiwD4rsSqQUsWMlBH1EgB82RrM2paE
         EX5opxpzdnAnUtQaUMY1ubAXY5EkCqGG13uRxebV+BjMI1dclQ5x6O7GDssyJ9DL/TW2
         0wWOUgJ30MNq+gulbPXDoRQsQio6uiuT4fZKm8P9h39m6DR3qp2BL0d0olmYYguCpss1
         xL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734455207; x=1735060007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKbMPc6hxIrj5w4kArM2ZAdbV73PCxtXLWMN/R1bwd0=;
        b=qlxFFSv7SbKWGP32HYKSb8mXzETxPmfOquiqksM/0lrikMu5MQZs5NB7/gV6P9Bvm0
         fNF72z2Fn2Dz0W8P0j4wOxJjrG6EGsGY9GPBbxl4JCqYdKrlaqCIulaRghf9rML0a4lV
         /3iAffmDvFLPktplEtfb8Ro8aGMeKnbQsSoI2i78uWzzQSGS2wMD/OS4AfcR/vi4dG9K
         dzy4rIXhx+DBQKHe6AYeQIyZvoPSXXtlo2EApu4f6cCbRXMq/DIu1KxxaUK0QqE5Y16K
         qsqknpChJEdQislccHyRMvF2GkyagpnxfkbGTdBB+gPyV/KupyldComfCe4YUGrOI3oq
         Da9w==
X-Gm-Message-State: AOJu0YyeLK7rGlWSXSOYRAA3hBy94u4jCRn4M/7b4kzER0jEhRAy2qxM
	Q2pHpxcCf9mTGYsuZAXRVAffi5h7ZSguHg71Fz91XgYDalCvfNWf8FWZ/53X+JMzk99sXBnW2jt
	un5g=
X-Gm-Gg: ASbGncsNT45nhPZDBvQaWa3O2JzI/bDQ0ERQNJ7LRN35j1tnD9QhCYT0k9ZDd6o7uGy
	lfm5AW+vHtYJHuUVF2I5sDrH5mc/G52KQMacHFqjyt7UlEO8qtTR3/L1Hn+RirDPWV4MDTDiHuw
	I0/Udx8BLx6nFFLJPYV/5Z4bNE+rXyvippq2QipvMUNkWPhtNe2BRj9OTZlSJcM+RNJjOhdgs3P
	v7iwi2/1drY9PWkz7mZ7dPXjv91rr9dpDXctC948ntsOVH9+5yTyklQbdFeIGg+Nybs1XgYUcHf
	z1LGj1G3aHumWPRHsn0viuhFpYMm/sWgy2Dm37pvv1RRNLEFR8lj1SztFvc=
X-Google-Smtp-Source: AGHT+IHxCmEWT1kjMcnNxE37KiANdTmbauEYGd7bI0JIgofbcW4hN4PsjcB7cmjsji5zjQocsURLtg==
X-Received: by 2002:a17:907:6d12:b0:aab:9607:b6b1 with SMTP id a640c23a62f3a-aabf1980db6mr11560966b.26.1734455206715;
        Tue, 17 Dec 2024 09:06:46 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v13 06/12] tools: add support for cache coloring configuration
Date: Tue, 17 Dec 2024 18:06:31 +0100
Message-ID: <20241217170637.233097-7-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new "llc_colors" parameter that defines the LLC color assignment for
a domain. The user can specify one or more color ranges using the same
syntax used everywhere else for color config described in the
documentation.
The parameter is defined as a list of strings that represent the color
ranges.

Documentation is also added.
Golang bindings are regenerated.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
v13:
- no changes
v12:
- no changes
v11:
- turned unsigned int to uint32_t in xc_domain_set_llc_colors()
- return -1 in case of error instead of ENOMEM in xc_domain_set_llc_colors()
- added regenerated go bindings
v10:
- no changes
v9:
- turned warning into error in case of coloring not enabled
v8:
- warn the user in case of coloring not supported at hypervisor level
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
 docs/man/xl.cfg.5.pod.in             |  6 +++++
 tools/golang/xenlight/helpers.gen.go | 16 ++++++++++++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  5 ++++
 tools/include/xenctrl.h              |  9 +++++++
 tools/libs/ctrl/xc_domain.c          | 34 +++++++++++++++++++++++++
 tools/libs/light/libxl_create.c      | 18 +++++++++++++
 tools/libs/light/libxl_types.idl     |  1 +
 tools/xl/xl_parse.c                  | 38 +++++++++++++++++++++++++++-
 9 files changed, 127 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index ac3f88fd57..8e1422104e 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3074,6 +3074,12 @@ raised.
 
 =over 4
 
+=item B<llc_colors=[ "RANGE", "RANGE", ...]>
+
+Specify the Last Level Cache (LLC) color configuration for the guest.
+B<RANGE> can be either a single color value or a hypen-separated closed
+interval of colors (such as "0-4").
+
 =item B<nr_spis="NR_SPIS">
 
 An optional integer parameter specifying the number of SPIs (Shared
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index fe5110474d..90846ea8e8 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1097,6 +1097,14 @@ if err := x.Iomem[i].fromC(&v); err != nil {
 return fmt.Errorf("converting field Iomem: %v", err) }
 }
 }
+x.LlcColors = nil
+if n := int(xc.num_llc_colors); n > 0 {
+cLlcColors := (*[1<<28]C.uint32_t)(unsafe.Pointer(xc.llc_colors))[:n:n]
+x.LlcColors = make([]uint32, n)
+for i, v := range cLlcColors {
+x.LlcColors[i] = uint32(v)
+}
+}
 if err := x.ClaimMode.fromC(&xc.claim_mode);err != nil {
 return fmt.Errorf("converting field ClaimMode: %v", err)
 }
@@ -1453,6 +1461,14 @@ return fmt.Errorf("converting field Iomem: %v", err)
 }
 }
 }
+if numLlcColors := len(x.LlcColors); numLlcColors > 0 {
+xc.llc_colors = (*C.uint32_t)(C.malloc(C.size_t(numLlcColors*numLlcColors)))
+xc.num_llc_colors = C.int(numLlcColors)
+cLlcColors := (*[1<<28]C.uint32_t)(unsafe.Pointer(xc.llc_colors))[:numLlcColors:numLlcColors]
+for i,v := range x.LlcColors {
+cLlcColors[i] = C.uint32_t(v)
+}
+}
 if err := x.ClaimMode.toC(&xc.claim_mode); err != nil {
 return fmt.Errorf("converting field ClaimMode: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index c9e45b306f..e7667f1ce3 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -575,6 +575,7 @@ SchedParams DomainSchedParams
 Ioports []IoportRange
 Irqs []uint32
 Iomem []IomemRange
+LlcColors []uint32
 ClaimMode Defbool
 EventChannels uint32
 Kernel string
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 8d32428ea9..f8fe4afd7d 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1379,6 +1379,11 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst, const libxl_mac *src);
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
index 29617585c5..d6d93a2e8f 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2667,6 +2667,15 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
 int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
                          xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
 
+/*
+ * Set LLC colors for a domain.
+ * It can only be used directly after domain creation. An attempt to use it
+ * afterwards will result in an error.
+ */
+int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
+                             const uint32_t *llc_colors,
+                             uint32_t num_llc_colors);
+
 #if defined(__arm__) || defined(__aarch64__)
 int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index e3538ec0ba..2ddc3f4f42 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -2195,6 +2195,40 @@ int xc_domain_soft_reset(xc_interface *xch,
     domctl.domain = domid;
     return do_domctl(xch, &domctl);
 }
+
+int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
+                             const uint32_t *llc_colors,
+                             uint32_t num_llc_colors)
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
index edeadd57ef..e03599ea99 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -747,6 +747,24 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             /* A new domain now exists */
             *domid = local_domid;
 
+            ret = xc_domain_set_llc_colors(ctx->xch, local_domid,
+                                           b_info->llc_colors,
+                                           b_info->num_llc_colors);
+            if (ret < 0) {
+                if (errno == EOPNOTSUPP) {
+                    if (b_info->num_llc_colors > 0) {
+                        LOGED(ERROR, local_domid,
+                            "LLC coloring not enabled in the hypervisor");
+                        rc = ERROR_FAIL;
+                        goto out;
+                    }
+                } else {
+                    LOGED(ERROR, local_domid, "LLC colors allocation failed");
+                    rc = ERROR_FAIL;
+                    goto out;
+                }
+            }
+
             rc = libxl__is_domid_recent(gc, local_domid, &recent);
             if (rc)
                 goto out;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 4e65e6fda5..bd4b8721ff 100644
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
index e3a4800f6e..3d85be7dd4 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1296,7 +1296,7 @@ void parse_config_data(const char *config_source,
     XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
                    *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
     XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
-                   *mca_caps, *smbios;
+                   *mca_caps, *smbios, *llc_colors;
     int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
     int num_smbios;
     int pci_power_mgmt = 0;
@@ -1304,6 +1304,7 @@ void parse_config_data(const char *config_source,
     int pci_permissive = 0;
     int pci_seize = 0;
     int i, e;
+    int num_llc_colors;
     char *kernel_basename;
 
     libxl_domain_create_info *c_info = &d_config->c_info;
@@ -1447,6 +1448,41 @@ void parse_config_data(const char *config_source,
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
2.43.0


