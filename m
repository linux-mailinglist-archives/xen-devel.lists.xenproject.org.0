Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B0D2C1292
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 19:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35015.66479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khG94-0001JV-Ob; Mon, 23 Nov 2020 18:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35015.66479; Mon, 23 Nov 2020 18:00:58 +0000
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
	id 1khG93-0001Dp-RG; Mon, 23 Nov 2020 18:00:57 +0000
Received: by outflank-mailman (input) for mailman id 35015;
 Mon, 23 Nov 2020 18:00:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khG8r-0000n6-W1
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khG8q-00071L-Rf; Mon, 23 Nov 2020 18:00:44 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtn-0000at-8G; Mon, 23 Nov 2020 17:45:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khG8r-0000n6-W1
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=g4vlrHOO7l/XQjq8yeT79RpnipWh6aBaWnJezRVSrUw=; b=LX7dN7lqiKt5xN25kuRAwlDME
	7EwIhV9x95chJflfVcX6MxKsQ7+v5PefyuBMf6REgfCQfwOYcR6U7F0RCpALMn2J6uOmN1dYQGIUZ
	KhCVVkE9aE27TptUeKIhYmDLjp9wIQoNC5IcrX/DVP+u3Q7KYX/OTxNc65Ya9lFyxGQ+U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khG8q-00071L-Rf; Mon, 23 Nov 2020 18:00:44 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtn-0000at-8G; Mon, 23 Nov 2020 17:45:11 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 21/23] xl / libxl: support naming of assignable devices
Date: Mon, 23 Nov 2020 17:45:01 +0000
Message-Id: <20201123174503.6800-22-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201123174503.6800-1-paul@xen.org>
References: <20201123174503.6800-1-paul@xen.org>

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
index f9ace1faec..a1c9ae0d5b 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -745,6 +745,7 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_pci_bdf *pcibdf)
 
 static int libxl__device_pci_assignable_add(libxl__gc *gc,
                                             libxl_pci_bdf *pcibdf,
+                                            const char *name,
                                             int rebind)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
@@ -753,6 +754,23 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
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
@@ -773,7 +791,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     }
     if ( rc ) {
         LOG(WARN, PCI_BDF" already assigned to pciback", dom, bus, dev, func);
-        goto quarantine;
+        goto name;
     }
 
     /* Check to see if there's already a driver that we need to unbind from */
@@ -804,7 +822,12 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
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
@@ -868,16 +891,18 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
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
@@ -896,6 +921,57 @@ int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_pci_bdf *pcibdf,
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
@@ -1560,7 +1636,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
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


