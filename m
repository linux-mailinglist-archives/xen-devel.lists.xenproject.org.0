Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81883C26D8B
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 20:56:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154510.1484471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEvDk-0005iC-1u; Fri, 31 Oct 2025 19:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154510.1484471; Fri, 31 Oct 2025 19:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEvDj-0005fg-Sj; Fri, 31 Oct 2025 19:55:35 +0000
Received: by outflank-mailman (input) for mailman id 1154510;
 Fri, 31 Oct 2025 19:55:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8yaW=5I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vEvDi-0005fY-Hz
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 19:55:34 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e1fbf1f-b693-11f0-9d16-b5c5bf9af7f9;
 Fri, 31 Oct 2025 20:55:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4B7C06021B;
 Fri, 31 Oct 2025 19:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA2EC4CEE7;
 Fri, 31 Oct 2025 19:55:29 +0000 (UTC)
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
X-Inumbo-ID: 8e1fbf1f-b693-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761940530;
	bh=h/ymJNqxHiE20P5q6ZLJ2/gTsSvuOX1Et5BB3TouHyk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nlEEdMYRl+K8mLciegi2rN/2dAAS7p+hmL3Wegc67bGZ6rbjal/sF5AUkJfD2X/Mk
	 PbU7GMOmg8Y79Z/4EeA2uU5vNikU5eYaA53aJX+eW3oeN6SnNRkdpl0ziEVcDoDA+s
	 xVj6coFobLuBW05l5v7qUrhXgltuZFwRCBAcGycc0JgomUSqaH5IwiPZkQBzg1EpLo
	 /vIGQO9jj6qsOuoOakwKK16krNoBhZn+yjyTn1/C3yHYRYukBbgO/spZyCc/uI9cEy
	 gsG9nSUSGkaOScQ0jeN6qFbIX1EIBjBtgSTKsYNpUJe/eZ7Exja6Pv6nH4B2AZZoEK
	 XOWRsAvbI4S/g==
Date: Fri, 31 Oct 2025 12:55:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v3] automation/eclair: add new analysis jobs with
 differing configurations
In-Reply-To: <876da816d5aacdb688599fd1d50efca2f856d080.1761897244.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2510311255210.495094@ubuntu-linux-20-04-desktop>
References: <876da816d5aacdb688599fd1d50efca2f856d080.1761897244.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 31 Oct 2025, Nicola Vetrini wrote:
> The following analysis jobs are performed:
> - eclair-{x86_64,ARM64}: analyze Xen using the default configuration for
>   that architecture; runs on runners tagged `eclair-analysis'.
> 
> - eclair-{x86-64,ARM64}-safety: analyze Xen using the configuration for
>   safety, which is more restricted; runs on runners tagged
>   `eclair-analysis-safety`.
> 
> - eclair-{x86_64,ARM64}-testing: analyze Xen using the default
>   configuration for the purposes of testing new runner updates; runs on
>   runners tagged `eclair-analysis-testing`.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> CI pipeline: https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2130873833
> 
> Note: the eclair-ARM64 and eclair-x86_64 jobs are allowed to fail because the
> configuration is not (yet) clean for all checked MISRA guidelines.
> 
> Changes in v3:
> - Use a variable instead of testing the repository PATH to decide whether a job
>   should be run for *-testing and *-safety analyses;
> - Allow eclair-{x86_64,ARM64} default configurations to fail, as the configuration
>   is not yet clean for MISRA.
> Changes in v2:
> - rebased to current staging;
> - fixed regex path issue.
> ---
>  automation/gitlab-ci/analyze.yaml | 42 ++++++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index d50721006740..fae55a23dbb5 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -45,6 +45,22 @@ eclair-x86_64:
>      LOGFILE: "eclair-x86_64.log"
>      VARIANT: "X86_64"
>      RULESET: "monitored"
> +  allow_failure: true

Wouldn't "allow_failure: true" also change the behavior for the existing
jobs? I would think we want to continue not allowing failures for those.
I would think that at least eclair-x86_64-safety should not allow
failures (like before this patch).


> +eclair-x86_64-testing:
> +  extends: eclair-x86_64
> +  tags:
> +    - eclair-analysis-testing
> +  rules:
> +    - if: $ECLAIR_TESTING
> +      when: always
> +    - !reference [.eclair-analysis:triggered, rules]

I imagine that ECLAIR_TESTING will be typically off in
gitlab.com/xen-project/hardware/xen, right?


> +eclair-x86_64-safety:
> +  extends: eclair-x86_64
> +  tags:
> +    - eclair-analysis-safety
> +  variables:
>      EXTRA_XEN_CONFIG: |
>        CONFIG_AMD=y
>        CONFIG_INTEL=n
> @@ -75,6 +91,10 @@ eclair-x86_64:
>        CONFIG_DEBUG_LOCKS=n
>        CONFIG_SCRUB_DEBUG=n
>        CONFIG_XMEM_POOL_POISON=n
> +  rules:
> +    - if: $ECLAIR_SAFETY && $CI_COMMIT_BRANCH =~ /^staging$/
> +      when: always

On the other hand, I expect that ECLAIR_SAFETY will be on in
gitlab.com/xen-project/hardware/xen, right?

I don't think we need the extra check on "staging" as the branch
on gitlab.com/xen-project/hardware/xen are very limited.


> +    - !reference [.eclair-analysis:triggered, rules]
>  
>  eclair-ARM64:
>    extends: .eclair-analysis:triggered
> @@ -82,6 +102,22 @@ eclair-ARM64:
>      LOGFILE: "eclair-ARM64.log"
>      VARIANT: "ARM64"
>      RULESET: "monitored"
> +  allow_failure: true

Same comment for ARM


> +eclair-ARM64-testing:
> +  extends: eclair-ARM64
> +  tags:
> +    - eclair-analysis-testing
> +  rules:
> +    - if: $ECLAIR_TESTING
> +      when: always
> +    - !reference [.eclair-analysis:triggered, rules]
> +
> +eclair-ARM64-safety:
> +  extends: eclair-ARM64
> +  tags:
> +    - eclair-analysis-safety
> +  variables:
>      EXTRA_XEN_CONFIG: |
>        CONFIG_NR_CPUS=16
>        CONFIG_GICV2=n
> @@ -120,13 +156,17 @@ eclair-ARM64:
>        CONFIG_DEBUG_LOCKS=n
>        CONFIG_SCRUB_DEBUG=n
>        CONFIG_XMEM_POOL_POISON=n
> +  rules:
> +    - if: $ECLAIR_SAFETY && $CI_COMMIT_BRANCH =~ /^staging$/
> +      when: always
> +    - !reference [.eclair-analysis, rules]
>  
>  .eclair-analysis:on-schedule:
>    extends: .eclair-analysis
>    rules:
>      - if: $CI_PIPELINE_SOURCE != "schedule"
>        when: never
> -    - !reference [.eclair-analysis, rules]
> +    - !reference [.eclair-analysis:triggered, rules]
>  
>  eclair-x86_64:on-schedule:
>    extends: .eclair-analysis:on-schedule
> -- 
> 2.43.0
> 

