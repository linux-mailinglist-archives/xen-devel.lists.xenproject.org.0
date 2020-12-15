Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102A42DB0FD
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:11:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54386.94457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCvR-0001Aw-S7; Tue, 15 Dec 2020 16:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54386.94457; Tue, 15 Dec 2020 16:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCvR-0001AX-Op; Tue, 15 Dec 2020 16:11:45 +0000
Received: by outflank-mailman (input) for mailman id 54386;
 Tue, 15 Dec 2020 16:11:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpCvQ-0001AR-FR
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:11:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd129208-05c3-4fc6-b402-75b9d3a05474;
 Tue, 15 Dec 2020 16:11:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A67B5ACE0;
 Tue, 15 Dec 2020 16:11:42 +0000 (UTC)
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
X-Inumbo-ID: bd129208-05c3-4fc6-b402-75b9d3a05474
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608048702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S96oFG2zQFoWVyvd6bLhm9V+gi64IB8HfqT2iVAsePg=;
	b=nVg7Liwi5fbMsuWKylUhb8KgG/I5InmeJBVd3GRBpzO5sqNwxzSy9Mod9t0EhwDMddhE+P
	CfTFRuQW7AyRjcUFfFy7uZZWt/CvWW6J9nPd38UXs5MOupL+4n5tDP9cRpTMH4s3nmh1dw
	GEbNViEil7/It/K3gXvwzh5ROdy0ECI=
Subject: [PATCH v2 1/4] x86: verify function type (and maybe attribute) in
 switch_stack_and_jump()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
Message-ID: <792c442d-c05a-7a00-c807-b94a54bca94f@suse.com>
Date: Tue, 15 Dec 2020 17:11:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It is imperative that the functions passed here are taking no arguments,
return no values, and don't return in the first place. While the type
can be checked uniformly, the attribute check is limited to gcc 9 and
newer (no clang support for this so far afaict).

Note that I didn't want to have the "true" fallback "implementation" of
__builtin_has_attribute(..., __noreturn__) generally available, as
"true" may not be a suitable fallback in other cases.

Note further that the noreturn addition to startup_cpu_idle_loop()'s
declaration requires adding unreachable() to Arm's
switch_stack_and_jump(), or else the build would break. I suppose this
should have been there already.

For vmx_asm_do_vmentry() along with adding the attribute, also restrict
its scope.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v2: Fix Arm build.

--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -63,7 +63,7 @@
 #include <asm/monitor.h>
 #include <asm/xstate.h>
 
-void svm_asm_do_resume(void);
+void noreturn svm_asm_do_resume(void);
 
 u32 svm_feature_flags;
 
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1850,6 +1850,8 @@ void vmx_vmentry_failure(void)
     domain_crash(curr->domain);
 }
 
+void noreturn vmx_asm_do_vmentry(void);
+
 void vmx_do_resume(void)
 {
     struct vcpu *v = current;
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -619,7 +619,7 @@ static inline bool using_2M_mapping(void
            !l1_table_offset((unsigned long)__2M_rwdata_end);
 }
 
-static void noinline init_done(void)
+static void noreturn init_done(void)
 {
     void *va;
     unsigned long start, end;
--- a/xen/include/asm-arm/current.h
+++ b/xen/include/asm-arm/current.h
@@ -43,8 +43,10 @@ static inline struct cpu_info *get_cpu_i
 
 #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
 
-#define switch_stack_and_jump(stack, fn)                                \
-    asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) : "memory" )
+#define switch_stack_and_jump(stack, fn) do {                           \
+    asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) : "memory" ); \
+    unreachable();                                                      \
+} while ( false )
 
 #define reset_stack_and_jump(fn) switch_stack_and_jump(get_cpu_info(), fn)
 
--- a/xen/include/asm-x86/asm_defns.h
+++ b/xen/include/asm-x86/asm_defns.h
@@ -23,7 +23,7 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
 #include <asm/indirect_thunk_asm.h>
 
 #ifndef __ASSEMBLY__
-void ret_from_intr(void);
+void noreturn ret_from_intr(void);
 
 /*
  * This output constraint should be used for any inline asm which has a "call"
--- a/xen/include/asm-x86/current.h
+++ b/xen/include/asm-x86/current.h
@@ -155,9 +155,18 @@ unsigned long get_stack_dump_bottom (uns
 # define SHADOW_STACK_WORK ""
 #endif
 
+#if __GNUC__ >= 9
+# define ssaj_has_attr_noreturn(fn) __builtin_has_attribute(fn, __noreturn__)
+#else
+/* Simply can't check the property with older gcc. */
+# define ssaj_has_attr_noreturn(fn) true
+#endif
+
 #define switch_stack_and_jump(fn, instr, constr)                        \
     ({                                                                  \
         unsigned int tmp;                                               \
+        (void)((fn) == (void (*)(void))NULL);                           \
+        BUILD_BUG_ON(!ssaj_has_attr_noreturn(fn));                      \
         __asm__ __volatile__ (                                          \
             SHADOW_STACK_WORK                                           \
             "mov %[stk], %%rsp;"                                        \
--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -93,7 +93,6 @@ typedef enum {
 #define PI_xAPIC_NDST_MASK      0xFF00
 
 void vmx_asm_vmexit_handler(struct cpu_user_regs);
-void vmx_asm_do_vmentry(void);
 void vmx_intr_assist(void);
 void noreturn vmx_do_resume(void);
 void vmx_vlapic_msr_changed(struct vcpu *v);
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -736,7 +736,7 @@ void sched_context_switched(struct vcpu
 void continue_running(
     struct vcpu *same);
 
-void startup_cpu_idle_loop(void);
+void noreturn startup_cpu_idle_loop(void);
 extern void (*pm_idle) (void);
 extern void (*dead_idle) (void);
 


