Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E193A1D7978
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 15:17:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jafda-0006nB-0M; Mon, 18 May 2020 13:16:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jafdY-0006my-PT
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 13:16:56 +0000
X-Inumbo-ID: d735db2e-9909-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d735db2e-9909-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 13:16:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8708DAE72;
 Mon, 18 May 2020 13:16:55 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: determine MXCSR mask in all cases
Message-ID: <687f8a71-5c5c-c95e-146d-8f38211e5e00@suse.com>
Date: Mon, 18 May 2020 15:16:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

For its use(s) by the emulator to be correct in all cases, the filling
of the variable needs to be independent of XSAVE availability. As
there's no suitable function in i387.c to put the logic in, keep it in
xstate_init(), arrange for the function to be called unconditionally,
and pull the logic ahead of all return paths there.

Fixes: 9a4496a35b20 ("x86emul: support {,V}{LD,ST}MXCSR")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -488,8 +488,7 @@ void identify_cpu(struct cpuinfo_x86 *c)
 
 	/* Now the feature flags better reflect actual CPU features! */
 
-	if ( cpu_has_xsave )
-		xstate_init(c);
+	xstate_init(c);
 
 #ifdef NOISY_CAPS
 	printk(KERN_DEBUG "CPU: After all inits, caps:");
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -588,6 +588,18 @@ void xstate_init(struct cpuinfo_x86 *c)
     u32 eax, ebx, ecx, edx;
     u64 feature_mask;
 
+    if ( bsp )
+    {
+        static typeof(current->arch.xsave_area->fpu_sse) __initdata ctxt;
+
+        asm ( "fxsave %0" : "=m" (ctxt) );
+        if ( ctxt.mxcsr_mask )
+            mxcsr_mask = ctxt.mxcsr_mask;
+    }
+
+    if ( !cpu_has_xsave )
+        return;
+
     if ( (bsp && !use_xsave) ||
          boot_cpu_data.cpuid_level < XSTATE_CPUID )
     {
@@ -611,8 +623,6 @@ void xstate_init(struct cpuinfo_x86 *c)
 
     if ( bsp )
     {
-        static typeof(current->arch.xsave_area->fpu_sse) __initdata ctxt;
-
         xfeature_mask = feature_mask;
         /*
          * xsave_cntxt_size is the max size required by enabled features.
@@ -621,10 +631,6 @@ void xstate_init(struct cpuinfo_x86 *c)
         xsave_cntxt_size = _xstate_ctxt_size(feature_mask);
         printk("xstate: size: %#x and states: %#"PRIx64"\n",
                xsave_cntxt_size, xfeature_mask);
-
-        asm ( "fxsave %0" : "=m" (ctxt) );
-        if ( ctxt.mxcsr_mask )
-            mxcsr_mask = ctxt.mxcsr_mask;
     }
     else
     {

