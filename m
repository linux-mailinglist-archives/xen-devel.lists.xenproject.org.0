Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06341434B97
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 14:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213898.372255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdB4K-0006Rx-1F; Wed, 20 Oct 2021 12:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213898.372255; Wed, 20 Oct 2021 12:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdB4J-0006PW-Tf; Wed, 20 Oct 2021 12:51:43 +0000
Received: by outflank-mailman (input) for mailman id 213898;
 Wed, 20 Oct 2021 12:51:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Avag=PI=kernel.org=maz@srs-us1.protection.inumbo.net>)
 id 1mdB4I-0006PQ-01
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 12:51:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fb0b4fb-9cfb-488c-8ad8-de24bb31e1b4;
 Wed, 20 Oct 2021 12:51:40 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44AC060F56;
 Wed, 20 Oct 2021 12:51:40 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mdB4D-000R4N-Ux; Wed, 20 Oct 2021 13:51:38 +0100
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
X-Inumbo-ID: 2fb0b4fb-9cfb-488c-8ad8-de24bb31e1b4
Date: Wed, 20 Oct 2021 13:51:37 +0100
Message-ID: <877de7dfl2.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Josef Johansson <josef@oderland.se>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	linux-pci@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jason Andryuk <jandryuk@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2] PCI/MSI: Re-add checks for skip masking MSI-X on Xen PV
In-Reply-To: <5f050b30-fa1c-8387-0d6b-a667851b34b0@oderland.se>
References: <20211019202906.GA2397931@bhelgaas>
	<5f050b30-fa1c-8387-0d6b-a667851b34b0@oderland.se>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: josef@oderland.se, helgaas@kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, jandryuk@gmail.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Tue, 19 Oct 2021 22:48:19 +0100,
Josef Johansson <josef@oderland.se> wrote:
> 
> From: Josef Johansson <josef@oderland.se>
> 
> 
> PCI/MSI: Re-add checks for skip masking MSI-X on Xen PV
>     
> commit fcacdfbef5a1 ("PCI/MSI: Provide a new set of mask and unmask
> functions") introduce functions pci_msi_update_mask() and 
> pci_msix_write_vector_ctrl() that is missing checks for
> pci_msi_ignore_mask that exists in commit 446a98b19fd6 ("PCI/MSI: Use
> new mask/unmask functions"). Add them back since it is
> causing severe lockups in amdgpu drivers under Xen during boot.
> 
> As explained in commit 1a519dc7a73c ("PCI/MSI: Skip masking MSI-X
> on Xen PV"), when running as Xen PV guest, masking MSI-X is a 
> responsibility of the hypervisor.
> 
> Fixes: fcacdfbef5a1 ("PCI/MSI: Provide a new set of mask and unmask
> functions")
> Suggested-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Josef Johansson <josef@oderland.se>
>

[...]

>
> diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
> index 0099a00af361..355b791e382f 100644
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -148,6 +148,9 @@ static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 s
>  	raw_spinlock_t *lock = &desc->dev->msi_lock;
>  	unsigned long flags;
>  
> +	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
> +		return;
> +

I'd rather be consistent, and keep the check outside of
pci_msi_update_mask(), just like we do in __pci_msi_mask_desc().
Something like this instead:

diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
index 0099a00af361..6c69eab304ce 100644
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -420,7 +420,8 @@ static void __pci_restore_msi_state(struct pci_dev *dev)
 	arch_restore_msi_irqs(dev);
 
 	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
-	pci_msi_update_mask(entry, 0, 0);
+	if (!(pci_msi_ignore_mask || desc->msi_attrib.is_virtual))
+		pci_msi_update_mask(entry, 0, 0);
 	control &= ~PCI_MSI_FLAGS_QSIZE;
 	control |= (entry->msi_attrib.multiple << 4) | PCI_MSI_FLAGS_ENABLE;
 	pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);

But the commit message talks about MSI-X, and the above is MSI
only. Is Xen messing with the former, the latter, or both?

>  	raw_spin_lock_irqsave(lock, flags);
>  	desc->msi_mask &= ~clear;
>  	desc->msi_mask |= set;
> @@ -181,6 +184,9 @@ static void pci_msix_write_vector_ctrl(struct msi_desc *desc, u32 ctrl)
>  {
>  	void __iomem *desc_addr = pci_msix_desc_addr(desc);
>  
> +	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
> +		return;
> +
>  	writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
>  }

I have similar reservations for this one.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

