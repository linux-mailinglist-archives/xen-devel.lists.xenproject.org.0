Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81981716EB2
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541394.844124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460L-0001lc-V6; Tue, 30 May 2023 20:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541394.844124; Tue, 30 May 2023 20:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460L-0001id-R0; Tue, 30 May 2023 20:31:41 +0000
Received: by outflank-mailman (input) for mailman id 541394;
 Tue, 30 May 2023 20:31:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QB4=BT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q460K-0001iX-K7
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:31:40 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8fa3fb6-ff28-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 22:31:37 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E6A0D3200906;
 Tue, 30 May 2023 16:31:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 30 May 2023 16:31:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 16:31:32 -0400 (EDT)
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
X-Inumbo-ID: f8fa3fb6-ff28-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1685478693; x=1685565093; bh=mBn4BtTIuaSR4k6kR5OhxVvo4
	bxwgD7eI3h6KSrS77Y=; b=OV5XCQmm52GKorJgytjmRhmDfFno0a/Pgi7UWpDrL
	hmac3z3F+t+j3QvIAwMR4SXWsjE00Dk8J2pl4/bzWVkMLVwTCqNUhcwwpYQQyRID
	prcGg+R9vE6c37cpOzefITiocc0xsV6Klz2vTQHMOb7Bq4dZxG0KjFsbkZlmP2KN
	4UGnkgg5UwPtIm1WL0u1FQq0kfl3kpp3phUtHwN0psepWye8YFq97zYVHkIfuPNZ
	XwdZ5Q15Y7S6lVoiCRL7QUWcNMt4WbaKMKTLoIV+vAoQTKxR0jmJ6p2DjVSE/Nvp
	eo3yhydz4SncBJZ1C9N20dkMonTC3o23ffZYDb/MYwasA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1685478693; x=1685565093; bh=m
	Bn4BtTIuaSR4k6kR5OhxVvo4bxwgD7eI3h6KSrS77Y=; b=AsrK9fySZ3AZJANui
	7+TxVT0aD6Mmt+OOYUCS1xBbGC40JB4t9Zr57FAhjpU9BbocgsFPZv3WNzEHoyiw
	T9iw4+MxlfR5NR9KNQD77hE9wDHDsXxa0IM+szCQBqgjx9Jzd+6H0dn8mz8XkxbN
	LRLDdd58fW+Zs20WpFjccSO76SGJy2Ryqfg87kJHl9jRUt5dPpNasxKX+RAc4T1L
	bXo0Gg/hA2d6xc6Bcd5Hr+l3xrVftdl7twbjEh52cjWu0wYiR2RsWqfKFx7vZ+4X
	8esMxX3l4CZV0yTt6g7boPGvPu+uu0wNvJUK9FRrodoQFrKkOkYS+Z9UWiOdk64K
	9dIMg==
X-ME-Sender: <xms:JV12ZKw_sleDe0CYhkOy1rfxDsKjpyELd-fxjymHbgcgq5lekwsKZA>
    <xme:JV12ZGTAn57_8e1GFIsXL0ysKh0FpixwJKQ-TddPSbdxYp9ycPOiTVwaNOrltt2ad
    ug8Bk31vxxSZPs>
X-ME-Received: <xmr:JV12ZMUabxwRmIasWNcUfFJi1r8ayOF9Gz99yU6V6s-nhGY0G9ciErqgnlwdmTNxI5uZ2MoKV6c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephfeggfeiiedtieejgedutdekgfet
    geehheegteekvefhfefgudehtdevleegueegnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:JV12ZAjQ2rV9YCzr3z2bw2d41_MyNZJp_kvJGEi-trj6PoDKHYaXqQ>
    <xmx:JV12ZMCHtfgQyZp2PZhX45i91mJDIhD_ys-ao3poTncETHRblZjImQ>
    <xmx:JV12ZBLpJyOl-upuH58Tw1NYpbK7gxAD5Bx9jCgXSTOlNIObWkK6QA>
    <xmx:JV12ZKAryiWCZk5crUODpJpFTwj0sB-WzC-8b4F9y9v0UR85ql4CiA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jens Axboe <axboe@kernel.dk>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 00/16] Diskseq support in loop, device-mapper, and blkback
Date: Tue, 30 May 2023 16:31:00 -0400
Message-Id: <20230530203116.2008-1-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This work aims to allow userspace to create and destroy block devices
in a race-free way, and to allow them to be exposed to other Xen VMs via
blkback without races.

Changes since v1:

- Several device-mapper fixes added.
- The diskseq is now a separate Xenstore node, rather than being part of
  physical-device.
- Potentially backwards-incompatible changes to device-mapper now
  require userspace opt-in.
- The code has been tested: I have a block script written in C that uses
  these changes to successfully boot a Xen VM.
- The core block layer is almost completely untouched.  Instead of
  exposing a block device inode directly to userspace, device-mapper
  ioctls that create a block device now return that device's diskseq.
  Userspace can then use that diskseq to safely open the device.
  Furthermore, ioctls that operate on an existing device-mapper device
  now accept a diskseq parameter, which can be used to prevent races.

There are a few changes that make device-mapper's table validation
stricter.  Two of them are clear-cut fixes for memory safety bugs: one
prevents a misaligned pointer dereference in the kernel, and the other
prevents pointer arithmetic overflow that could cause the kernel to
dereference a userspace pointer, especially on 32-bit systems.  One
fixes a double-fetch bug that happens to be harmless right now, but
would make distribution backports of subsequent patches unsafe.  The
remaining fixes prevent totally nonsensical tables from being accepted.
This includes parameter strings that overlap the subsequent target spec,
and target specs that overlap the 'struct dm_ioctl' or each other.  I
doubt there is any userspace extant that generates such tables.

Finally, one patch forbids device-mapper devices to be named ".", "..",
or "control".  Since device-mapper devices are often accessed via
/dev/mapper/NAME, such names would likely greatly confuse userspace.  I
consider this to be an extension of the existing check that prohibits
device mapper names or UUIDs from containing '/'.

Demi Marie Obenour (16):
  device-mapper: Check that target specs are sufficiently aligned
  device-mapper: Avoid pointer arithmetic overflow
  device-mapper: do not allow targets to overlap 'struct dm_ioctl'
  device-mapper: Better error message for too-short target spec
  device-mapper: Target parameters must not overlap next target spec
  device-mapper: Avoid double-fetch of version
  device-mapper: Allow userspace to opt-in to strict parameter checks
  device-mapper: Allow userspace to provide expected diskseq
  device-mapper: Allow userspace to suppress uevent generation
  device-mapper: Refuse to create device named "control"
  device-mapper: "." and ".." are not valid symlink names
  device-mapper: inform caller about already-existing device
  xen-blkback: Implement diskseq checks
  block, loop: Increment diskseq when releasing a loop device
  xen-blkback: Minor cleanups
  xen-blkback: Inform userspace that device has been opened

 block/genhd.c                       |   1 +
 drivers/block/loop.c                |   6 +
 drivers/block/xen-blkback/blkback.c |   8 +-
 drivers/block/xen-blkback/xenbus.c  | 147 ++++++++--
 drivers/md/dm-core.h                |   2 +
 drivers/md/dm-ioctl.c               | 432 ++++++++++++++++++++++------
 drivers/md/dm.c                     |   5 +-
 include/linux/device-mapper.h       |   2 +-
 include/uapi/linux/dm-ioctl.h       |  67 ++++-
 9 files changed, 551 insertions(+), 119 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


