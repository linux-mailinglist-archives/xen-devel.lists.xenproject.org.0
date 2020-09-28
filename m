Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B41D27AB91
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 12:12:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMq8H-0000A8-Hx; Mon, 28 Sep 2020 10:11:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iXz5=DF=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kMq8G-0000A1-9q
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 10:11:44 +0000
X-Inumbo-ID: 523afc86-b80d-4d68-b7f9-e8b903ec038b
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 523afc86-b80d-4d68-b7f9-e8b903ec038b;
 Mon, 28 Sep 2020 10:11:42 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601287900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LEbaJHkdEDSvABDEX0Mpwgs63YbqlMHeZ5/FcFgS7c=;
 b=WscWB2qjowVUKNzXJ7iKsyolZUkjDBztcYFbIgHrMUrtAEvquCam4/K52jcCtRQM+yKytr
 URMI6z640lbxw7hkIOVx1TRLHMdhaWzx98lhVnLFqthWanJFHVHxlo2eOWubHBSTBu9GDF
 7G67OuYSeZNyWEttoblh+kzL4D7QpchbFTWBx+ikU8exuLt8q5pjxfqcBdHoB6zPbCD8mH
 lZQfvtFRw5BX5n7PSkSM/ugl/cb4XGqprClPnO9RlJUYEx0yP1D0OFHRQNoIV4NB6Tbt2s
 hzKesgmvohZEey59MwUSx2qdsQEH+kkd6efSVXhIbahzs/eEUDUMLSXdq82ySg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601287900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LEbaJHkdEDSvABDEX0Mpwgs63YbqlMHeZ5/FcFgS7c=;
 b=gKFUKgJag7QuixgLnPA+ShsJ5WL+xoFovrXQai1julVEgAI8XcH7X6h36NY9HKTW9eWOPq
 ZWPyJFpE9hRbkzAA==
To: Vasily Gorbik <gor@linux.ibm.com>, Qian Cai <cai@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-s390@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-next@vger.kernel.org, x86@kernel.org, Joerg Roedel
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
 <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>, Jason Gunthorpe
 <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>, Jacob Pan <jacob.jun.pan@intel.com>, Baolu
 Lu <baolu.lu@intel.com>, Kevin Tian <kevin.tian@intel.com>, Dan Williams
 <dan.j.williams@intel.com>
Subject: Re: [patch V2 34/46] PCI/MSI: Make arch_.*_msi_irq[s] fallbacks
 selectable
In-Reply-To: <your-ad-here.call-01601123933-ext-6476@work.hours>
References: <20200826111628.794979401@linutronix.de>
 <20200826112333.992429909@linutronix.de>
 <cdfd63305caa57785b0925dd24c0711ea02c8527.camel@redhat.com>
 <your-ad-here.call-01601123933-ext-6476@work.hours>
Date: Mon, 28 Sep 2020 12:11:40 +0200
Message-ID: <87eemmky77.fsf@nanos.tec.linutronix.de>
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

On Sat, Sep 26 2020 at 14:38, Vasily Gorbik wrote:
> On Fri, Sep 25, 2020 at 09:54:52AM -0400, Qian Cai wrote:
> Yes, as well as on mips and sparc which also don't FORCE_PCI.
> This seems to work for s390:
>
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index b0b7acf07eb8..41136fbe909b 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -192,3 +192,3 @@ config S390
>         select PCI_MSI                  if PCI
> -       select PCI_MSI_ARCH_FALLBACKS
> +       select PCI_MSI_ARCH_FALLBACKS   if PCI
>         select SET_FS

lemme fix that for all of them ...

