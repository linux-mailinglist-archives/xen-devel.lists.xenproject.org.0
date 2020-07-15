Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295E8220A6C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:48:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvexT-0002e1-Tx; Wed, 15 Jul 2020 10:48:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvexS-0002dr-Qi
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:48:14 +0000
X-Inumbo-ID: aeb598fe-c688-11ea-93b7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aeb598fe-c688-11ea-93b7-12813bfff9fa;
 Wed, 15 Jul 2020 10:48:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 90D91ADC2;
 Wed, 15 Jul 2020 10:48:16 +0000 (UTC)
Subject: [PATCH 1/4] x86: replace __ASM_{CL,ST}AC
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
Message-ID: <fc8e042e-fef8-ac38-34d8-16b13e4b0135@suse.com>
Date: Wed, 15 Jul 2020 12:48:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
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

Introduce proper assembler macros instead, enabled only when the
assembler itself doesn't support the insns. To avoid duplicating the
macros for assembly and C files, have them processed into asm-macros.h.
This in turn requires adding a multiple inclusion guard when generating
that header.

No change to generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -235,7 +235,10 @@ $(BASEDIR)/include/asm-x86/asm-macros.h:
 	echo '#if 0' >$@.new
 	echo '.if 0' >>$@.new
 	echo '#endif' >>$@.new
+	echo '#ifndef __ASM_MACROS_H__' >>$@.new
+	echo '#define __ASM_MACROS_H__' >>$@.new
 	echo 'asm ( ".include \"$@\"" );' >>$@.new
+	echo '#endif /* __ASM_MACROS_H__ */' >>$@.new
 	echo '#if 0' >>$@.new
 	echo '.endif' >>$@.new
 	cat $< >>$@.new
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -20,6 +20,7 @@ $(call as-option-add,CFLAGS,CC,"rdrand %
 $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
 $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
 $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
+$(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)
 $(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
 $(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1",-DHAVE_AS_QUOTED_SYM)
 $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$$(comma)%rax",-DHAVE_AS_INVPCID)
--- a/xen/arch/x86/asm-macros.c
+++ b/xen/arch/x86/asm-macros.c
@@ -1 +1,2 @@
+#include <asm/asm-defns.h>
 #include <asm/alternative-asm.h>
--- /dev/null
+++ b/xen/include/asm-x86/asm-defns.h
@@ -0,0 +1,9 @@
+#ifndef HAVE_AS_CLAC_STAC
+.macro clac
+    .byte 0x0f, 0x01, 0xca
+.endm
+
+.macro stac
+    .byte 0x0f, 0x01, 0xcb
+.endm
+#endif
--- a/xen/include/asm-x86/asm_defns.h
+++ b/xen/include/asm-x86/asm_defns.h
@@ -13,10 +13,12 @@
 #include <asm/alternative.h>
 
 #ifdef __ASSEMBLY__
+#include <asm/asm-defns.h>
 #ifndef CONFIG_INDIRECT_THUNK
 .equ CONFIG_INDIRECT_THUNK, 0
 #endif
 #else
+#include <asm/asm-macros.h>
 asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
       __stringify(IS_ENABLED(CONFIG_INDIRECT_THUNK)) );
 #endif
@@ -200,34 +202,27 @@ register unsigned long current_stack_poi
 
 #endif
 
-/* "Raw" instruction opcodes */
-#define __ASM_CLAC      ".byte 0x0f,0x01,0xca"
-#define __ASM_STAC      ".byte 0x0f,0x01,0xcb"
-
 #ifdef __ASSEMBLY__
 .macro ASM_STAC
-    ALTERNATIVE "", __ASM_STAC, X86_FEATURE_XEN_SMAP
+    ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
 .endm
 .macro ASM_CLAC
-    ALTERNATIVE "", __ASM_CLAC, X86_FEATURE_XEN_SMAP
+    ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
 .endm
 #else
 static always_inline void clac(void)
 {
     /* Note: a barrier is implicit in alternative() */
-    alternative("", __ASM_CLAC, X86_FEATURE_XEN_SMAP);
+    alternative("", "clac", X86_FEATURE_XEN_SMAP);
 }
 
 static always_inline void stac(void)
 {
     /* Note: a barrier is implicit in alternative() */
-    alternative("", __ASM_STAC, X86_FEATURE_XEN_SMAP);
+    alternative("", "stac", X86_FEATURE_XEN_SMAP);
 }
 #endif
 
-#undef __ASM_STAC
-#undef __ASM_CLAC
-
 #ifdef __ASSEMBLY__
 .macro SAVE_ALL op, compat=0
 .ifeqs "\op", "CLAC"


