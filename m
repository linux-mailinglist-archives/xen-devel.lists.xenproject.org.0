Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9CE5333F3
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 01:36:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336776.561184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nte47-0001r5-FP; Tue, 24 May 2022 23:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336776.561184; Tue, 24 May 2022 23:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nte47-0001oj-Cg; Tue, 24 May 2022 23:35:51 +0000
Received: by outflank-mailman (input) for mailman id 336776;
 Tue, 24 May 2022 23:35:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTVj=WA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nte46-0001oZ-0u
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 23:35:50 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3db5dc0c-dbba-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 01:35:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41DD1B81A53;
 Tue, 24 May 2022 23:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791B2C34100;
 Tue, 24 May 2022 23:35:46 +0000 (UTC)
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
X-Inumbo-ID: 3db5dc0c-dbba-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653435347;
	bh=7DErTVC3Qto9OYEfJdEWlpFYnmp5DQk7O15Ux8KLGsc=;
	h=From:To:Cc:Subject:Date:From;
	b=iPe5TTySUUYnWKeqnBVwlzhjyMTOeFs/2VbEg62UaZ4Bx6Pm5EMHo5YC+TcuIWUEY
	 nKsCLmlWj9JF7uMqgyIBI1sS83zeMEh3cNFSb5YsBJjgcMu5H+QUH7RWwsBI/T+cle
	 mjwL9sjCZkGpLoxmBVoVO8Irf+j7fIsmeehVkFEd8osYo8QSZYkhy+NOF9pzdC4iHi
	 HOmy1XQFlmLt1nWYrKcx52Hi9pjKQjZj7VIlI7V5d+jkk03iMpJSUMVOQvnoED1MV7
	 /pISwsVLE9F/vWHEzCSUa6gfTN/xFFfeP3K1TJ/5m9CAExOjWO2XMEWb1iuxIRp51p
	 1WG/PhFG6GFYA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	lucmiccio@gmail.com,
	anthony.perard@citrix.com,
	wl@xen.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH] init-dom0less: better snprintf checks
Date: Tue, 24 May 2022 16:35:44 -0700
Message-Id: <20220524233544.245741-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

snprintf returns the number of characters printed. A return value of
size or more means that the output was truncated.

Add a check for that in init-dom0less.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 tools/helpers/init-dom0less.c | 38 ++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 42e74c4153..4c90dd6a0c 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -48,14 +48,16 @@ static bool do_xs_write_dom(struct xs_handle *xsh, xs_transaction_t t,
 {
     char full_path[STR_MAX_LENGTH];
     struct xs_permissions perms[2];
+    int rc;
 
     perms[0].id = domid;
     perms[0].perms = XS_PERM_NONE;
     perms[1].id = 0;
     perms[1].perms = XS_PERM_READ;
 
-    if (snprintf(full_path, STR_MAX_LENGTH,
-                 "/local/domain/%u/%s", domid, path) < 0)
+    rc = snprintf(full_path, STR_MAX_LENGTH,
+                  "/local/domain/%u/%s", domid, path);
+    if (rc < 0 || rc >= STR_MAX_LENGTH)
         return false;
     if (!xs_write(xsh, t, full_path, val, strlen(val)))
         return false;
@@ -66,9 +68,11 @@ static bool do_xs_write_libxl(struct xs_handle *xsh, xs_transaction_t t,
                               domid_t domid, char *path, char *val)
 {
     char full_path[STR_MAX_LENGTH];
+    int rc;
 
-    if (snprintf(full_path, STR_MAX_LENGTH,
-                 "/libxl/%u/%s", domid, path) < 0)
+    rc = snprintf(full_path, STR_MAX_LENGTH,
+                  "/libxl/%u/%s", domid, path);
+    if (rc < 0 || rc >= STR_MAX_LENGTH)
         return false;
     return xs_write(xsh, t, full_path, val, strlen(val));
 }
@@ -77,9 +81,11 @@ static bool do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
                            libxl_uuid uuid, char *path, char *val)
 {
     char full_path[STR_MAX_LENGTH];
+    int rc;
 
-    if (snprintf(full_path, STR_MAX_LENGTH,
-                 "/vm/" LIBXL_UUID_FMT "/%s", LIBXL_UUID_BYTES(uuid), path) < 0)
+    rc = snprintf(full_path, STR_MAX_LENGTH,
+                  "/vm/" LIBXL_UUID_FMT "/%s", LIBXL_UUID_BYTES(uuid), path);
+    if (rc < 0 || rc >= STR_MAX_LENGTH)
         return false;
     return xs_write(xsh, t, full_path, val, strlen(val));
 }
@@ -115,35 +121,35 @@ static int create_xenstore(struct xs_handle *xsh,
         return -errno;
     rc = snprintf(start_time_str, STR_MAX_LENGTH, "%jd.%02d",
             (intmax_t)start_time.tv_sec, (int)start_time.tv_usec / 10000);
-    if (rc < 0)
+    if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
 
     domid = info->domid;
     rc = snprintf(id_str, STR_MAX_LENGTH, "%u", domid);
-    if (rc < 0)
+    if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(dom_name_str, STR_MAX_LENGTH, "dom0less-%u", domid);
-    if (rc < 0)
+    if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(uuid_str, STR_MAX_LENGTH, LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
-    if (rc < 0)
+    if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(vm_val_str, STR_MAX_LENGTH,
                   "vm/" LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
-    if (rc < 0)
+    if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(max_memkb_str, STR_MAX_LENGTH, "%lu", info->max_memkb);
-    if (rc < 0)
+    if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(target_memkb_str, STR_MAX_LENGTH, "%lu", info->current_memkb);
-    if (rc < 0)
+    if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
                   (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET);
-    if (rc < 0)
+    if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(xenstore_port_str, STR_MAX_LENGTH, "%u", xenstore_port);
-    if (rc < 0)
+    if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
 
 retry_transaction:
@@ -163,7 +169,7 @@ retry_transaction:
     if (!do_xs_write_dom(xsh, t, domid, "cpu", "")) goto err;
     for (i = 0; i < info->vcpu_max_id; i++) {
         rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability/", i);
-        if (rc < 0)
+        if (rc < 0 || rc >= STR_MAX_LENGTH)
             goto err;
         rc = -EIO;
         if (!do_xs_write_dom(xsh, t, domid, cpu_str,
-- 
2.25.1


