Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3FA195724
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:34:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHo6u-000639-Bc; Fri, 27 Mar 2020 12:29:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHo6s-00062j-JA
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:29:14 +0000
X-Inumbo-ID: 90fd4d1a-7026-11ea-92cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90fd4d1a-7026-11ea-92cf-bc764e2007e4;
 Fri, 27 Mar 2020 12:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585312153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HEbfsuxHnGsk48zaP0zHWQk3SdDz/jLLzcY8SW06DdQ=;
 b=QPs+YlxmNyrLf7l5yHApjB+lVvCbo1PB86WC2UJVvU6aIW9dJkb6wDEz
 dCEc0XF/578Jo8fP5XZa7Czh6F4MEmq+8kPHjWSI1lml5CxPVo7ZD9OQq
 qErYHhqSCNrpenK9zCwHvn4Umi2tqefQhcM6XHSQIEZ2CRaG9i4Ovjq+C A=;
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
IronPort-SDR: ksXZKSMHLH3qFb9MyR/bMKJ7u5uxjQ0bGOVUD1DyfcQdiZcsHnesytwK6NbkQJOq1npnDnDi+I
 dYG4KJaB1oMAq9MUzkNjSVu4M1BpZbZck6vwMiHWZg6KLptRYdC3Iek+CvsZ2XQhoGnPI6FWJB
 TQmxx2kTzfYamZA0dS3A0EGD1I+i3d63w0cTVjsONgTEQS3d8iS4LqBjrJjRAFG0xEcBYMm0JH
 yI+KEf8vfOAZYaJ2j4Xdc6c1hzVHjlbUE+FPLESp7Rz5/Yw6SMv/Cb2zyhCAQ4vUJc7GA/1dRQ
 8YY=
X-SBRS: 2.7
X-MesageID: 14735338
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="14735338"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 27 Mar 2020 12:29:01 +0000
Message-ID: <20200327122901.11569-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200327122901.11569-1-andrew.cooper3@citrix.com>
References: <20200327122901.11569-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v2 7/7] x86/ucode/intel: Fold structures together
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

With all the necessary cleanup now in place, fold struct
microcode_header_intel into struct microcode_patch and drop the struct
microcode_intel temporary ifdef-ary.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rebase over struct microcode_patch re-work
---
 xen/arch/x86/cpu/microcode/intel.c | 56 ++++++++++++++------------------------
 1 file changed, 20 insertions(+), 36 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 1358a25032..9a8ef62e2b 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -32,17 +32,12 @@
 
 #define pr_debug(x...) ((void)0)
 
