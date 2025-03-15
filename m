Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E80A62392
	for <lists+xen-devel@lfdr.de>; Sat, 15 Mar 2025 02:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915597.1321102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFtg-0007Qe-5w; Sat, 15 Mar 2025 01:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915597.1321102; Sat, 15 Mar 2025 01:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFtg-0007LQ-27; Sat, 15 Mar 2025 01:01:04 +0000
Received: by outflank-mailman (input) for mailman id 915597;
 Sat, 15 Mar 2025 01:01:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ms5H=WC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ttFte-0000Y2-Qy
 for xen-devel@lists.xenproject.org; Sat, 15 Mar 2025 01:01:02 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f655ccaf-0138-11f0-9899-31a8f345e629;
 Sat, 15 Mar 2025 02:01:01 +0100 (CET)
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
X-Inumbo-ID: f655ccaf-0138-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742000459; x=1742259659;
	bh=DRer+9clbTpnjbxvNyAPigTWFkAdFBrXKLnJAbMCgYA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=R+D6o6LpjFh9sxnmTqAEL+HYMKXwWdhf90LvqyLTx4JTEqC+ges309ZStORW/CU6b
	 TkSHZcLUsdt2Q2JN8gEBuwqE/POhU5tI7im9rVpXzuIUyjsOTftOCG+sJmGpnhFpgf
	 P2oD9AzHlTPo00IDSwn7rY5i1wJl9RRI6iAzdZ+6xMxNCnKAa6Jzi5Aee1ajjA9KMZ
	 w7BGrOMUpjGKMAiEbPbEXyorNQWs2hAPHfv08UKonq6dvfr/AE7QJwbUDM11tH+qnW
	 fppaQHnSIEGj8HHgpC9+zBcbgwXbjg+ZJ8mQS1DqSx0orU0kjhTxuRB4sYOfsv4HIF
	 nc6eNJg1iXxHA==
Date: Sat, 15 Mar 2025 01:00:56 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH 3/3] x86/irq: introduce APIC_VECTOR_VALID
Message-ID: <20250315010033.2917197-4-dmukhin@ford.com>
In-Reply-To: <20250315010033.2917197-1-dmukhin@ford.com>
References: <20250315010033.2917197-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3906a16afa138c91d372b37b17afbb6d60d33471
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add new symbol APIC_VECTOR_VALID to replace open-coded value 16 in
LAPIC and virtual LAPIC code.

See:
  Intel SDM volume 3A
  Chapter "ADVANCED PROGRAMMABLE INTERRUPT CONTROLLER"
  Section "Valid Interrupt Vectors"

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/cpu/mcheck/mce_intel.c |  2 +-
 xen/arch/x86/hvm/vlapic.c           | 10 +++++-----
 xen/arch/x86/include/asm/apicdef.h  |  1 +
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/=
mce_intel.c
index 07b50f8793..e8c252e03a 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -136,7 +136,7 @@ static void intel_init_thermal(struct cpuinfo_x86 *c)
      * is required to set the same value for all threads/cores).
      */
     if ( (val & APIC_DM_MASK) !=3D APIC_DM_FIXED
-         || (val & APIC_VECTOR_MASK) > 0xf )
+         || (val & APIC_VECTOR_MASK) > APIC_VECTOR_VALID )
         apic_write(APIC_LVTTHMR, val);
=20
     if ( (msr_content & (1ULL<<3))
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 065b2aab5b..a0f46e540c 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -123,7 +123,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigne=
d int err_bit)
              * will end up back here.  Break the cycle by only injecting L=
VTERR
              * if it will succeed, and folding in RECVILL otherwise.
              */
-            if ( (lvterr & APIC_VECTOR_MASK) >=3D 16 )
+            if ( (lvterr & APIC_VECTOR_MASK) >=3D APIC_VECTOR_VALID )
                 inj =3D true;
             else
                 set_bit(ilog2(APIC_ESR_RECVILL), &vlapic->hw.pending_esr);
@@ -136,7 +136,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigne=
d int err_bit)
=20
 bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec)
 {
-    if ( unlikely(vec < 16) )
+    if ( unlikely(vec < APIC_VECTOR_VALID) )
         return false;
=20
     if ( hvm_funcs.test_pir &&
@@ -150,7 +150,7 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec,=
 uint8_t trig)
 {
     struct vcpu *target =3D vlapic_vcpu(vlapic);
=20
-    if ( unlikely(vec < 16) )
+    if ( unlikely(vec < APIC_VECTOR_VALID) )
     {
         vlapic_error(vlapic, ilog2(APIC_ESR_RECVILL));
         return;
@@ -523,7 +523,7 @@ void vlapic_ipi(
         struct vlapic *target =3D vlapic_lowest_prio(
             vlapic_domain(vlapic), vlapic, short_hand, dest, dest_mode);
=20
-        if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
+        if ( unlikely((icr_low & APIC_VECTOR_MASK) < APIC_VECTOR_VALID) )
             vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
         else if ( target )
             vlapic_accept_irq(vlapic_vcpu(target), icr_low);
@@ -531,7 +531,7 @@ void vlapic_ipi(
     }
=20
     case APIC_DM_FIXED:
-        if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
+        if ( unlikely((icr_low & APIC_VECTOR_MASK) < APIC_VECTOR_VALID) )
         {
             vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
             break;
diff --git a/xen/arch/x86/include/asm/apicdef.h b/xen/arch/x86/include/asm/=
apicdef.h
index 49e29ec801..7750583481 100644
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -78,6 +78,7 @@
 #define=09=09=09APIC_DM_STARTUP=09=090x00600
 #define=09=09=09APIC_DM_EXTINT=09=090x00700
 #define=09=09=09APIC_VECTOR_MASK=090x000FF
+#define=09=09=09APIC_VECTOR_VALID=09(16)
 #define=09=09APIC_ICR2=090x310
 #define=09=09=09GET_xAPIC_DEST_FIELD(x)=09(((x)>>24)&0xFF)
 #define=09=09=09SET_xAPIC_DEST_FIELD(x)=09((x)<<24)
--=20
2.34.1



