Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB551AE32C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 19:07:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPUSC-0005yM-Nm; Fri, 17 Apr 2020 17:07:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lvC5=6B=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jPUSB-0005yB-14
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 17:06:59 +0000
X-Inumbo-ID: d5e6bc9d-80cd-11ea-8d58-12813bfff9fa
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5e6bc9d-80cd-11ea-8d58-12813bfff9fa;
 Fri, 17 Apr 2020 17:06:54 +0000 (UTC)
IronPort-SDR: UMpcsIwibaTSXgcNQgExkE8c7VJKrwZKPlmW0yzIAbo/i7tfHgiD0EHiGL5LdaWiISKFclx1N+
 x0FuSHOMlnyg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 10:06:44 -0700
IronPort-SDR: yD0rH/H3MEyzfzqevgp6lFsmboi4nihchuwQrtdF08TfAwXXWc/XvKNZ1EMZp0hjD+KiL0Hj9x
 4AvQNsAoAa8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="428288173"
Received: from keclark-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.135.32.180])
 by orsmga005.jf.intel.com with ESMTP; 17 Apr 2020 10:06:43 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v15 1/3] mem_sharing: don't reset vCPU info page during fork
 reset
Date: Fri, 17 Apr 2020 10:06:31 -0700
Message-Id: <ef0f91fd4c49c623dda09a1774392d2f2a99ae35.1587142844.git.tamas.lengyel@intel.com>
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When a forked VM is being reset while having vm_events active, re-copying the
vCPU info page can lead to events being lost. This seems to only affect a
subset of events (interrupts), while not others (cpuid, MTF, EPT) thus it was
not discovered beforehand. Only copying vCPU info page contents during initial
fork fixes the problem.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/mm/mem_sharing.c | 50 +++++++++++++++++------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index e572e9e39d..4b31a8b8f6 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1534,28 +1534,6 @@ int mem_sharing_fork_page(struct domain *d, gfn_t gfn, bool unsharing)
                           p2m->default_access, -1);
 }
 
-static int bring_up_vcpus(struct domain *cd, struct domain *d)
-{
-    unsigned int i;
-    int ret = -EINVAL;
-
-    if ( d->max_vcpus != cd->max_vcpus ||
-        (ret = cpupool_move_domain(cd, d->cpupool)) )
-        return ret;
-
-    for ( i = 0; i < cd->max_vcpus; i++ )
-    {
-        if ( !d->vcpu[i] || cd->vcpu[i] )
-            continue;
-
-        if ( !vcpu_create(cd, i) )
-            return -EINVAL;
-    }
-
-    domain_update_node_affinity(cd);
-    return 0;
-}
-
 static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 {
     unsigned int i;
@@ -1614,6 +1592,31 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
     return 0;
 }
 
+static int bring_up_vcpus(struct domain *cd, struct domain *d)
+{
+    unsigned int i;
+    int ret = -EINVAL;
+
+    if ( d->max_vcpus != cd->max_vcpus ||
+        (ret = cpupool_move_domain(cd, d->cpupool)) )
+        return ret;
+
+    for ( i = 0; i < cd->max_vcpus; i++ )
+    {
+        if ( !d->vcpu[i] || cd->vcpu[i] )
+            continue;
+
+        if ( !vcpu_create(cd, i) )
+            return -EINVAL;
+    }
+
+    if ( (ret = copy_vcpu_settings(cd, d)) )
+        return ret;
+
+    domain_update_node_affinity(cd);
+    return 0;
+}
+
 static int fork_hap_allocation(struct domain *cd, struct domain *d)
 {
     int rc;
@@ -1697,9 +1700,6 @@ static int copy_settings(struct domain *cd, struct domain *d)
 {
     int rc;
 
-    if ( (rc = copy_vcpu_settings(cd, d)) )
-        return rc;
-
     if ( (rc = hvm_copy_context_and_params(cd, d)) )
         return rc;
 
-- 
2.20.1


