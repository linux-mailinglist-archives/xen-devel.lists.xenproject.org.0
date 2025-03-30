Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD0CA75A3C
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 15:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931602.1333804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tysvk-0005Ri-3I; Sun, 30 Mar 2025 13:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931602.1333804; Sun, 30 Mar 2025 13:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tysvk-0005Pc-0Q; Sun, 30 Mar 2025 13:42:28 +0000
Received: by outflank-mailman (input) for mailman id 931602;
 Sun, 30 Mar 2025 13:42:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l0Nf=WR=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1tysvh-0005PV-Q4
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 13:42:25 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc0561aa-0d6c-11f0-9ffb-bf95429c2676;
 Sun, 30 Mar 2025 15:42:19 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-BkrgiB1dOpyLLVci2-lOeg-1; Sun, 30 Mar 2025 09:42:16 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4394c489babso17198765e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 30 Mar 2025 06:42:15 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm91443025e9.37.2025.03.30.06.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 06:42:12 -0700 (PDT)
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
X-Inumbo-ID: cc0561aa-0d6c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743342137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EVKwqJPfr4QPaIDNGk2hvYA8CboNSIQugm7IZY2L/BA=;
	b=i3iYYq+D8iQfEKf3eOyyjTHSLbf/MwxstfT3lB6L53rZC/DiJb86GWxWVEUZtZU+5gvMqQ
	nBdhptl2Bi7ybah62P4Lt0TG4s2sbUfqqB6w+QQgqhvWLRzwEL36tLXO9OgSzbNrrq2BdT
	QfXVn4WAwhbfXBr6+a7dveCMttMtRtc=
X-MC-Unique: BkrgiB1dOpyLLVci2-lOeg-1
X-Mimecast-MFC-AGG-ID: BkrgiB1dOpyLLVci2-lOeg_1743342135
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743342135; x=1743946935;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVKwqJPfr4QPaIDNGk2hvYA8CboNSIQugm7IZY2L/BA=;
        b=MBAH1Wpl38Mn6x/ksDcTon7M6WL8/GISyonb5011yya0uJaEoAMI9HciBfttQ1nPgn
         oTsVtJVjetWfSDzIRDpzpyRDIKIkKueOL/Q1DkYtXg+P2baAyt2atvpVteQv77JcZUV4
         oIpsrGByIpoHAogUHWNA22dNOyxL7z2awqcm5SsZlOJesBdRtcgzGK9ZQ/r0zrwe05/l
         q3HQ3YLhqFv3zQOELlsa+fIsPzhJctSomi0fKuygr5HEbYsmD9jG1kMpBykGEZiWHDlW
         mZ4aOWlZc70pQzBT2CbOOOePu2zOySsQOTvKPSEisIYtil7vRTMWcEzFyiRjn0LbmLzz
         4NBw==
X-Forwarded-Encrypted: i=1; AJvYcCVUB14dPgw/dKMs2DmtRfHWapPxxVYSS+cJ48CM1rwQGEVWzK1l9XnJ4BWlnNhpqriOGgFTRG+MP1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEW7ZHpr87LuhxemoAhkixkt/qDvQN6h8FUzzwq6jgbSuvgvHK
	jt6cidGL2EN46Sm156HK1GehXLGkhUFsbZPiCATiYoQ0lkF5vE6Uxx4/jbuvqxr+390FsUyABrf
	Lw05GX3/mzp5jIeAWFXqH6IWf4mPYW3NK3Nj5bw0MHrt7LWBgzvtTdNnBKbGDzRtA
X-Gm-Gg: ASbGncuVf/C12dLvPwNMgTeLSIhL6ZFFQldC/DUjUa2VC5KHNW2ZEiNjLWu5P5wsCj1
	VJmij+6zzMTqbxRy9OxJn2i71kec3NWtrHNU3CJTh3dd/9fJS2J9pWo3VolHr3je8bXpCljJntK
	GVEkXaLyWMervBc5TNa4/MnZqZG8la0d871n1o+8DJZbSee8NnUgBCkylKSEeSqajO9B38n4OKk
	DT5kJtWDTcG3E1OoHMDtPkOZYsRoSeuSFBk3KJ4rKc3kQcVEc5vQ91hHfZmQ9dzkY5g2jRoKP1k
	4W8J2Z9ULw==
