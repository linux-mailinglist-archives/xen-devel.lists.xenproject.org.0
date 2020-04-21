Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8901B2E8E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 19:48:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQwzu-0006wT-99; Tue, 21 Apr 2020 17:47:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=90sK=6F=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jQwzs-0006wF-F4
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 17:47:48 +0000
X-Inumbo-ID: 33f23b36-83f8-11ea-83d8-bc764e2007e4
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33f23b36-83f8-11ea-83d8-bc764e2007e4;
 Tue, 21 Apr 2020 17:47:43 +0000 (UTC)
IronPort-SDR: wof1HeqO93luk6GBbvgWUUrJjVgMNtdj56lQCpmaPrOlvbmpdkBUcSsqDPpwhVB2A3enGDJHW5
 vdhh3Lla36WA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 10:47:38 -0700
IronPort-SDR: v+zuVKiGGBtEq1BGefKamc33QP6S5dAcn7QFqCJfNqBUp0a5boH4nGoMSt6m8EeAUuDGo2fwV5
 Y1+fO29dHnPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; d="scan'208";a="300680743"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.17.85])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2020 10:47:36 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v16 2/3] mem_sharing: allow forking domain with IOMMU enabled
Date: Tue, 21 Apr 2020 10:47:24 -0700
Message-Id: <c958f3776e602143efb2fb7c146a0c18a3fcd262.1587490511.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1587490511.git.tamas.lengyel@intel.com>
References: <cover.1587490511.git.tamas.lengyel@intel.com>
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
v16: Minor fixes based on feedback
---
 xen/arch/x86/mm/mem_sharing.c | 20 +++++++++++++-------
 xen/include/public/memory.h   |  4 +++-
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index d8ed660abb..e690d2fa13 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1445,7 +1445,8 @@ static int range_share(struct domain *d, struct domain *cd,
     return rc;
 }
 
-static inline int mem_sharing_control(struct domain *d, bool enable)
+static inline int mem_sharing_control(struct domain *d, bool enable,
+                                      uint16_t flags)
 {
     if ( enable )
     {
@@ -1455,7 +1456,8 @@ static inline int mem_sharing_control(struct domain *d, bool enable)
         if ( unlikely(!hap_enabled(d)) )
             return -ENODEV;
 
-        if ( unlikely(is_iommu_enabled(d)) )
+        if ( unlikely(is_iommu_enabled(d) &&
+                      !(flags & XENMEM_FORK_WITH_IOMMU_ALLOWED)) )
             return -EXDEV;
     }
 
@@ -1848,7 +1850,8 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
     if ( rc )
         goto out;
 
-    if ( !mem_sharing_enabled(d) && (rc = mem_sharing_control(d, true)) )
+    if ( !mem_sharing_enabled(d) &&
+         (rc = mem_sharing_control(d, true, 0)) )
         return rc;
 
     switch ( mso.op )
@@ -2086,7 +2089,9 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         struct domain *pd;
 
         rc = -EINVAL;
-        if ( mso.u.fork.pad[0] || mso.u.fork.pad[1] || mso.u.fork.pad[2] )
+        if ( mso.u.fork.pad )
+            goto out;
+        if ( mso.u.fork.flags & ~XENMEM_FORK_WITH_IOMMU_ALLOWED )
             goto out;
 
         rc = rcu_lock_live_remote_domain_by_id(mso.u.fork.parent_domain,
@@ -2101,7 +2106,8 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
             goto out;
         }
 
-        if ( !mem_sharing_enabled(pd) && (rc = mem_sharing_control(pd, true)) )
+        if ( !mem_sharing_enabled(pd) &&
+             (rc = mem_sharing_control(pd, true, mso.u.fork.flags)) )
         {
             rcu_unlock_domain(pd);
             goto out;
@@ -2122,7 +2128,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         struct domain *pd;
 
         rc = -EINVAL;
-        if ( mso.u.fork.pad[0] || mso.u.fork.pad[1] || mso.u.fork.pad[2] )
+        if ( mso.u.fork.pad || mso.u.fork.flags )
             goto out;
 
         rc = -ENOSYS;
@@ -2159,7 +2165,7 @@ int mem_sharing_domctl(struct domain *d, struct xen_domctl_mem_sharing_op *mec)
     switch ( mec->op )
     {
     case XEN_DOMCTL_MEM_SHARING_CONTROL:
-        rc = mem_sharing_control(d, mec->u.enable);
+        rc = mem_sharing_control(d, mec->u.enable, 0);
         break;
 
     default:
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index d36d64b8dc..e56800357d 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -536,7 +536,9 @@ struct xen_mem_sharing_op {
         } debug;
         struct mem_sharing_op_fork {      /* OP_FORK */
             domid_t parent_domain;        /* IN: parent's domain id */
-            uint16_t pad[3];              /* Must be set to 0 */
+#define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
+            uint16_t flags;               /* IN: optional settings */
+            uint32_t pad;                 /* Must be set to 0 */
         } fork;
     } u;
 };
-- 
2.20.1


