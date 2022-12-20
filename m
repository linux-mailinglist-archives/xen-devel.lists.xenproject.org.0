Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C01651787
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 02:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466403.725332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9R-0005vi-1r; Tue, 20 Dec 2022 01:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466403.725332; Tue, 20 Dec 2022 01:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9Q-0005rv-So; Tue, 20 Dec 2022 01:10:36 +0000
Received: by outflank-mailman (input) for mailman id 466403;
 Tue, 20 Dec 2022 01:10:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFeQ=4S=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p7R9P-0004iO-O2
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 01:10:35 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a9807f8-8003-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 02:10:34 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4E0C3320095B;
 Mon, 19 Dec 2022 20:10:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Dec 2022 20:10:33 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Dec 2022 20:10:30 -0500 (EST)
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
X-Inumbo-ID: 1a9807f8-8003-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671498631; x=1671585031; bh=uxmdOs+lCg3lNRcLgLV7XD5izHM7UdEv5Kn
	bujPlCxE=; b=dedffQ5lwM/nq4YhPhfB4flTbftjq38/ex3njQi6prBsfMhUcCm
	tAgeCU6n+25b0Bi6xgamQilfesd6EMsBtpQ4YrQkZhSGPpdx5tOCCH29DHs2x7Fm
	8T/7CLw5+1oqj3jP0VgZnXWPQUWcqMjLWL9GCnP5An0gOMaZpQWbLBDl1Kg9UM0C
	S1e1d5tsOhmMGXG61UcrF6rV7SeJeTJY8yxz5fwIPpPjxf97NQKk48NF/XJNisdu
	SznWVd/jwAUeA6Wihb8IILeL63d023powN38W2s3tJdnD0RyyIoa5E7inwTXq7gk
	5HgnmwCnR2Xz6l55urKlZTRgZbEFks98/Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671498631; x=1671585031; bh=uxmdOs+lCg3lN
	RcLgLV7XD5izHM7UdEv5KnbujPlCxE=; b=j9o81iF0qvmDWFXXMig8tGbyLlftU
	BTh+lQcviJX07WBuVDFA/oLY6135P6l64E+2Ak9yL6H/45xn7rEPfEVFS1rzueW0
	kmCxBj6Vi7l9O1cAwMXL1MJlNgJIptIFOBHYMOaHtQe9G3By4gdPmdv5B8fl4PzU
	dNtU3brZPwoSjWqWcRsvgEi4PEzlvB2ynLWXqLuthnHgg3RnwQ9rO2LHCChXaZUl
	X0VNI0/fLP1zazon5hxQZSaDOctr7ikj/U35BqUD4UgXCJL47i6qxPeAnSK707/X
	t6UbdeOjQqHwhVUhgMT16DhVXfD3Ypy4Ux7BK4UUbwhm7cpPjCirh0ACA==
X-ME-Sender: <xms:hwuhYwQViDPyv3Hl2HuEVn5oY-HfRK8Rwzczs4ln1fnmDpAAy-Gr9A>
    <xme:hwuhY9ymeFOrPncBccFoahWgaQXTy6ckzk6nUqI2yC0yBlBR4CGWhpqDq_Wr0XPNP
    QUSUWpZi_In1Q8>
X-ME-Received: <xmr:hwuhY90LeYLOfKC_xQvn25gP0ffTyQYfrhF-BmyKYngGvLfnMDJpMlguxNhr586B1Ixw8eXiDuph>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeggdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:hwuhY0AH0iipBaUxAITIjqa2YtEEG2EUdhNIDZiXbXug9bWByNhNZw>
    <xmx:hwuhY5haNH91dkh7eCRufUtiVRY3vxz_66AMylmAf7l5d5A8aw_vZw>
    <xmx:hwuhYwq_tQfdWPpM1q-5pFk9Y1KcfzNx85NorLBW34pmIQQa8xSvzQ>
    <xmx:hwuhY6WlpoqXpaFXHTJVYH3AopMW3AWeWefV-XLYkHnp6xRdBBS3VA>
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
Subject: [PATCH v5 05/10] x86: Replace EPT_EMT_* constants with X86_MT_*
Date: Mon, 19 Dec 2022 20:07:07 -0500
Message-Id: <4b5f6b6bcc4ed00db6b5f4c6def68606c190a74e.1671497984.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671497984.git.demi@invisiblethingslab.com>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
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
index 1cb7fefc37091bf7d92a277203e652add5611871..23fb3889b7605be62805731218c314819d5027b5 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -84,8 +84,8 @@ static bool_t nept_emt_bits_check(ept_entry_t e, uint32_t level)
 {
     if ( e.sp || level == 1 )
     {
-        if ( e.emt == EPT_EMT_RSV0 || e.emt == EPT_EMT_RSV1 ||
-             e.emt == EPT_EMT_RSV2 )
+        if ( e.emt == X86_MT_RSVD_2 || e.emt == X86_MT_RSVD_3 ||
+             e.emt == X86_MT_UCM )
             return 1;
     }
     return 0;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

