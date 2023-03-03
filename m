Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543736AA088
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 21:23:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506198.779295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYBvS-0005ty-P9; Fri, 03 Mar 2023 20:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506198.779295; Fri, 03 Mar 2023 20:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYBvS-0005qh-Kw; Fri, 03 Mar 2023 20:22:46 +0000
Received: by outflank-mailman (input) for mailman id 506198;
 Fri, 03 Mar 2023 20:22:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVKH=63=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pYBvR-0005qZ-Dk
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 20:22:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26f2f91e-ba01-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 21:22:43 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 825EE618E1;
 Fri,  3 Mar 2023 20:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F99C433D2;
 Fri,  3 Mar 2023 20:22:41 +0000 (UTC)
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
X-Inumbo-ID: 26f2f91e-ba01-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677874961;
	bh=XYm6eICqAsSfKUW+3k84v0Vx/9iaK3BbymfLP+AGWDk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ES3FwiKPW4zXTJ1wXXYs/TEGaFRorUok4cM3zZ8amqBL7aBdMwoiQ03fJwxFPOkH5
	 eodpMToU18aHOnrTBTKd8E8+7V0em8Qveaic9y2mDjR+u8juizPZWct1cfNU0EPW5i
	 kN3A4RrZgYh8Muo+QqbvY3AWftIXvsVxNbhyO9/DzMrcEEgz/ilKD1idC0vW1iMFb9
	 bjR2s8OIWKyl8k3cGATuN//m+Sba8+kJVd3Efyj2tQnacE+LSo42WBoWYAADu+m9k4
	 lKKntHpWkubmZTy7pamClJl/5bTVE9bGhW894kZfwFXsBHgNRN3WYO9/ab1PzHPnc4
	 K5zyUmeGZ3VgA==
Date: Fri, 3 Mar 2023 12:22:39 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation: Use --no-install-recommends and -slim
 base for debian/unstable
In-Reply-To: <20230303165258.12577-1-anthony.perard@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2303031220360.863724@ubuntu-linux-20-04-desktop>
References: <20230303165258.12577-1-anthony.perard@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Mar 2023, Anthony PERARD wrote:
> Use "--no-install-recommends" to avoid installing many packages that
> aren't needed, many are *-doc packages. Also start using the -slim
> base image as they remove a few unused files/directories, like docs/.
> 
> Explicitly install "ca-certificates" as it is only recommended for
> "wget".
> Explicitly install "ocaml-findlib" as it is only recommended for
> "libfindlib-ocaml-dev".
> 
> Using "--no-install-recommends" saves about 600MB on the uncompress
> image. 2.89GB vs 2.3GB (value from `docker image list`).
> 
> Switching to -slim save about 130MB.
> 
> Overwall, we go from 2.89GB to 2.17GB.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Hi Anthony, I like this, thank you for doing this. I hate to be the guy
to ask "could you also..." but could you also do the same for the other
Debian Unstable containers? We have:

unstable-arm64v8-arm32-gcc.dockerfile
unstable-arm64v8.dockerfile
unstable-cppcheck.dockerfile
unstable.dockerfile
unstable-i386.dockerfile

I think it would be a good idea to be consistent and update them all?

Contact me privately if you need a native arm64 environment.



> ---
> 
> Notes:
>     Change to use "-slim" was proposed by Andy. I went futher and added
>     --no-install-recommends.
>     
>     I've tried to find other missing packages by looking at differences
>     in  "tools/config.log", "stubdom/config.log", "config/", and
>     "xen/.config".
>     
>     A test is in progress to check that no jobs are broken, but result
>     probably not before next week.
>         https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/795600920
>     
>     I've only tested gcc debug=n on x86_64 locally.
> 
>  automation/build/debian/unstable-i386.dockerfile | 6 ++++--
>  automation/build/debian/unstable.dockerfile      | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/automation/build/debian/unstable-i386.dockerfile b/automation/build/debian/unstable-i386.dockerfile
> index 1c4928b09e..cc116d32e9 100644
> --- a/automation/build/debian/unstable-i386.dockerfile
> +++ b/automation/build/debian/unstable-i386.dockerfile
> @@ -1,4 +1,4 @@
> -FROM i386/debian:unstable
> +FROM i386/debian:unstable-slim
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> @@ -12,7 +12,8 @@ ENTRYPOINT ["linux32"]
>  
>  # build depends
>  RUN apt-get update && \
> -    apt-get --quiet --yes install \
> +    apt-get --quiet --no-install-recommends --yes install \
> +        ca-certificates \
>          build-essential \
>          zlib1g-dev \
>          libncurses5-dev \
> @@ -35,6 +36,7 @@ RUN apt-get update && \
>          libc6-dev \
>          libnl-3-dev \
>          ocaml-nox \
> +        ocaml-findlib \
>          libfindlib-ocaml-dev \
>          markdown \
>          transfig \
> diff --git a/automation/build/debian/unstable.dockerfile b/automation/build/debian/unstable.dockerfile
> index 6ef2878200..06ac909a85 100644
> --- a/automation/build/debian/unstable.dockerfile
> +++ b/automation/build/debian/unstable.dockerfile
> @@ -1,4 +1,4 @@
> -FROM debian:unstable
> +FROM debian:unstable-slim
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> @@ -10,7 +10,8 @@ WORKDIR /build
>  
>  # build depends
>  RUN apt-get update && \
> -    apt-get --quiet --yes install \
> +    apt-get --quiet --no-install-recommends --yes install \
> +        ca-certificates \
>          build-essential \
>          zlib1g-dev \
>          libncurses5-dev \
> @@ -34,6 +35,7 @@ RUN apt-get update && \
>          libc6-dev-i386 \
>          libnl-3-dev \
>          ocaml-nox \
> +        ocaml-findlib \
>          libfindlib-ocaml-dev \
>          markdown \
>          transfig \
> -- 
> Anthony PERARD
> 

