Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C88146C4ED
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 21:54:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241802.418302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhTC-0002wN-1e; Tue, 07 Dec 2021 20:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241802.418302; Tue, 07 Dec 2021 20:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhTB-0002t3-UA; Tue, 07 Dec 2021 20:53:49 +0000
Received: by outflank-mailman (input) for mailman id 241802;
 Tue, 07 Dec 2021 20:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XZh=QY=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1muhTA-0002sx-L2
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 20:53:48 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c44c4a2d-579f-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 21:53:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 16831CE1DFE;
 Tue,  7 Dec 2021 20:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E3EC341C1;
 Tue,  7 Dec 2021 20:53:38 +0000 (UTC)
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
X-Inumbo-ID: c44c4a2d-579f-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638910419;
	bh=0olJYQ/vZXxNbmux0Wc5kCG7Q8xmQSGJ4EEGX5/7MKM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MbREQLAmpD8wPLYpCv9jTSrE00gvmkjU34dG8bCGSdkkOx5lA5r+o1g2zoGSx/C2b
	 YIQIjqV/znJrCTHzH9zLIkNioxbfipIqhqype9Cd76anoG298O5tcN/hAXHTcgJr7E
	 AQhUCxkGye8vXivrflomiTMP5ytmmN4IV5kZwS7+LEBV8ahxK0/RPJjGnSoav8YdLu
	 Le2YSsXdQfJoyXe6klQp9YFPeJz/C9VdAwMAeftNu99ODwCGdjCd6c3CFrixrHlASA
	 bFHldg7thBUs+vtbfN+tcSAWID3FMjm+GzEoLKnTtAPWT54ggSkOvfr4XTjRaQ/uf3
	 5wndBP5xrSsFw==
Date: Tue, 7 Dec 2021 14:53:37 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Juergen Gross <jgross@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparclinux@vger.kernel.org, x86@kernel.org,
	xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 02/23] PCI/MSI: Fix
 pci_irq_vector()/pci_irq_get_affinity()
Message-ID: <20211207205337.GA76377@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210223.929792157@linutronix.de>

On Mon, Dec 06, 2021 at 11:27:26PM +0100, Thomas Gleixner wrote:
> pci_irq_vector() and pci_irq_get_affinity() use the list position to find the
> MSI-X descriptor at a given index. That's correct for the normal case where
> the entry number is the same as the list position.
> 
> But it's wrong for cases where MSI-X was allocated with an entries array
> describing sparse entry numbers into the hardware message descriptor
> table. That's inconsistent at best.
> 
> Make it always check the entry number because that's what the zero base
> index really means. This change won't break existing users which use a
> sparse entries array for allocation because these users retrieve the Linux
> interrupt number from the entries array after allocation and none of them
> uses pci_irq_vector() or pci_irq_get_affinity().
> 
> Fixes: aff171641d18 ("PCI: Provide sensible IRQ vector alloc/free routines")
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> V2: Fix typo in subject - Jason
> ---
>  drivers/pci/msi.c |   26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -1187,19 +1187,24 @@ EXPORT_SYMBOL(pci_free_irq_vectors);
>  
>  /**
>   * pci_irq_vector - return Linux IRQ number of a device vector
> - * @dev: PCI device to operate on
> - * @nr: device-relative interrupt vector index (0-based).
> + * @dev:	PCI device to operate on
> + * @nr:		Interrupt vector index (0-based)
> + *
> + * @nr has the following meanings depending on the interrupt mode:
> + *   MSI-X:	The index in the MSI-X vector table
> + *   MSI:	The index of the enabled MSI vectors
> + *   INTx:	Must be 0
> + *
> + * Return: The Linux interrupt number or -EINVAl if @nr is out of range.
>   */
>  int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
>  {
>  	if (dev->msix_enabled) {
>  		struct msi_desc *entry;
> -		int i = 0;
>  
>  		for_each_pci_msi_entry(entry, dev) {
> -			if (i == nr)
> +			if (entry->msi_attrib.entry_nr == nr)
>  				return entry->irq;
> -			i++;
>  		}
>  		WARN_ON_ONCE(1);
>  		return -EINVAL;
> @@ -1223,17 +1228,22 @@ EXPORT_SYMBOL(pci_irq_vector);
>   * pci_irq_get_affinity - return the affinity of a particular MSI vector
>   * @dev:	PCI device to operate on
>   * @nr:		device-relative interrupt vector index (0-based).
> + *
> + * @nr has the following meanings depending on the interrupt mode:
> + *   MSI-X:	The index in the MSI-X vector table
> + *   MSI:	The index of the enabled MSI vectors
> + *   INTx:	Must be 0
> + *
> + * Return: A cpumask pointer or NULL if @nr is out of range
>   */
>  const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
>  {
>  	if (dev->msix_enabled) {
>  		struct msi_desc *entry;
> -		int i = 0;
>  
>  		for_each_pci_msi_entry(entry, dev) {
> -			if (i == nr)
> +			if (entry->msi_attrib.entry_nr == nr)
>  				return &entry->affinity->mask;
> -			i++;
>  		}
>  		WARN_ON_ONCE(1);
>  		return NULL;
> 

