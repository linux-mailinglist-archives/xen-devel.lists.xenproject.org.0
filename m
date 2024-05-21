Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053828CA672
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 04:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726457.1130732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9FhL-0000W3-Qf; Tue, 21 May 2024 02:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726457.1130732; Tue, 21 May 2024 02:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9FhL-0000Sq-NA; Tue, 21 May 2024 02:57:55 +0000
Received: by outflank-mailman (input) for mailman id 726457;
 Tue, 21 May 2024 02:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TC+7=MY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s9FhJ-0000Sf-UZ
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 02:57:54 +0000
Received: from wfout6-smtp.messagingengine.com
 (wfout6-smtp.messagingengine.com [64.147.123.149])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8e86ebd-171d-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 04:57:51 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id AC5841C00122;
 Mon, 20 May 2024 22:57:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 20 May 2024 22:57:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 May 2024 22:57:47 -0400 (EDT)
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
X-Inumbo-ID: e8e86ebd-171d-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1716260268; x=1716346668; bh=5iRq2U5WdpuhpARvdUR3L+8oSCsXiVO/
	kcVN8kDxkv4=; b=eTW30/trzT+rX9HtCzIDgPrIBxTAmxBMIaN9A9mgUmvEFN9x
	04+EMaOKsCPT4oaLWj1K8lQl/E+s7oxPWChDkmJpTaJpUidj9APL3658uneuCU3g
	CKlX2+5QfTI0PUbZVht1hmPLZvVgh9HGimv5w/OArwNZZIed5X/5lEyOvErdGruQ
	Fj8EmcI+yyeLlP9ata9YKh9zGhjHvZ7QNYcPzQ33vUs4yBOvfjpQpZbcCVhWdoTw
	YJ23a2WR42ZUAWm1Fq7tsPRnAKbVh5ATZ5gkQotYUbRK9TYsnqde+r4pKyd7cuQQ
	WgyyGo9QuC7oG8Gx8QWA/1M/r5Kwmo+VzwmFFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716260268; x=1716346668; bh=5iRq2U5Wdpuhp
	ARvdUR3L+8oSCsXiVO/kcVN8kDxkv4=; b=WZPdqBHfy5LVEUDp4kutm3OXo4eOI
	5xJr6OnHO1BI1QZcLu1q6nTOaZy0MHRXNYDUlR7HYvN0qbates0oSZckADsKKpnp
	iOScjF5ky2B5RlvYeIXrJlBcqK01dOkoznlV8ElafXVOnESRqNrWse1KQK1tkHGG
	gs64570AUMBJ48L4TCKUa6+96Pb3fByVWohkdRCfyrBQwROtiWPcw2y7vbBMizMx
	CYLoarKuSf6Cx1f4aOOKTlqdIiAKFlmei9g3OSHwO1RODTWBsts0vvBdalD9t7DX
	TILJEy2E979zDq8nvDYguRyZqBrsisA3StNn+ByUgB0Oh6CK8SacxHKpg==
X-ME-Sender: <xms:rA1MZo844NTgK4gHaUCo_zwU-9XBJHzbD8VPQhiEXvp0YFNubf6i7A>
    <xme:rA1MZgurEoRZm1hTw1Hh5TmJbK2ARZcNtEbKrqGebnsWMqXqLlwILGovXF-ZxI2mp
    Ql9-Z5RcBtVOA>
X-ME-Received: <xmr:rA1MZuANIzE7GsaL2Af5qixqqKqA9ba5_b-afDbA26hae7VhcdmbcvIBrIJL1BetYDZlUVlgHM9_onP5rwLe4uEL_0tdX2JHkhJesA98HSCDiiDWBnI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeiuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepleekhfduleetleelleetteevfeefteffkeetteejheel
    gfegkeelgeehhfdthedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:rA1MZoeUx7mroKiafaipkIYRxA3XvhGxXj8jMGgfn3wl8aK60nvoEw>
    <xmx:rA1MZtNLI6TEQ-z9PRMu1F27b4hv19tlj6FwJDAnOTzTE28F19WorQ>
    <xmx:rA1MZil3kfqQfkildmfESZMrJfqprjVEBK8q5I46-6ybCvl5g1wHvQ>
    <xmx:rA1MZvsjaDsrgKCVBG_sdcnCi7HVUUVS4iZSkUHuUo3tzi2g53SRLg>
    <xmx:rA1MZr0J1FMN8Wz0bdrHuZ73AiQdEaH58kHXTWuoYnHj2yMxluRPr4kP>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 0/2] Add API for making parts of a MMIO page R/O and use it in XHCI console
Date: Tue, 21 May 2024 04:54:31 +0200
Message-ID: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On older systems, XHCI xcap had a layout that no other (interesting) registers
were placed on the same page as the debug capability, so Linux was fine with
making the whole page R/O. But at least on Tiger Lake and Alder Lake, Linux
needs to write to some other registers on the same page too.

Add a generic API for making just parts of an MMIO page R/O and use it to fix
USB3 console with share=yes or share=hwdom options. More details in commit
messages.

Technically it may still qualify for 4.19, since v1 was sent well before
last posting date. But I realize it's quite late and it isn't top
priority series, so if it won't hit 4.19, it's okay with me too.

Marek Marczykowski-Górecki (2):
  x86/mm: add API for marking only part of a MMIO page read only
  drivers/char: Use sub-page ro API to make just xhci dbc cap RO

 xen/arch/x86/hvm/emulate.c      |   2 +-
 xen/arch/x86/hvm/hvm.c          |   8 +-
 xen/arch/x86/include/asm/mm.h   |  18 ++-
 xen/arch/x86/mm.c               | 268 +++++++++++++++++++++++++++++++++-
 xen/arch/x86/pv/ro-page-fault.c |   1 +-
 xen/drivers/char/xhci-dbc.c     |  27 +--
 6 files changed, 309 insertions(+), 15 deletions(-)

base-commit: b0082b908391b29b7c4dd5e6c389ebd6481926f8
-- 
git-series 0.9.1

