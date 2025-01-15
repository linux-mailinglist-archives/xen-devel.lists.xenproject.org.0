Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37833A12D76
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 22:15:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873102.1284080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYAiN-0006dq-7R; Wed, 15 Jan 2025 21:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873102.1284080; Wed, 15 Jan 2025 21:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYAiN-0006bt-4j; Wed, 15 Jan 2025 21:14:15 +0000
Received: by outflank-mailman (input) for mailman id 873102;
 Wed, 15 Jan 2025 21:14:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vXr=UH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tYAiL-0006bn-0l
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 21:14:13 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8c99e82-d385-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 22:14:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DEC06A4257D;
 Wed, 15 Jan 2025 21:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92BD8C4CED1;
 Wed, 15 Jan 2025 21:14:05 +0000 (UTC)
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
X-Inumbo-ID: a8c99e82-d385-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736975647;
	bh=GSZxHIs9dp+FZg5P9WqYYWNg3o6iXgaDEmNeunkFR5Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nz+0ZO0maeYDVcdt4IttvrH2VJaySUaTh81HiQqvbLgKFaMmS1uL2pL/Uw4t1WsYn
	 OTPVtWL2eGn7MjzNyhaa+VC+Uh0qlCf0NbTXY5Gz3QGG9KjotVxVOwUSn2FzB0j7j7
	 aBN7rpbhTnuPNM7obnAGq40hj9BQNt08yq6MqJTZ7Aqw+5dIAH9+PKcH4lksL/s18I
	 i2P/D/fWusSFAAl0Hk5499Cn7yFXuMIrSmGEQ7PLT3ijyVGjYu4j9iaSzjz+Dz1I8P
	 97s3QmeMQfRReqzhMPt84KOKdTBjDVmMfhkgQrF66yoot6y+9S61dS0xhdoD/mvKha
	 8r4xsGMI4q/mw==
Date: Wed, 15 Jan 2025 13:14:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Milan_=C4=90oki=C4=87?= <milandjokic1995@gmail.com>
cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
    palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, 
    oleksandr_tyshchenko@epam.com, Slavisa.Petrovic@rt-rk.com, 
    Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, 
    sunilvl@ventanamicro.com, takakura@valinux.co.jp, 
    linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
    iommu@lists.linux.dev
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-Vgh
In-Reply-To: <CAKp59VEOiXo+OKwPNiomtXNCsfDURCXaDktooi5JSoTSdhc90w@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2501151313590.2684657@ubuntu-linux-20-04-desktop>
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com> <alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop> <2f1432e6-0d27-48fd-b034-475284f14233@gmail.com>
 <CAKp59VEOiXo+OKwPNiomtXNCsfDURCXaDktooi5JSoTSdhc90w@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1821502211-1736975200=:2684657"
Content-ID: <alpine.DEB.2.22.394.2501151307240.2684657@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1821502211-1736975200=:2684657
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2501151307241.2684657@ubuntu-linux-20-04-desktop>

On Wed, 15 Jan 2025, Milan Đokić wrote:
> Hello Stefano, Oleksii
> 
> On Wed, Jan 15, 2025 at 5:30 PM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
> >
> > Hi Stefano,
> >
> > On 1/15/25 1:01 AM, Stefano Stabellini wrote:
> >
> > +Oleksii
> >
> > On Tue, 14 Jan 2025, Milan Djokic wrote:
> >
> > From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> >
> > This patch introduces initial support for running RISC-V as a Xen guest.
> > It provides the necessary infrastructure and stubs for Xen-specific
> > operations. Key changes include:
> >
> > - Modifications to the RISC-V kernel to integrate Xen-specific hypercalls
> >   and interfaces, with function implementations stubbed for future work.
> > - Introduction of Xen-specific headers for RISC-V, including event
> >   handling, hypervisor interaction, and page management. Functions are
> >   defined but not yet implemented.
> > - Stub implementations for memory management, grant tables, and context
> >   switching in the Xen environment, allowing further development and
> >   integration.
> >
> > Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
> > Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> >
> > Hi Milan, Slavisa,
> >
> > Thank you very much for your contribution! Which Xen tree are you using
> > for development?
> >
> > They are using [1] and have separate branches on top of latest. So we are in
> > sync. Also, if you are interested we have created a task/epics for this feature in
> > [1] so you could also check there some details:
> > 1. https://gitlab.com/groups/xen-project/people/olkur/-/epics/5
> > 2. https://gitlab.com/xen-project/people/olkur/xen/-/issues/12
> >
> >  I am asking because RISC-V support in Xen is still in
> > the process of being upstreamed, and [1] is the tree that consolidates
> > all patches currently on the to-be-upstreamed list.
> >
> > While the specific Xen tree you are using is not particularly important
> > at this stage, and using [1] is not a requirement, I am asking because
> > it is essential to align on the hypervisor ABI, especially regarding any
> > details that have not yet been upstreamed. Specifically, is there
> > anything in this patch series that relies on features not yet upstream
> > in Xen?
> >
> > There are few features but some things which are Rt-Tk's branch in [1] could go
> > without waiting for these features to be upstreamed.
> >
> > Thanks.
> >
> > ~ Oleksii
> >
> > [1] https://gitlab.com/xen-project/people/olkur/xen/-/tree/latest?ref_type=heads
> 
> As Oleksii already explained, we are working in sync with his latest
> branch where most of the risc port is done.

Perfect, I was hoping you'd say that! :-)
It is great to have you on board.


> I would just add that this patch introduces kernel risc-v hypercall
> support on which only our branch on xen tree depends on. Therefore, it
> won't disrupt any functionality with current upstream Xen, it will
> just introduce kernel functionality which is not used from Xen side
> until our branch is merged upstream.

Ideally, we should upstream the Xen side of an interface first to Xen,
then add support for the interface to Linux. Let me make a concrete
example. Let's say that you upstream hypercall support to Linux first,
using SBI_ECALL defined as 0xE. Then, during the upstreaming process,
the Xen community decides to change SBI_ECALL to 0XEA1 to make it the
same as ARM. You'd have to change the Linux code again to fix it. To
avoid this, it is best to wait upstreaming the Linux side, until the Xen
side is Acked.

This was just an example, and Andrew is right that the SBI
Implementation ID for Xen is reserved to 0x7, see the SBI specification.
--8323329-1821502211-1736975200=:2684657--

