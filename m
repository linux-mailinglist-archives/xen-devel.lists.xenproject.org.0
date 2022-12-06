Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4282643C56
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 05:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454332.711858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Pf1-0005PA-6g; Tue, 06 Dec 2022 04:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454332.711858; Tue, 06 Dec 2022 04:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Pf1-0005Mc-38; Tue, 06 Dec 2022 04:34:27 +0000
Received: by outflank-mailman (input) for mailman id 454332;
 Tue, 06 Dec 2022 04:34:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2Pez-00055j-N1
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 04:34:25 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 421df95f-751f-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 05:34:24 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7345C32009EF;
 Mon,  5 Dec 2022 23:34:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 05 Dec 2022 23:34:23 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Dec 2022 23:34:21 -0500 (EST)
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
X-Inumbo-ID: 421df95f-751f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670301261; x=1670387661; bh=0QYKJqmbmxQ2VjZuUfTQ03pAcq4EP8MKf4w
	+fU+4RXw=; b=AjLxTJrLas+hiAl88t6W/GA7S314n8MsLVEYgtoJr9U3sv9ma8j
	5OR509gTyKf4tViRvkjZAxBgkKB16/1GJTcloksswi6eyaNMwoRcALChtACoGovH
	oYPljHGSAohMS1tQ285DWHGyx897dwo2/4EG2CuBT6fEnWTSUiAIEopVEN28yuKZ
	9EgM1TIQbJgdx08SO5rulSBKoeOqJzL8lf+Kb2OBUzgrH+BzSrQUD0wbpqlXv+dg
	s2hBoBAUrtyz9dLy8S8XY9Y7qomOqenr8ifK7Mxm/EtHdPdJn7PmeYwzimFsUl7r
	jq1TztJQDySMD3SQ6tAi78+Xpka6Crqq/7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1670301261; x=1670387661; bh=0QYKJqmbmxQ2V
	jZuUfTQ03pAcq4EP8MKf4w+fU+4RXw=; b=XNkFtiOSB7z0SPAeX7uFy5mOxTe33
	qmHWmpNynA//zBS6K5iC8XN0ORvLdtMd/7Bly9ilu4rK1u/GqIbVjNrXmW1fMIpV
	7sLRzqv7ypiqRQcR3v9gEc6+uV+JWaCLTN/+Q5DhhKQyrNYpwX/szRzENguP0HX8
	/xPNcHU2vyxmV4OyJgJWKtJGM5jO3CTOOf2gSTXpo05x53mSYVjkgnM2tBaRacjT
	CJbY4NKBA7xVNQa1UIOIG0iwKXqh7qr2olZqbBH0uDvNRMkACykthkdeFiGkFzA2
	IgPuj2wudZolUVoAYiKBvSJJWO+WTZ1mbfD99xx1o+pxTGwzUcwmuNhLg==
X-ME-Sender: <xms:TcaOY68X8vwEgQjpsnhkNyGG4gIqTgrySGO-jKsjoxacoXWVVzDaRQ>
    <xme:TcaOY6trpRNo4XqjjtFQOxI62f1Rux7034YlDaDJjSdVpi180gkodrtwu8M_ByZAR
    FN-66qAIPqbd_Y>
X-ME-Received: <xmr:TcaOYwDSLn9BBMZ29bl0x1X0a9vYr-ye_2Th2UFx5RNm7DE-seqQKak1PjHOVIQj-2MaPOOjh-rT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:TcaOYyfWfhSO14xG_zNZnFDy5RnhrADYd23trYCQSN9PQK_VOUObbA>
    <xmx:TcaOY_P8nyh6fjwxGoEFzzcpi-ykRw3k2hYGK5ZRs1yAvwYlslGUAA>
    <xmx:TcaOY8mhS3QrmuM-0FYuc1yX7oG9zMH9MDhEouEGp7wFaUb15tJ34Q>
    <xmx:TcaOY7DGYCR1eFc7Cjvj5lmZkz0r4AJe34iUZSML_a-TRJZTvTSqXw>
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
Subject: [PATCH 2/8] p2m-pt: Avoid hard-coding Xen's PAT
Date: Mon,  5 Dec 2022 23:33:31 -0500
Message-Id: <94c76a8be13a592ef98c80525b6c016cee583e73.1670300446.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1670300446.git.demi@invisiblethingslab.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code much easier to understand.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/mm/p2m-pt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index eaba2b0fb4e6830f52b7d112fba8175dfe6d2770..cd1af33b6772ab1016e8d4c3284a6bc5d282869d 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -99,13 +99,13 @@ static unsigned long p2m_type_to_flags(const struct p2m_domain *p2m,
         return flags | P2M_BASE_FLAGS | _PAGE_RW | _PAGE_NX_BIT;
     case p2m_mmio_direct:
         if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)) )
-            flags |= _PAGE_RW;
+            flags |= _PAGE_RW | _PAGE_UCM;
         else
         {
-            flags |= _PAGE_PWT;
+            flags |= _PAGE_UC;
             ASSERT(!level);
         }
-        return flags | P2M_BASE_FLAGS | _PAGE_PCD;
+        return flags | P2M_BASE_FLAGS;
     }
 }
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


