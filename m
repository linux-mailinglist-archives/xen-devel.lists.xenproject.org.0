Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F4CCB17D5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 01:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182375.1505257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT84s-0005Uk-8p; Wed, 10 Dec 2025 00:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182375.1505257; Wed, 10 Dec 2025 00:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT84s-0005TI-5z; Wed, 10 Dec 2025 00:29:10 +0000
Received: by outflank-mailman (input) for mailman id 1182375;
 Wed, 10 Dec 2025 00:29:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT84r-0005TC-6z
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 00:29:09 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ce3678a-d55f-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 01:29:07 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2774060173;
 Wed, 10 Dec 2025 00:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C829C19421;
 Wed, 10 Dec 2025 00:29:04 +0000 (UTC)
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
X-Inumbo-ID: 3ce3678a-d55f-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765326545;
	bh=ihZA4sxPC0kjsQSkhbkYSuN3J5dVRoWntDLSXxogXs0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cw4g4beBSAu6OeCojHUKJPOdf8Zs5Z9ZqkN2weuGRWM/UZi58nbX8Xs4YpBSseQA9
	 XsL8SGZk862CTvsUMhglPD0C/9fDmFTNcHXbc9KJGueM7MnhpTRs1SduP9wVgVuk+0
	 5sY1/OAPF02QS73Ff1QjrEPB4eXDjBB1gHHlmCU3+h0//fQAqPSTnazjiyLYvlOk9m
	 iBPyCRxtdYpLBZh7vdXAFW4C68rlqc8EzbEXa3+Vm2OpxoqQeKIeVU465Jlal/MC9H
	 8IsmNxhT/81adCvBNwdDZwHJ0920/BLy4hGxF4HBxUjHRphvps08ohJ47mOu3r2eB/
	 QGHMTkWSI3I+A==
Date: Tue, 9 Dec 2025 16:29:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 07/12] Support building arbitrary Linux
 branch/tag/commit
In-Reply-To: <c7579b953d400d368f171e4dd56e1b7f879e386f.1764866136.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2512091625190.19429@ubuntu-linux-20-04-desktop>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com> <c7579b953d400d368f171e4dd56e1b7f879e386f.1764866136.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1554293381-1765326545=:19429"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1554293381-1765326545=:19429
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 4 Dec 2025, Marek Marczykowski-Górecki wrote:
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

The problem is not LINUX_GIT_URL and LINUX_GIT_VERSION, those are good
names. The issue is ...

> ---
>  .gitlab-ci.yml         | 22 ++++++++++++++++++++++
>  scripts/build-linux.sh | 18 +++++++++++++-----
>  2 files changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 184d0b3..8d1deee 100644
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
> @@ -53,6 +57,15 @@ linux-6.6.86-arm64:
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
> @@ -91,6 +104,15 @@ linux-6.12.60-x86_64:
>    variables:
>      LINUX_VERSION: 6.12.60
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

... the issue is detecting to fetch via git or via curl based on the
presence of a variable called "LINUX_URL". Technically 

https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"${LINUX_VERSION}".tar.xz

is a a valid URL as well.

So I think you should keep LINUX_GIT_URL and LINUX_GIT_VERSION named as
they are, expose them to scripts/build-linux.sh, and detect the fetch
program based on the presence of LINUX_GIT_URL.

Ideally, we should not have LINUX_GIT_VERSION. Instead we should have a
a common LINUX_VERSION used in both git and curl cases.


>  make defconfig
>  ./scripts/config --enable BRIDGE
> -- 
> git-series 0.9.1
> 
--8323329-1554293381-1765326545=:19429--

