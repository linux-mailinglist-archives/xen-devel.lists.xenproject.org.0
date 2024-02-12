Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5810C850F76
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 10:14:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679369.1056798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSNZ-0001tb-K1; Mon, 12 Feb 2024 09:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679369.1056798; Mon, 12 Feb 2024 09:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSNZ-0001rA-Ev; Mon, 12 Feb 2024 09:13:33 +0000
Received: by outflank-mailman (input) for mailman id 679369;
 Mon, 12 Feb 2024 09:13:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IbWo=JV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rZSNY-0001r4-2H
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 09:13:32 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcc2cb92-c986-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 10:13:30 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so3780252a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 01:13:29 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 y3-20020aa7c243000000b005612ac47d85sm2539889edo.82.2024.02.12.01.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 01:13:28 -0800 (PST)
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
X-Inumbo-ID: fcc2cb92-c986-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707729209; x=1708334009; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kpndX5C2Mii0Flwlx+5AtvY+2C+NxX9epFi0dvTnTAk=;
        b=ICxh1bTBNIRP/Wrh4PP3jWs6L4XUaqvIbfG/7WS9QciYVf2E2Eh0HKNfktLifF5GRn
         fpq9V5TFWo8PDKGaLJQfc7jpZM6NTkHS3f1NtjsOVcOmrl3eROHTpWFSfa8/q/G9PgVC
         9Q2mo1fsncTXxfV/L6CXIBWvrKDs4SJ50i3Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707729209; x=1708334009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kpndX5C2Mii0Flwlx+5AtvY+2C+NxX9epFi0dvTnTAk=;
        b=dQlccyYyK8dMSpWCbCwc0hgTja6sC1VSe8DjyNpRB306vF+2b3Sq5O2HZhpqAbfPHt
         /iOP8baTXjDVNwb/DZU5I+pjZtMNYkYk0RnKOavamCGbGr/6MtdyAP9gD8nGJU30swVG
         f33o19B3lVNMKxQ1SD7IZKLmb/AvvCXCyS5KM/dL6jwSFGFCi41y+sqNfWelI4TYKrr3
         VcA7QpeR1R66vNIb/TJkF9vS/hEKZrlGSbfqpu6WIovcKGwotEu4JjedcB1q7NeuRbru
         YeCq9f5DYNH1EPwpXSSe1VCqGcd1enorOjlDvYBFusjvPt3zNpqnHpKqfOUAiC84lIXS
         h0Ww==
X-Gm-Message-State: AOJu0Yyt2m+8g8KIVIuSVf4cgpS72oSn/09NRliZhgbFAbOGMjpWHED9
	DEgtYCoo4nEDUw52xepOd0WltY10TyPytzbR0WF8KudpPJOMhIZB5ts9uRcLBSA=
X-Google-Smtp-Source: AGHT+IFGM2App413SIKcCc2Ur0ABS1uXMeYaU9EoPH8ldn/XY6VDUheFoubSE+uiG+infjMyonjofA==
X-Received: by 2002:aa7:d3cb:0:b0:560:93b1:a351 with SMTP id o11-20020aa7d3cb000000b0056093b1a351mr4796353edr.37.1707729209255;
        Mon, 12 Feb 2024 01:13:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUi3cSiwbKOwpf9FXAXb3ol8cK21LF8oKTT7zqFHCYqkgcXjwYmpCjbQMm3YKWVBH0wL86GTtfkE0i71Wno6hJgmt+n7jCwj2ThW0BisPIfQ9BSjJ3P/9EBUj8hO4d+sYwI+fl9m6GT0ua3Ox1pNPX7VAhJzufiSulJnviWa7/EOypfxKpbGGnncIAlMdGui2MMtGMDfqBpBLO8n3REJrswc3RQISy4K2jPKesDs7g2VZ3q0NEQLmNizGjzCA67Ju4VddytRfukHTZfMGKvlTY9RDFYR7GrkRHU1/hVzORPAOSWyG1y0gtq04IbVpZNMTko1Xmz0KZVrkmZCyPUjiONYOx3qrezQhpvHry9fw5wK5nTj0snXr1yUQ1iD4ss1Nf0x9YWGtsKGTQ9mR0L8z3HHiCTjSmC8+ol4A7mwG+oApaXZvTUGqk/+B1CF2OES/et67TnEkF84wM1h3O5GUBRMqd0yODERzxI+mqk8FUavSZFQnV9sWAW5/Ay76BMMWPFvRpYW9HQB3Y=
