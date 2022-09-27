Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1D65EB847
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 05:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412195.655410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od0tK-0002ZU-4Y; Tue, 27 Sep 2022 03:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412195.655410; Tue, 27 Sep 2022 03:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od0tK-0002Wo-13; Tue, 27 Sep 2022 03:04:14 +0000
Received: by outflank-mailman (input) for mailman id 412195;
 Tue, 27 Sep 2022 03:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZci=Z6=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1od0tI-0002Wh-PX
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 03:04:13 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d942d05-3e11-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 05:04:10 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C5FE15C0184;
 Mon, 26 Sep 2022 23:04:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 26 Sep 2022 23:04:07 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 23:04:06 -0400 (EDT)
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
X-Inumbo-ID: 0d942d05-3e11-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1664247847; x=1664334247; bh=4JBZUH33o80SQ6EzWzmNbNdJlNaQRG2DHCp
	2h8NCN1E=; b=HoK+K0rYsM7JujYZvrdkZrM8PLlqf/Bhpkd3FdsEo5YSs9cS4tm
	C8l44Co2N+5jRwpI+0G0aGwoLNJS7cy60wYwYPLV0ed4QRme58r3U4j+fBi5Sjr+
	cbJ0tb+vAvIImeXfNbGxfNcvX6mW03EqWaiG0O8s+dtVslvp5kAQ/ggRAWIN0r3v
	r7uWfC6u/5Ld5X+tB8cENXsZywm4dFiBAXT0LDjst5JPMOzvS1wm1r173Vc6jKZl
	vvS/AWow5TWN4avYplR8aF5Cs37Ps52zQim9iwRna/hPkm6suyO8/xwBSrFqmLkx
	bNyF9Pc1rpPbZhoDyz1FI0GdKycoaKNcMeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1664247847; x=1664334247; bh=4JBZUH33o80SQ
	6EzWzmNbNdJlNaQRG2DHCp2h8NCN1E=; b=EKZCLZq3LOSIJEFlSNUPqRVHbe3bH
	No6N1JFJdc59Vn7h2QjB9crumLLB5ilXDmveBrJFUC5OsZvZnyvgIV1W1m7S2MOH
	xY8gssMIqqa4LLsutLAgXF6AbcmxdJFFMLs+M46jyzrYSYCveI0C+GwGNIbCKvuT
	M/hewWTG2dfcGZKuB4lcXhjWSiRNjNub/z+eXyc43e16+wfXANSQnKFvB+f7QIdu
	mTJO8knuljnW9wR5YpTVKZ7ENGPM3ccbG5SHzeNX6DmtON0NegawSss+3L5MrD0F
	cGrl9/hoDVI7gdC/B4YZeiBjLMmAvPP4WyPturr6s2ni0hVsjZwwM6iWQ==
X-ME-Sender: <xms:J2gyY3bjz3lIhsEWVUw8KWAcxs0IoEXJ73mmR5PzSAhOViMJPNAYOw>
    <xme:J2gyY2b5nfB5tVnPFzDWqxGsf9tbliKcygYlUnAMzKHgBnEbith3h5UCQa1f9tY2l
    Fm0Bq504-BMuts>
X-ME-Received: <xmr:J2gyY58svbZ2whR9nqKcFBfJQTSKOjsb5SYKb_p4cr0JdvmNCGvdZpZHzW6vO4EnNsOFBOkeNlmq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhgefgieeitdeijeeguddtkefgteeg
    heehgeetkeevhfefgfduhedtveelgeeugeenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:J2gyY9pFGg4BLEKsTNaKAf8fjA9ZUsUW6vqg35IbQD8uxvAjI6_1OQ>
    <xmx:J2gyYypeLUkC5oSPoCok3wIUZN4P5IPTL1XKQK_YwT-Idjgtc7H8rw>
    <xmx:J2gyYzRwiabthcm4SF3rpu8gnu2-z9rCNjNpqBhJQ-P0FGxm1HCBWQ>
    <xmx:J2gyY51GMgvaShWG_87D-nphRIUlavbMdq_tGsZVBagxvZIaEU9Y7Q>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/5] Suspend and resume stubdomains
Date: Mon, 26 Sep 2022 23:03:56 -0400
Message-Id: <cover.1664236600.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, libxl neither pauses nor suspends a stubdomain when
suspending the domain it serves.  Qubes OS has an out-of-tree patch that
just pauses the stubdomain, but that is also insufficient: sys-net (an
HVM with an attached PCI device) does not properly resume from suspend
on some systems, and the stubdomain considers the TSC clocksource to be
unstable after resume.

The first two patches add utility functions that will be used later.
The third patch is the one that actually suspends the stubdomain.  The
fourth patch makes suspending slow-to-respond domains more robust, and
the fifth patch adds extra logging.

Demi Marie Obenour (5):
  libxl: Add a utility function for domain resume
  libxl: Add utility function to check guest status
  libxl: Properly suspend stubdomains
  libxl: Fix race condition in domain suspension
  libxl: Add additional domain suspend/resume logs

 tools/libxl/libxl_dom_suspend.c | 276 +++++++++++++++++++++++++-------
 tools/libxl/libxl_domain.c      |   1 +
 tools/libxl/libxl_internal.h    |   1 +
 3 files changed, 218 insertions(+), 60 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

