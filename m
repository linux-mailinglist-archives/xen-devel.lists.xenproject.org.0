Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167FC851DCF
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 20:19:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679702.1057316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZbpd-0004lT-T2; Mon, 12 Feb 2024 19:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679702.1057316; Mon, 12 Feb 2024 19:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZbpd-0004jV-Py; Mon, 12 Feb 2024 19:19:09 +0000
Received: by outflank-mailman (input) for mailman id 679702;
 Mon, 12 Feb 2024 19:19:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G6LY=JV=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1rZbpc-0004j6-Eh
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 19:19:08 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9684ec17-c9db-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 20:19:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9CC4ACE13B7;
 Mon, 12 Feb 2024 19:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95ECEC433F1;
 Mon, 12 Feb 2024 19:18:59 +0000 (UTC)
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
X-Inumbo-ID: 9684ec17-c9db-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707765539;
	bh=KtY+2vwykgYx0ZhCuIUifzWpXvaxOyQLOoq8eVe0/yU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=jwRehpBB1mbek9OHSZcQG4LLIahO11fkowPwY+RDEnhfuRZO2S52shbq7/dcY+qfE
	 iEYB8aVjIU3buYbYfh9x6CFS1/B6CnDOvzAv9g3Jn96LPZl9XjXRj3ZlnLmvhiC1jb
	 j7E5z5nUMRSMYvlK8qNk2Js+O3eopRzA9Uux1dLjoVTcAYhb541gdyXAHlbb1u+4E0
	 02afHZ6L5zYFBoNbCq9Hf2fB4NBQzsa1nHeCculaTjKqbKwDppZ7P0VG8PXOrOHt3r
	 xcq2+FbZ0RSijcp6poSdUYCOPMyZiyUoLrxj0tejWKyGB9ClrtU0x41aXcP01RaS4o
	 8SuuSZ9KNU8+g==
Date: Mon, 12 Feb 2024 13:18:58 -0600
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
Message-ID: <20240212191858.GA1137351@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZcnhOEjnTgbYFPVl@macbook>

On Mon, Feb 12, 2024 at 10:13:28AM +0100, Roger Pau Monné wrote:
> On Fri, Feb 09, 2024 at 03:05:49PM -0600, Bjorn Helgaas wrote:
> > On Thu, Feb 01, 2024 at 09:39:49AM +0100, Roger Pau Monné wrote:
> > > On Wed, Jan 31, 2024 at 01:00:14PM -0600, Bjorn Helgaas wrote:
> > > > On Wed, Jan 31, 2024 at 09:58:19AM +0100, Roger Pau Monné wrote:
> > > > > On Tue, Jan 30, 2024 at 02:44:03PM -0600, Bjorn Helgaas wrote:
> > > > > > On Tue, Jan 30, 2024 at 10:07:36AM +0100, Roger Pau Monné wrote:
> > > > > > > On Mon, Jan 29, 2024 at 04:01:13PM -0600, Bjorn Helgaas wrote:
> > > > > > > > On Thu, Jan 25, 2024 at 07:17:24AM +0000, Chen, Jiqian wrote:
> > > > > > > > > On 2024/1/24 00:02, Bjorn Helgaas wrote:
> > > > > > > > > > On Tue, Jan 23, 2024 at 10:13:52AM +0000, Chen, Jiqian wrote:
> > > > > > > > > >> On 2024/1/23 07:37, Bjorn Helgaas wrote:
> > > > > > > > > >>> On Fri, Jan 05, 2024 at 02:22:17PM +0800, Jiqian Chen wrote:
> > > > > > > > > >>>> There is a need for some scenarios to use gsi sysfs.
> > > > > > > > > >>>> For example, when xen passthrough a device to dumU, it will
> > > > > > > > > >>>> use gsi to map pirq, but currently userspace can't get gsi
> > > > > > > > > >>>> number.
> > > > > > > > > >>>> So, add gsi sysfs for that and for other potential scenarios.
> > > > > > > > > >> ...
> > > > > > > > > > 
> > > > > > > > > >>> I don't know enough about Xen to know why it needs the GSI in
> > > > > > > > > >>> userspace.  Is this passthrough brand new functionality that can't be
> > > > > > > > > >>> done today because we don't expose the GSI yet?
> > > > > > > > 
> > > > > > > > I assume this must be new functionality, i.e., this kind of
> > > > > > > > passthrough does not work today, right?
> > > > > > > > 
> > > > > > > > > >> has ACPI support and is responsible for detecting and controlling
> > > > > > > > > >> the hardware, also it performs privileged operations such as the
> > > > > > > > > >> creation of normal (unprivileged) domains DomUs. When we give to a
> > > > > > > > > >> DomU direct access to a device, we need also to route the physical
> > > > > > > > > >> interrupts to the DomU. In order to do so Xen needs to setup and map
> > > > > > > > > >> the interrupts appropriately.
> > > > > > > > > > 
> > > > > > > > > > What kernel interfaces are used for this setup and mapping?
> > > > > > > > >
> > > > > > > > > For passthrough devices, the setup and mapping of routing physical
> > > > > > > > > interrupts to DomU are done on Xen hypervisor side, hypervisor only
> > > > > > > > > need userspace to provide the GSI info, see Xen code:
> > > > > > > > > xc_physdev_map_pirq require GSI and then will call hypercall to pass
> > > > > > > > > GSI into hypervisor and then hypervisor will do the mapping and
> > > > > > > > > routing, kernel doesn't do the setup and mapping.
> > > > > > > > 
> > > > > > > > So we have to expose the GSI to userspace not because userspace itself
> > > > > > > > uses it, but so userspace can turn around and pass it back into the
> > > > > > > > kernel?
> > > > > > > 
> > > > > > > No, the point is to pass it back to Xen, which doesn't know the
> > > > > > > mapping between GSIs and PCI devices because it can't execute the ACPI
> > > > > > > AML resource methods that provide such information.
> > > > > > > 
> > > > > > > The (Linux) kernel is just a proxy that forwards the hypercalls from
> > > > > > > user-space tools into Xen.
> > > > > > 
> > > > > > But I guess Xen knows how to interpret a GSI even though it doesn't
> > > > > > have access to AML?
> > > > > 
> > > > > On x86 Xen does know how to map a GSI into an IO-APIC pin, in order
> > > > > configure the RTE as requested.
> > > > 
> > > > IIUC, mapping a GSI to an IO-APIC pin requires information from the
> > > > MADT.  So I guess Xen does use the static ACPI tables, but not the AML
> > > > _PRT methods that would connect a GSI with a PCI device?
> > > 
> > > Yes, Xen can parse the static tables, and knows the base GSI of
> > > IO-APICs from the MADT.
> > > 
> > > > I guess this means Xen would not be able to deal with _MAT methods,
> > > > which also contains MADT entries?  I don't know the implications of
> > > > this -- maybe it means Xen might not be able to use with hot-added
> > > > devices?
> > > 
> > > It's my understanding _MAT will only be present on some very specific
> > > devices (IO-APIC or CPU objects).  Xen doesn't support hotplug of
> > > IO-APICs, but hotplug of CPUs should in principle be supported with
> > > cooperation from the control domain OS (albeit it's not something that
> > > we tests on our CI).  I don't expect however that a CPU object _MAT
> > > method will return IO APIC entries.
> > > 
> > > > The tables (including DSDT and SSDTS that contain the AML) are exposed
> > > > to userspace via /sys/firmware/acpi/tables/, but of course that
> > > > doesn't mean Xen knows how to interpret the AML, and even if it did,
> > > > Xen probably wouldn't be able to *evaluate* it since that could
> > > > conflict with the host kernel's use of AML.
> > > 
> > > Indeed, there can only be a single OSPM, and that's the dom0 OS (Linux
> > > in our context).
> > > 
> > > Getting back to our context though, what would be a suitable place for
> > > exposing the GSI assigned to each device?
> > 
> > IIUC, the Xen hypervisor:
> > 
> >   - Interprets /sys/firmware/acpi/tables/APIC (or gets this via
> >     something running on the Dom0 kernel) to find the physical base
> >     address and GSI base, e.g., from I/O APIC, I/O SAPIC.
> 
> No, Xen parses the MADT directly from memory, before stating dom0.
> That's a static table so it's fine for Xen to parse it and obtain the
> I/O APIC GSI base.

