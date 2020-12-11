Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC8D2D7DAB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 19:09:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50810.89586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knmqC-0007B8-Lg; Fri, 11 Dec 2020 18:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50810.89586; Fri, 11 Dec 2020 18:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knmqC-0007Aj-IY; Fri, 11 Dec 2020 18:08:28 +0000
Received: by outflank-mailman (input) for mailman id 50810;
 Fri, 11 Dec 2020 18:08:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekOa=FP=kernel.org=maz@srs-us1.protection.inumbo.net>)
 id 1knmqA-0007AZ-9H
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 18:08:26 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cce3f81d-5a97-4485-b75b-ef5169fba09a;
 Fri, 11 Dec 2020 18:08:25 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 891FF23D3C;
 Fri, 11 Dec 2020 18:08:24 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1knmq6-000WxV-AL; Fri, 11 Dec 2020 18:08:22 +0000
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
X-Inumbo-ID: cce3f81d-5a97-4485-b75b-ef5169fba09a
Date: Fri, 11 Dec 2020 18:08:19 +0000
Message-ID: <87zh2k43n0.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	afzal mohammed <afzal.mohd.ma@gmail.com>,
	linux-parisc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	linux-s390@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Wambui Karuga <wambui.karugax@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee.jones@linaro.org>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	linux-ntb@googlegroups.com,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Michal Simek <michal.simek@xilinx.com>,
	linux-pci@vger.kernel.org,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [patch 09/30] ARM: smp: Use irq_desc_kstat_cpu() in show_ipi_list()
In-Reply-To: <20201210194043.454288890@linutronix.de>
References: <20201210192536.118432146@linutronix.de>
	<20201210194043.454288890@linutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tglx@linutronix.de, linux-kernel@vger.kernel.org, peterz@infradead.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, James.Bottomley@HansenPartnership.com, deller@gmx.de, afzal.mohd.ma@gmail.com, linux-parisc@vger.kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org, borntraeger@de.ibm.com, hca@linux.ibm.com, linux-s390@vger.kernel.org, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch, pankaj.laxminarayan.bharadiya@intel.com, chris@chris-wilson.co.uk, wambui.karugax@gmail.com, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, lee.jones@linaro.org, jdmason@kudzu.us, dave.jiang@intel.com, allenbh@gmail.com, linux-ntb@googlegroups.com, lorenzo.pieralisi@arm.com, robh@kernel.org, bhelgaas@google.com, michal.simek@xilinx.com, linux-pci@vger.kernel.org, m.karthike
 yan@mobiveil.co.in, Zhiqiang.Hou@nxp.com, tariqt@nvidia.com, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, saeedm@nvidia.com, leon@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Thu, 10 Dec 2020 19:25:45 +0000,
Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> The irq descriptor is already there, no need to look it up again.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm/kernel/smp.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/arch/arm/kernel/smp.c
> +++ b/arch/arm/kernel/smp.c
> @@ -550,7 +550,7 @@ void show_ipi_list(struct seq_file *p, i
>  		seq_printf(p, "%*s%u: ", prec - 1, "IPI", i);
>  
>  		for_each_online_cpu(cpu)
> -			seq_printf(p, "%10u ", kstat_irqs_cpu(irq, cpu));
> +			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
>  
>  		seq_printf(p, " %s\n", ipi_types[i]);
>  	}
> 
> 

Acked-by: Marc Zyngier <maz@kernel.org>

-- 
Without deviation from the norm, progress is not possible.

