Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CA12D6ADB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 23:57:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49968.88355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knUs7-00060l-NM; Thu, 10 Dec 2020 22:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49968.88355; Thu, 10 Dec 2020 22:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knUs7-00060L-JU; Thu, 10 Dec 2020 22:57:15 +0000
Received: by outflank-mailman (input) for mailman id 49968;
 Thu, 10 Dec 2020 22:57:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YEO=FO=kernel.org=robh@srs-us1.protection.inumbo.net>)
 id 1knUs6-000603-LH
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 22:57:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afb7d339-0d4e-4896-bfc2-568bf7f20aa1;
 Thu, 10 Dec 2020 22:57:09 +0000 (UTC)
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
X-Inumbo-ID: afb7d339-0d4e-4896-bfc2-568bf7f20aa1
X-Gm-Message-State: AOAM531NHylAM9wr0SV1+7Iy6Wk51s1LRk7rXzOkkIdCRakQLTaDW/oh
	rRkFmm4TtwU37eBDprki6kTiAwmkx7h7yEcH3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607641028;
	bh=CumYBB9xVU4mI+ysFQ9GC3xvipGC4R7OnFI2Gfa5FNQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IENA755C1/rgN0w8w2Z2W86pSCNpqQVdsIn6hGM3SHpMOEjpkwGZtsgL0hRxLES5J
	 GN69vLvpVngVt+noJivc35dT928cbXAlG4h3cswLCydXRYUgIxoqvWvZqpS8aiOmMt
	 05Ld+Z78+akIY5HGQHCAOlr0AaROFROMPYtjN+KD7+S/KXuaWg0xL6AO0iLiPlice4
	 iZANjFb7GSIlf67hQvw0Y9hSU5e2T/JFuteUXmOg3uHY1Ii/HhED2bYqVL2OdaPsEh
	 TPV4vxeX7oyFvjtBzj9WAWsfNEkX/EEF2pxlVmb7f9vuUC3ehG96CfByyDyOuWBqr1
	 447X7kFWCVCJA==
X-Google-Smtp-Source: ABdhPJyKMB0fAO5ccR1ON7eKp3wop/g844H0Em6KIAw65vcwOioEZudsqFxyo2xMX2ascC0HxcRxz5ivmcQz5wtwB24=
X-Received: by 2002:a17:906:c20f:: with SMTP id d15mr8477099ejz.341.1607641026526;
 Thu, 10 Dec 2020 14:57:06 -0800 (PST)
MIME-Version: 1.0
References: <20201210192536.118432146@linutronix.de> <20201210194044.473308721@linutronix.de>
In-Reply-To: <20201210194044.473308721@linutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Thu, 10 Dec 2020 16:56:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK4bVyqyT9ip9A5P7gQQwDt1HMksjkCe6bwHrBCGrZYug@mail.gmail.com>
Message-ID: <CAL_JsqK4bVyqyT9ip9A5P7gQQwDt1HMksjkCe6bwHrBCGrZYug@mail.gmail.com>
Subject: Re: [patch 19/30] PCI: mobiveil: Use irq_data_get_irq_chip_data()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, PCI <linux-pci@vger.kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	afzal mohammed <afzal.mohd.ma@gmail.com>, linux-parisc@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, 
	Chris Wilson <chris@chris-wilson.co.uk>, Wambui Karuga <wambui.karugax@gmail.com>, 
	Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, 
	Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, 
	linux-ntb@googlegroups.com, Michal Simek <michal.simek@xilinx.com>, 
	Tariq Toukan <tariqt@nvidia.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, linux-rdma@vger.kernel.org, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 10, 2020 at 1:42 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Going through a full irq descriptor lookup instead of just using the proper
> helper function which provides direct access is suboptimal.
>
> In fact it _is_ wrong because the chip callback needs to get the chip data
> which is relevant for the chip while using the irq descriptor variant
> returns the irq chip data of the top level chip of a hierarchy. It does not
> matter in this case because the chip is the top level chip, but that
> doesn't make it more correct.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
> Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org
> ---
>  drivers/pci/controller/mobiveil/pcie-mobiveil-host.c |    8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

