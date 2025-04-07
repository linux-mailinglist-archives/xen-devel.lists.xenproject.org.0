Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C2EA7DDBB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939839.1339849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgY-0007RS-Fe; Mon, 07 Apr 2025 12:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939839.1339849; Mon, 07 Apr 2025 12:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgY-0007Lu-Ad; Mon, 07 Apr 2025 12:34:42 +0000
Received: by outflank-mailman (input) for mailman id 939839;
 Mon, 07 Apr 2025 12:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lgW-0006Bg-J6
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:40 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac2a63e2-13ac-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 14:34:39 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 11CAE138022F;
 Mon,  7 Apr 2025 08:34:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Mon, 07 Apr 2025 08:34:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:37 -0400 (EDT)
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
X-Inumbo-ID: ac2a63e2-13ac-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744029279; x=1744115679; bh=c4BIOHpfm5
	N25C8N14eGKLLGzXXxmXcsg7/1yxitfro=; b=Z2jtKVmM9/pxC7PxIFKGQqHXPK
	deoMJIFSi3Nlshndr4guwwlDPu8I5AYWL8gMKJulK0A3B6/IwitSpbDjm8+RRTp8
	8S4V7CQ6fL4dppug1ICFNPMTHMqQqHWJD7dxFtqZVRvLSOe47OghBABcl/XStUhY
	XUtnY/O3OucrGKU7pumRLfoggbaYJbfKYp/LAMtcwxTN8EFucvRiISbyLtvWBown
	a6ILw6kvj0U8UzmLcZM5BkR4Sv3FBGpSGVheiTeCNhyrbtIUoNXRxy7uc303jAqk
	VE/Mkhx/8xTDVSjEE0LDBDPCbeafsH9tvp8jVwaA2+HRQRWAQpMfbfxsW4kQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744029279; x=
	1744115679; bh=c4BIOHpfm5N25C8N14eGKLLGzXXxmXcsg7/1yxitfro=; b=F
	GUKvJUXJAnAShjgtxuNOPc2qfQGK672ruDdACyrsacAlj4Rl5fZpg11uVRR43LRc
	cfVXK8pcrqYkPz4lAsyuZKxxSNXQbDE/Q/BVkJteuDUTSkB5V5w8ouZCyULHj/5s
	cvjmp+345I2Hxs55vfD43dJh/htR7Z9RS3Jim//bocWUfY8GPSvJXg3sxuyQHjQe
	Bb8H6l8/N8oHoEeStWU4/toVrY07xs7yNJW5+SPZSklbHg5ihcpdqQ9JowVZ8DdU
	fuEvjqH8mPcrfEQmhKHP9vE+SSzSrWZurCTGpdkv/c8Qc7qi1PtYasJze26aVvkZ
	ay3bL+6SPhqIheAlNXovQ==
X-ME-Sender: <xms:XsbzZxBZE9t5DgnEpICCU51iMIQ4pWKbuKudyLq_5UWCOycE5Ob45Q>
    <xme:XsbzZ_hn9-v54JDAgE7Bjcoxkxh8Ow8f7ggzPcEWvPw88Q5AqnsoZLSHS4U38bAUM
    vxxBUMLRgR_Yg>
X-ME-Received: <xmr:XsbzZ8lswJ-lkdYIGkXL3XtbxyWkTwLu5OD8kg6fjqwt2d6g6EIhnrm1uyz5OJXSOKzCy7DVA-ZIrGSTSq7o9euN_n8bX-5rhcJ7GDENkOH-s0a-JP4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhr
    tghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrg
    gsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:XsbzZ7xT2sLeYs3rJ-xKcRn5edVBlkSbGLx1jrLI0peWNqkQntkfbA>
    <xmx:XsbzZ2RTxJOBfDAV3m6afvoLW1K1fNP_dSlwJHU9KMSR1ZBcTH8XHg>
    <xmx:XsbzZ-b1mWYI2XCq_6klGn3O_YhKbUeInF87LkmEg-ndZKaDBhjXQw>
    <xmx:XsbzZ3ToH5l1DsQQhfNyaw3EATvi8Xe_1Fh9KoxSSwONCHV7dTrILA>
    <xmx:X8bzZ-aVe4OkAw2eFRDuZRo2gxOyjdDQssmxkuoBo0cuYB-SfZyC5H-P>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 05/12] CI: increase verbosity of starting a domain
Date: Mon,  7 Apr 2025 14:31:05 +0200
Message-ID: <a5d32188862ff2c55a5f9ed4b134e655c3b1381d.1744028549.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

And start collecting qemu log earlier, so it isn't lost in case of a
timeout during domain startup.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
- adjust xilinx-smoke-dom0-x86_64.sh too
---
 automation/scripts/qemu-alpine-x86_64.sh       | 2 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh    | 2 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh    | 2 +-
 automation/scripts/qubes-x86-64.sh             | 4 ++--
 automation/scripts/xilinx-smoke-dom0-x86_64.sh | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

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
index 7bf42d2e3d31..17fcbd8fa7db 100755
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
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index f70cfdc1552a..7834ffbe0593 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -49,7 +49,7 @@ ifconfig xenbr0 up
 ifconfig xenbr0 192.168.0.1
 # get domU console content into test log
 tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
-xl create /etc/xen/domU.cfg
+xl -vvv create /etc/xen/domU.cfg
 set +x
 until grep -q \"${DOMU_MSG}\" /var/log/xen/console/guest-domU.log; do
     sleep 1
@@ -75,7 +75,7 @@ done | argo-exec -p 28333 -d 0 -- /bin/echo
 "
     DOM0_CMD="
 insmod /root/xen-argo.ko
-xl create /etc/xen/domU.cfg
+xl -vvv create /etc/xen/domU.cfg
 argo-exec -l -p 28333 -- /bin/echo
 "
 copy_dom0_files ()
-- 
git-series 0.9.1

