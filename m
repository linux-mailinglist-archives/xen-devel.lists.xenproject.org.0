Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF7643C6E8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 11:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216846.376609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffdc-0004fZ-Bm; Wed, 27 Oct 2021 09:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216846.376609; Wed, 27 Oct 2021 09:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffdc-0004cg-7e; Wed, 27 Oct 2021 09:54:28 +0000
Received: by outflank-mailman (input) for mailman id 216846;
 Wed, 27 Oct 2021 09:54:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EkRf=PP=oderland.se=josef@srs-us1.protection.inumbo.net>)
 id 1mffda-0004cW-9m
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:54:26 +0000
Received: from office.oderland.com (unknown [91.201.60.5])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55d0c856-024d-4e26-90fa-4b03ec1e4164;
 Wed, 27 Oct 2021 09:54:24 +0000 (UTC)
Received: from [193.180.18.161] (port=57000 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <josef@oderland.se>)
 id 1mffdX-00APdA-AN; Wed, 27 Oct 2021 11:54:23 +0200
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
X-Inumbo-ID: 55d0c856-024d-4e26-90fa-4b03ec1e4164
Message-ID: <d1cc20aa-5c5c-6c7b-2e5d-bc31362ad891@oderland.se>
Date: Wed, 27 Oct 2021 11:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Subject: Re: [PATCH] PCI/MSI: Move non-mask check back into low level
 accessors
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>
Cc: boris.ostrovsky@oracle.com, helgaas@kernel.org, jgross@suse.com,
 linux-pci@vger.kernel.org, maz@kernel.org, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>, Jason Andryuk <jandryuk@gmail.com>
References: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
 <20211025012503.33172-1-jandryuk@gmail.com> <87fssmg8k4.ffs@tglx>
 <87cznqg5k8.ffs@tglx>
From: Josef Johansson <josef@oderland.se>
In-Reply-To: <87cznqg5k8.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - office.oderland.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oderland.se
X-Get-Message-Sender-Via: office.oderland.com: authenticated_id: josjoh@oderland.se
X-Authenticated-Sender: office.oderland.com: josjoh@oderland.se

On 10/27/21 11:50, Thomas Gleixner wrote:
> The recent rework of PCI/MSI[X] masking moved the non-mask checks from the
> low level accessors into the higher level mask/unmask functions.
>
> This missed the fact that these accessors can be invoked from other places
> as well. The missing checks break XEN-PV which sets pci_msi_ignore_mask and
> also violates the virtual MSIX and the msi_attrib.maskbit protections.
>
> Instead of sprinkling checks all over the place, lift them back into the
> low level accessor functions. To avoid checking three different conditions
> combine them into one property of msi_desc::msi_attrib.
>
> Reported-by: Josef Johansson <josef@oderland.se>
> Fixes: fcacdfbef5a1 ("PCI/MSI: Provide a new set of mask and unmask functions")
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Andryuk <jandryuk@gmail.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Bjorn Helgaas <helgaas@kernel.org>
> Cc: linux-pci@vger.kernel.org
> Cc: xen-devel <xen-devel@lists.xenproject.org>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> ---
>  drivers/pci/msi.c   |   26 ++++++++++++++------------
>  include/linux/msi.h |    2 +-
>  2 files changed, 15 insertions(+), 13 deletions(-)
>
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -148,6 +148,9 @@ static noinline void pci_msi_update_mask
>  	raw_spinlock_t *lock = &desc->dev->msi_lock;
>  	unsigned long flags;
>  
> +	if (!desc->msi_attrib.can_mask)
> +		return;
> +
>  	raw_spin_lock_irqsave(lock, flags);
>  	desc->msi_mask &= ~clear;
>  	desc->msi_mask |= set;
> @@ -181,7 +184,8 @@ static void pci_msix_write_vector_ctrl(s
>  {
>  	void __iomem *desc_addr = pci_msix_desc_addr(desc);
>  
> -	writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
> +	if (desc->msi_attrib.can_mask)
> +		writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
>  }
>  
>  static inline void pci_msix_mask(struct msi_desc *desc)
> @@ -200,23 +204,17 @@ static inline void pci_msix_unmask(struc
>  
>  static void __pci_msi_mask_desc(struct msi_desc *desc, u32 mask)
>  {
> -	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
> -		return;
> -
>  	if (desc->msi_attrib.is_msix)
>  		pci_msix_mask(desc);
> -	else if (desc->msi_attrib.maskbit)
> +	else
>  		pci_msi_mask(desc, mask);
>  }
>  
>  static void __pci_msi_unmask_desc(struct msi_desc *desc, u32 mask)
>  {
> -	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
> -		return;
> -
>  	if (desc->msi_attrib.is_msix)
>  		pci_msix_unmask(desc);
> -	else if (desc->msi_attrib.maskbit)
> +	else
>  		pci_msi_unmask(desc, mask);
>  }
>  
> @@ -484,7 +482,8 @@ msi_setup_entry(struct pci_dev *dev, int
>  	entry->msi_attrib.is_64		= !!(control & PCI_MSI_FLAGS_64BIT);
>  	entry->msi_attrib.is_virtual    = 0;
>  	entry->msi_attrib.entry_nr	= 0;
> -	entry->msi_attrib.maskbit	= !!(control & PCI_MSI_FLAGS_MASKBIT);
> +	entry->msi_attrib.can_mask	= !pci_msi_ignore_mask &&
> +					  !!(control & PCI_MSI_FLAGS_MASKBIT);
>  	entry->msi_attrib.default_irq	= dev->irq;	/* Save IOAPIC IRQ */
>  	entry->msi_attrib.multi_cap	= (control & PCI_MSI_FLAGS_QMASK) >> 1;
>  	entry->msi_attrib.multiple	= ilog2(__roundup_pow_of_two(nvec));
> @@ -495,7 +494,7 @@ msi_setup_entry(struct pci_dev *dev, int
>  		entry->mask_pos = dev->msi_cap + PCI_MSI_MASK_32;
>  
>  	/* Save the initial mask status */
> -	if (entry->msi_attrib.maskbit)
> +	if (entry->msi_attrib.can_mask)
>  		pci_read_config_dword(dev, entry->mask_pos, &entry->msi_mask);
>  
>  out:
> @@ -638,10 +637,13 @@ static int msix_setup_entries(struct pci
>  		entry->msi_attrib.is_virtual =
>  			entry->msi_attrib.entry_nr >= vec_count;
>  
> +		entry->msi_attrib.can_mask	= !pci_msi_ignore_mask &&
> +						  !entry->msi_attrib.is_virtual;
> +
>  		entry->msi_attrib.default_irq	= dev->irq;
>  		entry->mask_base		= base;
>  
> -		if (!entry->msi_attrib.is_virtual) {
> +		if (!entry->msi_attrib.can_mask) {
>  			addr = pci_msix_desc_addr(entry);
>  			entry->msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
>  		}
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -148,7 +148,7 @@ struct msi_desc {
>  				u8	is_msix		: 1;
>  				u8	multiple	: 3;
>  				u8	multi_cap	: 3;
> -				u8	maskbit		: 1;
> +				u8	can_mask	: 1;
>  				u8	is_64		: 1;
>  				u8	is_virtual	: 1;
>  				u16	entry_nr;
Thanks,
I'll test this out ASAP.

