Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59A07D72EB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 20:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623150.970686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qviHD-0006a4-AW; Wed, 25 Oct 2023 18:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623150.970686; Wed, 25 Oct 2023 18:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qviHD-0006Xi-7t; Wed, 25 Oct 2023 18:06:43 +0000
Received: by outflank-mailman (input) for mailman id 623150;
 Wed, 25 Oct 2023 18:06:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWkD=GH=citrix.com=prvs=6553ec402=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qviHC-0006Xc-A8
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 18:06:42 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d48b757-7361-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 20:06:39 +0200 (CEST)
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
X-Inumbo-ID: 3d48b757-7361-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698257199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dhzaHuLiBOH3Th4mbBAgfvjFhVkx5Tp4CfMsMBCY6ic=;
  b=eGCEhPSghhUvJgUkhrC06qJpZ7jZqZPprikUrHpjWq9jxJTLkQ/Y3V69
   ykux8jjWeQ4YbPmPKd601tJQc1MG/u7i6a9sztiQiaRtqAvzL12IUiRum
   V99oy2kZ9R1Q7BDkCZl4HZAWyVlA3b3kNpv2WxDun8juEg2OpzI2Nq0ze
   E=;
X-CSE-ConnectionGUID: rPmFhqRFQHKpTSN13c+maA==
X-CSE-MsgGUID: gmw5g9YcQEWLi4TS+rOTEg==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 126508414
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:XqcrjKJbvsrrWwVfFE+R45UlxSXFcZb7ZxGr2PjKsXjdYENSgTUOm
 jMWDGCOaKnYZGT1eN8jO4Sx8ExSvcKHytNhGVFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gZjPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5tOWRg9
 eUiBgktTQi/vMTvm7n4T+BF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGspM0yojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQG5gNzhrB+
 goq+Uz2Bw5HO42uwgOozVat2tP03jncZK8dQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebSc22
 1GAmdSvHiBmurCRTXOb95+dqD/0Mi8QRUcSaCkFRE0f6tbiqY06jRXSZt9mHOi+ididJN3r6
 2nU9m5k3exV1JNakfrjlbzav96yjoLxSyA1/z/5Z0KG9j9CQtf+bM+t4HGOuJ6sM72lokm9U
 GkswpbPvLpWUcDcykRhU81XQuv1uazt3Cn0xA43Rcd8rVxB7lb5JehtDCdCyFCF2yruURTue
 kbX8ThJ/p5VM2DCgURfONnpVJ1CIUQND73YuhHogjlmOMEZmPevpn0GWKJp9zmFfLIQua8+I
 4yHVs2nEGwXD69qpBLvGbZNiOBxnH1vnjOOLXwe8/hB+eDADJJyYe5YWGZik8hjtP/UyOkr2
 4032zS2J+V3D7SlP3i/HX87JlEWN3krba3LRzhsXrfbeGJOQTh9Y8I9NJt9I+SJaYwJzLaXl
 px8M2cEoGfCaYrvdlXTNC05Oe2+NXu9xFpiVRER0Z+T8yBLSe6SAG03LsBfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:3fn7D68xjamoZFQbgw9uk+D8I+orL9Y04lQ7vn2ZKCYlEPBw8v
 rFoB11726WtN98YgBZpTmgAtjmfZq/z+8P3WERVY3SJTUO0VHAROoD0WKL+Vzd8kbFh4pgPM
 lbAs1D4R7LYWSST/yW3OB1KbkdKaK8gcaVbC7loUtFSQFvZ+V+4xxiCgCde3cGPjV7OQ==
X-Talos-CUID: 9a23:8Lb5BmBvXv8Xs9b6EzNf8WAUA/oLS13+1EvrBRbjAiVsQZTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AYAuH8Q619+Zt1u/O6fspuh4Lxoxn5rvzBxE8mqw?=
 =?us-ascii?q?rhO2FaRBLeC26sBm4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,250,1694750400"; 
   d="scan'208";a="126508414"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [PATCH 1/2] x86/ucode: Move vendor specifics back out of early_microcode_init()
Date: Wed, 25 Oct 2023 19:06:29 +0100
Message-ID: <20231025180630.3230010-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231025180630.3230010-1-andrew.cooper3@citrix.com>
References: <20231025180630.3230010-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I know it was me who dropped microcode_init_{intel,amd}() in c/s
dd5f07997f29 ("x86/ucode: Rationalise startup and family/model checks"), but
times have moved on.  We've gained new conditional support, and a wish to
compile-time specialise Xen to single platform.

