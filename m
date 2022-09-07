Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74615B03F0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401551.643403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuEK-0007gG-Qs; Wed, 07 Sep 2022 12:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401551.643403; Wed, 07 Sep 2022 12:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuEK-0007dU-MU; Wed, 07 Sep 2022 12:32:32 +0000
Received: by outflank-mailman (input) for mailman id 401551;
 Wed, 07 Sep 2022 12:32:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aULX=ZK=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oVuEI-0006fq-V0
 for xen-devel@lists.xen.org; Wed, 07 Sep 2022 12:32:31 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22aa3ed9-2ea9-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 14:32:29 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id s14so4789673plr.4
 for <xen-devel@lists.xen.org>; Wed, 07 Sep 2022 05:32:29 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 b6-20020a170903228600b00174a4bcefc7sm12257363plh.217.2022.09.07.05.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 05:32:26 -0700 (PDT)
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
X-Inumbo-ID: 22aa3ed9-2ea9-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=gaf2Ai+4pfK/vxUpvtg4CvsU9IMKntoNQgpDE/R9+Ms=;
        b=UVwK/jr9C3HcbKjVP7f5N8Ro0hYhG8ttPuhaHCkZzfkDpUCnhoEsM18UFQ2lpaABPg
         gRF+xLe/lZV2CHO9iVoLdNhRxXtuVSxStLt2uTpY1+XueI8LIxLkkfgwHnbx+XeAaIS5
         lZrkUqvXSF4prdzJJSO7jMnsj40QMvJTckDGml9e/oNmbgm6gGWMcHQ6ia6F6g/cqOCt
         ATWUZiTQhHADl8WWyrKprOCfwIvjuAwVF6pdF/YeCeEAcMUabrHHhpFD5p2Yh/ZkiYM1
         ks0K8LHqQZjnBKvPtnVKWExIp6lWTPhuFa0zvRo7Zshevc8NwzaQdgRptBJHLdp98m0l
         /bMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gaf2Ai+4pfK/vxUpvtg4CvsU9IMKntoNQgpDE/R9+Ms=;
        b=xEw5t86n2LjJylA8qk/Z2JpL5YvlUVLKbWHcz9t8BrevCBTKsUdFv7bWWlOQpv0evN
         Y3KCu7slqS85kkl6VyqoZsF3DCE7X5NZ5gJ+jJ/KSJjNrAC9NzyWOmHBj99fO/dqUZ5r
         7Sxif9/yyWD3E0OBCHvQ4g40qlerQ61MJAmxwnGJ1cUmuCHHBq4atkyjykf2FaQlV0pf
         ma8ixBvQJE3pv6xOBGFqhhlYz/fBZXX+9j9rzX3k8i5AMsYONF0uWE1dlFb311SXC5w+
         QeNkCoNr4eKCCuKzMwDhTVm4PHrlpzhZVFb0tfes1P/4kO0WOIOES2yju4Y8V/yZLyuO
         OqdA==
X-Gm-Message-State: ACgBeo0Kufi5TIZDiVa5n0IQVVHjwTS/LmNU1cfP2We1T/swycsOwUda
	lY8587mJYX97lXyFkv5mHDkk7g==
X-Google-Smtp-Source: AA6agR5qPemPA+OXGqUYAD+8RFHbcaRSPCHqM0D9kUa+2dgVF+NGLo8rcjrdyek7lAfR38CeKxzHDg==
X-Received: by 2002:a17:903:268d:b0:176:a84a:78b1 with SMTP id jf13-20020a170903268d00b00176a84a78b1mr3681196plb.165.1662553947904;
        Wed, 07 Sep 2022 05:32:27 -0700 (PDT)
Date: Wed, 7 Sep 2022 18:02:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org, Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V5 1/6] libxl: Add support for Virtio I2C device
Message-ID: <20220907123224.rz7vvope37l6l6mg@vireshk-i7>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <8b47d98cec83ca33a2b409c9371356820dd91b7a.1661159474.git.viresh.kumar@linaro.org>
 <YxdyGXxois95bNdI@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxdyGXxois95bNdI@perard.uk.xensource.com>

Hi Anthony,

Thanks a lot for the in-depth review, it is really helpful.

