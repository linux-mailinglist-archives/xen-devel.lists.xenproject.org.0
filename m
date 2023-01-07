Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC876611F3
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jan 2023 23:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473026.733512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEHLa-0008Ml-Lc; Sat, 07 Jan 2023 22:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473026.733512; Sat, 07 Jan 2023 22:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEHLa-0008Kl-Gk; Sat, 07 Jan 2023 22:07:26 +0000
Received: by outflank-mailman (input) for mailman id 473026;
 Sat, 07 Jan 2023 22:07:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TYdO=5E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pEHLY-0007Zv-9Q
 for xen-devel@lists.xenproject.org; Sat, 07 Jan 2023 22:07:24 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7a36bb3-8ed7-11ed-91b6-6bf2151ebd3b;
 Sat, 07 Jan 2023 23:07:20 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CCA885C00A3;
 Sat,  7 Jan 2023 17:07:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 07 Jan 2023 17:07:19 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jan 2023 17:07:18 -0500 (EST)
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
X-Inumbo-ID: a7a36bb3-8ed7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1673129239; x=1673215639; bh=KY3VkgyHYk1MHJ+JHUtQDqXke9gx/LY5Hil
	UBmVJC3E=; b=q0My5TYPQPe18oQO9hEvLKwKW4d5zSqUxAmpDHBGYJTZbjLsdMg
	d54+OrM2pLEeGZNx2T/uxC+8c7DyQtEQWx0q9G2yeTCMAlx+Fbjp3e0KyOSVm5YM
	LYsCVHOKrclVDK9FSuCJ71FjhNK5AjDQkqOfs3m2WNrU8ksXdVEyYIsnTnR3WJV2
	nxi8dKxqAU+6FM0giP6m+8XWdoLF9TWTykok7WExRdx96/sfSb3gBltJiLXC20B7
	BkQCdraxZqWqhf4OQUsm/Q5DyPtvxKyYg8vN46fuAAeq1dbqXAHUGqeNDnJ/qq/P
	+oBGQob73HEH9a2loAS6w/CAT04SIO7QOOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1673129239; x=1673215639; bh=KY3VkgyHYk1MH
	J+JHUtQDqXke9gx/LY5HilUBmVJC3E=; b=AjOHpAmEwZB3gnpwa+jDY1P8wlWzL
	ropOlFa9K5T58Pl3kZi4eArD1izpdCbYooGZ6aLg3pDtuhSpNfZGdogbINRVkjb6
	wz7Ghm7nN2qUSB1c0MqLQT8B2RL4tvYJzjG8kLJdaYKCB8rAtKb6W8QMCd1O3Vf0
	5Be2CJ7i9qffwvMFtO+nvi0ROjkXh+A5cgGb2QoRL/0ebG74ozA8oFSX6J3pSx1L
	WMjrH7aSYCPa0iulETHO/STnVx/dPqkKg8hlduV0gKl9CiHHfdcCDkAOUHJYXXaO
	diQwrCrPsPyd0Ja1eI0jQD6jvJfiDvZQevHpXB1Dk8reMUqo2h+KAs3IA==
X-ME-Sender: <xms:F-25Y5mQVMLNNZilFqi5Oh921MVKPSJIytdoVLFMmxosv60Of7jEcw>
    <xme:F-25Y00j7foDT-878D8gn0aiQFI9pHPirq74oCa2abnMRr-6C1t0tWhZL2M8dH5Ut
    NF1dLu0MvHyOvU>
X-ME-Received: <xmr:F-25Y_qNCy2q17TegT6_fWNAVIcu_gZZBG1w8LqCqHIODOuDbfO3rUBUUX7lD6oD8tA5hG0VPEd2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkedvgdduheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
    gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:F-25Y5l71YLa0apdx4Hx2xbOfcNQjYiQlXhkVzgEfIu5T_YN6H3Y9w>
    <xmx:F-25Y33aQF1hZE_sHYNKRQFFCc37cDeSqGSQNV8w_0EFVtRW_I_cvg>
    <xmx:F-25Y4vxC0uJSc0Bav-8AkfezIt0SICo8ubjwLs-ZR4ZmilDSWzWSg>
    <xmx:F-25YwLpAdRkRGPwoFEMnspu1D01E08LFaazgm4baAxamxYYBaSFbA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v7 3/4] x86/mm: make code robust to future PAT changes
