Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 955AFA6B16F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 00:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923238.1326849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvOxJ-000238-UI; Thu, 20 Mar 2025 23:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923238.1326849; Thu, 20 Mar 2025 23:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvOxJ-00020j-Re; Thu, 20 Mar 2025 23:05:41 +0000
Received: by outflank-mailman (input) for mailman id 923238;
 Thu, 20 Mar 2025 23:05:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AcMq=WH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tvOxG-00020d-RO
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 23:05:39 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d52c2b59-05df-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 00:05:36 +0100 (CET)
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
X-Inumbo-ID: d52c2b59-05df-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742511934; x=1742771134;
	bh=piURTHdYEjsZmKUI1bxaHk3j94VW4TYJsXGfUuvwE5c=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=hmO8lKOjg3WcgWAfJLojPauu6yQ0w+68NgePUOOKoTkd0ujSqOK8/USmGKRg7DbvA
	 EPl/WZyujYG6HlaPYg80MoUO46lOtIO7lI73uevCAIA4J8zRnSUxgn298EJmBXEu+U
	 P7PWyBUi4YkqnjiDdq4tOehjjP8DMoyvyHf7gjrkvAPxl0H2pcDTcp/RNezgc1nTzF
	 BQzBCrfGXsaP1Z2uKE5Qdtjc4aHQf4Q4sA+JTSfcfM0nq3Ss3FkcMCcwMi9vebulON
	 DDz/ID9ivu1LQejnPIsJNe8b7ROQTCzGLfKCLWnfKY8B7wQPF140zCQitTpUMgvRvX
	 Mw3l8UZrMGtjA==
Date: Thu, 20 Mar 2025 23:05:29 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2] x86/irq: introduce APIC_VECTOR_VALID()
Message-ID: <20250320230339.3897874-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3f5e60507213429bded9eba9c675cdc652f398fd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add new macro APIC_VECTOR_VALID() to validate the interrupt vector
range as per [1]. This macro replaces hardcoded checks against the
open-coded value 16 in LAPIC and virtual LAPIC code and simplifies
the code a bit.

[1] Intel SDM volume 3A
    Chapter "ADVANCED PROGRAMMABLE INTERRUPT CONTROLLER"
    Section "Valid Interrupt Vectors"

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes v1->v2:
- update APIC_VECTOR_VALID to a macro w/ parameter
- CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1727330=
658
- Link to v1: https://lore.kernel.org/xen-devel/20250315010033.2917197-4-dm=
ukhin@ford.com/
---
 xen/arch/x86/cpu/mcheck/mce_intel.c |  3 +--
 xen/arch/x86/hvm/vlapic.c           | 10 +++++-----
 xen/arch/x86/include/asm/apicdef.h  |  1 +
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/=
mce_intel.c
index 07b50f8793..1e52b1ac25 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -135,8 +135,7 @@ static void intel_init_thermal(struct cpuinfo_x86 *c)
      * BIOS has programmed on AP based on BSP's info we saved (since BIOS
      * is required to set the same value for all threads/cores).
      */
-    if ( (val & APIC_DM_MASK) !=3D APIC_DM_FIXED
-         || (val & APIC_VECTOR_MASK) > 0xf )
+    if ( (val & APIC_DM_MASK) !=3D APIC_DM_FIXED || APIC_VECTOR_VALID(val)=
 )
         apic_write(APIC_LVTTHMR, val);
=20
     if ( (msr_content & (1ULL<<3))
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 065b2aab5b..993e972cd7 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -123,7 +123,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigne=
d int err_bit)
              * will end up back here.  Break the cycle by only injecting L=
VTERR
              * if it will succeed, and folding in RECVILL otherwise.
              */
-            if ( (lvterr & APIC_VECTOR_MASK) >=3D 16 )
+            if ( APIC_VECTOR_VALID(lvterr) )
                 inj =3D true;
             else
                 set_bit(ilog2(APIC_ESR_RECVILL), &vlapic->hw.pending_esr);
@@ -136,7 +136,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigne=
d int err_bit)
=20
 bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec)
 {
-    if ( unlikely(vec < 16) )
+    if ( unlikely(!APIC_VECTOR_VALID(vec)) )
         return false;
=20
     if ( hvm_funcs.test_pir &&
@@ -150,7 +150,7 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec,=
 uint8_t trig)
 {
     struct vcpu *target =3D vlapic_vcpu(vlapic);
=20
-    if ( unlikely(vec < 16) )
+    if ( unlikely(!APIC_VECTOR_VALID(vec)) )
     {
         vlapic_error(vlapic, ilog2(APIC_ESR_RECVILL));
         return;
@@ -523,7 +523,7 @@ void vlapic_ipi(
         struct vlapic *target =3D vlapic_lowest_prio(
             vlapic_domain(vlapic), vlapic, short_hand, dest, dest_mode);
=20
-        if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
+        if ( unlikely(!APIC_VECTOR_VALID(icr_low)) )
             vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
         else if ( target )
             vlapic_accept_irq(vlapic_vcpu(target), icr_low);
@@ -531,7 +531,7 @@ void vlapic_ipi(
     }
=20
     case APIC_DM_FIXED:
-        if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
+        if ( unlikely(!APIC_VECTOR_VALID(icr_low)) )
         {
             vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
             break;
diff --git a/xen/arch/x86/include/asm/apicdef.h b/xen/arch/x86/include/asm/=
apicdef.h
index 49e29ec801..7b431190d2 100644
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -78,6 +78,7 @@
 #define=09=09=09APIC_DM_STARTUP=09=090x00600
 #define=09=09=09APIC_DM_EXTINT=09=090x00700
 #define=09=09=09APIC_VECTOR_MASK=090x000FF
+#define=09=09=09APIC_VECTOR_VALID(x)=09(((x) & APIC_VECTOR_MASK) >=3D 16)
 #define=09=09APIC_ICR2=090x310
 #define=09=09=09GET_xAPIC_DEST_FIELD(x)=09(((x)>>24)&0xFF)
 #define=09=09=09SET_xAPIC_DEST_FIELD(x)=09((x)<<24)
--=20
2.34.1



