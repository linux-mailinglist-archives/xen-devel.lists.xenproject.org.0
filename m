Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B50749667
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 09:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559675.874898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJR7-0004yt-Hk; Thu, 06 Jul 2023 07:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559675.874898; Thu, 06 Jul 2023 07:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJR7-0004xM-DR; Thu, 06 Jul 2023 07:29:57 +0000
Received: by outflank-mailman (input) for mailman id 559675;
 Thu, 06 Jul 2023 07:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oboG=CY=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qHJR5-0004xE-Lq
 for xen-devel@lists.xen.org; Thu, 06 Jul 2023 07:29:55 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4434788-1bce-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 09:29:51 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-262e839647eso367262a91.2
 for <xen-devel@lists.xen.org>; Thu, 06 Jul 2023 00:29:51 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 t11-20020a170902e84b00b001b8b6a19bd6sm690159plg.63.2023.07.06.00.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 00:29:48 -0700 (PDT)
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
X-Inumbo-ID: e4434788-1bce-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688628589; x=1691220589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ur6U8znIrg+MN1C36AIYyVQaxBlVTa6MnJ12V0yVeWc=;
        b=dk4yfLxO8MqrpL0At35TL5vjmOQOzIZIL8HlehxabEUx4MXzFwfguq+MwfC59UoLNw
         Nd8gXX7nFsBU/oXffL0gpam4l7aFKM0y+Y+E5LIS85dCEd+crABbs6xichq2oIqLa2NF
         qHxzySTciQHGjbJ/91CJ4hOGkHDZkIa/32GkFdtNCyPYC4xThBH6s3B4Aba0kMrMLKCj
         66Yw+MKE2B9uuwvSVxAsFd6LkFfNhlHoY5tXgsy7VFED7/76Pcs9KJsIw0nPd67S+17B
         PmvJwiwTUFndTJLoRV+cADqPoiu+HXypyWc2cdymKLm2/9r6Iix50wr4BUxLDWQfUV/7
         E1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688628589; x=1691220589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ur6U8znIrg+MN1C36AIYyVQaxBlVTa6MnJ12V0yVeWc=;
        b=JXzjI6ky1W64C3i8suOLFIBSESzrYXLT8TcIxSvg7G5cWAHjUgUFvJftOnvoOn/cJp
         cQdXNWvk3vXkEHzR1KBJhOhiTWZIXZ+u68zE/ohIebf8d/iokqcW5ALsUCYwk0h1uypz
         Si4idwlpD17IPk7r4rnaJWayvKNrkNdWadTGTZbxFkaQrr7rGF+SOEjIZntI2s8UmzuJ
         rfG2cGLDbtHm44IrVcEnGvkn5ezMtB6FOrQhhGOX5p076+k+bWZDFkclDgDxsZltp+ja
         cmE6dvCpb1omT5BdivUlHjErqwwqDvp0Ct8+2l9C6dKotsd7M+S6GQ4HkxKO9z+h5/vC
         fI/A==
X-Gm-Message-State: ABy/qLaMguZvX2DrKxhDIf3f9J+rBPXLnTEw2WmDrUJ21ZQxjVDF//Tb
	rHfK40xPN4tSI19qHPc8sPoHq/Kh9DQ0NgH9MD0=
X-Google-Smtp-Source: APBJJlFWdg1wCn3ML0F/nyJH5NldND2oLYGYDiT7x2hCCHOfTnYm3RlEj8jcTw/xgxrhbkVzXkBCMA==
X-Received: by 2002:a17:90b:4f85:b0:261:875:c2be with SMTP id qe5-20020a17090b4f8500b002610875c2bemr979257pjb.29.1688628589457;
        Thu, 06 Jul 2023 00:29:49 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: [PATCH V4] libxl: arm: Add grant_usage parameter for virtio devices
Date: Thu,  6 Jul 2023 12:59:45 +0530
Message-Id: <144a57807d6f3e6c1e9b45215cb4fa5fa4535f10.1688628006.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the grant mapping related device tree properties are added if
the backend domain is not Dom0. While Dom0 is privileged and can do
foreign mapping for the entire guest memory, it is still desired for
Dom0 to access guest's memory via grant mappings and hence map only what
is required.

