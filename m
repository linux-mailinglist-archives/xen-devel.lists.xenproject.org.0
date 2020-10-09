Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783D6288C47
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 17:10:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4794.12632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQu2E-0005uX-OI; Fri, 09 Oct 2020 15:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4794.12632; Fri, 09 Oct 2020 15:10:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQu2E-0005u8-L9; Fri, 09 Oct 2020 15:10:18 +0000
Received: by outflank-mailman (input) for mailman id 4794;
 Fri, 09 Oct 2020 15:10:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4y9=DQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kQu2D-0005u3-5t
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 15:10:17 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c9d7ca4-6f8f-4c2d-bb72-efee0b57943b;
 Fri, 09 Oct 2020 15:10:15 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=n4y9=DQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kQu2D-0005u3-5t
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 15:10:17 +0000
X-Inumbo-ID: 5c9d7ca4-6f8f-4c2d-bb72-efee0b57943b
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5c9d7ca4-6f8f-4c2d-bb72-efee0b57943b;
	Fri, 09 Oct 2020 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602256215;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DYoNpDoMG9Fehrv+VZjGLyy/ZiJAyI6bFkIjoSqxHU8=;
  b=e2ZA8UkIbk3StvyGcbkwfNubHPFKqp7kOs5GHb9Y8nvs5q6h1PyDeLWH
   pMSE7D10QS8joA6pzdOT+AsnuWKkGvXWVpCfbLOZPE5QqTMBygXOIuAtG
   9RGveAF1Kfp2lKRwPltB+KbZ2k+tfLEKtGHTEZDuuhP6B9XY2N+KWZUTu
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QfPRStXtVq8jrgtGSQL124vYwOqRWy0phUOvS/zrGho0mRiJQBuHrHoU0GHnr8MXKwZdIihKVX
 VT4GwbOXKUdKgcKFjtRHJ8lwKzttw2ejfv2MOuhkz4Yunyv+ai9pkiihHhIe9mAIQ+PFwkFMQj
 224i+2lFYUO5KdnnJfVx+GS0a9A6WMg5nh0Y5//nNTh+MvcBJDaJhH1SkYSIMpX9R6D9RHNpSz
 7L7ChDlQ2BIS3wqM9YkCaFL+y7DZG2jCKyrWNV8mmvrtlcCHh6rGwem+kjb/cbCRtsn2223q0c
 Nvk=
X-SBRS: 2.5
X-MesageID: 28656374
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,355,1596513600"; 
   d="scan'208";a="28656374"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before re-entering guest"
Date: Fri, 9 Oct 2020 16:09:48 +0100
Message-ID: <20201009150948.31063-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

At the time of XSA-170, the x86 instruction emulator really was broken, and
would allow arbitrary non-canonical values to be loaded into %rip.  This was
fixed after the embargo by c/s 81d3a0b26c1 "x86emul: limit-check branch
targets".

However, in a demonstration that off-by-one errors really are one of the
hardest programming issues we face, everyone involved with XSA-170, myself
included, mistook the statement in the SDM which says:

  If the processor supports N < 64 linear-address bits, bits 63:N must be identical

to mean "must be canonical".  A real canonical check is bits 63:N-1.

VMEntries really do tolerate a not-quite-canonical %rip, specifically to cater
to the boundary condition at 0x0000800000000000.

Now that the emulator has been fixed, revert the XSA-170 change to fix
architectural behaviour at the boundary case.  The XTF test case for XSA-170
exercises this corner case, and still passes.

Fixes: ffbbfda377 ("x86/VMX: sanitize rIP before re-entering guest")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/vmx/vmx.c | 34 +---------------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 86b8916a5d..28d09c1ca0 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3650,7 +3650,7 @@ static int vmx_handle_apic_write(void)
 void vmx_vmexit_handler(struct cpu_user_regs *regs)
 {
     unsigned long exit_qualification, exit_reason, idtv_info, intr_info = 0;
-    unsigned int vector = 0, mode;
+    unsigned int vector = 0;
     struct vcpu *v = current;
     struct domain *currd = v->domain;
 
@@ -4280,38 +4280,6 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 out:
     if ( nestedhvm_vcpu_in_guestmode(v) )
         nvmx_idtv_handling();
-
-    /*
-     * VM entry will fail (causing the guest to get crashed) if rIP (and
-     * rFLAGS, but we don't have an issue there) doesn't meet certain
-     * criteria. As we must not allow less than fully privileged mode to have
-     * such an effect on the domain, we correct rIP in that case (accepting
-     * this not being architecturally correct behavior, as the injected #GP
-     * fault will then not see the correct [invalid] return address).
-     * And since we know the guest will crash, we crash it right away if it
-     * already is in most privileged mode.
-     */
-    mode = vmx_guest_x86_mode(v);
-    if ( mode == 8 ? !is_canonical_address(regs->rip)
-                   : regs->rip != regs->eip )
-    {
-        gprintk(XENLOG_WARNING, "Bad rIP %lx for mode %u\n", regs->rip, mode);
-
-        if ( vmx_get_cpl() )
-        {
-            __vmread(VM_ENTRY_INTR_INFO, &intr_info);
-            if ( !(intr_info & INTR_INFO_VALID_MASK) )
-                hvm_inject_hw_exception(TRAP_gp_fault, 0);
-            /* Need to fix rIP nevertheless. */
-            if ( mode == 8 )
-                regs->rip = (long)(regs->rip << (64 - VADDR_BITS)) >>
-                            (64 - VADDR_BITS);
-            else
-                regs->rip = regs->eip;
-        }
-        else
-            domain_crash(v->domain);
-    }
 }
 
 static void lbr_tsx_fixup(void)
-- 
2.11.0


