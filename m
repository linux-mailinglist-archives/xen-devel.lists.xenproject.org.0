Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FE7A75B19
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 19:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931649.1333848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyw0P-0005Y8-0n; Sun, 30 Mar 2025 16:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931649.1333848; Sun, 30 Mar 2025 16:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyw0O-0005VW-Tg; Sun, 30 Mar 2025 16:59:28 +0000
Received: by outflank-mailman (input) for mailman id 931649;
 Sun, 30 Mar 2025 16:59:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l0Nf=WR=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1tyw0N-0005VQ-Fk
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 16:59:27 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54f1c45b-0d88-11f0-9ea7-5ba50f476ded;
 Sun, 30 Mar 2025 18:59:25 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-Qsxcatp-N96AZE9NCnrsag-1; Sun, 30 Mar 2025 12:59:22 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d00017e9dso26543405e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 30 Mar 2025 09:59:22 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8ff02f9csm97569695e9.26.2025.03.30.09.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 09:59:18 -0700 (PDT)
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
X-Inumbo-ID: 54f1c45b-0d88-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743353963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3t3cKdFvQ9kSTO6AkCwvmYi+EYplfurO1UOS5Rdldo=;
	b=iYWBVoXU6nG0tTObS6zuLPdGl8lDH8o2PCx/xJ+3MC/KE/7hQH6uFH4tFPgobPZhyQe1xb
	boG3tH5lMAt9VbyuMykqNtsjTqdWA5XOfiRZyN6zQFtJpnj6XT4EWzfLfjUNxrjVFpXllV
	QzgM6Q0ZKcmeUML/xujsuGw7foKnYko=
X-MC-Unique: Qsxcatp-N96AZE9NCnrsag-1
X-Mimecast-MFC-AGG-ID: Qsxcatp-N96AZE9NCnrsag_1743353961
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743353961; x=1743958761;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o3t3cKdFvQ9kSTO6AkCwvmYi+EYplfurO1UOS5Rdldo=;
        b=bZcsEHB7UMZ8Pu4XHPmjZfjgXxgwAeNGHFZSZAe5kKQRLN8W1lm6l8q/MjZte10xyS
         PXhExxzE6iibznKsjfWtvD2yrSkNvyPAWaywLwRWZfRdcGBz/2orUZpkSIzXnFR64097
         dWQsmek0N3teEbQR0pENx95WB59mXnFz0XcGHLCBcyob1b4s4u7/yOop88F9xQO+dbPi
         vh8hzmpsoxrRXp2EnpEwTqq2LjkGXxwxv7blJjttUEGGFrDcFvQraPkrvZn+lxI8YW/Z
         /SNb9pR/HUFhc6tB/cfSyOOljTurnAA+GddUa/nMfvpt99yOnJhXIJSP7ZHlDXHyTj5F
         2wOg==
X-Forwarded-Encrypted: i=1; AJvYcCWOSJsqFcFZoL7HOZ+UrJ+s8+e+r4xROVSsXdYTtHAKWxBsQr4KWfHGp46Oy0DWF4cppc/G/f0rE2M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1iU8rwdBdlI09PyjFEfGYeYzZ9CopPIY4nEWwGHxDj1m3FnUv
	R5fnJJ5XJLQSS4rUIdVP0S+3SG+TcO7jFF5UMf1njWlf4KitTzVQz/WWAQQDcIyVn0xjbm+yxiX
	8m/WMpguHfu0rMzKObVaVlK+bh+a1d0DV/Q1+BE4T2kjw3QkXbEZQW/F4QgzM4rXL
X-Gm-Gg: ASbGncuv5pT/UGd7BAcXk/yQ+qhqUcJGMDFf7b3RXhYaRlJhYnKPnSxiyCEQMUn7y9x
	hx+8IsMCRy43v2oVXn9jTOwijVsG9Obd3EQxXnODqlxOQ0M9wO2CchYhDuUhslyWJpdVdSKjHaL
	fvXaGDGADDzbdhYx7awxMo0AZImAhr6LzEK/zcG7l052H4OUYG1adVAp3CXLL6OxAnUq/WkE9LU
	bXWKjifIdwyTjWgx6+Uj9v8sj5cx/x3uQ3NGu32qg2cecEnFW2hxVzIRnJBQNnH2B0isfNq/+Sf
	5rc6B5hY7w==
X-Received: by 2002:a05:600c:3b1a:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-43db61d774emr47821975e9.6.1743353960955;
        Sun, 30 Mar 2025 09:59:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+p9VLRRjFT3w4qBD/7B0LlHwO9LmFFwBhLcfryqChirTqXeZbU3Dh3SrxX6aYrpGFJgo00w==
