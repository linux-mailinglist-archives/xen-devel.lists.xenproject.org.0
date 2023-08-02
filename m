Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D2276C73A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 09:43:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574757.900335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6Vj-0000Xs-5F; Wed, 02 Aug 2023 07:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574757.900335; Wed, 02 Aug 2023 07:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6Vj-0000Vg-2b; Wed, 02 Aug 2023 07:43:11 +0000
Received: by outflank-mailman (input) for mailman id 574757;
 Wed, 02 Aug 2023 07:43:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4RV=DT=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qR6Vg-0000V1-U1
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 07:43:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3907be46-3108-11ee-b25e-6b7b168915f2;
 Wed, 02 Aug 2023 09:43:08 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id BF9504EE0737;
 Wed,  2 Aug 2023 09:43:07 +0200 (CEST)
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
X-Inumbo-ID: 3907be46-3108-11ee-b25e-6b7b168915f2
MIME-Version: 1.0
Date: Wed, 02 Aug 2023 09:43:07 +0200
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Doug Goldstein
 <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 1/4] automation/eclair: add support for tag pipelines
Reply-To: simone.ballarin@bugseng.com
In-Reply-To: <alpine.DEB.2.22.394.2308011542120.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690881495.git.simone.ballarin@bugseng.com>
 <5e79b954062385c4d765c32347bcb45896d3ed5e.1690881495.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308011542120.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <35333b6e9a43c6b3cfb27b0808689e66@bugseng.com>
X-Sender: simone.ballarin@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Il 02/08/2023 00:54 Stefano Stabellini ha scritto:
> On Tue, 1 Aug 2023, Simone Ballarin wrote:
>> The ECLAIR jobs fail when triggered by tag pipelines (e.g.
>> xen-project/patchew/xen).
>> 
>> This patch extends the integration to support such pipelines.
>> 
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Thanks for the fix! One good suggestion from Andrew would be to check
> for required variables at the beginning, rather than at the end. As it
> is now we are doing all the work just to fail at the end. It would have
> been better to fail immediately saving resources. It could be another
> patch :-)
> 

Yes, this is definitely a good idea.
I will propose a new patch.

> 
>> ---
>>  .../eclair_analysis/ECLAIR/action.settings    | 24 
>> ++++++++++++-------
>>  1 file changed, 15 insertions(+), 9 deletions(-)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/action.settings 
>> b/automation/eclair_analysis/ECLAIR/action.settings
>> index 96426811a8..71c10d5141 100644
>> --- a/automation/eclair_analysis/ECLAIR/action.settings
>> +++ b/automation/eclair_analysis/ECLAIR/action.settings
>> @@ -41,7 +41,7 @@ github)
>>      push | workflow_dispatch)
>>          event=push
>>          # Extract the branch name from "refs/heads/<branch>"
>> -        branch="${GITHUB_REF#refs/heads/}"
>> +        ref="${GITHUB_REF#refs/heads/}"
>>          headCommitId="${GITHUB_SHA}"
>>          pushUser="${GITHUB_ACTOR}"
>>          ;;
>> @@ -75,7 +75,13 @@ gitlab)
>>          ;;
>>      push | pipeline | web)
>>          event=push
>> -        branch="${CI_COMMIT_BRANCH}"
>> +        if [ -n "${CI_COMMIT_BRANCH:-}" ]; then
>> +            ref_kind=branch
>> +            ref="${CI_COMMIT_BRANCH}"
>> +        else
>> +            ref_kind=tag
>> +            ref="${CI_COMMIT_TAG}"
>> +        fi
>>          headCommitId="${CI_COMMIT_SHA}"
>>          pushUser="${GITLAB_USER_NAME}"
>>          ;;
>> @@ -99,7 +105,7 @@ jenkins)
>>      jenkinsBotToken="${ECLAIR_BOT_TOKEN:-}"
>> 
>>      event=push
>> -    branch="${GIT_BRANCH}"
>> +    ref="${GIT_BRANCH}"
>>      headCommitId="${GIT_COMMIT}"
>>      pushUser=$(git show --pretty='format:%aN' -s)
>>      ;;
>> @@ -111,7 +117,7 @@ esac
>> 
>>  if [ "${event}" = "push" ] && [ -n "${autoPRBranch:-}" ]; then
>>      # AUTO PR Feature enabled
>> -    if ! [ "${branch}" = "${autoPRBranch}" ] ||
>> +    if ! [ "${ref}" = "${autoPRBranch}" ] ||
>>          ! [ "${repository}" = "${autoPRRepository}" ]; then
>>          event=auto_pull_request
>>      fi
>> @@ -123,17 +129,17 @@ pull_request)
>>      jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: 
>> ${pullRequestUser} wants to merge 
>> ${pullRequestHeadRepo}:${pullRequestHeadRef} (${headCommitId}) into 
>> ${pullRequestBaseRef} (${baseCommitId})"
>>      ;;
>>  push)
>> -    subDir="${branch}"
>> -    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: 
>> branch ${branch} (${headCommitId})"
>> -    badgeLabel="ECLAIR ${ANALYSIS_KIND} ${branch}${variantHeadline} 
>> #${jobId}"
>> +    subDir="${ref}"
>> +    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: 
>> ${ref_kind} ${ref} (${headCommitId})"
>> +    badgeLabel="ECLAIR ${ANALYSIS_KIND} ${ref}${variantHeadline} 
>> #${jobId}"
>>      ;;
>>  auto_pull_request)
>>      git remote remove autoPRRemote || true
>>      git remote add autoPRRemote "${autoPRRemoteUrl}"
>>      git fetch -q autoPRRemote
>> -    subDir="${branch}"
>> +    subDir="${ref}"
>>      baseCommitId=$(git merge-base "autoPRRemote/${autoPRBranch}" 
>> HEAD)
>> -    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: 
>> ${pushUser} wants to merge ${repository}:${branch} (${headCommitId}) 
>> into ${autoPRRepository}/${autoPRBranch} (${baseCommitId})"
>> +    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: 
>> ${pushUser} wants to merge ${repository}:${ref} (${headCommitId}) into 
>> ${autoPRRepository}/${autoPRBranch} (${baseCommitId})"
>>      ;;
>>  *)
>>      echo "Unexpected event ${event}" >&2
>> --
>> 2.34.1
>> 

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)

