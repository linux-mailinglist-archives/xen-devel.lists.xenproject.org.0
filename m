Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6F2DA2A6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 22:43:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52697.92024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kovcm-0006Xc-Je; Mon, 14 Dec 2020 21:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52697.92024; Mon, 14 Dec 2020 21:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kovcm-0006Wq-8t; Mon, 14 Dec 2020 21:43:20 +0000
Received: by outflank-mailman (input) for mailman id 52697;
 Mon, 14 Dec 2020 20:58:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6luh=FS=kernel.org=saeed@srs-us1.protection.inumbo.net>)
 id 1kouvZ-0001zU-Fj
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 20:58:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbe7f83e-25cb-4c26-a5be-c834ffa7c5b1;
 Mon, 14 Dec 2020 20:58:40 +0000 (UTC)
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
X-Inumbo-ID: dbe7f83e-25cb-4c26-a5be-c834ffa7c5b1
Message-ID: <8035075adf8738792f4fa39032eeeb997bc1e653.camel@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607979519;
	bh=cldqRzZxWGs3Mp0GWam6BN3UIEF7254f3nfHMyN7cv4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Gtxqgx/zUgAV/HC4HUDaTWWErUYbIXoTgkKUYMD/ELlewv6ngbmFefFbLOnnQE37B
	 fwW9w8lNXB0jkS0zaOY6KiQuNNvzR6i/TAi+fgG1AW/EykMErJidLU/39fKuq2JQ6H
	 cYZqxR/cWcdcz2hfp8VGfziH+pOYPr8oSmVaMVsoIT/cKvofZxClMOcYe7qD5WQeeL
	 NIffLKExOZStE6EtkCW8G8ODK2nn1z9f76JCt7Kq0Z4tPHOOMdZSDtSFcABv2Uu75T
	 yhfntlEnCdaAYrYdYHk5OeIYZ35zyWy0f9d7SzNO3zktL7NiFTX5VRmoH1k+TTpoKc
	 hhNH7an3hKyYw==
Subject: Re: [patch 23/30] net/mlx5: Use effective interrupt affinity
From: Saeed Mahameed <saeed@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 afzal mohammed <afzal.mohd.ma@gmail.com>, linux-parisc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Christian
 Borntraeger <borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Pankaj Bharadiya
 <pankaj.laxminarayan.bharadiya@intel.com>, Chris Wilson
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
 <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 14 Dec 2020 12:58:36 -0800
In-Reply-To: <20201210194044.876342330@linutronix.de>
References: <20201210192536.118432146@linutronix.de>
	 <20201210194044.876342330@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-10 at 20:25 +0100, Thomas Gleixner wrote:
> Using the interrupt affinity mask for checking locality is not really
> working well on architectures which support effective affinity masks.
> 
> The affinity mask is either the system wide default or set by user
> space,
> but the architecture can or even must reduce the mask to the
> effective set,
> which means that checking the affinity mask itself does not really
> tell
> about the actual target CPUs.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Saeed Mahameed <saeedm@nvidia.com>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: netdev@vger.kernel.org
> Cc: linux-rdma@vger.kernel.org
> 

Acked-by: Saeed Mahameed <saeedm@nvidia.com>


