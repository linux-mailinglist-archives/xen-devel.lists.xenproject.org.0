Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1742849C577
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 09:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260722.450743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvd-0002IG-NO; Wed, 26 Jan 2022 08:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260722.450743; Wed, 26 Jan 2022 08:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvd-0002CY-3x; Wed, 26 Jan 2022 08:45:21 +0000
Received: by outflank-mailman (input) for mailman id 260722;
 Wed, 26 Jan 2022 08:45:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCdva-000088-BN
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 08:45:18 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46e3417d-7e84-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 09:45:15 +0100 (CET)
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
X-Inumbo-ID: 46e3417d-7e84-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643186715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DMIani3bgij8H8/jeaN9V9MoninPkgoxwrQXOevq9nM=;
  b=BLyv/L4VLcFDrAzfGQbGmL/qHyh+hn0NzYKIiEvAxRX6lccMzVG/iBuN
   GbxWcitROtT6Cc5giPkVJUCrLTjHkLtZNZYKHIIXL+Fpg/C9zuSEBS+x7
   asAI7hj4fMbUJcv898nIDKwdiatnlb7nk2HPCcB09SUuyFHq+uTKCTjCK
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: tc9ZHDIppsRfMIg6eDk+iTqJGswfDGiDJsHK6jtcrYUUSRBHnyUR1kCsvrymg77jmnYisBzkS4
 TYkYm6AKS7ZNd+YxgmI6gnXlXioYALghjpubMZ8sA7hJossqZK0pt+Fl88tvg+sCcJc1UuJ6e0
 YD/iJddiyGOmeeNV4C26D0yvUjY5+cbWjzQNAECO4IGvjG56dnIqdj5UASYB6KO44N6RWpX0WT
 8HLTjqwZCCTzdRcUHn5W/SZmKoqug5Bb9772tgqpW1f0rGnpGPLF4nt0fpOigIpkylyD4ZtqAB
 17p0S2vSrueJY91bMkQpT2Ry
X-SBRS: 5.2
X-MesageID: 62781736
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:99fEeaxhJC0wHToEKi16t+fjwSrEfRIJ4+MujC+fZmUNrF6WrkUGn
 2cWWDvUOqyLZGvwfY0iPNu1908GucfUn4M1GlRsqCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRn2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8BLk
 98VubzzcwcwB4/opvUHED9SUD4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JoRTa+BP
 JRxhTxHdC/SWQ10Bn4uLrk5s8ChoHDlYRd5gQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYMYYFaS+EaqzuN05P2xziIHCsiRH1ePYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL0D2BLwQKChRqlEGp/ZgPQ1
 JTjs5PGhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGonfxo3bppZKWCBj
 KrvVeV5vs470JyCNvcfXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjmz+7bc2lnnyPjOrPDFbIGOxtGAbfMYgEAFas/V+9H
 yB3bZXakn2ykYTWP0HqzGLkBQladCdgXcGv9ZU/myzqClMOJVzNwsT5mdsJE7GJVYwP/gsR1
 n3iCEJe1nTlgnjLdVeDZnx5Meu9Vpdjt3MreycrOA/wiXQkZI+u6oYZdoc2IuZ7pLAyk6YsQ
 qlXYdiED9ROVi/Dp2YXY67iodEwbx+snw+PYXaoOWBtY556SgXV0db4ZQ+zpjIWBy+6uJJm8
 b2t3w/WW7QZQAFmAJqEYf6j1Qrp73MchPhzTw3DJdwKIBfg941jKirQiP4rIp5TdUWfl2XCj
 wvPWEUWv+jApYMx4eLlv6Hcotf7CfZ6E2pbA3LfseS8Ox7F8zfx2oRHSuuJI2zQDTum5KW4a
 OxJ5PjgK/lbzk1Suo9xHrs3n6Iz49zj++1Twgh+RSiZal2qDvVrI2Wc3NkJvapIn+cLtQyzU
 0OJ299bJbTWZ5+1TA9PfFIoPraZyPUZujjO9vBkckz16Rh+8KeDTUgPbQKHjzZQLectPY4oq
 Qv7VBX6N+BrZsIWD+u7
IronPort-HdrOrdr: A9a23:vpH336DhchpZ3EDlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,317,1635220800"; 
   d="scan'208";a="62781736"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/8] x86/spec-ctrl: Introduce new has_spec_ctrl boolean
Date: Wed, 26 Jan 2022 08:44:49 +0000
Message-ID: <20220126084452.28975-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220126084452.28975-1-andrew.cooper3@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
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


