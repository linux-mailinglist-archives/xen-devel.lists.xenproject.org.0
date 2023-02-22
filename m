Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173B269FBD0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 20:15:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499775.771063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUuZa-0004zh-9L; Wed, 22 Feb 2023 19:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499775.771063; Wed, 22 Feb 2023 19:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUuZa-0004xD-5y; Wed, 22 Feb 2023 19:14:38 +0000
Received: by outflank-mailman (input) for mailman id 499775;
 Wed, 22 Feb 2023 19:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XvUJ=6S=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pUuZY-0004x7-7j
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 19:14:36 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21e8fc3e-b2e5-11ed-a829-c9ca1d2f71af;
 Wed, 22 Feb 2023 20:14:34 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0CE9B5C00D6;
 Wed, 22 Feb 2023 14:14:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 22 Feb 2023 14:14:30 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 14:14:29 -0500 (EST)
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
X-Inumbo-ID: 21e8fc3e-b2e5-11ed-a829-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm1; t=1677093270; x=
	1677179670; bh=Jfwfo/kKVXF2Dky7lxFz/j0xQqdCdFBEYU86C864xco=; b=i
	t7D4rPoCB9M+x+2Y5Na6LuwAdse2K0mNiYpv+FoexrSOytUxkJWLCkOqqvNqnOrf
	jONLfwBfJjMG/izjFQn19ON6tplVJkxe5LOftr8iIO1E+cwnlWlatqTp7abC9dPn
	6QHmVM/qjyMwo2uSdp4U3JBVAOJ2Z/nOZkMmwHMSjpJJQwE/mBp5nwgEPbIsv61d
	VLF8rX0ZsZ3ugC329hYP5pt7Qqo35vRlUUlrZfrpFIbYcUGrnskRZmYDQ746siM4
	61qeldlfRCLToz5CuQTxsgYMsLnu4mp7aFv6i3ijTL2KsQA5rJlGJH95wIo5fsXb
	zIcE1Q87GQjIUIeK6AxbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1677093270; x=1677179670; bh=Jfwfo/kKVXF2Dky7lxFz/j0xQqdCdFBEYU8
	6C864xco=; b=XUUQ7nmhSxeboDxoGKhcQbeSbKYluyhXerCbnyKDDPvnxUutVpp
	Ta2kep/srKyS+hKg1WcS/oWobt3G67zE5mpk/uQMUp+VwlDKjUAfx0Wn7DXpNrhT
	k8fFFtS+ihhUsoi+KRBIQ9IhMXlCRAz5XVelXJ+SN3zAOPJh/3hAAmR6z9/1xi5p
	VP7zNQyrKYFZEnXUAK7OWS/v1IYML5p7S9bwlT0chQtkEPAktl9HcYGIjf9r5kQG
	Mf3IQVPzFDTYTTqo4rBfj9iZq3W0EgcIaN0QYQhd62qskir19DzsyVEPhpdX8E/k
	RvxlYplgj4QXMl6rD9rmAwZOshjC4nQ7Qxg==
X-ME-Sender: <xms:lWn2Y8Bsq2nyulj4rEhZEh2wKk5tlsggIQgMxk15T5feqsqPO2me3g>
    <xme:lWn2Y-jppwoqRW7MwJlO5DV9gWfE8ZhTDssz4vx40vcwNXqLSkydL4_Gh5bprUQH_
    u7Iu_qT7iDhKfc>
X-ME-Received: <xmr:lWn2Y_lf5S4FjVWDAvld0jGXdaHjcRT2v0GC5PDeLwgtAFs8tqBMd5Ne6U7RPBi5ChVNIfr6s0nB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeegkedvkefgffegkefhieejtdff
    keehhfelheefjeeutefgleeggfdtveeileenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:lWn2Yyz_UrgZZj3rcGSq_LV9nCUxj5Bwpn101rch9qhbou_1eSIXaw>
    <xmx:lWn2YxTya63KlObJW4D308p2xxZzWJ3NCKUE0TrjDEhtC8wP9OQLBg>
    <xmx:lWn2Y9amytXGYEvxzntHrAAZ000jy-q-IgK28VmA14OU5Sm4nMjvHw>
    <xmx:lmn2YwGCzR2ZkKwYdEx9OkK0YdgortfCQ47nUVcduE-jy1JsJVSLFg>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] Call SetVirtualAddressMap() by default
Date: Wed, 22 Feb 2023 14:14:23 -0500
Message-Id: <9a0e5021a612951c4174c45099edc8a4fb5bd3bb.1677091168.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To quote Andrew Cooper:

> I know we've had this argument before, but not calling
> SetVirtualAddressMap() isn't a viable option.  It's a prerequisite to
> function on literally millions of devices

Qubes OS has been shipping EFI_SET_VIRTUAL_ADDRESS_MAP for years, and I
believe OpenXT and EVE ship it as well. Mark EFI_SET_VIRTUAL_ADDRESS_MAP
as SUPPORTED and enable it by default.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
What is necessary for this patch to be accepted?

 xen/common/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index f1ea3199c8ebdc1e9d0968b9de007f4df44bac79..5b8edb6d81a1296969f968702c5e7f2c775ceba9 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -215,14 +215,15 @@ config KEXEC
 	  If unsure, say Y.
 
 config EFI_SET_VIRTUAL_ADDRESS_MAP
-    bool "EFI: call SetVirtualAddressMap()" if EXPERT
+    bool "EFI: call SetVirtualAddressMap()"
+    default y
     ---help---
       Call EFI SetVirtualAddressMap() runtime service to setup memory map for
       further runtime services. According to UEFI spec, it isn't strictly
       necessary, but many UEFI implementations misbehave when this call is
       missing.
 
-      If unsure, say N.
+      If unsure, say Y.
 
 config XENOPROF
 	def_bool y
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


