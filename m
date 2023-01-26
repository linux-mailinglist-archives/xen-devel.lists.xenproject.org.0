Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C567C3A7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 04:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484687.751405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKt1h-0008Ib-P0; Thu, 26 Jan 2023 03:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484687.751405; Thu, 26 Jan 2023 03:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKt1h-0008Fk-MM; Thu, 26 Jan 2023 03:34:13 +0000
Received: by outflank-mailman (input) for mailman id 484687;
 Thu, 26 Jan 2023 03:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q4q1=5X=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pKt1f-0008Fc-UT
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 03:34:12 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49431b6c-9d2a-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 04:34:07 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D81D35C05B2;
 Wed, 25 Jan 2023 22:34:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 25 Jan 2023 22:34:05 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jan 2023 22:34:04 -0500 (EST)
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
X-Inumbo-ID: 49431b6c-9d2a-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1674704045; x=1674790445; bh=3zrqCCWozEhlE3QduurTIaTnuK8HrtZwnOI
	/8OAKWhk=; b=itbOC/cn4y/B40q8XnHC36ZK342HhUiZQWzWRilS+UaShH1NhZp
	1PIxe43uByehOYWScDldnSB68SutvMRyXl/4yQ7STcrYFsYiZxDIdibVrkfQd59y
	smuG5Op6lc6AP91KJTBaEkXF4J+7yg3MUFiilIMxFP0EiZxs/I016ZoFZFI2tBci
	9w7zB9ntKgF7oe9mhUDMTKz2pnLewxPQUN2Izy4WUrdvWwVGWHskqPXAtNoOiop+
	XDLHC8lPhPgqa6XJ8JtDKVoBXB5MRkNV9+BowGxC0SWn5O9gr1KxGin24Vs8sqN+
	1bBzr/xYHNkhKOCWtfqrdtjly7Jh0E7AK8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1674704045; x=1674790445; bh=3zrqCCWozEhlE
	3QduurTIaTnuK8HrtZwnOI/8OAKWhk=; b=oxKex1i2j/0Mco60GksvTldYC42Dd
	pdUMjSpUSOTpb9z1QAY+WUjYg6ksLLQK2uzbQKUAo1Zg2C+sHtIXBCpAnIbFsAjn
	4+0oxB0u3bOM25qOS+bHQra+pbeecgVar02jsJ9u+jvTbdz4WMSYw49Jb34aMEYM
	eA7qAkSX54AjjyHdGvu4vnqfb//Q+JQdEJJN4zQg7/KwK2oz0+Y7dZaj6f58L7TT
	hs5nF3d73B2HTS3diqakESrrVHJYBme1t58O9mNY2dfhdL+yq37BpqHFilxmkj3P
	N3TdP1ZHcFZtWcQrp9Tc+rIw7+GJR9krLEHVjqwyH+TQS+i2g8sdlFxCQ==
X-ME-Sender: <xms:rfTRY6725xmw3M9_wy6VAcPGHbcrIDAAXALC_ezzqGgu8_uRhoPv0w>
    <xme:rfTRYz54wgPmc9J-m65mihdjNty8KrpH3dOxqxrzqbIl5I_4wleBtSzykLUzL999H
    yEK2Y9VkVevVew>
X-ME-Received: <xmr:rfTRY5c-XeYocmJVDOF_vnw6pNbx_lwfvTcuwuxZ1xAZTtge5V4IEydC9RVAweE53XptqUbyW9xj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhgefgieeitdeijeeguddtkefgteeg
    heehgeetkeevhfefgfduhedtveelgeeugeenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:rfTRY3K8BsaR6SikC5jT7-f3d9e22OHeqXhkgePMrLn0y58UnAVNCw>
    <xmx:rfTRY-JsiC-CmyH3JqmtndM5ovAjIocOp_H5Vnz5xbocvmIcvUB5Vw>
    <xmx:rfTRY4wEKKzvSMjPN6rg_jb98hKZEXW7biJaskmWaZ9ourLFDq6IKQ>
    <xmx:rfTRY9_6RGw9FBSqSFdBrKQEovNBIAL-_eHatj1IbfsXY2Q7MP1mdQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jens Axboe <axboe@kernel.dk>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	dm-devel@redhat.com
Subject: [RFC PATCH 0/7] Allow race-free block device handling
Date: Wed, 25 Jan 2023 22:33:52 -0500
Message-Id: <20230126033358.1880-1-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This work aims to allow userspace to create and destroy block devices
in a race-free and leak-free way, and to allow them to be exposed to
other Xen VMs via blkback without leaks or races.  It’s marked as RFC
for a few reasons:

- The code has been only lightly tested.  It might be unstable or
  insecure.

- The DM_DEV_CREATE ioctl gains a new flag.  Unknown flags were
  previously ignored, so this could theoretically break buggy userspace
  tools.

- I have no idea if I got the block device reference counting and
  locking correct.

Demi Marie Obenour (7):
  block: Support creating a struct file from a block device
  Allow userspace to get an FD to a newly-created DM device
  Implement diskseq checks in blkback
  Increment diskseq when releasing a loop device
  If autoclear is set, delete a no-longer-used loop device
  Minor blkback cleanups
  xen/blkback: Inform userspace that device has been opened

 block/bdev.c                        |  77 +++++++++++--
 block/genhd.c                       |   1 +
 drivers/block/loop.c                |  17 ++-
 drivers/block/xen-blkback/blkback.c |   8 +-
 drivers/block/xen-blkback/xenbus.c  | 171 ++++++++++++++++++++++------
 drivers/md/dm-ioctl.c               |  67 +++++++++--
 include/linux/blkdev.h              |   5 +
 include/uapi/linux/dm-ioctl.h       |  16 ++-
 8 files changed, 298 insertions(+), 64 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

