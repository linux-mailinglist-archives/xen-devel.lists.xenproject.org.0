Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF4246DA6C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 18:54:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242559.419493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv17w-0000FX-3j; Wed, 08 Dec 2021 17:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242559.419493; Wed, 08 Dec 2021 17:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv17w-0000Co-0Q; Wed, 08 Dec 2021 17:53:12 +0000
Received: by outflank-mailman (input) for mailman id 242559;
 Wed, 08 Dec 2021 17:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rXGX=QZ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mv17v-0000Cg-3N
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 17:53:11 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b442a424-584f-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 18:53:09 +0100 (CET)
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
X-Inumbo-ID: b442a424-584f-11ec-9d12-4777fae47e2b
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638985988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3VE0nNlLZyDP2MmX/vYQZeWgKNo5Uy6Cr5E5oEyE//0=;
	b=yVnW54g9mJPoCSUF2QVZDU2f/xrPC/IYtzosNqipMCrUE3ublT0WkCXcFyPVrEXNiDojbG
	WW1CUtpK3VyoAq9fSgOMsdsrptfY0amXBwna/GvfaJqkTvsyAVL5hI1SpplK1OmRnxMVrX
	L5hSSsO8qCmLbj+GpNXsAcp58GYvqbj2Cej56RVnAFHSASUWcdaICSkYgNnc4MXsVS22aL
	8yNx41somh4ngRIGaL6Bs8mvddn976wAff7JClugcbIPHTmhPJafFg/+oWVQNEXsavVz8Q
	ECHb4fzOEv458qXYE4Q7kYbod/VikxJKFLy0KA5gkzv0UDl1V1bDcOOf7ps2JA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638985988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3VE0nNlLZyDP2MmX/vYQZeWgKNo5Uy6Cr5E5oEyE//0=;
	b=tcPpBzNArpjTicF6DwnR6v7vnK+DexgwPINycnkhbizry34b4Yd5f7r99TAQsJpmyDoy7E
	NsIoYzOvgoObEZDg==
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>, Laurentiu
 Tudor <laurentiu.tudor@nxp.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org, Vinod Koul
 <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy
 <robin.murphy@arm.com>, Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V2 20/36] x86/pci/XEN: Use device MSI properties
In-Reply-To: <20211208155314.GX6385@nvidia.com>
References: <20211206210307.625116253@linutronix.de>
 <20211206210438.742297272@linutronix.de>
 <20211208155314.GX6385@nvidia.com>
Date: Wed, 08 Dec 2021 18:53:07 +0100
Message-ID: <877dcf0yrg.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Dec 08 2021 at 11:53, Jason Gunthorpe wrote:
> On Mon, Dec 06, 2021 at 11:39:28PM +0100, Thomas Gleixner wrote:
>>  static void xen_pv_teardown_msi_irqs(struct pci_dev *dev)
>>  {
>> -	struct msi_desc *msidesc = first_pci_msi_entry(dev);
>> -
>> -	if (msidesc->pci.msi_attrib.is_msix)
>> +	if (msi_device_has_property(&dev->dev, MSI_PROP_PCI_MSIX))
>>  		xen_pci_frontend_disable_msix(dev);
>>  	else
>>  		xen_pci_frontend_disable_msi(dev);
>
> Same remark as for power, we have a pci_dev, so can it be
> dev->msix_enabled?

Yes, let me rework that.

