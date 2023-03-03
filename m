Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FB66A9445
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 10:39:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505656.778554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY1sf-0002dJ-RO; Fri, 03 Mar 2023 09:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505656.778554; Fri, 03 Mar 2023 09:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY1sf-0002ay-OZ; Fri, 03 Mar 2023 09:39:13 +0000
Received: by outflank-mailman (input) for mailman id 505656;
 Fri, 03 Mar 2023 09:39:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YmbX=63=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pY1se-0001qu-9W
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 09:39:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 40924e18-b9a7-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 10:39:11 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F658175D;
 Fri,  3 Mar 2023 01:39:54 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE8913F587;
 Fri,  3 Mar 2023 01:39:09 -0800 (PST)
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
X-Inumbo-ID: 40924e18-b9a7-11ed-96af-2f268f93b82a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/3] xen/cppcheck: globally suppress unusedStructMember
Date: Fri,  3 Mar 2023 09:38:56 +0000
Message-Id: <20230303093856.2169227-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303093856.2169227-1-luca.fancellu@arm.com>
References: <20230303093856.2169227-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

unusedStructMember warnings from cppcheck are not reliable and
are causing a lot of false positives, suppress the checker
globally for now.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v2:
 - New patch
---
 xen/scripts/xen_analysis/cppcheck_analysis.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
index e385e2c8f54a..ab52ce38d502 100644
--- a/xen/scripts/xen_analysis/cppcheck_analysis.py
+++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
@@ -133,6 +133,8 @@ def generate_cppcheck_deps():
     # - Explicitly suppress warnings on compiler-def.h because cppcheck throws
     #   an unmatchedSuppression due to the rule we put in suppression-list.txt
     #   to skip every finding in the file.
+    # - Explicitly suppress findings for unusedStructMember that is not very
+    #   reliable and causes lots of false positives.
     #
     # Compiler defines are in compiler-def.h which is included in config.h
     #
@@ -145,6 +147,7 @@ def generate_cppcheck_deps():
  --inline-suppr
  --suppressions-list={}/suppression-list.txt
  --suppress='unmatchedSuppression:*'
+ --suppress='unusedStructMember:*'
  --include={}/include/xen/config.h
  -DCPPCHECK
 """.format(settings.outdir, CPPCHECK_BUILD_DIR, settings.xen_dir,
-- 
2.34.1