(Re)introduce ucode_probe_{amd,intel}() and move the recent vendor specific
additions back out.  Encode the conditional support state in the NULL-ness of
hooks as it's already done on other paths.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>

CC Stefano/Xenia as I know you want to go down this line, but I don't recall
patches in this area yet.
---
 xen/arch/x86/cpu/microcode/amd.c     | 10 +++++++++-
 xen/arch/x86/cpu/microcode/core.c    | 16 +++++-----------
 xen/arch/x86/cpu/microcode/intel.c   | 12 ++++++++++--
 xen/arch/x86/cpu/microcode/private.h | 16 ++++++++++------
 4 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 75fc84e445ce..17e68697d5bf 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -434,9 +434,17 @@ static struct microcode_patch *cf_check cpu_request_microcode(
     return patch;
 }
 
-const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
+static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
     .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
     .apply_microcode                  = apply_microcode,
     .compare_patch                    = compare_patch,
 };
+
+void __init ucode_probe_amd(struct microcode_ops *ops)
+{
+    if ( boot_cpu_data.x86 < 0x10 )
+        return;
+
+    *ops = amd_ucode_ops;
+}
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 65ebeb50deea..09575b19d6dc 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -847,25 +847,19 @@ int __init early_microcode_init(unsigned long *module_map,
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
-    bool can_load = false;
 
     switch ( c->x86_vendor )
     {
     case X86_VENDOR_AMD:
-        if ( c->x86 >= 0x10 )
-        {
-            ucode_ops = amd_ucode_ops;
-            can_load = true;
-        }
+        ucode_probe_amd(&ucode_ops);
         break;
 
     case X86_VENDOR_INTEL:
-        ucode_ops = intel_ucode_ops;
-        can_load = intel_can_load_microcode();
+        ucode_probe_intel(&ucode_ops);
         break;
     }
 
-    if ( !ucode_ops.apply_microcode )
+    if ( !ucode_ops.collect_cpu_info )
     {
         printk(XENLOG_INFO "Microcode loading not available\n");
         return -ENODEV;
@@ -882,10 +876,10 @@ int __init early_microcode_init(unsigned long *module_map,
      *
      * Take the hint in either case and ignore the microcode interface.
      */
-    if ( this_cpu(cpu_sig).rev == ~0 || !can_load )
+    if ( !ucode_ops.apply_microcode || this_cpu(cpu_sig).rev == ~0 )
     {
         printk(XENLOG_INFO "Microcode loading disabled due to: %s\n",
-               can_load ? "rev = ~0" : "HW toggle");
+               ucode_ops.apply_microcode ? "HW toggle" : "rev = ~0");
         ucode_ops.apply_microcode = NULL;
         return -ENODEV;
     }
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 060c529a6e5d..96f34b336b21 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -385,7 +385,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
     return patch;
 }
 
-bool __init intel_can_load_microcode(void)
+static bool __init can_load_microcode(void)
 {
     uint64_t mcu_ctrl;
 
@@ -398,9 +398,17 @@ bool __init intel_can_load_microcode(void)
     return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
 }
 
-const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
+static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
     .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
     .apply_microcode                  = apply_microcode,
     .compare_patch                    = compare_patch,
 };
+
+void __init ucode_probe_intel(struct microcode_ops *ops)
+{
+    *ops = intel_ucode_ops;
+
+    if ( !can_load_microcode() )
+        ops->apply_microcode = NULL;
+}
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index d80787205a5e..b58611e908aa 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -60,13 +60,17 @@ struct microcode_ops {
         const struct microcode_patch *new, const struct microcode_patch *old);
 };
 
-/**
- * Checks whether we can perform microcode updates on this Intel system
+/*
+ * Microcode loading falls into one of 3 states.
+ *   - No support at all
+ *   - Read-only (locked by firmware, or we're virtualised)
+ *   - Loading available
  *
- * @return True iff the microcode update facilities are enabled
+ * These are encoded by (not) filling in ops->collect_cpu_info (i.e. no
+ * support available) and (not) ops->apply_microcode (i.e. read only).
+ * Otherwise, all hooks must be filled in.
  */
-bool intel_can_load_microcode(void);
-
-extern const struct microcode_ops amd_ucode_ops, intel_ucode_ops;
+void ucode_probe_amd(struct microcode_ops *ops);
+void ucode_probe_intel(struct microcode_ops *ops);
 
 #endif /* ASM_X86_MICROCODE_PRIVATE_H */
-- 
2.30.2


