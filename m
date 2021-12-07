Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6183146BA29
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 12:36:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240981.417790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYlc-0005VR-96; Tue, 07 Dec 2021 11:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240981.417790; Tue, 07 Dec 2021 11:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYlc-0005Sq-5a; Tue, 07 Dec 2021 11:36:16 +0000
Received: by outflank-mailman (input) for mailman id 240981;
 Tue, 07 Dec 2021 11:36:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xxIL=QY=ellerman.id.au=mpe@srs-se1.protection.inumbo.net>)
 id 1muYla-0005Sg-Br
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 11:36:14 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de24b362-5751-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 12:36:11 +0100 (CET)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7dXf3dSsz4xYy;
 Tue,  7 Dec 2021 22:36:02 +1100 (AEDT)
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
X-Inumbo-ID: de24b362-5751-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1638876964;
	bh=lTsXMkBa68SdK2mCmwfpSshAWpT0dRMMMq4RDsTmMUc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BMwzDWkPEIYhXynBVAirAw4gLvuuvW+w979j7Yqtpl/UPXPORphUfbt+jK+l0pabP
	 GTehyWDzuL/CjvtZ3vJKYoj5rsJPb1bnDWny7P2YlVPjCcML69cHmHBNG0AIDWe7Gz
	 7IRiJMIJ4Kb9b5hGDoNDnHaxCTClNUWIJdKvD1WISOHxae57UeEHW0ELnQ3BY1ByPF
	 1oPzO4gyeKDsiFe+zukx8HTbH7jtndcbjgt+u2Img9ev7FSfwZJM9PLRYWX7kshjFe
	 JBwE+rXxecauzokxEZQ57uU9ynC6VsB3Nd14q1sEiH2ivRH0Hx8EhFL3DwxqA8pymw
	 p3ZiZsIoOoIIQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Thomas Gleixner
 <tglx@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian
 <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org,
 Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Kalle Valo
 <kvalo@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org, Wei Liu
 <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org, Christian Borntraeger
 <borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 01/23] powerpc/4xx: Remove MSI support which never
 worked
In-Reply-To: <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
References: <20211206210147.872865823@linutronix.de>
 <20211206210223.872249537@linutronix.de>
 <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
Date: Tue, 07 Dec 2021 22:36:02 +1100
Message-ID: <87ilw0odel.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

C=C3=A9dric Le Goater <clg@kaod.org> writes:
> Hello Thomas,
>
> On 12/6/21 23:27, Thomas Gleixner wrote:
>> This code is broken since day one. ppc4xx_setup_msi_irqs() has the
>> following gems:
>>=20
>>   1) The handling of the result of msi_bitmap_alloc_hwirqs() is complete=
ly
>>      broken:
>>=20=20=20=20=20=20
>>      When the result is greater than or equal 0 (bitmap allocation
>>      successful) then the loop terminates and the function returns 0
>>      (success) despite not having installed an interrupt.
>>=20
>>      When the result is less than 0 (bitmap allocation fails), it prints=
 an
>>      error message and continues to "work" with that error code which wo=
uld
>>      eventually end up in the MSI message data.
>>=20
>>   2) On every invocation the file global pp4xx_msi::msi_virqs bitmap is
>>      allocated thereby leaking the previous one.
>>=20
>> IOW, this has never worked and for more than 10 years nobody cared. Remo=
ve
>> the gunk.
>>=20
>> Fixes: 3fb7933850fa ("powerpc/4xx: Adding PCIe MSI support")
>
> Shouldn't we remove all of it ? including the updates in the device trees
> and the Kconfig changes under :
>
> arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
> arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
> arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
> arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
> arch/powerpc/platforms/40x/Kconfig:	select PPC4xx_MSI

This patch should drop those selects I guess. Can you send an
incremental diff for Thomas to squash in?

Removing all the tendrils in various device tree files will probably
require some archaeology, and it should be perfectly safe to leave those
in the tree with the driver gone. So I think we can do that as a
subsequent patch, rather than in this series.

cheers

