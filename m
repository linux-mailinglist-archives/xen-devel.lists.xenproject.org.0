Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFEC97AB24
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 07:45:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799773.1209809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqR0j-0000fz-0b; Tue, 17 Sep 2024 05:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799773.1209809; Tue, 17 Sep 2024 05:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqR0i-0000dv-UG; Tue, 17 Sep 2024 05:44:24 +0000
Received: by outflank-mailman (input) for mailman id 799773;
 Tue, 17 Sep 2024 00:22:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nqc/=QP=treblig.org=dave@srs-se1.protection.inumbo.net>)
 id 1sqLz2-0007CN-6q
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 00:22:20 +0000
Received: from mx.treblig.org (mx.treblig.org [2a00:1098:5b::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e38cba57-748a-11ef-99a2-01e77a169b0f;
 Tue, 17 Sep 2024 02:22:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <dave@treblig.org>) id 1sqLyv-0062od-1W;
 Tue, 17 Sep 2024 00:22:13 +0000
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
X-Inumbo-ID: e38cba57-748a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=hDyh/qvtfWyCwjoSpsGcpYhuPt331NF6LPoyYqh2KtM=; b=Wjc8Vf8hajewIYYk
	Pp7JiY6f/Xkbq28gi8S6bsAyPua6G2Uvpxhhz+BYaLRIjViCC9tQKD31wGWK153OB9hbk2E82Q2uJ
	yx4fFnnjN99L5JJ63vifFyqjmN92cJNnE2R/hPwM2uMDoeE8TUEMQSX07k3GzlXXB8P1RRq+d/YKh
	KMqqO8QtHGUF3I6v0s661yMsu5HU2jgLPmHRg+Vgk+eAg1giUfAPZqn/frwyfG9oV0UyO1zrKflW0
	Mw/fR2SjhooL/UEvecb2E+05kUYYHRoIOF9W9KAo54oxL0ZBJzR1muplI+QcY/wAO/p6JVWjQaufN
	YA9+2J7lkpVRjNUCFA==;
From: dave@treblig.org
To: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	edgar.iglesias@gmail.com
Cc: xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dave@treblig.org>
Subject: [PATCH] hw/xen: Remove deadcode
Date: Tue, 17 Sep 2024 01:22:12 +0100
Message-ID: <20240917002212.330893-1-dave@treblig.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <dave@treblig.org>

xen_be_copy_grant_refs is unused since 2019's
  19f87870ba ("xen: remove the legacy 'xen_disk' backend")

xen_config_dev_console is unused since 2018's
  6d7c06c213 ("Remove broken Xen PV domain builder")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>
---
 hw/xen/xen-legacy-backend.c         | 18 ------------------
 hw/xen/xen_devconfig.c              |  8 --------
 include/hw/xen/xen-legacy-backend.h |  5 -----
 3 files changed, 31 deletions(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 5514184f9c..e8e1ee4f7d 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -147,24 +147,6 @@ void xen_be_unmap_grant_refs(struct XenLegacyDevice *xendev, void *ptr,
     }
 }
 
-int xen_be_copy_grant_refs(struct XenLegacyDevice *xendev,
-                           bool to_domain,
-                           XenGrantCopySegment segs[],
-                           unsigned int nr_segs)
-{
-    int rc;
-
-    assert(xendev->ops->flags & DEVOPS_FLAG_NEED_GNTDEV);
-
-    rc = qemu_xen_gnttab_grant_copy(xendev->gnttabdev, to_domain, xen_domid,
-                                    segs, nr_segs, NULL);
-    if (rc) {
-        xen_pv_printf(xendev, 0, "xengnttab_grant_copy failed: %s\n",
-                      strerror(-rc));
-    }
-    return rc;
-}
-
 /*
  * get xen backend device, allocate a new one if it doesn't exist.
  */
diff --git a/hw/xen/xen_devconfig.c b/hw/xen/xen_devconfig.c
index 2150869f60..45ae134b84 100644
--- a/hw/xen/xen_devconfig.c
+++ b/hw/xen/xen_devconfig.c
@@ -66,11 +66,3 @@ int xen_config_dev_vkbd(int vdev)
     xen_config_dev_dirs("vkbd", "vkbd", vdev, fe, be, sizeof(fe));
     return xen_config_dev_all(fe, be);
 }
-
-int xen_config_dev_console(int vdev)
-{
-    char fe[256], be[256];
-
-    xen_config_dev_dirs("console", "console", vdev, fe, be, sizeof(fe));
-    return xen_config_dev_all(fe, be);
-}
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index 943732b8d1..e198b120c5 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -50,10 +50,6 @@ void *xen_be_map_grant_refs(struct XenLegacyDevice *xendev, uint32_t *refs,
 void xen_be_unmap_grant_refs(struct XenLegacyDevice *xendev, void *ptr,
                              uint32_t *refs, unsigned int nr_refs);
 
-int xen_be_copy_grant_refs(struct XenLegacyDevice *xendev,
-                           bool to_domain, XenGrantCopySegment segs[],
-                           unsigned int nr_segs);
-
 static inline void *xen_be_map_grant_ref(struct XenLegacyDevice *xendev,
                                          uint32_t ref, int prot)
 {
@@ -70,6 +66,5 @@ static inline void xen_be_unmap_grant_ref(struct XenLegacyDevice *xendev,
 void xen_config_cleanup(void);
 int xen_config_dev_vfb(int vdev, const char *type);
 int xen_config_dev_vkbd(int vdev);
-int xen_config_dev_console(int vdev);
 
 #endif /* HW_XEN_LEGACY_BACKEND_H */
-- 
2.46.0


