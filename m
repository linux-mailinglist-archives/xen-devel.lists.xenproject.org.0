Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994072973AA
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11223.29876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzuB-000293-N0; Fri, 23 Oct 2020 16:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11223.29876; Fri, 23 Oct 2020 16:27:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzuB-000282-HT; Fri, 23 Oct 2020 16:27:03 +0000
Received: by outflank-mailman (input) for mailman id 11223;
 Fri, 23 Oct 2020 16:27:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVzuA-0000v2-HC
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:27:02 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8512d213-ebb3-411b-ac50-ba2ab9e66ddb;
 Fri, 23 Oct 2020 16:26:22 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVztV-0008Nu-2M; Fri, 23 Oct 2020 16:26:21 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqu-000376-4o; Fri, 23 Oct 2020 16:23:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVzuA-0000v2-HC
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:27:02 +0000
X-Inumbo-ID: 8512d213-ebb3-411b-ac50-ba2ab9e66ddb
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8512d213-ebb3-411b-ac50-ba2ab9e66ddb;
	Fri, 23 Oct 2020 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=ILx3JMJce2ioNh3ZqL79hk3Ma28xIlwlj5jXju/NDSo=; b=yYuFGUw7nDAR/fYCQJIol4etH
	oHdy36tjOiw6boekQOWzfcXV79tqDBEnc3o8XexFeDJude7uCfQAfcCjZqrYLLQ+ViyjOzUoEIvz0
	ZGO5erBs7lSrgDN4iAGqfMDdAJZHJZKkKS/LVeUxjMnhWLE9E+4QtpmDzysYyJpMSLUe0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVztV-0008Nu-2M; Fri, 23 Oct 2020 16:26:21 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqu-000376-4o; Fri, 23 Oct 2020 16:23:40 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 23/25] xl / libxl: support naming of assignable devices
Date: Fri, 23 Oct 2020 16:23:12 +0000
Message-Id: <20201023162314.2235-24-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

This patch modifies libxl_device_pci_assignable_add() to take an optional
'name' argument, which (if supplied) is saved into xenstore and can hence be
used to refer to the now-assignable BDF in subsequent operations. To
facilitate this, a new libxl_device_pci_assignable_name2bdf() function is
added.

The xl code is modified to allow a name to be specified in the
'pci-assignable-add' operation and also allow an option to be specified to
'pci-assignable-list' requesting that names be displayed. The latter is
facilitated by a new libxl_device_pci_assignable_bdf2name() function. Finally
xl 'pci-assignable-remove' is modified to that either a name or BDF can be
supplied. The supplied 'identifier' is first assumed to be a name, but if
libxl_device_pci_assignable_name2bdf() fails to find a matching BDF the
identifier itself will be parsed as a BDF. Names my only include printable
characters and may not include whitespace.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Christian Lindig <christian.lindig@citrix.com>
Cc: David Scott <dave@recoil.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/libxl.h                | 19 +++++++-
 tools/libs/light/libxl_pci.c         | 86 +++++++++++++++++++++++++++++++++---
 tools/ocaml/libs/xl/xenlight_stubs.c |  3 +-
 tools/xl/xl_cmdtable.c               | 12 +++--
 tools/xl/xl_pci.c                    | 84 ++++++++++++++++++++++++-----------
 5 files changed, 166 insertions(+), 38 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 5703fdf367..4025d3a3d4 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -477,6 +477,14 @@
 #define LIBXL_HAVE_PCI_ASSIGNABLE_BDF 1
 
 /*
+ * LIBXL_HAVE_PCI_ASSIGNABLE_NAME indicates that the
+ * libxl_device_pci_assignable_add() function takes a 'name' argument
+ * and that the libxl_device_pci_assignable_name2bdf() and
+ * libxl_device_pci_assignable_bdf2name() functions are defined.
+ */
+#define LIBXL_HAVE_PCI_ASSIGNABLE_NAME 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
@@ -2385,11 +2393,18 @@ int libxl_device_events_handler(libxl_ctx *ctx,
  * added or is not bound, the functions will emit a warning but return
  * SUCCESS.
  */
-int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_pci_bdf *pcibdf, int rebind);
-int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_pci_bdf *pcibdf, int rebind);
+int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_pci_bdf *pcibdf,
+                                    const char *name, int rebind);
+int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_pci_bdf *pcibdf,
+                                       int rebind);
 libxl_pci_bdf *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
 void libxl_device_pci_assignable_list_free(libxl_pci_bdf *list, int num);
 
