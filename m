Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B5FA7DDBE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939835.1339819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgU-0006gs-B6; Mon, 07 Apr 2025 12:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939835.1339819; Mon, 07 Apr 2025 12:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgU-0006dJ-7x; Mon, 07 Apr 2025 12:34:38 +0000
Received: by outflank-mailman (input) for mailman id 939835;
 Mon, 07 Apr 2025 12:34:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lgS-0006Bg-PH
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:36 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9ca7a15-13ac-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 14:34:35 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id 15A0E1380319;
 Mon,  7 Apr 2025 08:34:35 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Mon, 07 Apr 2025 08:34:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:33 -0400 (EDT)
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
X-Inumbo-ID: a9ca7a15-13ac-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744029275; x=1744115675; bh=+20xCEO7XU
	Y0EaVPTnWYODVDi1jG/CkQA6sU2Q2/xLY=; b=FymF1YgbTKW61bNzVVxaQnYkEK
	n/fSN+4JUSe1VkjvITxqbLU7kHOTiYcYEYBWoj6+UrU14E04vPsd9A7vsqVopBbM
	bvclcFrtS+K5CgOeI2qgw2P5SbQ2izDjM9RX8u47W/4cY1XwCTENlZDn54MutXmW
	nOWPsxt1u37o+4qPuET6YQHEnQq9JF7RQ/nB1BOCwJactys48gnwdQ9vHM7BetKv
	H2LkKDLSITajTzbmDQDxwliVdiD/EjRtJJE/ruW+ddhXHL98thUnk0RVYAstjqao
	zrW4eWX2OihHgTeVY5zxL64chqkg1slZKcT+nGTkkVAZQkPt0yeioBdA3Z0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744029275; x=
	1744115675; bh=+20xCEO7XUY0EaVPTnWYODVDi1jG/CkQA6sU2Q2/xLY=; b=T
	KEtl3cmhp3xqKubJjsrt4rTApBH+VuZfMY7KH1wx4emi+G/Iejf+9emT1QB8ZupM
	TAl9lK7KlUXLMHfQtbVjtCKqy09uaMbC71VEtxry2U13mxM83utwbC119Cos0R07
	J3nS/AzfBVSUSnjtv/jc+CxeqHeoprg4SUde4Kvg+6U74ujueyVMqak+m6wSIhPb
	urygUaVDrlZHw/1Iet6k+VshYaeoG5wifjzeI+X3RANwwrh8llv+fi7RQaImivU5
	QDV+ueANpBIO4LRIpWW9hTFuVAt2aqorSPaDzgddBVGyRqM9hbrOL3iO/zytqHRS
	GBvrA3VXPMOVzNYTsApMQ==
X-ME-Sender: <xms:WsbzZ3IhkJx9boJlYADfEfbTclMKJ7S2BYTwvvVoaunWy1KSht9iQw>
    <xme:WsbzZ7LFeCBm82eZpqSs8QGqZL6HMNrTyIE8KB7UiQKarjVTV9mzfX70sev027Ngk
    txp-axeQRdccQ>
X-ME-Received: <xmr:WsbzZ_twguiajtYlIsnZ12N4-xZIiR_qU7fZLBFYRfxscp2NW0S40i0lpzHvZPn8DeYh8hhFoW0cDQmOr9lTvHD1Y0BHo3bAtdl7kZjlLjBIA11uVsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvddtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:WsbzZwYJU0fzMOiaCbwTi_0Y19qAQ_3_tKiLUwWxOHvULcceA-y3Xw>
    <xmx:WsbzZ-b_QbqTsK98qeZVxQT1HwEMsJr254a4GVprRZYOHAkc2-irkA>
    <xmx:WsbzZ0A18XY42bdkPn1sbQtlTI42AuiRIVSDYHAB-5NatTBpfnQ46w>
    <xmx:WsbzZ8a9KGT7xW9XRy2G9xMgXUX_Zc76KioOe2AQ325s7-4EyQgDUQ>
    <xmx:W8bzZ4i6MGpUQur_7SG3Xhxh5CvR7BLenp70uv9W_hDbmmgZPFXwe86z>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 02/12] CI: switch qubes runners to use console.exp
Date: Mon,  7 Apr 2025 14:31:02 +0200
Message-ID: <33fe66669f6ca9fb7573d69d9f9fefeb653fe503.1744028549.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It appears as sometimes it takes more time for Xen even start booting,
mostly due to firmware and fetching large boot files by grub. In some
jobs the current timeout is pretty close to the actual time needed, and
sometimes (rarely for now) test fails due to timeout expiring in the
middle of dom0 booting. This will be happening more often if the
initramfs will grow (and with more complex tests).
This has been observed on some dom0pvh-hvm jobs, at least on runners hw3
and hw11.

Switch to using expect (console.exp) for more robust test output
handling. This allows waiting separately for Xen starting to boot and
then for the test to complete. For now, set both of those to 120s, which
pessimistically bumps timeout for the whole test to 240s (from 120s).

