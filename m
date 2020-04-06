Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B119719F8BC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 17:21:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLTYH-0006Cg-T1; Mon, 06 Apr 2020 15:20:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOh1=5W=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jLTYG-0006CW-34
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 15:20:40 +0000
X-Inumbo-ID: 269a11f0-781a-11ea-b58d-bc764e2007e4
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 269a11f0-781a-11ea-b58d-bc764e2007e4;
 Mon, 06 Apr 2020 15:20:30 +0000 (UTC)
IronPort-SDR: GhH0YJG6sfeZhz6iYWXyp1Q5S5oWMWFeaBlVhPbu67Kjnwg2F5GZrmcvhPrMiHqkjR5hEK5WHu
 pPiDi9OR1tvQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 08:20:29 -0700
IronPort-SDR: IGomPIhvUSQNWJQ7dXK23HNYO8qZVxDtB0mJ/W8oKndbVv65oLeSLeKn0pCQbDiDNPk+iMPm15
 CVRiYzN44ixw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; d="scan'208";a="269107424"
Received: from jreyna-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.25.73])
 by orsmga002.jf.intel.com with ESMTP; 06 Apr 2020 08:20:28 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v14 2/3] x86/mem_sharing: reset a fork
Date: Mon,  6 Apr 2020 08:20:04 -0700
Message-Id: <44e660066f03a39354dbe5d328f30779b8ebc935.1586185752.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1586185752.git.tamas.lengyel@intel.com>
References: <cover.1586185752.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Implement hypercall that allows a fork to shed all memory that got allocated
for it during its execution and re-load its vCPU context from the parent VM.
This allows the forked VM to reset into the same state the parent VM is in a
faster way then creating a new fork would be. Measurements show about a 2x
speedup during normal fuzzing operations. Performance may vary depending how
much memory got allocated for the forked VM. If it has been completely
deduplicated from the parent VM then creating a new fork would likely be more
performant.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v12: remove continuation & add comment back
     address style issues pointed out by Jan
---
 xen/arch/x86/mm/mem_sharing.c | 77 +++++++++++++++++++++++++++++++++++
 xen/include/public/memory.h   |  1 +
 2 files changed, 78 insertions(+)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 64cd706e5a..85951b7bea 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1749,6 +1749,61 @@ static int fork(struct domain *cd, struct domain *d)
     return rc;
 }
 
+/*
+ * The fork reset operation is intended to be used on short-lived forks only.
+ * There is no hypercall continuation operation implemented for this reason.
+ * For forks that obtain a larger memory footprint it is likely going to be
+ * more performant to create a new fork instead of resetting an existing one.
+ *
+ * TODO: In case this hypercall would become useful on forks with larger memory
+ * footprints the hypercall continuation should be implemented (or if this
+ * feature needs to be become "stable").
+ */
+static int mem_sharing_fork_reset(struct domain *d, struct domain *pd)
+{
+    int rc;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    struct page_info *page, *tmp;
+
+    domain_pause(d);
+
+    /* need recursive lock because we will free pages */
+    spin_lock_recursive(&d->page_alloc_lock);
+    page_list_for_each_safe(page, tmp, &d->page_list)
+    {
+        p2m_type_t p2mt;
+        p2m_access_t p2ma;
+        mfn_t mfn = page_to_mfn(page);
+        gfn_t gfn = mfn_to_gfn(d, mfn);
+
+        mfn = __get_gfn_type_access(p2m, gfn_x(gfn), &p2mt, &p2ma,
+                                    0, NULL, false);
+
+        /* only reset pages that are sharable */
+        if ( !p2m_is_sharable(p2mt) )
+            continue;
+
+        /* take an extra reference or just skip if can't for whatever reason */
+        if ( !get_page(page, d) )
+            continue;
+
+        /* forked memory is 4k, not splitting large pages so this must work */
+        rc = p2m->set_entry(p2m, gfn, INVALID_MFN, PAGE_ORDER_4K,
+                            p2m_invalid, p2m_access_rwx, -1);
+        ASSERT(!rc);
+
+        put_page_alloc_ref(page);
+        put_page(page);
+    }
+    spin_unlock_recursive(&d->page_alloc_lock);
+
+    rc = copy_settings(d, pd);
+
+    domain_unpause(d);
+
+    return rc;
+}
+
 int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
 {
     int rc;
@@ -2039,6 +2094,28 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         break;
     }
 
+    case XENMEM_sharing_op_fork_reset:
+    {
+        struct domain *pd;
+
+        rc = -EINVAL;
+        if ( mso.u.fork.pad[0] || mso.u.fork.pad[1] || mso.u.fork.pad[2] )
+            goto out;
+
+        rc = -ENOSYS;
+        if ( !d->parent )
+            goto out;
+
+        rc = rcu_lock_live_remote_domain_by_id(d->parent->domain_id, &pd);
+        if ( rc )
+            goto out;
+
+        rc = mem_sharing_fork_reset(d, pd);
+
+        rcu_unlock_domain(pd);
+        break;
+    }
+
     default:
         rc = -ENOSYS;
         break;
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 5ee4e0da12..d36d64b8dc 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -483,6 +483,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_mem_access_op_t);
 #define XENMEM_sharing_op_audit             7
 #define XENMEM_sharing_op_range_share       8
 #define XENMEM_sharing_op_fork              9
+#define XENMEM_sharing_op_fork_reset        10
 
 #define XENMEM_SHARING_OP_S_HANDLE_INVALID  (-10)
 #define XENMEM_SHARING_OP_C_HANDLE_INVALID  (-9)
-- 
2.20.1


