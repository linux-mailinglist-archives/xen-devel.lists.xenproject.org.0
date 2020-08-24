Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C49F24F216
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 07:10:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kA4jm-0005W6-GQ; Mon, 24 Aug 2020 05:09:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8JF=CC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kA4jk-0005W1-AJ
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 05:09:40 +0000
X-Inumbo-ID: 51d70586-08ed-4106-a455-222ad8ae6982
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51d70586-08ed-4106-a455-222ad8ae6982;
 Mon, 24 Aug 2020 05:09:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36A65AD71;
 Mon, 24 Aug 2020 05:10:06 +0000 (UTC)
Subject: Re: [patch RFC 23/38] x86/xen: Rework MSI teardown
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Lu Baolu
 <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
References: <20200821002424.119492231@linutronix.de>
 <20200821002947.575838946@linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c81c2536-2258-19b0-4d77-0de1d2fa88db@suse.com>
Date: Mon, 24 Aug 2020 07:09:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821002947.575838946@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 21.08.20 02:24, Thomas Gleixner wrote:
> X86 cannot store the irq domain pointer in struct device without breaking
> XEN because the irq domain pointer takes precedence over arch_*_msi_irqs()
> fallbacks.
> 
> XENs MSI teardown relies on default_teardown_msi_irqs() which invokes
> arch_teardown_msi_irq(). default_teardown_msi_irqs() is a trivial iterator
> over the msi entries associated to a device.
> 
> Implement this loop in xen_teardown_msi_irqs() to prepare for removal of
> the fallbacks for X86.
> 
> This is a preparatory step to wrap XEN MSI alloc/free into a irq domain
> which in turn allows to store the irq domain pointer in struct device and
> to use the irq domain functions directly.
> 
> Signed-off-by: Thomas Gleixner<tglx@linutronix.de>
> ---
>   arch/x86/pci/xen.c |   23 ++++++++++++++++++-----
>   1 file changed, 18 insertions(+), 5 deletions(-)
> 
> --- a/arch/x86/pci/xen.c
> +++ b/arch/x86/pci/xen.c
> @@ -376,20 +376,31 @@ static void xen_initdom_restore_msi_irqs
>   static void xen_teardown_msi_irqs(struct pci_dev *dev)
>   {
>   	struct msi_desc *msidesc;
> +	int i;
> +
> +	for_each_pci_msi_entry(msidesc, dev) {
> +		if (msidesc->irq) {
> +			for (i = 0; i < msidesc->nvec_used; i++)
> +				xen_destroy_irq(msidesc->irq + i);
> +		}
> +	}
> +}
> +
> +static void xen_pv_teardown_msi_irqs(struct pci_dev *dev)
> +{
> +	struct msi_desc *msidesc = first_pci_msi_entry(dev);
>   
> -	msidesc = first_pci_msi_entry(dev);
>   	if (msidesc->msi_attrib.is_msix)
>   		xen_pci_frontend_disable_msix(dev);
>   	else
>   		xen_pci_frontend_disable_msi(dev);
>   
> -	/* Free the IRQ's and the msidesc using the generic code. */
> -	default_teardown_msi_irqs(dev);
> +	xen_teardown_msi_irqs(dev);
>   }
>   
>   static void xen_teardown_msi_irq(unsigned int irq)
>   {
> -	xen_destroy_irq(irq);
> +	WARN_ON_ONCE(1);
>   }
>   
>   #endif
> @@ -412,7 +423,7 @@ int __init pci_xen_init(void)
>   #ifdef CONFIG_PCI_MSI
>   	x86_msi.setup_msi_irqs = xen_setup_msi_irqs;
>   	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
> -	x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
> +	x86_msi.teardown_msi_irqs = xen_pv_teardown_msi_irqs;
>   	pci_msi_ignore_mask = 1;
>   #endif
>   	return 0;
> @@ -436,6 +447,7 @@ static void __init xen_hvm_msi_init(void
>   	}
>   
>   	x86_msi.setup_msi_irqs = xen_hvm_setup_msi_irqs;
> +	x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
>   	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
>   }
>   #endif
> @@ -472,6 +484,7 @@ int __init pci_xen_initial_domain(void)
>   #ifdef CONFIG_PCI_MSI
>   	x86_msi.setup_msi_irqs = xen_initdom_setup_msi_irqs;
>   	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
> +	x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;

This should be xen_pv_teardown_msi_irqs, as pci_xen_initial_domain() is
called only for the pv initial domain case today.

>   	x86_msi.restore_msi_irqs = xen_initdom_restore_msi_irqs;
>   	pci_msi_ignore_mask = 1;
>   #endif
> 


Juergen

