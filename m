Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DED2B2B5C
	for <lists+xen-devel@lfdr.de>; Sat, 14 Nov 2020 05:57:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27138.55914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdnbg-0004h9-RS; Sat, 14 Nov 2020 04:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27138.55914; Sat, 14 Nov 2020 04:56:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdnbg-0004gk-OR; Sat, 14 Nov 2020 04:56:12 +0000
Received: by outflank-mailman (input) for mailman id 27138;
 Sat, 14 Nov 2020 04:56:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8rVh=EU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kdnbf-0004gf-8x
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2020 04:56:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9a4e1fb-6557-4ad7-ab24-4ea6afe4634f;
 Sat, 14 Nov 2020 04:56:09 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 058CB22268;
 Sat, 14 Nov 2020 04:56:08 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8rVh=EU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kdnbf-0004gf-8x
	for xen-devel@lists.xenproject.org; Sat, 14 Nov 2020 04:56:11 +0000
X-Inumbo-ID: a9a4e1fb-6557-4ad7-ab24-4ea6afe4634f
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a9a4e1fb-6557-4ad7-ab24-4ea6afe4634f;
	Sat, 14 Nov 2020 04:56:09 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 058CB22268;
	Sat, 14 Nov 2020 04:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605329769;
	bh=M3SzRyp9ttQ5m7Z+LkhnkL+t/2ZTv5BNnrFf5elF36Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eSPOWAmq4vpFK16tBVYLK1bCIEji2HAP6Z7/P7LtBxo6qjdJkvb0kTsiTgDxrCxlf
	 weQiZ7bKIoyPBYwM5YF/wp7Dr+yZdfYq/ve91tlS76mkzLmsbpPF45P+nTLU/26ReC
	 MeTb+ykDGELw/oHA4PlpOt9ulg6tDdKYuGao30no=
Date: Fri, 13 Nov 2020 20:56:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: andrew.cooper3@citrix.com, cardoe@cardoe.com, wl@xen.org, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 1/2] automation: add a QEMU aarch64 smoke test
In-Reply-To: <20201114021203.24558-1-sstabellini@kernel.org>
Message-ID: <alpine.DEB.2.21.2011131946550.20906@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011131751380.20906@sstabellini-ThinkPad-T480s> <20201114021203.24558-1-sstabellini@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Nov 2020, Stefano Stabellini wrote:
> Use QEMU to start Xen (just the hypervisor) up until it stops because
> there is no dom0 kernel to boot.
> 
> It is based on the existing build job unstable-arm64v8.
> 
> Also use make -j$(nproc) to build Xen.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>  automation/gitlab-ci/test.yaml         | 22 ++++++++++++++++++
>  automation/scripts/build               |  8 +++----
>  automation/scripts/qemu-smoke-arm64.sh | 32 ++++++++++++++++++++++++++
>  3 files changed, 57 insertions(+), 5 deletions(-)
>  create mode 100755 automation/scripts/qemu-smoke-arm64.sh
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 793feafe8b..35346e3f6e 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -22,6 +22,28 @@ build-each-commit-gcc:
>      - /^coverity-tested\/.*/
>      - /^stable-.*/
>  
> +qemu-smoke-arm64-gcc:
> +  stage: test
> +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> +  dependencies:
> +    - debian-unstable-gcc-arm64
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +  except:
> +    - master
> +    - smoke
> +    - /^coverity-tested\/.*/
> +    - /^stable-.*/
> +
>  qemu-smoke-x86-64-gcc:
>    stage: test
>    image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 0cd0f3971d..95ad23eadb 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -10,9 +10,9 @@ cc-ver()
>  
>  # random config or default config
>  if [[ "${RANDCONFIG}" == "y" ]]; then
> -    make -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
> +    make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
>  else
> -    make -C xen defconfig
> +    make -j$(nproc) -C xen defconfig
>  fi
>  
>  # build up our configure options
> @@ -45,9 +45,7 @@ make -j$(nproc) dist
>  # Extract artifacts to avoid getting rewritten by customised builds
>  cp xen/.config xen-config
>  mkdir binaries
> -if [[ "${XEN_TARGET_ARCH}" == "x86_64" ]]; then
> -    cp xen/xen binaries/xen
> -fi
> +cp xen/xen binaries/xen

This was a mistake, it should have been:

if [[ "${XEN_TARGET_ARCH}" != "x86_32" ]]; then
    cp xen/xen binaries/xen
fi


Unrelated: should we temporarely disable the stubdom build
(--disable-stubdom) in the gitlab build? (Even better if somebody
volunteers to fix the stubdom build somehow.) At the moment a bunch of
jobs are failing with:

mini-os.c: In function 'main':
mini-os.c:756: warning: cast from pointer to integer of different size
ar: creating /builds/xen-project/people/sstabellini/xen/stubdom/mini-os-x86_64-xenstorepvh/arch/x86/libx86_64.a
/builds/xen-project/people/sstabellini/xen/stubdom/mini-os-x86_64-xenstorepvh/mini-os.o: could not read symbols: File in wrong format
make[2]: *** [/builds/xen-project/people/sstabellini/xen/stubdom/mini-os-x86_64-xenstorepvh/mini-os] Error 1
make[1]: *** [xenstorepvh-stubdom] Error 2
make[1]: *** Waiting for unfinished jobs....


With the above x86_32 fix, stubdoms disabled, all jobs (including the
new aarch64 smoke test) complete successfully.

