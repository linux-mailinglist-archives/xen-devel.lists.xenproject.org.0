Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0779964D315
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 00:13:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462684.720909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5avt-0002zw-6m; Wed, 14 Dec 2022 23:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462684.720909; Wed, 14 Dec 2022 23:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5avt-0002xX-2f; Wed, 14 Dec 2022 23:13:01 +0000
Received: by outflank-mailman (input) for mailman id 462684;
 Wed, 14 Dec 2022 23:12:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5avr-0000n2-SN
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 23:12:59 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8468537-7c04-11ed-8fd2-01056ac49cbb;
 Thu, 15 Dec 2022 00:12:57 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id ABBB2320016F;
 Wed, 14 Dec 2022 18:12:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 14 Dec 2022 18:12:56 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:12:54 -0500 (EST)
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
X-Inumbo-ID: d8468537-7c04-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1671059575; x=1671145975; bh=B67xsZEjuniXSLGiNTbDtXcUgnHe8HQATry
	KNiozL1k=; b=BBIHxYQiVqStVc7bG7WLfXcgTHPPeCMG6Ukk+S8t7ihBIRgAR0s
	4OliStJ7jFyfkFKhcGptKZnufIVcFWn885A8k9uEOQiGrE8vQWG8vs5YoQHKZA1r
	+b8+CT0BwZ/bR71dfBJ7kCwjgVJ55fq88R1JCCdxcEUVLjPMVvWLj5c5ViBf4jXk
	b8q1e9QYztNSpry+nGJAOFY3E1LwhX/SOzo4tLsHL0KI6pD2nFLwlzUpqBiACrrf
	VCwQpttZLHq+jbP6AnYFWRMYDgaZyzmAnSF28FAU21oZlOFhnV7BhwQhky6FPzdM
	twT0AwY58hcXwkdIq2R6itZ55pegAgL3STw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671059575; x=1671145975; bh=B67xsZEjuniXS
	LGiNTbDtXcUgnHe8HQATryKNiozL1k=; b=C2A4iEw8O3rR9OBFGV/9iMvx5fybH
	LIGqE7OXGHvgCU9Xj7QBE+rvhMzmCp3gT6ogBDVySqhLO059/oE6O5HrMtW4qowh
	txnAStxioK4jBFST5oV5CngqIxFKxzIJJGVOPsr//UtXzNpY0/N3HvOFnfXfgqRf
	79T9QTIiqCX8mzohUB9ipfXrnZeuZ8v/1MyJ/AJUGGRmjdKOKowc+mNkuzUIGty7
	XhKXW8qZy1l13B3proJKNRlDg1vqS5b4XePx3Z35Hl29pJl7lwAF7xgPfy5yleTG
	3M50Ae2oHwfHDJTFyhjyFiKqtZtZtRJoZAonp+NhN/Qp7OuxhEEoI0Dog==
X-ME-Sender: <xms:dliaY45KDpTKTxv3hQGy8pF3le9Sh4jk69Jxwq-g10Iu43qulOR3eA>
    <xme:dliaY55u7wd-2QI4R140iPCkQpVOv6UdGJYNeNsJ24QUaW2-CK9umIRgzoJlVmR8_
    ZPP7dL-9OQcjSw>
X-ME-Received: <xmr:dliaY3dlXHMbgCB07BenSnewyBpcaiZPPQj6lwn0HLoHy8kbEljJIqG7w6f1am3KQPsdquApLigE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:dliaY9KJFyLN0AZsTOXB8yfH8QKh9kvxCBG-WXw2SN-nYd_CuRYIyw>
    <xmx:dliaY8IetA96d82pxQUuciTkxtua90Dte9smeugwrBrvlkekv4--gQ>
    <xmx:dliaY-wAEpvgb2hKSwJ-DbRJ1u5jmVWWqugobEkg7sGGyULVLJiWdw>
    <xmx:d1iaY7-Z29Sf08TAa8fcnjYusMTwEMS78YEbC9GAnREQ2TJPfHIUPw>
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
Subject: [PATCH v3 07/12] x86: Replace EPT_EMT_* constants with X86_MT_*
Date: Wed, 14 Dec 2022 18:11:57 -0500
Message-Id: <02b5fd5285c206a971c1f131d8079fece54ac534.1671057808.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671057808.git.demi@invisiblethingslab.com>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows eliminating the former.  No functional change intended.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 9 ---------
 xen/arch/x86/mm/hap/nested_ept.c       | 4 ++--
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 8eedf59155e01ec1ca84dcc6b30961f9c884cb3b..49fe9822fac5eae15b67f0cfd3d0cb96347dc7ed 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -80,15 +80,6 @@ typedef enum {
 #define EPTE_RWX_MASK           0x7
 #define EPTE_FLAG_MASK          0x7f
 
-#define EPT_EMT_UC              0
-#define EPT_EMT_WC              1
-#define EPT_EMT_RSV0            2
-#define EPT_EMT_RSV1            3
-#define EPT_EMT_WT              4
-#define EPT_EMT_WP              5
-#define EPT_EMT_WB              6
-#define EPT_EMT_RSV2            7
-
 #define PI_xAPIC_NDST_MASK      0xFF00
 
 void vmx_asm_vmexit_handler(struct cpu_user_regs);
diff --git a/xen/arch/x86/mm/hap/nested_ept.c b/xen/arch/x86/mm/hap/nested_ept.c
index 1cb7fefc37091bf7d92a277203e652add5611871..84fdec024ad216f2c9b333ac65d46b55cf90dada 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -84,8 +84,8 @@ static bool_t nept_emt_bits_check(ept_entry_t e, uint32_t level)
 {
     if ( e.sp || level == 1 )
     {
-        if ( e.emt == EPT_EMT_RSV0 || e.emt == EPT_EMT_RSV1 ||
-             e.emt == EPT_EMT_RSV2 )
+        if ( e.emt == X86_MT_RESERVED_1 || e.emt == X86_MT_RESERVED_2 ||
+             e.emt == X86_MT_UCM )
             return 1;
     }
     return 0;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


