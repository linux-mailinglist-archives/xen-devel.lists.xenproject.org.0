Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7CD6C3852
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:35:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512927.793352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefsu-00045N-Rb; Tue, 21 Mar 2023 17:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512927.793352; Tue, 21 Mar 2023 17:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefsu-000434-OY; Tue, 21 Mar 2023 17:34:56 +0000
Received: by outflank-mailman (input) for mailman id 512927;
 Tue, 21 Mar 2023 17:34:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kq8e=7N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pefst-0003LR-JO
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:34:55 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0a2f051-c80e-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 18:34:54 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9EAEB320094B;
 Tue, 21 Mar 2023 13:34:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 21 Mar 2023 13:34:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 13:34:51 -0400 (EDT)
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
X-Inumbo-ID: b0a2f051-c80e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1679420092; x=1679506492; bh=gFurLUccyP
	8dzt8i0ZAYhJyKpISa7TOferCBAzCBeLY=; b=YDpgObAU1jd5cGwmErURQP2faI
	kMe220jC2Mdr4P6eRecV9FAFu5nVVLIYawPZBusT+X3LRPjW1Uuu7zFKImoj+aj3
	otl2C4X2wnUqnST94R4EnUbx70QsHn7MycUjICJpccTGo5ZpzneEI0aXm6C4SGlt
	cahpl2S7nrljTVvLLX3DHknMA7WnwC9fh2yWqYI1K1mseCqB6R8exsx+Pp4aNoi9
	EB3J0Gm5fXhDrX6dyRoQyrX4AMwZJJsQlAa5VPSsvUbAd7DfmLVRdgnqYdLzKiNr
	UI2PBeOYPK6XtSDyd3ofFMxNRAGRSmiIaPDaiBZtr5+SHQprzYMfobu/Ryxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679420092; x=
	1679506492; bh=gFurLUccyP8dzt8i0ZAYhJyKpISa7TOferCBAzCBeLY=; b=I
	QfpzgG8/X+ulreQWEitia1eVuk4qgXcM7R+roRseP3KDxYIRPjfNA1jbjLCTtBfd
	3a7hY64U/wMTTxqpusKdpJrisY9dBdd6hACDAQzgQ/AaegqVIS+FldjzBfeuEuvW
	qmecKudqnk4iqGmh+KLtxtQvTNIsgLDp/KgC2NylnpFuAVtU/KMrb4dbAB7wN+UR
	OQ7Udd6V+SU/EDQx2q4ZZPBW/LaB4vOAw1gKlNGG14yO2vBW82VnBVfdm6gCjrkU
	kKwwJKRmOmOOZ+bHN2ewSu8fELC0mY4fDwJlkc8GmejPc6XixzyGmjI6XoZxzmIx
	OizgFjw79Pjt9w0TrkDKQ==
X-ME-Sender: <xms:vOoZZL5Gn48bM9St-vMU6TAxNVwBSFPY6xputj4Wk-yeZeN3N9xpVw>
    <xme:vOoZZA7vfYOe3zV5W3_NDJNulr1n8YAFjCU3QQzu_kjcM1C4UkwDynYbUdw8d6FRU
    6O0r28S5BX4m24>
X-ME-Received: <xmr:vOoZZCe1rZ2XddziqPQ1aBlHVmWlfbJIAbGvgPdTXZmk-YDQtkxGYJ7awywKD8rdg7_rnaujGb8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevieekgeehfeekjeeuhfeutddv
    ueejgeekiedtgfdtgeekudfgleffvedvgeetueenucffohhmrghinhepgigvnhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghm
    ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:vOoZZMKXjkrlUCFrpqLpMRGxBbbKm1o66G9N_yWlqj0Iv6eCM6UKgQ>
    <xmx:vOoZZPKtKjp3fwt2zhivAEYMfESAxpsWCQ3AZCNaqX2KRqn0eJt4hQ>
    <xmx:vOoZZFwYctRKmscLjO3S11JTTD-2DZtzoSrIMOhsTn7f00riqZjIJw>
    <xmx:vOoZZH_Xg68c3r2QUgHrrwCUDWgahq6HGogJcT_qo1tX83_rVG_saw>
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
Subject: [PATCH v6 2/5] Change remaining xenbits.xen.org link to HTTPS
Date: Tue, 21 Mar 2023 13:33:36 -0400
Message-Id: <ee6b94ac9b10776a87ac71814fcaeb51121037ba.1679412247.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679412247.git.demi@invisiblethingslab.com>
References: <cover.1679412247.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

This patch enforces the use of secure transports for all xenbits.xen.org
URLs.  All altered links have been tested and are known to work.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 75f1975e5e78af44d36c2372cba6e89b425267a5..b2bef45b059976d5a6320eabada6073004eb22ee 100644
--- a/Config.mk
+++ b/Config.mk
@@ -191,7 +191,7 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
 EMBEDDED_EXTRA_CFLAGS := -fno-pie -fno-stack-protector -fno-stack-protector-all
 EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
 
-XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
+XEN_EXTFILES_URL ?= https://xenbits.xen.org/xen-extfiles
 # All the files at that location were downloaded from elsewhere on
 # the internet.  The original download URL is preserved as a comment
 # near the place in the Xen Makefiles where the file is used.
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


