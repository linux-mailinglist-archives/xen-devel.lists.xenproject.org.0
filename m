Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C557A6611F4
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jan 2023 23:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473023.733479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEHLX-0007bS-Pm; Sat, 07 Jan 2023 22:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473023.733479; Sat, 07 Jan 2023 22:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEHLX-0007aA-MH; Sat, 07 Jan 2023 22:07:23 +0000
Received: by outflank-mailman (input) for mailman id 473023;
 Sat, 07 Jan 2023 22:07:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TYdO=5E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pEHLW-0007Zv-0J
 for xen-devel@lists.xenproject.org; Sat, 07 Jan 2023 22:07:22 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5fe16f2-8ed7-11ed-91b6-6bf2151ebd3b;
 Sat, 07 Jan 2023 23:07:19 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E36BA5C0077;
 Sat,  7 Jan 2023 17:07:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 07 Jan 2023 17:07:16 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jan 2023 17:07:15 -0500 (EST)
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
X-Inumbo-ID: a5fe16f2-8ed7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1673129236; x=1673215636; bh=GH9GoCF1lU7nE5K7/oncm4hQo/KJyvZaDda
	S9Bw1XBM=; b=v3ZYRJ7NH0g+bqOKNv61dDmt2+zjrneH1S9D0lyiuM5qBYChvdd
	XhZA+zL+nQEXqgPz9erA46quFg9EmAJEE53x+fyQKsTfTh3VGTJULUYkL99uPbt0
	1AS4qL83aiwJl5EKKd+d16SbAErUSbYaVaaZPteR7f3Fs9yz/DyZLFL987W4MltA
	3di+nkG/a5uJiXIO+N8yggqSrGdXdT06M8+dy+7TMqn0iKIFHVjX1ienmeF74j11
	6VwU/dewHncE6Y2wm3q0HwiD0APtF2+2CbScvMgaRdfPBwTGUnEenJFdRAyyBhv5
	OhviKA3CugVtIw+YvK3Y62MHQ29U560+4LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1673129236; x=1673215636; bh=GH9GoCF1lU7nE
	5K7/oncm4hQo/KJyvZaDdaS9Bw1XBM=; b=SXlteS+xEfpxleQtjTy4hLha6qRsX
	WD/l1H6nPIO/BaW663rTK38D+K4zromLewm6ywtOAdIYFMcEUPutpxNDFapSTL5E
	yf6Uiq7YAZwBGE9+RLe6S5VS/WmXRBksb7mKyCIN6Zt1K9RFnU/OBc1PVkro2yQs
	anxbChvqOfhhOFRPkaWZbqhZIom4cDqU7f3lRIZLvqWHcaKdWZgBx3lUmjtSttud
	vmLf1v0NxXz3ihvL5K22lL7VfD7uOguJRQ6ozmtlszS2srlhw6wqSuQ+K0YWtMmm
	gCsVoS32ByTcmFXeZLgZNWPqSlKNM/2RNFcXCBmab4d9j9SdxSQ7bA2/Q==
X-ME-Sender: <xms:FO25Y66Zbdn4iYuYAuWz-TRA7WqAGGkOnayMYRCsD2l2viohQNWJ_A>
    <xme:FO25Yz7fGuS0C_qTdXWxwZMOqsQQ01svxTyTaFUZY-0bnlXN25sg_hB-eEhTL6mc6
    n15irlBH0MCohI>
X-ME-Received: <xmr:FO25Y5cZi8ysXcnWVOQn-oZyKmG0Z-PDroHb-86OGvpLmOuDojvsZ7sUwZy6Fao82i9qDLOdIxob>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkedvgdduheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhgefgieeitdeijeeguddtkefgteeg
    heehgeetkeevhfefgfduhedtveelgeeugeenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:FO25Y3L7Tt7Hc8wTp4nU6gttT8pDQiALdRg0dbemdWrJhrXPqp1HJQ>
    <xmx:FO25Y-I_5YLH7RUGPqi5b9usyjG5w-4pD_flWkX9C5KTTmjzrcS1vQ>
    <xmx:FO25Y4zbPxQliD-O5ifnCRASSZK0L0WpXxBPonvmuZsKwPSpl65MAQ>
    <xmx:FO25Y9-Vn3UtjaXwDjCFPEqcVKyHuKtxRaMhfMA39LbVm9SZpsa8og>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v7 0/4] Make PAT handling less brittle
Date: Sat,  7 Jan 2023 17:07:02 -0500
Message-Id: <cover.1673123823.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While working on Qubes OS Marek found out that there were some PAT hacks
in the Linux i195 driver.  I decided to make Xen use Linux’s PAT to see
if it solved the graphics glitches that were observed; it did.  This
required a substantial amount of preliminary work that is useful even
without using Linux’s PAT.  Furthermore, it turned out that the graphics
glitches were due to a hardware bug, which means that Xen's PAT is
fundamentally incompatible with the use of current-generation Intel
integrated GPUs assigned to a PV guest (including dom0).

Patches 1 through 3 are the preliminary work.  Patch 3 does break ABI by
rejecting the unused PAT entries, but this will only impact buggy PV
guests and can be disabled with a Xen command-line option.  Patch 4
provides a new Kconfig option (CONFIG_LINUX_PAT) to use Linux's PAT
instead of Xen's default.

Only patches 3 and 4 actually change Xen’s observable behavior.  Patch 1
is strictly cleanup.  Patch 2 makes changing the PAT much less
error-prone, as problems with the PAT or with the associated _PAGE_*
constants will be detected at compile time.

Demi Marie Obenour (4):
  x86: Remove MEMORY_NUM_TYPES and NO_HARDCODE_MEM_TYPE
  x86/mm: Reject invalid cacheability in PV guests by default
  x86/mm: make code robust to future PAT changes
  x86: Allow using Linux's PAT

 docs/misc/xen-command-line.pandoc    |  11 ++
 xen/arch/x86/Kconfig                 |  33 ++++++
 xen/arch/x86/hvm/mtrr.c              |  18 ++--
 xen/arch/x86/include/asm/mtrr.h      |   2 -
 xen/arch/x86/include/asm/page.h      |  14 +++
 xen/arch/x86/include/asm/processor.h |  15 +++
 xen/arch/x86/include/asm/pv/domain.h |   7 ++
 xen/arch/x86/mm.c                    | 151 ++++++++++++++++++++++++++-
 xen/arch/x86/mm/shadow/multi.c       |   2 +-
 xen/arch/x86/pv/domain.c             |  18 +++-
 10 files changed, 255 insertions(+), 16 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