This commit adds the "grant_usage" parameter for virtio devices, which
provides better control over the functionality.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
V3.1->V4:
- Added Reviewed-by tags.
- Other patches from the series are already applied.
- No code changes.

V3->V3.1:
- Print "0" or "1" in xenstore instead of "True" or "False" for grant_usage.

V2->V3:
- Reuse `libxl_defbool` instead of defining a new type, it can take values 0 and 1.
- Improved commit logs and comments.

V1->V2:
- Instead of just 0 or 1, the argument can take multiple values now and control
  the functionality in a better way.

- Update .gen.go files as well.

- Don't add nodes under frontend path.

 docs/man/xl.cfg.5.pod.in             |  8 ++++++++
 tools/golang/xenlight/helpers.gen.go |  6 ++++++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/libs/light/libxl_arm.c         | 22 +++++++++++++---------
 tools/libs/light/libxl_types.idl     |  1 +
 tools/libs/light/libxl_virtio.c      | 23 +++++++++++++++++++++--
 tools/xl/xl_parse.c                  |  2 ++
 7 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 3979be2a590a..b6fc20ef01c8 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1619,6 +1619,14 @@ hexadecimal format, without the "0x" prefix and all in lower case, like
 Specifies the transport mechanism for the Virtio device, only "mmio" is
 supported for now.
 
+=item B<grant_usage=BOOLEAN>
+
+If this option is B<true>, the Xen grants are always enabled.
+If this option is B<false>, the Xen grants are always disabled.
+
+If this option is missing, then the default grant setting will be used,
+i.e. enable grants if backend-domid != 0.
+
 =back
 
 =item B<tee="STRING">
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index cd1a16e32eac..3ecffdf0ef3a 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1794,6 +1794,9 @@ func (x *DeviceVirtio) fromC(xc *C.libxl_device_virtio) error {
 x.BackendDomname = C.GoString(xc.backend_domname)
 x.Type = C.GoString(xc._type)
 x.Transport = VirtioTransport(xc.transport)
+if err := x.GrantUsage.fromC(&xc.grant_usage);err != nil {
+return fmt.Errorf("converting field GrantUsage: %v", err)
+}
 x.Devid = Devid(xc.devid)
 x.Irq = uint32(xc.irq)
 x.Base = uint64(xc.base)
@@ -1811,6 +1814,9 @@ xc.backend_domname = C.CString(x.BackendDomname)}
 if x.Type != "" {
 xc._type = C.CString(x.Type)}
 xc.transport = C.libxl_virtio_transport(x.Transport)
+if err := x.GrantUsage.toC(&xc.grant_usage); err != nil {
+return fmt.Errorf("converting field GrantUsage: %v", err)
+}
 xc.devid = C.libxl_devid(x.Devid)
 xc.irq = C.uint32_t(x.Irq)
 xc.base = C.uint64_t(x.Base)
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index b131a7eedc9d..4f40aac28c2a 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -706,6 +706,7 @@ BackendDomid Domid
 BackendDomname string
 Type string
 Transport VirtioTransport
+GrantUsage Defbool
 Devid Devid
 Irq uint32
 Base uint64
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 35f76dfc21e4..f98e1affa294 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -930,7 +930,8 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
 
 /* The caller is responsible to complete / close the fdt node */
 static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
-                                        uint32_t irq, uint32_t backend_domid)
+                                        uint32_t irq, uint32_t backend_domid,
+                                        bool grant_usage)
 {
     int res;
     gic_interrupt intr;
@@ -953,7 +954,7 @@ static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
     res = fdt_property(fdt, "dma-coherent", NULL, 0);
     if (res) return res;
 
-    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
+    if (grant_usage) {
         uint32_t iommus_prop[2];
 
         iommus_prop[0] = cpu_to_fdt32(GUEST_PHANDLE_IOMMU);
@@ -967,11 +968,12 @@ static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
 }
 
 static int make_virtio_mmio_node(libxl__gc *gc, void *fdt, uint64_t base,
-                                 uint32_t irq, uint32_t backend_domid)
+                                 uint32_t irq, uint32_t backend_domid,
+                                 bool grant_usage)
 {
     int res;
 
-    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid, grant_usage);
     if (res) return res;
 
     return fdt_end_node(fdt);
