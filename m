Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774FD9483CC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 23:01:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772363.1182809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb4pU-00011t-0o; Mon, 05 Aug 2024 21:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772363.1182809; Mon, 05 Aug 2024 21:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb4pT-000105-Tv; Mon, 05 Aug 2024 21:01:19 +0000
Received: by outflank-mailman (input) for mailman id 772363;
 Mon, 05 Aug 2024 21:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Idk=PE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sb4pS-0000zy-Ub
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 21:01:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da7aa8d3-536d-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 23:01:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 84CF560C74;
 Mon,  5 Aug 2024 21:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EFB2C32782;
 Mon,  5 Aug 2024 21:01:13 +0000 (UTC)
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
X-Inumbo-ID: da7aa8d3-536d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722891674;
	bh=IB1+KeSKSkZ4PVC2DdCuvNjm4O98/WWrETEdHGV17kw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=stYwPTWi0AF6emv658UZRAFBdPxPh9epP6w4p6aa7sll4TBex5BXAQMMb9z5BgL88
	 w8pAgWJ7IwkUfwAp7uaj6iZ3q+UWmAfyDNjSsVKFzGfhCCMTqfcWTd+D+7kEZSi8sJ
	 jp6Ev23bNJdLaRYW/Dh6XTLXzpazoXyIz7BlOhfLI1sASfeON7jXbbCcUsG81Xv8Wa
	 L3ew1/3oC16qKVFboi5rN7y31GXcDosTGvZDVa0ZSk8EMXfHShLAGz8YBsc3DZdwRO
	 LtvD969G2gP3ZYZsnIs7QCI5GZt1vvE+e5h+bTq8rr01CwHx/lNFjXcN2SJKrg2C1i
	 pgYxp3qLGbDng==
Date: Mon, 5 Aug 2024 14:01:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/shutdown: use DMI_MATCH2()
In-Reply-To: <71df7167-fa92-405e-bf5b-a307e990e5a3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2408051401030.4954@ubuntu-linux-20-04-desktop>
References: <71df7167-fa92-405e-bf5b-a307e990e5a3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Aug 2024, Jan Beulich wrote:
> ... to please Misra C:2012 Rule 9.3 (Arrays shall not be partially
> initialized).
> 
> Fixes: d81dd3130351 ("x86/shutdown: change default reboot method preference")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> Cc-ing REST since the two other x86 maintainers are away, yet the CI will
> want fixing.
> 
> --- a/xen/arch/x86/shutdown.c
> +++ b/xen/arch/x86/shutdown.c
> @@ -498,10 +498,9 @@ static const struct dmi_system_id __init
>          .callback = override_reboot,
>          .driver_data = (void *)(long)BOOT_EFI,
>          .ident = "Acer TravelMate X514-51T",
> -        .matches = {
> +        DMI_MATCH2(
>              DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate X514-51T"),
> -        },
> +            DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate X514-51T")),
>      },
>      { }
>  };
> 

