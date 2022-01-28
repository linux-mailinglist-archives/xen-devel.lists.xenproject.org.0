Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A658349FAA9
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 14:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262005.454059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKJ-00063f-DB; Fri, 28 Jan 2022 13:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262005.454059; Fri, 28 Jan 2022 13:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKI-0005n4-UW; Fri, 28 Jan 2022 13:30:06 +0000
Received: by outflank-mailman (input) for mailman id 262005;
 Fri, 28 Jan 2022 13:30:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Vxm=SM=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nDRKF-0003aQ-CC
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 13:30:03 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 643f205f-803e-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 14:30:02 +0100 (CET)
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
X-Inumbo-ID: 643f205f-803e-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643376602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t6iCnuYTls+XD79sW/8eHyY+U8ganRSf8XKq7YRN4Wo=;
  b=FqsGyB9YP+WYwF2z8majI4Xpg+t2hXyTp2syWNeXy4WE7aUhutheXYHh
   iO9a3ZWA+6t8QBcnlKNqRMON47EMKSRVU1bSvLGGtC7vYFJh2TocSntsX
   Kqi/J0xxKg7PnYB/OWrejtpPP4PJVf0CC0Kz44vXOYNmRIicaoCH1/EIQ
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eq9F1gEdjVwvXnb+IkQkrTTt4fihRtJPQJyTvKaw2O0zXGKkdoliOf6Dg60C3IyOs1oFHaXCTV
 wHxIJ6aH7RGdjpCMA1E02wm0lYqysFzgpgIzvGNQAHJ0tEa6o0EW+Y6tWmHN6GemLLdtHp4wuj
 QUf4suFzp+ezY4w9ZueSoAdleylcSh0k9OC2B3gUSHRyry5oVLi0Ljp33vZOdnxBXV5NUzBY6v
 0s92tMjpjDvYTjxEZmYkMylnNlvkMnwuqCr60xoh419jCDt24LEHs5fTClSMfJcNERT1f9Z1QG
 soqNN4sEa0Mwn3gwNIxwEQnZ
X-SBRS: 5.2
X-MesageID: 62981614
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NMqtr6BFMVRdwxVW//3kw5YqxClBgxIJ4kV8jS/XYbTApG8jhDQFz
 GoYCD/TPf6CYjP3fIgjbt7i8RtVvJfdztIxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En9400I7x4bVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/iSmnmeFu9
 M92qaPvchhwIvCRqN0ZXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGhmZg354XQZ4yY
 eIyVwZNcD7KbiFiI1UyNJkDmcTzo0XWJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiHyYkBgtROZKKPEFtzqSk7aJvjagAmdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodtvxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/JtoLuGogeR80Y67onAMFh
 meJ52u9A7cIZBOXgVJfOdrtW6zGM4C+fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ1mkgWmD2CLbimn0XP+efPPxa9FOZaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/qN5KcgtSfCFlXPgbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:KkiAhqiprt2+NGHydZt9iSxpNHBQX5d23DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwQpVoMkmsiKKdgLNhd4tKOTOJhILGFvAF0WKP+UyCJ8S6zJ8n6U
 4CSdkyNDSTNykCsS+S2mDReLxAoOVvsprY/ds2pE0dKD2CHpsQiDuRfTzrdnGeKjM2Z6YRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njAsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqu9jIDPr3MtiEmEESutu+aXvUiZ1REhkFxnAib0idrrD
 ALmWZlAy080QKXQoj/m2qQ5+Cp6kdQ15al8y7VvVLT5fXjQjQ0EsxAgp8cXCf4xiMbzZdB+Z
 MO5nmesZVPCxPGgWDa3PjnEz9Xtmfcmwt6rQY050YvCrf2rIUh9bA37QdbFowNEzn9751iGO
 5yDNvE7PITal+CaWvF11MfieBEc05DaStueHJyzPB9EgIm70xR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY/vY1a9Ci7kISaXOxDqBasHM3XCp9r+56g0/vijfNgNwIEpkJ
 rMXVtEvSo5el7oC8eJwJpXmyq9CFmVTHDo0IVT9pJ5srrzSP7iNjCCUkknl4+6r/AWEqTgKo
 KO0VJtcorexEfVaPd0NjzFKutvwCMlIbMoU/4AKiKznv4=
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="62981614"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/9] x86/spec-ctrl: Introduce new has_spec_ctrl boolean
Date: Fri, 28 Jan 2022 13:29:21 +0000
Message-ID: <20220128132927.14997-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220128132927.14997-1-andrew.cooper3@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Most MSR_SPEC_CTRL setup will be common between Intel and AMD.  Instead of
opencoding an OR of two features everywhere, introduce has_spec_ctrl instead.

