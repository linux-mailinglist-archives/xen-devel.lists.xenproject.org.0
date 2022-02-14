Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068924B50D4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271582.466108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJaua-0002cz-CO; Mon, 14 Feb 2022 12:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271582.466108; Mon, 14 Feb 2022 12:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJaua-0002VQ-0D; Mon, 14 Feb 2022 12:57:00 +0000
Received: by outflank-mailman (input) for mailman id 271582;
 Mon, 14 Feb 2022 12:56:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJauX-0001Wb-TY
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:56:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d0a77e-8d95-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 13:56:53 +0100 (CET)
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
X-Inumbo-ID: 94d0a77e-8d95-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U8FygIZVnvkagn5SaOc/r5k4iytMZOKvEHIjccC32Fg=;
  b=h0AUi6fL7zG25IqviVsZhv5zC6fIfjuxDQLYJFmcn4XLtItYBEylGxc+
   oH1ZWatyh0/axATCQDxRKaAOYf0cqN91VsGHRnd6eJUKtkblbal2PN0A5
   VcU5LZoZIdsgWj6Mh8Zffob5D17tsAj+UhdOkWDSjXEJhSdhoulA8r9b8
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ZV+Ox5Zu+D9haf/k3fZ44Be3lA/AUjNxxo1S/Znou5buCxV+gy0mqqM7EzOP5Npj5EkWwsIgAM
 5qzHzyVPnRR0+2ySGTOYhmoIGLvqdvFCXDQIjC7OQW91sewoHBsvO4tW/4oftNVjuN9vBPeSaj
 r4/4S8UMfPgbuZfHnk3WWUyHz5zHScqpXlI5IdnK0O3XGmsE+mNaI5XleBRJ5xduAj+hnz72xa
 F4DTPgbvnL7+YDFmZGgDxIbCgfGRXfd4M+x73LUXGAQZD97GpNK0UNMQgI6k2HanGew/ZtSpYP
 JyGmfHVrhsQhQg1dVhFpYRh+
X-SBRS: 5.1
X-MesageID: 66373621
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GUkoEK34GQKaIx6DofbD5ex2kn2cJEfYwER7XKvMYLTBsI5bp2BRy
 GMcW2GDO62DZmHyeNpxO9/gpEsGscXTm4JrTAs5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhz/Fcz
 vdNt4GMGCgtPbXFp88jbkAHDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u2JsRRqiEP
 qL1bxJRQR6QWwEMHW00N61ngOuZnV6gU2dH/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalk49dtxyE+8n1FCizqnM6jmyOFVdESEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdTNi2+AswGzARN8wGGxFAfpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxpyHzLd0NuGglfi+F1/ronhezP
 ifuVf55vscPbBNGk4crC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6ENJGPiatM5TWuBF0y8kXY
 M7DGe71VCpyIfk3nVKeGrZGuZd2l39W+I8mbc2ip/hR+eHFPyD9pHZsGAbmU93VG4va/FSLo
 44HbZPiJtc2eLSWXxQ7OLU7dTgiRUXXz7ivwyCOXuLccAdgBk87DPrdneEod4B/xvwHnebU5
 HCtHERfzQOn13HALAyLbFFlaa/uAskj/S5qY3R0MAb6wWUnbKau8LwbK8k9c444+bEx1vVzV
 fQEJZmNW6wdVjTd9j0BRpDht4g+Jg+zjAeDMnP9MjgydpJtXSLT/drgcle9/SUCFHPv58A/v
 6ehxkXQRp9aH1ZuC8PfafSOyVKtvCdCxLIuDhWQetQKIRfi6olnLSD1n8QbGcBUJEWR3Cae2
 iaXHQwc+bvHrbgq/YSbnquDtYqoTbdzRxIIA2nB4L+qHiDG5W7/k5RYWeOFcD2BBmP5/KKuO
 bdcw/3maaBVmV9Lt8x3EqpxzLJ47Nzq/ucIwgNhFXTNTlKqFrI/fSXWgZgR7vVAlu1DpA+7e
 kOT4d0La7yGNfTsHEMVOAd4PP+I0usZm2WK4Pk4SKkgCPSbIFZTvZ1uAiSx
IronPort-HdrOrdr: A9a23:GYGrrKCY9De2a3blHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="66373621"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 6/7] x86/ucode: Use altcall, and __initconst_cf_clobber
Date: Mon, 14 Feb 2022 12:56:31 +0000
Message-ID: <20220214125632.24563-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125632.24563-1-andrew.cooper3@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Microcode loading is not a fastpath, but there are control flow integrity
hardening benefits from using altcall, because it allows us to clobber the
endbr64 instructions on all function pointer targets.

Convert the existing microcode_ops pointer into an __ro_after_init structure,
and move {amd,intel}_ucode_ops into __initconst_cf_clobber.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Adjust commit message.
 * Use __initconst_cf_clobber and __ro_after_init.
---
 xen/arch/x86/cpu/microcode/amd.c   |  2 +-
 xen/arch/x86/cpu/microcode/core.c  | 38 ++++++++++++++++++++------------------
 xen/arch/x86/cpu/microcode/intel.c |  2 +-
 3 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 0afa2192bf1d..8195707ee149 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -422,7 +422,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
     return patch;
 }
 
