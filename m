Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6F9680C92
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 12:55:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486945.754400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSkz-0004xM-KN; Mon, 30 Jan 2023 11:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486945.754400; Mon, 30 Jan 2023 11:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSkz-0004vC-GR; Mon, 30 Jan 2023 11:55:29 +0000
Received: by outflank-mailman (input) for mailman id 486945;
 Mon, 30 Jan 2023 11:55:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YhKs=53=citrix.com=prvs=387b7cf06=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1pMSky-0004uS-3i
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 11:55:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fab1cf55-a094-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 12:55:25 +0100 (CET)
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
X-Inumbo-ID: fab1cf55-a094-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675079725;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fCUwTbUb3AGJCOVD9paDwHq4D4mk04YKXr7Q+YvK7fk=;
  b=HU2LGeOHdSktZV+a6hlOtI/JpBW3Cefe0VGXjKhZFlVPlegeF5q/lS4i
   IY8qEa8VtFoPDSDbso7HzM4/qQTi3OourJtjClES9JMN8sPb0TAzBYqnf
   UX90le3JycnUSOJcjc7/IzB51ZgWZGyu/U3M+3tqTYtfQWLMNfBg04LwH
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93678977
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:1+TtD6AudGKu3xVW/z3jw5YqxClBgxIJ4kV8jS/XYbTApGwn1zYDm
 DFJC2iEaPjYNGv2ettwOYm+8x4GsMOAydJlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpD5gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2MYrKkhkx
 /Ykb3NSQTavmOTr2KK0Vbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIIkzhuillz/zYjRDrFO9rqsr+WnDigd21dABNfKEIYLVFZQKwS50o
 ErtuEmnLwBGNuCk4jOl93iwj7HXuzv0Ddd6+LqQqacx3Qz7KnYoIAISfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6guA167V6AaxHXUfQ3hKb9lOiSMtbWV0j
 BnTxYqvXGEx9uTPEhpx64t4sxuQGXQ+BEUwbxNDDlQqxfX8ptwrnh3QG4ML/LGOsvX5HjT5w
 javpSc4hqkOgcNj65hX7WwrkBr3+MGXE1ddChH/Gzv8s1gnPNLNi5mAswCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJrW/FF52LJ9o4DNRCyKBBb645lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIUTOsEuLV/bpHAxDaJ144wKuBF8+ZzTx
 L/BKZr8ZZrkIfsPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bMIYrpxGCmN7hjhIvd+VW9z
 jqqH5fSo/mpeLGkM3a/HE96BQxiEEXX8riv9JIMJrfTeVM2cIzjYteIqY4cl0Vet/w9vo/1E
 ruVACe0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:DpRMi6M9k0iBqsBcT0D155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90dq7MAnhHP9OkMIs1NKZMDUO11HYS72KgbGC/9SkIVyHygc/79
 YrT0EdMqyXMbESt6+Tj2eF+pQbsaC6GcuT9IXjJgJWPGVXgtZbnmJE42igcnFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29LOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6d030Woqqu9jJwPr3NtiEnEESutu9uXvUiZ1S2hkF1nAho0idurD
 CDmWZlAy050QKtQoj8m2qQ5+Cn6kdi15aq8y7nvZPuzPaJOw4SGo5Pg5lUfQDe7FdltNZg0L
 hT12bcrJZPCwjc9R6NkeQgeisa4nZcm0BS5tI7njhaS88TebVRpYsQ8AdcF4oBBjvz7MQiHP
 N1BM/R6f5KeRfCBkqp9lVH0ZipRDA+Dx2GSk8Ntoic1CVXhmlwyw8dyNYElnkN+ZohQ91P5v
 jCMK5viLZSJ/VmJJ5VFaMEW4+6G2bNSRXDPCabJknmDrgOPzbXp5v+8NwOlZSXkVwzvekPcb
 j6ISBlXDQJCjPT4OW1re12ziw=
X-IronPort-AV: E=Sophos;i="5.97,257,1669093200"; 
   d="scan'208";a="93678977"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Sergey Dyasli <sergey.dyasli@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3] x86/ucode/AMD: apply the patch early on every logical thread
