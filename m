Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBCA45F997
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233616.405566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmSQ-0007By-0E; Sat, 27 Nov 2021 01:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233616.405566; Sat, 27 Nov 2021 01:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmSP-00073z-Kq; Sat, 27 Nov 2021 01:24:49 +0000
Received: by outflank-mailman (input) for mailman id 233616;
 Sat, 27 Nov 2021 01:24:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmSN-0004gG-82
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:24:47 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce9696c0-4f20-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 02:24:46 +0100 (CET)
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
X-Inumbo-ID: ce9696c0-4f20-11ec-b941-1df2895da90e
Message-ID: <20211127000919.061417652@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637976286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=hCvJ3RXlnaO1z2W7zc0iNOJLM+aNENiBxAWv9ZJQoBs=;
	b=XC2Gl2AXYUosg2kIFrKUz3oPHKElC1X9JFf4x3rxNOfcEV8Sq7ff8QkEBIiBuBsTfaHNCM
	65bhXgRy5LZ9CnQBXg7GbCNI4vggc91+DCTEERsiANj0TGuDaiFlcTbB0M47vNHEjihjSW
	8DA00mBgmlvScWnWuX/6xFMQMcL0n5mNIlPxb5zZocO3pbdWx0Ofy1wQIIEqhY38Jgc0AN
	q500czOHWsLH6192qrfut6JygO3G0UlybO6Qtx41PQKuS/ypTmzA4msGtxAX4YLtPpouxb
	/3SyS/cHVyI76sDvXyavx8EUa0STgNuiEnp8ZEVMmX/DZiNkTIl1EM8TAZq2cQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637976286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=hCvJ3RXlnaO1z2W7zc0iNOJLM+aNENiBxAWv9ZJQoBs=;
	b=ailFWK1MoN7Bi6dOYGgm53UBim2lp4UpqheAs+DlCTXZcPa4k+6E5dnX9FNo8gNNMKECaq
	WAcA1zeyb1QOLQAQ==
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
Date: Sat, 27 Nov 2021 02:24:45 +0100 (CET)

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