-const struct microcode_ops amd_ucode_ops = {
+const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
     .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
     .apply_microcode                  = apply_microcode,
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index f84dafa82693..452a7ca77340 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -21,6 +21,7 @@
  * 2 of the License, or (at your option) any later version.
  */
 
+#include <xen/alternative-call.h>
 #include <xen/cpu.h>
 #include <xen/earlycpio.h>
 #include <xen/err.h>
@@ -214,7 +215,7 @@ void __init microcode_grab_module(
         microcode_scan_module(module_map, mbi);
 }
 
-static const struct microcode_ops __read_mostly *microcode_ops;
+static struct microcode_ops __ro_after_init ucode_ops;
 
 static DEFINE_SPINLOCK(microcode_mutex);
 
@@ -241,9 +242,9 @@ static const struct microcode_patch *nmi_patch = ZERO_BLOCK_PTR;
  */
 static struct microcode_patch *parse_blob(const char *buf, size_t len)
 {
-    microcode_ops->collect_cpu_info();
+    alternative_vcall(ucode_ops.collect_cpu_info);
 
-    return microcode_ops->cpu_request_microcode(buf, len);
+    return alternative_call(ucode_ops.cpu_request_microcode, buf, len);
 }
 
 static void microcode_free_patch(struct microcode_patch *patch)
@@ -258,8 +259,8 @@ static bool microcode_update_cache(struct microcode_patch *patch)
 
     if ( !microcode_cache )
         microcode_cache = patch;
-    else if ( microcode_ops->compare_patch(patch,
-                                           microcode_cache) == NEW_UCODE )
+    else if ( alternative_call(ucode_ops.compare_patch,
+                               patch, microcode_cache) == NEW_UCODE )
     {
         microcode_free_patch(microcode_cache);
         microcode_cache = patch;
@@ -311,14 +312,14 @@ static int microcode_update_cpu(const struct microcode_patch *patch)
 {
     int err;
 
-    microcode_ops->collect_cpu_info();
+    alternative_vcall(ucode_ops.collect_cpu_info);
 
     spin_lock(&microcode_mutex);
     if ( patch )
-        err = microcode_ops->apply_microcode(patch);
+        err = alternative_call(ucode_ops.apply_microcode, patch);
     else if ( microcode_cache )
     {
-        err = microcode_ops->apply_microcode(microcode_cache);
+        err = alternative_call(ucode_ops.apply_microcode, microcode_cache);
         if ( err == -EIO )
         {
             microcode_free_patch(microcode_cache);
@@ -368,7 +369,7 @@ static int primary_thread_work(const struct microcode_patch *patch)
     if ( !wait_for_state(LOADING_ENTER) )
         return -EBUSY;
 
-    ret = microcode_ops->apply_microcode(patch);
+    ret = alternative_call(ucode_ops.apply_microcode, patch);
     if ( !ret )
         atomic_inc(&cpu_updated);
     atomic_inc(&cpu_out);
@@ -481,7 +482,7 @@ static int control_thread_fn(const struct microcode_patch *patch)
     }
 
     /* Control thread loads ucode first while others are in NMI handler. */
-    ret = microcode_ops->apply_microcode(patch);
+    ret = alternative_call(ucode_ops.apply_microcode, patch);
     if ( !ret )
         atomic_inc(&cpu_updated);
     atomic_inc(&cpu_out);
@@ -610,7 +611,8 @@ static long cf_check microcode_update_helper(void *data)
      */
     spin_lock(&microcode_mutex);
     if ( microcode_cache &&
-         microcode_ops->compare_patch(patch, microcode_cache) != NEW_UCODE )
+         alternative_call(ucode_ops.compare_patch,
+                          patch, microcode_cache) != NEW_UCODE )
     {
         spin_unlock(&microcode_mutex);
         printk(XENLOG_WARNING "microcode: couldn't find any newer revision "
@@ -678,7 +680,7 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
     if ( len != (uint32_t)len )
         return -E2BIG;
 
-    if ( microcode_ops == NULL )
+    if ( !ucode_ops.apply_microcode )
         return -EINVAL;
 
     buffer = xmalloc_flex_struct(struct ucode_buf, buffer, len);
@@ -722,10 +724,10 @@ __initcall(microcode_init);
 /* Load a cached update to current cpu */
 int microcode_update_one(void)
 {
-    if ( !microcode_ops )
+    if ( !ucode_ops.apply_microcode )
         return -EOPNOTSUPP;
 
-    microcode_ops->collect_cpu_info();
+    alternative_vcall(ucode_ops.collect_cpu_info);
 
     return microcode_update_cpu(NULL);
 }
@@ -780,22 +782,22 @@ int __init early_microcode_init(void)
     {
     case X86_VENDOR_AMD:
         if ( c->x86 >= 0x10 )
-            microcode_ops = &amd_ucode_ops;
+            ucode_ops = amd_ucode_ops;
         break;
 
     case X86_VENDOR_INTEL:
         if ( c->x86 >= 6 )
-            microcode_ops = &intel_ucode_ops;
+            ucode_ops = intel_ucode_ops;
         break;
     }
 
-    if ( !microcode_ops )
+    if ( !ucode_ops.apply_microcode )
     {
         printk(XENLOG_WARNING "Microcode loading not available\n");
         return -ENODEV;
     }
 
-    microcode_ops->collect_cpu_info();
+    alternative_vcall(ucode_ops.collect_cpu_info);
 
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index d3864b5ab03e..f5ba6d76d724 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -376,7 +376,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
     return patch;
 }
 
-const struct microcode_ops intel_ucode_ops = {
+const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
     .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
     .apply_microcode                  = apply_microcode,
-- 
2.11.0


