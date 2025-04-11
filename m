Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65013A86742
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947817.1345412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4A-0007h9-5o; Fri, 11 Apr 2025 20:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947817.1345412; Fri, 11 Apr 2025 20:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4A-0007f8-1w; Fri, 11 Apr 2025 20:33:34 +0000
Received: by outflank-mailman (input) for mailman id 947817;
 Fri, 11 Apr 2025 20:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3L48-0007cp-RF
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 20:33:32 +0000
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a00fbd8-1714-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 22:33:29 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id A29A11140173;
 Fri, 11 Apr 2025 16:33:28 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Fri, 11 Apr 2025 16:33:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 16:33:27 -0400 (EDT)
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
X-Inumbo-ID: 3a00fbd8-1714-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744403608; x=1744490008; bh=4iAXFxKudp
	w79KKHm4Xqra3AFiuUM/rF5pT4LPi5aRE=; b=XC8Aoe4u9BPrN5JYKa/bepRK2A
	NWji5RJI/uVsVNMn1LTpYxKOPGszM6EWd6ftc4ZNreiGCBL2K5SwC7P8TjwrrKUl
	T5RHDL+imEHzziW3LpQby+SWIxVsypedg/IZUsKr7ACoCDbiTQQ0/c7vgFh+WaR3
	MaruKL/YUAKt1WQPZ0iEwqUn1DJw5gIvvE0RBGQX5PivPpTw5KZooecb79Wsa7Pr
	wodADV0jaVd9f1zxnBpfmazG43Zu7/ufbVsxfu0GI3NYUt+UJXj+ZRHoxA5I+WUh
	sz6X1lyX4S4QCGBqVfYNAfYJ7cP/+rOheSwNnkdCklVvCxarEUiEij2GSx6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744403608; x=
	1744490008; bh=4iAXFxKudpw79KKHm4Xqra3AFiuUM/rF5pT4LPi5aRE=; b=E
	gd7UtamV+KVtvQteJw/4uarBTeV6ADUIcYffmzdesAgADvcbJ/S30olZ5EAwgLbH
	2VVr3E60cuCTWy+culJmuB2//j2rbSK9OwPLUSlbvNbtjSzcZOqqMoBe/+4oAPLK
	DI/0vu3qf7mPn0eLQVvCcnMGS8yylJ9Eg26l8t3Bn2v/rzzwhCIGY3Oup5QzFilZ
	O2KwKcPqffeHEllJnr/v8SXc9T5raswJ72tGky08PDcZVPnrhPgLNTrOfCK9LBle
	w9yyii+b+2pkhIBB36uYJtAXqBEznMGMZyI/tOvlUElkPH66kFYxqg5oIjZOrLo7
	M3sMvpWZBS6e0Fvx2q2lg==
X-ME-Sender: <xms:mHz5Z_ZmH_B3viPCVDUR6YIGepmF5wawiPgTF4GZinAp6PXx3wxJ0Q>
    <xme:mHz5Z-b2nfow7Y_FDEbVV3Qp4tDA2yUDFFjBRqBYxmjutH4cwVcxVgWT97vKMazmt
    dgisH4O9owFSQ>
X-ME-Received: <xmr:mHz5Zx8cfag1kpDConfboCaTcymbcarEcl3sdn2T2iml2hQDuducVqMYXPWRFJrfALL5Wab5FZ3zWJwWZdhI_04FHzQgKYpIbdXzmtTxOlW1LLxcHLY>
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
X-ME-Proxy: <xmx:mHz5Z1o_ADjHcZlHQah2trwQhcYeMRyQAxofshDRD9wddV1g8ihhfQ>
    <xmx:mHz5Z6qZQcBi7voKTvuRS4E7izHn5KQRBl2nAFI00IdxFzGt4Un8pA>
    <xmx:mHz5Z7TFm2GEVn_GqLN-O9o8-jfx_WWVmm3kbqa883CbT7maQGy8Xw>
    <xmx:mHz5Zyp3gE8xQanH6u3JCQ95fmdsFkA1n3rLkQrEupccPF_ZMKzC4Q>
    <xmx:mHz5Zwi7b5a3yCJXNnABmG9XgRrAuEnWdqQyfuT0aTD_gQXXGKhjddPq>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/7] CI: wait for Xen to start before waiting for test to complete
Date: Fri, 11 Apr 2025 22:32:13 +0200
Message-ID: <3f1ef15b54a84573576e647314ec61ea43d4e3af.1744403499.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add additional stage in console output parsing - wait for first message
from Xen. The message is defined via BOOT_MSG variable. This has two
effects:
- distinguishes failing Xen to load at all from later test failures
- resets timeout when Xen starts loading

The latter is especially relevant for hardware tests where firmware +
network boot may take some time before Xen starts booting. The two-stage
timeout is more robust solution than increasing the overall timeout.
The issue has been observed on some dom0pvh-hvm jobs, at least on
runners hw3 and hw11. This patch is a first stage before qubes-x86-64.sh
is switched to use expect in the next stage.

