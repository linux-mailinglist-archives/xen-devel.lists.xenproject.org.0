Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4718608E48
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428410.678519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmn-00037o-1x; Sat, 22 Oct 2022 15:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428410.678519; Sat, 22 Oct 2022 15:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmm-00033a-TS; Sat, 22 Oct 2022 15:51:44 +0000
Received: by outflank-mailman (input) for mailman id 428410;
 Sat, 22 Oct 2022 15:51:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U686=2X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1omGml-000237-IT
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:51:43 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c818037-5221-11ed-8fd0-01056ac49cbb;
 Sat, 22 Oct 2022 17:51:42 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id t18so830969edt.2
 for <xen-devel@lists.xenproject.org>; Sat, 22 Oct 2022 08:51:42 -0700 (PDT)
Received: from carlo-ubuntu.home (62-11-205-162.dialup.tiscali.it.
 [62.11.205.162]) by smtp.gmail.com with ESMTPSA id
 z61-20020a509e43000000b00461816beef9sm894623ede.14.2022.10.22.08.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:51:41 -0700 (PDT)
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
X-Inumbo-ID: 6c818037-5221-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWHHd85SPstIESW/WFPVLjHPxgYExJgUfYdkPnInDU0=;
        b=Dzb9hYPPPu6usKi60Q6B7t7Axb6jVxsv8FSp9T/5HkFdMuiqq2YMOGyEHcJhsSYO9w
         9NMYXqhvdAKCGb53Pb67VI/NstyHbMLmjLUAhiiJk1fFpAW7Eg6UGrwdA8gqVNneKxUt
         IamPwmwA077mYZ0E3G8/mEJCFpFoTuhvOd3EzACz9TT3pA8EdaW5ylXEcm1qA1GeSsVE
         FUQRyxhSquci2Z3a2fYzlD87OXgdTQYXHYXPqKQTRNoyYDICNbMCdtGQ+YsKCHaaMtEZ
         4SDBHJbX17KM0ZhfQjo5e1SFHxrKScdtIauaPp3tPOEdISyRJhaE3XbE3r6DdkkF0enC
         wL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWHHd85SPstIESW/WFPVLjHPxgYExJgUfYdkPnInDU0=;
        b=B7SH2Far6AuBO1tEeLUEVcw/FOGDGZSGbUlX/XWXbh2U58Z0Jp0vEOlzasLUD3YUvU
         ACa+u0zvZAsNStLZlJVEuAZLjl+G7vWckGWBUHfz450MRsYV1fNV2HUiknMouHJl6+BH
         5vxXjuD6CvhGouP/iPW5cE7wItW2BAw81S95sq1+0UfHZC9j2hF7EP+09MieK8knzgf8
         HjougUgp30peqMD9gS0B/gzd5k8eNcqDcoHe5qGhGL1lrxn4fvZ7Tl7JS4yZgVctsmgN
         zfuWeEDoBfOF1gcxz3PsEWB7gGtWHIAA1qilUTHRqB8yF426mSYRcELIuz89/qieysG7
         gtFA==
X-Gm-Message-State: ACrzQf1rUqojlzSmCDdYWKMNm4nQtHi0qwjH1fbLnP7exPc8a7bSu4+e
	CXTWe982hDHNQzt0XGT+q5cqpSis6hKzzA==
X-Google-Smtp-Source: AMsMyM48uO6b+yWqGGzt/FDnV9UW58EoI4CDbhHjPxBWpSaUb+u1xH8OKvvBLb0srWjWjtKkern7Yw==
X-Received: by 2002:a05:6402:5ca:b0:43b:6e01:482c with SMTP id n10-20020a05640205ca00b0043b6e01482cmr23173185edx.189.1666453902137;
        Sat, 22 Oct 2022 08:51:42 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v3 4/9] tools/xl: add support for cache coloring configuration
Date: Sat, 22 Oct 2022 17:51:15 +0200
Message-Id: <20221022155120.7000-5-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new "colors" parameter that defines the color assignment for a
domain. The user can specify one or more color ranges using the same
syntax used everywhere else for color config described in the
documentation. The parameter is defined as a list of strings that represent
the color ranges.
Also documentation is added.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 docs/man/xl.cfg.5.pod.in         | 10 ++++++
 tools/libs/light/libxl_create.c  | 12 ++++++++
 tools/libs/light/libxl_types.idl |  1 +
 tools/xl/xl_parse.c              | 52 ++++++++++++++++++++++++++++++--
 4 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index b2901e04cf..5f53cec8bf 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2880,6 +2880,16 @@ Currently, only the "sbsa_uart" model is supported for ARM.
 
 =back
 
