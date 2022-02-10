Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3594B19E9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 00:57:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269995.464160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIJJH-00029j-99; Thu, 10 Feb 2022 23:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269995.464160; Thu, 10 Feb 2022 23:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIJJH-00027e-65; Thu, 10 Feb 2022 23:57:11 +0000
Received: by outflank-mailman (input) for mailman id 269995;
 Thu, 10 Feb 2022 23:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j1Ip=SZ=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1nIJJF-00027Y-5m
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 23:57:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27118a48-8acd-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 00:57:08 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94E6A61DAD;
 Thu, 10 Feb 2022 23:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71C8C004E1;
 Thu, 10 Feb 2022 23:57:05 +0000 (UTC)
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
X-Inumbo-ID: 27118a48-8acd-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644537426;
	bh=r005aX85VIhDDr1Vqtro622BMgk7L0dZNprygCBXBaw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ieJwcqB/SocXJkHqDl6ii25zQfJdPS1CH6V0MJRmm5a7EtPbpR/iwICaNqH7yoB5J
	 kjxIfWDDzZ3526HKJV/BztmIQYGRVJf05AbLJA0YNR9o5Swxth8bsRNlGFkBHNTAOB
	 et653UQpCnGnmAHvGDVnSkaujlx/ickOWgmtVKJlC6i4VUp1SNJtPlyEKIboPy1Kan
	 ro3nuRE4zTWHDfvDY9yntUt5hmY3TWk66+grZkOsgCJJVNyzT4XEn+HICXpoyqtuMo
	 eoEJrI0OicU/PeSMGEvp+9IOBVFICoVyGtxfhgiraKyc1W2Rv0ydHEsvab04RO7t9H
	 C90CwbjvFzNug==
Date: Thu, 10 Feb 2022 17:55:32 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Josef Johansson <josef@oderland.se>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] PCI/MSI: msix_setup_msi_descs: Restore logic for
 msi_attrib.can_mask
Message-ID: <20220210235532.GA663996@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5a224ee-b72f-7053-6030-b6c4d8a29be9@oderland.se>

[+cc Jason, since you reviewed the original commit]

On Sat, Jan 22, 2022 at 02:10:01AM +0100, Josef Johansson wrote:
> From: Josef Johansson <josef@oderland.se>
> 
> PCI/MSI: msix_setup_msi_descs: Restore logic for msi_attrib.can_mask

Please match the form and style of previous subject lines (in
particular, omit "msix_setup_msi_descs:").

> Commit 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()") modifies
> the logic of checking msi_attrib.can_mask, without any reason.
>     
> This commits restores that logic.

I agree, this looks like a typo in 71020a3c0dff4, but I might be
missing something, so Thomas should take a look, and I added Jason
since he reviewed it.

Since it was merged by Thomas, I'll let him take care of this, too.
If it *is* a typo, the fix looks like v5.17 material.

Before: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/msi/msi.c?id=71020a3c0dff4%5E#n522
After:  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/msi/msi.c?id=71020a3c0dff4#n520

> Fixes: 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()")
> Signed-off-by: Josef Johansson <josef@oderland.se>
> 
> ---
> Trying to fix a NULL BUG in the NVMe MSIX implementation I stumbled upon this code,
> which ironically was what my last MSI patch resulted into.
> 
> I don't see any reason why this logic was change, nor do I have the possibility
> to see if anything works with my patch or without, since the kernel crashes
> in other places.
> 
> As such this is still untested, but as far as I can tell it should restore
> functionality.
> 
> Re-sending since it was rejected by linux-pci@vger.kernel.org due to HTML contents.
> Sorry about that.
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

