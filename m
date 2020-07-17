Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14172236A9
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 10:10:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwLRl-0006M2-Ga; Fri, 17 Jul 2020 08:10:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jwLRj-0006Lx-Lu
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 08:10:19 +0000
X-Inumbo-ID: f3c53b8e-c804-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3c53b8e-c804-11ea-b7bb-bc764e2007e4;
 Fri, 17 Jul 2020 08:10:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4EAF0B1AA;
 Fri, 17 Jul 2020 08:10:22 +0000 (UTC)
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
To: Rahul Singh <Rahul.Singh@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
Date: Fri, 17 Jul 2020 10:10:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.07.2020 19:10, Rahul Singh wrote:
> # Discovering PCI devices:
> 
> PCI-PCIe enumeration is a process of detecting devices connected to its host. It is the responsibility of the hardware domain or boot firmware to do the PCI enumeration and configure the BAR, PCI capabilities, and MSI/MSI-X configuration.
> 
> PCI-PCIe enumeration in XEN is not feasible for the configuration part as it would require a lot of code inside Xen which would require a lot of maintenance. Added to this many platforms require some quirks in that part of the PCI code which would greatly improve Xen complexity. Once hardware domain enumerates the device then it will communicate to XEN via the below hypercall.
> 
> #define PHYSDEVOP_pci_device_add        25
> struct physdev_pci_device_add {
>     uint16_t seg;
>     uint8_t bus;
>     uint8_t devfn;
>     uint32_t flags;
>     struct {
>     	uint8_t bus;
>     	uint8_t devfn;
>     } physfn;
>     /*
>     * Optional parameters array.
>     * First element ([0]) is PXM domain associated with the device (if * XEN_PCI_DEV_PXM is set)
>     */
>     uint32_t optarr[XEN_FLEX_ARRAY_DIM];
>     };
> 
> As the hypercall argument has the PCI segment number, XEN will access the PCI config space based on this segment number and find the host-bridge corresponding to this segment number. At this stage host bridge is fully initialized so there will be no issue to access the config space.
> 
> XEN will add the PCI devices in the linked list maintain in XEN using the function pci_add_device(). XEN will be aware of all the PCI devices on the system and all the device will be added to the hardware domain.

Have you had any thoughts about Dom0 re-arranging the bus numbering?
This is, afaict, a still open issue on x86 as well.

> Limitations:
> * When PCI devices are added to XEN, MSI capability is not initialized inside XEN and not supported as of now.

I think this is a pretty severe limitation, as modern devices tend to
not support pin based interrupts anymore.

> # Emulated PCI device tree node in libxl:
> 
> Libxl is creating a virtual PCI device tree node in the device tree to enable the guest OS to discover the virtual PCI during guest boot. We introduced the new config option [vpci="pci_ecam"] for guests. When this config option is enabled in a guest configuration, a PCI device tree node will be created in the guest device tree.

I support Stefano's suggestion for this to be an optional thing, i.e.
there to be no need for it when there are PCI devices assigned to the
guest anyway. I also wonder about the pci_ prefix here - isn't
vpci="ecam" as unambiguous?

> A new area has been reserved in the arm guest physical map at which the VPCI bus is declared in the device tree (reg and ranges parameters of the node). A trap handler for the PCI ECAM access from guest has been registered at the defined address and redirects requests to the VPCI driver in Xen.
> 
> Limitation:
> * Only one PCI device tree node is supported as of now.
> 
> BAR value and IOMEM mapping:
> 
> Linux guest will do the PCI enumeration based on the area reserved for ECAM and IOMEM ranges in the VPCI device tree node. Once PCI	device is assigned to the guest, XEN will map the guest PCI IOMEM region to the real physical IOMEM region only for the assigned devices.
> 
> As of now we have not modified the existing VPCI code to map the guest PCI IOMEM region to the real physical IOMEM region. We used the existing guest “iomem” config option to map the region.
> For example:
> 	Guest reserved IOMEM region:  0x04020000
>     	Real physical IOMEM region:0x50000000
>     	IOMEM size:128MB
>     	iomem config will be:   iomem = ["0x50000,0x8000@0x4020"]

This surely is planned to go away before the code hits upstream? The
ranges really should be read out of the BARs, as I see the
"limitations" section further down suggests, but it's not clear
whether "limitations" are items that you plan to take care of before
submitting your code for review.

Jan

