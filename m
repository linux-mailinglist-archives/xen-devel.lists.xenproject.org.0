Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A958C1D3D
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 05:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719469.1122279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HM8-00009O-Gq; Fri, 10 May 2024 03:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719469.1122279; Fri, 10 May 2024 03:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HM8-000066-Ai; Fri, 10 May 2024 03:55:36 +0000
Received: by outflank-mailman (input) for mailman id 719469;
 Fri, 10 May 2024 03:55:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XugN=MN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s5HM6-0006yN-P0
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 03:55:34 +0000
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25dbe0f9-0e81-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 05:55:33 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.west.internal (Postfix) with ESMTP id 6A5C0180012B;
 Thu,  9 May 2024 23:55:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 09 May 2024 23:55:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 23:55:29 -0400 (EDT)
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
X-Inumbo-ID: 25dbe0f9-0e81-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1715313331; x=1715399731; bh=1Lf7PaioW5WU8mR8fRuXT
	r4i1fep7cAUzdBzJdvpuFY=; b=Dx8+i/kOF4Zs6YKMhB+Fe5ATpeKljbzgQLUAR
	Kf/qKXT+bTYYXGysc1XX1i2WCOrDi4j6S24cO+bSNj6cRyXEmBWg/lI2B36u+jC0
	xBaBX56vUA2sHqDIN42f5itz8HjMsWEIpceBAG8sK0o2PmW6+J4ByDIfsgHNM78j
	YFzExFm+U+CEzn9JpjwnLN46TCyV9ZBaeN8wOvv0vb5gIljMEoqyr5x3rJ6kStxo
	0M6EppiuwLM/HGxq+NilZ4QNmjBf238F4YEvtnDQFvnwO97d1Qi8s3dfnZMqAGRl
	mHwdiAkRHThgQXwSrovUCARbuzvlaIJmPrAteazZ4IKFY7sOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715313331; x=
	1715399731; bh=1Lf7PaioW5WU8mR8fRuXTr4i1fep7cAUzdBzJdvpuFY=; b=Z
	y5HDmtp1u2xJD7C4roZ3NTJK60dDW1l9yU8n29DZikmQ4SdFOT6LeU2RVKgzpo7J
	f+zWQ4z8ke85+XBLJiezFaZDzpYfLnvhyAEQ8VgwBBneu9BRrZYK4meVUhTpCGAG
	aSmy886aCbSwWVypKTc+Jthc0sdOc796ZRoDy6tSQ9O0rCs9klWUl/stQGKiPgnq
	xS5bff2TRK5M9mPQRV3pSd0CSwGjStXOSSgso6CZVopCs0VSMhGVSS8nwh8nyvuA
	1+w55fYgKJWLK1yoVw8ArIfCnCJsz5108EtHCNf2dKm/6SXIDJPAwxPacmFhfg+a
	6/KchQm0bTIr07YkQ/iCA==
X-ME-Sender: <xms:spo9ZuWlXC8MNBDSKFXYM8hNQACVH3hsIMuwPAzKpOfV7N7iMt23NA>
    <xme:spo9Zql8kDRgWS0qbGFN3GCYkp8hrWgPDugYXlg-IfUVjrMvtF2C8d_SI8qvA2x9i
    D2NzbIATzQyVA>
X-ME-Received: <xmr:spo9ZiZCsaJUSVtWy517Df6IiGgQnSjPXgafyzMf2HZf89vE9XAMHEQyJFQPWu3WLMgSRrFpkh5LIaTJrRSShoZeLuchk7fU863ha-gZuh0Gy9XUSXI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefhedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueet
    hefgieehheeftdeuleduhffgieelueejhffggfeiieevtefhfeffffeftdehnecuffhomh
    grihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:spo9ZlW60ro5wM7ILDLAm-FCu2xapcTtOQMdOOUPJk8U2WnJS4OzFQ>
    <xmx:spo9Zol4wZdSn6jvMOcpabkvEU6d_KNoLuavnympKNqCgPYdU04Zew>
    <xmx:spo9ZqcE3tyN5W17j6yStnnq2fF_-18h_Y8tJb5XjF4s6JTkgnUEDA>
    <xmx:spo9ZqGWRxErf3PuOy5xtQco5J5r2_x7w9li09TmkdmNSru1fyxVaQ>
    <xmx:s5o9Zii4TagOLC6NF8afDL_JGFaX0WElSnqpnMWMmQXUJJndm-mIG_ZY>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 6/6] [DO NOT APPLY] switch to alternative artifact repo
Date: Fri, 10 May 2024 05:53:26 +0200
Message-ID: <1fdd3d09ab9ec27825d88e65f42f0d5b9b3cd109.1715313192.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
References: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For testing, switch to my containers registry that includes containers
rebuilt with changes in this series.
---
 automation/gitlab-ci/build.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 49d6265ad5b4..0d7e311417d8 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -320,7 +320,7 @@ qemu-system-ppc64-8.1.0-ppc64-export:
 
 alpine-3.18-rootfs-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/tests-artifacts/alpine:3.18
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
   artifacts:
@@ -331,7 +331,7 @@ alpine-3.18-rootfs-export:
 
 kernel-6.1.19-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/tests-artifacts/kernel:6.1.19
   script:
     - mkdir binaries && cp /bzImage binaries/bzImage
   artifacts:
-- 
git-series 0.9.1

