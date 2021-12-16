Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7902B477A7F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 18:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248144.428001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxuTq-0006WN-Kn; Thu, 16 Dec 2021 17:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248144.428001; Thu, 16 Dec 2021 17:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxuTq-0006U9-HS; Thu, 16 Dec 2021 17:23:46 +0000
Received: by outflank-mailman (input) for mailman id 248144;
 Thu, 16 Dec 2021 17:23:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VBzi=RB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mxuTo-0006U3-Qx
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 17:23:44 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ead23690-5e94-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 18:23:43 +0100 (CET)
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
X-Inumbo-ID: ead23690-5e94-11ec-85d3-df6b77346a89
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639675422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ih3MOpW/yCW+x5F+uZuuVRHaDZ9exo66WfrPCFsrhAY=;
	b=OMVjennJ3dIFrwVfMs8MzDcb41Xr30oKty6fkqZ9/dg2KPX2j01Itd6kvCYu1225sOnYuo
	IeaHw/JoJkXrtGr3oWwJMzzEwGmbkJFG3vgu9mNytV1jkcv4dag6oBGHon+mbf9Ogyak6J
	JF0hQ4F7JA1yDzHNDLmTJM8en1l9nh0l4RtyKkhJNdGp1qF+PkIKoY49IEUHTkOsVif77X
	EDZmJYVvTSc9g7y9TRGoIHjKz9B63drgsnnIlXTKDk1IKqeYDrXtl+Qq6LpiQy1hqLdDie
	mG/yWvrQXdNGXa7j6B8oNi6M8Sbe5B02MnwHdqWu6fekNoxcotWWNW+EPmJPkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639675422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ih3MOpW/yCW+x5F+uZuuVRHaDZ9exo66WfrPCFsrhAY=;
	b=KLmanqyVLTn1a9p7GzpJVoRlRAGdDGqehRu/zZHojbSx8/zpp5uAkFxpqxeluTK3IDEpyQ
	hmWFXp91ZBiOKlBQ==
To: Nishanth Menon <nm@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, Ashok Raj
 <ashok.raj@intel.com>, linux-pci@vger.kernel.org, Cedric Le Goater
 <clg@kaod.org>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Arnd Bergmann <arnd@arndb.de>, Michael
 Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas
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
In-Reply-To: <20211216014527.5d3sqs2klrqjmm2k@lunacy>
References: <20211213182958.ytj4m6gsg35u77cv@detonator>
 <87fsqvttfv.ffs@tglx> <20211214162247.ocjm7ihg5oi7uiuv@slider>
 <87wnk7rvnz.ffs@tglx> <87tufbrudl.ffs@tglx> <87mtl3rli1.ffs@tglx>
 <20211214205626.lrnddha6bd6d6es5@possibly> <87h7basx36.ffs@tglx>
 <87zgp1rge4.ffs@tglx> <87wnk5rfkt.ffs@tglx>
 <20211216014527.5d3sqs2klrqjmm2k@lunacy>
Date: Thu, 16 Dec 2021 18:23:41 +0100
Message-ID: <87wnk4cvky.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

Nishanth,

On Wed, Dec 15 2021 at 19:45, Nishanth Menon wrote:
> On 17:35-20211215, Thomas Gleixner wrote:
> Thanks once again for your help. Hope we can roll in the fixes for
> part3.

Sure, it's only the one-liner for ti sci. Got it folded already.

Thanks for your help and testing!

       tglx

