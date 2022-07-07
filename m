Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385B756A04C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 12:46:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362922.593205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9P0x-00075E-A9; Thu, 07 Jul 2022 10:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362922.593205; Thu, 07 Jul 2022 10:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9P0x-00072v-7b; Thu, 07 Jul 2022 10:45:43 +0000
Received: by outflank-mailman (input) for mailman id 362922;
 Thu, 07 Jul 2022 10:45:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjRc=XM=gmail.com=fancer.lancer@srs-se1.protection.inumbo.net>)
 id 1o9P0v-00072j-Gg
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 10:45:41 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f19552a3-fde1-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 12:45:40 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id r9so21701136ljp.9
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jul 2022 03:45:40 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a056512118200b0047f701f6d09sm6766233lfr.184.2022.07.07.03.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 03:45:37 -0700 (PDT)
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
X-Inumbo-ID: f19552a3-fde1-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WY98p2xpQdOFXmhJtt3xHyGiLiAUhi6XRf4hr9Uc3Wg=;
        b=b6GFfkBqjaMf2ocm+NmB4Pdq8BftwMkyn64oPaQ4MV4pvFzFkwxMEQeq6P80Hm4/xV
         qZ+8LuyU5wRQNERGgQNFjcHh58vvfaC0ptqNORWmxffraiT9/DjbcHTSFTsFBlux58Ot
         XhtqsfAx1Sa2gM/tjlsL0QsZtd9LNBgjw9CnnsV557EhbpHb9gCv8v2p+Oj+GmTrlkqp
         mUp+nL+5dVYNjaxqq1uCJh+k/gsHSTvygVI9uMaKcsKBGCdHzMWvDPsDHQivCRNcB3z5
         282ePxgRE2AokBxYCEN4Y+8PqCSOtSZbzmUbIGk4eL7kv/uEwV39B6EvqmW8CS1gOdOi
         UC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WY98p2xpQdOFXmhJtt3xHyGiLiAUhi6XRf4hr9Uc3Wg=;
        b=F3HtDHZ0NjqlQIoKY7fhsr/gDbMq/AeaB6AxTmaW9ILGsQG5HB31zizCE39qbLwENM
         HrmOBAIv39Om9sg+ZCV5eCYdYlpMQDJCzVFQwOGZEl7Hw68774pEaYnWJvLUp5t7jsMk
         DyQZn37hJ5qJkj/V4nAfEhDaYm3dJ6vxGOsJ0WZ6pT75Wsi+ila7tUUBF2Tn9dTFshJ5
         uGelobOnm7RKfrsiT6AiE1FzH7XhAFmU+oJj02khb0r3YaxvIYGWAaAIz6M2NSJljzEp
         kE8E0NNs7OhvXb/tYDBLirIQnj/H1b/Iowh394p0xL6QGaYMLvBQXNB/c6imcH0gfCZm
         uXCg==
X-Gm-Message-State: AJIora+fIsfncU/Z4gissEZsbLlanAgRT1knrEs83rM3IBeDmrtnVJFb
	D9xEBH0/PPW+27a6FaiZDlQ=
X-Google-Smtp-Source: AGRyM1u/4QG+lv01OuNQRv5dICfp1iMojBGdOQCB054Of0nHO6eJIDlEiA+XLi20gZMrDBLB66OBnA==
X-Received: by 2002:a05:651c:158a:b0:25d:1cc9:3ce7 with SMTP id h10-20020a05651c158a00b0025d1cc93ce7mr13652854ljq.450.1657190739851;
        Thu, 07 Jul 2022 03:45:39 -0700 (PDT)
Date: Thu, 7 Jul 2022 13:45:33 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Zankel <chris@zankel.net>,
	Colin Ian King <colin.king@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dexuan Cui <decui@microsoft.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jan Beulich <jbeulich@suse.com>, Joerg Roedel <joro@8bytes.org>,
	Juergen Gross <jgross@suse.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Kees Cook <keescook@chromium.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Maximilian Heyne <mheyne@amazon.de>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Rich Felker <dalias@libc.org>, Richard Henderson <rth@twiddle.net>,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>,
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Sven Schnelle <svens@stackframe.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Wei Liu <wei.liu@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
	Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	iommu@lists.linux-foundation.org, iommu@lists.linux.dev,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	x86@kernel.org, xen-devel@lists.xenproject.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/8] irqchip/mips-gic: Only register IPI domain when
 SMP is enabled
Message-ID: <20220707104533.7iakliv2f5i2qi33@mobilestation>
References: <20220701200056.46555-1-samuel@sholland.org>
 <20220701200056.46555-2-samuel@sholland.org>
 <20220705135243.ydbwfo4kois64elr@mobilestation>
 <87czehmiwt.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87czehmiwt.wl-maz@kernel.org>

