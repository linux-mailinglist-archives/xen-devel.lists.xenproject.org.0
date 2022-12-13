Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B2B64BF6C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:35:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461312.719437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5DrW-0001r1-Kw; Tue, 13 Dec 2022 22:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461312.719437; Tue, 13 Dec 2022 22:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5DrW-0001nm-Hr; Tue, 13 Dec 2022 22:34:58 +0000
Received: by outflank-mailman (input) for mailman id 461312;
 Tue, 13 Dec 2022 22:34:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5DlI-000519-OE
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:28:32 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78c844e7-7b35-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:28:31 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id A2983320084E;
 Tue, 13 Dec 2022 17:28:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 13 Dec 2022 17:28:30 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:28:28 -0500 (EST)
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
X-Inumbo-ID: 78c844e7-7b35-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670970509; x=1671056909; bh=B67xsZEjuniXSLGiNTbDtXcUgnHe8HQATry
	KNiozL1k=; b=LVlcjzqZJkgr6+qvfRi6zdalC7KDNWLHM2wl61iKk+qC4AXqhMb
	Ml6TWk7aBYRIxyPTm5kQGaOS5+7jPtc6ZiJMKjg7B6mFz8wOo5mwaYO6JPMn3lhW
	eiHTW8hiZE3CmH2Rjtix7c1yeWWC5gPCMf7H8snDgrf+r+70WavGpaxVYdy+eaY4
	dZCExp41ae4TUOYwjrkeEoYzNSq8MiIt9TixTvnTGhFlk1t3piEnWRjA2M9++zsF
	doC5/OoqRXEwjclO/HSn18O1EbTepeQv6skiLLrIeW+78/1yVJDzkiCVqWuRjPgb
	GNnWUQ22RqNMSICYv+fUhw/IMPhwImF9fXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670970509; x=1671056909; bh=B67xsZEjuniXS
	LGiNTbDtXcUgnHe8HQATryKNiozL1k=; b=qtS7wcqLezAcW2GnMGxkMh5fVmA6J
	kBr9ii/IuMpOnd0Ejg/Bn4b467/eB++mq4xPG+0NxErlEAg7ITfZgygPdM/uowpv
	o6k+mN4phEK2C4eQwNQ1BK1nCe+KH4dK1o8nyx6sFPU5MG3IAKijZtIBWN9Odt3b
	ZnwHYWTQNsvsdfYqbFR7P7LW9BWemaR1Ik5/LrerILtx6O+L3SSpPNLrfFCVJBq5
	IsY2QePKDFxmhUEwqy7yxZwnrrEyuRSr4dmSk0R5CqbMuqj9PjfYPD7WVA8lu2IL
	PsIEPYqHou+k1Ljn6a01kq2iyihsuSYuMw61OQHQbIb1I0BZA6wl6Fydg==
X-ME-Sender: <xms:jfyYY1oEUreGdvOBL3PlC_ej2PDACxJkvIHV5tlzDvRQg2zpMVJF-g>
    <xme:jfyYY3rSwhS6MY6jTsGBhhVmmaC1LubnfIs8n7o1_pZeAvIpxZReK4EkSo6xBprWF
    OMQX7794xqyWMk>
X-ME-Received: <xmr:jfyYYyOS5atmSgIkk8NCeNZMPg6_rpRSE9xkMlko7rhkZvg-CsNW-2X6lOd7BiRih0QlVOWhF3kC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:jfyYYw4XMsmPZCVM9i_TY_xYDnPekoRca6Bs8AydUvilyHsm8Mq8mQ>
    <xmx:jfyYY04pNkyhqCTUIuRvM-DsX-RrYBgvoTfaNjNqFiFUhbN1iYdB9A>
    <xmx:jfyYY4hG-lQe7NGLa57qAFk7mseL5cgCUNmSTk-z-i0f1fYdeIMZuw>
    <xmx:jfyYY2tJ-f8uvdy8vtZ4mM1M6hvIkAEEdZLP1_77zJxJvnaiwRcukg>
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
Subject: [PATCH v2 09/14] x86: Replace EPT_EMT_* constants with X86_MT_*
Date: Tue, 13 Dec 2022 17:26:50 -0500
Message-Id: <9c5787748bebac492648f352b5971b3bdfcdc7fe.1670948141.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
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

