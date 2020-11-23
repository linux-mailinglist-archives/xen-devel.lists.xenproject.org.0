Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F972C0A7F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34320.65278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khC7q-0001W5-K0; Mon, 23 Nov 2020 13:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34320.65278; Mon, 23 Nov 2020 13:43:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khC7q-0001Vf-Go; Mon, 23 Nov 2020 13:43:26 +0000
Received: by outflank-mailman (input) for mailman id 34320;
 Mon, 23 Nov 2020 13:43:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khC7p-0001Va-8E
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:43:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6fc5328-1d54-4315-bc9f-f5c811249af7;
 Mon, 23 Nov 2020 13:43:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B0CDAD09;
 Mon, 23 Nov 2020 13:43:23 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khC7p-0001Va-8E
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:43:25 +0000
X-Inumbo-ID: d6fc5328-1d54-4315-bc9f-f5c811249af7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d6fc5328-1d54-4315-bc9f-f5c811249af7;
	Mon, 23 Nov 2020 13:43:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606139003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AnKusbjZAyoMSt2heKF01++irq1SZLWnDVB4dzApjOw=;
	b=qj1tBgwOGrrzSoQ4Xejg5QdkYCx8Hj35SUlSaCzaxAWGSpvl3n+7Peb7H9JNvSsJWGxYgZ
	4E++k2jQEnxLgumyQ8xC7M5i2EBu59oJODssZIWUi8EBQlMxL+9/U/uxeXle/wfm9DRwKU
	cz1ltrXZ8/ZFVL50lNtpypKDf8CIEzc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8B0CDAD09;
	Mon, 23 Nov 2020 13:43:23 +0000 (UTC)
Subject: [PATCH v3 1/7] x86: replace __ASM_{CL,ST}AC
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8e7d1472-dd37-8ed3-ec2f-ce954ea61dfd@suse.com>
Message-ID: <b48024f5-47c6-ed82-2201-e99dcf4ef8db@suse.com>
Date: Mon, 23 Nov 2020 14:43:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8e7d1472-dd37-8ed3-ec2f-ce954ea61dfd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Introduce proper assembler macros instead, enabled only when the
assembler itself doesn't support the insns. To avoid duplicating the
macros for assembly and C files, have them processed into asm-macros.h.
This in turn requires adding a multiple inclusion guard when generating
that header.

No change to generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -243,7 +243,10 @@ $(BASEDIR)/include/asm-x86/asm-macros.h:
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


