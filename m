Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFCC65CB4A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 02:15:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470826.730463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsNW-0003sO-PW; Wed, 04 Jan 2023 01:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470826.730463; Wed, 04 Jan 2023 01:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsNW-0003qB-Ms; Wed, 04 Jan 2023 01:15:38 +0000
Received: by outflank-mailman (input) for mailman id 470826;
 Wed, 04 Jan 2023 01:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMRm=5B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pCsNW-0003q5-0I
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 01:15:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4af041a3-8bcd-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 02:15:36 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B777D6152B;
 Wed,  4 Jan 2023 01:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2DDC433D2;
 Wed,  4 Jan 2023 01:15:34 +0000 (UTC)
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
X-Inumbo-ID: 4af041a3-8bcd-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672794935;
	bh=pSP+FWoGi3j9xVpx2Q3vxu2qFJqevFkECabRvGMIwXE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Nd1uLcSPDGKBsZxT370TxN3yzQoJgYOWyk6vqou7q8EP9q9c9jLz9XR0qpZm/9EqB
	 ItRfa3flimSMn/Bj8hnoEus25CUaZQ0lLXYUAkYWBWv9iVnRf92Ck3hS/GCSNqFGZz
	 tGFYR2hDPrl/LHa38nGteNmOvY6r1kDf0JEm2eye/EM/bIqUTKVaM08BAIjy7m8ySk
	 9XWczzTQihkECO72RHEKUv84hHNwgynGMpKoIegVm2J5EnKDJNjjrSlDpPx0xrqqFA
	 qhCvdHxMP1LtdEVubYKkoJQNTIK4bCEs1UzNe90ZinCaN4IWj8iMsrwizhd9giUitS
	 5EEmxcRx/TF/A==
Date: Tue, 3 Jan 2023 17:15:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 4/6] CI: Express HYPERVISOR_ONLY in build.yml
In-Reply-To: <20221230003848.3241-5-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2301031713530.4079@ubuntu-linux-20-04-desktop>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com> <20221230003848.3241-5-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Fri, 30 Dec 2022, Andrew Cooper wrote:

> Whether to build only Xen, or everything, is a property of container,
> toolchain and/or testcase.  It is not a property of XEN_TARGET_ARCH.
> 
> Capitalise HYPERVISOR_ONLY and have it set by the debian-unstable-gcc-arm32-*
> testcases at the point that arm32 get matched with a container that can only
> build Xen.
> 
> For simplicity, retain the RANDCONFIG -> HYPERVISOR_ONLY implication.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  automation/gitlab-ci/build.yaml |  2 ++
>  automation/scripts/build        | 11 ++++-------
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 93d9ff69a9f2..e6a9357de3ef 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -516,11 +516,13 @@ debian-unstable-gcc-arm32:
>    extends: .gcc-arm32-cross-build
>    variables:
>      CONTAINER: debian:unstable-arm32-gcc
> +    HYPERVISOR_ONLY: y
>  
>  debian-unstable-gcc-arm32-debug:
>    extends: .gcc-arm32-cross-build-debug
>    variables:
>      CONTAINER: debian:unstable-arm32-gcc
> +    HYPERVISOR_ONLY: y

can you move the setting of HYPERVISOR_ONLY to .arm32-cross-build-tmpl ?

I think that makes the most sense because .arm32-cross-build-tmpl is the
one setting XEN_TARGET_ARCH and also the x86_64 tag.

>  
>  debian-unstable-gcc-arm32-randconfig:
>    extends: .gcc-arm32-cross-build
> diff --git a/automation/scripts/build b/automation/scripts/build
> index f2301d08789d..4c6d1f3b70bc 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -19,7 +19,9 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
>      fi
>  
>      make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
> -    hypervisor_only="y"
> +
> +    # RANDCONFIG implies HYPERVISOR_ONLY
> +    HYPERVISOR_ONLY="y"
>  else
>      echo "CONFIG_DEBUG=${debug}" > xen/.config
>  
> @@ -34,15 +36,10 @@ fi
>  # to exit early -- bash is invoked with -e.
>  cp xen/.config xen-config
>  
> -# arm32 only cross-compiles the hypervisor
> -if [[ "${XEN_TARGET_ARCH}" = "arm32" ]]; then
> -    hypervisor_only="y"
> -fi
> -
>  # Directory for the artefacts to be dumped into
>  mkdir binaries
>  
> -if [[ "${hypervisor_only}" == "y" ]]; then
> +if [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
>      # Xen-only build
>      make -j$(nproc) xen
>  
> -- 
> 2.11.0
> 

