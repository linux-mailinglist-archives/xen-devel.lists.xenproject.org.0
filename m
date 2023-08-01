Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C9176B014
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 11:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574028.899204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQm8i-0001XP-KN; Tue, 01 Aug 2023 09:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574028.899204; Tue, 01 Aug 2023 09:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQm8i-0001UG-HP; Tue, 01 Aug 2023 09:58:04 +0000
Received: by outflank-mailman (input) for mailman id 574028;
 Tue, 01 Aug 2023 09:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u66X=DS=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qQm8h-0001NH-9v
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:58:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e62f2a7e-3051-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 11:58:00 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 1D9A84EE0737;
 Tue,  1 Aug 2023 11:58:01 +0200 (CEST)
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
X-Inumbo-ID: e62f2a7e-3051-11ee-8613-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/4] automation/eclair: add support for tag pipelines
Date: Tue,  1 Aug 2023 11:57:01 +0200
Message-Id: <5e79b954062385c4d765c32347bcb45896d3ed5e.1690881495.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690881495.git.simone.ballarin@bugseng.com>
References: <cover.1690881495.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ECLAIR jobs fail when triggered by tag pipelines (e.g.
xen-project/patchew/xen).

This patch extends the integration to support such pipelines.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 .../eclair_analysis/ECLAIR/action.settings    | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
index 96426811a8..71c10d5141 100644
--- a/automation/eclair_analysis/ECLAIR/action.settings
+++ b/automation/eclair_analysis/ECLAIR/action.settings
@@ -41,7 +41,7 @@ github)
     push | workflow_dispatch)
         event=push
         # Extract the branch name from "refs/heads/<branch>"
-        branch="${GITHUB_REF#refs/heads/}"
+        ref="${GITHUB_REF#refs/heads/}"
         headCommitId="${GITHUB_SHA}"
         pushUser="${GITHUB_ACTOR}"
         ;;
@@ -75,7 +75,13 @@ gitlab)
         ;;
     push | pipeline | web)
         event=push
-        branch="${CI_COMMIT_BRANCH}"
+        if [ -n "${CI_COMMIT_BRANCH:-}" ]; then
+            ref_kind=branch
+            ref="${CI_COMMIT_BRANCH}"
+        else
+            ref_kind=tag
+            ref="${CI_COMMIT_TAG}"
+        fi
         headCommitId="${CI_COMMIT_SHA}"
         pushUser="${GITLAB_USER_NAME}"
         ;;
@@ -99,7 +105,7 @@ jenkins)
     jenkinsBotToken="${ECLAIR_BOT_TOKEN:-}"
 
     event=push
-    branch="${GIT_BRANCH}"
+    ref="${GIT_BRANCH}"
     headCommitId="${GIT_COMMIT}"
     pushUser=$(git show --pretty='format:%aN' -s)
     ;;
@@ -111,7 +117,7 @@ esac
 
 if [ "${event}" = "push" ] && [ -n "${autoPRBranch:-}" ]; then
     # AUTO PR Feature enabled
-    if ! [ "${branch}" = "${autoPRBranch}" ] ||
+    if ! [ "${ref}" = "${autoPRBranch}" ] ||
         ! [ "${repository}" = "${autoPRRepository}" ]; then
         event=auto_pull_request
     fi
@@ -123,17 +129,17 @@ pull_request)
     jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${pullRequestUser} wants to merge ${pullRequestHeadRepo}:${pullRequestHeadRef} (${headCommitId}) into ${pullRequestBaseRef} (${baseCommitId})"
     ;;
 push)
-    subDir="${branch}"
-    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: branch ${branch} (${headCommitId})"
-    badgeLabel="ECLAIR ${ANALYSIS_KIND} ${branch}${variantHeadline} #${jobId}"
+    subDir="${ref}"
+    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${ref_kind} ${ref} (${headCommitId})"
+    badgeLabel="ECLAIR ${ANALYSIS_KIND} ${ref}${variantHeadline} #${jobId}"
     ;;
 auto_pull_request)
     git remote remove autoPRRemote || true
     git remote add autoPRRemote "${autoPRRemoteUrl}"
     git fetch -q autoPRRemote
-    subDir="${branch}"
+    subDir="${ref}"
     baseCommitId=$(git merge-base "autoPRRemote/${autoPRBranch}" HEAD)
-    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${pushUser} wants to merge ${repository}:${branch} (${headCommitId}) into ${autoPRRepository}/${autoPRBranch} (${baseCommitId})"
+    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${pushUser} wants to merge ${repository}:${ref} (${headCommitId}) into ${autoPRRepository}/${autoPRBranch} (${baseCommitId})"
     ;;
 *)
     echo "Unexpected event ${event}" >&2
-- 
2.34.1