I don't have much knowledge of the Xen code and wanted this code for I2C and
GPIO to be tested on Xen for the work we are doing around hypervisor agnostic
backends [1].

I started looking for a simple device's implementation and began by (blindly)
copying code from Keyboard device and so much of wasted code in here, which
isn't really required.

On 06-09-22, 17:15, Anthony PERARD wrote:
> On Mon, Aug 22, 2022 at 02:45:13PM +0530, Viresh Kumar wrote:
> > An example of domain configuration for Virtio I2c:
> > i2c = [ "" ]
> 
> Is this doing something meaningful (with the whole series applied)?

If I am not wrong, this is required by parse_i2c_list()'s implementation.
Without this I don't get the I2C device populated in the guest.

Is there another way to achieve it ?

I have removed a lot of code now and what I have left is pasted at the end of
this email, does this look better now ? And yes, I will update documentation and
look again at any formatting issues before sending it.

Thanks.

-- 
viresh

[1] https://lore.kernel.org/all/20220414092358.kepxbmnrtycz7mhe@vireshk-i7/

-------------------------8<-------------------------

Subject: [PATCH] libxl: Add support for Virtio I2C device

This patch adds basic support for configuring and assisting virtio-mmio
based virtio-i2c backend (a hypervisor independent emulator) which could
run in any domain.

An example of domain configuration for Virtio I2C:
i2c = [ "" ]

Also to make this work on Arm, allocate Virtio MMIO params (IRQ and
memory region) and pass them to the backend. Update guest device-tree as
wellto create a DT node for the virtio I2C device.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/Makefile                 |   1 +
 tools/libs/light/libxl_arm.c              |  39 ++++++++
 tools/libs/light/libxl_create.c           |   5 +
 tools/libs/light/libxl_i2c.c              | 117 ++++++++++++++++++++++
 tools/libs/light/libxl_internal.h         |   1 +
 tools/libs/light/libxl_types.idl          |  22 ++++
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/ocaml/libs/xl/genwrap.py            |   1 +
 tools/ocaml/libs/xl/xenlight_stubs.c      |   1 +
 tools/xl/xl_parse.c                       |  63 ++++++++++++
 tools/xl/xl_parse.h                       |   1 +
 11 files changed, 252 insertions(+)
 create mode 100644 tools/libs/light/libxl_i2c.c

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 13545654c2fc..961bdd33297b 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -112,6 +112,7 @@ OBJS-y += libxl_vdispl.o
 OBJS-y += libxl_pvcalls.o
 OBJS-y += libxl_vsnd.o
 OBJS-y += libxl_vkb.o
+OBJS-y += libxl_i2c.o
 OBJS-y += libxl_genid.o
 OBJS-y += _libxl_types.o
 OBJS-y += libxl_flask.o
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 2637acafa358..c23ecbcd8528 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -113,6 +113,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         }
     }
 
