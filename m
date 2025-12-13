Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8016CBA639
	for <lists+xen-devel@lfdr.de>; Sat, 13 Dec 2025 07:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186158.1507986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUJSR-0001XN-Mi; Sat, 13 Dec 2025 06:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186158.1507986; Sat, 13 Dec 2025 06:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUJSR-0001V9-H2; Sat, 13 Dec 2025 06:50:23 +0000
Received: by outflank-mailman (input) for mailman id 1186158;
 Sat, 13 Dec 2025 06:50:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/lp=6T=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vUJSP-0001V3-M0
 for xen-devel@lists.xenproject.org; Sat, 13 Dec 2025 06:50:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd6e601f-d7ef-11f0-b15b-2bf370ae4941;
 Sat, 13 Dec 2025 07:50:20 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 275454EEBFCB;
 Sat, 13 Dec 2025 07:50:19 +0100 (CET)
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
X-Inumbo-ID: fd6e601f-d7ef-11f0-b15b-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765608619;
	b=Mq8/saNTi5ZQ0TnuA1dxDNy19HFA8gUqH01wGZe8LH2P3f4Mbd7hgIIz9XkGXPIrDs4h
	 qoQurCCztGf2lpmQru/Qi/jGGuYwTIO8Xe6rmf32qiOHDQcs4/uZ2qdd01lv0i9tiCqFW
	 g0YoxV3ZnyG1lkgAv8ZEqyPTbv9gu4+7qDT+G2e8t/38DJWhyA2bF4xvU1/yB2NCmByXn
	 11JiZzGsPh6sv9mc8Fq/wuhwi/zvE0QwUjLAQ4x2O4/AF6ndDhoajuz+iJR/3gf9id9zg
	 hKIrFnVBm2H4Y2/u7j/E8CWUVEwaWKF1WdGHUGMTtcd+9pwcSUYJwMeRTzSIaVYXaZZp9
	 iNDR7X8ZMzvREKaQMRvHM79+5d9PGRopi6EGlQw0yX5NqOMo0wXOTVFpZvJlPGoDjDy+U
	 oTTv2s+kx9ojAvqD9OPP8a2tJ+BAlHyoG6Q1xRsIHrSzMcLcF9onY88Qpij2Dz2ikIMu/
	 JsWLE6TmnN4jjjtR7Sca1W4febt7hYvJ+NMOPhUknyYeD27woauR1wdBKS6d5EohDSqJK
	 TaCbGKysuUVHVcVZJl27evy1UJ3GdEvVavF4cOszR5WKZYWPcG5lqWdnDlewD1pG6NKYd
	 +sHl14pJ3gj/5pL4kYQwBCYknEEdCFiJOmybkysGdcB4b/MuiVPsdjx9It19qy0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765608619;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=xUSZZ9ZWr3mxeEuducDwLLd7vdvK4q2XQsMO9gasaTc=;
	b=3+MKi/tT9DLOEviP6jAb5k8Syu380TA5KFhZtq0iLloaqqUtxPshYHrDlBa3F/P0JSn3
	 EMf25i6/nG4lgOgWhuHpn22rKdcC7d1ko6Ye1+c7lya05ZHjlhF6Ma6anxxCQBSdDVUHL
	 GGXYMyvjdvR2j19xhZhGB84sKwVsW67c4KS5lVZy2k/ZdqixNLHKQVSU8ZHsqffvPV4ay
	 iGRvMm9gMJZn4LM+GhqohkV5Wse5tmPVjUaZM5lXWjPvxFp1ufBEnpuu1saD/rAbhItGw
	 RQR5GxIQnTNllDmnBW/aUNC4ZpJuEfMoGApVN5XYLkpBNerNVyazva0xa+ierKd9Zv21v
	 bBKXjJCyEj+PTca+YvaZqweYWolxpKEaqDqq2Wst7ZEBvT4vBqOjSTSK1RF6BlNaFx4n2
	 84GtEPNZKgQlCDa7iRdxGF+ew5SmgkIn6slxIpV/IaRufaaZezulft/Zc9+MLqTXxxhfh
	 3HZPsYzIcbnBrE96EqNcTt4U10dPgMEL5ucDSGbQYm3t5Grw5ljwufJUjgJGQICqhI3gZ
	 tWVk5WrlVYfLQKLJczepevOgvUN7SeGTzjQDqyavpkJdnY+98Ox6PyXoZIjQobJtlISoX
	 PCi1sDvJv0n0JHCw+5QoAU8kFm7Q7e3hwOQjUzECU+3RefczAO4fNt19Mi8/ND4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765608619; bh=7aKcHDBa7WodqsMDmzVcBkCWc/TgihyyAthJJBbrFGE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jC54wA6211TOMYIBRwctckn82HSDMk1xRvEhNuAp+wuoQCXeTUuImSbmIItxRO4gv
	 wpyUp9oqjHT3epJMze7fQMkZT3WcIXNIyZN8nq9iM36hZ92jQQMtMyYbOoBX35+Nih
	 LDzF0/xmhbRaSSfRya2bfZIluAbtc2xZAQm6xZVH3OfTdLAsRV8KM54RyNT1vVDfjz
	 xpY4YjZSQILABeOnXMLjxf5uAWeZPml6V75lxJJReKkQ45+VLuD4gbmj6g4djd6VBh
	 pnG2izK4qwq5RcB/DqiqUjoiXkAfWcVSK3ZS9OvVHBpP99g7SowB6LLEld6G7ZmhyU
	 CWUrl9OFzMAyQ==
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 07:50:19 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Victor Lira <victorm.lira@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v1] automation: edit pipeline to fix hardware jobs
 running by mistake
