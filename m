Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740E1A09DBC
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 23:25:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870056.1281509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWNRZ-0002zf-Sb; Fri, 10 Jan 2025 22:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870056.1281509; Fri, 10 Jan 2025 22:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWNRZ-0002y8-PO; Fri, 10 Jan 2025 22:25:29 +0000
Received: by outflank-mailman (input) for mailman id 870056;
 Fri, 10 Jan 2025 22:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HMSX=UC=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tWNRZ-0002y2-7A
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 22:25:29 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb196a35-cfa1-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 23:25:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CA3CCA426AE;
 Fri, 10 Jan 2025 22:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86143C4CED6;
 Fri, 10 Jan 2025 22:25:26 +0000 (UTC)
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
X-Inumbo-ID: cb196a35-cfa1-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736547926;
	bh=DLEpLG1m5W4R6CL6+4W7/UedZGSkgthe9gS3KngxZLE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ManuQbqHSTcactyB2Pv88RPe6kmW+6bJ70xOHlALBW8ZaApg7qihBPSgg0MB1XxDP
	 2Sfb1aSG4MEDG2Q5BWaJbM74T9R3ZKbucW1aCtqBIgQJ6t3izk5x6xLe0wm3NfyjX8
	 W6aHyWUpfVkabF0D/bh1JF5E8gC+jMNk2zr2037C54jxn6rEivGg2tfKQVt4UnprQE
	 VUAgT20jki7KtulD/31HTvryTgs5MhyhkVlz7fuqbZlVHT5Dv9ha8+/jX9lFhh1Wlz
	 EKn6/dUuT9e80byAplmUx0Kkp7RPFps29+IhXje/eJo72tFMslKD77CN5Azw1pDnvc
	 +ITR5HQSLkzzg==
Date: Fri, 10 Jan 2025 16:25:25 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 2/3] vmd: disable MSI remapping bypass under Xen
Message-ID: <20250110222525.GA318386@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250110140152.27624-3-roger.pau@citrix.com>

Match historical subject line style for prefix and capitalization:

  PCI: vmd: Set devices to D0 before enabling PM L1 Substates
  PCI: vmd: Add DID 8086:B06F and 8086:B60B for Intel client SKUs
  PCI: vmd: Fix indentation issue in vmd_shutdown()

On Fri, Jan 10, 2025 at 03:01:49PM +0100, Roger Pau Monne wrote:
> MSI remapping bypass (directly configuring MSI entries for devices on the VMD
> bus) won't work under Xen, as Xen is not aware of devices in such bus, and
> hence cannot configure the entries using the pIRQ interface in the PV case, and
> in the PVH case traps won't be setup for MSI entries for such devices.
> 
> Until Xen is aware of devices in the VMD bus prevent the
> VMD_FEAT_CAN_BYPASS_MSI_REMAP capability from being used when running as any
> kind of Xen guest.

Wrap to fit in 75 columns.

Can you include a hint about *why* Xen is not aware of devices below
VMD?  That will help to know whether it's a permanent unfixable
situation or something that could be done eventually.

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  drivers/pci/controller/vmd.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
> index 264a180403a0..d9b7510ace29 100644
> --- a/drivers/pci/controller/vmd.c
> +++ b/drivers/pci/controller/vmd.c
> @@ -965,6 +965,15 @@ static int vmd_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	struct vmd_dev *vmd;
>  	int err;
>  
> +	if (xen_domain())
> +		/*
> +		 * Xen doesn't have knowledge about devices in the VMD bus.

Also here.

> +		 * Bypass of MSI remapping won't work in that case as direct
> +		 * write to the MSI entries won't result in functional
> +		 * interrupts.
> +		 */
> +		features &= ~VMD_FEAT_CAN_BYPASS_MSI_REMAP;
> +
>  	if (resource_size(&dev->resource[VMD_CFGBAR]) < (1 << 20))
>  		return -ENOMEM;
>  
> -- 
> 2.46.0
> 

