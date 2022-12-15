Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C43764E4E6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 00:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463956.722335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7P-0003lH-CJ; Thu, 15 Dec 2022 23:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463956.722335; Thu, 15 Dec 2022 23:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7P-0003gI-6d; Thu, 15 Dec 2022 23:58:27 +0000
Received: by outflank-mailman (input) for mailman id 463956;
 Thu, 15 Dec 2022 23:58:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+b5=4N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5y7O-0001Aq-17
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 23:58:26 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ba770d5-7cd4-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 00:58:24 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D60A7320090F;
 Thu, 15 Dec 2022 18:58:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 15 Dec 2022 18:58:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 18:58:20 -0500 (EST)
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
X-Inumbo-ID: 5ba770d5-7cd4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671148701; x=1671235101; bh=dMVGCS/x++7SYj3ENPzOdGMWJy+wZ+3Rx/D
	/BV2TFuE=; b=YtTNEDmfuwGRjuqwwUCs8BmVmigOIxrt423/Rk40wKu4LuRecdC
	8tFt9GfrDpqkEcA7ti4Hd6kUxmwCt/wQ+bOJTvU/34HdFQWaJkGF3R77PSpAyMPH
	NWiMkUa1xW40W1+TTnqKJiGHRw/mYiUVXLRfecb4I+ceYzHHxcYdbKe1xM1DT0SD
	h+L9vL6gOclPnWLQytQv8VQi08GDz188bedAOeb89DXyq85mzBm8kho5Zxs3thfX
	yqWwR4fjKJRsj6MsBh/iQCDiwCndGdo1U/TMixxtwynUnb23JqG+UqdyMXw5Hk/S
	zeQbqYkI6moObE4Z/1Gw4AOIcQL687TwEDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671148701; x=1671235101; bh=dMVGCS/x++7SY
	j3ENPzOdGMWJy+wZ+3Rx/D/BV2TFuE=; b=KgJtnU/BjGq29s9lMdacc8q5piIwj
	Nn+GP4FKHevd0DxCwgOMj8vc0w4lVYrHPUloiyXbd6sAU5Oj7D5qbFODEQotHIlN
	FqeR33Ziw4c2Scf/GKi0W38gkAy2Kqc2XoyA212WiAtN3zqz8fd3ObEtS9FXr6qS
	X/yu6myvqTpcsUF1rojopZcmPmzo43I7tcQxAo8nLzNhObtIhIbrm8Mt2vaU8RdV
	rqVLBRCEYA6N36KvpsMR/VaZOvHaPihhWpAYQz0IRngLuDmRh9g4YN7YU7imHleu
	QRn4R+JGPwFEJPa6jhxV38x2G4XtmDZMQsD78KlMdQyBItZ0AIhc045HA==
X-ME-Sender: <xms:nbSbY7BFJyQsyl-yBmASzpYdpqvvjeW-5arObyC2na8Ge9IWIRNCAA>
    <xme:nbSbYxjoitOvK_2gAyXgVlb0dUaZz3-02wmwq5YD_dxlUWqbDFVp61H0Wz2qDPemv
    XyEd9UIZa7iBnc>
X-ME-Received: <xmr:nbSbY2m6KpyGHYZ4zw0fQMfaOJOwQqrGkPR0c26qD0dkLmPkwayXa9okwbp-aAehTSQVlVMQ9Xq2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:nbSbY9wgWw2kJvmaSQtOr7QubnULapdaCkSyDjlOrWKOHCdj1l3dSw>
    <xmx:nbSbYwRqZt5aF0vZTXTeL30NvHqe3huVJ-SFWfMdQ5cSYqKCojtgMA>
    <xmx:nbSbYwZYcWlYvCVAcvljAlgCEch-oJtICfMGZPtrbPMYL-Rin13cZQ>
    <xmx:nbSbYzEPkQs21U-rbXTg86jQ-IjmNeQxBpHGxTkE9_2EqRBjxER1Zg>
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
Subject: [PATCH v4 08/10] x86/mm: make code robust to future PAT changes
Date: Thu, 15 Dec 2022 18:57:50 -0500
Message-Id: <65f81d3d4b75ef5d09d4e4c4f38fed985c787946.1671139149.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671139149.git.demi@invisiblethingslab.com>
References: <cover.1671139149.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It may be desirable to change Xen's PAT for various reasons.  This
requires changes to several _PAGE_* macros as well.  Add static
assertions to check that XEN_MSR_PAT is consistent with the _PAGE_*
macros, and that _PAGE_WB is 0 as required by Linux.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Changes since v3:
- Refactor some macros
- Avoid including a string literal in BUILD_BUG_ON

 xen/arch/x86/mm.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index eeaa9760d2aa38b5efa2cbf9d99290e7c432ddfe..1bba833aecf636079bb60c45e34cdce3d4ddbba5 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6364,6 +6364,42 @@ static void __init __maybe_unused build_assertions(void)
      * broken.
      */
     BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
+    /* A bunch of static assertions to check that the XEN_MSR_PAT is valid
+     * and consistent with the _PAGE_* macros */
+    BUILD_BUG_ON(_PAGE_WB);
+#define PAT_VALUE(v) (0xFF & (XEN_MSR_PAT >> (v)))
+#define BAD_VALUE(v) ((v) < 0 || (v) > 7 ||                                    \
+                      (v) == X86_MT_RSVD_2 || (v) == X86_MT_RSVD_3)
+#define BAD_PAT_VALUE(v) BUILD_BUG_ON(BAD_VALUE(PAT_VALUE(8 * (v))))
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
+#define PAT_SHIFT(page_value) ((((page_value) & _PAGE_PAT) >> 2) |             \
+                               ((page_value) & (_PAGE_PCD | _PAGE_PWT)))
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


