Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61B4A6AF9D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 22:07:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923173.1326820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvN6X-0002iJ-Hp; Thu, 20 Mar 2025 21:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923173.1326820; Thu, 20 Mar 2025 21:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvN6X-0002ga-Ef; Thu, 20 Mar 2025 21:07:05 +0000
Received: by outflank-mailman (input) for mailman id 923173;
 Thu, 20 Mar 2025 21:07:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6xy=WH=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tvN6V-0002gU-Vv
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 21:07:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43d3ec14-05cf-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 22:07:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 746AE5C632C;
 Thu, 20 Mar 2025 21:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E3DC4CEDD;
 Thu, 20 Mar 2025 21:06:58 +0000 (UTC)
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
X-Inumbo-ID: 43d3ec14-05cf-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742504819;
	bh=HJwmsuBl4GXsCQaTwFacbejN4+pW0Ti4oR/v22e/4ZY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cf3sZD96OvC1io70X3978viKdgFIwJoj1vBnbZvWwXaz+Q3yxvcE4qwgMPEA9tqwA
	 NwX14JIWitf/STv86rzIW2Y4ulqHCAIJoysCRoaNq7GZwcMoxoxR8PPdEqLstK9g5p
	 tgzHfymTSJZ9K0mddPgC731UpiRo212EkyMtnKAHXJmF6RWHzUqWmHAMaxCALWY/KB
	 SgW4Bjdk3W2zN7Pw72+bl/0B887JFrYKqOHmpWum7CNflwj0hFPItGJckd9I1So/oX
	 NU6vEMSFRQWqujdjFvbi/0+hXONOdkul2aLYo6XSafsmyWfwb+W6dVcS3dnpuO6txk
	 kJ6HN4vUTJLyQ==
Date: Thu, 20 Mar 2025 16:06:57 -0500
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
Subject: Re: [PATCH v3 2/3] PCI: vmd: Disable MSI remapping bypass under Xen
Message-ID: <20250320210657.GA1099656@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219092059.90850-3-roger.pau@citrix.com>

On Wed, Feb 19, 2025 at 10:20:56AM +0100, Roger Pau Monne wrote:
> MSI remapping bypass (directly configuring MSI entries for devices on the
> VMD bus) won't work under Xen, as Xen is not aware of devices in such bus,
> and hence cannot configure the entries using the pIRQ interface in the PV
> case, and in the PVH case traps won't be setup for MSI entries for such
> devices.
> 
> Until Xen is aware of devices in the VMD bus prevent the
> VMD_FEAT_CAN_BYPASS_MSI_REMAP capability from being used when running as
> any kind of Xen guest.
> 
> The MSI remapping bypass is an optional feature of VMD bridges, and hence
> when running under Xen it will be masked and devices will be forced to
> redirect its interrupts from the VMD bridge.  That mode of operation must
> always be supported by VMD bridges and works when Xen is not aware of
> devices behind the VMD bridge.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> Changes since v2:
>  - Adjust patch subject.
>  - Adjust code comment.
> 
> Changes since v1:
>  - Add xen header.
>  - Expand comment.
> ---
>  drivers/pci/controller/vmd.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
> index 9d9596947350..e619accca49d 100644
> --- a/drivers/pci/controller/vmd.c
> +++ b/drivers/pci/controller/vmd.c
> @@ -17,6 +17,8 @@
>  #include <linux/rculist.h>
>  #include <linux/rcupdate.h>
>  
> +#include <xen/xen.h>
> +
>  #include <asm/irqdomain.h>
>  
>  #define VMD_CFGBAR	0
> @@ -970,6 +972,24 @@ static int vmd_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	struct vmd_dev *vmd;
>  	int err;
>  
> +	if (xen_domain()) {
> +		/*
> +		 * Xen doesn't have knowledge about devices in the VMD bus
> +		 * because the config space of devices behind the VMD bridge is
> +		 * not known to Xen, and hence Xen cannot discover or configure
> +		 * them in any way.
> +		 *
> +		 * Bypass of MSI remapping won't work in that case as direct
> +		 * write by Linux to the MSI entries won't result in functional
> +		 * interrupts, as Xen is the entity that manages the host
> +		 * interrupt controller and must configure interrupts.  However
> +		 * multiplexing of interrupts by the VMD bridge will work under
> +		 * Xen, so force the usage of that mode which must always be
> +		 * supported by VMD bridges.
> +		 */
> +		features &= ~VMD_FEAT_CAN_BYPASS_MSI_REMAP;
> +	}
> +
>  	if (resource_size(&dev->resource[VMD_CFGBAR]) < (1 << 20))
>  		return -ENOMEM;
>  
> -- 
> 2.46.0
> 

