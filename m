Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130DDB28665
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 21:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083781.1443234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un05p-00080K-39; Fri, 15 Aug 2025 19:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083781.1443234; Fri, 15 Aug 2025 19:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un05p-0007yb-0I; Fri, 15 Aug 2025 19:28:01 +0000
Received: by outflank-mailman (input) for mailman id 1083781;
 Fri, 15 Aug 2025 19:28:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1un05o-0007yB-0G
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 19:28:00 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f19d210c-7a0d-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 21:27:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C722BA583A9;
 Fri, 15 Aug 2025 19:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C228CC4CEEB;
 Fri, 15 Aug 2025 19:27:53 +0000 (UTC)
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
X-Inumbo-ID: f19d210c-7a0d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755286074;
	bh=dm9hGRQRuU3Ti61KlLjxam3MN99K/XV9ylHs6j08/Mo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F/19KR41w+KuAPKXxMLrfZZRYJyND95hDItIfiduIAqJG0OoBvI790PweQcnsTcyT
	 EH5AQAjZVX4qBNoXQ1n89tUI4CoIoZqbH4sBbLhhtsVJq+DGS0pUkjJ68XPuG+VJaC
	 YR4gyfaFduYM3xYUaiiKyWA7Ty0Q0zqVWm8WUgYnrR9Ts4Q+XfhhpH4vpboJb8g5Hs
	 aSv9IAvtZTu2oLeXtP8Xsc5ABZxsDbwUYvyT6H04DVIL1QBuSkGvL1rIvEjRPgDuVF
	 a763Mr6va+Y4UZ27SZ2btpSUM14tWe/v0wpR+e++UkliyWo2Tc+nz7KJTGX6LinS5H
	 T2RiqM/Ga8Lgg==
Date: Fri, 15 Aug 2025 12:27:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: linux-kernel@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] drivers/xen/xenbus: remove quirk for Xen 3.x
In-Reply-To: <20250815074052.13792-1-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2508151227420.10166@ubuntu-linux-20-04-desktop>
References: <20250815074052.13792-1-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Aug 2025, Juergen Gross wrote:
> The kernel is not supported to run as a Xen guest on Xen versions
> older than 4.0.
> 
> Remove xen_strict_xenbus_quirk() which is testing the Xen version to be
> at least 4.0.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/xenbus/xenbus_xs.c | 23 -----------------------
>  1 file changed, 23 deletions(-)
> 
> diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
> index 3c9da446b85d..528682bf0c7f 100644
> --- a/drivers/xen/xenbus/xenbus_xs.c
> +++ b/drivers/xen/xenbus/xenbus_xs.c
> @@ -718,26 +718,6 @@ int xs_watch_msg(struct xs_watch_event *event)
>  	return 0;
>  }
>  
> -/*
> - * Certain older XenBus toolstack cannot handle reading values that are
> - * not populated. Some Xen 3.4 installation are incapable of doing this
> - * so if we are running on anything older than 4 do not attempt to read
> - * control/platform-feature-xs_reset_watches.
> - */
> -static bool xen_strict_xenbus_quirk(void)
> -{
> -#ifdef CONFIG_X86
> -	uint32_t eax, ebx, ecx, edx, base;
> -
> -	base = xen_cpuid_base();
> -	cpuid(base + 1, &eax, &ebx, &ecx, &edx);
> -
> -	if ((eax >> 16) < 4)
> -		return true;
> -#endif
> -	return false;
> -
> -}
>  static void xs_reset_watches(void)
>  {
>  	int err;
> @@ -745,9 +725,6 @@ static void xs_reset_watches(void)
>  	if (!xen_hvm_domain() || xen_initial_domain())
>  		return;
>  
> -	if (xen_strict_xenbus_quirk())
> -		return;
> -
>  	if (!xenbus_read_unsigned("control",
>  				  "platform-feature-xs_reset_watches", 0))
>  		return;
> -- 
> 2.43.0
> 

