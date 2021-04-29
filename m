Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAFC36F27D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 00:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120233.227390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcEtv-00005J-SQ; Thu, 29 Apr 2021 22:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120233.227390; Thu, 29 Apr 2021 22:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcEtv-0008WV-PB; Thu, 29 Apr 2021 22:12:51 +0000
Received: by outflank-mailman (input) for mailman id 120233;
 Thu, 29 Apr 2021 22:12:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/KXr=J2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lcEtu-0008WQ-4o
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 22:12:50 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id caae0817-419e-4722-b369-0ded4c7450b7;
 Thu, 29 Apr 2021 22:12:49 +0000 (UTC)
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
X-Inumbo-ID: caae0817-419e-4722-b369-0ded4c7450b7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619734368;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6LIVk1pu2pVsc+iERPoTgLfY8nG1QD9FVQ87ifPWYHo=;
  b=RxuM4n2OiI1FMye5NOmhKXCTV23hbyIHfVnzmGv1K1greOSP9lt7fC2b
   VfoNYmDiPcFVvkxwP+ayty2GqBLMHHeIP8bZG+rPEwvROHSEKgLoT285b
   RR2tCL5+uzYoCghMhGLEJxpDADgLQV4ahCllXduXPPJ59UkwtnNium1uV
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IFIfkzFNoIJ4cTvJ7RzIFSG6EjLriEUUXmHXlgAXR6ew1XlhUEDfeW/6/nfMGXLpxd4NhX4/zQ
 pxgeMfqzOFRK/EDQAaNuNYF1EdDkJC+RcRfsRJypW/FSS/pOTGGk72KWiT4hGJ2OFs/gGUYWh6
 NcAzb4LF4T4WQ6EDExDVuVQ4QCmtC4K/UJDyGV9FAMpeyTqmLQ2jG8e6pZU3SEsPMz9iMi5v/n
 Jt8c1d5KYipsV8ZA0DJ2gmJkOpjV1Cj795a1MS+oCUXrbuEMBEgr++AeCPw5yKwVE94/Hji9ES
 jVo=
X-SBRS: 5.1
X-MesageID: 43139989
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ECStNqt6bsNDIAdzSLcGyZl+7skDktV00zAX/kB9WHVpW+az/v
 rBoN0w0xjohDENHEw6kdebN6WaBV/a/5h54Y4eVI3SOzXOkm2uMY1k8M/e0yTtcheOktJ1+K
 98f8FFaOHYIkN9ia/BjDWQN/YF7J25/LuzheHYpk0dKD1CT6179Q92BkK6PyRNNWp7LKE0Hp
 ad+cZLzgDIER98A/iTPXUZQ/PF4+TCiZOOW29hOzcc9AKMgTm0gYSaLzGk2H4lPA9n8PMH+W
 jBnxeR3NTAj82G
X-IronPort-AV: E=Sophos;i="5.82,260,1613451600"; 
   d="scan'208";a="43139989"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86: Always have CR4.PKE set in HVM context
Date: Thu, 29 Apr 2021 23:12:23 +0100
Message-ID: <20210429221223.28348-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The sole user of read_pkru() is the emulated pagewalk, and guarded behind
guest_pku_enabled() which restricts the path to HVM (hap, even) context only.

The commentary in read_pkru() concerning _PAGE_GNTTAB overlapping with
_PAGE_PKEY_BITS is only applicable to PV guests.

The context switch path, via write_ptbase() unconditionally writes CR4 on any
context switch.

Therefore, we can guarantee to separate CR4.PKE between PV and HVM context at
no extra cost.  Set PKE in mmu_cr4_features on boot, so it becomes set in HVM
context, and clear it in pv_make_cr4().

Rename read_pkru() to rdpkru() now that it is a simple wrapper around the
instruction.  This saves two CR4 writes on every pagewalk, which typically
occur more than one per emulation.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

It also occurs to me that for HVM/Idle => HVM/Idle context switches, we never
need to change CR4.  I think this is substantially clearer following XSA-293 /
c/s b2dd00574a4f ("x86/pv: Rewrite guest %cr4 handling from scratch") which
introduced pv_make_cr4().

Therefore, it is probably work having a hvm fastpath path in write_ptbase()
which only touches CR3.
---
 xen/arch/x86/mm/guest_walk.c    |  2 +-
 xen/arch/x86/pv/domain.c        | 16 +++++++++++++++-
 xen/arch/x86/setup.c            |  3 +++
 xen/include/asm-x86/processor.h | 10 +---------
 4 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index 1c601314f3..30d83cf1e0 100644
--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -416,7 +416,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
          guest_pku_enabled(v) )
     {
         unsigned int pkey = guest_l1e_get_pkey(gw->l1e);
-        unsigned int pkru = read_pkru();
+        unsigned int pkru = rdpkru();
 
         if ( read_pkru_ad(pkru, pkey) ||
              ((walk & PFEC_write_access) && read_pkru_wd(pkru, pkey) &&
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index f1cb92585e..731a262a2b 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -182,7 +182,21 @@ unsigned long pv_make_cr4(const struct vcpu *v)
 {
     const struct domain *d = v->domain;
     unsigned long cr4 = mmu_cr4_features &
-        ~(X86_CR4_PCIDE | X86_CR4_PGE | X86_CR4_TSD);
+        ~(X86_CR4_PCIDE | X86_CR4_PGE | X86_CR4_TSD | X86_CR4_PKE);
+
+    /*
+     * We want CR4.PKE set in HVM context when avaialble, but don't support it
+     * in PV context at all.
+     *
+     * _PAGE_PKEY_BITS where previously software available PTE bits.  In
+     * principle, we could let an aware PV guest enable PKE.
+     *
+     * However, Xen uses _PAGE_GNTTAB in debug builds which overlaps with
+     * _PAGE_PKEY_BITS, and the ownership of (and eligibility to move)
+     * software PTE bits is not considered in the PV ABI at all.  For now,
+     * punt the problem to whichever unluckly person finds a compelling
+     * usecase for PKRU in PV guests.
+     */
 
     /*
      * PCIDE or PGE depends on the PCID/XPTI settings, but must not both be
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f2dff2ae6a..8105dc36bb 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1790,6 +1790,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     if ( boot_cpu_has(X86_FEATURE_FSGSBASE) )
         set_in_cr4(X86_CR4_FSGSBASE);
 
+    if ( boot_cpu_has(X86_FEATURE_PKU) )
+        set_in_cr4(X86_CR4_PKE);
+
     if ( opt_invpcid && cpu_has_invpcid )
         use_invpcid = true;
 
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index d5f467d245..d8d0dc8034 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -367,20 +367,12 @@ static always_inline void set_in_cr4 (unsigned long mask)
     write_cr4(read_cr4() | mask);
 }
 
-static inline unsigned int read_pkru(void)
+static inline unsigned int rdpkru(void)
 {
     unsigned int pkru;
-    unsigned long cr4 = read_cr4();
 
-    /*
-     * _PAGE_PKEY_BITS have a conflict with _PAGE_GNTTAB used by PV guests,
-     * so that X86_CR4_PKE  is disabled on hypervisor. To use RDPKRU, CR4.PKE
-     * gets temporarily enabled.
-     */
-    write_cr4(cr4 | X86_CR4_PKE);
     asm volatile (".byte 0x0f,0x01,0xee"
         : "=a" (pkru) : "c" (0) : "dx");
-    write_cr4(cr4);
 
     return pkru;
 }
-- 
2.11.0


