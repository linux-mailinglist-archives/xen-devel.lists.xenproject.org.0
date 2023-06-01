Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5D271F50A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 23:49:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542746.846982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4q9t-0003t7-3A; Thu, 01 Jun 2023 21:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542746.846982; Thu, 01 Jun 2023 21:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4q9t-0003ql-0M; Thu, 01 Jun 2023 21:48:37 +0000
Received: by outflank-mailman (input) for mailman id 542746;
 Thu, 01 Jun 2023 21:48:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3NUk=BV=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q4q9r-0003qa-Oe
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 21:48:36 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c6fac26-00c6-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 23:48:33 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6CF635C019F;
 Thu,  1 Jun 2023 17:48:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 01 Jun 2023 17:48:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Jun 2023 17:48:29 -0400 (EDT)
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
X-Inumbo-ID: 0c6fac26-00c6-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1685656110; x=1685742510; bh=bdCjoPxZZnywq2ne1+ZsCnnZgLbVMiaq/28
	6mmmutp8=; b=I0u/vVfS+aQQ+0NyvrXyNE7UrhtCpWYEUyH1yA0k/YaGnrGS1c4
	01wX2m+YKT/91fE3cXoj2QWpReEjBxmHwt5e3iLj/NGc6cCtFq3rH3pg3YkB0uBn
	1yOG7XVTHtywUBGOD7jcMvEfhcFn2XycCQ94zyBmXtvcbFAzjgCaYRINelnUIKry
	x8FM/Mb5Vusn8uNuo2jGxB4PXKixN2Phe7XX7Dv4WDgWxC+YSuPAB+1930fxc+CA
	UnVyPVrdlCOILz/V7KB8Wzxh36K1FArblj5uzC/CuaywBwsWuysCIdg9W5lHIY1f
	qbLdhltA9X6KZBNUAxp1PAFLsnHenkY2v2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685656110; x=1685742510; bh=bdCjoPxZZnywq
	2ne1+ZsCnnZgLbVMiaq/286mmmutp8=; b=nvwzhuTV4f1CsVyy62FIihquWO3e0
	KQQQjF3F4jxnPqzwepUo1AHzpLTusGT/UKSoj1LyX8P+/aO37Bpx8rJ3a9unNBQS
	QUKindqIqfnlk9gYOA77MYLpc3RjggpZv4FagjqKDzSvKaeDYUEdlZkeBqsdVrqX
	DwC3qhTc9+H0bwmwqMGne4mvbFzgcNidqo9TaXfjw4Pi/kmoAY2bpPR8jC7Czfkf
	yTDFOqv+QX/WkQCGZlCdt6cglPlOVqYaiOz9lQifAoj1p0ynbx8JlumKVndpucH7
	IeBZR7GsMxR+Wzk8YHyGTFaZzdNlCLOp6W4ntfVY3O7kqGTEmbrdgcZXA==
X-ME-Sender: <xms:LhJ5ZFZZClwFk0Ne2HPNiOtA0frPkOyXxnrLHbhGlK_SWZ_O_tZMkA>
    <xme:LhJ5ZMZp6bPz1ISVb3Sj3Y4HgmBFMo5MY4XRDXfCYvLGl16zrXzijQPG2-JfvTqvr
    9DWOzd698LyGrw>
X-ME-Received: <xmr:LhJ5ZH9FUn3zN2bK9M25oxNIB7K4UnUEBtyV_oUFsNEKtphcWDFips6MBg0kPM5BvZ9VT550Hvc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeelvddgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepvdefgeekvdekgfffgeekhfeijedtffek
    hefhleehfeejueetgfelgefgtdevieelnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:LhJ5ZDodb76AlZos5MY2H6cYjcTBELvi5XZh6GIf2CSYgC0ahui4YA>
    <xmx:LhJ5ZApSTWMU-6y87qwpel-P4at-CbmpDB-A1o_xP2hr1WeHicgINw>
    <xmx:LhJ5ZJSGv40_8oLElEsspFZidDrrHaOQWytQY-jnaLcPvDa7uRStfg>
    <xmx:LhJ5ZJnsAKkvM9L7uhAIKJheg_SzhhDmSXyBucJc9EeV6BZNlsdcfA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] xen/blkback: support delete-on-close block devices
Date: Thu,  1 Jun 2023 17:48:21 -0400
Message-Id: <20230601214823.1701-1-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two patches allow userspace to provide an expected diskseq of a
block device and discover when blkback has opened the device.  Together,
these features allow using blkback with delete-on-close block devices,
such as loop devices with autoclear set.

Demi Marie Obenour (2):
  xen-blkback: Implement diskseq checks
  xen-blkback: Inform userspace that device has been opened

 drivers/block/xen-blkback/xenbus.c | 147 ++++++++++++++++++++++++-----
 1 file changed, 124 insertions(+), 23 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


