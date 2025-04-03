Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C906A7A93F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 20:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937061.1338159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PDt-0002BO-Ot; Thu, 03 Apr 2025 18:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937061.1338159; Thu, 03 Apr 2025 18:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PDt-00027L-KI; Thu, 03 Apr 2025 18:23:29 +0000
Received: by outflank-mailman (input) for mailman id 937061;
 Thu, 03 Apr 2025 18:23:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Em9L=WV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u0PDs-0001N1-17
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 18:23:28 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc1f0e2c-10b8-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 20:23:26 +0200 (CEST)
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
X-Inumbo-ID: bc1f0e2c-10b8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743704605; x=1743963805;
	bh=0+5RP23zmphaABoW946e9TRg+3ezkXum7FCtTXRbuRo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QEy3QHwFJ8D2CudLyCwp8udZXZNunfSRFnD3L5hlC6A0CHwawHqnMmFsIpoH3F1OQ
	 XsLCUhXr7HE+xarwPhDDCwKHqzVX255L/UpyOGXh6sNrqtjWBJV7OAiIMcOeYgYRy/
	 YKJMfUebL07ejDcE3lf22xRET20jM+Kas1UNbAXfuNiCRKJnmZJcbnIwb3BLfnaSSx
	 XZPHMo7LXhquFlVRtmxNtW3QocbTvj4iHHlqVoKNmvQJB0S69mT2b3M1JiZy0ai/Ij
	 DjAAYwIv5ThL/+6bxXHBsR33w/bXI5+S4Rh5o4xvh5ZZhiQPl/ZusGDAGUDIvzztHa
	 L0gJW2G/M51rg==
Date: Thu, 03 Apr 2025 18:23:19 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 4/6] x86/emulate: remove HAVE_AS_SSE4_2
Message-ID: <20250403182250.3329498-5-dmukhin@ford.com>
In-Reply-To: <20250403182250.3329498-1-dmukhin@ford.com>
References: <20250403182250.3329498-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5284202ec3cab84c8f2b5e48a374d5a8cfe45ec7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

The new toolchain baseline knows the crc32 instructions,
no need to carry the workaround in the code.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/206
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/arch.mk                   | 1 -
 xen/arch/x86/x86_emulate/x86_emulate.c | 7 +++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index dcc8c3c330..3bbaee2a44 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -10,7 +10,6 @@ CFLAGS +=3D -msoft-float
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
-$(call as-option-add,CFLAGS,CC,"crc32 %eax$(comma)%eax",-DHAVE_AS_SSE4_2)
 $(call as-option-add,CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RDRAND)
 $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
 $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emul=
ate/x86_emulate.c
index 535d803588..55d36b9a26 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6882,7 +6882,7 @@ x86_emulate(
             goto unhandleable;
         }
         break;
-#ifdef HAVE_AS_SSE4_2
+
     case X86EMUL_OPC_F2(0x0f38, 0xf0): /* crc32 r/m8, r{32,64} */
     case X86EMUL_OPC_F2(0x0f38, 0xf1): /* crc32 r/m{16,32,64}, r{32,64} */
         host_and_vcpu_must_have(sse4_2);
@@ -6901,17 +6901,16 @@ x86_emulate(
             asm ( "crc32l %1,%k0" : "+r" (dst.val)
                                   : "rm" (*(uint32_t *)&src.val) );
             break;
-# ifdef __x86_64__
+#ifdef __x86_64__
         case 8:
             asm ( "crc32q %1,%0" : "+r" (dst.val) : "rm" (src.val) );
             break;
-# endif
+#endif
         default:
             ASSERT_UNREACHABLE();
             goto unhandleable;
         }
         break;
-#endif
=20
     case X86EMUL_OPC_VEX(0x0f38, 0xf2):    /* andn r/m,r,r */
     case X86EMUL_OPC_VEX(0x0f38, 0xf5):    /* bzhi r,r/m,r */
--=20
2.34.1



