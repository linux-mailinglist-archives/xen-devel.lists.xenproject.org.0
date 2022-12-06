Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD6F643C50
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 05:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454338.711924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2PfD-0007B4-0C; Tue, 06 Dec 2022 04:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454338.711924; Tue, 06 Dec 2022 04:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2PfC-00078V-SG; Tue, 06 Dec 2022 04:34:38 +0000
Received: by outflank-mailman (input) for mailman id 454338;
 Tue, 06 Dec 2022 04:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2PfB-0005MV-ES
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 04:34:37 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 495bd197-751f-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 05:34:36 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 29CEA32009EC;
 Mon,  5 Dec 2022 23:34:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 05 Dec 2022 23:34:34 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Dec 2022 23:34:32 -0500 (EST)
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
X-Inumbo-ID: 495bd197-751f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670301273; x=1670387673; bh=T0aIZzrDadhvtD5mn+zJFIJWFtiX5Pwc1wj
	o5NMXh6Y=; b=XWGDwmRGgv4X9ujc8J/B1bh8ZHZGgJnfenvzQ/pLXlTtGreDGiR
	DmrJHeTgYwKCaOykGxGDiFbtvPzc/B+9585OfNyIYskEGpVfIvgNweJsNCeNkcSx
	engG+MVH/TzexeDEp/20kWi+2bktePcZzALSyN4M96EfZY9pDS15NNqRd8K/Gkkk
	4T3D3BiP4LzXeUJLXtTZukGVbRjvoLCKaRca/TFS9s010zW05q3D8JQ4TaRjRUYT
	gRV9cp5JU12z99fynPr0Hf4gistz9iky3hF+sumk6wjOkFTt+ip3mrtcyUPDztqO
	7K50pVadSK4dCmarEWUixab8rPang62dFrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1670301273; x=1670387673; bh=T0aIZzrDadhvt
	D5mn+zJFIJWFtiX5Pwc1wjo5NMXh6Y=; b=MF+VpGM5Ugdy4jY8PXPP+4q7BCrPN
	Eezq3kVESbyXNxD2d3Nmw641a1LgaQ5W+iYyhLF6a+NY/kyhTBT8dLfxLYJSS2KH
	fm5MTFDWFrN21lQXsm3eTOPJnNqz/PIVoRy2loQsvSiyV1sOJuhdRL6oLbUnmioB
	nCfLEuoWoxCbCCuODbeMAMOlPAr94mTvPRKzmYJAIANZQvGD7Qi3f+APWE2/5Am2
	S5PNNF/Y2HoZN/0J5QMpEYUEYjmU93nkNfyxE2ELPxx9H0Mc8vhQbFN4hFgj/258
	QKgaXqcMo7DImZlE0R1uboX/dKDxLjJ/XNjvXEVQM7w6XP5rek/16uDNA==
X-ME-Sender: <xms:WcaOYyFlfSgIGU5ccjbW18BvAoMOI9cI-1y60Uk-9spHEBQoXJiFfA>
    <xme:WcaOYzXRoQZWJvgmbu-4W64fpPUcp1uLAU3BJgdWJyq1cSdIdUba4LsKnokveOzzi
    At8kiAJsC7VACA>
X-ME-Received: <xmr:WcaOY8IJGP_x1DMPGRqurC_qu6inYC-k_Kk8NGF5ca5xvrBRnw82UxfWxwKr03OYV47V40i-olWX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:WcaOY8Hfu7Wp_C2tQylS7RF5ilAd4mnD1ek42OMfHUj_0wbIEF3TEQ>
    <xmx:WcaOY4VvNQxY7mG3q-UUJoS0bDtxEdb5Ui06luU9ijpGtEY0IITDwA>
    <xmx:WcaOY_OVdNpJQVfy9UIvqGZ7GfRLeXTXAACh_GeAQvVkPO1NAoFYOw>
    <xmx:WcaOY6JUAiHwOW3fDwxu2-JZWC3cFfGWJBXHMQycWO2UAyxMg9MJ6g>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH 7/8] x86/mm: make code robust to future PAT changes
