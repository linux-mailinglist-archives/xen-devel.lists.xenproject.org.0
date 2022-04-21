Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26A3509A5E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 10:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309844.526343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhRzq-0002vG-5k; Thu, 21 Apr 2022 08:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309844.526343; Thu, 21 Apr 2022 08:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhRzp-0002og-Vo; Thu, 21 Apr 2022 08:17:01 +0000
Received: by outflank-mailman (input) for mailman id 309844;
 Thu, 21 Apr 2022 08:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=foL4=U7=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nhRzn-0002nQ-Od
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 08:16:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6860a5b3-c14b-11ec-8fbf-03012f2f19d4;
 Thu, 21 Apr 2022 10:16:56 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7B951515;
 Thu, 21 Apr 2022 01:16:56 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C19D3F73B;
 Thu, 21 Apr 2022 01:16:56 -0700 (PDT)
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
X-Inumbo-ID: 6860a5b3-c14b-11ec-8fbf-03012f2f19d4
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com
Subject: [PATCH v8 1/7] tools/cpupools: Give a name to unnamed cpupools
Date: Thu, 21 Apr 2022 09:16:39 +0100
Message-Id: <20220421081645.40235-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220421081645.40235-1-luca.fancellu@arm.com>
References: <20220421081645.40235-1-luca.fancellu@arm.com>

With the introduction of boot time cpupools, Xen can create many
different cpupools at boot time other than cpupool with id 0.

Since these newly created cpupools can't have an
entry in Xenstore, create the entry using xen-init-dom0
helper with the usual convention: Pool-<cpupool id>.

Given the change, remove the check for poolid == 0 from
libxl_cpupoolid_to_name(...).

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes in v8:
- no changes
Changes in v7:
- Add R-by from Anthony
Changes in v6:
- Reworked loop to have only one error path (Anthony)
Changes in v5:
- no changes
Changes in v4:
- no changes
Changes in v3:
- no changes, add R-by
Changes in v2:
 - Remove unused variable, moved xc_cpupool_infofree
   ahead to simplify the code, use asprintf (Juergen)
---
 tools/helpers/xen-init-dom0.c  | 37 +++++++++++++++++++++++++++++++++-
 tools/libs/light/libxl_utils.c |  3 +--
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/tools/helpers/xen-init-dom0.c b/tools/helpers/xen-init-dom0.c
index c99224a4b607..37eff8868f25 100644
--- a/tools/helpers/xen-init-dom0.c
+++ b/tools/helpers/xen-init-dom0.c
@@ -43,7 +43,10 @@ int main(int argc, char **argv)
     int rc;
     struct xs_handle *xsh = NULL;
     xc_interface *xch = NULL;
-    char *domname_string = NULL, *domid_string = NULL;
+    char *domname_string = NULL, *domid_string = NULL,
+         *pool_path = NULL, *pool_name = NULL;
+    xc_cpupoolinfo_t *xcinfo;
+    unsigned int pool_id = 0;
     libxl_uuid uuid;
 
     /* Accept 0 or 1 argument */
@@ -114,9 +117,41 @@ int main(int argc, char **argv)
         goto out;
     }
 
+    /* Create an entry in xenstore for each cpupool on the system */
+    do {
+        xcinfo = xc_cpupool_getinfo(xch, pool_id);
+        if (xcinfo != NULL) {
+            if (xcinfo->cpupool_id != pool_id)
+                pool_id = xcinfo->cpupool_id;
+            xc_cpupool_infofree(xch, xcinfo);
+            if (asprintf(&pool_path, "/local/pool/%d/name", pool_id) <= 0) {
+                fprintf(stderr, "cannot allocate memory for pool path\n");
+                rc = 1;
+                goto out;
+            }
+            if (asprintf(&pool_name, "Pool-%d", pool_id) <= 0) {
+                fprintf(stderr, "cannot allocate memory for pool name\n");
+                rc = 1;
+                goto out;
+            }
+            pool_id++;
+            if (!xs_write(xsh, XBT_NULL, pool_path, pool_name,
+                          strlen(pool_name))) {
+                fprintf(stderr, "cannot set pool name\n");
+                rc = 1;
+                goto out;
+            }
+            free(pool_name);
+            free(pool_path);
+            pool_path = pool_name = NULL;
+        }
+    } while(xcinfo != NULL);
+
     printf("Done setting up Dom0\n");
 
 out:
+    free(pool_path);
+    free(pool_name);
     free(domid_string);
     free(domname_string);
     xs_close(xsh);
diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_utils.c
index b91c2cafa223..81780da3ff40 100644
--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -151,8 +151,7 @@ char *libxl_cpupoolid_to_name(libxl_ctx *ctx, uint32_t poolid)
 
     snprintf(path, sizeof(path), "/local/pool/%d/name", poolid);
     s = xs_read(ctx->xsh, XBT_NULL, path, &len);
-    if (!s && (poolid == 0))
-        return strdup("Pool-0");
+
     return s;
 }
 
-- 
2.17.1