+libxl_pci_bdf *libxl_device_pci_assignable_name2bdf(libxl_ctx *ctx,
+                                                    const char *name);
+char *libxl_device_pci_assignable_bdf2name(libxl_ctx *ctx,
+                                           libxl_pci_bdf *pcibdf);
+
 /* CPUID handling */
 int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str);
 int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 5104f31448..0f7d655aff 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -713,6 +713,7 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_pci_bdf *pcibdf)
 
 static int libxl__device_pci_assignable_add(libxl__gc *gc,
                                             libxl_pci_bdf *pcibdf,
+                                            const char *name,
                                             int rebind)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
@@ -721,6 +722,23 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     int rc;
     struct stat st;
 
+    /* Sanitise any name that was passed */
+    if (name) {
+        unsigned int i, n = strlen(name);
+
+        if (n > 64) { /* Reasonable upper bound on name length */
+            LOG(ERROR, "Name too long");
+            return ERROR_FAIL;
+        }
+
+        for (i = 0; i < n; i++) {
+            if (!isgraph(name[i])) {
+                LOG(ERROR, "Names may only include printable characters");
+                return ERROR_FAIL;
+            }
+        }
+    }
+
     /* Local copy for convenience */
     dom = pcibdf->domain;
     bus = pcibdf->bus;
@@ -741,7 +759,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     }
     if ( rc ) {
         LOG(WARN, PCI_BDF" already assigned to pciback", dom, bus, dev, func);
-        goto quarantine;
+        goto name;
     }
 
     /* Check to see if there's already a driver that we need to unbind from */
@@ -772,7 +790,12 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
         return ERROR_FAIL;
     }
 
