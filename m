Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9B4A8673E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947819.1345428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4B-00081J-TT; Fri, 11 Apr 2025 20:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947819.1345428; Fri, 11 Apr 2025 20:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4B-0007wU-NG; Fri, 11 Apr 2025 20:33:35 +0000
Received: by outflank-mailman (input) for mailman id 947819;
 Fri, 11 Apr 2025 20:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3L49-0007Qw-LR
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 20:33:33 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bad7420-1714-11f0-9eae-5ba50f476ded;
 Fri, 11 Apr 2025 22:33:32 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id 71D7B1380214;
 Fri, 11 Apr 2025 16:33:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Fri, 11 Apr 2025 16:33:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 16:33:30 -0400 (EDT)
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
X-Inumbo-ID: 3bad7420-1714-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744403611; x=1744490011; bh=lZAID4WC9b
	z/x+fXcYpHLvBw3VXUpFafmp2WlqFRJQ8=; b=Nr5r5hjkWoiXWErQ2egsygf3sc
	PWCpdq/e2zmlw2tzETxtsctmiQsc5k7sVG7zlD814+lTczYwF+PkpQbnSg4PFzig
	PCQVQDcRgi6jj4A5yhWPU+GQgtAF3QeDIhk2Z+eGcM4sbafI0g3wdhpkBntDuq/8
	SIgiOozn74RkgtEu8pw3MJvjOZgL1/UU4mpfedw845vjdXqm8G9yUmtn4xNSfpYH
	9org7cJhK0I99rUAS4llN8fSR/B8Ex5A33CJg/PI3GqJPjLgzzVjgXQ/3Y1L+ZUQ
	+ILxRgExdTm+C+VFc+IUCG1AiBzH/LcjjBN8/eC35KKpvsu4zjdIlooweTLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744403611; x=
	1744490011; bh=lZAID4WC9bz/x+fXcYpHLvBw3VXUpFafmp2WlqFRJQ8=; b=b
	XCjjiyjoq3YK16rI4AbMPKZ8Ssg6kA720k57ff1POhrhr39wzV5canAIjsRMkYbl
	s4uSCRrFgzU4+cdyWR+S0QDquWQzZQSTasm/B51HJQ/IGq/kx6mtS/WHK3oMiQ7R
	0l6nzUk8IvwKqbkIJslZTjfzdBruZVVDIL+Ra28AjCZnBFEu3fYMaO6bqoDJU5df
	yXSkb8Sjnhblny/7sYqSD4pQwLYf1+UsRCJRn4unM06azn8mjDtwek5lYg7c/8nO
	FrLYtzuYvRQFoIyhzzmbKx+rrMS1hYQMvJ32CHi71Yw6kGvJrI7QPqeS7RAyLFJB
	wSA0zyTVEz1XPAeub8IoQ==
X-ME-Sender: <xms:m3z5Z2gJ3jbKZWDgZ4dANr1_XD2iim8XTngOe0CBQS5_a263d_RUMg>
    <xme:m3z5Z3CN0_xzYsrU2aRFVXREQFv5-1DF6leE9OWz16MWltsChwpa0XI1gJG34PdVS
    cHiH4ZNFySy9A>
X-ME-Received: <xmr:m3z5Z-EwxjEtEPo_Nhr_rI-PWWluTTzPdakgQ1oOr8Dn6h-potli8TgAkOxueB1xBilmiDe-haXrOlu311ytSiz1R02vUKfkOWih_od4M-oaX1reDbI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvjeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:m3z5Z_RhnLPnDc7_1VctX-X8Sj6ClJ1pqxE0glANdoKBKch1E7mUmg>
    <xmx:m3z5Zzyxyho2LXSDXJPdcpDjsUCZFmMOZbkzqT_hkI9Uirb6ucrwew>
    <xmx:m3z5Z976v2_hbpVm-emFgYdm-0CP_DTzT7VSSLanRtYYFNX7m1EFcQ>
    <xmx:m3z5ZwzWZksC0ILmeOu61Icsz3jN5MZljmSBn9nDsCYhItuVuPVdLQ>
    <xmx:m3z5Z4LJyLRspyn5hVa9hc8qgjs_EW7an6qUgvE-x0k6vRG8wOV55sG5>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/7] CI: switch qubes runners to use console.exp
Date: Fri, 11 Apr 2025 22:32:15 +0200
Message-ID: <668fb90bbc5e418f6aea85e81d90343d834a066f.1744403499.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
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

Add S3 handling to console.exp via SUSPEND_MSG + WAKEUP_CMD.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- split into two patches - generic change is in the previous one
Changes in v2:
- replace previous "ci: increase timeout for hw tests" with changing how
  console is interacted with

This needs a containers rebuild.
---
 automation/build/alpine/3.18-arm64v8.dockerfile |  1 +-
 automation/scripts/console.exp                  | 13 +++++-
 automation/scripts/qubes-x86-64.sh              | 52 ++++--------------
 3 files changed, 27 insertions(+), 39 deletions(-)

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
index 834a08db1b95..bdb1dd982003 100755
--- a/automation/scripts/console.exp
+++ b/automation/scripts/console.exp
@@ -9,6 +9,10 @@
 #   tests that's a command to read serial console
 # - UBOOT_CMD (optional): command to enter at u-boot prompt
 # - BOOT_MSG (optional): initial Xen message to wait for (aka sign-of-life)
+# - SUSPEND_MSG (optional): message signaling system is going to sleep, it's
+#   trigger for WAKEUP_CMD (see below)
+# - WAKEUP_CMD (optional): command to execute to wakeup the system 30s after
+#   seeing SUSPEND_MSG
 # - LOG_MSG (optional): final console message to wait for
 # - PASSED: message to look for to consider test a success; if LOG_MSG is set,
 #   both LOG_MSG and PASSED must appear (in any order) for test to succeed
@@ -45,6 +49,15 @@ if {[info exists env(BOOT_MSG)]} {
     expect -re "$env(BOOT_MSG)"
 }
 
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
         -re "$env(PASSED)" {
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index a964ac4b7a4e..861e302d845b 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-set -ex
+set -ex -o pipefail
 
 # One of:
 #  - ""             PV dom0,  PVH domU
@@ -267,52 +267,26 @@ cp -f binaries/xen $TFTP/xen
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

