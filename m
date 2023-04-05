Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59916D89D3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 23:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518660.805427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkB3n-0005G5-RT; Wed, 05 Apr 2023 21:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518660.805427; Wed, 05 Apr 2023 21:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkB3n-0005DF-Ob; Wed, 05 Apr 2023 21:52:55 +0000
Received: by outflank-mailman (input) for mailman id 518660;
 Wed, 05 Apr 2023 21:52:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gV66=74=citrix.com=prvs=45279ec78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkB3m-0005D9-5k
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 21:52:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35bc4799-d3fc-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 23:52:52 +0200 (CEST)
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
X-Inumbo-ID: 35bc4799-d3fc-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680731572;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YG+tqcOrXnWWW86uHDi9/SgPfWk33wf/QiRsN0bkKP4=;
  b=GvdV6e6Oun+xMb2swa0tfxNE7IRA52enQkyBq9vZdLMkZQo0O/wMXCaI
   1efchE+wz3LUtVY1DigPynNgQH64LAvWwveB4cDkfhrS3/Bojzz99+SOv
   MaIKvyf1gjC2voZC8aXpYOqG+LA6Ekdy1onC+wWixu1wQu2FCNdE9Jlm2
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104889208
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:xuGNDKLYiAZ3uZYMFE+R85UlxSXFcZb7ZxGr2PjKsXjdYENS1TNSx
 jEaDGiCOf/camuge9pwPtjj9k0EupbRm95lSVBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA4gRjPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5MEUBQ0
 9AHeAwodz2pjt2b6/WBTe5j05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHZkFzhfC/
 jKuE2LRPEoQE8zG4zS+yH+xncyImyarG75DLejtnhJtqALKnTFCYPEMbnOkpdGph0j4XMhQQ
 2QW5yxoq6Ex/U6qS9DVXhukrXrCtRkZM/JTHvM77keRy6PSywefGmUACDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcgTyIZSQoO4/H4vZo+yBnIS75e/LWd14OvX2uqm
 nbT8XZ43u9I5SIW60ml1WvXoiyKioeZcissyy/eYU+OqTl+Y4HwMuRE9mPnAeZ8wJexFwfR5
 CdexpLDt4jiHrnWynXTHbxl8KWBoq/cbWaC2QMH84wJrWzFxpK1QWxHDNiSzm9NO91MRzLma
 VS7Veh5tM4KZyvCgUOajuuM5yUWIUvIT46Nugj8NIYmX3SIXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UyZCVv02kmvpGr5BuVPO+szZ7TqKLa0XMjz9iebODJJrYext3KSyghARs/rf/VS9H
 yd3PMqW0RRPONDDjt3s2ddLdzgidCFrba0aXuQLLoZv1CI6QjB+YxIQqJt9E7FYc1N9x7eXr
 y3hBxcBoLc97FWeQTi3hrlYQOuHdf5CQbgTZETA4X7AN6AfXLuS
IronPort-HdrOrdr: A9a23:PJwOfqlkYwYdFWNDTD6Mz+s5kl/pDfIo3DAbv31ZSRFFG/Fw9v
 re5cjzsCWetN9/YgBCpTntAse9qBDnhPtICOsqTNWftWDd0QPDQO5fBOPZslnd8kbFltK1u5
 0AT0DSY+ecMbD85vyKhjVRx70bsb66zJw=
X-IronPort-AV: E=Sophos;i="5.98,322,1673931600"; 
   d="scan'208";a="104889208"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before re-entering guest"
Date: Wed, 5 Apr 2023 22:52:45 +0100
Message-ID: <20230405215245.2137356-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

At the time of XSA-170, the x86 instruction emulator was genuinely broken.  It
would load arbitrary values into %rip and putting a check here probably was
the best stopgap security fix.  It should have been reverted following c/s
81d3a0b26c1 "x86emul: limit-check branch targets" which corrected the emulator
behaviour.

However, everyone involved in XSA-170, myself included, failed to read the SDM
correctly.  On the subject of %rip consistency checks, the SDM stated:

  If the processor supports N < 64 linear-address bits, bits 63:N must be
  identical

A non-canonical %rip (and SSP more recently) is an explicitly legal state in
x86, and the VMEntry consistency checks are intentionally off-by-one from a
regular canonical check.

The consequence of this bug is that Xen will currently take a legal x86 state
which would successfully VMEnter, and corrupt it into having non-architectural
behaviour.

Furthermore, in the time this bugfix has been pending in public, I
successfully persuaded Intel to clarify the SDM, adding the following
clarification:

  The guest RIP value is not required to be canonical; the value of bit N-1
  may differ from that of bit N.

Fixes: ffbbfda377 ("x86/VMX: sanitize rIP before re-entering guest")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

Rewrite the commit message, but no change to the fix.

Fun fact... LAM almost required this to be reverted in order to support, but
the penultimate draft of the spec backed down and made LAM only apply to data
accesses, not instruction fetches.
---
 xen/arch/x86/hvm/vmx/vmx.c | 34 +---------------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index bfc9693f7e43..79ff59b11c6b 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4035,7 +4035,7 @@ static void undo_nmis_unblocked_by_iret(void)
 void vmx_vmexit_handler(struct cpu_user_regs *regs)
 {
     unsigned long exit_qualification, exit_reason, idtv_info, intr_info = 0;
-    unsigned int vector = 0, mode;
+    unsigned int vector = 0;
     struct vcpu *v = current;
     struct domain *currd = v->domain;
 
@@ -4730,38 +4730,6 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
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
-                hvm_inject_hw_exception(X86_EXC_GP, 0);
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
2.30.2


