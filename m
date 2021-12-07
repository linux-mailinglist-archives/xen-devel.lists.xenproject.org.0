Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1366046C68F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 22:18:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241963.418589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhq7-0004X0-01; Tue, 07 Dec 2021 21:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241963.418589; Tue, 07 Dec 2021 21:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhq6-0004UC-TB; Tue, 07 Dec 2021 21:17:30 +0000
Received: by outflank-mailman (input) for mailman id 241963;
 Tue, 07 Dec 2021 21:17:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XZh=QY=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1muhh3-0000d3-4e
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 21:08:09 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6439ae3-57a1-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 22:08:07 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DC252CE1E22;
 Tue,  7 Dec 2021 21:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8250C341C1;
 Tue,  7 Dec 2021 21:08:04 +0000 (UTC)
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
X-Inumbo-ID: c6439ae3-57a1-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638911285;
	bh=Un8pVb1ViG+hHJBV0K32UXMvYIETtBkFtRlli7CA0QM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=aCbzd0NEb2pQzyZ0dxCVmc3D7+wht440q0E0LtCH9EBL6AmXweh77FA6vFVv+lovw
	 QxUM8o9yuv91Owv+YX0uqXzLPMe9Xmgrdwsq/Q0XtDXLOgeHXtR/qWyue29zAHe+qn
	 ZNo6fhJJvBTogag2oEBDmFwEwkYMA/6cjrRB9/RvEo/WrLVjhaCtSMKZ3lJBI/ML0e
	 H2WKoiCX7z7ZcvhMozBDewcD4TrkbQVYFGuZQ6IhOk/J97KO7Fn9gfBhXnI6eBTMOi
	 jxz2bdl5MIQY5mZHQt4K9hdDQz+EBL7RNknLIwfMhihldvflaMJpn9QmDetpivNk4I
	 5elH8aZ6ytVgA==
Date: Tue, 7 Dec 2021 15:08:03 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	linux-ntb@googlegroups.com
Subject: Re: [patch V2 19/31] PCI: hv: Rework MSI handling
Message-ID: <20211207210803.GA78366@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210748.629363944@linutronix.de>

On Mon, Dec 06, 2021 at 11:51:33PM +0100, Thomas Gleixner wrote:
> Replace the about to vanish iterators and make use of the filtering. Take
> the descriptor lock around the iterators.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/controller/pci-hyperv.c |   15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -3445,18 +3445,23 @@ static int hv_pci_suspend(struct hv_devi
>  
>  static int hv_pci_restore_msi_msg(struct pci_dev *pdev, void *arg)
>  {
> -	struct msi_desc *entry;
>  	struct irq_data *irq_data;
> +	struct msi_desc *entry;
> +	int ret = 0;
>  
> -	for_each_pci_msi_entry(entry, pdev) {
> +	msi_lock_descs(&pdev->dev);
> +	msi_for_each_desc(entry, &pdev->dev, MSI_DESC_ASSOCIATED) {
>  		irq_data = irq_get_irq_data(entry->irq);
> -		if (WARN_ON_ONCE(!irq_data))
> -			return -EINVAL;
> +		if (WARN_ON_ONCE(!irq_data)) {
> +			ret = -EINVAL;
> +			break;
> +		}
>  
>  		hv_compose_msi_msg(irq_data, &entry->msg);
>  	}
> +	msi_unlock_descs(&pdev->dev);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /*
> 

