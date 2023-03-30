Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB36CFED6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 10:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516495.800676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnsL-0003yX-Ty; Thu, 30 Mar 2023 08:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516495.800676; Thu, 30 Mar 2023 08:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnsL-0003w6-Qi; Thu, 30 Mar 2023 08:43:17 +0000
Received: by outflank-mailman (input) for mailman id 516495;
 Thu, 30 Mar 2023 08:43:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6CU=7W=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1phnsK-0003w0-8D
 for xen-devel@lists.xen.org; Thu, 30 Mar 2023 08:43:16 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e84577ee-ced6-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 10:43:14 +0200 (CEST)
Received: by mail-pl1-x62a.google.com with SMTP id o11so17454954ple.1
 for <xen-devel@lists.xen.org>; Thu, 30 Mar 2023 01:43:14 -0700 (PDT)
Received: from localhost ([122.172.85.168]) by smtp.gmail.com with ESMTPSA id
 m9-20020a17090a34c900b0023b5528b8d4sm2750132pjf.19.2023.03.30.01.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 01:43:12 -0700 (PDT)
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
X-Inumbo-ID: e84577ee-ced6-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680165792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mTH7Pu1xaJIPVSB0JvyiLy7lPdTEvp4sIi7KrD+n9+o=;
        b=IWaXKcApZbIuC24ziAwoRhaVOYY9ttrwMWk3MTzELEV3wDAegsMze50vn4jL9v8/zK
         3YMEqzS0sCr5hhtgHAAp1VV9pZ+ZO9YJwk/23c7I7VRcybciS3Y6P43tlCZP1EWTcXm/
         8DNYrp3I3Ad54f3+l7Q62tipdIrAZSh+EnXBSlVyizeJESODlSIFwyB8gMMFLaxvJqXz
         ygtSrzadOmwjqXKjtKABoOQbMbvJ5HyB7Zky5Yv8PkCtBgjAToHX6fEtd7Ia4RuhbDg+
         JE6NTe3xSvwpkClUUqSczlUgIW1S+qf8DjiUDFAM4oxFhMWR8q+IkW5a2Kf579xPouuz
         M25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680165792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTH7Pu1xaJIPVSB0JvyiLy7lPdTEvp4sIi7KrD+n9+o=;
        b=oMyGPHD6iX1bmuNxqabuhfbn8h9LjA9/vszQaMOPqizqTrkOHTkQDw2WA33YWhiRGt
         nBo2NdeTcNUXGzJFR4Jop2wRyaCw3ZWlBRBxgcrCiMjc9GI1lwCJ4HuMa/jycQp7035r
         ti5Nf5vsDWm30uA49/lfpl3iCR4OOGvaOBem/UzP5T058wxAPE1OnCFg69lXR4COrzV1
         ajA4nYgSyvtvCFXtH/ZyFT66AF1KiJIrGsv/xl13weA9kky5j0z2QSltWxckQw4sV2xE
         EpgXNFmUDRsjQRdmMEcm94qTDVndLNmPSTon/6Z0yI3P/7c5FD353uD83b134H7Di6eH
         3OEA==
X-Gm-Message-State: AAQBX9eiX/G4INpjzI3r+xuyqHvJoaMKkgPRrjyzEGYJfbE27mszVLK+
	xv+u2RglSgvj84B017+4fmktep0Tle+PE5dvkhw=
X-Google-Smtp-Source: AKy350aHBep19o3aAPIYjRh7j23ahRYciBWG27Q1IxuGiesYwww5/xYMSHPnLF+i8GCtoO2Pki9jKg==
X-Received: by 2002:a17:90a:318d:b0:237:d867:2260 with SMTP id j13-20020a17090a318d00b00237d8672260mr5434907pjb.4.1680165792646;
        Thu, 30 Mar 2023 01:43:12 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: [PATCH] libxl: arm: Allow grant mappings for backends running on Dom0
Date: Thu, 30 Mar 2023 14:13:08 +0530
Message-Id: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, we add grant mapping related device tree properties if the
backend domain is not Dom0. While Dom0 is privileged and can do foreign
mapping for the entire guest memory, it is still okay for Dom0 to access
guest's memory via grant mappings and hence map only what is required.

This commit adds another parameter for virtio devices, with which they
can do forced grant mappings irrespective of the backend domain id.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 docs/man/xl.cfg.5.pod.in         |  4 ++++
 tools/libs/light/libxl_arm.c     | 21 ++++++++++++---------
 tools/libs/light/libxl_types.idl |  1 +
 tools/libs/light/libxl_virtio.c  | 11 +++++++++++
 tools/xl/xl_parse.c              |  2 ++
 5 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 10f37990be57..4879f136aab8 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1616,6 +1616,10 @@ properties in the Device Tree, the type field must be set to "virtio,device".
 Specifies the transport mechanism for the Virtio device, only "mmio" is
 supported for now.
 
