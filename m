Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA1A3CF67
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 03:35:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893506.1302383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkwP3-0000Bt-Rg; Thu, 20 Feb 2025 02:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893506.1302383; Thu, 20 Feb 2025 02:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkwP3-00009P-Ow; Thu, 20 Feb 2025 02:35:05 +0000
Received: by outflank-mailman (input) for mailman id 893506;
 Thu, 20 Feb 2025 02:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j1Y=VL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkwP2-00009J-Gh
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 02:35:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4693fff4-ef33-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 03:34:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EDE8D5C5AAC;
 Thu, 20 Feb 2025 02:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE18C4CED1;
 Thu, 20 Feb 2025 02:34:55 +0000 (UTC)
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
X-Inumbo-ID: 4693fff4-ef33-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740018896;
	bh=wTRnj8YnQXN4HGzIHwGyWTKVaAODtEsZ4abb26MWWCs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C99ICg+XvflWjxyOr/1xOqSDp1992iIvamG+fPc8aJCI3SqkBlAtO4djw/BkqGAsv
	 07Fwi0O97DldsntPV2KOkzA/E/rYPn38k0qAh38EH5iUknzaibGxLzvJv2+2mKrY4A
	 Ztf9wheIbc+dF/9tA3NRCloIM9VxHsOuomQiMvUsfU4VtRaK2Cb+O921VHuPXboHH9
	 y05dFvyYtYiSuE8Jhq+NCgEK+AwejwOea+cQiXAZD+y2qkBwPWvd7tpil/Y9Ms3am7
	 oM8SXfFzdxqtIDjEsyVHcO3KkGh3gUWcSdXCcqGr+FN+k5EyQ5KH9077zz8zjDcJSB
	 pRH0ghFO9E7bw==
Date: Wed, 19 Feb 2025 18:34:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/5] automation: allow selecting individual jobs via
 CI variables
In-Reply-To: <95088c06171ce140caf48029118dcb6fd2ac8d99.1739933790.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2502191833090.1791669@ubuntu-linux-20-04-desktop>
References: <cover.0fd3c8fb7cf6db337edfd5c5d6ea18bcc44bdef3.1739933790.git-series.marmarek@invisiblethingslab.com> <95088c06171ce140caf48029118dcb6fd2ac8d99.1739933790.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1452106152-1740018896=:1791669"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1452106152-1740018896=:1791669
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 19 Feb 2025, Marek Marczykowski-Górecki wrote:
> Debugging sometimes involves running specific jobs on different
> versions. It's useful to easily avoid running all of the not interesting
> ones (for given case) to save both time and CI resources. Doing so used
> to require changing the yaml files, usually in several places.
> Ease this step by adding SELECTED_JOBS_ONLY variable that takes a regex.
> Note that one needs to satisfy job dependencies on their own (for
> example if a test job needs a build job, that specific build job
> needs to be included too).
> 
> The variable can be specified via Gitlab web UI when scheduling a
> pipeline, but it can be also set when doing git push directly:
> 
>     git push -o ci.variable=SELECTED_JOBS_ONLY="/job1|job2/"
> 
> More details at https://docs.gitlab.co.jp/ee/user/project/push_options.html
> 
> The variable needs to include regex for selecting jobs, including
> enclosing slashes.
> A coma/space separated list of jobs to select would be friendlier UX,
> but unfortunately that is not supported:
> https://gitlab.com/gitlab-org/gitlab/-/issues/209904 (note the proposed
> workaround doesn't work for job-level CI_JOB_NAME).
> On the other hand, the regex is more flexible (one can select for
> example all arm32 jobs).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

While I am not super happy about this (it is not your fault, it is due
to the limitations of the Gitlab YAML languange) and I don't think I
would use SELECTED_JOBS_ONLY probably, if you find it useful maybe
others will too. It is not a big maintenance burden. So:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
> - include variable in Web UI for starting pipeline
> ---
>  .gitlab-ci.yml                  |  2 ++
>  automation/gitlab-ci/build.yaml |  6 ++++++
>  automation/gitlab-ci/test.yaml  | 14 ++++++++++++++
>  3 files changed, 22 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 5a9b8b722838..b3beb2ff9ddf 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,5 +1,7 @@
>  variables:
>    XEN_REGISTRY: registry.gitlab.com/xen-project/xen
> +  SELECTED_JOBS_ONLY:
> +    description: "Regex to select only some jobs, must be enclosed with /. For example /job1|job2/"
>  
>  workflow:
>    rules:
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 35e224366f62..f12de00a164a 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -12,6 +12,12 @@
>        - '*/*.log'
>      when: always
>    needs: []
> +  rules:
> +  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +    when: always
> +  - if: $SELECTED_JOBS_ONLY
> +    when: never
> +  - when: on_success
>  
>  .gcc-tmpl:
>    variables: &gcc
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index c21a37933881..93632f1f9204 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -1,6 +1,11 @@
>  .test-jobs-common:
>    stage: test
>    image: ${XEN_REGISTRY}/${CONTAINER}
> +  rules:
> +  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +  - if: $SELECTED_JOBS_ONLY
> +    when: never
> +  - when: on_success
>  
>  .arm64-test-needs: &arm64-test-needs
>    - alpine-3.18-arm64-rootfs-export
> @@ -99,6 +104,9 @@
>        - '*.dtb'
>      when: always
>    rules:
> +    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +    - if: $SELECTED_JOBS_ONLY
> +      when: never
>      - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
>    tags:
>      - xilinx
> @@ -117,6 +125,9 @@
>        - '*.log'
>      when: always
>    rules:
> +    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +    - if: $SELECTED_JOBS_ONLY
> +      when: never
>      - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
>    tags:
>      - xilinx
> @@ -137,6 +148,9 @@
>        - '*.log'
>      when: always
>    rules:
> +    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +    - if: $SELECTED_JOBS_ONLY
> +      when: never
>      - if: $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
>    tags:
>      - qubes-hw2
> -- 
> git-series 0.9.1
> 
--8323329-1452106152-1740018896=:1791669--

