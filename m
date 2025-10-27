Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E1BC121ED
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 00:59:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151913.1482462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDX71-0001tS-Mu; Mon, 27 Oct 2025 23:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151913.1482462; Mon, 27 Oct 2025 23:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDX71-0001rQ-JX; Mon, 27 Oct 2025 23:58:55 +0000
Received: by outflank-mailman (input) for mailman id 1151913;
 Mon, 27 Oct 2025 23:58:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vtjv=5E=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vDX70-0001pi-E2
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 23:58:54 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e283a63e-b390-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 00:58:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B1630602C3;
 Mon, 27 Oct 2025 23:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E3FC4CEF1;
 Mon, 27 Oct 2025 23:58:48 +0000 (UTC)
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
X-Inumbo-ID: e283a63e-b390-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761609529;
	bh=bLRVN5rbxiu+Kcm/VnoPW5vJES0kSJkj6MY/gwy2PKQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aFOSouino3COvf9CCPiGDE7eK+trWQHhsO3U7UetstwC969xHu1OlHh/Q+WgSmBuW
	 lY+3edPJq8kNtHoDIasB6H0mzPkn0NH54sUiBDukIJ0UQV793VFCioBmeUrRKrVCgr
	 dz0sHXysUSwOs4NRWpajqb5PAphHxf+oZIDXuog3H63PSAU45KJ8Q9jAvBXGgDQZSi
	 z1veqmMs0VBnDnxDk/Fc2SnoRIU1XUbIipcbPA2ywBvd/sc9AuNkYx+Lsc3bgJ73cM
	 ho+z5nVNblt9srCs0dHFGm3+TxJizTRjaJx5HNIJNjx4SkwivierO7OT94FEYmyL4Q
	 x8emC1A3Z6EKQ==
Date: Mon, 27 Oct 2025 16:58:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>, 
    Victor Lira <victorm.lira@amd.com>
Subject: Re: [XEN PATCH v2] automation/eclair: add new analysis jobs with
 differing configurations
In-Reply-To: <1591f6a0c0f3524c4c613328293ed4e03cfc93ef.1761291003.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2510271656380.495094@ubuntu-linux-20-04-desktop>
References: <1591f6a0c0f3524c4c613328293ed4e03cfc93ef.1761291003.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Oct 2025, Nicola Vetrini wrote:
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

Do you have a link to a successful pipeline?

Just making sure we are not breaking things.


> ---
> Changes in v2:
> - rebased to current staging;
> - fixed regex path issue.
> ---
>  automation/gitlab-ci/analyze.yaml | 38 +++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index d50721006740..7bd644d75074 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -45,6 +45,21 @@ eclair-x86_64:
>      LOGFILE: "eclair-x86_64.log"
>      VARIANT: "X86_64"
>      RULESET: "monitored"
> +
> +eclair-x86_64-testing:
> +  extends: eclair-x86_64
> +  tags:
> +    - eclair-analysis-testing
> +  rules:
> +    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/bugseng.*$/
> +      when: always
> +    - !reference [.eclair-analysis:triggered, rules]

given that everyone can change this yaml file when pushing to their own
branch, I think we should remove this, or (probably better) use a
separate env variable to set the default

it is better not to use the path, I think


> +eclair-x86_64-safety:
> +  extends: eclair-x86_64
> +  tags:
> +    - eclair-analysis-safety
> +  variables:
>      EXTRA_XEN_CONFIG: |
>        CONFIG_AMD=y
>        CONFIG_INTEL=n
> @@ -75,6 +90,10 @@ eclair-x86_64:
>        CONFIG_DEBUG_LOCKS=n
>        CONFIG_SCRUB_DEBUG=n
>        CONFIG_XMEM_POOL_POISON=n
> +  rules:
> +    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ && $CI_COMMIT_BRANCH =~ /^staging$/
> +      when: always
> +    - !reference [.eclair-analysis:triggered, rules]

same here


>  eclair-ARM64:
>    extends: .eclair-analysis:triggered
> @@ -82,6 +101,21 @@ eclair-ARM64:
>      LOGFILE: "eclair-ARM64.log"
>      VARIANT: "ARM64"
>      RULESET: "monitored"
> +
> +eclair-ARM64-testing:
> +  extends: eclair-ARM64
> +  tags:
> +    - eclair-analysis-testing
> +  rules:
> +    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/bugseng.*$/
> +      when: always
> +    - !reference [.eclair-analysis:triggered, rules]

and here


> +eclair-ARM64-safety:
> +  extends: eclair-ARM64
> +  tags:
> +    - eclair-analysis-safety
> +  variables:
>      EXTRA_XEN_CONFIG: |
>        CONFIG_NR_CPUS=16
>        CONFIG_GICV2=n
> @@ -120,6 +154,10 @@ eclair-ARM64:
>        CONFIG_DEBUG_LOCKS=n
>        CONFIG_SCRUB_DEBUG=n
>        CONFIG_XMEM_POOL_POISON=n
> +  rules:
> +    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ && $CI_COMMIT_BRANCH =~ /^staging$/
> +      when: always
> +    - !reference [.eclair-analysis, rules]

and here

