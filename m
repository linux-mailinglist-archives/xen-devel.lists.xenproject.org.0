Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B9219934D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:19:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDxO-0007hy-KV; Tue, 31 Mar 2020 10:17:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJDxM-0007hr-JC
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:17:16 +0000
X-Inumbo-ID: cad688fc-7338-11ea-ba0b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cad688fc-7338-11ea-ba0b-12813bfff9fa;
 Tue, 31 Mar 2020 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585649835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=po0tW7uYDH8rZz1U6gCOAIBxov8htGafpY4XtbrzTHE=;
 b=DjPTqiOaOVD3eGFfaco9wXFG+fm+rb9cO/HBqoNQQfEHkPcrvimL112T
 khZocXLbQTUiAbCacF0aax/T9s7Ji0/dLdaunEV9OWbPwwZNS34Sr4Txg
 w/n9is/T2gj/7kUHIVOW9qyAn7qCI40z+bhVMSOsUz6wGvwZ+2tucxOz0 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yNroz7WDlU8XkXziXCuI82iaFPJ9aazBSU4hJsTJd2qhNs6I7t+KIYf9184EYwmJ4fzLn5QrZM
 SVeL9ag0ODI1G2m82A7MDtAjDPn4Lbop4WPpWwjm4DrTxEmsr+K1Z9h0/ftK2Tr+eVWMLopE9G
 9KCHOluLYnhFDbwpplH3cuUUGjLUgPLcTwOMBOn1ir3BC8Uy0+DD0V0tm0VpLKz9YZYJwcbFr1
 snW6o5Qu1S4VW4OjSsGsNpd1yyQUaV58t/V0nF8y45UbbOsUWgh4NoERB0CUnZT/C1bxC6HtbJ
 RAs=
X-SBRS: 2.7
X-MesageID: 14930467
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="14930467"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 10/11] x86/ucode/amd: Fold structures together
Date: Tue, 31 Mar 2020 11:05:30 +0100
Message-ID: <20200331100531.4294-11-andrew.cooper3@citrix.com>
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

With all the necessary cleanup now in place, fold struct microcode_header_amd
into struct microcode_patch and drop the struct microcode_amd temporary
ifdef-ary.

This removes the memory allocation of struct microcode_amd which is a single
pointer to a separately allocated object, and therefore a waste.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 70 ++++++++++++----------------------------
 1 file changed, 20 insertions(+), 50 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index ae1276988f..f9c50b43bf 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -37,7 +37,7 @@ struct __packed equiv_cpu_entry {
     uint16_t reserved;
 };
 
