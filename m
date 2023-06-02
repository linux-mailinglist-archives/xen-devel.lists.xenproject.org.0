Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C828071F9C4
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 07:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542927.847393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4xfQ-0005Ub-8Q; Fri, 02 Jun 2023 05:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542927.847393; Fri, 02 Jun 2023 05:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4xfQ-0005Ri-3Z; Fri, 02 Jun 2023 05:49:40 +0000
Received: by outflank-mailman (input) for mailman id 542927;
 Fri, 02 Jun 2023 05:49:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dv8B=BW=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1q4xfO-0004g6-8s
 for xen-devel@lists.xen.org; Fri, 02 Jun 2023 05:49:38 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41ea7266-0109-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 07:49:37 +0200 (CEST)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6af89b0f3e5so1660327a34.0
 for <xen-devel@lists.xen.org>; Thu, 01 Jun 2023 22:49:37 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 u11-20020aa7848b000000b0063f2e729127sm225444pfn.144.2023.06.01.22.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 22:49:35 -0700 (PDT)
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
X-Inumbo-ID: 41ea7266-0109-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685684976; x=1688276976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXMLaPMue+uL4pD6dz7ArFXAqp8Vlz5f6SfADwc6jPo=;
        b=mFKvKglkt9XRUuGMPlMikCG6rF35/Nhu02q30dgjlKtMUvyc318gLqAgzc3UaqW/HK
         cC4qvSnl6IyT2KWCR8LySbB7ose3xHnZaNtYm/gZbPee5Vc0cAzlAgKTQ5QcIBXGriAQ
         JQVZ9hieYH2HVPaVZ5S4ode4K+ucy9EjxgIDZ1TqWU6TO+HnlIYs3k7qi7/5I3auWdhE
         Lowczm5av12kzP4JLWSghe4XhyXbFfp7HOMRhAvxQsLcqtib3fqIHiLVLhFJdRDVlSnY
         DokUjbb/f4BZaOuTozvNPtiD8JJvyCNUJfBlWdnadO/OBf0Ghxr1s2fx3h6Lggwo0bBn
         1sVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685684976; x=1688276976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXMLaPMue+uL4pD6dz7ArFXAqp8Vlz5f6SfADwc6jPo=;
        b=I7kFoHiSt9+OOODY9w3C6NVoJgKsv2zKEDVIKrZhgyGT/CURwFtJqIsasZV7oqMVeG
         J9T0xobG1qeGl0NE7UgMWhKktcz6OSP5Nv1ayCgam4VWdpwb8VrWN8W4dkKMt7Zfyr6J
         5aPUuwZh/icw5M2u8wHQF0JIo81CZCECKYnVh6cVTt1YRgY3zh9Lr723Ef6RQSFILx/U
         x687h2dTN45PhLrB5sFru8I7BDV+PIfhJJRxDHCLRNFRl2OEF6vbEBna9PvtnxanSJ5l
         kT2Om40DJtL17w9Cnrc6flpbCq3DuxZnvVzR63Sgx1awR57Js25J57ZYqXmN28EDqs2P
         +TQw==
X-Gm-Message-State: AC+VfDxkb7ZPfZqrJBPaD29xdth8Ocm+cGwFpqVhxE1j0iA2SDuGiQI3
	BNETKpbOv/S/RzuIz1eE6tiUCe1/CykWQ3FI980=