@@ -1027,11 +1029,11 @@ static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt)
 
 static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
                                         uint32_t irq, const char *type,
-                                        uint32_t backend_domid)
+                                        uint32_t backend_domid, bool grant_usage)
 {
     int res;
 
-    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid, grant_usage);
     if (res) return res;
 
     /* Add device specific nodes */
@@ -1371,7 +1373,8 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
                     iommu_needed = true;
 
                 FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
-                                           disk->backend_domid) );
+                                           disk->backend_domid,
+                                           disk->backend_domid != LIBXL_TOOLSTACK_DOMID) );
             }
         }
 
@@ -1381,12 +1384,13 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
             if (virtio->transport != LIBXL_VIRTIO_TRANSPORT_MMIO)
                 continue;
 
-            if (virtio->backend_domid != LIBXL_TOOLSTACK_DOMID)
+            if (libxl_defbool_val(virtio->grant_usage))
                 iommu_needed = true;
 
             FDT( make_virtio_mmio_node_device(gc, fdt, virtio->base,
                                               virtio->irq, virtio->type,
-                                              virtio->backend_domid) );
+                                              virtio->backend_domid,
+                                              libxl_defbool_val(virtio->grant_usage)) );
         }
 
         /*
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9e48bb772646..700b44a164f4 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -762,6 +762,7 @@ libxl_device_virtio = Struct("device_virtio", [
     ("backend_domname", string),
     ("type", string),
     ("transport", libxl_virtio_transport),
+    ("grant_usage", libxl_defbool),
     ("devid", libxl_devid),
     # Note that virtio-mmio parameters (irq and base) are for internal
     # use by libxl and can't be modified.
diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
index f8a78e22d156..e5e321adc5c4 100644
--- a/tools/libs/light/libxl_virtio.c
+++ b/tools/libs/light/libxl_virtio.c
@@ -23,8 +23,16 @@ static int libxl__device_virtio_setdefault(libxl__gc *gc, uint32_t domid,
                                            libxl_device_virtio *virtio,
                                            bool hotplug)
 {
-    return libxl__resolve_domid(gc, virtio->backend_domname,
-                                &virtio->backend_domid);
+    int rc;
+
+    rc = libxl__resolve_domid(gc, virtio->backend_domname,
+                              &virtio->backend_domid);
+    if (rc < 0) return rc;
+
+    libxl_defbool_setdefault(&virtio->grant_usage,
+                             virtio->backend_domid != LIBXL_TOOLSTACK_DOMID);
+
+    return 0;
 }
 
 static int libxl__device_from_virtio(libxl__gc *gc, uint32_t domid,
@@ -53,6 +61,8 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
     flexarray_append_pair(back, "base", GCSPRINTF("%#"PRIx64, virtio->base));
     flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
     flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
+    flexarray_append_pair(back, "grant_usage",
+                          libxl_defbool_val(virtio->grant_usage) ? "1" : "0");
 
     return 0;
 }
@@ -104,6 +114,15 @@ static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
         }
     }
 
+    tmp = NULL;
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+                                GCSPRINTF("%s/grant_usage", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        libxl_defbool_set(&virtio->grant_usage, strtoul(tmp, NULL, 0));
+    }
+
     tmp = NULL;
     rc = libxl__xs_read_checked(gc, XBT_NULL,
 				GCSPRINTF("%s/type", be_path), &tmp);
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index f036e56fc239..dfd432ca02e2 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1215,6 +1215,8 @@ static int parse_virtio_config(libxl_device_virtio *virtio, char *token)
     } else if (MATCH_OPTION("transport", token, oparg)) {
         rc = libxl_virtio_transport_from_string(oparg, &virtio->transport);
         if (rc) return rc;
+    } else if (MATCH_OPTION("grant_usage", token, oparg)) {
+        libxl_defbool_set(&virtio->grant_usage, strtoul(oparg, NULL, 0));
     } else {
         fprintf(stderr, "Unknown string \"%s\" in virtio spec\n", token);
         return -1;
-- 
2.31.1.272.g89b43f80a514


