Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B397F3B57
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 02:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638369.994885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5c90-0002xs-Dj; Wed, 22 Nov 2023 01:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638369.994885; Wed, 22 Nov 2023 01:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5c90-0002wC-Az; Wed, 22 Nov 2023 01:35:10 +0000
Received: by outflank-mailman (input) for mailman id 638369;
 Wed, 22 Nov 2023 01:35:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5c8z-0002w6-EW
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 01:35:09 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dcf15ae-88d7-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 02:35:07 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 85253B823DD;
 Wed, 22 Nov 2023 01:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC423C433C7;
 Wed, 22 Nov 2023 01:35:04 +0000 (UTC)
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
X-Inumbo-ID: 5dcf15ae-88d7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700616905;
	bh=iEhdKoweXCyufyWBnbSMoo8FLTaYNDAG+98bk1bDOAE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mb33ajDd0tHJaMJ66bzj7sFaSyx8qrLhjQTmwj0T4tst8RglLX09xCfzkpF9DRDUs
	 3H1DEXpQ9SbtOKIpmAWu09k6DkQHRSP6/QI0LvZtolIRjJMmznxB3kScW8I5OLuoTj
	 TbaxGCrlDxxaTWPiZYfdun4Ur3W7goXxRNUJbGqzVeaHI5tSUAD8Ix7MJL13a8YVSY
	 Zeu/3WxmaKJXOl218JCGOgehQoyzkh/tbGKQ7aebsbHw5OO0Qgkj1b4qR8eDFa/Ird
	 9pEQ+E5PWxtSelwG/i/+pOLw4nCjdwsudj8tZL5suVlAIeLz08xLf2CEDwUY3ekseL
	 ZRMFDqFc0Ky7Q==
Date: Tue, 21 Nov 2023 17:35:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation/eclair: improve scheduled analyses
In-Reply-To: <54204ba682f4a5dc6fb8202b593d9562caff6d06.1700486902.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311211733330.2053963@ubuntu-linux-20-04-desktop>
References: <54204ba682f4a5dc6fb8202b593d9562caff6d06.1700486902.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Nov 2023, Simone Ballarin wrote:
> The scheduled analyses are intended to maintain an overall vision
> of the MISRA complaince of the entire project. For this reason,
> the file exclusions in "out_of_scope.ecl" should not be applied.
> 
> This patch amends ECLAIR settings to prevent exempting files for
> scheduled analyses and prevents scheduled pipelines from triggering
> non-analysis jobs.

The last sentence...


> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  .../eclair_analysis/ECLAIR/action.settings     |  2 +-
>  automation/eclair_analysis/ECLAIR/analysis.ecl | 12 ++++++++++--
>  automation/gitlab-ci/analyze.yaml              |  2 ++
>  automation/gitlab-ci/build.yaml                |  4 ++++
>  automation/gitlab-ci/test.yaml                 | 18 ++++++++++++------
>  5 files changed, 29 insertions(+), 9 deletions(-)
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
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 32af30cced..6b2ac97248 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -1,6 +1,10 @@
>  .build-tmpl: &build
>    stage: build
>    image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> +  rules:
> +    - if: $CI_PIPELINE_SOURCE == "schedule"
> +      when: never
> +    - when: always

...does it mean that we are going to stop all the build jobs...


>    script:
>      - ./automation/scripts/build 2>&1 | tee build.log
>    artifacts:
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 61e642cce0..47fc8cb3eb 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -1,6 +1,10 @@
>  .test-jobs-common:
>    stage: test
>    image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> +  rules:
> +    - if: $CI_PIPELINE_SOURCE == "schedule"
> +      when: never
> +    - when: always

...and also stop all the test jobs?

So basically the only thing left is .eclair-analysis:on-schedule ?


>  .arm64-test-needs: &arm64-test-needs
>    - alpine-3.18-arm64-rootfs-export
> @@ -90,9 +94,10 @@
>        - '*.log'
>        - '*.dtb'
>      when: always
> -  only:
> -    variables:
> -      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> +  rules:
> +    - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> +      when: always
> +    - !reference [.test-jobs-common, rules]
>    tags:
>      - xilinx
>  
> @@ -110,9 +115,10 @@
>        - smoke.serial
>        - '*.log'
>      when: always
> -  only:
> -    variables:
> -      - $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> +  rules:
> +    - if: $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> +      when: always
> +    - !reference [.test-jobs-common, rules]
>    tags:
>      - qubes-hw2
>  
> -- 
> 2.34.1
> 

