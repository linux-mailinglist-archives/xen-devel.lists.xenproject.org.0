Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E7425388B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 21:50:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kB1RK-0003WT-E9; Wed, 26 Aug 2020 19:50:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zw2O=CE=kernel.org=maz@srs-us1.protection.inumbo.net>)
 id 1kB1RJ-0003WO-Iq
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 19:50:33 +0000
X-Inumbo-ID: 5d8a7a81-f1c6-4996-8fde-8e0fa3194aec
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d8a7a81-f1c6-4996-8fde-8e0fa3194aec;
 Wed, 26 Aug 2020 19:50:33 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18DCE20737;
 Wed, 26 Aug 2020 19:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598471432;
 bh=KBI1XSZ0Ad4xgoosNG6cTrKv6S5jK+snnqWS91Va+wE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=wVAlzqBnZxrhwq4g59h1BqgZe4cjmugIYxbR5GIGwfeysAM6eAc4CWYIqW9hF3LAZ
 sSNgA34LV7NKVzYibSSl1Tj/m+gZW9MyM3uMkINrrmLoqO+RIHYDkNyzJ9NT72H8W3
 iXfYUmSWAaJOeprSTR4wThp63ynt9XVjYxRatDfE=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kB1RG-006xgP-FJ; Wed, 26 Aug 2020 20:50:30 +0100
Date: Wed, 26 Aug 2020 20:50:28 +0100
Message-ID: <87a6yh2nln.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [patch V2 04/46] genirq/chip: Use the first chip in
 irq_chip_compose_msi_msg()
In-Reply-To: <20200826112331.047917603@linutronix.de>
References: <20200826111628.794979401@linutronix.de>
 <20200826112331.047917603@linutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 EasyPG/1.0.0 Emacs/26.3
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tglx@linutronix.de, linux-kernel@vger.kernel.org,
 x86@kernel.org, joro@8bytes.org, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, haiyangz@microsoft.com,
 jonathan.derrick@intel.com, baolu.lu@linux.intel.com, wei.liu@kernel.org,
 kys@microsoft.com, sthemmin@microsoft.com, steve.wahl@hpe.com,
 sivanich@hpe.com, rja@hpe.com, linux-pci@vger.kernel.org, bhelgaas@google.com,
 lorenzo.pieralisi@arm.com, konrad.wilk@oracle.com,
 xen-devel@lists.xenproject.org, jgross@suse.com, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
 megha.dey@intel.com, jgg@mellanox.com, dave.jiang@intel.com,
 alex.williamson@redhat.com, jacob.jun.pan@intel.com, baolu.lu@intel.com,
 kevin.tian@intel.com, dan.j.williams@intel.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 26 Aug 2020 12:16:32 +0100,
Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> The documentation of irq_chip_compose_msi_msg() claims that with
> hierarchical irq domains the first chip in the hierarchy which has an
> irq_compose_msi_msg() callback is chosen. But the code just keeps
> iterating after it finds a chip with a compose callback.
> 
> The x86 HPET MSI implementation relies on that behaviour, but that does not
> make it more correct.
> 
> The message should always be composed at the domain which manages the
> underlying resource (e.g. APIC or remap table) because that domain knows
> about the required layout of the message.
> 
> On X86 the following hierarchies exist:
> 
> 1)   vector -------- PCI/MSI
> 2)   vector -- IR -- PCI/MSI
> 
> The vector domain has a different message format than the IR (remapping)
> domain. So obviously the PCI/MSI domain can't compose the message without
> having knowledge about the parent domain, which is exactly the opposite of
> what hierarchical domains want to achieve.
> 
> X86 actually has two different PCI/MSI chips where #1 has a compose
> callback and #2 does not. #2 delegates the composition to the remap domain
> where it belongs, but #1 does it at the PCI/MSI level.
> 
> For the upcoming device MSI support it's necessary to change this and just
> let the first domain which can compose the message take care of it. That
> way the top level chip does not have to worry about it and the device MSI
> code does not need special knowledge about topologies. It just sets the
> compose callback to NULL and lets the hierarchy pick the first chip which
> has one.
> 
> Due to that the attempt to move the compose callback from the direct
> delivery PCI/MSI domain to the vector domain made the system fail to boot
> with interrupt remapping enabled because in the remapping case
> irq_chip_compose_msi_msg() keeps iterating and choses the compose callback
> of the vector domain which obviously creates the wrong format for the remap
> table.
> 
> Break out of the loop when the first irq chip with a compose callback is
> found and fixup the HPET code temporarily. That workaround will be removed
> once the direct delivery compose callback is moved to the place where it
> belongs in the vector domain.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V2: New patch. Note, that this might break other stuff which relies on the
>     current behaviour, but the hierarchy composition of DT based chips is
>     really hard to follow.

Grepping around, I don't think there is any occurrence of two irqchips
providing irq_compose_msi() that can share a hierarchy on any real
system, so we should be fine. Famous last words.

> ---
>  arch/x86/kernel/apic/msi.c |    7 +++++--
>  kernel/irq/chip.c          |   12 +++++++++---
>  2 files changed, 14 insertions(+), 5 deletions(-)
> 
> --- a/arch/x86/kernel/apic/msi.c
> +++ b/arch/x86/kernel/apic/msi.c
> @@ -479,10 +479,13 @@ struct irq_domain *hpet_create_irq_domai
>  	info.type = X86_IRQ_ALLOC_TYPE_HPET;
>  	info.hpet_id = hpet_id;
>  	parent = irq_remapping_get_ir_irq_domain(&info);
> -	if (parent == NULL)
> +	if (parent == NULL) {
>  		parent = x86_vector_domain;
> -	else
> +	} else {
>  		hpet_msi_controller.name = "IR-HPET-MSI";
> +		/* Temporary fix: Will go away */
> +		hpet_msi_controller.irq_compose_msi_msg = NULL;
> +	}
>  
>  	fn = irq_domain_alloc_named_id_fwnode(hpet_msi_controller.name,
>  					      hpet_id);
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -1544,10 +1544,16 @@ int irq_chip_compose_msi_msg(struct irq_
>  	struct irq_data *pos = NULL;
>  
>  #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
> -	for (; data; data = data->parent_data)
> -#endif
> -		if (data->chip && data->chip->irq_compose_msi_msg)
> +	for (; data; data = data->parent_data) {
> +		if (data->chip && data->chip->irq_compose_msi_msg) {
>  			pos = data;
> +			break;
> +		}
> +	}
> +#else
> +	if (data->chip && data->chip->irq_compose_msi_msg)
> +		pos = data;
> +#endif
>  	if (!pos)
>  		return -ENOSYS;
>  
> 
> 

Is it just me, or is this last change more complex than it ought to be?

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 857f5f4c8098..25e18b73699c 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1544,7 +1544,7 @@ int irq_chip_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 	struct irq_data *pos = NULL;
 
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
-	for (; data; data = data->parent_data)
+	for (; data && !pos; data = data->parent_data)
 #endif
 		if (data->chip && data->chip->irq_compose_msi_msg)
 			pos = data;

Though the for loop in a #ifdef in admittedly an acquired taste...

Reviewed-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.

