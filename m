Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C3A64BF68
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461336.719486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Drd-0003Fj-Rt; Tue, 13 Dec 2022 22:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461336.719486; Tue, 13 Dec 2022 22:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Drd-00039t-MP; Tue, 13 Dec 2022 22:35:05 +0000
Received: by outflank-mailman (input) for mailman id 461336;
 Tue, 13 Dec 2022 22:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5DlV-000519-6e
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:28:45 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d4213f6-7b35-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:28:39 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2BA8332007F0;
 Tue, 13 Dec 2022 17:28:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 13 Dec 2022 17:28:37 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:28:35 -0500 (EST)
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
X-Inumbo-ID: 7d4213f6-7b35-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670970516; x=1671056916; bh=SYVIhlygQCbQDxRM0Jvhm4RPjrLE8QTHJIb
	nQIRdaN4=; b=mzKKWnLkNm/PJhMQoe6dTzWBW4NWkUeoYBsHPHgcgVp0az7eqYy
	hBY2k+F5mda6NIiP4DfsRsVZf1aJbdrWLrUDmdRK3f6N1+t3U+AQM6GMZBLAywTf
	sOCmZfEjbMWj+MxP82b70JaLJ1+xACf0jpePW2rhpWej46KyYEiTfBxbUYYRK0J5
	3HuBjdY/uBPy2WaBIGsmDrFdNJSNzqKVosnkFH7VTaLesumIXxNm3HPMjLDVvecT
	w3uaRvZ8D16DpQ2zhCQvRzwdldXISO0vnE9/GX1X3oKPZvWISjuKpVX2JooAbFOj
	fvKLuSix0lpP1kYshKD6EWQKzLVnHXu250A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670970516; x=1671056916; bh=SYVIhlygQCbQD
	xRM0Jvhm4RPjrLE8QTHJIbnQIRdaN4=; b=BxXIrc3t8f2Y4hjzdwY0vjzjCeZom
	gLeTSxLS1MTo+sJLqWkdKb33TqAkl00NYyoCMtwpQnAd3o3TLdv95SUXzltasECv
	+umqZfPlm/L3fY9CEjLySxsd3oqzCGDsQgCJZzIITvaLbuMPp7yzp9wEHowQ/Gbc
	alI1Iah7KTdTgT6BeEvK8bZYYkyl3b54UE87jJ7RFlvg6HHLr+qgTVcbwp9GyuIO
	Z+KCCfrMVoBiJFykPcymM2uVVnY8AR3T2Zit3ByjQkE9i9OHGPV9CjZzQvwMsHVx
	30q/6LpA+Cr6TZXJOPFJGQjLEL+A4vPx1Zcyw9CsEkFzw17CGFsfR2EnQ==
X-ME-Sender: <xms:lPyYY04rooUitHEjHk5XgyzNEz5icIMQXLC5ih4VJTJ8rCHLSiNNyg>
    <xme:lPyYY16g0nBTUxI6WDHPMjtH6e8SoaOSA5-oa6s3YjLMWkq7FtOa4eiUgT24JNrfe
    gv09pmntJmAmBU>
X-ME-Received: <xmr:lPyYYzcUy5fKQ5XMGWyIoABEnnWFHfDJct0gttdSwJ5xpHfwVD8OtVhXXBnZhsZHRZ0ND5qSSBnO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpeefnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:lPyYY5JxOK_r3WFcQzjUebjAPqidJ8xjsDe4hhJz9Ek70EicyZmBUg>
    <xmx:lPyYY4JL7dun01lpPavJWK68Q1eHdZEyNUSWmYldSE_BD7aKk31VAg>
    <xmx:lPyYY6yOnq6TxawM15V4_49Q7Ai-Z_BNNhC8DRIe2o2kRbJmVCFmGQ>
    <xmx:lPyYY394UyFd0x99MvyHF8l82VApJPFgrVSp1YKTlxwHa4XhTO-veg>
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
Subject: [PATCH v2 12/14] x86/mm: make code robust to future PAT changes
Date: Tue, 13 Dec 2022 17:26:53 -0500
Message-Id: <7d62227e2b25909afed8b489819a12e24bf27024.1670948141.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It may be desirable to change Xen's PAT for various reasons.  This
requires changes to several _PAGE_* macros as well.  Add static
assertions to check that XEN_MSR_PAT is consistent with the _PAGE_*
macros, and that _PAGE_WB is 0 as required by Linux.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/mm.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index a8def47aa3bf9770576c62a190032d45d63dd86e..7fb1a0f91910952640378f316a68096a08895b37 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6357,8 +6357,44 @@ unsigned long get_upper_mfn_bound(void)
 
 static void __init __maybe_unused build_assertions(void)
 {
+    /* A bunch of static assertions to check that the XEN_MSR_PAT is valid
+     * and consistent with the _PAGE_* macros */
     BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL &&
                  "wrong XEN_MSR_PAT breaks PV guests");
+    BUILD_BUG_ON(_PAGE_WB && "Linux requires _PAGE_WB to be 0");
+#define PAT_VALUE(v) (0xFF & (XEN_MSR_PAT >> (8 * (v))))
+#define BAD_VALUE(v) ((v) < 0 || (v) > 7 ||                                    \
+                      (v) == X86_MT_RESERVED_1 || (v) == X86_MT_RESERVED_2)
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
+                 (X86_MT_##page_value));                                       \
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
 }
 
 /*
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

