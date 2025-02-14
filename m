Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D565A353C7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 02:37:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888305.1297699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tikdT-0000w5-UO; Fri, 14 Feb 2025 01:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888305.1297699; Fri, 14 Feb 2025 01:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tikdT-0000tG-Qj; Fri, 14 Feb 2025 01:36:55 +0000
Received: by outflank-mailman (input) for mailman id 888305;
 Fri, 14 Feb 2025 01:36:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83Ve=VF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tikdR-0000t8-Jj
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 01:36:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29be0594-ea74-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 02:36:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ABB495C4ABE;
 Fri, 14 Feb 2025 01:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DB9C4CED1;
 Fri, 14 Feb 2025 01:36:49 +0000 (UTC)
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
X-Inumbo-ID: 29be0594-ea74-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739497009;
	bh=yi1J/COoJ5gmUUmoSBYcfyOa6XcJNRCy03TLpIc8btA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jk4Dzc1nZxTU681W3TGKl5qhrN7hvqBHjMuNldHqSXIeKP59lRObX4m+CvS9jvAWx
	 ag5QCpvFY44Jzs6N08iIqZ5DvZbwrHNWNMIHuG0b74Ei9Hm3wZ3gPnmyRTVtiDr3NY
	 7UKjlLWVOscdABggwLpcJJmN4y8ThmWlbZ3bYKkaZYzv3iFzE/7cKrBNieryP6c9if
	 /vbcfAiOPP7WxRr/Sxo5WhCWXgf1JlnkGYyAGszAcW3H1fbbDroZG6FecqwKhEUMUe
	 45eNPizmCcgEpLfhZORSNDIqfnyd0qjTgxIgocKNnssTm2EhxEajT+DcJY/O39ZUk9
	 WIP35sYgCYzaA==
Date: Thu, 13 Feb 2025 17:36:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 3/3] automation: allow selecting individual jobs via
 CI variables
In-Reply-To: <90a256242870d1772bade171a7171d4e889f4e02.1739409822.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2502131727580.619090@ubuntu-linux-20-04-desktop>
References: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com> <90a256242870d1772bade171a7171d4e889f4e02.1739409822.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-34521494-1739497009=:619090"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-34521494-1739497009=:619090
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 13 Feb 2025, Marek Marczykowski-Górecki wrote:
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

I was trying to find workarounds so that we could also support the
simple list of comma-separated jobs you mentioned, but I couldn't find
an easy way to do that.

However, one thing we can do is to support writing SELECTED_JOBS_ONLY in
.gitlab-ci.yml as a commit in xen.git, for people that don't know or
don't remember how to set ci.variable using the git command line.

Given that this is for testing, I think it would be no problem to adding
a special commit on top of your tree. We are just trying to make it
easier compared to having to manually delete the list of jobs we don't
need.

But even with the special commit, I couldn't think of an easy way to
achieve the nicer comma-separated list of jobs...


> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> This probably wants documenting beyond this commit message. I don't
> think we have any CI-related docs anywhere, do we? Some new file in
> docs/misc?

Yes please :-)

It would be also worth documenting how to create a simple pipeline by
removing everything that you don't need for a single test


> And also, it's possible to extend web ui for starting pipelines to
> include pre-defined variables. I use it in qubes here if you want to
> see:
> https://gitlab.com/QubesOS/qubes-continuous-integration/-/pipelines/new

I don't have access to this


> Does it make sense to include SELECTED_JOBS_ONLY this way too?
> Personally, I'll probably use it via cmdline push only anyway, but I
> don't know what workflows other people have.
> ---
>  automation/gitlab-ci/build.yaml |  6 ++++++
>  automation/gitlab-ci/test.yaml  | 14 ++++++++++++++
>  2 files changed, 20 insertions(+)
> 
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
--8323329-34521494-1739497009=:619090--

