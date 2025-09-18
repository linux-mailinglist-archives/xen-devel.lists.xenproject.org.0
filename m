Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C18B86E21
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 22:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126634.1468136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzL7f-0006dM-Lv; Thu, 18 Sep 2025 20:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126634.1468136; Thu, 18 Sep 2025 20:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzL7f-0006b5-J2; Thu, 18 Sep 2025 20:20:55 +0000
Received: by outflank-mailman (input) for mailman id 1126634;
 Thu, 18 Sep 2025 20:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/FRX=35=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uzL7e-0006az-8J
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 20:20:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f96efdab-94cc-11f0-9d14-b5c5bf9af7f9;
 Thu, 18 Sep 2025 22:20:53 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 880164EEBC46;
 Thu, 18 Sep 2025 22:20:52 +0200 (CEST)
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
X-Inumbo-ID: f96efdab-94cc-11f0-9d14-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1758226852;
	b=vjpKQbaf3xGJ4eYygWmgWWIY3Cfj5ZUQ31+14WyvhLcIrFWZ1GtT3kOHoPUOUoEyKMuy
	 lFtji/ofr2hQhgEf5bgDYPgS7o+9adaxXUH25BomOQZ1HqDFNfnSe89Jx0D/535OQW0yO
	 OQa/7RkOSDG0crVzIgdRuJ007nvmn7v2fmBTZwscf8k5fzDuB4p+BCtWaraaUWK/5VDs2
	 Yk+45qB/apW6FgYEFo+TwKIzVUkFSfnAXo8y/mwayBKs+0lbmfWEtz0SNIdh8TC3nE2xE
	 S6uS/WV7iHknGUxqe5D4A4lbVTlu0YzjjvGrFlduX2V9ZqJ5MQlMypYFFTgVqDpqDZnw6
	 6dwkj2f+HYl3jlKS1IRF99luQWhvI0mwsDHxoOPMytkuqf6CUnGzAMJWNnh6vj/ibHcIK
	 KeigVrG7UefiHk0XIRC9Q2na6+/zYRuCvsHQQbTrv0xFr4Gwr87wJOzYVb2MySgKHHsRD
	 0ZsYj+6Kiehif94A2NUWKCgzEf6Pk0CsF45e8g6nvrhKhF3EzqjUxM9cxO1HzdxGH3lg2
	 KgGRlI16P3P8mngGOQLMqGQsNN1tadFVJDhLIp00xNbXPxr+s31OeZj2ukD3PoKSwg9P2
	 HLBbAMIx6XSZRqudG9mAn8PTmxA+GCHZkkhGs8qL/w0RZ6yHlpDvKa1d+wJGyCk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1758226852;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=24zUaynGRgP2C6h9wNbYiP2S+tmjDNyTWTI96tpvjXI=;
	b=vc32Y/QN9mnFkyoFXJE70fiL8rQ/MzBGu/7T61F8nZ8/EvUFN6AglBWirmRzShrxOPEZ
	 GLOJbF71vUZYvvpZLV0wbf0ZLf+3l6IXYyo+AaIGAjCMNuExx9KfV9YJNLwVn5hqY2OI5
	 t4EygkJbZEc7Z9chw7sI90s48QWbWxbhBY1CxOx1KmQSnU8hM2Acr1G76InsspnLXUVht
	 QIs5XvlHCm413BbOiTL6UEORBC1JtO7LkmOOF9S9q+bIpqzm5rz+yTRCOHIGbQOIUKjtQ
	 1jIgA97ZMGMNf4BgtNMcmzv7ae8bcVS93z1/2OJ/FqVt6uoFuQnCZ75I05qFq+pt/rqcR
	 f8RoDmIlWth17/Px5LrWBBf5Wnq+1xWvFzV9vrKBAuJ+BMR/DJC/lHRtg7wHqMNmSJpjH
	 feevp1xPjIrTILZenKYnFJgTDNm1xFk+jN/EVymBjp0PaqoP4NqpVy436JaOwIczo4f6a
	 voi0Eu1P0J9thJsibju/twA+e26BzvF5CgJc3VSczQTSAfs9s/CQGbKSRo03uLPwvxEe7
	 hwGleR4Fb8yfqagKFkdtejoGfCAXbBqu2wrafs3klJJbwaKSOe3CeeCC2z+xefIvRuZeL
	 SMe8IN9q8EDTpyAeflEuIGXGUZFVPDr8c0Hr6hrhH3STCdv5pAx94n2Stm8Lk8o=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1758226852; bh=6iIra69cuzKV3VJWr1RJqp2ftMdT2ygbviSgAOwwgEI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NrNpXRuHSVbhi7tVk3H2UX+FPADPefL+Lyc0SamHPBMqNS70m8ElQOMPujffbLg4C
	 sAC9ce9QZuGoYeoN9Fk+aTIOoHO84LzU+OmoYrwonMllK6POsPabrnOJuZxhjWBq3H
	 jLKUCwZvfRq2AV/wX+kt9EgaqKmCoyDlrbbP0Yc6K9KtE3n9DfOrlIlLJKjRvG0DlF
	 zWpQ0hKxt9GElbRHho05xaDrG83loJ8I8X+JgPFM7vEp67zTGsK8KeQwblPaJa+wCA
	 YNMGDSp2GZfceKTuVyPaF5FVDo8aPQVxnDl3pULSIoLEtvHNmKUWviQC+lI9Jen25Q
	 0X9rC5VESMwwA==
