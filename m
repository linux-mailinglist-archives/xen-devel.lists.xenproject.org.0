Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5390B540168
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 16:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343349.568705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEq-00070I-Gq; Tue, 07 Jun 2022 14:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343349.568705; Tue, 07 Jun 2022 14:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEq-0006sV-9w; Tue, 07 Jun 2022 14:31:20 +0000
Received: by outflank-mailman (input) for mailman id 343349;
 Tue, 07 Jun 2022 14:31:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbs7=WO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyaEp-00061K-7m
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 14:31:19 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e216186-e66e-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 16:31:18 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id AAAFD5C01CA;
 Tue,  7 Jun 2022 10:31:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 07 Jun 2022 10:31:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 10:31:15 -0400 (EDT)
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
X-Inumbo-ID: 7e216186-e66e-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654612277; x=1654698677; bh=U8kU4goNfn
	hejF90xv/RWehAvQ7mOrYaRxEFIubWjr0=; b=R19Zk3lTBIeggp7H1+bRpEHI/N
	X/7qNFFQex0MnoJYaqhZ0tdxCiKI+vgtcLLVUcnwQ5vgmCEUzzr6bAak9WqLMm4s
	Bcinoc7WAgQ68OM5AruE6spN6iUCPA+FjAIcsO7zO7cAjqpsEhFV5hTffWzQfJKq
	jFAlt7LBoCG8zLmlNZHrzG3sRYE8As+LhOVzNREn5RbbM1yVt3+LaR6IwXPqxiGh
	S4o+oqKJ0fbUW7hAS5LHOJGWR6GvXUy3M0ljr/4N5Q6dEgymDBbytT5xgBED1s9S
	XBnQVufCI0z+9ucFYcVocoNWPytS32v+FQcL0SSvAHtIVwNWJi7vnQtzjkkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654612277; x=
	1654698677; bh=U8kU4goNfnhejF90xv/RWehAvQ7mOrYaRxEFIubWjr0=; b=H
	uXIBu3wUbTKPSN1QekhmnIa/VHUUcWwk2OAM3jg34KB+lNkS8cmGyTxu2SF8kn+5
	vdWcHXPqxJeTOfKDx7goJDx/d5eQEGLZ0Yoj2gCowra/cXabkzjjvkjyr0VDH2ST
	C/E32RFFif/xxQHKqUgfVnvqNBFJu3DRQyscNYdsjDpf+LeF85uorh52FoKMSd8V
	ybuROokVnpRuaU6QRU071ogi1mCZnCHW3m8kRbHIwvl54sEhmvtQa8LmoMnSd4jd
	EtK0GukwDJeA4i/7CPyvs8C+xjkP/nyq1j01L93TxuOtz0GRlaC6IJinVR8+/8vy
	Ym9kiltCtPkkR0vjkyCvQ==
X-ME-Sender: <xms:NWGfYlkM9gAwgQRyIKhSsSi97CePmObOSEjwEWQg2Wxo5KOLWTKiKQ>
    <xme:NWGfYg1U3U8ZJqy1bC8z15_WNXKcItgi_Lr8IzTff-V3-DZCD9BDoxDk3domh6UfS
    96I3y6zlWBEvw>
X-ME-Received: <xmr:NWGfYrrPHJTNgObIP-v3YcPVkmgd0na0z_ca2lPj6KXrVVmrYjS1wxnofxf3rIfqMgIVNVnKJY9qm40Vdw7PznHyhrHUbyznK2Md9kq0r8KbWnA301I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:NWGfYln6QAMy4HI7yyVx_ceVRz5LoL8sbxJ1UE4oAYmRdk4g-paOKA>
    <xmx:NWGfYj1S5vf8CGb5Q0oJgY3DHCri0klX6kUYWs_jf0_2OGzWAEvHwg>
    <xmx:NWGfYktuFrKqohHfzUovQy-wVP4UAwqmdJeuVaOhrhQfCKQk9Vt-Zw>
    <xmx:NWGfYj-s55_EzihEgTFcpsn_2T17jwbpIVWG7XmqjQJamaJZ3qWKlw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 04/10] ehci-dbgp: fix selecting n-th ehci controller
Date: Tue,  7 Jun 2022 16:30:10 +0200
Message-Id: <e7d63b72873de3791e26a6551fef7132fcc9f241.1654612169.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ehci<n> number was parsed but ignored.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/ehci-dbgp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 16c8ff394d5c..92c588ec0aa3 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1480,7 +1480,7 @@ void __init ehci_dbgp_init(void)
         unsigned int num = 0;
 
         if ( opt_dbgp[4] )
-            simple_strtoul(opt_dbgp + 4, &e, 10);
+            num = simple_strtoul(opt_dbgp + 4, &e, 10);
 
         dbgp->cap = find_dbgp(dbgp, num);
         if ( !dbgp->cap )
-- 
git-series 0.9.1

