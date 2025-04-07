Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C8A7DDBC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939836.1339829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgW-0006wu-Ss; Mon, 07 Apr 2025 12:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939836.1339829; Mon, 07 Apr 2025 12:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgW-0006ut-KO; Mon, 07 Apr 2025 12:34:40 +0000
Received: by outflank-mailman (input) for mailman id 939836;
 Mon, 07 Apr 2025 12:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lgV-0006Bg-2a
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:39 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab61bf5f-13ac-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 14:34:38 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id AEE6D114021B;
 Mon,  7 Apr 2025 08:34:37 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Mon, 07 Apr 2025 08:34:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:36 -0400 (EDT)
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
X-Inumbo-ID: ab61bf5f-13ac-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744029277; x=1744115677; bh=OfkNWEVYOp
	WJZ9YipFU35kXAq9pfOLZms5AaVuP4WDg=; b=fXGiw2aF4T5C41zGLwCWJr9qfC
	ZBjZdKzFUWS7hzGtqAKGW3P5z5eyflQQ5/24OSbD0CNIB4Kf79K1LzbbNt8KlfKY
	4UT9X8MnJ76Yiq+ArnSQDTXnPgLuYzRwjwo9wnbzoXd7iDSgTIXs7P5V3IYcjUsO
	XoO4GRDOznkqgwshygjZtmavKNZIPUUZlVCb7T0V9lfa6APuYErC5s9+8BYS9eHZ
	Sc/EMh6LQntyDmmCrNU0HD8UItRaqTXliXIgggb94HbeE8iEuCg7UFazA8wi9Imo
	uxSFeoCw/6d6dXhkl8NR9DwgsUxFXQ6JuBqRSZxG6vORPqCkhRIdGEEchIAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744029277; x=
	1744115677; bh=OfkNWEVYOpWJZ9YipFU35kXAq9pfOLZms5AaVuP4WDg=; b=J
	JOMH3zwX+M2BME00opla99KsXd5gwojM3gp2+nLX2QwyGWlIA1tm2KK6B3DRKgh9
	0nQyFo9GfTXl8ddJ8zXzN3SNC/a3RspeV6tQVSKqmj312zuNRCKPKn4RnXd0rL0X
	q4x7XD+b3W5r2QK1LRwTHayf6ZOdVn3+iDIA/oT64Fnh4cS3nEkQMLj9vDL+YF0m
	q6mFCzfYCg57IyYEnJYF3uzekz38eSRzz05wF7pqQPuwAPQM84g279m/YB66+/8g
	ShiJ7H1yXz8aGrAdTASdr7FYzBSq97gKYU4ehKvcqdofHymAkdyBdedeJa5CC4Kr
	A/Z/Hh77XzdNbArt6+z5A==
X-ME-Sender: <xms:XcbzZze5ZOwV4xYn5cNIo1hWMxcIUQ079pmIN9R02CpP3_26sTWcZQ>
    <xme:XcbzZ5Ni9N3PHf1HA0QI7ZtwcJ-XiI24oDnpC7_VS0PKGfnq2LqkuG0okvloFVv6R
    4MGItRhK64w7w>
X-ME-Received: <xmr:XcbzZ8higmLc-fYnkFGG9ehNjWhWMtXmzAcNUPODuhHlBi1O9hhVSVdVPggWhOV1xXa4mlpEviHS1UQJZSAzayyD5ClgOvwJ7IiNo6zAM1EtZUw_csk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhr
    tghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:XcbzZ08rh9srrpFp_EyeAegqRn8QvwOZw47BUvlTHjSd90rBECFn_A>
    <xmx:XcbzZ_sujpT-zFfqgDPZbYYyyaAACydF4pseTUVeMpErzFuj-5UWVA>
    <xmx:XcbzZzEfCnkY7Q4CohHCXnLiFPcjZ7im8pIFKmXVm24i8vfOvi0sZw>
    <xmx:XcbzZ2PfHlNVuAIw8VyoA_CfheQJsCf6aFQoPHHOKw3WUHiNHtFSfw>
    <xmx:XcbzZ-0Sl9yLgJ-sUkXosroIoxxDOuGvolT0RJy6RKfdYrFvKnpiZuF1>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 04/12] CI: include domU kernel messages in the console output log
Date: Mon,  7 Apr 2025 14:31:04 +0200
Message-ID: <256c0e93b0500454815f28a370dd208261fa17b6.1744028549.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/scripts/qubes-x86-64.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 0eac410f4168..7bf42d2e3d31 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -175,6 +175,8 @@ if [ -n "$domU_check" ]; then
     rm var/run
     echo "#!/bin/sh
 
+echo 8 > /proc/sys/kernel/printk
+
 ${domU_check}
 " > etc/local.d/xen.start
     chmod +x etc/local.d/xen.start
-- 
git-series 0.9.1

