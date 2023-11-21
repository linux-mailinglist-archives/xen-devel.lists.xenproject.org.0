Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81DE7F3519
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 18:41:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638093.994393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5UkK-00025r-6v; Tue, 21 Nov 2023 17:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638093.994393; Tue, 21 Nov 2023 17:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5UkK-00023Z-42; Tue, 21 Nov 2023 17:41:12 +0000
Received: by outflank-mailman (input) for mailman id 638093;
 Tue, 21 Nov 2023 17:41:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8a9=HC=citrix.com=prvs=682c61bdb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5UkI-00023T-G5
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 17:41:10 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 210ab505-8895-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 18:41:00 +0100 (CET)
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
X-Inumbo-ID: 210ab505-8895-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700588460;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7sQBvGrzPAdz2hLvp1ZfmS+2Ui7XE8YmjVh+zVlLuxI=;
  b=IBYqSkru/UG1VvdApyRlfkvsueS98e3gj/YdxnXnNcJEAx1/WbzC0gva
   5AjET/GS5Vi9Jy7R+XXukIA7aYNCEuID+v3ZtDQbh8V6edqArl+IKXRyH
   9hG9e2GZDJTJH1VNJQqKtBEH9K+2WiO+mHN35CHij2cobqkYrm3dq1wkD
   M=;
X-CSE-ConnectionGUID: sAH0mqliSUWIBz1fVCftTQ==
X-CSE-MsgGUID: R0so3EzmRuqMWmxtQPWjRg==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128243828
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:v5t0lK+maK2e2BeYeKfNDrUDyX6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 mIcXzuHOKyKN2qnKY11b9y+8xwFvpXRzNY1QQRrrHg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ksz1BjOkGlA5AdnPKoS5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklV3
 NxALSkJbyu+uMOc0uu1dMJimvgaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUWGPEUn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwPzhzE/
 TKcrwwVBDkgbMeYkheX90ixn8rwmDPnYbotFoe3o6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/MsOjMxd+vBcQLBXQrRXcBVA8E2OTcgash1xzxZdh/LJfg27UZBgrML
 yC2QDkW3upL1ZNbjfjkrTj6bySQSo8lpzPZBzk7vUr/t2uVnKb/O+SVBaHztJ6s1rqxQFibp
 2QjkMOD9u0IBpzlvHXSGL1QROzzu6/cb2O0bbtT838JrWzFF5mLJ9g43d2DDB0xbpZslcHBP
 Cc/Rj+9FLcMZSD3PMebkqq6CtgwzLiIKDgWfqm8Uza6WbAoLFXv1Hg3NSatM5XFzBBEfVcXZ
 c3KLq5BzB8yVcxa8dZBb75GjedzmHFumT+7qFKS503P7IdyrUW9Ed8tWGZipMhjhE9YiG05K
 +piCvY=
IronPort-HdrOrdr: A9a23:uBnM+qgDDL3bNFrElqCifuP8Y3BQXtYji2hC6mlwRA09TySZ//
 rBoB19726StN9xYgBFpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkNK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-Talos-CUID: 9a23:+Pd2VmwgqRxYc5U7oTI2BgUPM+B9d2TZzUztHG6SGz9ndpabVWOprfY=
X-Talos-MUID: 9a23:mF+UIQgj5RkoffFku+ErHMMpDp9z5P+DGkU3jIwjhMyUKRVIBDWng2Hi
X-IronPort-AV: E=Sophos;i="6.04,216,1695700800"; 
   d="scan'208";a="128243828"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hvm: Trivial style cleanup in vlapic.c
Date: Tue, 21 Nov 2023 17:40:54 +0000
Message-ID: <20231121174054.1486631-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Another patch I've found hidden away in my pile of unfinished branches...
This one collided with the bool_t cleanup.
---
 xen/arch/x86/hvm/vlapic.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index a54010d71ea1..5cb87f864908 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -191,8 +191,7 @@ uint32_t vlapic_set_ppr(struct vlapic *vlapic)
    return ppr;
 }
 