Date: Mon, 12 Feb 2024 10:13:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <ZcnhOEjnTgbYFPVl@macbook>
References: <ZbtY1R15pYZz3F3B@macbook>
 <20240209210549.GA884438@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240209210549.GA884438@bhelgaas>

On Fri, Feb 09, 2024 at 03:05:49PM -0600, Bjorn Helgaas wrote:
> On Thu, Feb 01, 2024 at 09:39:49AM +0100, Roger Pau Monné wrote:
> > On Wed, Jan 31, 2024 at 01:00:14PM -0600, Bjorn Helgaas wrote:
> > > On Wed, Jan 31, 2024 at 09:58:19AM +0100, Roger Pau Monné wrote:
> > > > On Tue, Jan 30, 2024 at 02:44:03PM -0600, Bjorn Helgaas wrote:
> > > > > On Tue, Jan 30, 2024 at 10:07:36AM +0100, Roger Pau Monné wrote:
> > > > > > On Mon, Jan 29, 2024 at 04:01:13PM -0600, Bjorn Helgaas wrote:
> > > > > > > On Thu, Jan 25, 2024 at 07:17:24AM +0000, Chen, Jiqian wrote:
> > > > > > > > On 2024/1/24 00:02, Bjorn Helgaas wrote:
> > > > > > > > > On Tue, Jan 23, 2024 at 10:13:52AM +0000, Chen, Jiqian wrote:
> > > > > > > > >> On 2024/1/23 07:37, Bjorn Helgaas wrote:
> > > > > > > > >>> On Fri, Jan 05, 2024 at 02:22:17PM +0800, Jiqian Chen wrote:
> > > > > > > > >>>> There is a need for some scenarios to use gsi sysfs.
> > > > > > > > >>>> For example, when xen passthrough a device to dumU, it will
> > > > > > > > >>>> use gsi to map pirq, but currently userspace can't get gsi
> > > > > > > > >>>> number.
> > > > > > > > >>>> So, add gsi sysfs for that and for other potential scenarios.
> > > > > > > > >> ...
> > > > > > > > > 
> > > > > > > > >>> I don't know enough about Xen to know why it needs the GSI in
> > > > > > > > >>> userspace.  Is this passthrough brand new functionality that can't be
> > > > > > > > >>> done today because we don't expose the GSI yet?
> > > > > > > 
> > > > > > > I assume this must be new functionality, i.e., this kind of
> > > > > > > passthrough does not work today, right?
> > > > > > > 
> > > > > > > > >> has ACPI support and is responsible for detecting and controlling
> > > > > > > > >> the hardware, also it performs privileged operations such as the
> > > > > > > > >> creation of normal (unprivileged) domains DomUs. When we give to a
> > > > > > > > >> DomU direct access to a device, we need also to route the physical
> > > > > > > > >> interrupts to the DomU. In order to do so Xen needs to setup and map
> > > > > > > > >> the interrupts appropriately.
> > > > > > > > > 
> > > > > > > > > What kernel interfaces are used for this setup and mapping?
> > > > > > > >
> > > > > > > > For passthrough devices, the setup and mapping of routing physical
> > > > > > > > interrupts to DomU are done on Xen hypervisor side, hypervisor only
> > > > > > > > need userspace to provide the GSI info, see Xen code:
> > > > > > > > xc_physdev_map_pirq require GSI and then will call hypercall to pass
> > > > > > > > GSI into hypervisor and then hypervisor will do the mapping and
> > > > > > > > routing, kernel doesn't do the setup and mapping.
> > > > > > > 
> > > > > > > So we have to expose the GSI to userspace not because userspace itself
> > > > > > > uses it, but so userspace can turn around and pass it back into the
> > > > > > > kernel?
> > > > > > 
> > > > > > No, the point is to pass it back to Xen, which doesn't know the
> > > > > > mapping between GSIs and PCI devices because it can't execute the ACPI
> > > > > > AML resource methods that provide such information.
> > > > > > 
> > > > > > The (Linux) kernel is just a proxy that forwards the hypercalls from
> > > > > > user-space tools into Xen.
> > > > > 
> > > > > But I guess Xen knows how to interpret a GSI even though it doesn't
> > > > > have access to AML?
> > > > 
> > > > On x86 Xen does know how to map a GSI into an IO-APIC pin, in order
> > > > configure the RTE as requested.
> > > 
> > > IIUC, mapping a GSI to an IO-APIC pin requires information from the
> > > MADT.  So I guess Xen does use the static ACPI tables, but not the AML
> > > _PRT methods that would connect a GSI with a PCI device?
> > 
> > Yes, Xen can parse the static tables, and knows the base GSI of
> > IO-APICs from the MADT.
> > 
> > > I guess this means Xen would not be able to deal with _MAT methods,
> > > which also contains MADT entries?  I don't know the implications of
> > > this -- maybe it means Xen might not be able to use with hot-added
> > > devices?
> > 
> > It's my understanding _MAT will only be present on some very specific
> > devices (IO-APIC or CPU objects).  Xen doesn't support hotplug of
> > IO-APICs, but hotplug of CPUs should in principle be supported with
> > cooperation from the control domain OS (albeit it's not something that
> > we tests on our CI).  I don't expect however that a CPU object _MAT
> > method will return IO APIC entries.
> > 
> > > The tables (including DSDT and SSDTS that contain the AML) are exposed
> > > to userspace via /sys/firmware/acpi/tables/, but of course that
> > > doesn't mean Xen knows how to interpret the AML, and even if it did,
> > > Xen probably wouldn't be able to *evaluate* it since that could
> > > conflict with the host kernel's use of AML.
> > 
> > Indeed, there can only be a single OSPM, and that's the dom0 OS (Linux
> > in our context).
> > 
> > Getting back to our context though, what would be a suitable place for
> > exposing the GSI assigned to each device?
> 
> IIUC, the Xen hypervisor:
> 
>   - Interprets /sys/firmware/acpi/tables/APIC (or gets this via
>     something running on the Dom0 kernel) to find the physical base
>     address and GSI base, e.g., from I/O APIC, I/O SAPIC.

