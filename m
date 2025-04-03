Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A16EA7A96A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 20:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937117.1338179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PLS-0006NJ-Mn; Thu, 03 Apr 2025 18:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937117.1338179; Thu, 03 Apr 2025 18:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PLS-0006LL-Io; Thu, 03 Apr 2025 18:31:18 +0000
Received: by outflank-mailman (input) for mailman id 937117;
 Thu, 03 Apr 2025 18:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Em9L=WV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u0PE6-0001N1-A1
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 18:23:42 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c31d4645-10b8-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 20:23:38 +0200 (CEST)
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
X-Inumbo-ID: c31d4645-10b8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743704617; x=1743963817;
	bh=D9HZ36OBMZA9sIUaGxeMjO+UOWm/VDTojn44aNu2MRk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=e4hZb91LzXNCKy1yuTR+9aIzDdgYcKNqmytcq179tyDuwTc6KaVHptwjKxt6rDOgS
	 6vexmk8eVMhjjV0Td+ch6AhW8DOyblH44eyR2hJZC8qmdd2b6H9EaTUR8nH8mtkpEU
	 ed6TvuMgm5/IwluVrFFYtocZlJv2KpFxPsjfqNCLISF6s3nDuXE3EOGgDkIiE8NoVF
	 mF7b5Um7ycacVTAuisSbwzKuC71tO7/B+1RzPAF+L0Q4zsQdYswrlF8cn6PVQqn2p5
	 shI2XF0GDLp2n625HN5zWIewNVOKHlJ4d4wKc7n1EpWT3g1UDQU93zxyiqwRfo+Ufh
	 qPO69uGACudmg==
Date: Thu, 03 Apr 2025 18:23:32 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 6/6] x86/vmx: rework VMX wrappers to use `asm goto()`
Message-ID: <20250403182250.3329498-7-dmukhin@ford.com>
In-Reply-To: <20250403182250.3329498-1-dmukhin@ford.com>
References: <20250403182250.3329498-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a796a4a4237e8e45901dcb32a84db62739145c57
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Improve error handling in VMX wrappers by switching to `asm goto()` where
possible.

vmread_safe() kept as is because the minimally required baseline GCC does
not support output operands in `asm goto`.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/210
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 141 +++++++++++++------------
 1 file changed, 73 insertions(+), 68 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/=
asm/hvm/vmx/vmx.h
index ed6a6986b9..19d41f7b90 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -294,54 +294,57 @@ extern uint8_t posted_intr_vector;
=20
 static always_inline void __vmptrld(u64 addr)
 {
-    asm volatile ( "vmptrld %0\n"
-                   /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
-                   UNLIKELY_START(be, vmptrld)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION
-                   :
-                   : "m" (addr),
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
-                   : "memory" );
+    asm goto ( "vmptrld %[addr]\n"
+               "jbe %l[vmfail]\n\t"
+               :
+               : [addr] "m" (addr)
+               : "memory"
+               : vmfail );
+    return;
+
+ vmfail:
+    BUG();
 }
=20
 static always_inline void __vmpclear(u64 addr)
 {
-    asm volatile ( "vmclear %0\n"
-                   /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
-                   UNLIKELY_START(be, vmclear)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION
-                   :
-                   : "m" (addr),
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
-                   : "memory" );
+    asm goto ( "vmclear %[addr]\n"
+               "jbe %l[vmfail]\n\t"
+               :
+               : [addr] "m" (addr)
+               : "memory"
+               : vmfail );
+    return;
+
+ vmfail:
+    BUG();
 }
=20
 static always_inline void __vmread(unsigned long field, unsigned long *val=
ue)
 {
-    asm volatile ( "vmread %1, %0\n\t"
-                   /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
-                   UNLIKELY_START(be, vmread)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION
-                   : "=3Drm" (*value)
-                   : "r" (field),
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
-        );
+    bool vmfail;
+
+    asm volatile ( "vmread %[field], %[value]\n\t"
+                    "setbe %[vmfail]\n\t"
+                    : [value] "=3Drm" (*value), [vmfail] "=3Drm" (vmfail)
+                    : [field] "r" (field)
+                    : "cc" );
+    if ( vmfail )
+        BUG();
 }
