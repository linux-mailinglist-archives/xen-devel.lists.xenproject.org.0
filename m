Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DAD4D4FFA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 18:11:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288504.489232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMJ8-0001st-Ru; Thu, 10 Mar 2022 17:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288504.489232; Thu, 10 Mar 2022 17:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMJ8-0001oM-L6; Thu, 10 Mar 2022 17:10:34 +0000
Received: by outflank-mailman (input) for mailman id 288504;
 Thu, 10 Mar 2022 17:10:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/tR=TV=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nSMJ6-0001lh-Jy
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 17:10:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id fd225777-a094-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 18:10:30 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBA5116A3;
 Thu, 10 Mar 2022 09:10:29 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 314BD3F99C;
 Thu, 10 Mar 2022 09:10:29 -0800 (PST)
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
X-Inumbo-ID: fd225777-a094-11ec-8eba-a37418f5ba1a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 1/6] tools/cpupools: Give a name to unnamed cpupools
Date: Thu, 10 Mar 2022 17:10:14 +0000
Message-Id: <20220310171019.6170-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310171019.6170-1-luca.fancellu@arm.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>

With the introduction of boot time cpupools, Xen can create many
different cpupools at boot time other than cpupool with id 0.

Since these newly created cpupools can't have an
entry in Xenstore, create the entry using xen-init-dom0
helper with the usual convention: Pool-<cpupool id>.

Given the change, remove the check for poolid == 0 from
libxl_cpupoolid_to_name(...).

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v2:
 - Remove unused variable, moved xc_cpupool_infofree
   ahead to simplify the code, use asprintf (Juergen)
---
 tools/helpers/xen-init-dom0.c  | 35 +++++++++++++++++++++++++++++++++-
 tools/libs/light/libxl_utils.c |  3 +--
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/tools/helpers/xen-init-dom0.c b/tools/helpers/xen-init-dom0.c
index c99224a4b607..84286617790f 100644
--- a/tools/helpers/xen-init-dom0.c
+++ b/tools/helpers/xen-init-dom0.c
@@ -43,7 +43,9 @@ int main(int argc, char **argv)
     int rc;
     struct xs_handle *xsh = NULL;
     xc_interface *xch = NULL;
-    char *domname_string = NULL, *domid_string = NULL;
+    char *domname_string = NULL, *domid_string = NULL, *pool_path, *pool_name;
+    xc_cpupoolinfo_t *xcinfo;
+    unsigned int pool_id = 0;
     libxl_uuid uuid;
 
     /* Accept 0 or 1 argument */
@@ -114,6 +116,37 @@ int main(int argc, char **argv)
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
+                goto out_err;
+            }
+            pool_id++;
+            if (!xs_write(xsh, XBT_NULL, pool_path, pool_name,
+                          strlen(pool_name))) {
+                fprintf(stderr, "cannot set pool name\n");
+                rc = 1;
+            }
+            free(pool_name);
+out_err:
+            free(pool_path);
+            if ( rc )
+                goto out;
+        }
+    } while(xcinfo != NULL);
+
     printf("Done setting up Dom0\n");
 
 out:
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


