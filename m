Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D222D7796
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 15:17:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50640.89362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knjDv-0007f5-KY; Fri, 11 Dec 2020 14:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50640.89362; Fri, 11 Dec 2020 14:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knjDv-0007eg-H3; Fri, 11 Dec 2020 14:16:43 +0000
Received: by outflank-mailman (input) for mailman id 50640;
 Fri, 11 Dec 2020 14:16:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nv6e=FP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1knjDu-0007ea-Ac
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 14:16:42 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d12eb43e-2f46-4a07-8aeb-58085b813241;
 Fri, 11 Dec 2020 14:16:40 +0000 (UTC)
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
X-Inumbo-ID: d12eb43e-2f46-4a07-8aeb-58085b813241
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607696200;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8H42SUW0bR+8N2cMiG0OFcydNJK4AD9EAmy9cNPqMes=;
  b=QxJtiGo33lnCKH0ix7z83xnvm1wNLPujhUocW8KSYQIcMIaufICcv0XC
   0EhMCX10iOVitVaHwwz8uF9xc2oU7vqNdCaNGQ0W23LjM0WaoQx5vL+bj
   LhL1XdvPbYWrPpfrHiysa+r2mjPNkowZ2sdCvUE7TGH5Bf8bazvpzvu53
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: K/hnHrSfABfZTpsNhA/pGdRyqzpZOXPhq4DhGpjVbeyslbvyAzd555Hm/LJfPGmox3HTuwdg0B
 9Z7WudJnerU5NJImmkowFvFY77OTACjec7QwG9FK1GKfACUzuWs6Kw5tgFybJ5KnSq9+xkYqGQ
 3eNrwh9MDHkpxez4suqGwhE9g4GVv5goSUca0JDb8jKTjGN2Zu/u2HPt2susyjNerec37Mlf6C
 UaqviWFTx5e2fN8PMELHvoyP4H5A6jbq/b+Fh8k+LHb0sO6Utz6oBIy/FezKO3dDTtVt/6GyI2
 OO4=
X-SBRS: 5.2
X-MesageID: 33012202
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,411,1599537600"; 
   d="scan'208";a="33012202"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Manuel Bouyer
	<bouyer@antioche.eu.org>
Subject: [PATCH] Revert "x86/mm: drop guest_get_eff_l1e()"
Date: Fri, 11 Dec 2020 14:16:15 +0000
Message-ID: <20201211141615.12489-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This reverts commit 9ff9705647646aa937b5f5c1426a64c69a62b3bd.

The change is only correct in the original context of XSA-286, where Xen's use
of the linear pagetables were dropped.  However, performance problems
interfered with that plan, and XSA-286 was fixed differently.

This broke Xen's lazy faulting of the LDT for 64bit PV guests when an access
was first encountered in user context.  Xen would proceed to read the
registered LDT virtual address out of the user pagetables, not the kernel
pagetables.

Given the nature of the bug, it would have also interfered with the IO
permisison bitmap functionality of userspace, which similarly needs to read
data using the kernel pagetables.

Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Manuel Bouyer <bouyer@antioche.eu.org>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Manuel Bouyer <bouyer@antioche.eu.org>

There is also a bug with Xen's IRET handling, but that has been broken forever
and is much more complicated to fix.  I'll put it on my TODO list, but no idea
when I'll get around to addressing it.
---
 xen/arch/x86/pv/mm.c            | 21 +++++++++++++++++++++
 xen/arch/x86/pv/mm.h            |  7 ++-----
 xen/arch/x86/pv/ro-page-fault.c |  2 +-
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
index 5d74d11cba..14cb0f2d4e 100644
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -56,6 +56,27 @@ l1_pgentry_t *map_guest_l1e(unsigned long linear, mfn_t *gl1mfn)
 }
 
 /*
+ * Read the guest's l1e that maps this address, from the kernel-mode
+ * page tables.
+ */
+static l1_pgentry_t guest_get_eff_kern_l1e(unsigned long linear)
+{
+    struct vcpu *curr = current;
+    const bool user_mode = !(curr->arch.flags & TF_kernel_mode);
+    l1_pgentry_t l1e;
+
+    if ( user_mode )
+        toggle_guest_pt(curr);
+
+    l1e = guest_get_eff_l1e(linear);
+
+    if ( user_mode )
+        toggle_guest_pt(curr);
+
+    return l1e;
+}
+
+/*
  * Map a guest's LDT page (covering the byte at @offset from start of the LDT)
  * into Xen's virtual range.  Returns true if the mapping changed, false
  * otherwise.
diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
index 2a21859dd4..b1b66e46c8 100644
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -5,11 +5,8 @@ l1_pgentry_t *map_guest_l1e(unsigned long linear, mfn_t *gl1mfn);
 
 int new_guest_cr3(mfn_t mfn);
 
-/*
- * Read the guest's l1e that maps this address, from the kernel-mode
- * page tables.
- */
-static inline l1_pgentry_t guest_get_eff_kern_l1e(unsigned long linear)
+/* Read a PV guest's l1e that maps this linear address. */
+static inline l1_pgentry_t guest_get_eff_l1e(unsigned long linear)
 {
     l1_pgentry_t l1e;
 
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 8d0007ede5..7f6fbc92fb 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -342,7 +342,7 @@ int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
     bool mmio_ro;
 
     /* Attempt to read the PTE that maps the VA being accessed. */
-    pte = guest_get_eff_kern_l1e(addr);
+    pte = guest_get_eff_l1e(addr);
 
     /* We are only looking for read-only mappings */
     if ( ((l1e_get_flags(pte) & (_PAGE_PRESENT | _PAGE_RW)) != _PAGE_PRESENT) )
-- 
2.11.0


