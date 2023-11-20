Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957337F0AC8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 04:06:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636418.991907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4ubc-0001Xh-Ts; Mon, 20 Nov 2023 03:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636418.991907; Mon, 20 Nov 2023 03:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4ubc-0001Vs-Qy; Mon, 20 Nov 2023 03:05:48 +0000
Received: by outflank-mailman (input) for mailman id 636418;
 Mon, 20 Nov 2023 03:05:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0Aw=HB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r4uS0-00081B-Br
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 02:55:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 50a606d5-8750-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 03:55:51 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 350C11042;
 Sun, 19 Nov 2023 18:56:37 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 124773F6C4;
 Sun, 19 Nov 2023 18:55:47 -0800 (PST)
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
X-Inumbo-ID: 50a606d5-8750-11ee-98df-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 17/17] docs: update numa command line to support Arm
Date: Mon, 20 Nov 2023 10:54:31 +0800
Message-Id: <20231120025431.14845-18-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120025431.14845-1-Henry.Wang@arm.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

Current numa command in documentation is x86 only. Remove
x86 from numa command's arch limitation in this patch.

Also add related entries in the SUPPORT.md and CHANGELOG.md.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v6:
- Add the CHANGELOG.md entry, drop Jan's Acked-by tag because
  of this.
---
 CHANGELOG.md                      | 1 +
 SUPPORT.md                        | 1 +
 docs/misc/xen-command-line.pandoc | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c341c9d0bf..0467e2cca6 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - Introduce a new x2APIC driver that uses Cluster Logical addressing mode
      for IPIs and Physical addressing mode for external interrupts.
+ - On Arm, NUMA aware scheduling in Xen is supported (Tech Preview).
 
 ### Removed
 
diff --git a/SUPPORT.md b/SUPPORT.md
index fff4b4c5ba..b4f6fb5eb2 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -425,6 +425,7 @@ on embedded platforms and the x86 PV shim.
 Enables NUMA aware scheduling in Xen
 
     Status, x86: Supported
+    Status, Arm: Tech Preview
 
 ## Scalability
 
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 8e65f8bd18..2c15bdd9ea 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1944,7 +1944,7 @@ This option is ignored in **pv-shim** mode.
 ### nr_irqs (x86)
 > `= <integer>`
 
-### numa (x86)
+### numa
 > `= on | off | fake=<integer> | noacpi`
 
 > Default: `on`
-- 
2.25.1