No, Xen parses the MADT directly from memory, before stating dom0.
That's a static table so it's fine for Xen to parse it and obtain the
I/O APIC GSI base.

>   - Needs the GSI to locate the APIC and pin within the APIC.  The
>     Dom0 kernel is the OSPM, so only it can evaluate the AML _PRT to
>     learn the PCI device -> GSI mapping.

Yes, Xen doesn't know the PCI device -> GSI mapping.  Dom0 needs to
parse the ACPI methods and signal Xen to configure a GSI with a
given trigger and polarity.

>   - Has direct access to the APIC physical base address to program the
>     Redirection Table.

Yes, the hardware (native) I/O APIC is owned by Xen, and not directly
accessible by dom0.

> The patch seems a little messy to me because the PCI core has to keep
> track of the GSI even though it doesn't need it itself.  And the
> current patch exposes it on all arches, even non-ACPI ones or when
> ACPI is disabled (easily fixable).
> 
> We only call acpi_pci_irq_enable() in the pci_enable_device() path, so
> we don't know the GSI unless a Dom0 driver has claimed the device and
> called pci_enable_device() for it, which seems like it might not be
> desirable.

I think that's always the case, as on dom0 devices to be passed
through are handled by pciback which does enable them.

I agree it might be best to not tie exposing the node to
pci_enable_device() having been called.  Is _PRT only evaluated as
part of acpi_pci_irq_enable()? (or pci_enable_device()).

> I was hoping we could put it in /sys/firmware/acpi/interrupts, but
> that looks like it's only for SCI statistics.  I guess we could moot a
> new /sys/firmware/acpi/gsi/ directory, but then each file there would
> have to identify a device, which might not be as convenient as the
> /sys/devices/ directory that already exists.  I guess there may be
> GSIs for things other than PCI devices; will you ever care about any
> of those?

We only support passthrough of PCI devices so far, but I guess if any
of such non-PCI devices ever appear and those use a GSI, and Xen
supports passthrough for them, then yes, we would need to fetch such
GSI somehow.

Thanks, Roger.

