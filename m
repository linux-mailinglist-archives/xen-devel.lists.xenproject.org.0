Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28BF569D9A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 10:40:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362792.593007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9N3S-00050C-TR; Thu, 07 Jul 2022 08:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362792.593007; Thu, 07 Jul 2022 08:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9N3S-0004xL-QU; Thu, 07 Jul 2022 08:40:10 +0000
Received: by outflank-mailman (input) for mailman id 362792;
 Thu, 07 Jul 2022 08:40:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fkjz=XM=kernel.org=maz@srs-se1.protection.inumbo.net>)
 id 1o9N3S-0004xF-0n
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 08:40:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 679b5d6e-fdd0-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 10:40:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF0926209B;
 Thu,  7 Jul 2022 08:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19CFC3411E;
 Thu,  7 Jul 2022 08:40:05 +0000 (UTC)
Received: from ip-185-104-136-29.ptr.icomera.net ([185.104.136.29]
 helo=wait-a-minute.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1o9N3L-005rnz-LP;
 Thu, 07 Jul 2022 09:40:03 +0100
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
X-Inumbo-ID: 679b5d6e-fdd0-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657183206;
	bh=WbGmo8M7SuEpA4hho4LukBL6BvfNcnRlmWQ1qO9HJ/U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uLIozQmEuSEh/XitGSDU3I1WWg/wxHMYC8XcC0CKDSDzcPTnDKZ0WJpx/VEqUIrA6
	 90D1f2r+lQ/rkAoV0TsA7oITj6H3B4i9g/nqgpiUDGl1GBu9VW5UjrTUzUDkFxOd3t
	 R011UxxdpHW1T1R9fwf8PvtZV61+cE8woR4NEOXyGsg98KLqjAIolLU8cqYo39f3uD
	 797WFWDXG+i4pUi5B49w4dAlDdo9l/by+B+rEyxEBVcat8WMWleVU9h22Q2v2qbO/H
	 sZsFgrBRKSO1tpk8gVBtKIl4XC7u0rzO2ivKAc+YeTliCPwcnfyMVDLl7P8QP2Dxjk
	 hWtBucMBog50Q==
Date: Thu, 07 Jul 2022 09:39:58 +0100
Message-ID: <87bku1mi3l.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Oleksandr <olekstysh@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>,	Thomas Gleixner
 <tglx@linutronix.de>,	Andy Shevchenko <andy.shevchenko@gmail.com>,	Bartosz
 Golaszewski <brgl@bgdev.pl>,	Bjorn Helgaas <bhelgaas@google.com>,	Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,	Borislav Petkov <bp@alien8.de>,
	Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,	Chris Zankel <chris@zankel.net>,
	Colin Ian King <colin.king@intel.com>,	Dave Hansen
 <dave.hansen@linux.intel.com>,	Dexuan Cui <decui@microsoft.com>,	Florian
 Fainelli <f.fainelli@gmail.com>,	Guo Ren <guoren@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,	Haiyang Zhang <haiyangz@microsoft.com>,
	Helge Deller <deller@gmx.de>,	Ingo Molnar <mingo@redhat.com>,	Ivan
 Kokshaysky <ink@jurassic.park.msu.ru>,	"James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,	Jan Beulich <jbeulich@suse.com>,
	Joerg Roedel <joro@8bytes.org>,	Juergen Gross <jgross@suse.com>,	Julia
 Lawall <Julia.Lawall@inria.fr>,	"K. Y. Srinivasan" <kys@microsoft.com>,
	Kees Cook <keescook@chromium.org>,	Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>,	Linus Walleij <linus.walleij@linaro.org>,	Lorenzo Pieralisi
 <lpieralisi@kernel.org>,	Mark Rutland <mark.rutland@arm.com>,	Matt Turner
 <mattst88@gmail.com>,	Max Filippov <jcmvbkbc@gmail.com>,	Maximilian Heyne
 <mheyne@amazon.de>,	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Rich Felker <dalias@libc.org>,	Richard Henderson <rth@twiddle.net>,	Rikard
 Falkeborn <rikard.falkeborn@gmail.com>,	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,	Serge Semin
 <fancer.lancer@gmail.com>,	Stefano Stabellini <sstabellini@kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>,	Sven Schnelle
 <svens@stackframe.org>,	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Wei Liu <wei.liu@kernel.org>,	Wei Xu <xuwei5@hisilicon.com>,	Will Deacon
 <will@kernel.org>,	Yoshinori Sato <ysato@users.sourceforge.jp>,
	iommu@lists.linux-foundation.org,	iommu@lists.linux.dev,
	linux-alpha@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,	linux-ia64@vger.kernel.org,
	linux-kernel@vger.kernel.org,	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,	linux-pci@vger.kernel.org,
	linux-sh@vger.kernel.org,	linux-xtensa@linux-xtensa.org,	x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 6/8] genirq: Add and use an irq_data_update_affinity helper
