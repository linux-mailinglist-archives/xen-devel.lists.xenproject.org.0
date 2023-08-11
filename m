Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A885779A5E
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 00:05:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582665.912537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUaFa-0007lp-Nv; Fri, 11 Aug 2023 22:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582665.912537; Fri, 11 Aug 2023 22:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUaFa-0007js-Kc; Fri, 11 Aug 2023 22:04:54 +0000
Received: by outflank-mailman (input) for mailman id 582665;
 Fri, 11 Aug 2023 22:04:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUaFY-0007Sc-VF
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 22:04:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1846b6be-3893-11ee-b284-6b7b168915f2;
 Sat, 12 Aug 2023 00:04:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12F8A64C8A;
 Fri, 11 Aug 2023 22:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA7DC433C8;
 Fri, 11 Aug 2023 22:04:49 +0000 (UTC)
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
X-Inumbo-ID: 1846b6be-3893-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691791490;
	bh=bLCAfJvP9mbQIvGa6SU8Jr2lfBt1FeAFsoePBpGC25Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OnsvrYQoEnzfUld5GLRR0j2uxoHCft2wUQ0IOFkXj7YsJ5rVMZR6ED2VGlMsG9Snu
	 p0j4piVP94ismYKmaqZlvboXXvp939Lwj2LMi4k0EIFfX2cz9lshx5w855S5N2Y1L5
	 kw35wKQTsp/mS8Mst0QYMxQBzMRH8a3t/rEbWYksy+Ly6QYnEjlzQyA/OXuJVu2C/0
	 jRDF/57i+9vh9SFuUpUjQ8dVkkpQQYDTOSG8dcvkbTddMgNMYGERMtbYplHeYWmlNX
	 p8VXvyq8ggnBT/oWpxCXG92bzTPUJCoamXP4VA9ln2iPn2TGwZhKolpAld1maeh3+8
	 f2AP+Uo+oN61w==
Date: Fri, 11 Aug 2023 15:04:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    andrew.cooper3@citrix.com, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/2] automation/eclair: avoid unintentional ECLAIR
 analysis
In-Reply-To: <57bc71b428d439f933cdbb0b88a36b39bc77e45e.1691760935.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308111502540.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691760935.git.simone.ballarin@bugseng.com> <57bc71b428d439f933cdbb0b88a36b39bc77e45e.1691760935.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Aug 2023, Simone Ballarin wrote:
> With this patch, ECLAIR jobs will need to be manually
> started for "people/.*" pipelines.
> 
> This avoids occupying the runner on analyzes that might
> not be used by developers.
> 
> If developers want to analyze their own repositories
> they need to launch them from GitLab.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  automation/gitlab-ci/analyze.yaml | 14 ++++++++++----
>  automation/gitlab-ci/build.yaml   |  6 ------
>  automation/gitlab-ci/test.yaml    |  5 -----
>  3 files changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index 4aa4abe2ee..f04ff99093 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -20,21 +20,27 @@
>        codequality: gl-code-quality-report.json
>    needs: []
>  
> -eclair-x86_64:
> +.eclair-analysis:triggered:
>    extends: .eclair-analysis
> +  allow_failure: true
> +  rules:
> +    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
> +      when: manual
> +    - when: always
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

Everything so far looks great and I am ready to Ack.


> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 173613567c..e4b601943c 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -12,11 +12,6 @@
>        - '*/*.log'
>      when: always
>    needs: []
> -  except:
> -    - master
> -    - smoke
> -    - /^coverity-tested\/.*/
> -    - /^stable-.*/
>  
>  .gcc-tmpl:
>    variables: &gcc
> @@ -269,7 +264,6 @@
>  .test-jobs-artifact-common:
>    stage: build
>    needs: []
> -  except: !reference [.test-jobs-common, except]
>  
>  # Arm test artifacts
>  
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 8ccce1fe26..11cb97ea4b 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -1,11 +1,6 @@
>  .test-jobs-common:
>    stage: test
>    image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> -  except:
> -    - master
> -    - smoke
> -    - /^coverity-tested\/.*/
> -    - /^stable-.*/
>  
>  .arm64-test-needs: &arm64-test-needs
>    - alpine-3.18-arm64-rootfs-export

These changes instead belongs to the first patch, right?

