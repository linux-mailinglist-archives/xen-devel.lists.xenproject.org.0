Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD82654890
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 23:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468697.727907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8U6l-00044J-Al; Thu, 22 Dec 2022 22:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468697.727907; Thu, 22 Dec 2022 22:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8U6l-0003xA-19; Thu, 22 Dec 2022 22:32:11 +0000
Received: by outflank-mailman (input) for mailman id 468697;
 Thu, 22 Dec 2022 22:32:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9VX=4U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p8U6j-0003ch-KJ
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 22:32:09 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 766a577a-8248-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 23:32:06 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4A6215C00B5;
 Thu, 22 Dec 2022 17:32:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 22 Dec 2022 17:32:05 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 17:32:04 -0500 (EST)
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
X-Inumbo-ID: 766a577a-8248-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671748325; x=1671834725; bh=kKaU/1YcOP49Pa0usx3kzomk84Pzq50qwNn
	cPbt/vjc=; b=rnQbH9ZEgpFfLtFYkGswwYseUOgzB5L8n5DX/tTYll4ZwOedCGx
	/qWnu4t8Vhnxfe1DmU+4yD2XqwRekBg3jYxmJ4Ol49WRd7H/SBCJmwY98bms7Miy
	c9BMPqRvcPE3Po2O6vZ6joRbOth2inENmfoXDR2O1BFHNG9UYzvT4YXT7qu8iBXv
	Iyk4wkZQ2iJdA929gFvX5PeUdM3q4MsrUvSNS3nVmFQaLVrv4Dtn2GtOE+0qnGIK
	3zLQ09Mpe2xeafOBpUqgmvk3zkuEH4x72UaCXv3h6wt/VOT/FnHCiZjkxu6b6wKo
	CXLCx4R/91l0EmWJlHTgwEpWcxqRNmLisXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671748325; x=1671834725; bh=kKaU/1YcOP49P
	a0usx3kzomk84Pzq50qwNncPbt/vjc=; b=SRx1InZwqLV8nsYM8yOBvnv9deE0K
	eKKFlRHNNUTjoiO5bMfHj9alQUpCsAGwAO/MU/qPzZJH6u9jLQ/RqeTvhHRvGNlW
	Ie8Ft2QV4r0LL/vT45ZTKmUkSO8pI4PqwT0q+vHmY6V/AqltXe3X3B/OC3u2RGXS
	uf86KwCzOOJsEkLokxq8apVs30+mAOLb7XOtKaD7OND19gPCmf7gBfB49uOfRKoN
	8BgYinYc85jPYlJORQpQYEwxfT7R1EpdgGaqDgL1B1XDu2Udp8Iar/Ev4lB4xjNr
	geRVoxRGv5ssDuHVHPltI7Qho27r+0Z0PC0W8Q+WvR8dacNNtME9XHB/w==
X-ME-Sender: <xms:5NqkY8_o-uKawLamOWpsYNNRhDItH2oC_k13mXY2fB-EHjNtWhjFpA>
    <xme:5NqkY0s2yXqqNhiNHogL9Vl3TKhiMK2wA-xcMVhlOi9VTivVGbXNRYrNUhRry8Y2y
    zu9NvFcFwIL1PU>
X-ME-Received: <xmr:5NqkYyDY9xzTUghS8NoxYwB_iFYwecKNocfWNv-_0WvNZo5xPMXC2J7B8BN2UQWqpthUA5l59GiY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedtgdduieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
    gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:5NqkY8cxF0RrxRVhyZjWnvpLc1qhKxJV2QboTPaAuRDHE-lbTkDLiw>
    <xmx:5NqkYxPAUIa83HRYhMEe50YMyw3kIcYyLPSXCP_V074EduIf4uaJNw>
    <xmx:5NqkY2l2XcmBMJMR42bp1b8fGQ9LNu4RHgAu3V4F87xD3B5HrzWqBQ>
    <xmx:5dqkY9AfwGBhbXf2OB3vlvusCJtjVFruROgKkEOa7xiaZ3owQNW_PQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Tim Deegan <tim@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v6 5/5] x86: Use Linux's PAT
