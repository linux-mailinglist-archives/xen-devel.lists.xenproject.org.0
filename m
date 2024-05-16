Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E65E8C7817
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723357.1128137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7be2-000639-PY; Thu, 16 May 2024 13:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723357.1128137; Thu, 16 May 2024 13:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7be2-0005wF-JJ; Thu, 16 May 2024 13:59:42 +0000
Received: by outflank-mailman (input) for mailman id 723357;
 Thu, 16 May 2024 13:59:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s7be1-0005tl-2U
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:59:41 +0000
Received: from fhigh5-smtp.messagingengine.com
 (fhigh5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8871f64b-138c-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 15:59:38 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 8B0711140163;
 Thu, 16 May 2024 09:59:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 16 May 2024 09:59:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 09:59:36 -0400 (EDT)
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
X-Inumbo-ID: 8871f64b-138c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715867977; x=1715954377; bh=Vx5DcvP0Oc
	GsO9ZlwIl0/mxQ0w+8bvA0AKy34SdFnpQ=; b=LB0jqGR4r+UX55IsXmrypEm75t
	u7ftVY+Sn5U7djolifbMlCoBWpDWzJiiNDuiJ4vUewSEzca6Y+Ammx7/Co0zy6B1
	Y5X/iqEsm/cDldOm3S9qBrLpg9UhJiRkXWcwklqUZH60hP9m+ah2jn3RNyT+w8Ld
	hqPk20yZbiV2LfZpKeVrbviljQp8Okieuj7s8Ah9b9iXUN+luGEsV7kKZTzsamCI
	Hv+0Mg6PnJaiY8vbXXZI3NaY1ipY6zSmX+efBqHyzSpqh3wA/xkwF/W5Mn0oOFHz
	KHace7spXuSPZ8HGSwtaRFLFraErWP7D91qj3QkwxijelkSDhp5jkl+/2Paw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715867977; x=
	1715954377; bh=Vx5DcvP0OcGsO9ZlwIl0/mxQ0w+8bvA0AKy34SdFnpQ=; b=R
	F3oAknZY5YdcRc1OmGxE/qxEOabYFci2Ei958Aca9ZAiYNZhloGQJ0ioOzsxN8WC
	NeLqOQw+NU/BALyPqLkLk+x8MWLjs33PAhFrR0+gdLx2LV+YdFyMof07ndJzAC+e
	2womreuZ4YMlXVLC2jVhZJJ/qKeVDlXGmLfxpXIPD5EtUS5ZEGRy9soFa6LOr/Ks
	LgxWrA1Q3LSGhie3ebtmOFomnY+rQcjebofIhkv7Flcis0gdUr1z2k1rn7TyImOK
	U0td/cpuRo31GtV1xBvIyMVxmfU8wu5MuVX3bxYVLKak0EzIFBFi30AxCeRWBCqD
	roH3lSuVl4EdPMdLjTPnw==
X-ME-Sender: <xms:SRFGZnlrMQFQcVVN-uj7DvFjfKZV4eCdAKxs8Bw8tiTBqQkLo37jlw>
    <xme:SRFGZq2UGzIqNDoxsg1h_eC8E_zi1zhjzX6V0TekegkU2sPiHJSr6raTcyRUMkcuZ
    3jh3HD5g2-Vjw>
X-ME-Received: <xmr:SRFGZtoTLip1MyUbiPtwa0CXI67t_RQVb-i69tzkkOO0-Fx2RFIfoK_6zssPQ1EKm7uGffpyLR44VHvgyRQoLf_R1yeLjLR6JO0bzztw6GANGHHYH_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:SRFGZvm7T_lvyMJi2P0xg7e8GbHFyZxsbjy3OT0auyBBubLiXWLZyA>
    <xmx:SRFGZl2DpD35iJv_E7_XI330i7_dDaXC16djg2km_JTUX7A8xLrIsw>
    <xmx:SRFGZusYtE275epXvcTyfuY35cGT-yR_fy3khAdRqFnklkcMr2Yc6Q>
    <xmx:SRFGZpVPUxm4hcEGVr4gwRjldyxjQ2j5PJq0cw-Pqi8i0_OH_J3L5g>
    <xmx:SRFGZuyQUFS8qXm3rcgKO8y9j3YIqYdzRev0XtKDmvgmhhOv0PK1IR9i>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 01/12] automation: include domU kernel messages in the console output log
Date: Thu, 16 May 2024 15:58:22 +0200
Message-ID: <eb081e91f8c82d3293d6935c0567df96903d0b6c.1715867907.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index d81ed7b931cf..4beeff17d31b 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -131,6 +131,8 @@ mkdir sys
 rm var/run
 echo "#!/bin/sh
 
+echo 8 > /proc/sys/kernel/printk
+
 ${domU_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-- 
git-series 0.9.1

