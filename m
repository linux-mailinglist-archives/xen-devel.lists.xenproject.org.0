Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA82D6ADC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 23:57:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49963.88343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knUrX-0005vb-Cq; Thu, 10 Dec 2020 22:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49963.88343; Thu, 10 Dec 2020 22:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knUrX-0005vC-9c; Thu, 10 Dec 2020 22:56:39 +0000
Received: by outflank-mailman (input) for mailman id 49963;
 Thu, 10 Dec 2020 22:56:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YEO=FO=kernel.org=robh@srs-us1.protection.inumbo.net>)
 id 1knUrW-0005v7-KM
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 22:56:38 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07d469f0-d296-460c-a9ec-bd1312035aa9;
 Thu, 10 Dec 2020 22:56:37 +0000 (UTC)
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
X-Inumbo-ID: 07d469f0-d296-460c-a9ec-bd1312035aa9
X-Gm-Message-State: AOAM533SmKd2FPP/lUnL7fSit+hZHbmfELUke8gQHMYBeyyPGXtju0Mh
	+1J3bC+90/BglH1d8pIyQhX0GvmdLyFanAYCAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607640996;
	bh=HILNalL3GlPRV+ztE2WnCsMQWzjgnQh5F8d+VjxfhHA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rQAahl+VcS81InegMIe7t5hV41qJEyVO5GTWCewjlXudNepqHfUqqhOrGLwDYfmZ/
	 VQ1zgfZVZQg5u35vkGV3DRmPUAtdMbwFJKC4NKP58rWd+TSt2vhdz8ZD2Px5yPlF74
	 O/DoTMYHdax5dwTKqUknAab3SL3m53gb4nyo9MhmI21pZzOL2Zw6zSR/cXbtqLmXbg
	 DmB4Z5cTanULPaj31OeUS3HJc09HF+snQneei7l4E18B1DnJkCzoWWCXhKaJhMKRec
	 yBRqTr+qkFbjL2ZZeVI3RvSShjYUktjv+258Mjbes4nTf9DlRhfFAiAtqWwaMqYiA5
	 O38B/o73R2+Bw==
X-Google-Smtp-Source: ABdhPJxCdEkGcUPgqgCmU+hGdc9mjJz2mo+m7nRBlZJj4NBRvD8ZfcoTXioyfo8/Gn48VrKyiwGC/1HmZUK4DbzvCWk=
X-Received: by 2002:a17:906:d784:: with SMTP id pj4mr8261525ejb.360.1607640993261;
 Thu, 10 Dec 2020 14:56:33 -0800 (PST)
MIME-Version: 1.0
References: <20201210192536.118432146@linutronix.de> <20201210194044.364211860@linutronix.de>
In-Reply-To: <20201210194044.364211860@linutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Thu, 10 Dec 2020 16:56:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKCGkyk9whiGQ0hPyWjSYXnC-TSbot85k7=bwVd0rwC=A@mail.gmail.com>
Message-ID: <CAL_JsqKCGkyk9whiGQ0hPyWjSYXnC-TSbot85k7=bwVd0rwC=A@mail.gmail.com>
Subject: Re: [patch 18/30] PCI: xilinx-nwl: Use irq_data_get_irq_chip_data()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@xilinx.com>, 
	PCI <linux-pci@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	afzal mohammed <afzal.mohd.ma@gmail.com>, linux-parisc@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, 
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
	linux-ntb@googlegroups.com, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, 
	linux-rdma@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
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
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: linux-pci@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/pci/controller/pcie-xilinx-nwl.c |    8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

