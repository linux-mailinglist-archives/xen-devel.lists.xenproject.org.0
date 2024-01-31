Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8703B8439F9
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 09:59:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673827.1048289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6QJ-0002L0-4a; Wed, 31 Jan 2024 08:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673827.1048289; Wed, 31 Jan 2024 08:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6QJ-0002J1-1b; Wed, 31 Jan 2024 08:58:23 +0000
Received: by outflank-mailman (input) for mailman id 673827;
 Wed, 31 Jan 2024 08:58:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CJWf=JJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rV6QH-0002It-Vw
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 08:58:22 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1de8cac-c016-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 09:58:20 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33b029a1c8aso230101f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 00:58:20 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 d15-20020adfa34f000000b0033ae9f1fb82sm8527367wrb.48.2024.01.31.00.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 00:58:20 -0800 (PST)
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
X-Inumbo-ID: e1de8cac-c016-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706691500; x=1707296300; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qh9fV0VJ5xXDNHxQ7wqQ2X7g1MNe9pqa0fEzuyTcdc4=;
        b=G7XD2aEF6v3l31i1zXnJLOt3BPK6n1ILEARinnOKHLYZx2ZErjIa7ZJxHbnIqrhfXm
         eW0pB0W/f3OpYMuPl8lNpzzJrhBGRIU0j9htxIJ0Z3i40fYqq/6RYqqx6OlCv3pOzj4j
         uv7QS6zx/IbZ59EnzhKx5ID+ecbkmAqOhL7mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706691500; x=1707296300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qh9fV0VJ5xXDNHxQ7wqQ2X7g1MNe9pqa0fEzuyTcdc4=;
        b=it6iC9eEf3yqnwOqeR5iWvUAPGomL5b0J41dTgZxkXkHNQ1E8/1R79JnermZxNhOaD
         Y36/Ip+dqM+Z9oXnbxKp+eQUjJW9NOmD1lLzLZ1jA2aQ4JLdO9840AVNL3dTwytoD0cL
         5vNejAAsW7CHsEnhXGhTLNMWINwcAzJn/jVQLCdVhzcC/NdV1QRqwRv6dLhJdbLDCVg1
         O/N2G80jqOuLYAhWplVexsD6iKI6ZnxUj6i960GvT7xJk3/9hXYm1xtxT4E05jKkjguY
         m3DzCT2+oalJB7qLQEfGf1OnqiK0ei+XNJPrMpObyEEAGJHNJCkmxlYeU741SyM8MpCu
         LNVw==
X-Gm-Message-State: AOJu0Yy4U6L/T5QB52RhTtp3WdA5QFq/9/Ka/TbTyaxcpfj9Zc57OLHv
	RtqpKewIDqyTfZaJocs5RRedlsoWy0hLEufmQ6EFJjZc0xGQ7voopUNIiSMOYvM=
X-Google-Smtp-Source: AGHT+IEoDFw3DguH17mowGdEzig1sXO01pO7xO+LXaUUAIS/5x+ESHIRsiCl4RQiIC4BMyQA8aoC/Q==
X-Received: by 2002:adf:ea92:0:b0:33a:ded1:b01 with SMTP id s18-20020adfea92000000b0033aded10b01mr3594397wrm.28.1706691500269;
        Wed, 31 Jan 2024 00:58:20 -0800 (PST)
Date: Wed, 31 Jan 2024 09:58:19 +0100
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
Message-ID: <ZboLq6kZhwpUC_c3@macbook>
References: <Zbi8WJPEUSMgjuVY@macbook>
 <20240130204403.GA562912@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240130204403.GA562912@bhelgaas>

