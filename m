Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C904115FA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 15:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190916.340745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSJX2-000759-L4; Mon, 20 Sep 2021 13:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190916.340745; Mon, 20 Sep 2021 13:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSJX2-00072G-HS; Mon, 20 Sep 2021 13:40:28 +0000
Received: by outflank-mailman (input) for mailman id 190916;
 Mon, 20 Sep 2021 13:40:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PJ00=OK=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1mSJX1-00072A-EK
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 13:40:27 +0000
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51f96f64-d30d-42de-add0-92d3bd1e1b81;
 Mon, 20 Sep 2021 13:40:24 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 06:40:22 -0700
Received: from tlengyel-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.213.166.36])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 06:40:21 -0700
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
X-Inumbo-ID: 51f96f64-d30d-42de-add0-92d3bd1e1b81
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="308677197"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="308677197"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="532167160"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/mem_sharing: don't lock parent during fork reset
Date: Mon, 20 Sep 2021 09:40:11 -0400
Message-Id: <8fa3c3e10446f99b75e3d4aef10624cfa2fdf72c.1632145015.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During fork reset operation the parent domain doesn't need to be gathered using
rcu_lock_live_remote_domain_by_id, the fork already has the parent pointer.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v2: NULL the parent pointer early in the fork error path
---
 xen/arch/x86/mm/mem_sharing.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 8d5d44bdbc..74d2869c0e 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1861,9 +1861,9 @@ static int fork(struct domain *cd, struct domain *d)
  done:
     if ( rc && rc != -ERESTART )
     {
+        cd->parent = NULL;
         domain_unpause(d);
         put_domain(d);
-        cd->parent = NULL;
     }
 
     return rc;
@@ -1879,9 +1879,10 @@ static int fork(struct domain *cd, struct domain *d)
  * footprints the hypercall continuation should be implemented (or if this
  * feature needs to be become "stable").
  */
-static int mem_sharing_fork_reset(struct domain *d, struct domain *pd)
+static int mem_sharing_fork_reset(struct domain *d)
 {
     int rc;
+    struct domain *pd = d->parent;
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     struct page_info *page, *tmp;
 
@@ -2226,8 +2227,6 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
 
     case XENMEM_sharing_op_fork_reset:
     {
-        struct domain *pd;
-
         rc = -EINVAL;
         if ( mso.u.fork.pad || mso.u.fork.flags )
             goto out;
@@ -2236,13 +2235,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         if ( !d->parent )
             goto out;
 
-        rc = rcu_lock_live_remote_domain_by_id(d->parent->domain_id, &pd);
-        if ( rc )
-            goto out;
-
-        rc = mem_sharing_fork_reset(d, pd);
-
-        rcu_unlock_domain(pd);
+        rc = mem_sharing_fork_reset(d);
         break;
     }
 
-- 
2.25.1


