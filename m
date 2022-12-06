Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12014643C57
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 05:35:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454334.711879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Pf3-0005vE-M0; Tue, 06 Dec 2022 04:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454334.711879; Tue, 06 Dec 2022 04:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Pf3-0005sr-Im; Tue, 06 Dec 2022 04:34:29 +0000
Received: by outflank-mailman (input) for mailman id 454334;
 Tue, 06 Dec 2022 04:34:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2Pf1-0005MV-U1
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 04:34:28 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43c27aec-751f-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 05:34:27 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BC38C32009F0;
 Mon,  5 Dec 2022 23:34:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 05 Dec 2022 23:34:25 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Dec 2022 23:34:23 -0500 (EST)
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
X-Inumbo-ID: 43c27aec-751f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670301264; x=1670387664; bh=2DJbvlN3MtrCNxWUxmi7jS5GZRlwreYino7
	nE2TrQ8A=; b=pX4tF4v1k1eZYNu5zbN0bvxHj78cjeFoXlJnqzBOx+W5Q07E8Aw
	T4FFv51qysrQCghks8QTRzO2exdFD/G2czKEcUwPXmtIW+CUXJeJ+dVFrBRFYiMy
	uhb7eGRs8/UUiLT/oGOWix1GyTtbZ/Qaj5wAjWdasrR0tFLu9MrhVDAchrjsYhW8
	H9d0kh0/KNuS+zSFHzafTGuKQwFJlp1ISz4sXULk6oynyMeVgMRV9Yf9sZexP3I0
	o4Q/CW2UCIXsLw2bb480oBkpdhU02Sk60z7nrz14EpeCUkfHyoFYuPDqd2UV7HKd
	z4QNV28QARiY3JABsIPF3M28Gi+QrB4hmaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1670301264; x=1670387664; bh=2DJbvlN3MtrCN
	xWUxmi7jS5GZRlwreYino7nE2TrQ8A=; b=d7BWW/qi1soi+uBGNDBoALS9fwbuu
	13EbDAx/H4mzrcP/FA6mtdd96ZWTqP+NrAlRb4IESvR9HEj1dOGu4SRb2GxJKwyk
	x+GbqiTy109XkCw74JT3fzmPZYAcY8edJdqqhlSTDggFLzVJxuknRzv05/toTIdp
	EAQiqeSgRDE1tAAqTyRw9P0GCTPLXSeNeMnVwraOPfW5ErPChSCb/lJItKL62hl2
	qQDlZgEx9nIiRz7SxG2SUMNCG5zYAxobu+IMaiJrbZCg98pNWeUSfijMERwi1fQw
	4KFgDhDkNSCXXOQ1XqVYlwNqv6FdSLn50Z0N8Iww7QZ/ZqXGKpzcenQaA==
X-ME-Sender: <xms:UMaOY0CrFbSeoYUSs_BEP4XN8XSaSz75_6s-2Xn4JIrGKPNG-Uywgw>
    <xme:UMaOY2iGC8w_hi6zDHEvov8tNc-HisCU2yMEPHSHQniMrsRxuTPIMZ_52_AVI30Bm
    LknnzDob0JGs2A>
X-ME-Received: <xmr:UMaOY3kC6kpt-rHCzQL6HmslU9Ul0cI8Iw0iypGfFX7SpMXZVapQ4DhxkW_VWiVcZDf_T3B2VrVq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:UMaOY6wvS55fgjTgoGR3Tp9ZUjjKJsyBqeegPwXj3B4yzAoGWDDKiw>
    <xmx:UMaOY5SYq0lpCOa38MBD4i61cX6hh0JE5rgXOCpynefK04ydGlvJ1w>
    <xmx:UMaOY1aLewr65rrW4-vYCBPgSPC4-MwcHsfYQHesBBqzcjmLHx25SA>
    <xmx:UMaOY4FgRCkFd-2VQvjXBba4qz-jSXmvcGL7En0w8TfQKBsFsWASDQ>
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
Subject: [PATCH 3/8] x86/mm/shadow: avoid assuming a specific Xen PAT
Date: Mon,  5 Dec 2022 23:33:32 -0500
Message-Id: <8fba8137ea2aa4fb5c61102342ad42ed8a9d0f66.1670300446.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1670300446.git.demi@invisiblethingslab.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code easier to understand and more robust if Xen's PAT
ever changes.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/mm/shadow/multi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 2370b3060285fee895f335f2a82d3d22ca5d31ed..4e94fec3d50cde0e5a26ecb62ff4d00dd00f759d 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -629,8 +629,8 @@ _sh_propagate(struct vcpu *v,
     else if ( p2mt == p2m_mmio_direct &&
               rangeset_contains_singleton(mmio_ro_ranges, mfn_x(target_mfn)) )
     {
-        sflags &= ~(_PAGE_RW | _PAGE_PAT);
-        sflags |= _PAGE_PCD | _PAGE_PWT;
+        sflags &= ~(_PAGE_RW | PAGE_CACHE_ATTRS);
+        sflags |= _PAGE_UC;
     }
 
     // protect guest page tables
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


