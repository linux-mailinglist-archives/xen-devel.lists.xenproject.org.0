Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 771584641AE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 23:42:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235569.408638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msBoa-0004DH-NC; Tue, 30 Nov 2021 22:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235569.408638; Tue, 30 Nov 2021 22:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msBoa-0004Ac-Jg; Tue, 30 Nov 2021 22:41:32 +0000
Received: by outflank-mailman (input) for mailman id 235569;
 Tue, 30 Nov 2021 22:41:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=47l3=QR=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1msBoZ-0004AW-Ue
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 22:41:31 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a91ef394-522e-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 23:41:30 +0100 (CET)
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
X-Inumbo-ID: a91ef394-522e-11ec-976b-d102b41d0961
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638312089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1bOw8HEe7jHxyt1BTzbWx6wvk9iJpbF5Gn0Kg7y1Blo=;
	b=2IrmNv3Iea3b/0P87xEGqZAZmwL1onSUMGqd0zxtDIRJLTynmNSC7uxIH8L/l5dtLj/5OD
	JagFWx3aJMiS1LFIeYftEfo0Ur2kNjTtrOTkBnBmsBzvAxM9ucbFfqPVN5bViblbdfTyHh
	DmsunGG30VGceQJj3KLRF3KIyBTUwjdi6+cIFEZFOGwVLxR6/Qv+GDEs3kZsbO3Sb5vEY4
	CGDmi02z+2/4fP0CRSLAGmUXhnn/6DLG04oqIJtIelaVlS8RIp1r9e2Sxk09e7hCcOFzEs
	b9sVLSs/CWxPIfpw834x9ILDVWh3TWdsOj5JuMEeZ6q+sN/NVCvFkfOxPIzp8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638312089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1bOw8HEe7jHxyt1BTzbWx6wvk9iJpbF5Gn0Kg7y1Blo=;
	b=wP+0RlPVEZMaKpggmpseYFDjn/awmzpDeY9BMit0WIgaUAvSVTefpWgNK6fro3P2SJv3Ar
	0+sa+FEk57SExTAA==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, LKML
 <linux-kernel@vger.kernel.org>
Cc: linux-hyperv@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>, Ashok Raj
 <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Heiko
 Carstens <hca@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Megha Dey <megha.dey@intel.com>, Juergen Gross <jgross@suse.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [patch 05/22] genirq/msi: Fixup includes
In-Reply-To: <87czmhb8gq.ffs@tglx>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.382273262@linutronix.de>
 <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org> <87tufud4m3.ffs@tglx>
 <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org> <87czmhb8gq.ffs@tglx>
Date: Tue, 30 Nov 2021 23:41:28 +0100
Message-ID: <875ys9b71j.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30 2021 at 23:10, Thomas Gleixner wrote:

> On Tue, Nov 30 2021 at 22:48, C=C3=A9dric Le Goater wrote:
>> On 11/29/21 22:38, Thomas Gleixner wrote:
>>> On Mon, Nov 29 2021 at 08:33, C=C3=A9dric Le Goater wrote:
>>> thanks for having a look. I fixed up this and other fallout and pushed =
out an
>>> updated series (all 4 parts) to:
>>>=20
>>>          git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel msi
>>
>> pSeries fails to allocate MSIs starting with this patch :
>>
>>   [PATCH 049/101] powerpc/pseries/msi: Let core code check for contiguou=
s ...
>>
>> I will dig in later on.
>
> Let me stare at the core function..

It's not the core function. It's the patch above and I'm a moron.

--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -359,9 +359,6 @@ static int rtas_prepare_msi_irqs(struct
 	if (quota && quota < nvec)
 		return quota;
=20
-	if (type =3D=3D PCI_CAP_ID_MSIX)
-		return -EINVAL;
-
 	/*
 	 * Firmware currently refuse any non power of two allocation
 	 * so we round up if the quota will allow it.

