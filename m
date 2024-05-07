Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC58BE272
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 14:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718068.1120616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBr-0004P5-3s; Tue, 07 May 2024 12:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718068.1120616; Tue, 07 May 2024 12:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBr-0004My-0f; Tue, 07 May 2024 12:45:03 +0000
Received: by outflank-mailman (input) for mailman id 718068;
 Tue, 07 May 2024 12:45:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3sU=MK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s4KBp-0003AI-Rv
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 12:45:01 +0000
Received: from wfout4-smtp.messagingengine.com
 (wfout4-smtp.messagingengine.com [64.147.123.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9de48f33-0c6f-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 14:45:01 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.west.internal (Postfix) with ESMTP id 4D6C21C000B3;
 Tue,  7 May 2024 08:44:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 07 May 2024 08:44:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 08:44:57 -0400 (EDT)
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
X-Inumbo-ID: 9de48f33-0c6f-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1715085898; x=1715172298; bh=EAaNxhwX2Xjwv3rkR/3PC
	xXHxt3VIaaNGAHnw+G6qes=; b=JY8d7J7lJXtyd2BPAJXkW+MmZsVnTi+/ACzIy
	Y+NMlHs31TO+025RNoxuN0vb8CkF1TJjeL6TVFwyaMoCrN0TVjPQ5lJUxtVqeVLM
	z4oGM172hEU976I8o1dY98DrDAWV6ZBlmov9sBTfQCAfOPLbTf7Jcf7rxOH8YXAU
	B7SpB2FOjJGSz4skgCuY2tF0URzUPazoV3/jFdh8CbZzsrhAj8qzoIISUjebTEgv
	hszOqraBrt4Mn28SHS5Wi+PiPg2C++JPWXjRmyv7oiLUdkRjca0AgWlaOCHr9U3y
	LYf2ZOVeDMOnT79W/ZOBaUeNsOFNZLToUUD7taTi6k2mI9KLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715085898; x=
	1715172298; bh=EAaNxhwX2Xjwv3rkR/3PCxXHxt3VIaaNGAHnw+G6qes=; b=V
	GcLr9SqyAcXuKbD8BZAVKASwA6aTYPiqZy7+SFs9t9YM2m6pUbD7sUvy/U7kgMv+
	MuSlnNZoZwVDjOqXSVFIrbUKHg7X84Zt1okrAOrfnK9RjFiBBOD1Gw9vCfyBRJhg
	JNSaS74KzzMmao06hK+JzeMHe1iOPFdbqslmsH0NHhzBjBktvrNa3HIu3h4i3TmC
	0ZLnIXs8LpYZa6UBvZUd8qKHj4D6FDb1WdwAQ5MGQatyPXMa3Z0lxoPcooutO91O
	pz1G/uLLvTYF/rs2szULqU9vrrnL+UkFuDSUOuXBiUvbHEai3upNKDUYbNQD2o/l
	l6kD4ZN8cHwlqUokLLvSg==
X-ME-Sender: <xms:SiI6ZgwFxo9ICcdvk7FEN-f1vmTr6e-YCGmLKoysZQFRvY3wKZE_BA>
    <xme:SiI6ZkQK33bpi_qzihvVBUBDBV9DhGJVUSjnCmADF_zKd1CavQUperJc8HE48gCMQ
    OnqymRWdxNzjA>
X-ME-Received: <xmr:SiI6ZiXPQGbF2kcWjYtSobFA0wST2WouReY4PgR6oZVL2uKN0R-gyhoIEcClmMNSyILfHHBot9wEwYwSODkhThZVGZRdk7uSyHMgeL-dnpCoxfiD4z0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgeet
    tdeigefhkefhfeegvdeuiedvtdffkeeltdeivdfgteelueeuhfetleevueegnecuffhomh
    grihhnpeigvghnrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:SiI6ZujcshQqAw0wo47mPzVqONpbi4RuTBf6gh8QzqB6Vywa_GRupg>
    <xmx:SiI6ZiBDxJQ2yZbjTGnWfezsmi_DSYgG-kV0TC6A3G6S3y76cF3v8Q>
    <xmx:SiI6ZvLwRc7LTwCVXxytYsDjsp6UruLsywalI2klCdMQZ6rlKo8Rqg>
    <xmx:SiI6ZpCU9hdzHVDgO7dvUt4UO9U1DhJF5v9YDYNLzjrpJmZGH1RgCg>
    <xmx:SiI6Zk3FLoLf_L5ghq4e3oNkqAUrKr66pau44MqQFvrN4cSmeBGRFj7u>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 5/6] [DO NOT APPLY] switch to qemu fork
Date: Tue,  7 May 2024 14:44:05 +0200
Message-ID: <711d3d849a80657ae730daa16656770a2758862a.1715085837.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
References: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes tests to use patched QEMU, to actually test the new behavior.
---
 Config.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index a962f095ca16..5e220a1284e4 100644
--- a/Config.mk
+++ b/Config.mk
@@ -220,8 +220,8 @@ endif
 OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
 OVMF_UPSTREAM_REVISION ?= ba91d0292e593df8528b66f99c1b0b14fadc8e16
 
-QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
-QEMU_UPSTREAM_REVISION ?= master
+QEMU_UPSTREAM_URL ?= https://github.com/marmarek/qemu
+QEMU_UPSTREAM_REVISION ?= origin/msix
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
 MINIOS_UPSTREAM_REVISION ?= b6a5b4d72b88e5c4faed01f5a44505de022860fc
-- 
git-series 0.9.1

