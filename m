Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAAD633B4F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 12:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447080.702973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxRQv-0007aJ-5W; Tue, 22 Nov 2022 11:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447080.702973; Tue, 22 Nov 2022 11:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxRQv-0007Xu-1B; Tue, 22 Nov 2022 11:27:21 +0000
Received: by outflank-mailman (input) for mailman id 447080;
 Tue, 22 Nov 2022 11:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPg5=3W=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oxRQt-0007EN-HX
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 11:27:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 84ff76e1-6a58-11ed-8fd2-01056ac49cbb;
 Tue, 22 Nov 2022 12:26:34 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77F571480;
 Tue, 22 Nov 2022 03:27:24 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A7C9A3F73B;
 Tue, 22 Nov 2022 03:27:15 -0800 (PST)
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
X-Inumbo-ID: 84ff76e1-6a58-11ed-8fd2-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v3 2/3] Changelog: Add __ro_after_init and CET
Date: Tue, 22 Nov 2022 19:26:22 +0800
Message-Id: <20221122112623.1441905-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122112623.1441905-1-Henry.Wang@arm.com>
References: <20221122112623.1441905-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v2 -> v3:
- Remove the "on x86" for __ro_after_init, as Arm also supports the
  __ro_after_init.
v1 -> v2:
- Include this patch in the series
---
 CHANGELOG.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c593081aaf..5ef507a49c 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -15,6 +15,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ### Added / support upgraded
  - Out-of-tree builds for the hypervisor now supported.
+ - __ro_after_init support, for marking data as immutable after boot.
  - The project has officially adopted 4 directives and 24 rules of MISRA-C,
    added MISRA-C checker build integration, and defined how to document
    deviations.
@@ -23,6 +24,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Support VIRT_SSBD feature for HVM guests on AMD and MSR_SPEC_CTRL feature for
    SVM guests.
  - Improved TSC, CPU, and APIC clock frequency calibration on x86.
+ - Support for Xen using x86 Control Flow Enforcement technology for its own
+   protection. Both Shadow Stacks (ROP protection) and Indirect Branch
+   Tracking (COP/JOP protection).
  - Add mwait-idle support for SPR and ADL on x86.
  - Extend security support for hosts to 12 TiB of memory on x86.
  - Add command line option to set cpuid parameters for dom0 at boot time on x86.
-- 
2.25.1


