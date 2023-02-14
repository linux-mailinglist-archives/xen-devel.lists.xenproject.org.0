Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3206971B5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 00:20:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495600.765951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4aZ-0002cp-EA; Tue, 14 Feb 2023 23:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495600.765951; Tue, 14 Feb 2023 23:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4aZ-0002ay-BO; Tue, 14 Feb 2023 23:19:55 +0000
Received: by outflank-mailman (input) for mailman id 495600;
 Tue, 14 Feb 2023 23:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHuR=6K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pS4aY-0002aq-Eq
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 23:19:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10577463-acbe-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 00:19:51 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E829B6194D;
 Tue, 14 Feb 2023 23:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84322C433D2;
 Tue, 14 Feb 2023 23:19:40 +0000 (UTC)
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
X-Inumbo-ID: 10577463-acbe-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676416781;
	bh=Mp62uhTPJWNACpVdBtbuSRreZI0BhK90COKIax8rGiA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qkOO67MnJmuBxGKAh0fE+vlpj/W9+Solll4cZn463ijZYeOevcs8wpMwYBk73Exqr
	 zq9dslcL9cf3Bw6o1EgZfkVOrwo3d9hpgSMnc+lc88HMMR3UTNs1G4rRpKGji8xZDM
	 w016kRz7yJYa6iKjRAOY504PnoeS2Zva2QbWuyyde/OC/Qs1dukNngcvBH80lzs7gm
	 GIFEQvD/WrTpxIGzTNxlmeRyV1qU9+bQSWB8r4VhgFjyu4xXwjdq3JywdMj1LnwBLs
	 daOD5i8MnKMXj9uB9jKx5QqkBvggzqOX2Uev3Tl1ZKJv9X4Lw7Xluk1WuKhHi89ZFT
	 iIsrgBwbRoYhw==
Date: Tue, 14 Feb 2023 15:19:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com
Subject: Re: [PATCH v2 1/5] automation: Switch arm32 cross builds to run on
 arm64
In-Reply-To: <20230214153842.15637-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302141519270.2025117@ubuntu-linux-20-04-desktop>
References: <20230214153842.15637-1-michal.orzel@amd.com> <20230214153842.15637-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Feb 2023, Michal Orzel wrote:
> Due to the limited x86 CI resources slowing down the whole pipeline,
> switch the arm32 cross builds to be executed on arm64 which is much more
> capable. For that, rename the existing debian container dockerfile
> from unstable-arm32-gcc to unstable-arm64v8-arm32-gcc and use
> arm64v8/debian:unstable as an image. Note, that we cannot use the same
> container name as we have to keep the backwards compatibility.
> Take the opportunity to remove extra empty line at the end of a file.
> 
> Modify the tag of .arm32-cross-build-tmpl to arm64 and update the build
> jobs accordingly.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - new patch
> 
> For convenience and own testing, I built and pushed the new container
> to registry.

Thanks!


> ---
>  ...ockerfile => unstable-arm64v8-arm32-gcc.dockerfile} |  3 +--
>  automation/gitlab-ci/build.yaml                        | 10 +++++-----
>  2 files changed, 6 insertions(+), 7 deletions(-)
>  rename automation/build/debian/{unstable-arm32-gcc.dockerfile => unstable-arm64v8-arm32-gcc.dockerfile} (94%)
> 
> diff --git a/automation/build/debian/unstable-arm32-gcc.dockerfile b/automation/build/debian/unstable-arm64v8-arm32-gcc.dockerfile
> similarity index 94%
> rename from automation/build/debian/unstable-arm32-gcc.dockerfile
> rename to automation/build/debian/unstable-arm64v8-arm32-gcc.dockerfile
> index b41a57f19729..11860425a6a2 100644
> --- a/automation/build/debian/unstable-arm32-gcc.dockerfile
> +++ b/automation/build/debian/unstable-arm64v8-arm32-gcc.dockerfile
> @@ -1,4 +1,4 @@
> -FROM debian:unstable
> +FROM arm64v8/debian:unstable
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> @@ -21,4 +21,3 @@ RUN apt-get update && \
>          apt-get autoremove -y && \
>          apt-get clean && \
>          rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> -
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index a053c5c7325d..f8e156e0a994 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -123,7 +123,7 @@
>    variables:
>      XEN_TARGET_ARCH: arm32
>    tags:
> -    - x86_64
> +    - arm64
>  
>  .arm32-cross-build:
>    extends: .arm32-cross-build-tmpl
> @@ -542,26 +542,26 @@ alpine-3.12-clang-debug:
>  debian-unstable-gcc-arm32:
>    extends: .gcc-arm32-cross-build
>    variables:
> -    CONTAINER: debian:unstable-arm32-gcc
> +    CONTAINER: debian:unstable-arm64v8-arm32-gcc
>      HYPERVISOR_ONLY: y
>  
>  debian-unstable-gcc-arm32-debug:
>    extends: .gcc-arm32-cross-build-debug
>    variables:
> -    CONTAINER: debian:unstable-arm32-gcc
> +    CONTAINER: debian:unstable-arm64v8-arm32-gcc
>      HYPERVISOR_ONLY: y
>  
>  debian-unstable-gcc-arm32-randconfig:
>    extends: .gcc-arm32-cross-build
>    variables:
> -    CONTAINER: debian:unstable-arm32-gcc
> +    CONTAINER: debian:unstable-arm64v8-arm32-gcc
>      HYPERVISOR_ONLY: y
>      RANDCONFIG: y
>  
>  debian-unstable-gcc-arm32-debug-randconfig:
>    extends: .gcc-arm32-cross-build-debug
>    variables:
> -    CONTAINER: debian:unstable-arm32-gcc
> +    CONTAINER: debian:unstable-arm64v8-arm32-gcc
>      HYPERVISOR_ONLY: y
>      RANDCONFIG: y
>  
> -- 
> 2.25.1
> 

