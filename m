Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C1940DD8A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 17:05:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188538.337725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQswj-00068d-1o; Thu, 16 Sep 2021 15:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188538.337725; Thu, 16 Sep 2021 15:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQswi-00065y-Uy; Thu, 16 Sep 2021 15:05:04 +0000
Received: by outflank-mailman (input) for mailman id 188538;
 Thu, 16 Sep 2021 15:05:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eAL9=OG=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1mQswg-00065o-OG
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 15:05:02 +0000
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76241d08-16ff-11ec-b60a-12813bfff9fa;
 Thu, 16 Sep 2021 15:05:00 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 08:04:59 -0700
Received: from tlengyel-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.12.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 08:04:57 -0700
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
X-Inumbo-ID: 76241d08-16ff-11ec-b60a-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="286269361"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; 
   d="scan'208";a="286269361"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; 
   d="scan'208";a="700650535"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mem_sharing: don't lock parent during fork reset
Date: Thu, 16 Sep 2021 11:04:42 -0400
Message-Id: <c21708c84c850ff8c976a3934099c54da044e7d9.1631802816.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During fork reset operation the parent domain doesn't need to be gathered using
rcu_lock_live_remote_domain_by_id as the fork reset doesn't modify anything on
the parent. The parent is also guaranteed to be paused while forks are active.
This patch reduces lock contention when performing resets in parallel.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/mm/mem_sharing.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 8d5d44bdbc..b80b978ef3 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
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


