Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987DC4B6902
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:16:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272920.467916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJusQ-0002u8-3n; Tue, 15 Feb 2022 10:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272920.467916; Tue, 15 Feb 2022 10:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJusQ-0002sL-0j; Tue, 15 Feb 2022 10:16:06 +0000
Received: by outflank-mailman (input) for mailman id 272920;
 Tue, 15 Feb 2022 10:16:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h622=S6=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nJusO-0002aj-JD
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:16:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 47b5351e-8e48-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 11:16:03 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED08E13D5;
 Tue, 15 Feb 2022 02:16:02 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D2E83F66F;
 Tue, 15 Feb 2022 02:16:02 -0800 (PST)
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
X-Inumbo-ID: 47b5351e-8e48-11ec-b215-9bbe72dcb22c
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/5] tools/cpupools: Give a name to unnamed cpupools
Date: Tue, 15 Feb 2022 10:15:47 +0000
Message-Id: <20220215101551.23101-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220215101551.23101-1-luca.fancellu@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>

With the introduction of boot time cpupools, Xen can create many
different cpupools at boot time other than cpupool with id 0.

Since these newly created cpupools can't have an
entry in Xenstore, create the entry using xen-init-dom0
helper with the usual convention: Pool-<cpupool id>.

Given the change, remove the check for poolid == 0 from
libxl_cpupoolid_to_name(...).

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/helpers/xen-init-dom0.c  | 26 +++++++++++++++++++++++++-
 tools/libs/light/libxl_utils.c |  3 +--
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/tools/helpers/xen-init-dom0.c b/tools/helpers/xen-init-dom0.c
index c99224a4b607..3539f56faeb0 100644
--- a/tools/helpers/xen-init-dom0.c
+++ b/tools/helpers/xen-init-dom0.c
@@ -43,7 +43,10 @@ int main(int argc, char **argv)
     int rc;
     struct xs_handle *xsh = NULL;
     xc_interface *xch = NULL;
-    char *domname_string = NULL, *domid_string = NULL;
+    char *domname_string = NULL, *domid_string = NULL, *pool_string = NULL;
+    char pool_path[strlen("/local/pool") + 12], pool_name[strlen("Pool-") + 5];
+    xc_cpupoolinfo_t *xcinfo;
+    unsigned int pool_id = 0;
     libxl_uuid uuid;
 
     /* Accept 0 or 1 argument */
@@ -114,6 +117,27 @@ int main(int argc, char **argv)
         goto out;
     }
 
+    /* Create an entry in xenstore for each cpupool on the system */
+    do {
+        xcinfo = xc_cpupool_getinfo(xch, pool_id);
+        if (xcinfo != NULL) {
+            if (xcinfo->cpupool_id != pool_id)
+                pool_id = xcinfo->cpupool_id;
+            snprintf(pool_path, sizeof(pool_path), "/local/pool/%d/name",
+                     pool_id);
+            snprintf(pool_name, sizeof(pool_name), "Pool-%d", pool_id);
+            pool_id++;
+            if (!xs_write(xsh, XBT_NULL, pool_path, pool_name,
+                          strlen(pool_name))) {
+                fprintf(stderr, "cannot set pool name\n");
+                rc = 1;
+            }
+            xc_cpupool_infofree(xch, xcinfo);
+            if (rc)
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


