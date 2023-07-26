Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 284E276327C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 11:39:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570253.891932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOazV-0006wH-Bs; Wed, 26 Jul 2023 09:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570253.891932; Wed, 26 Jul 2023 09:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOazV-0006uU-94; Wed, 26 Jul 2023 09:39:33 +0000
Received: by outflank-mailman (input) for mailman id 570253;
 Wed, 26 Jul 2023 09:39:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cZQN=DM=citrix.com=prvs=564d97ffe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qOazT-0006uO-UC
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 09:39:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fe8d212-2b98-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 11:39:29 +0200 (CEST)
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
X-Inumbo-ID: 4fe8d212-2b98-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690364369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=afQNycwQ8SL8jHDWJIWPGZ08pAZH9RO4t59kJB4zMWo=;
  b=ZLkT0vZqK722PdeoR5pQzsjaDEr/qZx69UShUX8bwsaBby7O7JCHAWr2
   mfYNHWsJ9moQnkUvP4Nv6X0dHIxXTuthdvi+ovlHMaqOvAxpaLM84FaOO
   t8lfuK38Mwv1sBh8K6NZqMN+JlZde25HqcETjyJr+8gGLKfuaBLBSRFlo
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117916674
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:MhnJoaqyXUPu7XnRYhhRBfcyG6xeBmIYZRIvgKrLsJaIsI4StFCzt
 garIBmEOPrbZzTwL4siYI2/8R8Hv5PSzoAwGwBtpH1hHi9DoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzSRNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABQETEmCmfCb+6rhWOdFo/8vFPGsOrpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jufoDWgXE9FaLRzzxK6/UD1tOLLuhncUa9DH62V989Fr3a6kzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6guA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMh6vu6oZ8hoynXFMRtOYuOguXNXjfJl
 mXiQDcFu1kDsSIa//zlrAic2233+Mmhoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoKiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPaxTY+9B6CEN4EfM/CdkTNrGgk0PiZ8OEi0zSARfVwXY
 8/HIa5A815EYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PRaopUM+GALWNIgRtfrUyDg5B
 v4Db6NmPT0DCryhCsQWmKZPRW03wY8TXM2r9p0NKbPfemKL2ggJUpfs/F/oQKQ994w9qwsC1
 ijVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:boX9RK0pE7CyRpYUCRcFOAqjBIgkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7Scq9qALnlKKdiLN5Vd3OYOCBghrLEGgI1+vfKlPbakrD398Y+a
 B8c7VvTP3cZGIK6/oSOTPIdurIFuP3lJyVuQ==
X-Talos-CUID: 9a23:KxIFCm2c5XPKsNAsc3qwCrxfPskHK3zD3lrrOxWqB09Mc7GtcRiWwfYx
X-Talos-MUID: 9a23:b8Q71QsBqxQS2+naDM2nuz5QbfVl54OUL0kgwJ4Wlsi1GgNbEmLI
X-IronPort-AV: E=Sophos;i="6.01,231,1684814400"; 
   d="scan'208";a="117916674"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2] x86/cpu-policy: Advertise MSR_ARCH_CAPS to guests by default
Date: Wed, 26 Jul 2023 10:39:18 +0100
Message-ID: <20230726093918.2418025-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <4025d346-848b-730e-38a3-de7763edcf39@suse.com>
References: <4025d346-848b-730e-38a3-de7763edcf39@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With xl/libxl now able to control the policy bits for MSR_ARCH_CAPS, it is
safe to advertise to guests by default.  In turn, we don't need the special
case to expose details to dom0.

This advertises MSR_ARCH_CAPS to guests on *all* Intel hardware, even if the
register content ends up being empty.

  - Advertising ARCH_CAPS and not RSBA signals "retpoline is safe here and
    everywhere you might migrate to".  This is important because it avoids the
    guest kernel needing to rely on model checks.

  - Alternatively, levelling for safety across the Broadwell/Skylake divide
    requires advertising ARCH_CAPS and RSBA, meaning "retpoline not safe on
    some hardware you might migrate to".

On Cascade Lake and later hardware, guests can now see RDCL_NO (not vulnerable
to Meltdown) amongst others.  This causes substantial performance
improvements, as guests are no longer applying software mitigations in cases
where they don't need to.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Not to go in before Roger's libxl changes...

v2:
 * Extend the commit message.
---
 xen/arch/x86/cpu-policy.c                   | 11 -----------
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index f40eeb8be8dc..1f954d4e5940 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -888,17 +888,6 @@ void __init init_dom0_cpuid_policy(struct domain *d)
     if ( cpu_has_itsc )
         p->extd.itsc = true;
 
-    /*
-     * Expose the "hardware speculation behaviour" bits of ARCH_CAPS to dom0,
-     * so dom0 can turn off workarounds as appropriate.  Temporary, until the
-     * domain policy logic gains a better understanding of MSRs.
-     */
-    if ( is_hardware_domain(d) && cpu_has_arch_caps )
-    {
-        p->feat.arch_caps = true;
-        p->arch_caps.raw = host_cpu_policy.arch_caps.raw;
-    }
-
     /* Apply dom0-cpuid= command line settings, if provided. */
     if ( dom0_cpuid_cmdline )
     {
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index ce7407d6a10c..6d20810cb9d1 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -271,7 +271,7 @@ XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
-XEN_CPUFEATURE(ARCH_CAPS,     9*32+29) /*!a IA32_ARCH_CAPABILITIES MSR */
+XEN_CPUFEATURE(ARCH_CAPS,     9*32+29) /*!A IA32_ARCH_CAPABILITIES MSR */
 XEN_CPUFEATURE(CORE_CAPS,     9*32+30) /*   IA32_CORE_CAPABILITIES MSR */
 XEN_CPUFEATURE(SSBD,          9*32+31) /*A  MSR_SPEC_CTRL.SSBD available */
 
-- 
2.30.2