X-Received: by 2002:a05:600c:3b1a:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-43db61d774emr47821495e9.6.1743353960480;
        Sun, 30 Mar 2025 09:59:20 -0700 (PDT)
Date: Sun, 30 Mar 2025 12:59:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	heikki.krogerus@linux.intel.com, peterz@infradead.org,
	benh@kernel.crashing.org, grant.likely@arm.com, paulus@samba.org,
	mingo@kernel.org, sstabellini@kernel.org,
	Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Robin Murphy <robin.murphy@arm.com>, hch@infradead.org,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, graf@amazon.de
Subject: Re: Using Restricted DMA for virtio-pci
Message-ID: <20250330125637-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
 <20250321142947-mutt-send-email-mst@kernel.org>
 <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
 <8e7084b04e5c0456c0ff32ea131a199c6af763cd.camel@infradead.org>
 <20250330093532-mutt-send-email-mst@kernel.org>
 <09fc164ebcfd893ffd67d1b224d6e1c5e5772ee0.camel@infradead.org>
MIME-Version: 1.0
In-Reply-To: <09fc164ebcfd893ffd67d1b224d6e1c5e5772ee0.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8QmM7EifZylbfHG2NflFGRykDrqDVuH2QbRAKZqq3pM_1743353961
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Mar 30, 2025 at 04:07:56PM +0100, David Woodhouse wrote:
> On Sun, 2025-03-30 at 09:42 -0400, Michael S. Tsirkin wrote:
> > On Fri, Mar 28, 2025 at 05:40:41PM +0000, David Woodhouse wrote:
> > > On Fri, 2025-03-21 at 18:42 +0000, David Woodhouse wrote:
> > > > > 
> > > > > I don't mind as such (though I don't understand completely), but since
> > > > > this is changing the device anyway, I am a bit confused why you can't
> > > > > just set the VIRTIO_F_ACCESS_PLATFORM feature bit?  This forces DMA API
> > > > > which will DTRT for you, will it not?
> > > > 
> > > > That would be necessary but not sufficient. ...
> > 
> > could you explain pls?
> 
> There was more to that in the previous email which I elided for this
> followup.
> 
> https://lore.kernel.org/all/d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org/
> 
> > > My first cut at a proposed spec change looks something like this. I'll
> > > post it to the virtio-comment list once I've done some corporate
> > > bureaucracy and when the list stops sending me python tracebacks in
> > > response to my subscribe request.
> > 
> > the linux foundation one does this? maybe poke at the admins.
> > 
> > > In the meantime I'll hack up some QEMU and guest Linux driver support
> > > to match.
> > > 
> > > diff --git a/content.tex b/content.tex
> > > index c17ffa6..1e6e1d6 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -773,6 +773,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > >  Currently these device-independent feature bits are defined:
> > >  
> > >  \begin{description}
> > > +  \item[VIRTIO_F_SWIOTLB (27)] This feature indicates that the device
> > > +  provides a memory region which is to be used for bounce buffering,
> > > +  rather than permitting direct memory access to system memory.
> > >    \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this feature indicates
> > >    that the driver can use descriptors with the VIRTQ_DESC_F_INDIRECT
> > >    flag set, as described in \ref{sec:Basic Facilities of a Virtio
> > > @@ -885,6 +888,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > >  VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only physical
> > >  addresses to the device.
> > >  
> > > +A driver SHOULD accept VIRTIO_F_SWIOTLB if it is offered, and it MUST
> > > +then pass only addresses within the Software IOTLB bounce buffer to the
> > > +device.
> > > +
> > >  A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
> > >  
> > >  A driver SHOULD accept VIRTIO_F_ORDER_PLATFORM if it is offered.
> > > @@ -921,6 +928,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > >  A device MAY fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not
> > >  accepted.
> > >  
> > > +A device MUST NOT offer VIRTIO_F_SWIOTLB if its transport does not
> > > +provide a Software IOTLB bounce buffer.
> > > +A device MAY fail to operate further if VIRTIO_F_SWIOTLB is not accepted.
> > > +
> > >  If VIRTIO_F_IN_ORDER has been negotiated, a device MUST use
> > >  buffers in the same order in which they have been available.
> > >  
> > > diff --git a/transport-pci.tex b/transport-pci.tex
> > > index a5c6719..23e0d57 100644
> > > --- a/transport-pci.tex
> > > +++ b/transport-pci.tex
> > > @@ -129,6 +129,7 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
> > >  \item ISR Status
> > >  \item Device-specific configuration (optional)
> > >  \item PCI configuration access
> > > +\item SWIOTLB bounce buffer
> > >  \end{itemize}
> > >  
> > >  Each structure can be mapped by a Base Address register (BAR) belonging to
> > > @@ -188,6 +189,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
> > >  #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
> > >  /* Vendor-specific data */
> > >  #define VIRTIO_PCI_CAP_VENDOR_CFG        9
> > > +/* Software IOTLB bounce buffer */
> > > +#define VIRTIO_PCI_CAP_SWIOTLB           10
> > >  \end{lstlisting}
> > >  
> > >          Any other value is reserved for future use.
> > > @@ -744,6 +747,36 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
> > >  The driver MUST qualify the \field{vendor_id} before
> > >  interpreting or writing into the Vendor data capability.
> > >  
> > > +\subsubsection{Software IOTLB bounce buffer capability}\label{sec:Virtio
> > > +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> > > +Software IOTLB bounce buffer capability}
> > > +
> > > +The optional Software IOTLB bounce buffer capability allows the
> > > +device to provide a memory region which can be used by the driver
> > > +driver for bounce buffering. This allows a device on the PCI
> > > +transport to operate without DMA access to system memory addresses.
> > > +
> > > +The Software IOTLB region is referenced by the
> > > +VIRTIO_PCI_CAP_SWIOTLB capability. Bus addresses within the referenced
> > > +range are not subject to the requirements of the VIRTIO_F_ORDER_PLATFORM
> > > +capability, if negotiated.
> > 
> > 
> > why not? an optimization?
> > A mix of swiotlb and system memory might be very challenging from POV
> > of ordering.
> 
> Conceptually, these addresses are *on* the PCI device. If the device is
> accessing addresses which are local to it, they aren't subject to IOMMU
> translation/filtering because they never even make it to the PCI bus as
> memory transactions.
> 
> > 
> > > +
> > > +\devicenormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
> > > +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> > > +Software IOTLB bounce buffer capability}
> > > +
> > > +Devices which present the Software IOTLB bounce buffer capability
> > > +SHOULD also offer the VIRTIO_F_SWIOTLB feature.
> > > +
> > > +\drivernormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
> > > +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> > > +Software IOTLB bounce buffer capability}
> > > +
> > > +The driver SHOULD use the offered buffer in preference to passing system
> > > +memory addresses to the device.
> > 
> > Even if not using VIRTIO_F_SWIOTLB? Is that really necessary?
> 
> That part isn't strictly necessary, but I think it makes sense, for
> cases where the SWIOTLB support is an *optimisation* even if it isn't
> strictly necessary.
> 
> Why might it be an "optimisation"? Well... if we're thinking of a model
> like pKVM where the VMM can't just arbitrarily access guest memory,
> using the SWIOTLB is a simple way to avoid that (by using the on-board
> memory instead, which *can* be shared with the VMM).
> 
> But if we want to go to extra lengths to support unenlightened guests,
> an implementation might choose to just *disable* the memory protection
> if the guest doesn't negotiate VIRTIO_F_SWIOTLB, instead of breaking
> that guest.
> 
> Or it might have a complicated emulation/snooping of virtqueues in the
> trusted part of the hypervisor so that it knows which addresses the
> guest has truly *asked* the VMM to access. (And yes, of course that's
> what an IOMMU is for, but when have you seen hardware companies design
> a two-stage IOMMU which supports actual PCI passthrough *and* get it
> right for the hypervisor to 'snoop' on the stage1 page tables to
> support emulated devices too....)
> 
> Ultimately I think it was natural to advertise the location of the
> buffer with the VIRTIO_PCI_CAP_SWIOTLB capability and then to have the
> separate VIRTIO_F_SWIOTLB for negotiation... leaving the obvious
> question of what a device should do if it sees one but *not* the other.
> 
> Obviously you can't have VIRTIO_F_SWIOTLB *without* there actually
> being a buffer advertised with VIRTIO_PCI_CAP_SWIOTLB (or its
> equivalent for other transports). But the converse seemed reasonable as
> a *hint* even if the use of the SWIOTLB isn't mandatory.

OK but I feel it's more work than you think, so we really need
a better reason than just "why not".

For example, it's not at all clear to me how the ordering is
going to work if buffers are in memory but the ring is swiotlb
or the reverse. Ordering will all be messed up.

-- 
MST