-quarantine:
+name:
+    if (name)
+        pci_info_xs_write(gc, pcibdf, "name", name);
+    else
+        pci_info_xs_remove(gc, pcibdf, "name");
+
     /*
      * DOMID_IO is just a sentinel domain, without any actual mappings,
      * so always pass XEN_DOMCTL_DEV_RDM_RELAXED to avoid assignment being
@@ -836,16 +859,18 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
         }
     }
 
+    pci_info_xs_remove(gc, pcibdf, "name");
+
     return 0;
 }
 
 int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_pci_bdf *pcibdf,
-                                    int rebind)
+                                    const char *name, int rebind)
 {
     GC_INIT(ctx);
     int rc;
 
-    rc = libxl__device_pci_assignable_add(gc, pcibdf, rebind);
+    rc = libxl__device_pci_assignable_add(gc, pcibdf, name, rebind);
 
     GC_FREE;
     return rc;
@@ -864,6 +889,57 @@ int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_pci_bdf *pcibdf,
     return rc;
 }
 
+libxl_pci_bdf *libxl_device_pci_assignable_name2bdf(libxl_ctx *ctx,
+                                                    const char *name)
+{
+    GC_INIT(ctx);
+    char **bdfs;
+    libxl_pci_bdf *pcibdf;
+    unsigned int i, n;
+
+    bdfs = libxl__xs_directory(gc, XBT_NULL, PCI_INFO_PATH, &n);
+    if (!n)
+        goto out;
+
+    pcibdf = calloc(1, sizeof(*pcibdf));
+    if (!pcibdf)
+        goto out;
+
+    for (i = 0; i < n; i++) {
+        unsigned dom, bus, dev, func;
+        const char *tmp;
+
+        if (sscanf(bdfs[i], PCI_BDF_XSPATH, &dom, &bus, &dev, &func) != 4)
+            continue;
+
+        pcibdf_struct_fill(pcibdf, dom, bus, dev, func);
+
+        tmp = pci_info_xs_read(gc, pcibdf, "name");
+        if (tmp && !strcmp(tmp, name))
+            goto out;
+    }
+
+    free(pcibdf);
+    pcibdf = NULL;
+
+out:
+    GC_FREE;
+    return pcibdf;
+}
+
+char *libxl_device_pci_assignable_bdf2name(libxl_ctx *ctx,
+                                           libxl_pci_bdf *pcibdf)
+{
+    GC_INIT(ctx);
+    char *name = NULL, *tmp = pci_info_xs_read(gc, pcibdf, "name");
+
+    if (tmp)
+        name = strdup(tmp);
+
+    GC_FREE;
+    return name;
+}
+
 /*
  * This function checks that all functions of a device are bound to pciback
  * driver. It also initialises a bit-mask of which function numbers are present
@@ -1527,7 +1603,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     if (rc) goto out;
 
     if (pci->seize && !pciback_dev_is_assigned(gc, &pci->bdf)) {
-        rc = libxl__device_pci_assignable_add(gc, &pci->bdf, 1);
+        rc = libxl__device_pci_assignable_add(gc, &pci->bdf, NULL, 1);
         if ( rc )
             goto out;
     }
diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
index 2388f23869..96bb4655e0 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -840,7 +840,8 @@ value stub_xl_device_pci_assignable_add(value ctx, value info, value rebind)
 	device_pci_val(CTX, &c_info, info);
 
 	caml_enter_blocking_section();
-	ret = libxl_device_pci_assignable_add(CTX, &c_info.bdf, c_rebind);
+	ret = libxl_device_pci_assignable_add(CTX, &c_info.bdf, NULL,
+					      c_rebind);
 	caml_leave_blocking_section();
 
 	libxl_device_pci_dispose(&c_info);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 2ee0c49673..9e9aa448e2 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -105,21 +105,25 @@ struct cmd_spec cmd_table[] = {
     { "pci-assignable-add",
       &main_pciassignable_add, 0, 1,
       "Make a device assignable for pci-passthru",
-      "<BDF>",
+      "[options] <BDF>",
+      "-n NAME, --name=NAME    Name the assignable device.\n"
       "-h                      Print this help.\n"
     },
     { "pci-assignable-remove",
       &main_pciassignable_remove, 0, 1,
       "Remove a device from being assignable",
-      "[options] <BDF>",
+      "[options] <BDF>|NAME",
       "-h                      Print this help.\n"
       "-r                      Attempt to re-assign the device to the\n"
-      "                        original driver"
+      "                        original driver."
     },
     { "pci-assignable-list",
       &main_pciassignable_list, 0, 0,
       "List all the assignable pci devices",
-      "",
+      "[options]",
+      "-h                      Print this help.\n"
+      "-n, --show-names        Display assignable device names where\n"
+      "                        supplied.\n"
     },
     { "pause",
       &main_pause, 0, 1,
diff --git a/tools/xl/xl_pci.c b/tools/xl/xl_pci.c
index 37708b4eb1..f1b58b3976 100644
--- a/tools/xl/xl_pci.c
+++ b/tools/xl/xl_pci.c
@@ -152,7 +152,7 @@ int main_pciattach(int argc, char **argv)
     return EXIT_SUCCESS;
 }
 
-static void pciassignable_list(void)
+static void pciassignable_list(bool show_names)
 {
     libxl_pci_bdf *pcibdfs;
     int num, i;
@@ -162,9 +162,15 @@ static void pciassignable_list(void)
     if ( pcibdfs == NULL )
         return;
     for (i = 0; i < num; i++) {
-        printf("%04x:%02x:%02x.%01x\n",
-               pcibdfs[i].domain, pcibdfs[i].bus, pcibdfs[i].dev,
-               pcibdfs[i].func);
+        libxl_pci_bdf *pcibdf = &pcibdfs[i];
+        char *name = show_names ?
+            libxl_device_pci_assignable_bdf2name(ctx, pcibdf) : NULL;
+
+        printf("%04x:%02x:%02x.%01x %s\n",
+               pcibdf->domain, pcibdf->bus, pcibdf->dev, pcibdf->func,
+               name ?: "");
+
+        free(name);
     }
     libxl_device_pci_assignable_list_free(pcibdfs, num);
 }
@@ -172,16 +178,23 @@ static void pciassignable_list(void)
 int main_pciassignable_list(int argc, char **argv)
 {
     int opt;
-
-    SWITCH_FOREACH_OPT(opt, "", NULL, "pci-assignable-list", 0) {
-        /* No options */
+    static struct option opts[] = {
+        {"show-names", 0, 0, 'n'},
+        COMMON_LONG_OPTS
+    };
+    bool show_names = false;
+
+    SWITCH_FOREACH_OPT(opt, "n", opts, "pci-assignable-list", 0) {
+    case 'n':
+        show_names = true;
+        break;
     }
 
