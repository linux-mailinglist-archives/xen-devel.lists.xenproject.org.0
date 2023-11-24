Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA307F6A41
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 02:49:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640077.997930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6LJE-0003Nl-NV; Fri, 24 Nov 2023 01:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640077.997930; Fri, 24 Nov 2023 01:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6LJE-0003LC-Ip; Fri, 24 Nov 2023 01:48:44 +0000
Received: by outflank-mailman (input) for mailman id 640077;
 Fri, 24 Nov 2023 01:48:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uC13=HF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1r6LJC-0002RQ-OL
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 01:48:42 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 975a60df-8a6b-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 02:48:41 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 487873200A49;
 Thu, 23 Nov 2023 20:48:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 23 Nov 2023 20:48:39 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Nov 2023 20:48:37 -0500 (EST)
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
X-Inumbo-ID: 975a60df-8a6b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1700790518; x=1700876918; bh=YR4SrntrkR
	9h95RVyu4/vR1Bp6CZaXa+a+sAHNBe1pw=; b=5Nuj4LMMKdO58yXKRIAtvoDnPE
	JfHUU6qTzl/I/HUBkzeEJ2PAkVE0i7lhYatqPUbzKwEAQt8w5+ARm4I53gXnKMpB
	fCKNVR3I4F0124bK362/WTB6DKthrf6rYsdBNO8r/zrSFOMUi2bxFmeyG38C1Jcc
	NkID4CN3AtnF6vvIgmP0/QGjQ4wiffkRdZzF2ficl0vz8VXxrNFKr0KjEn7ssSZh
	WwpiXkMfY4squ3HH54OtaDO162pbX7eCYby8/qvH7TH+l6bzCKdV/MLnlMkKr2eg
	OSvstZC1syIgTYAQJ86fr3AD7Llc0Y9Qy0Y2TICOAzTp6u0gHA0zibl1b3iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700790518; x=
	1700876918; bh=YR4SrntrkR9h95RVyu4/vR1Bp6CZaXa+a+sAHNBe1pw=; b=u
	ljuZ0hyCLTwE+0FV7o8cunHauFzgCqgDXtNQuIExT6p1zDOss76+iTyoIFOzU/8i
	zKAQq/jek/4RIZVDziNzf+kwtq2GNX1apxJbxFK3/MtLxZ/gCbrAUkFCG5Mjm/by
	o0Nn3J8aFchSicd4BUq4+/A1TNmX+KLMKUUiLrckTNft8y9khSR9Tcy9mpWGQfYa
	xbqUkeXG0ETp3ErH1nqQy6pbLVpuwwwkbv7I6RgPKZm2AmTSTjAMQ5jlWS1xkvhw
	bqLmp/i2eAeS6m3JtN+cKUIr22rjD3G1r7eXDDHt2oDMZEye/PwoZXsapz0r1/Nd
	R5aPUTodtRw6FI15NaNtQ==
X-ME-Sender: <xms:9gBgZdzsgMGs7nzg5zNxLxg4NVYb9RFAdLvKvfTCBvnLBndT2jjiWQ>
    <xme:9gBgZdSdeKPM6kQjl8kYV86oXw6NLyx0-QGXKovBhKgpdLXiTLLIDl6dObeiR_Ej2
    Nc1dAhUs_1LcA>
X-ME-Received: <xmr:9gBgZXUD-EYzTcDftiNbPpwUqEhUArGWfdA1opp0pj4zL1Iy3GK12OJ0zHL-0napB-JKTPaA6b2TL9viGVwZzbLsY-7W-NiPHWaJ10ZZjOP-fBx5GFV_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehgedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueet
    hefgieehheeftdeuleduhffgieelueejhffggfeiieevtefhfeffffeftdehnecuffhomh
    grihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:9gBgZfgCdPVCXWJvuBGTNw-Nlv6-cy_fvLnFt8NRlKK1bcX8zd84cQ>
    <xmx:9gBgZfDX88XGidbWIXW5lBZHvc-5ZqMQT1ffk0fysLhFsyc2eGc6-Q>
    <xmx:9gBgZYIt-w5DL3RCsyjyUc6VV3QWtLULdqlxUpKuEakNRQWX4pUW0A>
    <xmx:9gBgZU51-0IFCl8fSvzGNZ3SuMsZwgTt3GG4ilbcl7aTvaNh2Yk5zg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 6/6] [DO NOT APPLY] switch to alternative artifact repo
Date: Fri, 24 Nov 2023 02:47:10 +0100
Message-ID: <7e7977bc5630a40f522b45da891689cdf11da29c.1700790421.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
References: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For testing, switch to my containers registry that includes containers
rebuilt with changes in this series.
---
 automation/gitlab-ci/build.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 32af30ccedc9..52abb12bce48 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -324,7 +324,7 @@ qemu-system-ppc64-8.1.0-ppc64-export:
 
 alpine-3.18-rootfs-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/tests-artifacts/alpine:3.18
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
   artifacts:
@@ -335,7 +335,7 @@ alpine-3.18-rootfs-export:
 
 kernel-6.1.19-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/tests-artifacts/kernel:6.1.19
   script:
     - mkdir binaries && cp /bzImage binaries/bzImage
   artifacts:
-- 
git-series 0.9.1

