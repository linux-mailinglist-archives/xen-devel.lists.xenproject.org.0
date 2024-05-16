Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C418C781D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723356.1128130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7be2-0005wA-DT; Thu, 16 May 2024 13:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723356.1128130; Thu, 16 May 2024 13:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7be2-0005u0-AR; Thu, 16 May 2024 13:59:42 +0000
Received: by outflank-mailman (input) for mailman id 723356;
 Thu, 16 May 2024 13:59:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s7be0-0005tl-CV
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:59:40 +0000
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com
 [103.168.172.151]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87df4c9d-138c-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 15:59:37 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id 46DEB1380191;
 Thu, 16 May 2024 09:59:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 16 May 2024 09:59:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 09:59:35 -0400 (EDT)
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
X-Inumbo-ID: 87df4c9d-138c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1715867976; x=1715954376; bh=dUbs2+uz0vOo0vFkty7Eibm00fKFXkvo
	gmBd4lo7OJc=; b=Y7MzFKiRBBoELttX+rtt5aF+4Vyf2+WvK2bF1bUl0ak1eCm6
	4uGi0V5I5XyBGe3U2xdaPQ18XL1HSkiCXvqD+yY/mSq2I9XGXxwaOiJzn9/FAZfX
	WhOocCnR5OJ4zdpG3DRJjSeV/ARKzQhZSp2DuWE0+moMh+0MMk2qR15Wpnem7Pw7
	pk59BqedT3/9dqfHvuYOdT/5HqSiV53ZIyf7YAvH/L83GBSjTsG5NYHOWAg7abve
	cdg0Dd/xPy2njRRbbDgKDHexrenAfwM7FXiomNx0Rsp/f6ZCQkFeapeNjc3SNZkD
	ij1k2ow4HPXo0jSSnPlaudgVQhbwISCMbH66Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1715867976; x=1715954376; bh=dUbs2+uz0vOo0
	vFkty7Eibm00fKFXkvogmBd4lo7OJc=; b=K28l3qbsnX/EdSH0aACq7vyxiR9N1
	xDYmJJl079yRag3/DEh01qUB6RnNN5itZ6oTvTO/0N23u7ol2UqqxR8CC0qCm4fD
	vLwBS0MyPaKoQUWijKNkQazJTb54Vw/tCw4tyUsV2GgOkaBJWhOvyvmNLOU1nNLm
	bMTVjD57qLKcDmXqSA1fj5tIs2k5DodOgPD6DD0af0G2nRGatwaJbmjHvLLHkQa6
	2PduqV7nivmk54X+cn7ietcmQ5hF2AuYXoRzIG//OyNEHWH49FlCv8rUtwpd7vAG
	Thrr9IkTUfqbww+ePNM1GePQVVhoVlPjOns4pjmEGYPdvTqrTerp5k9+w==
X-ME-Sender: <xms:SBFGZqlDYr84dAzUhFO9cyX4rosxk-mJOpwoexU9jv0bMKXbsPJHZA>
    <xme:SBFGZh3BYvsbwxEOELmxEBzkhKESeRryZXe4vb4d4Z3DoznZuBX8iPU_KLmBgTQt9
    VcoKSxoimboyw>
X-ME-Received: <xmr:SBFGZoqfqObvfOOatbTqLGR5A59Fws88HJiXyYKK7ts_ZNfvbuDUGoXsFkcFl4DTFirqGNLklwm5PjAzp0e8kYeyMSj6wpPhOmo3FY2ezyi1RyRr-kQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepleekhfduleetleelleetteevfeefteffkeetteejheel
    gfegkeelgeehhfdthedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:SBFGZulVPbmBrRMvnuumobHk4wK5T_1SI8cFZRl_0ofWGaGenW9b8Q>
    <xmx:SBFGZo2uXHfSyRXcuT_0ATIyaNOP3B1Bco-H2SPdGZFY4uEfPo1Q4Q>
    <xmx:SBFGZlucK8hN986FCakJAQ0UTrJN4o-iN46nmxTI0A3zAuz5cbHHIA>
    <xmx:SBFGZkXmjOnXK6Zem32oYFNTowLInLaF8eXU-yD4xjjs6Fjn-hPmRg>
    <xmx:SBFGZl_VRzYgYr_hTVVPoZKOLX8FAJnoT1PtrGK1V7zJgovMUQBmHeFW>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 00/12] automation: Add build and test for Linux stubdomain
