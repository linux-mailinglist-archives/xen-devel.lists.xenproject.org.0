Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40D1841ED4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 10:08:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673234.1047495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUk5l-0002QD-NL; Tue, 30 Jan 2024 09:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673234.1047495; Tue, 30 Jan 2024 09:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUk5l-0002My-Kd; Tue, 30 Jan 2024 09:07:41 +0000
Received: by outflank-mailman (input) for mailman id 673234;
 Tue, 30 Jan 2024 09:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUgQ=JI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rUk5k-0002Ms-CK
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 09:07:40 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03d14534-bf4f-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 10:07:38 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33af40493f4so901559f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 01:07:38 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 ck14-20020a5d5e8e000000b0033afcf26e11sm586620wrb.29.2024.01.30.01.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 01:07:37 -0800 (PST)
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
X-Inumbo-ID: 03d14534-bf4f-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706605658; x=1707210458; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FtHLxH7cs3c5SJogzL1Yq2dCgbgujdB2fUN48I8yxUw=;
        b=PXV7oZxFT6vkAkmW9xQ824O67L9dksRJOt3/6NaRk0Hqu8G2bagI/lKvLrzZdjiUol
         E82pBcGPoxF5gg6ao3vjiLDTwCRnon5ftscanNXCAMN1mV6/u4TfodNiG6tQvL++dA8y
         7SNXgXfn9NS+G92DzktcqwzB45B8PcRzexxQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706605658; x=1707210458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtHLxH7cs3c5SJogzL1Yq2dCgbgujdB2fUN48I8yxUw=;
        b=BjcW7HtS3OJrnuLNIaLMNCHQHZBLGnylM9QR5u96Lypd36VyVXnLX7uXBs3Q7GXBJ8
         k+S0uzyBDZRaF8jtylOVockVNVGW3Fv7qIkiCPolybkz6rpBt6qTb7UNOMo6WlKR8Qts
         sN8ln0QDlSxH8cn4ImwMnTUSEn2aArcWiugBmgshDAHiCZNdVnhEeqLnBjG5AZ6yuWIs
         B7KfUa3FIpHk1ru4Qei3CNHib3LHN6Mip8yFYwo14VnsF+oIwMpxfEdno1e35lBTv+Od
         DRTaGSO01rTBMe6LqAIVqUcFdfkwLESLJfBmwQsUb7fCmMpGKUF276eIo1Ijlw67fwKm
         2P9A==
X-Gm-Message-State: AOJu0YwRkCAT5Zu2LTmklkx19mb8sjm7ACZhlnnmy/dTkaIA/VJjl+y8
	nZetPYWo7j5Z1mLh85iIDoR2bz0AJSvIfoer815atsmu3ptsyB2G/DSC9xyREY0=
X-Google-Smtp-Source: AGHT+IFLxhDmdcX3IN6b2Fn+UG9CGRbGL/awFLcQCQToWkfjaxuNkbTHPqxTVGG3vpy19ocVt6A2Jw==
X-Received: by 2002:a5d:6da3:0:b0:33a:eda8:336a with SMTP id u3-20020a5d6da3000000b0033aeda8336amr4089276wrs.26.1706605657835;
        Tue, 30 Jan 2024 01:07:37 -0800 (PST)
Date: Tue, 30 Jan 2024 10:07:36 +0100
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
Message-ID: <Zbi8WJPEUSMgjuVY@macbook>
References: <BL1PR12MB5849B51FADC8226764078A98E77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <20240129220113.GA475965@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240129220113.GA475965@bhelgaas>

On Mon, Jan 29, 2024 at 04:01:13PM -0600, Bjorn Helgaas wrote:
> On Thu, Jan 25, 2024 at 07:17:24AM +0000, Chen, Jiqian wrote:
> > On 2024/1/24 00:02, Bjorn Helgaas wrote:
> > > On Tue, Jan 23, 2024 at 10:13:52AM +0000, Chen, Jiqian wrote:
> > >> On 2024/1/23 07:37, Bjorn Helgaas wrote:
> > >>> On Fri, Jan 05, 2024 at 02:22:17PM +0800, Jiqian Chen wrote:
> > >>>> There is a need for some scenarios to use gsi sysfs.
> > >>>> For example, when xen passthrough a device to dumU, it will
> > >>>> use gsi to map pirq, but currently userspace can't get gsi
> > >>>> number.
> > >>>> So, add gsi sysfs for that and for other potential scenarios.
> > >> ...
> > > 
> > >>> I don't know enough about Xen to know why it needs the GSI in
> > >>> userspace.  Is this passthrough brand new functionality that can't be
> > >>> done today because we don't expose the GSI yet?
> 
> I assume this must be new functionality, i.e., this kind of
> passthrough does not work today, right?
> 
> > >> has ACPI support and is responsible for detecting and controlling
> > >> the hardware, also it performs privileged operations such as the
> > >> creation of normal (unprivileged) domains DomUs. When we give to a
> > >> DomU direct access to a device, we need also to route the physical
> > >> interrupts to the DomU. In order to do so Xen needs to setup and map
> > >> the interrupts appropriately.
> > > 
> > > What kernel interfaces are used for this setup and mapping?
> >
> > For passthrough devices, the setup and mapping of routing physical
> > interrupts to DomU are done on Xen hypervisor side, hypervisor only
> > need userspace to provide the GSI info, see Xen code:
> > xc_physdev_map_pirq require GSI and then will call hypercall to pass
> > GSI into hypervisor and then hypervisor will do the mapping and
> > routing, kernel doesn't do the setup and mapping.
> 
> So we have to expose the GSI to userspace not because userspace itself
> uses it, but so userspace can turn around and pass it back into the
> kernel?

No, the point is to pass it back to Xen, which doesn't know the
mapping between GSIs and PCI devices because it can't execute the ACPI
AML resource methods that provide such information.

The (Linux) kernel is just a proxy that forwards the hypercalls from
user-space tools into Xen.

> It seems like it would be better for userspace to pass an identifier
> of the PCI device itself back into the hypervisor.  Then the interface
> could be generic and potentially work even on non-ACPI systems where
> the GSI concept doesn't apply.

We would still need a way to pass the GSI to PCI device relation to
the hypervisor, and then cache such data in the hypervisor.

I don't think we have any preference of where such information should
be exposed, but given GSIs are an ACPI concept not specific to Xen
they should be exposed by a non-Xen specific interface.

Thanks, Roger.

