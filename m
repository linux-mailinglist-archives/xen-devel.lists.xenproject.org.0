Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6380A7C740
	for <lists+xen-devel@lfdr.de>; Sat,  5 Apr 2025 03:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938795.1339289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0sKN-00087Q-93; Sat, 05 Apr 2025 01:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938795.1339289; Sat, 05 Apr 2025 01:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0sKN-00084z-6C; Sat, 05 Apr 2025 01:28:07 +0000
Received: by outflank-mailman (input) for mailman id 938795;
 Sat, 05 Apr 2025 01:28:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9tDv=WX=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u0sKL-00084o-O7
 for xen-devel@lists.xenproject.org; Sat, 05 Apr 2025 01:28:05 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 380c6830-11bd-11f0-9ffb-bf95429c2676;
 Sat, 05 Apr 2025 03:28:03 +0200 (CEST)
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
X-Inumbo-ID: 380c6830-11bd-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743816482; x=1744075682;
	bh=1g4iGpKVOtwNddjsui1KqYG4vHHJD2Poi+3W1O7i/rM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=jNXXTBomCvQJPE3i/UWcZNfArnhTU6z97NBX6vYwB8TqPugBKq2NnCS3rML0Mou2B
	 GFBfQSO+m++1t0ei0bvr/fFnJZsgg3QjjhlrTkmgGb1p1e/F9R81ScfGC8nvY3Mgpn
	 q1/W+zhFK9fqZdRsPIT52MmvapLRWYkxxLJoER9aQib2qazVj5pTFb4Dmy8/JXPl4A
	 dExq+VgP7N5VUHeebnQmoRNDUs6AhfF1jOGWbYDV4xZpfjqyOzoLvsutPP/xtv0e9q
	 xm8AREBHXQkOWzS3TWoxonclIpDVrxomrj19S3cTHylw4BdIJrMPXiJFZ8CszPqNqv
	 nqu2P15Ozjwsw==
Date: Sat, 05 Apr 2025 01:27:57 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: [PATCH v3] x86/vmx: Rework VMX wrappers using `asm goto()`
Message-ID: <20250405012729.3109108-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: dfb2a5c0312b2a1e73a0f7e33f29e7b98870ebec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Improve error handling in VMX wrappers by switching to `asm goto()` where
possible.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/210
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- dropped vmread changes
- checked \n\t formatting
- Link to v2: https://lore.kernel.org/xen-devel/20250403182250.3329498-7-dm=
ukhin@ford.com/
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 122 +++++++++++++------------
 1 file changed, 64 insertions(+), 58 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/=
asm/hvm/vmx/vmx.h
index affb3a8bd6..6aa6e1f212 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -294,28 +294,30 @@ extern uint8_t posted_intr_vector;
=20
 static always_inline void __vmptrld(u64 addr)
 {
-    asm volatile ( "vmptrld %0\n\t"
-                   /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
-                   UNLIKELY_START(be, vmptrld)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION
-                   :
-                   : "m" (addr),
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
-                   : "memory" );
+    asm goto ( "vmptrld %[addr]\n\t"
+               "jbe %l[vmfail]\n"
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
-    asm volatile ( "vmclear %0\n\t"
-                   /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
-                   UNLIKELY_START(be, vmclear)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION
-                   :
-                   : "m" (addr),
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
-                   : "memory" );
+    asm goto ( "vmclear %[addr]\n\t"
+               "jbe %l[vmfail]\n"
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
@@ -332,14 +334,16 @@ static always_inline void __vmread(unsigned long fiel=
d, unsigned long *value)
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
0) );
+    asm goto ( "vmwrite %[value], %[field]\n\t"
+               "jbe %l[vmfail]\n"
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
@@ -367,22 +371,22 @@ static inline enum vmx_insn_errno vmread_safe(unsigne=
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
+               "jz %l[vmfail_error]\n"
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
@@ -400,15 +404,16 @@ static always_inline void __invept(unsigned long type=
, uint64_t eptp)
          !cpu_has_vmx_ept_invept_single_context )
         type =3D INVEPT_ALL_CONTEXT;
=20
-    asm volatile ( "invept %0, %1\n\t"
-                   /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
-                   UNLIKELY_START(be, invept)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION
-                   :
-                   : "m" (operand), "r" (type),
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
-                   : "memory" );
+    asm goto ( "invept %[operand], %[type]\n\t"
+               "jbe %l[vmfail]\n"
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
@@ -420,16 +425,17 @@ static always_inline void __invvpid(unsigned long typ=
e, u16 vpid, u64 gva)
     }  operand =3D {vpid, 0, gva};
=20
     /* Fix up #UD exceptions which occur when TLBs are flushed before VMXO=
N. */
-    asm volatile ( "1: invvpid %0, %1\n\t"
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
+    asm goto ( "1: invvpid %[operand], %[type]\n\t"
+               "   jbe %l[vmfail]\n"
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



