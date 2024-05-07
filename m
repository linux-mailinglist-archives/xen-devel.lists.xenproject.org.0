Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794138BE271
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 14:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718069.1120625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBt-0004if-Cj; Tue, 07 May 2024 12:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718069.1120625; Tue, 07 May 2024 12:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBt-0004h6-84; Tue, 07 May 2024 12:45:05 +0000
Received: by outflank-mailman (input) for mailman id 718069;
 Tue, 07 May 2024 12:45:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3sU=MK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s4KBs-0003AI-11
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 12:45:04 +0000
Received: from wfout4-smtp.messagingengine.com
 (wfout4-smtp.messagingengine.com [64.147.123.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f18bff1-0c6f-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 14:45:03 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.west.internal (Postfix) with ESMTP id 7BE8F1C001C6;
 Tue,  7 May 2024 08:45:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 07 May 2024 08:45:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 08:45:00 -0400 (EDT)
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
X-Inumbo-ID: 9f18bff1-0c6f-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1715085901; x=1715172301; bh=1Lf7PaioW5WU8mR8fRuXT
	r4i1fep7cAUzdBzJdvpuFY=; b=PdL5SGhdFetggvTuU790ekju/zGZL5Ukv44pe
	p4XqV5GinwU0oP3gGyJ9d2Fi2JIqF0mGyfd48FmLuHgaU5TXjh2UaABNN7sadMun
	oUqMilUGV+Ae12t2DLxvKSsnvC9d6ZgCeur0Y8yQn9CvxqWUTsg1fNrLepuujZIC
	TdjFCcXbQYc6MGp2Deq1yX8lbviDKmQgLaPj02sd6dKIG947bIJGC4toiNU3EECZ
	De5zWYxYhVjFyn51LiziErVZQXu1ecB2V6XghLZ8QKEWLFRRGHUy0681P1aRjwbQ
	cOtdbpZePbkrdkfOLl7HKdoAK3I8rwmkNexHa3sEQ14PBd6Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715085901; x=
	1715172301; bh=1Lf7PaioW5WU8mR8fRuXTr4i1fep7cAUzdBzJdvpuFY=; b=R
	PJHGLXM/Nf7y2RXw118EP1uJfcAOAxrL7xGrTYnP1kTOvp+PixQRlED7JNaMNguy
	n3VTrRRnHIS9KyrMo8BnKMcsxtIBBuftXUzssjhLy4ZKBBFoUH5ChisMioGkpuRX
	JVHkw14NM84itBQB8xKghAPlSEgaqaYBVb/SCRJ5EHvXqleQ2mlJkluAn4VdddDL
	pm4sQOnzeiJSiqjN80pGyAo3ZlOsssXEZZR79RW9/HdjnBv1gwnJbSWqFsWwiMg4
	M+6XlRwXuU1EdL4s4NOtugtXV30Wm99MWUWCWgSITA7ViT+7a3LgZbATUJ550P72
	S32RnmcgqQ0k5QYTNnowQ==
X-ME-Sender: <xms:TCI6ZpcQ4edVLw_5-YE5kC-iMaLxXdb8MY8g8dzd3OxFmzB61L50wQ>
    <xme:TCI6ZnPW5XQvj_itJ4I1BXXLff77_Lk5ST0pT-0rtHsJjk9FhN9ihZTqYdhTt4l-e
    N0p8KOYTrJd4w>
X-ME-Received: <xmr:TCI6Zij566cHRS8fmg1O3N5O9FmvTwEzwAg7SxejzZm77babe2JL1EL52U2AA-kXnxu7eQtlRHSgE4BgeEPz8Hzsljv1wG4Ia2VOqhQU4wv5g7dIOBs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueet
    hefgieehheeftdeuleduhffgieelueejhffggfeiieevtefhfeffffeftdehnecuffhomh
    grihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:TCI6Zi9yFicGlLpnoj1iDh1oVPrzcKuLpywwmzNKG7ojnFizlzz1Bw>
    <xmx:TCI6ZlucvBC_6FlopO6tsR6wf2HM4kvyONaDshImhBGeiT-iUnI-Gg>
    <xmx:TCI6ZhHxkiNQKPQ-ic1BcwIusBFyj-ZZk34ULtUFF5W65f7SeXbNHw>
    <xmx:TCI6ZsN7b5bmYPk6LfgDB3ojRGI-0HgjX2gCFDupTdAC2kzopD--Mw>
    <xmx:TSI6ZtIHyCVmZrNIssoSkwCPdSybAy9Pa3KiARzoBMRuoU73rGopsEvV>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 6/6] [DO NOT APPLY] switch to alternative artifact repo
Date: Tue,  7 May 2024 14:44:06 +0200
Message-ID: <5bb5167affa80458ce42be05b8d0057ce211667a.1715085837.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
References: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
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

