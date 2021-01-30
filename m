Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907A8309190
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 03:59:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78639.143206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gTw-0000qT-Q8; Sat, 30 Jan 2021 02:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78639.143206; Sat, 30 Jan 2021 02:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gTw-0000pX-LA; Sat, 30 Jan 2021 02:59:28 +0000
Received: by outflank-mailman (input) for mailman id 78639;
 Sat, 30 Jan 2021 02:59:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bynp=HB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5gTv-0000YD-QJ
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 02:59:27 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90dd9708-3c52-4a16-8f98-bf6113781a2e;
 Sat, 30 Jan 2021 02:59:12 +0000 (UTC)
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
X-Inumbo-ID: 90dd9708-3c52-4a16-8f98-bf6113781a2e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611975552;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TFUeOvHFx2gnEVFRi1+gHwqBqIzxUVzebfveWMaPxFo=;
  b=YEaMJQsEpV/piOFRXT3ButIQtIQQJqxLsMa/JID2A78i05Bama2JjkON
   fY2piX3S3gWHbCqBJDdhQj+xvbbTZ1WXOo5L8daID+bZhct+yOzmUOFmQ
   uyBJF/50wj1gB8l9MRyO2u7idkWMs0KdVnR8U/a59ja91PB3QOBaS6nXZ
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LshTWpJRRTcuKP+ZTeLGY/JqdgFbzmMFQwh2hopnEgq5BO6RfcNBvrJ/TV7ZrcbLeal0aojM3d
 W+AZVWxPvxV4Y+cphexg2wLqOK6faAqXTAEMyq1NPs2K+N0/NJYRwB8dz8+3PKlk+gem4TBmm/
 N86gRDTwuXKMKV+6Zbv2KPt4OQLlyoL8JQpX+pOYeeYhWsZkvFuzEE6EeY+raAKBK3PVMnEyLX
 WYK1mV2UANiEqf4JbRMH/8M2s7AQ//txVUZrxZc4mjqgFXbIzKpKJng8feV7e8FuFJCHTlC7VD
 Swg=
X-SBRS: 5.1
X-MesageID: 37525491
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,387,1602561600"; 
   d="scan'208";a="37525491"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v8 01/16] xen/memory: Reject out-of-range resource 'frame' values
Date: Sat, 30 Jan 2021 02:58:37 +0000
Message-ID: <20210130025852.12430-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210130025852.12430-1-andrew.cooper3@citrix.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The ABI is unfortunate, and frame being 64 bits leads to all kinds of problems
performing correct overflow checks.

Reject out-of-range values, and combinations which overflow, and use unsigned
int consistently elsewhere.  This fixes several truncation bugs in the grant
call tree, as the underlying limits are expressed with unsigned int to begin
with.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Paul Durrant <paul@xen.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

v8:
 * Push long=>int conversion all the way down into gnttab/ioreq
 * Rebase over ARM/IOREQ series

v7.5:
 * New
