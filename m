Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE1A84C17B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 01:47:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677197.1053642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXW5o-0007yn-1P; Wed, 07 Feb 2024 00:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677197.1053642; Wed, 07 Feb 2024 00:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXW5n-0007xE-UL; Wed, 07 Feb 2024 00:47:11 +0000
Received: by outflank-mailman (input) for mailman id 677197;
 Wed, 07 Feb 2024 00:47:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aVye=JQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rXW5m-0007x8-9p
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 00:47:10 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b693504-c552-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 01:47:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 48962CE1774;
 Wed,  7 Feb 2024 00:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E45C433F1;
 Wed,  7 Feb 2024 00:46:59 +0000 (UTC)
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
X-Inumbo-ID: 6b693504-c552-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707266820;
	bh=/R57MmC0z3d2YbVpLZQ+paJCglOOu9H5nf/rYdJyaBU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NeCHMnsgGf8Nyf6VUi3Qb01HkToHjYnps+HyP9VJsV3pM3Xyj8jyE1wyx1rJNhLj0
	 VD3Msop8d3W+WiGDXWarpXJO9L09c9BkdJaj/aYvfJhUu2hXp83P15qBmBY+oDaUmU
	 ABz6q3/sZVN9bQ/5wk+eVh/ekJbexaJLzDQItqcjg14a3dzhu+BE1rZodBNhdWFBlJ
	 eSXyLKHDCOVcR/6z3Y2dECYo1TgghAQEM4AWdJrF4MjbErZ68Ds+smBrsxJ49YCSvE
	 UIwWYaUI3bweBNMc4/l5u7kQXboXau3yDgGUsLj6pv31ps1+5+nSQtLkXNg7S6AlYS
	 qJ4sDgtxRD+wQ==
Date: Tue, 6 Feb 2024 16:46:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com
Subject: Re: [PATCH] automation: Switch yocto-qemux86-64 job to run on x86
In-Reply-To: <20240206152012.51107-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2402061646480.1925432@ubuntu-linux-20-04-desktop>
References: <20240206152012.51107-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Feb 2024, Michal Orzel wrote:
> At the moment, all Yocto jobs run on Arm64 runners. To address CI
> capacity issues, move yocto-qemux86-64 job to x86. Reflect the change in
> the makefile generating Yocto docker files and fix CONTAINER name
> definition that incorrectly expects YOCTO_HOST variable to be set for x86
> container as well, which does not have a platform name appended.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> I built and pushed a new container to registry.
> Pipeline:
> https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/1166227598
> ---
>  automation/build/yocto/yocto.inc |  6 ++++--
>  automation/gitlab-ci/build.yaml  | 10 +++-------
>  2 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/automation/build/yocto/yocto.inc b/automation/build/yocto/yocto.inc
> index e4328ec7f378..2f3b1a5b2a34 100644
> --- a/automation/build/yocto/yocto.inc
> +++ b/automation/build/yocto/yocto.inc
> @@ -18,11 +18,13 @@ YOCTO_TARGETS = qemuarm64 qemuarm qemux86-64
>  YOCTO_ARCHS = amd64 arm64v8
>  
>  # Architecture we want to use in gitlab CI (depends on runners arch).
> -CI_ARCH = arm64v8
> +CI_ARCH-qemuarm64 = arm64v8
> +CI_ARCH-qemuarm = arm64v8
> +CI_ARCH-qemux86-64 = amd64
>  
>  define GEN_DOCKER
>  # Make all is generating architecture we use in the CI.
> -ifeq ($(CI_ARCH),$(3))
> +ifeq ($(CI_ARCH-$(2)),$(3))
>  CONTAINERS += yocto/$(1)-$(2)$(4)
>  else
>  CONTAINERS_EXTRA += yocto/$(1)-$(2)$(4)
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 32af30ccedc9..6d2cb18b8883 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -213,7 +213,7 @@
>      - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD} ${YOCTO_OUTPUT}
>    variables:
>      YOCTO_VERSION: kirkstone
> -    CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}-${YOCTO_HOST}
> +    CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}${YOCTO_HOST}
>    artifacts:
>      paths:
>        - 'logs/*'
> @@ -224,16 +224,12 @@
>  .yocto-test-arm64:
>    extends: .yocto-test
>    variables:
> -    YOCTO_HOST: arm64v8
> +    YOCTO_HOST: -arm64v8
>    tags:
>      - arm64
>  
> -# This is not used by any test job as we only run Yocto on arm based machines.
> -# Keep it here so that someone having x86 hardware can easily add jobs.
>  .yocto-test-x86-64:
>    extends: .yocto-test
> -  variables:
> -    YOCTO_HOST: amd64
>    tags:
>      - x86_64
>  
> @@ -576,7 +572,7 @@ yocto-qemuarm:
>      YOCTO_OUTPUT: --copy-output
>  
>  yocto-qemux86-64:
> -  extends: .yocto-test-arm64
> +  extends: .yocto-test-x86-64
>    variables:
>      YOCTO_BOARD: qemux86-64
>  
> -- 
> 2.25.1
> 