On Tue, Jan 30, 2024 at 02:44:03PM -0600, Bjorn Helgaas wrote:
> On Tue, Jan 30, 2024 at 10:07:36AM +0100, Roger Pau Monné wrote:
> > On Mon, Jan 29, 2024 at 04:01:13PM -0600, Bjorn Helgaas wrote:
> > > On Thu, Jan 25, 2024 at 07:17:24AM +0000, Chen, Jiqian wrote:
> > > > On 2024/1/24 00:02, Bjorn Helgaas wrote:
> > > > > On Tue, Jan 23, 2024 at 10:13:52AM +0000, Chen, Jiqian wrote:
> > > > >> On 2024/1/23 07:37, Bjorn Helgaas wrote:
> > > > >>> On Fri, Jan 05, 2024 at 02:22:17PM +0800, Jiqian Chen wrote:
> > > > >>>> There is a need for some scenarios to use gsi sysfs.
> > > > >>>> For example, when xen passthrough a device to dumU, it will
> > > > >>>> use gsi to map pirq, but currently userspace can't get gsi
> > > > >>>> number.
> > > > >>>> So, add gsi sysfs for that and for other potential scenarios.
> > > > >> ...
> > > > > 
> > > > >>> I don't know enough about Xen to know why it needs the GSI in
> > > > >>> userspace.  Is this passthrough brand new functionality that can't be
> > > > >>> done today because we don't expose the GSI yet?
> > > 
> > > I assume this must be new functionality, i.e., this kind of
> > > passthrough does not work today, right?
> > > 
> > > > >> has ACPI support and is responsible for detecting and controlling
> > > > >> the hardware, also it performs privileged operations such as the
> > > > >> creation of normal (unprivileged) domains DomUs. When we give to a
> > > > >> DomU direct access to a device, we need also to route the physical
> > > > >> interrupts to the DomU. In order to do so Xen needs to setup and map
> > > > >> the interrupts appropriately.
> > > > > 
> > > > > What kernel interfaces are used for this setup and mapping?
> > > >
> > > > For passthrough devices, the setup and mapping of routing physical
> > > > interrupts to DomU are done on Xen hypervisor side, hypervisor only
> > > > need userspace to provide the GSI info, see Xen code:
> > > > xc_physdev_map_pirq require GSI and then will call hypercall to pass
> > > > GSI into hypervisor and then hypervisor will do the mapping and
> > > > routing, kernel doesn't do the setup and mapping.
> > > 
> > > So we have to expose the GSI to userspace not because userspace itself
> > > uses it, but so userspace can turn around and pass it back into the
> > > kernel?
> > 
> > No, the point is to pass it back to Xen, which doesn't know the
> > mapping between GSIs and PCI devices because it can't execute the ACPI
> > AML resource methods that provide such information.
> > 
> > The (Linux) kernel is just a proxy that forwards the hypercalls from
> > user-space tools into Xen.
> 
> But I guess Xen knows how to interpret a GSI even though it doesn't
> have access to AML?

On x86 Xen does know how to map a GSI into an IO-APIC pin, in order
configure the RTE as requested.

> > > It seems like it would be better for userspace to pass an identifier
> > > of the PCI device itself back into the hypervisor.  Then the interface
> > > could be generic and potentially work even on non-ACPI systems where
> > > the GSI concept doesn't apply.
> > 
> > We would still need a way to pass the GSI to PCI device relation to
> > the hypervisor, and then cache such data in the hypervisor.
> > 
> > I don't think we have any preference of where such information should
> > be exposed, but given GSIs are an ACPI concept not specific to Xen
> > they should be exposed by a non-Xen specific interface.
> 
> AFAIK Linux doesn't expose GSIs directly to userspace yet.  The GSI
> concept relies on ACPI MADT, _MAT, _PRT, etc.  A GSI is associated
> with some device (PCI in this case) and some interrupt controller
> entry.  I don't understand how a GSI value is useful without knowing
> something about that framework in which GSIs exist.

I wouldn't say it's strictly associated with PCI.  A GSI is a way for
ACPI to have a single space that unifies all possible IO-APICs pins in
the system in a flat way.  A GSI is useful in itself because there's
a single GSI space for the whole host.

> Obviously I know less than nothing about Xen, so I apologize for
> asking all these stupid questions, but it just doesn't all make sense
> to me yet.

That's all fine, maybe there's a better path or way to expose this ACPI
information.  Maybe introduce a per-device acpi directory and expose
it there?  Or rename the entry to acpi_gsi?

Thanks, Roger.

