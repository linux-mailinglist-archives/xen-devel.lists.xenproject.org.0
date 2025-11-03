Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA825C2E538
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 23:54:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155561.1485022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vG3Q0-0003fA-Ii; Mon, 03 Nov 2025 22:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155561.1485022; Mon, 03 Nov 2025 22:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vG3Q0-0003cY-Fa; Mon, 03 Nov 2025 22:52:56 +0000
Received: by outflank-mailman (input) for mailman id 1155561;
 Mon, 03 Nov 2025 22:52:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZcN9=5L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vG3Py-0003cR-QL
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 22:52:54 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d224cb5e-b907-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 23:52:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 301AD41A91;
 Mon,  3 Nov 2025 22:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F33AC4CEE7;
 Mon,  3 Nov 2025 22:52:47 +0000 (UTC)
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
X-Inumbo-ID: d224cb5e-b907-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762210368;
	bh=1zFMlAkxdP/FaogxlZKIBJSzDh5MzEvApxvRlOZ46TY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JGY7m6fdEbdsD7XJSyOhGWAzK01Lsg8ekRY5mlPd6iE96iRSeyNY42jK0cjUlQiaW
	 r1r2mqMCYvFcGCplDNav2Io8dfBPRmBcyj+6Pra++WhsfW9TV1ijldkSyL43S3YaU5
	 9iS3GGEGtUAU9RlaDnRCR9nYvOJUGsvKuVGpGsNc0+2+SOquw8opzCntJNdwHeiVLC
	 59W0W3EMRw5pN2Iwp8eN35LNaW3EA1Om+KjIiAG3YZNqLXbacMCXuAcm6jS9xqjUQO
	 fXuPDZc+fTw/ln77SmKz6TP70Nt81vLEjz+uEj3fjUZ0RdZ9zaSTkY9Ta2z0R0Uj/p
	 eVUz0tUMUJ9dQ==
Date: Mon, 3 Nov 2025 14:52:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v4] automation/eclair: add new analysis jobs with
 differing configurations
In-Reply-To: <6244858973ae88195405630b4a6847085ffce638.1762198392.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2511031448530.495094@ubuntu-linux-20-04-desktop>
References: <6244858973ae88195405630b4a6847085ffce638.1762198392.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Nov 2025, Nicola Vetrini wrote:
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I'll commit it as soon as the tree reopens.


> ---
> CI pipeline: https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2136967775
> 
> Note: the eclair-ARM64 and eclair-x86_64 jobs are allowed to fail because the
> configuration is not (yet) clean for all checked MISRA guidelines.
> 
> Changes in v4:
> - Do not allow *-safety jobs to fail, as they should be clean
> - Drop check on CI_COMMIT_BRANCH for *-safety analyses
> Changes in v3:
> - Use a variable instead of testing the repository PATH to decide whether a job
>   should be run for *-testing and *-safety analyses;
> - Allow eclair-{x86_64,ARM64} default configurations to fail, as the configuration
>   is not yet clean for MISRA.
> Changes in v2:
> - rebased to current staging;
> - fixed regex path issue.
> ---
>  automation/gitlab-ci/analyze.yaml | 42 +++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index d50721006740..d22d1dbbc3de 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -45,6 +45,23 @@ eclair-x86_64:
>      LOGFILE: "eclair-x86_64.log"
>      VARIANT: "X86_64"
>      RULESET: "monitored"
> +  allow_failure: true
> +
> +eclair-x86_64-testing:
> +  extends: eclair-x86_64
> +  tags:
> +    - eclair-analysis-testing
> +  rules:
> +    - if: $ECLAIR_TESTING
> +      when: always
> +    - !reference [.eclair-analysis:triggered, rules]
> +
> +eclair-x86_64-safety:
> +  extends: eclair-x86_64
> +  tags:
> +    - eclair-analysis-safety
> +  allow_failure: false
> +  variables:
>      EXTRA_XEN_CONFIG: |
>        CONFIG_AMD=y
>        CONFIG_INTEL=n
> @@ -75,6 +92,10 @@ eclair-x86_64:
>        CONFIG_DEBUG_LOCKS=n
>        CONFIG_SCRUB_DEBUG=n
>        CONFIG_XMEM_POOL_POISON=n
> +  rules:
> +    - if: $ECLAIR_SAFETY
> +      when: always
> +    - !reference [.eclair-analysis:triggered, rules]
>  
>  eclair-ARM64:
>    extends: .eclair-analysis:triggered
> @@ -82,6 +103,23 @@ eclair-ARM64:
>      LOGFILE: "eclair-ARM64.log"
>      VARIANT: "ARM64"
>      RULESET: "monitored"
> +  allow_failure: true
> +
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
> +  allow_failure: false
> +  variables:
>      EXTRA_XEN_CONFIG: |
>        CONFIG_NR_CPUS=16
>        CONFIG_GICV2=n
> @@ -120,6 +158,10 @@ eclair-ARM64:
>        CONFIG_DEBUG_LOCKS=n
>        CONFIG_SCRUB_DEBUG=n
>        CONFIG_XMEM_POOL_POISON=n
> +  rules:
> +    - if: $ECLAIR_SAFETY
> +      when: always
> +    - !reference [.eclair-analysis, rules]
>  
>  .eclair-analysis:on-schedule:
>    extends: .eclair-analysis
> -- 
> 2.43.0
> 

