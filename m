Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE952539BC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 23:27:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kB2xO-0003nX-Vd; Wed, 26 Aug 2020 21:27:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kB2xN-0003nS-8V
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 21:27:45 +0000
X-Inumbo-ID: 85ee9db1-36a0-4c52-9e38-219ec84ab960
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85ee9db1-36a0-4c52-9e38-219ec84ab960;
 Wed, 26 Aug 2020 21:27:44 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598477262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AP/JLSo39vhE0wtYqmiGvGnDrGFkgwOpCQr0bMHNNIo=;
 b=Ppbpj32Cn5vd1ION8eS5aNl/fj1QjIs+RkAaM6B9/j2KvPN1mwxngYrYRgiWuDvZz7tk4s
 6s3VU0oxNXckuhydtQw2GgWp9Lfh6ODP0+s0hFgvzGCyaE7b+A+lIZaUi6gcZA/8lo5a4X
 Euy7gPuCc91BHe8pXICVD2nCrFV9IERKZf+HfP/+i3Fiyte9xzGw/xupM0BY5OEQNdUEQg
 FSOqYrYHEp/isAlEeyp0rD5/Tbv3MnOJpEwiIrn+8eh5SdC6QWIfsV4iOmiZxyT6TlWac6
 8D2S8zdYEOpLjpGvQn5ZbyugrRJHkxqLX+ncTO+VdcNoBYHDOsGnw6OdV/ra8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598477262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AP/JLSo39vhE0wtYqmiGvGnDrGFkgwOpCQr0bMHNNIo=;
 b=g64NV1HP6nZPTwYFAmNkOJaevjoEaWBisT8u9MwS+B3AK95KBK4cxQI4t2bfE2amJBs0p0
 WvmjR7PZtJ//chDw==
To: Marc Zyngier <maz@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, Joerg Roedel
 <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, Jon
 Derrick <jonathan.derrick@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Wei Liu <wei.liu@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Steve Wahl
 <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson
 <rja@hpe.com>, linux-pci@vger.kernel.org, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jacob Pan
 <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>, Kevin Tian
 <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [patch V2 34/46] PCI/MSI: Make arch_.*_msi_irq[s] fallbacks
 selectable
In-Reply-To: <8736492jot.wl-maz@kernel.org>
References: <20200826111628.794979401@linutronix.de>
 <20200826112333.992429909@linutronix.de> <8736492jot.wl-maz@kernel.org>
Date: Wed, 26 Aug 2020 23:27:41 +0200
Message-ID: <87lfi1t7w2.fsf@nanos.tec.linutronix.de>
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

On Wed, Aug 26 2020 at 22:14, Marc Zyngier wrote:
> On Wed, 26 Aug 2020 12:17:02 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> @@ -103,6 +105,7 @@ config PCIE_XILINX_CPM
>>  	bool "Xilinx Versal CPM host bridge support"
>>  	depends on ARCH_ZYNQMP || COMPILE_TEST
>>  	select PCI_HOST_COMMON
>> +	select PCI_MSI_ARCH_FALLBACKS
>
> This guy actually doesn't implement MSIs at all (it seems to delegate
> them to an ITS present in the system, if I read the DT binding
> correctly). However its older brother from the same silicon dealer
> seems to need it. The patchlet below should fix it.

Gah, at some point my eyes went squared and I lost track..


