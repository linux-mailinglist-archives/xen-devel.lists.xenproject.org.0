Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53361643C51
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 05:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454333.711869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Pf2-0005fV-F2; Tue, 06 Dec 2022 04:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454333.711869; Tue, 06 Dec 2022 04:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Pf2-0005cp-At; Tue, 06 Dec 2022 04:34:28 +0000
Received: by outflank-mailman (input) for mailman id 454333;
 Tue, 06 Dec 2022 04:34:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2Pf0-0005MV-W5
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 04:34:26 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40728b0f-751f-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 05:34:24 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 33F2132009EC;
 Mon,  5 Dec 2022 23:34:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 05 Dec 2022 23:34:20 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Dec 2022 23:34:17 -0500 (EST)
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
X-Inumbo-ID: 40728b0f-751f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670301258; x=1670387658; bh=zlnhba+jqrzVDvS+quM/AmBMchrjFNcXxGL
	gLEattQI=; b=nFaQ5l1IWz9DxPJTn5JP8Hs7JoaTE5YO3TXoSVCvC8kG+CsxIkG
	UH3MIXlrob/dE4Xn2XJBxBntU1fjUY/Rbb/z2txaMCl05jN2fzVCSX2CEmgWrYAk
	0dWL02Ab/Z4ZyyjT0MB/vjl6lj9g7DGiTIiep5FROjfAXU8RXot8XY5pB65u7ozP
	EkBburedsDc8qX7V1P+cvQrQDhIzlHKIsC3U3y6ExOaidYlGsdQUrEE/u5qqOtvz
	tDAFc+5/4SmWqOiIJJiTOSrs5cT2KK8/Eg4FBdotBFubRH8Kc0J5GbxlswqXh5b7
	mBgT23P4t+Tmy8rz8jsqecevI7bPUpywgIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1670301258; x=1670387658; bh=zlnhba+jqrzVD
	vS+quM/AmBMchrjFNcXxGLgLEattQI=; b=F7rEKa4oJCZrWhn1UuwJRc9zBEMau
	f3sCGZjh+OHA/9Butny+yuM6ja+V2/AuUNKdvtrkDISlL3jrASJgmXcfIF66mpZP
	Wcrf5V+gd4gc0pao8wIPki8YrD6yuWzWK5bEqvdGHZJGgPzlMzLx1qpNcw6P81Fu
	hF7feGcuSvSHqlE/kcXbyTUwGPcR4VB76WcyblwKWy+pCKnILahukNg2WVmc/gY6
	laO6xCod7gOP+dhwiVVNlRUBawbZeC/3PS2J6JXGySEDHOWXvRV6+7Kvw2p4FBdL
	GelVc4POd3JjfLUveOdrg676UfH6EpCxjmyvzbi4TMFyrrR6sI6tO/LwQ==
X-ME-Sender: <xms:SsaOYznOy5KmyaEcv87F541o70-iF3CcShGg-p_vJHcMP8T0GEEKwQ>
    <xme:SsaOY20gkG7yrqAbdzEQhsD0lHbDwCjTxRJpRntSgSxaycwk37ZfeXTQzV9xFlxLd
    TqWvM3VzUdFiK0>
X-ME-Received: <xmr:SsaOY5oUXPIUT-r5Z6QL0hBKDBcGBuhxjtTNdh-4TP5FZG876WET9h_kYm6s7Y6InWwJhPf8eFG7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:SsaOY7mNkrq7f0RSsOqMxiLyegPIjPCbFxboWxnq6viNiajmIZLSVQ>
    <xmx:SsaOYx1SimwO1LuAFSy-fzHr9SXv058t4YjYcRlj-KQMV-q78hCprg>
    <xmx:SsaOY6ugTdZQvyYShhl5Narj5jwgzbC_3yu8m0EK3vhqTbuA9PY8pg>
    <xmx:SsaOY7oznVo-HyQS5ypqFnDp-Qh5zvQHSPe7w8EMRP_KcFg-cv7TeQ>
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
Subject: [PATCH 1/8] x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
Date: Mon,  5 Dec 2022 23:33:30 -0500
Message-Id: <c70f4c4584cf28ff1da8f56e08d61ad0c406a4fd.1670300446.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1670300446.git.demi@invisiblethingslab.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This still hard-codes the assumption that the two spare values are
mapped to UC.  Removing this assumption would require a more complex
patch.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/mm.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 78b1972e4170cacccc9c37c6e64e76e66a7da87f..5d05399c3a841bf03991a3bed63df9a815c1e891 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -961,13 +961,10 @@ get_page_from_l1e(
 
         switch ( l1f & PAGE_CACHE_ATTRS )
         {
-        case 0: /* WB */
-            flip |= _PAGE_PWT | _PAGE_PCD;
-            break;
-        case _PAGE_PWT: /* WT */
-        case _PAGE_PWT | _PAGE_PAT: /* WP */
-            flip |= _PAGE_PCD | (l1f & _PAGE_PAT);
-            break;
+        case _PAGE_WB:
+        case _PAGE_WT:
+        case _PAGE_WP:
+            flip |= (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC;
         }
 
         return flip;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