+    for (i = 0; i < d_config->num_i2cs; i++) {
+        libxl_device_i2c *i2c = &d_config->i2cs[i];
+        rc = alloc_virtio_mmio_params(gc, &i2c->base, &i2c->irq,
+                                      &virtio_mmio_base, &virtio_mmio_irq);
+
+        if (rc)
+            return rc;
+    }
+
     /*
      * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
      * present, make sure that we allocate enough SPIs for them.
@@ -956,6 +965,26 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt, uint64_t base,
     return fdt_end_node(fdt);
 }
 
+static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt, uint64_t base,
+                                     uint32_t irq, uint32_t backend_domid)
+{
+    int res;
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    if (res) return res;
+
+    res = fdt_begin_node(fdt, "i2c");
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "virtio,device22");
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    return fdt_end_node(fdt);
+}
+
 static const struct arch_info *get_arch_info(libxl__gc *gc,
                                              const struct xc_dom_image *dom)
 {
@@ -1278,6 +1307,16 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
             }
         }
 
+        for (i = 0; i < d_config->num_i2cs; i++) {
+            libxl_device_i2c *i2c = &d_config->i2cs[i];
+
+            if (i2c->backend_domid != LIBXL_TOOLSTACK_DOMID)
+                iommu_needed = true;
+
+            FDT( make_virtio_mmio_node_i2c(gc, fdt, i2c->base, i2c->irq,
+                                           i2c->backend_domid) );
+        }
+
         /*
          * Note, this should be only called after creating all virtio-mmio
          * device nodes
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index b9dd2deedf13..f18a7f829703 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1797,6 +1797,11 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
                               &d_config->vkbs[i]);
         }
 
+        for (i = 0; i < d_config->num_i2cs; i++) {
+            libxl__device_add(gc, domid, &libxl__i2c_devtype,
+                              &d_config->i2cs[i]);
+        }
+
         if (d_config->b_info.arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
             init_console_info(gc, &vuart, 0);
             vuart.backend_domid = state->console_domid;
diff --git a/tools/libs/light/libxl_i2c.c b/tools/libs/light/libxl_i2c.c
new file mode 100644
index 000000000000..ffbde41cc62b
--- /dev/null
+++ b/tools/libs/light/libxl_i2c.c
@@ -0,0 +1,117 @@
+/*
+ * Copyright (C) 2022 Linaro Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+#include "libxl_internal.h"
+
+static int libxl__device_i2c_setdefault(libxl__gc *gc, uint32_t domid,
+                                        libxl_device_i2c *i2c, bool hotplug)
+{
+    return libxl__resolve_domid(gc, i2c->backend_domname, &i2c->backend_domid);
+}
+
+static int libxl__set_xenstore_i2c(libxl__gc *gc, uint32_t domid,
+                                   libxl_device_i2c *i2c,
+                                   flexarray_t *back, flexarray_t *front,
+                                   flexarray_t *ro_front)
+{
+    flexarray_append_pair(back, "irq", GCSPRINTF("%u", i2c->irq));
+    flexarray_append_pair(back, "base", GCSPRINTF("%lu", i2c->base));
+
+    flexarray_append_pair(front, "irq", GCSPRINTF("%u", i2c->irq));
+    flexarray_append_pair(front, "base", GCSPRINTF("%lu", i2c->base));
+
+    return 0;
+}
+
+static int libxl__i2c_from_xenstore(libxl__gc *gc, const char *libxl_path,
+                                    libxl_devid devid,
+                                    libxl_device_i2c *i2c)
+{
+    const char *be_path, *fe_path, *tmp;
+    libxl__device dev;
+    int rc;
+
+    i2c->devid = devid;
+
+    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
+                                  GCSPRINTF("%s/backend", libxl_path),
+                                  &be_path);
+    if (rc) goto out;
+
+    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
+                                  GCSPRINTF("%s/frontend", libxl_path),
+                                  &fe_path);
+    if (rc) goto out;
+
+    rc = libxl__backendpath_parse_domid(gc, be_path, &i2c->backend_domid);
+    if (rc) goto out;
+
+    rc = libxl__parse_backend_path(gc, be_path, &dev);
+    if (rc) goto out;
+
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+				GCSPRINTF("%s/irq", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        i2c->irq = strtoul(tmp, NULL, 0);
+    }
+
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+				GCSPRINTF("%s/base", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        i2c->base = strtoul(tmp, NULL, 0);
+    }
+
+    rc = 0;
+
+out:
+
+    return rc;
+}
+
+static int libxl__device_from_i2c(libxl__gc *gc, uint32_t domid,
+                                  libxl_device_i2c *type, libxl__device *device)
+{
+    device->backend_devid   = type->devid;
+    device->backend_domid   = type->backend_domid;
+    device->backend_kind    = LIBXL__DEVICE_KIND_I2C;
+    device->devid           = type->devid;
+    device->domid           = domid;
+    device->kind            = LIBXL__DEVICE_KIND_I2C;
+
+    return 0;
+}
+
+static LIBXL_DEFINE_UPDATE_DEVID(i2c)
+
+#define libxl__add_i2cs NULL
+#define libxl_device_i2c_compare NULL
+
+DEFINE_DEVICE_TYPE_STRUCT(i2c, I2C, i2cs,
+    .skip_attach = 1,
+    .set_xenstore_config = (device_set_xenstore_config_fn_t)
+                           libxl__set_xenstore_i2c,
+    .from_xenstore = (device_from_xenstore_fn_t)libxl__i2c_from_xenstore
+);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index cb9e8b3b8b5a..a8904cfea427 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4003,6 +4003,7 @@ static inline int *libxl__device_type_get_num(
 
 extern const libxl__device_type libxl__vfb_devtype;
 extern const libxl__device_type libxl__vkb_devtype;
+extern const libxl__device_type libxl__i2c_devtype;
 extern const libxl__device_type libxl__disk_devtype;
 extern const libxl__device_type libxl__nic_devtype;
 extern const libxl__device_type libxl__vtpm_devtype;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index d634f304cda2..45e3b2755352 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -278,6 +278,10 @@ libxl_vkb_backend = Enumeration("vkb_backend", [
     (2, "LINUX")
     ])
 
+libxl_i2c_backend = Enumeration("i2c_backend", [
+    (1, "VIRTIO")
+    ])
+
 libxl_passthrough = Enumeration("passthrough", [
     (0, "default"),
     (1, "disabled"),
@@ -705,6 +709,14 @@ libxl_device_vkb = Struct("device_vkb", [
     ("multi_touch_num_contacts", uint32)
     ])
 
+libxl_device_i2c = Struct("device_i2c", [
+    ("backend_domid", libxl_domid),
+    ("backend_domname", string),
+    ("devid", libxl_devid),
+    ("irq", uint32),
+    ("base", uint64)
+    ])
+
 libxl_device_disk = Struct("device_disk", [
     ("backend_domid", libxl_domid),
     ("backend_domname", string),
@@ -982,6 +994,7 @@ libxl_domain_config = Struct("domain_config", [
     ("dtdevs", Array(libxl_device_dtdev, "num_dtdevs")),
     ("vfbs", Array(libxl_device_vfb, "num_vfbs")),
     ("vkbs", Array(libxl_device_vkb, "num_vkbs")),
+    ("i2cs", Array(libxl_device_i2c, "num_i2cs")),
     ("vtpms", Array(libxl_device_vtpm, "num_vtpms")),
     ("p9s", Array(libxl_device_p9, "num_p9s")),
     ("pvcallsifs", Array(libxl_device_pvcallsif, "num_pvcallsifs")),
@@ -1145,6 +1158,15 @@ libxl_vkbinfo = Struct("vkbinfo", [
     ("rref", integer)
     ], dir=DIR_OUT)
 
+libxl_i2cinfo = Struct("i2cinfo", [
+    ("backend", string),
+    ("backend_id", uint32),
+    ("frontend", string),
+    ("frontend_id", uint32),
+    ("devid", libxl_devid),
+    ("state", integer),
+    ], dir=DIR_OUT)
+
 # NUMA node characteristics: size and free are how much memory it has, and how
 # much of it is free, respectively. dists is an array of distances from this
 # node to each other node.
diff --git a/tools/libs/light/libxl_types_internal.idl b/tools/libs/light/libxl_types_internal.idl
index fb0f4f23d7c2..b1a94a963dfe 100644
--- a/tools/libs/light/libxl_types_internal.idl
+++ b/tools/libs/light/libxl_types_internal.idl
@@ -33,6 +33,7 @@ libxl__device_kind = Enumeration("device_kind", [
     (15, "VSND"),
     (16, "VINPUT"),
     (17, "VIRTIO_DISK"),
+    (18, "I2C"),
     ])
 
 libxl__console_backend = Enumeration("console_backend", [
diff --git a/tools/ocaml/libs/xl/genwrap.py b/tools/ocaml/libs/xl/genwrap.py
index 7bf26bdcd831..a9db0b97d80f 100644
--- a/tools/ocaml/libs/xl/genwrap.py
+++ b/tools/ocaml/libs/xl/genwrap.py
@@ -36,6 +36,7 @@ DEVICE_LIST =      [ ("list",           ["ctx", "domid", "t list"]),
 functions = { # ( name , [type1,type2,....] )
     "device_vfb":     DEVICE_FUNCTIONS,
     "device_vkb":     DEVICE_FUNCTIONS,
+    "device_i2c":     DEVICE_FUNCTIONS,
     "device_disk":    DEVICE_FUNCTIONS + DEVICE_LIST +
                       [ ("insert",         ["ctx", "t", "domid", "?async:'a", "unit", "unit"]),
                         ("of_vdev",        ["ctx", "domid", "string", "t"]),
diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
index 45b8af61c74a..cdf473f4ed57 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -707,6 +707,7 @@ DEVICE_ADDREMOVE(disk)
 DEVICE_ADDREMOVE(nic)
 DEVICE_ADDREMOVE(vfb)
 DEVICE_ADDREMOVE(vkb)
+DEVICE_ADDREMOVE(i2c)
 DEVICE_ADDREMOVE(pci)
 _DEVICE_ADDREMOVE(disk, cdrom, insert)
 
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1b5381cef033..243c08aa5f36 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1208,6 +1208,66 @@ static void parse_vkb_list(const XLU_Config *config,
     if (rc) exit(EXIT_FAILURE);
 }
 
+int parse_i2c_config(libxl_device_i2c *i2c, char *token)
+{
+    char *oparg;
+
+    if (MATCH_OPTION("backend", token, oparg)) {
+        i2c->backend_domname = strdup(oparg);
+    } else if (MATCH_OPTION("irq", token, oparg)) {
+        i2c->irq = strtoul(oparg, NULL, 0);
+    } else if (MATCH_OPTION("base", token, oparg)) {
+        i2c->base = strtoul(oparg, NULL, 0);
+    } else {
+        fprintf(stderr, "Unknown string \"%s\" in i2c spec\n", token);
+        return -1;
+    }
+
+    return 0;
+}
+
+static void parse_i2c_list(const XLU_Config *config,
+                           libxl_domain_config *d_config)
+{
+    XLU_ConfigList *i2cs;
+    const char *item;
+    char *buf = NULL;
+    int rc;
+
+    if (!xlu_cfg_get_list (config, "i2c", &i2cs, 0, 0)) {
+        int entry = 0;
+        while ((item = xlu_cfg_get_listitem(i2cs, entry)) != NULL) {
+            libxl_device_i2c *i2c;
+            char *p;
+
+            i2c = ARRAY_EXTEND_INIT(d_config->i2cs,
+                                    d_config->num_i2cs,
+                                    libxl_device_i2c_init);
+
+            buf = strdup(item);
+
+            p = strtok (buf, ",");
+            while (p != NULL)
+            {
+                while (*p == ' ') p++;
+
+                rc = parse_i2c_config(i2c, p);
+                if (rc) goto out;
+
+                p = strtok (NULL, ",");
+            }
+
+            entry++;
+        }
+    }
+
+    rc = 0;
+
+out:
+    free(buf);
+    if (rc) exit(EXIT_FAILURE);
+}
+
 void parse_config_data(const char *config_source,
                        const char *config_data,
                        int config_len,
@@ -2309,8 +2369,10 @@ void parse_config_data(const char *config_source,
 
     d_config->num_vfbs = 0;
     d_config->num_vkbs = 0;
+    d_config->num_i2cs = 0;
     d_config->vfbs = NULL;
     d_config->vkbs = NULL;
+    d_config->i2cs = NULL;
 
     if (!xlu_cfg_get_list (config, "vfb", &cvfbs, 0, 0)) {
         while ((buf = xlu_cfg_get_listitem (cvfbs, d_config->num_vfbs)) != NULL) {
@@ -2752,6 +2814,7 @@ void parse_config_data(const char *config_source,
     }
 
     parse_vkb_list(config, d_config);
+    parse_i2c_list(config, d_config);
 
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
                         &c_info->xend_suspend_evtchn_compat, 0);
diff --git a/tools/xl/xl_parse.h b/tools/xl/xl_parse.h
index bab2861f8c3e..4b972d525199 100644
--- a/tools/xl/xl_parse.h
+++ b/tools/xl/xl_parse.h
@@ -36,6 +36,7 @@ int parse_nic_config(libxl_device_nic *nic, XLU_Config **config, char *token);
 int parse_vdispl_config(libxl_device_vdispl *vdispl, char *token);
 int parse_vsnd_item(libxl_device_vsnd *vsnd, const char *spec);
 int parse_vkb_config(libxl_device_vkb *vkb, char *token);
+int parse_i2c_config(libxl_device_i2c *i2c, char *token);
 
 int match_option_size(const char *prefix, size_t len,
                       char *arg, char **argopt);