-struct __packed microcode_header_amd {
+struct microcode_patch {
     uint32_t data_code;
     uint32_t patch_id;
     uint8_t  mc_patch_data_id[2];
@@ -58,13 +58,6 @@ struct __packed microcode_header_amd {
 #define UCODE_EQUIV_CPU_TABLE_TYPE 0x00000000
 #define UCODE_UCODE_TYPE           0x00000001
 
-struct microcode_patch {
-    struct microcode_header_amd *mpb;
-};
-
-/* Temporary, until the microcode_* structure are disentangled. */
-#define microcode_amd microcode_patch
-
 struct mpbhdr {
     uint32_t type;
     uint32_t len;
@@ -73,7 +66,7 @@ struct mpbhdr {
 struct container_microcode {
     uint32_t type; /* UCODE_UCODE_TYPE */
     uint32_t len;
-    struct microcode_header_amd patch[];
+    struct microcode_patch patch[];
 };
 
 /*
@@ -178,7 +171,7 @@ static bool check_final_patch_levels(const struct cpu_signature *sig)
 }
 
 static enum microcode_match_result microcode_fits(
-    const struct microcode_header_amd *patch)
+    const struct microcode_patch *patch)
 {
     unsigned int cpu = smp_processor_id();
     const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
@@ -201,37 +194,31 @@ static enum microcode_match_result microcode_fits(
 
 static bool match_cpu(const struct microcode_patch *patch)
 {
-    return patch && (microcode_fits(patch->mpb) == NEW_UCODE);
+    return patch && (microcode_fits(patch) == NEW_UCODE);
 }
 
-static void free_patch(struct microcode_patch *mc_amd)
+static void free_patch(struct microcode_patch *patch)
 {
-    if ( mc_amd )
-    {
-        xfree(mc_amd->mpb);
-        xfree(mc_amd);
-    }
+    xfree(patch);
 }
 
 static enum microcode_match_result compare_header(
-    const struct microcode_header_amd *new_header,
-    const struct microcode_header_amd *old_header)
+    const struct microcode_patch *new, const struct microcode_patch *old)
 {
-    if ( new_header->processor_rev_id == old_header->processor_rev_id )
-        return (new_header->patch_id > old_header->patch_id) ? NEW_UCODE
-                                                             : OLD_UCODE;
+    if ( new->processor_rev_id != old->processor_rev_id )
+        return MIS_UCODE;
 
-    return MIS_UCODE;
+    return new->patch_id > old->patch_id ? NEW_UCODE : OLD_UCODE;
 }
 
 static enum microcode_match_result compare_patch(
     const struct microcode_patch *new, const struct microcode_patch *old)
 {
     /* Both patches to compare are supposed to be applicable to local CPU. */
-    ASSERT(microcode_fits(new->mpb) != MIS_UCODE);
-    ASSERT(microcode_fits(old->mpb) != MIS_UCODE);
+    ASSERT(microcode_fits(new) != MIS_UCODE);
+    ASSERT(microcode_fits(old) != MIS_UCODE);
 
-    return compare_header(new->mpb, old->mpb);
+    return compare_header(new, old);
 }
 
 static int apply_microcode(const struct microcode_patch *patch)
@@ -239,7 +226,6 @@ static int apply_microcode(const struct microcode_patch *patch)
     int hw_err;
     unsigned int cpu = smp_processor_id();
     struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
-    const struct microcode_header_amd *hdr;
     uint32_t rev, old_rev = sig->rev;
 
     if ( !patch )
@@ -256,9 +242,7 @@ static int apply_microcode(const struct microcode_patch *patch)
         return -ENXIO;
     }
 
-    hdr = patch->mpb;
-
-    hw_err = wrmsr_safe(MSR_AMD_PATCHLOADER, (unsigned long)hdr);
+    hw_err = wrmsr_safe(MSR_AMD_PATCHLOADER, (unsigned long)patch);
 
     /* get patch id after patching */
     rdmsrl(MSR_AMD_PATCHLEVEL, rev);
@@ -268,14 +252,14 @@ static int apply_microcode(const struct microcode_patch *patch)
      * Some processors leave the ucode blob mapping as UC after the update.
      * Flush the mapping to regain normal cacheability.
      */
-    flush_area_local(hdr, FLUSH_TLB_GLOBAL | FLUSH_ORDER(0));
+    flush_area_local(patch, FLUSH_TLB_GLOBAL | FLUSH_ORDER(0));
 
     /* check current patch id and patch's id for match */
-    if ( hw_err || (rev != hdr->patch_id) )
+    if ( hw_err || (rev != patch->patch_id) )
     {
         printk(XENLOG_ERR
                "microcode: CPU%u update rev %#x to %#x failed, result %#x\n",
-               cpu, old_rev, hdr->patch_id, rev);
+               cpu, old_rev, patch->patch_id, rev);
         return -EIO;
     }
 
@@ -388,8 +372,7 @@ static int container_fast_forward(const void *data, size_t size_left, size_t *of
 
 static struct microcode_patch *cpu_request_microcode(const void *buf, size_t size)
 {
-    struct microcode_amd *mc_amd;
-    const struct microcode_header_amd *saved = NULL;
+    const struct microcode_patch *saved = NULL;
     struct microcode_patch *patch = NULL;
     size_t offset = 0, saved_size = 0;
     int error = 0;
@@ -404,14 +387,6 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
         goto out;
     }
 
-    mc_amd = xzalloc(struct microcode_amd);
-    if ( !mc_amd )
-    {
-        printk(KERN_ERR "microcode: Cannot allocate memory for microcode patch\n");
-        error = -ENOMEM;
-        goto out;
-    }
-
     /*
      * Multiple container file support:
      * 1. check if this container file has equiv_cpu_id match
@@ -448,7 +423,6 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
         if ( error == -ENODATA )
             error = 0;
 
-        xfree(mc_amd);
         goto out;
     }
 
@@ -499,14 +473,10 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
 
     if ( saved )
     {
-        mc_amd->mpb = xmemdup_bytes(saved, saved_size);
-        if ( mc_amd->mpb )
-            patch = mc_amd;
-        else
+        patch = xmemdup_bytes(saved, saved_size);
+        if ( !patch )
             error = -ENOMEM;
     }
-    else
-        free_patch(mc_amd);
 
   out:
     if ( error && !patch )
-- 
2.11.0


