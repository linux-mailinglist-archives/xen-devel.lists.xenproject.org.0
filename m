Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC738AE4500
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022379.1398217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThVz-00066G-T7; Mon, 23 Jun 2025 13:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022379.1398217; Mon, 23 Jun 2025 13:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThVz-00061l-Om; Mon, 23 Jun 2025 13:47:15 +0000
Received: by outflank-mailman (input) for mailman id 1022379;
 Mon, 23 Jun 2025 13:47:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThVx-00048y-KW
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:47:13 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89cabbf1-5038-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 15:47:01 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id AF2E91140111;
 Mon, 23 Jun 2025 09:47:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 23 Jun 2025 09:47:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:46:59 -0400 (EDT)
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
X-Inumbo-ID: 89cabbf1-5038-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750686420; x=1750772820; bh=rMfuOb3zWq
	f2Otrwcg1PxJw2zLi1cC9pyVwVASV78Ow=; b=mcCeIaY2mUYZPIrCFKOELknLJe
	I7QFn0tls3/hxV1qEMwzlpXR7qvc2ZrdEPGva7l3w+qEyTQOEphHZC8eV6nMR0En
	4V+U4ObpFutJ+XQhb4pFU+8BjtHMBoJoiPFBPXZIgdaIdMH9KI070Jo1AX4C0XqI
	VK39q9alEooQjLPzK7sakm1qu7XdQ739rusTlvi8GXCH9n4GNOzE3vmjcbg82ZWY
	XP6f2372NRxKys5kLpa2Bo4ifSzwApbXaEhHKzEHlExo31lx3HWfkP7lPTLoy8ac
	621NxYqxzpxz5TiTYwlXTsgQwG8K18jxrN3r1sp8MBdHr5PhdWjMDJLYmVHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750686420; x=
	1750772820; bh=rMfuOb3zWqf2Otrwcg1PxJw2zLi1cC9pyVwVASV78Ow=; b=R
	kFRfIDbdARJAa4kDNHrz+2N/OCVl7emFTDElEBMEttrH96ShUQm1qwTF/Fe1R3zy
	YRwSbwWdSS6s3Q73MwEvL2KAOpDwUzVtVXPjjuzVa5LnwNASy2XPgI/K2VnhTTIb
	HGOxCnAM6AzQdtcEsmdjdb+ZwicujVnU7TDrAq2d/lNh992C6MsVnYqCsNVAw/ff
	GhGYIFC1i4LS/UY9pr3xsHJ16Fw+0RaTEay4HKGaomDC+r7eT/UDQsqJeVA7WAyn
	kBSPGAZ92jcrOy+ENRSbsdtTi/bfFK7WpZZdLeeMNTCsyk1iUYjf4PkKJLglPFKA
	9VK0CNxcoDvCjNmDALlmA==
X-ME-Sender: <xms:1FpZaIarlb3JhkFUQHHTedkgQBcIby1SVkNjytwaj11J8u-dnX_CFA>
    <xme:1FpZaDaIUsz14q92EoP_w6MDrjZptPEbn9DWKIpGaHFRhK6D1YEWfqlaGgEamDg6Q
    ZVDThoHbM9hbA>
X-ME-Received: <xmr:1FpZaC_brIKwNQ_EhGY-NobAnIFVie7sP1s6-2L7xa9YOEB0uDPzM68GP7ySyZcKIXcjMeBWKbF0c3nr1URQbTq7ExDTY4HlnIGBnlVGy8KbWkT_J4bm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudeh
    gfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
    dprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:1FpZaCr5vAaCgqeW_TDmA8Ia7wHjiv2ie-4Xv_pnXijlw5dKN__iHw>
    <xmx:1FpZaDqXTQHT4iMRO8EaJFRkxTKHVigmVv9MTIu5DdXuMrsDCrc8nw>
    <xmx:1FpZaAQcRnrBPi7gDjopM3Iw9NED4M8Ud2LccN6ZfkMrLWUUDJNsFw>
    <xmx:1FpZaDoXU8tYHzW67R8Ri78UokJqB6Ov_FRHKlBauW7LZUOEPKsI6Q>
    <xmx:1FpZaNhD3gOfsgOkxDFyNCJO8A_NvpxH_nDOC7mAINmyHBdQhUBwpQ44>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v1 1/5] Add linux-6.12.34-x86_64
Date: Mon, 23 Jun 2025 15:46:20 +0200
Message-ID: <0a3e893e5fe133dc710d11a31006ba4f2c1b0cbe.1750684376.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
References: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is necessary for new Zen4 runner.
Do not include Argo module in this build, as it isn't compatible with
6.12 yet.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 .gitlab-ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c698612..ad44fb4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -64,6 +64,12 @@ linux-6.6.56-x86_64:
     ARGO_SHA: "cf73819cacc945baca1a7421e5836d1bd481739b"
     ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
 
+linux-6.12.34-x86_64:
+  extends: .x86_64-artifacts
+  script: ./scripts/build-linux.sh
+  variables:
+    LINUX_VERSION: 6.12.34
+
 microcode-x86:
   extends: .x86_64-artifacts
   script: ./scripts/x86-microcode.sh
-- 
git-series 0.9.1

