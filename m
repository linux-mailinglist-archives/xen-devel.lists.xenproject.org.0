Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A832CA09DB1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 23:22:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870038.1281498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWNNm-00028j-Dg; Fri, 10 Jan 2025 22:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870038.1281498; Fri, 10 Jan 2025 22:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWNNm-000268-B2; Fri, 10 Jan 2025 22:21:34 +0000
Received: by outflank-mailman (input) for mailman id 870038;
 Fri, 10 Jan 2025 22:21:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HMSX=UC=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tWNNl-000250-Jh
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 22:21:33 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e685fb6-cfa1-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 23:21:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 90A67A429C3;
 Fri, 10 Jan 2025 22:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2ADC4CED6;
 Fri, 10 Jan 2025 22:21:30 +0000 (UTC)
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
X-Inumbo-ID: 3e685fb6-cfa1-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736547690;
	bh=qRzXS2cPJbaQPT6VO1nJCsDiE6wZHCk69MWbzsLdJlw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=pj+fUwX5Yye14PC5hRy0JgM6ta4tEh6f9nuN2mMCGvoXLDnym0raxlIziHWvKQUMN
	 67SvwmJBIhIkCEd6yyoXvWUuOMzaCdu+TzVQNy6ClhnPpWtAvNPQR2SAy175sIXEnu
	 CBwBPljbt5WTQgSZvQo3A/ATY7wjKy0B7Y0yQnepi9+7dfaw5D7fTyMjyGdch6Quxe
	 iEj89ipnrrqx3zcXrMD3oVTVbqdCV/4leLX4T5DgkB+LMx6eGe/MQLAmrE8VOXkx8l
	 tTHxwCGKhdL5hJqs25kG82FMvhlCrrPzAgfQYkQVvFAwep5M8tnm7HDShvZw62arGO
	 GMonTgtfEnzNw==
Date: Fri, 10 Jan 2025 16:21:29 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH 1/3] xen/pci: do not register devices outside of PCI
 segment scope
Message-ID: <20250110222129.GA317771@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250110140152.27624-2-roger.pau@citrix.com>

On Fri, Jan 10, 2025 at 03:01:48PM +0100, Roger Pau Monne wrote:
> The PCI segment value is limited to 16 bits, however there are buses like VMD
> that fake being part of the PCI topology by adding segment with a number
> outside the scope of the PCI firmware specification range (>= 0x10000). The
> MCFG ACPI Table "PCI Segment Group Number" field is defined as having a 16 bit
> width.
>
> Attempting to register or manage those devices with Xen would result in errors
> at best, or overlaps with existing devices living on the truncated equivalent
> segment values.

The ACPI _SEG method (ACPI r6.5, sec 6.5.6) and the corresponding
value in the MCFG table (PCI Firmware r3.3, sec 4.1.2) are clearly
16-bit values.

But otherwise, the segment value is pretty much an arbitrary software
value, and the kernel works fine with the larger domain values from
vmd_find_free_domain(), so this isn't quite enough to explain what the
issue with Xen is.

Does Xen truncate the domain to 16 bits or use it to look up something
in ACPI?

> Skip notifying Xen about those devices.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
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

