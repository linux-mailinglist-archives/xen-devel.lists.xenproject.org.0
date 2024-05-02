Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B50EC8B9EFD
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 18:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715951.1117979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zik-0007dF-ES; Thu, 02 May 2024 16:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715951.1117979; Thu, 02 May 2024 16:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zik-0007Xo-60; Thu, 02 May 2024 16:55:46 +0000
Received: by outflank-mailman (input) for mailman id 715951;
 Thu, 02 May 2024 16:55:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/Nh=MF=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s2Zii-0006Lf-2b
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 16:55:44 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d01e4368-08a4-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 18:55:43 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a5966f5a76bso182206866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 09:55:43 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 mq30-20020a170907831e00b00a5987fbfb83sm29103ejc.152.2024.05.02.09.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 09:55:41 -0700 (PDT)
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
X-Inumbo-ID: d01e4368-08a4-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1714668942; x=1715273742; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EUvo/9M8ITy6G3rHvhG7NG2DwAgBy3coT8I6ydQ2x4=;
        b=VS2N/fqYnnpQrOoXFuh4WnWwAMyilj52BvYFWiutiFyzngHCUGVMQo/ZO+mQ26abUp
         3kqzhL/mFzAFqNNYXFJD2Mg4NHdMkkLk53mLoKVvn97sud+Vk+bAtdejAMybIkeeHdox
         bvgvazr/8lihylx4dFf1WkNxlqToN8qjq0/m2DCglGYBpm+tPtnmI2M5mXVNyhWTow/C
         ETIpbJ2DLEzSJNK6FSrk2KcICOx9po1PGh9ZSk4RscbbursZ2vP6CR2LtFDlX6VTyupd
         xtp7nmhpdhtoll48efxOIgvWN4GimRicXVY5FiM5792fQqjukKbGpsc05wjWo0H2DU1s
         wPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714668942; x=1715273742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EUvo/9M8ITy6G3rHvhG7NG2DwAgBy3coT8I6ydQ2x4=;
        b=iOZLc3ERsqWRh7yM68RHux/WINVGJf+H9hPe1I4aZV3NXoVl08u2vlhFKl/qoSsnT/
         3FSZ4PcuID36/H4SRiEILzgGciaR+mvcRQFNN1INiiKKQwXYN0YweAM0eb3VwaF84TYx
         lCtkVyzju1ikNIBZ1dZ6dtBd2FN9wJ53QCfbXLudoQOJDr7WTScZwOJad0oqvqq8eOi2
         I0ecpW/nSfrFatfkivSNRgtQg3WpWChOgBTDXDBeYVUZwe4fWk1J94Nt44Zegi/82jee
         KCaqLGdQi5EdY0Bx+YU5Jole588T4dbmhELCGo48rfBVwFIc/GAzqXudLY01WW4mGdEZ
         NBKg==
X-Gm-Message-State: AOJu0Yz8IAvEFSklRsrEysq3hcS+FtGNy9ijk2fwK+x7tKZTqs6QtN1W
	Vm/1vHzv93M/x6YOl6fezr0HepPUidLZZMDi+sbiBJTCZQsJKlTtj3lN/AuVNdAaGYZ7lOjnrmc
	5
X-Google-Smtp-Source: AGHT+IEaaUlZhh8N1o1seHM3dS9FR8bI1vP2vECN7M/57vevuCIUxNoc+9g8AGbYJ3CQ/WfMUyAYvw==
X-Received: by 2002:a17:906:4906:b0:a55:5958:cb00 with SMTP id b6-20020a170906490600b00a555958cb00mr2219308ejq.38.1714668942177;
        Thu, 02 May 2024 09:55:42 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v8 06/13] tools: add support for cache coloring configuration
Date: Thu,  2 May 2024 18:55:26 +0200
Message-Id: <20240502165533.319988-7-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
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
 docs/man/xl.cfg.5.pod.in         | 10 +++++++++
 tools/include/libxl.h            |  5 +++++
 tools/include/xenctrl.h          |  9 ++++++++
 tools/libs/ctrl/xc_domain.c      | 35 +++++++++++++++++++++++++++++
 tools/libs/light/libxl_create.c  | 13 +++++++++++
 tools/libs/light/libxl_types.idl |  1 +
 tools/xl/xl_parse.c              | 38 +++++++++++++++++++++++++++++++-
 7 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 8f2b375ce9..320644701b 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3072,6 +3072,16 @@ raised.
 
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
index 4996855944..2ad8e2066b 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2654,6 +2654,15 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
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
index 41252ec553..ff80625bd6 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -726,6 +726,19 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             /* A new domain now exists */
             *domid = local_domid;
 
+            ret = xc_domain_set_llc_colors(ctx->xch, local_domid,
+                                           b_info->llc_colors,
+                                           b_info->num_llc_colors);
+            if (ret < 0 && errno == EOPNOTSUPP) {
+                if (b_info->num_llc_colors > 0)
+                    LOGED(WARN, local_domid,
+                          "LLC coloring not enabled in the hypervisor");
+            } else if (ret < 0) {
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
index ab09d0288b..ddfbcb00fd 100644
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


