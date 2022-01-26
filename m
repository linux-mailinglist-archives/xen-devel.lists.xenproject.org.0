Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1E249C579
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 09:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260719.450712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdva-0001KQ-3c; Wed, 26 Jan 2022 08:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260719.450712; Wed, 26 Jan 2022 08:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvZ-0001FX-FM; Wed, 26 Jan 2022 08:45:17 +0000
Received: by outflank-mailman (input) for mailman id 260719;
 Wed, 26 Jan 2022 08:45:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCdvX-000083-LS
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 08:45:15 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4793df3c-7e84-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 09:45:14 +0100 (CET)
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
X-Inumbo-ID: 4793df3c-7e84-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643186714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mV0HeKfoO9tEMKhFzjK9mLw8ycBButJpD0PG5JqLcwM=;
  b=JxVQKqdINFOTxZVGtZy6SZo/NGNA2FnFRlDecaeWQvqesHV0jo1doqyN
   6H27sHwYYRmnZwQ5Wnj12lpluNMk9zNCvtYUYkmHhlTXknmNsyK4mlzVe
   b+bj7X++Cvtbho83FC2iUhXYsjPlwA8H8h47GjsEqo0d9vtD3YO28dgkL
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hPEdzxZuLss6wS3U+qFeal6kZD2NB7vYsDKENu3ArHHVQuy9tF8xjC5V0BLzFevDYOdu3vxLcr
 aQ6Zfhwc9eWUnJiWiNINbvT5P9BeUR2wyqtwUvi7g6CfnMB5Wqc1r+00uKYs9EamgQ4Qy2WWl7
 WbAn4/Lv6bZA/sB3ZdgobSLvZ3Fxhm/PWGyhs9UNS3z2Fs8Ol01Lt3XtMFIjPcPK+UXfpJfQ/f
 LDMllh05tfjphgmg5kS6Chjnx0MGuYyBXNhy5uUIAycn8pvebNN6zIdWWSiUeASPuRqe4CIgg6
 83vuWs65/olIx6gMtIWnmS0h
X-SBRS: 5.2
X-MesageID: 63189686
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iIJ55KlgKV4jyS11amgpeJjo5gxVIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeWDyBPPaIYjTyKt9zPo3n90lTu8XSzN5rHlFtqCBjFyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Q22YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 JZNu5CVUwgFBPXdtc80DQBEUCpGELITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ62HN
 5tHOWQHgBLoOhh9PloSBa4FpdzznVrVbAFTr0Ckuv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfITE+M2zRuC5pCM8iuyLzYdUn1KUPE54ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D5gbQ4xawZRGp8crVnl
 CJV8yR5xLtWZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBwwaZtaJWO0M
 BC7VeZtCHl7ZirCgUhfONrZNijX5fK4SYSNug78M7KinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOG8yT50n5gNK2OS7EIZ9YYQDmRr1os8u5TPD9r
 ow32z2ikUsPCYUTo0D/rOYuELz9BSFrXM+t850OKLfrz8gPMDhJNsI9CIgJI+RN95m5XM+Rl
 p1kckMHmlf5m1PdLgCGNiJqZL/1BM4tpnMnJy08e12v3iF7M4qo6a4ecboxfKUmq7M/naIlE
 aFddpXSGOlLRxTG5y8ZMcv3ort9eUn5ngmJJSekPmQyJsYyWwzT99b4VQLz7y1SXDGvvM4zr
 uT4hAPWSJYOXSp4C8PSZK79xl+9pyFFyulzQ1HJMp9Yf0C1qNpmLCn4j/kWJcAQKEqcmmvGh
 ljOWRpB/LvDuY449tXNlJuolYbxHrssBFdeEkna8a2yaXvQ8F28zNISS+2PZz3cCj/5of3we
 eVPwvjgG/Qbh1IW4ZFkGrNmwK9itdvio7hWklZtEHnRNgn5D7phJj+N3NVVt70Lzbhc4FPkV
 kWK89hcGLOIJMK6TwJBeFt7NryOhaMOhz3fzfUpO0GrtiZ48Y2OXVhWIxTR2jdWK6F4Md99z
 Oos0CLMB9dTVvb+3g66sx1p