On Thu, Jul 07, 2022 at 09:22:26AM +0100, Marc Zyngier wrote:
> On Tue, 05 Jul 2022 14:52:43 +0100,
> Serge Semin <fancer.lancer@gmail.com> wrote:
> > 
> > Hi Samuel
> > 
> > On Fri, Jul 01, 2022 at 03:00:49PM -0500, Samuel Holland wrote:
> > > The MIPS GIC irqchip driver may be selected in a uniprocessor
> > > configuration, but it unconditionally registers an IPI domain.
> > > 
> > > Limit the part of the driver dealing with IPIs to only be compiled when
> > > GENERIC_IRQ_IPI is enabled, which corresponds to an SMP configuration.
> > 
> > Thanks for the patch. Some comment is below.
> > 
> > > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > > ---
> > > 
> > > Changes in v3:
> > >  - New patch to fix build errors in uniprocessor MIPS configs
> > > 
> > >  drivers/irqchip/Kconfig        |  3 +-
> > >  drivers/irqchip/irq-mips-gic.c | 80 +++++++++++++++++++++++-----------
> > >  2 files changed, 56 insertions(+), 27 deletions(-)
> > > 
> > > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > > index 1f23a6be7d88..d26a4ff7c99f 100644
> > > --- a/drivers/irqchip/Kconfig
> > > +++ b/drivers/irqchip/Kconfig
> > > @@ -322,7 +322,8 @@ config KEYSTONE_IRQ
> > >  
> > >  config MIPS_GIC
> > >  	bool
> > > -	select GENERIC_IRQ_IPI
> > > +	select GENERIC_IRQ_IPI if SMP
> > 
> > > +	select IRQ_DOMAIN_HIERARCHY
> > 
> > It seems to me that the IRQ domains hierarchy is supposed to be
> > created only if IPI is required. At least that's what the MIPS GIC
> > driver implies. Thus we can go further and CONFIG_IRQ_DOMAIN_HIERARCHY
> > ifdef-out the gic_irq_domain_alloc() and gic_irq_domain_free()
> > methods definition together with the initialization:
> > 
> >  static const struct irq_domain_ops gic_irq_domain_ops = {
> >  	.xlate = gic_irq_domain_xlate,
> > +#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
> >  	.alloc = gic_irq_domain_alloc,
> >  	.free = gic_irq_domain_free,
> > +#endif
> >  	.map = gic_irq_domain_map,
> > };
> > 
> > If the GENERIC_IRQ_IPI config is enabled, CONFIG_IRQ_DOMAIN_HIERARCHY
> > will be automatically selected (see the config definition in
> > kernel/irq/Kconfig). If the IRQs hierarchy is needed for some another
> > functionality like GENERIC_MSI_IRQ_DOMAIN or GPIOs then they will
> > explicitly enable the IRQ_DOMAIN_HIERARCHY config thus activating the
> > denoted .alloc and .free methods definitions.
> > 
> > To sum up you can get rid of the IRQ_DOMAIN_HIERARCHY config
> > force-select from this patch and make the MIPS GIC driver code a bit
> > more coherent.
> > 
> > @Marc, please correct me if were wrong.
> 

> Either way probably works correctly, but Samuel's approach is more
> readable IMO. It is far easier to reason about a high-level feature
> (GENERIC_IRQ_IPI) than an implementation detail (IRQ_DOMAIN_HIERARCHY).
> 

The main idea of my comment was to get rid of the forcible
IRQ_DOMAIN_HIERARCHY config selection, because the basic part of the
driver doesn't depends on the hierarchical IRQ-domains functionality.
It's needed only for IPIs and implicitly for the lower level IRQ
device drivers like GPIO or PCIe-controllers, which explicitly enable
the IRQ_DOMAIN_HIERARCHY config anyway. That's why instead of forcible
IRQ_DOMAIN_HIERARCHY config selection (see Samuel patch) I suggested
to make the corresponding functionality defined under the
IRQ_DOMAIN_HIERARCHY config ifdefs, thus having the driver capable of
creating the hierarchical IRQs domains only if it's required.

> If you really want to save a handful of bytes, you can make the
> callbacks conditional on GENERIC_IRQ_IPI, and be done with it.

AFAIU I can't in this case. It must be either IRQ_DOMAIN_HIERARCHY
ifdefs or explicit IRQ_DOMAIN_HIERARCHY select. There can be non-SMP
(UP) systems with no need in IPIs but for instance having a GPIO or
PCIe controller which require the hierarchical IRQ-domains support of
the parental IRQ controller. So making the callbacks definition
depended on the GENERIC_IRQ_IPI config state will break the driver for
these systems. That's why I suggested to use
CONFIG_IRQ_DOMAIN_HIERARCHY which activates the hierarchical IRQ
domains support in the IRQ-chip system (see the irq_domain_ops
structure conditional fields definition) and shall we have the
suggested approach implemented in the MIPS GIC driver.

-Sergey

> But this can come as an additional patch.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

