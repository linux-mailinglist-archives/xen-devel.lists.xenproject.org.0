Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEF86ED66A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 22:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525618.816911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3FX-0004tv-FK; Mon, 24 Apr 2023 20:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525618.816911; Mon, 24 Apr 2023 20:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3FX-0004rF-CB; Mon, 24 Apr 2023 20:57:27 +0000
Received: by outflank-mailman (input) for mailman id 525618;
 Mon, 24 Apr 2023 20:57:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HiTc=AP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pr3FV-0004NP-Iu
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 20:57:25 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9be83945-e2e2-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 22:57:23 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C418F320096E;
 Mon, 24 Apr 2023 16:57:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 24 Apr 2023 16:57:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 16:57:20 -0400 (EDT)
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
X-Inumbo-ID: 9be83945-e2e2-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682369841; x=1682456241; bh=eE
	TiK0cMY/4VSx0OpwWx69mmU9UYYQGptj+aVps8CVM=; b=bYgbgTjZ7AhwuOzHDM
	HwSTdqfK7GqWCuDuVowuZ9+S9Tghz2UazFv7PIR+leWluDkg/k9cRBBjy1JY/IQo
	pakHHWOfVjWBo3r7EgdD4UcT8Dkx37+E49OVVTNs5OjMgZ/SgwMNbWqu+IHpBh8U
	EcctHC7Ilxt6677A4hgT/mWEHQ9oaMcnqYCSl07RVFkVRSu5D/JKVenhWJbiuhzG
	bp2N8AR0OtbIFr5XJq/brt5F2sPEstxBlBfXYgXF5hO33dG/VGzDdhm5hbbEL9q2
	wuN+5jQZ6iLmPGqabc99awIeqRFT+FBIsCBXrj98nECMzIjPw2vejjezKLO5ircg
	lvRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682369841; x=1682456241; bh=eETiK0cMY/4VSx0OpwWx69mmU9UYYQGptj+
	aVps8CVM=; b=GBkMNyiG4ksrP+9sQjh/56LH5CsD94WyciK58EChSPZeqtmkZma
	pGjaNKzFAi5/u4Y6uztBFdlnOc75KvfiBzWQrFUM5vB8QYhrfECZt3zS0hf7QKiY
	swf2dw+EPDX7i/u7SFeZh0KEefsZwzOqTQrt1ZuSXiym4nx94SUibPOxsS1o7Xtn
	GS98ctk4kMO0QvLAnFwZ+ut+9ScG/r772YphvIkmq3E3flpE2JT3u6v4USaaOk9Y
	VPbWCbPX+sTRUtxIBMGA3PNes2efO69JHgVy+I2mC6A4Kk9mZIV8YfaReXuTU1pE
	Ub2gi3UnM/L+wb9oUMSSpdLVjOMNYtUR23g==
X-ME-Sender: <xms:Me1GZJvEGqbFybrp3Ks14BWS4CPcgIi3AJL-4YbTRY3ZMlEP_uR5SA>
    <xme:Me1GZCcU47bmAfZBmAJet7be1EYNPLI3yZXGxHFF6RvGe3IjZ1inx4PndqYSW-Ds0
    Q0JH0ggz8lJfg>
X-ME-Received: <xmr:Me1GZMz2HkCsIzUlAnqzp48MXXjLRcL2kykjY4F5jWSxl5Ec9BvSJ_3e9WVRrLoJXpX9CUfUKGPS-2XRd1qYPMGr2Xzil_ZbDljOZKtzWTYsDsi8WGCL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Me1GZAPJ3c-xELIkDSYjg75_1D-cYoibSJg7gTyqUOGfC0x8sQ7C3w>
    <xmx:Me1GZJ8MD-mNxwVUMOsJyIfX5Fe_Ebz5JV_ynqR02NbXajlb0MbX9A>
    <xmx:Me1GZAXWOcaqLPonG9TuaNuVfxFzfGu8hl4kaCcP8owN_ej5Y73qpw>
    <xmx:Me1GZLnRNZHPuSt40upnj0bIljMeRNMYrLeR4y4dQi-qe9cl2XFPjA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 2/6] automation: add runtime qemu dependencies to test container
Date: Mon, 24 Apr 2023 22:56:57 +0200
Message-Id: <a2f2c836e7f444d733f8ce4c1c23fc6be1dc7726.1682369736.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is necessary to start HVM guests in subsequent tests.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/tests-artifacts/alpine/3.12.dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/tests-artifacts/alpine/3.12.dockerfile b/automation/tests-artifacts/alpine/3.12.dockerfile
index b3909996b47b..073f16a0d70a 100644
--- a/automation/tests-artifacts/alpine/3.12.dockerfile
+++ b/automation/tests-artifacts/alpine/3.12.dockerfile
@@ -13,6 +13,7 @@ RUN \
   \
   # xen runtime deps
   apk add musl && \
+  apk add libgcc && \
   apk add openrc && \
   apk add busybox && \
   apk add sudo && \
-- 
git-series 0.9.1

