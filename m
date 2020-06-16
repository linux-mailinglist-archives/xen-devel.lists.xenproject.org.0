Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8C01FBF0E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 21:32:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlHIj-0007sQ-Sn; Tue, 16 Jun 2020 19:31:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5w8P=75=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlHIi-0007sL-1C
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 19:31:16 +0000
X-Inumbo-ID: ef98d58a-b007-11ea-b7bb-bc764e2007e4
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef98d58a-b007-11ea-b7bb-bc764e2007e4;
 Tue, 16 Jun 2020 19:31:12 +0000 (UTC)
IronPort-SDR: 0gE+PDsxsLCGKbCNedJVdA+OJceAKpvGUH75tEsKfbR+CA30T1IHCAUtMkNwjpaamQaTP9UfDd
 BHfd09jFbnXg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 12:31:10 -0700
IronPort-SDR: FHsQGahyx7EL1YEKfar76d9mA91IkHzGkoCSa8BM3nyjY7OxEbXpjZYOpe0LFGZMzMWRzQnoN/
 Ke5d4Fl+Y7iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,519,1583222400"; d="scan'208";a="291175270"
Received: from hcwong-mobl2.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.64.215])
 by orsmga002.jf.intel.com with ESMTP; 16 Jun 2020 12:31:08 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14] x86/hap: use get_gfn_type in hap_update_paging_modes
Date: Tue, 16 Jun 2020 12:31:06 -0700
Message-Id: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While forking VMs running a small RTOS systems (Zephyr) a Xen crash has been
observed due to a mm-lock order violation while copying the HVM CPU context
from the parent. This issue has been identified to be due to
hap_update_paging_modes getting a lock on the gfn using get_gfn. This call also
creates a shared entry in the fork's memory map for the cr3 gfn. The function
later calls hap_update_cr3 while holding the paging_lock, which results in the
lock-order violation in vmx_load_pdptrs when it tries to unshare the above entry.

This issue has not affected VMs running other OS's as a call to vmx_load_pdptrs
is benign if PAE is not enabled or if EFER_LMA is set and returns before
trying to unshare and map the page.

Using get_gfn_type to get a lock on the gfn avoids this problem as we can
populate the fork's gfn with a copied page instead of a shared entry if its
needed, thus avoiding the lock order violation while holding paging_lock.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
The bug seems to have been present since commit 4cb6c4f4941, only discovered
now due to the heavy use of mem_sharing with VM forks. As this is a simple
bug-fix it would be nice to include it in the 4.14 release.
---
 xen/arch/x86/mm/hap/hap.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 7f84d0c6ea..9ae4c3ae6e 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -748,12 +748,19 @@ static void hap_update_paging_modes(struct vcpu *v)
     struct domain *d = v->domain;
     unsigned long cr3_gfn = v->arch.hvm.guest_cr[3] >> PAGE_SHIFT;
     p2m_type_t t;
+    p2m_query_t q = P2M_ALLOC;
 
-    /* We hold onto the cr3 as it may be modified later, and
-     * we need to respect lock ordering. No need for 
-     * checks here as they are performed by vmx_load_pdptrs
-     * (the potential user of the cr3) */
-    (void)get_gfn(d, cr3_gfn, &t);
+    /*
+     * We hold onto the cr3 as it may be modified later, and
+     * we need to respect lock ordering. Unshare here if we have to as to avoid
+     * a lock-order violation later while we are holding the paging_lock.
+     * Further checks are performed by vmx_load_pdptrs (the potential user of
+     * the cr3).
+     */
+    if ( hvm_pae_enabled(v) && !hvm_long_mode_active(v) )
+        q |= P2M_UNSHARE;
+
+    (void)get_gfn_type(d, cr3_gfn, &t, q);
     paging_lock(d);
 
     v->arch.paging.mode = hap_paging_get_mode(v);
-- 
2.25.1


