Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFA27A8CB0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 21:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605945.943596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj2m0-0000ry-NW; Wed, 20 Sep 2023 19:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605945.943596; Wed, 20 Sep 2023 19:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj2m0-0000pg-K5; Wed, 20 Sep 2023 19:22:08 +0000
Received: by outflank-mailman (input) for mailman id 605945;
 Wed, 20 Sep 2023 19:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCP7=FE=citrix.com=prvs=620374269=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qj2lz-0000pY-4O
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 19:22:07 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa3f7eb8-57ea-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 21:22:05 +0200 (CEST)
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
X-Inumbo-ID: fa3f7eb8-57ea-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695237725;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hZ0NqDsXLXdLrTDn16BiwH9dyJsRu0Xn2cSQo7YCeas=;
  b=azGg/b6r3wRm8HWLYNdan6+RqOxfw2MfxQiUWfPLem302CmE9RrJwbw1
   Fw0YQo2XV+/AIlxSmeNdRfGF3/HpE7H5kMwshVsLflLbTDsySjpfFwE40
   BgRDFCx4ueJYrst6xPqgNqO9+9hscYqg2URHd+aLnN0ulQkcMkAkYjtTX
   I=;
X-CSE-ConnectionGUID: ITBTD5KVS0+nteeusPYlSQ==
X-CSE-MsgGUID: 1R3G3IF7Sw2RE/kfIkMzqA==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 122558542
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:4BMu8awyvjR4lEWv9Kt6t+fmxirEfRIJ4+MujC+fZmUNrF6WrkUFz
 WVMDDjQP/2LNjPwc90jO47k8EpT7J7czIcxTANq/CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QRvP6gT4DcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUBy3
 8A0dRMzVUjAgf67za+gcthovf12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwPxBvF9
 j+apQwVBDlDDoewkhurrUmz3NXi2iD1eYE3BqSRo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0XdtbFOkzrh+A1rDV5QexDHULVTNHZ5ots8pebR4A2
 0KNntjpLSdyq7DTQnWYnp+LqRuiNC5TKnUNDQcYTA4t89Tl5oYpgXrnVc1/GaS4itn0HzDYw
 D2QqiU6wbIJgqY2O76TpA6dxWj2/96QE1Bzv1+MNo640u9nTK+ZTbCEtHvl1q4DKpqUQ0Sah
 EkAoPHLuYjiEqqxvCCKRewMGpSg6PCELCDQjDZTInUxy9i+0yX9JN4NuVmSMG8sa59ZImGxP
 Cc/rCsLvPdu0G2Wgbibim5bI+Aj1uDeGNvsTZg4hfIeM8EqJGdrEMyDDHN8PlwBcmB2wcnT2
 r/BK65A6Er27ow5pAdav89HjdcWKtkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlnvf7d/FWJr
 IwPbZfiJ/BjvArWOHO/zGLuBQpScShT6W7e+6S7idJv0iI5QTp8Wpc9MJsqepB/nrQ9qws71
 ijVZ6Os83Km3SevAVzTOhhehEbHAc4XQYQTYXZ9Yj5FGhELPe6S0UvoX8JoJeh5rLQ4k68co
 jtsU5zoP8mjgw/vo1w1BaQRZqQ+HPh3rWpi5xaYXQU=
IronPort-HdrOrdr: A9a23:co7ihaBCi0YKoJzlHelV55DYdb4zR+YMi2TDGXoBLiC9Ffbo6P
 xG+c516faaskdpZJhNo6HkBEDEewKnyXc32/hjAV7AZnibhILLFvAb0WK4+UyRJ8SWzIc0vs
 0MH9kdNDSzNykGsS+Q2njfLz9P+qjizElqv4bjJrVWIz2Cp5sB0+4AMHfhLmRGAC1PBZ84E5
 TZw8pculObCAYqhw2Adxo4tvD41qz2fYzdEGA7OyI=
X-Talos-CUID: =?us-ascii?q?9a23=3AAP01AGrcSPxkFmO1lEz2UU7mUeEZWEHxkVTuGBf?=
 =?us-ascii?q?7D3pkRaCOcW6Uw5oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AF7oQdQ0cwH/S9vKOE8EuasGGbDUjup71Jxssv8o?=
 =?us-ascii?q?9pJO+GGtzNRaeqSaua9py?=
X-IronPort-AV: E=Sophos;i="6.03,162,1694750400"; 
   d="scan'208";a="122558542"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan
	<tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86/paging: Delete update_cr3()'s do_locking parameter
Date: Wed, 20 Sep 2023 20:21:53 +0100
Message-ID: <20230920192153.1967618-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Nicola reports that the XSA-438 fix introduced new MISRA violations because of
some incidental tidying it tried to do.  The parameter is useless, so resolve
the MISRA regression by removing it.

hap_update_cr3() discards the parameter entirely, while sh_update_cr3() uses
it to distinguish internal and external callers and therefore whether the
paging lock should be taken.

