Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B706A7A93E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 20:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937052.1338138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PDm-0001Sj-61; Thu, 03 Apr 2025 18:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937052.1338138; Thu, 03 Apr 2025 18:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PDm-0001QB-37; Thu, 03 Apr 2025 18:23:22 +0000
Received: by outflank-mailman (input) for mailman id 937052;
 Thu, 03 Apr 2025 18:23:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Em9L=WV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u0PDk-0001N1-6t
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 18:23:20 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4e5688a-10b8-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 20:23:14 +0200 (CEST)
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
X-Inumbo-ID: b4e5688a-10b8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743704593; x=1743963793;
	bh=DAdmSxgvTyBN49WAdVm4Ym611V3JMucvy190nmerm+Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Ht7/I1mJ/Y7K0M92SngQbabwHstOiBsqvjCe57WBxgMmdCKeNE6BfGqVyHeOVfAcK
	 5XruK6qxcqnEwUtVT1xp759lPbE/m7y3TYxp6U/m9annLLuNvulyUTLOdLOU1Z0NUW
	 f5dYdnoCkFX5Ch8HDdvU12NEyTD7WzyBRv4OeeR2Fz8VnO4xzwRNj6jOLfv4U8V7Kk
	 iY4zALiVDHmkPhiwAcXmtb/ThtSFmu61wUna7WW/sDZT7JlPdlHD1yD0GGChDuzNE3
	 Qixfkv+/26+TFS4lp6j8j2yKxlOa13xtNSUM3CJAN+3nGWfyTWL9B11v2z9ek7fsag
	 sS4OGBBnFuxEA==
Date: Thu, 03 Apr 2025 18:23:09 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 2/6] x86/msr: remove HAVE_AS_FSGSBASE
Message-ID: <20250403182250.3329498-3-dmukhin@ford.com>
In-Reply-To: <20250403182250.3329498-1-dmukhin@ford.com>
References: <20250403182250.3329498-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f6e30f0fc17d05541119b496f78e8cadb4330eed
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

The new toolchain baseline knows the {rd,wr}{f,g}sbase instructions,
no need to carry the workaround in the code.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/207
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/arch.mk           |  1 -
 xen/arch/x86/include/asm/msr.h | 22 ----------------------
 2 files changed, 23 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index e9fa1c92d7..6d2876b1a8 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -12,7 +12,6 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 $(call as-option-add,CFLAGS,CC,"crc32 %eax$(comma)%eax",-DHAVE_AS_SSE4_2)
 $(call as-option-add,CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RDRAND)
-$(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
 $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
 $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
 $(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.=
h
index 549d40b404..0d3b1d6374 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -152,11 +152,7 @@ static inline unsigned long __rdfsbase(void)
 {
     unsigned long base;
=20
-#ifdef HAVE_AS_FSGSBASE
     asm volatile ( "rdfsbase %0" : "=3Dr" (base) );
-#else
-    asm volatile ( ".byte 0xf3, 0x48, 0x0f, 0xae, 0xc0" : "=3Da" (base) );
-#endif
=20
     return base;
 }
@@ -165,31 +161,19 @@ static inline unsigned long __rdgsbase(void)
 {
     unsigned long base;
=20
-#ifdef HAVE_AS_FSGSBASE
     asm volatile ( "rdgsbase %0" : "=3Dr" (base) );
-#else
-    asm volatile ( ".byte 0xf3, 0x48, 0x0f, 0xae, 0xc8" : "=3Da" (base) );
-#endif
=20
     return base;
 }
=20
 static inline void __wrfsbase(unsigned long base)
 {
-#ifdef HAVE_AS_FSGSBASE
     asm volatile ( "wrfsbase %0" :: "r" (base) );
-#else
-    asm volatile ( ".byte 0xf3, 0x48, 0x0f, 0xae, 0xd0" :: "a" (base) );
-#endif
 }
=20
 static inline void __wrgsbase(unsigned long base)
 {
-#ifdef HAVE_AS_FSGSBASE
     asm volatile ( "wrgsbase %0" :: "r" (base) );
-#else
-    asm volatile ( ".byte 0xf3, 0x48, 0x0f, 0xae, 0xd8" :: "a" (base) );
-#endif
 }
=20
 static inline unsigned long read_fs_base(void)
@@ -253,15 +237,9 @@ static inline void write_gs_shadow(unsigned long base)
     if ( read_cr4() & X86_CR4_FSGSBASE )
     {
         asm volatile ( "swapgs\n\t"
-#ifdef HAVE_AS_FSGSBASE
                        "wrgsbase %0\n\t"
                        "swapgs"
                        :: "r" (base) );
-#else
-                       ".byte 0xf3, 0x48, 0x0f, 0xae, 0xd8\n\t"
-                       "swapgs"
-                       :: "a" (base) );
-#endif
     }
     else
         wrmsrl(MSR_SHADOW_GS_BASE, base);
--=20
2.34.1



