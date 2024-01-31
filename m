Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF6A8447B0
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 20:01:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674154.1048919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVFot-0005lW-K8; Wed, 31 Jan 2024 19:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674154.1048919; Wed, 31 Jan 2024 19:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVFot-0005iz-HW; Wed, 31 Jan 2024 19:00:23 +0000
Received: by outflank-mailman (input) for mailman id 674154;
 Wed, 31 Jan 2024 19:00:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Prnq=JJ=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1rVFor-0005is-KY
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 19:00:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8e7f8e8-c06a-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 20:00:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B52161938;
 Wed, 31 Jan 2024 19:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AACC433C7;
 Wed, 31 Jan 2024 19:00:15 +0000 (UTC)
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
X-Inumbo-ID: f8e7f8e8-c06a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706727616;
	bh=RZdHkRM3P7+WME/mIEGs7U7h1w50IFiQNWO97QIu6Z4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SIRJHCGNDMqwVTzRAiLrMLdW+dkYsjK+l0LHXCGERVCfoMi4e2t93JIYx850Va7QT
	 BGvQ2bGkqPTQRCl08dsckmMG7/8X12XOBXbK/ovMyyVPfJWNUVnHe4dp7gy6ykv8CN
	 bbmRt1hMy9UMLho79aKU5ClxkjxcbodVDj4H68/s0G4OCEb5EFsiQ6G/TjsjcS9XwS
	 0JDjS+avkmcF/DbbTUZyvaT110hm0lLajDCvJQVQb3ZcwFKSKf215b+9OYbl+q+WsI
	 O7PdE1/KIhQ2AvACX37JV3KKiBwj+QSeRJjr5YGhPc8ajcZCnRUiVvuGrGs5L+oyeo
	 DyWkc5iLaAjQg==
Date: Wed, 31 Jan 2024 13:00:14 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>
Subject: Re: [RFC KERNEL PATCH v4 3/3] PCI/sysfs: Add gsi sysfs for pci_dev
Message-ID: <20240131190014.GA593286@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZboLq6kZhwpUC_c3@macbook>

On Wed, Jan 31, 2024 at 09:58:19AM +0100, Roger Pau Monné wrote:
> On Tue, Jan 30, 2024 at 02:44:03PM -0600, Bjorn Helgaas wrote:
> > On Tue, Jan 30, 2024 at 10:07:36AM +0100, Roger Pau Monné wrote:
> > > On Mon, Jan 29, 2024 at 04:01:13PM -0600, Bjorn Helgaas wrote:
> > > > On Thu, Jan 25, 2024 at 07:17:24AM +0000, Chen, Jiqian wrote:
> > > > > On 2024/1/24 00:02, Bjorn Helgaas wrote:
> > > > > > On Tue, Jan 23, 2024 at 10:13:52AM +0000, Chen, Jiqian wrote:
> > > > > >> On 2024/1/23 07:37, Bjorn Helgaas wrote:
> > > > > >>> On Fri, Jan 05, 2024 at 02:22:17PM +0800, Jiqian Chen wrote:
> > > > > >>>> There is a need for some scenarios to use gsi sysfs.
> > > > > >>>> For example, when xen passthrough a device to dumU, it will
> > > > > >>>> use gsi to map pirq, but currently userspace can't get gsi
> > > > > >>>> number.
> > > > > >>>> So, add gsi sysfs for that and for other potential scenarios.
> > > > > >> ...
> > > > > > 
> > > > > >>> I don't know enough about Xen to know why it needs the GSI in
> > > > > >>> userspace.  Is this passthrough brand new functionality that can't be
> > > > > >>> done today because we don't expose the GSI yet?
> > > > 
> > > > I assume this must be new functionality, i.e., this kind of
> > > > passthrough does not work today, right?
> > > > 
> > > > > >> has ACPI support and is responsible for detecting and controlling
> > > > > >> the hardware, also it performs privileged operations such as the
> > > > > >> creation of normal (unprivileged) domains DomUs. When we give to a
> > > > > >> DomU direct access to a device, we need also to route the physical
> > > > > >> interrupts to the DomU. In order to do so Xen needs to setup and map
> > > > > >> the interrupts appropriately.
> > > > > > 
> > > > > > What kernel interfaces are used for this setup and mapping?
> > > > >
> > > > > For passthrough devices, the setup and mapping of routing physical
> > > > > interrupts to DomU are done on Xen hypervisor side, hypervisor only
> > > > > need userspace to provide the GSI info, see Xen code:
> > > > > xc_physdev_map_pirq require GSI and then will call hypercall to pass
> > > > > GSI into hypervisor and then hypervisor will do the mapping and
> > > > > routing, kernel doesn't do the setup and mapping.
> > > > 
> > > > So we have to expose the GSI to userspace not because userspace itself
> > > > uses it, but so userspace can turn around and pass it back into the
> > > > kernel?
> > > 
> > > No, the point is to pass it back to Xen, which doesn't know the
> > > mapping between GSIs and PCI devices because it can't execute the ACPI
> > > AML resource methods that provide such information.
> > > 
> > > The (Linux) kernel is just a proxy that forwards the hypercalls from
> > > user-space tools into Xen.
> > 
> > But I guess Xen knows how to interpret a GSI even though it doesn't
> > have access to AML?
> 
> On x86 Xen does know how to map a GSI into an IO-APIC pin, in order
> configure the RTE as requested.

IIUC, mapping a GSI to an IO-APIC pin requires information from the
MADT.  So I guess Xen does use the static ACPI tables, but not the AML
_PRT methods that would connect a GSI with a PCI device?

I guess this means Xen would not be able to deal with _MAT methods,
which also contains MADT entries?  I don't know the implications of
this -- maybe it means Xen might not be able to use with hot-added
devices?

The tables (including DSDT and SSDTS that contain the AML) are exposed
to userspace via /sys/firmware/acpi/tables/, but of course that
doesn't mean Xen knows how to interpret the AML, and even if it did,
Xen probably wouldn't be able to *evaluate* it since that could
conflict with the host kernel's use of AML.

Bjorn