Date: Thu, 22 Dec 2022 17:31:50 -0500
Message-Id: <793bce119c7625000b3fe0a386f4145c842da37b.1671744225.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671744225.git.demi@invisiblethingslab.com>
References: <cover.1671744225.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is purely for testing, to see if it works around a bug in i915.  It
is not intended to be merged.

NOT-signed-off-by: DO NOT MERGE
---
 xen/arch/x86/include/asm/page.h      |  4 ++--
 xen/arch/x86/include/asm/processor.h | 10 +++++-----
 xen/arch/x86/mm.c                    |  8 --------
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index b585235d064a567082582c8e92a4e8283fd949ca..ab9b46f1d0901e50a83fd035ff28d1bda0b781a2 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -333,11 +333,11 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t);
 
 /* Memory types, encoded under Xen's choice of MSR_PAT. */
 #define _PAGE_WB         (                                0)
-#define _PAGE_WT         (                        _PAGE_PWT)
+#define _PAGE_WC         (                        _PAGE_PWT)
 #define _PAGE_UCM        (            _PAGE_PCD            )
 #define _PAGE_UC         (            _PAGE_PCD | _PAGE_PWT)
-#define _PAGE_WC         (_PAGE_PAT                        )
 #define _PAGE_WP         (_PAGE_PAT |             _PAGE_PWT)
+#define _PAGE_WT         (_PAGE_PAT | _PAGE_PCD | _PAGE_PWT)
 
 /*
  * Debug option: Ensure that granted mappings are not implicitly unmapped.
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 60b902060914584957db8afa5c7c1e6abdad4d13..3993d5638626f0948bb7ac8192d2eda187eb1bdb 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -94,16 +94,16 @@
 
 /*
  * Host IA32_CR_PAT value to cover all memory types.  This is not the default
- * MSR_PAT value, and is an ABI with PV guests.
+ * MSR_PAT value, and is needed by the Linux i915 driver.
  */
 #define XEN_MSR_PAT ((_AC(X86_MT_WB,  ULL) << 0x00) | \
-                     (_AC(X86_MT_WT,  ULL) << 0x08) | \
+                     (_AC(X86_MT_WC,  ULL) << 0x08) | \
                      (_AC(X86_MT_UCM, ULL) << 0x10) | \
                      (_AC(X86_MT_UC,  ULL) << 0x18) | \
-                     (_AC(X86_MT_WC,  ULL) << 0x20) | \
+                     (_AC(X86_MT_WB,  ULL) << 0x20) | \
                      (_AC(X86_MT_WP,  ULL) << 0x28) | \
-                     (_AC(X86_MT_UC,  ULL) << 0x30) | \
-                     (_AC(X86_MT_UC,  ULL) << 0x38))
+                     (_AC(X86_MT_UCM, ULL) << 0x30) | \
+                     (_AC(X86_MT_WT,  ULL) << 0x38))
 
 #ifndef __ASSEMBLY__
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index bacfb776d688f68dcbf79d83723fff329b75fd18..ea8c69e66c48419031add2e02da0a8eb6af8e49a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6417,14 +6417,6 @@ unsigned long get_upper_mfn_bound(void)
  */
 static void __init __maybe_unused build_assertions(void)
 {
-    /*
-     * If this trips, any guests that blindly rely on the public API in xen.h
-     * (instead of reading the PAT from Xen, as Linux 3.19+ does) will be
-     * broken.  Furthermore, live migration of PV guests between Xen versions
-     * using different PATs will not work.
-     */
-    BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
-
     /*
      * _PAGE_WB must be zero for several reasons, not least because Linux
      * PV guests assume it.
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

