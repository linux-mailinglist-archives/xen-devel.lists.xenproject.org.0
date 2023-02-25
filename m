Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5E46A2CA4
	for <lists+xen-devel@lfdr.de>; Sun, 26 Feb 2023 00:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501932.773754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW4Pf-00050V-Ck; Sat, 25 Feb 2023 23:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501932.773754; Sat, 25 Feb 2023 23:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW4Pf-0004xn-9e; Sat, 25 Feb 2023 23:57:11 +0000
Received: by outflank-mailman (input) for mailman id 501932;
 Sat, 25 Feb 2023 23:57:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rUVm=6V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pW4Pd-0004xh-NT
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 23:57:10 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17cb61ed-b568-11ed-a82a-c9ca1d2f71af;
 Sun, 26 Feb 2023 00:57:03 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2D1EF320039A;
 Sat, 25 Feb 2023 18:56:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sat, 25 Feb 2023 18:56:58 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 18:56:56 -0500 (EST)
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
X-Inumbo-ID: 17cb61ed-b568-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1677369417; x=1677455817; bh=ATk4fq3+AQja6Jtyo3H0DPDhoSBSuRwkbdu
	GLRWnAag=; b=d3UCh+lW6n5iy2p8C1E0XF6Ivb5EuXbguz04KaLVMZ4262/n1Om
	B+MZDp3M3ZZwI9RFRMFJqQTnHqBP2vAUCqeE2SsapyOaEMdTuanRYtpsqrO1Fnnn
	6Um0uw9r9/PMq0Ml05w3+f2LpfOSrjkklIrcIVVc6lrj1nQeyOlex5TPiqr32bUE
	Lo8jEcvpOErG++BTdcMWeXkWWZCJhTJGMCy4sdfI6fCZaxKiyfwbkM6uRkvdDEnx
	7C/f/GdQJaCohCPvcq3J21T2ILX1H7nzGlQ07FNhFfWnQc99CSU+1ZSYfQByptzg
	VgO9VNVfX5FenavSXpS2bpTIECdA8rlzafA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677369417; x=1677455817; bh=ATk4fq3+AQja6
	Jtyo3H0DPDhoSBSuRwkbduGLRWnAag=; b=a2r3aEdO7stg01910B0jJGdbKkhJ3
	I5TW4nhCZ8VyxGsmQ92i/Oo2SjjGj2nLXlwMb/eUVL4iJF8YBAanv+fUCks1AeBQ
	tLr8wVKzftPkIwluERUBoRjI+L1tQ63JM74G/1dt5YVoWgAKLpgAiDw7cjIcdjdr
	m4rlW36BbclRrM5IlwlrWtnBOC4loK9vq6WJqRN+ipeVl2xH3tlvex2r2Ne7H4TE
	8kiQu20TIk4TFsveJXnluSMOqJAsvTZgvdciFvkUKxirKf76oRRwH9uM4wC/Zn9o
	am0NF3LPDhoN6ckU/irZ3qJxnDyqk9fOaDDxRr7KoGdEKlxRQM/kSK3Xg==
X-ME-Sender: <xms:SaD6Y2KM4aHKXg9C6GduCMe0qG9BpKPd92LIRWIXoMCGYMm_nYLc0Q>
    <xme:SaD6Y-Ltdj8lFu3bt0zA243IWdueX0V8XR_VQMwu-uDsKxZRxJx6ULOJ8t9AQ7MVq
    UglyTN4MnJuqw>
X-ME-Received: <xmr:SaD6Y2utFB_FvER0VdAzQRWgSAEiltmbmWD14tT57426ELgAUZ7wOkj1MkLeX0jNXEjbuJzPz6LRCmq5hXxE4_GgrMNnzXTqwQCLyW5WNn3_K3SGK8gb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekjedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveet
    ffehjedtkefggfdvfeeihfdvffdtueejgfeliefgffekffehfeffhfefheenucffohhmrg
    hinheplhgushdrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homh
X-ME-Proxy: <xmx:SaD6Y7ZkI73hNVwsaBScd-Dzi3-_D-Qpn-uQTE1L5cQTNkBmIzb-AQ>
    <xmx:SaD6Y9YpmTxErpo_32Y7wll0IJzEIZo0PX767oPllGrhTZH57HLsdA>
    <xmx:SaD6Y3Cw-w6UjE1Bnz0TAdcuTd6b4_UMRgiI_WtggYa6S6troGo46Q>
    <xmx:SaD6YxG03zabZgJ9Fr5He-_XpC4wp_mNf1X_cRj5BNpLmE_PHoDMqQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] Drop ELF notes from non-EFI binary too
Date: Sun, 26 Feb 2023 00:56:42 +0100
Message-Id: <20230225235642.38880-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ELF is repacked from from 64bit to 32bit. With CET-related notes,
which use 64bit fields, this results in 32bit binary with corrupted
notes. Drop them all (except build-id and PVH note retained
explicitly).

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/arch/x86/xen.lds.S | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 8930e14fc40e..f0831bd677e7 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -192,13 +192,6 @@ SECTIONS
 #endif
 #endif
 
-#ifndef EFI
-  /* Retain these just for the purpose of possible analysis tools. */
-  DECL_SECTION(.note) {
-       *(.note.*)
-  } PHDR(note) PHDR(text)
-#endif
-
   _erodata = .;
 
   . = ALIGN(SECTION_ALIGN);
-- 
2.39.2


