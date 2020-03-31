Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B0C199323
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:08:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDmC-0005l4-0c; Tue, 31 Mar 2020 10:05:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJDmA-0005ks-5q
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:05:42 +0000
X-Inumbo-ID: 2d0859e4-7337-11ea-9e09-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d0859e4-7337-11ea-9e09-bc764e2007e4;
 Tue, 31 Mar 2020 10:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585649141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YrG44H+CYGRviPo/ndiitW+LLJDRrPAH2vHY+mcBUIo=;
 b=fxXpXhkVxy6mVapHORamXW8GSTNu+S0cFVlzlo9JR8Ztfp1BM6jVYtZt
 dJfh1Fh+3UA+8OMhIvQghpjRkKFTDwIU0vyE30G0MFMD+jj6Tgs54ERev
 HHJjIikgH0ajpo3MUWlIllBV+yg2vmfekDoozwcAw7m956cJhZRfmz8Ee s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7FRmpTh4yVi1pDjh84ntX64i9zsagK/QT7mtQQin26D0N3Mo8o5NcnBTf40mIR0RGTwpGiAz2h
 lcptSO7lxgHheN3+sGIFYsK97yOaRJGaf/u30pUptZYPCN/OQKdaPRpUtT+cxmdjmSfyt9oXj1
 ca0KLClhQnxTndrqJIVYmqgSuf0R8u25Yq2aLbuVxQSBG+ZUA/oGI3fLztK6Yb4hhAx9QRjbb6
 qlEIjnK/hhI+Ne/jFzby6OCVa127qsYVr4imi2tyBvPL07ciGVrNjWLeZPPPwl9qUuYLvR1jPp
 BPI=
X-SBRS: 2.7
X-MesageID: 15137744
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15137744"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 02/11] x86/ucode/amd: Move check_final_patch_levels() to
 apply_microcode()
Date: Tue, 31 Mar 2020 11:05:22 +0100
Message-ID: <20200331100531.4294-3-andrew.cooper3@citrix.com>
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

The microcode revision of whichever CPU runs cpu_request_microcode() is not
necessarily applicable to other CPUs.

If the BIOS left us with asymmetric microcode, rejecting updates in
cpu_request_microcode() would prevent us levelling the system even if only up
to the final level.  Also, failing to cache microcode misses an opportunity to
get beyond the final level via the S3 path.

Move check_final_patch_levels() earlier and use it in apply_microcode().
Reword the error message to be more informative, and use -ENXIO as this corner
case has nothing to do with permissions.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 83 ++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 45 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 796745e928..4245dc13bb 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -119,6 +119,36 @@ static bool_t verify_patch_size(uint32_t patch_size)
     return (patch_size <= max_size);
 }
 
+static bool check_final_patch_levels(const struct cpu_signature *sig)
+{
+    /*
+     * The 'final_levels' of patch ids have been obtained empirically.
+     * Refer bug https://bugzilla.suse.com/show_bug.cgi?id=913996
+     * for details of the issue. The short version is that people
+     * using certain Fam10h systems noticed system hang issues when
+     * trying to update microcode levels beyond the patch IDs below.
+     * From internal discussions, we gathered that OS/hypervisor
+     * cannot reliably perform microcode updates beyond these levels
+     * due to hardware issues. Therefore, we need to abort microcode
+     * update process if we hit any of these levels.
+     */
+    static const unsigned int final_levels[] = {
+        0x01000098,
+        0x0100009f,
+        0x010000af,
+    };
+    unsigned int i;
+
+    if ( boot_cpu_data.x86 != 0x10 )
+        return false;
+
+    for ( i = 0; i < ARRAY_SIZE(final_levels); i++ )
+        if ( sig->rev == final_levels[i] )
+            return true;
+
+    return false;
+}
+
 static bool_t find_equiv_cpu_id(const struct equiv_cpu_entry *equiv_cpu_table,
                                 unsigned int current_cpu_id,
                                 unsigned int *equiv_cpu_id)
@@ -229,6 +259,14 @@ static int apply_microcode(const struct microcode_patch *patch)
     if ( !match_cpu(patch) )
         return -EINVAL;
 
+    if ( check_final_patch_levels(sig) )
+    {
+        printk(XENLOG_ERR
+               "microcode: CPU%u current rev %#x unsafe to update\n",
+               cpu, sig->rev);
+        return -ENXIO;
+    }
+
     hdr = patch->mpb;
 
     hw_err = wrmsr_safe(MSR_AMD_PATCHLOADER, (unsigned long)hdr);
@@ -374,43 +412,6 @@ static int container_fast_forward(const void *data, size_t size_left, size_t *of
     return 0;
 }
 
-/*
- * The 'final_levels' of patch ids have been obtained empirically.
- * Refer bug https://bugzilla.suse.com/show_bug.cgi?id=913996 
- * for details of the issue. The short version is that people
- * using certain Fam10h systems noticed system hang issues when
- * trying to update microcode levels beyond the patch IDs below.
- * From internal discussions, we gathered that OS/hypervisor
- * cannot reliably perform microcode updates beyond these levels
- * due to hardware issues. Therefore, we need to abort microcode
- * update process if we hit any of these levels.
- */
-static const unsigned int final_levels[] = {
-    0x01000098,
-    0x0100009f,
-    0x010000af
-};
-
-static bool_t check_final_patch_levels(unsigned int cpu)
-{
-    /*
-     * Check the current patch levels on the cpu. If they are equal to
-     * any of the 'final_levels', then we should not update the microcode
-     * patch on the cpu as system will hang otherwise.
-     */
-    const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
-    unsigned int i;
-
-    if ( boot_cpu_data.x86 != 0x10 )
-        return 0;
-
-    for ( i = 0; i < ARRAY_SIZE(final_levels); i++ )
-        if ( sig->rev == final_levels[i] )
-            return 1;
-
-    return 0;
-}
-
 static struct microcode_patch *cpu_request_microcode(const void *buf,
                                                      size_t bufsize)
 {
@@ -434,14 +435,6 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
         goto out;
     }
 
-    if ( check_final_patch_levels(cpu) )
-    {
-        printk(XENLOG_INFO
-               "microcode: Cannot update microcode patch on the cpu as we hit a final level\n");
-        error = -EPERM;
-        goto out;
-    }
-
     mc_amd = xzalloc(struct microcode_amd);
     if ( !mc_amd )
     {
-- 
2.11.0


