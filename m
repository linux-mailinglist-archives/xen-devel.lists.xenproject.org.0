Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EB01ED8BB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 00:42:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgc5T-0007sS-Li; Wed, 03 Jun 2020 22:42:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zj/c=7Q=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jgc5S-0007sM-UF
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 22:42:18 +0000
X-Inumbo-ID: 79cb1578-a5eb-11ea-8993-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79cb1578-a5eb-11ea-8993-bc764e2007e4;
 Wed, 03 Jun 2020 22:42:17 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qNUUHcsHPR5/ZX5jfA7j6npFLJxUeGnPzbb4ZqKdxW5bVbQArf/pY3ydnF9iDS/6BcwVeUIPP+
 yUyESqrysuG+3b1Q+7wVTG54qvd6IP2F7xMOV0nnckNU+PN2hvwNfX1a6cXm7Ica42rSJowKNU
 E7ho/Yp15AlvDzJoLaQ+7eBo5hvkO5eIuD1PIBmZjN0hKtMqYikPViBlOmmKoLCdxoNoq+VA7y
 Ki4Ig4JU/Jn4Vk7ueNSU21915059hJrg9ey6Ex/uAMziSqyy8nGuUXV+vhvC7WEy4iWE8hf3li
 oFc=
X-SBRS: 2.7
X-MesageID: 19193519
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,470,1583211600"; d="scan'208";a="19193519"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc NPT faults
 immediately
Date: Wed, 3 Jun 2020 23:41:48 +0100
Message-ID: <1591224108-564-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, wl@xen.org, paul@xen.org,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

A recalculation NPT fault doesn't always require additional handling
in hvm_hap_nested_page_fault(), moreover in general case if there is no
explicit handling done there - the fault is wrongly considered fatal.

This covers a specific case of migration with vGPU assigned which
uses direct MMIO mappings made by XEN_DOMCTL_memory_mapping hypercall:
at a moment log-dirty is enabled globally, recalculation is requested
for the whole guest memory including those mapped MMIO regions
which causes a page fault being raised at the first access to them;
but due to MMIO P2M type not having any explicit handling in
hvm_hap_nested_page_fault() a domain is erroneously crashed with unhandled
SVM violation.

Instead of trying to be opportunistic - use safer approach and handle
P2M recalculation in a separate NPT fault by attempting to retry after
making the necessary adjustments. This is aligned with Intel behavior
where there are separate VMEXITs for recalculation and EPT violations
(faults) and only faults are handled in hvm_hap_nested_page_fault().
Do it by also unifying do_recalc return code with Intel implementation
where returning 1 means P2M was actually changed.

Since there was no case previously where p2m_pt_handle_deferred_changes()
could return a positive value - it's safe to replace ">= 0" with just "== 0"
in VMEXIT_NPF handler. finish_type_change() is also not affected by the
change as being able to deal with >0 return value of p2m->recalc from
EPT implementation.

Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Changes in v2:
- replace rc with recalc_done bool
- updated comment in finish_type_change()
- significantly extended commit description
Changes in v3:
- covert bool to int implicitly
- a little bit more info of the usecase in the message
---
 xen/arch/x86/hvm/svm/svm.c | 5 +++--
 xen/arch/x86/mm/p2m-pt.c   | 7 ++++++-
 xen/arch/x86/mm/p2m.c      | 2 +-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 46a1aac..7f6f578 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2923,9 +2923,10 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
             v->arch.hvm.svm.cached_insn_len = vmcb->guest_ins_len & 0xf;
         rc = vmcb->exitinfo1 & PFEC_page_present
              ? p2m_pt_handle_deferred_changes(vmcb->exitinfo2) : 0;
-        if ( rc >= 0 )
+        if ( rc == 0 )
+            /* If no recal adjustments were being made - handle this fault */
             svm_do_nested_pgfault(v, regs, vmcb->exitinfo1, vmcb->exitinfo2);
-        else
+        else if ( rc < 0 )
         {
             printk(XENLOG_G_ERR
                    "%pv: Error %d handling NPF (gpa=%08lx ec=%04lx)\n",
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 5c05017..070389e 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -341,6 +341,7 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
     unsigned int level = 4;
     l1_pgentry_t *pent;
     int err = 0;
+    bool recalc_done = false;
 
     table = map_domain_page(pagetable_get_mfn(p2m_get_pagetable(p2m)));
     while ( --level )
@@ -402,6 +403,8 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
                 clear_recalc(l1, e);
                 err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
                 ASSERT(!err);
+
+                recalc_done = true;
             }
         }
         unmap_domain_page((void *)((unsigned long)pent & PAGE_MASK));
@@ -448,12 +451,14 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
             clear_recalc(l1, e);
         err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
         ASSERT(!err);
+
+        recalc_done = true;
     }
 
  out:
     unmap_domain_page(table);
 
-    return err;
+    return err ?: recalc_done;
 }
 
 int p2m_pt_handle_deferred_changes(uint64_t gpa)
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 17f320b..db7bde0 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1197,7 +1197,7 @@ static int finish_type_change(struct p2m_domain *p2m,
         rc = p2m->recalc(p2m, gfn);
         /*
          * ept->recalc could return 0/1/-ENOMEM. pt->recalc could return
-         * 0/-ENOMEM/-ENOENT, -ENOENT isn't an error as we are looping
+         * 0/1/-ENOMEM/-ENOENT, -ENOENT isn't an error as we are looping
          * gfn here. If rc is 1 we need to have it 0 for success.
          */
         if ( rc == -ENOENT || rc > 0 )
-- 
2.7.4