X-Google-Smtp-Source: ACHHUZ6f+n9x8kcM5ICHaoBfBsV7DG9hnoFb65So2oOrBlPMKr91SCRowromT8FmV+i1HfrumhZBhw==
X-Received: by 2002:a05:6830:e06:b0:6b0:ca4f:8504 with SMTP id do6-20020a0568300e0600b006b0ca4f8504mr1495774otb.27.1685684976286;
        Thu, 01 Jun 2023 22:49:36 -0700 (PDT)
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
Subject: [PATCH V3 3/3] libxl: arm: Add grant_usage parameter for virtio devices
Date: Fri,  2 Jun 2023 11:19:09 +0530
Message-Id: <0e347b2f4817cc578a5f8e41bf70503ae8cf69e3.1685684586.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1685684586.git.viresh.kumar@linaro.org>
References: <cover.1685684586.git.viresh.kumar@linaro.org>
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
---
 docs/man/xl.cfg.5.pod.in             |  8 ++++++++
 tools/golang/xenlight/helpers.gen.go |  6 ++++++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/libs/light/libxl_arm.c         | 22 +++++++++++++---------
 tools/libs/light/libxl_types.idl     |  1 +
 tools/libs/light/libxl_virtio.c      | 23 +++++++++++++++++++++--
 tools/xl/xl_parse.c                  |  2 ++
 7 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 24ac92718288..3a40ac8cb322 100644
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
index 0a203d22321f..bf846dca8ec0 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1792,6 +1792,9 @@ func (x *DeviceVirtio) fromC(xc *C.libxl_device_virtio) error {
 x.BackendDomname = C.GoString(xc.backend_domname)
 x.Type = C.GoString(xc._type)
 x.Transport = VirtioTransport(xc.transport)
+if err := x.GrantUsage.fromC(&xc.grant_usage);err != nil {
+return fmt.Errorf("converting field GrantUsage: %v", err)
+}
 x.Devid = Devid(xc.devid)
 x.Irq = uint32(xc.irq)
 x.Base = uint64(xc.base)
@@ -1809,6 +1812,9 @@ xc.backend_domname = C.CString(x.BackendDomname)}
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
index a7c17699f80e..e0c6e91bb0ef 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -683,6 +683,7 @@ BackendDomid Domid
 BackendDomname string
 Type string
 Transport VirtioTransport
+GrantUsage Defbool
 Devid Devid
 Irq uint32
 Base uint64
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 97c80d7ed0fa..bc2bd9649b95 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -922,7 +922,8 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
 
 /* The caller is responsible to complete / close the fdt node */
 static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
-                                        uint32_t irq, uint32_t backend_domid)
+                                        uint32_t irq, uint32_t backend_domid,
+                                        bool grant_usage)
 {
     int res;
     gic_interrupt intr;
@@ -945,7 +946,7 @@ static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
     res = fdt_property(fdt, "dma-coherent", NULL, 0);
     if (res) return res;
 
-    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
+    if (grant_usage) {
         uint32_t iommus_prop[2];
 
         iommus_prop[0] = cpu_to_fdt32(GUEST_PHANDLE_IOMMU);
@@ -959,11 +960,12 @@ static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
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
@@ -1019,11 +1021,11 @@ static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt)
 
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
@@ -1363,7 +1365,8 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
                     iommu_needed = true;
 
                 FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
-                                           disk->backend_domid) );
+                                           disk->backend_domid,
+                                           disk->backend_domid != LIBXL_TOOLSTACK_DOMID) );
             }
         }
 
@@ -1373,12 +1376,13 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
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
index c10292e0d7e3..c5c0d1f91793 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -740,6 +740,7 @@ libxl_device_virtio = Struct("device_virtio", [
     ("backend_domname", string),
     ("type", string),
     ("transport", libxl_virtio_transport),
+    ("grant_usage", libxl_defbool),
     ("devid", libxl_devid),
     # Note that virtio-mmio parameters (irq and base) are for internal
     # use by libxl and can't be modified.
diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
index f8a78e22d156..19d834984777 100644
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
@@ -48,11 +56,13 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
                                       flexarray_t *ro_front)
 {
     const char *transport = libxl_virtio_transport_to_string(virtio->transport);
+    const char *grant_usage = libxl_defbool_to_string(virtio->grant_usage);
 
     flexarray_append_pair(back, "irq", GCSPRINTF("%u", virtio->irq));
     flexarray_append_pair(back, "base", GCSPRINTF("%#"PRIx64, virtio->base));
     flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
     flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
+    flexarray_append_pair(back, "grant_usage", GCSPRINTF("%s", grant_usage));
 
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
index 1f6f47daf4e1..c66b11fd01b2 100644
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


