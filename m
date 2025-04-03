Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDACA7A941
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 20:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937046.1338129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PDb-00015m-TE; Thu, 03 Apr 2025 18:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937046.1338129; Thu, 03 Apr 2025 18:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PDb-00014G-No; Thu, 03 Apr 2025 18:23:11 +0000
Received: by outflank-mailman (input) for mailman id 937046;
 Thu, 03 Apr 2025 18:23:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Em9L=WV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u0PDZ-0000KX-O6
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 18:23:09 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1bb9101-10b8-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 20:23:09 +0200 (CEST)
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
X-Inumbo-ID: b1bb9101-10b8-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743704587; x=1743963787;
	bh=qhdb/UMVIzJBSclTVMNrOhHVQ8qtT+hHFmjvP6GsCPc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=XprKrZdJwozJ7RtPPi0NFr+5IjEy7TCwNSUl7Jq43C65XZess6+LStMze0I2lX3Vf
	 fRr6Avgu/WF+GxGQFxy7tVdjS5xaG+hd8cG4uE735FGHLIAHoBrBFW9EEBlC7Ht0DX
	 u3uHfKp/RHeyYhfVznI/vFqw6qBZb3bOM/9Woqr57vIjako+ye1lvYESGI/2/oWFh9
	 yeDO4ZPFH003yHDd4rMFaPY5LzACzB04Lsq3GQA7yuUgakuL7xjPrjBE6UT368VPiS
	 jG3Z1tacs8ti8uzLGFv7kuSXd/cyqGADneoG/9zii+NM0js3ayTIIi3JGEJX3RZgiE
	 lfouKZYwkSoYQ==
Date: Thu, 03 Apr 2025 18:23:04 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 1/6] x86/vmx: remove HAVE_AS_{EPT,VMX}, GAS_VMX_OP() and *_OPCODE
Message-ID: <20250403182250.3329498-2-dmukhin@ford.com>
In-Reply-To: <20250403182250.3329498-1-dmukhin@ford.com>
References: <20250403182250.3329498-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 88bc866978d8a58d1e80d42e66ec5b77779ee0e0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

The new toolchain baseline knows the VMX instructions,
no need to carry the workaround in the code.

Move asm for vmxoff directly on the only callsite in vmcs.c

Updated formatting for all __xxx() calls to be consistent.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/202
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/arch.mk                   |   4 +-
 xen/arch/x86/hvm/vmx/vmcs.c            |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 119 ++++---------------------
 3 files changed, 17 insertions(+), 108 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 258e459bec..e9fa1c92d7 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -10,9 +10,7 @@ CFLAGS +=3D -msoft-float
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
-$(call as-option-add,CFLAGS,CC,"vmcall",-DHAVE_AS_VMX)
 $(call as-option-add,CFLAGS,CC,"crc32 %eax$(comma)%eax",-DHAVE_AS_SSE4_2)
-$(call as-option-add,CFLAGS,CC,"invept (%rax)$(comma)%rax",-DHAVE_AS_EPT)
 $(call as-option-add,CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RDRAND)
 $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
 $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
@@ -23,7 +21,7 @@ $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$(comma)%ra=
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
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 1d427100ce..aef746a293 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -811,7 +811,7 @@ void cf_check vmx_cpu_down(void)
=20
     BUG_ON(!(read_cr4() & X86_CR4_VMXE));
     this_cpu(vmxon) =3D 0;
