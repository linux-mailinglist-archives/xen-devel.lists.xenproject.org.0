Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857FDA75CB8
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 23:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931789.1333977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz0Co-0002WX-37; Sun, 30 Mar 2025 21:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931789.1333977; Sun, 30 Mar 2025 21:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz0Co-0002UL-0V; Sun, 30 Mar 2025 21:28:34 +0000
Received: by outflank-mailman (input) for mailman id 931789;
 Sun, 30 Mar 2025 21:28:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QTQ+=WR=desiato.srs.infradead.org=BATV+07442bf8be34e4cbe263+7889+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tz0Cm-0002UB-8y
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 21:28:32 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecf78e7a-0dad-11f0-9ea7-5ba50f476ded;
 Sun, 30 Mar 2025 23:28:30 +0200 (CEST)
Received: from [172.31.31.142] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
 id 1tz0CE-00000006YmG-0vmx; Sun, 30 Mar 2025 21:27:58 +0000
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
X-Inumbo-ID: ecf78e7a-0dad-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HIpM9hYzjP/g9i1cY/OEycnx2DC+LjHysGz3lE5EyQg=; b=Q/hhRpyamRXibNzigh2wG8/crc
	ROYh6p8GREOUEHn5tPI/fG9G8DE4L8N1epcO9IHxApYf/rGNhQ3VmRGxA6UzdctKclKmGUTgNIzsC
	76m1acHpB5W5m9TMue6N9Qra6ijIlHpw8lJLREto9is2YXLk+ebNigSoN5LCAytBqNH9COzHnEqeH
	z1RG3qddVWELJ3MWgOm3zk7kzSlb42TVr24uisl6/2Gmh4Hjf4XnKxoRmOv+ohFZkgIi/mZunziCi
	icx4CajoRfo+cML2Jfz1BONBydD5a/3hHnRie4i4JSIt5cdyrz/xRYarmiddiPFVCBqgWkFiu7Oce
	KThu+WDA==;
Date: Sun, 30 Mar 2025 22:27:58 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: linuxppc-dev@lists.ozlabs.org, "Michael S. Tsirkin" <mst@redhat.com>
CC: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, heikki.krogerus@linux.intel.com,
 peterz@infradead.org, benh@kernel.crashing.org, grant.likely@arm.com,
 paulus@samba.org, mingo@kernel.org, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Robin Murphy <robin.murphy@arm.com>, hch@infradead.org,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?ISO-8859-1?Q?Eugenio_P=E9rez?= <eperezma@redhat.com>,
 virtualization@lists.linux.dev, graf@amazon.de
Subject: Re: Using Restricted DMA for virtio-pci
User-Agent: K-9 Mail for Android
In-Reply-To: <20250330125929-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org> <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org> <20250321142947-mutt-send-email-mst@kernel.org> <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org> <20250330125929-mutt-send-email-mst@kernel.org>
Message-ID: <E3EE485D-AD74-457C-BDEC-F8C62DFE4909@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 30 March 2025 18:06:47 BST, "Michael S=2E Tsirkin" <mst@redhat=2Ecom> wr=
ote:
>> It's basically just allowing us to expose through PCI, what I believe
>> we can already do for virtio in DT=2E
>
>I am not saying I am against this extension=2E
>The idea to restrict DMA has a lot of merit outside pkvm=2E
>For example, with a physical devices, limiting its DMA
>to a fixed range can be good for security at a cost of
>an extra data copy=2E
>
>So I am not saying we have to block this specific hack=2E
>
>what worries me fundamentally is I am not sure it works well
>e=2Eg=2E for physical virtio cards=2E

Not sure why it doesn't work for physical cards=2E They don't need to be b=
us-mastering; they just take data from a buffer in their own RAM=2E

>Attempts to pass data between devices will now also require
>extra data copies=2E

Yes=2E I think that's acceptable, but if we really cared we could perhaps =
extend the capability to refer to a range inside a given BAR on a specific =
*device*? Or maybe just *function*, and allow sharing of SWIOTLB buffer wit=
hin a multi-function device?

I think it's overkill though=2E

>Did you think about adding an swiotlb mode to virtio-iommu at all?
>Much easier than parsing page tables=2E

Often the guests which need this will have a real IOMMU for the true pass-=
through devices=2E Adding a virtio-iommu into the mix (or any other system-=
wide way of doing something different for certain devices) is problematic=
=2E

The on-device buffer keeps it nice and simple, and even allows us to do de=
vice support for operating systems like Windows where it's a lot harder to =
do anything generic in the core OS=2E


