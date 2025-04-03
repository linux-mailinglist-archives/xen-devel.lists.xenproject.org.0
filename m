Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E4A7A197
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:07:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936478.1337753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPR-0006Fv-QU; Thu, 03 Apr 2025 11:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936478.1337753; Thu, 03 Apr 2025 11:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPR-0006AI-EJ; Thu, 03 Apr 2025 11:06:57 +0000
Received: by outflank-mailman (input) for mailman id 936478;
 Thu, 03 Apr 2025 11:06:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4pi=WV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0IPQ-0005Qy-14
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:06:56 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf660edc-107b-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 13:06:53 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id 7CFE41380220;
 Thu,  3 Apr 2025 07:06:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Thu, 03 Apr 2025 07:06:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 07:06:51 -0400 (EDT)
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
X-Inumbo-ID: bf660edc-107b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743678412; x=1743764812; bh=IvTNgoR7x1
	b63sTxPgnBsbrRitkmOkMzfKrMdO24XxM=; b=CWJLHfEOVvh1l+I4vNp8B4/vgU
	axOvsxq0HNeL4Yy3Lo1Z4yJzX5oNzrmJmIN7Rf1QRnJEsCl+GHN2gfM5vId2z6j1
	ea2Zsy3Qhhp/ih+ZMVvAsTTwvRF7LILXrThs4AhPIQZgOkw7YT0Vtj3GDFvFVtg5
	ZDM3Ra9mhs1GmOmuzjpJPSPLvzPCdnOW9vB4aCTKKviIn5rTOmhgoPk77IvbcOLr
	PrXOXauizsVvi4/EwQKjfeIO9S4MprUxcsf2+AJWG+H3JDSv1BEcC+3Nx3rGCRkL
	dfp3uNenl4B9AeiukjAtxYPZsFmUVn4zugUffGJtkenWPYvAo9iVtlG49uQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743678412; x=
	1743764812; bh=IvTNgoR7x1b63sTxPgnBsbrRitkmOkMzfKrMdO24XxM=; b=e
	Xe9mO/mEK3l1v17URng9trLdjioi6FjXjDUje85bK7gAWVcfSrhtm5l6Rpc1cE4p
	52O4uTWmFvikuUfpl5N3NnInM/GRvJW575WwxbxnrOkSQBNxMDG+KxndqQF7QMwr
	D8wAtpk8W9HBUaumWDcH/j9JWUsnKiVPACxfbHdf6FJDLInI0kepCv/pliBs362m
	egHUpZTvVgXVn3n3CizmUaT6VLv64yF4/l/2XgOU56W9SKhV+kxLfnmZjmBK6aAl
	0r+blR4ciR6MPBQOmlZhXPhYlkfE5Ehw9ORBZSOKVj8h9FD3GTO4HsGveK+5balb
	Zzh+N5NxAt5m92Ac3vZzg==
X-ME-Sender: <xms:zGvuZzsOFi0-cmHHPJeIkg10MHXQXYpK3WXM9FwQu0uT2_Cp8XGVFg>
    <xme:zGvuZ0cth5Old3HVSfDMCyQzEM57KdS8cTCGDYWJzL2MiaHf2uP2JY46ZruWkxU4j
    1Vxk1D51PYvNA>
X-ME-Received: <xmr:zGvuZ2xpEIrS626xxDlmZfmt3BP0RsbYYTSVaYwct1rQqQtyVy3zVYGdLbYXLjLo4wa5Ds7vlBO5jr-KoQ9e4pdV6MxtJl_1VZC5UXGZOZzBvQ5uqgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekgedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtph
    htthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:zGvuZyNXJ6TFVQ3GmME72BEgxQByeaZiIIEZ9o4y98z5Su_M6IqMwg>
    <xmx:zGvuZz9QkScd-qNtAOYaiCn0CWlGTWHSarPU0XcSkfFPq9lt0Q5Kag>
    <xmx:zGvuZyVh8oPb-8yZh3BJoB1rtiwKemh14d2kwoXkawUvJxe_npJn4A>
    <xmx:zGvuZ0csNAhGYtfe8SSmGiD_PT1PTtVm5fEh3Ol6wfQuF4aZItC2pQ>
    <xmx:zGvuZwHqQIMMyw5nMzs8132FHs7Mqj-p2p-To0IQNvloo9ESNckMidEE>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 05/11] ci: increase verbosity of starting a domain
Date: Thu,  3 Apr 2025 13:04:40 +0200
Message-ID: <12d51df19d6111c2f61910e9851595aecceb752b.1743678257.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
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
index 1ff689b577e3..17e2141d625e 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -56,7 +56,7 @@ bash /etc/init.d/xencommons start
 
 xl list
 
-xl create -c /root/test.cfg
+xl -vvv create -c /root/test.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index e1cd83880928..0c60a66e25e3 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -21,7 +21,7 @@ echo "#!/bin/bash
 
 xl list
 
-xl create -c /root/test.cfg
+xl -vvv create -c /root/test.cfg
 
 " > ./root/xen.start
 echo "bash /root/xen.start" >> ./etc/init.d/xen-watchdog
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 4d22a124df11..8774a8701232 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -52,7 +52,7 @@ bash /etc/init.d/xencommons start
 
 xl list
 
-xl create -c /root/test.cfg
+xl -vvv create -c /root/test.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index d316c17e0c9f..822b81d186a7 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -122,7 +122,6 @@ echo \"${passed}\"
 "
 
         dom0_check="
-tail -F /var/log/xen/qemu-dm-domU.log &
 until grep -q \"^domU Welcome to Alpine Linux\" /var/log/xen/console/guest-domU.log; do
     sleep 1
 done
@@ -222,7 +221,8 @@ if [ -n "$domU_check" ]; then
     echo "
 # get domU console content into test log
 tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
-xl create /etc/xen/domU.cfg
+tail -F /var/log/xen/qemu-dm-domU.log 2>/dev/null | sed -e \"s/^/(qemu-dm) /\" &
+xl -vvv create /etc/xen/domU.cfg
 ${dom0_check}
 " >> etc/local.d/xen.start
 else
-- 
git-series 0.9.1

