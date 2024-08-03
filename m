Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3322494680F
	for <lists+xen-devel@lfdr.de>; Sat,  3 Aug 2024 08:18:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771401.1181988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sa84g-0007bn-BI; Sat, 03 Aug 2024 06:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771401.1181988; Sat, 03 Aug 2024 06:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sa84g-0007Zx-8i; Sat, 03 Aug 2024 06:17:06 +0000
Received: by outflank-mailman (input) for mailman id 771401;
 Sat, 03 Aug 2024 06:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ktMO=PC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sa84e-0007Zq-On
 for xen-devel@lists.xenproject.org; Sat, 03 Aug 2024 06:17:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffb3cec1-515f-11ef-bc03-fd08da9f4363;
 Sat, 03 Aug 2024 08:17:02 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C8F744EE0737;
 Sat,  3 Aug 2024 08:17:01 +0200 (CEST)
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
X-Inumbo-ID: ffb3cec1-515f-11ef-bc03-fd08da9f4363
MIME-Version: 1.0
Date: Sat, 03 Aug 2024 08:17:01 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, nicola.vetrini@bugseng.com,
 consulting@bugseng.com
Subject: Re: [PATCH] automation: fix eclair scanning for merge requests
In-Reply-To: <alpine.DEB.2.22.394.2408011500280.114241@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2408011500280.114241@ubuntu-linux-20-04-desktop>
Message-ID: <f5990dbcf0131768fdfd35bfdfd8930c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-08-02 00:06, Stefano Stabellini wrote:
> The ECLAIR jobs part of the Gitlab CI pipeline fail reliably when the
> pipeline is started from a merge request. This is the error:
> 
> Unexpected event pull_request
> 
> The error is a consequence of action.settings setting 
> event=pull_request
> for merge_request_event. Given that we don't need any special behavior
> from ECLAIR for merge requests, just run the regular scan, change
> action.settings to set event=push for merge_request_event (same as for
> pipeline triggered by git push).
> 

According to my analysis, the error stems from the fact that 
automation/scripts/eclair unconditionally calls action_push.sh, which is 
not designed to handle merge requests (that would be 
action_pull_request.sh). One approach, that needs to be tested, could be 
to execute that second script based on the value of 
${CI_PIPELINE_SOURCE}.

The main difference the approach taken in this patch is that the 
analysis results will be relative to the nearest merge point with the 
staging tree. If that's not something that is desired, then this 
approach looks good to me.

> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> ---
> Example of a failure:
> https://gitlab.com/xen-project/hardware/xen/-/jobs/7486162928
> 
> Example of a success with this patch applies:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1397672866
> 
> diff --git a/automation/eclair_analysis/ECLAIR/action.settings 
> b/automation/eclair_analysis/ECLAIR/action.settings
> index 1577368b61..1bfb22b1c1 100644
> --- a/automation/eclair_analysis/ECLAIR/action.settings
> +++ b/automation/eclair_analysis/ECLAIR/action.settings
> @@ -64,14 +64,11 @@ gitlab)
> 
>      case "${CI_PIPELINE_SOURCE}" in
>      merge_request_event)
> -        event=pull_request
> -        pullRequestId="${CI_MERGE_REQUEST_IID}"
> -        pullRequestHeadRef="${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}"
> -        pullRequestHeadRepo="${CI_MERGE_REQUEST_SOURCE_PROJECT_PATH}"
> -        pullRequestBaseRef="${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}"
> -        pullRequestUser="${GITLAB_USER_LOGIN}"
> +        event=push
> +        ref_kind=branch
> +        ref="${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}"
>          headCommitId="${CI_COMMIT_SHA}"
> -        baseCommitId="${CI_MERGE_REQUEST_DIFF_BASE_SHA}"
> +        pushUser="${GITLAB_USER_NAME}"
>          ;;
>      push | pipeline | web | schedule)
>          event=push

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

