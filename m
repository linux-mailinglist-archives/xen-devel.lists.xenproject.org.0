Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFBE6FED25
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 09:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533154.829578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px15A-0007g0-14; Thu, 11 May 2023 07:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533154.829578; Thu, 11 May 2023 07:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px159-0007dN-Tr; Thu, 11 May 2023 07:51:23 +0000
Received: by outflank-mailman (input) for mailman id 533154;
 Thu, 11 May 2023 07:51:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sau0=BA=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1px158-0007cv-E4
 for xen-devel@lists.xen.org; Thu, 11 May 2023 07:51:22 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9be22ab5-efd0-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 09:51:19 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6436e075166so6208268b3a.0
 for <xen-devel@lists.xen.org>; Thu, 11 May 2023 00:51:17 -0700 (PDT)
Received: from localhost ([122.172.82.60]) by smtp.gmail.com with ESMTPSA id
 s24-20020aa78298000000b0062a7462d398sm4827715pfm.170.2023.05.11.00.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 00:51:14 -0700 (PDT)
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
X-Inumbo-ID: 9be22ab5-efd0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683791476; x=1686383476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kl0WiYrFA4blVg1dBhdm+h7XFgspJ0eYE2qjacPrkmc=;
        b=aQQA9BcJCFvjCgTAMbDS1aOvb3MpQSgLOGHGrhbxZbEqb8ZvHC/MCsRHVoVjy/vV2W
         7NLWS8jr5KlqE5qqjbbNayNpP3HE/XH+cXZyOTqULL2ja1IkDm8DfMOdoaC4ifW1XCK9
         wUAPTqGJmu75tIVMAXVGNolIfj0FnEEGh+K7fIsTQVIRIWDb8tLCnyIXkVy6Nx+ZQpWe
         Svctv0O8aQXQIrSqyg3ToejMVgIo6qRB39E80gjK0r8yRSLiPFk08e2xrsl/kz2WQnSP
         F0Tv7uIwkeDs7epIkjHlR1qR+9+PtOcPHBYwlQd0rQugljggi4ePQIz2Mb8clBu3zM3h
         Lb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683791476; x=1686383476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kl0WiYrFA4blVg1dBhdm+h7XFgspJ0eYE2qjacPrkmc=;
        b=C3vorkcWprzzmM3neulY6urQHDQd7tlmuwBeW98m3J+jy3+2Ezi9surttCDpWoqRik
         wLiqt/c8QIBvvoAT3RxEaxeikKt+2eASAVOe67CmRvsUHEVecCSnvhCPSI99B9Ys1nDe
         6NsTJ240E80ZIIFj567SmwnXaW4QeoTTpgW3mHqDMq2lYCSJZV4IBtyjX0D7Or7lUiPz
         XSvc0YHCIqCK5eqpKpNzLIC/h4gDbpPgX+pwWADCNfCUUZGHcKz6vcIoOidF4pNPd82M
         Kmr/OE9lPB6CO16UHAw9LVysYWRRWdMkDHIJ/EZZBb+xzN0KsAvIcL0utDSwue071ogk
         doig==
X-Gm-Message-State: AC+VfDwsqgWLtKJnCEMQoKW+p9Mp48jgDmTCsAfaTSGN6IJoeNkxUKog
	tQxitQIHb3AP30LsEGHqYrlEuomHtCVljFALeYg=
X-Google-Smtp-Source: ACHHUZ50EORTIY5Rv5/CCsGB9qpo3pWKmJzM9KSlIKm1LWRHZ7QyXJRoDYthpJuJhJzDUtaWQK9iNA==
X-Received: by 2002:a05:6a20:1607:b0:103:d538:5ea6 with SMTP id l7-20020a056a20160700b00103d5385ea6mr1906448pzj.48.1683791476017;
        Thu, 11 May 2023 00:51:16 -0700 (PDT)
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
Subject: [PATCH V2 2/2] libxl: arm: Add grant_usage parameter for virtio devices
Date: Thu, 11 May 2023 13:20:43 +0530
Message-Id: <ccf5b1402fb7156be0ef33b44f7b114efbe76319.1683791298.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <782a7b3f54c36a3930a031647f6778e8dd02131d.1683791298.git.viresh.kumar@linaro.org>
References: <782a7b3f54c36a3930a031647f6778e8dd02131d.1683791298.git.viresh.kumar@linaro.org>
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
V1->V2:

- Instead of just 0 or 1, the argument can take multiple values now and control
  the functionality in a better way.

- Update .gen.go files as well.

