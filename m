Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D345F6A6574
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 03:25:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503835.776192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXC9i-00081T-RS; Wed, 01 Mar 2023 02:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503835.776192; Wed, 01 Mar 2023 02:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXC9i-0007z1-Nw; Wed, 01 Mar 2023 02:25:22 +0000
Received: by outflank-mailman (input) for mailman id 503835;
 Wed, 01 Mar 2023 02:25:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+Ik=6Z=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pXC9h-0007mN-BS
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 02:25:21 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e40bdc6-b7d8-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 03:25:17 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F3723B80E95;
 Wed,  1 Mar 2023 02:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFBA3C433EF;
 Wed,  1 Mar 2023 02:25:14 +0000 (UTC)
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
X-Inumbo-ID: 4e40bdc6-b7d8-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677637515;
	bh=tlwaCfkfcxCvHipB4tcmH1hImpj+EBdBH6Kyth40qvI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hK/rdESZIqlJUyCWK5yEmcn5RINoZSORmegCzLpoF5eTbpYWdpn9xKXSqNogVQR/S
	 YNPPMOhP4ZzBCg5DNRDy+F6pk2vurUzkVSgmb7bLJckE/0xRyJ6P5COxCU2yzje0sH
	 ez5s67LHg/9F2/QbRaTsimqxLYXVN+NIub5PWJ3S0fiFLoXsA0Hy75bOOpCLV77xO7
	 geWAECOLN2cl7JORWuc28DxeriZAP9YqPRcsidf+rqvXcR2iZ75S1xupuO80kUge5G
	 xwI8Zty+7OqM3RVjOGW2ibAuHQwNFLq/R/FZ4GUq2yj2umn8USkNW6NlWCWdV1WVE/
	 DynMbXbqs8iJQ==
Date: Tue, 28 Feb 2023 18:25:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation: Rework archlinux container
In-Reply-To: <20230228181649.51066-1-anthony.perard@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2302281825050.3680@ubuntu-linux-20-04-desktop>
References: <20230228181649.51066-1-anthony.perard@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Feb 2023, Anthony PERARD wrote:
> Base image "archlinux/base" isn't available anymore,
>     https://lists.archlinux.org/pipermail/arch-dev-public/2020-November/030181.html
> 
> But instead of switching to archlinux/archlinux, we will use the
> official image from Docker. Main difference is that the first one is
> updated daily while the second is updated weekly.
> 
> Also, as we will install the packages from "base-devel" anyway, switch
> to the "base-devel" tag.
> 
> "dev86" package is now available from the main repo, no need for
> multilib repo anymore.
> 
> It is recommended to initialise local signing key used by pacman, so
> let's do that.
> 
> Replace "markdown" by "discount" as the former isn't available anymore
> and has been replaced by the later.
> 
> Also, clean pacman's cache.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Notes:
>     Testing done here:
>     https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/791402512
> 
>  automation/build/archlinux/current.dockerfile | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
> index d46fc9d9ca..13fb472d9e 100644
> --- a/automation/build/archlinux/current.dockerfile
> +++ b/automation/build/archlinux/current.dockerfile
> @@ -1,16 +1,15 @@
> -FROM archlinux/base
> +FROM archlinux:base-devel
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> -# Enable multilib repo, for dev86 package
> -RUN echo $'[multilib]\nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
> +RUN pacman-key --init
>  
>  RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
> -        base-devel \
>          bin86 \
>          bridge-utils \
>          bzip2 \
>          dev86 \
> +        discount \
>          dtc \
>          e2fsprogs \
>          ghostscript \
> @@ -29,7 +28,6 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
>          libnl \
>          libpng \
>          libseccomp \
> -        markdown \
>          net-tools \
>          nss \
>          perl \
> @@ -46,7 +44,8 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
>          wget \
>          xz \
>          yajl \
> -        zlib
> +        zlib \
> +    && yes | pacman -S --clean --clean
>  
>  ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
>  
> -- 
> Anthony PERARD
> 