---
 xen/common/grant_table.c      | 14 +++++++-------
 xen/common/ioreq.c            |  2 +-
 xen/common/memory.c           | 17 +++++++++++++++--
 xen/include/xen/grant_table.h |  8 ++++----
 xen/include/xen/ioreq.h       |  2 +-
 5 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index f6f5acd300..4ecec35f28 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3918,7 +3918,7 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
 
 /* caller must hold write lock */
 static int gnttab_get_status_frame_mfn(struct domain *d,
-                                       unsigned long idx, mfn_t *mfn)
+                                       unsigned int idx, mfn_t *mfn)
 {
     const struct grant_table *gt = d->grant_table;
 
@@ -3929,8 +3929,8 @@ static int gnttab_get_status_frame_mfn(struct domain *d,
 
     if ( idx >= nr_status_frames(gt) )
     {
-        unsigned long nr_status;
-        unsigned long nr_grant;
+        unsigned int nr_status;
+        unsigned int nr_grant;
 
         nr_status = idx + 1; /* sufficient frames to make idx valid */
 
@@ -3958,7 +3958,7 @@ static int gnttab_get_status_frame_mfn(struct domain *d,
 
 /* caller must hold write lock */
 static int gnttab_get_shared_frame_mfn(struct domain *d,
-                                       unsigned long idx, mfn_t *mfn)
+                                       unsigned int idx, mfn_t *mfn)
 {
     const struct grant_table *gt = d->grant_table;
 
@@ -3966,7 +3966,7 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
 
     if ( idx >= nr_grant_frames(gt) )
     {
-        unsigned long nr_grant;
+        unsigned int nr_grant;
 
         nr_grant = idx + 1; /* sufficient frames to make idx valid */
 
@@ -4021,7 +4021,7 @@ int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn, mfn_t *mfn)
     return rc;
 }
 
-int gnttab_get_shared_frame(struct domain *d, unsigned long idx,
+int gnttab_get_shared_frame(struct domain *d, unsigned int idx,
                             mfn_t *mfn)
 {
     struct grant_table *gt = d->grant_table;
@@ -4034,7 +4034,7 @@ int gnttab_get_shared_frame(struct domain *d, unsigned long idx,
     return rc;
 }
 
-int gnttab_get_status_frame(struct domain *d, unsigned long idx,
+int gnttab_get_status_frame(struct domain *d, unsigned int idx,
                             mfn_t *mfn)
 {
     struct grant_table *gt = d->grant_table;
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index a36137d41d..90ed2e0302 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -771,7 +771,7 @@ static int ioreq_server_get_info(struct domain *d, ioservid_t id,
 }
 
 int ioreq_server_get_frame(struct domain *d, ioservid_t id,
-                           unsigned long idx, mfn_t *mfn)
+                           unsigned int idx, mfn_t *mfn)
 {
     struct ioreq_server *s;
     int rc;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 33296e65cb..4d681597a5 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1055,7 +1055,7 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
 }
 
 static int acquire_grant_table(struct domain *d, unsigned int id,
-                               unsigned long frame,
+                               unsigned int frame,
                                unsigned int nr_frames,
                                xen_pfn_t mfn_list[])
 {
@@ -1094,7 +1094,7 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
 
 static int acquire_ioreq_server(struct domain *d,
                                 unsigned int id,
-                                unsigned long frame,
+                                unsigned int frame,
                                 unsigned int nr_frames,
                                 xen_pfn_t mfn_list[])
 {
@@ -1164,6 +1164,19 @@ static int acquire_resource(
     if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
         return -E2BIG;
 
+    /*
+     * The ABI is rather unfortunate.  nr_frames (and therefore the total size
+     * of the resource) is 32bit, while frame (the offset within the resource
+     * we'd like to start at) is 64bit.
+     *
+     * Reject values oustide the of the range of nr_frames, as well as
+     * combinations of frame and nr_frame which overflow, to simplify the rest
+     * of the logic.
+     */
+    if ( (xmar.frame >> 32) ||
+         ((xmar.frame + xmar.nr_frames) >> 32) )
+        return -EINVAL;
+
     rc = rcu_lock_remote_domain_by_id(xmar.domid, &d);
     if ( rc )
         return rc;
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 8876f1f28e..6d14fe2526 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -55,9 +55,9 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
 
 int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn,
                      mfn_t *mfn);
-int gnttab_get_shared_frame(struct domain *d, unsigned long idx,
+int gnttab_get_shared_frame(struct domain *d, unsigned int idx,
                             mfn_t *mfn);
-int gnttab_get_status_frame(struct domain *d, unsigned long idx,
+int gnttab_get_status_frame(struct domain *d, unsigned int idx,
                             mfn_t *mfn);
 
 #else
@@ -92,13 +92,13 @@ static inline int gnttab_map_frame(struct domain *d, unsigned long idx,
     return -EINVAL;
 }
 
-static inline int gnttab_get_shared_frame(struct domain *d, unsigned long idx,
+static inline int gnttab_get_shared_frame(struct domain *d, unsigned int idx,
                                           mfn_t *mfn)
 {
     return -EINVAL;
 }
 
-static inline int gnttab_get_status_frame(struct domain *d, unsigned long idx,
+static inline int gnttab_get_status_frame(struct domain *d, unsigned int idx,
                                           mfn_t *mfn)
 {
     return -EINVAL;
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index 2d635e9432..a54a637bef 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -90,7 +90,7 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v);
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
 
 int ioreq_server_get_frame(struct domain *d, ioservid_t id,
-                           unsigned long idx, mfn_t *mfn);
+                           unsigned int idx, mfn_t *mfn);
 int ioreq_server_map_mem_type(struct domain *d, ioservid_t id,
                               uint32_t type, uint32_t flags);
 
-- 
2.11.0