X-Received: by 2002:a05:600c:384d:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-43db62bd0a5mr44135485e9.19.1743342134760;
        Sun, 30 Mar 2025 06:42:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFceVYy8P/4rdEylphWngsUQJtsROJ+u5xjCs5nBFb/+Q+tLCz4LEP8IBXSQxv5v24A9e0nCQ==
X-Received: by 2002:a05:600c:384d:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-43db62bd0a5mr44134915e9.19.1743342134286;
        Sun, 30 Mar 2025 06:42:14 -0700 (PDT)
Date: Sun, 30 Mar 2025 09:42:07 -0400
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
Message-ID: <20250330093532-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
 <20250321142947-mutt-send-email-mst@kernel.org>
 <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
 <8e7084b04e5c0456c0ff32ea131a199c6af763cd.camel@infradead.org>
MIME-Version: 1.0
In-Reply-To: <8e7084b04e5c0456c0ff32ea131a199c6af763cd.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1o7xUi3ZLP2QdEBxYHWFFosxscUKw8nNDTIdXpRPaHM_1743342135
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Mar 28, 2025 at 05:40:41PM +0000, David Woodhouse wrote:
> On Fri, 2025-03-21 at 18:42 +0000, David Woodhouse wrote:
> > On Fri, 2025-03-21 at 14:32 -0400, Michael S. Tsirkin wrote:
> > > On Fri, Mar 21, 2025 at 03:38:10PM +0000, David Woodhouse wrote:
> > > > On Tue, 2021-02-09 at 14:21 +0800, Claire Chang wrote:
> > > > > This series implements mitigations for lack of DMA access control on
> > > > > systems without an IOMMU, which could result in the DMA accessing the
> > > > > system memory at unexpected times and/or unexpected addresses, possibly
> > > > > leading to data leakage or corruption.
> > > > 
> > > > Replying to an ancient (2021) thread which has already been merged...
> > > > 
> > > > I'd like to be able to use this facility for virtio devices.
> > > > 
> > > > Virtio already has a complicated relationship with the DMA API, because
> > > > there were a bunch of early VMM bugs where the virtio devices where
> > > > magically exempted from IOMMU protection, but the VMM lied to the guest
> > > > and claimed they weren't.
> > > > 
> > > > With the advent of confidential computing, and the VMM (or whatever's
> > > > emulating the virtio device) not being *allowed* to arbitrarily access
> > > > all of the guest's memory, the DMA API becomes necessary again.
> > > > 
> > > > Either a virtual IOMMU needs to determine which guest memory the VMM
> > > > may access, or the DMA API is wrappers around operations which
> > > > share/unshare (or unencrypt/encrypt) the memory in question.
> > > > 
> > > > All of which is complicated and slow, if we're looking at a minimal
> > > > privileged hypervisor stub like pKVM which enforces the lack of guest
> > > > memory access from VMM.
> > > > 
> > > > I'm thinking of defining a new type of virtio-pci device which cannot
> > > > do DMA to arbitrary system memory. Instead it has an additional memory
> > > > BAR which is used as a SWIOTLB for bounce buffering.
> > > > 
> > > > The driver for it would look much like the existing virtio-pci device
> > > > except that it would register the restricted-dma region first (and thus
> > > > the swiotlb dma_ops), and then just go through the rest of the setup
> > > > like any other virtio device.
> > > > 
> > > > That seems like it ought to be fairly simple, and seems like a
> > > > reasonable way to allow an untrusted VMM to provide virtio devices with
> > > > restricted DMA access.
> > > > 
> > > > While I start actually doing the typing... does anyone want to start
> > > > yelling at me now? Christoph? mst? :)
> > > 
> > > 
> > > I don't mind as such (though I don't understand completely), but since
> > > this is changing the device anyway, I am a bit confused why you can't
> > > just set the VIRTIO_F_ACCESS_PLATFORM feature bit?  This forces DMA API
> > > which will DTRT for you, will it not?
> > 
> > That would be necessary but not sufficient. ...

