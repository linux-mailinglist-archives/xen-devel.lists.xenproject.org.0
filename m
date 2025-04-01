Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00506A784A9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 00:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934829.1336418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzjzB-00006B-Mr; Tue, 01 Apr 2025 22:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934829.1336418; Tue, 01 Apr 2025 22:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzjzB-0008V1-JF; Tue, 01 Apr 2025 22:21:33 +0000
Received: by outflank-mailman (input) for mailman id 934829;
 Tue, 01 Apr 2025 22:21:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dnoa=WT=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzjz9-0008FS-QA
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 22:21:31 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a796039a-0f47-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 00:21:27 +0200 (CEST)
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
X-Inumbo-ID: a796039a-0f47-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743546086; x=1743805286;
	bh=wGLFy3lg3JRviggNqBY/N5aBkD4idjuoatHTIpS+RQo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=GDXBPipNoQ3DJ0l0y+eatHGuY1CMsFINkj5MTVjVbbNM5sSrJgtQqPgsdLqtV/CF/
	 PCbqHgRjsudI7ldhGc3VeqtmZgaO82sTWDOFgPY6wRA8WicgeQ+SyHLMujFijYVacp
	 CFI+1ONO3PjnExVAvcCPxswgvGzCWqX7rYKNfuPEPvLNA9RocpJp3a9EJm82+uJNxC
	 JC3GK2qADIwmJ3Ef9/jY2paE002sEmtJCz96q0gE5jyK5HFQTFSnDVngYhYF7laTD1
	 8BfnwYZlUDlVEU9Ma8u7CtAwh/QbG3Oe9FNGINPXyHmW1P6AVC26orGQZT4PVQcs06
	 Mrge/8C5uzxYw==
Date: Tue, 01 Apr 2025 22:21:18 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 1/5] x86/vmx: remove HAVE_AS_VMX
Message-ID: <20250401222105.79309-2-dmukhin@ford.com>
In-Reply-To: <20250401222105.79309-1-dmukhin@ford.com>
References: <20250401222105.79309-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 26fd564dcd77ad467d9ca23f9d6e27142ff338c9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Remove the workaround under HAVE_AS_VMX for older compilers, as
the minimally required GCC 5.1 / Binutils 2.25, and Clang 11
natively support the VMX instructions used in the hypervisor code.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/arch.mk                   |  3 +--
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 37 --------------------------
 2 files changed, 1 insertion(+), 39 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index cb47d72991..6e23d3c27c 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -10,7 +10,6 @@ CFLAGS +=3D -msoft-float
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
-$(call as-option-add,CFLAGS,CC,"vmcall",-DHAVE_AS_VMX)
 $(call as-option-add,CFLAGS,CC,"crc32 %eax$(comma)%eax",-DHAVE_AS_SSE4_2)
 $(call as-option-add,CFLAGS,CC,"invept (%rax)$(comma)%rax",-DHAVE_AS_EPT)
 $(call as-option-add,CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RDRAND)
@@ -24,7 +23,7 @@ $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$(comma)%ra=
x",-DHAVE_AS_INVPCID)
 $(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVD=
IR)
 $(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$(comma)%rax",-DHAVE_AS_ENQCM=
D)
=20
-# Check to see whether the assmbler supports the .nop directive.
+# Check to see whether the assembler supports the .nop directive.
 $(call as-option-add,CFLAGS,CC,\
     ".L1: .L2: .nops (.L2 - .L1)$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
=20
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/=
asm/hvm/vmx/vmx.h
index 843f8591b9..cfa04aa5a4 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -310,30 +310,18 @@ extern uint8_t posted_intr_vector;
 #define INVVPID_ALL_CONTEXT                     2
 #define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
=20
-#ifdef HAVE_AS_VMX
 # define GAS_VMX_OP(yes, no) yes
-#else
-# define GAS_VMX_OP(yes, no) no
-#endif
=20
 static always_inline void __vmptrld(u64 addr)
 {
     asm volatile (
-#ifdef HAVE_AS_VMX
                    "vmptrld %0\n"
-#else
-                   VMPTRLD_OPCODE MODRM_EAX_06
-#endif
                    /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
                    UNLIKELY_START(be, vmptrld)
                    _ASM_BUGFRAME_TEXT(0)
                    UNLIKELY_END_SECTION
                    :
-#ifdef HAVE_AS_VMX
                    : "m" (addr),
-#else
-                   : "a" (&addr),
-#endif
                      _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
                    : "memory");
 }
@@ -341,21 +329,13 @@ static always_inline void __vmptrld(u64 addr)
 static always_inline void __vmpclear(u64 addr)
 {
     asm volatile (
-#ifdef HAVE_AS_VMX
                    "vmclear %0\n"
-#else
-                   VMCLEAR_OPCODE MODRM_EAX_06
-#endif
                    /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
                    UNLIKELY_START(be, vmclear)
                    _ASM_BUGFRAME_TEXT(0)
                    UNLIKELY_END_SECTION
                    :
-#ifdef HAVE_AS_VMX
                    : "m" (addr),
-#else
-                   : "a" (&addr),
-#endif
                      _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
                    : "memory");
 }
@@ -363,22 +343,13 @@ static always_inline void __vmpclear(u64 addr)
 static always_inline void __vmread(unsigned long field, unsigned long *val=
ue)
 {
     asm volatile (
-#ifdef HAVE_AS_VMX
                    "vmread %1, %0\n\t"
-#else
-                   VMREAD_OPCODE MODRM_EAX_ECX
-#endif
                    /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
                    UNLIKELY_START(be, vmread)
                    _ASM_BUGFRAME_TEXT(0)
                    UNLIKELY_END_SECTION
-#ifdef HAVE_AS_VMX
                    : "=3Drm" (*value)
                    : "r" (field),
-#else
-                   : "=3Dc" (*value)
-                   : "a" (field),
-#endif
                      _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
         );
 }
@@ -386,21 +357,13 @@ static always_inline void __vmread(unsigned long fiel=
d, unsigned long *value)
 static always_inline void __vmwrite(unsigned long field, unsigned long val=
ue)
 {
     asm volatile (
-#ifdef HAVE_AS_VMX
                    "vmwrite %1, %0\n"
-#else
-                   VMWRITE_OPCODE MODRM_EAX_ECX
-#endif
                    /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
                    UNLIKELY_START(be, vmwrite)
                    _ASM_BUGFRAME_TEXT(0)
                    UNLIKELY_END_SECTION
                    :
-#ifdef HAVE_AS_VMX
                    : "r" (field) , "rm" (value),
-#else
-                   : "a" (field) , "c" (value),
-#endif
                      _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
         );
 }
--=20
2.34.1



