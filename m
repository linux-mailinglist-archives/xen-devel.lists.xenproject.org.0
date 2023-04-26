Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 506396EEB50
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 02:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526381.818093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSps-0000G9-KH; Wed, 26 Apr 2023 00:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526381.818093; Wed, 26 Apr 2023 00:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSps-0000BG-BM; Wed, 26 Apr 2023 00:16:40 +0000
Received: by outflank-mailman (input) for mailman id 526381;
 Wed, 26 Apr 2023 00:16:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1prSpq-0008T0-BH
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 00:16:38 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 989da007-e3c7-11ed-b223-6b7b168915f2;
 Wed, 26 Apr 2023 02:16:35 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 04A1A3200495;
 Tue, 25 Apr 2023 20:16:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 25 Apr 2023 20:16:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 20:16:28 -0400 (EDT)
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
X-Inumbo-ID: 989da007-e3c7-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1682468189; x=1682554589; bh=eI2Vz4ddo+VsiROfqiq/OB+ci
	7pcGaFB1Xo3BY3CtDk=; b=BOgas+Cy3pojbvOPx0/8fEjmjATyPxeinbAiAVXk1
	3KA7QqfKsQE6CpJW6QtAdmzhPaCOVrF5Fmcvh8LKlonbBUQWVF01EsnUB10HWxXW
	gnNXYjJswHHTEbThzlhmsyLRopoKXfeM/rQUDlTIvD5ylz1xZyz8N2KyjnagdOHW
	4wfp1rVOoF7PrbyPN2cxQARdXJ3lJS4PMB4MMXVKPClKbjsPnyog79yoGDyOh8SS
	7iIkT15xN1hkv7XuCbLddfQCA+2F44/ZOB7GEYE6ryg8014syimMx0QmgR8GNNG7
	DuwBdR+X+RDXgrjz9+ieAh3yJVbb+nLLGj7500PTSSTDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1682468189; x=1682554589; bh=e
	I2Vz4ddo+VsiROfqiq/OB+ci7pcGaFB1Xo3BY3CtDk=; b=ZcLrYhdTTlcR1ASje
	cvIb3MfQuxknXmrqRSGZ/DOEcM2mRQpLIMST1Kz4V+Pfl1tomhd3vApZcnTdhpW0
	i5IB+J8S3eRTzB8jC15t6tHazVmPqs4Xl1zJnDg8tzYKc71HrAD/uBK7oczor8e2
	DKPP0wiBh0h2xneDquWyx/HlfcZ4CECxXBl3R5bhO8gWQUQOQfyQJGeXv+W5y2EJ
	kJokogfc+u5rGX/tYaJn2hYBsovf2BjnBCt0cly7sa9ecSbkjwx5g3UrNcwqg/I6
	DQEsYd9GxrNHTu2GJEBjrIwH99UZG3z1CzEjzJz0EnB+XGfa+d94Uy42BLQ7EGx9
	KDIZA==
X-ME-Sender: <xms:XW1IZNrX-eTUaSl_GvWNHoA3-89p7CBdg4bMwV5A2KjC5Zz2iyVGeg>
    <xme:XW1IZPrfPEekCkYKmzKjNB9kM4n68ZfFFJF5xbF-iL5KCOGxcYPX1FhxFPOxVyRLc
    HvvEaLaM-1igA>
X-ME-Received: <xmr:XW1IZKNR_kMKodQm4uQ0iTZJ_yYQjLr2RCp-12i-6ycG4Lh5OusxqRWOGvve9z16YB9C8c6_z1hndnjHStcz40l9jy6ojkY-j8x8h-SQUzTJk45LLc5Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedufedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejueef
    hfelieekgeeftdfgieeugefhudetjeethfefveehffejhfeigefgjeekleenucffohhmrg
    hinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:XW1IZI6gyFH0-qEZqwga-gsv3DrtEP91NtAvrXuqctuTY-S-6VP-EQ>
    <xmx:XW1IZM6013XtmzgFryUtVnYMBtS7800R7HQyHlruizX4Jpwydy6TQQ>
    <xmx:XW1IZAisF8ytDZnyV3fqOvw1qp8T4K-KAXH-qF8We2pRbsrnQXvAjg>
    <xmx:XW1IZBjgWOr2BVmT2RpRkcVIi_6rlbENlPd-9R9A55ylCYctotMQzg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/6] automation: add PCI passthrough tests on x86
Date: Wed, 26 Apr 2023 02:16:10 +0200
Message-Id: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds passthrough tests using the ADL x86 hw gitlab runner. Some of
the patches are improves existing hw tests too.

Example passing run:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/848907124

Marek Marczykowski-Górecki (6):
  automation: specify explicit dom0 mem size for ADL tests
  automation: add runtime qemu dependencies to test container
  automation: re-enable building SeaBIOS in Alpine container
  automation: wait for the login prompt as test end marker
  automation: PCI passthrough tests on ADL hw
  automation: include tail of serial log in the gitlab outout

 automation/gitlab-ci/test.yaml                    | 20 +++-
 automation/scripts/build                          |  2 +-
 automation/scripts/qubes-x86-64.sh                | 93 +++++++++++++---
 automation/tests-artifacts/alpine/3.12.dockerfile |  1 +-
 4 files changed, 100 insertions(+), 16 deletions(-)

base-commit: ffc3ca75e25024c05bce7afea694a7446e513c03
-- 
git-series 0.9.1

