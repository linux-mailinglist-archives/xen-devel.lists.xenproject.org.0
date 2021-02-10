Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D54316929
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 15:30:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83622.156068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qV4-0003By-6d; Wed, 10 Feb 2021 14:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83622.156068; Wed, 10 Feb 2021 14:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qV4-0003Bd-3b; Wed, 10 Feb 2021 14:29:50 +0000
Received: by outflank-mailman (input) for mailman id 83622;
 Wed, 10 Feb 2021 14:29:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQOe=HM=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1l9qV2-0003BW-9Y
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 14:29:48 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9157564-3bfb-41fa-922f-11244f485e6d;
 Wed, 10 Feb 2021 14:29:47 +0000 (UTC)
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
X-Inumbo-ID: a9157564-3bfb-41fa-922f-11244f485e6d
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1612967386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Mcmrh40B4VXMR0jisEUU+cJGgnUcEN2FqgSKv/zts9E=;
	b=srlefx8a2kD8X/vmt4ioMIIxZZglHMRpj9VCzFN/sZPpXWWRXtpaDBFK7eWAhleW0djea+
	YEUrV/RvdNehfZL4K0XqkoIlp2saO19yN5Lb2+wnANLFHq8C5OH7CqomeG5YoJWrAurfBH
	3+bvaKz55Y7gzeoeMrAyk+im74WyP2QOTaotf9vnCpqAYX2boLeRqe/sdbw1GqSnrgmfpm
	ZeP3ZLO2X55/PxcAfxMWPwV3UuQEazJxBiL3EaVmGWNyRluCNzWVtbiFHpbYbnMnYyPMQG
	6qNtZLIr8v6CneWg5VStMIs9F0AuJhdZLzM8D11lZeM9Dga1yPkPLbtO7zDomQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1612967386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Mcmrh40B4VXMR0jisEUU+cJGgnUcEN2FqgSKv/zts9E=;
	b=EFO99bDjKUzkHNQTvugRYUNwQ8vOsXhGSENrxZIiNx7Y6K2/Pa2PR0WHFm501Blt1FDvOH
	cuS/REXCk4AFX7AQ==
To: lkml@nanos.tec.linutronix.de
Cc: Juergen Gross <jgross@suse.com>,x86@kernel.org,Bjorn Helgaas <helgaas@kernel.org>,xen-devel@lists.xenproject.org
Subject: [PATCH] x86/pci: Create PCI/MSI irqdomain after x86_init.pci.arch_init()
Date: Wed, 10 Feb 2021 15:29:44 +0100
Message-ID: <87sg64dmhz.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

Invoking x86_init.irqs.create_pci_msi_domain() before
x86_init.pci.arch_init() breaks XEN PV.

The XEN_PV specific pci.arch_init() function overrides the default
create_pci_msi_domain() which is obviously too late.

As a consequence the XEN PV PCI/MSI allocation goes through the native
path which runs out of vectors and causes malfunction.

Invoke it after x86_init.pci.arch_init().

Fixes: 6b15ffa07dc3 ("x86/irq: Initialize PCI/MSI domain at PCI init time")
Reported-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Cc: stable@vger.kernel.org
---
 arch/x86/pci/init.c |   15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

--- a/arch/x86/pci/init.c
+++ b/arch/x86/pci/init.c
@@ -9,16 +9,23 @@
    in the right sequence from here. */
 static __init int pci_arch_init(void)
 {
-	int type;
-
-	x86_create_pci_msi_domain();
+	int type, pcbios = 1;
 
 	type = pci_direct_probe();
 
 	if (!(pci_probe & PCI_PROBE_NOEARLY))
 		pci_mmcfg_early_init();
 
-	if (x86_init.pci.arch_init && !x86_init.pci.arch_init())
+	if (x86_init.pci.arch_init)
+		pcbios = x86_init.pci.arch_init();
+
+	/*
+	 * Must happen after x86_init.pci.arch_init(). Xen sets up the
+	 * x86_init.irqs.create_pci_msi_domain there.
+	 */
+	x86_create_pci_msi_domain();
+
+	if (!pcbios)
 		return 0;
 
 	pci_pcbios_init();