+=item B<forced_grant=BOOLEAN>
+
+Allows Xen Grant memory mapping to be done from Dom0.
+
 =back
 
 =item B<tee="STRING">
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 97c80d7ed0fa..ec2f1844e9b3 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -922,7 +922,8 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
 
 /* The caller is responsible to complete / close the fdt node */
 static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
-                                        uint32_t irq, uint32_t backend_domid)
+                                        uint32_t irq, uint32_t backend_domid,
+                                        bool forced_grant)
 {
     int res;
     gic_interrupt intr;
@@ -945,7 +946,7 @@ static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
     res = fdt_property(fdt, "dma-coherent", NULL, 0);
     if (res) return res;
 
-    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
+    if (forced_grant || backend_domid != LIBXL_TOOLSTACK_DOMID) {
         uint32_t iommus_prop[2];
 
         iommus_prop[0] = cpu_to_fdt32(GUEST_PHANDLE_IOMMU);
@@ -959,11 +960,12 @@ static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
 }
 
 static int make_virtio_mmio_node(libxl__gc *gc, void *fdt, uint64_t base,
-                                 uint32_t irq, uint32_t backend_domid)
+                                 uint32_t irq, uint32_t backend_domid,
+                                 bool forced_grant)
 {
     int res;
 
-    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid, forced_grant);
     if (res) return res;
 
     return fdt_end_node(fdt);
@@ -1019,11 +1021,11 @@ static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt)
 
 static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
                                         uint32_t irq, const char *type,
-                                        uint32_t backend_domid)
+                                        uint32_t backend_domid, bool forced_grant)
 {
     int res;
 
-    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid, forced_grant);
     if (res) return res;
 
     /* Add device specific nodes */
@@ -1363,7 +1365,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
                     iommu_needed = true;
 
                 FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
-                                           disk->backend_domid) );
+                                           disk->backend_domid, false) );
             }
         }
 
@@ -1373,12 +1375,13 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
             if (virtio->transport != LIBXL_VIRTIO_TRANSPORT_MMIO)
                 continue;
 
-            if (virtio->backend_domid != LIBXL_TOOLSTACK_DOMID)
+            if (virtio->forced_grant || virtio->backend_domid != LIBXL_TOOLSTACK_DOMID)
                 iommu_needed = true;
 
             FDT( make_virtio_mmio_node_device(gc, fdt, virtio->base,
                                               virtio->irq, virtio->type,
-                                              virtio->backend_domid) );
+                                              virtio->backend_domid,
+                                              virtio->forced_grant) );
         }
 
         /*
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index c10292e0d7e3..cfbcd717dc7f 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -740,6 +740,7 @@ libxl_device_virtio = Struct("device_virtio", [
     ("backend_domname", string),
     ("type", string),
     ("transport", libxl_virtio_transport),
+    ("forced_grant", bool),
     ("devid", libxl_devid),
     # Note that virtio-mmio parameters (irq and base) are for internal
     # use by libxl and can't be modified.
diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
index faada49e184e..e1f15344ef97 100644
--- a/tools/libs/light/libxl_virtio.c
+++ b/tools/libs/light/libxl_virtio.c
@@ -48,11 +48,13 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
     flexarray_append_pair(back, "base", GCSPRINTF("%#"PRIx64, virtio->base));
     flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
     flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
+    flexarray_append_pair(back, "forced_grant", GCSPRINTF("%u", virtio->forced_grant));
 
     flexarray_append_pair(front, "irq", GCSPRINTF("%u", virtio->irq));
     flexarray_append_pair(front, "base", GCSPRINTF("%#"PRIx64, virtio->base));
     flexarray_append_pair(front, "type", GCSPRINTF("%s", virtio->type));
     flexarray_append_pair(front, "transport", GCSPRINTF("%s", transport));
+    flexarray_append_pair(front, "forced_grant", GCSPRINTF("%u", virtio->forced_grant));
 
     return 0;
 }
@@ -104,6 +106,15 @@ static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
         }
     }
 
+    tmp = NULL;
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+				GCSPRINTF("%s/forced_grant", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        virtio->forced_grant = strtoul(tmp, NULL, 0);
+    }
+
     tmp = NULL;
     rc = libxl__xs_read_checked(gc, XBT_NULL,
 				GCSPRINTF("%s/type", be_path), &tmp);
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1f6f47daf4e1..3e34da099785 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1215,6 +1215,8 @@ static int parse_virtio_config(libxl_device_virtio *virtio, char *token)
     } else if (MATCH_OPTION("transport", token, oparg)) {
         rc = libxl_virtio_transport_from_string(oparg, &virtio->transport);
         if (rc) return rc;
+    } else if (MATCH_OPTION("forced_grant", token, oparg)) {
+        virtio->forced_grant = strtoul(oparg, NULL, 0);
     } else {
         fprintf(stderr, "Unknown string \"%s\" in virtio spec\n", token);
         return -1;
-- 
2.31.1.272.g89b43f80a514


