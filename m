Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CD66601C2
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 15:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472655.732960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnKE-0008Vp-Tb; Fri, 06 Jan 2023 14:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472655.732960; Fri, 06 Jan 2023 14:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnKE-0008T3-Q8; Fri, 06 Jan 2023 14:04:02 +0000
Received: by outflank-mailman (input) for mailman id 472655;
 Fri, 06 Jan 2023 14:04:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g6IK=5D=citrix.com=prvs=36316be06=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pDnKD-0008St-1X
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 14:04:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f67f4809-8dca-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 15:03:59 +0100 (CET)
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
X-Inumbo-ID: f67f4809-8dca-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673013839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DJMl9lyCpvXVrpBfjxQaBv2r/oW5Se5HYnobbelCQy4=;
  b=epOnTaofThDJkCAZfopEpRQFBFaGItTRZHFdA7DlrkFAL0MhBQeMAM8p
   QDgYw8aY2IE1z56cnS3cR5ww2u6nyFlzmLQ5JNvn4eoulFfjFH2274UVU
   kslua9c+73eQ3zCuf+M7yB1yownobN/904frTtebFrBCctXUbPbhX4d5Z
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91894645
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qjrk46/Sj8krt9LOfMKhDrUDMH6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mIeXGvTOPnbN2qned4iOonjoR4A7cTWxtYxSQM6riE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AdmPKgV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklM3
 NNDFBMwXCq+lv+N/+KkZ/JKv5gaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZQMzhfE+
 D6bl4j/Khwlb4av1hikyGyxi8HOmA7BBplVSKLto5aGh3XMnzdOWXX6T2CTrPWkg1SyXPpfI
 kYX/TEy664/6CSDVNj2XxSirDiEsxgQVsBLFOsS7ACLw7DTpQGDCQAsSyVdQMYruM8/WXoh0
 Vrht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHLpYgphR/LCN97HqOxhNToHBn/x
 jmLqG41gLB7pdcG0rj+8V3ZjjaEoJ/PQQgooALNUQqN5BlyZJOuZJ6A4F/fq/1HKe6xVUKdt
 XIJn8yf6uEmDpyXkiGJBuIXE9mB//yCNi/dh19HBZQt9z2xvXWkeOh4+DhjIG95P8BCfiXmC
 HI/oisIusUVZiHzK/YqPcThUKzG0JQMC/znf9+PUvlzUKJMZRK8w3FxSFW25jzUxR1Efb4EB
 b+XdsOlDHA/AKthzSarS+p17YLH1hzS1kuIG8mlkk3PPa62ISfMFOxbaAfmgvURtvvsnenDz
 zpI2yJmIT17Wfa2XCTY+JV7wbsifSliXsCeRyC6m4e+zuta9IMJUaS5LVAJIdYNc0FpegDgo
 BmAtrdwkgaXuJE+AVzihopfQL3uR41jinkwIDYhO12ls1B6P9n1vftEKstmIeh2nACG8RKSZ
 6NVEylnKq0WIgkrBhxHNcWtxGCcXE7Daf2y09qNP2FkIs8Iq/3h8d74ZAr/nBQz4t6MnZJm+
 dWIj1qLKafvsiw+VK46ntrzlQLu1ZXc8couN3b1zi57Ih20qtYyc3ah0pfa4agkcH3++9dT7
 C7OaT9wmAUHi9NdHAXh7Uxck7qULg==
IronPort-HdrOrdr: A9a23:l907BKm4XICYeUhJ1BKpyShd6wnpDfIT3DAbv31ZSRFFG/Fw9v
 rAoB1/73TJYVkqKRcdcK+7UpVoLUmskKKdgrN9AV7BZmXbUQKTRelfBO3Zslnd8kbFh4xgPM
 lbAs9DIey1Ll5wjcuS2njaLz9a+re6GVeT5ds3oh1WLD1XVw==
X-IronPort-AV: E=Sophos;i="5.96,305,1665460800"; 
   d="scan'208";a="91894645"
Date: Fri, 6 Jan 2023 14:03:52 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
CC: <qemu-devel@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <Y7gqSLo8pMm4gfV+@perard.uk.xensource.com>
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>

On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:
> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> as noted in docs/igd-assign.txt in the Qemu source code.
> 
> Currently, when the xl toolstack is used to configure a Xen HVM guest with
> Intel IGD passthrough to the guest with the Qemu upstream device model,
> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> a different slot. This problem often prevents the guest from booting.
> 
> The only available workaround is not good: Configure Xen HVM guests to use
> the old and no longer maintained Qemu traditional device model available
> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
> 
> To implement this feature in the Qemu upstream device model for Xen HVM
> guests, introduce the following new functions, types, and macros:
> 
> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
> * typedef XenPTQdevRealize function pointer
> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
> * xen_igd_reserve_slot and xen_igd_clear_slot functions
> 
> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
> the xl toolstack with the gfx_passthru option enabled, which sets the
> igd-passthru=on option to Qemu for the Xen HVM machine type.
> 
> The new xen_igd_reserve_slot function also needs to be implemented in
> hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
> when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
> in which case it does nothing.
> 
> The new xen_igd_clear_slot function overrides qdev->realize of the parent
> PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
> since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
> created in hw/i386/pc_piix.c for the case when igd-passthru=on.
> 
> Move the call to xen_host_pci_device_get, and the associated error
> handling, from xen_pt_realize to the new xen_igd_clear_slot function to
> initialize the device class and vendor values which enables the checks for
> the Intel IGD to succeed. The verification that the host device is an
> Intel IGD to be passed through is done by checking the domain, bus, slot,
> and function values as well as by checking that gfx_passthru is enabled,
> the device class is VGA, and the device vendor in Intel.
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>


This patch looks good enough. It only changes the "xenfv" machine so it
doesn't prevent a proper fix to be done in the toolstack libxl.

The change in xen_pci_passthrough_class_init() to try to run some code
before pci_qdev_realize() could potentially break in the future due to
been uncommon but hopefully that will be ok.

So if no work to fix libxl appear soon, I'm ok with this patch:

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

