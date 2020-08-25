Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D432252303
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 23:40:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAgfu-0001OK-PG; Tue, 25 Aug 2020 21:40:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixcz=CD=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAgft-0001OF-8O
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 21:40:13 +0000
X-Inumbo-ID: 29f86197-4ae7-4481-871a-898139bfc941
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29f86197-4ae7-4481-871a-898139bfc941;
 Tue, 25 Aug 2020 21:40:12 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598391611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xevxgk/koQBpWDveP6OSc84vgcr5kfA4Zdl3bp5EVM4=;
 b=4xeToqQJtFdDP336L/z/rJTPtiaEMQCwoWm7ZO3Dg80xwJI6LJbbyPem9IgDDH4c55kFW8
 efqvvncv7tcn3qZRe1acTT+kpdjKgMt9wBNwOWKpIu8I/uajoL15iwyI1xdSxrTpkklftN
 qSOF96Uua9BwCriI1UaH4colhyY+dU/jTNfAqa0OFWsv2NiYjXrj2a+s3Ori4UXHG1ddJa
 SA25EuwSuC9jCrd07R3Jsye+YPfQwEl1Ep3+ek2m/tcneuMb2osfUQOvMB9hVnwV5yHYK2
 m18kpfK5PCTA749jQbnkT3Om2+aFbVSlYN71Sn1ixrGPB3rBhJD9Y7h2fYYcZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598391611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xevxgk/koQBpWDveP6OSc84vgcr5kfA4Zdl3bp5EVM4=;
 b=JuIC3Wa21psedQKJydMn/nuPaxSXUZxPFQxtgBHwdGz1Ag7Nv0IARkCrU78WZB/vmrNKK/
 V7gDLpNFS4jDbzDw==
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, Bjorn Helgaas
 <bhelgaas@google.com>, linux-pci@vger.kernel.org, Joerg Roedel
 <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, Jon
 Derrick <jonathan.derrick@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Wei Liu <wei.liu@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Steve Wahl
 <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson
 <rja@hpe.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@mellanox.com>, Dave
 Jiang <dave.jiang@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>, Jacob Pan <jacob.jun.pan@intel.com>, Baolu
 Lu <baolu.lu@intel.com>, Kevin Tian <kevin.tian@intel.com>, Dan Williams
 <dan.j.williams@intel.com>
Subject: Re: [patch RFC 30/38] PCI/MSI: Allow to disable arch fallbacks
In-Reply-To: <20200825213501.GA1931388@bjorn-Precision-5520>
References: <20200825213501.GA1931388@bjorn-Precision-5520>
Date: Tue, 25 Aug 2020 23:40:10 +0200
Message-ID: <871rjuxv45.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 25 2020 at 16:35, Bjorn Helgaas wrote:
> On Tue, Aug 25, 2020 at 11:28:30PM +0200, Thomas Gleixner wrote:
>> 
>> Or did you just mean that those architectures should select
>> CONFIG_I_WANT_THE CRUFT instead of opting out on the fully irq domain
>> based ones?
>
> Yes, that was my real question -- can we confine the cruft in the
> crufty arches?  If not, no big deal.

Should be doable. Let me try.

Thanks,

        tglx

