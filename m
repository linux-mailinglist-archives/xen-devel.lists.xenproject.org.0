Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5B584FE24
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 22:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678843.1056407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYY4K-0007hp-7I; Fri, 09 Feb 2024 21:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678843.1056407; Fri, 09 Feb 2024 21:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYY4K-0007fg-4D; Fri, 09 Feb 2024 21:05:56 +0000
Received: by outflank-mailman (input) for mailman id 678843;
 Fri, 09 Feb 2024 21:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=40k0=JS=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1rYY4I-0007fa-JE
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 21:05:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01f3ebe4-c78f-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 22:05:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C545862190;
 Fri,  9 Feb 2024 21:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F711C433C7;
 Fri,  9 Feb 2024 21:05:51 +0000 (UTC)
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
X-Inumbo-ID: 01f3ebe4-c78f-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707512751;
	bh=rjVvpgkdjij/VYXtLbzigiHQtkw04AlRvlQ3kPwWPAA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kwQK9UoMLNlCNW4mnILL/fjh6js/5cqzhXmOYR58/NZ49GCoEo35noV1N0Rexcjxg
	 lAo1KlEs60klZiyOyPrxgCKJTJAnrWYuu+tl+4qSVBQtv8xU+/SujJcpOgyxKVu+sh
	 KmtcuwLxpMN1rKL4twh466o9n/Qy3jLRTlt/hdebS8LRqcnolN4XCPDOcKoHGhNyf4
	 g7NULVMt5QtAfP+Hj7xejLKShQinuhM6827OqwAbYFZM0Y8BKAxgPkOfVHljo5k/4h
	 Z2HqW/rZs2uP/V42MoFVA1hXFtNXb0Zhp+pPSPlH//BjNALkVszex5H72/M+Iy1IJB
	 QpisPIJPit19w==
Date: Fri, 9 Feb 2024 15:05:49 -0600
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
Message-ID: <20240209210549.GA884438@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZbtY1R15pYZz3F3B@macbook>

