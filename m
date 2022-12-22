Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16DB654891
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 23:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468695.727895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8U6k-0003pX-GT; Thu, 22 Dec 2022 22:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468695.727895; Thu, 22 Dec 2022 22:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8U6k-0003hT-94; Thu, 22 Dec 2022 22:32:10 +0000
Received: by outflank-mailman (input) for mailman id 468695;
 Thu, 22 Dec 2022 22:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9VX=4U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p8U6i-0003ch-KI
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 22:32:08 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7543d582-8248-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 23:32:04 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5B9335C00C2;
 Thu, 22 Dec 2022 17:32:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 22 Dec 2022 17:32:03 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 17:32:02 -0500 (EST)
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
X-Inumbo-ID: 7543d582-8248-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671748323; x=1671834723; bh=0nRr0i7/1Be3waop69DyVG4xMKlizVzYIQX
	QdZSs51s=; b=QWqG5LU14CB3fBZ8e/nMgyGfh4Imy407zcYrUfzC+pBe+sBydqA
	TTurJzo0KMgDUjWvz5gxgzD63tY2+c89VTA28vAmtqUSquCSRMEJoYYSLDzQ5tbf
	kkOpEK9xwDuHd4dr437omHjL137aS3LW3NzGJomjRujSX+RaOw/pYa4yCk0oideK
	hmPk8PN6HDpMoVnVAJXK4wM7JlU6B3nzoUBNaEMcZKu+eCFd05/yJ00qHp3h8tfa
	ox1tgDfc/VOkQrUl6MtkZabpb89NyJfA1Bvk89lhwRLIXaBFYb3RNcOLyN3mFL95
	kPyC8Z5NkYcgxbrRju8X6inGbzYxRZkTBRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671748323; x=1671834723; bh=0nRr0i7/1Be3w
	aop69DyVG4xMKlizVzYIQXQdZSs51s=; b=VZZfJRpfMiOI0d1skqasFEgxQg9AD
	0g+7pPPkD2KkHQPqCR+ZMgPG+7nO3nVjaNqvnzoY6gOhkDOgPGPII4bqBp5JRAOu
	U3BNW7WnLThLvp4V1TBIlarTZ1+hx3OAlO0qwGyGuRYlE9QSw5YM2kA8S++Bib8U
	NEYpkoABGeflH6vwCDYjRNH5IrBsfUoabRh56DCpt76oTzl6LyXnzbxJCd0/PeIH
	lzbaiApa7RtqAYv161+LRA/F4nHWmWDOZYm4ptkTwY44BR7DV1aX/loVvl6oqw0w
	G4lnE3llAqruSXLfV96N1esgLsqx7gwkArRWeO49VM1Q/nBiYwY93/P0A==
X-ME-Sender: <xms:49qkYyzSvEy68-SfTYdECuEy_YqoOXj_J5yLK2SP6x-nK4jEJFcMRg>
    <xme:49qkY-Qgv4E3DY8oMNcWuZz8ulaBgOnH5bQ86aw6Q83kA2EY-tht8SMxkRV-_m69x
    tBi5_y5eQmONg4>
X-ME-Received: <xmr:49qkY0UxfvfYwOQmVIFTQAgXegigKxD1SPxT6DrISW_jSJZ6NhKdxeEpbMas3B2oBXXFIFZjuDZt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedtgdduieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
    gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:49qkY4hkfkdKvh1-PZDFCe9WcoaMf9UAhOajFYhT1sy4unCLGb0X8Q>
    <xmx:49qkY0DCxtiy8ezGMMqLfwadF9FxuvbCk3LNWimJIvsAWCF--X4DAQ>
    <xmx:49qkY5LRDPNeBzjems5vO07JNi2n9VkGOGJ8yLktQXiaXAo2d22UdA>
    <xmx:49qkY20a81wlMW0kTIXzE2h-2KNn--PDOavr21mTl77meEBPwyXUrg>
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
Subject: [PATCH v6 3/5] x86/mm: make code robust to future PAT changes
Date: Thu, 22 Dec 2022 17:31:48 -0500
Message-Id: <00505454afa89b759122008852502a5ef7b1b1ee.1671744225.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671744225.git.demi@invisiblethingslab.com>
References: <cover.1671744225.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It may be desirable to change Xen's PAT for various reasons.  This
requires changes to several _PAGE_* macros as well.  Add static
assertions to check that XEN_MSR_PAT is consistent with the _PAGE_*
macros, and that _PAGE_WB is 0 as required by Linux.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Changes since v5:
- Remove unhelpful comment.
- Move a BUILD_BUG_ON.
- Use fewer hardcoded constants in PTE_FLAGS_TO_CACHEATTR.
- Fix coding style.

