Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A90475DA0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 17:36:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247467.426725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxXFu-0006z7-Fk; Wed, 15 Dec 2021 16:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247467.426725; Wed, 15 Dec 2021 16:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxXFu-0006wh-Bw; Wed, 15 Dec 2021 16:35:50 +0000
Received: by outflank-mailman (input) for mailman id 247467;
 Wed, 15 Dec 2021 16:35:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EjzN=RA=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mxXFt-0006wb-4j
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 16:35:49 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e69a80f-5dc5-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 17:35:47 +0100 (CET)
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
X-Inumbo-ID: 0e69a80f-5dc5-11ec-9e60-abaf8a552007
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639586146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3UB4Bw8MahD5M8h/NI3Qg8AnbGIqaExPOcnRrzmSiao=;
	b=UJE/DKAABkBqFfjPbQnvYAH3rAoH/vlj0D3tBq02glY+Xwhi8IpuF/pdE8zOIh+LNq59Nl
	kIqPjL89RcIzLEag1h7k2fjb+cwOgjLe2MPvqWGyX6pPIlfV1AnbJNO0RuBaUEb7/o0lvf
	q7lAhQWh+jCRH3tIOsFsqmXut2p3+pY+woMjHpqHODXs3CqrcekUWtGDQ70j670MFnLBTT
	aQ4wHJwfbR6HaCSKuK7oh9/3WwrmyLBIAATt4Nc3Q80k12NK8vG02zW6aIuT4FiJH5XBgo
	uSp+QB7y3cnGolmhLgdyTIlgvw5ujoxSylCKtVjDQrixkhMxYakcLekWYL3jCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639586146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3UB4Bw8MahD5M8h/NI3Qg8AnbGIqaExPOcnRrzmSiao=;
	b=FmacxqQdf9S6/zcHrLZoWNqKtU3gTCf8SLlCTPXPqPhR+QBO0MStt+qlts1rWvFXaKykO/
	d3arXts9WnCbrmDA==
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
In-Reply-To: <87zgp1rge4.ffs@tglx>
References: <20211210221642.869015045@linutronix.de>
 <20211213182958.ytj4m6gsg35u77cv@detonator> <87fsqvttfv.ffs@tglx>
 <20211214162247.ocjm7ihg5oi7uiuv@slider> <87wnk7rvnz.ffs@tglx>
 <87tufbrudl.ffs@tglx> <87mtl3rli1.ffs@tglx>
 <20211214205626.lrnddha6bd6d6es5@possibly> <87h7basx36.ffs@tglx>
 <87zgp1rge4.ffs@tglx>
Date: Wed, 15 Dec 2021 17:35:46 +0100
Message-ID: <87wnk5rfkt.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Dec 15 2021 at 17:18, Thomas Gleixner wrote:

> On Tue, Dec 14 2021 at 22:19, Thomas Gleixner wrote:
>> On Tue, Dec 14 2021 at 14:56, Nishanth Menon wrote:
>>
>> thanks for trying. I'll have a look again with brain awake tomorrow
>> morning.
>
> Morning was busy with other things, but I found what my sleepy brain
> managed to do wrong yesterday evening.
>
> Let me reintegrate the pile and I'll send you an update.

   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v4.1-part-2
   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v4.2-part-3

That should cure the problem.