Date: Mon, 30 Jan 2023 11:55:03 +0000
Message-ID: <20230130115503.19941-1-sergey.dyasli@citrix.com>
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
loading. Take this opportunity and move opt_ucode_allow_same out of
compare_revisions() to the relevant callers and also modify the warning
message based on it. Intel's side of things is modified for consistency
but provides no functional change.

Late loading is still performed only on the first of SMT/CMT
siblings and only if a newer ucode revision has been provided (unless
allow_same option is specified).

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
v2 --> v3:
- Moved opt_ucode_allow_same out of compare_revisions() and updated
  the commit message
- Adjusted the warning message

v1 --> v2:
- Expanded the commit message with the levelling section
- Adjusted comment for OLD_UCODE

CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/microcode/amd.c     | 11 ++++++++---
 xen/arch/x86/cpu/microcode/core.c    | 19 ++++++++++++++-----
 xen/arch/x86/cpu/microcode/intel.c   | 10 +++++++---
 xen/arch/x86/cpu/microcode/private.h |  3 ++-
 4 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 4b097187a0..a9a5557835 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -176,8 +176,8 @@ static enum microcode_match_result compare_revisions(
     if ( new_rev > old_rev )
         return NEW_UCODE;
 
-    if ( opt_ucode_allow_same && new_rev == old_rev )
-        return NEW_UCODE;
+    if ( new_rev == old_rev )
+        return SAME_UCODE;
 
     return OLD_UCODE;
 }
@@ -220,8 +220,13 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
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
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index d14754e222..912ef2c7be 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -612,13 +612,21 @@ static long cf_check microcode_update_helper(void *data)
      * that ucode revision.
      */
     spin_lock(&microcode_mutex);
-    if ( microcode_cache &&
-         alternative_call(ucode_ops.compare_patch,
-                          patch, microcode_cache) != NEW_UCODE )
+    if ( microcode_cache )
     {
+        enum microcode_match_result result;
+
+        result = alternative_call(ucode_ops.compare_patch, patch,
+                                                           microcode_cache);
         spin_unlock(&microcode_mutex);
-        printk(XENLOG_WARNING "microcode: couldn't find any newer revision "
-                              "in the provided blob!\n");
+
+        if ( result == NEW_UCODE ||
+             (opt_ucode_allow_same && result == SAME_UCODE) )
+            goto apply;
+
+        printk(XENLOG_WARNING "microcode: couldn't find any newer%s revision "
+                              "in the provided blob!\n", opt_ucode_allow_same ?
+                                                         " (or the same)" : "");
         microcode_free_patch(patch);
         ret = -ENOENT;
 
@@ -626,6 +634,7 @@ static long cf_check microcode_update_helper(void *data)
     }
     spin_unlock(&microcode_mutex);
 
+apply:
     cpumask_clear(&cpu_callin_map);
     atomic_set(&cpu_out, 0);
     atomic_set(&cpu_updated, 0);
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index f7fec4b4ed..8d4d6574aa 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -232,8 +232,8 @@ static enum microcode_match_result compare_revisions(
     if ( new_rev > old_rev )
         return NEW_UCODE;
 
-    if ( opt_ucode_allow_same && new_rev == old_rev )
-        return NEW_UCODE;
+    if ( new_rev == old_rev )
+        return SAME_UCODE;
 
     /*
      * Treat pre-production as always applicable - anyone using pre-production
@@ -290,8 +290,12 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
     unsigned int cpu = smp_processor_id();
     struct cpu_signature *sig = &this_cpu(cpu_sig);
     uint32_t rev, old_rev = sig->rev;
+    enum microcode_match_result result;
+
+    result = microcode_update_match(patch);
 
-    if ( microcode_update_match(patch) != NEW_UCODE )
+    if ( result != NEW_UCODE &&
+         !(opt_ucode_allow_same && result == SAME_UCODE) )
         return -EINVAL;
 
     wbinvd();
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


