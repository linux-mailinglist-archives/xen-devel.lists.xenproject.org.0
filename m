Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32933841556
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 23:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673182.1047419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUZgt-0002Ln-Tg; Mon, 29 Jan 2024 22:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673182.1047419; Mon, 29 Jan 2024 22:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUZgt-0002JT-QU; Mon, 29 Jan 2024 22:01:19 +0000
Received: by outflank-mailman (input) for mailman id 673182;
 Mon, 29 Jan 2024 22:01:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZgPJ=JH=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1rUZgs-0002JN-F2
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 22:01:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eca01cb5-bef1-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 23:01:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3FEB76251A;
 Mon, 29 Jan 2024 22:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01A3C433C7;
 Mon, 29 Jan 2024 22:01:14 +0000 (UTC)
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
X-Inumbo-ID: eca01cb5-bef1-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706565674;
	bh=cV/c+lxwpIFnbqiq+B+v39dXErDc5uXplFaoJSoJCJ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Vfdddmn/0f2BfvE7vHxcAViKU0mKrmZTpyQ5tRCfSEaQJjjHvh14JIjQoqlgOfP7v
	 T1TASQ17qXlrKzZ8Wlef66DxfbfK7vJpFSNfW3nWR+oijHfEW7WilBVpk0gbGbEw8T
	 E8Ee6swgvKZePW5j7bLr5wZW76qZ9MbLX4sBQvhvb3h8AjePrhzHlQVx55IJBgedgI
	 b4rhvnU5N18+JzLGJ5+NGjoV8yLnnn1Qr8X+kwNTnzPxwmi3R9iAXOFT694aPi/szP
	 HArljeBdBljSeaeVwKoIyr4l0zpPOJhI27c6tb2NmfaSNtrrZhST5N+oDk4rs1LPyF
	 F354Sd83H4xFg==
Date: Mon, 29 Jan 2024 16:01:13 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>
Subject: Re: [RFC KERNEL PATCH v4 3/3] PCI/sysfs: Add gsi sysfs for pci_dev
Message-ID: <20240129220113.GA475965@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR12MB5849B51FADC8226764078A98E77A2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Thu, Jan 25, 2024 at 07:17:24AM +0000, Chen, Jiqian wrote:
> On 2024/1/24 00:02, Bjorn Helgaas wrote:
> > On Tue, Jan 23, 2024 at 10:13:52AM +0000, Chen, Jiqian wrote:
> >> On 2024/1/23 07:37, Bjorn Helgaas wrote:
> >>> On Fri, Jan 05, 2024 at 02:22:17PM +0800, Jiqian Chen wrote:
> >>>> There is a need for some scenarios to use gsi sysfs.
> >>>> For example, when xen passthrough a device to dumU, it will
> >>>> use gsi to map pirq, but currently userspace can't get gsi
> >>>> number.
> >>>> So, add gsi sysfs for that and for other potential scenarios.
> >> ...
> > 
> >>> I don't know enough about Xen to know why it needs the GSI in
> >>> userspace.  Is this passthrough brand new functionality that can't be
> >>> done today because we don't expose the GSI yet?

I assume this must be new functionality, i.e., this kind of
passthrough does not work today, right?

> >> has ACPI support and is responsible for detecting and controlling
> >> the hardware, also it performs privileged operations such as the
> >> creation of normal (unprivileged) domains DomUs. When we give to a
> >> DomU direct access to a device, we need also to route the physical
> >> interrupts to the DomU. In order to do so Xen needs to setup and map
> >> the interrupts appropriately.
> > 
> > What kernel interfaces are used for this setup and mapping?
>
> For passthrough devices, the setup and mapping of routing physical
> interrupts to DomU are done on Xen hypervisor side, hypervisor only
> need userspace to provide the GSI info, see Xen code:
> xc_physdev_map_pirq require GSI and then will call hypercall to pass
> GSI into hypervisor and then hypervisor will do the mapping and
> routing, kernel doesn't do the setup and mapping.

So we have to expose the GSI to userspace not because userspace itself
uses it, but so userspace can turn around and pass it back into the
kernel?

It seems like it would be better for userspace to pass an identifier
of the PCI device itself back into the hypervisor.  Then the interface
could be generic and potentially work even on non-ACPI systems where
the GSI concept doesn't apply.

> For devices on PVH Dom0, Dom0 setups interrupts for devices as the
> baremetal Linux kernel does, through using acpi_pci_irq_enable->
> acpi_register_gsi-> __acpi_register_gsi->acpi_register_gsi_ioapic.

This case sounds like it's all inside Linux, so I assume there's no
problem with this one?  If you can call acpi_pci_irq_enable(), you
have the pci_dev, so I assume there's no need to expose the GSI in
sysfs?

Bjorn

