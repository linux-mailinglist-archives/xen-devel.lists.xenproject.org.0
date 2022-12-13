Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8FA64BF6B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:35:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461325.719459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5DrZ-0002RN-CY; Tue, 13 Dec 2022 22:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461325.719459; Tue, 13 Dec 2022 22:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5DrZ-0002OC-5E; Tue, 13 Dec 2022 22:35:01 +0000
Received: by outflank-mailman (input) for mailman id 461325;
 Tue, 13 Dec 2022 22:34:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5DlB-000519-7j
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:28:25 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74450876-7b35-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:28:24 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 182383200930;
 Tue, 13 Dec 2022 17:28:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 13 Dec 2022 17:28:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:28:20 -0500 (EST)
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
X-Inumbo-ID: 74450876-7b35-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670970501; x=1671056901; bh=8idr1A+xHVMAGVzfBDTePLErWzDXZf/dFyI
	s0HO6PNc=; b=QuTxrs1uvyS4KS36vWpMNXEbtpjy2kJKRvLsEY8T8Of+N/1YQBG
	jOKunJTThfa7JGPDdsmv6VAQ+05LWJgyEne5f5MCLmlNH32f+9Sxu4YWCFFekkbY
	V8CbqDjMYYgG7kK21+ON6Jgx0+nUkaaKsjteMlwNWBkV/isYBvXIWcRakqNacj78
	jMvc0u63uYsOxoL992JfUULh/H2G4iLpsOFTj3lCW85vsbb+kFa8qAt4DTZ3R4UQ
	ShfGtUAmBfT6eVI4APlUmrsjWymBTpUT/bFvsHNPD/XK3W8g/H8alzZZHy3s0g/m
	PqzH/RGxnTXAJo2vzqBfH6KVIe2ZBx16Zig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670970501; x=1671056901; bh=8idr1A+xHVMAG
	VzfBDTePLErWzDXZf/dFyIs0HO6PNc=; b=srH4yGGDBdwF7hydCmyD/ZZZ9vbDD
	smjDPyLYUK9gY6i0+h+QtcL+a9EbAOwfcfaWTmu3FtYfiX8Jwv7ICx6AWf1ENqFu
	XMSd2qILcUH7T/92oQ/5OdJqozfhbF+j5qz1+nR6T6uCxDo4aFZH06kv+Bm3XVS0
	2IGoayeYQrO7ba3iHa6H5rIJwBCqaITkLO5skvWys3HZlTbX90XYFjB4z9ucpIaV
	NE+0KqW+y4+X0/Ikbk2DyNtiF32XhL0rT+mRla49c2hcx98Zy87hO+oPE4bLMCSB
	zirLpU1E4/t3tyQMScb95HH9hqw+81kWW506jl+NIZlPMtJ4uWvKcsilg==
X-ME-Sender: <xms:hfyYY4Yllys_NhzSknSXQTZRh5NT_01X0FIc7BTQ2wM8IhjetGYmlQ>
    <xme:hfyYYzZ6j262y8uaTJqWpCIcZrE9zhcp2xR2DRP3NgkJztyyyE_Ahh23Vu9zu3EzH
    uVJS4YLsLem7UQ>
X-ME-Received: <xmr:hfyYYy_lC3Cki-OvIjz2CLVq8JM_xC8JdVPZSL7cQlps8gjUPJZALqaZOSi4InSeahQBbMCVl40e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:hfyYYyo7MLMIRtxn1Mky2kIF_AtsRc6LLWLvnZxyHJeGTD4vw0XkZQ>
    <xmx:hfyYYzqxrNMX7dQbk1sDgLaTs9fKr2A-3kmZkVdi2_ymfWwOh2yQNQ>
    <xmx:hfyYYwQuIHYgvWdjlQ3cfxgLx0UxM2yWH6UuX8rE9UAxCkYKp3L8dg>
    <xmx:hfyYY3d3yjvG29xd-nx5wW9xwEP3SzdjT0cEOymcrvDorDW5MHM-HA>
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
Subject: [PATCH v2 06/14] x86: Add memory type constants
Date: Tue, 13 Dec 2022 17:26:47 -0500
Message-Id: <d01afab33bcf551f96f5650c37c51a567c43ad4d.1670948141.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are not currently used, so there is no functional change.  Future
patches will use these constants.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/include/asm/x86-defns.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 28628807cb9897cf6fa8e266f71f5f220813984d..d7c6c986a556e62e1e7a57e9e3ef50e89de3f0ab 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -153,4 +153,17 @@
      (1u << X86_EXC_AC) | (1u << X86_EXC_CP) |                      \
      (1u << X86_EXC_VC) | (1u << X86_EXC_SX))
 
+/* Memory types */
+#define X86_MT_UC  _AC(0x00, ULL) /* uncachable */
+#define X86_MT_WC  _AC(0x01, ULL) /* write-combined */
+#define X86_MT_WT  _AC(0x04, ULL) /* write-through */
+#define X86_MT_WP  _AC(0x05, ULL) /* write-protect */
+#define X86_MT_WB  _AC(0x06, ULL) /* write-back */
+#define X86_MT_UCM _AC(0x07, ULL) /* UC- */
+#define X86_NUM_MT _AC(0x08, ULL)
+
+/* Reserved memory types (cannot be used) */
+#define X86_MT_RESERVED_1 _AC(0x02, ULL)
+#define X86_MT_RESERVED_2 _AC(0x03, ULL)
+
 #endif	/* __XEN_X86_DEFNS_H__ */
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

