Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4847A922
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 12:56:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249591.430019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzHGp-0008Sq-33; Mon, 20 Dec 2021 11:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249591.430019; Mon, 20 Dec 2021 11:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzHGp-0008Q2-06; Mon, 20 Dec 2021 11:55:59 +0000
Received: by outflank-mailman (input) for mailman id 249591;
 Mon, 20 Dec 2021 11:55:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=efIU=RF=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mzHGn-0008Pv-0b
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 11:55:57 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8674213-618b-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 12:55:55 +0100 (CET)
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
X-Inumbo-ID: c8674213-618b-11ec-9e60-abaf8a552007
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1640001352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/CUTvkF0ZJD/0bUX2KphRLF8+ED9CK1uoT06irTMlA8=;
	b=HSeZ4MSHoOtA7+F6FETI6mp8k3+faOYIGAz2lfvwDy1sSASh6hTd2VQBM/xtD9dWQ6/+it
	Xx1QiktSyrVJW+s/MoE14UBVxgCvvz4QKIShLntOLlYBJxOVA077qH2vgT/zKoawye+Uqx
	snVV6hWDoQFRr82vrxuTiQA6fWGNWW8AQwrmHtXAqARcz5dCEF253M2O/8L7qxll49Y14E
	5fSXcstjpAFKPqGx7Ea82OtzbwbxPCD/3HPgDpfoxqEWUh14UdrFA6upqctLwnFjwYbD3a
	oi0s+ejfwagnJisgRBLJVVnUWCRjx+V6vSjMsZE6J9vLkzoXsCRI261DIG6qXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1640001352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/CUTvkF0ZJD/0bUX2KphRLF8+ED9CK1uoT06irTMlA8=;
	b=xrSZ1J5EcwueXFBw2+PxkXfD7FQuFpsVSXWU/APxdJHshmEM2RfAp9OAgcYlk78X64Avva
	QQ/LsT2krF+p+kDg==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Nathan Chancellor
 <nathan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, Ashok Raj
 <ashok.raj@intel.com>, linux-pci@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Arnd Bergmann <arnd@arndb.de>, Michael
 Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas
 <bhelgaas@google.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor
 <laurentiu.tudor@nxp.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg
 Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org, Jassi Brar
 <jassisinghbrar@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
In-Reply-To: <ee5db32f-c21e-287f-2a19-94c1ba6e8217@kaod.org>
References: <20211210221642.869015045@linutronix.de>
 <20211210221814.900929381@linutronix.de>
 <Yb0PaCyo/6z3XOlf@archlinux-ax161> <87v8zm9pmd.ffs@tglx>
 <ee5db32f-c21e-287f-2a19-94c1ba6e8217@kaod.org>
Date: Mon, 20 Dec 2021 12:55:51 +0100
Message-ID: <87pmpra3so.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 18 2021 at 21:25, C=C3=A9dric Le Goater wrote:

> On 12/18/21 11:25, Thomas Gleixner wrote:
>> On Fri, Dec 17 2021 at 15:30, Nathan Chancellor wrote:
>>> On Fri, Dec 10, 2021 at 11:19:26PM +0100, Thomas Gleixner wrote:
>>> I just bisected a boot failure on my AMD test desktop to this patch as
>>> commit f48235900182 ("PCI/MSI: Simplify pci_irq_get_affinity()") in
>>> -next. It looks like there is a problem with the NVMe drive after this
>>> change according to the logs. Given that the hard drive is not getting
>>> mounted for journald to write logs to, I am not really sure how to get
>>> them from the machine so I have at least taken a picture of what I see
>>> on my screen; open to ideas on that front!
>>=20
>> Bah. Fix below.
>
> That's a fix for the issue I was seeing on pseries with NVMe.
>
> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>

I had a faint memory that I've seen that issue before, but couldn't find
the mail in those massive threads.

Thanks for confirming!

       tglx

