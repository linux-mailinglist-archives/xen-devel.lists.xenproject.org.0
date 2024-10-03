Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C4698F802
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 22:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809862.1222421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swSLi-0003tQ-VF; Thu, 03 Oct 2024 20:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809862.1222421; Thu, 03 Oct 2024 20:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swSLi-0003ql-SX; Thu, 03 Oct 2024 20:22:58 +0000
Received: by outflank-mailman (input) for mailman id 809862;
 Thu, 03 Oct 2024 20:22:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g6hD=Q7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1swSLh-0003qc-R4
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 20:22:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 457dfeda-81c5-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 22:22:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCCA15C59CA;
 Thu,  3 Oct 2024 20:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DDCC4CECC;
 Thu,  3 Oct 2024 20:22:52 +0000 (UTC)
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
X-Inumbo-ID: 457dfeda-81c5-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727986973;
	bh=Vifhhk/GMAApuFJD0YV7AISAVU4EMbqZ47MfwtUkfPo=;
	h=Date:From:To:cc:Subject:From;
	b=cCpzeERSYyoc4O+w/bPM/2lJCtnSc4h5+cF1SowjlMdYqlWQosvWGozyOGVM979Ny
	 QpwhGYk2woJyRnZk/SgL2TBJqeSeSTo1dkjYiVIhNK53pbBvUDlnFATjIWDDXK1Evw
	 UYdcLdh8FZbL0ZAUTqgOzy9X+faUIRawJ5/qkKSYoKUuey4RLeQcRkc+DJmzBNuSXu
	 Vgda3O/lkPSs/1JCUju/zbzks3+BXjkO3OJr/oczWa+p89GGdnpQVvp9t/FZ/Bcuk/
	 FkPuze66SKwxcSeJSa6f65DHVdn6MTfzh5ZQf23ds9ugobvUGPapoyg8js0tsYFUXD
	 6e4AsU9Ohtr8w==
Date: Thu, 3 Oct 2024 13:22:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Michal Orzel <michal.orzel@amd.com>, victorm.lira@amd.com
Subject: [PATCH] automation: introduce TEST_TIMEOUT_OVERRIDE
Message-ID: <alpine.DEB.2.22.394.2410031319100.1138574@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

TEST_TIME is set as a CI/CD project variable, as it should be, to match
the capability and speed of the testing infrastructure.

As it turns out, TEST_TIME defined in test.yaml cannot override
TEST_TIME defined as CI/CD project variable. As a consequence, today the
TEST_TIME setting in test.yaml for the Xilinx jobs is ignored.

Instead, rename TEST_TIMEOUT to TEST_TIMEOUT_OVERRIDE in test.yaml and
check for TEST_TIMEOUT_OVERRIDE first in console.exp.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 8675016b6a..e947736195 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -84,7 +84,7 @@
   variables:
     CONTAINER: ubuntu:xenial-xilinx
     LOGFILE: qemu-smoke-xilinx.log
-    TEST_TIMEOUT: 120
+    TEST_TIMEOUT_OVERRIDE: 120
   artifacts:
     paths:
       - smoke.serial
@@ -104,7 +104,7 @@
     LOGFILE: xilinx-smoke-x86_64.log
     XEN_CMD_CONSOLE: "console=com2 com2=57600,8n1,0x2F8,4"
     TEST_BOARD: "crater"
-    TEST_TIMEOUT: 1000
+    TEST_TIMEOUT_OVERRIDE: 1000
   artifacts:
     paths:
       - smoke.serial
diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
index f538aa6bd0..310543c33e 100755
--- a/automation/scripts/console.exp
+++ b/automation/scripts/console.exp
@@ -1,6 +1,8 @@
 #!/usr/bin/expect -f
 
-if {[info exists env(TEST_TIMEOUT)]} {
+if {[info exists env(TEST_TIMEOUT_OVERRIDE)]} {
+    set timeout $env(TEST_TIMEOUT_OVERRIDE)
+} elseif {[info exists env(TEST_TIMEOUT)]} {
     set timeout $env(TEST_TIMEOUT)
 } else {
     set timeout 1500