Date: Sat,  7 Jan 2023 17:07:05 -0500
Message-Id: <89201c66b0261b2f5ee83e7672830317fde21dfa.1673123823.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673123823.git.demi@invisiblethingslab.com>
References: <cover.1673123823.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It may be desirable to change Xen's PAT for various reasons.  This
requires changes to several _PAGE_* macros as well.  Add static
assertions to check that XEN_MSR_PAT is consistent with the _PAGE_*
macros, and that _PAGE_WB is 0 as required by Linux.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Changes since v6:
- Remove overly-specific comment.
- Remove double blank line.
- Check that unused entries are distinct from higher entries that are
  used.
- Have PTE_FLAGS_TO_CACHEATTR validate its argument.
- Do not check if an unsigned number is negative.
- Expand comment explaining why _PAGE_WB must be zero.

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

Additional checks on PAT values

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/include/asm/page.h |  2 +
 xen/arch/x86/mm.c               | 96 +++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index b585235d064a567082582c8e92a4e8283fd949ca..c7d77ab2901aa5bdb03a719af810c6f8d8ba9d4e 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -338,6 +338,8 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t);
 #define _PAGE_UC         (            _PAGE_PCD | _PAGE_PWT)
 #define _PAGE_WC         (_PAGE_PAT                        )
 #define _PAGE_WP         (_PAGE_PAT |             _PAGE_PWT)
+#define _PAGE_RSVD_1     (_PAGE_PAT | _PAGE_PCD            )
+#define _PAGE_RSVD_2     (_PAGE_PAT | _PAGE_PCD | _PAGE_PWT)
 
 /*
  * Debug option: Ensure that granted mappings are not implicitly unmapped.
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index a8f137925cba1846b97aee9321df6427f4dd1a94..d69e9bea6c30bc782ab4c331f42502f6e61a028a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -890,6 +890,8 @@ get_page_from_l1e(
         case _PAGE_WT:
         case _PAGE_WP:
             break;
+        case _PAGE_RSVD_1:
+        case _PAGE_RSVD_2:
         default:
             /*
              * If we get here, a PV guest tried to use one of the
@@ -6412,6 +6414,100 @@ static void __init __maybe_unused build_assertions(void)
      * using different PATs will not work.
      */
     BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
