Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DC978371B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 02:46:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587945.919337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYFWb-0007Rj-QO; Tue, 22 Aug 2023 00:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587945.919337; Tue, 22 Aug 2023 00:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYFWb-0007PA-Nn; Tue, 22 Aug 2023 00:45:37 +0000
Received: by outflank-mailman (input) for mailman id 587945;
 Tue, 22 Aug 2023 00:45:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gk3p=EH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYFWZ-0007P4-VD
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 00:45:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 330804d3-4085-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 02:45:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 257B060C08;
 Tue, 22 Aug 2023 00:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E1CC433C9;
 Tue, 22 Aug 2023 00:45:30 +0000 (UTC)
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
X-Inumbo-ID: 330804d3-4085-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692665131;
	bh=LGFvy6Cve+NiEbSpSdmRmU4wTER060so0bQr8Z7NCY8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=biWlCxfMKKnbpA+ecGXfPQPT1f/2UrO5kT3sTe+CiyYqoerZ4ssbF2jssXHfp0QSI
	 t45pmcCkAbdYV9f1opxegyPDx2JQoha7RX9NRKt28pfqvrp7oOpEb+wUo7/Ypb1neU
	 jm0PlGvgKnqYi4Fwh85D2A9YfsGr4O5WZCPwlJ1+C4nzBSD7PONDqHIQFixKdq57e1
	 LGzcbNH4lsBNEcPznEcj+WKXQk6tr394L7PSoXS/q9NvUBgKQf2RO8CLCGU5lUqRoZ
	 ssHiu/JO2qzd1UhRFbqL2wCuo6PE542Z2zwk9es9YTWMLElF28Y57gf0JtJ2u2ztJS
	 l9+N+K14FVsgQ==
Date: Mon, 21 Aug 2023 17:45:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    andrew.cooper3@citrix.com, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 1/2] automation/eclair: avoid unintentional ECLAIR
 analysis
In-Reply-To: <4de9a2e93015b12186675b9a3f7ebff7fcd71baa.1692607487.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308211745150.6458@ubuntu-linux-20-04-desktop>
References: <cover.1692607487.git.simone.ballarin@bugseng.com> <4de9a2e93015b12186675b9a3f7ebff7fcd71baa.1692607487.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Aug 2023, Simone Ballarin wrote:
> With this patch, ECLAIR jobs will need to be manually
> started for "people/.*" pipelines and will not be triggered
> if the WTOKEN variable is missing.
> 
> This avoids occupying the runner on analyzes that might
> not be used by developers.
> 
> If developers want to analyze their own repositories
> they need to launch them from GitLab.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Great job!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - avoid ECLAIR jobs if the WTOKEN variable is not defined.
> ---
>  automation/gitlab-ci/analyze.yaml | 22 +++++++++++++++++-----
>  automation/scripts/eclair         |  5 -----
>  2 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index 4aa4abe2ee..bd9a68de31 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -18,28 +18,40 @@
>        - '*.log'
>      reports:
>        codequality: gl-code-quality-report.json
> +  rules:
> +    - if: $WTOKEN == null
> +      when: never
> +    - when: always
>    needs: []
>  
> -eclair-x86_64:
> +.eclair-analysis:triggered:
>    extends: .eclair-analysis
> +  allow_failure: true
> +  rules:
> +    - if: $WTOKEN && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
> +      when: manual
> +    - !reference [.eclair-analysis, rules]
> +
> +eclair-x86_64:
> +  extends: .eclair-analysis:triggered
>    variables:
>      LOGFILE: "eclair-x86_64.log"
>      VARIANT: "X86_64"
>      RULESET: "Set1"
> -  allow_failure: true
>  
>  eclair-ARM64:
> -  extends: .eclair-analysis
> +  extends: .eclair-analysis:triggered
>    variables:
>      LOGFILE: "eclair-ARM64.log"
>      VARIANT: "ARM64"
>      RULESET: "Set1"
> -  allow_failure: true
>  
>  .eclair-analysis:on-schedule:
>    extends: .eclair-analysis
>    rules:
> -    - if: $CI_PIPELINE_SOURCE == "schedule"
> +    - if: $CI_PIPELINE_SOURCE != "schedule"
> +      when: never
> +    - !reference [.eclair-analysis, rules]
>  
>  eclair-x86_64-Set1:on-schedule:
>    extends: .eclair-analysis:on-schedule
> diff --git a/automation/scripts/eclair b/automation/scripts/eclair
> index 813a56eb6a..14e47a6f97 100755
> --- a/automation/scripts/eclair
> +++ b/automation/scripts/eclair
> @@ -4,11 +4,6 @@ ECLAIR_ANALYSIS_DIR=automation/eclair_analysis
>  ECLAIR_DIR="${ECLAIR_ANALYSIS_DIR}/ECLAIR"
>  ECLAIR_OUTPUT_DIR=$(realpath "${ECLAIR_OUTPUT_DIR}")
>  
> -if [ -z "${WTOKEN:-}" ]; then
> -    echo "Failure: the WTOKEN variable is not defined." >&2
> -    exit 1
> -fi
> -
>  "${ECLAIR_ANALYSIS_DIR}/prepare.sh" "${VARIANT}"
>  
>  ex=0
> -- 
> 2.34.1
> 

