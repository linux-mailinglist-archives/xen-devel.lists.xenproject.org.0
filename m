Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF2F474CE4
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 21:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247079.426074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxErr-0003oH-9R; Tue, 14 Dec 2021 20:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247079.426074; Tue, 14 Dec 2021 20:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxErr-0003mU-5n; Tue, 14 Dec 2021 20:57:47 +0000
Received: by outflank-mailman (input) for mailman id 247079;
 Tue, 14 Dec 2021 20:57:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=twTw=Q7=ti.com=nm@srs-se1.protection.inumbo.net>)
 id 1mxErq-0003mO-0N
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 20:57:46 +0000
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ae2223a-5d20-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 21:57:43 +0100 (CET)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BEKuQ2G087867;
 Tue, 14 Dec 2021 14:56:26 -0600
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BEKuQZP071677
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Dec 2021 14:56:26 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 14
 Dec 2021 14:56:26 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 14 Dec 2021 14:56:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BEKuQKW080208;
 Tue, 14 Dec 2021 14:56:26 -0600
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
X-Inumbo-ID: 7ae2223a-5d20-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639515386;
	bh=j3osEyGU+RxWIqSwbtxX3t4fWrHk6cyOWUyU3Kklrls=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ro9Zy1BiNWwoHciKsimW9l8VopF6tYlVp/6zMhM4RqRr5OMdDNHhzpvvxTClpNzB8
	 dPzQuK5sKOVV9r4w2zlsPGBt+0LP2kgt2QlGyvAvguubR7lVNMCWrPyux0hcVHFUr4
	 7zdyFM5y9LIDHeI/2x8RTh77XgWACTwR6L5QvGfs=
Date: Tue, 14 Dec 2021 14:56:26 -0600
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
Message-ID: <20211214205626.lrnddha6bd6d6es5@possibly>
References: <20211210221642.869015045@linutronix.de>
 <20211213182958.ytj4m6gsg35u77cv@detonator>
 <87fsqvttfv.ffs@tglx>
 <20211214162247.ocjm7ihg5oi7uiuv@slider>
 <87wnk7rvnz.ffs@tglx>
 <87tufbrudl.ffs@tglx>
 <87mtl3rli1.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87mtl3rli1.ffs@tglx>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 21:15-20211214, Thomas Gleixner wrote:
> Nishanth,
> 
> On Tue, Dec 14 2021 at 18:03, Thomas Gleixner wrote:
> >     msi_device_data_release()
> >     ...
> >     pcim_release()
> >        pci_disable_msi[x]()
> >
> > Groan....
> 
> I think I managed to distangle this. Can you please give:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v4-part-2


Umm.. I am not entirely sure what is going on.. but all kinds of weird
corruption seems to occur with msi-v4-part-2 that does'nt seem to be
present in v5.16-rc5. (I use NFS since ethernet in K3 platforms use
inta/intr and dma that is impacted by this series).

I will try and rebase your patches on v5.16-rc4 to be sure as well and
report back later today once i get some time.

[1] https://gist.github.com/nmenon/a66e022926c4c15313c45d44313d860c msi-v4-part-2
[2] https://gist.github.com/nmenon/43085664d69ad846d596e76a06ed0656  v5.16-rc5
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

