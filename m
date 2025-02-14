Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A494A3644C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 18:20:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888966.1298221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tizMI-0004IM-Fq; Fri, 14 Feb 2025 17:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888966.1298221; Fri, 14 Feb 2025 17:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tizMI-0004Ft-Ci; Fri, 14 Feb 2025 17:20:10 +0000
Received: by outflank-mailman (input) for mailman id 888966;
 Fri, 14 Feb 2025 17:20:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7iqD=VF=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tizMH-0004Fn-5x
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 17:20:09 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef577b9f-eaf7-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 18:20:07 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D1A1DA432A1;
 Fri, 14 Feb 2025 17:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B756C4CED1;
 Fri, 14 Feb 2025 17:20:05 +0000 (UTC)
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
X-Inumbo-ID: ef577b9f-eaf7-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739553605;
	bh=ImR/H03Fz4Z1T2OIgnxXyz5cLfo4flLh8ujWylDSZOI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Amg8E2wkP2edVPx90dl1V4QZWeCCFvQAnVtFuo5FdCOEeLORk9Sb92pwX/C0wqik+
	 epcIvD8Xb1cBdG6ZyGesb3tXveqGFWjCZc6zggt8QLa/E4IiqLn5c/+QpI1MKr6mW4
	 UfQziHO8zAiZuB9QiXjVFlb1P25DnYkaqOTycTzE9a2n+WqK1ouRIPtm/IXYsaUz6j
	 PM0Yyjl5hXpQE6MV6bUEguAx3GbgbiDXdtQtnadDJtSNXYwGWMY+2ThVvgNY0ObboC
	 mUjyXJg0bGstlcqz93a5xHioEwjt4V4Q9bROOqEq/Lo+MPD/ST/MBnJo3SMwEQP63N
	 gOPapvo3J6erA==
Date: Fri, 14 Feb 2025 11:20:02 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2 1/3] xen/pci: do not register devices with segments >=
 0x10000
Message-ID: <20250214172002.GA157276@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250114103315.51328-2-roger.pau@citrix.com>

It looks like the convention for this file is to capitalize the
subject, e.g.,

  xen/pci: Do not register ...

On Tue, Jan 14, 2025 at 11:33:11AM +0100, Roger Pau Monne wrote:
> The current hypercall interface for doing PCI device operations always uses
> a segment field that has a 16 bit width.  However on Linux there are buses
> like VMD that hook up devices into the PCI hierarchy at segment >= 0x10000,
> after the maximum possible segment enumerated in ACPI.
> 
> Attempting to register or manage those devices with Xen would result in
> errors at best, or overlaps with existing devices living on the truncated
> equivalent segment values.  Note also that the VMD segment numbers are
> arbitrarily assigned by the OS, and hence there would need to be some
> negotiation between Xen and the OS to agree on how to enumerate VMD
> segments and devices behind them.
> 
> Skip notifying Xen about those devices.  Given how VMD bridges can
> multiplex interrupts on behalf of devices behind them there's no need for
> Xen to be aware of such devices for them to be usable by Linux.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Adjust commit message width to 75 columns.
>  - Expand commit message.
> ---
>  drivers/xen/pci.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
> index 416f231809cb..08e82fd1263e 100644
> --- a/drivers/xen/pci.c
> +++ b/drivers/xen/pci.c
> @@ -43,6 +43,13 @@ static int xen_add_device(struct device *dev)
>  		pci_mcfg_reserved = true;
>  	}
>  #endif
> +

I think a brief comment here would be helpful so people don't have to
dig out the commit log to understand why this is invalid for Xen.

> +	if (pci_domain_nr(pci_dev->bus) >> 16) {
> +		dev_info(dev,
> +			 "not registering with Xen: invalid PCI segment\n");
> +		return 0;
> +	}
> +
>  	if (pci_seg_supported) {
>  		DEFINE_RAW_FLEX(struct physdev_pci_device_add, add, optarr, 1);
>  
> @@ -149,6 +156,12 @@ static int xen_remove_device(struct device *dev)
>  	int r;
>  	struct pci_dev *pci_dev = to_pci_dev(dev);
>  
> +	if (pci_domain_nr(pci_dev->bus) >> 16) {
> +		dev_info(dev,
> +			 "not unregistering with Xen: invalid PCI segment\n");
> +		return 0;
> +	}
> +
>  	if (pci_seg_supported) {
>  		struct physdev_pci_device device = {
>  			.seg = pci_domain_nr(pci_dev->bus),
> @@ -182,6 +195,12 @@ int xen_reset_device(const struct pci_dev *dev)
>  		.flags = PCI_DEVICE_RESET_FLR,
>  	};
>  
> +	if (pci_domain_nr(dev->bus) >> 16) {
> +		dev_info(&dev->dev,
> +			 "unable to notify Xen of device reset: invalid PCI segment\n");
> +		return 0;
> +	}
> +
>  	return HYPERVISOR_physdev_op(PHYSDEVOP_pci_device_reset, &device);
>  }
>  EXPORT_SYMBOL_GPL(xen_reset_device);
> -- 
> 2.46.0
> 