Changes since v4:
- Add lots of comments explaining what the various BUILD_BUG_ON()s mean.

Changes since v3:
- Refactor some macros
- Avoid including a string literal in BUILD_BUG_ON
---
 xen/arch/x86/mm.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 3558ca215b02a517d55d75329d645ae5905424e4..65ba0f58ed8c26ac0343528303851739981c03bd 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6352,6 +6352,11 @@ unsigned long get_upper_mfn_bound(void)
     return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
 }
 
+
+/*
+ * A bunch of static assertions to check that the XEN_MSR_PAT is valid
+ * and consistent with the _PAGE_* macros, and that _PAGE_WB is zero.
+ */
 static void __init __maybe_unused build_assertions(void)
 {
     /*
@@ -6361,6 +6366,71 @@ static void __init __maybe_unused build_assertions(void)
      * using different PATs will not work.
      */
     BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
+
+    /*
+     * _PAGE_WB must be zero for several reasons, not least because Linux
+     * PV guests assume it.
+     */
+    BUILD_BUG_ON(_PAGE_WB);
+
+#define PAT_ENTRY(v)                                                           \
+    (BUILD_BUG_ON_ZERO(((v) < 0) || ((v) > 7)) +                               \
+     (0xFF & (XEN_MSR_PAT >> (8 * (v)))))
+
+    /* Validate at compile-time that v is a valid value for a PAT entry */
+#define CHECK_PAT_ENTRY_VALUE(v)                                               \
+    BUILD_BUG_ON((v) < 0 || (v) > 7 ||                                         \
+                 (v) == X86_MT_RSVD_2 || (v) == X86_MT_RSVD_3)
+
+    /* Validate at compile-time that PAT entry v is valid */
+#define CHECK_PAT_ENTRY(v) CHECK_PAT_ENTRY_VALUE(PAT_ENTRY(v))
+
+    /*
+     * If one of these trips, the corresponding entry in XEN_MSR_PAT is invalid.
+     * This would cause Xen to crash (with #GP) at startup.
+     */
+    CHECK_PAT_ENTRY(0);
+    CHECK_PAT_ENTRY(1);
+    CHECK_PAT_ENTRY(2);
+    CHECK_PAT_ENTRY(3);
+    CHECK_PAT_ENTRY(4);
+    CHECK_PAT_ENTRY(5);
+    CHECK_PAT_ENTRY(6);
+    CHECK_PAT_ENTRY(7);
+
+#undef CHECK_PAT_ENTRY
+#undef CHECK_PAT_ENTRY_VALUE
+
+    /* Macro version of pte_flags_to_cacheattr(), for use in BUILD_BUG_ON()s */
+#define PTE_FLAGS_TO_CACHEATTR(pte_value)                                      \
+    ((((pte_value) & _PAGE_PAT) >> 5) |                                        \
+     (((pte_value) & (_PAGE_PCD | _PAGE_PWT)) >> 3))
+
+    /* Check that a PAT-related _PAGE_* macro is correct */
+#define CHECK_PAGE_VALUE(page_value) do {                                      \
+    /* Check that the _PAGE_* macros only use bits from PAGE_CACHE_ATTRS */    \
+    BUILD_BUG_ON(((_PAGE_ ## page_value) & PAGE_CACHE_ATTRS) !=                \
+                 (_PAGE_ ## page_value));                                      \
+    /* Check that the _PAGE_* are consistent with XEN_MSR_PAT */               \
+    BUILD_BUG_ON(PAT_ENTRY(PTE_FLAGS_TO_CACHEATTR(_PAGE_ ## page_value)) !=    \
+                 (X86_MT_ ## page_value));                                     \
+} while ( false )
+
+    /*
+     * If one of these trips, the corresponding _PAGE_* macro is inconsistent
+     * with XEN_MSR_PAT.  This would cause Xen to use incorrect cacheability
+     * flags, with results that are unknown and possibly harmful.
+     */
+    CHECK_PAGE_VALUE(WT);
+    CHECK_PAGE_VALUE(WB);
+    CHECK_PAGE_VALUE(WC);
+    CHECK_PAGE_VALUE(UC);
+    CHECK_PAGE_VALUE(UCM);
+    CHECK_PAGE_VALUE(WP);
+
+#undef CHECK_PAGE_VALUE
+#undef PAGE_FLAGS_TO_CACHEATTR
+#undef PAT_ENTRY
 }
 
 /*
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

