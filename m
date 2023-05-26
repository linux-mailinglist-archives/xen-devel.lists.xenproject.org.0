Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62E371253E
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 13:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540059.841520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VIJ-000727-Ix; Fri, 26 May 2023 11:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540059.841520; Fri, 26 May 2023 11:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VIJ-0006w8-DX; Fri, 26 May 2023 11:07:39 +0000
Received: by outflank-mailman (input) for mailman id 540059;
 Fri, 26 May 2023 11:07:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDTS=BP=citrix.com=prvs=5031e17c9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q2VII-0006de-F4
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 11:07:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84a6571e-fbb5-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 13:07:36 +0200 (CEST)
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
X-Inumbo-ID: 84a6571e-fbb5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685099256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wC2o+30LdUKtUUpwusZsSoxUr8yh/q6D9ho4+eihRUc=;
  b=gVfLAo0aa7IwytHWZHndmHdlkXSYTN7/yNj8L4kW70EEzAKVURQSRYaB
   woJZXTbfNfz8H2EAFCtpaRnKiniv5bIKW8O0ngD+6ntuG5v+aUrETWM7R
   dk/webmxF/tKuYJZH7L/z9Tf3pPQU+knZ8517FjeaeUl/ACJ3aKB2ZM7y
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113007431
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Zymny6KieKkIhJKGFE+RwZUlxSXFcZb7ZxGr2PjKsXjdYENS3jFUm
 jMYUDiCO6zeZWGhL98jOYyypkoAscPdz9cyG1FlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4wZgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4rEFN+7
 KcjLQtcNDyZgdu20paCZ+Rz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJ4NxhnE/
 TuuE2LRJkpHEMeCzjW8tXf0hfORgiHfZL4qG+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9cX4wVTZfdg4+soPPuocKjgDrd/tuD/vg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yT7FWyzyGskTKuMDirjUWGBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YhKVfcrX0yPBDBhQgBdXTAd4llZ
 f93lu71Vx4n5VlPlmLqF4/xL5d3rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzUwzN14vd+F+92
 48GZ6O3J+B3DLWWjt//rdRCcjjn7BETWfjLliCgXrTeelE6QDp4Wqa5LHFIU9UNopm5X9zgp
 hmVMnK0AnKk2RUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:dVF/867Y88ohT6Z5EgPXwDjXdLJyesId70hD6qkQc3Fom62j5q
 STdZEgvyMc5wx/ZJhNo7690cq7MBbhHPxOkOos1N6ZNWGLhILPFuBfBOPZqAEIcBeOlNK1u5
 0BT0EEMqyWMbB75/yKnDVREbwbsaa6GHbDv5ah859vJzsaGp2J921Ce2Cm+tUdfng9OXI+fq
 Dsn/Zvln6bVlk8SN+0PXUBV/irnay3qHq3CSR2fyLO8WO1/EiV1II=
X-Talos-CUID: 9a23:+tN6sWCs5MboMu76E3V2xn4NQfsgSSyH4G3WGk+qLV9ERaLAHA==
X-Talos-MUID: 9a23:Ph3L3Aq2Yv2gxBx1mkgezxU5aeNz/qOhMQcIyZYa5daGERBMAzjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,194,1681185600"; 
   d="scan'208";a="113007431"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/4] x86/cpu-policy: Derive {,R}RSBA for guest policies
Date: Fri, 26 May 2023 12:06:56 +0100
Message-ID: <20230526110656.4018711-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The RSBA bit, "RSB Alternative", means that the RSB may use alternative
predictors when empty.  From a practical point of view, this mean "Retpoline
not safe".

Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
statement that IBRS is implemented in hardware (as opposed to the form
retrofitted to existing CPUs in microcode).

The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
property that predictions are tagged with the mode in which they were learnt.
Therefore, it means "when eIBRS is active, the RSB may fall back to
alternative predictors but restricted to the current prediction mode".  As
such, it's stronger statement than RSBA, but still means "Retpoline not safe".

Add feature dependencies for EIBRS and RRSBA.  While technically they're not
linked, absolutely nothing good can of letting the guest see RRSBA without
EIBRS.  Furthermore, we use this dependency to simplify the max/default
derivation logic.

The max policies gets RSBA and RRSBA unconditionally set (with the EIBRS
dependency maybe hiding RRSBA).  We can run any VM, even if it has been told
"somewhere else, Retpoline isn't safe".

The default policies inherit the host settings, because the guest wants to run
with as few (anti)features as it can safely get away with.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu-policy.c | 25 +++++++++++++++++++++++++
 xen/tools/gen-cpuid.py    |  5 ++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index bdbc5660acd4..eb1ecb75f593 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -423,8 +423,14 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
          * Retpoline not safe)", so these need to be visible to a guest in all
          * cases, even when it's only some other server in the pool which
          * suffers the identified behaviour.
+         *
+         * We can always run any VM which has previously (or will
+         * subsequently) run on hardware where Retpoline is not safe.  Note:
+         * The dependency logic may hide RRSBA for other reasons.
          */
         __set_bit(X86_FEATURE_ARCH_CAPS, fs);
+        __set_bit(X86_FEATURE_RSBA, fs);
+        __set_bit(X86_FEATURE_RRSBA, fs);
     }
 }
 
@@ -432,6 +438,25 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
 {
     if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
     {
+        /*
+         * The {,R}RSBA bits under virt mean "you might migrate somewhere
+         * where retpoline is not safe".  In particular, a VM's settings may
+         * not be applicable to the current host.
+         *
+         * Discard the settings inherited from the max policy, and and feed in
+         * the host values.  The ideal case for a VM is for neither of these
+         * bits to be set, but toolstacks must accumuate them across anywhere
+         * the VM might migrate to, in case any possible destination happens
+         * to be unsafe.
+         *
+         * Note: The dependency logic might hide RRSBA for other reasons.
+         */
+        fs[FEATURESET_m10Al] &= ~(cpufeat_mask(X86_FEATURE_RSBA) |
+                                  cpufeat_mask(X86_FEATURE_RRSBA));
+        fs[FEATURESET_m10Al] |=
+            host_cpu_policy.arch_caps.lo & (cpufeat_mask(X86_FEATURE_RSBA) |
+                                            cpufeat_mask(X86_FEATURE_RRSBA));
+
         /*
          * IvyBridge client parts suffer from leakage of RDRAND data due to SRBDS
          * (XSA-320 / CVE-2020-0543), and won't be receiving microcode to
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index f28ff708a2fc..22294a26adc0 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -318,7 +318,7 @@ def crunch_numbers(state):
         # IBRSB/IBRS, and we pass this MSR directly to guests.  Treating them
         # as dependent features simplifies Xen's logic, and prevents the guest
         # from seeing implausible configurations.
-        IBRSB: [STIBP, SSBD, INTEL_PSFD],
+        IBRSB: [STIBP, SSBD, INTEL_PSFD, EIBRS],
         IBRS: [AMD_STIBP, AMD_SSBD, PSFD,
                IBRS_ALWAYS, IBRS_FAST, IBRS_SAME_MODE],
         AMD_STIBP: [STIBP_ALWAYS],
@@ -328,6 +328,9 @@ def crunch_numbers(state):
 
         # The ARCH_CAPS CPUID bit enumerates the availability of the whole register.
         ARCH_CAPS: list(range(RDCL_NO, RDCL_NO + 64)),
+
+        # The behaviour described by RRSBA depend on eIBRS being active.
+        EIBRS: [RRSBA],
     }
 
     deep_features = tuple(sorted(deps.keys()))
-- 
2.30.2


