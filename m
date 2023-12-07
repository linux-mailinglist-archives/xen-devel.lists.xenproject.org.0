Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C75380898B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 14:53:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649875.1014957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEox-0003Gg-Ey; Thu, 07 Dec 2023 13:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649875.1014957; Thu, 07 Dec 2023 13:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEox-0003Dl-Bi; Thu, 07 Dec 2023 13:53:43 +0000
Received: by outflank-mailman (input) for mailman id 649875;
 Thu, 07 Dec 2023 13:53:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCsk=HS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBEow-0002Al-6g
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 13:53:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 071a17ec-9508-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 14:53:40 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4DF312FC;
 Thu,  7 Dec 2023 05:54:26 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 29CE03F6C4;
 Thu,  7 Dec 2023 05:53:37 -0800 (PST)
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
X-Inumbo-ID: 071a17ec-9508-11ee-98e7-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH 3/5] automation: Add the expect script with test case for FVP
Date: Thu,  7 Dec 2023 21:53:16 +0800
Message-Id: <20231207135318.1912846-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207135318.1912846-1-Henry.Wang@arm.com>
References: <20231207135318.1912846-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To interact with the FVP (for example entering the U-Boot shell
and transferring the files by TFTP), we need to connect the
corresponding port by the telnet first. Use an expect script to
simplify the automation of the whole "interacting with FVP" stuff.

The expect script will firstly detect the IP of the host, then
connect to the telnet port of the FVP, set the `serverip` and `ipaddr`
for the TFTP service in the U-Boot shell, and finally boot Xen from
U-Boot and wait for the expected results by Xen, Dom0 and DomU.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 .../expect/fvp-base-smoke-dom0-arm64.exp      | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100755 automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp

diff --git a/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
new file mode 100755
index 0000000000..25d9a5f81c
--- /dev/null
+++ b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
@@ -0,0 +1,73 @@
+#!/usr/bin/expect
+
+set timeout 2000
+
+# Command to use to run must be given as first argument
+# if options are required, quotes must be used:
+# xxx.exp "cmd opt1 opt2"
+set runcmd [lindex $argv 0]
+
+# Maximum number of line to be printed, this can be used to prevent runs to
+# go forever on errors when Xen is rebooting
+set maxline 1000
+
+# Configure slow parameters used with send -s
+# This allows us to slow down console writes to prevent issues with slow
+# emulators or targets.
+# Format here is: {NUM TIME} which reads as wait TIME seconds each NUM of
+# characters, here we send 1 char each 100ms
+set send_slow {1 .1}
+
+proc test_boot {{maxline} {host_ip}} {
+    expect_after {
+        -re "(.*)\r" {
+            if {$maxline != 0} {
+                set maxline [expr {$maxline - 1}]
+                if {$maxline <= 0} {
+                    send_user "ERROR-Toomuch!\n"
+                    exit 2
+                }
+            }
+            exp_continue
+        }
+        timeout {send_user "ERROR-Timeout!\n"; exit 3}
+        eof {send_user "ERROR-EOF!\n"; exit 4}
+    }
+
+    # Extract the telnet port numbers from FVP output, because the telnet ports
+    # are not guaranteed to be fixed numbers.
+    expect -re {terminal_0: Listening for serial connection on port [0-9]+}
+    set terminal_0 $expect_out(0,string)
+    if {[regexp {port (\d+)} $terminal_0 match port_0]} {
+        puts "terminal_0 port is $port_0"
+    } else {
+        puts "terminal_0 port not found"
+        exit 5
+    }
+
+    spawn bash -c "telnet localhost $port_0"
+    expect -re "Hit any key to stop autoboot.*"
+    send -s "  \r"
+    send -s "setenv serverip $host_ip; setenv ipaddr $host_ip; tftpb 0x80200000 boot.scr; source 0x80200000\r"
+
+    # Initial Xen boot
+    expect -re "\(XEN\).*Freed .* init memory."
+
+    # Dom0 and DomU
+    expect -re "Domain-0.*"
+    expect -re "BusyBox.*"
+    expect -re "/ #.*"
+}
+
+# Get host IP
+spawn bash -c "hostname -I | awk '{print \$1}'"
+expect -re {(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})}
+set host_ip $expect_out(0,string)
+
+# Start the FVP and run the test
+spawn bash -c "$runcmd"
+
+test_boot 2000 "$host_ip"
+
+send_user "\nExecution with SUCCESS\n"
+exit 0
-- 
2.25.1


