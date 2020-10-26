Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E795E2993BA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 18:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12499.32550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX6Fi-0004O4-V4; Mon, 26 Oct 2020 17:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12499.32550; Mon, 26 Oct 2020 17:25:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX6Fi-0004Nc-RG; Mon, 26 Oct 2020 17:25:50 +0000
Received: by outflank-mailman (input) for mailman id 12499;
 Mon, 26 Oct 2020 17:25:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kX6Fh-0004NA-MW
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:25:49 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59c0ae4d-2f47-4978-a159-0144a4da89a4;
 Mon, 26 Oct 2020 17:25:47 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kX6Fh-0004NA-MW
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:25:49 +0000
X-Inumbo-ID: 59c0ae4d-2f47-4978-a159-0144a4da89a4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 59c0ae4d-2f47-4978-a159-0144a4da89a4;
	Mon, 26 Oct 2020 17:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603733147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pP9bPZd+ynQusPsRE1lR+uMStanSY8oC7KNbBWD1tII=;
  b=Uh4dyZYiCXoJg+b8OAn2ERcRImgIT943j+YsjVwht5EEnUGWA1DYN5Fq
   ORm4OGBqorTF+cD6gQicvosBbz3IeRwhKj8HrYqA+CCa2TCdPe5SKzGj8
   KGVEleTIC3wz2v/Wiv9v30sx2DT/DqNS4cfGRvF3ookQPRYzeWtaVR7c2
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RUsuTg5n0SgumsZ62WO1pyNzSxgWv6VSNF0gBpmjjULpYbEvVn0fhZLozwiYoFH6OzFQjnPU+q
 c8PW/1DYgS8JEo08Q80+Ihob7HfZv9aJ12MqIIACSav2MbERYXFyUHaMCZXVwowpFxQtqcLGMn
 yqKiT0eC/NVTl3V48LnvuzFZZbWSKa0QUG4YY5ifplRZpNtop2o+p/oxehzxuxyoUx6ww41xmJ
 0NZJbiBrPGfgyuP2EpMW9OZv3puioYDSuWRdH//cVaaKVEcGH3KwdQ38q9HrF33JbZZG1zgnZH
 tKE=
X-SBRS: None
X-MesageID: 30138949
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,420,1596513600"; 
   d="scan'208";a="30138949"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH 1/3] x86/ucode: Break out compare_revisions() from existing infrastructure
Date: Mon, 26 Oct 2020 17:25:17 +0000
Message-ID: <20201026172519.17881-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201026172519.17881-1-andrew.cooper3@citrix.com>
References: <20201026172519.17881-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Drop some unnecesserily verbose pr_debug()'s on the AMD side.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c   | 22 +++++++++++-----------
 xen/arch/x86/cpu/microcode/intel.c | 15 ++++++++++++---
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index e80f7cd3e4..7d2f57c4cb 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -168,6 +168,15 @@ static bool check_final_patch_levels(const struct cpu_signature *sig)
     return false;
 }
 
+static enum microcode_match_result compare_revisions(
+    uint32_t old_rev, uint32_t new_rev)
+{
+    if ( new_rev > old_rev )
+        return NEW_UCODE;
+
+    return OLD_UCODE;
+}
+
 static enum microcode_match_result microcode_fits(
     const struct microcode_patch *patch)
 {
@@ -178,16 +187,7 @@ static enum microcode_match_result microcode_fits(
          equiv.id  != patch->processor_rev_id )
         return MIS_UCODE;
 
-    if ( patch->patch_id <= sig->rev )
-    {
-        pr_debug("microcode: patch is already at required level or greater.\n");
-        return OLD_UCODE;
-    }
-
-    pr_debug("microcode: CPU%d found a matching microcode update with version %#x (current=%#x)\n",
-             cpu, patch->patch_id, sig->rev);
-
-    return NEW_UCODE;
+    return compare_revisions(sig->rev, patch->patch_id);
 }
 
 static enum microcode_match_result compare_header(
@@ -196,7 +196,7 @@ static enum microcode_match_result compare_header(
     if ( new->processor_rev_id != old->processor_rev_id )
         return MIS_UCODE;
 
-    return new->patch_id > old->patch_id ? NEW_UCODE : OLD_UCODE;
+    return compare_revisions(old->patch_id, new->patch_id);
 }
 
 static enum microcode_match_result compare_patch(
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 72c07fcd1d..e1ccb5d232 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -222,6 +222,15 @@ static int microcode_sanity_check(const struct microcode_patch *patch)
     return 0;
 }
 
+static enum microcode_match_result compare_revisions(
+    uint32_t old_rev, uint32_t new_rev)
+{
+    if ( new_rev > old_rev )
+        return NEW_UCODE;
+
+    return OLD_UCODE;
+}
+
 /* Check an update against the CPU signature and current update revision */
 static enum microcode_match_result microcode_update_match(
     const struct microcode_patch *mc)
@@ -245,7 +254,7 @@ static enum microcode_match_result microcode_update_match(
     return MIS_UCODE;
 
  found:
-    return mc->rev > cpu_sig->rev ? NEW_UCODE : OLD_UCODE;
+    return compare_revisions(cpu_sig->rev, mc->rev);
 }
 
 static enum microcode_match_result compare_patch(
@@ -258,7 +267,7 @@ static enum microcode_match_result compare_patch(
     ASSERT(microcode_update_match(old) != MIS_UCODE);
     ASSERT(microcode_update_match(new) != MIS_UCODE);
 
-    return new->rev > old->rev ? NEW_UCODE : OLD_UCODE;
+    return compare_revisions(old->rev, new->rev);
 }
 
 static int apply_microcode(const struct microcode_patch *patch)
@@ -332,7 +341,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
          * one with higher revision.
          */
         if ( (microcode_update_match(mc) != MIS_UCODE) &&
-             (!saved || (mc->rev > saved->rev)) )
+             (!saved || compare_revisions(saved->rev, mc->rev) == NEW_UCODE) )
             saved = mc;
 
         buf  += blob_size;
-- 
2.11.0


