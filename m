Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD81A6C90E6
	for <lists+xen-devel@lfdr.de>; Sat, 25 Mar 2023 22:13:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514764.797223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgBBa-00082Y-3h; Sat, 25 Mar 2023 21:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514764.797223; Sat, 25 Mar 2023 21:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgBBZ-0007zt-SI; Sat, 25 Mar 2023 21:12:25 +0000
Received: by outflank-mailman (input) for mailman id 514764;
 Sat, 25 Mar 2023 21:12:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SnWc=7R=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pgBBX-0007ws-Ul
 for xen-devel@lists.xenproject.org; Sat, 25 Mar 2023 21:12:23 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b89e300e-cb51-11ed-b464-930f4c7d94ae;
 Sat, 25 Mar 2023 22:12:18 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 87B285C00BB;
 Sat, 25 Mar 2023 17:12:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 25 Mar 2023 17:12:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Mar 2023 17:12:15 -0400 (EDT)
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
X-Inumbo-ID: b89e300e-cb51-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1679778736; x=1679865136; bh=3gUyahM0QdQOHKUlU9SDN4UwQ
	OGwxhq+vQNu8rADVsg=; b=M6fkZgvoblL2BcSjaFch0kQ45LN43n7RB3PsnWntY
	opwq1LSkip9UIuvWfDIldE833rRnWMvbaHYgZ9m5HQLejjQIkxn70yIxAHm+f+sj
	s3RnRCynNyTFCZY1XzlMtfpt5UvUaCvSrmyspstHsUEYieOQ+WMwq390ibXeslz9
	SyBIjVnJ2MdxMcwwPE+L+bZ75B5nHQBLKDuPZ6j1IUCcPzLgJ4RiPre6gANmDghJ
	jTDzlf+CjvXVDF8TYcxqPaSca6121swmNpNx0ci8FC8ld/s33KXBfhfpy555zBrj
	WE2DMq2nOSqFz6BjrJg+9fQjN69Ik2A7lhSG4lH7jM1Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1679778736; x=1679865136; bh=3
	gUyahM0QdQOHKUlU9SDN4UwQOGwxhq+vQNu8rADVsg=; b=Lxgb7Vmv9G7FvTYpj
	SP9RQtsrVNlGltBNx4LttWAuU+CetE/1wDkURnViid3G0UhGE/nlO4xkx92D2Mcs
	7SLL5uh+etKDLX0VfAiTLiPVYlzYFJ3REZSKbY87rL8oK3sWLJB6iUCJNAmOZe6G
	qmGvgQy7SWZ1JffqfyEBF2Vadftqo+vR0rrOww3yPTaKQAYEfrP2xpmT+pWRmQ+c
	qRTyGTpPxX2cYEP0qmHsCZafrNptHyRCOcTozEs7Kumc2dV5834mI/rYRzQKxxLB
	l9JB+GN9yd6uRaUovAVetZrDqV9nIwuA33Od8IdnKt24p6ydKpeVV8S0LudLoleq
	S28WA==
X-ME-Sender: <xms:sGMfZDxwLma6P91q_i1cULEZMlurYHfrc1BPgyuDB4GvHbRZ5jUOcA>
    <xme:sGMfZLTN4QEht-M6z6QguuxFVeREIr6hHp9PxDulAS4fcAU9KT90bUqPG74taOXuO
    kXKiizmPsO6IA>
X-ME-Received: <xmr:sGMfZNWlRF2g1KXvLL8X8WwcK7knzmFVsjDWMuKGLkC78CbgqtSSNljRIBuMY4mH3I5xXSJSfCBjaJX_-pa4z2YvohX_lZJKLbBdNHcm7T_G3mfGZawu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegkedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgeeg
    fefhvdeftdeujeefjeevvdeguefhvdeuvdelvdeihfeuheduheekledvveegnecuffhomh
    grihhnpehgihhtlhgrsgdrtghomhdpqhhusggvshdqohhsrdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:sGMfZNhldz7SpGcN33_VTddyNkrj2Yx1NyLetf3_OWi-n7ZYyWfI3Q>
    <xmx:sGMfZFAxuk2t3d4v0-Q9hxUxQNSGCVSF2boh2EV8YwKptD2NWlHuGQ>
    <xmx:sGMfZGJ7O7fgcq2cYZZOqOprgUoSI9Z-ylvJXcO5wWqqY55kvkQ5ow>
    <xmx:sGMfZIrI7hOOEaePXYWQkNx64MpRqytuhqQ5RsLNhR4D7KdPZhqWzw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/2] automation: add another Gitlab-CI test, x86-64 S3 this time
Date: Sat, 25 Mar 2023 22:11:56 +0100
Message-Id: <cover.21e1254a0c5cb3256afbc6b7bd44e8f347d7c08f.1679778534.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds another Gitlab-CI test running on a real hardware.
The gitlab-runner is connected to gitlab.com/xen-project/xen already.
Example test run (just subset of jobs scheduled):
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/817952905

Details about the setup:
https://www.qubes-os.org/news/2022/05/05/automated-os-testing-on-physical-laptops/

Should there be some documentation (besides the above link) how to interact
with the CI system, for somebody else who could modify the test script? It's
rather tightly integrated with infrastructure that's outside of xen.git
control, so I'm not sure how practical that would be anyway.

Marek Marczykowski-Górecki (2):
  automation: update x86-64 tests to Linux 6.1.19
  automation: add a smoke and suspend test on an Alder Lake system

 automation/build/alpine/3.12-arm64v8.dockerfile      |   3 +-
 automation/gitlab-ci/build.yaml                      |   4 +-
 automation/gitlab-ci/test.yaml                       |  40 ++-
 automation/scripts/qubes-x86-64.sh                   | 174 ++++++++++++-
 automation/tests-artifacts/kernel/5.10.74.dockerfile |  38 +---
 automation/tests-artifacts/kernel/6.1.19.dockerfile  |  40 +++-
 6 files changed, 257 insertions(+), 42 deletions(-)
 create mode 100755 automation/scripts/qubes-x86-64.sh
 delete mode 100644 automation/tests-artifacts/kernel/5.10.74.dockerfile
 create mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile

base-commit: b1f11273d5a774cc88a3685c96c2e7cf6385e3b6
-- 
git-series 0.9.1

