Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4828D45FA43
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:27:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233696.405794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmV4-0002ee-3X; Sat, 27 Nov 2021 01:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233696.405794; Sat, 27 Nov 2021 01:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmV3-0002JT-2g; Sat, 27 Nov 2021 01:27:33 +0000
Received: by outflank-mailman (input) for mailman id 233696;
 Sat, 27 Nov 2021 01:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmSo-0004gG-4k
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:25:14 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dea4d502-4f20-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 02:25:13 +0100 (CET)
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
X-Inumbo-ID: dea4d502-4f20-11ec-b941-1df2895da90e
Message-ID: <20211127000919.061417652@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637976313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=hCvJ3RXlnaO1z2W7zc0iNOJLM+aNENiBxAWv9ZJQoBs=;
	b=o8NYvWJiQDxWXpNPxaflbtBocZCwzg6JQwTztqKiBUx1s8Eyt8inNuHUyfyUYS3PYb3J2h
	GtjvCVQiuZ9dcbibJD6A9m9xeDByAXCaqvIsoNq4vjqpuYs4lWUQAuKtOGpeWoHbTTx2tm
	BVt7U+YgAfGs0WNKegcRzL14VhZcP+9M1hRyrHXcva/rc25nyD2q703ZIdFZO19jlfaYxN
	YjXKYwcVg+3zgNa7ULIcInHsERImfsvF8MRImc7fPIqp9oeawMaHrTK9JFjBz9WXaorgfJ
	X2ers5j0B3gX9Ih84tyCeMOQ2ZzQPaXzUPZ+q3SzZpvILV9dHaMjcKKM5YK8IA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637976313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=hCvJ3RXlnaO1z2W7zc0iNOJLM+aNENiBxAWv9ZJQoBs=;
	b=552puWH/+Fck0R9LjfqTBJ6G/hk4FIGJft4PCGMgUO4G7s5bYRHYh3Z+2DTpFR4KCZl6OK
	kuID/+K9LLNsx5Cw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Cooper <amc96@cam.ac.uk>,
 Juergen Gross <jgross@suse.com>,
 linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: [patch 10/10] x86/apic/msi: Support MSI-X vector expansion
References: <20211126233124.618283684@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:25:12 +0100 (CET)

The X86 PCI/MSI irq domaim implementation supports vector expansion out of
the box. Make it available.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/apic/msi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/x86/kernel/apic/msi.c
+++ b/arch/x86/kernel/apic/msi.c
@@ -178,7 +178,7 @@ static struct msi_domain_ops pci_msi_dom
 
 static struct msi_domain_info pci_msi_domain_info = {
 	.flags		= MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-			  MSI_FLAG_PCI_MSIX,
+			  MSI_FLAG_PCI_MSIX | MSI_FLAG_CAN_EXPAND,
 	.ops		= &pci_msi_domain_ops,
 	.chip		= &pci_msi_controller,
 	.handler	= handle_edge_irq,
@@ -226,7 +226,7 @@ static struct irq_chip pci_msi_ir_contro
 
 static struct msi_domain_info pci_msi_ir_domain_info = {
 	.flags		= MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-			  MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX,
+			  MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX | MSI_FLAG_CAN_EXPAND,
 	.ops		= &pci_msi_domain_ops,
 	.chip		= &pci_msi_ir_controller,
 	.handler	= handle_edge_irq,