+
+    /*
+     * _PAGE_WB must be zero.  Linux PV guests assume that _PAGE_WB will be
+     * zero, and indeed Linux has a BUILD_BUG_ON validating that their version
+     * of _PAGE_WB *is* zero.  Furthermore, since _PAGE_WB is zero, it is quite
+     * likely to be omitted from various parts of Xen, and indeed L1 PTE
+     * validation code checks that ((l1f & PAGE_CACHE_ATTRs) == 0), not
+     * ((l1f & PAGE_CACHE_ATTRs) == _PAGE_WB).
+     */
+    BUILD_BUG_ON(_PAGE_WB);
+
+    /* _PAGE_RSVD_1 must be less than _PAGE_RSVD_2 */
+    BUILD_BUG_ON(_PAGE_RSVD_1 >= _PAGE_RSVD_2);
+
+#define PAT_ENTRY(v)                                                           \
+    (BUILD_BUG_ON_ZERO(((v) < 0) || ((v) > 7)) +                               \
+     (0xFF & (XEN_MSR_PAT >> (8 * (v)))))
+
+    /* Validate at compile-time that v is a valid value for a PAT entry */
+#define CHECK_PAT_ENTRY_VALUE(v)                                               \
+    BUILD_BUG_ON((v) > X86_NUM_MT || (v) == X86_MT_RSVD_2 ||                   \
+                 (v) == X86_MT_RSVD_3)
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
+    /* Macro version of pte_flags_to_cacheattr(), for use in BUILD_BUG_ON()s */
+#define PTE_FLAGS_TO_CACHEATTR(pte_value)                                      \
+    /* Check that the _PAGE_* macros only use bits from PAGE_CACHE_ATTRS */    \
+    (BUILD_BUG_ON_ZERO(((pte_value) & PAGE_CACHE_ATTRS) != (pte_value)) |      \
+     (((pte_value) & _PAGE_PAT) >> 5) |                                        \
+     (((pte_value) & (_PAGE_PCD | _PAGE_PWT)) >> 3))
+
+    CHECK_PAT_ENTRY(PTE_FLAGS_TO_CACHEATTR(_PAGE_RSVD_1));
+    CHECK_PAT_ENTRY(PTE_FLAGS_TO_CACHEATTR(_PAGE_RSVD_2));
+#define PAT_ENTRY_FROM_FLAGS(x) PAT_ENTRY(PTE_FLAGS_TO_CACHEATTR(x))
+
+    /* Validate at compile time that X does not duplicate a smaller PAT entry */
+#define CHECK_DUPLICATE_ENTRY(x, y)                                            \
+    BUILD_BUG_ON((x) >= (y) &&                                                 \
+                 (PAT_ENTRY_FROM_FLAGS(x) == PAT_ENTRY_FROM_FLAGS(y)))
+
+    /* Check that a PAT-related _PAGE_* macro is correct */
+#define CHECK_PAGE_VALUE(page_value) do {                                      \
+    /* Check that the _PAGE_* macros only use bits from PAGE_CACHE_ATTRS */    \
+    BUILD_BUG_ON(((_PAGE_ ## page_value) & PAGE_CACHE_ATTRS) !=                \
+                 (_PAGE_ ## page_value));                                      \
+    /* Check that the _PAGE_* are consistent with XEN_MSR_PAT */               \
+    BUILD_BUG_ON(PAT_ENTRY(PTE_FLAGS_TO_CACHEATTR(_PAGE_ ## page_value)) !=    \
+                 (X86_MT_ ## page_value));                                     \
+    case _PAGE_ ## page_value:; /* ensure no duplicate values */               \
+    /*                                                                         \
+     * Check that the _PAGE_* entries do not duplicate a smaller reserved      \
+     * entry.                                                                  \
+     */                                                                        \
+    CHECK_DUPLICATE_ENTRY(_PAGE_ ## page_value, _PAGE_RSVD_1);                 \
+    CHECK_DUPLICATE_ENTRY(_PAGE_ ## page_value, _PAGE_RSVD_2);                 \
+    CHECK_PAT_ENTRY(PTE_FLAGS_TO_CACHEATTR(_PAGE_ ## page_value));             \
+} while ( false )
+
+    /*
+     * If one of these trips, the corresponding _PAGE_* macro is inconsistent
+     * with XEN_MSR_PAT.  This would cause Xen to use incorrect cacheability
+     * flags, with results that are unknown and possibly harmful.
+     */
+    switch (0) {
+    CHECK_PAGE_VALUE(WT);
+    CHECK_PAGE_VALUE(WB);
+    CHECK_PAGE_VALUE(WC);
+    CHECK_PAGE_VALUE(UC);
+    CHECK_PAGE_VALUE(UCM);
+    CHECK_PAGE_VALUE(WP);
+    case _PAGE_RSVD_1:
+    case _PAGE_RSVD_2:
+        break;
+    }
+#undef CHECK_PAT_ENTRY
+#undef CHECK_PAT_ENTRY_VALUE
+#undef CHECK_PAGE_VALUE
+#undef PAGE_FLAGS_TO_CACHEATTR
+#undef PAT_ENTRY
 }
 
 /*
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


