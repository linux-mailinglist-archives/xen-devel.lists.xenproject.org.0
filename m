Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEA724CABF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 04:26:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wlH-0004yj-1o; Fri, 21 Aug 2020 02:26:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wcp-0002BQ-V5
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:17:51 +0000
X-Inumbo-ID: c6750e69-5f0a-4fcd-a9a6-59b67e2dd100
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6750e69-5f0a-4fcd-a9a6-59b67e2dd100;
 Fri, 21 Aug 2020 02:17:06 +0000 (UTC)
Message-Id: <20200821002947.464203710@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=dPxit2e89mZWZCCiMpEUS6iF/wsktMMgYd58N2BBpyo=;
 b=a95MDNskdEo+EDmYcXSnuFOWHSWxtCujQO0IV2xm/4C/eA0rxhBPT8ZNmHe0JYhniEINcb
 IFu1crITpj0j/TGl5HCfm3AoY0XUc3Mawzk8Q2Dbv4J9LrnFEOC707XBZ1om+quHOcCY8p
 LgRj6cN2UkF8//WimkFDZWyqLGbUMYGrgoDInMQTZjdg8lIsGb+jquyE79hW/y/j6cY8hH
 lO8qOsEcYlNYx5zG+jcNVSxjdUeHAAgwIfBlRyYMDm08vRIjZHIZWKabH+7B4FftfBQ9Rp
 Nqkl20FzWp7aAR60fjb+cmTF22y3ruiyerLL+9CYWZH7h9BuLq0q+vcnObBEBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=dPxit2e89mZWZCCiMpEUS6iF/wsktMMgYd58N2BBpyo=;
 b=I2nkTUkyNw4H5SXSR3lo/snSYOmbbBODI8HUl/uMOl6QGgZZinUUN3m2/fSKk5QNtF00Y1
 p7CEV1tcGok2HlBw==
Date: Fri, 21 Aug 2020 02:24:46 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonathan Derrick <jonathan.derrick@intel.com>,
 Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: [patch RFC 22/38] x86/xen: Make xen_msi_init() static and rename it
 to xen_hvm_msi_init()
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline; filename="x86-xen--Make-xen_msi_init"
Content-transfer-encoding: 8-bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The only user is in the same file and the name is too generic because this
function is only ever used for HVM domains.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-pci@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>

---
 arch/x86/pci/xen.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -419,7 +419,7 @@ int __init pci_xen_init(void)
 }
 
 #ifdef CONFIG_PCI_MSI
-void __init xen_msi_init(void)
+static void __init xen_hvm_msi_init(void)
 {
 	if (!disable_apic) {
 		/*
@@ -459,7 +459,7 @@ int __init pci_xen_hvm_init(void)
 	 * We need to wait until after x2apic is initialized
 	 * before we can set MSI IRQ ops.
 	 */
-	x86_platform.apic_post_init = xen_msi_init;
+	x86_platform.apic_post_init = xen_hvm_msi_init;
 #endif
 	return 0;
 }