-    __vmxoff();
+    asm volatile ("vmxoff" : : : "memory");
=20
     local_irq_restore(flags);
 }
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/=
asm/hvm/vmx/vmx.h
index 7c6ba73407..ed6a6986b9 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -257,24 +257,6 @@ typedef union cr_access_qual {
 #define X86_SEG_AR_GRANULARITY  (1u << 15) /* 15, granularity */
 #define X86_SEG_AR_SEG_UNUSABLE (1u << 16) /* 16, segment unusable */
=20
-#define VMCALL_OPCODE   ".byte 0x0f,0x01,0xc1\n"
-#define VMCLEAR_OPCODE  ".byte 0x66,0x0f,0xc7\n"        /* reg/opcode: /6 =
*/
-#define VMLAUNCH_OPCODE ".byte 0x0f,0x01,0xc2\n"
-#define VMPTRLD_OPCODE  ".byte 0x0f,0xc7\n"             /* reg/opcode: /6 =
*/
-#define VMPTRST_OPCODE  ".byte 0x0f,0xc7\n"             /* reg/opcode: /7 =
*/
-#define VMREAD_OPCODE   ".byte 0x0f,0x78\n"
-#define VMRESUME_OPCODE ".byte 0x0f,0x01,0xc3\n"
-#define VMWRITE_OPCODE  ".byte 0x0f,0x79\n"
-#define INVEPT_OPCODE   ".byte 0x66,0x0f,0x38,0x80\n"   /* m128,r64/32 */
-#define INVVPID_OPCODE  ".byte 0x66,0x0f,0x38,0x81\n"   /* m128,r64/32 */
-#define VMXOFF_OPCODE   ".byte 0x0f,0x01,0xc4\n"
-#define VMXON_OPCODE    ".byte 0xf3,0x0f,0xc7\n"
-
-#define MODRM_EAX_08    ".byte 0x08\n" /* ECX, [EAX] */
-#define MODRM_EAX_06    ".byte 0x30\n" /* [EAX], with reg/opcode: /6 */
-#define MODRM_EAX_07    ".byte 0x38\n" /* [EAX], with reg/opcode: /7 */
-#define MODRM_EAX_ECX   ".byte 0xc1\n" /* EAX, ECX */
-
 extern uint8_t posted_intr_vector;
=20
 #define cpu_has_vmx_ept_exec_only_supported        \
@@ -310,97 +292,54 @@ extern uint8_t posted_intr_vector;
 #define INVVPID_ALL_CONTEXT                     2
 #define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
=20
-#ifdef HAVE_AS_VMX
-# define GAS_VMX_OP(yes, no) yes
-#else
-# define GAS_VMX_OP(yes, no) no
-#endif
-
 static always_inline void __vmptrld(u64 addr)
 {
-    asm volatile (
-#ifdef HAVE_AS_VMX
-                   "vmptrld %0\n"
-#else
-                   VMPTRLD_OPCODE MODRM_EAX_06
-#endif
+    asm volatile ( "vmptrld %0\n"
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
-                   : "memory");
+                   : "memory" );
 }
=20
 static always_inline void __vmpclear(u64 addr)
 {
-    asm volatile (
-#ifdef HAVE_AS_VMX
-                   "vmclear %0\n"
-#else
-                   VMCLEAR_OPCODE MODRM_EAX_06
-#endif
+    asm volatile ( "vmclear %0\n"
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
-                   : "memory");
+                   : "memory" );
 }
=20
 static always_inline void __vmread(unsigned long field, unsigned long *val=
ue)
 {
-    asm volatile (
-#ifdef HAVE_AS_VMX
-                   "vmread %1, %0\n\t"
-#else
-                   VMREAD_OPCODE MODRM_EAX_ECX
-#endif
+    asm volatile ( "vmread %1, %0\n\t"
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
=20
 static always_inline void __vmwrite(unsigned long field, unsigned long val=
ue)
 {
-    asm volatile (
-#ifdef HAVE_AS_VMX
-                   "vmwrite %1, %0\n"
-#else
-                   VMWRITE_OPCODE MODRM_EAX_ECX
-#endif
+    asm volatile ( "vmwrite %1, %0\n"
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
@@ -411,14 +350,13 @@ static inline enum vmx_insn_errno vmread_safe(unsigne=
d long field,
     unsigned long ret =3D VMX_INSN_SUCCEED;
     bool fail_invalid, fail_valid;
=20
-    asm volatile ( GAS_VMX_OP("vmread %[field], %[value]\n\t",
-                              VMREAD_OPCODE MODRM_EAX_ECX)
+    asm volatile ( "vmread %[field], %[value]\n\t"
                    ASM_FLAG_OUT(, "setc %[invalid]\n\t")
                    ASM_FLAG_OUT(, "setz %[valid]\n\t")
                    : ASM_FLAG_OUT("=3D@ccc", [invalid] "=3Drm") (fail_inva=
lid),
                      ASM_FLAG_OUT("=3D@ccz", [valid] "=3Drm") (fail_valid)=
,
-                     [value] GAS_VMX_OP("=3Drm", "=3Dc") (*value)
-                   : [field] GAS_VMX_OP("r", "a") (field));
+                     [value] "=3Drm" (*value)
+                   : [field] "r" (field) );
=20
     if ( unlikely(fail_invalid) )
         ret =3D VMX_INSN_FAIL_INVALID;
@@ -434,14 +372,13 @@ static inline enum vmx_insn_errno vmwrite_safe(unsign=
ed long field,
     unsigned long ret =3D VMX_INSN_SUCCEED;
     bool fail_invalid, fail_valid;
=20
-    asm volatile ( GAS_VMX_OP("vmwrite %[value], %[field]\n\t",
-                              VMWRITE_OPCODE MODRM_EAX_ECX)
+    asm volatile ( "vmwrite %[value], %[field]\n\t"
                    ASM_FLAG_OUT(, "setc %[invalid]\n\t")
                    ASM_FLAG_OUT(, "setz %[valid]\n\t")
                    : ASM_FLAG_OUT("=3D@ccc", [invalid] "=3Drm") (fail_inva=
lid),
                      ASM_FLAG_OUT("=3D@ccz", [valid] "=3Drm") (fail_valid)
-                   : [field] GAS_VMX_OP("r", "a") (field),
-                     [value] GAS_VMX_OP("rm", "c") (value));
+                   : [field] "r" (field),
+                     [value] "rm" (value) );
=20
     if ( unlikely(fail_invalid) )
         ret =3D VMX_INSN_FAIL_INVALID;
@@ -465,22 +402,13 @@ static always_inline void __invept(unsigned long type=
, uint64_t eptp)
          !cpu_has_vmx_ept_invept_single_context )
         type =3D INVEPT_ALL_CONTEXT;
=20
-    asm volatile (
-#ifdef HAVE_AS_EPT
-                   "invept %0, %1\n"
-#else
-                   INVEPT_OPCODE MODRM_EAX_08
-#endif
+    asm volatile ( "invept %0, %1\n"
                    /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
                    UNLIKELY_START(be, invept)
                    _ASM_BUGFRAME_TEXT(0)
                    UNLIKELY_END_SECTION
                    :
-#ifdef HAVE_AS_EPT
                    : "m" (operand), "r" (type),
-#else
-                   : "a" (&operand), "c" (type),
-#endif
                      _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
                    : "memory" );
 }
@@ -494,24 +422,14 @@ static always_inline void __invvpid(unsigned long typ=
e, u16 vpid, u64 gva)
     }  operand =3D {vpid, 0, gva};
=20
     /* Fix up #UD exceptions which occur when TLBs are flushed before VMXO=
N. */
-    asm volatile ( "1: "
-#ifdef HAVE_AS_EPT
-                   "invvpid %0, %1\n"
-#else
-                   INVVPID_OPCODE MODRM_EAX_08
-#endif
+    asm volatile ( "1: invvpid %0, %1\n"
                    /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
                    UNLIKELY_START(be, invvpid)
                    _ASM_BUGFRAME_TEXT(0)
                    UNLIKELY_END_SECTION "\n"
-                   "2:"
-                   _ASM_EXTABLE(1b, 2b)
+                   "2:" _ASM_EXTABLE(1b, 2b)
                    :
-#ifdef HAVE_AS_EPT
                    : "m" (operand), "r" (type),
-#else
-                   : "a" (&operand), "c" (type),
-#endif
                      _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
                    : "memory" );
 }
@@ -552,13 +470,6 @@ static inline void vpid_sync_all(void)
     __invvpid(INVVPID_ALL_CONTEXT, 0, 0);
 }
=20
-static inline void __vmxoff(void)
-{
-    asm volatile (
-        VMXOFF_OPCODE
-        : : : "memory" );
-}
-
 int cf_check vmx_guest_x86_mode(struct vcpu *v);
 unsigned int vmx_get_cpl(void);
=20
--=20
2.34.1