In-Reply-To: <c7171195-796a-e61e-f270-864985adc5c3@gmail.com>
References: <20220701200056.46555-1-samuel@sholland.org>
	<20220701200056.46555-7-samuel@sholland.org>
	<c7171195-796a-e61e-f270-864985adc5c3@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.104.136.29
X-SA-Exim-Rcpt-To: olekstysh@gmail.com, samuel@sholland.org, tglx@linutronix.de, andy.shevchenko@gmail.com, brgl@bgdev.pl, bhelgaas@google.com, boris.ostrovsky@oracle.com, bp@alien8.de, bcm-kernel-feedback-list@broadcom.com, chris@zankel.net, colin.king@intel.com, dave.hansen@linux.intel.com, decui@microsoft.com, f.fainelli@gmail.com, guoren@kernel.org, hpa@zytor.com, haiyangz@microsoft.com, deller@gmx.de, mingo@redhat.com, ink@jurassic.park.msu.ru, James.Bottomley@HansenPartnership.com, jbeulich@suse.com, joro@8bytes.org, jgross@suse.com, Julia.Lawall@inria.fr, kys@microsoft.com, keescook@chromium.org, kw@linux.com, linus.walleij@linaro.org, lpieralisi@kernel.org, mark.rutland@arm.com, mattst88@gmail.com, jcmvbkbc@gmail.com, mheyne@amazon.de, oleksandr_tyshchenko@epam.com, dalias@libc.org, rth@twiddle.net, rikard.falkeborn@gmail.com, robh@kernel.org, linux@armlinux.org.uk, fancer.lancer@gmail.com, sstabellini@kernel.org, sthemmin@microsoft.com, svens@stackframe.org, tsbogend@alpha.f
 ranken.de, wei.liu@kernel.org, xuwei5@hisilicon.com, will@kernel.org, ysato@users.sourceforge.jp, iommu@lists.linux-foundation.org, iommu@lists.linux.dev, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pci@vger.kernel.org, linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org, xen-devel@lists.xenproject.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Sun, 03 Jul 2022 16:22:03 +0100,