It's an interesting split to consume ACPI static tables directly but
put the AML interpreter elsewhere.  I doubt the ACPI spec envisioned
that, which makes me wonder what other things we could trip over, but
that's just a tangent.

> >   - Needs the GSI to locate the APIC and pin within the APIC.  The
> >     Dom0 kernel is the OSPM, so only it can evaluate the AML _PRT to
> >     learn the PCI device -> GSI mapping.
> 
> Yes, Xen doesn't know the PCI device -> GSI mapping.  Dom0 needs to
> parse the ACPI methods and signal Xen to configure a GSI with a
> given trigger and polarity.
> 
> >   - Has direct access to the APIC physical base address to program the
> >     Redirection Table.
> 
> Yes, the hardware (native) I/O APIC is owned by Xen, and not directly
> accessible by dom0.
> 
> > The patch seems a little messy to me because the PCI core has to keep
> > track of the GSI even though it doesn't need it itself.  And the
> > current patch exposes it on all arches, even non-ACPI ones or when
> > ACPI is disabled (easily fixable).
> > 
> > We only call acpi_pci_irq_enable() in the pci_enable_device() path, so
> > we don't know the GSI unless a Dom0 driver has claimed the device and
> > called pci_enable_device() for it, which seems like it might not be
> > desirable.
> 
> I think that's always the case, as on dom0 devices to be passed
> through are handled by pciback which does enable them.

pcistub_init_device() labels the pci_enable_device() as a "HACK"
related to determining the IRQ, which makes me think there's not
really a requirement for the device to be *enabled* (BAR decoding
enabled) by dom0.

> I agree it might be best to not tie exposing the node to
> pci_enable_device() having been called.  Is _PRT only evaluated as
> part of acpi_pci_irq_enable()? (or pci_enable_device()).

Yes.  AFAICT, acpi_pci_irq_enable() is the only path that evaluates
_PRT (except for a debugger interface).  I don't think it *needs* to
be that way, and the fact that we do it per-device like that means we
evaluate _PRT many times even though I think the results never change.

I could imagine evaluating _PRT once as part of enumerating a PCI host
bridge (and maybe PCI-PCI bridge, per acpi_pci_irq_find_prt_entry()
comment), but that looks like a fair bit of work to implement.  And of
course it doesn't really affect the question of how to expose the
result, although it does suggest /sys/bus/acpi/devices/PNP0A03:00/ as
a possible location.

Bjorn

