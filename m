Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 187A6474D2D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 22:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247101.426113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxFDN-0007uR-VK; Tue, 14 Dec 2021 21:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247101.426113; Tue, 14 Dec 2021 21:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxFDN-0007sR-SA; Tue, 14 Dec 2021 21:20:01 +0000
Received: by outflank-mailman (input) for mailman id 247101;
 Tue, 14 Dec 2021 21:20:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iTjg=Q7=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mxFDN-0007sL-1h
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 21:20:01 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97e8ba15-5d23-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 22:19:59 +0100 (CET)
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
X-Inumbo-ID: 97e8ba15-5d23-11ec-85d3-df6b77346a89
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639516798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UY5SIbLiQJhNf3IcwLAaYT3af81CnBCUSA3qSWP4dj0=;
	b=EzQFCHRvraOq6euqkQn1B+tUeoQ1uw1bo4mwk9Q+vKSF8S8PO4nMGeLKZ/WNHEDZ5eJhpq
	mjggZFTuoIKEO/OrzzxxfitzasNIFFxeDKcRyrdk7DdmUaNmMFC1unLIMtUfaK38TWwXYn
	h2orgm5VCZyrGWnjQirGszYr8438eZQal4q/1iuBvD2zWg9nOeapYD6mAyJQRKxCWoQSAd
	enz2/bCSy9StMuvCnU8bbCEhKsc+iX17V3lbzwiD4WPpGEDgVUswHFbLH8z54QbwfbJl42
	iPxl/XpXV7+3L/A3q2mlzAY6VVHUHz35mnJZ8s3Ze10jfDmKSXRCDaOkhFkkdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639516798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UY5SIbLiQJhNf3IcwLAaYT3af81CnBCUSA3qSWP4dj0=;
	b=lDR2zL85oMI4BdOLKEJ1Arl/dti0X9kWdevk0BKKPLGWBqf9hwgLOpBluOuP1fE4iBCR8Y
	5fOFMFfQxW57zEAA==
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
In-Reply-To: <20211214205626.lrnddha6bd6d6es5@possibly>
References: <20211210221642.869015045@linutronix.de>
 <20211213182958.ytj4m6gsg35u77cv@detonator> <87fsqvttfv.ffs@tglx>
 <20211214162247.ocjm7ihg5oi7uiuv@slider> <87wnk7rvnz.ffs@tglx>
 <87tufbrudl.ffs@tglx> <87mtl3rli1.ffs@tglx>
 <20211214205626.lrnddha6bd6d6es5@possibly>
Date: Tue, 14 Dec 2021 22:19:57 +0100
Message-ID: <87h7basx36.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

Nishanth,

On Tue, Dec 14 2021 at 14:56, Nishanth Menon wrote:
> On 21:15-20211214, Thomas Gleixner wrote:
>> I think I managed to distangle this. Can you please give:
>> 
>>    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v4-part-2
>
>
> Umm.. I am not entirely sure what is going on.. but all kinds of weird
> corruption seems to occur with msi-v4-part-2 that does'nt seem to be
> present in v5.16-rc5. (I use NFS since ethernet in K3 platforms use
> inta/intr and dma that is impacted by this series).
>
> I will try and rebase your patches on v5.16-rc4 to be sure as well and
> report back later today once i get some time.
>
> [1] https://gist.github.com/nmenon/a66e022926c4c15313c45d44313d860c msi-v4-part-2
> [2] https://gist.github.com/nmenon/43085664d69ad846d596e76a06ed0656  v5.16-rc5

thanks for trying. I'll have a look again with brain awake tomorrow
morning.

Thanks,

        tglx

