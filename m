Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95287797FA0
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 02:26:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597684.931933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qePK0-0001Fq-A3; Fri, 08 Sep 2023 00:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597684.931933; Fri, 08 Sep 2023 00:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qePK0-0001Dw-7L; Fri, 08 Sep 2023 00:26:04 +0000
Received: by outflank-mailman (input) for mailman id 597684;
 Fri, 08 Sep 2023 00:26:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmm/=EY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qePJz-0001Dq-47
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 00:26:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49628b90-4dde-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 02:26:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 216A0B81FDD;
 Fri,  8 Sep 2023 00:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CC5C433C7;
 Fri,  8 Sep 2023 00:25:57 +0000 (UTC)
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
X-Inumbo-ID: 49628b90-4dde-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694132758;
	bh=VDEv4mdKxdfNnslmCr8MwLQG5twiGXImznZZQUe5iGA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OR5j4YNJw5seoolJqh3nxsQ6RK7zWDxz+bpGuCVMOVAc22+0ogX14RYiLm+ZpKwFG
	 gyoONaKTml3R2nR0MHxoJkOtbhsG6+tNZBROth0ZuFzP7INpi0NL1DWncm2Br2Ia0b
	 c2BnX/CRbD8B1n5MwqiwKtoTUjpZAtFldoLiQyaqiM+Ov6o3c61hsKcn2LcgXIs4fK
	 5RJarmE0QDrI4E5ErZcqUDu9k4Kgi9izqtegqLOoTy9uKiyTDwzm8H0+Xu6Q4imXQe
	 C/T9BNUPAkznJzToWfBmLJzEvUedWIg3+q82BZKkZ+gjZdQwe/LeeVdhnSLWB1zdUA
	 5/A7TQnp6NNZw==
Date: Thu, 7 Sep 2023 17:25:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 3/3] automation/eclair: build docs/misra to address
 MISRA C:2012 Dir 4.1
In-Reply-To: <ade1b214fc0e3a59c007ae2cdff78dc33b614c64.1693558913.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309071723400.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693558913.git.nicola.vetrini@bugseng.com> <ade1b214fc0e3a59c007ae2cdff78dc33b614c64.1693558913.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Sep 2023, Nicola Vetrini wrote:
> The documentation pertaining Directive 4.1 is contained in docs/misra.
> The build script driving the analysis is amended to allow ECLAIR to
> analyze such file.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  automation/eclair_analysis/build.sh   | 11 ++++++++---
>  automation/eclair_analysis/prepare.sh |  5 +++--
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analysis/build.sh
> index ec087dd822fa..556ed698bf8b 100755
> --- a/automation/eclair_analysis/build.sh
> +++ b/automation/eclair_analysis/build.sh
> @@ -34,11 +34,16 @@ else
>  fi
>  
>  (
> -  cd xen
> -
>    make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
>         "CROSS_COMPILE=${CROSS_COMPILE}"         \
>         "CC=${CROSS_COMPILE}gcc-12"              \
>         "CXX=${CROSS_COMPILE}g++-12"             \
> -       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"
> +       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
> +       -C docs misra

I don't think you need all these options to generate docs and misra.
Probably it would be sufficient just make -C docs misra

However given that they are not harmful:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +  make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
> +       "CROSS_COMPILE=${CROSS_COMPILE}"         \
> +       "CC=${CROSS_COMPILE}gcc-12"              \
> +       "CXX=${CROSS_COMPILE}g++-12"             \
> +       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
> +			 -C xen
>  )
> diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
> index 275a1a3f517c..452e309b658b 100755
> --- a/automation/eclair_analysis/prepare.sh
> +++ b/automation/eclair_analysis/prepare.sh
> @@ -35,8 +35,9 @@ else
>  fi
>  
>  (
> -    cd xen
> -    cp "${CONFIG_FILE}" .config
> +    ./configure
> +    cp "${CONFIG_FILE}" xen/.config
>      make clean
> +    cd xen
>      make -f ${script_dir}/Makefile.prepare prepare
>  )
> -- 
> 2.34.1
> 