Date: Mon,  5 Dec 2022 23:33:36 -0500
Message-Id: <33f3896ba4cdf50ceb0377f071682ac5d3f576c4.1670300446.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1670300446.git.demi@invisiblethingslab.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It may be desirable to change Xen's PAT for various reasons.  This
requires changes to several _PAGE_* macros as well.  Add static
assertions to check that XEN_MSR_PAT is consistent with the _PAGE_*
macros.

Additionally, Xen has two unused entries in the PAT.  Currently these
are UC, but this will change if the hardware ever supports additional
memory types.  To avoid future problems, this adds a check in debug
builds that injects #GP into a guest that tries to use one of these
entries, along with returning -EINVAL from the hypercall.  Future
versions of Xen will refuse to use these entries even in release builds.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/mm.c | 58 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 5d05399c3a841bf03991a3bed63df9a815c1e891..517fccee699b2a673ba537e47933aefc80017aa5 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -849,6 +849,45 @@ static int cf_check print_mmio_emul_range(
 }
 #endif
 
+static void __init __maybe_unused build_assertions(void)
+{
+    /* A bunch of static assertions to check that the XEN_MSR_PAT is valid
+     * and consistent with the _PAGE_* macros */
+#define PAT_VALUE(v) (0xFF & (XEN_MSR_PAT >> (8 * (v))))
+#define BAD_VALUE(v) ((v) < 0 || (v) > 7 ||                                    \
+                      (v) == MSR_PAT_RESERVED_1 || (v) == MSR_PAT_RESERVED_2)
+#define BAD_PAT_VALUE(v) BUILD_BUG_ON(BAD_VALUE(PAT_VALUE(v)))
+    BAD_PAT_VALUE(0);
+    BAD_PAT_VALUE(1);
+    BAD_PAT_VALUE(2);
+    BAD_PAT_VALUE(3);
+    BAD_PAT_VALUE(4);
+    BAD_PAT_VALUE(5);
+    BAD_PAT_VALUE(6);
+    BAD_PAT_VALUE(7);
+#undef BAD_PAT_VALUE
+#undef BAD_VALUE
+#define PAT_SHIFT(page_value) (((page_value) & _PAGE_PAT) >> 5 |               \
+                               ((page_value) & (_PAGE_PCD | _PAGE_PWT)) >> 3)
+#define CHECK_PAGE_VALUE(page_value) do {                                      \
+    /* Check that the _PAGE_* macros only use bits from PAGE_CACHE_ATTRS */    \
+    BUILD_BUG_ON(((_PAGE_##page_value) & PAGE_CACHE_ATTRS) !=                  \
+                  (_PAGE_##page_value));                                       \
+    /* Check that the _PAGE_* are consistent with XEN_MSR_PAT */               \
+    BUILD_BUG_ON(PAT_VALUE(PAT_SHIFT(_PAGE_##page_value)) !=                   \
+                 (MSR_PAT_##page_value));                                      \
+} while (0)
+    CHECK_PAGE_VALUE(WT);
+    CHECK_PAGE_VALUE(WB);
+    CHECK_PAGE_VALUE(WC);
+    CHECK_PAGE_VALUE(UC);
+    CHECK_PAGE_VALUE(UCM);
+    CHECK_PAGE_VALUE(WP);
+#undef CHECK_PAGE_VALUE
+#undef PAT_SHIFT
+#undef PAT_VALUE
+}
+
 /*
  * get_page_from_l1e returns:
  *   0  => success (page not present also counts as such)
@@ -961,13 +1000,24 @@ get_page_from_l1e(
 
         switch ( l1f & PAGE_CACHE_ATTRS )
         {
-        case _PAGE_WB:
+        default:
+#ifndef NDEBUG
+            printk(XENLOG_G_WARNING
+                   "d%d: Guest tried to use bad cachability attribute %u for MFN %lx\n",
+                   l1e_owner->domain_id, l1f & PAGE_CACHE_ATTRS, mfn);
+            pv_inject_hw_exception(TRAP_gp_fault, 0);
+            return -EINVAL;
+#endif
         case _PAGE_WT:
         case _PAGE_WP:
-            flip |= (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC;
+        case _PAGE_WB:
+            /* Force this to be uncachable */
+            return flip | ( (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC );
+        case _PAGE_WC:
+        case _PAGE_UC:
+        case _PAGE_UCM:
+            return flip;
         }
-
-        return flip;
     }
 
     if ( unlikely((real_pg_owner != pg_owner) &&
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