+=over 4
+
+=item B<colors=[ "COLORS_RANGE", "COLORS_RANGE", ...]>
+
+Specify the LLC color configuration for the guest. B<COLORS_RANGE> can be either
+a single color value or a hypen-separated closed interval of colors
+(such as "0-4").
+
+=back
+
 =head3 x86
 
 =over 4
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index b9dd2deedf..94c511912c 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -615,6 +615,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
     struct xs_permissions rwperm[1];
     struct xs_permissions noperm[1];
     xs_transaction_t t = 0;
+    DECLARE_HYPERCALL_BUFFER(unsigned int, colors);
 
     /* convenience aliases */
     libxl_domain_create_info *info = &d_config->c_info;
@@ -676,6 +677,16 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             goto out;
         }
 
+        if (d_config->b_info.num_colors) {
+            size_t bytes = sizeof(unsigned int) * d_config->b_info.num_colors;
+            colors = xc_hypercall_buffer_alloc(ctx->xch, colors, bytes);
+            memcpy(colors, d_config->b_info.colors, bytes);
+            set_xen_guest_handle(create.arch.colors, colors);
+            create.arch.num_colors = d_config->b_info.num_colors;
+            create.arch.from_guest = 1;
+            LOG(DEBUG, "Setup %u domain colors", d_config->b_info.num_colors);
+        }
+
         for (;;) {
             uint32_t local_domid;
             bool recent;
@@ -922,6 +933,7 @@ retry_transaction:
     rc = 0;
  out:
     if (t) xs_transaction_end(ctx->xsh, t, 1);
+    if (colors) xc_hypercall_buffer_free(ctx->xch, colors);
     return rc;
 }
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index d634f304cd..642173af1a 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -557,6 +557,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("ioports",          Array(libxl_ioport_range, "num_ioports")),
     ("irqs",             Array(uint32, "num_irqs")),
     ("iomem",            Array(libxl_iomem_range, "num_iomem")),
+    ("colors",           Array(uint32, "num_colors")),
     ("claim_mode",	     libxl_defbool),
     ("event_channels",   uint32),
     ("kernel",           string),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1b5381cef0..e6b2c7acff 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1220,8 +1220,9 @@ void parse_config_data(const char *config_source,
     XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
                    *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
     XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
-                   *mca_caps;
-    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
+                   *mca_caps, *colors;
+    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps,
+        num_colors;
     int pci_power_mgmt = 0;
     int pci_msitranslate = 0;
     int pci_permissive = 0;
@@ -1370,6 +1371,53 @@ void parse_config_data(const char *config_source,
     if (!xlu_cfg_get_long (config, "maxmem", &l, 0))
         b_info->max_memkb = l * 1024;
 
+    if (!xlu_cfg_get_list(config, "colors", &colors, &num_colors, 0)) {
+        int k, p, cur_index = 0;
+
+        b_info->num_colors = 0;
+        /* Get number of colors based on ranges */
+        for (i = 0; i < num_colors; i++) {
+            uint32_t start = 0, end = 0;
+
+            buf = xlu_cfg_get_listitem(colors, i);
+            if (!buf) {
+                fprintf(stderr,
+                    "xl: Unable to get element %d in colors range list\n", i);
+                exit(1);
+            }
+
+            if (sscanf(buf, "%u-%u", &start, &end) != 2) {
+                if (sscanf(buf, "%u", &start) != 1) {
+                    fprintf(stderr, "xl: Invalid color range: %s\n", buf);
+                    exit(1);
+                }
+                end = start;
+            }
+            else if (start > end) {
+                fprintf(stderr,
+                        "xl: Start color is greater than end color: %s\n", buf);
+                exit(1);
+            }
+
+            /* Check for overlaps */
+            for (k = start; k <= end; k++) {
+                for (p = 0; p < b_info->num_colors; p++) {
+                    if (b_info->colors[p] == k) {
+                        fprintf(stderr, "xl: Overlapped ranges not allowed\n");
+                        exit(1);
+                    }
+                }
+            }
+
+            b_info->num_colors += (end - start) + 1;
+            b_info->colors = (uint32_t *)realloc(b_info->colors,
+                                sizeof(*b_info->colors) * b_info->num_colors);
+
+            for (k = start; k <= end; k++)
+                b_info->colors[cur_index++] = k;
+        }
+    }
+
     if (!xlu_cfg_get_long (config, "vcpus", &l, 0)) {
         vcpus = l;
         if (libxl_cpu_bitmap_alloc(ctx, &b_info->avail_vcpus, l)) {
-- 
2.34.1


