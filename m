Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7118164D30E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 00:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462663.720854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5ave-0001AI-5m; Wed, 14 Dec 2022 23:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462663.720854; Wed, 14 Dec 2022 23:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5ave-000185-2x; Wed, 14 Dec 2022 23:12:46 +0000
Received: by outflank-mailman (input) for mailman id 462663;
 Wed, 14 Dec 2022 23:12:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5avc-0000n2-Ft
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 23:12:44 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfc51b6a-7c04-11ed-8fd2-01056ac49cbb;
 Thu, 15 Dec 2022 00:12:43 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 68AB632001BB;
 Wed, 14 Dec 2022 18:12:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 14 Dec 2022 18:12:42 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:12:40 -0500 (EST)
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
X-Inumbo-ID: cfc51b6a-7c04-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1671059561; x=1671145961; bh=7EZIiV8PP0oaWDOsX65nf5iok66St8LLUGA
	z0M5tZno=; b=qjxTwpDa7i7BtYYTkp2Zw0Y2tY0kNiv5qJcYVmceEbuNqsXvzNf
	6QzULaRkmnkgrZIP7jIUlY9Z20QNcrBSouNqKXXvHHBWewbVTf1+VwVw2EkusgcK
	Vi70lZtKRsHue2Ec4bPEIAq8O0eODO2sS1VHX6G9yFCJ7AlLg3q10EEsdQtN9aWr
	1Ap3fiHeblMnFCAM1n0SNjbiK3NzMdDfzV5olmdVYxg/EngTW2NPAmZo86Zo/yOo
	j25iMoCSGOKQZFCphSIPwzWe3xRRCbFGWamXdTUZYWBvXzQOjjCrdOwiugyRU690
	/B15C9rq6zbYgIn6iTc3RobUEt01P6Gn/TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671059561; x=1671145961; bh=7EZIiV8PP0oaW
	DOsX65nf5iok66St8LLUGAz0M5tZno=; b=GRCugvKb2g0jKBp5jG0fvCcdSOYAo
	6R7LoP98PY3su95ddtCEr06n4CuGWHPpx+RcKt0YNtOifFaltC83PIqcmo/mD9b3
	4TLlbRoyNmGQJUuFq07uFQ9yd5YHtyXh2f211Xxvmgtiain0kh+Ndz9IAraJfPc+
	9YXx5kzGMjJQ2w80GCGEuGl01AoDSkCtq9fHk6SRiujh8WGFXspPu3T/keWQhTgb
	wGo7tQnSz1zLDN7x3WGq4CVqTBhJois7SdQGM2GNjlUJtfwSN8WDf7GdS/4NG8z4
	rJrwjh6huR8zb/sBlI2fx0qvCOfw58Gyb1VoVouC9bho+BCQ24ZEC9Yzg==
X-ME-Sender: <xms:aFiaY5l1wBzw90C7kd9u6tWdKqCkd6AGBsjPtt2Tgn9z70FPZLuShg>
    <xme:aFiaY02km4afB08abLvraf_BVITkIHeR_yJ0jUc6cYOjQBG3CkYi6gXbEqMS3BuFs
    SxkC6muCcdFSUg>
X-ME-Received: <xmr:aFiaY_p6Plr9lkzMWCqExN96x9YNRAJNBsufQ8vB4MjT-iRh_q6UUadux-QahuBzFVqAaSfiuj-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:aFiaY5lkcv4Pkg4DTJDmbPhqmhG8iTbiIuYzRk_lnUi7KiVbEPXOoA>
    <xmx:aFiaY30PZsT7-iDQxZfRM679ExK6QP-OFJPOpc6Xotvmos2GvfrRPA>
    <xmx:aFiaY4uCgX-K_g_nLnXaT0mrhXn9Cf4BL8CQZJ43lUp5TH-P3e23KA>
    <xmx:aViaYwIWyhfklpYg7baRZNpVjyezRXDxfd2vcr7xCiMpgfassyCckw>
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
Subject: [PATCH v3 03/12] efi: Avoid hard-coding the various PAT constants
Date: Wed, 14 Dec 2022 18:11:53 -0500
Message-Id: <042c48cbf2fd4099aa3892a09302d499bbeef7fb.1671057808.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671057808.git.demi@invisiblethingslab.com>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code much easier to understand, and avoids problems if
Xen's PAT ever changes in the future.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/efi/boot.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index d521b47bc6d9513ca6e65c3170abb94881a71910..e1248d63e7f99d598a6b1df04e34ed34ed0b6910 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1748,23 +1748,23 @@ void __init efi_init_memory(void)
         emfn = PFN_UP(desc->PhysicalStart + len);
 
         if ( desc->Attribute & EFI_MEMORY_WB )
-            /* nothing */;
+            prot |= _PAGE_WB;
         else if ( desc->Attribute & EFI_MEMORY_WT )
-            prot |= _PAGE_PWT | MAP_SMALL_PAGES;
+            prot |= _PAGE_WT | MAP_SMALL_PAGES;
         else if ( desc->Attribute & EFI_MEMORY_WC )
-            prot |= _PAGE_PAT | MAP_SMALL_PAGES;
+            prot |= _PAGE_WC | MAP_SMALL_PAGES;
         else if ( desc->Attribute & (EFI_MEMORY_UC | EFI_MEMORY_UCE) )
-            prot |= _PAGE_PWT | _PAGE_PCD | MAP_SMALL_PAGES;
+            prot |= _PAGE_UC | MAP_SMALL_PAGES;
         else if ( efi_bs_revision >= EFI_REVISION(2, 5) &&
                   (desc->Attribute & EFI_MEMORY_WP) )
-            prot |= _PAGE_PAT | _PAGE_PWT | MAP_SMALL_PAGES;
+            prot |= _PAGE_WP | MAP_SMALL_PAGES;
         else
         {
             printk(XENLOG_ERR "Unknown cachability for MFNs %#lx-%#lx%s\n",
                    smfn, emfn - 1, efi_map_uc ? ", assuming UC" : "");
             if ( !efi_map_uc )
                 continue;
-            prot |= _PAGE_PWT | _PAGE_PCD | MAP_SMALL_PAGES;
+            prot |= _PAGE_UC | MAP_SMALL_PAGES;
         }
 
         if ( desc->Attribute & (efi_bs_revision < EFI_REVISION(2, 5)
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


