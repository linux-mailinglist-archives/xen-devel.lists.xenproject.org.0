Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F209AB2FE4C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088816.1446539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7As-000659-Ic; Thu, 21 Aug 2025 15:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088816.1446539; Thu, 21 Aug 2025 15:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7As-00062c-CI; Thu, 21 Aug 2025 15:25:58 +0000
Received: by outflank-mailman (input) for mailman id 1088816;
 Thu, 21 Aug 2025 15:25:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMBP=3B=bounce.vates.tech=bounce-md_30504962.68a73a81.v1-9e97327b3e3448aa96280e39b2c50859@srs-se1.protection.inumbo.net>)
 id 1up7Aq-0005na-HL
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:25:56 +0000
Received: from mail179-29.suw41.mandrillapp.com
 (mail179-29.suw41.mandrillapp.com [198.2.179.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 203876e4-7ea3-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 17:25:54 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-29.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4c76bP1Cbvz7lmVSh
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 15:25:53 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9e97327b3e3448aa96280e39b2c50859; Thu, 21 Aug 2025 15:25:53 +0000
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
X-Inumbo-ID: 203876e4-7ea3-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755789953; x=1756059953;
	bh=MVrRTSIy9uYoaMBKkh7zoQoap19sAiJjJLjg5p6Ic0g=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=D2T/lPxz9m6iy5cumbLkrM2qX4+oJFF7v4EcytjbXPe9vYi4dexm4YDKMXy//M24w
	 V41VG0zhJRq8hmIguPTx3VWbGZoobthF2m9uEg0Hp3z3U4Sld1HKHTz2iCbsW9iLlF
	 dkiV6+OtrCfWRDZyBX/DOnamQZsZnPAsBLVu5RNAQjL1EQI+2gQDVYWGtgG1p5KYNk
	 PIAR8/lezfnc/GtR6YPOlezeyAA76/8GVp2se8CzcPmlrQUFXZS31uk0DehVsWvQdq
	 6ZVZu+IlRoAtmyHcCpbGvF4ZL7N9uLAd/49d9i8y9RsaRJKFi63waNCByTKUVto8s7
	 ala/oxN8trNCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755789953; x=1756050453; i=teddy.astie@vates.tech;
	bh=MVrRTSIy9uYoaMBKkh7zoQoap19sAiJjJLjg5p6Ic0g=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ww6gqMX6PdulhC+7W88CP5mu1tt2Y/0gT5fgjGjY8kqYdRiCur0LurbE/nSLdimqf
	 56QPqjfAe8jxQCedo+NaZWg8QGKMJCkY4ug0XGiYJFN3/9daFQSilIjBEe0xTkmusi
	 ZBlZ0bUMcLrvrbIk3XllGIeZw2ZSWj2SWRs5J/RC7Pqg5kNBHsfRv/kKGIXbeTGmqC
	 HPKCHaLe0Afz4AcdRFge5eQCK7l2IFCX3fTJA8v1Da/XmOrNSedMoYOci00IIx0lTg
	 1kU3tuTNcD8zqLZKtnIObGu3+oDcM/d9u7ysc0/RXZykf6uoCc67Ed2Qy5UZxkUon8
	 tO8ETKr/KYO/A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=203/9]=20common/grant=5Ftable:=20Use=20direct=20structures=20instead=20of=20guest=20handles?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755789951955
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <3443dc8528075ce8ed8dd89ee5d0b78515c81e8e.1755785258.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1755785258.git.teddy.astie@vates.tech>
References: <cover.1755785258.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9e97327b3e3448aa96280e39b2c50859?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250821:md
Date: Thu, 21 Aug 2025 15:25:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Make these functions work with hypervisor-owned pointer rather than
guest handles, so the function parameters don't have to live in guest memory.

No functional changes.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/common/grant_table.c | 68 +++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1..3c3bbca2fc 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3164,29 +3164,24 @@ static long gnttab_copy(
     return rc;
 }
 
-static long
-gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
+static long gnttab_set_version(gnttab_set_version_t *op)
 {
-    gnttab_set_version_t op;
     struct domain *currd = current->domain;
     struct grant_table *gt = currd->grant_table;
     grant_entry_v1_t reserved_entries[GNTTAB_NR_RESERVED_ENTRIES];
     int res;
     unsigned int i, nr_ents;
 
-    if ( copy_from_guest(&op, uop, 1) )
-        return -EFAULT;
-
     res = -EINVAL;
-    if ( op.version != 1 && op.version != 2 )
+    if ( op->version != 1 && op->version != 2 )
         goto out;
 
     res = -ENOSYS;
-    if ( op.version == 2 && gt->max_version == 1 )
+    if ( op->version == 2 && gt->max_version == 1 )
         goto out; /* Behave as before set_version was introduced. */
 
     res = 0;
-    if ( gt->gt_version == op.version )
+    if ( gt->gt_version == op->version )
         goto out;
 
     grant_write_lock(gt);
@@ -3203,7 +3198,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
         {
             gdprintk(XENLOG_WARNING,
                      "tried to change grant table version from %u to %u, but some grant entries still in use\n",
-                     gt->gt_version, op.version);
+                     gt->gt_version, op->version);
             res = -EBUSY;
             goto out_unlock;
         }
@@ -3268,7 +3263,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
         break;
     }
 
