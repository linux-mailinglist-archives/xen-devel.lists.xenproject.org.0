Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A27D89E3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 22:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623986.972358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw7Oc-0000CO-Jr; Thu, 26 Oct 2023 20:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623986.972358; Thu, 26 Oct 2023 20:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw7Oc-00009O-GB; Thu, 26 Oct 2023 20:56:02 +0000
Received: by outflank-mailman (input) for mailman id 623986;
 Thu, 26 Oct 2023 20:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MgGv=GI=citrix.com=prvs=656ff9716=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qw7Ob-00007h-2p
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 20:56:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e697067-7442-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 22:55:56 +0200 (CEST)
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
X-Inumbo-ID: 0e697067-7442-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698353756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cksUljEBpHI2dTr+Zw7DMLtraXv4rRT/FaMUALMhyu4=;
  b=JA3neJIBdFqviXXc81/hbfFh5fTGiKNeoBmF8RY9IJAlA29UwxjLCDo9
   Rx+OOMBRlTkYZXczRo9oEWpe1+TC9Ag9kGbSnxEUjWeah8KGp1b8Wwy1l
   rskk7pMC09hYJul4nYJa94yUytZjXeHZbPjbTP1leAjpfaypkLnNlHO0H
   c=;
X-CSE-ConnectionGUID: Plh2vhMCRN65Ck/vfG1nzw==
X-CSE-MsgGUID: XZ9OclyoSF24t+D23kVFhg==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 126012812
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:q1MO46sL8IulF2p9Xor1/hxRn+fnVGheMUV32f8akzHdYApBsoF/q
 tZmKTiBOf2JZWTzKNx3PIjn8h5V6sDWyt43SlQ/rSo2FC4X+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5QeEySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwEDQNNA6DosmM5uzmYeormMoMdc/5I9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkAefAhPYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 Dyepj6pW0ty2Nq3+QjU1Xmol+j0s3mnRME+Tua7yNBqjwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9/vyGTFhubuSD2mB/72ZqTezPyk9JGoOIyQDSGMt89TloYh1lBvAT99vGa2yk/X8HD22y
 DePxBXSnJ1K05RNjf/iuwma0nTz/vAlUzLZ+C3vWmL/8ANcT7SDOdGD6h/F49kZKpSGGwzpU
 Gc/pySO0AwfJcjTxXzXEbxRRuHBC+WtamOG3QA1d3U133H9oyT9INo4DCRWfh8BDyoSRdP+j
 KY/Uyt644VaODORdbV2ZY2qYyjB5fO7TYu8Phw4g8AnX3SQSONk1Hs3DaJo9zqx+HXAaIlmU
 XthTe6iDGwBFYNsxyesSuEW3NcDn35vlTiPGMqrkk//idJygUJ5rp9cbzOzgh0RtvvY8G05D
 f4DXyd19/mveLKnOXSGmWLiBVsLMWI6FfjLRz9/L4a+zv5dMDh5UZf5mOp5E6Q8xvg9qws91
 izkMqOu4AGk3iOvxMTjQi0LVY4Dqr4m9i9hZXF1bQ7xs5XhCK72hJoim1IMVeFP3IReITRcF
 ZHpp+3o7ixzdwn6
IronPort-HdrOrdr: A9a23:H97Zvqz7MyoV9JnvHlQeKrPwFb1zdoMgy1knxilNoH1uA7Wlfq
 WV9sjzuiWE7Qr5NEtQ++xofZPwIk80lqQV3WByB8bHYOCOggLBR72Kr7GD/9SKIVyYygcy79
 YHT0G8MrHN5JpB4PoSLDPWLz/o+re6zJw=
X-Talos-CUID: 9a23:kwD2U2FkkLXcwDHmqmJf8E5OBMAAWUf7kir7IAimB0kwTq+KHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AhEwBLA9hAXJNJhVgEop47/aQf/dasoOlDFEKqrt?=
 =?us-ascii?q?c59XHGXYrOAmzjDviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,254,1694750400"; 
   d="scan'208";a="126012812"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, Xenia Ragiadakou
	<xenia.ragiadakou@amd.com>
Subject: [PATCH v2 1/2] x86/ucode: Move vendor specifics back out of early_microcode_init()
Date: Thu, 26 Oct 2023 21:55:38 +0100
Message-ID: <20231026205539.3261811-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
References: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>

v2:
 * Undo unintentinal operand inversion in early_microcode_init()
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
index 65ebeb50deea..3fd1f516e042 100644
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
+               ucode_ops.apply_microcode ? "rev = ~0" : "HW toggle");
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


