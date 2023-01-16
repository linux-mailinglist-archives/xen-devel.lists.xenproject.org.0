Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203F66CF7D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 20:22:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478945.742480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHV3c-0007RH-3P; Mon, 16 Jan 2023 19:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478945.742480; Mon, 16 Jan 2023 19:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHV3c-0007ON-0Y; Mon, 16 Jan 2023 19:22:12 +0000
Received: by outflank-mailman (input) for mailman id 478945;
 Mon, 16 Jan 2023 19:22:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PHax=5N=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pHV3a-0007OH-VN
 for xen-devel@lists.xen.org; Mon, 16 Jan 2023 19:22:10 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11e517b9-95d3-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 20:22:09 +0100 (CET)
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
X-Inumbo-ID: 11e517b9-95d3-11ed-91b6-6bf2151ebd3b
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1673896928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/xRPy2lFgYzK4rQRIIVFPLcqwpR0bB+GwT9J43FZdpM=;
	b=QEUWF6j5u+1NhckWuR+mgr9v4hj2n0zEuXyboXvSn34zuMH1NDWqp4x6Xg37XzsjC0c5Rh
	WNoqv2l0pCMKKpQoBJu2TKmmvAIXzgWRljRu/CIoDjyrZgmK2O/SS8C2jkWdZmD8z+MS8y
	ThiN1BHGg9HCjqTI2lt1qvuZtYXLjoey+DmgRW1YNIRYN4NHKQwUlOjl5UQB7epv1l2got
	a1K2kj/oN+trWA842lnDJBZpXS0PtXW6DlqtMM84oj7pCcQ2IUTzqVGq694zdIopstvcDf
	o2c3pySEeDJ5TNbmmyS1E/TLtub1svpU7wex62TMvnlDDi1VL5ktKdYL1zSOIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1673896928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/xRPy2lFgYzK4rQRIIVFPLcqwpR0bB+GwT9J43FZdpM=;
	b=E3CY56ng5AjvLJnjTeTH/SIcAG7tQAejOTkhid6gy/IkjDhcsvcKeMNKlUgyuzP3Bg4btY
	oLWtXOUok+0V71BA==
To: David Woodhouse <dwmw2@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>, xen-devel
 <xen-devel@lists.xen.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, linux-pci@vger.kernel.org, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Marc
 Zyngier <maz@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Kevin Tian
 <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>, Logan
 Gunthorpe <logang@deltatee.com>, Ashok Raj <ashok.raj@intel.com>, Jon
 Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>
Subject: Re: [patch V3 16/22] genirq/msi: Provide new domain id based
 interfaces for freeing interrupts
In-Reply-To: <e12002af82e9554e42e876d7b9e813b90e673330.camel@infradead.org>
References: <20221124225331.464480443@linutronix.de>
 <20221124230314.337844751@linutronix.de>
 <1901d84f8f999ac6b2f067360f098828cb8c17cf.camel@infradead.org>
 <875yd6o2t7.ffs@tglx> <871qnunycr.ffs@tglx>
 <e12002af82e9554e42e876d7b9e813b90e673330.camel@infradead.org>
Date: Mon, 16 Jan 2023 20:22:07 +0100
Message-ID: <87h6wqmgio.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

David!

On Mon, Jan 16 2023 at 18:58, David Woodhouse wrote:

> On Mon, 2023-01-16 at 19:11 +0100, Thomas Gleixner wrote:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.flags=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=3D MSI_FLAG_FREE_MSI_DESCS | MSI_FLAG_DEV_SYSFS,
> =C2=A0
> That doesn't apply on top of
> https://lore.kernel.org/all/4bffa69a949bfdc92c4a18e5a1c3cbb3b94a0d32.came=
l@infradead.org/
> and doesn't include the | MSI_FLAG_PCI_MSIX either.

Indeed. I saw that patch after my reply. :)

> With that remedied,
>
> Tested-by: David Woodhouse <dwmw@amazon.co.uk>
>
> Albeit only under qemu with
> https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv
> and not under real Xen.

Five levels of emulation. What could possibly go wrong?