Some messages use regex, use 'expect -re' for all of them for
consistency, even though not all strictly need that (yet).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
- replace previous "ci: increase timeout for hw tests" with changing how
  console is interacted with

This needs a containers rebuild.
---
 automation/build/alpine/3.18-arm64v8.dockerfile |  1 +-
 automation/scripts/console.exp                  | 23 ++++++--
 automation/scripts/qubes-x86-64.sh              | 52 ++++--------------
 3 files changed, 32 insertions(+), 44 deletions(-)

diff --git a/automation/build/alpine/3.18-arm64v8.dockerfile b/automation/build/alpine/3.18-arm64v8.dockerfile
index 19fe46f8418f..b8482d5bf43f 100644
--- a/automation/build/alpine/3.18-arm64v8.dockerfile
+++ b/automation/build/alpine/3.18-arm64v8.dockerfile
@@ -48,3 +48,4 @@ RUN apk --no-cache add \
   # qubes test deps
   openssh-client \
   fakeroot \
+  expect \
diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
index 31ce97b91b63..d1689fa5bf7f 100755
--- a/automation/scripts/console.exp
+++ b/automation/scripts/console.exp
@@ -28,21 +28,34 @@ if {[info exists env(UBOOT_CMD)]} {
     send "$env(UBOOT_CMD)\r"
 }
 
+if {[info exists env(BOOT_MSG)]} {
+    expect -re "$env(BOOT_MSG)"
+}
+
+if {[info exists env(WAKEUP_CMD)]} {
+    expect -re "$env(SUSPEND_MSG)"
+
+    # keep it suspended a bit, then wakeup
+    sleep 30
+
+    system "$env(WAKEUP_CMD)"
+}
+
 if {[info exists env(LOG_MSG)]} {
     expect {
-        "$env(PASSED)" {
-            expect "$env(LOG_MSG)"
+        -re "$env(PASSED)" {
+            expect -re "$env(LOG_MSG)"
             exit 0
         }
-        "$env(LOG_MSG)" {
-            expect "$env(PASSED)"
+        -re "$env(LOG_MSG)" {
+            expect -re "$env(PASSED)"
             exit 0
         }
     }
 }
 
 expect {
-    "$env(PASSED)" {
+    -re "$env(PASSED)" {
         exit 0
     }
 }
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 8e78b7984e98..0eac410f4168 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-set -ex
+set -ex -o pipefail
 
 # One of:
 #  - ""             PV dom0,  PVH domU
@@ -263,52 +263,26 @@ cp -f binaries/xen $TFTP/xen
 cp -f binaries/bzImage $TFTP/vmlinuz
 cp -f binaries/dom0-rootfs.cpio.gz $TFTP/initrd-dom0
 
-# start logging the serial; this gives interactive console, don't close its
-# stdin to not close it; the 'cat' is important, plain redirection would hang
-# until somebody opens the pipe; opening and closing the pipe is used to close
-# the console
-mkfifo /tmp/console-stdin
-cat /tmp/console-stdin |\
-ssh $CONTROLLER console | tee smoke.serial | sed 's/\r//' &
-
 # start the system pointing at gitlab-ci predefined config
 ssh $CONTROLLER gitlabci poweron
-trap "ssh $CONTROLLER poweroff; : > /tmp/console-stdin" EXIT
+trap "ssh $CONTROLLER poweroff" EXIT
 
 if [ -n "$wait_and_wakeup" ]; then
-    # wait for suspend or a timeout
-    until grep "$wait_and_wakeup" smoke.serial || [ $timeout -le 0 ]; do
-        sleep 1;
-        : $((--timeout))
-    done
-    if [ $timeout -le 0 ]; then
-        echo "ERROR: suspend timeout, aborting"
-        exit 1
-    fi
-    # keep it suspended a bit, then wakeup
-    sleep 30
-    ssh $CONTROLLER wake
+    export SUSPEND_MSG="$wait_and_wakeup"
+    export WAKEUP_CMD="ssh $CONTROLLER wake"
 fi
 
-set +x
-until grep "^Welcome to Alpine Linux" smoke.serial || [ $timeout -le 0 ]; do
-    sleep 1;
-    : $((--timeout))
-done
-set -x
-
-tail -n 100 smoke.serial
-
-if [ $timeout -le 0 ]; then
-    echo "ERROR: test timeout, aborting"
-    exit 1
-fi
+export PASSED="${passed}"
+export BOOT_MSG="Latest ChangeSet: "
+export LOG_MSG="\nWelcome to Alpine Linux"
+export TEST_CMD="ssh $CONTROLLER console"
+export TEST_LOG="smoke.serial"
+export TEST_TIMEOUT="$timeout"
+./automation/scripts/console.exp | sed 's/\r\+$//'
+TEST_RESULT=$?
 
 if [ -n "$retrieve_xml" ]; then
     nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
 fi
 
-sleep 1
-
-(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
-exit 0
+exit "$TEST_RESULT"
-- 
git-series 0.9.1

