Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CC91E71B2
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 02:38:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeT0Y-0002zy-RH; Fri, 29 May 2020 00:36:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yhI=7L=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jeT0Y-0002zt-80
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 00:36:22 +0000
X-Inumbo-ID: 6a53ab6a-a144-11ea-8993-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a53ab6a-a144-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 00:36:20 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wNmvSahmlECqvHg8JedH8RH/SKV/ZtpBZD5yQOkwQklXAkkK2tdbw9cYZpQ1grSS6NuAzPm99s
 ZCXnSApvy4M+vi3fH0e4HHV7wAvDJfCYB/SD0TVVuFra5Qjvq47DmEU6rPR6+SNf/a3RHI/E5D
 8uN6QYuSjmdZ01rZs7t0svsO6e6zsZETKLHsDF6lij6av30wpHXGEQqLHoBWOyls7C9BPL2UkN
 Ei5WSmaOOuIal6G+xvSEBedIlOpzj98LxXyfPtOTUGZ9Abo3SS8eRkcRU2ajQgGkbzEXWrC7AV
 riY=
X-SBRS: 2.7
X-MesageID: 19456684
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,446,1583211600"; d="scan'208";a="19456684"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/svm: do not try to handle recalc NPT faults immediately
Date: Fri, 29 May 2020 01:35:53 +0100
Message-ID: <1590712553-7298-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, wl@xen.org,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

A recalculation NPT fault doesn't always require additional handling
in hvm_hap_nested_page_fault(), moreover in general case if there is no
explicit handling done there - the fault is wrongly considered fatal.

Instead of trying to be opportunistic - use safer approach and handle
P2M recalculation in a separate NPT fault by attempting to retry after
making the necessary adjustments. This is aligned with Intel behavior
where there are separate VMEXITs for recalculation and EPT violations
(faults) and only faults are handled in hvm_hap_nested_page_fault().
Do it by also unifying do_recalc return code with Intel implementation
where returning 1 means P2M was actually changed.

This covers a specific case of migration with vGPU assigned on AMD:
global log-dirty is enabled and causes immediate recalculation NPT
fault in MMIO area upon access.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
This is a safer alternative to:
https://lists.xenproject.org/archives/html/xen-devel/2020-05/msg01662.html
and more correct approach from my PoV.
---
 xen/arch/x86/hvm/svm/svm.c | 5 +++--
 xen/arch/x86/mm/p2m-pt.c   | 8 ++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

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
index 5c05017..377565b 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -340,7 +340,7 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
     unsigned long gfn_remainder = gfn;
     unsigned int level = 4;
     l1_pgentry_t *pent;
-    int err = 0;
+    int err = 0, rc = 0;
 
     table = map_domain_page(pagetable_get_mfn(p2m_get_pagetable(p2m)));
     while ( --level )
@@ -402,6 +402,8 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
                 clear_recalc(l1, e);
                 err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
                 ASSERT(!err);
+
+                rc = 1;
             }
         }
         unmap_domain_page((void *)((unsigned long)pent & PAGE_MASK));
@@ -448,12 +450,14 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
             clear_recalc(l1, e);
         err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
         ASSERT(!err);
+
+        rc = 1;
     }
 
  out:
     unmap_domain_page(table);
 
-    return err;
+    return err ? err : rc;
 }
 
 int p2m_pt_handle_deferred_changes(uint64_t gpa)
-- 
2.7.4


