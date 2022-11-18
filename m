Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3B16304E7
	for <lists+xen-devel@lfdr.de>; Sat, 19 Nov 2022 00:49:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445941.701380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owB6I-0005SW-EG; Fri, 18 Nov 2022 23:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445941.701380; Fri, 18 Nov 2022 23:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owB6I-0005QI-AS; Fri, 18 Nov 2022 23:48:50 +0000
Received: by outflank-mailman (input) for mailman id 445941;
 Fri, 18 Nov 2022 23:48:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJKL=3S=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1owB6G-0005QC-S9
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 23:48:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8aa3a015-679b-11ed-91b6-6bf2151ebd3b;
 Sat, 19 Nov 2022 00:48:47 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAF9D62806;
 Fri, 18 Nov 2022 23:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36FAC433C1;
 Fri, 18 Nov 2022 23:48:44 +0000 (UTC)
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
X-Inumbo-ID: 8aa3a015-679b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668815325;
	bh=9n32t82Y0NAtD3tzNxkHbijTeGRFdYs5YlcqqnTWVwA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VgJ6CPqauvdpcIHKy7kM465rbHjbL0ae06BaPLFC2RJNeoAxve3g0uNAB2SC6pGC5
	 +x4gEpTyVm9kpILxgVZRvPXOTx4DYWS2sglBDNvgA94+jAn3Zy8iMkDE9hibOoVfGt
	 ez6A/9bP4XEinAC7Vhghqg+q0Qrp3BcnTBGOeYg47OenNUzW2AFgiUXnU/h+m2yrDf
	 XMz1QZkT/mAQeCIC6J8ZvuTDN6xFNIEuqWOuycCDF3y+2/fGoaBoi5GXlYOv/QbRJo
	 j/tj//aXl/yWZ7hDIKYf+bF+Bub3hgDvMwxToN25ePqRWwtdSROtyjn+yMjPh32Yx1
	 ng38BK5eO1JQg==
Date: Fri, 18 Nov 2022 15:48:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] automation: Install packages required by tests in
 containers
In-Reply-To: <20221117161643.3351-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2211181548350.1049131@ubuntu-linux-20-04-desktop>
References: <20221117161643.3351-1-michal.orzel@amd.com> <20221117161643.3351-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Nov 2022, Michal Orzel wrote:
> Installation of additional packages from the test scripts when running
> the tests has some drawbacks. It is slower than cloning containers and can
> fail due to some network issues (apparently it often happens on x86
> rackspace). This patch is adding the packages required by the tests to be
> installed when building the containers.
> 
> >From qemu-alpine-x86_64.sh into debian:stretch:
>  - cpio,
>  - busybox-static.
> 
> >From qemu-smoke-*-{arm,arm64}.sh into debian:unstable-arm64v8:
>  - u-boot-qemu,
>  - u-boot-tools,
>  - device-tree-compiler,
>  - curl,
>  - cpio,
>  - busybox-static.
> 
> The follow-up patch will remove installation of these packages from the
> test scripts. This is done in order not to break the CI in-between.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/build/debian/stretch.dockerfile          | 3 +++
>  automation/build/debian/unstable-arm64v8.dockerfile | 7 +++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
> index da6aa874dd70..30fcc5288dee 100644
> --- a/automation/build/debian/stretch.dockerfile
> +++ b/automation/build/debian/stretch.dockerfile
> @@ -49,6 +49,9 @@ RUN apt-get update && \
>          apt-transport-https \
>          # for test phase, qemu-smoke-* jobs
>          qemu-system-x86 \
> +        # for test phase, qemu-alpine-* jobs
> +        cpio \
> +        busybox-static \
>          && \
>          apt-get autoremove -y && \
>          apt-get clean && \
> diff --git a/automation/build/debian/unstable-arm64v8.dockerfile b/automation/build/debian/unstable-arm64v8.dockerfile
> index 5c73458d9d19..0080c22ba21f 100644
> --- a/automation/build/debian/unstable-arm64v8.dockerfile
> +++ b/automation/build/debian/unstable-arm64v8.dockerfile
> @@ -43,6 +43,13 @@ RUN apt-get update && \
>          wget \
>          git \
>          nasm \
> +        # for test phase, qemu-smoke-* jobs
> +        u-boot-qemu \
> +        u-boot-tools \
> +        device-tree-compiler \
> +        curl \
> +        cpio \
> +        busybox-static \
>          && \
>          apt-get autoremove -y && \
>          apt-get clean && \
> -- 
> 2.25.1
> 