could you explain pls?

> My first cut at a proposed spec change looks something like this. I'll
> post it to the virtio-comment list once I've done some corporate
> bureaucracy and when the list stops sending me python tracebacks in
> response to my subscribe request.

the linux foundation one does this? maybe poke at the admins.

> In the meantime I'll hack up some QEMU and guest Linux driver support
> to match.
> 
> diff --git a/content.tex b/content.tex
> index c17ffa6..1e6e1d6 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -773,6 +773,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  Currently these device-independent feature bits are defined:
>  
>  \begin{description}
> +  \item[VIRTIO_F_SWIOTLB (27)] This feature indicates that the device
> +  provides a memory region which is to be used for bounce buffering,
> +  rather than permitting direct memory access to system memory.
>    \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this feature indicates
>    that the driver can use descriptors with the VIRTQ_DESC_F_INDIRECT
>    flag set, as described in \ref{sec:Basic Facilities of a Virtio
> @@ -885,6 +888,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only physical
>  addresses to the device.
>  
> +A driver SHOULD accept VIRTIO_F_SWIOTLB if it is offered, and it MUST
> +then pass only addresses within the Software IOTLB bounce buffer to the
> +device.
> +
>  A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
>  
>  A driver SHOULD accept VIRTIO_F_ORDER_PLATFORM if it is offered.
> @@ -921,6 +928,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  A device MAY fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not
>  accepted.
>  
> +A device MUST NOT offer VIRTIO_F_SWIOTLB if its transport does not
> +provide a Software IOTLB bounce buffer.
> +A device MAY fail to operate further if VIRTIO_F_SWIOTLB is not accepted.
> +
>  If VIRTIO_F_IN_ORDER has been negotiated, a device MUST use
>  buffers in the same order in which they have been available.
>  
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..23e0d57 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -129,6 +129,7 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>  \item ISR Status
>  \item Device-specific configuration (optional)
>  \item PCI configuration access
> +\item SWIOTLB bounce buffer
>  \end{itemize}
>  
>  Each structure can be mapped by a Base Address register (BAR) belonging to
> @@ -188,6 +189,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>  #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
>  /* Vendor-specific data */
>  #define VIRTIO_PCI_CAP_VENDOR_CFG        9
> +/* Software IOTLB bounce buffer */
> +#define VIRTIO_PCI_CAP_SWIOTLB           10
>  \end{lstlisting}
>  
>          Any other value is reserved for future use.
> @@ -744,6 +747,36 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
>  The driver MUST qualify the \field{vendor_id} before
>  interpreting or writing into the Vendor data capability.
>  
> +\subsubsection{Software IOTLB bounce buffer capability}\label{sec:Virtio
> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> +Software IOTLB bounce buffer capability}
> +
> +The optional Software IOTLB bounce buffer capability allows the
> +device to provide a memory region which can be used by the driver
> +driver for bounce buffering. This allows a device on the PCI
> +transport to operate without DMA access to system memory addresses.
> +
> +The Software IOTLB region is referenced by the
> +VIRTIO_PCI_CAP_SWIOTLB capability. Bus addresses within the referenced
> +range are not subject to the requirements of the VIRTIO_F_ORDER_PLATFORM
> +capability, if negotiated.


why not? an optimization?
A mix of swiotlb and system memory might be very challenging from POV
of ordering.


> +
> +\devicenormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> +Software IOTLB bounce buffer capability}
> +
> +Devices which present the Software IOTLB bounce buffer capability
> +SHOULD also offer the VIRTIO_F_SWIOTLB feature.
> +
> +\drivernormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> +Software IOTLB bounce buffer capability}
> +
> +The driver SHOULD use the offered buffer in preference to passing system
> +memory addresses to the device.

Even if not using VIRTIO_F_SWIOTLB? Is that really necessary?

> If the driver accepts the VIRTIO_F_SWIOTLB
> +feature, then the driver MUST use the offered buffer and never pass system
> +memory addresses to the device.
> +
>  \subsubsection{PCI configuration access capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / PCI configuration access capability}
>  
>  The VIRTIO_PCI_CAP_PCI_CFG capability
> 



