Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914E0651782
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 02:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466407.725353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9X-0006jv-37; Tue, 20 Dec 2022 01:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466407.725353; Tue, 20 Dec 2022 01:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9W-0006dv-Vf; Tue, 20 Dec 2022 01:10:42 +0000
Received: by outflank-mailman (input) for mailman id 466407;
 Tue, 20 Dec 2022 01:10:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFeQ=4S=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p7R9V-0004T7-AB
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 01:10:41 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d57d520-8003-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 02:10:39 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 35F233200916;
 Mon, 19 Dec 2022 20:10:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Dec 2022 20:10:38 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Dec 2022 20:10:36 -0500 (EST)
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
X-Inumbo-ID: 1d57d520-8003-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671498636; x=1671585036; bh=mmWwiUKIb7PKGWRCiRecDTE1zKV4JKWsn7i
	luc16UuM=; b=mStWYdgNQql7gh33QrtSnuD/GPYeOwdy0tQoWGDcdM6j8JOX3+O
	wFrhh2RJsswfyPbKucVAtlyhKp60sujLAgav30AFFhFuY6iGA8+S8fcNcCxjZtzu
	iDn7g7/4nxj74a4IZz0xvtNPwjsvyFfXOvNR/JmzOJoz1STbXFmEkPLAOzyYtZ5B
	OWBY2mKi9St0jWTrM+GoXonuDOOkxNdJPHVvq4Irt+oBqARn0Xr5rDP4TTDXlrK2
	D4d0rvbjY/mYnHPGb5aBrcZ//UJHD12usFf6QZTPsIUyF3oabjSezIGhnpvp4BFb
	Pd8nCxhGddDJnP0foFn5zis+R0yUUyJruBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671498636; x=1671585036; bh=mmWwiUKIb7PKG
	WRCiRecDTE1zKV4JKWsn7iluc16UuM=; b=p9ek3Qdd5Fn/9SP4cGDijKonsSSYW
	BcCcQqcBuzN61DKYq+1onW4EIJYULeM3pPMXjmYY4aW3kIzkbhbyTA0tpBRqiAxE
	Emu2FLtBhzL8pjwzzrX770LdDZkajM0edELRcqHJZa2toxGAZ1e/JHhfTjhrx9zB
	GM9CmI4e08aelshDzaBt7zzLXMEtWO41zTHgH161l9CGSVl4QG5+cLmdVLrEdtHO
	+R+WuGbaYTEkPARpiREbAkRWYySqsk2qpcLQDKiNjgoKj1aW3xaOLRuhQuGn/k/b
	br9/TzswYMH4adK5BAkf7Ufl9uG0NKCjrAi4P2jQuHytBCrLPnGRfIaWg==
X-ME-Sender: <xms:jAuhY0GJFbu7AiRJHodM7xQODWMPvKETldBzm4FJ0PcfMuVv31OBgQ>
    <xme:jAuhY9XyXS-bLhUGFRmcn_LQ27F8yORSfU9aBFRAM_cJ52eR0bLOKcnwFjPlJThVh
    -8UEX95ngeaWJA>
X-ME-Received: <xmr:jAuhY-Ia6BxExfWlw7iQ5QKxghilCXgewMdMIwqhxwpL_DFxDXweG3916FkTNVVILJG4noQtcUTR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeggdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:jAuhY2HqNeDcGsIph6fJsh4bqKmpVYgB5wQX6yWwJKhsC_FvhMJ0ew>
    <xmx:jAuhY6W1N1OP3j20QgK2W2bp09GkxkuJ8srpKeXBmPSymP_Ge5eXBA>
    <xmx:jAuhY5Mx7YaycXtVWY4csf-laxYuY4-ozWUKfeF70wg8QXrVwb5KXg>
    <xmx:jAuhY-p_O03wVttqCOzW_g4gu22wsLcdbaDjtMLjQ-_unSqWLELAoQ>
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
Subject: [PATCH v5 07/10] x86: Derive XEN_MSR_PAT from its individual entries
Date: Mon, 19 Dec 2022 20:07:09 -0500
Message-Id: <3f38d913e270fed69a336d08d689ac9268cc54c2.1671497984.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671497984.git.demi@invisiblethingslab.com>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids it being a magic constant that is difficult for humans to
decode.  Use BUILD_BUG_ON to check that the old and new values are
identical.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v4:
- Explain that changing XEN_MSR_PAT breaks guests that rely on the API
  in xen.h instead of reading the PAT from Xen.
---
 xen/arch/x86/include/asm/processor.h |  9 ++++++++-
 xen/arch/x86/mm.c                    | 11 +++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8e2816fae9b97bd4e153a30cc3802971fe0355af..60b902060914584957db8afa5c7c1e6abdad4d13 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -96,7 +96,14 @@
  * Host IA32_CR_PAT value to cover all memory types.  This is not the default
  * MSR_PAT value, and is an ABI with PV guests.
  */
-#define XEN_MSR_PAT _AC(0x050100070406, ULL)
+#define XEN_MSR_PAT ((_AC(X86_MT_WB,  ULL) << 0x00) | \
+                     (_AC(X86_MT_WT,  ULL) << 0x08) | \
+                     (_AC(X86_MT_UCM, ULL) << 0x10) | \
+                     (_AC(X86_MT_UC,  ULL) << 0x18) | \
+                     (_AC(X86_MT_WC,  ULL) << 0x20) | \
+                     (_AC(X86_MT_WP,  ULL) << 0x28) | \
+                     (_AC(X86_MT_UC,  ULL) << 0x30) | \
+                     (_AC(X86_MT_UC,  ULL) << 0x38))
 
 #ifndef __ASSEMBLY__
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index dba6c77ef2f7ed7fcb7f7e526583ccadd35e62cc..b40a575b61418ea1137299e68b64f7efd9efeced 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6352,6 +6352,17 @@ unsigned long get_upper_mfn_bound(void)
     return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
 }
 
+static void __init __maybe_unused build_assertions(void)
+{
+    /*
+     * If this trips, any guest that blindly rely on the public API in xen.h
+     * (instead of reading the PAT from Xen, as Linux 3.19+ does) will be
+     * broken.  Furthermore, live migration of PV guests between Xen versions
+     * using different PATs will not work.
+     */
+    BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

