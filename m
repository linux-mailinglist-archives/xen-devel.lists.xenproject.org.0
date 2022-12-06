Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C515643C54
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 05:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454339.711934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2PfG-0007Zr-Ag; Tue, 06 Dec 2022 04:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454339.711934; Tue, 06 Dec 2022 04:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2PfG-0007Xf-4n; Tue, 06 Dec 2022 04:34:42 +0000
Received: by outflank-mailman (input) for mailman id 454339;
 Tue, 06 Dec 2022 04:34:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2PfD-00055j-Mm
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 04:34:39 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a7720c1-751f-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 05:34:38 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7687032009EF;
 Mon,  5 Dec 2022 23:34:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 05 Dec 2022 23:34:37 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Dec 2022 23:34:35 -0500 (EST)
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
X-Inumbo-ID: 4a7720c1-751f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1670301276; x=1670387676; bh=eaRrvP4SZe
	AXAQhX3z3ddqTteySVMlc1fYZ86aRBSug=; b=n/JCDB2wJOvkbd7PJGVcRW8HTH
	P3W4jzApLDJdY0PCC6zeqMIsLr/V9FoSgyLaXdJIWwK0FtAjeLfl9leOFjm95Qbf
	WuNgMexdnAKM58ItXNWzqsEvPLycvHYMTCH9wJqsj8+4dFU5p6+Uj3UD0ZMXBXJp
	1bRnhv/tsythoP9cw6P5aWdJv+p9waA5z/036Gzj3BbK3YPS0jYiXwfzA7JQnmF2
	ErB2g1jXrhFb7G7Yj9E4fygFx1l2Ho/elKdCnCIXYiorXkSJLuXmnK0TbDZgfEQo
	qWffm+aSaPI4WuArlODzf1q10bn3MuyUhUYpkTX1tBzUIHRwLS4WJVVS0XkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670301276; x=
	1670387676; bh=eaRrvP4SZeAXAQhX3z3ddqTteySVMlc1fYZ86aRBSug=; b=w
	vv61OGSx32RYIPS9Sb3D/JZM+QsAFBdROhnlTxT8uRgn1idjAF8psZnCU8TrfPdJ
	quUU3NN/3KqYpJuKCRI1epSYEs4FYF/k+F/wU8jI3a8QaRtJs1SMJTqvwJGophWx
	eks14YpxAxNxTJHWnHOm4nrXpKB6/1HehVZJ8+lfAnX1jqefifo8Roq2PswO9vr1
	wXECQJZcH3lZA25rn+1vvmEEljkNTvopG10P8mZJHwdoQbjY8cf0XnrOngeqghyY
	VyuYDvOSdx2kIm059egNQgiDVV98pSQq+Pggk8oB586p+ijgZBcqZF20XP4MXgcy
	Qc/XoQyoKamPDd6ahtyjw==
X-ME-Sender: <xms:W8aOYyZZjbuHt69UppBOSMhREPkouFYA5vrq3DUurZaXKcNm2EOUJg>
    <xme:W8aOY1Y1RUR3pQjMdcRSY9WYl6zWWhxtCrfAIay96OOuQ_RnIriZFx_M9_IvkHSVp
    IIi61hCGYuSqgM>
X-ME-Received: <xmr:W8aOY89RC_aiP94p4Oh3wOz63Fg7qasL5wuKmN78jXGMGSSSgwmzM6RV8IlILTpdieVJPZZ5ihZ7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepledukeelleejkeevkeefgefhffeg
    vdeigeelieegjefffeeiveeivdejgeevteeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:W8aOY0o7CSC83Nn9gxo6jIBRoZDqdFundwNT71ymilFf9RfAXYu_nw>
    <xmx:W8aOY9p-rv_Yj_lT8olyUKeD42IdM7bRhVpveFRgthaOf3H2tgmgJA>
    <xmx:W8aOYyR7IiFRFV2z-pKRRbfIAJ-5kZHa_AzF8SWro7WQCExvKoio5g>
    <xmx:XMaOY-dTOwoHlpC3LhUTjOp2zaea-2b_3vepeHIEOc7zXSJ-2qLkjQ>
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
Subject: [RFC PATCH 8/8] Use Linux's PAT
Date: Mon,  5 Dec 2022 23:33:37 -0500
Message-Id: <9f0bd911ba6c7fe1b7285f232154d42807145ced.1670300446.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1670300446.git.demi@invisiblethingslab.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is purely for testing, to see if it works around a bug in i915.  It
is not intended to be merged.

NOT-signed-off-by: DO NOT MERGE
---
 xen/arch/x86/include/asm/page.h      |  4 ++--
 xen/arch/x86/include/asm/processor.h | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

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
index 64b75e444947c64e2e5eba457deec92a873d7a63..7a27d19d1dc8aa9c102683985c30fb85864303fa 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -107,18 +107,18 @@
  * MSR_PAT value, and is an ABI with PV guests.
  */
 #define XEN_MSR_PAT (MSR_PAT_WB  << 0x00 | \
-                     MSR_PAT_WT  << 0x08 | \
+                     MSR_PAT_WC  << 0x08 | \
                      MSR_PAT_UCM << 0x10 | \
                      MSR_PAT_UC  << 0x18 | \
-                     MSR_PAT_WC  << 0x20 | \
+                     MSR_PAT_WB  << 0x20 | \
                      MSR_PAT_WP  << 0x28 | \
-                     MSR_PAT_UC  << 0x30 | \
-                     MSR_PAT_UC  << 0x38 | \
+                     MSR_PAT_UCM << 0x30 | \
+                     MSR_PAT_WT  << 0x38 | \
                      0)
 
 #ifndef __ASSEMBLY__
-_Static_assert(XEN_MSR_PAT == 0x050100070406ULL,
-               "wrong XEN_MSR_PAT breaks PV guests");
+_Static_assert(XEN_MSR_PAT == 0x0407050600070106ULL,
+               "wrong XEN_MSR_PAT breaks i915 driver on PV Linux");
 
 struct domain;
 struct vcpu;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