- Don't add nodes under frontend path.

 docs/man/xl.cfg.5.pod.in             | 12 ++++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  8 ++++++++
 tools/libs/light/libxl_arm.c         | 27 ++++++++++++++++++---------
 tools/libs/light/libxl_types.idl     |  7 +++++++
 tools/libs/light/libxl_virtio.c      | 19 +++++++++++++++++++
 tools/xl/xl_parse.c                  |  3 +++
 7 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 24ac92718288..0405f6efe62a 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1619,6 +1619,18 @@ hexadecimal format, without the "0x" prefix and all in lower case, like
 Specifies the transport mechanism for the Virtio device, only "mmio" is
 supported for now.
 
+=item B<grant_usage=STRING>
+
+Specifies the grant usage details for the Virtio device. This can be set to
+following values:
+
+- "default": The default grant setting will be used, enable grants if
+  backend-domid != 0.
+
+- "enabled": The grants are always enabled.
+
+- "disabled": The grants are always disabled.
+
 =back
 
 =item B<tee="STRING">
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 0a203d22321f..71d9c24e382c 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1792,6 +1792,7 @@ func (x *DeviceVirtio) fromC(xc *C.libxl_device_virtio) error {
 x.BackendDomname = C.GoString(xc.backend_domname)
 x.Type = C.GoString(xc._type)
 x.Transport = VirtioTransport(xc.transport)
+x.GrantUsage = VirtioGrantUsage(xc.grant_usage)
 x.Devid = Devid(xc.devid)
 x.Irq = uint32(xc.irq)
 x.Base = uint64(xc.base)
@@ -1809,6 +1810,7 @@ xc.backend_domname = C.CString(x.BackendDomname)}
 if x.Type != "" {
 xc._type = C.CString(x.Type)}
 xc.transport = C.libxl_virtio_transport(x.Transport)
+xc.grant_usage = C.libxl_virtio_grant_usage(x.GrantUsage)
 xc.devid = C.libxl_devid(x.Devid)
 xc.irq = C.uint32_t(x.Irq)
 xc.base = C.uint64_t(x.Base)
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index a7c17699f80e..8f7234d3494a 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -261,6 +261,13 @@ VirtioTransportUnknown VirtioTransport = 0
 VirtioTransportMmio VirtioTransport = 1
 )
 
+type VirtioGrantUsage int
+const(
+VirtioGrantUsageDefault VirtioGrantUsage = 0
+VirtioGrantUsageDisabled VirtioGrantUsage = 1
+VirtioGrantUsageEnabled VirtioGrantUsage = 2
+)
+
 type Passthrough int
 const(
 PassthroughDefault Passthrough = 0
@@ -683,6 +690,7 @@ BackendDomid Domid
 BackendDomname string
 Type string
 Transport VirtioTransport
+GrantUsage VirtioGrantUsage
 Devid Devid
 Irq uint32
 Base uint64
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 97c80d7ed0fa..9cd7dbef0237 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -922,7 +922,8 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
 
 /* The caller is responsible to complete / close the fdt node */
 static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
-                                        uint32_t irq, uint32_t backend_domid)
+                                        uint32_t irq, uint32_t backend_domid,
+                                        bool use_grant)
 {
     int res;
     gic_interrupt intr;
@@ -945,7 +946,7 @@ static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
     res = fdt_property(fdt, "dma-coherent", NULL, 0);
     if (res) return res;
 
-    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
+    if (use_grant) {
         uint32_t iommus_prop[2];
 
         iommus_prop[0] = cpu_to_fdt32(GUEST_PHANDLE_IOMMU);
@@ -959,11 +960,12 @@ static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
 }
 
 static int make_virtio_mmio_node(libxl__gc *gc, void *fdt, uint64_t base,
-                                 uint32_t irq, uint32_t backend_domid)
+                                 uint32_t irq, uint32_t backend_domid,
+                                 bool use_grant)
 {
     int res;
 
-    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid, use_grant);
     if (res) return res;
 
     return fdt_end_node(fdt);
@@ -1019,11 +1021,11 @@ static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt)
 
 static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
                                         uint32_t irq, const char *type,
-                                        uint32_t backend_domid)
+                                        uint32_t backend_domid, bool use_grant)
 {
     int res;
 
-    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid, use_grant);
     if (res) return res;
 
     /* Add device specific nodes */
@@ -1363,22 +1365,29 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
                     iommu_needed = true;
 
                 FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