-static bool vlapic_match_logical_addr(const struct vlapic *vlapic,
-                                      uint32_t mda)
+static bool vlapic_match_logical_addr(const struct vlapic *vlapic, uint32_t mda)
 {
     bool result = false;
     uint32_t logical_id = vlapic_get_reg(vlapic, APIC_LDR);
@@ -208,11 +207,11 @@ static bool vlapic_match_logical_addr(const struct vlapic *vlapic,
     {
     case APIC_DFR_FLAT:
         if ( logical_id & mda )
-            result = 1;
+            result = true;
         break;
     case APIC_DFR_CLUSTER:
         if ( ((logical_id >> 4) == (mda >> 0x4)) && (logical_id & mda & 0xf) )
-            result = 1;
+            result = true;
         break;
     default:
         printk(XENLOG_G_WARNING "%pv: bad LAPIC DFR value %08x\n",
@@ -244,7 +243,7 @@ bool vlapic_match_dest(
         return (target == source);
 
     case APIC_DEST_ALLINC:
-        return 1;
+        return true;
 
     case APIC_DEST_ALLBUT:
         return (target != source);
@@ -254,7 +253,7 @@ bool vlapic_match_dest(
         break;
     }
 
-    return 0;
+    return false;
 }
 
 static void vlapic_init_sipi_one(struct vcpu *target, uint32_t icr)
@@ -462,7 +461,7 @@ static bool is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
                               uint32_t dest, bool dest_mode)
 {
     if ( vlapic_domain(vlapic)->max_vcpus <= 2 )
-        return 0;
+        return false;
 
     if ( short_hand )
         return short_hand != APIC_DEST_SELF;
@@ -837,7 +836,7 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
 
     case APIC_LVTT:         /* LVT Timer Reg */
         if ( vlapic_lvtt_tdt(vlapic) !=
-             ((val & APIC_TIMER_MODE_MASK) == APIC_TIMER_MODE_TSC_DEADLINE))
+             ((val & APIC_TIMER_MODE_MASK) == APIC_TIMER_MODE_TSC_DEADLINE) )
         {
             vlapic_set_reg(vlapic, APIC_TMICT, 0);
             vlapic->hw.tdt_msr = 0;
@@ -1163,7 +1162,7 @@ int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
     return X86EMUL_OKAY;
 }
 
-uint64_t  vlapic_tdt_msr_get(struct vlapic *vlapic)
+uint64_t vlapic_tdt_msr_get(struct vlapic *vlapic)
 {
     if ( !vlapic_lvtt_tdt(vlapic) )
         return 0;
@@ -1184,7 +1183,7 @@ void vlapic_tdt_msr_set(struct vlapic *vlapic, uint64_t value)
         HVM_DBG_LOG(DBG_LEVEL_VLAPIC_TIMER, "ignore tsc deadline msr write");
         return;
     }
-    
+
     /* new_value = 0, >0 && <= now, > now */
     guest_tsc = hvm_get_guest_tsc(v);
     if ( value > guest_tsc )
@@ -1539,8 +1538,8 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
         return -EINVAL;
     }
     s = vcpu_vlapic(v);
-    
-    if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 ) 
+
+    if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 )
         return -EINVAL;
 
     s->loaded.hw = 1;
@@ -1573,8 +1572,8 @@ static int cf_check lapic_load_regs(struct domain *d, hvm_domain_context_t *h)
         return -EINVAL;
     }
     s = vcpu_vlapic(v);
-    
-    if ( hvm_load_entry(LAPIC_REGS, h, s->regs) != 0 ) 
+
+    if ( hvm_load_entry(LAPIC_REGS, h, s->regs) != 0 )
         return -EINVAL;
 
     s->loaded.id = vlapic_get_reg(s, APIC_ID);

base-commit: 10081c2dc571775b538bb00982606a39832ad7e3
-- 
2.30.2


