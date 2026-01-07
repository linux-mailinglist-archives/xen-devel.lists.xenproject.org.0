Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF44CFEC0B
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 16:59:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196855.1514570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdVwA-0002uy-4p; Wed, 07 Jan 2026 15:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196855.1514570; Wed, 07 Jan 2026 15:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdVwA-0002sk-1D; Wed, 07 Jan 2026 15:59:06 +0000
Received: by outflank-mailman (input) for mailman id 1196855;
 Wed, 07 Jan 2026 15:59:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vdVw8-0002se-MK
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 15:59:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vdVw3-00DT2R-1Z;
 Wed, 07 Jan 2026 15:58:59 +0000
Received: from [2a01:cb15:80df:da00:baa:5f20:ede5:a76a] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vdVw3-00CcmW-1U;
 Wed, 07 Jan 2026 15:58:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=tt71Q6E/7VRue3ysODBeTsz9Sadsk+3qp6nS7uoqJL8=; b=ly0I4iiA+HfHUjbLN4kmLjajk3
	MJgm+mRrR9exmZV+O6ZAmol7277DtNcur1OisRvlHtj1Bg7p2+wVeMglCJYCZwdyAsPpFURcQe6hD
	SY+/4lUuNG7Jhj0stLgN219QQK0c7lpapRfntmjSF/u5+//aeIW3UcKK2mGfytirOIC0=;
Date: Wed, 7 Jan 2026 16:58:57 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Teddy Astie <teddy.astie@vates.tech>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4 2/4] xenpm: Don't build outside of x86
Message-ID: <aV6CwQx3sNuIMbxl@l14>
References: <cover.1766158766.git.teddy.astie@vates.tech>
 <77dc07c4b4431fb53aa5b226d302f437e4314d8c.1766158766.git.teddy.astie@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77dc07c4b4431fb53aa5b226d302f437e4314d8c.1766158766.git.teddy.astie@vates.tech>

On Fri, Dec 19, 2025 at 03:42:17PM +0000, Teddy Astie wrote:
> xenpm doesn't provide any interesting usable features outside of x86,
> skip building it if we are not x86.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Happy with that on the Arm side? Julien suggested so on #XenDevel.

For me, this seems fine:
Acked-by: Anthony PERARD <anthony.perard@vates.tech>


> ---
>  CHANGELOG.md        | 3 +++
>  tools/misc/Makefile | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 3aaf598623..1fa58ce848 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>       deprecated in Xen 4.7 and noted not to work correctly with AMD CPUs from
>       2011 onwards.
>  
> + - Removed xenpm on non-x86 platforms as it doesn't actually provide anything
> +   useful outside of x86.
> +
>  ## [4.21.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.21.0) - 2025-11-19
>  
>  ### Changed
> diff --git a/tools/misc/Makefile b/tools/misc/Makefile
> index c26e544e83..672df02c3b 100644
> --- a/tools/misc/Makefile
> +++ b/tools/misc/Makefile
> @@ -23,13 +23,13 @@ INSTALL_SBIN-$(CONFIG_X86)     += xen-lowmemd
>  INSTALL_SBIN-$(CONFIG_X86)     += xen-mceinj
>  INSTALL_SBIN-$(CONFIG_X86)     += xen-memshare
>  INSTALL_SBIN-$(CONFIG_X86)     += xen-mfndump
> +INSTALL_SBIN-$(CONFIG_X86)     += xenpm

Nit: I would sort this by taking the dash `-` into account since we do
so for the arch-common list, so xenpm would go after xen-vmtrace.

>  INSTALL_SBIN-$(CONFIG_X86)     += xen-ucode
>  INSTALL_SBIN-$(CONFIG_X86)     += xen-vmtrace
>  INSTALL_SBIN                   += xencov
>  INSTALL_SBIN                   += xenhypfs
>  INSTALL_SBIN                   += xenlockprof
>  INSTALL_SBIN                   += xenperf
> -INSTALL_SBIN                   += xenpm
>  INSTALL_SBIN                   += xenwatchdogd
>  INSTALL_SBIN                   += xen-access
>  INSTALL_SBIN                   += xen-livepatch

-- 
Anthony PERARD

