Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C939266CE73
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 19:12:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478927.742459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHTxK-0007xe-OX; Mon, 16 Jan 2023 18:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478927.742459; Mon, 16 Jan 2023 18:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHTxK-0007uB-KN; Mon, 16 Jan 2023 18:11:38 +0000
Received: by outflank-mailman (input) for mailman id 478927;
 Mon, 16 Jan 2023 18:11:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PHax=5N=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pHTxI-0007pU-OR
 for xen-devel@lists.xen.org; Mon, 16 Jan 2023 18:11:36 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36557bf5-95c9-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 19:11:35 +0100 (CET)
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
X-Inumbo-ID: 36557bf5-95c9-11ed-91b6-6bf2151ebd3b
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1673892694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AanC++QDp2/X9tKXMo/J9VwlKZ5d4eXbHEb+Q9Hnt7o=;
	b=y1ss6IxNbaBwoK/nSkiLVMK4xhBf4eEI4RJ2YAzKPab3tb+jXZIoYMhsoO1NxUetPzCoON
	jZturUXmt9NPLQChCJa8JGbKCOEVkmoE06aITmvClYb/XxbCvmNX/5/GTelHascVot5VUa
	e6eHDsSGQlWscVdYEtzQmJwBSr0VVDGXDIDN3MmFK9shs26olpIog+nrDAfiwQMKfbOM+g
	VzIx24GxtcwRguX46n7TBbG3r0k666yT+H/aOaYlG0AJbAuEtW/kMNaTCZe+g8L0XBNjOl
	UR+pytkgpLdn5NbDl5lAm6MaZhTW6Y5+gVWQ5jTbDh8UMpjdyNic6bN7tJhEvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1673892694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AanC++QDp2/X9tKXMo/J9VwlKZ5d4eXbHEb+Q9Hnt7o=;
	b=HIExVyuSu/+qg+7fM4/RkuaqgVgj503pGwc+sZraedRyuaXA+hHMtu78thc97w5zv8R+Bf
	XUhFu5GGulLb5lBw==
To: David Woodhouse <dwmw2@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>, xen-devel
 <xen-devel@lists.xen.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, linux-pci@vger.kernel.org, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Marc
 Zyngier <maz@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Logan Gunthorpe
 <logang@deltatee.com>, Ashok Raj <ashok.raj@intel.com>, Jon Mason
 <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>
Subject: Re: [patch V3 16/22] genirq/msi: Provide new domain id based
 interfaces for freeing interrupts
In-Reply-To: <875yd6o2t7.ffs@tglx>
References: <20221124225331.464480443@linutronix.de>
 <20221124230314.337844751@linutronix.de>
 <1901d84f8f999ac6b2f067360f098828cb8c17cf.camel@infradead.org>
 <875yd6o2t7.ffs@tglx>
Date: Mon, 16 Jan 2023 19:11:32 +0100
Message-ID: <871qnunycr.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

David!

On Mon, Jan 16 2023 at 17:35, Thomas Gleixner wrote:
> On Mon, Jan 16 2023 at 09:56, David Woodhouse wrote:
>
> This is just wrong. I need to taxi my grandson. Will have a look
> afterwards.

There are three 'tglx missed to fixup XEN' problems:

 - b2bdda205c0c ("PCI/MSI: Let the MSI core free descriptors")

   This requires the MSI_FLAG_FREE_MSI_DESCS flag to be set in the XEN
   MSI domain info


 - 2f2940d16823 ("genirq/msi: Remove filter from msi_free_descs_free_range()")

   This requires the 'desc->irq = 0' disassociation on teardown.


 - ffd84485e6be ("PCI/MSI: Let the irq code handle sysfs groups")

   Lacks a flag in the XEN MSI domain info as well.

Combo patch below.

Thanks,

        tglx
---
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -392,6 +392,7 @@ static void xen_teardown_msi_irqs(struct
 	msi_for_each_desc(msidesc, &dev->dev, MSI_DESC_ASSOCIATED) {
 		for (i = 0; i < msidesc->nvec_used; i++)
 			xen_destroy_irq(msidesc->irq + i);
+		msidesc->irq = 0;
 	}
 }
 
@@ -434,6 +435,7 @@ static struct msi_domain_ops xen_pci_msi
 
 static struct msi_domain_info xen_pci_msi_domain_info = {
 	.ops			= &xen_pci_msi_domain_ops,
+	.flags			= MSI_FLAG_FREE_MSI_DESCS | MSI_FLAG_DEV_SYSFS,
 };
 
 /*

