Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83607470D24
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:19:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244356.422688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoEA-0006kB-IS; Fri, 10 Dec 2021 22:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244356.422688; Fri, 10 Dec 2021 22:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoEA-0006eW-El; Fri, 10 Dec 2021 22:18:54 +0000
Received: by outflank-mailman (input) for mailman id 244356;
 Fri, 10 Dec 2021 22:18:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoE8-0005LK-GE
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:18:52 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 279d666a-5a07-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 23:18:51 +0100 (CET)
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
X-Inumbo-ID: 279d666a-5a07-11ec-a74f-db008197e53d
Message-ID: <20211210221813.493922179@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=cKJHJ5pvxdQcbJzsUJMGqgFGoQj9I03QbSL7vU1xGJs=;
	b=1jYFlR/s4Fj8fK94IM8CGV2VaLN70VTxWOKgzd9JP93YsuiSkhZnYFY06GM/ck1LqQztP1
	MLFaGOIeCqYoexBgXapeoyYhkU0pOjGlXAPId/ebxaePxjkxMr+yK8v+0hb5X4+5ZG7B1H
	+va0VUPX0Xv4Yu86zDErk4wKNgJjI/W705RdoDtPXV+TGIU1/gfVAaxPimBu0jir0PtNCO
	fOlCra2fXDQuTRaSAH0ZtTlPuz+4kAZXETO59wFrYfdqVEy+3UT6OV5Rro3KejHz+49vks
	CFqN18s6k1HR1ibmPHBMCiufu6FCMC8wl1bZC8BEvjjvQ7GzWILhEocUSrICGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=cKJHJ5pvxdQcbJzsUJMGqgFGoQj9I03QbSL7vU1xGJs=;
	b=CKltebaN9sJb+/12aypx+vxMoPzMz+hKX+LQCpakacpcX5G/L+sQu6V9DoCJj9DznHwv8C
	jZHW+tYr3PY7biBA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org,
 Cedric Le Goater <clg@kaod.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Sinan Kaya <okaya@kernel.org>
Subject: [patch V3 05/35] powerpc/cell/axon_msi: Use PCI device property
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:18:51 +0100 (CET)

From: Thomas Gleixner <tglx@linutronix.de>

instead of fiddling with MSI descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
V3: Use pci_dev property - Jason
V2: Invoke the function with the correct number of arguments - Andy
---
 arch/powerpc/platforms/cell/axon_msi.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -199,7 +199,6 @@ static struct axon_msic *find_msi_transl
 static int setup_msi_msg_address(struct pci_dev *dev, struct msi_msg *msg)
 {
 	struct device_node *dn;
-	struct msi_desc *entry;
 	int len;
 	const u32 *prop;
 
@@ -209,10 +208,8 @@ static int setup_msi_msg_address(struct
 		return -ENODEV;
 	}
 
-	entry = first_pci_msi_entry(dev);
-
 	for (; dn; dn = of_get_next_parent(dn)) {
-		if (entry->pci.msi_attrib.is_64) {
+		if (!dev->no_64bit_msi) {
 			prop = of_get_property(dn, "msi-address-64", &len);
 			if (prop)
 				break;