MIME-Version: 1.0
Date: Thu, 18 Sep 2025 22:20:52 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: victorm.lira@amd.com
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3r?=
 =?UTF-8?Q?ecki?= <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: edit pipeline to prevent running
 non-selected jobs
In-Reply-To: <1437334569e10b76d1d7dc4e9fca7c25606855fb.1756862843.git.victorm.lira@amd.com>
References: <1437334569e10b76d1d7dc4e9fca7c25606855fb.1756862843.git.victorm.lira@amd.com>
Message-ID: <bdd5b8e3711fed45325fe87bd2f68566@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-09-03 03:49, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> Filtering jobs using the selected jobs regex is missing for
> qemu-export/yocto- jobs when running regular pipelines and eclair jobs
> when running scheduled pipelines.
> 
> Add the missing rules to filter out those jobs, and set a default value
> for the selected jobs regex to remove the need to always check if the
> variable is empty.
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com> # ECLAIR

If this goes in before [1] (which is likely), then I should rebase 
because it will probably conflict

[1] 
https://lore.kernel.org/xen-devel/d4a0924c84e78b3f677b0d987c2f8e4b3f6b80a5.1758226234.git.nicola.vetrini@bugseng.com/T/#u

> ---
> example of the problem:
>   - 
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2018353899
>   - SELECTED_JOBS_ONLY=/alpine-3.18-gcc$/ should produce 1 job only
> note:
>   - I tested only on sstabellini but the logic should work for 
> hardware/staging
>     too
> ---
> Cc: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Doug Goldstein <cardoe@cardoe.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>  .gitlab-ci.yml                    | 1 +
>  automation/gitlab-ci/analyze.yaml | 5 +++--
>  automation/gitlab-ci/build.yaml   | 9 ++++++---
>  3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 7974ac4e82..64bed300a6 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -2,6 +2,7 @@ variables:
>    XEN_REGISTRY: registry.gitlab.com/xen-project/xen
>    SELECTED_JOBS_ONLY:
>      description: "Regex to select only some jobs, must be enclosed 
> with /. For example /job1|job2/"
> +    value: "/.*/"
> 
>  workflow:
>    name: "$CI_PIPELINE_SCHEDULE_DESCRIPTION"
> diff --git a/automation/gitlab-ci/analyze.yaml 
> b/automation/gitlab-ci/analyze.yaml
> index d507210067..1f58e13cb2 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -31,8 +31,7 @@
>    rules:
>      - if: $CI_PIPELINE_SOURCE == "schedule"
>        when: never
> -    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> -    - if: $SELECTED_JOBS_ONLY
> +    - if: $CI_JOB_NAME !~ $SELECTED_JOBS_ONLY
>        when: never
>      - if: $WTOKEN && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
>        when: manual
> @@ -126,6 +125,8 @@ eclair-ARM64:
>    rules:
>      - if: $CI_PIPELINE_SOURCE != "schedule"
>        when: never
> +    - if: $CI_JOB_NAME !~ $SELECTED_JOBS_ONLY
> +      when: never
>      - !reference [.eclair-analysis, rules]
> 
>  eclair-x86_64:on-schedule:
> diff --git a/automation/gitlab-ci/build.yaml 
> b/automation/gitlab-ci/build.yaml
> index ab5211f77e..b2f96c1fe0 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -226,6 +226,9 @@
>        - binaries/
>      when: always
>    needs: []
> +  rules:
> +    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +      when: manual
> 
>  .yocto-test-arm64:
>    extends: .yocto-test
> @@ -261,6 +264,9 @@
>  .test-jobs-artifact-common:
>    stage: build
>    needs: []
> +  rules:
> +    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +      when: on_success
> 
>  # Arm test artifacts
> 
> @@ -468,20 +474,17 @@ yocto-qemuarm64:
>    extends: .yocto-test-arm64
>    variables:
>      YOCTO_BOARD: qemuarm64
> -  when: manual
> 
>  yocto-qemuarm:
>    extends: .yocto-test-arm64
>    variables:
>      YOCTO_BOARD: qemuarm
>      YOCTO_OUTPUT: --copy-output
> -  when: manual
> 
>  yocto-qemux86-64:
>    extends: .yocto-test-x86-64
>    variables:
>      YOCTO_BOARD: qemux86-64
> -  when: manual
> 
>  # Cppcheck analysis jobs
> 
> --
> 2.50.GIT

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

