Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EBF475D37
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 17:18:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247462.426713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxWyu-0004Ot-Uv; Wed, 15 Dec 2021 16:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247462.426713; Wed, 15 Dec 2021 16:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxWyu-0004N2-RW; Wed, 15 Dec 2021 16:18:16 +0000
Received: by outflank-mailman (input) for mailman id 247462;
 Wed, 15 Dec 2021 16:18:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EjzN=RA=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mxWyt-0004Mu-4a
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 16:18:15 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a4eddcf-5dc2-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 17:18:13 +0100 (CET)
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
X-Inumbo-ID: 9a4eddcf-5dc2-11ec-85d3-df6b77346a89
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639585092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rJVDTOuDDTSDYTKGknJ4P2/i6V8wI5GXY78I0tAdccE=;
	b=Duk9xXYJRbMmemMIOmEyunjHOHUpSQ52ka5BJz2QJs2S0qPRIK58y+S3Lko1ZlEjQE4BX8
	ZU028VnNCSYc9l0XY8uhQma7yD4UrOymDjltXVY4rv8h7zgNlwduFdqwAcAFDON1RX3zi2
	mmVT0W/J+Dnpx9gU69YThbgcMVdIGDwktBYeU8w6xHDNNQ1cfVXfi7UJUdu8cZFpZ4djvW
	sNfj11z/AlBcs/iBjLIkOdp3fZ5Jn2Frw6ku5unRVchcjEBwGq+5TST3aSGvBDLz4W/cCs
	+a6ygbS16QffcOcKDJAfM3Xj6o1sZeY6YbYJAVGM9q/cH3hPizriXmurSZqczA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639585092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rJVDTOuDDTSDYTKGknJ4P2/i6V8wI5GXY78I0tAdccE=;
	b=VaI3p2v0+/sjSWEzfZRRZs5oPT3dZJd36h/55liytya3KHC+MGusZdBUZeky4AheCysSDm
	D0SIY5tvwLxpauBg==
To: Nishanth Menon <nm@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Megha
 Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org, Arnd Bergmann
 <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor
 <laurentiu.tudor@nxp.com>, Tero Kristo <kristo@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, Mark Rutland
 <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 linux-wireless@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>
Subject: Re: [patch V3 00/35] genirq/msi, PCI/MSI: Spring cleaning - Part 2
In-Reply-To: <87h7basx36.ffs@tglx>
References: <20211210221642.869015045@linutronix.de>
 <20211213182958.ytj4m6gsg35u77cv@detonator> <87fsqvttfv.ffs@tglx>
 <20211214162247.ocjm7ihg5oi7uiuv@slider> <87wnk7rvnz.ffs@tglx>
 <87tufbrudl.ffs@tglx> <87mtl3rli1.ffs@tglx>
 <20211214205626.lrnddha6bd6d6es5@possibly> <87h7basx36.ffs@tglx>
Date: Wed, 15 Dec 2021 17:18:11 +0100
Message-ID: <87zgp1rge4.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Dec 14 2021 at 22:19, Thomas Gleixner wrote:
> On Tue, Dec 14 2021 at 14:56, Nishanth Menon wrote:
>
> thanks for trying. I'll have a look again with brain awake tomorrow
> morning.

Morning was busy with other things, but I found what my sleepy brain
managed to do wrong yesterday evening.

Let me reintegrate the pile and I'll send you an update.

Thanks,

        tglx

