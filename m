Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39320AE4550
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022419.1398247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThZi-0001ZA-Ql; Mon, 23 Jun 2025 13:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022419.1398247; Mon, 23 Jun 2025 13:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThZi-0001WS-Nw; Mon, 23 Jun 2025 13:51:06 +0000
Received: by outflank-mailman (input) for mailman id 1022419;
 Mon, 23 Jun 2025 13:51:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThWT-00048y-Jk
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:47:45 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a332b7c6-5038-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 15:47:44 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 540961140116;
 Mon, 23 Jun 2025 09:47:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Mon, 23 Jun 2025 09:47:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:47:42 -0400 (EDT)
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
X-Inumbo-ID: a332b7c6-5038-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750686463; x=1750772863; bh=9XIkvx7Zeg
	GJbUPHIjWIHAcZyOUIf+gSu0BR8Znt0MU=; b=Jv0XOW2f1uvk9g3nBGyuS3cgCI
	9Hck2RBqBnWvINcyrDcpMpqsI+ODcmoQfw+cq4JOUPXXDiejQ/iPlzxAiDpvfQXP
	yh2TaV1A9PuKoIlKKpeE9ctEEtBbKD+3cgYoLqdFIxwyCXRyFolQttX4vaaU5/YB
	mLl0q7Of55hbe1dxTYJGfmnICrRtId5It0cYWKtoNrrPYqfYr77rGCpKgeZS7eLo
	/SYGRCSlyeEqOrFL7TAbaBWwK4exeYyU/WhmEPiXT8l0icy3ZxpbIJEGuKG5uxzU
	yFqC205sCxUWCIb7E2O/G8/DVT2SLUOwSh8LNlvX6pgTcATmW9K+WCPDeW1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750686463; x=
	1750772863; bh=9XIkvx7ZegGJbUPHIjWIHAcZyOUIf+gSu0BR8Znt0MU=; b=d
	ki96eBK3q28a2UC1a6D1JLsiVcQV4Rr7Od/JyC7AkVwP0fD0G0qLK3M5+snQgOLU
	K+d4mLJym2+UwZj9x1Ub82sFHYp8f2WoRs5wCn17b5kHg+8f3UG6GR/En6DgeP4N
	eYNQ9L6wKsU9mLavcphgzHasOzovS7jW5gsJgwJAWoaIreIVgKibP7Km+K0taZMZ
	qe8JXjfLzS2479OneA5KgGIm26mFlMuq8R6i2oTrZrSeF2kGL4IqVDtuAngvDx1Z
	GriFApbhGXE6+fYVkbOAQRknKLyoQgnkDWvCCCYmjT8ehB4J2n/urnmf4dz/d+1i
	dRIfE1DGQuxRotykg3kmA==
X-ME-Sender: <xms:_1pZaFqpgswQs3jM_JWo6lm7DE9IsNaqjvOhtKzgtT0ywirj3r4U9w>
    <xme:_1pZaHoTt-oXgTc8CJ8SBSIcAg5F3lOtXKaGQs0wy4oaBdoiKcvdOkXvuiENc62T0
    EGEzQGwo3KVPQ>
X-ME-Received: <xmr:_1pZaCM_SyMNbBqcnaaBsggX8_C3mhjQJbJyMtlTqxB8vt7VMxCxh7L03Nn5XfLSgRDw7qXs1igtXh7IP28VO9Io_iT6c_0XTq94nP4Eq0qkybx7_qlS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudeh
    gfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrughovgestggr
    rhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:_1pZaA7A6nRygvJE4Qdl0kf83Lzwp9NTmTuB1C9VG82Sm3-gUy8h6A>
    <xmx:_1pZaE4erB3SN5MQcTlurScxcuV1dvJP5bi6tOxBKnJukI9-Eq5oeA>
    <xmx:_1pZaIiXUVrift23ZXPAd72NXaoP-2Dx0soS2s0hQ9VR-ohWMbUDkA>
    <xmx:_1pZaG5G39aEDn1WTKTBGHamK45CaLy1cO5LhecvkR1oHMcgTd0-ug>
    <xmx:_1pZaHB_8KX9ROzg96q5KGlL6lSH6VB2fUqTWGFNmMsWLmK0zsvt1ms3>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 5/6] CI: use Alpine's network setup
Date: Mon, 23 Jun 2025 15:47:14 +0200
Message-ID: <041efab43d46d82553fb156ae7f01cd7d7ace2fe.1750686195.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
References: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This allows Alpine startup script to properly handle service
dependencies - necessary for starting dropbear ssh server.
For the latter, always take the IP address from DHCP, in addition to the
test-local one.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 2750d24eba17..cf040a29856b 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -214,25 +214,23 @@ cat "${dom0_rootfs_parts[@]}" > binaries/dom0-rootfs.cpio.gz
 # test-local configuration
 mkdir -p rootfs
 cd rootfs
-mkdir -p boot etc/local.d root
+mkdir -p boot etc/local.d root etc/network
 cp -a ../automation/scripts/run-tools-tests root/
 
+echo "
+auto xenbr0
+iface xenbr0 inet dhcp
+    bridge-ports eth0
+    bridge-stp 0
+    up ip a a 192.168.0.1/24 dev \$IFACE
+" > etc/network/interfaces
+
 echo "#!/bin/bash
 
 bash /etc/init.d/xencommons start
 
-brctl addbr xenbr0
-brctl addif xenbr0 eth0
-ifconfig eth0 up
-ifconfig xenbr0 up
-ifconfig xenbr0 192.168.0.1
-
 " > etc/local.d/xen.start
 
-if [ -n "$retrieve_xml" ]; then
-    echo "timeout 30s udhcpc -i xenbr0" >> etc/local.d/xen.start
-fi
-
 if [ -n "$domU_check" ]; then
     echo "
 # get domU console content into test log
-- 
git-series 0.9.1

