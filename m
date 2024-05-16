Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5108C7814
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723359.1128159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7be5-0006ea-CG; Thu, 16 May 2024 13:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723359.1128159; Thu, 16 May 2024 13:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7be5-0006cg-8U; Thu, 16 May 2024 13:59:45 +0000
Received: by outflank-mailman (input) for mailman id 723359;
 Thu, 16 May 2024 13:59:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s7be3-0005tl-L6
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:59:43 +0000
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com
 [103.168.172.151]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ab89abf-138c-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 15:59:42 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.nyi.internal (Postfix) with ESMTP id 5F64313803A4;
 Thu, 16 May 2024 09:59:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 16 May 2024 09:59:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 09:59:40 -0400 (EDT)
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
X-Inumbo-ID: 8ab89abf-138c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715867981; x=1715954381; bh=Y5qffu5/Vu
	+XKaybYq8e5lXVQKHQBbeNSAMA/00cIO8=; b=vm4+SF2jJWHszzivlgxwOtKZcj
	1mVOHWWFAdq0r8scQu2OImIwabRzlhxn77GJ9KgVEIwABGWx04zMncfpo99UElSB
	A6TFB9Gxf3VBttMHRePH7qQhYBG3mv2KGG4SJDpoq0ndI/vygRc+VT8nz6I6OAjg
	SUa3sREWuLL2UgBJpu0yOur4UgXxB0M9o8k11n10mJXpmfbQhAZr9o4uBgW7jWAK
	HIQB0OJZweTsujJbrLLHRm/mVs++i3PHXUgsPWuKOqqXV/kAONZhjItCFajTxvj4
	ezj3rvk0bywETFfnmNxy1pJcBS+UgPsmKsC1zbdtd5uUTRQjrUG6DeDm9LGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715867981; x=
	1715954381; bh=Y5qffu5/Vu+XKaybYq8e5lXVQKHQBbeNSAMA/00cIO8=; b=Y
	CVeDLVNaIoCLUCRAmQdHFHrr9kD3hZh3Eyq7mL3zaMUFRc/mVUQWyxihsO7mJOlk
	/ZPP/OvmjPbnDXo3mJRadYly/GIsWSOjAQD3S5dTD3rnuVf8niXWLycjltEyJ4Y9
	BNB3x83K7mH/SPI6yQa1U5JTFoM23puj+TSIvkXeGvUHDSZkSZRYtrG84FH8Na6Q
	SKx4SFN0XjOiRnXAyToQehiOIO4I7Q+0f4yPP1JGNqvF4uFl45aZ+5a1tYmk90kV
	vZ0rAJsEAqY+yDuQHuYeqgkJJx6CdcsPpLSp5LYIbyl/SYnGhJGZhR1dek5icQtt
	/ApqeFH4rAdFNvirLhSBw==
X-ME-Sender: <xms:TRFGZkpGclxMeGcuB5Gc8C-j2EX3-Yw8sfCf6u_b4Hc4BFWB0cNH2w>
    <xme:TRFGZqqF_EcsUzO-FH-WoE0RCTvqGyrFoZ9zVhI6O9vhgJCdwjvhqBy7G3KsDf9K1
    tS6wimLcuB5pQ>
X-ME-Received: <xmr:TRFGZpP9syI9pRNTE6e4ZndMI7-BDyzt3KF6TCMSpOxhRqQpJVzNX-o97oaOADSHmFVkE5708e25l4XagiXj75cLL1kiFQ5zyZlsGElEYb66V22QyJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:TRFGZr513P4qKWprGV2XHjJuqaMWmpDgoYBl74q_haRvcZjLQE_NtA>
    <xmx:TRFGZj6aEiFTFFLQuNpGUzDcaS-lV0LGNeILPLEhpMbFTpSw79vUgQ>
    <xmx:TRFGZrj8jUH1WLqb4OyOjmc7OP8XlECUTSvPBd8kVMVDlmJ9TDs3ug>
    <xmx:TRFGZt57v3afGRzOPEt2moZzDuQ85pv2jtBUGgo0JQfXrrPvfjwIRw>
    <xmx:TRFGZllBhFeSN8FLC2a6_zgb6u1EgZu50iVcMRKAHsG09znf-G39zhIS>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 04/12] automation: increase verbosity of starting a domain
Date: Thu, 16 May 2024 15:58:25 +0200
Message-ID: <cebd305832fab02532fba4b63d2b3c64801753ef.1715867907.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

And start collecting qemu log earlier, so it isn't lost in case of a
timeout during domain startup.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qemu-alpine-x86_64.sh    | 2 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh | 2 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh | 2 +-
 automation/scripts/qubes-x86-64.sh          | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 8e398dcea34b..a188d60ea6f3 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -56,7 +56,7 @@ bash /etc/init.d/xencommons start
 
 xl list
 
-xl create -c /root/test.cfg
+xl -vvv create -c /root/test.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index d91648905669..3d208cd55bfa 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -21,7 +21,7 @@ echo "#!/bin/bash
 
 xl list
 
-xl create -c /root/test.cfg
+xl -vvv create -c /root/test.cfg
 
 " > ./root/xen.start
 echo "bash /root/xen.start" >> ./etc/init.d/xen-watchdog
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index e0bb37af3610..afc24074eef8 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -52,7 +52,7 @@ bash /etc/init.d/xencommons start
 
 xl list
 
-xl create -c /root/test.cfg
+xl -vvv create -c /root/test.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 4beeff17d31b..bd620b0d9273 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -112,7 +112,6 @@ echo \"${passed}\"
 "
 
     dom0_check="
-tail -F /var/log/xen/qemu-dm-domU.log &
 until grep -q \"^domU Welcome to Alpine Linux\" /var/log/xen/console/guest-domU.log; do
     sleep 1
 done
@@ -167,7 +166,8 @@ ifconfig xenbr0 192.168.0.1
 
 # get domU console content into test log
 tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
-xl create /etc/xen/domU.cfg
+tail -F /var/log/xen/qemu-dm-domU.log 2>/dev/null | sed -e \"s/^/(qemu-dm) /\" &
+xl -vvv create /etc/xen/domU.cfg
 ${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-- 
git-series 0.9.1

