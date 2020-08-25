Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238212513B3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 09:58:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kATq1-0006Ak-OJ; Tue, 25 Aug 2020 07:57:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixcz=CD=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kATq0-0006Af-C4
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 07:57:48 +0000
X-Inumbo-ID: 6765b689-feb6-4a83-a4c8-a45fc1dabe88
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6765b689-feb6-4a83-a4c8-a45fc1dabe88;
 Tue, 25 Aug 2020 07:57:45 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598342264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7XEOONAx/Y/ZiGBa138zNdJ2aL0ZkJolLF35mYWdkk=;
 b=JIpR4o0QGi7kK727LCmqEP1DulpXQaBIgflkZBLs5t7Lz8BkKPnpuEKumBjEIUv4Qu2fG/
 Oir+lSuIqPfxIOiBFQCY78M6YxK5B+THOxc0icLjtAE5JJUVAEoLFxVLAg3uxDsMB1SGXX
 XnaeD4Z6L/kPkUhTl+94PS6Ks0d2HjckxWbTB9b++Lqlou5zbvd+xX/Hopw1vkn5tYovdo
 HLgyn2z6ttiQeTALU45iDOFAu5axIGbm6lbmj8cbkv/CZonC9AGBAL/usvMWV2QkosoUW5
 3RNUmC/gOSqY1Bc8xh5ArbnCykaJkYqCjP/+V1YJalXwg1JSBYvSGRteI38PbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598342264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7XEOONAx/Y/ZiGBa138zNdJ2aL0ZkJolLF35mYWdkk=;
 b=UFHNoPg/zXQ+Xg2Pv56inRA93Orb7eMVMpZPw2ESh1dxXdBikqTGQn7J7IK19znmQQ8GAl
 YbijH/OnOMKVGqAA==
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org, Haiyang
 Zhang <haiyangz@microsoft.com>, Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Stephen Hemminger
 <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>, Dimitri
 Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@mellanox.com>, Dave
 Jiang <dave.jiang@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>, Jacob Pan <jacob.jun.pan@intel.com>, Baolu
 Lu <baolu.lu@intel.com>, Kevin Tian <kevin.tian@intel.com>, Dan Williams
 <dan.j.williams@intel.com>
Subject: Re: [patch RFC 26/38] x86/xen: Wrap XEN MSI management into irqdomain
In-Reply-To: <8860c7bc-67ab-ce64-0340-1458d2483a39@suse.com>
References: <20200821002424.119492231@linutronix.de>
 <20200821002947.868727656@linutronix.de>
 <8860c7bc-67ab-ce64-0340-1458d2483a39@suse.com>
Date: Tue, 25 Aug 2020 09:57:44 +0200
Message-ID: <87r1rv5f9j.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 24 2020 at 08:21, J=C3=BCrgen Gro=C3=9F wrote:
> On 21.08.20 02:24, Thomas Gleixner wrote:
>
> Looking into https://www.kernel.org/doc/Documentation/IRQ-domain.txt (is
> this still valid?)

It's halfways correct. Emphasis on halfways.

> I believe Xen should be able to use the "No Map" approach, as Xen only
> ever uses software IRQs (at least those are the only ones visible to
> any driver). The (virtualized) hardware interrupts are Xen events
> after all.
>
> So maybe morphing Xen into supporting irqdomains in a sane way isn't
> that complicated. Maybe I'm missing the main complexities, though.

The wrapper domain I did is pretty much that, but with the extra
functionality required by hierarchical irq domains. So, yes it's
functionally correct, but it's only utilizing the alloc/free interface
and not any of the other mechanisms provided by irqdomains. The latter
should make the overall code simpler but that obviously needs some
thought.

Thanks,

        tglx




