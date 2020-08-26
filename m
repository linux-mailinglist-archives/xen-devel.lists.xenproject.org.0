Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F4725340C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 17:54:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAxjp-0007NR-OT; Wed, 26 Aug 2020 15:53:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAxjo-0007NM-6F
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 15:53:24 +0000
X-Inumbo-ID: 6e127d50-1129-426e-b331-44aaba8ee08b
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e127d50-1129-426e-b331-44aaba8ee08b;
 Wed, 26 Aug 2020 15:53:22 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598457201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=goeJdvyvZirwLASPyTOx+y+LUKYx5a0JO0G5JsEt0Cs=;
 b=DAMVIkAqyy4AKY1e6W79Rih9wNEl9PD/FZjnhUNeIIoZ7l7kq/75TfVmu354vBX+/WVqTA
 0YjI/dmCcnmc3U2AuvKkvnJKdt48xoP5IxXuMm27KNP1xsFyVwIRtBfqkgnCIvQXzuV6vO
 yy0UO9WOuwsx5oUqk0Ah2/+CRbxmtC+gkgpofiIg04ycN8dSJq5uqkczQFlAcXU0kXJ5sV
 Vw/U5GyWJhrSz1COrbHuQ71RfkMBq07l75m5ZIuXl47zptJGJwDPvs+R6DQbg7r93KYqfV
 ccMOndh+4GHBiJK7goeyGUBc8gRKvX4CmWiSf1sVfIKxV3RYU7gc8uWD8gpBpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598457201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=goeJdvyvZirwLASPyTOx+y+LUKYx5a0JO0G5JsEt0Cs=;
 b=jmJX9jYrcb8PLSa2rxhC1AqHOM8H5y0zrmuUZbL4nNMTKGQ07p4qkJrjolnc5PiJECMKF1
 ku155QR6nYgU0uDQ==
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org, Haiyang
 Zhang <haiyangz@microsoft.com>, Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Stephen Hemminger
 <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>, Dimitri
 Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
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
Subject: Re: [patch V2 34/46] PCI/MSI: Make arch_.*_msi_irq[s] fallbacks
 selectable
In-Reply-To: <20200826112333.992429909@linutronix.de>
References: <20200826111628.794979401@linutronix.de>
 <20200826112333.992429909@linutronix.de>
Date: Wed, 26 Aug 2020 17:53:20 +0200
Message-ID: <87h7spv1xr.fsf@nanos.tec.linutronix.de>
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

On Wed, Aug 26 2020 at 13:17, Thomas Gleixner wrote:
> + * If CONFIG_PCI_MSI_ARCH_FALLBACKS is not selected they are replaced by
> + * stubs with warnings.
>   */
> +#ifdef CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS

Groan, I obviously failed to pull that back from the test box where I
fixed it. That wants to be:

+#ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS

Doing five things at once does not work well