While at it, consistently use 'expect -re' for all matches. This
especially allows matching newlines ("\n"), which will become relevant
in the next patch. And document variables used in console.exp.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- split off "CI: switch qubes runners to use console.exp"
- use BOOT_MSG in more tests (all using network boot)
---
 automation/scripts/console.exp                    | 27 +++++++++++++---
 automation/scripts/qemu-alpine-x86_64.sh          |  1 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh       |  1 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh       |  1 +-
 automation/scripts/qemu-smoke-dom0less-arm32.sh   |  1 +-
 automation/scripts/qemu-xtf-dom0less-arm64.sh     |  1 +-
 automation/scripts/xilinx-smoke-dom0-x86_64.sh    |  1 +-
 automation/scripts/xilinx-smoke-dom0less-arm64.sh |  1 +-
 8 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
index 31ce97b91b63..c27f893dfba7 100755
--- a/automation/scripts/console.exp
+++ b/automation/scripts/console.exp
@@ -1,4 +1,17 @@
 #!/usr/bin/env expect
+#
+# Variables used by this script:
+# - TEST_TIMEOUT: timeout between each *_MSG match
+# - TEST_TIMEOUT_OVERRIDE: when set, overrides TEST_TIMEOUT
+# - TEST_LOG: save console log to this file
+# - TEST_CMD: commands that prints test system console output to stdout - in
+#   qemu tests that's usually qemu itself (with -serial stdio), in hardware
+#   tests that's a command to read serial console
+# - UBOOT_CMD (optional): command to enter at u-boot prompt
+# - BOOT_MSG (optional): initial Xen message to wait for (aka sign-of-life)
+# - LOG_MSG (optional): final console message to wait for
+# - PASSED: message to look for to consider test a success; if LOG_MSG is set,
+#   both LOG_MSG and PASSED must appear (in any order) for test to succeed
 
 if {[info exists env(TEST_TIMEOUT_OVERRIDE)]} {
     set timeout $env(TEST_TIMEOUT_OVERRIDE)
@@ -28,21 +41,25 @@ if {[info exists env(UBOOT_CMD)]} {
     send "$env(UBOOT_CMD)\r"
 }
 
+if {[info exists env(BOOT_MSG)]} {
+    expect -re "$env(BOOT_MSG)"
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
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 17e2141d625e..89bdb4df7dac 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -85,6 +85,7 @@ export TEST_CMD="qemu-system-x86_64 \
     -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0"
 
 export TEST_LOG="smoke.serial"
+export BOOT_MSG="Latest ChangeSet: "
 export LOG_MSG="Domain-0"
 export PASSED="BusyBox"
 
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index 0c60a66e25e3..4f50eabdef53 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -92,6 +92,7 @@ export TEST_CMD="./qemu-system-arm \
 
 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
 export TEST_LOG="${serial_log}"
+export BOOT_MSG="Latest ChangeSet: "
 export LOG_MSG="Domain-0"
 export PASSED="/ #"
 
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 8774a8701232..51d037b0003e 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -104,6 +104,7 @@ export TEST_CMD="./binaries/qemu-system-aarch64 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"
 
 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
+export BOOT_MSG="Latest ChangeSet: "
 export TEST_LOG="smoke.serial"
 export LOG_MSG="Domain-0"
 export PASSED="BusyBox"
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index 0c94e662aab9..0e2c5496db51 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -144,6 +144,7 @@ export TEST_CMD="./qemu-system-arm \
     -bios /usr/lib/u-boot/qemu_arm/u-boot.bin"
 
 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
+export BOOT_MSG="Latest ChangeSet: "
 export TEST_LOG="${serial_log}"
 export LOG_MSG="${dom0_prompt}"
 export PASSED="${passed}"
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
index 9608de6ec033..436f460c3cb6 100755
--- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -61,6 +61,7 @@ export TEST_CMD="./binaries/qemu-system-aarch64 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"
 
 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
+export BOOT_MSG="Latest ChangeSet: "
 export TEST_LOG="smoke.serial"
 export PASSED="${passed}"
 
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 7834ffbe0593..69caabe2d8ed 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -159,6 +159,7 @@ stty -F ${SERIAL_DEV} 57600
 
 # Capture test result and power off board before exiting.
 export PASSED="${PASS_MSG}"
+export BOOT_MSG="Latest ChangeSet: "
 export TEST_CMD="cat ${SERIAL_DEV}"
 export TEST_LOG="smoke.serial"
 
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index b24ad11b8cac..3e1fcf6bf93c 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -140,6 +140,7 @@ stty -F ${SERIAL_DEV} 115200
 
 # Capture test result and power off board before exiting.
 export PASSED="${passed}"
+export BOOT_MSG="Latest ChangeSet: "
 export LOG_MSG="Welcome to Alpine Linux"
 export TEST_CMD="cat ${SERIAL_DEV}"
 export TEST_LOG="smoke.serial"
-- 
git-series 0.9.1

