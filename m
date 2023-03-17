Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7886BDFAE
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 04:35:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510877.789403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd0ra-0002VF-4c; Fri, 17 Mar 2023 03:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510877.789403; Fri, 17 Mar 2023 03:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd0rZ-0002SY-TA; Fri, 17 Mar 2023 03:34:41 +0000
Received: by outflank-mailman (input) for mailman id 510877;
 Fri, 17 Mar 2023 03:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ZYU=7J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pd0rX-0002SG-Up
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 03:34:40 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2b8e89c-c474-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 04:34:36 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 1A7F6320070D;
 Thu, 16 Mar 2023 23:34:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 16 Mar 2023 23:34:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Mar 2023 23:34:31 -0400 (EDT)
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
X-Inumbo-ID: a2b8e89c-c474-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1679024072; x=1679110472; bh=D2alt2DJcpcVwyXKAcDwVCzCU
	75wXwa1RNsWGPg98IA=; b=auRbYld/fylymFfxGpPcM/nTX8Ry0Q661/q4iw362
	hmzCvb4JPlAX/VppN82f3Yh4idhebUdnUs7CP8Dl9ezVkT0S6GjZeZUFJLat/KeY
	X7XD/jPfdSWXHifY1hY3OSXkB2viZau106+/PNjC804MTLSkK7dld35zlcSGO8TI
	G22HpSH4iJKD0pa+99LudvI4KBF0g54jjDxCD5x0iJPDs2blA9O6Wl1neZHjY8Gr
	FJR4fATkR0/kFm/ollPZvWzAT556DkDl89hsXBU+6xVrUw1qJgsSeZjo+lJv3E5i
	hnAtkCF1+vNVw4fBhUBb67amU0YT54j5/rsPZ6PQUuzwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1679024072; x=1679110472; bh=D
	2alt2DJcpcVwyXKAcDwVCzCU75wXwa1RNsWGPg98IA=; b=c66ow40eawC4xFA/f
	cW2AbIxRcB9YArd9swrNNzEjuV9wvefPeuJsUxuskQcdyH++zTTiI0WJEAbGiI5+
	ekER/Iz3e+TnEQmzg10BiEM7p++ySmk/AzN9v2YTyCX48JK+xGFLs4dyfR6rF926
	nsBuPKQB/n8Qt80lh1kRlnPCsilMBNQnKPys9mk9EC+f9YMaSxJgLG8xW/ytzSuY
	NQ4v1+zu6Me1NTRhSQSKDC+gFEZ982ZJid652u6HjgA1DABRxdKEA6aJhR6SSaWw
	oV77u81B/dKpkhUm48yrQxat1Dbc8NxSuIeqDbZxaAxjzbWUi6dnhl8VE0EObv06
	pk05g==
X-ME-Sender: <xms:yN8TZOIxitZNdlIU8FRigZMnbkCthgfnDuZCCDwDw-wZmszC1kBjLA>
    <xme:yN8TZGJl9sGrFpja6NVdsx7WjIvrxf5sfDbtRy3E_vdbyDe7HblG2ykUYoULjISBs
    YdbcKL3zjSZww>
X-ME-Received: <xmr:yN8TZOuOt14zE6fJ13Ft1doggQ6frkPBwoWaIw4xNAoM1KBufL5Du1ra1nfZQBZ2srLnS3fCckBOsty-ENTiLzqwyuDK7xzbbHlJ7iv0cGdjlHzCn_Nn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefuddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepgeegfefhvdeftdeujeefjeevvdeguefhvdeuvdelvdei
    hfeuheduheekledvveegnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpqhhusggvsh
    dqohhsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:yN8TZDZoFg6t026awCEC2N_nZynfOz7BpoNMj6IdBWOCuqf44SGtDQ>
    <xmx:yN8TZFanNkOqyLNziELTAgCNdWJTsbQeAWiuOvbwfjt4iKWFcxEyvg>
    <xmx:yN8TZPAfyxD_EWdY24LHEZZKSw3K9ykfZ1FCd6wla0EFQZOoGhqVVA>
    <xmx:yN8TZH0iqf6iYDq6KI4WsAWurrb_Z7Mz3Kw4jfhWG3wi_av3MxXAvA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/2] automation: add another Gitlab-CI test, x86-64 S3 this time
Date: Fri, 17 Mar 2023 04:34:16 +0100
Message-Id: <cover.5a69c1f96ff446a5872e9dbf6308be9ab278f9df.1679023966.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds another Gitlab-CI test running on a real hardware.
The gitlab-runner I have currently connected to
https://gitlab.com/marmarek/xen. I'll need a registration token to connect it to
the official repo.
Example test run: https://gitlab.com/marmarek/xen/-/jobs/3952014197

Details about the setup:
https://www.qubes-os.org/news/2022/05/05/automated-os-testing-on-physical-laptops/

Marek Marczykowski-Górecki (2):
  automation: build 6.1.19 kernel for x86-64 dom0
  automation: add a suspend test on an Alder Lake system

 automation/gitlab-ci/build.yaml                     |  11 +-
 automation/gitlab-ci/test.yaml                      |  31 +++-
 automation/scripts/qubes-x86-64-suspend.sh          | 155 +++++++++++++-
 automation/tests-artifacts/kernel/6.1.19.dockerfile |  40 +++-
 4 files changed, 237 insertions(+)
 create mode 100755 automation/scripts/qubes-x86-64-suspend.sh
 create mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile

base-commit: be62b1fc2aa7375d553603fca07299da765a89fe
-- 
git-series 0.9.1

