Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4D5461211
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 11:22:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234467.406864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrdnK-0005DC-H7; Mon, 29 Nov 2021 10:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234467.406864; Mon, 29 Nov 2021 10:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrdnK-0005Ad-E6; Mon, 29 Nov 2021 10:21:58 +0000
Received: by outflank-mailman (input) for mailman id 234467;
 Mon, 29 Nov 2021 10:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GXrI=QQ=alpha.franken.de=tsbogend@srs-se1.protection.inumbo.net>)
 id 1mrdnJ-0005AX-C9
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 10:21:57 +0000
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1a4bdde7-50fe-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 11:21:23 +0100 (CET)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1mrdmz-0004dt-00; Mon, 29 Nov 2021 11:21:37 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 5E79DC2F89; Mon, 29 Nov 2021 11:21:16 +0100 (CET)
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
X-Inumbo-ID: 1a4bdde7-50fe-11ec-b941-1df2895da90e
Date: Mon, 29 Nov 2021 11:21:16 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparclinux@vger.kernel.org, x86@kernel.org,
	xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch 09/22] MIPS: Octeon: Use arch_setup_msi_irq()
Message-ID: <20211129102116.GA6158@alpha.franken.de>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.618089023@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126223824.618089023@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Nov 27, 2021 at 02:18:48AM +0100, Thomas Gleixner wrote:
> The core code provides the same loop code except for the MSI-X reject. Move
> that to arch_setup_msi_irq() and remove the duplicated code.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/pci/msi-octeon.c |   32 +++-----------------------------
>  1 file changed, 3 insertions(+), 29 deletions(-)
> 
> --- a/arch/mips/pci/msi-octeon.c
> +++ b/arch/mips/pci/msi-octeon.c
> @@ -68,6 +68,9 @@ int arch_setup_msi_irq(struct pci_dev *d
>  	u64 search_mask;
>  	int index;
>  
> +	if (desc->pci.msi_attrib.is_msix)
> +		return -EINVAL;
> +
>  	/*
>  	 * Read the MSI config to figure out how many IRQs this device
>  	 * wants.  Most devices only want 1, which will give
> @@ -182,35 +185,6 @@ int arch_setup_msi_irq(struct pci_dev *d
>  	return 0;
>  }
>  
> -int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
> -{
> -	struct msi_desc *entry;
> -	int ret;
> -
> -	/*
> -	 * MSI-X is not supported.
> -	 */
> -	if (type == PCI_CAP_ID_MSIX)
> -		return -EINVAL;
> -
> -	/*
> -	 * If an architecture wants to support multiple MSI, it needs to
> -	 * override arch_setup_msi_irqs()
> -	 */
> -	if (type == PCI_CAP_ID_MSI && nvec > 1)
> -		return 1;
> -
> -	for_each_pci_msi_entry(entry, dev) {
> -		ret = arch_setup_msi_irq(dev, entry);
> -		if (ret < 0)
> -			return ret;
> -		if (ret > 0)
> -			return -ENOSPC;
> -	}
> -
> -	return 0;
> -}
> -
>  /**
>   * Called when a device no longer needs its MSI interrupts. All
>   * MSI interrupts for the device are freed.

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

