Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016849D1507
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 17:06:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839400.1255201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD4Fj-0000sP-R5; Mon, 18 Nov 2024 16:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839400.1255201; Mon, 18 Nov 2024 16:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD4Fj-0000pj-OW; Mon, 18 Nov 2024 16:05:27 +0000
Received: by outflank-mailman (input) for mailman id 839400;
 Mon, 18 Nov 2024 16:05:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1tD4Fi-0000pd-7g
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 16:05:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tD4Fe-00BId7-02;
 Mon, 18 Nov 2024 16:05:22 +0000
Received: from lfbn-gre-1-248-145.w90-112.abo.wanadoo.fr ([90.112.205.145]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tD4Fd-00FG94-2H;
 Mon, 18 Nov 2024 16:05:21 +0000
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
	bh=hOPsZNwuk5Of7mPpSe/MIV1efYXeimkHvzOur3w1rP4=; b=OQiXcgEPsvbrw034DEWEss4y7z
	PawOfKRjrWzYq6BaK+BXlU+cGyDwlKKR1CVR9AtldNz1qsLTncbQCyiZX/De9bEQlExXt9YXDW33V
	bOh386Z1BUnzZvOH6aEKLY1T4V9dhWVuF7NMfclqt3MZNvD+5hbN8DNyuwdjrZSUgS8s=;
Date: Mon, 18 Nov 2024 17:05:18 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Jiqian Chen <Jiqian.Chen@amd.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: Re: [QEMU PATCH v10] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Message-ID: <Zztlvl0m-Oi2XGXq@l14>
References: <20241106061418.3655304-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106061418.3655304-1-Jiqian.Chen@amd.com>

On Wed, Nov 06, 2024 at 02:14:18PM +0800, Jiqian Chen wrote:
> In PVH dom0, when passthrough a device to domU, QEMU code
> xen_pt_realize->xc_physdev_map_pirq wants to use gsi, but in current codes
> the gsi number is got from file /sys/bus/pci/devices/<sbdf>/irq, that is
> wrong, because irq is not equal with gsi, they are in different spaces, so
> pirq mapping fails.
> 
> To solve above problem, use new interface of Xen, xc_pcidev_get_gsi to get
> gsi and use xc_physdev_map_pirq_gsi to map pirq when dom0 is PVH.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Acked-by: Anthony PERARD <anthony@xenproject.org>

But, this following change probably needs an ack from PCI maintaners,
CCed.

> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index eb26cac81098..07805aa8a5f3 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -23,6 +23,10 @@ extern bool pci_available;
>  #define PCI_SLOT_MAX            32
>  #define PCI_FUNC_MAX            8
>  
> +#define PCI_SBDF(seg, bus, dev, func) \
> +            ((((uint32_t)(seg)) << 16) | \
> +            (PCI_BUILD_BDF(bus, PCI_DEVFN(dev, func))))
> +
>  /* Class, Vendor and Device IDs from Linux's pci_ids.h */
>  #include "hw/pci/pci_ids.h"

Thanks,

-- 
Anthony PERARD

