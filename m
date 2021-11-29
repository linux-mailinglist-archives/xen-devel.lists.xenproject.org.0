Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CE7462379
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 22:40:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234840.407521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mroML-0002vr-H0; Mon, 29 Nov 2021 21:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234840.407521; Mon, 29 Nov 2021 21:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mroML-0002tQ-E3; Mon, 29 Nov 2021 21:38:49 +0000
Received: by outflank-mailman (input) for mailman id 234840;
 Mon, 29 Nov 2021 21:38:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pv+C=QQ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mroMJ-0002tK-Mq
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 21:38:48 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb0a0fca-515c-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 22:38:46 +0100 (CET)
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
X-Inumbo-ID: bb0a0fca-515c-11ec-b941-1df2895da90e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638221925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTsTXZmVNEttdKActcp/MQ79Sqm2VlTHeENYuk8KrhE=;
	b=ILyfVKGE5UZvmRThsq5XEtpixIVIivrUSBAXm+humQHTDLzWIKEX4H8+4OD+aeIfZ4DV92
	9T+62U6FIpWYIpoyRwMMumiAWctcb/I9yr1yNfsu8sRnZChwXIMAcSaHOA+Rqc6gRrobwk
	VD1hPi2gr2//sF+SQuC4nahdGSaDafaDW7sBy0aS8tR1r1meQJeCOwOOGRC5aIHAc9Xvk4
	/FJzDlJKlE89PcGuwq4SuMSriWZnI0H29jLtYIq6CXQ6TOUli2NIXrPAh97GMsBqbXW+Qh
	eBXpIwFI96/i9Jnc137e9kO89zceLA086wH/JPWoxTfUn5qn3H8Cfws4QVJy/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638221925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTsTXZmVNEttdKActcp/MQ79Sqm2VlTHeENYuk8KrhE=;
	b=IFrPJPgHlzA5jXpCGMUgcnutoSn2o/emSpKWK3dUIvafMv+/N8+lm8fxoSszjkihxr/hYU
	KzMXez+vjEq3dIDw==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, LKML
 <linux-kernel@vger.kernel.org>
Cc: linux-hyperv@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>, Ashok Raj
 <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Heiko
 Carstens <hca@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Megha Dey <megha.dey@intel.com>, Juergen
 Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [patch 05/22] genirq/msi: Fixup includes
In-Reply-To: <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.382273262@linutronix.de>
 <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org>
Date: Mon, 29 Nov 2021 22:38:44 +0100
Message-ID: <87tufud4m3.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Cedric,

On Mon, Nov 29 2021 at 08:33, C=C3=A9dric Le Goater wrote:
> On 11/27/21 02:18, Thomas Gleixner wrote:
>> Remove the kobject.h include from msi.h as it's not required and add a
>> sysfs.h include to the core code instead.
>>=20
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
>
> This patch breaks compile on powerpc :
>
>    CC      arch/powerpc/kernel/msi.o
> In file included from ../arch/powerpc/kernel/msi.c:7:
> ../include/linux/msi.h:410:65: error: =E2=80=98struct cpumask=E2=80=99 de=
clared inside parameter list will not be visible outside of this definition=
 or declaration [-Werror]
>    410 | int msi_domain_set_affinity(struct irq_data *data, const struct =
cpumask *mask,
>        |                                                                 =
^~~~~~~
> cc1: all warnings being treated as errors
>
> Below is fix you can merge in patch 5.

thanks for having a look. I fixed up this and other fallout and pushed out =
an
updated series (all 4 parts) to:

        git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel msi

Thanks,

        tglx