-    if ( op.version < 2 && gt->gt_version == 2 &&
+    if ( op->version < 2 && gt->gt_version == 2 &&
          (res = gnttab_unpopulate_status_frames(currd, gt)) != 0 )
         goto out_unlock;
 
@@ -3279,7 +3274,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
     /* Restore the first 8 entries (toolstack reserved grants). */
     if ( gt->gt_version )
     {
-        switch ( op.version )
+        switch ( op->version )
         {
         case 1:
             memcpy(&shared_entry_v1(gt, 0), reserved_entries, sizeof(reserved_entries));
@@ -3300,16 +3295,14 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
         }
     }
 
-    gt->gt_version = op.version;
+    gt->gt_version = op->version;
 
  out_unlock:
     grant_write_unlock(gt);
 
  out:
-    op.version = gt->gt_version;
+    op->version = gt->gt_version;
 
-    if ( __copy_to_guest(uop, &op, 1) )
-        res = -EFAULT;
 
     return res;
 }
@@ -3387,17 +3380,12 @@ gnttab_get_status_frames(XEN_GUEST_HANDLE_PARAM(gnttab_get_status_frames_t) uop,
     return 0;
 }
 
-static long
-gnttab_get_version(XEN_GUEST_HANDLE_PARAM(gnttab_get_version_t) uop)
+static long gnttab_get_version(gnttab_get_version_t *op)
 {
-    gnttab_get_version_t op;
     struct domain *d;
     int rc;
 
-    if ( copy_from_guest(&op, uop, 1) )
-        return -EFAULT;
-
-    d = rcu_lock_domain_by_any_id(op.dom);
+    d = rcu_lock_domain_by_any_id(op->dom);
     if ( d == NULL )
         return -ESRCH;
 
@@ -3408,13 +3396,10 @@ gnttab_get_version(XEN_GUEST_HANDLE_PARAM(gnttab_get_version_t) uop)
         return rc;
     }
 
-    op.version = d->grant_table->gt_version;
+    op->version = d->grant_table->gt_version;
 
     rcu_unlock_domain(d);
 
-    if ( __copy_field_to_guest(uop, &op, version) )
-        return -EFAULT;
-
     return 0;
 }
 
@@ -3749,8 +3734,20 @@ long do_grant_table_op(
         break;
 
     case GNTTABOP_set_version:
-        rc = gnttab_set_version(guest_handle_cast(uop, gnttab_set_version_t));
+    {
+        gnttab_set_version_t op;
+        if ( copy_from_guest(&op, uop, 1) )
+        {
+            rc = -EFAULT;
+            break;
+        }
+
+        rc = gnttab_set_version(&op);
+
+        if ( copy_to_guest(uop, &op, 1) )
+            rc = -EFAULT;
         break;
+    }
 
     case GNTTABOP_get_status_frames:
         rc = gnttab_get_status_frames(
@@ -3758,8 +3755,21 @@ long do_grant_table_op(
         break;
 
     case GNTTABOP_get_version:
-        rc = gnttab_get_version(guest_handle_cast(uop, gnttab_get_version_t));
+    {
+        gnttab_get_version_t op;
+
+        if ( copy_from_guest(&op, uop, 1) )
+        {
+            rc = -EFAULT;
+            break;
+        }
+
+        rc = gnttab_get_version(&op);
+
+        if ( copy_to_guest(uop, &op, 1) )
+            rc = -EFAULT;
         break;
+    }
 
     case GNTTABOP_swap_grant_ref:
     {
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


