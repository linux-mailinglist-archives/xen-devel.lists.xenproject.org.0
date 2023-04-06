Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55EC6D8E22
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 05:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518703.805496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkGkz-00008Y-9r; Thu, 06 Apr 2023 03:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518703.805496; Thu, 06 Apr 2023 03:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkGkz-0008WB-6G; Thu, 06 Apr 2023 03:57:53 +0000
Received: by outflank-mailman (input) for mailman id 518703;
 Thu, 06 Apr 2023 03:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHTq=75=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pkGky-0008TM-Dh
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 03:57:52 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31275807-d42f-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 05:57:48 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BF15B5C0165;
 Wed,  5 Apr 2023 23:57:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 05 Apr 2023 23:57:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 23:57:45 -0400 (EDT)
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
X-Inumbo-ID: 31275807-d42f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1680753466; x=1680839866; bh=93qkb4vCoALCa+SR4SX+CpDYG
	2G80pxkOOvzmxxSHTg=; b=iZHL7IEYk5THv6vF8b0ULbkwAYhiBr8RMmecfCf58
	obuHqd+Sv8fLyCmsBK4xfR/FXE3aIYYRc0p3F0/0luH0jQu8VBnbQBYv11oeJ+vF
	O2455X/UV90zurzkYKkXmMACFFj2Sf36JOscKu2rmzGhsg+apZ4OapsQhEnPGp/U
	U5cbAK2vhYZlyf9v8Xe0X/W9bOXKvA5FRurfde+Z+jCQW7Q+JlhFDLuyu1/IUMfF
	k5uftt1nHYrLmvqtnUJZZ9MilASPqcjDISSQzsBefLdzKpfxmnjKHmJsLN7cRySm
	pZ9mTeyuB/1NQqYx1bAAar5xpURXwgTKGl4P4uOLlYUWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1680753466; x=1680839866; bh=9
	3qkb4vCoALCa+SR4SX+CpDYG2G80pxkOOvzmxxSHTg=; b=EIM7B2Tj1w88q1gCt
	oSQAf6kBItLzqwAQNda31yo7c0jKRiYdQI3N/Hgg7xj1oy/pSM6PCwn1gzuk3iu9
	5u+/I/mEn8BBhL0lRpV3DdlP25DuHZPvEZjFDrwOJQ9NStx7OiitRdFXfzCFrYwD
	zr6fkvpSSWpw//bnefAtcw9b4sHsIHoDlXKZa8ohASY47P6r3DQT0fCNcbcx7O1I
	qKSEoC3u2kHbybvAzuy8FcZmP77+Zqe8UiqKGREQQ5/VPpjEddyBgmdQRemhc0be
	NJD/VpK9tbgnqGK379ZbNuMqZXzbqEXa2gYhF4gjbqDcTV03xbAxX0ZwPSqcAbO3
	zy8eg==
X-ME-Sender: <xms:OkMuZI5r-jGnSqXNDZkUdGOhd5Ltcsw1Mfok9jHogJC3Gmo4DQLAxA>
    <xme:OkMuZJ57H9fzlrW9NaIDc2qAHHE-U9U0KnrKapZDKcZP8XUFhEIT0VMKHvO4sj7IX
    UV0Lr4FTIepXQ>
X-ME-Received: <xmr:OkMuZHfuf9KLzFq7_sovdLARcMoFFuOQujNwnTXXjzRj9_Vecfv3uNX816VqN7hLRa2PRAQY0Zbqfc0fpGlWrM53RUqPIgiZN9hDRiQ18qUTD3798-Ea>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejvddgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepleekhfduleetleelleetteevfeefteffkeetteejheel
    gfegkeelgeehhfdthedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:OkMuZNLeTt3T8FfoCJQedgGgb67eZ9Wc2u38jbKYX0epHKLMqcOfeg>
    <xmx:OkMuZMJPodictTm0UuTtG_CdzV5_HnF13EfSNax0y8-tad07EkvK_g>
    <xmx:OkMuZOzdFW7rHf110cNhKGhmrc3CIxS004dfQutTT8XtQE09YNrjRg>
    <xmx:OkMuZDlEcLjRYf9ovlrTOM-OaNx6UskjYYFMQa8e0L2vyKJLXk5ssQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 0/4] MSI-X support with qemu in stubdomain, and other related changes
Date: Thu,  6 Apr 2023 05:57:22 +0200
Message-Id: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series includes changes to make MSI-X working with Linux stubdomain and
especially Intel Wifi 6 AX210 card. This takes care of remaining reasons for
QEMU to access /dev/mem, but also the Intel Wifi card violating spec by putting
some registers on the same page as the MSI-X table.

See individual patches for details.

Marek Marczykowski-Górecki (4):
  x86/msi: passthrough all MSI-X vector ctrl writes to device model
  tools/xendevicemodel: Introduce ..._get_ioreq_server_info_ext
  x86/hvm: Allow writes to registers on the same page as MSI-X table
  x86/msi: clear initial MSI-X state on boot

 tools/include/xendevicemodel.h |  23 ++++-
 tools/libs/devicemodel/core.c  |  16 ++-
 xen/arch/x86/hvm/vmsi.c        | 209 ++++++++++++++++++++++++++++++++--
 xen/arch/x86/include/asm/msi.h |   5 +-
 xen/arch/x86/msi.c             |  38 ++++++-
 xen/common/ioreq.c             |   9 +-
 xen/drivers/passthrough/msi.c  |  17 +++-
 xen/include/public/hvm/dm_op.h |  12 +-
 8 files changed, 310 insertions(+), 19 deletions(-)

base-commit: 881ba20eb0222305a9d2cd090c9345992794f4f5
-- 
git-series 0.9.1

