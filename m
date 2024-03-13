Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0873387AA49
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692556.1079812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLk-0005h3-7W; Wed, 13 Mar 2024 15:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692556.1079812; Wed, 13 Mar 2024 15:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLk-0005eB-4B; Wed, 13 Mar 2024 15:17:00 +0000
Received: by outflank-mailman (input) for mailman id 692556;
 Wed, 13 Mar 2024 15:16:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIWB=KT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rkQLi-0005e0-Il
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:16:58 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9e527e8-e14c-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 16:16:55 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 3DC1913800C0;
 Wed, 13 Mar 2024 11:16:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 13 Mar 2024 11:16:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Mar 2024 11:16:53 -0400 (EDT)
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
X-Inumbo-ID: b9e527e8-e14c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1710343014; x=1710429414; bh=BP+7EIoBKRdbq+Ev2RuxCdiIUEfgqf3z
	DO6wWX+cFDI=; b=XR9qauVYjkcJjulKk/faRpU+7/FsDePS+Azs5bd/JLvVh9B8
	nJp+YlLZKlHKFapwNaCg1JEFAho3MUtdHuq6yn+CwFLJxj2U4JpacN4HPZMk2VdS
	rGipEIBs0rgRMgPbHYwy7CAKTMSIxbZbkOtaVP4+g++dwNweJynz3WddofqUk1Iz
	6hrT/LEfp5rxARIJuCV/WT6A3v6jTunELwXqTfQ6exDioCpzlSIRGP7JzT5dFsbc
	Dp6MGujVHJRFlRGlKo1HXjH1zzr2ek114lxfCGMdEEvmM/wYIAZ6yb7WBDZiy78u
	O79xiB21BryhfnUTqt16b1s0rPMIZqt9WrnTnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1710343014; x=1710429414; bh=BP+7EIoBKRdbq
	+Ev2RuxCdiIUEfgqf3zDO6wWX+cFDI=; b=VOAG0iU2RMlD23E2FFIXTr48lIM1m
	CyMtyW7hambarOoZYUzNAwrgV9YDR04PnoxyOisTNmhdzxTn+hqMpCcpdJT6dkx+
	jnIMh7KZraff3CSmXu9aSH2TNTMZHv0es4QA3Q3WUSGr64dB+0ieBxcPTaqbm1IH
	9VAsQ2bh/fNfDy16ljyP6+z9qWlefXqSXZtb3z3m42yM0pWi4s7qtGvcDShhtLB8
	YucqAkqgVeT024ll7pgKWGA2fwJDT6W6veWtkwk3jqrJ+sVLl7ZLIpRtDJlfoE+b
	kh6lSNS+z8u9rW6Cqh9m/OVPvyoWyS14XHtR3Qg4qKyOmf45bnKTjL68Q==
X-ME-Sender: <xms:ZcPxZSDvQ9eyVIcIZN9HP77a9uN6m9dp07nBNRsVFFBiXmAPzZochw>
    <xme:ZcPxZcisOSq1t-1z1dHx1g9uMPE4QN96ea9t8TwhLc1PpniAIz_b611Li-yRlneFC
    SC9WAhE1iXZrA>
X-ME-Received: <xmr:ZcPxZVmZintRrV1rH5cigWE8kRRvTsrkhRi9mmFvQTSzSzxrfHlZtZ6GnYrLWp_r4sR3UELLw4I9Terg5fhG3pUDqJdr4XWXR8z3sI9d20WiBv9-xHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertd
    ertdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
    ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
    enucggtffrrghtthgvrhhnpefhfedvkedtiedvgfeiveetffevfefgtdehveettdevjedu
    ffevteehhfevgefhheenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhgihhtlhgrsg
    drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ZcPxZQytuPAcNo0XaQnVJ-5lCplfD01vVtzm7VL6QAR5WJ1l_L4mrw>
    <xmx:ZsPxZXQ6bpXImDQQqK7yAMOdEFh8rOh4Rh1-csbdnZC_naysr9Jilw>
    <xmx:ZsPxZba3SaTq7LLyK21YLOW3S_R1sqZOBkBU6qSQStwYaShDICSiAw>
    <xmx:ZsPxZQRO1tADcTILgIrNWzneI5K7Ju7j9UVB1JSG5jJsfMeoIODa9g>
    <xmx:ZsPxZSeiEvVQXp5-cdiivLJXM1lFUw0PUtRVG7RmCe-9HNPhFitJwg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v5 0/7] MSI-X support with qemu in stubdomain, and other related changes
Date: Wed, 13 Mar 2024 16:16:05 +0100
Message-ID: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series includes changes to make MSI-X working with Linux stubdomain and
especially Intel Wifi 6 AX210 card. This takes care of remaining reasons for
QEMU to access /dev/mem, but also the Intel Wifi card violating spec by putting
some registers on the same page as the MSI-X table.
Besides the stubdomain case (of which I care more), this is also necessary for
PCI-passthrough to work with lockdown enabled in dom0 (when QEMU runs in dom0).

See individual patches for details.

This series include also tests for MSI-X using new approach (by preventing QEMU
access to /dev/mem). But for it to work, it needs QEMU change that
makes use of the changes introduced here. It can be seen at
https://github.com/marmarek/qemu/commits/msix

Here is the pipeline that used the QEMU fork above:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1211237368

Marek Marczykowski-Górecki (7):
  x86/msi: passthrough all MSI-X vector ctrl writes to device model
  x86/msi: Extend per-domain/device warning mechanism
  x86/hvm: Allow access to registers on the same page as MSI-X table
  automation: prevent QEMU access to /dev/mem in PCI passthrough tests
  automation: switch to a wifi card on ADL system
  [DO NOT APPLY] switch to qemu fork
  [DO NOT APPLY] switch to alternative artifact repo

 Config.mk                                           |   4 +-
 automation/gitlab-ci/build.yaml                     |   4 +-
 automation/gitlab-ci/test.yaml                      |   4 +-
 automation/scripts/qubes-x86-64.sh                  |   9 +-
 automation/tests-artifacts/alpine/3.18.dockerfile   |   7 +-
 automation/tests-artifacts/kernel/6.1.19.dockerfile |   2 +-
 xen/arch/x86/hvm/vmsi.c                             | 224 ++++++++++++-
 xen/arch/x86/include/asm/msi.h                      |  15 +-
 xen/arch/x86/msi.c                                  |  50 ++-
 xen/common/kernel.c                                 |   1 +-
 xen/include/public/features.h                       |   8 +-
 11 files changed, 308 insertions(+), 20 deletions(-)

base-commit: 03cf7ca23e0e876075954c558485b267b7d02406
-- 
git-series 0.9.1

