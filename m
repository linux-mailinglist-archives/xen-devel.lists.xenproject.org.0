Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7237477910F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 15:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582442.912228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUSaB-0004bj-V7; Fri, 11 Aug 2023 13:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582442.912228; Fri, 11 Aug 2023 13:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUSaB-0004ZA-SH; Fri, 11 Aug 2023 13:53:39 +0000
Received: by outflank-mailman (input) for mailman id 582442;
 Fri, 11 Aug 2023 13:53:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ho8F=D4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qUSaA-0004Iw-7o
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 13:53:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 788e9bf4-384e-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 15:53:37 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 382E54EE0739;
 Fri, 11 Aug 2023 15:53:37 +0200 (CEST)
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
X-Inumbo-ID: 788e9bf4-384e-11ee-b284-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	andrew.cooper3@citrix.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/2] automation: avoid pipelines on specific branches
Date: Fri, 11 Aug 2023 15:52:54 +0200
Message-Id: <c88fc56a8985acbdb2630a81c930ef12c0743c1b.1691760935.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691760935.git.simone.ballarin@bugseng.com>
References: <cover.1691760935.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch avoids the execution of pipelines in the
following branches:
- master
- smoke
- coverirty-tested/.*
- stable-.*

The job-level exclusions have been removed as they are
pointless with this new workspace-level exclusion.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 .gitlab-ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ee5430b8b7..ef4484e09a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,3 +1,9 @@
+workflow:
+  rules:
+    - if: $CI_COMMIT_BRANCH =~ /^(master|smoke|^coverity-tested\/.*|stable-.*)$/
+      when: never
+    - when: always
+
 stages:
   - analyze
   - build
-- 
2.34.1


