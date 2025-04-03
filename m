Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D85C5A7A942
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 20:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937055.1338149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PDo-0001iv-FH; Thu, 03 Apr 2025 18:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937055.1338149; Thu, 03 Apr 2025 18:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PDo-0001gn-Bb; Thu, 03 Apr 2025 18:23:24 +0000
Received: by outflank-mailman (input) for mailman id 937055;
 Thu, 03 Apr 2025 18:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Em9L=WV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u0PDn-0001N1-FJ
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 18:23:23 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7974f18-10b8-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 20:23:19 +0200 (CEST)
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
X-Inumbo-ID: b7974f18-10b8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743704598; x=1743963798;
	bh=FAnFU2EE55zpL6ceZQ70EasVphCLs90kdKWYj30AMlo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Fu9WAITLaHRFhN2dgRC4aZ+EaSzjlopic2qS6JU9L7+AuoWmTa/OBxhbrYfv0/R2w
	 KzrQ6LO2pdS9QWg+LJALdAjcXwfyBJGgiAG4j8UkZ+ntlEjyN4k/ympVP1NfjRgZTm
	 YkD7JWuTZoJPLs77h991CWBYVr4jnn1p54n5THLIQ250RzA3ZPzfDdCH7GFTOKtUXs
	 ala24sSxS9ctUz34WqesHMED9pAGYB8Ind6m1Y473krIrjS7sUMoaFcWF7KUfOildr
	 UTnJDwOGk81/qG4Od9XdBoyhSIQCZbdv5WWeyDSfZBzVopUjbmsGH/LEF/QgXaNQHG
	 yL9hmMUerT0ow==
Date: Thu, 03 Apr 2025 18:23:13 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 3/6] x86/asm: remove HAVE_AS_INVPCID
Message-ID: <20250403182250.3329498-4-dmukhin@ford.com>
In-Reply-To: <20250403182250.3329498-1-dmukhin@ford.com>
References: <20250403182250.3329498-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f6f51d824233c96d4937b9d9c830236c66c51944
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

The new toolchain baseline knows the invpcid instruction,
no need to carry the workaround in the code.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/209
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/arch.mk               |  1 -
 xen/arch/x86/include/asm/invpcid.h | 12 +-----------
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 6d2876b1a8..dcc8c3c330 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -16,7 +16,6 @@ $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_A=
S_XSAVEOPT)
 $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
 $(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
 $(call as-option-add,CFLAGS,CC,".equ \"x\"$(comma)1",-DHAVE_AS_QUOTED_SYM)
-$(call as-option-add,CFLAGS,CC,"invpcid (%rax)$(comma)%rax",-DHAVE_AS_INVP=
CID)
 $(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVD=
IR)
 $(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$(comma)%rax",-DHAVE_AS_ENQCM=
D)
=20
diff --git a/xen/arch/x86/include/asm/invpcid.h b/xen/arch/x86/include/asm/=
invpcid.h
index bf5c30313a..e116a34a6c 100644
--- a/xen/arch/x86/include/asm/invpcid.h
+++ b/xen/arch/x86/include/asm/invpcid.h
@@ -5,9 +5,6 @@
=20
 extern bool use_invpcid;
=20
-#define INVPCID_OPCODE ".byte 0x66, 0x0f, 0x38, 0x82\n"
-#define MODRM_ECX_01   ".byte 0x01\n"
-
 static inline void invpcid(unsigned int pcid, unsigned long addr,
                            unsigned int type)
 {
@@ -17,16 +14,9 @@ static inline void invpcid(unsigned int pcid, unsigned l=
ong addr,
         uint64_t addr;
     } desc =3D { .pcid =3D pcid, .addr =3D addr };
=20
-    asm volatile (
-#ifdef HAVE_AS_INVPCID
-                  "invpcid %[desc], %q[type]"
+    asm volatile ( "invpcid %[desc], %q[type]"
                   : /* No output */
                   : [desc] "m" (desc), [type] "r" (type)
-#else
-                  INVPCID_OPCODE MODRM_ECX_01
-                  : /* No output */
-                  : "a" (type), "c" (&desc)
-#endif
                   : "memory" );
 }
=20
--=20
2.34.1



