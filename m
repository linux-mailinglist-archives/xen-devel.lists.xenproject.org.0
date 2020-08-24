Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1389124F20B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 06:59:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kA4Za-0004IO-Eu; Mon, 24 Aug 2020 04:59:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8JF=CC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kA4ZZ-0004IJ-B7
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 04:59:09 +0000
X-Inumbo-ID: 2f3800a0-1b82-4e4e-9672-6180a8b5c94c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f3800a0-1b82-4e4e-9672-6180a8b5c94c;
 Mon, 24 Aug 2020 04:59:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B36BAD2E;
 Mon, 24 Aug 2020 04:59:36 +0000 (UTC)
Subject: Re: [patch RFC 24/38] x86/xen: Consolidate XEN-MSI init
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
 <20200821002947.667887608@linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5caec213-8f56-9f12-34db-a29de8326f95@suse.com>
Date: Mon, 24 Aug 2020 06:59:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821002947.667887608@linutronix.de>
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
> To achieve this XEN MSI interrupt management needs to be wrapped into an
> irq domain.
> 
> Move the x86_msi ops setup into a single function to prepare for this.
> 
> Signed-off-by: Thomas Gleixner<tglx@linutronix.de>
> ---
>   arch/x86/pci/xen.c |   51 ++++++++++++++++++++++++++++++++-------------------
>   1 file changed, 32 insertions(+), 19 deletions(-)
> 
> --- a/arch/x86/pci/xen.c
> +++ b/arch/x86/pci/xen.c
> @@ -371,7 +371,10 @@ static void xen_initdom_restore_msi_irqs
>   		WARN(ret && ret != -ENOSYS, "restore_msi -> %d\n", ret);
>   	}
>   }
> -#endif
> +#else /* CONFIG_XEN_DOM0 */
> +#define xen_initdom_setup_msi_irqs	NULL
> +#define xen_initdom_restore_msi_irqs	NULL
> +#endif /* !CONFIG_XEN_DOM0 */
>   
>   static void xen_teardown_msi_irqs(struct pci_dev *dev)
>   {
> @@ -403,7 +406,31 @@ static void xen_teardown_msi_irq(unsigne
>   	WARN_ON_ONCE(1);
>   }
>   
> -#endif
> +static __init void xen_setup_pci_msi(void)
> +{
> +	if (xen_initial_domain()) {
> +		x86_msi.setup_msi_irqs = xen_initdom_setup_msi_irqs;
> +		x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
> +		x86_msi.restore_msi_irqs = xen_initdom_restore_msi_irqs;
> +		pci_msi_ignore_mask = 1;

This is wrong, as a PVH initial domain shouldn't do the pv settings.

The "if (xen_initial_domain())" should be inside the pv case, like:

if (xen_pv_domain()) {
	if (xen_initial_domain()) {
		...
	} else {
		...
	}
} else if (xen_hvm_domain()) {
	...

Juergen

