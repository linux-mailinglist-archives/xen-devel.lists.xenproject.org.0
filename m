Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C828252346
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 00:04:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAh2U-0003dB-M8; Tue, 25 Aug 2020 22:03:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixcz=CD=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAh2S-0003d4-Ap
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 22:03:32 +0000
X-Inumbo-ID: b0755970-1055-434a-bd4c-7d2ae5db0547
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0755970-1055-434a-bd4c-7d2ae5db0547;
 Tue, 25 Aug 2020 22:03:31 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598393009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0OqxJ3l66kPTHUwReqWXl4aiQwAYOml1CtAOOFtsv/I=;
 b=rJTu5uXpTB1P7KT9UkG/8QM9fLrXGorXoC87ldkXgjkRXx5UAas5uFTUMerUTXL9JlFfzV
 rN3mZfoDNBV8AFB4vRFBpqUVtR9nGugXHxgcJlZA9lyZ5d2iRKFgP2+zfzE6U60bVSUFwq
 JoLhqfRIwLjtW2QJXOy7XsedElokgWXmgQLvMAipf+uoAXx8CCMOl+k9j0g1QoHUmXG34r
 mtlyReJy8es+Aozjv5DjFb2Cq+iiM4U59lGIjrG1/fFCYms18my92/EJtXX6kAE+PpZd7v
 7ConNiKl15unKahtr/RvxdhuwT8O3LvR9FUpV5Q5QAqhgXFDbooECvOu9qLmBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598393009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0OqxJ3l66kPTHUwReqWXl4aiQwAYOml1CtAOOFtsv/I=;
 b=ZiNuzZqVhtmi5VokOZzEDE7yq2WAukGXdvrPoJKZHc1CKcyDYknuCTC8rLaX/mB0MFG9sG
 hpgpBFzac0BPrGDw==
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, Jon
 Derrick <jonathan.derrick@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Wei Liu <wei.liu@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave
 Jiang <dave.jiang@intel.com>, Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu
 Lu <baolu.lu@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Dan Williams <dan.j.williams@intel.com>
Subject: Re: [patch RFC 30/38] PCI/MSI: Allow to disable arch fallbacks
In-Reply-To: <871rjuxv45.fsf@nanos.tec.linutronix.de>
References: <20200825213501.GA1931388@bjorn-Precision-5520>
 <871rjuxv45.fsf@nanos.tec.linutronix.de>
Date: Wed, 26 Aug 2020 00:03:29 +0200
Message-ID: <87y2m2wfgu.fsf@nanos.tec.linutronix.de>
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

On Tue, Aug 25 2020 at 23:40, Thomas Gleixner wrote:
> On Tue, Aug 25 2020 at 16:35, Bjorn Helgaas wrote:
>> On Tue, Aug 25, 2020 at 11:28:30PM +0200, Thomas Gleixner wrote:
>>> 
>>> Or did you just mean that those architectures should select
>>> CONFIG_I_WANT_THE CRUFT instead of opting out on the fully irq domain
>>> based ones?
>>
>> Yes, that was my real question -- can we confine the cruft in the
>> crufty arches?  If not, no big deal.
>
> Should be doable. Let me try.

Bah. There is more cruft.

The weak implementation has another way to go sideways via
msi_controller::setup_irq[s] and msi_controller::teardown_irq

drivers/pci/controller/pci-tegra.c
drivers/pci/controller/pcie-rcar-host.c
drivers/pci/controller/pcie-xilinx.c

Groan....


