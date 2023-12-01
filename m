Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13A78001CC
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 03:59:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645247.1007308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tkN-0003sG-In; Fri, 01 Dec 2023 02:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645247.1007308; Fri, 01 Dec 2023 02:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tkN-0003pL-Ex; Fri, 01 Dec 2023 02:59:19 +0000
Received: by outflank-mailman (input) for mailman id 645247;
 Fri, 01 Dec 2023 02:59:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8tkL-0003m3-Kb
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 02:59:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c260755-8ff5-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 03:59:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D683462048;
 Fri,  1 Dec 2023 02:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16D4C433C7;
 Fri,  1 Dec 2023 02:59:12 +0000 (UTC)
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
X-Inumbo-ID: 9c260755-8ff5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701399553;
	bh=tLfpqB5oXQYaNm7hwUYefz3R6ijUkmYMxGLy1vQLypA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kog+93pJi7AMaEwqszidxgR9RjgGIpWnll1UtKt9J/QV6tVymWwuvm1x4jodVy11v
	 4B/IcYVz+EMEwN+ENnrLb0Ujj1Xsz+vytoEvJchh84kI32h49iYW34M30aSOi1zG6e
	 IljYhzsjDc6Qt4XnD1/ZU873aBBOg3YUXcg/jj/cDB1N75WyRvfuoyxn3YIR4fxCF9
	 bKQxPl8XqqNrnv9GrEyikbol2O1p++NRJHYyWzlnmtnnEiHXtUFFSWdWXvEok8NIN5
	 3sDZYfo4RTcum/F0LPog1bpLJTwOm1OanrEhtwLmYoCkodYNNglkPfUuB89xIvkXDa
	 SNo+p1pGRdXUw==
Date: Thu, 30 Nov 2023 18:59:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v3] automation/eclair: improve scheduled analyses
In-Reply-To: <90f35626378aae5f5a482bf22c2246b506bb547e.1701363877.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311301859050.110490@ubuntu-linux-20-04-desktop>
References: <90f35626378aae5f5a482bf22c2246b506bb547e.1701363877.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Nov 2023, Simone Ballarin wrote:
> The scheduled analyses are intended to maintain an overall vision
> of the MISRA complaince of the entire project. For this reason,
> the file exclusions in "out_of_scope.ecl" should not be applied.
> 
> This patch amends ECLAIR settings to prevent exempting files for
> scheduled analyses.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
> - fix guard for inclusion of out_of_scope.ecl.
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
> index fe418d6da1..f8d4cc8c99 100644
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
> +if(not(scheduled_analysis),
> +    eval_file("out_of_scope.ecl")
> +)
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

