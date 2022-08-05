Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D5B58ADB3
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 17:53:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381392.616050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzdw-0003bV-M2; Fri, 05 Aug 2022 15:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381392.616050; Fri, 05 Aug 2022 15:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzdw-0003Zd-J3; Fri, 05 Aug 2022 15:53:44 +0000
Received: by outflank-mailman (input) for mailman id 381392;
 Fri, 05 Aug 2022 15:53:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nMRl=YJ=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1oJzdv-0003ZX-1E
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 15:53:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6849c38-14d6-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 17:53:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D607A61650;
 Fri,  5 Aug 2022 15:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC75C433D6;
 Fri,  5 Aug 2022 15:53:38 +0000 (UTC)
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
X-Inumbo-ID: c6849c38-14d6-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659714819;
	bh=Se9SDt2ZRUYRFX0hcwxM1N0Mmp3ukORJJk2HQ8WaVaY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=XIJWkthvmMKa2TLp3F4zcXLYpo4kTFhJjk1H5JoWwig5ysxrTbTUIFl4lOjz5lUP3
	 HOKDtG+GNhRRc2VIplQd1a8h3nNwWuY/pkKWPSFQ9L4a4j95cTxf2fU+nLe3OwbJUX
	 /nB9iGBOEG8ocqYToPKrIo55C0rJdbhF0gyg+HfYpcjNBGEij9YJ/+OGf1p13Dp1Fc
	 zm9+8b6z/AKORN2R15lbjBL77g0aPEpagxkDgrBKTD59Lk0XZeIZQ8pHPGbVxFM20N
	 6Jp3xrphEXDwAziNP8EQcwFw1XtfnYeWzg4elHpU4+1TSPqapRsIyngI9YsQl+bmFR
	 Q0bP+Smjg7XlQ==
Date: Fri, 5 Aug 2022 10:53:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Josef Johansson <josef@oderland.se>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] PCI/MSI: Correct use of can_mask in msi_add_msi_desc()
Message-ID: <20220805155336.GA1005417@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yu0IwZXyTIhdALMb@nvidia.com>

On Fri, Aug 05, 2022 at 09:10:41AM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 05, 2022 at 12:03:15PM +0200, Josef Johansson wrote:
> > On 2/14/22 11:07, Josef Johansson wrote:
> > > From: Josef Johansson <josef@oderland.se>
> > > 
> > > PCI/MSI: Correct use of can_mask in msi_add_msi_desc()
> > > Commit 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()") modifies
> > > the logic of checking msi_attrib.can_mask, without any reason.
> > > This commits restores that logic.
> > >
> > > Fixes: 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()")
> > > Signed-off-by: Josef Johansson <josef@oderland.se>
> > > 
> > > ---
> > > v2: Changing subject line to fit earlier commits.
> > > 
> > > Trying to fix a NULL BUG in the NVMe MSIX implementation I stumbled upon this code,
> > > which ironically was what my last MSI patch resulted into.
> > > 
> > > I don't see any reason why this logic was change, and it did not break anything
> > > correcting the logic.
> > > 
> > > CC xen-devel since it very much relates to Xen kernel (via pci_msi_ignore_mask).
> > > ---
> > > 
> > > diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> > > index c19c7ca58186..146e7b9a01cc 100644
> > > --- a/drivers/pci/msi/msi.c
> > > +++ b/drivers/pci/msi/msi.c
> > > @@ -526,7 +526,7 @@ static int msix_setup_msi_descs(struct pci_dev *dev, void __iomem *base,
> > >   		desc.pci.msi_attrib.can_mask = !pci_msi_ignore_mask &&
> > >   					       !desc.pci.msi_attrib.is_virtual;
> > > -		if (!desc.pci.msi_attrib.can_mask) {
> > > +		if (desc.pci.msi_attrib.can_mask) {
> > >   			addr = pci_msix_desc_addr(&desc);
> > >   			desc.pci.msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
> > >   		}
> > > 
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Bjorn, please take it?

Thanks for the ping.  Since 71020a3c0dff4 is by Thomas, and he merged
that along with a whole series of MSI work, I think I probably
expected him to take care of this.

This looks like a simple typo, so I think the commit log should be
reworded along that line, e.g., something like:

  71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()") inadvertently
  reversed the sense of "msi_attrib.can_mask" in one use:

    - if (entry->pci.msi_attrib.can_mask) {
    -         addr = pci_msix_desc_addr(entry);
    -         entry->pci.msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
    + if (!desc.pci.msi_attrib.can_mask) {
    +         addr = pci_msix_desc_addr(&desc);
    +         desc.pci.msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);

  Restore the original test.

Thomas, do you want to take this?  I'm happy to merge it, but would
like your reviewed-by or ack first.

Bjorn

