Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8455EA353B5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 02:28:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888256.1297648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tikVQ-0005Q5-Pp; Fri, 14 Feb 2025 01:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888256.1297648; Fri, 14 Feb 2025 01:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tikVQ-0005O0-N8; Fri, 14 Feb 2025 01:28:36 +0000
Received: by outflank-mailman (input) for mailman id 888256;
 Fri, 14 Feb 2025 01:28:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkdH=VF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tikVP-0005Nm-Lv
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 01:28:35 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0035c39b-ea73-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 02:28:32 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 45FB11140207;
 Thu, 13 Feb 2025 20:28:31 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 13 Feb 2025 20:28:31 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Feb 2025 20:28:30 -0500 (EST)
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
X-Inumbo-ID: 0035c39b-ea73-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1739496511; x=1739582911; bh=NeHin5JG6Si9esGXudiDoBFJ3y2RoVdG
	BkdNyJRtT18=; b=Le9qvFYqu8+VF0uDlHnIW+yUbwxjeEtykHUdM+gcXp2fPzv+
	ZWZTGm6gMQC92+FsKteOdW9MyqiRpMeXIdPDPAiLV+RQ37cO3PKZETQdfV/bNDqP
	8Hp8LWdG6ju9JqGyv6QynA/MqW1b8xr6ZPRBLZE3QCSiaqeYJks+cnABodFGo3Wx
	hVD7YfqLSWYDLsz2O/andDwVzEfvLRpzG1Ja7b5hDaOCnXo45fZSVW09Esqfim1m
	RP2gan9BqhnZX1xjSmsoF2D3ouYlYjhECFI6qhWWDOU+T2fEcLAXZet3MkULRHHf
	xPAr7D/jiezC7c1HvwfPiCg0wbO2e8ttRIDBPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1739496511; x=1739582911; bh=NeHin5JG6Si9esGXudiDoBFJ3y2R
	oVdGBkdNyJRtT18=; b=Cw3/n7Em2EKQ47YG5ySjAlx4MxglZI429sqg/JYU1ij1
	ZQYG/OQ6ygZtLd2xQDSU/CXzbQ+wTFNWSd9Rbs0UB/ETgPr2fJOS6TDv375wKg9v
	MiG+iKGJp5amC9asZGAGK6jt4D8a8vM+hJC2p5//RcUNVn0Gxzblt8G1G8WO7ypd
	zt7hvXmHHtouBnAqRmCXfWTCXjvgoYAAIeEg3c69xXcEh/nZFJtKvFrCvdjkCe2j
	YhNmlgsWtKCy8IlgVpUya+vV64s2h+iLnELFBNCgg7fHnVNppBMucieFhIe0wwwP
	UnR0E7Rxq5wkN+nT4bfxRGoJZK4BmMF1t5qD/xDn9w==
X-ME-Sender: <xms:PpyuZ_iEaScILeFoqOv_A4ehYA2jvww6w6I38BCoSGtZJ4s7XUGk4w>
    <xme:PpyuZ8CJ-oG-GzlbOc-nimS_PNGOrqnMnE3MZTe_l69LEVet-ijb-evE5m2ANg0XC
    td4AmS3yGZf6g>
X-ME-Received: <xmr:PpyuZ_F-z-Mp1ZGwlTQonmvzpyU3zquJNpps2MTIglitWYrHAiRO12PVKFR1gg6yJRGjySPY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegkeeffecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:PpyuZ8T-dLSnhHJCq0yhBEoo3lU6cIrWyw2v6W5i8DKigtpPxhP4pw>
    <xmx:PpyuZ8xVqAMxeCdjF5VU8FPEhGwcVw5TcRuaMDq6eCDQ3-XXVxruUg>
    <xmx:PpyuZy5suEyj8_DPXJSum3gXKW3Dvfaz2L--tM0mEFig2UVRd4Ayew>
    <xmx:PpyuZxz1vGz3OrSJzKYlbP1RgaKAXfcXDZv7_ulNPMmpTJ5ycCNrqw>
    <xmx:P5yuZ3_QQ93o5umvMgxbHaOOMl6Ra-2hzfAuVXs2d1eAF3qXl_9dc5LD>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/4] Few CI improvements
Date: Fri, 14 Feb 2025 02:28:06 +0100
Message-ID: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Add some more test jobs
- Allow selecting individual jobs, without editing yaml files

I don't think it needs to be included in 4.20, but may be considered later for
backporting.

Marek Marczykowski-Górecki (4):
  automation: skip building domU if there is no test defined for it
  automation: add jobs running tests from tools/tests/*
  automation: allow selecting individual jobs via CI variables
  automation: add tools/tests jobs on the AMD Zen3+ runner too

 automation/gitlab-ci/build.yaml    |  6 ++-
 automation/gitlab-ci/test.yaml     | 60 ++++++++++++++++++++++++-
 automation/scripts/build           |  1 +-
 automation/scripts/qubes-x86-64.sh | 78 +++++++++++++++++++++++--------
 automation/scripts/run-tools-tests | 47 +++++++++++++++++++-
 5 files changed, 173 insertions(+), 19 deletions(-)
 create mode 100755 automation/scripts/run-tools-tests

base-commit: 819c3cb186a86ef3e04fb5af4d9f9f6de032c3ee
-- 
git-series 0.9.1

