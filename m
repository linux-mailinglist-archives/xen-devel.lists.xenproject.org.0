Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F29D27D7
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840127.1255962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOzB-0000jI-3E; Tue, 19 Nov 2024 14:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840127.1255962; Tue, 19 Nov 2024 14:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOzA-0000dq-Nw; Tue, 19 Nov 2024 14:13:44 +0000
Received: by outflank-mailman (input) for mailman id 840127;
 Tue, 19 Nov 2024 14:13:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDt+=SO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tDOz8-0007nd-Gi
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:13:42 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79162290-a680-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 15:13:39 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa4d257eb68so96839966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:13:39 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df4e7bfsm655228166b.42.2024.11.19.06.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:13:37 -0800 (PST)
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
X-Inumbo-ID: 79162290-a680-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc5MTYyMjkwLWE2ODAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDI1NjE5LjEwNjIzOSwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732025618; x=1732630418; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGl1NPcoKCzlCr5yeY5HUYbNu793pD/X8ieGOenUdQs=;
        b=F7HlF21GD5WAb9lHwP7IIAK+r7lRl9REDnE7i5susjlG9E8g7qGhF9iaJYe1thgOr7
         u6RuMVB/pT8vKCVlxIyLMkYMp9wF/MXQHXc9PRYeyitzh6FNII4lO75UO/kzWXeoLmNc
         LIMAvlLRLVLpOvZSEsXrUg3fUgVLMcwDztIAPPPBYNS8bk8yItX8m/WJtHAJ7mUgzhIt
         XSPc4B6GQdDS75NKm0KauKK6dEFE/Gf/hSkBdXJcKOjhIgH+1byZf580r7O+uA5ga6eP
         vjWE4dpIJ8DY/1bBekLUukdumXcyPdh0wNSb4BXZ+aRRFEtutRdWZ/bTDl7Sj9fkbyn5
         4Jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025618; x=1732630418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGl1NPcoKCzlCr5yeY5HUYbNu793pD/X8ieGOenUdQs=;
        b=GU7xZO6gLA9xH1WRgOtObQ93wfTlnJuhu9BcyxXu7bNrhLgkzYHQW78D6bvY+yVbfZ
         nAlbwsIHI2Q8hPNA/N7o718s8+/LIijy6VNmu4b+7xQUHUe3Ax7tk1BzVO4PMu36C5gt
         QWGX4FUv0/qX+a0VOjJ3rCQ6DsYru2Q3ijiJRj2jBXIhXeOLhzK6r4B5x9ObLobdUo4c
         d3pOq3l2bVvqIga/7hRkx9rp3S/EmSDFlGM2kQjNgVPELToGBPam3DZ8TP0uiVRJO5ml
         1vkTBEheHD3XO14p/LiNrVqfc0f9uTZCoAdb8w1VKw5alNeXTJ2s/+PiDtxh0HdRsB+G
         mBbQ==
X-Gm-Message-State: AOJu0YxmAd41Fn1d7SG3n7TFq6xCeIo4R9zaztmQ+6IyymMa/dUhhCVg
	QyHTUTADw/jzmqchCzkIrz+6PjPXrZxLU+DG40WHKzUcK4g31JqNVry+215bdNd/36GlY73LYPS
	U
X-Google-Smtp-Source: AGHT+IEqDxwaqbb2cYZOH6tuEZ0+kf/vgPj+5cg51RprfpwnY4qM+R+2mRarAD5ntd+Mvea9Ltzw4A==
X-Received: by 2002:a17:907:1c8d:b0:a99:5587:2a1f with SMTP id a640c23a62f3a-aa4c7e39719mr410109566b.15.1732025618223;
        Tue, 19 Nov 2024 06:13:38 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v10 06/12] tools: add support for cache coloring configuration
Date: Tue, 19 Nov 2024 15:13:23 +0100
Message-ID: <20241119141329.44221-7-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
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
 docs/man/xl.cfg.5.pod.in         |  6 +++++
 tools/include/libxl.h            |  5 +++++
 tools/include/xenctrl.h          |  9 ++++++++
 tools/libs/ctrl/xc_domain.c      | 35 +++++++++++++++++++++++++++++
 tools/libs/light/libxl_create.c  | 18 +++++++++++++++
 tools/libs/light/libxl_types.idl |  1 +
 tools/xl/xl_parse.c              | 38 +++++++++++++++++++++++++++++++-
 7 files changed, 111 insertions(+), 1 deletion(-)

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
index 29617585c5..aa2b4b04f3 100644
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
+                             const unsigned int *llc_colors,
+                             unsigned int num_llc_colors);
+
 #if defined(__arm__) || defined(__aarch64__)
 int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index e3538ec0ba..4ed339e6e4 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -2195,6 +2195,41 @@ int xc_domain_soft_reset(xc_interface *xch,
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


