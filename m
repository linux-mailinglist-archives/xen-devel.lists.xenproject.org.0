Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BEE3682AD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115482.220348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZabX-0003kb-Gn; Thu, 22 Apr 2021 14:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115482.220348; Thu, 22 Apr 2021 14:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZabX-0003kC-Cx; Thu, 22 Apr 2021 14:46:55 +0000
Received: by outflank-mailman (input) for mailman id 115482;
 Thu, 22 Apr 2021 14:46:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZabW-0003k6-68
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:46:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d14ef3f0-857d-4ae3-a2c0-94599c164533;
 Thu, 22 Apr 2021 14:46:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E835FB19B;
 Thu, 22 Apr 2021 14:46:51 +0000 (UTC)
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
X-Inumbo-ID: d14ef3f0-857d-4ae3-a2c0-94599c164533
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619102812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=So2JgmrzhvB3sGCo9ejN1SRRrQtA5dudILEINyAz1T8=;
	b=YwDOqv4vy7B5IwVbyljw7TzZZEkZx+1jgHX8IhteJF5muTMLF8x3iSCFydCNY3pDzr991i
	BnnIGkf0TMMC/EIJukqT6PJLbWIskJWp/oCxMYmwTcF9IOQFO5KELXbpHvP2JdyC2cEevy
	Ku7iVdtwRwrtNm0Q0lIOTGJFP5Rkn7U=
Subject: [PATCH v3 06/22] x86/xstate: replace xsave_cntxt_size and drop
 XCNTXT_MASK
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <dbbc3092-8d32-64e9-b03c-1313ca378ba9@suse.com>
Date: Thu, 22 Apr 2021 16:46:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

XCNTXT_MASK is effectively embedded in recalculate_xstate(), and
xsave_cntxt_size was redundant with the host CPUID policy's
xstate.max_size field.

Use the host CPUID policy as input (requiring it to be calculated
earlier), thus allowing e.g. "cpuid=no-avx512f" to also result in
avoiding allocation of space for ZMM and mask register state.

Also drop a stale part of an adjacent comment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -20,9 +20,10 @@
 /*
  * Maximum size (in byte) of the XSAVE/XRSTOR save area required by all
  * the supported and enabled features on the processor, including the
- * XSAVE.HEADER. We only enable XCNTXT_MASK that we have known.
+ * XSAVE.HEADER. We only enable cpuid_policy_xcr0_max(&host_cpuid_policy).
+ * Note that this identifier should not be usable as an lvalue.
  */
-static u32 __read_mostly xsave_cntxt_size;
+#define xsave_cntxt_size (host_cpuid_policy.xstate.max_size | 0)
 
 /* A 64-bit bitmask of the XSAVE/XRSTOR features supported by processor. */
 u64 __read_mostly xfeature_mask;
@@ -575,8 +576,23 @@ static unsigned int _xstate_ctxt_size(u6
     ASSERT(ok);
     cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
     ASSERT(ebx <= ecx);
-    ok = set_xcr0(act_xcr0);
-    ASSERT(ok);
+
+    /*
+     * When called the very first time from xstate_init(), act_xcr0 (as read
+     * from per-CPU data) is still zero. xstate_init() wants this function to
+     * leave xfeature_mask in place, so avoid restoration in this case (which
+     * would fail anyway).
+     */
+    if ( act_xcr0 )
+    {
+        ok = set_xcr0(act_xcr0);
+        ASSERT(ok);
+    }
+    else
+    {
+        BUG_ON(!ok);
+        ASSERT(xcr0 == xfeature_mask);
+    }
 
     return ebx;
 }
@@ -648,42 +664,35 @@ void xstate_init(struct cpuinfo_x86 *c)
         return;
 
     if ( (bsp && !use_xsave) ||
-         boot_cpu_data.cpuid_level < XSTATE_CPUID )
+         c->cpuid_level < XSTATE_CPUID )
     {
         BUG_ON(!bsp);
         setup_clear_cpu_cap(X86_FEATURE_XSAVE);
         return;
     }
 
-    cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
-    feature_mask = (((u64)edx << 32) | eax) & XCNTXT_MASK;
-    BUG_ON(!valid_xcr0(feature_mask));
-    BUG_ON(!(feature_mask & X86_XCR0_SSE));
-
-    /*
-     * Set CR4_OSXSAVE and run "cpuid" to get xsave_cntxt_size.
-     */
-    set_in_cr4(X86_CR4_OSXSAVE);
-    if ( !set_xcr0(feature_mask) )
-        BUG();
-
     if ( bsp )
     {
+        feature_mask = cpuid_policy_xcr0_max(&host_cpuid_policy);
+        BUG_ON(!valid_xcr0(feature_mask));
+        BUG_ON(!(feature_mask & X86_XCR0_SSE));
+
         xfeature_mask = feature_mask;
-        /*
-         * xsave_cntxt_size is the max size required by enabled features.
-         * We know FP/SSE and YMM about eax, and nothing about edx at present.
-         */
-        xsave_cntxt_size = _xstate_ctxt_size(feature_mask);
+        /* xsave_cntxt_size is the max size required by enabled features. */
         printk("xstate: size: %#x and states: %#"PRIx64"\n",
-               xsave_cntxt_size, xfeature_mask);
-    }
-    else
-    {
-        BUG_ON(xfeature_mask != feature_mask);
-        BUG_ON(xsave_cntxt_size != _xstate_ctxt_size(feature_mask));
+               xsave_cntxt_size, feature_mask);
+
+        set_in_cr4(X86_CR4_OSXSAVE);
     }
 
+    cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
+    feature_mask = (((uint64_t)edx << 32) | eax) & xfeature_mask;
+    BUG_ON(xfeature_mask != feature_mask);
+
+    /* This has the side effect of set_xcr0(feature_mask). */
+    if ( xsave_cntxt_size != _xstate_ctxt_size(feature_mask) )
+        BUG();
+
     if ( setup_xstate_features(bsp) && bsp )
         BUG();
 }
--- a/xen/include/asm-x86/xstate.h
+++ b/xen/include/asm-x86/xstate.h
@@ -30,9 +30,6 @@ extern uint32_t mxcsr_mask;
 #define XSTATE_AREA_MIN_SIZE      (FXSAVE_SIZE + XSAVE_HDR_SIZE)
 
 #define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
-#define XCNTXT_MASK    (X86_XCR0_FP | X86_XCR0_SSE | X86_XCR0_YMM | \
-                        X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM | \
-                        XSTATE_NONLAZY)
 
 #define XSTATE_ALL     (~(1ULL << 63))
 #define XSTATE_NONLAZY (X86_XCR0_BNDREGS | X86_XCR0_BNDCSR | X86_XCR0_PKRU)