In-Reply-To: <20251213013028.1382461-1-victorm.lira@amd.com>
References: <20251212235727.1377099-1-victorm.lira@amd.com>
 <20251213013028.1382461-1-victorm.lira@amd.com>
Message-ID: <7cfe8502c0d32bfc8f167694f182e738@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-12-13 02:30, Victor Lira wrote:
> The selected jobs regex was assumed to be possibly empty in some places
> and setting a default value for the regex caused the hardware jobs to
> bypass some rules checks.
> 
> To fix this, adjust the rules to remove the check for empty and
> instead just match the regex.
> 
> Fixes: 485ab1b5db0f358625fafe2df4e41e3ef008aed8

nit: the format should be
Fixes: 485ab1b5db0f ("automation: edit pipeline to prevent running 
non-selected jobs")

> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> ---
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2212446508
> https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2212446409
> ---
>  automation/gitlab-ci/build.yaml |  7 ++-----
>  automation/gitlab-ci/test.yaml  | 27 +++++++++++----------------
>  2 files changed, 13 insertions(+), 21 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build.yaml 
> b/automation/gitlab-ci/build.yaml
> index f7e032320a..a6fc55c2d5 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -13,11 +13,8 @@
>      when: always
>    needs: []
>    rules:
> -  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> -    when: always
> -  - if: $SELECTED_JOBS_ONLY
> -    when: never
> -  - when: on_success
> +    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +      when: on_success
> 
>  .gcc-tmpl:
>    variables: &gcc
> diff --git a/automation/gitlab-ci/test.yaml 
> b/automation/gitlab-ci/test.yaml
> index 8d8f62c8d0..338fc99a8a 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -2,10 +2,8 @@
>    stage: test
>    image: ${XEN_REGISTRY}/${CONTAINER}
>    rules:
> -  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> -  - if: $SELECTED_JOBS_ONLY
> -    when: never
> -  - when: on_success
> +  - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +    when: on_success
> 
>  .arm64-test-needs: &arm64-test-needs
>    - project: xen-project/hardware/test-artifacts
> @@ -113,10 +111,9 @@
>        - '*.dtb'
>      when: always
>    rules:
> -    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> -    - if: $SELECTED_JOBS_ONLY
> -      when: never
> -    - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> +    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY && $XILINX_JOBS == 
> "true"
> +          && $CI_COMMIT_REF_PROTECTED == "true"
> +      when: on_success
>    tags:
>      - xilinx
> 
> @@ -134,10 +131,9 @@
>        - '*.log'
>      when: always
>    rules:
> -    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> -    - if: $SELECTED_JOBS_ONLY
> -      when: never
> -    - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> +    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY && $XILINX_JOBS == 
> "true"
> +          && $CI_COMMIT_REF_PROTECTED == "true"
> +      when: on_success
>    tags:
>      - xilinx
> 
> @@ -157,10 +153,9 @@
>        - '*.log'
>      when: always
>    rules:
> -    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> -    - if: $SELECTED_JOBS_ONLY
> -      when: never
> -    - if: $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> +    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY && $QUBES_JOBS == "true"
> +          && $CI_COMMIT_REF_PROTECTED == "true"
> +      when: on_success
>    tags:
>      - qubes-hw2
> 
> --
> 2.51.GIT

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

