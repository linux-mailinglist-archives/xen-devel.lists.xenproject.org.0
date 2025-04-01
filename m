Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30CFA784A8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 00:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934837.1336448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzjzN-00019e-JO; Tue, 01 Apr 2025 22:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934837.1336448; Tue, 01 Apr 2025 22:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzjzN-00014a-Ea; Tue, 01 Apr 2025 22:21:45 +0000
Received: by outflank-mailman (input) for mailman id 934837;
 Tue, 01 Apr 2025 22:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dnoa=WT=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzjzL-00080l-Uw
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 22:21:43 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afce6837-0f47-11f0-9ea7-5ba50f476ded;
 Wed, 02 Apr 2025 00:21:41 +0200 (CEST)
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
X-Inumbo-ID: afce6837-0f47-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743546101; x=1743805301;
	bh=EqD5rWQIMtrh3DD6wy+ihv9SumDjFLVceAqq134Fgcw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OFCp6JWZLsruZQqZYzQG685sVK8Y1W7vbv5HWkQsvdRcj7HcPKBBSMAG+UB/Rq6cp
	 lOhJ3QFex6rxWc7XrLMb5QhzEYJ7eoHFb0LHngGZ3jHs9t14Bxts91jqF06x0TpRBz
	 408E2pilYM55IJ4yLItxCO+1k+FTihNQPRF2zkUcVgxfMBVgRH7yWzvIXfCtXL8d15
	 OMOljfHZYtkMN0dGDg1NI7RbjZ+K+991HEiuop6ivv0ijks5HVGEziNESEm4bNz6/K
	 avfKtSlZSZEl/DLa5tH6PS8vmFbBwwD6AfHN779PsEuLiLl1PaeazkKInUu2H0IVVZ
	 NrD0S8xywK4pA==
Date: Tue, 01 Apr 2025 22:21:38 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 5/5] x86/asm: remove HAVE_AS_CLAC_STAC
Message-ID: <20250401222105.79309-6-dmukhin@ford.com>
In-Reply-To: <20250401222105.79309-1-dmukhin@ford.com>
References: <20250401222105.79309-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 607f19b039f6ff96dca31464c000dad0932e593e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

The new toolchain baseline knows the STAC/CLAC instructions,
no need to carry the workaround in the code.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/203
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/arch.mk                 |  1 -
 xen/arch/x86/include/asm/asm-defns.h | 10 ----------
 2 files changed, 11 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 42c3aa73da..e9fa1c92d7 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -15,7 +15,6 @@ $(call as-option-add,CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RD=
RAND)
 $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
 $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
 $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
-$(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)
 $(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
 $(call as-option-add,CFLAGS,CC,".equ \"x\"$(comma)1",-DHAVE_AS_QUOTED_SYM)
 $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$(comma)%rax",-DHAVE_AS_INVP=
CID)
diff --git a/xen/arch/x86/include/asm/asm-defns.h b/xen/arch/x86/include/as=
m/asm-defns.h
index 32d6b44910..ab653f3218 100644
--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -1,15 +1,5 @@
 #include <asm/page-bits.h>
=20
-#ifndef HAVE_AS_CLAC_STAC
-.macro clac
-    .byte 0x0f, 0x01, 0xca
-.endm
-
-.macro stac
-    .byte 0x0f, 0x01, 0xcb
-.endm
-#endif
-
 .macro vmrun
     .byte 0x0f, 0x01, 0xd8
 .endm
--=20
2.34.1



