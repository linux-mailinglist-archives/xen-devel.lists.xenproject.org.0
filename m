Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0FBA36470
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 18:23:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888980.1298232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tizPY-0004ut-0y; Fri, 14 Feb 2025 17:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888980.1298232; Fri, 14 Feb 2025 17:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tizPX-0004sk-UZ; Fri, 14 Feb 2025 17:23:31 +0000
Received: by outflank-mailman (input) for mailman id 888980;
 Fri, 14 Feb 2025 17:23:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7iqD=VF=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tizPX-0004se-2n
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 17:23:31 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67af09bd-eaf8-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 18:23:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D44E0A432AC;
 Fri, 14 Feb 2025 17:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB6FC4CED1;
 Fri, 14 Feb 2025 17:23:27 +0000 (UTC)
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
X-Inumbo-ID: 67af09bd-eaf8-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739553807;
	bh=qDkUNhX/Rn7fSQraeHpJ9SA2nMmPahHqFq1sQwcBXTk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=f+kvZXJU39TAI1G6q3q4TIghG3mediJi+TNmQ+V6MPa0XU7A19FUva1045Sx2gJdu
	 3ysOMAKfY0kg98jzVMKdXjSPLOYTxMc+HdzgrnMpgD7Gq+N0oyMKxuG9wNEE4csgrm
	 vnwNIXdEwJdz1wv76Fa7ZCHFJwfBOE6pwEHAvk/beGLCE929yRoQEU5cmyvdZT0i1a
	 c54/+5LiyBHiy3GJe8j87PmUWian2LgV+cTxS0xE7KEb1tQt3EYO4Qxh01MaGrVHlt
	 lA5MoE6g55YnHcDpSyPCGbhnujzC8duljAgTtrIGskZZ0gh5eatg9eWYzPF8qjenBT
	 WCM0xw9WDHn0w==
Date: Fri, 14 Feb 2025 11:23:24 -0600
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
Subject: Re: [PATCH v2 2/3] vmd: disable MSI remapping bypass under Xen
Message-ID: <20250214172324.GA157438@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250114103315.51328-3-roger.pau@citrix.com>

The subject line convention for this file is:

  PCI: vmd: Disable MSI remapping ...

On Tue, Jan 14, 2025 at 11:33:12AM +0100, Roger Pau Monne wrote:
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
> ---
> Changes since v1:
>  - Add xen header.
>  - Expand comment.
> ---
>  drivers/pci/controller/vmd.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
> index 264a180403a0..33c9514bd926 100644
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
> @@ -965,6 +967,23 @@ static int vmd_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	struct vmd_dev *vmd;
>  	int err;
>  
> +	if (xen_domain())
> +		/*
> +		 * Xen doesn't have knowledge about devices in the VMD bus
> +		 * because the config space of devices behind the VMD bridge is
> +		 * not known to Xen, and hence Xen cannot discover or configure
> +		 * them in any way.
> +		 *
> +		 * Bypass of MSI remapping won't work in that case as direct
> +		 * write by Linux to the MSI entries won't result in functional
> +		 * interrupts, as it's Xen the entity that manages the host

"... as Xen is the entity that ..." ?

> +		 * interrupt controller and must configure interrupts.
> +		 * However multiplexing of interrupts by the VMD bridge will
> +		 * work under Xen, so force the usage of that mode which must
> +		 * always be supported by VMD bridges.
> +		 */
> +		features &= ~VMD_FEAT_CAN_BYPASS_MSI_REMAP;

Since the comment is so long, I would add braces even though it's only
a single statement.  Or maybe moving the comment above the "if" would
make more sense.

>  	if (resource_size(&dev->resource[VMD_CFGBAR]) < (1 << 20))
>  		return -ENOMEM;
>  
> -- 
> 2.46.0
> 

