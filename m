Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ACCAE4E6D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 23:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022783.1398637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uToHt-0002Yv-HP; Mon, 23 Jun 2025 21:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022783.1398637; Mon, 23 Jun 2025 21:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uToHt-0002XT-EP; Mon, 23 Jun 2025 21:01:09 +0000
Received: by outflank-mailman (input) for mailman id 1022783;
 Mon, 23 Jun 2025 21:01:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uToHr-0002Ul-Ig
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 21:01:07 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d1c7044-5075-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 23:01:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 40BB4A511AC;
 Mon, 23 Jun 2025 21:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C11FC4CEEA;
 Mon, 23 Jun 2025 21:01:03 +0000 (UTC)
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
X-Inumbo-ID: 2d1c7044-5075-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750712463;
	bh=TI5M1EWn92XiHs7vKyT+lgsIAD4kCP1khSAsNuRgyT4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M4nN/83eBeS4ibw/P60WSAbnc8fNn2GGIybaYADHG+78HwrPx6wsiPc7n8Z74V1tL
	 9bA9WNsrg6a8dEr8C/geJJq02gzyYl+tE4xr83e927pK2C4aMI47t0/qTc+v1gXZLZ
	 UM8Dh8Iw++4DJZTF4tVBXSbfi6C4MP99YRcsLNuM5FomhyoIvUrs+3wOer1qi1+d8U
	 id1jMaT1RPyxVnJzypu2rmMxQAhyqSnQa6klJlL6jBmFaDUYy+tvPBvAqYX8mVdjEm
	 P/q5QtKDt0NbBnftLoCeLM2tqqQXlp6aVsc0sz0qMdnFEMdp0lPNbOfu/S4miOclQ8
	 tCgbnt3QJ/47A==
Date: Mon, 23 Jun 2025 14:01:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v1 4/5] Support building arbitrary Linux
 branch/tag/commit
In-Reply-To: <7bd5b5d88d6229e5d85396ed18ac654a6f8a59ab.1750684376.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2506231351060.8066@ubuntu-linux-20-04-desktop>
References: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com> <7bd5b5d88d6229e5d85396ed18ac654a6f8a59ab.1750684376.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1126707912-1750711983=:8066"
Content-ID: <alpine.DEB.2.22.394.2506231359430.8066@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1126707912-1750711983=:8066
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2506231359431.8066@ubuntu-linux-20-04-desktop>

On Mon, 23 Jun 2025, Marek Marczykowski-Górecki wrote:
> If LINUX_URL is set, fetch LINUX_VERSION from there. Go with "git
> init" + "git fetch" instead of "git clone" to support any of
> branch/tag/commit.
> 
> This also defines optional linux-git-* jobs which will build the thing
> if LINUX_GIT_VERSION and LINUX_GIT_URL variables are provided for the
> pipeline.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> The script variable and job variable need to have different names, so a
> pipeline variable won't override it for all jobs. While LINUX_VERSION /
> LINUX_GIT_VERSION is IMO okay, I'm not very happy about LINUX_URL /
> LINUX_GIT_URL. Any better ideas?

I understand the usefulness of these two jobs for testing purposes (I
mean personal testing during development, not the CI-loop) and based on
that alone I would accept this.

However, I thought I would mention that for personal testing purposes
these 2 jobs don't actually need to be part of the master branch. The
person could add them to their own branch and git push.

That said, I am not opposed to having them in the tree for convenience.

I can also see you are using the two variables in your xen.git patch
series. Is that idea that it would allow for a much wider Linux versions
testing? If we are going to only test one version, this is not required.


> ---
>  .gitlab-ci.yml         | 22 ++++++++++++++++++++++
>  scripts/build-linux.sh | 18 +++++++++++++-----
>  2 files changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index ad44fb4..60af072 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,5 +1,9 @@
>  variables:
>    REGISTRY: registry.gitlab.com/xen-project/hardware/test-artifacts
> +  LINUX_GIT_VERSION:
> +    description: "branch/tag/commit for the linux-git jobs"
> +  LINUX_GIT_URL:
> +    description: "git url for the linux-git jobs"
>  
>  stages:
>    - build
> @@ -46,6 +50,15 @@ linux-6.6.86-arm64:
>    variables:
>      LINUX_VERSION: 6.6.86
>  
> +linux-git-arm64:
> +  extends: .arm64-artifacts
> +  script: ./scripts/build-linux.sh
> +  variables:
> +    LINUX_VERSION: $LINUX_GIT_VERSION
> +    LINUX_URL: $LINUX_GIT_URL
> +  rules:
> +  - if: $LINUX_GIT_VERSION && $LINUX_GIT_URL
> +
>  #
>  # x86_64 artifacts
>  #
> @@ -70,6 +83,15 @@ linux-6.12.34-x86_64:
>    variables:
>      LINUX_VERSION: 6.12.34
>  
> +linux-git-x86_64:
> +  extends: .x86_64-artifacts
> +  script: ./scripts/build-linux.sh
> +  variables:
> +    LINUX_VERSION: $LINUX_GIT_VERSION
> +    LINUX_URL: $LINUX_GIT_URL
> +  rules:
> +  - if: $LINUX_GIT_VERSION && $LINUX_GIT_URL
> +
>  microcode-x86:
>    extends: .x86_64-artifacts
>    script: ./scripts/x86-microcode.sh
> diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
> index cf0e744..1fc96d1 100755
> --- a/scripts/build-linux.sh
> +++ b/scripts/build-linux.sh
> @@ -12,11 +12,19 @@ COPYDIR="${WORKDIR}/binaries"
>  UNAME=$(uname -m)
>  
>  # Build Linux
> -MAJOR=${LINUX_VERSION%%.*}
> -curl -fsSLO \
> -    https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"${LINUX_VERSION}".tar.xz
> -tar xf linux-"${LINUX_VERSION}".tar.xz
> -cd linux-"${LINUX_VERSION}"
> +if [[ -n "${LINUX_URL}" ]]; then
> +    mkdir linux
> +    cd linux
> +    git init
> +    git fetch --depth=1 "${LINUX_URL}" "${LINUX_VERSION}"
> +    git checkout FETCH_HEAD
> +else
> +    MAJOR=${LINUX_VERSION%%.*}
> +    curl -fsSLO \
> +        https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"${LINUX_VERSION}".tar.xz
> +    tar xf linux-"${LINUX_VERSION}".tar.xz
> +    cd linux-"${LINUX_VERSION}"
> +fi
>  
>  make defconfig
>  ./scripts/config --enable BRIDGE
> -- 
> git-series 0.9.1
> 
--8323329-1126707912-1750711983=:8066--

