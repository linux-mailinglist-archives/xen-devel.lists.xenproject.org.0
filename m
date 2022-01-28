Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B7749FAAA
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 14:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262002.454027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKF-00054S-5N; Fri, 28 Jan 2022 13:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262002.454027; Fri, 28 Jan 2022 13:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKE-0004w9-Sc; Fri, 28 Jan 2022 13:30:02 +0000
Received: by outflank-mailman (input) for mailman id 262002;
 Fri, 28 Jan 2022 13:30:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Vxm=SM=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nDRKD-0003aP-3m
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 13:30:01 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64259e89-803e-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 14:30:00 +0100 (CET)
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
X-Inumbo-ID: 64259e89-803e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643376600;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gHfpIZlajUaP6cGdkiuSguv/j1zSvd9zDfBvEzVBPh8=;
  b=VcTK6SFso4R6xTRh8ky2XPYt5O6mVf6Pqj/+J6U24yUPvtzgLdPDEHHZ
   ud70B4xxvXk6VEyKY+rqi1w9BJ/pl7lOdMTPp3pfQ+plFt85N9Psqy9KL
   JRTIQqAyJfQunMzj4dxFLFqXu8HRTWN/B5/xPNQQbSwGv+CXGJJ7iJHVn
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xFsr5l5z5y/D9EoB3ZQVgrJPfyV9kXFMZpXxUAhrWB7N5x7vh8FwwNpBa1LR4L88Nva269NoTD
 gRadX/pU4CRSM1iTbxfzQP2LE9mcAvdHsKT+pGGC5hRdzuncfdDJ9f9uXnS1BbHHMKA0hcvGEi
 r7T8RHAw3C6thv/y2wEhbtwKB4lPeaelCcN+pvqfR5XFtnpTJhkAPaX7AnLTdecl1Q5eGTNSjG
 crgeRLOqsBGzKFnwjv7QxzUh3pi7Idc4EvTQrYc24Jt87DJ/bI+roNhhknP9fhWJO3Lgt68TtK
 lvkODKRs07CBOEJgOS6aVOrt
X-SBRS: 5.2
X-MesageID: 62981611
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Y0ZiWanVl3PN+mBmO7h1XTPo5gxVIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZXWzTb/fcNDb1ftwna9/npElTvZOBy4cwQQNspX0xFSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Q42YTR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NdRm5qBVjszBbHzx98CCgUFThFHOaITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6yPN
 5NHMGMHgBLoXhpGKgpMDK8EwdiovSnDcQREi1KFnP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJSD8M82R6x0JHI3FmiGTEYE2NxUdgp4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HwgbQ4xawZRGp8crVnl
 CJZ8yR5xLtWZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBwzaZ5fJ2KxP
 R67VeZtCHl7ZiXCgUhfONrZNijX5fK4SYSNug78MLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOG8yT50n5gNK2OS7EIZ9YYQDmRr1os8u5TPD9r
 ow32z2ikUsPCYUTo0D/rOYuELz9BSFrXM+t850OKLfrz8gPMDhJNsI9CIgJI+RN95m5XM+Rl
 p1kckMHmlf5m1PdLgCGNiJqZL/1BM4tpnMnJy08e12v3iF7M4qo6a4ecboxfKUmq7M/naIlE
 aFddpXSGOlLRxTG5y8ZMcv3ort9eUn5ngmJJSekPmQyJsYyWwzT99b4VQLz7y1SXDGvvM4zr
 uT4hAPWSJYOXSp4C8PSZK79xl+9pyFFyulzQ1HJMp9Yf0C1qNpmLCn4j/kWJcAQKEqcmmvGh
 ljOWRpB/LvDuY449tXNlJuolYbxHrssBFdeEkna8a2yaXvQ8F28zNISS+2PZz3cCj/5of3we
 eVPwvjgG/Qbh1IW4ZFkGrNmwK9itdvio7hWklZtEHnRNgn5D7phJj+N3NVVt70Lzbhc4FPkV
 kWK89hcGLOIJMK6TwJBeFt7NryOhaMOhz3fzfUpO0GrtiZ48Y2OXVhWIxTR2jdWK6F4Md99z
 Oos0CLMB9dTVvb+3g66sx1p
IronPort-HdrOrdr: A9a23:sd3wVq77AfoDKrWokQPXwYWCI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhIk3I6urwRZVoIEmsv6KdhLN+AV7MZniBhILFFvAA0WKm+UyaJ8SczJ8R6U
 4DSdkGNDSYNzET5qyagDVQUexQuOVvm5rY4Ns2uk0dKj2CHJsQizuRZDzrcHFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29IOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6c030Woqqh9jJwPr3OtiEnEESvtu9uXvUlZ1S2hkF0nAho0idvrD
 CDmWZmAy050QKsQoj8m2qT5+Cn6kdj11bSjWaCh33tuMr4Qy9/JfZgqOtiA13kwntlhcp71q
 1T2WKfqt5wNjPv2ArAx/WgbWAyqqKTyUBSytL7S0YvCbc2eftfq5cS81hSF4pFFCXm6Jo/GO
 0rF83E4u1KGGnqJkwxk1Mft+BEZE5DaCtug3JyyfC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeYlbd1xCvefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEw6PuxcJIFwZMukN
 DKUU9et2Q1Z0XyYPf+lKFj41TIWiGwTD7twsZR69xwvaD9XqPiNWmZRFUng6Kb0oEi6w3gKo
 OO0b5tco7exFrVaPR0NlfFKudvwFElIb0ohuo=
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="62981611"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/9] x86/spec-ctrl: Drop use_spec_ctrl boolean
Date: Fri, 28 Jan 2022 13:29:20 +0000
Message-ID: <20220128132927.14997-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220128132927.14997-1-andrew.cooper3@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Several bugfixes have reduced the utility of this variable from it's original
purpose, and now all it does is aid in the setup of SCF_ist_wrmsr.

Simplify the logic by drop the variable, and doubling up the setting of
SCF_ist_wrmsr for the PV and HVM blocks, which will make the AMD SPEC_CTRL
support easier to follow.  Leave a comment explaining why SCF_ist_wrmsr is
still necessary for the VMExit case.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/spec_ctrl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index c18cc8aa493a..8a550d0a0902 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -927,7 +927,7 @@ static __init void mds_calculations(uint64_t caps)
 void __init init_speculation_mitigations(void)
 {
     enum ind_thunk thunk = THUNK_DEFAULT;
-    bool use_spec_ctrl = false, ibrs = false, hw_smt_enabled;
+    bool ibrs = false, hw_smt_enabled;
     bool cpu_has_bug_taa;
     uint64_t caps = 0;
 
@@ -1016,19 +1016,21 @@ void __init init_speculation_mitigations(void)
     {
         if ( opt_msr_sc_pv )
         {
-            use_spec_ctrl = true;
+            default_spec_ctrl_flags |= SCF_ist_wrmsr;
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_PV);
         }
 
         if ( opt_msr_sc_hvm )
         {
-            use_spec_ctrl = true;
+            /*
+             * While the guest MSR_SPEC_CTRL value is loaded/saved atomically,
+             * Xen's value is not restored atomically.  An early NMI hitting
+             * the VMExit path needs to restore Xen's value for safety.
+             */
+            default_spec_ctrl_flags |= SCF_ist_wrmsr;
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
         }
 
-        if ( use_spec_ctrl )
-            default_spec_ctrl_flags |= SCF_ist_wrmsr;
-
         if ( ibrs )
             default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
     }
-- 
2.11.0


