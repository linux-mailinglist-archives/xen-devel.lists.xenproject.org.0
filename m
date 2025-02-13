Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A45BA334AA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 02:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886995.1296570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiO1I-0002gW-6E; Thu, 13 Feb 2025 01:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886995.1296570; Thu, 13 Feb 2025 01:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiO1I-0002f4-3S; Thu, 13 Feb 2025 01:28:00 +0000
Received: by outflank-mailman (input) for mailman id 886995;
 Thu, 13 Feb 2025 01:27:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZTDb=VE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tiO1G-0002en-MM
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 01:27:58 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfb456da-e9a9-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 02:27:55 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 2F7411140149;
 Wed, 12 Feb 2025 20:27:54 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Wed, 12 Feb 2025 20:27:54 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Feb 2025 20:27:53 -0500 (EST)
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
X-Inumbo-ID: bfb456da-e9a9-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1739410074; x=1739496474; bh=gVYarZS/Yh3zmSotdl7/1+0CpZQ3iQrg
	kI4mB4LGJiU=; b=AlTs/dwB+ZGCPYjgp5HHKe9JpwexPTlyi54y+nf2mHDTwwFF
	B8wj8JzE1EFXkSzVqCsPjr1nbwtmGrc+Ve0urbkhDdR5ViP6NUjIbC0GYPVs7JaL
	MOyyjcVVWP6+SsxyQ3s5C8XWQsJBed3wwEojRoCNLwliQdJwZ+NYRq2lRV/ZApMI
	nbzAWtvg+jBS/MMbX/eAHKefjnIkcZ840fXSJ4ZyeGjwa2kVhCoVQocEUxgpHrRu
	p9mxUgAOwXS94iBn2wUtAp4aBFPIkPStrj9/+N6gX2BjVrkloUbCU6bZwRMxs6Mf
	z3IWYr6VSg1GyEb1kituKHsq8bN3EFSzdanowg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1739410074; x=1739496474; bh=gVYarZS/Yh3zmSotdl7/1+0CpZQ3
	iQrgkI4mB4LGJiU=; b=o3L56Qo/A3/yYWz/CLxokbEHtmnZKXCs/sZkPNqE3Hpm
	GtZkpgdHaek4aX5rG559KPaGKwQP6B4KhBaI3rWZpWxarvIUYAr0VrlTZTx0IN3m
	JBSoVzsjlc5EZb7+/0oZr2EEm5atTcQhtHxCvrMJSIxRxCIeaQQ8k0uOvS+gpU8H
	7/Kd+eapKkmX7Lozhh+GxOh8gqs9kYCCnRAkHSO3VXUjRYI8YQivY9aFco8iHI1q
	brnVgjWL8j9pYX0YOQw6SKWw5b5cJbkd/VCaNIJtjicpP07+p1tYFqryManjTX7n
	a3Q4zdkmD5s5/SkUPSDBr2JwVSyW/86vymlqUPOBiw==
X-ME-Sender: <xms:mUqtZ-c5mMbS3gsjLOYqDDalwRJ9TVVLbMUC-VRxf6M1jMWab6Z3mA>
    <xme:mUqtZ4NNwE27SNOf4XDfKvYTjnaUfdvFirzYU5QzW28Egmv6Ksvx0gBeZlIX_Rz3y
    w9YSbAoD4qbkQ>
X-ME-Received: <xmr:mUqtZ_gKqeb6hp6Cu9vnLGrTH68iOZ_Y_LejfMzSk_wLjB2q_uSAoYlPnu038z9V10cUCgyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegheeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghrtgiihihk
    ohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefhudelteelleelteet
    veeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghl
    vghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhj
    vggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:mUqtZ7_nV4fLQk5E11dXTsbh3b9TzNp9r7gvgAzoFMME_rMRMjzGbg>
    <xmx:mUqtZ6sK-xyN7toOj1EC0Yj6-yvlp-2-0Zk9WMdSKY4pdBZX7ol4Yg>
    <xmx:mUqtZyHJA4MaYLrjJAkXwZvbovHT4Yw14fLS9A-zYRv_DkpAYZD5rw>
    <xmx:mUqtZ5PaWarayrTm0nEeiKVmgOhtlNd7sa9OXgrFJgGTpXVq784lVw>
    <xmx:mkqtZz6ifiTcVXto_mInnji3wR1ljAa9seyoROCxkek6mZ6ZkZd1zwwq>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v1 0/3] Few CI improvements
Date: Thu, 13 Feb 2025 02:23:53 +0100
Message-ID: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Add some more test jobs
- Allow selecting individual jobs, without editing yaml files

I don't think it needs to be included in 4.20, but may be considered later for
backporting.

Marek Marczykowski-Górecki (3):
  automation: skip building domU if there is no test defined for it
  automation: add jobs running tests from tools/tests/*
  automation: allow selecting individual jobs via CI variables

 automation/gitlab-ci/build.yaml    |  6 ++-
 automation/gitlab-ci/test.yaml     | 37 +++++++++++++++-
 automation/scripts/build           |  1 +-
 automation/scripts/qubes-x86-64.sh | 77 ++++++++++++++++++++++---------
 automation/scripts/run-tools-tests | 47 +++++++++++++++++++-
 5 files changed, 148 insertions(+), 20 deletions(-)
 create mode 100755 automation/scripts/run-tools-tests

base-commit: 819c3cb186a86ef3e04fb5af4d9f9f6de032c3ee
-- 
git-series 0.9.1

