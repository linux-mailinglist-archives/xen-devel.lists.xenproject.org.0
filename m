Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B497FE792
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 04:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644377.1005267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8XUD-0001a7-Mm; Thu, 30 Nov 2023 03:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644377.1005267; Thu, 30 Nov 2023 03:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8XUD-0001YI-JJ; Thu, 30 Nov 2023 03:13:09 +0000
Received: by outflank-mailman (input) for mailman id 644377;
 Thu, 30 Nov 2023 03:13:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8XUC-0001YC-6e
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 03:13:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fdcd513-8f2e-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 04:13:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D69F161903;
 Thu, 30 Nov 2023 03:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A277AC433C7;
 Thu, 30 Nov 2023 03:13:01 +0000 (UTC)
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
X-Inumbo-ID: 5fdcd513-8f2e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701313982;
	bh=285gX3ikY7OSPhw98EXb5J4CGJTa2YCJRFa1/XSPOWw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WCQs6Tv4S5rb59KGmBtob5kisfrrC7fbghyBbJGIf2hz0Vu9UVGAEWGFoH4y0Nj7d
	 VjPblxGMC8SJ0CmYyzJyIOUyBO0c9Kalux/r3iCR18xDy/v2GEwqwxZkU66vvlSV4N
	 Fx65aVKcK89L9fTlCs71YCEhPjjtdx9LvbVbYtXHR4kp4WoNn1NLRfzsyMl7OcKXCR
	 yKLItMSrhtHwvSHEIGWlCJQq2sPtazDfawqmA3RgETG2SEVMFGx1qV167nshsvfuUh
	 8ImsuVcVa6RZpaH0TJK3Kmk3tCbxfYOsgdjoycbCENKO5i7vb1y1OYUv01vF+u/Gyr
	 duZPOl0D0xkSg==
Date: Wed, 29 Nov 2023 19:13:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2] automation/eclair: improve scheduled analyses
In-Reply-To: <36ea68b24a1e336ef9170b7f89949d282ee1e746.1700752056.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311291911350.3533093@ubuntu-linux-20-04-desktop>
References: <36ea68b24a1e336ef9170b7f89949d282ee1e746.1700752056.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Nov 2023, Simone Ballarin wrote:
> The scheduled analyses are intended to maintain an overall vision
> of the MISRA complaince of the entire project. For this reason,
> the file exclusions in "out_of_scope.ecl" should not be applied.
> 
> This patch amends ECLAIR settings to prevent exempting files for
> scheduled analyses.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> ---
> Changes in v2:
> - drop changes to inhibit test and build stages in scheduled pipelines.
> ---
>  automation/eclair_analysis/ECLAIR/action.settings |  2 +-
>  automation/eclair_analysis/ECLAIR/analysis.ecl    | 12 ++++++++++--
>  automation/gitlab-ci/analyze.yaml                 |  2 ++
>  3 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
> index f96368ffc7..3cba1a3afb 100644
> --- a/automation/eclair_analysis/ECLAIR/action.settings
> +++ b/automation/eclair_analysis/ECLAIR/action.settings
> @@ -134,7 +134,7 @@ push)
>      badgeLabel="ECLAIR ${ANALYSIS_KIND} ${ref}${variantHeadline} #${jobId}"
>      ;;
>  auto_pull_request)
> -    git remote remove autoPRRemote || true
> +    git remote remove autoPRRemote 2>/dev/null || true
>      git remote add autoPRRemote "${autoPRRemoteUrl}"
>      git fetch -q autoPRRemote
>      subDir="${ref}"
> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
> index fe418d6da1..2507a8e787 100644
> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
> @@ -2,7 +2,13 @@
>  -project_name=getenv("ECLAIR_PROJECT_NAME")
>  -project_root=getenv("ECLAIR_PROJECT_ROOT")
>  
> --setq=data_dir,getenv("ECLAIR_DATA_DIR")
> +setq(data_dir,getenv("ECLAIR_DATA_DIR"))
> +setq(analysis_kind,getenv("ANALYSIS_KIND"))
> +setq(scheduled_analysis,nil)
> +
> +strings_map("scheduled-analysis",500,"","^.*scheduled$",0,setq(scheduled_analysis,t))
> +strings_map("scheduled-analysis",500,"","^.*$",0)
> +map_strings("scheduled-analysis",analysis_kind)
>  
>  -verbose
>  
> @@ -15,7 +21,9 @@
>  
>  -eval_file=toolchain.ecl
>  -eval_file=public_APIs.ecl
> --eval_file=out_of_scope.ecl
> +if(scheduled_analysis,
> +    eval_file("out_of_scope.ecl")
> +)


Overall the patch looks much better. Only one question: shouldn't it be

  if not scheduled_analysis

instead of:

  if scheduled_analysis

I don't know the language of analysis.ecl but we are supposed to add
out_of_scope.ecl in all cases except for scheduled_analysis. Looking at
this change it seems to do the opposite?


>  -eval_file=deviations.ecl
>  -eval_file=call_properties.ecl
>  -eval_file=tagging.ecl
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index bd9a68de31..6631db53fa 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -28,6 +28,8 @@
>    extends: .eclair-analysis
>    allow_failure: true
>    rules:
> +    - if: $CI_PIPELINE_SOURCE == "schedule"
> +      when: never
>      - if: $WTOKEN && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
>        when: manual
>      - !reference [.eclair-analysis, rules]
> -- 
> 2.34.1
> 

