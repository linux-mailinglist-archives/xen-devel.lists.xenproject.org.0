Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACC25A2BBA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 17:51:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393984.633220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRbcE-0001lJ-3z; Fri, 26 Aug 2022 15:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393984.633220; Fri, 26 Aug 2022 15:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRbcE-0001iw-1D; Fri, 26 Aug 2022 15:51:26 +0000
Received: by outflank-mailman (input) for mailman id 393984;
 Fri, 26 Aug 2022 15:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cYJx=Y6=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1oRbcC-0001io-92
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 15:51:24 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef2f08cd-2556-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 17:51:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4610DB831C4;
 Fri, 26 Aug 2022 15:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9ACC433D6;
 Fri, 26 Aug 2022 15:51:20 +0000 (UTC)
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
X-Inumbo-ID: ef2f08cd-2556-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661529081;
	bh=O/y28TF/cUc/1ZIQvc0DnYy+2d6TDwpxl4xZ14O/Wkk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Xh+Xa5sfnMq9bcour0b1JBqGR8NAwLHqtPlON3ae1tBXbK3i3e5h//diO+JBaONtf
	 TUZyVM2aB122aOut3vfLqJr0ROF8JDyJS6wcy9wf+BzrLZgV7yuS3ElUXzdnddbTWb
	 DXUkVqN9Hl0JYG5EcN6HVmWvYWep4vJo9z6HJnK0fVfQ6F9NneiUmNQvGttmQSNKGl
	 u7JF8WcU+pMTdX85ctPYJXYZQmFD0mzVPaf2H1k2oVPUhVe7nG5yieWeLtgRxGwAoh
	 TH1PCejkt0bdebsOPhTYIamNq6U7epZT6tHpjfgnv1Kf03pLp/KGiKYk6W2sR5fCTw
	 e7Qg4q4PMWH8g==
Date: Fri, 26 Aug 2022 10:51:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Josef Johansson <josef@oderland.se>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] PCI/MSI: Correct use of can_mask in msi_add_msi_desc()
Message-ID: <20220826155119.GA2933552@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d818f9c9-a432-213e-4152-eaff3b7da52e@oderland.se>

On Mon, Feb 14, 2022 at 11:07:47AM +0100, Josef Johansson wrote:
> From: Josef Johansson <josef@oderland.se>
> 
> PCI/MSI: Correct use of can_mask in msi_add_msi_desc()
>     
> Commit 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()") modifies
> the logic of checking msi_attrib.can_mask, without any reason.
>     
> This commits restores that logic.
> 
> Fixes: 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()")
> Signed-off-by: Josef Johansson <josef@oderland.se>

Applied to pci/misc for v6.1 with commit log below, thanks!

  PCI/MSI: Correct 'can_mask' test in msi_add_msi_desc()

  71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()") inadvertently reversed
  the sense of "msi_attrib.can_mask" in one use:

    - if (entry->pci.msi_attrib.can_mask) {
    -         addr = pci_msix_desc_addr(entry);
    -         entry->pci.msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
    + if (!desc.pci.msi_attrib.can_mask) {
    +         addr = pci_msix_desc_addr(&desc);
    +         desc.pci.msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);

  Restore the original test.

> ---
> v2: Changing subject line to fit earlier commits.
> 
> Trying to fix a NULL BUG in the NVMe MSIX implementation I stumbled upon this code,
> which ironically was what my last MSI patch resulted into.
> 
> I don't see any reason why this logic was change, and it did not break anything
> correcting the logic.
> 
> CC xen-devel since it very much relates to Xen kernel (via pci_msi_ignore_mask).
> ---
> 
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index c19c7ca58186..146e7b9a01cc 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -526,7 +526,7 @@ static int msix_setup_msi_descs(struct pci_dev *dev, void __iomem *base,
>  		desc.pci.msi_attrib.can_mask = !pci_msi_ignore_mask &&
>  					       !desc.pci.msi_attrib.is_virtual;
>  
> -		if (!desc.pci.msi_attrib.can_mask) {
> +		if (desc.pci.msi_attrib.can_mask) {
>  			addr = pci_msix_desc_addr(&desc);
>  			desc.pci.msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
>  		}
> 
> --
> 2.31.1
> 
> 

