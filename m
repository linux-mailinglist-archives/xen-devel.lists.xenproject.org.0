Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC0B19571C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:31:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHo72-00067W-Cw; Fri, 27 Mar 2020 12:29:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHo70-00066f-Dx
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:29:22 +0000
X-Inumbo-ID: 91045498-7026-11ea-8967-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91045498-7026-11ea-8967-12813bfff9fa;
 Fri, 27 Mar 2020 12:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585312153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aOQlUyj0aHx/bC1hdUa1DyVAALcQFcK4rNJnckPxhno=;
 b=AxQql6ybB0bcOGdFP/4owGQNUpoE/iuy7/4igOwMfmwhT/iKS47AFcNp
 Yx+ZF82dT8hQxPX1FyqzscNFn94ELQzjz7OCBKDiWSponnXlzV8MtXg2p
 pKBV0231ZkMHZbHZv9z6bSD2vkk7e5PABN3z4OKsodCeUE6l9Hu9MsG3p U=;
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
IronPort-SDR: txWd3qG08+z9TMDWOqNjmwOpNBCaT0IVXOHX6HNNim0xuU9KhHIUb62BTJlLnYflWD5n5PAWh8
 eCp2sZ/jxASzmfA8FVy1HLSj0niEZXJ/ApP/yamh6x5A2OVD5tmKR+73QR0eYWmZhh8l6SOYVr
 hQf4En2f3UV3zy6E6O2rD4N4oM+N5DKKS6FGAx+D6afnXL7amzff5nVyoXEEWpg73f9tBDZr4W
 AOd/SjUArUzkPl9KtSU2UVY1MUln7/rYhbSpcRLMuecca0rdg5Xu+XRqHzJES69kXfGsAsKvTV
 61c=
X-SBRS: 2.7
X-MesageID: 14735337
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="14735337"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 27 Mar 2020 12:28:59 +0000
Message-ID: <20200327122901.11569-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200327122901.11569-1-andrew.cooper3@citrix.com>
References: <20200327122901.11569-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v2 5/7] x86/ucode/intel: Clean up
 microcode_update_match()
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

Implement a new get_ext_sigtable() helper to abstract the logic for
identifying whether an extended signature table exists.  As part of this,
rename microcode_intel.bits to data and change its type so it can be usefully
used in combination with the datasize header field.

Also, replace the sigmatch() macro with a static inline with a more useful
API, and an explanation of why it is safe to drop one of the previous
conditionals.

No practical change in behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rebase over struct microcode_patch re-work
 * Fix maches => matches typo
 * Retain constness on cast through void *
---
 xen/arch/x86/cpu/microcode/intel.c | 77 +++++++++++++++++++++++++-------------
 1 file changed, 51 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index be2f4871dc..9d8d5bfc6e 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -60,7 +60,9 @@ struct microcode_header_intel {
 
 struct microcode_patch {
     struct microcode_header_intel hdr;
-    unsigned int bits[0];
+
+    /* Microcode payload.  Format is propriety and encrypted. */
+    uint8_t data[];
 };
 
 /* Temporary, until the microcode_* structure are disentangled. */
@@ -96,8 +98,41 @@ static uint32_t get_totalsize(const struct microcode_patch *patch)
     return patch->hdr.totalsize ?: PPRO_UCODE_DATASIZE + MC_HEADER_SIZE;
 }
 
