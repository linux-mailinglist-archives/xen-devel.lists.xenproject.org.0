Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA4B784D61
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 01:34:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588793.920404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYatD-0006uP-3t; Tue, 22 Aug 2023 23:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588793.920404; Tue, 22 Aug 2023 23:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYatD-0006rv-0T; Tue, 22 Aug 2023 23:34:23 +0000
Received: by outflank-mailman (input) for mailman id 588793;
 Tue, 22 Aug 2023 23:34:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gk3p=EH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYatB-0006rp-Ac
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 23:34:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a4a1fe9-4144-11ee-8782-cb3800f73035;
 Wed, 23 Aug 2023 01:34:20 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B154463A52;
 Tue, 22 Aug 2023 23:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0326C433C7;
 Tue, 22 Aug 2023 23:34:16 +0000 (UTC)
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
X-Inumbo-ID: 6a4a1fe9-4144-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692747258;
	bh=eI3DM2SXl024x9UIB0LpBIHV2IXfh7qFJua/gY5uHbE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mx+4fXCydDJJuPV14CcDlUmv4nBib7X9m1qtEpe9nJLRiNWNGrxMg8PG+X8/scIvs
	 p6o37sJBZyQLZSuKi8dARY1V11jMLNyvnmuUFK6TlDxP0Cq1tUF0lCdal4R0B2xYJ6
	 QhTbKM7/LRZA6rq15s7wZm+7l3rYtGtvFkNjF9txcMxVbJ7HwSkcT+ygR50mWoS5x0
	 3cED19srgjVt32N2KxMSBVzc2K93SaWpz4tSPWzeZlHuY8Xn5MdfhyiJFSsZXhcPBo
	 RTEqI5qQXxsLSs0Rs4uqKt47UUDp1lBXwGZl3KiuVDxDFh6Firv61JBY0we6bolBha
	 UkIpVZsd6wzyg==
Date: Tue, 22 Aug 2023 16:34:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [RFC PATCH 3/3] automation/eclair: build docs/misra to address
 MISRA C:2012 Dir 4.1
In-Reply-To: <fc8a60f5224f4285f674c83c42cff5b3681c29cd.1692636338.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308221634090.6458@ubuntu-linux-20-04-desktop>
References: <cover.1692636338.git.nicola.vetrini@bugseng.com> <fc8a60f5224f4285f674c83c42cff5b3681c29cd.1692636338.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Aug 2023, Nicola Vetrini wrote:
> The documentation pertaining Directive 4.1 is contained in docs/misra.
> The build script driving the analysis is amended to allow ECLAIR to
> find it and thus resolving violations of the directive.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/build.sh   | 10 ++++++++--
>  automation/eclair_analysis/prepare.sh |  1 +
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analysis/build.sh
> index ec087dd822fa..a0433eedeb4d 100755
> --- a/automation/eclair_analysis/build.sh
> +++ b/automation/eclair_analysis/build.sh
> @@ -34,8 +34,14 @@ else
>  fi
>  
>  (
> -  cd xen
> -
> +  cd docs
> +  make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
> +       "CROSS_COMPILE=${CROSS_COMPILE}"         \
> +       "CC=${CROSS_COMPILE}gcc-12"              \
> +       "CXX=${CROSS_COMPILE}g++-12"             \
> +       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
> +       misra
> +  cd ../xen
>    make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
>         "CROSS_COMPILE=${CROSS_COMPILE}"         \
>         "CC=${CROSS_COMPILE}gcc-12"              \
> diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
> index 275a1a3f517c..10854741790e 100755
> --- a/automation/eclair_analysis/prepare.sh
> +++ b/automation/eclair_analysis/prepare.sh
> @@ -35,6 +35,7 @@ else
>  fi
>  
>  (
> +    ./configure
>      cd xen
>      cp "${CONFIG_FILE}" .config
>      make clean
> -- 
> 2.34.1
> 