-    pciassignable_list();
+    pciassignable_list(show_names);
     return 0;
 }
 
-static int pciassignable_add(const char *bdf, int rebind)
+static int pciassignable_add(const char *bdf, const char *name, int rebind)
 {
     libxl_pci_bdf pcibdf;
     XLU_Config *config;
@@ -197,7 +210,7 @@ static int pciassignable_add(const char *bdf, int rebind)
         exit(2);
     }
 
-    if (libxl_device_pci_assignable_add(ctx, &pcibdf, rebind))
+    if (libxl_device_pci_assignable_add(ctx, &pcibdf, name, rebind))
         r = 1;
 
     libxl_pci_bdf_dispose(&pcibdf);
@@ -210,39 +223,58 @@ int main_pciassignable_add(int argc, char **argv)
 {
     int opt;
     const char *bdf = NULL;
-
-    SWITCH_FOREACH_OPT(opt, "", NULL, "pci-assignable-add", 1) {
-        /* No options */
+    static struct option opts[] = {
+        {"name", 1, 0, 'n'},
+        COMMON_LONG_OPTS
+    };
+    const char *name = NULL;
+
+    SWITCH_FOREACH_OPT(opt, "n:", opts, "pci-assignable-add", 0) {
+    case 'n':
+        name = optarg;
+        break;
     }
 
     bdf = argv[optind];
 
-    if (pciassignable_add(bdf, 1))
+    if (pciassignable_add(bdf, name, 1))
         return EXIT_FAILURE;
 
     return EXIT_SUCCESS;
 }
 
-static int pciassignable_remove(const char *bdf, int rebind)
+static int pciassignable_remove(const char *ident, int rebind)
 {
-    libxl_pci_bdf pcibdf;
+    libxl_pci_bdf *pcibdf;
     XLU_Config *config;
     int r = 0;
 
-    libxl_pci_bdf_init(&pcibdf);
-
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_init"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pcibdf, bdf)) {
-        fprintf(stderr, "pci-assignable-remove: malformed BDF \"%s\"\n", bdf);
-        exit(2);
+    pcibdf = libxl_device_pci_assignable_name2bdf(ctx, ident);
+    if (!pcibdf) {
+        pcibdf = calloc(1, sizeof(*pcibdf));
+
+        if (!pcibdf) {
+            fprintf(stderr,
+                    "pci-assignable-remove: failed to allocate memory\n");
+            exit(2);
+        }
+
+        libxl_pci_bdf_init(pcibdf);
+        if (xlu_pci_parse_bdf(config, pcibdf, ident)) {
+            fprintf(stderr,
+                    "pci-assignable-remove: malformed BDF '%s'\n", ident);
+            exit(2);
+        }
     }
 
-    if (libxl_device_pci_assignable_remove(ctx, &pcibdf, rebind))
+    if (libxl_device_pci_assignable_remove(ctx, pcibdf, rebind))
         r = 1;
 
-    libxl_pci_bdf_dispose(&pcibdf);
+    libxl_pci_bdf_dispose(pcibdf);
+    free(pcibdf);
     xlu_cfg_destroy(config);
 
     return r;
@@ -251,7 +283,7 @@ static int pciassignable_remove(const char *bdf, int rebind)
 int main_pciassignable_remove(int argc, char **argv)
 {
     int opt;
-    const char *bdf = NULL;
+    const char *ident = NULL;
     int rebind = 0;
 
     SWITCH_FOREACH_OPT(opt, "r", NULL, "pci-assignable-remove", 1) {
@@ -260,9 +292,9 @@ int main_pciassignable_remove(int argc, char **argv)
         break;
     }
 
-    bdf = argv[optind];
+    ident = argv[optind];
 
-    if (pciassignable_remove(bdf, rebind))
+    if (pciassignable_remove(ident, rebind))
         return EXIT_FAILURE;
 
     return EXIT_SUCCESS;
-- 
2.11.0


