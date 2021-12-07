Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6658F46BBD7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 13:53:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241064.417889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muZyX-0006QX-A0; Tue, 07 Dec 2021 12:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241064.417889; Tue, 07 Dec 2021 12:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muZyX-0006NL-6Y; Tue, 07 Dec 2021 12:53:41 +0000
Received: by outflank-mailman (input) for mailman id 241064;
 Tue, 07 Dec 2021 12:53:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vuaW=QY=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muZyW-0006NF-88
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 12:53:40 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b26324a0-575c-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 13:53:39 +0100 (CET)
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
X-Inumbo-ID: b26324a0-575c-11ec-9d12-4777fae47e2b
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638881617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aNhnkzcLIHS9o6REcIVVTdi6HJHMTMekwoWhR5Os8KA=;
	b=fDdfjoBrqymOl2a+g4MXycXTFQvrRmQZeNf3rg3L6n1PiCtdWcCcmDaVpdvwx1WHZPu2/v
	fJ5y/fl9rqcMBqPDwA5dGahXUq/mN6Rr/ElGbNuccnYfY2zSKXTbzkZQodP7GLSEpFoYdh
	46+uktDwZ2vMiIgjrLAfY7tW6+YkhG+kEnyrqVcu/yhSumZnuVQZSPFDDqkewYdktBX2W1
	E5XHAvsHcg+oePKYbcgXP8R5bFs+hJf3t4yTvMtPo50NBwX80mLh/AIBUE7bofDK/aFu6H
	qtf+AY+yYI2U4AcWEXhnQ22yGPrAzddB3aN+8X6CX1qpB5O1+EGPIoTqDwRh5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638881617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aNhnkzcLIHS9o6REcIVVTdi6HJHMTMekwoWhR5Os8KA=;
	b=9LR8QBp7ApgLB6V6Z+0XA4lyUUgGXXJ03ul38aiaIn/PFJSbmKuGwWEzOcLJoDF8z5Se10
	uqB+RdhRp6Pw8iDA==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, Ashok
 Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>, Laurentiu
 Tudor <laurentiu.tudor@nxp.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org, Vinod Koul
 <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy
 <robin.murphy@arm.com>, Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V2 18/36] genirq/msi: Add msi_device_data::properties
In-Reply-To: <87ilw037km.ffs@tglx>
References: <20211206210307.625116253@linutronix.de>
 <20211206210438.634566968@linutronix.de>
 <6f06c9f0-1f8f-e467-b0fb-2f9985d5be0d@kaod.org> <87ilw037km.ffs@tglx>
Date: Tue, 07 Dec 2021 13:53:36 +0100
Message-ID: <87fsr437an.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07 2021 at 13:47, Thomas Gleixner wrote:
> On Tue, Dec 07 2021 at 10:04, C=C3=A9dric Le Goater wrote:
>>> +/**
>>> + * msi_device_set_properties - Set device specific MSI properties
>>> + * @dev:	Pointer to the device which is queried
>>> + * @prop:	Properties to set
>>> + */
>>> +void msi_device_set_properties(struct device *dev, unsigned long prop)
>>> +{
>>> +	if (WARN_ON_ONCE(!dev->msi.data))
>>> +		return ;
>>> +	dev->msi.data->properties =3D 0;
>> It would work better if the prop variable was used instead of 0.
>>
>> With that fixed,
>
> Indeed. Copy & pasta w/o brain usage ...

I've pushed out an incremental fix on top. Will be folded back.

     git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v2-pa=
rt-3-1

Thanks,

        tglx

