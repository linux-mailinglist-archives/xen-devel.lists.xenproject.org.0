Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF7A19931A
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:07:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDmS-0005wl-FY; Tue, 31 Mar 2020 10:06:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJDmR-0005vz-8z
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:05:59 +0000
X-Inumbo-ID: 2f649311-7337-11ea-ba0b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f649311-7337-11ea-ba0b-12813bfff9fa;
 Tue, 31 Mar 2020 10:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585649145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Si5z3xeHwmyHLpHOIC9s/BWYm39Q13l64/PRkSlBm6w=;
 b=cdXGASegCVucSYjuDJm5B0j98ptJBbAJ3zNE/TLh0a8VTGZcrIKBSP4z
 bGueHDinyvfyv+GRoTeprjpiVeZqa+849+rNi9TiXOJdq8yDTkyLdectS
 J0zXuQViLtEM6TcAeUIGOb6XTosHkJ6uv8dTETiykoaWYf4pLrBEiyyCJ M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XngBh1581dh7CTw+F+sgioVCiUhxNKM2+kaS9KN8JnNSqtxxjKjbDzVq7rVnR9HumtnbuKXHeQ
 UzlcYOVvpQgHaWTV8EAxW877G/NyR/XOB3cBvQZL4dRtmapIXFXi4fIqZaKif4gko4dONUdssA
 xBIbY7U2OnQ5nO5CvxEfChUHlw/6UFxsCjr/C8Y3D+rw3RH3TrHtJLV1ThkA8GTED1nwN5+HvA
 vtJKcuCRQ99yHnm1J/XL0wXM4cUxJtC+kQriDHXvyriFJc74aI2L6VWhLDexH1nESQn33RvTcn
 j9A=
X-SBRS: 2.7
X-MesageID: 15327881
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15327881"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 07/11] x86/ucode/amd: Alter API for microcode_fits()
Date: Tue, 31 Mar 2020 11:05:27 +0100
Message-ID: <20200331100531.4294-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200331100531.4294-1-andrew.cooper3@citrix.com>
References: <20200331100531.4294-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Although it is logically a step in the wrong direction overall, it simplifies
the rearranging of cpu_request_microcode() substantially for microcode_fits()
to take struct microcode_header_amd directly, and not require an intermediate
struct microcode_amd pointing at it.

Make this change (taking time to rename 'mc_amd' to its eventual 'patch' to
reduce the churn in the series), and a later cleanup will make it uniformly
take a struct microcode_patch.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 8318664f85..254f3dd4d7 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -173,31 +173,30 @@ static bool check_final_patch_levels(const struct cpu_signature *sig)
 }
 
 static enum microcode_match_result microcode_fits(
-    const struct microcode_amd *mc_amd)
+    const struct microcode_header_amd *patch)
 {
     unsigned int cpu = smp_processor_id();
     const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
-    const struct microcode_header_amd *mc_header = mc_amd->mpb;
 
     if ( equiv.sig != sig->sig ||
-         equiv.id  != mc_header->processor_rev_id )
+         equiv.id  != patch->processor_rev_id )
         return MIS_UCODE;
 
-    if ( mc_header->patch_id <= sig->rev )
+    if ( patch->patch_id <= sig->rev )
     {
         pr_debug("microcode: patch is already at required level or greater.\n");
         return OLD_UCODE;
     }
 
     pr_debug("microcode: CPU%d found a matching microcode update with version %#x (current=%#x)\n",
-             cpu, mc_header->patch_id, sig->rev);
+             cpu, patch->patch_id, sig->rev);
 
     return NEW_UCODE;
 }
 
 static bool match_cpu(const struct microcode_patch *patch)
 {
-    return patch && (microcode_fits(patch) == NEW_UCODE);
+    return patch && (microcode_fits(patch->mpb) == NEW_UCODE);
 }
 
 static void free_patch(struct microcode_patch *mc_amd)
@@ -223,14 +222,11 @@ static enum microcode_match_result compare_header(
 static enum microcode_match_result compare_patch(
     const struct microcode_patch *new, const struct microcode_patch *old)
 {
-    const struct microcode_header_amd *new_header = new->mpb;
-    const struct microcode_header_amd *old_header = old->mpb;
-
     /* Both patches to compare are supposed to be applicable to local CPU. */
-    ASSERT(microcode_fits(new) != MIS_UCODE);
-    ASSERT(microcode_fits(old) != MIS_UCODE);
+    ASSERT(microcode_fits(new->mpb) != MIS_UCODE);
+    ASSERT(microcode_fits(old->mpb) != MIS_UCODE);
 
-    return compare_header(new_header, old_header);
+    return compare_header(new->mpb, old->mpb);
 }
 
 static int apply_microcode(const struct microcode_patch *patch)
@@ -509,7 +505,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
          * If the new ucode covers current CPU, compare ucodes and store the
          * one with higher revision.
          */
-        if ( (microcode_fits(mc_amd) != MIS_UCODE) &&
+        if ( (microcode_fits(mc_amd->mpb) != MIS_UCODE) &&
              (!saved || (compare_header(mc_amd->mpb, saved) == NEW_UCODE)) )
         {
             xfree(saved);
-- 
2.11.0


