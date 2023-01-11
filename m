Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9386C665DAE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 15:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475402.737112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFc1V-00050X-5M; Wed, 11 Jan 2023 14:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475402.737112; Wed, 11 Jan 2023 14:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFc1V-0004x5-2G; Wed, 11 Jan 2023 14:24:13 +0000
Received: by outflank-mailman (input) for mailman id 475402;
 Wed, 11 Jan 2023 14:24:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ffGs=5I=citrix.com=prvs=36809819d=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1pFc1T-0004X2-MV
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 14:24:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9abdd617-91bb-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 15:24:08 +0100 (CET)
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
X-Inumbo-ID: 9abdd617-91bb-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673447048;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w8iJbWumWsWSLAQupGB9uR+XhDb3DO8D3MIfiJPhdz8=;
  b=fvF4BX+LPrQIrY2PpHtLmmLlik6LfxTjvMHH0utzI0BqD0bxqb/oUMd5
   N3ynSJFBX6ODR5lUKO0xlFzG1LltL/LlsRiGuVjiAB81lItJuZvtYlSwB
   A1eMWha8DWiO/+SqxstiXRfd8Z2ybKbHaE2mP176YByTOrzifXjKxz0u7
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92126493
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MaYA86LOzuKiLSf/FE+R25UlxSXFcZb7ZxGr2PjKsXjdYENS12dVz
 2sbDG/VO6yNZGCnctAibd/g/E1XsMeBz4AwQFFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mhA5wVnPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5WKEVx3
 84CcQsyZ066nOKv0qmWE+NF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLolkf2ni2i5fyxRs1aUjaE2/3LS3Ep6172F3N/9K4bTH5sJzx3wS
 mTuvEPDXA9HF9WjwyOV81Sq3NfrxS3pYddHfFG/3qEz2wDCroAJMzUJUXOrrP//jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwAOHx7fQ4g2ZLnMZVTMHY9sj3PLaXhRzi
 AXPxYmwQ2Uy7vvFEhpx64t4sxuTEAwqB10YPBQ7RFU8+Nn6spoe1xjmG4ML/LGOsvX5HjT5w
 javpSc4hqkOgcNj65hX7WwrkBr3+MGXE1ddChH/Gzv8s1gnPNLNi5mAswCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJrW/FF52LJ9o4DNRCyKBBbK45lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIUVOccsKl/ao38+DaJ144wKuBFy+ZzTx
 L/BKZr8ZZrkIfkPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bMIYrpxGCmN7hjhIvd+VW9z
 jqqH5fSo/mpeLGkM3a/HE96BQxiEEXX8rit9ZcMK7LTc1c4cIzjYteIqY4cl0Vet/w9vo/1E
 ruVACe0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:McqUha8+FRcEno35IkFuk+D2I+orL9Y04lQ7vn2ZESYlFfBxl6
 iV88jzpiWE7gr5OUtQ4+xoV5PwIk80maQZ3WBVB8bHYOCEghrUEGgB1/qB/9SIIUSXnYRgPO
 VbAs1D4bbLY2SS+Pyb3ODOKbcdKbe8nJxAzt2utkuFBTsaE52IwT0JcTqmLg==
X-IronPort-AV: E=Sophos;i="5.96,317,1665460800"; 
   d="scan'208";a="92126493"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Sergey Dyasli <sergey.dyasli@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2] x86/ucode/AMD: apply the patch early on every logical thread
Date: Wed, 11 Jan 2023 14:23:29 +0000
Message-ID: <20230111142329.4379-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The original issue has been reported on AMD Bulldozer-based CPUs where
ucode loading loses the LWP feature bit in order to gain the IBPB bit.
LWP disabling is per-SMT/CMT core modification and needs to happen on
each sibling thread despite the shared microcode engine. Otherwise,
logical CPUs will end up with different cpuid capabilities.
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216211

Guests running under Xen happen to be not affected because of levelling
logic for the feature masking/override MSRs which causes the LWP bit to
fall out and hides the issue. The latest recommendation from AMD, after
discussing this bug, is to load ucode on every logical CPU.

In Linux kernel this issue has been addressed by e7ad18d1169c
("x86/microcode/AMD: Apply the patch early on every logical thread").
Follow the same approach in Xen.

Introduce SAME_UCODE match result and use it for early AMD ucode
loading. Late loading is still performed only on the first of SMT/CMT
siblings and only if a newer ucode revision has been provided (unless
allow_same option is specified).

Intel's side of things is modified for consistency but provides no
functional change.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
v1 --> v2:
- Expanded the commit message with the levelling section
- Adjusted comment for OLD_UCODE

CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/microcode/amd.c     | 16 +++++++++++++---
 xen/arch/x86/cpu/microcode/intel.c   |  9 +++++++--
 xen/arch/x86/cpu/microcode/private.h |  3 ++-
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 4b097187a0..96db10a2e0 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -176,8 +176,13 @@ static enum microcode_match_result compare_revisions(
     if ( new_rev > old_rev )
         return NEW_UCODE;
 
-    if ( opt_ucode_allow_same && new_rev == old_rev )
-        return NEW_UCODE;
+    if ( new_rev == old_rev )
+    {
+        if ( opt_ucode_allow_same )
+            return NEW_UCODE;
+        else
+            return SAME_UCODE;
+    }
 
     return OLD_UCODE;
 }
@@ -220,8 +225,13 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
     unsigned int cpu = smp_processor_id();
     struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
     uint32_t rev, old_rev = sig->rev;
+    enum microcode_match_result result = microcode_fits(patch);
 
-    if ( microcode_fits(patch) != NEW_UCODE )
+    /*
+     * Allow application of the same revision to pick up SMT-specific changes
+     * even if the revision of the other SMT thread is already up-to-date.
+     */
+    if ( result != NEW_UCODE && result != SAME_UCODE )
         return -EINVAL;
 
     if ( check_final_patch_levels(sig) )
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index f7fec4b4ed..59a99eee4e 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -232,8 +232,13 @@ static enum microcode_match_result compare_revisions(
     if ( new_rev > old_rev )
         return NEW_UCODE;
 
-    if ( opt_ucode_allow_same && new_rev == old_rev )
-        return NEW_UCODE;
+    if ( new_rev == old_rev )
+    {
+        if ( opt_ucode_allow_same )
+            return NEW_UCODE;
+        else
+            return SAME_UCODE;
+    }
 
     /*
      * Treat pre-production as always applicable - anyone using pre-production
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index 73b095d5bf..626aeb4d08 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -6,7 +6,8 @@
 extern bool opt_ucode_allow_same;
 
 enum microcode_match_result {
-    OLD_UCODE, /* signature matched, but revision id is older or equal */
+    OLD_UCODE, /* signature matched, but revision id is older */
+    SAME_UCODE, /* signature matched, but revision id is the same */
     NEW_UCODE, /* signature matched, but revision id is newer */
     MIS_UCODE, /* signature mismatched */
 };
-- 
2.17.1


