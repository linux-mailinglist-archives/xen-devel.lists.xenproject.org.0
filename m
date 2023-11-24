Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 746027F6A40
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 02:49:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640071.997871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6LJ4-0001mE-MW; Fri, 24 Nov 2023 01:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640071.997871; Fri, 24 Nov 2023 01:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6LJ4-0001it-IL; Fri, 24 Nov 2023 01:48:34 +0000
Received: by outflank-mailman (input) for mailman id 640071;
 Fri, 24 Nov 2023 01:48:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uC13=HF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1r6LJ2-0001id-5i
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 01:48:32 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e5baa81-8a6b-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 02:48:28 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7D05F3200A48;
 Thu, 23 Nov 2023 20:48:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 23 Nov 2023 20:48:23 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Nov 2023 20:48:22 -0500 (EST)
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
X-Inumbo-ID: 8e5baa81-8a6b-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1700790503; x=1700876903; bh=gCfwTU3qHF50pcQ30y50gaGXz
	4RKs+izfHyddL79gTc=; b=Mik5DmxwyZkayijyO9fZu1PXvmUlU2wqyO6hCt4CR
	0GizXItodq+1VEexerHv+EDgVZLSgED26J1ga8YEVIj4Wwsn8WmVMi1mMH5SqFdh
	35QJbIBW3D11G8ushU2/6UsrJN9oViMxQEJXWzJZftPcTq3v1rn/SN053ZIkzLqe
	IrcGMrlt1wY0ISsbzr8fuf+MQ2y2/+qSwb00iOAC25zoh7fMeoUGWmTEe7Z2J2j6
	bP59T7pYnq0eYOW+7lh2w2NlgkbmxK2xQ4MaoqpeuY85+dsxph0aKgmm4RoTLpwV
	gURUb2hT82x4nvq0gNmQDZMezAXuZmtUfMVmEGqJQQ5Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1700790503; x=1700876903; bh=g
	CfwTU3qHF50pcQ30y50gaGXz4RKs+izfHyddL79gTc=; b=XokhWCub0x2Bmjho7
	uwzDm0ZfiUcSXUmzqdm/9gHdKsqdc33PLlnKNg6pomdQwQaVFH37WDrJPWmWdWRB
	fMcfXC44YNSaHoCWUSgA7sXIZ+Eomh1TiabQWTz3iQhLsNTpIruXr8Vz+8htwVFC
	bOMQfOI5mJia0BsKCMsWvjFZGO/QW/Ia9CcHiOe1CcFFx/gnKkINY0mWoPqEidBd
	QUVuSmkPFQvwVJM1jiAh9trIazq78zxdnR0o0fmnU/3Gftf5qQvFZ7gavEDKE8o9
	oZJWNonuA6RfrtXy5gnJ21jT1oljrtS1CvhjSDK9ONVGH92WYkggpDy6EcgnPCGS
	N6H+A==
X-ME-Sender: <xms:5gBgZfV4Gi8NRY14RTXugJf1Q_BeS9GZX91lyhQD3ky7waIVX7hC5g>
    <xme:5gBgZXm6wxaTsYjh8sxu-WbNAK9EAhMJbCIA0BxGqFdrnhuAgQvnO7vrCL6sXhwSR
    PeWTcCb7B1JjQ>
X-ME-Received: <xmr:5gBgZbZzy1dG6ycGw-KD83xx6huo5PjbbflNJyiwXLnh5p-z0a9t-0ZeuZkEeTTHxeUnrNuxZd-rdFnyzPRsmNYJZC-m7wQMVaN5H0onxl5dR6DHhp5m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehgedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhephfefvdektdeivdfgieevteffveefgfdtheevtedtveej
    udffveethefhveeghfehnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhithhlrg
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:5gBgZaU0QfDUdgYE0d4URAMGPF0x4T5KjdBrM9NnIBBrr602Oi-5zg>
    <xmx:5gBgZZlsb7vhGWxVXJAtkZoTS2p0lNbbOXFSHfRHAWBF5rzqXg7TOg>
    <xmx:5gBgZXdP9TWDEdD_wHuX1q3Du89wH17LIAu7uKK2AfTkFAutmgTm3A>
    <xmx:5wBgZXRjTQoewaHqrj1nA3mPsirhMRpniTpob7eEKDYeUGpshC8l5A>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 0/6] MSI-X support with qemu in stubdomain, and other related changes
Date: Fri, 24 Nov 2023 02:47:04 +0100
Message-ID: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series includes changes to make MSI-X working with Linux stubdomain and
especially Intel Wifi 6 AX210 card. This takes care of remaining reasons for
QEMU to access /dev/mem, but also the Intel Wifi card violating spec by putting
some registers on the same page as the MSI-X table.

See individual patches for details.

This series include also tests for MSI-X using new approach (by preventing QEMU
access to /dev/mem). But for it to work, it needs QEMU change that
makes use of the changes introduced here. It can be seen at
https://github.com/marmarek/qemu/commits/msix

Here is the pipeline that used the QEMU fork above:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1083468508

Marek Marczykowski-Górecki (6):
  x86/msi: passthrough all MSI-X vector ctrl writes to device model
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
 xen/arch/x86/hvm/vmsi.c                             | 206 ++++++++++++-
 xen/arch/x86/include/asm/msi.h                      |   5 +-
 xen/arch/x86/msi.c                                  |  40 +++-
 xen/common/kernel.c                                 |   1 +-
 xen/include/public/features.h                       |   8 +-
 11 files changed, 272 insertions(+), 18 deletions(-)

base-commit: f96e2f64576cdbb147391c7cb399d393385719a9
-- 
git-series 0.9.1

