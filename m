Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D42A78CC442
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 17:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727788.1132465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9o3x-0001Ni-AU; Wed, 22 May 2024 15:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727788.1132465; Wed, 22 May 2024 15:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9o3x-0001M7-6Q; Wed, 22 May 2024 15:39:33 +0000
Received: by outflank-mailman (input) for mailman id 727788;
 Wed, 22 May 2024 15:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKXr=MZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s9o3w-0001M1-Ay
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 15:39:32 +0000
Received: from wfhigh8-smtp.messagingengine.com
 (wfhigh8-smtp.messagingengine.com [64.147.123.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 799956f0-1851-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 17:39:30 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.west.internal (Postfix) with ESMTP id 3A12E180012F;
 Wed, 22 May 2024 11:39:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 22 May 2024 11:39:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 May 2024 11:39:25 -0400 (EDT)
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
X-Inumbo-ID: 799956f0-1851-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1716392366; x=1716478766; bh=lGY7DJZBxL+CSFvhqJjMHTmBfik4rcS3
	gTRhssuYaZ8=; b=Iiw+AOXlGdl+c+f10NI2bno8nJk3UoFxp+ZLCzlT4jYtZs56
	LnpbBU8OAILj2Kv35QJg5LDVd1seZlen8d+22v9MuzINNEBWe9gQgGk0/Y60GZ+w
	h29kgVthnjDu53YNg6YC/8MQ7u31kpx2H8BTiq7rtq003HtViLNEcHzdYxwQLWvO
	QJYvgRGHCd8jiV/EO0GkAiiJ0JCOlLRH6JTwtfRSjHQiSdPS+/JwLueTVwDqLuo5
	TM9piVT3tRQgwxnxO7V50rQXeB3LZ/Tkxz4X+sZ8E8lz5zpLzUVg1Y0b6rBn0N/c
	zxxK+Jiy85qcnG+pIg6VvhZBlsGikx76aSm93A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716392366; x=1716478766; bh=lGY7DJZBxL+CS
	FvhqJjMHTmBfik4rcS3gTRhssuYaZ8=; b=C/k5DkhTKriR7aZ7MKknPLu9wLF/c
	DG9BgmSCi0+ENRN0JeuF0tf0W1S21musTBg0NlDkaAeGotiv9lYawX6HyfgfO1Pn
	AlfYHMwH1P6v34XwHk6cYDs08zC7uNKQkEHOpsyP2ZjDxNNXXa5WKhEgx9DaBxIh
	GhymfGChl8GWPUbDMVObidO0/8MR2n+lGY0aLDftaT6D0mIA+DS1CoMmcMnM4k1q
	un97wDfDSi3tTzJ8qkndC1x83VlmO/6FKI9BMZTJ3qaQIQRNmleRfCk40u+40K+T
	U7Sfoj3c2BpnLqiKLAENWsKrw4ZIWAO3I94sm6v/fQjSwFjj9cUj8ibTg==
X-ME-Sender: <xms:rhFOZtmPWjXta8VwIZ4QK1U3rziyRgdrs2htBraE7CuthOBvB3a1aA>
    <xme:rhFOZo1RziaNV8Ji3tyUg8gy9rqIoHJ-WQ02DQIj5zFWuM6LfM7P5ExOtuLjRxV1N
    c5EBbdBgbolwA>
X-ME-Received: <xmr:rhFOZjq_eU78GL7Rk65hDESpea8uuY_wfNOBjDc5-Ptlu3INKxxQ-V8JspFzxDDnqrBfS3Y7ZGMHQY4KQ5AIF6ozflYWdV0m1Iz7WsislS8RCls0DoE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeigedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepleekhfduleetleelleetteevfeefteffkeetteejheel
    gfegkeelgeehhfdthedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:rhFOZtnz_6Xwc25J7oZ1zfM3stvjB1v80qt9iitZSf-r1JBdaZxdsA>
    <xmx:rhFOZr2NX9npgq-QKGuZnoFlJxdPGrU4e_esQ9eeXncXO1TYmy0R3g>
    <xmx:rhFOZsvDKXgxy9jzR6YF3NBAPx5FmpYKzyHoRacwj5BFXsur97p-HA>
    <xmx:rhFOZvVQcqt4XIa2zcP3F3ilV8WWE3_Uf53uevHIcUE571OreNSgTA>
    <xmx:rhFOZk9BJn8b2LG-sATIkFQ_DzBqboYKxZkSFNxahxHZP5O9je6gMRP6>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 0/2] Add API for making parts of a MMIO page R/O and use it in XHCI console
Date: Wed, 22 May 2024 17:39:02 +0200
Message-ID: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
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

Marek Marczykowski-Górecki (2):
  x86/mm: add API for marking only part of a MMIO page read only
  drivers/char: Use sub-page ro API to make just xhci dbc cap RO

 xen/arch/x86/hvm/emulate.c      |   2 +-
 xen/arch/x86/hvm/hvm.c          |   4 +-
 xen/arch/x86/include/asm/mm.h   |  25 +++-
 xen/arch/x86/mm.c               | 273 +++++++++++++++++++++++++++++++++-
 xen/arch/x86/pv/ro-page-fault.c |   6 +-
 xen/drivers/char/xhci-dbc.c     |  36 ++--
 6 files changed, 327 insertions(+), 19 deletions(-)

base-commit: b0082b908391b29b7c4dd5e6c389ebd6481926f8
-- 
git-series 0.9.1

