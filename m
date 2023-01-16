Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424B966CFC8
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 20:49:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478959.742502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHVTg-0002CG-Ji; Mon, 16 Jan 2023 19:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478959.742502; Mon, 16 Jan 2023 19:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHVTg-0002AZ-Go; Mon, 16 Jan 2023 19:49:08 +0000
Received: by outflank-mailman (input) for mailman id 478959;
 Mon, 16 Jan 2023 19:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PHax=5N=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pHVTf-0002AT-47
 for xen-devel@lists.xen.org; Mon, 16 Jan 2023 19:49:07 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4cb3d2d-95d6-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 20:49:04 +0100 (CET)
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
X-Inumbo-ID: d4cb3d2d-95d6-11ed-b8d0-410ff93cb8f0
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1673898543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsQIYS8Reb5+JjRsIyy9SKu5zYksjmBvIj9vz87cqIA=;
	b=heEkt7NaYvIze8aJGQVSQyHNSN98z+Wfxq09MbTTdqrC+XKiOY0rDosjUd0z1XsSIluw/P
	Cr2Q5VCIR8uXtuiK6mYkB9j8V15SmnDnNd8MoO3oU3y7irPN42IRU27Jh4H/8wglTGEH25
	9Om5jylGiPoSEa68SE/xeQLD4UTAezrquPJe+NbYT4vogs55O4A6M/3mLcrXBt9/Z0vmdW
	/zROGTl2f7ioJ0ivQfFu0FFh7UFomXQK/1HkCSm7uVxq64vpQlA1SwezuakhBjKTLuBmk7
	6vupSlP1XINVTJeEQoKgecPdHcR9dTYuuWNP5NIzbbxbWCCMdpieSqhH0Bk9kQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1673898543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsQIYS8Reb5+JjRsIyy9SKu5zYksjmBvIj9vz87cqIA=;
	b=bfhTZB4zqL0K6JB8VZXUJnVxNs2r97QdIbh0E82HuZsZVNPSxYCPU420T4qGOhJ+vpVXFQ
	NsX/lhRHJD/orPDQ==
To: David Woodhouse <dwmw2@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>, xen-devel
 <xen-devel@lists.xen.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, linux-pci@vger.kernel.org, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Marc
 Zyngier <maz@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Logan Gunthorpe
 <logang@deltatee.com>, Ashok Raj <ashok.raj@intel.com>, Jon Mason
 <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>
Subject: Re: [patch V3 16/22] genirq/msi: Provide new domain id based
 interfaces for freeing interrupts
In-Reply-To: <57f3f757aaceccf866172faaf48ab62916f24d8b.camel@infradead.org>
References: <20221124225331.464480443@linutronix.de>
 <20221124230314.337844751@linutronix.de>
 <1901d84f8f999ac6b2f067360f098828cb8c17cf.camel@infradead.org>
 <875yd6o2t7.ffs@tglx> <871qnunycr.ffs@tglx>
 <e12002af82e9554e42e876d7b9e813b90e673330.camel@infradead.org>
 <87h6wqmgio.ffs@tglx>
 <57f3f757aaceccf866172faaf48ab62916f24d8b.camel@infradead.org>
Date: Mon, 16 Jan 2023 20:49:02 +0100
Message-ID: <87edrumf9t.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

David!

On Mon, Jan 16 2023 at 19:28, David Woodhouse wrote:
> On Mon, 2023-01-16 at 20:22 +0100, Thomas Gleixner wrote:
>> > Tested-by: David Woodhouse <dwmw@amazon.co.uk>
>> >=20
>> > Albeit only under qemu with
>> > https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xen=
fv
>> > and not under real Xen.
>>=20
>> Five levels of emulation. What could possibly go wrong?
>
> It's the opposite =E2=80=94 this is what happened when I threw my toys ou=
t of
> the pram and said, "You're NOT doing that with nested virtualization!".
>
> One level of emulation. We host guests that think they're running on
> Xen, directly in QEMU/KVM by handling the hypercalls and event
> channels, grant tables, etc.
>
> We virtualised Xen itself :)

Groan. Can we please agree on *one* hypervisor instead of growing
emulators for all other hypervisors in each of them :)

> Now you have no more excuses for breaking Xen guest mode!

No cookies, you spoilsport! :)

        tglx

