Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC9A252ACC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 11:53:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAs7L-000590-As; Wed, 26 Aug 2020 09:53:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAs7K-00058t-Cb
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 09:53:18 +0000
X-Inumbo-ID: bb7a5783-0c4c-4a2c-af3f-739fe2ab1659
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb7a5783-0c4c-4a2c-af3f-739fe2ab1659;
 Wed, 26 Aug 2020 09:53:17 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598435595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mv4TqayOvYT1PZy4IB6XdyAxCqLJFuyrG/iBXdVvDGo=;
 b=gry5Gqjf5XbHVcJKaDXMPK4boPx5u/IEBob5D9Wn36xeFWifKRFQGrLYl80/EuQiMfzysE
 R0d4KWtrjVjHsKfDbzzjWDT5squtWA8CAJmXu6ssTTvFAl1Dp0Qb/5Gseu91lYmL0/YUjO
 NbsGg1x1qsfcwMmq40s6f8QzME/wE8mMh0jkO28671y+OSXzdMJAa+d/pRnJ+IIBJUer6F
 myfzP6CTQbmP/AgP0sGex0XapaKloSSKztkVFL6Agugb80R0gctiC6HeZ9PqzrabjLNIkQ
 pAIkMvt8UaWwzx1EMmCW7rVmlO3SHuNH8U5WRqRwrLaG8IAQqyASWZnve1tyYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598435595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mv4TqayOvYT1PZy4IB6XdyAxCqLJFuyrG/iBXdVvDGo=;
 b=T18EHlogGsekmXEOkS3bdJRDQU5OgZArZ4psx/80SWGB5Jkvh72YqFLOhYbYkZrSz/1STi
 ppR6UR793IwPtlAg==
To: Boqun Feng <boqun.feng@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, Wei Liu
 <wei.liu@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Stephen
 Hemminger <sthemmin@microsoft.com>, Joerg Roedel <joro@8bytes.org>,
 linux-hyperv@vger.kernel.org, iommu@lists.linux-foundation.org, Haiyang
 Zhang <haiyangz@microsoft.com>, Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>, Jason Gunthorpe
 <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>, Jacob Pan <jacob.jun.pan@intel.com>, Baolu
 Lu <baolu.lu@intel.com>, Kevin Tian <kevin.tian@intel.com>, Dan Williams
 <dan.j.williams@intel.com>
Subject: Re: [patch RFC 10/38] x86/ioapic: Consolidate IOAPIC allocation
In-Reply-To: <20200826084019.GA6174@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
References: <20200821002424.119492231@linutronix.de>
 <20200821002946.297823391@linutronix.de>
 <20200826084019.GA6174@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
Date: Wed, 26 Aug 2020 11:53:15 +0200
Message-ID: <871rjtwx6c.fsf@nanos.tec.linutronix.de>
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

On Wed, Aug 26 2020 at 16:40, Boqun Feng wrote:
> I hit a compiler error while I was trying to compile this patchset:
>
> arch/x86/kernel/devicetree.c: In function =E2=80=98dt_irqdomain_alloc=E2=
=80=99:
> arch/x86/kernel/devicetree.c:232:6: error: =E2=80=98struct irq_alloc_info=
=E2=80=99 has no member named =E2=80=98ioapic_id=E2=80=99; did you mean =E2=
=80=98ioapic=E2=80=99?
>   232 |  tmp.ioapic_id =3D mpc_ioapic_id(mp_irqdomain_ioapic_idx(domain));

Yeah, noticed myself already and 0day complained as well :)


