Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051AE6C8742
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 22:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514454.796701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfocu-0004mB-4i; Fri, 24 Mar 2023 21:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514454.796701; Fri, 24 Mar 2023 21:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfocu-0004jY-1j; Fri, 24 Mar 2023 21:07:08 +0000
Received: by outflank-mailman (input) for mailman id 514454;
 Fri, 24 Mar 2023 21:07:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WRj=7Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pfocr-0004j3-Os
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 21:07:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d361a54f-ca87-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 22:07:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D76862CAD;
 Fri, 24 Mar 2023 21:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36EEC433D2;
 Fri, 24 Mar 2023 21:07:01 +0000 (UTC)
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
X-Inumbo-ID: d361a54f-ca87-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679692022;
	bh=zmAlsq15QDe38bGa1IAxDtMrEqNP8JRjAhO8DknmTaE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r7R4mmaFV7iI2IIK2xuH0RKyGiPsDt2xr8FS9w3XwzGdGpkwvyCi1iNF4I2IFEBys
	 KOJDKkYmhhFkCuNx7YUPkY62WxlBjznv7cj6OUKE75GqShX9Pdvm4W+YE8mJife4NU
	 5OlQ1r/PZaF4Vsu4xY+ZMo25OfUGCF9ZGEMgMA2KN/juS40cjGftSazIWS/lUwtjbk
	 HD3JgQDPjztaOjgATZOY1NmYRDPZVq2c50zjFQsNXSMih98PNOAKbrOemHBy/NDDtZ
	 51v3dn7pEiLAX+SxyLjTNQh+vLFdBC9RR5nI54JFTJ8dtVTWEE39gSCKR/eKWsA/c6
	 1KBH/cpquOzqQ==
Date: Fri, 24 Mar 2023 14:07:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] CI: Remove llvm-8 from the Debian Stretch container
In-Reply-To: <20230324200654.3245297-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2303241405020.4066@ubuntu-linux-20-04-desktop>
References: <20230324200654.3245297-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Mar 2023, Andrew Cooper wrote:
> For similar reasons to c/s a6b1e2b80fe20.  While this container is still
> build-able, all the other problems with explicitly-versioned compilers remain.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> 
> This will require backporting to older trees, but there's already a list it
> can be added too.
> ---
>  automation/build/debian/stretch-llvm-8.list |  3 ---
>  automation/build/debian/stretch.dockerfile  | 12 ---------
>  automation/gitlab-ci/build.yaml             | 27 ---------------------
>  3 files changed, 42 deletions(-)
>  delete mode 100644 automation/build/debian/stretch-llvm-8.list
> 
> diff --git a/automation/build/debian/stretch-llvm-8.list b/automation/build/debian/stretch-llvm-8.list
> deleted file mode 100644
> index 590001ca81e8..000000000000
> --- a/automation/build/debian/stretch-llvm-8.list
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Strech LLVM 8 repos
> -deb https://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
> -deb-src https://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
> diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
> index 2c086b197cba..1af6c691f8f4 100644
> --- a/automation/build/debian/stretch.dockerfile
> +++ b/automation/build/debian/stretch.dockerfile
> @@ -54,15 +54,3 @@ RUN apt-get update && \
>          apt-get autoremove -y && \
>          apt-get clean && \
>          rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> -
> -RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
> -COPY stretch-llvm-8.list /etc/apt/sources.list.d/
> -
> -RUN apt-get update && \
> -    apt-get --quiet --yes install \
> -        clang-8 \
> -        lld-8 \
> -        && \
> -        apt-get autoremove -y && \
> -        apt-get clean && \
> -        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 820cc0af83bd..3547aa419097 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -28,13 +28,6 @@
>      CXX: clang++
>      clang: y
>  
> -.clang-8-tmpl:
> -  variables: &clang-8
> -    CC: clang-8
> -    CXX: clang++-8
> -    LD: ld.lld-8
> -    clang: y
> -
>  .x86-64-build-tmpl:
>    <<: *build
>    variables:
> @@ -99,16 +92,6 @@
>    variables:
>      <<: *clang
>  
> -.clang-8-x86-64-build:
> -  extends: .x86-64-build
> -  variables:
> -    <<: *clang-8
> -
> -.clang-8-x86-64-build-debug:
> -  extends: .x86-64-build-debug
> -  variables:
> -    <<: *clang-8
> -
>  .clang-x86-32-build:
>    extends: .x86-32-build
>    variables:
> @@ -285,16 +268,6 @@ debian-stretch-clang-debug:
>    variables:
>      CONTAINER: debian:stretch
>  
> -debian-stretch-clang-8:
> -  extends: .clang-8-x86-64-build
> -  variables:
> -    CONTAINER: debian:stretch
> -
> -debian-stretch-clang-8-debug:
> -  extends: .clang-8-x86-64-build-debug
> -  variables:
> -    CONTAINER: debian:stretch
> -
>  debian-stretch-gcc:
>    extends: .gcc-x86-64-build
>    variables:
> -- 
> 2.30.2
> 

