Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 442C5643C4F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 05:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454337.711914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2PfA-0006sE-OR; Tue, 06 Dec 2022 04:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454337.711914; Tue, 06 Dec 2022 04:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2PfA-0006of-Jn; Tue, 06 Dec 2022 04:34:36 +0000
Received: by outflank-mailman (input) for mailman id 454337;
 Tue, 06 Dec 2022 04:34:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2Pf9-0005MV-37
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 04:34:35 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4801db77-751f-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 05:34:34 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DCE3232009F0;
 Mon,  5 Dec 2022 23:34:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 05 Dec 2022 23:34:32 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Dec 2022 23:34:30 -0500 (EST)
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
X-Inumbo-ID: 4801db77-751f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670301271; x=1670387671; bh=7lJWDKXrQS1OHkVX4MNh9xF7acm6KU1f8nX
	60aLC2AY=; b=FXoGyWGbu8ukOOMXW7SDT6Zp4wfM7Wz0PjvmGgudbPZL8WuF2Lk
	hFNlf/xqUD2RXkc4Ma0T/AX87VFdXudmCg5IEknWURFAYhcS8G5l63kycRCDxTuM
	sIW5jjKa7TAjhyNPPib6KlYjWIsXJBcVRqqeI9/T6rW8V9oVySKrRXbNitlR+9A9
	UKgtwICXA2HZVqjaZEfFkWDNFpFegnF179PbWJ1vKioangaVRFZYCBU2aZkshPsI
	lNZdQDpidWr0b0bpFESSWihvm6+L89cdtnReOclxAAPL5tSBvyJNdMw/7kstC+oW
	9yz3j7MYRAzh6HI2yO5xU23Znwxaz2mYc6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1670301271; x=1670387671; bh=7lJWDKXrQS1OH
	kVX4MNh9xF7acm6KU1f8nX60aLC2AY=; b=SXcYAt2A2Lw3XEMWMyxyHFgyfSI7O
	TejRkzGRaY2rMGexP5FqCUGr0Fns4aJ+fk6pwX+V5QTv3V19vi5s+KUqL18DaI+t
	BEOC4li7JvUR/7ys4pIJFzuloD/ouYnKugI2AnxMj8cLTPgS0MjWCjMBDGjnDgNO
	YvmsKSRwA5Pobh7383QRh1URp/RileedV0d/lJvsJD75gRPjrABnTwnd4o1EdHnB
	8L3J99vA2HMvughqN8FloSVwTvc55+3mPk2qjYvh3uhS8xXrOeeLD/rQrCxwYuhj
	ZHWgUyvvA2a967MAkLmgryj3zvmk/Rmq7tmA3uUxF0u4+/LxqmOyWbxzw==
X-ME-Sender: <xms:V8aOY02fFj7WBZ9F0akv__sQA6UBxg9GGuJkzzTssJdDlxw1V2u7_g>
    <xme:V8aOY_Eds6t8R0WK2u16uLnwbA5kXdfgQ2Txf-g3K9zwBqmIgk9uHK02-nbixwEgh
    LT_4mggg1Lvbm4>
X-ME-Received: <xmr:V8aOY86dtpdfxPyoGakSQIeV_B7iBi7BH6mJ1srp92yuXc-8uufHqguBlRasSLtN4_iPWiD3Tk7t>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:V8aOY92wUw0ICP1_Gj85rinu0i7Pb6AB7aXy2UiFwl6BTz3rJtQevg>
    <xmx:V8aOY3GgiMvurMh1YVR1aj7_CC6_9iCOLOT0g-saogfasp9CBUqa4A>
    <xmx:V8aOY29yZNAvbzSsoV3f_3gjoccZQLqTbwZ0sc37NUrV1aK6khaodg>
    <xmx:V8aOY85xTqvJTMIxKaDTsyngtUbVccVlwOd-3gilD0V6TAtHXrZjRw>
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
Subject: [PATCH 6/8] x86: Derive XEN_MSR_PAT from its individual entries
Date: Mon,  5 Dec 2022 23:33:35 -0500
Message-Id: <5ddd32a453b098f277f2d4aa9e044a40183d4bff.1670300446.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1670300446.git.demi@invisiblethingslab.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids it being a magic constant that is difficult for humans to
decode.  Use a _Static_assert to check that the old and new values are
identical.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/include/asm/processor.h | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8e2816fae9b97bd4e153a30cc3802971fe0355af..64b75e444947c64e2e5eba457deec92a873d7a63 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -92,13 +92,33 @@
                           X86_EFLAGS_NT|X86_EFLAGS_DF|X86_EFLAGS_IF|    \
                           X86_EFLAGS_TF)
 
+/* Individual entries in IA32_CR_PAT */
+#define MSR_PAT_UC  _AC(0x00, ULL)
+#define MSR_PAT_WC  _AC(0x01, ULL)
+#define MSR_PAT_RESERVED_1  _AC(0x02, ULL)
+#define MSR_PAT_RESERVED_2  _AC(0x03, ULL)
+#define MSR_PAT_WT  _AC(0x04, ULL)
+#define MSR_PAT_WP  _AC(0x05, ULL)
+#define MSR_PAT_WB  _AC(0x06, ULL)
+#define MSR_PAT_UCM _AC(0x07, ULL)
+
 /*
  * Host IA32_CR_PAT value to cover all memory types.  This is not the default
  * MSR_PAT value, and is an ABI with PV guests.
  */
-#define XEN_MSR_PAT _AC(0x050100070406, ULL)
+#define XEN_MSR_PAT (MSR_PAT_WB  << 0x00 | \
+                     MSR_PAT_WT  << 0x08 | \
+                     MSR_PAT_UCM << 0x10 | \
+                     MSR_PAT_UC  << 0x18 | \
+                     MSR_PAT_WC  << 0x20 | \
+                     MSR_PAT_WP  << 0x28 | \
+                     MSR_PAT_UC  << 0x30 | \
+                     MSR_PAT_UC  << 0x38 | \
+                     0)
 
 #ifndef __ASSEMBLY__
+_Static_assert(XEN_MSR_PAT == 0x050100070406ULL,
+               "wrong XEN_MSR_PAT breaks PV guests");
 
 struct domain;
 struct vcpu;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