Reword the comment above the Intel specific alternatives block to highlight
that it is Intel specific, and pull the setting of default_xen_spec_ctrl.IBRS
out because it will want to be common.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/spec_ctrl.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 8a550d0a0902..2072daf66245 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -927,7 +927,7 @@ static __init void mds_calculations(uint64_t caps)
 void __init init_speculation_mitigations(void)
 {
     enum ind_thunk thunk = THUNK_DEFAULT;
-    bool ibrs = false, hw_smt_enabled;
+    bool has_spec_ctrl, ibrs = false, hw_smt_enabled;
     bool cpu_has_bug_taa;
     uint64_t caps = 0;
 
@@ -936,6 +936,8 @@ void __init init_speculation_mitigations(void)
 
     hw_smt_enabled = check_smt_enabled();
 
+    has_spec_ctrl = boot_cpu_has(X86_FEATURE_IBRSB);
+
     /*
      * First, disable the use of retpolines if Xen is using shadow stacks, as
      * they are incompatible.
@@ -973,11 +975,11 @@ void __init init_speculation_mitigations(void)
              */
             else if ( retpoline_safe(caps) )
                 thunk = THUNK_RETPOLINE;
-            else if ( boot_cpu_has(X86_FEATURE_IBRSB) )
+            else if ( has_spec_ctrl )
                 ibrs = true;
         }
         /* Without compiler thunk support, use IBRS if available. */
-        else if ( boot_cpu_has(X86_FEATURE_IBRSB) )
+        else if ( has_spec_ctrl )
             ibrs = true;
     }
 
@@ -1008,10 +1010,7 @@ void __init init_speculation_mitigations(void)
     else if ( thunk == THUNK_JMP )
         setup_force_cpu_cap(X86_FEATURE_IND_THUNK_JMP);
 
-    /*
-     * If we are on hardware supporting MSR_SPEC_CTRL, see about setting up
-     * the alternatives blocks so we can virtualise support for guests.
-     */
+    /* Intel hardware: MSR_SPEC_CTRL alternatives setup. */
     if ( boot_cpu_has(X86_FEATURE_IBRSB) )
     {
         if ( opt_msr_sc_pv )
@@ -1030,11 +1029,12 @@ void __init init_speculation_mitigations(void)
             default_spec_ctrl_flags |= SCF_ist_wrmsr;
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
         }
-
-        if ( ibrs )
-            default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
     }
 
+    /* If we have IBRS available, see whether we should use it. */
+    if ( has_spec_ctrl && ibrs )
+        default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
+
     /* If we have SSBD available, see whether we should use it. */
     if ( boot_cpu_has(X86_FEATURE_SSBD) && opt_ssbd )
         default_xen_spec_ctrl |= SPEC_CTRL_SSBD;
@@ -1268,7 +1268,7 @@ void __init init_speculation_mitigations(void)
      * boot won't have any other code running in a position to mount an
      * attack.
      */
-    if ( boot_cpu_has(X86_FEATURE_IBRSB) )
+    if ( has_spec_ctrl )
     {
         bsp_delay_spec_ctrl = !cpu_has_hypervisor && default_xen_spec_ctrl;
 
-- 
2.11.0


