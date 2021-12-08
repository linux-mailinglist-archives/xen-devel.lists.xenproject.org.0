Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DC246DD5B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 21:57:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242613.419589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv3zj-0003gC-Ax; Wed, 08 Dec 2021 20:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242613.419589; Wed, 08 Dec 2021 20:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv3zj-0003cl-7g; Wed, 08 Dec 2021 20:56:55 +0000
Received: by outflank-mailman (input) for mailman id 242613;
 Wed, 08 Dec 2021 20:56:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rXGX=QZ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mv3zi-0003TN-9i
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 20:56:54 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e89df8d-5869-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 21:56:52 +0100 (CET)
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
X-Inumbo-ID: 5e89df8d-5869-11ec-a831-37629979565c
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638997011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RI9goYiyaxxlyowVIy50GRXpRhCNUYZrM4r3seD1bKI=;
	b=NIPhL0sgn8M0aJUIi890pmZGlk891yoUSSDMnC4hnbyawxG2Kyh7G1sHH/xsmtSWUM8FfZ
	FyiBCPJVbWpXpFfMUl77mb1l8QqDIF5HigALgdn/RYqTMPCpOHMr0KIFCokDN7aLnrEdks
	8rrnfZKCxcaetGnTQyHUg4mAfEc2N1sxXiIWn5IbWqnhikYmOYt6fknKqXzV7CdqL4P4H4
	8ZS0DFKNdnSGea2HezKm7Hkc6llGKcBl9S+VI9FjnibvCSYHAcSlNTnETtfGbCxdf3f6N4
	HjxoAKj0UnKj8JjZlpBFr0/NMCZQnVLvInv7aT9TCLkwNt6S0nNqOl/aBjfedw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638997011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RI9goYiyaxxlyowVIy50GRXpRhCNUYZrM4r3seD1bKI=;
	b=KF19qqsUtSG+rWG9NpEYyzGIEvbq/ti9eoiMayWfd1iK3FYz9roP5HeWY227THj1hSYyZu
	bO4E+0TC1Z5Br/AA==
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org,
 Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Kalle Valo
 <kvalo@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org, Wei Liu
 <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org, Christian Borntraeger
 <borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 20/23] PCI/MSI: Move msi_lock to struct pci_dev
In-Reply-To: <20211208152925.GU6385@nvidia.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.925241961@linutronix.de>
 <20211208152925.GU6385@nvidia.com>
Date: Wed, 08 Dec 2021 21:56:50 +0100
Message-ID: <871r2m24tp.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Dec 08 2021 at 11:29, Jason Gunthorpe wrote:
> On Mon, Dec 06, 2021 at 11:27:56PM +0100, Thomas Gleixner wrote:
>>  	if (!desc->pci.msi_attrib.can_mask)
>
> It looks like most of the time this is called by an irq_chip, except
> for a few special cases list pci_msi_shutdown()
>
> Is this something that should ideally go away someday and use some
> lock in the irq_chip - not unlike what we've thought is needed for
> IMS?

Some day we'll have that yes.

