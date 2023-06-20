Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2D737659
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 23:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552343.862370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiTr-000210-Vy; Tue, 20 Jun 2023 21:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552343.862370; Tue, 20 Jun 2023 21:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiTr-0001yj-SW; Tue, 20 Jun 2023 21:01:39 +0000
Received: by outflank-mailman (input) for mailman id 552343;
 Tue, 20 Jun 2023 21:01:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJOa=CI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBiTq-0001yd-UR
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 21:01:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4a53aa5-0fad-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 23:01:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC8C3611C1;
 Tue, 20 Jun 2023 21:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEFCC433C8;
 Tue, 20 Jun 2023 21:01:33 +0000 (UTC)
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
X-Inumbo-ID: a4a53aa5-0fad-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687294895;
	bh=dA49CC+Wfw1l8En3pXPyoSWDdjpG+ms5wfa72NIfuRM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V+Q4mhEgiqQXqZXKtO2ieWMgM+BwELhfkDrjhNANjp9+wbqwvaSeuLBCo0UBn1AlT
	 ZxFj2LxkTzV6fqLo+8CVKjS2OW1QXSjJ5hIeB0evyQ+lsSq9T8KuLd3wlSBrNNMohK
	 tcl2wez90jgTupz7QUzOtcV9ONLdS6c5zp2hs8ix29mnirGxoe/rutc/OXClOP8IT4
	 tQQ9dkYWMDviWatG8oeQ0TZJddwp+mAetW/xT9vhMzc5mBqsFCAFatX1rJ6aD/damU
	 yJK+SUWh5g9RQ7DSVuAdBHWXU9wnQLJzYLmTPL7T5xHNqLwAovRH3NIClkSrAl5HJJ
	 Xq0NUygBXHPzA==
Date: Tue, 20 Jun 2023 14:01:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH 08/13] xen/pci: fixed violations of MISRA C:2012 Rule
 7.2
In-Reply-To: <3d1a98c8070d4e502402356dd65153dcc813edef.1687250177.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2306201400460.897208@ubuntu-linux-20-04-desktop>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com> <3d1a98c8070d4e502402356dd65153dcc813edef.1687250177.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Jun 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
> "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
> 
> I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
> For homogeneity, I also added the "U" suffix in some cases that the tool didn't report as violations.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Aside from the commit message that needs an update:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/passthrough/pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 07d1986d33..95846e84f2 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -990,8 +990,8 @@ bool_t __init pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func)
>  
>      vendor = pci_conf_read32(PCI_SBDF(seg, bus, dev, func), PCI_VENDOR_ID);
>      /* some broken boards return 0 or ~0 if a slot is empty: */
> -    if ( (vendor == 0xffffffff) || (vendor == 0x00000000) ||
> -         (vendor == 0x0000ffff) || (vendor == 0xffff0000) )
> +    if ( (vendor == 0xffffffffU) || (vendor == 0x00000000U) ||
> +         (vendor == 0x0000ffffU) || (vendor == 0xffff0000U) )
>          return 0;
>      return 1;
>  }
> -- 
> 2.41.0
> 

