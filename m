Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC99CFBBA
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 01:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838524.1254541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC6lq-0007aM-Ko; Sat, 16 Nov 2024 00:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838524.1254541; Sat, 16 Nov 2024 00:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC6lq-0007YF-Hv; Sat, 16 Nov 2024 00:34:38 +0000
Received: by outflank-mailman (input) for mailman id 838524;
 Sat, 16 Nov 2024 00:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWrC=SL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tC6lp-0007XK-Lq
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 00:34:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ce9d7e6-a3b2-11ef-a0c7-8be0dac302b0;
 Sat, 16 Nov 2024 01:34:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 143C75C54E4;
 Sat, 16 Nov 2024 00:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E83C4CECF;
 Sat, 16 Nov 2024 00:34:32 +0000 (UTC)
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
X-Inumbo-ID: 8ce9d7e6-a3b2-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjhjZTlkN2U2LWEzYjItMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNzE3Mjc0LjY2MDAyLCJzZW5kZXIiOiJzc3RhYmVsbGluaUBrZXJuZWwub3JnIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731717273;
	bh=r8CvOltkRgEG59MeZ9H1Uugw6iuYvZVkXsyGMozi6y8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VqkjCmy98ywbO+u/eQh4gV9nvQIwALyi+QfU6jPwJCg5/aot0bl+bNl4dMQuGBhGu
	 KOn0IOgPhuCcSQtWekpp3Zs0FIT6jv0Z63moLdMRDWWNx3tCVYV159M+fF9M0PHt0i
	 Oa6IGrV1747RWnX29/ynAZYPI9k6DDS5HMQhU+iILIG4o3ltLQkkklT91obR9DEgTJ
	 FSyM93fHV8+wqUWhbN34UpawEvXBFi4GKCW1yA19DaFfGYJ9yPjjiV/sthHyG5t6mn
	 2wSZ0oNvKldcjBdAg22LiuU2r+0flIFtfia3ZUhytgEbGOq7zs3gkU3Q6U4nF+xAoE
	 uU+MyMVmTN/mQ==
Date: Fri, 15 Nov 2024 16:34:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/3] CI: Define XEN_REGISTRY variable
In-Reply-To: <20241115170739.48983-3-anthony.perard@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2411151629370.1160299@ubuntu-linux-20-04-desktop>
References: <20241115170739.48983-1-anthony.perard@vates.tech> <20241115170739.48983-3-anthony.perard@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Nov 2024, Anthony PERARD wrote:
> This allow to change the registry used for container in a single
> place, and could be controlled via other mean.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  .gitlab-ci.yml                  | 3 +++
>  automation/gitlab-ci/build.yaml | 4 ++--
>  automation/gitlab-ci/test.yaml  | 2 +-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index ef4484e09a..941e5822e8 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,3 +1,6 @@
> +variables:
> +  XEN_REGISTRY: registry.gitlab.com/xen-project/xen
> +
>  workflow:
>    rules:
>      - if: $CI_COMMIT_BRANCH =~ /^(master|smoke|^coverity-tested\/.*|stable-.*)$/
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index ce39b0ee21..1ca6764225 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -1,6 +1,6 @@
>  .build-tmpl: &build
>    stage: build
> -  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> +  image: ${XEN_REGISTRY}/${CONTAINER}
>    script:
>      - ./automation/scripts/build 2>&1 | tee build.log
>    artifacts:
> @@ -208,7 +208,7 @@
>  
>  .yocto-test:
>    stage: build
> -  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> +  image: ${XEN_REGISTRY}/${CONTAINER}
>    script:
>      - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD} ${YOCTO_OUTPUT}
>    variables:
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index ab5c8be0cd..1822e3ea5f 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -1,6 +1,6 @@
>  .test-jobs-common:
>    stage: test
> -  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> +  image: ${XEN_REGISTRY}/${CONTAINER}
>  
>  .arm64-test-needs: &arm64-test-needs
>    - alpine-3.18-arm64-rootfs-export
> -- 
> 
> 
> Anthony Perard | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 

