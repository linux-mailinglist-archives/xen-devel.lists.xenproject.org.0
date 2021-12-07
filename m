Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3F346C500
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 21:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241810.418324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhUQ-00041Z-Nn; Tue, 07 Dec 2021 20:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241810.418324; Tue, 07 Dec 2021 20:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhUQ-0003zc-KQ; Tue, 07 Dec 2021 20:55:06 +0000
Received: by outflank-mailman (input) for mailman id 241810;
 Tue, 07 Dec 2021 20:55:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XZh=QY=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1muhUP-0003Ug-Qe
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 20:55:05 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3f85d8f-579f-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 21:55:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D73F3B81E7F;
 Tue,  7 Dec 2021 20:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A28BC341CA;
 Tue,  7 Dec 2021 20:55:03 +0000 (UTC)
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
X-Inumbo-ID: f3f85d8f-579f-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638910503;
	bh=Fa6UchSERsdNVXky6PNS2vCw8nCpV4RsTu7TPsjmB4I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dvUfGzkAJKzccQlv0HtPexRzXLWw3+BexhSfcjdhY9OELj9M9shyPr2oxlHYgishh
	 t4D2z7Bdr+ncSq9kKTlJ1eWwQvEyIE70QCOcHPfTkykUuEbmkImTsvOBxAh+YrDT2N
	 e2tXRjJ7AyPRQqOviSDYGDRtTGTym9+e84h6CsKaxpAqC8y47ShWjPbJ5Wc+6tQEDN
	 O+w8x6jcjhb24uXwmpRRwPhRkrIfIv7GvPutd6orOK9sOuf81nkdYTyVSsRwR7X0hy
	 UTGVn2mumg3zTPmrl6DdJIgD9FUL38mTDmd4Yy4CHa5XbrINFDsrU5l0x2T6JYzzJO
	 QyWBUWsq4OuoA==
Date: Tue, 7 Dec 2021 14:55:02 -0600
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
Subject: Re: [patch V2 07/23] PCI/MSI: Remove msi_desc_to_pci_sysdata()
Message-ID: <20211207205502.GA76553@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.210768199@linutronix.de>

On Mon, Dec 06, 2021 at 11:27:34PM +0100, Thomas Gleixner wrote:
> Last user is gone long ago.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi.c   |    8 --------
>  include/linux/msi.h |    5 -----
>  2 files changed, 13 deletions(-)
> 
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -1267,14 +1267,6 @@ struct pci_dev *msi_desc_to_pci_dev(stru
>  }
>  EXPORT_SYMBOL(msi_desc_to_pci_dev);
>  
> -void *msi_desc_to_pci_sysdata(struct msi_desc *desc)
> -{
> -	struct pci_dev *dev = msi_desc_to_pci_dev(desc);
> -
> -	return dev->bus->sysdata;
> -}
> -EXPORT_SYMBOL_GPL(msi_desc_to_pci_sysdata);
> -
>  #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
>  /**
>   * pci_msi_domain_write_msg - Helper to write MSI message to PCI config space
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -218,13 +218,8 @@ static inline void msi_desc_set_iommu_co
>  	for_each_msi_entry((desc), &(pdev)->dev)
>  
>  struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc);
> -void *msi_desc_to_pci_sysdata(struct msi_desc *desc);
>  void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg);
>  #else /* CONFIG_PCI_MSI */
> -static inline void *msi_desc_to_pci_sysdata(struct msi_desc *desc)
> -{
> -	return NULL;
> -}
>  static inline void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg)
>  {
>  }
> 

