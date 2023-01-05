Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 708E065ECD5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 14:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471913.731956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDQAS-0003yU-HP; Thu, 05 Jan 2023 13:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471913.731956; Thu, 05 Jan 2023 13:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDQAS-0003vw-EG; Thu, 05 Jan 2023 13:20:24 +0000
Received: by outflank-mailman (input) for mailman id 471913;
 Thu, 05 Jan 2023 13:20:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SMos=5C=citrix.com=prvs=362393fcb=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1pDQAQ-0003vq-Va
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 13:20:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b30c4293-8cfb-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 14:20:20 +0100 (CET)
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
X-Inumbo-ID: b30c4293-8cfb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672924820;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ByrJoUcDQW/Jw5ganKu1HSJnrrgr2Xc0sa9YKf7jgcg=;
  b=L/C4QhKhdcx/XHGJnNL6xcf3kB9NEd3UayI8Fdjmksb5DOK0eAEeqDbq
   5ytu6fR+M0IFoj64a77KOB5PU/pKKx+cK6cRvxTARC2AjqHBVCKqRJ2dP
   R2B2pmMPga2XB4Dly8l0wH1oJLXT+zEyywkrjr7Es+hcNop/X6IsRUATY
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90793652
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wna+i6NrHskaRtvvrR2ql8FynXyQoLVcMsEvi/4bfWQNrUol3zJRz
 WIZWWrXPKmMYmf9edBwb9m+/BtUsZfVx9ZqTgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo42tB5gFmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uhqHGFI0
 Pg1EncIdwGj3ca5+p+HTsA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTIIkzhuillz/zYjRDrFO9rqsr+WnDigd21dABNfKEIoPbHpsIxC50o
 Ers0UOmDy4mOObB0GemsWmB3s3wrHv0Ddd6+LqQqacx3Qz7KnYoIAISfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6guA167V6AaxHXUfQ3hKb9lOiSMtbWV0j
 BnTxYqvXGEx9u3OIZ6AyluKhT2vJCgTCGsvX2gBVBoluf3smqwPijuaG76PD5WJptHyHDjxx
 RWDoy4/m6gfgKY36kmrwbzUq2ny/8aUF2bZ8i2SBzv4tV0hOOZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF7rVxBGFb5J+i8BQ2Sw283WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMYAeP8crJF/fpHAGiausM4fFyRFErE3CE
 c3DLZbE4YgyU8yLMwZat89CiOR2l0jSNEvYRIzhzgTP7IdykEW9EO9fWHPXN7BR0U9xiFmNm
 zqpH5fQmko3vSyXSnW/zLP/2nhTdSdjWMqr9pcOHgNBSyI/cFwc5zbq6etJU+RYc259zY8kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:watsgKsdkdKZltfVIqUM7ujA7skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="90793652"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Sergey Dyasli <sergey.dyasli@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] x86/ucode/AMD: apply the patch early on every logical thread
Date: Thu, 5 Jan 2023 13:20:04 +0000
Message-ID: <20230105132004.7750-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The original issue has been reported on AMD Bulldozer-based CPUs where
ucode loading loses the LWP feature bit in order to gain the IBPB bit.
LWP disabling is per-SMT core modification and needs to happen on each
sibling SMT thread despite the shared microcode engine. Otherwise,
logical CPUs will end up with different cpuid capabilities.
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216211

In Linux kernel this issue has been addressed by e7ad18d1169c
("x86/microcode/AMD: Apply the patch early on every logical thread").
Follow the same approach in Xen.

Introduce SAME_UCODE match result and use it for early AMD ucode
loading. Late loading is still performed only on the first of SMT
siblings and only if a newer ucode revision has been provided (unless
allow_same option is specified).

Intel's side of things is modified for consistency but provides no
functional change.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/microcode/amd.c     | 16 +++++++++++++---
 xen/arch/x86/cpu/microcode/intel.c   |  9 +++++++--
 xen/arch/x86/cpu/microcode/private.h |  1 +
 3 files changed, 21 insertions(+), 5 deletions(-)

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
index 73b095d5bf..c4c6729f56 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -7,6 +7,7 @@ extern bool opt_ucode_allow_same;
 
 enum microcode_match_result {
     OLD_UCODE, /* signature matched, but revision id is older or equal */
+    SAME_UCODE, /* signature matched, but revision id is the same */
     NEW_UCODE, /* signature matched, but revision id is newer */
     MIS_UCODE, /* signature mismatched */
 };
-- 
2.17.1


