Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E59B651786
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 02:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466410.725364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9Z-00077T-KO; Tue, 20 Dec 2022 01:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466410.725364; Tue, 20 Dec 2022 01:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9Z-00073g-BY; Tue, 20 Dec 2022 01:10:45 +0000
Received: by outflank-mailman (input) for mailman id 466410;
 Tue, 20 Dec 2022 01:10:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFeQ=4S=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p7R9X-0004T7-Af
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 01:10:43 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ea99cc1-8003-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 02:10:41 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6AA89320095B;
 Mon, 19 Dec 2022 20:10:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Dec 2022 20:10:40 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Dec 2022 20:10:38 -0500 (EST)
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
X-Inumbo-ID: 1ea99cc1-8003-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671498639; x=1671585039; bh=jKBlqS6uBObDCxBMOYDitp/iZJTqwZogf21
	3ESuaELQ=; b=MSaeBHKGAH+IOl5giKrtBihGrYO/b+hEQf4tVD9sGYKeS4m8Cr9
	r4TUK5EOfcKH0EAKVWDP0sTaq0C0/I0k2G03qr3Uox28wtQ2xGkKBa2A/7H6JPRP
	v1XcDKXkB8NkDKSfdeYb6NetTEUidV41xiCD3CVT48xpg4JklhKyuQ3TSCMgxNBL
	Uy8uQvSp863FN1QMkvjSD9rXcFRHcpWlGc2PY7aQCR2YuZ1ytARh/sV9Cmmgf8tI
	xqwFvyyA9UaNa5thQb6JEqWiKlrLUADL27Ga+ZrFI14jOskJZ7Ewu4wDi6V/IFY3
	Yi/HOt1mJwX6oSaOijnCEkSu8rmirtNnRAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671498639; x=1671585039; bh=jKBlqS6uBObDC
	xBMOYDitp/iZJTqwZogf213ESuaELQ=; b=UwdSKLUnFnHN8MiJLuuWEcEvzsqaf
	rcW6TjkLfLnBmILAQ1l0chWyXb7y2qd3y/Hs5BNInQXNw7JqABRwY0xAYBGJg0Fe
	xhliD38/fXcw1tPo13I4W7gKw8ouHrSRmOe0vmaNOSau471xFAD2HFgke1/0M+OH
	q6dwGmXT8uWOImos7y7ivHnid+HqYS1UBnqEKPIXhrilixbMptCMt9FAZjhit4GA
	7L7nUlK/Yyq4OYfBrf9zMoDCe2bbULFDKGeJPMNo9LouBeCtIQLSXAUWj3zMCCtr
	jbLS+nq+cXF0dzt417HKSs3o4mlMwiBp3q6sruroEWC6QH7mci++n0VSw==
X-ME-Sender: <xms:jguhY4zYLeEp8TgMz0UFQaLsZcIIxS-37Dh0MxhpUYYcLpvhfoiF-g>
    <xme:jguhY8QXGWKk1JdZa1VvmVoXRPloEmzQY4Iu-JYtrGXEMoSRxnWFSyfWgzPsHQXfu
    p_I6197NlG8iqk>
X-ME-Received: <xmr:jguhY6WOGSi7ZWPl1ZHny3DwNjIAb9v-dKnRjYw0h4guleLoqlt9RTfDKYLJGKKlG8_gJeHQkKxy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeggdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:jguhY2hmCeTxt5BjNYovhSVjwAhah4vEfLM2iP4Ao8KB0ei_EgHKIA>
    <xmx:jguhY6DOJV6S0yaEToREm2dRFjytMC5n5BovU4Vx1dZnhfO-tDDrmw>
    <xmx:jguhY3JWI8rc1O2e5jHZkDEKB2ZjFcjQ0uFRayB3hU5viHk2gFnogA>
    <xmx:jwuhY21qDRz9MF2SEnjgcXoomlE4ZZdPfPKpIaqAUyx_b_5mIkeSgw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v5 08/10] x86/mm: make code robust to future PAT changes
Date: Mon, 19 Dec 2022 20:07:10 -0500
Message-Id: <a8920eef3254cbf470a0d35a887dbaf0e4907a6d.1671497984.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671497984.git.demi@invisiblethingslab.com>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It may be desirable to change Xen's PAT for various reasons.  This
requires changes to several _PAGE_* macros as well.  Add static
assertions to check that XEN_MSR_PAT is consistent with the _PAGE_*
macros, and that _PAGE_WB is 0 as required by Linux.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Changes since v4:
- Add lots of comments explaining what the various BUILD_BUG_ON()s mean.

Changes since v3:
- Refactor some macros
- Avoid including a string literal in BUILD_BUG_ON
---
 xen/arch/x86/mm.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b40a575b61418ea1137299e68b64f7efd9efeced..a72556668633ee57b77c9a57d3a13dd5a12d9bbf 100644
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
@@ -6361,6 +6366,72 @@ static void __init __maybe_unused build_assertions(void)
      * using different PATs will not work.
      */
     BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
+
+    /*
+     * _PAGE_WB must be zero for several reasons, not least because Linux
+     * assumes it.
+     */
+    BUILD_BUG_ON(_PAGE_WB);
+
+    /* A macro to convert from cache attributes to actual cacheability */
+#define PAT_ENTRY(v) (0xFF & (XEN_MSR_PAT >> (8 * (v))))
+
+    /* Validate at compile-time that v is a valid value for a PAT entry */
+#define CHECK_PAT_ENTRY_VALUE(v)                                               \
+    BUILD_BUG_ON((v) < 0 || (v) > 7 ||                                         \
+                 (v) == X86_MT_RSVD_2 || (v) == X86_MT_RSVD_3)
+
+    /* Validate at compile-time that PAT entry v is valid */
+#define CHECK_PAT_ENTRY(v) do {                                                \
+    BUILD_BUG_ON((v) < 0 || (v) > 7);                                          \
+    CHECK_PAT_ENTRY_VALUE(PAT_ENTRY(v));                                       \
+} while (0);
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
+    /* Macro version of page_flags_to_cacheattr(), for use in BUILD_BUG_ON()s */
+#define PAGE_FLAGS_TO_CACHEATTR(page_value)                                    \
+    ((((page_value) >> 5) & 4) | (((page_value) >> 3) & 3))
+
+    /* Check that a PAT-related _PAGE_* macro is correct */
+#define CHECK_PAGE_VALUE(page_value) do {                                      \
+    /* Check that the _PAGE_* macros only use bits from PAGE_CACHE_ATTRS */    \
+    BUILD_BUG_ON(((_PAGE_##page_value) & PAGE_CACHE_ATTRS) !=                  \
+                  (_PAGE_##page_value));                                       \
+    /* Check that the _PAGE_* are consistent with XEN_MSR_PAT */               \
+    BUILD_BUG_ON(PAT_ENTRY(PAGE_FLAGS_TO_CACHEATTR(_PAGE_##page_value)) !=     \
+                 (X86_MT_##page_value));                                       \
+} while (0)
+
+    /*
+     * If one of these trips, the corresponding _PAGE_* macro is inconsistent
+     * with XEN_MSR_PAT.  This would cause Xen to use incorrect cacheability
+     * flags, with results that are undefined and probably harmful.
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

