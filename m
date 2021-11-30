Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FD0464113
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 23:11:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235562.408628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msBKs-0000ie-9r; Tue, 30 Nov 2021 22:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235562.408628; Tue, 30 Nov 2021 22:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msBKs-0000g8-6c; Tue, 30 Nov 2021 22:10:50 +0000
Received: by outflank-mailman (input) for mailman id 235562;
 Tue, 30 Nov 2021 22:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=47l3=QR=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1msBKq-0000fy-40
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 22:10:48 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e4f9b94-522a-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 23:10:46 +0100 (CET)
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
X-Inumbo-ID: 5e4f9b94-522a-11ec-976b-d102b41d0961
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638310245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iQwNm3evMDmCqqNj6SOBSL2raZeNEDMRyVYLWo7plsQ=;
	b=cfCUOIaPomiZCO9d79k8QaTA54iAEZbQY4lmYzVXbCZ99fBBPE+xqpOo1m4nSfa3KPq6+6
	pI8jqClQqAQ6e9xEzGMdMDMlM7PO3wO+IzFhUB7wl4w2H81v2euyyU8OpSzUxgKY+0HqOn
	tbRxYHYo0OtQnM7fMd/Q2RflLcOK0WEbJRcLaARC9aG5kGkie13cZuSuCFIva1m+TA616i
	dV35DJLlXGyNBE5vTnPj0hgLjo4pBUrYZ1WEUXNY8Y4DNEBT5I7kTI7Vt9Tc5Lg2J+Di+B
	X84UlqMbc2Q4lC6o9mfXgbNv2vVK1HCIjDj9nJ/ptp3y+rYMnW5ZpEnm9xcPOg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638310245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iQwNm3evMDmCqqNj6SOBSL2raZeNEDMRyVYLWo7plsQ=;
	b=OS4mhIe7yFZLurVEyelXc9LbdOQ2hxFAIJTEo5kZyIy2QO7wrWZZMF3x6KmDym+n1S953w
	D2cPy3zCOhdCl9Bg==
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
In-Reply-To: <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.382273262@linutronix.de>
 <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org> <87tufud4m3.ffs@tglx>
 <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org>
Date: Tue, 30 Nov 2021 23:10:45 +0100
Message-ID: <87czmhb8gq.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30 2021 at 22:48, C=C3=A9dric Le Goater wrote:
> On 11/29/21 22:38, Thomas Gleixner wrote:
>> On Mon, Nov 29 2021 at 08:33, C=C3=A9dric Le Goater wrote:
>> thanks for having a look. I fixed up this and other fallout and pushed o=
ut an
>> updated series (all 4 parts) to:
>>=20
>>          git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel msi
>
> pSeries fails to allocate MSIs starting with this patch :
>
>   [PATCH 049/101] powerpc/pseries/msi: Let core code check for contiguous=
 ...
>
> I will dig in later on.

Let me stare at the core function..

