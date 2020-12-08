Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EC72D32B4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 20:31:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47685.84404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmihA-0000gg-W1; Tue, 08 Dec 2020 19:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47685.84404; Tue, 08 Dec 2020 19:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmihA-0000fm-Ox; Tue, 08 Dec 2020 19:30:44 +0000
Received: by outflank-mailman (input) for mailman id 47685;
 Tue, 08 Dec 2020 19:30:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmih9-0000f4-8j
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 19:30:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmih8-0007LB-BI; Tue, 08 Dec 2020 19:30:42 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmih8-0001p0-2Y; Tue, 08 Dec 2020 19:30:42 +0000
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
	bh=riw3MyToWucKYseT/Zi4z6kwfCRW/U/hR5lNoqu9wNw=; b=wM0QsmSD20dySYYbE3Jg39hB0c
	OInlEuQXAzvj69pClMJ3pA9VryqeWHC5CxOyUUB7C6XqEkGKktQ064sQVqwCqJt162B91W5cOKz1z
	8Td0Vp47SoA75TW9lvTDagv/x7DmCjKvjddBYFa9YHbE+Ud+h2sMbiHrmz2vTN1V821g=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v6 02/25] xl: s/pcidev/pci where possible
Date: Tue,  8 Dec 2020 19:30:10 +0000
Message-Id: <20201208193033.11306-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

To improve naming consistency, replaces occurrences of 'pcidev' with 'pci'.
The only remaining use of the term should be in relation to
'libxl_domain_config' where there are fields named 'pcidevs' and 'num_pcidevs'.

