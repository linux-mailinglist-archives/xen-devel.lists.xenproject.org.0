Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C22B8377C8
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 00:38:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670221.1042813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rS3rG-000413-P3; Mon, 22 Jan 2024 23:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670221.1042813; Mon, 22 Jan 2024 23:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rS3rG-0003xo-MA; Mon, 22 Jan 2024 23:37:38 +0000
Received: by outflank-mailman (input) for mailman id 670221;
 Mon, 22 Jan 2024 23:37:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wf/T=JA=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1rS3rE-0003xh-Up
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 23:37:36 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 383954e0-b97f-11ee-98f3-6d05b1d4d9a1;
 Tue, 23 Jan 2024 00:37:35 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 41FC7B81262;
 Mon, 22 Jan 2024 23:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57147C43394;
 Mon, 22 Jan 2024 23:37:33 +0000 (UTC)
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
X-Inumbo-ID: 383954e0-b97f-11ee-98f3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705966653;
	bh=bFI9taIrnXtbiXPEufAdPBtLCLiLu4UVHc3GG4nClhw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OwICVcvbQxSLC8jasEM24VJKS3vTz+1LDb+FcmZZDLCW7bpfPqjxs0dEHl4ACIFjn
	 YcnhQuWeJ/IJc/q28szM0TWGQ2E3A4jDGh0jegpsrwaXzNjlLY5EmlP3VhwQt5djZ8
	 dvYklSc8kUb/da5OKZgd/+PCthhVLxNI17WlTaUY+1ed1duP4ZsD+t6TNvaHa+Q6Yd
	 hWr+An7oFQQaV3KzfoIrZ2Xq9oh/FzyCS20dGjuQe0/x/KbqjnqYo+10pPWqvmrG2U
	 81dQwoBE36+Ox3tW3E4UlIrVQ7fohxhRc+OO/N1D6fwteHL8r16J3lcy3OXjEp8PJx
	 o2wSyCnzhnk/A==
Date: Mon, 22 Jan 2024 17:37:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <Ray.Huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v4 3/3] PCI/sysfs: Add gsi sysfs for pci_dev
Message-ID: <20240122233731.GA291870@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105062217.349645-4-Jiqian.Chen@amd.com>

On Fri, Jan 05, 2024 at 02:22:17PM +0800, Jiqian Chen wrote:
> There is a need for some scenarios to use gsi sysfs.
> For example, when xen passthrough a device to dumU, it will
> use gsi to map pirq, but currently userspace can't get gsi
> number.
> So, add gsi sysfs for that and for other potential scenarios.

Isn't GSI really an ACPI-specific concept?

I don't know enough about Xen to know why it needs the GSI in
userspace.  Is this passthrough brand new functionality that can't be
done today because we don't expose the GSI yet?

How does userspace use the GSI?  I see "to map pirq", but I think we
should have more concrete details about exactly what is needed and how
it is used before adding something new in sysfs.

Is there some more generic kernel interface we could use
for this?

s/dumU/DomU/ ?  (I dunno, but https://www.google.com/search?q=xen+dumu
suggests it :))

> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  drivers/acpi/pci_irq.c  |  1 +
>  drivers/pci/pci-sysfs.c | 11 +++++++++++
>  include/linux/pci.h     |  2 ++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
> index 630fe0a34bc6..739a58755df2 100644
> --- a/drivers/acpi/pci_irq.c
> +++ b/drivers/acpi/pci_irq.c
> @@ -449,6 +449,7 @@ int acpi_pci_irq_enable(struct pci_dev *dev)
>  		kfree(entry);
>  		return 0;
>  	}
> +	dev->gsi = gsi;
>  
>  	rc = acpi_register_gsi(&dev->dev, gsi, triggering, polarity);
>  	if (rc < 0) {
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 2321fdfefd7d..c51df88d079e 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -71,6 +71,16 @@ static ssize_t irq_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(irq);
>  
> +static ssize_t gsi_show(struct device *dev,
> +			struct device_attribute *attr,
> +			char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	return sysfs_emit(buf, "%u\n", pdev->gsi);
> +}
> +static DEVICE_ATTR_RO(gsi);
> +
>  static ssize_t broken_parity_status_show(struct device *dev,
>  					 struct device_attribute *attr,
>  					 char *buf)
> @@ -596,6 +606,7 @@ static struct attribute *pci_dev_attrs[] = {
>  	&dev_attr_revision.attr,
>  	&dev_attr_class.attr,
>  	&dev_attr_irq.attr,
> +	&dev_attr_gsi.attr,
>  	&dev_attr_local_cpus.attr,
>  	&dev_attr_local_cpulist.attr,
>  	&dev_attr_modalias.attr,
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index dea043bc1e38..0618d4a87a50 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -529,6 +529,8 @@ struct pci_dev {
>  
>  	/* These methods index pci_reset_fn_methods[] */
>  	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
> +
> +	unsigned int	gsi;
>  };
>  
>  static inline struct pci_dev *pci_physfn(struct pci_dev *dev)
> -- 
> 2.34.1
> 
> 