=20
 static always_inline void __vmwrite(unsigned long field, unsigned long val=
ue)
 {
-    asm volatile ( "vmwrite %1, %0\n"
-                   /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
-                   UNLIKELY_START(be, vmwrite)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION
-                   :
-                   : "r" (field) , "rm" (value),
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
-        );
+    asm goto ( "vmwrite %[value], %[field]\n\t"
+               "jbe %l[vmfail]\n\t"
+               :
+               : [field] "r" (field), [value] "rm" (value)
+               :
+               : vmfail );
+    return;
+
+ vmfail:
+    BUG();
 }
=20
 static inline enum vmx_insn_errno vmread_safe(unsigned long field,
@@ -369,22 +372,22 @@ static inline enum vmx_insn_errno vmread_safe(unsigne=
d long field,
 static inline enum vmx_insn_errno vmwrite_safe(unsigned long field,
                                                unsigned long value)
 {
-    unsigned long ret =3D VMX_INSN_SUCCEED;
-    bool fail_invalid, fail_valid;
+    unsigned long ret;
=20
-    asm volatile ( "vmwrite %[value], %[field]\n\t"
-                   ASM_FLAG_OUT(, "setc %[invalid]\n\t")
-                   ASM_FLAG_OUT(, "setz %[valid]\n\t")
-                   : ASM_FLAG_OUT("=3D@ccc", [invalid] "=3Drm") (fail_inva=
lid),
-                     ASM_FLAG_OUT("=3D@ccz", [valid] "=3Drm") (fail_valid)
-                   : [field] "r" (field),
-                     [value] "rm" (value) );
+    asm goto ( "vmwrite %[value], %[field]\n\t"
+               "jc %l[vmfail_invalid]\n\t"
+               "jz %l[vmfail_error]\n\t"
+               :
+               : [field] "r" (field), [value] "rm" (value)
+               :
+               : vmfail_invalid, vmfail_error );
+    return VMX_INSN_SUCCEED;
=20
-    if ( unlikely(fail_invalid) )
-        ret =3D VMX_INSN_FAIL_INVALID;
-    else if ( unlikely(fail_valid) )
-        __vmread(VM_INSTRUCTION_ERROR, &ret);
+ vmfail_invalid:
+    return VMX_INSN_FAIL_INVALID;
=20
+ vmfail_error:
+    __vmread(VM_INSTRUCTION_ERROR, &ret);
     return ret;
 }
=20
@@ -402,15 +405,16 @@ static always_inline void __invept(unsigned long type=
, uint64_t eptp)
          !cpu_has_vmx_ept_invept_single_context )
         type =3D INVEPT_ALL_CONTEXT;
=20
-    asm volatile ( "invept %0, %1\n"
-                   /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
-                   UNLIKELY_START(be, invept)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION
-                   :
-                   : "m" (operand), "r" (type),
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
-                   : "memory" );
+    asm goto ( "invept %[operand], %[type]\n"
+               "jbe %l[vmfail]\n\t"
+               :
+               : [operand] "m" (operand), [type] "r" (type)
+               : "memory"
+               : vmfail );
+    return;
+
+ vmfail:
+    BUG();
 }
=20
 static always_inline void __invvpid(unsigned long type, u16 vpid, u64 gva)
@@ -422,16 +426,17 @@ static always_inline void __invvpid(unsigned long typ=
e, u16 vpid, u64 gva)
     }  operand =3D {vpid, 0, gva};
=20
     /* Fix up #UD exceptions which occur when TLBs are flushed before VMXO=
N. */
-    asm volatile ( "1: invvpid %0, %1\n"
-                   /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
-                   UNLIKELY_START(be, invvpid)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION "\n"
-                   "2:" _ASM_EXTABLE(1b, 2b)
-                   :
-                   : "m" (operand), "r" (type),
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
-                   : "memory" );
+    asm goto ( "1: invvpid %[operand], %[type]\n"
+               "   jbe %l[vmfail]\n\t"
+               "2:" _ASM_EXTABLE(1b, 2b)
+               :
+               : [operand] "m" (operand), [type] "r" (type)
+               : "memory"
+               : vmfail );
+    return;
+
+ vmfail:
+    BUG();
 }
=20
 static inline void ept_sync_all(void)
--=20
2.34.1



