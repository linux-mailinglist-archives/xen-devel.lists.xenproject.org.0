Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9108D9EECCF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 16:38:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856184.1268894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLlGX-0000sn-FD; Thu, 12 Dec 2024 15:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856184.1268894; Thu, 12 Dec 2024 15:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLlGX-0000qN-Cc; Thu, 12 Dec 2024 15:38:13 +0000
Received: by outflank-mailman (input) for mailman id 856184;
 Thu, 12 Dec 2024 15:38:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1tLlGV-0000qH-Ns
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 15:38:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tLlGS-00HDGM-0o;
 Thu, 12 Dec 2024 15:38:08 +0000
Received: from lfbn-gre-1-248-145.w90-112.abo.wanadoo.fr ([90.112.205.145]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tLlGS-00HDu8-0f;
 Thu, 12 Dec 2024 15:38:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=d7loXoRdZ1igJ2wSUNEYwLh4PTsFsCd6B3/p+qYULSc=; b=bkByxIa/CoW+nko918KJQjFIPz
	DpLSy+OCroVMzwDEVBu3hhE3XRRmlqksMueSpOAONgq9QCP1dN/R5BayQr7DgqzvTKC83fBkPa1L8
	xkw9e5lqCPwHGPI/tCJ0q/YebUPfnkr/B+wUaal4L2XSq9JM47YCUEbwa4gAuC+m+Ogo=;
Date: Thu, 12 Dec 2024 16:38:05 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [QEMU PATCH v10] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Message-ID: <Z1sDXYATWad0Rbyf@l14>
References: <20241106061418.3655304-1-Jiqian.Chen@amd.com>
 <Zztlvl0m-Oi2XGXq@l14>
 <BL1PR12MB58491C9D1CCC1880C442AF73E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR12MB58491C9D1CCC1880C442AF73E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Tue, Dec 10, 2024 at 07:17:30AM +0000, Chen, Jiqian wrote:
> On 2024/11/19 00:05, Anthony PERARD wrote:
> > On Wed, Nov 06, 2024 at 02:14:18PM +0800, Jiqian Chen wrote:
> >> In PVH dom0, when passthrough a device to domU, QEMU code
> >> xen_pt_realize->xc_physdev_map_pirq wants to use gsi, but in current codes
> >> the gsi number is got from file /sys/bus/pci/devices/<sbdf>/irq, that is
> >> wrong, because irq is not equal with gsi, they are in different spaces, so
> >> pirq mapping fails.
> >>
> >> To solve above problem, use new interface of Xen, xc_pcidev_get_gsi to get
> >> gsi and use xc_physdev_map_pirq_gsi to map pirq when dom0 is PVH.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> > 
> > Acked-by: Anthony PERARD <anthony@xenproject.org>
> > 
> > But, this following change probably needs an ack from PCI maintaners,
> > CCed.
> As PCI maintainers didn't response for weeks,
> can I just move the definition of the macro back to xen_pt.c file ?

No, that's fine. I should be able to send a pull-request with this
change without too much trouble.

Cheers,

> >> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> >> index eb26cac81098..07805aa8a5f3 100644
> >> --- a/include/hw/pci/pci.h
> >> +++ b/include/hw/pci/pci.h
> >> @@ -23,6 +23,10 @@ extern bool pci_available;
> >>  #define PCI_SLOT_MAX            32
> >>  #define PCI_FUNC_MAX            8
> >>  
> >> +#define PCI_SBDF(seg, bus, dev, func) \
> >> +            ((((uint32_t)(seg)) << 16) | \
> >> +            (PCI_BUILD_BDF(bus, PCI_DEVFN(dev, func))))
> >> +
> >>  /* Class, Vendor and Device IDs from Linux's pci_ids.h */
> >>  #include "hw/pci/pci_ids.h"

-- 
Anthony PERARD

