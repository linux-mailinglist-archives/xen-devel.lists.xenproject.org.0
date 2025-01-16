Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DA4A143BB
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 22:08:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873800.1284762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYX5x-0006Jf-BM; Thu, 16 Jan 2025 21:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873800.1284762; Thu, 16 Jan 2025 21:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYX5x-0006Hz-8r; Thu, 16 Jan 2025 21:08:05 +0000
Received: by outflank-mailman (input) for mailman id 873800;
 Thu, 16 Jan 2025 21:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oLIk=UI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tYX5v-0006Hs-H5
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 21:08:03 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f83923ce-d44d-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 22:08:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 77096A4277F;
 Thu, 16 Jan 2025 21:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BB0C4CED6;
 Thu, 16 Jan 2025 21:07:58 +0000 (UTC)
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
X-Inumbo-ID: f83923ce-d44d-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737061680;
	bh=jz4mFU9u1twIuaW1pCTzx/vWfeheqpZU6b45voKJ0ZI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JgJhFSFlpSgBwC33cUPlLEwY7nroUBe4Dh4dJJ1Qbrf5FiYoxOrVTwPsTUcxxfRFU
	 BfPi2xogBfE+QgsczG8EqWUNKWtN9TWbjTpe00eeUlDg/q0ggTEq2iMMOuG2iOSYS0
	 cuuRUi9Eb9n4m/y9LibBZbDIhP/n3R8EddH/XQ75ywVAjo5zVH0ncK3WhKrOQtxfXP
	 yHB6WuTxiAKzrk3XZyc83WHb/ow7ffLfGY9t5c7rjRFO1leS+gfsrvlKE1t6JGXnEw
	 Dk92qEqVbimIs50isLxQCVjD+KR1csIFVVVcsKRPf1TRQC96vpaMIlbvnKyedvA4Kk
	 GAoAla+4VpnAQ==
Date: Thu, 16 Jan 2025 13:07:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Milan_=C4=90oki=C4=87?= <milandjokic1995@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
    palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, 
    oleksandr_tyshchenko@epam.com, Slavisa.Petrovic@rt-rk.com, 
    Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, 
    sunilvl@ventanamicro.com, takakura@valinux.co.jp, 
    linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
    iommu@lists.linux.dev
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-Vgh
In-Reply-To: <CAKp59VG=MV2=gCFqsC16EpP9oGa=eDBFJbwn-vS5q8oKyM_ZJQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2501161304480.2684657@ubuntu-linux-20-04-desktop>
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com> <alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop> <2f1432e6-0d27-48fd-b034-475284f14233@gmail.com> <CAKp59VEOiXo+OKwPNiomtXNCsfDURCXaDktooi5JSoTSdhc90w@mail.gmail.com>
 <alpine.DEB.2.22.394.2501151313590.2684657@ubuntu-linux-20-04-desktop> <CAKp59VG=MV2=gCFqsC16EpP9oGa=eDBFJbwn-vS5q8oKyM_ZJQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-352887263-1737061680=:2684657"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-352887263-1737061680=:2684657
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 Jan 2025, Milan Đokić wrote:
> On Wed, Jan 15, 2025 at 10:14 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> >
> > On Wed, 15 Jan 2025, Milan Đokić wrote:
> > > Hello Stefano, Oleksii
> > >
> > > On Wed, Jan 15, 2025 at 5:30 PM Oleksii Kurochko
> > > <oleksii.kurochko@gmail.com> wrote:
> > > >
> > > > Hi Stefano,
> > > >
> > > > On 1/15/25 1:01 AM, Stefano Stabellini wrote:
> > > >
> > > > +Oleksii
> > > >
> > > > On Tue, 14 Jan 2025, Milan Djokic wrote:
> > > >
> > > > From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> > > >
> > > > This patch introduces initial support for running RISC-V as a Xen guest.
> > > > It provides the necessary infrastructure and stubs for Xen-specific
> > > > operations. Key changes include:
> > > >
> > > > - Modifications to the RISC-V kernel to integrate Xen-specific hypercalls
> > > >   and interfaces, with function implementations stubbed for future work.
> > > > - Introduction of Xen-specific headers for RISC-V, including event
> > > >   handling, hypervisor interaction, and page management. Functions are
> > > >   defined but not yet implemented.
> > > > - Stub implementations for memory management, grant tables, and context
> > > >   switching in the Xen environment, allowing further development and
> > > >   integration.
> > > >
> > > > Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
> > > > Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> > > >
> > > > Hi Milan, Slavisa,
> > > >
> > > > Thank you very much for your contribution! Which Xen tree are you using
> > > > for development?
> > > >
> > > > They are using [1] and have separate branches on top of latest. So we are in
> > > > sync. Also, if you are interested we have created a task/epics for this feature in
> > > > [1] so you could also check there some details:
> > > > 1. https://gitlab.com/groups/xen-project/people/olkur/-/epics/5
> > > > 2. https://gitlab.com/xen-project/people/olkur/xen/-/issues/12
> > > >
> > > >  I am asking because RISC-V support in Xen is still in
> > > > the process of being upstreamed, and [1] is the tree that consolidates
> > > > all patches currently on the to-be-upstreamed list.
> > > >
> > > > While the specific Xen tree you are using is not particularly important
> > > > at this stage, and using [1] is not a requirement, I am asking because
> > > > it is essential to align on the hypervisor ABI, especially regarding any
> > > > details that have not yet been upstreamed. Specifically, is there
> > > > anything in this patch series that relies on features not yet upstream
> > > > in Xen?
> > > >
> > > > There are few features but some things which are Rt-Tk's branch in [1] could go
> > > > without waiting for these features to be upstreamed.
> > > >
> > > > Thanks.
> > > >
> > > > ~ Oleksii
> > > >
> > > > [1] https://gitlab.com/xen-project/people/olkur/xen/-/tree/latest?ref_type=heads
> > >
> > > As Oleksii already explained, we are working in sync with his latest
> > > branch where most of the risc port is done.
> >
> > Perfect, I was hoping you'd say that! :-)
> > It is great to have you on board.
> >
> >
> > > I would just add that this patch introduces kernel risc-v hypercall
> > > support on which only our branch on xen tree depends on. Therefore, it
> > > won't disrupt any functionality with current upstream Xen, it will
> > > just introduce kernel functionality which is not used from Xen side
> > > until our branch is merged upstream.
> >
> > Ideally, we should upstream the Xen side of an interface first to Xen,
> > then add support for the interface to Linux. Let me make a concrete
> > example. Let's say that you upstream hypercall support to Linux first,
> > using SBI_ECALL defined as 0xE. Then, during the upstreaming process,
> > the Xen community decides to change SBI_ECALL to 0XEA1 to make it the
> > same as ARM. You'd have to change the Linux code again to fix it. To
> > avoid this, it is best to wait upstreaming the Linux side, until the Xen
> > side is Acked.
> >
> Sure, I got your point. This is actually one of the things we were not
> sure about (whether we should upstream Linux or Xen side first).
> Anyways it's good that we got review comments. We'll fix this patch
> according to suggestions and send it back when Xen side is upstream.

Thank you! In general, "first upstream to Xen, then to Linux" is a good
guideline, but we can be flexible. For instance, in the case of
hypercalls that seem pretty obvious how we are going to implement them,
it might be sufficient to send a simple patch to Xen to add a document
under xen.git/docs/ to document how the hypercall ABI will look like on
RISC-V, without the implementation. With that document committed to
xen.git, we can go forward with upstreaming the Linux side, even if the
upstream Xen implementation is still lacking.
--8323329-352887263-1737061680=:2684657--