-#define sigmatch(s1, s2, p1, p2) \
-        (((s1) == (s2)) && (((p1) & (p2)) || (((p1) == 0) && ((p2) == 0))))
+/*
+ * A piece of microcode has an extended signature table if there is space
+ * between the end of data[] and the total size.  (This logic also works
+ * appropriately for Pentium Pro/II microcode, which has 0 for both size
+ * fields, and no extended signature table.)
+ */
+static const struct extended_sigtable *get_ext_sigtable(
+    const struct microcode_patch *patch)
+{
+    if ( patch->hdr.totalsize > (MC_HEADER_SIZE + patch->hdr.datasize) )
+        return (const void *)&patch->data[patch->hdr.datasize];
+
+    return NULL;
+}
+
+/*
+ * A piece of microcode is applicable for a CPU if:
+ *  1) the signatures (CPUID.1.EAX - Family/Model/Stepping) match, and
+ *  2) The Platform Flags bitmap intersect.
+ *
+ * A CPU will have a single Platform Flag bit, while the microcode may be
+ * common to multiple platforms and have multiple bits set.
+ *
+ * Note: The Pentium Pro/II microcode didn't use platform flags, and should
+ * treat 0 as a match.  However, Xen being 64bit means that the CPU signature
+ * won't match, allowing us to simplify the logic.
+ */
+static bool signature_matches(const struct cpu_signature *cpu_sig,
+                              unsigned int ucode_sig, unsigned int ucode_pf)
+{
+    if ( cpu_sig->sig != ucode_sig )
+        return false;
+
+    return cpu_sig->pf & ucode_pf;
+}
 
 #define exttable_size(et) ((et)->count * EXT_SIGNATURE_SIZE + EXT_HEADER_SIZE)
 
@@ -219,36 +254,26 @@ static int microcode_sanity_check(const struct microcode_patch *mc)
 static enum microcode_match_result microcode_update_match(
     const struct microcode_patch *mc)
 {
-    const struct microcode_header_intel *mc_header = &mc->hdr;
-    const struct extended_sigtable *ext_header;
-    const struct extended_signature *ext_sig;
+    const struct extended_sigtable *ext;
     unsigned int i;
     struct cpu_signature *cpu_sig = &this_cpu(cpu_sig);
-    unsigned int sig = cpu_sig->sig;
-    unsigned int pf = cpu_sig->pf;
-    unsigned int rev = cpu_sig->rev;
-    unsigned long data_size = get_datasize(mc);
-    const void *end = (const void *)mc_header + get_totalsize(mc);
 
     ASSERT(!microcode_sanity_check(mc));
-    if ( sigmatch(sig, mc_header->sig, pf, mc_header->pf) )
-        return (mc_header->rev > rev) ? NEW_UCODE : OLD_UCODE;
 
-    ext_header = (const void *)(mc_header + 1) + data_size;
-    ext_sig = (const void *)(ext_header + 1);
+    /* Check the main microcode signature. */
+    if ( signature_matches(cpu_sig, mc->hdr.sig, mc->hdr.pf) )
+        goto found;
 
-    /*
-     * Make sure there is enough space to hold an extended header and enough
-     * array elements.
-     */
-    if ( end <= (const void *)ext_sig )
-        return MIS_UCODE;
-
-    for ( i = 0; i < ext_header->count; i++ )
-        if ( sigmatch(sig, ext_sig[i].sig, pf, ext_sig[i].pf) )
-            return (mc_header->rev > rev) ? NEW_UCODE : OLD_UCODE;
+    /* If there is an extended signature table, check each of them. */
+    if ( (ext = get_ext_sigtable(mc)) != NULL )
+        for ( i = 0; i < ext->count; ++i )
+            if ( signature_matches(cpu_sig, ext->sigs[i].sig, ext->sigs[i].pf) )
+                goto found;
 
     return MIS_UCODE;
+
+ found:
+    return mc->hdr.rev > cpu_sig->rev ? NEW_UCODE : OLD_UCODE;
 }
 
 static bool match_cpu(const struct microcode_patch *patch)
@@ -296,7 +321,7 @@ static int apply_microcode(const struct microcode_patch *patch)
     BUG_ON(local_irq_is_enabled());
 
     /* write microcode via MSR 0x79 */
-    wrmsrl(MSR_IA32_UCODE_WRITE, (unsigned long)mc_intel->bits);
+    wrmsrl(MSR_IA32_UCODE_WRITE, (unsigned long)mc_intel->data);
     wrmsrl(MSR_IA32_UCODE_REV, 0x0ULL);
 
     /* As documented in the SDM: Do a CPUID 1 here */
-- 
2.11.0