IronPort-HdrOrdr: A9a23:VFJxGqo0sUq9kHBO0ww0CBEaV5oReYIsimQD101hICG8cqSj9v
 xG+85rrSMc6QxhIU3I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdmSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.88,317,1635220800"; 
   d="scan'208";a="63189686"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 6/8] x86/spec-ctrl: Use common MSR_SPEC_CTRL logic for AMD
Date: Wed, 26 Jan 2022 08:44:50 +0000
Message-ID: <20220126084452.28975-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220126084452.28975-1-andrew.cooper3@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Currently, amd_init_ssbd() works by being the only write to MSR_SPEC_CTRL in
the system.  This ceases to be true when using the common logic.

Include AMD MSR_SPEC_CTRL in has_spec_ctrl to activate the common paths, and
introduce an AMD specific block to control alternatives.

For now, only configure alternatives for HVM.  PV will require more work.

This is a reasonably large change for low level defaults in the common case,
but should have no practical change in behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/amd.c   |  2 +-
 xen/arch/x86/spec_ctrl.c | 26 ++++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index f87484b7ce61..a8e37dbb1f5c 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -693,7 +693,7 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 		return;
 
 	if (cpu_has_amd_ssbd) {
-		wrmsrl(MSR_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
+		/* Handled by common MSR_SPEC_CTRL logic */
 		return;
 	}
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 2072daf66245..5d08ee866869 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -22,6 +22,7 @@
 #include <xen/param.h>
 #include <xen/warning.h>
 
+#include <asm/hvm/svm/svm.h>
 #include <asm/microcode.h>
 #include <asm/msr.h>
 #include <asm/pv/domain.h>
@@ -936,7 +937,8 @@ void __init init_speculation_mitigations(void)
 
     hw_smt_enabled = check_smt_enabled();
 
-    has_spec_ctrl = boot_cpu_has(X86_FEATURE_IBRSB);
+    has_spec_ctrl = (boot_cpu_has(X86_FEATURE_IBRSB) ||
+                     boot_cpu_has(X86_FEATURE_IBRS));
 
     /*
      * First, disable the use of retpolines if Xen is using shadow stacks, as
@@ -1031,12 +1033,32 @@ void __init init_speculation_mitigations(void)
         }
     }
 
+    /* AMD hardware: MSR_SPEC_CTRL alternatives setup. */
+    if ( boot_cpu_has(X86_FEATURE_IBRS) )
+    {
+        /*
+         * Virtualising MSR_SPEC_CTRL for guests depends on SVM support, which
+         * on real hardware matches the availability of MSR_SPEC_CTRL in the
+         * first place.
+         *
+         * No need for SCF_ist_wrmsr because, because Xen's value is restored
+         * atomically WRT NMIs in the VMExit path.
+         *
+         * TODO Adjust cpu_has_svm_spec_ctrl to be configured earlier on boot
+         */
+        if ( opt_msr_sc_hvm &&
+             (boot_cpu_data.extended_cpuid_level >= 0x8000000a) &&
+             (cpuid_edx(0x8000000a) & (1u << SVM_FEATURE_SPEC_CTRL)) )
+            setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
+    }
+
     /* If we have IBRS available, see whether we should use it. */
     if ( has_spec_ctrl && ibrs )
         default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
 
     /* If we have SSBD available, see whether we should use it. */
-    if ( boot_cpu_has(X86_FEATURE_SSBD) && opt_ssbd )
+    if ( opt_ssbd && (boot_cpu_has(X86_FEATURE_SSBD) ||
+                      boot_cpu_has(X86_FEATURE_AMD_SSBD)) )
         default_xen_spec_ctrl |= SPEC_CTRL_SSBD;
 
     /*
-- 
2.11.0