-                                           disk->backend_domid) );
+                                           disk->backend_domid,
+                                           disk->backend_domid != LIBXL_TOOLSTACK_DOMID) );
             }
         }
 
         for (i = 0; i < d_config->num_virtios; i++) {
             libxl_device_virtio *virtio = &d_config->virtios[i];
+            bool use_grant = false;
 
             if (virtio->transport != LIBXL_VIRTIO_TRANSPORT_MMIO)
                 continue;
 
-            if (virtio->backend_domid != LIBXL_TOOLSTACK_DOMID)
+            if ((virtio->grant_usage == LIBXL_VIRTIO_GRANT_USAGE_ENABLED) ||
+                ((virtio->grant_usage == LIBXL_VIRTIO_GRANT_USAGE_DEFAULT) &&
+                 (virtio->backend_domid != LIBXL_TOOLSTACK_DOMID))) {
+                use_grant = true;
                 iommu_needed = true;
+            }
 
             FDT( make_virtio_mmio_node_device(gc, fdt, virtio->base,
                                               virtio->irq, virtio->type,
-                                              virtio->backend_domid) );
+                                              virtio->backend_domid,
+                                              use_grant) );
         }
 
         /*
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index c10292e0d7e3..17228817f9b7 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -283,6 +283,12 @@ libxl_virtio_transport = Enumeration("virtio_transport", [
     (1, "MMIO"),
     ])
 
+libxl_virtio_grant_usage = Enumeration("virtio_grant_usage", [
+    (0, "DEFAULT"),
+    (1, "DISABLED"),
+    (2, "ENABLED"),
+    ])
+
 libxl_passthrough = Enumeration("passthrough", [
     (0, "default"),
     (1, "disabled"),
@@ -740,6 +746,7 @@ libxl_device_virtio = Struct("device_virtio", [
     ("backend_domname", string),
     ("type", string),
     ("transport", libxl_virtio_transport),
+    ("grant_usage", libxl_virtio_grant_usage),
     ("devid", libxl_devid),
     # Note that virtio-mmio parameters (irq and base) are for internal
     # use by libxl and can't be modified.
diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
index eadcb7124c3f..0a0fae967a0f 100644
--- a/tools/libs/light/libxl_virtio.c
+++ b/tools/libs/light/libxl_virtio.c
@@ -46,11 +46,13 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
                                       flexarray_t *ro_front)
 {
     const char *transport = libxl_virtio_transport_to_string(virtio->transport);
+    const char *grant_usage = libxl_virtio_grant_usage_to_string(virtio->grant_usage);
 
     flexarray_append_pair(back, "irq", GCSPRINTF("%u", virtio->irq));
     flexarray_append_pair(back, "base", GCSPRINTF("%#"PRIx64, virtio->base));
     flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
     flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
+    flexarray_append_pair(back, "grant_usage", GCSPRINTF("%s", grant_usage));
 
     return 0;
 }
@@ -102,6 +104,23 @@ static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
         }
     }
 
+    tmp = NULL;
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+				GCSPRINTF("%s/grant_usage", be_path), &tmp);
+    if (rc) goto out;
+
+    if (!tmp || !strcmp(tmp, "default")) {
+        virtio->grant_usage = LIBXL_VIRTIO_GRANT_USAGE_DEFAULT;
+    } else {
+        if (!strcmp(tmp, "enabled")) {
+            virtio->grant_usage = LIBXL_VIRTIO_GRANT_USAGE_ENABLED;
+        } else if (!strcmp(tmp, "disabled")) {
+            virtio->grant_usage = LIBXL_VIRTIO_GRANT_USAGE_DISABLED;
+        } else {
+            return ERROR_INVAL;
+        }
+    }
+
     tmp = NULL;
     rc = libxl__xs_read_checked(gc, XBT_NULL,
 				GCSPRINTF("%s/type", be_path), &tmp);
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1f6f47daf4e1..d2de3abfcd78 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1215,6 +1215,9 @@ static int parse_virtio_config(libxl_device_virtio *virtio, char *token)
     } else if (MATCH_OPTION("transport", token, oparg)) {
         rc = libxl_virtio_transport_from_string(oparg, &virtio->transport);
         if (rc) return rc;
+    } else if (MATCH_OPTION("grant_usage", token, oparg)) {
+        rc = libxl_virtio_grant_usage_from_string(oparg, &virtio->grant_usage);
+        if (rc) return rc;
     } else {
         fprintf(stderr, "Unknown string \"%s\" in virtio spec\n", token);
         return -1;
-- 
2.31.1.272.g89b43f80a514


