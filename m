Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066A3945469
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 00:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770005.1180867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZdwh-0000KU-Sg; Thu, 01 Aug 2024 22:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770005.1180867; Thu, 01 Aug 2024 22:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZdwh-0000Iv-PN; Thu, 01 Aug 2024 22:06:51 +0000
Received: by outflank-mailman (input) for mailman id 770005;
 Thu, 01 Aug 2024 22:06:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SIAI=PA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sZdwg-0000In-Ga
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 22:06:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 578d8436-5052-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 00:06:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22AC662954;
 Thu,  1 Aug 2024 22:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1593FC32786;
 Thu,  1 Aug 2024 22:06:43 +0000 (UTC)
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
X-Inumbo-ID: 578d8436-5052-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722550004;
	bh=zTut31+nWOafgfKglJDPziM5pXREb4+C4my9z6BgDiM=;
	h=Date:From:To:cc:Subject:From;
	b=GDwZzxlVMdj8epj04tDTwUMxPJi45mJ0Ttxi2wVqG6vmM62ut/fYyVP6JxoQE+9DX
	 GJSHy+gEDWIT8UFISgiN4vuFAyK9o0Wz1JkINOtEV6ifhk2hod0OgXhT1HZRpPahaO
	 SQycZcPP2G7y/52/heZ5v6lqElLMufr8F3JS8mFKFaufVErJlvPJx5CoR/c3Df+dY/
	 9xRxbEIKj+PGkGY+cUCeAYo7VVZgaP9cLVO7F3nWnmnP5rhH5bhglcouTSnyvwmqvh
	 7CyKLYibiOSL4cDpNrXigvx2u2KpGTR4LZx+lqelMo63vd2Qn2zU8XTySp3RdjeFEJ
	 1ERQbi1h5Ju3Q==
Date: Thu, 1 Aug 2024 15:06:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: Simone Ballarin <simone.ballarin@bugseng.com>, nicola.vetrini@bugseng.com, 
    consulting@bugseng.com, sstabellini@kernel.org
Subject: [PATCH] automation: fix eclair scanning for merge requests
Message-ID: <alpine.DEB.2.22.394.2408011500280.114241@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

The ECLAIR jobs part of the Gitlab CI pipeline fail reliably when the
pipeline is started from a merge request. This is the error:

Unexpected event pull_request

The error is a consequence of action.settings setting event=pull_request
for merge_request_event. Given that we don't need any special behavior
from ECLAIR for merge requests, just run the regular scan, change
action.settings to set event=push for merge_request_event (same as for
pipeline triggered by git push).

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

---
Example of a failure:
https://gitlab.com/xen-project/hardware/xen/-/jobs/7486162928

Example of a success with this patch applies:
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1397672866

diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
index 1577368b61..1bfb22b1c1 100644
--- a/automation/eclair_analysis/ECLAIR/action.settings
+++ b/automation/eclair_analysis/ECLAIR/action.settings
@@ -64,14 +64,11 @@ gitlab)
 
     case "${CI_PIPELINE_SOURCE}" in
     merge_request_event)
-        event=pull_request
-        pullRequestId="${CI_MERGE_REQUEST_IID}"
-        pullRequestHeadRef="${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}"
-        pullRequestHeadRepo="${CI_MERGE_REQUEST_SOURCE_PROJECT_PATH}"
-        pullRequestBaseRef="${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}"
-        pullRequestUser="${GITLAB_USER_LOGIN}"
+        event=push
+        ref_kind=branch
+        ref="${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}"
         headCommitId="${CI_COMMIT_SHA}"
-        baseCommitId="${CI_MERGE_REQUEST_DIFF_BASE_SHA}"
+        pushUser="${GITLAB_USER_NAME}"
         ;;
     push | pipeline | web | schedule)
         event=push