-struct microcode_header_intel {
+struct microcode_patch {
     unsigned int hdrver;
     unsigned int rev;
-    union {
-        struct {
-            uint16_t year;
-            uint8_t day;
-            uint8_t month;
-        };
-        unsigned int date;
-    };
+    uint16_t year;
+    uint8_t  day;
+    uint8_t  month;
     unsigned int sig;
     unsigned int cksum;
     unsigned int ldrver;
@@ -56,18 +51,11 @@ struct microcode_header_intel {
     unsigned int datasize;
     unsigned int totalsize;
     unsigned int reserved[3];
-};
-
-struct microcode_patch {
-    struct microcode_header_intel hdr;
 
     /* Microcode payload.  Format is propriety and encrypted. */
     uint8_t data[];
 };
 
-/* Temporary, until the microcode_* structure are disentangled. */
-#define microcode_intel microcode_patch
-
 /* microcode format is extended from prescott processors */
 struct extended_sigtable {
     unsigned int count;
@@ -81,16 +69,16 @@ struct extended_sigtable {
 };
 
 #define PPRO_UCODE_DATASIZE     2000
-#define MC_HEADER_SIZE          (sizeof(struct microcode_header_intel))
+#define MC_HEADER_SIZE          offsetof(struct microcode_patch, data)
 
 static uint32_t get_datasize(const struct microcode_patch *patch)
 {
-    return patch->hdr.datasize ?: PPRO_UCODE_DATASIZE;
+    return patch->datasize ?: PPRO_UCODE_DATASIZE;
 }
 
 static uint32_t get_totalsize(const struct microcode_patch *patch)
 {
-    return patch->hdr.totalsize ?: PPRO_UCODE_DATASIZE + MC_HEADER_SIZE;
+    return patch->totalsize ?: PPRO_UCODE_DATASIZE + MC_HEADER_SIZE;
 }
 
 /*
@@ -102,8 +90,8 @@ static uint32_t get_totalsize(const struct microcode_patch *patch)
 static const struct extended_sigtable *get_ext_sigtable(
     const struct microcode_patch *patch)
 {
-    if ( patch->hdr.totalsize > (MC_HEADER_SIZE + patch->hdr.datasize) )
-        return (const void *)&patch->data[patch->hdr.datasize];
+    if ( patch->totalsize > (MC_HEADER_SIZE + patch->datasize) )
+        return (const void *)&patch->data[patch->datasize];
 
     return NULL;
 }
@@ -224,7 +212,7 @@ static int microcode_sanity_check(const struct microcode_patch *patch)
      * Checksum each indiviudal extended signature as if it had been in the
      * main header.
      */
-    sum = patch->hdr.sig + patch->hdr.pf + patch->hdr.cksum;
+    sum = patch->sig + patch->pf + patch->cksum;
     for ( i = 0; i < ext->count; ++i )
         if ( sum != (ext->sigs[i].sig + ext->sigs[i].pf + ext->sigs[i].cksum) )
         {
@@ -246,7 +234,7 @@ static enum microcode_match_result microcode_update_match(
     ASSERT(!microcode_sanity_check(mc));
 
     /* Check the main microcode signature. */
-    if ( signature_matches(cpu_sig, mc->hdr.sig, mc->hdr.pf) )
+    if ( signature_matches(cpu_sig, mc->sig, mc->pf) )
         goto found;
 
     /* If there is an extended signature table, check each of them. */
@@ -258,7 +246,7 @@ static enum microcode_match_result microcode_update_match(
     return MIS_UCODE;
 
  found:
-    return mc->hdr.rev > cpu_sig->rev ? NEW_UCODE : OLD_UCODE;
+    return mc->rev > cpu_sig->rev ? NEW_UCODE : OLD_UCODE;
 }
 
 static bool match_cpu(const struct microcode_patch *patch)
@@ -284,7 +272,7 @@ static enum microcode_match_result compare_patch(
     ASSERT(microcode_update_match(old) != MIS_UCODE);
     ASSERT(microcode_update_match(new) != MIS_UCODE);
 
-    return (new->hdr.rev > old->hdr.rev) ? NEW_UCODE : OLD_UCODE;
+    return new->rev > old->rev ? NEW_UCODE : OLD_UCODE;
 }
 
 static int apply_microcode(const struct microcode_patch *patch)
@@ -292,7 +280,6 @@ static int apply_microcode(const struct microcode_patch *patch)
     uint64_t msr_content;
     unsigned int cpu = smp_processor_id();
     struct cpu_signature *sig = &this_cpu(cpu_sig);
-    const struct microcode_intel *mc_intel;
     uint32_t rev, old_rev = sig->rev;
 
     if ( !patch )
@@ -301,12 +288,10 @@ static int apply_microcode(const struct microcode_patch *patch)
     if ( !match_cpu(patch) )
         return -EINVAL;
 
-    mc_intel = patch;
-
     BUG_ON(local_irq_is_enabled());
 
     /* write microcode via MSR 0x79 */
-    wrmsrl(MSR_IA32_UCODE_WRITE, (unsigned long)mc_intel->data);
+    wrmsrl(MSR_IA32_UCODE_WRITE, (unsigned long)patch->data);
     wrmsrl(MSR_IA32_UCODE_REV, 0x0ULL);
 
     /* As documented in the SDM: Do a CPUID 1 here */
@@ -316,18 +301,17 @@ static int apply_microcode(const struct microcode_patch *patch)
     rdmsrl(MSR_IA32_UCODE_REV, msr_content);
     sig->rev = rev = msr_content >> 32;
 
-    if ( rev != mc_intel->hdr.rev )
+    if ( rev != patch->rev )
     {
         printk(XENLOG_ERR
                "microcode: CPU%u update rev %#x to %#x failed, result %#x\n",
-               cpu, old_rev, mc_intel->hdr.rev, rev);
+               cpu, old_rev, patch->rev, rev);
         return -EIO;
     }
 
     printk(XENLOG_WARNING
            "microcode: CPU%u updated from revision %#x to %#x, date = %04x-%02x-%02x\n",
-           cpu, old_rev, rev, mc_intel->hdr.year,
-           mc_intel->hdr.month, mc_intel->hdr.day);
+           cpu, old_rev, rev, patch->year, patch->month, patch->day);
 
     return 0;
 }
@@ -345,8 +329,8 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
         unsigned int blob_size;
 
         if ( size < MC_HEADER_SIZE ||       /* Insufficient space for header? */
-             (mc = buf)->hdr.hdrver != 1 || /* Unrecognised header version?   */
-             mc->hdr.ldrver != 1 ||         /* Unrecognised loader version?   */
+             (mc = buf)->hdrver != 1 ||     /* Unrecognised header version?   */
+             mc->ldrver != 1 ||             /* Unrecognised loader version?   */
              size < (blob_size =            /* Insufficient space for patch?  */
                      get_totalsize(mc)) )
         {
@@ -364,7 +348,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
          * one with higher revision.
          */
         if ( (microcode_update_match(mc) != MIS_UCODE) &&
-             (!saved || (mc->hdr.rev > saved->hdr.rev)) )
+             (!saved || (mc->rev > saved->rev)) )
             saved = mc;
 
         buf  += blob_size;
-- 
2.11.0


