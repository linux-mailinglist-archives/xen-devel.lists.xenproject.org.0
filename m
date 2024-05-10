Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A578C1D3E
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 05:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719463.1122219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HLx-000713-Nv; Fri, 10 May 2024 03:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719463.1122219; Fri, 10 May 2024 03:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HLx-0006yV-Je; Fri, 10 May 2024 03:55:25 +0000
Received: by outflank-mailman (input) for mailman id 719463;
 Fri, 10 May 2024 03:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XugN=MN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s5HLw-0006yN-Fi
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 03:55:24 +0000
Received: from wfout3-smtp.messagingengine.com
 (wfout3-smtp.messagingengine.com [64.147.123.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1df50f2c-0e81-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 05:55:21 +0200 (CEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfout.west.internal (Postfix) with ESMTP id 764D11C001B1;
 Thu,  9 May 2024 23:55:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 09 May 2024 23:55:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 23:55:16 -0400 (EDT)
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
X-Inumbo-ID: 1df50f2c-0e81-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1715313317; x=1715399717; bh=2cGOtahSU32QEdVU8CxuJ6IEc/Czt0JO
	m9V0st6+axo=; b=D9FuxEDAlhmohLcKzMJg7jWMEMbid7zMrH2ZNRq39eIJAW3z
	CtHYWWSpEostCUJ9Rz3yNFiVk6YwyzIbwlJeuAvuD4h+OS8waupPAGR6tnl4EKPi
	1fVLh63ZUipGl3usvTTtwcxLoyzWEctnQBaG3E5yFVoUvzAG2mkCNzOqyQhQ+HvR
	2ahpl/fKhQiaKxCL3QqIX7aFWCTK7koAo74yCHLCGM8azXU1vMiXiPYJf32e1M38
	tRzqGiJ2G1+h3deXMWBwesjRWnhjDRNY8N9bGNyAxPQJyLWlL4z5mV+4zpcjyKil
	I4eUVgn+M4kbtM17GLoJL9aRcKCHseIaN/MQ3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1715313317; x=1715399717; bh=2cGOtahSU32QE
	dVU8CxuJ6IEc/Czt0JOm9V0st6+axo=; b=GL7pym3bXc8rA90S8NfKkCOwDhtpD
	wVfeB0RrlaQLHJcmhL2X8en64eU1PQLnKwxWINmrnDfS6Vd2EVv+8RNVp9P9kbCN
	U4drKYoRz6T9BpEwDvHPT+JbdaRfND/0XUdTqHL3q/OSyQ/zC1ugTjMvLun6wvHO
	6BBv0rW8hV7zfmB9WdOEfq1j7guV3Z+3Ve1dQ/TZEINNtyzUUL2umOv5r+l6c/nK
	MOQdTLUSW6S4lX6GMpNRgQtepwAgVhrzkrMFdGwyIYVPoyhh4J6OLOU5uPg1k+I8
	Ske7SlYlalP+ZYb1s3pyv6DiOlNUKdQhVnR9xqIomc0j0M2BBiZjm6r1Q==
X-ME-Sender: <xms:pJo9ZsKpjxu8xXhFIjLUQMoBZ7Mru37kt9XOZxJgdiTKk6LZhNHBFA>
    <xme:pJo9ZsKvfdFYmGuOsOajiP_tWJkJ885kCmnhOswx4SUhKf6tYt64qarEOOYp6mLkA
    MERHh4Vo0i4Hg>
X-ME-Received: <xmr:pJo9Zst5pFhrNGPY8XYsaNW8f4Ic1vGq27Jk9k5w3deZKHr1aU-UD8_rIL6pD-PyYl7_9WzPpXL-s4mNCijnu-1AEyf79YoiUPeXYrTsU7BFBtVI9KM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefhedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhephfefvdektdeivdfgieevteffveefgfdtheevtedtveej
    udffveethefhveeghfehnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhithhlrg
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:pJo9Zpapexknt5IIg6lc4SpypoHk4mRDaZAcg9muSqh-is0Pm4pyZQ>
    <xmx:pJo9Zja9j5oh6rlhdehuwPvIl5amje2YEOUx0gHi14AI9zrOenrVSQ>
    <xmx:pJo9ZlCw4LWeNADGbQp4tpHhS9Bd0I9MX7-fjBevBdbiDU4R45q-WQ>
    <xmx:pJo9ZpaDcKtTlQMeaG41Ebrxxb0jEeigj-2H5EUTA7QLAUQkCOlCqg>
    <xmx:pZo9ZqwRSt_EycSF_2rvHulam6qVfNxKsa11ko3MN7R-t7YSjNpkq2at>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v8 0/6] MSI-X support with qemu in stubdomain, and other related changes
Date: Fri, 10 May 2024 05:53:20 +0200
Message-ID: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
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
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1285354093
(the build failures are due to issues with fetching or building newer QEMU
 discussed on Matrix)

v7:
 - "x86/msi: passthrough all MSI-X vector ctrl writes to device model" is already applied

Marek Marczykowski-Górecki (6):
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
 xen/arch/x86/hvm/vmsi.c                             | 208 ++++++++++++-
 xen/arch/x86/include/asm/msi.h                      |  22 +-
 xen/arch/x86/msi.c                                  |  47 ++-
 9 files changed, 288 insertions(+), 19 deletions(-)

base-commit: ebab808eb1bb8f24c7d0dd41b956e48cb1824b81
-- 
git-series 0.9.1

