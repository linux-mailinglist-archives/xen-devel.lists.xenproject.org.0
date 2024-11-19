Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6DD9D3020
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 22:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840807.1256337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDW4E-0007oH-MR; Tue, 19 Nov 2024 21:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840807.1256337; Tue, 19 Nov 2024 21:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDW4E-0007mC-Ju; Tue, 19 Nov 2024 21:47:26 +0000
Received: by outflank-mailman (input) for mailman id 840807;
 Tue, 19 Nov 2024 21:47:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGE8=SO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tDW4D-0007m6-OW
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 21:47:25 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da25e93f-a6bf-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 22:47:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DABEDA42DCC;
 Tue, 19 Nov 2024 21:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D05AC4CED1;
 Tue, 19 Nov 2024 21:47:18 +0000 (UTC)
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
X-Inumbo-ID: da25e93f-a6bf-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6ImRhMjVlOTNmLWE2YmYtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDUyODQwLjkzNTkxMiwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732052839;
	bh=NvhvTrOQGhKWvo+EZTTdLqtDmik+1cDvTPHERAJKn6Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PIyP2McXG6jV+E9gms+bYS/qzlfsA+m9/YlHmTnS1hyHKyHhpkJWVj0J4fh+AbBMg
	 K7d0jQCOhfCU1MsiimML1P/k9AmFtVbhjP+sFG+WO+ch5Zohl5VsZrXcTwGQ07CV2K
	 3QMRdGTnBodGdJJH2Ar7as7OugZFSNQDaf/9+Q5h7sbXpGJKS1J589aQfOazAb1pE0
	 QUoBUN5THrfUwIl0fFMT9ZcOpKRMLMwKaV+0tbqcJLB93L8Co9cc6ItXCpm1r/MNMB
	 gZ/lxOymURJIlYbUp7l78hb4UMriS+XqJi/8P0NDxpxApnEisabX/ZI4VdaGXHf+QK
	 SkVqGpXmdUjvg==
Date: Tue, 19 Nov 2024 13:47:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 3/3] CI: New stage "containers" to rebuild some
 containers
In-Reply-To: <20241119101449.49747-4-anthony.perard@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2411191347100.1160299@ubuntu-linux-20-04-desktop>
References: <20241119101449.49747-1-anthony.perard@vates.tech> <20241119101449.49747-4-anthony.perard@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Nov 2024, Anthony PERARD wrote:
> Rebuild rolling release containers when XEN_CI_REBUILD_CONTAINERS is
> set. This is to be use with a scheduled pipeline.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Notes:
>     v2:
>     - remove the logic to test containers once rebuilt.
>     - only include the config with jobs for the "containers" stage wen
>       XEN_CI_REBUILD_CONTAINERS is set.
> 
>  .gitlab-ci.yml                       | 16 ++++++++++++---
>  automation/gitlab-ci/containers.yaml | 29 ++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 3 deletions(-)
>  create mode 100644 automation/gitlab-ci/containers.yaml
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 941e5822e8..5a9b8b7228 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -8,11 +8,21 @@ workflow:
>      - when: always
>  
>  stages:
> +  - containers
>    - analyze
>    - build
>    - test
>  
>  include:
> -  - 'automation/gitlab-ci/analyze.yaml'
> -  - 'automation/gitlab-ci/build.yaml'
> -  - 'automation/gitlab-ci/test.yaml'
> +  - local: 'automation/gitlab-ci/containers.yaml'
> +    rules:
> +      - if: $XEN_CI_REBUILD_CONTAINERS
> +  - local: 'automation/gitlab-ci/analyze.yaml'
> +    rules:
> +      - if: $XEN_CI_REBUILD_CONTAINERS == null
> +  - local: 'automation/gitlab-ci/build.yaml'
> +    rules:
> +      - if: $XEN_CI_REBUILD_CONTAINERS == null
> +  - local: 'automation/gitlab-ci/test.yaml'
> +    rules:
> +      - if: $XEN_CI_REBUILD_CONTAINERS == null
> diff --git a/automation/gitlab-ci/containers.yaml b/automation/gitlab-ci/containers.yaml
> new file mode 100644
> index 0000000000..25e8bdc34b
> --- /dev/null
> +++ b/automation/gitlab-ci/containers.yaml
> @@ -0,0 +1,29 @@
> +.container-build-tmpl:
> +  stage: containers
> +  image: docker:stable
> +  tags:
> +    - container-builder
> +  rules:
> +    - if: $XEN_CI_REBUILD_CONTAINERS
> +  services:
> +    - docker:dind
> +  before_script:
> +    - apk add make
> +    - docker info
> +    - docker login -u $CI_DEPLOY_USER -p $CI_DEPLOY_PASSWORD $CI_REGISTRY
> +  script:
> +    - make -C automation/build PUSH=1 REGISTRY=${XEN_REGISTRY} ${CONTAINER/:/\/}
> +  after_script:
> +    - docker logout
> +
> +container-archlinux-current:
> +  extends:
> +    - .container-build-tmpl
> +  variables:
> +    CONTAINER: "archlinux:current"
> +
> +container-opensuse-tumbleweed-x86_64:
> +  extends:
> +    - .container-build-tmpl
> +  variables:
> +    CONTAINER: "opensuse:tumbleweed-x86_64"
> -- 
> 
> 
> Anthony Perard | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 

