Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509332EB1B6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 18:47:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62115.109824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqQ2-0005Y2-68; Tue, 05 Jan 2021 17:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62115.109824; Tue, 05 Jan 2021 17:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqQ1-0005WT-Js; Tue, 05 Jan 2021 17:46:53 +0000
Received: by outflank-mailman (input) for mailman id 62115;
 Tue, 05 Jan 2021 17:46:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kwqPz-0005T6-Ro
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 17:46:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kwqPz-0006Ih-7j; Tue, 05 Jan 2021 17:46:51 +0000
Received: from ec2-34-243-106-223.eu-west-1.compute.amazonaws.com
 ([34.243.106.223] helo=ip-10-0-70-185.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kwqPy-0008Uy-Vd; Tue, 05 Jan 2021 17:46:51 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=mp9JJogkbVM9zNQc7dIMuCQa7vYObqg8Lb80h6tIDAc=; b=34pAiUW+C7SGyVpGexlMOQrom
	G6dbYwXlOZ+3a4zr9P/ihHiC/uYZRqBRjBmgE0UMEX+a1K6oGHnrBb7eNTRG6B0yqgy5iKXkxrnEx
	SDpgYLpGewRafwjTvt+kQ/H3xURQWBtwRGg60QEpKeENX6/vzcrc9EktPaFbQ2RDfPADs=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v7 5/7] xl: support naming of assignable devices
Date: Tue,  5 Jan 2021 17:46:40 +0000
Message-Id: <20210105174642.2754-6-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210105174642.2754-1-paul@xen.org>
References: <20210105174642.2754-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

With this patch applied 'xl pci-assignable-add' will take an optional '--name'
parameter, 'xl pci-assignable-remove' can be passed either a BDF or a name and
'xl pci-assignable-list' will take a optional '--show-names' flag which
determines whether names are displayed in its output.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v7:
 - Heavily re-worked, bearing only some resemblance to similarly named v6 patch
---
 tools/xl/xl_cmdtable.c | 12 ++++---
 tools/xl/xl_pci.c      | 89 ++++++++++++++++++++++++++++++++++++--------------
 2 files changed, 73 insertions(+), 28 deletions(-)

diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 30e17a2848..bd8af12ff3 100644
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
index 9a66494bb5..b1c3ae2a72 100644
--- a/tools/xl/xl_pci.c
+++ b/tools/xl/xl_pci.c
@@ -151,7 +151,7 @@ int main_pciattach(int argc, char **argv)
     return EXIT_SUCCESS;
 }
 
-static void pciassignable_list(void)
+static void pciassignable_list(bool show_names)
 {
     libxl_device_pci *pcis;
     int num, i;
@@ -161,8 +161,12 @@ static void pciassignable_list(void)
     if ( pcis == NULL )
         return;
     for (i = 0; i < num; i++) {
-        printf("%04x:%02x:%02x.%01x\n",
-               pcis[i].domain, pcis[i].bus, pcis[i].dev, pcis[i].func);
+        libxl_device_pci *pci = &pcis[i];
+        char *name = show_names ? pci->name : NULL;
+
+        printf("%04x:%02x:%02x.%01x %s\n",
+               pci->domain, pci->bus, pci->dev, pci->func,
+               name ?: "");
     }
     libxl_device_pci_assignable_list_free(pcis, num);
 }
@@ -170,20 +174,27 @@ static void pciassignable_list(void)
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
     libxl_device_pci pci;
     XLU_Config *config;
-    int r = 0;
+    int r;
 
     libxl_device_pci_init(&pci);
 
@@ -195,8 +206,15 @@ static int pciassignable_add(const char *bdf, int rebind)
         exit(2);
     }
 
-    if (libxl_device_pci_assignable_add(ctx, &pci, rebind))
-        r = 1;
+    if (name) {
+        pci.name = strdup(name);
+        if (!pci.name) {
+            fprintf(stderr, "pci-assignable-add: memory allocation failure\n");
+            exit(2);
+        }
+    }
+
+    r = libxl_device_pci_assignable_add(ctx, &pci, rebind);
 
     libxl_device_pci_dispose(&pci);
     xlu_cfg_destroy(config);
@@ -208,38 +226,61 @@ int main_pciassignable_add(int argc, char **argv)
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
+    SWITCH_FOREACH_OPT(opt, "n:", opts, "pci-assignable-add", 1) {
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
     libxl_device_pci pci;
     XLU_Config *config;
-    int r = 0;
+    int r;
 
     libxl_device_pci_init(&pci);
 
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_init"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pci, bdf)) {
-        fprintf(stderr, "pci-assignable-remove: malformed BDF \"%s\"\n", bdf);
+    /* Try remove-by-name first */
+    pci.name = strdup(ident);
+    if (!pci.name) {
+        fprintf(stderr, "pci-assignable-add: memory allocation failure\n");
         exit(2);
     }
 
-    if (libxl_device_pci_assignable_remove(ctx, &pci, rebind))
-        r = 1;
+    r = libxl_device_pci_assignable_remove(ctx, &pci, rebind);
+    if (!r || r != ERROR_NOTFOUND)
+        goto out;
+
+    /* If remove-by-name failed to find the device, try remove-by-BDF */
+    free(pci.name);
+    pci.name = NULL;
 
+    if (xlu_pci_parse_bdf(config, &pci, ident)) {
+        fprintf(stderr,
+                "pci-assignable-remove: malformed BDF '%s'\n", ident);
+        exit(2);
+    }
+
+    r = libxl_device_pci_assignable_remove(ctx, &pci, rebind);
+
+out:
     libxl_device_pci_dispose(&pci);
     xlu_cfg_destroy(config);
 
@@ -249,7 +290,7 @@ static int pciassignable_remove(const char *bdf, int rebind)
 int main_pciassignable_remove(int argc, char **argv)
 {
     int opt;
-    const char *bdf = NULL;
+    const char *ident = NULL;
     int rebind = 0;
 
     SWITCH_FOREACH_OPT(opt, "r", NULL, "pci-assignable-remove", 1) {
@@ -258,9 +299,9 @@ int main_pciassignable_remove(int argc, char **argv)
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


