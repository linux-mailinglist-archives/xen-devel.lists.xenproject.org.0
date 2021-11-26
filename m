Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3D445F64F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 22:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233493.405146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqigm-00075e-Hy; Fri, 26 Nov 2021 21:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233493.405146; Fri, 26 Nov 2021 21:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqigm-00072A-E7; Fri, 26 Nov 2021 21:23:24 +0000
Received: by outflank-mailman (input) for mailman id 233493;
 Fri, 26 Nov 2021 21:23:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqigl-0006mN-3W
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 21:23:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1306db17-4eff-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 22:23:20 +0100 (CET)
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
X-Inumbo-ID: 1306db17-4eff-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637961800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fdg/mal0fwHNsO6+Dyz+0vovVFgRt44ymW0H5zE+iIs=;
  b=QuQlqk2WusQo5uS57szMu5NjwWlzPNxstFBX+A8KktZZzNKr5TyWm+4r
   buCqNh7sR/dAddBcS+eRRl/D+IzHBvjgupDp2zWzZXzhXGqd0suJrQqTU
   1wZTEyP8Tq09PkR2wOrAmx7S0L+HxCtkEFSWBf/IDUvGalC9ZYnk/6Hz9
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: h1/aWimN67MANX8dI/ny8Aq8OE3NPwEhMzhRBnH8T2lpV2H6T67q25lTY7JgTxJukl2zU43JbD
 r1Xs1Ujjig8wHLDz8tN0YdkR1jWIPFKsfyaGCVQGlCmM4Ac8TYISx7Tq+xNv/baldYkrMBfemg
 z1k3TPd1T6LP5CIinhkmnMAiyELaDs6o7MOHk9K6g6dlnJvOjseZzaThX5nX/jnGkHwIJX7L6h
 OfYjTxfD+tN8UFBQVqDisI8+PcbNTeMuFITVYRqj746JGBEJsXS8ebXkowYYQ/+1gfQKzqKs2T
 2/SJU9suGVcH4zsNKw9Eln4I
X-SBRS: 5.1
X-MesageID: 58700057
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vjjqAalRGt7TdZlAd14Y66ro5gxMIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXC2+HPauCY2HxLtx3Pd6zpEsF6sLcytFmTAE/r3ozQiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Q22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Pppq76zGBgLBZCPquZMDxMAOGZnerITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKaBP
 5JBNGUHgBLoYUF+Z1cSEZkFzeap3jr2fCcDqk+Iqv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJ/N/MY61CS6JHpoDSbVzQOFhUGcZs54ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud14WtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0uTA3Dt4ade51q2VtW
 lBew6ByC8hUUPmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehw2Y5tdJGSzO
 hGM0e+02HO1FCHxBUOQS9jsY/nGMIC6TYi1PhwqRoYmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnWNrNNIcwlVdSNT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C8t6gKxOrO4
 F+nXUpUlAj2iXHdcF3YYXF/crL/G514qCtjbyArOF+p3VklYJqus/hDJ8dmI+F/+bwx1+NwQ
 tkEZ96EXqZFRAPY9mlPdpL6toFjKkim3FrcIyq/bTEjVJd8XAiVqMT8dw7i+XBWXCq6vMczu
 ZO60QbfTcZRTghuFp+OOvmu00mwrT4Wn+crBxnEJdxaeUPN9ol2KnOu0q9rcp9UcRian2mUz
 QebBxsctNLhmY5t/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkVsW4YpxF7FnkfA369f1/uIIyw1lGDPAbkixC6MmKX6DhJEduqpIz75fmA23R
 kPQpYUKZeTXYJvoQAwLOQ4oTuWfzvVFyDDd4MM8LFj++CIqrqGMVl9fPkXUhSFQRFev3FjJH
 Qv1VBYq1jGC
IronPort-HdrOrdr: A9a23:h40MzaBo4u9YGi7lHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58700057"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/4] x86/ucode: Use altcall, and __initdata_cf_clobber
Date: Fri, 26 Nov 2021 21:22:58 +0000
Message-ID: <20211126212258.7550-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126212258.7550-1-andrew.cooper3@citrix.com>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Microcode loading is not a fastpath, but there are control flow security
benefits from using altcall()'s hardening side effect.

Convert the existing microcode_ops pointer into a __read_mostly structure, and
move {amd,intel}_ucode_ops into __initdata_cf_clobber.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/microcode/amd.c     |  2 +-
 xen/arch/x86/cpu/microcode/core.c    | 38 +++++++++++++++++++-----------------
 xen/arch/x86/cpu/microcode/intel.c   |  2 +-
 xen/arch/x86/cpu/microcode/private.h |  2 +-
 4 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 0afa2192bf1d..27c8644ab8ba 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -422,7 +422,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
     return patch;
 }
 
-const struct microcode_ops amd_ucode_ops = {
+struct microcode_ops __initdata_cf_clobber amd_ucode_ops = {
     .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
     .apply_microcode                  = apply_microcode,
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index f84dafa82693..755f2dc9a1e5 100644
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
+static struct microcode_ops __read_mostly ucode_ops;
 
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
index d3864b5ab03e..89e91f7fd06b 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -376,7 +376,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
     return patch;
 }
 
-const struct microcode_ops intel_ucode_ops = {
+struct microcode_ops __initdata_cf_clobber intel_ucode_ops = {
     .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
     .apply_microcode                  = apply_microcode,
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index c085a1026847..4ee92a8fbaad 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -53,6 +53,6 @@ struct microcode_ops {
         const struct microcode_patch *new, const struct microcode_patch *old);
 };
 
-extern const struct microcode_ops amd_ucode_ops, intel_ucode_ops;
+extern struct microcode_ops amd_ucode_ops, intel_ucode_ops;
 
 #endif /* ASM_X86_MICROCODE_PRIVATE_H */
-- 
2.11.0