Oleksandr <olekstysh@gmail.com> wrote:
> 
> 
> On 01.07.22 23:00, Samuel Holland wrote:
> 
> 
> Hello Samuel
> 
> > Some architectures and irqchip drivers modify the cpumask returned by
> > irq_data_get_affinity_mask, usually by copying in to it. This is
> > problematic for uniprocessor configurations, where the affinity mask
> > should be constant, as it is known at compile time.
> > 
> > Add and use a setter for the affinity mask, following the pattern of
> > irq_data_update_effective_affinity. This allows the getter function to
> > return a const cpumask pointer.
> > 
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > ---
> > 
> > Changes in v3:
> >   - New patch to introduce irq_data_update_affinity
> > 
> >   arch/alpha/kernel/irq.c          | 2 +-
> >   arch/ia64/kernel/iosapic.c       | 2 +-
> >   arch/ia64/kernel/irq.c           | 4 ++--
> >   arch/ia64/kernel/msi_ia64.c      | 4 ++--
> >   arch/parisc/kernel/irq.c         | 2 +-
> >   drivers/irqchip/irq-bcm6345-l1.c | 4 ++--
> >   drivers/parisc/iosapic.c         | 2 +-
> >   drivers/sh/intc/chip.c           | 2 +-
> >   drivers/xen/events/events_base.c | 7 ++++---
> >   include/linux/irq.h              | 6 ++++++
> >   10 files changed, 21 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
> > index f6d2946edbd2..15f2effd6baf 100644
> > --- a/arch/alpha/kernel/irq.c
> > +++ b/arch/alpha/kernel/irq.c
> > @@ -60,7 +60,7 @@ int irq_select_affinity(unsigned int irq)
> >   		cpu = (cpu < (NR_CPUS-1) ? cpu + 1 : 0);
> >   	last_cpu = cpu;
> >   -	cpumask_copy(irq_data_get_affinity_mask(data),
> > cpumask_of(cpu));
> > +	irq_data_update_affinity(data, cpumask_of(cpu));
> >   	chip->irq_set_affinity(data, cpumask_of(cpu), false);
> >   	return 0;
> >   }
> > diff --git a/arch/ia64/kernel/iosapic.c b/arch/ia64/kernel/iosapic.c
> > index 35adcf89035a..99300850abc1 100644
> > --- a/arch/ia64/kernel/iosapic.c
> > +++ b/arch/ia64/kernel/iosapic.c
> > @@ -834,7 +834,7 @@ iosapic_unregister_intr (unsigned int gsi)
> >   	if (iosapic_intr_info[irq].count == 0) {
> >   #ifdef CONFIG_SMP
> >   		/* Clear affinity */
> > -		cpumask_setall(irq_get_affinity_mask(irq));
> > +		irq_data_update_affinity(irq_get_irq_data(irq), cpu_all_mask);
> >   #endif
> >   		/* Clear the interrupt information */
> >   		iosapic_intr_info[irq].dest = 0;
> > diff --git a/arch/ia64/kernel/irq.c b/arch/ia64/kernel/irq.c
> > index ecef17c7c35b..275b9ea58c64 100644
> > --- a/arch/ia64/kernel/irq.c
> > +++ b/arch/ia64/kernel/irq.c
> > @@ -57,8 +57,8 @@ static char irq_redir [NR_IRQS]; // = { [0 ... NR_IRQS-1] = 1 };
> >   void set_irq_affinity_info (unsigned int irq, int hwid, int redir)
> >   {
> >   	if (irq < NR_IRQS) {
> > -		cpumask_copy(irq_get_affinity_mask(irq),
> > -			     cpumask_of(cpu_logical_id(hwid)));
> > +		irq_data_update_affinity(irq_get_irq_data(irq),
> > +					 cpumask_of(cpu_logical_id(hwid)));
> >   		irq_redir[irq] = (char) (redir & 0xff);
> >   	}
> >   }
> > diff --git a/arch/ia64/kernel/msi_ia64.c b/arch/ia64/kernel/msi_ia64.c
> > index df5c28f252e3..025e5133c860 100644
> > --- a/arch/ia64/kernel/msi_ia64.c
> > +++ b/arch/ia64/kernel/msi_ia64.c
> > @@ -37,7 +37,7 @@ static int ia64_set_msi_irq_affinity(struct irq_data *idata,
> >   	msg.data = data;
> >     	pci_write_msi_msg(irq, &msg);
> > -	cpumask_copy(irq_data_get_affinity_mask(idata), cpumask_of(cpu));
> > +	irq_data_update_affinity(idata, cpumask_of(cpu));
> >     	return 0;
> >   }
> > @@ -132,7 +132,7 @@ static int dmar_msi_set_affinity(struct irq_data *data,
> >   	msg.address_lo |= MSI_ADDR_DEST_ID_CPU(cpu_physical_id(cpu));
> >     	dmar_msi_write(irq, &msg);
> > -	cpumask_copy(irq_data_get_affinity_mask(data), mask);
> > +	irq_data_update_affinity(data, mask);
> >     	return 0;
> >   }
> > diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
> > index 0fe2d79fb123..5ebb1771b4ab 100644
> > --- a/arch/parisc/kernel/irq.c
> > +++ b/arch/parisc/kernel/irq.c
> > @@ -315,7 +315,7 @@ unsigned long txn_affinity_addr(unsigned int irq, int cpu)
> >   {
> >   #ifdef CONFIG_SMP
> >   	struct irq_data *d = irq_get_irq_data(irq);
> > -	cpumask_copy(irq_data_get_affinity_mask(d), cpumask_of(cpu));
> > +	irq_data_update_affinity(d, cpumask_of(cpu));
> >   #endif
> >     	return per_cpu(cpu_data, cpu).txn_addr;
> > diff --git a/drivers/irqchip/irq-bcm6345-l1.c b/drivers/irqchip/irq-bcm6345-l1.c
> > index 142a7431745f..6899e37810a8 100644
> > --- a/drivers/irqchip/irq-bcm6345-l1.c
> > +++ b/drivers/irqchip/irq-bcm6345-l1.c
> > @@ -216,11 +216,11 @@ static int bcm6345_l1_set_affinity(struct irq_data *d,
> >   		enabled = intc->cpus[old_cpu]->enable_cache[word] & mask;
> >   		if (enabled)
> >   			__bcm6345_l1_mask(d);
> > -		cpumask_copy(irq_data_get_affinity_mask(d), dest);
> > +		irq_data_update_affinity(d, dest);
> >   		if (enabled)
> >   			__bcm6345_l1_unmask(d);
> >   	} else {
> > -		cpumask_copy(irq_data_get_affinity_mask(d), dest);
> > +		irq_data_update_affinity(d, dest);
> >   	}
> >   	raw_spin_unlock_irqrestore(&intc->lock, flags);
> >   diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
> > index 8a3b0c3a1e92..3a8c98615634 100644
> > --- a/drivers/parisc/iosapic.c
> > +++ b/drivers/parisc/iosapic.c
> > @@ -677,7 +677,7 @@ static int iosapic_set_affinity_irq(struct irq_data *d,
> >   	if (dest_cpu < 0)
> >   		return -1;
> >   -	cpumask_copy(irq_data_get_affinity_mask(d),
> > cpumask_of(dest_cpu));
> > +	irq_data_update_affinity(d, cpumask_of(dest_cpu));
> >   	vi->txn_addr = txn_affinity_addr(d->irq, dest_cpu);
> >     	spin_lock_irqsave(&iosapic_lock, flags);
> > diff --git a/drivers/sh/intc/chip.c b/drivers/sh/intc/chip.c
> > index 358df7510186..828d81e02b37 100644
> > --- a/drivers/sh/intc/chip.c
> > +++ b/drivers/sh/intc/chip.c
> > @@ -72,7 +72,7 @@ static int intc_set_affinity(struct irq_data *data,
> >   	if (!cpumask_intersects(cpumask, cpu_online_mask))
> >   		return -1;
> >   -	cpumask_copy(irq_data_get_affinity_mask(data), cpumask);
> > +	irq_data_update_affinity(data, cpumask);
> >     	return IRQ_SET_MASK_OK_NOCOPY;
> >   }
> > diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
> > index 46d9295d9a6e..5e8321f43cbd 100644
> > --- a/drivers/xen/events/events_base.c
> > +++ b/drivers/xen/events/events_base.c
> > @@ -528,9 +528,10 @@ static void bind_evtchn_to_cpu(evtchn_port_t evtchn, unsigned int cpu,
> >   	BUG_ON(irq == -1);
> >     	if (IS_ENABLED(CONFIG_SMP) && force_affinity) {
> > -		cpumask_copy(irq_get_affinity_mask(irq), cpumask_of(cpu));
> > -		cpumask_copy(irq_get_effective_affinity_mask(irq),
> > -			     cpumask_of(cpu));
> > +		struct irq_data *data = irq_get_irq_data(irq);
> > +
> > +		irq_data_update_affinity(data, cpumask_of(cpu));
> > +		irq_data_update_effective_affinity(data, cpumask_of(cpu));
> >   	}
> 
> 
> 
> Nit: commit description says about reusing irq_data_update_affinity()
> only, but here we also reuse irq_data_update_effective_affinity(), so
> I would mention that in the description.
> 
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> # Xen bits

b4 shouts because of your email address:

NOTE: some trailers ignored due to from/email mismatches:
    ! Trailer: Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> # Xen bits
     Msg From: Oleksandr <olekstysh@gmail.com>

I've used the tag anyway, but you may want to fix your setup in the
future.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

