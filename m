Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAAD2D32E0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 21:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47761.84547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAH-0004uC-5S; Tue, 08 Dec 2020 20:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47761.84547; Tue, 08 Dec 2020 20:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAG-0004s6-N9; Tue, 08 Dec 2020 20:00:48 +0000
Received: by outflank-mailman (input) for mailman id 47761;
 Tue, 08 Dec 2020 20:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmjAD-0004oo-Il
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 20:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmjAC-00086C-Gp; Tue, 08 Dec 2020 20:00:44 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihR-0001p0-LB; Tue, 08 Dec 2020 19:31:01 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=+f7YY+lF0YoyI1swofoqUpjdUy+mpVesNl7dk7J2kFI=; b=rr04WefTtRhowSm90K+hZUAZQu
	2w9CfjUdYuOPRetPipUjVXc+yzmn5NctlWwxICoNQZ8F7v8gb83hPvR76PeMlgL4GVzwAVCHrWAem
	r/yYGqdgmzbEHIRWSuhTFO/3bm70s1QC6hSdUITLTr33oA+Mgmz9O+f7SSjDE9O31uuA=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v6 23/25] xl: support naming of assignable devices
Date: Tue,  8 Dec 2020 19:30:31 +0000
Message-Id: <20201208193033.11306-24-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This patch converts libxl to use libxl_pci_bdf_assignable_add/remove/list/
list_free() rather than libxl_device_pci_assignable_add/remove/list/
list_free(), which then allows naming of assignable devices to be supported.

With this patch applied 'xl pci-assignable-add' will take an optional '--name'
parameter, 'xl pci-assignable-remove' can be passed either a BDF or a name and
'xl pci-assignable-list' will take a optional '--show-names' flag which
determines whether names are displayed in its output.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v6:
 - New in v6 (split out from "xl / libxl: support naming of assignable
   devices")
---
 tools/xl/xl_cmdtable.c |  12 +++--
 tools/xl/xl_pci.c      | 100 +++++++++++++++++++++++++++--------------
 2 files changed, 74 insertions(+), 38 deletions(-)

diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 30e17a2848cd..bd8af12ff36e 100644
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
index 9c24496cb2dd..eb29b4e08d8b 100644
--- a/tools/xl/xl_pci.c
+++ b/tools/xl/xl_pci.c
@@ -152,55 +152,68 @@ int main_pciattach(int argc, char **argv)
     return EXIT_SUCCESS;
 }
 
-static void pciassignable_list(void)
+static void pciassignable_list(bool show_names)
 {
-    libxl_device_pci *pcis;
+    libxl_pci_bdf *pcibdfs;
     int num, i;
 
-    pcis = libxl_device_pci_assignable_list(ctx, &num);
+    pcibdfs = libxl_pci_bdf_assignable_list(ctx, &num);
 
-    if ( pcis == NULL )
+    if ( pcibdfs == NULL )
         return;
     for (i = 0; i < num; i++) {
-        printf("%04x:%02x:%02x.%01x\n",
-               pcis[i].bdf.domain, pcis[i].bdf.bus, pcis[i].bdf.dev,
-               pcis[i].bdf.func);
+        libxl_pci_bdf *pcibdf = &pcibdfs[i];
+        char *name = show_names ?
+            libxl_pci_bdf_assignable_bdf2name(ctx, pcibdf) : NULL;
+
+        printf("%04x:%02x:%02x.%01x %s\n",
+               pcibdf->domain, pcibdf->bus, pcibdf->dev, pcibdf->func,
+               name ?: "");
+
+        free(name);
     }
-    libxl_device_pci_assignable_list_free(pcis, num);
+    libxl_pci_bdf_assignable_list_free(pcibdfs, num);
 }
 
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
-    libxl_device_pci pci;
+    libxl_pci_bdf pcibdf;
     XLU_Config *config;
     int r = 0;
 
-    libxl_device_pci_init(&pci);
+    libxl_pci_bdf_init(&pcibdf);
 
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_init"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pci.bdf, bdf)) {
+    if (xlu_pci_parse_bdf(config, &pcibdf, bdf)) {
         fprintf(stderr, "pci-assignable-add: malformed BDF \"%s\"\n", bdf);
         exit(2);
     }
 
-    if (libxl_device_pci_assignable_add(ctx, &pci, rebind))
+    if (libxl_pci_bdf_assignable_add(ctx, &pcibdf, name, rebind))
         r = 1;
 
-    libxl_device_pci_dispose(&pci);
+    libxl_pci_bdf_dispose(&pcibdf);
     xlu_cfg_destroy(config);
 
     return r;
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
-    libxl_device_pci pci;
+    libxl_pci_bdf *pcibdf;
     XLU_Config *config;
     int r = 0;
 
-    libxl_device_pci_init(&pci);
-
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_init"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pci.bdf, bdf)) {
-        fprintf(stderr, "pci-assignable-remove: malformed BDF \"%s\"\n", bdf);
-        exit(2);
+    pcibdf = libxl_pci_bdf_assignable_name2bdf(ctx, ident);
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
 
-    if (libxl_device_pci_assignable_remove(ctx, &pci, rebind))
+    if (libxl_pci_bdf_assignable_remove(ctx, pcibdf, rebind))
         r = 1;
 
-    libxl_device_pci_dispose(&pci);
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
2.20.1