On Thu, Feb 01, 2024 at 09:39:49AM +0100, Roger Pau Monné wrote:
> On Wed, Jan 31, 2024 at 01:00:14PM -0600, Bjorn Helgaas wrote:
> > On Wed, Jan 31, 2024 at 09:58:19AM +0100, Roger Pau Monné wrote:
> > > On Tue, Jan 30, 2024 at 02:44:03PM -0600, Bjorn Helgaas wrote:
> > > > On Tue, Jan 30, 2024 at 10:07:36AM +0100, Roger Pau Monné wrote:
> > > > > On Mon, Jan 29, 2024 at 04:01:13PM -0600, Bjorn Helgaas wrote:
> > > > > > On Thu, Jan 25, 2024 at 07:17:24AM +0000, Chen, Jiqian wrote:
> > > > > > > On 2024/1/24 00:02, Bjorn Helgaas wrote:
> > > > > > > > On Tue, Jan 23, 2024 at 10:13:52AM +0000, Chen, Jiqian wrote:
> > > > > > > >> On 2024/1/23 07:37, Bjorn Helgaas wrote:
> > > > > > > >>> On Fri, Jan 05, 2024 at 02:22:17PM +0800, Jiqian Chen wrote:
> > > > > > > >>>> There is a need for some scenarios to use gsi sysfs.
> > > > > > > >>>> For example, when xen passthrough a device to dumU, it will
> > > > > > > >>>> use gsi to map pirq, but currently userspace can't get gsi
> > > > > > > >>>> number.
> > > > > > > >>>> So, add gsi sysfs for that and for other potential scenarios.
> > > > > > > >> ...
> > > > > > > > 
> > > > > > > >>> I don't know enough about Xen to know why it needs the GSI in
> > > > > > > >>> userspace.  Is this passthrough brand new functionality that can't be
> > > > > > > >>> done today because we don't expose the GSI yet?
> > > > > > 
> > > > > > I assume this must be new functionality, i.e., this kind of
> > > > > > passthrough does not work today, right?
> > > > > > 
> > > > > > > >> has ACPI support and is responsible for detecting and controlling
> > > > > > > >> the hardware, also it performs privileged operations such as the
> > > > > > > >> creation of normal (unprivileged) domains DomUs. When we give to a
> > > > > > > >> DomU direct access to a device, we need also to route the physical
> > > > > > > >> interrupts to the DomU. In order to do so Xen needs to setup and map
> > > > > > > >> the interrupts appropriately.
> > > > > > > > 
> > > > > > > > What kernel interfaces are used for this setup and mapping?
> > > > > > >
> > > > > > > For passthrough devices, the setup and mapping of routing physical
> > > > > > > interrupts to DomU are done on Xen hypervisor side, hypervisor only
> > > > > > > need userspace to provide the GSI info, see Xen code:
> > > > > > > xc_physdev_map_pirq require GSI and then will call hypercall to pass
> > > > > > > GSI into hypervisor and then hypervisor will do the mapping and
> > > > > > > routing, kernel doesn't do the setup and mapping.
> > > > > > 
> > > > > > So we have to expose the GSI to userspace not because userspace itself
> > > > > > uses it, but so userspace can turn around and pass it back into the
> > > > > > kernel?
> > > > > 
> > > > > No, the point is to pass it back to Xen, which doesn't know the
> > > > > mapping between GSIs and PCI devices because it can't execute the ACPI
> > > > > AML resource methods that provide such information.
> > > > > 
> > > > > The (Linux) kernel is just a proxy that forwards the hypercalls from
> > > > > user-space tools into Xen.
> > > > 
> > > > But I guess Xen knows how to interpret a GSI even though it doesn't
> > > > have access to AML?
> > > 
> > > On x86 Xen does know how to map a GSI into an IO-APIC pin, in order
> > > configure the RTE as requested.
> > 
> > IIUC, mapping a GSI to an IO-APIC pin requires information from the
> > MADT.  So I guess Xen does use the static ACPI tables, but not the AML
> > _PRT methods that would connect a GSI with a PCI device?
> 
> Yes, Xen can parse the static tables, and knows the base GSI of
> IO-APICs from the MADT.
> 
> > I guess this means Xen would not be able to deal with _MAT methods,
> > which also contains MADT entries?  I don't know the implications of
> > this -- maybe it means Xen might not be able to use with hot-added
> > devices?
> 
> It's my understanding _MAT will only be present on some very specific
> devices (IO-APIC or CPU objects).  Xen doesn't support hotplug of
> IO-APICs, but hotplug of CPUs should in principle be supported with
> cooperation from the control domain OS (albeit it's not something that
> we tests on our CI).  I don't expect however that a CPU object _MAT
> method will return IO APIC entries.
> 
> > The tables (including DSDT and SSDTS that contain the AML) are exposed
> > to userspace via /sys/firmware/acpi/tables/, but of course that
> > doesn't mean Xen knows how to interpret the AML, and even if it did,
> > Xen probably wouldn't be able to *evaluate* it since that could
> > conflict with the host kernel's use of AML.
> 
> Indeed, there can only be a single OSPM, and that's the dom0 OS (Linux
> in our context).
> 
> Getting back to our context though, what would be a suitable place for
> exposing the GSI assigned to each device?

IIUC, the Xen hypervisor:

  - Interprets /sys/firmware/acpi/tables/APIC (or gets this via
    something running on the Dom0 kernel) to find the physical base
    address and GSI base, e.g., from I/O APIC, I/O SAPIC.

  - Needs the GSI to locate the APIC and pin within the APIC.  The
    Dom0 kernel is the OSPM, so only it can evaluate the AML _PRT to
    learn the PCI device -> GSI mapping.

  - Has direct access to the APIC physical base address to program the
    Redirection Table.

The patch seems a little messy to me because the PCI core has to keep
track of the GSI even though it doesn't need it itself.  And the
current patch exposes it on all arches, even non-ACPI ones or when
ACPI is disabled (easily fixable).

We only call acpi_pci_irq_enable() in the pci_enable_device() path, so
we don't know the GSI unless a Dom0 driver has claimed the device and
called pci_enable_device() for it, which seems like it might not be
desirable.

I was hoping we could put it in /sys/firmware/acpi/interrupts, but
that looks like it's only for SCI statistics.  I guess we could moot a
new /sys/firmware/acpi/gsi/ directory, but then each file there would
have to identify a device, which might not be as convenient as the
/sys/devices/ directory that already exists.  I guess there may be
GSIs for things other than PCI devices; will you ever care about any
of those?

Bjorn

