Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF4B46C4D6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 21:43:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241796.418291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhIF-00014P-Vd; Tue, 07 Dec 2021 20:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241796.418291; Tue, 07 Dec 2021 20:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhIF-00012P-SJ; Tue, 07 Dec 2021 20:42:31 +0000
Received: by outflank-mailman (input) for mailman id 241796;
 Tue, 07 Dec 2021 20:42:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vuaW=QY=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muhIE-00012J-E7
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 20:42:30 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e978664-579e-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 21:42:27 +0100 (CET)
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
X-Inumbo-ID: 2e978664-579e-11ec-a831-37629979565c
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638909743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8kdDUloupcZ7zsHm8ipSzMG1KhDz+bCCecRfNXSnpkg=;
	b=myOlC5dgE3khI7L8VZJuvb0AqNwW72GyeFELcD1PBbXUtZ68+3HHkLJ6B3AHqyMzsf2WT8
	+ujqWMGHpaY4rsmjld2a82Vj5AIv9LECzrGlZmnD/32El3mdYogpJBXD830FzxpM64lfFA
	4umcD+gxjhc1TVxDz7X7+HSKF/BzRb/G2QPcgdTOuekTL5TVuB7tk2FDJgZvBY12rIApXt
	6/cKg45LVQbCHkJ50Jh/VwMaNydeam+MMtnO87aLsvswM8Dg0b8u1s2wEbGXeG0S5d8b8M
	gpLncVriJOZxdr/S+hNQBS9u1GXShwEAVsplRx5hkczW+cMOAp/ZAeGaDzJRnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638909743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8kdDUloupcZ7zsHm8ipSzMG1KhDz+bCCecRfNXSnpkg=;
	b=0V4XVUsOsvnU+9Fv3Fb95pdvdCgo/+dE0Mo+fVtsflMeNE/VXjrD4Tr1l/AitQqcrCl0wJ
	KhJ9aDeINWrmG3AA==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Michael Ellerman
 <mpe@ellerman.id.au>,
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
In-Reply-To: <27f22e0e-8f84-a6d7-704b-d9eddc642d74@kaod.org>
References: <20211206210147.872865823@linutronix.de>
 <20211206210223.872249537@linutronix.de>
 <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
 <87ilw0odel.fsf@mpe.ellerman.id.au>
 <27f22e0e-8f84-a6d7-704b-d9eddc642d74@kaod.org>
Date: Tue, 07 Dec 2021 21:42:22 +0100
Message-ID: <8735n42lld.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Cedric,

On Tue, Dec 07 2021 at 16:50, C=C3=A9dric Le Goater wrote:
> On 12/7/21 12:36, Michael Ellerman wrote:
>>=20
>> This patch should drop those selects I guess. Can you send an
>> incremental diff for Thomas to squash in?
>
> Sure.
>
>> Removing all the tendrils in various device tree files will probably
>> require some archaeology, and it should be perfectly safe to leave those
>> in the tree with the driver gone. So I think we can do that as a
>> subsequent patch, rather than in this series.
>
> Here are the changes. Compiled tested with ppc40x and ppc44x defconfigs.

< Lots of patch skipped />
> @@ -141,7 +138,6 @@ config REDWOOD
>   	select FORCE_PCI
>   	select PPC4xx_PCI_EXPRESS
>   	select PCI_MSI
> -	select PPC4xx_MSI
>   	help
>   	  This option enables support for the AMCC PPC460SX Redwood board.

While that is incremental it certainly is worth a patch on it's
own. Could you add a proper changelog and an SOB please?

Thanks,

        tglx

