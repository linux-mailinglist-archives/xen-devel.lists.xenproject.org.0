Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3944CA9D8F9
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 09:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968971.1358360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Zwo-0007Km-9F; Sat, 26 Apr 2025 07:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968971.1358360; Sat, 26 Apr 2025 07:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Zwo-0007IO-5w; Sat, 26 Apr 2025 07:27:38 +0000
Received: by outflank-mailman (input) for mailman id 968971;
 Sat, 26 Apr 2025 07:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ssvg=XM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u8Zwm-00071f-NN
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 07:27:36 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ece44583-226f-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 09:27:36 +0200 (CEST)
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
X-Inumbo-ID: ece44583-226f-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745652455; x=1745911655;
	bh=wuce2F8XhQtkwL25frhauUv7JiUBR5gDyh17uZrs2m0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=iQ111GOXT09mKcbkxGPjIIwYaS+w8//WWrVsQLAczZ/yTAldZA0LDBEGANvfCqdkR
	 ZFEaMdZvwm8B5TMgH+BMexgHkuMqNlbQtXII9A2/uPTF9R2qFgT/ZcESAanBm2ZqUH
	 EQwVZi+p5eRbzXkiHFmmhBW4/oSkkZnzWp90bQyVQsw5/0laAqEhM1H8iCjtNUe1XD
	 SAwmy/hEg/n0806fbqH6EpqUc85Teh7WJ1oDefiT76BHu1wDF5sEz09hk+F787sxzY
	 5biaTkr1/klk2vc7m4eKEXj6nFvyOLR/FiIhVqSp1ZpXO/ImZ/aKh3SIvj4VUQjQ+y
	 OmsIOKFHAYcnQ==
Date: Sat, 26 Apr 2025 07:27:29 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: [PATCH v4 1/3] x86/vmx: Introduce vmread()
Message-ID: <20250426072720.39317-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4740a4eca92b80fd0b2c2946a8de21d1667bc54f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

The current implementation of __vmread() returns the result via pointer
argument which leads to excess code in some places.

Introduce a new vmread() function as suggested in [1].

[1] https://lore.kernel.org/xen-devel/c452a1d7-4a57-4c5f-8a83-36a74ff228ec@=
citrix.com/

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/=
asm/hvm/vmx/vmx.h
index 33d3d43a38..cc8c53fab1 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -320,16 +320,25 @@ static always_inline void __vmpclear(u64 addr)
     BUG();
 }
=20
-static always_inline void __vmread(unsigned long field, unsigned long *val=
ue)
+static always_inline unsigned long vmread(unsigned long field)
 {
-    asm volatile ( "vmread %1, %0\n\t"
+    unsigned long value;
+
+    asm volatile ( "vmread %[field], %[value]\n\t"
                    /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
                    UNLIKELY_START(be, vmread)
                    _ASM_BUGFRAME_TEXT(0)
                    UNLIKELY_END_SECTION
-                   : "=3Drm" (*value)
-                   : "r" (field),
+                   : [value] "=3Drm" (value)
+                   : [field] "r" (field),
                      _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0) );
+
+    return value;
+}
+
+static always_inline void __vmread(unsigned long field, unsigned long *val=
ue)
+{
+    *value =3D vmread(field);
 }
=20
 static always_inline void __vmwrite(unsigned long field, unsigned long val=
ue)
@@ -363,7 +372,7 @@ static inline enum vmx_insn_errno vmread_safe(unsigned =
long field,
     if ( unlikely(fail_invalid) )
         ret =3D VMX_INSN_FAIL_INVALID;
     else if ( unlikely(fail_valid) )
-        __vmread(VM_INSTRUCTION_ERROR, &ret);
+        ret =3D vmread(VM_INSTRUCTION_ERROR);
=20
     return ret;
 }
@@ -371,8 +380,6 @@ static inline enum vmx_insn_errno vmread_safe(unsigned =
long field,
 static inline enum vmx_insn_errno vmwrite_safe(unsigned long field,
                                                unsigned long value)
 {
-    unsigned long ret;
-
     asm goto ( "vmwrite %[value], %[field]\n\t"
                "jc %l[vmfail_invalid]\n\t"
                "jz %l[vmfail_error]"
@@ -386,8 +393,7 @@ static inline enum vmx_insn_errno vmwrite_safe(unsigned=
 long field,
     return VMX_INSN_FAIL_INVALID;
=20
  vmfail_error:
-    __vmread(VM_INSTRUCTION_ERROR, &ret);
-    return ret;
+    return vmread(VM_INSTRUCTION_ERROR);
 }
=20
 static always_inline void __invept(unsigned long type, uint64_t eptp)
--=20
2.34.1



