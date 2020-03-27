Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86501195725
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:34:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHo6y-000659-V1; Fri, 27 Mar 2020 12:29:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHo6x-00064N-Io
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:29:19 +0000
X-Inumbo-ID: 9354cafc-7026-11ea-bec1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9354cafc-7026-11ea-bec1-bc764e2007e4;
 Fri, 27 Mar 2020 12:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585312157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CAp4SToMrf/GE3/7UI4jSUn/5KncxmCv5YaP04nxZRY=;
 b=YGry3Q5RNcEl12Ue1TFqbLNA57d7qDktTrfghf7/RILyP/pUXMt+09ng
 TG1Jj+fI5ltARIdAdnhaJ9aLlxICXlMLmqDXdDD9ttCDh3tqYg7zduDof
 X+Y63/yHMaK7z7gP6IhjRIHMQ+sbvl/nHnWUpIGFBlYsIgvjlv4t3fvc5 A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FGLA8j93lMo7VHCZ24D8CeNId4D11kcjIWQuZsQ2FhPmMJuTfJsuj1q75Eo2XOxcNZSQiebfS/
 oh+W7I7Ks6Wf7ewg0dRz4JRjU9Hnyk8emYGKKdcfXn2qY54Ry7+awlkdQf1xb2wlNaVRzNT3q4
 4F22pD+J+bS2OgJ7ISJMNFbtBxn5jrByivCL2lme4DJXglpQkrOBrHckV5Vf10y5IhbyyEgiM/
 IyyNTlNxjZjBQU7K4GO7sUFbAFEsjxQ2P6nMzNV+z3NJ8kelXww1TTe79RoMybtYYfOc9hqM0R
 kfo=
X-SBRS: 2.7
X-MesageID: 15405103
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="15405103"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 27 Mar 2020 12:28:58 +0000
Message-ID: <20200327122901.11569-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200327122901.11569-1-andrew.cooper3@citrix.com>
References: <20200327122901.11569-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v2 4/7] x86/ucode/intel: Reimplement get_{data,
 total}size() helpers
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

Every caller actually passes a struct microcode_header_intel *, but it is more
helpful to us longterm to take struct microcode_patch *.  Implement the
helpers with proper types, and leave a comment explaining the Pentium Pro/II
behaviour with empty {data,total}size fields.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rebase over struct microcode_patch re-work
 * Drop leading underscore
---
 xen/arch/x86/cpu/microcode/intel.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 2b48959573..be2f4871dc 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -46,6 +46,12 @@ struct microcode_header_intel {
     unsigned int sig;
     unsigned int cksum;
     unsigned int ldrver;
+
+    /*
+     * Microcode for the Pentium Pro and II had all further fields in the
+     * header reserved, had a fixed datasize of 2000 and totalsize of 2048,
+     * and didn't use platform flags despite the availability of the MSR.
+     */
     unsigned int pf;
     unsigned int datasize;
     unsigned int totalsize;
@@ -74,20 +80,21 @@ struct extended_sigtable {
     struct extended_signature sigs[0];
 };
 
-#define DEFAULT_UCODE_DATASIZE  (2000)
+#define PPRO_UCODE_DATASIZE     2000
 #define MC_HEADER_SIZE          (sizeof(struct microcode_header_intel))
-#define DEFAULT_UCODE_TOTALSIZE (DEFAULT_UCODE_DATASIZE + MC_HEADER_SIZE)
 #define EXT_HEADER_SIZE         (sizeof(struct extended_sigtable))
 #define EXT_SIGNATURE_SIZE      (sizeof(struct extended_signature))
 #define DWSIZE                  (sizeof(u32))
-#define get_totalsize(mc) \
-        (((struct microcode_intel *)mc)->hdr.totalsize ? \
-         ((struct microcode_intel *)mc)->hdr.totalsize : \
-         DEFAULT_UCODE_TOTALSIZE)
 
-#define get_datasize(mc) \
-        (((struct microcode_intel *)mc)->hdr.datasize ? \
-         ((struct microcode_intel *)mc)->hdr.datasize : DEFAULT_UCODE_DATASIZE)
+static uint32_t get_datasize(const struct microcode_patch *patch)
+{
+    return patch->hdr.datasize ?: PPRO_UCODE_DATASIZE;
+}
+
+static uint32_t get_totalsize(const struct microcode_patch *patch)
+{
+    return patch->hdr.totalsize ?: PPRO_UCODE_DATASIZE + MC_HEADER_SIZE;
+}
 
 #define sigmatch(s1, s2, p1, p2) \
         (((s1) == (s2)) && (((p1) & (p2)) || (((p1) == 0) && ((p2) == 0))))
@@ -127,8 +134,8 @@ static int microcode_sanity_check(const struct microcode_patch *mc)
     unsigned int ext_sigcount = 0, i;
     uint32_t sum, orig_sum;
 
-    total_size = get_totalsize(mc_header);
-    data_size = get_datasize(mc_header);
+    total_size = get_totalsize(mc);
+    data_size = get_datasize(mc);
     if ( (data_size + MC_HEADER_SIZE) > total_size )
     {
         printk(KERN_ERR "microcode: error! "
@@ -220,8 +227,8 @@ static enum microcode_match_result microcode_update_match(
     unsigned int sig = cpu_sig->sig;
     unsigned int pf = cpu_sig->pf;
     unsigned int rev = cpu_sig->rev;
-    unsigned long data_size = get_datasize(mc_header);
-    const void *end = (const void *)mc_header + get_totalsize(mc_header);
+    unsigned long data_size = get_datasize(mc);
+    const void *end = (const void *)mc_header + get_totalsize(mc);
 
     ASSERT(!microcode_sanity_check(mc));
     if ( sigmatch(sig, mc_header->sig, pf, mc_header->pf) )
@@ -331,7 +338,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
              (mc = buf)->hdr.hdrver != 1 || /* Unrecognised header version?   */
              mc->hdr.ldrver != 1 ||         /* Unrecognised loader version?   */
              size < (blob_size =            /* Insufficient space for patch?  */
-                     get_totalsize(&mc->hdr)) )
+                     get_totalsize(mc)) )
         {
             error = -EINVAL;
             printk(XENLOG_WARNING "microcode: Bad data in container\n");
@@ -356,7 +363,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
 
     if ( saved )
     {
-        patch = xmemdup_bytes(saved, get_totalsize(&saved->hdr));
+        patch = xmemdup_bytes(saved, get_totalsize(saved));
 
         if ( !patch )
             error = -ENOMEM;
-- 
2.11.0


