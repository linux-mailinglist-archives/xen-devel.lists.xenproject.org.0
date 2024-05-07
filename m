Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580E78BE277
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 14:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718063.1120565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBj-00039i-JT; Tue, 07 May 2024 12:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718063.1120565; Tue, 07 May 2024 12:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBj-00037o-GW; Tue, 07 May 2024 12:44:55 +0000
Received: by outflank-mailman (input) for mailman id 718063;
 Tue, 07 May 2024 12:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3sU=MK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s4KBi-00037i-NK
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 12:44:54 +0000
Received: from wfout4-smtp.messagingengine.com
 (wfout4-smtp.messagingengine.com [64.147.123.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97ab5713-0c6f-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 14:44:51 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.west.internal (Postfix) with ESMTP id 66FDE1C001A6;
 Tue,  7 May 2024 08:44:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 07 May 2024 08:44:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 08:44:47 -0400 (EDT)
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
X-Inumbo-ID: 97ab5713-0c6f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1715085888; x=1715172288; bh=T1P1ggud7vkTcl80BAOrqh+6kawfaaIO
	q43P1qzsTfU=; b=2f4ZS0MsrQxnuY00dLw6PYBxpW5faxoTLHQLT73G8LoUFzQk
	7bRJvcTzUvVmwNEG1nUGTcMKNES2f56uY5GRdUNbnTkAl6HnXNTfg7foYtKHsnDE
	/bOn+0NeAAtLtMSXgHMQnhLkKindDKNkcm31coDmK2qv1cbksP1gryGjLOmkcQRr
	V2r4eZmXYh6nmZcZUspDrBq2IwUJqVKW36+FHZUdtdAp/PvWsUy3D/xLSPAACM1j
	Uyz0sF/Kzw5gay8dZAtN9FPDbNDHHWUba7NYJHNM/Mc5U7o3+0BjgWVQ6RcwcAVZ
	eskULlJlRwgz6CGFeliAVU5991ngYKYdHk7QvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1715085888; x=1715172288; bh=T1P1ggud7vkTc
	l80BAOrqh+6kawfaaIOq43P1qzsTfU=; b=X7DbEQ7AhaPrQilG7heFSMlWRK7A/
	LfvIYjPCrZYFCymSnkg2QIXEBUEuIUM2YxiM6mHGRxkfF75EovV0CwjLLTEn8rMd
	ZeuaOY4lGFRcH7jpc2EbOVgZ9RIchdoDfCJbGv5ppe69wje3ohM+ZmiqYNZFmCGn
	wPJdmS772DbV/yXE7R3lJQ3QVCohJqfWTFRDDVpojW5b111K5q1l8fmKTYFMlCda
	B3Y52wgyjY9HayqqcVZrp0glmgKn6j/Arrur0g4iZS7hls6EVZw2ZX+bP2zAldOt
	kKHRobYYLBV4etZN+rMYl9W53CWR8lwI5tcDBpfCGYHSouU01diUO15vg==
X-ME-Sender: <xms:PyI6Zo_Dwj50ez3u4dfK-Y8sje6Z921FAiZDKt9VB6WaXVgiWrFtqQ>
    <xme:PyI6ZgvaaUbXbmtw18AtRZm6CDRBSx-KBVw049kyBt13Hs1N2K5gOmU57ZbteRFj6
    9WnJ9V1vEeiUg>
X-ME-Received: <xmr:PyI6ZuAQfJhNlxRPtjmsTLOHCBtFnPETH6L7L-qs5uxW1MJDVDsk7KuhfVNQy_knPuY3iy7A3bAY8Jod3I65G_bkNduUYa-UrnfEJk9w9n4Atdj3ANQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhephfefvdektdeivdfgieevteffveefgfdtheevtedtveej
    udffveethefhveeghfehnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhithhlrg
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:PyI6ZofbX3fl2qpacOGA4XNZUQHVlFFk3V0THkIHmDySOvn8_QaqRA>
    <xmx:PyI6ZtOGw6EiS2uCF599xHFUY9-5CbppPo1eM_iMMuJ0Okx-kdsZFQ>
    <xmx:PyI6ZimWzFAk0pIsDGIammq3WptxF6k_tP7SFrpxa0Az0476mO4rSQ>
    <xmx:PyI6ZvtWbqSzMvNXWCyAEIUqRNYTxRkH7yGX_2Jk2uo_fcjojApIBw>
    <xmx:QCI6Zr0wjptRiUkcYXDjFcBMISn09tNBtwvsk4pX49peYUKNcW84wV-D>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v7 0/6] MSI-X support with qemu in stubdomain, and other related changes
Date: Tue,  7 May 2024 14:44:00 +0200
Message-ID: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
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
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1280152273
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
 xen/arch/x86/hvm/vmsi.c                             | 205 ++++++++++++-
 xen/arch/x86/include/asm/msi.h                      |  22 +-
 xen/arch/x86/msi.c                                  |  47 ++-
 9 files changed, 285 insertions(+), 19 deletions(-)

base-commit: ebab808eb1bb8f24c7d0dd41b956e48cb1824b81
-- 
git-series 0.9.1

