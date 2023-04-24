Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E57DF6EC5F5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 08:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525078.816131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqpID-0003co-QK; Mon, 24 Apr 2023 06:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525078.816131; Mon, 24 Apr 2023 06:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqpID-0003Ud-Ew; Mon, 24 Apr 2023 06:03:17 +0000
Received: by outflank-mailman (input) for mailman id 525078;
 Mon, 24 Apr 2023 06:03:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhGg=AP=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pqpIB-0000eR-JB
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 06:03:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b37a34f0-e265-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 08:03:15 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB5B3FEC;
 Sun, 23 Apr 2023 23:03:58 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66CF33F587;
 Sun, 23 Apr 2023 23:03:13 -0700 (PDT)
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
X-Inumbo-ID: b37a34f0-e265-11ed-b223-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 12/12] xen/changelog: Add SVE and "dom0" options to the changelog for Arm
Date: Mon, 24 Apr 2023 07:02:48 +0100
Message-Id: <20230424060248.1488859-13-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424060248.1488859-1-luca.fancellu@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Arm now can use the "dom0=" Xen command line option and the support
for guests running SVE instructions is added, put entries in the
changelog.

Mention the "Tech Preview" status and add an entry in SUPPORT.md

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v5:
 - Add Tech Preview status and add entry in SUPPORT.md (Bertrand)
Changes from v4:
 - No changes
Change from v3:
 - new patch
---
 CHANGELOG.md | 3 +++
 SUPPORT.md   | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5dbf8b06d72c..c82a03afd2cf 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
  - Repurpose command line gnttab_max_{maptrack_,}frames options so they don't
    cap toolstack provided values.
+ - The "dom0" option is now supported on Arm and "sve=" sub-option can be used
+   to enable dom0 guest to use SVE/SVE2 instructions.
 
 ### Added
  - On x86, support for features new in Intel Sapphire Rapids CPUs:
@@ -18,6 +20,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the system
      wide impact of a guest misusing atomic instructions.
  - xl/libxl can customize SMBIOS strings for HVM guests.
+ - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
diff --git a/SUPPORT.md b/SUPPORT.md
index aa1940e55f09..3711fc83b48a 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -89,6 +89,12 @@ Extension to the GICv3 interrupt controller to support MSI.
 
     Status: Experimental
 
+### ARM Scalable Vector Extension (SVE/SVE2)
+
+AArch64 guest can use Scalable Vector Extension (SVE/SVE2).
+
+    Status: Tech Preview
+
 ## Guest Type
 
 ### x86/PV
-- 
2.34.1


