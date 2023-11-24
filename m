Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710AF7F6A44
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 02:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640076.997920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6LJC-00033i-DF; Fri, 24 Nov 2023 01:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640076.997920; Fri, 24 Nov 2023 01:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6LJC-000313-9D; Fri, 24 Nov 2023 01:48:42 +0000
Received: by outflank-mailman (input) for mailman id 640076;
 Fri, 24 Nov 2023 01:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uC13=HF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1r6LJA-0002RQ-GO
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 01:48:40 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9609b4b5-8a6b-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 02:48:38 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B0BF13200A48;
 Thu, 23 Nov 2023 20:48:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 23 Nov 2023 20:48:37 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Nov 2023 20:48:34 -0500 (EST)
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
X-Inumbo-ID: 9609b4b5-8a6b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1700790516; x=1700876916; bh=vpLMgvoJof
	R2y12hqIaKomgeg+9OwWixKJMvmnvwMU0=; b=0saaUeqCjfcRk1zzI83y/8Esez
	QgzgBJY3IvqCvRd2Trg7lQtfXYLxfo+wNqViHFjlN6QvRw5frgIwJwP8QaRztNVY
	5J+vfQ0Kl1GSRkvPx2OdGRvgILWOT67/4QKNemlJNPy2/XCQhwV+D8B8KZe8kkRD
	3Jk5eL90Lut/rjpwBMZnLTnDl9zqqdv9xEr1GpyizY9GevbB9IxCFM2wdlaeWjKe
	ioXHRLfgrjEZfFwnlmJLfsjnrEJG2bEOGdVV9+QIuYcjYjgGKjzTKNLFmNxlE1Kb
	Ycl6IEPnTAhdmDXYFbuKllX1mc996zT9keRAexjghEklE/2o5d+PEzuPaEJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700790516; x=
	1700876916; bh=vpLMgvoJofR2y12hqIaKomgeg+9OwWixKJMvmnvwMU0=; b=E
	iIQUonKQZ9r/WIVdN6uVj5C7QZ6r/ZL8sJVBTxMLNjDiL61ZPvi6BQZMr4EzVh+e
	vFdwiNIZqRhFxhvmHnVHcPd1a2ouhlTykReqdolPnZGKn/rWWENuWFMHlwHdf97r
	FY8qws65QDhIUbuwmY+KphdSLyV2kXf7hbqA6D4187mVA66PU9OCCzZiubV8Psnl
	vlIYTVyZdSklM0nUJbZH9t4UCTvdYrCgN2R0icE4iHf+H45D8h4bC19oGOIX7x8X
	pZea6Nlei6/COX+jkHS61yAXqXCLoCGr2ifOxE11z2Vf2lFic1OkNZv/0tRAtQsV
	PbH1gmNI6fxXt936kXOtg==
X-ME-Sender: <xms:9ABgZWTBrfoQDRdIJKHiQIdslUbW2eOzQTiFYd__NzbcqeC7vnEtsg>
    <xme:9ABgZbxL4R-Ny9TjAF3XpRN5L6aKT4KegnLPO9EAiMxi3rPBLcSXAUU57VWAZCSOO
    wcfLDLpleQcYA>
X-ME-Received: <xmr:9ABgZT1_qM2XctTvaOwtfofnkloEuiLfaMWPUh-oKsvXt5KGJnAKaautIuohxY_2Tsl2tJ_mY9JaAhQsfGrWhsFrIFvO5O72fl4qTBB_Y7twhsk3gStb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehgedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgeet
    tdeigefhkefhfeegvdeuiedvtdffkeeltdeivdfgteelueeuhfetleevueegnecuffhomh
    grihhnpeigvghnrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:9ABgZSBnLmpuUXgeTPTy4fyRTASiEt3OsbEAcYNRxE3Tplu-QH98xA>
    <xmx:9ABgZfhsLPR9_qi4Xwu3rYNH04Ov5c44BgB0bEuTs3qy_LbLYZR56Q>
    <xmx:9ABgZerRV-YBAoaBM9P0EAd2KckwFERhfctWmoIqExWCoIN1nlrMjA>
    <xmx:9ABgZVYuQ49X-mZrTKACK_1YKtTkcc4V3VhePHWjjzckC8YpyKsIMw>
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
Subject: [PATCH v4 5/6] [DO NOT APPLY] switch to qemu fork
Date: Fri, 24 Nov 2023 02:47:09 +0100
Message-ID: <96b370aee16ee0429db38009a5d694cdf8ba34b7.1700790421.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
References: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes tests to use patched QEMU, to actually test the new behavior.
---
 Config.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index 2c43702958eb..dd2687c0e9e7 100644
--- a/Config.mk
+++ b/Config.mk
@@ -222,8 +222,8 @@ endif
 OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
 OVMF_UPSTREAM_REVISION ?= ba91d0292e593df8528b66f99c1b0b14fadc8e16
 
-QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
-QEMU_UPSTREAM_REVISION ?= master
+QEMU_UPSTREAM_URL ?= https://github.com/marmarek/qemu
+QEMU_UPSTREAM_REVISION ?= origin/msix
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
 MINIOS_UPSTREAM_REVISION ?= b08019f0b2fbc30c75169a160acb9fd9af5d68f4
-- 
git-series 0.9.1