However, we have paging_lock_recursive() for this purpose, which also avoids
the ability for the shadow internal callers to accidentally not hold the lock.

Fixes: fb0ff49fe9f7 ("x86/shadow: defer releasing of PV's top-level shadow reference")
Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: George Dunlap <george.dunlap@eu.citrix.com>
CC: Tim Deegan <tim@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

Slightly RFC.  Only compile tested so far.
---
 xen/arch/x86/include/asm/paging.h |  5 ++---
 xen/arch/x86/mm/hap/hap.c         |  5 ++---
 xen/arch/x86/mm/shadow/common.c   |  2 +-
 xen/arch/x86/mm/shadow/multi.c    | 17 ++++++++---------
 4 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 8fad4cfc1823..f291f2f9a21f 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -118,8 +118,7 @@ struct paging_mode {
                                             paddr_t ga, uint32_t *pfec,
                                             unsigned int *page_order);
 #endif
-    pagetable_t   (*update_cr3            )(struct vcpu *v, bool do_locking,
-                                            bool noflush);
+    pagetable_t   (*update_cr3            )(struct vcpu *v, bool noflush);
 
     unsigned int guest_levels;
 
@@ -296,7 +295,7 @@ static inline bool paging_flush_tlb(const unsigned long *vcpu_bitmap)
  * as the value to load into the host CR3 to schedule this vcpu */
 static inline pagetable_t paging_update_cr3(struct vcpu *v, bool noflush)
 {
-    return paging_get_hostmode(v)->update_cr3(v, 1, noflush);
+    return paging_get_hostmode(v)->update_cr3(v, noflush);
 }
 
 /* Update all the things that are derived from the guest's CR0/CR3/CR4.
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index e30f543d2cc5..9f964c1d878f 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -707,8 +707,7 @@ static bool cf_check hap_invlpg(struct vcpu *v, unsigned long linear)
     return 1;
 }
 
-static pagetable_t cf_check hap_update_cr3(
-    struct vcpu *v, bool do_locking, bool noflush)
+static pagetable_t cf_check hap_update_cr3(struct vcpu *v, bool noflush)
 {
     v->arch.hvm.hw_cr[3] = v->arch.hvm.guest_cr[3];
     hvm_update_guest_cr3(v, noflush);
@@ -794,7 +793,7 @@ static void cf_check hap_update_paging_modes(struct vcpu *v)
     }
 
     /* CR3 is effectively updated by a mode change. Flush ASIDs, etc. */
-    hap_update_cr3(v, 0, false);
+    hap_update_cr3(v, false);
 
  unlock:
     paging_unlock(d);
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 8211e77cc7ff..8aa7b698f879 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2510,7 +2510,7 @@ static void sh_update_paging_modes(struct vcpu *v)
     }
 #endif /* OOS */
 
-    v->arch.paging.mode->update_cr3(v, 0, false);
+    v->arch.paging.mode->update_cr3(v, false);
 }
 
 /*
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 447512870d21..90cf0ceaa367 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2475,7 +2475,7 @@ static int cf_check sh_page_fault(
          * In any case, in the PAE case, the ASSERT is not true; it can
          * happen because of actions the guest is taking. */
 #if GUEST_PAGING_LEVELS == 3
-        v->arch.paging.mode->update_cr3(v, 0, false);
+        v->arch.paging.mode->update_cr3(v, false);
 #else
         ASSERT(d->is_shutting_down);
 #endif
@@ -3156,17 +3156,13 @@ sh_update_linear_entries(struct vcpu *v)
     sh_flush_local(d);
 }
 
-static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool do_locking,
-                                          bool noflush)
+static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
 /* Updates vcpu->arch.cr3 after the guest has changed CR3.
  * Paravirtual guests should set v->arch.guest_table (and guest_table_user,
  * if appropriate).
  * HVM guests should also make sure hvm_get_guest_cntl_reg(v, 3) works;
  * this function will call hvm_update_guest_cr(v, 3) to tell them where the
  * shadow tables are.
- * If do_locking != 0, assume we are being called from outside the
- * shadow code, and must take and release the paging lock; otherwise
- * that is the caller's responsibility.
  */
 {
     struct domain *d = v->domain;
@@ -3184,7 +3180,11 @@ static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool do_locking,
         return old_entry;
     }
 
-    if ( do_locking ) paging_lock(v->domain);
+    /*
+     * This is used externally (with the paging lock not taken) and internally
+     * by the shadow code (with the lock already taken).
+     */
+    paging_lock_recursive(v->domain);
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
     /* Need to resync all the shadow entries on a TLB flush.  Resync
@@ -3412,8 +3412,7 @@ static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool do_locking,
     shadow_sync_other_vcpus(v);
 #endif
 
-    /* Release the lock, if we took it (otherwise it's the caller's problem) */
-    if ( do_locking ) paging_unlock(v->domain);
+    paging_unlock(v->domain);
 
     return old_entry;
 }

base-commit: fb0ff49fe9f784bfee0370c2a3c5f20e39d7a1cb
-- 
2.30.2


