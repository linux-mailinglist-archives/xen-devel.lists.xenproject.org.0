Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A9319571B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:31:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHo6s-00062W-2t; Fri, 27 Mar 2020 12:29:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHo6q-00062R-DV
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:29:12 +0000
X-Inumbo-ID: 8fc40588-7026-11ea-8967-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fc40588-7026-11ea-8967-12813bfff9fa;
 Fri, 27 Mar 2020 12:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585312151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F4zG2oS/V65anzLwMJhTAh9CXPgXHH8XLalce+FjePw=;
 b=KN420yusu1xzthHcujXFBdLHV6ux1TTPCZZvmpEN1+msZgWhBx718uf2
 W+YZwqMWO5J/jfi2eSSgGI6dEKbkXbqJ/88pP0ZMhl88gUMNqVxgSCd78
 gvb7wv97msViwiMrUs8LuBXGW0ew+/PVlDtIaA/n42WqcZwm1a+XYbPEs Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cuN6gleoL2Ot3hA/q1ktS/2KJxPDeAUjxshhH3CM9nNRU9eQGhkTdgB5qPpQH19wWQK1UP3xsQ
 Vxe7ahwdmL/J52Dq2vxZT/LodVYDNcLNzJk0cYDxP0zIVU4MfFEyNQixvLVXU4oKJx9M3bcWCO
 S2rhgfMa6sc8V1Lnyxegur11Jl+o+qTbWjoKD9CF0bRD65gUuV6wMAIK/UlUIBEQS1M8vEqzMv
 tUNLyARkxbwoK6O13mdawPfURtIcU7ZS4WWIVIrMVvqGJWSmISXGNZSx0j4zvG/w0swpuA4T/4
 TLw=
X-SBRS: 2.7
X-MesageID: 14735335
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="14735335"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 27 Mar 2020 12:28:56 +0000
Message-ID: <20200327122901.11569-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200327122901.11569-1-andrew.cooper3@citrix.com>
References: <20200327122901.11569-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v2 2/7] x86/ucode/intel: Adjust
 microcode_sanity_check() to not take void *
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
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

microcode_sanity_check()'s callers actually call it with a mixture of
microcode_intel(/patch) and microcode_header_intel pointers, which is fragile.

Rework it to take struct microcode_patch *, which in turn requires
microcode_update_match()'s type to be altered.

No functional change - compiled binary is identical.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rebase over struct microcode_patch re-work
---
 xen/arch/x86/cpu/microcode/intel.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index a69f7fe1de..77539a00be 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -118,9 +118,9 @@ static int collect_cpu_info(struct cpu_signature *csig)
     return 0;
 }
 
-static int microcode_sanity_check(const void *mc)
+static int microcode_sanity_check(const struct microcode_patch *mc)
 {
-    const struct microcode_header_intel *mc_header = mc;
+    const struct microcode_header_intel *mc_header = &mc->hdr;
     const struct extended_sigtable *ext_header = NULL;
     const struct extended_signature *ext_sig;
     unsigned long total_size, data_size, ext_table_size;
@@ -152,7 +152,7 @@ static int microcode_sanity_check(const void *mc)
                    "Small exttable size in microcode data file\n");
             return -EINVAL;
         }
-        ext_header = mc + MC_HEADER_SIZE + data_size;
+        ext_header = (void *)mc + MC_HEADER_SIZE + data_size;
         if ( ext_table_size != exttable_size(ext_header) )
         {
             printk(KERN_ERR "microcode: error! "
@@ -210,8 +210,9 @@ static int microcode_sanity_check(const void *mc)
 
 /* Check an update against the CPU signature and current update revision */
 static enum microcode_match_result microcode_update_match(
-    const struct microcode_header_intel *mc_header)
+    const struct microcode_patch *mc)
 {
+    const struct microcode_header_intel *mc_header = &mc->hdr;
     const struct extended_sigtable *ext_header;
     const struct extended_signature *ext_sig;
     unsigned int i;
@@ -222,7 +223,7 @@ static enum microcode_match_result microcode_update_match(
     unsigned long data_size = get_datasize(mc_header);
     const void *end = (const void *)mc_header + get_totalsize(mc_header);
 
-    ASSERT(!microcode_sanity_check(mc_header));
+    ASSERT(!microcode_sanity_check(mc));
     if ( sigmatch(sig, mc_header->sig, pf, mc_header->pf) )
         return (mc_header->rev > rev) ? NEW_UCODE : OLD_UCODE;
 
@@ -248,7 +249,7 @@ static bool match_cpu(const struct microcode_patch *patch)
     if ( !patch )
         return false;
 
-    return microcode_update_match(&patch->hdr) == NEW_UCODE;
+    return microcode_update_match(patch) == NEW_UCODE;
 }
 
 static void free_patch(struct microcode_patch *patch)
@@ -263,8 +264,8 @@ static enum microcode_match_result compare_patch(
      * Both patches to compare are supposed to be applicable to local CPU.
      * Just compare the revision number.
      */
-    ASSERT(microcode_update_match(&old->hdr) != MIS_UCODE);
-    ASSERT(microcode_update_match(&new->hdr) != MIS_UCODE);
+    ASSERT(microcode_update_match(old) != MIS_UCODE);
+    ASSERT(microcode_update_match(new) != MIS_UCODE);
 
     return (new->hdr.rev > old->hdr.rev) ? NEW_UCODE : OLD_UCODE;
 }
@@ -361,7 +362,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
          * If the new update covers current CPU, compare updates and store the
          * one with higher revision.
          */
-        if ( (microcode_update_match(&mc->hdr) != MIS_UCODE) &&
+        if ( (microcode_update_match(mc) != MIS_UCODE) &&
              (!saved || (mc->hdr.rev > saved->hdr.rev)) )
         {
             xfree(saved);
-- 
2.11.0


