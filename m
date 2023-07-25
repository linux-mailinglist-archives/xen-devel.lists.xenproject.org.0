Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D478762491
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 23:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569947.891185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOPhg-0004jE-T1; Tue, 25 Jul 2023 21:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569947.891185; Tue, 25 Jul 2023 21:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOPhg-0004gY-OG; Tue, 25 Jul 2023 21:36:24 +0000
Received: by outflank-mailman (input) for mailman id 569947;
 Tue, 25 Jul 2023 21:36:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+x6f=DL=citrix.com=prvs=56398a583=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qOPhf-0004gS-Eq
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 21:36:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4938044b-2b33-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 23:36:18 +0200 (CEST)
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
X-Inumbo-ID: 4938044b-2b33-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690320978;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mvn9oerAoDJsBTRn8jerLe70SaYH10dbTzqeGfG1m3w=;
  b=QTa35A0HBdxMVWw59SE5vVnHZCXW5y6y8hQNc3hUY27DepkYB1el+iyR
   i9qCsCfHQg+oGRTfPPGQLsaF+8L4OSEnW2W7FMYkPpPwSUQH9UIveLPAZ
   GUM+mlitU0E/EZgCqjKLsPbOxCJolqInNtanMvOY4hHna3va2jNTyMExI
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117303372
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:YbBDka9O4ugowmfrtHe0DrUDgH6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GpLUGGPPK2CajShLdEkPo3j8EoPucDczoc3Hgtq/yo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqoW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklu2
 OYjKBddUirYjuu15fWBQMxnluM8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxxnD/
 jmdoD6R7hcyC+KF8BaGrWOXpuLTkD7XG8UiGI2n36s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqRQIedgsis+XZ+4g6jTeIdNxGG76SkYigcd3v+
 AxmvBTSlp1K059TjP3kpg6W696/jsOXF1Bov207Skrgt1okP9D9OuRE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFBz3oRZPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvWpxxlfmwRY2+B6G8gj9yjn5ZLlTvEMZGPBP44owQuBJ0zfFX1
 WmzL65A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI503P7FZqX1bMEe1tGALXPogEAFas/F29H
 yB3a5HblH2ykYTWPkHqzGLkBQlUdyJgX8Gu95E/myzqClMOJVzNwsT5mdsJE7GJVYwP/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:ypnDGaiA6u+VCSk/aIOx5WTmTnBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: 9a23:doksmGGryia3TPG2qmJH2VQvGud1TkeGxX7TBgiCA0NiWJqKHAo=
X-Talos-MUID: 9a23:gFb9+AYd7m64k+BTiAH2vR1ha9ZTw6myBV0h0tI2t/mbHHkl
X-IronPort-AV: E=Sophos;i="6.01,231,1684814400"; 
   d="scan'208";a="117303372"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/cpu-policy: Advertise MSR_ARCH_CAPS to guests by default
Date: Tue, 25 Jul 2023 22:36:11 +0100
Message-ID: <20230725213611.2405811-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With xl/libxl now able to control the policy bits for MSR_ARCH_CAPS, it is
safe to advertise to guests by default.  In turn, we don't need the special
case to expose details to dom0.

This advertises MSR_ARCH_CAPS to guests on *all* Intel hardware, even if the
register content ends up being empty.  This is necessary in order to safely
level two hosts which cross the Broadwell/Skylake divide.

On Cascade Lake and later hardware, guests can now see RDCL_NO (not vulnerable
to Meltdown) amongst others.  This causes substantial performance
improvements, as guests are no longer applying software mitigations in cases
where they don't need to.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Not to go in before Roger's libxl changes...
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


