Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C0A476046
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 19:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247529.426828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYia-0004eX-8P; Wed, 15 Dec 2021 18:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247529.426828; Wed, 15 Dec 2021 18:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYia-0004c1-5V; Wed, 15 Dec 2021 18:09:32 +0000
Received: by outflank-mailman (input) for mailman id 247529;
 Wed, 15 Dec 2021 18:09:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCU/=RA=ti.com=nm@srs-se1.protection.inumbo.net>)
 id 1mxYiY-0004bv-Ht
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 18:09:30 +0000
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 231c3e41-5dd2-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 19:09:27 +0100 (CET)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BFI88bl043534;
 Wed, 15 Dec 2021 12:08:08 -0600
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BFI88vw126883
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 15 Dec 2021 12:08:08 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 15
 Dec 2021 12:08:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 15 Dec 2021 12:08:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BFI88Qh046197;
 Wed, 15 Dec 2021 12:08:08 -0600
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
X-Inumbo-ID: 231c3e41-5dd2-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639591688;
	bh=BV8tFNoGMdbcKerU49fpsuE5DGB0rVHqEXWJvvEf+r4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZwqpP5UcZ1QWZv7AGAa1OzwwMFuadbbEsAGtDSo4cB6se3FtCbc4klSGqC2fqQUFh
	 7fdnNyE4equbUr+rG0skddv/tns2YRzZhL47ljnzM9aYF4NAG10iKPsf5O271LpT8+
	 rYNDI3ur5+NLeKk/dEPjErvLTfSPXspbsCCTNhzw=
Date: Wed, 15 Dec 2021 12:08:08 -0600
From: Nishanth Menon <nm@ti.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
        Marc Zygnier <maz@kernel.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
        Megha
 Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
        <linux-pci@vger.kernel.org>, Cedric Le Goater <clg@kaod.org>,
        Juergen Gross
	<jgross@suse.com>, <xen-devel@lists.xenproject.org>,
        Arnd Bergmann
	<arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin
 Herrenschmidt <benh@kernel.crashing.org>,
        <linuxppc-dev@lists.ozlabs.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas
	<bhelgaas@google.com>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor
	<laurentiu.tudor@nxp.com>,
        Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Vinod Koul
	<vkoul@kernel.org>,
        <dmaengine@vger.kernel.org>, Mark Rutland
	<mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, <iommu@lists.linux-foundation.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Sinan Kaya <okaya@kernel.org>, <linux-wireless@vger.kernel.org>,
        Johannes Berg <johannes.berg@intel.com>
Subject: Re: [patch V3 00/35] genirq/msi, PCI/MSI: Spring cleaning - Part 2
Message-ID: <20211215180808.dpdlkoheulsnrs65@balcony>
References: <20211213182958.ytj4m6gsg35u77cv@detonator>
 <87fsqvttfv.ffs@tglx>
 <20211214162247.ocjm7ihg5oi7uiuv@slider>
 <87wnk7rvnz.ffs@tglx>
 <87tufbrudl.ffs@tglx>
 <87mtl3rli1.ffs@tglx>
 <20211214205626.lrnddha6bd6d6es5@possibly>
 <87h7basx36.ffs@tglx>
 <87zgp1rge4.ffs@tglx>
 <87wnk5rfkt.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87wnk5rfkt.ffs@tglx>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 17:35-20211215, Thomas Gleixner wrote:
>    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v4.1-part-2
[...]

> That should cure the problem.

And it sure does. Thanks for looking closer and providing a fix.

https://gist.github.com/nmenon/9862a1c31b17fd6dfe0a30c54d396187
(msi-v4.1-part-2) looks clean

Also while I had detected pointer corruption in the previous v4
https://gist.github.com/nmenon/ce4d12f460db5cd511185c047d5d35d0

Running it again on v4.1 does indicate the fix is in place.
https://gist.github.com/nmenon/3231fbb0faa1b9c827b40d1ae6160626


please feel free to add:

Tested-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