Date: Thu, 16 May 2024 15:58:21 +0200
Message-ID: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Initial patches can be applied independently but all are needed before the
"automation: Add linux stubdom build and smoke test" patch.
And later "libxl: Allow stubdomain to control interupts of PCI device" and
"automation: update kernel for x86 tests" is needed before PCI passthrough
test (but both can be committed earlier as they don't depend on others).

See the "automation: Add linux stubdom build and smoke test" patch description
for more details.

Note the Alpine version bump requires rebuilding containers, but so does the
actual test patch (extra dependencies), so it probably makes sense to do it at
the same time.

Marek Marczykowski-Górecki (12):
  automation: include domU kernel messages in the console output log
  automation: update fedora build to F39
  automation: switch to alpine:3.19
  automation: increase verbosity of starting a domain
  automation: prevent grub unpacking initramfs
  RFC: automation: Add linux stubdom build and smoke test
  libxl: Allow stubdomain to control interupts of PCI device
  automation: update kernel for x86 tests
  WIP: automation: temporarily add 'testlab' tag to stubdomain build
  automation: stubdom test with PCI passthrough
  automation: stubdom test with boot from CDROM
  [DO NOT MERGE] switch to my containers fork

 automation/build/alpine/3.18-arm64v8.dockerfile           |  49 +--
 automation/build/alpine/3.18.dockerfile                   |  51 +--
 automation/build/alpine/3.19-arm64v8.dockerfile           |  52 ++-
 automation/build/alpine/3.19.dockerfile                   |  60 +++-
 automation/build/fedora/29.dockerfile                     |  46 +--
 automation/build/fedora/39.dockerfile                     |  46 ++-
 automation/gitlab-ci/build.yaml                           |  85 ++--
 automation/gitlab-ci/test.yaml                            |  87 ++--
 automation/scripts/build                                  |  12 +-
 automation/scripts/containerize                           |   4 +-
 automation/scripts/qemu-alpine-x86_64.sh                  |   2 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh               |   2 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh               |   2 +-
 automation/scripts/qubes-x86-64.sh                        | 153 ++++++-
 automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile |  65 +---
 automation/tests-artifacts/alpine/3.18.dockerfile         |  66 +---
 automation/tests-artifacts/alpine/3.19-arm64v8.dockerfile |  65 +++-
 automation/tests-artifacts/alpine/3.19.dockerfile         |  72 +++-
 automation/tests-artifacts/kernel/6.1.19.dockerfile       |  40 +--
 automation/tests-artifacts/kernel/6.1.90.dockerfile       |  40 ++-
 tools/libs/light/libxl_pci.c                              |   8 +-
 21 files changed, 614 insertions(+), 393 deletions(-)
 delete mode 100644 automation/build/alpine/3.18-arm64v8.dockerfile
 delete mode 100644 automation/build/alpine/3.18.dockerfile
 create mode 100644 automation/build/alpine/3.19-arm64v8.dockerfile
 create mode 100644 automation/build/alpine/3.19.dockerfile
 delete mode 100644 automation/build/fedora/29.dockerfile
 create mode 100644 automation/build/fedora/39.dockerfile
 delete mode 100644 automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
 delete mode 100644 automation/tests-artifacts/alpine/3.18.dockerfile
 create mode 100644 automation/tests-artifacts/alpine/3.19-arm64v8.dockerfile
 create mode 100644 automation/tests-artifacts/alpine/3.19.dockerfile
 delete mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile
 create mode 100644 automation/tests-artifacts/kernel/6.1.90.dockerfile

base-commit: 319a5125ca2649e6eb95670b4d721260025c187d
-- 
git-series 0.9.1

