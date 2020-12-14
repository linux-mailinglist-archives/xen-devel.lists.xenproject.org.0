Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5850D2DA2A9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 22:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52702.92032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kovcm-0006YP-S3; Mon, 14 Dec 2020 21:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52702.92032; Mon, 14 Dec 2020 21:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kovcm-0006XS-Mo; Mon, 14 Dec 2020 21:43:20 +0000
Received: by outflank-mailman (input) for mailman id 52702;
 Mon, 14 Dec 2020 21:13:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6luh=FS=kernel.org=saeed@srs-us1.protection.inumbo.net>)
 id 1kov9c-0003j1-Pw
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 21:13:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43b336df-5a5c-4021-b07e-fe6cca59fadb;
 Mon, 14 Dec 2020 21:13:12 +0000 (UTC)
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
X-Inumbo-ID: 43b336df-5a5c-4021-b07e-fe6cca59fadb
Message-ID: <0f8eda3bbed1100c1c1f7015dd5c172f8d735c94.camel@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607980391;
	bh=Pzvi/5ISTUEc02BC83hB6nniQmkTHPAhNCBBNcfKAUY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Ks3P3xnvXkJSp+uh7CcZoik6MJkEKtx2PvE0VYPE/pepC3FjT65YOm45Ebhka542Q
	 KDRZnMtG6PVk8azMh03nN0D62HLqcKsXaM3NGfl0cnBfDn4M/eCG3Bapi5UEiWJojE
	 Wz5xGjdq/ndTqDY7tNprPuvOQMJrfpTrREHq07hUDedim+JiPcYSm9y/a+CVpdgIGp
	 tK5qViUVIaC1nIaet1VMQYFfwNA6Uv7knO5wHsw+J306Af6r5YPeiXS/tptiFYTABJ
	 2yXmYvRm101qHL41Iu7+0L42D5JI7GLbb235mT9lCcvuGwm/DUlfBNloCq8GKc5F9/
	 KjhGS5BzrCEJg==
Subject: Re: [patch 22/30] net/mlx5: Replace irq_to_desc() abuse
From: Saeed Mahameed <saeed@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, afzal mohammed <afzal.mohd.ma@gmail.com>,
 linux-parisc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, linux-s390@vger.kernel.org, Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Pankaj
 Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Wambui Karuga <wambui.karugax@gmail.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Tvrtko
 Ursulin <tvrtko.ursulin@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>,  linux-gpio@vger.kernel.org, Lee Jones
 <lee.jones@linaro.org>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Michal
 Simek <michal.simek@xilinx.com>,  linux-pci@vger.kernel.org, Karthikeyan
 Mitran <m.karthikeyan@mobiveil.co.in>,  Hou Zhiqiang
 <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>, "David S. Miller"
 <davem@davemloft.net>,  Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org, Leon Romanovsky
 <leon@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen
 Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 14 Dec 2020 13:13:07 -0800
In-Reply-To: <20201210194044.769458162@linutronix.de>
References: <20201210192536.118432146@linutronix.de>
	 <20201210194044.769458162@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-10 at 20:25 +0100, Thomas Gleixner wrote:
> No driver has any business with the internals of an interrupt
> descriptor. Storing a pointer to it just to use yet another helper at
> the
> actual usage site to retrieve the affinity mask is creative at best.
> Just
> because C does not allow encapsulation does not mean that the kernel
> has no
> limits.
> 

you can't blame the developers for using stuff from include/linux/
Not all developers are the same, and sometime we don't read in between
the lines, you can't assume all driver developers to be expert on irq
APIs disciplines.

your rules must be programmatically expressed, for instance,
you can just hide struct irq_desc and irq_to_desc() in kernel/irq/ and
remove them from include/linux/ header files, if you want privacy in
your subsystem, don't put all your header files on display under
include/linux.


> Retrieve a pointer to the affinity mask itself and use that. It's
> still
> using an interface which is usually not for random drivers, but
> definitely
> less hideous than the previous hack.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en.h      |    2 +-
>  drivers/net/ethernet/mellanox/mlx5/core/en_main.c |    2 +-
>  drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c |    6 +-----
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en.h
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en.h
> @@ -669,7 +669,7 @@ struct mlx5e_channel {
>  	spinlock_t                 async_icosq_lock;
>  
>  	/* data path - accessed per napi poll */
> -	struct irq_desc *irq_desc;
> +	const struct cpumask	  *aff_mask;
>  	struct mlx5e_ch_stats     *stats;
>  
>  	/* control */
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> @@ -1998,7 +1998,7 @@ static int mlx5e_open_channel(struct mlx
>  	c->num_tc   = params->num_tc;
>  	c->xdp      = !!params->xdp_prog;
>  	c->stats    = &priv->channel_stats[ix].ch;
> -	c->irq_desc = irq_to_desc(irq);
> +	c->aff_mask = irq_get_affinity_mask(irq);

as long as the affinity mask pointer stays the same for the lifetime of
the irq vector.

Assuming that:
Acked-by: Saeed Mahameed <saeedm@nvidia.com>



