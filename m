Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D0F250AC0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 23:22:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAJu9-0003OM-AE; Mon, 24 Aug 2020 21:21:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4vr=CC=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAJu7-0003OH-8E
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 21:21:24 +0000
X-Inumbo-ID: 9ca7a625-eec3-43a6-b166-0bbee05331a5
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ca7a625-eec3-43a6-b166-0bbee05331a5;
 Mon, 24 Aug 2020 21:21:21 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598304080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6NJ+kPKGl5Nf3jE9xklx6hH03TKpnofr8g96HAw8Ck=;
 b=Pv4WTzw87H6NCx71gJqPiRampyZmRAAfWJrVk0KJysnfqzFan/ccSk8LSOb7qVVuPkbB8z
 tGoDrp+2ju8a/cTr5MMPgifcmaB8n9M75wctO+lZ606ZWdfd053SzbNlGzcK9jw30ur2mH
 TDbLQHXk1Dh9ueKmK3Go6nRfjv8zoHatFiZuH0z15JhWa7zd1dbxSJs0yBdpWRdSBTq9V2
 X9XEPWc+RvXUBns4bi7L9OdG3sThW5qDimMJb9E+VvYLGZjxixChT1oUzdf/dlLTqSoUaU
 EspLZ6f4CF2x6Rx5EjvdF4GfJ2iyzgouZQbm5KkIt6/C6cpdCkAuu4GovEYy3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598304080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6NJ+kPKGl5Nf3jE9xklx6hH03TKpnofr8g96HAw8Ck=;
 b=cN6eYBnyeUaRAodJ5n9Kq1Of1A3DDOOMFul6xvKSp6P4/ZL9J+JfpPUvxxWGcEA5BgckeU
 I2Edk8IuxDhtxSCg==
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org, Haiyang
 Zhang <haiyangz@microsoft.com>, Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Stephen Hemminger
 <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>, Dimitri
 Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@mellanox.com>, Dave
 Jiang <dave.jiang@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>, Jacob Pan <jacob.jun.pan@intel.com>, Baolu
 Lu <baolu.lu@intel.com>, Kevin Tian <kevin.tian@intel.com>, Dan Williams
 <dan.j.williams@intel.com>
Subject: Re: [patch RFC 24/38] x86/xen: Consolidate XEN-MSI init
In-Reply-To: <5caec213-8f56-9f12-34db-a29de8326f95@suse.com>
References: <20200821002424.119492231@linutronix.de>
 <20200821002947.667887608@linutronix.de>
 <5caec213-8f56-9f12-34db-a29de8326f95@suse.com>
Date: Mon, 24 Aug 2020 23:21:19 +0200
Message-ID: <87tuwr68q8.fsf@nanos.tec.linutronix.de>
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

On Mon, Aug 24 2020 at 06:59, J=C3=BCrgen Gro=C3=9F wrote:
> On 21.08.20 02:24, Thomas Gleixner wrote:
>> +static __init void xen_setup_pci_msi(void)
>> +{
>> +	if (xen_initial_domain()) {
>> +		x86_msi.setup_msi_irqs =3D xen_initdom_setup_msi_irqs;
>> +		x86_msi.teardown_msi_irqs =3D xen_teardown_msi_irqs;
>> +		x86_msi.restore_msi_irqs =3D xen_initdom_restore_msi_irqs;
>> +		pci_msi_ignore_mask =3D 1;
>
> This is wrong, as a PVH initial domain shouldn't do the pv settings.
>
> The "if (xen_initial_domain())" should be inside the pv case, like:
>
> if (xen_pv_domain()) {
> 	if (xen_initial_domain()) {
> 		...
> 	} else {
> 		...
> 	}
> } else if (xen_hvm_domain()) {
> 	...

I still think it does the right thing depending on the place it is
called from, but even if so, it's completely unreadable gunk. I'll fix
that proper.

Thanks,

        tglx

