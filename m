Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219731AE32A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 19:07:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPUSA-0005y5-DY; Fri, 17 Apr 2020 17:06:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lvC5=6B=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jPUS9-0005xz-MC
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 17:06:57 +0000
X-Inumbo-ID: d64de930-80cd-11ea-b58d-bc764e2007e4
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d64de930-80cd-11ea-b58d-bc764e2007e4;
 Fri, 17 Apr 2020 17:06:54 +0000 (UTC)
IronPort-SDR: QwXs3ZOvtr03zWg1LI4gt/cKOJyflZAtI72zUhIxQPc60szSp2/s5Wc9Wgktw92uFKWp3nULt1
 T7CYUDw3ohcQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 10:06:46 -0700
IronPort-SDR: 0pnPoF6TZ5mkNJeHiaWByldBGy4lChjaaP5R8cQhK3wb0xYPXUkEI5jcVw8xZK63msW54Bwu8u
 H9zcZVd9aYjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="428288186"
Received: from keclark-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.135.32.180])
 by orsmga005.jf.intel.com with ESMTP; 17 Apr 2020 10:06:44 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v15 2/3] mem_sharing: allow forking domain with IOMMU enabled
Date: Fri, 17 Apr 2020 10:06:32 -0700
Message-Id: <0be7501ace42d856b344828755ece18659dabd33.1587142844.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1587142844.git.tamas.lengyel@intel.com>
References: <cover.1587142844.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
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

The memory sharing subsystem by default doesn't allow a domain to share memory
if it has an IOMMU active for obvious security reasons. However, when fuzzing a
VM fork, the same security restrictions don't necessarily apply. While it makes
no sense to try to create a full fork of a VM that has an IOMMU attached as only
one domain can own the pass-through device at a time, creating a shallow fork
without a device model is still very useful for fuzzing kernel-mode drivers.

By allowing the parent VM to initialize the kernel-mode driver with a real
device that's pass-through, the driver can enter into a state more suitable for
fuzzing. Some of these initialization steps are quite complex and are easier to
perform when a real device is present. After the initialization, shallow forks
can be utilized for fuzzing code-segments in the device driver that don't
directly interact with the device.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/mm/mem_sharing.c | 18 ++++++++++++------
 xen/include/public/memory.h   |  4 +++-
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 4b31a8b8f6..a5063d5992 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1430,7 +1430,8 @@ static int range_share(struct domain *d, struct domain *cd,
     return rc;
 }
 
-static inline int mem_sharing_control(struct domain *d, bool enable)
+static inline int mem_sharing_control(struct domain *d, bool enable,
+                                      bool allow_iommu)
 {
     if ( enable )
     {
@@ -1440,7 +1441,7 @@ static inline int mem_sharing_control(struct domain *d, bool enable)
         if ( unlikely(!hap_enabled(d)) )
             return -ENODEV;
 
-        if ( unlikely(is_iommu_enabled(d)) )
+        if (unlikely(!allow_iommu && is_iommu_enabled(d)) )
             return -EXDEV;
     }
 
@@ -1827,7 +1828,8 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
     if ( rc )
         goto out;
 
-    if ( !mem_sharing_enabled(d) && (rc = mem_sharing_control(d, true)) )
+    if ( !mem_sharing_enabled(d) &&
+         (rc = mem_sharing_control(d, true, false)) )
         return rc;
 
     switch ( mso.op )
@@ -2063,9 +2065,10 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
     case XENMEM_sharing_op_fork:
     {
         struct domain *pd;
+        bool allow_iommu;
 
         rc = -EINVAL;
-        if ( mso.u.fork.pad[0] || mso.u.fork.pad[1] || mso.u.fork.pad[2] )
+        if ( mso.u.fork.pad[0] || mso.u.fork.pad[1] )
             goto out;
 
         rc = rcu_lock_live_remote_domain_by_id(mso.u.fork.parent_domain,
@@ -2080,7 +2083,10 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
             goto out;
         }
 
-        if ( !mem_sharing_enabled(pd) && (rc = mem_sharing_control(pd, true)) )
+        allow_iommu = mso.u.fork.flags & XENMEM_FORK_WITH_IOMMU_ALLOWED;
+
+        if ( !mem_sharing_enabled(pd) &&
+             (rc = mem_sharing_control(pd, true, allow_iommu)) )
         {
             rcu_unlock_domain(pd);
             goto out;
@@ -2138,7 +2144,7 @@ int mem_sharing_domctl(struct domain *d, struct xen_domctl_mem_sharing_op *mec)
     switch ( mec->op )
     {
     case XEN_DOMCTL_MEM_SHARING_CONTROL:
-        rc = mem_sharing_control(d, mec->u.enable);
+        rc = mem_sharing_control(d, mec->u.enable, false);
         break;
 
     default:
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index d36d64b8dc..1d2149def3 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -536,7 +536,9 @@ struct xen_mem_sharing_op {
         } debug;
         struct mem_sharing_op_fork {      /* OP_FORK */
             domid_t parent_domain;        /* IN: parent's domain id */
-            uint16_t pad[3];              /* Must be set to 0 */
+#define XENMEM_FORK_WITH_IOMMU_ALLOWED 1  /* Allow forking domain with IOMMU */
+            uint16_t flags;               /* IN: optional settings */
+            uint16_t pad[2];              /* Must be set to 0 */
         } fork;
     } u;
 };
-- 
2.20.1


