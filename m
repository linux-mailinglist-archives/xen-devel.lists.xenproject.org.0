Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F199486E1
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 03:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772446.1182893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb8cN-00010A-H8; Tue, 06 Aug 2024 01:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772446.1182893; Tue, 06 Aug 2024 01:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb8cN-0000y6-D3; Tue, 06 Aug 2024 01:04:03 +0000
Received: by outflank-mailman (input) for mailman id 772446;
 Tue, 06 Aug 2024 01:04:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+gn=PF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sb8cK-0000y0-UW
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 01:04:01 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c15f5b5a-538f-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 03:03:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 34024CE0A5F;
 Tue,  6 Aug 2024 01:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33B7C32782;
 Tue,  6 Aug 2024 01:03:53 +0000 (UTC)
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
X-Inumbo-ID: c15f5b5a-538f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722906234;
	bh=fff6QgXPfRhX/+7/6sPATPQgAJtXHDd/CFaVIagRkKU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=loV3HGYDP8jhoJsM3SoZ6yxOhklQCBkZ7eeNZPfGpWpryU1JEBpPKhm5GE1zaa5D+
	 4gdY3z2ZMZ9DtsbbIevybzBYN+UFJGQljbjc95aje/45goR1IxokrVTbN0y08KVfTB
	 NaEaiPwS8pI59WSXa8h+dRjRDHyCPHHmTcb3uAzSbp6RY1Tod0XUQS3JbOaY4P7CqI
	 lC+Jm+Hk1ZK1oCsuBmXYIZ2c70foYKr86RopVdbqr/xax3ZUkenEdrq+E5djH7ELE+
	 d/HKdeHOr6oUgPgO87SIhScoJiLg74LvY+nicr2C4TBJJ9ckEDUSuyzAoRKjqDOHHX
	 OuWD8ePKXrr9g==
Date: Mon, 5 Aug 2024 18:03:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com
Subject: Re: [PATCH] automation: fix eclair scanning for merge requests
In-Reply-To: <f5990dbcf0131768fdfd35bfdfd8930c@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2408051712320.4954@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2408011500280.114241@ubuntu-linux-20-04-desktop> <f5990dbcf0131768fdfd35bfdfd8930c@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 3 Aug 2024, Nicola Vetrini wrote:
> On 2024-08-02 00:06, Stefano Stabellini wrote:
> > The ECLAIR jobs part of the Gitlab CI pipeline fail reliably when the
> > pipeline is started from a merge request. This is the error:
> > 
> > Unexpected event pull_request
> > 
> > The error is a consequence of action.settings setting event=pull_request
> > for merge_request_event. Given that we don't need any special behavior
> > from ECLAIR for merge requests, just run the regular scan, change
> > action.settings to set event=push for merge_request_event (same as for
> > pipeline triggered by git push).
> > 
> 
> According to my analysis, the error stems from the fact that
> automation/scripts/eclair unconditionally calls action_push.sh, which is not
> designed to handle merge requests (that would be action_pull_request.sh). One
> approach, that needs to be tested, could be to execute that second script
> based on the value of ${CI_PIPELINE_SOURCE}.
> 
> The main difference the approach taken in this patch is that the analysis
> results will be relative to the nearest merge point with the staging tree. If
> that's not something that is desired, then this approach looks good to me.

You are right. I tested the below and it works as expected, see:
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1401863307


---
From dee036081cb367862daba264e1eb84ca2505f678 Mon Sep 17 00:00:00 2001
From: Stefano Stabellini <stefano.stabellini@amd.com>
Date: Mon, 5 Aug 2024 14:24:23 -0700
Subject: [PATCH] automation: fix eclair gitlab jobs for merge requests

The "eclair" script calls action_push.sh even for merge request, while
instead action_pull_request.sh should be called, resulting in a job
failure with this error:

Unexpected event pull_request

Fix the script to call action_pull_request.sh appropriately.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/eclair_analysis/ECLAIR/action_pull_request.sh | 2 +-
 automation/scripts/eclair                                | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 automation/eclair_analysis/ECLAIR/action_pull_request.sh

diff --git a/automation/eclair_analysis/ECLAIR/action_pull_request.sh b/automation/eclair_analysis/ECLAIR/action_pull_request.sh
old mode 100644
new mode 100755
index 68f7e6282e..812238e07f
--- a/automation/eclair_analysis/ECLAIR/action_pull_request.sh
+++ b/automation/eclair_analysis/ECLAIR/action_pull_request.sh
@@ -3,7 +3,7 @@
 set -eu
 
 usage() {
-    echo "Usage: $0 WTOKEN ANALYSIS_OUTPUT_DIR COMMIT_ID" >&2
+    echo "Usage: $0 WTOKEN ANALYSIS_OUTPUT_DIR" >&2
     exit 2
 }
 
diff --git a/automation/scripts/eclair b/automation/scripts/eclair
index ebcaf09b54..97d743ab53 100755
--- a/automation/scripts/eclair
+++ b/automation/scripts/eclair
@@ -21,5 +21,12 @@ ex=0
 # Fail in case of new reports for clean guidelines
 "${ECLAIR_DIR}/action_check_clean_regressions.sh" "${ECLAIR_OUTPUT_DIR}" || ex=$?
 
-"${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
+case "${CI_PIPELINE_SOURCE}" in
+merge_request_event)
+    "${ECLAIR_DIR}/action_pull_request.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
+    ;;
+push | pipeline | web | schedule)
+    "${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
+    ;;
+esac
 [ "${ex}" = 0 ] || exit "${ex}"
-- 
2.25.1