Purely cosmetic. No functional change.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v6:
 - New in v6 (split out from "xl / libxl: s/pcidev/pci and remove
   DEFINE_DEVICE_TYPE_STRUCT_X")
---
 tools/xl/xl_parse.c | 22 +++++++--------
 tools/xl/xl_pci.c   | 68 ++++++++++++++++++++++-----------------------
 2 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index cae8eb679c5a..4ebf39620ae7 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1473,21 +1473,21 @@ void parse_config_data(const char *config_source,
         d_config->num_pcidevs = 0;
         d_config->pcidevs = NULL;
         for(i = 0; (buf = xlu_cfg_get_listitem (pcis, i)) != NULL; i++) {
-            libxl_device_pci *pcidev;
-
-            pcidev = ARRAY_EXTEND_INIT_NODEVID(d_config->pcidevs,
-                                               d_config->num_pcidevs,
-                                               libxl_device_pci_init);
-            pcidev->msitranslate = pci_msitranslate;
-            pcidev->power_mgmt = pci_power_mgmt;
-            pcidev->permissive = pci_permissive;
-            pcidev->seize = pci_seize;
+            libxl_device_pci *pci;
+
+            pci = ARRAY_EXTEND_INIT_NODEVID(d_config->pcidevs,
+                                            d_config->num_pcidevs,
+                                            libxl_device_pci_init);
+            pci->msitranslate = pci_msitranslate;
+            pci->power_mgmt = pci_power_mgmt;
+            pci->permissive = pci_permissive;
+            pci->seize = pci_seize;
             /*
              * Like other pci option, the per-device policy always follows
              * the global policy by default.
              */
-            pcidev->rdm_policy = b_info->u.hvm.rdm.policy;
-            e = xlu_pci_parse_bdf(config, pcidev, buf);
+            pci->rdm_policy = b_info->u.hvm.rdm.policy;
+            e = xlu_pci_parse_bdf(config, pci, buf);
             if (e) {
                 fprintf(stderr,
                         "unable to parse PCI BDF `%s' for passthrough\n",
diff --git a/tools/xl/xl_pci.c b/tools/xl/xl_pci.c
index 58345bdae213..34fcf5a4fadf 100644
--- a/tools/xl/xl_pci.c
+++ b/tools/xl/xl_pci.c
@@ -24,20 +24,20 @@
 
 static void pcilist(uint32_t domid)
 {
-    libxl_device_pci *pcidevs;
+    libxl_device_pci *pcis;
     int num, i;
 
-    pcidevs = libxl_device_pci_list(ctx, domid, &num);
-    if (pcidevs == NULL)
+    pcis = libxl_device_pci_list(ctx, domid, &num);
+    if (pcis == NULL)
         return;
     printf("Vdev Device\n");
     for (i = 0; i < num; i++) {
         printf("%02x.%01x %04x:%02x:%02x.%01x\n",
-               (pcidevs[i].vdevfn >> 3) & 0x1f, pcidevs[i].vdevfn & 0x7,
-               pcidevs[i].domain, pcidevs[i].bus, pcidevs[i].dev, pcidevs[i].func);
-        libxl_device_pci_dispose(&pcidevs[i]);
+               (pcis[i].vdevfn >> 3) & 0x1f, pcis[i].vdevfn & 0x7,
+               pcis[i].domain, pcis[i].bus, pcis[i].dev, pcis[i].func);
+        libxl_device_pci_dispose(&pcis[i]);
     }
-    free(pcidevs);
+    free(pcis);
 }
 
 int main_pcilist(int argc, char **argv)
@@ -57,28 +57,28 @@ int main_pcilist(int argc, char **argv)
 
 static int pcidetach(uint32_t domid, const char *bdf, int force)
 {
-    libxl_device_pci pcidev;
+    libxl_device_pci pci;
     XLU_Config *config;
     int r = 0;
 
-    libxl_device_pci_init(&pcidev);
+    libxl_device_pci_init(&pci);
 
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_inig"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pcidev, bdf)) {
+    if (xlu_pci_parse_bdf(config, &pci, bdf)) {
         fprintf(stderr, "pci-detach: malformed BDF specification \"%s\"\n", bdf);
         exit(2);
     }
     if (force) {
-        if (libxl_device_pci_destroy(ctx, domid, &pcidev, 0))
+        if (libxl_device_pci_destroy(ctx, domid, &pci, 0))
             r = 1;
     } else {
-        if (libxl_device_pci_remove(ctx, domid, &pcidev, 0))
+        if (libxl_device_pci_remove(ctx, domid, &pci, 0))
             r = 1;
     }
 
-    libxl_device_pci_dispose(&pcidev);
+    libxl_device_pci_dispose(&pci);
     xlu_cfg_destroy(config);
 
     return r;
@@ -108,24 +108,24 @@ int main_pcidetach(int argc, char **argv)
 
 static int pciattach(uint32_t domid, const char *bdf, const char *vs)
 {
-    libxl_device_pci pcidev;
+    libxl_device_pci pci;
     XLU_Config *config;
     int r = 0;
 
-    libxl_device_pci_init(&pcidev);
+    libxl_device_pci_init(&pci);
 
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_inig"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pcidev, bdf)) {
+    if (xlu_pci_parse_bdf(config, &pci, bdf)) {
         fprintf(stderr, "pci-attach: malformed BDF specification \"%s\"\n", bdf);
         exit(2);
     }
 
-    if (libxl_device_pci_add(ctx, domid, &pcidev, 0))
+    if (libxl_device_pci_add(ctx, domid, &pci, 0))
         r = 1;
 
-    libxl_device_pci_dispose(&pcidev);
+    libxl_device_pci_dispose(&pci);
     xlu_cfg_destroy(config);
 
     return r;
@@ -155,19 +155,19 @@ int main_pciattach(int argc, char **argv)
 
 static void pciassignable_list(void)
 {
-    libxl_device_pci *pcidevs;
+    libxl_device_pci *pcis;
     int num, i;
 
-    pcidevs = libxl_device_pci_assignable_list(ctx, &num);
+    pcis = libxl_device_pci_assignable_list(ctx, &num);
 
-    if ( pcidevs == NULL )
+    if ( pcis == NULL )
         return;
     for (i = 0; i < num; i++) {
         printf("%04x:%02x:%02x.%01x\n",
-               pcidevs[i].domain, pcidevs[i].bus, pcidevs[i].dev, pcidevs[i].func);
-        libxl_device_pci_dispose(&pcidevs[i]);
+               pcis[i].domain, pcis[i].bus, pcis[i].dev, pcis[i].func);
+        libxl_device_pci_dispose(&pcis[i]);
     }
-    free(pcidevs);
+    free(pcis);
 }
 
 int main_pciassignable_list(int argc, char **argv)
@@ -184,24 +184,24 @@ int main_pciassignable_list(int argc, char **argv)
 
 static int pciassignable_add(const char *bdf, int rebind)
 {
-    libxl_device_pci pcidev;
+    libxl_device_pci pci;
     XLU_Config *config;
     int r = 0;
 
-    libxl_device_pci_init(&pcidev);
+    libxl_device_pci_init(&pci);
 
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_init"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pcidev, bdf)) {
+    if (xlu_pci_parse_bdf(config, &pci, bdf)) {
         fprintf(stderr, "pci-assignable-add: malformed BDF specification \"%s\"\n", bdf);
         exit(2);
     }
 
-    if (libxl_device_pci_assignable_add(ctx, &pcidev, rebind))
+    if (libxl_device_pci_assignable_add(ctx, &pci, rebind))
         r = 1;
 
-    libxl_device_pci_dispose(&pcidev);
+    libxl_device_pci_dispose(&pci);
     xlu_cfg_destroy(config);
 
     return r;
@@ -226,24 +226,24 @@ int main_pciassignable_add(int argc, char **argv)
 
 static int pciassignable_remove(const char *bdf, int rebind)
 {
-    libxl_device_pci pcidev;
+    libxl_device_pci pci;
     XLU_Config *config;
     int r = 0;
 
-    libxl_device_pci_init(&pcidev);
+    libxl_device_pci_init(&pci);
 
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_init"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pcidev, bdf)) {
+    if (xlu_pci_parse_bdf(config, &pci, bdf)) {
         fprintf(stderr, "pci-assignable-remove: malformed BDF specification \"%s\"\n", bdf);
         exit(2);
     }
 
-    if (libxl_device_pci_assignable_remove(ctx, &pcidev, rebind))
+    if (libxl_device_pci_assignable_remove(ctx, &pci, rebind))
         r = 1;
 
-    libxl_device_pci_dispose(&pcidev);
+    libxl_device_pci_dispose(&pci);
     xlu_cfg_destroy(config);
 
     return r;
-- 
2.20.1


