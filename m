Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E42B1774F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 22:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066418.1431639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhaBw-0001Ij-Bz; Thu, 31 Jul 2025 20:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066418.1431639; Thu, 31 Jul 2025 20:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhaBw-0001HH-8t; Thu, 31 Jul 2025 20:47:56 +0000
Received: by outflank-mailman (input) for mailman id 1066418;
 Thu, 31 Jul 2025 20:47:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhaBu-0001HB-6Y
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 20:47:55 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0b80064-6e4f-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 22:47:52 +0200 (CEST)
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
X-Inumbo-ID: a0b80064-6e4f-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753994871; x=1754254071;
	bh=q1uBWpSJAURcgIYqalxvLf6N901/1eU9Z6dsS/yNlZ0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BafxIJyHyx8ooJkhZw7cUSIfjt9lKkZUdcn3FUVFAi/Of4Bhydq+flbzUfc+nqKxN
	 cwLDx2EzeqHC/mp2xjijbI1TwtF5hR+rX4ESH3diwLlkdh7/gclKvlWm8qFmiQLBXW
	 svq74+rmLPLoCKfemGHABZuqBAf9clss9appfLBr71T/OpOjhr/M1T/LTye69XXQ1w
	 GbvVEXwGgT4HhIKPmVE5gr3ulAvP1Fb1hNw+0Pnr8TLJnPPQy5s8yxtCiIOobyZeY7
	 ospaavyYo83F+mZxsfUax8RCk3Ui7E4YcfMLceGMe4sAt0TvqZhnAe6KcMokkFoFSD
	 ReJmnu8oITZ7g==
Date: Thu, 31 Jul 2025 20:47:47 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 13/16] drivers/vuart: move PL011 emulator code
Message-ID: <aIvWbnwe/tzKsaIY@kraken>
In-Reply-To: <alpine.DEB.2.22.394.2507100959540.605088@ubuntu-linux-20-04-desktop>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-14-dmukhin@ford.com> <6b2938a2-aa42-421f-b948-44e74f463b21@suse.com> <aFpUNB8BP6+COTRp@kraken> <3da8604c-797c-4ad2-b059-4bf9c5bfb86a@suse.com> <aG8eaUx0wW19xS6W@kraken> <ca73a0b6-e484-48be-8ddb-4f53c18c99a0@suse.com> <alpine.DEB.2.22.394.2507100959540.605088@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c0a33628a27f7ba3ce7dc9ca2e3b3ad02e6c8cec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 10:00:10AM -0700, Stefano Stabellini wrote:
> On Thu, 10 Jul 2025, Jan Beulich wrote:
> > On 10.07.2025 03:59, dmkhn@proton.me wrote:
> > > On Tue, Jun 24, 2025 at 09:33:04AM +0200, Jan Beulich wrote:
> > >> On 24.06.2025 09:31, dmkhn@proton.me wrote:
> > >>> On Tue, Jun 24, 2025 at 07:50:33AM +0200, Jan Beulich wrote:
> > >>>> On 24.06.2025 05:56, dmkhn@proton.me wrote:
> > >>>>> From: Denis Mukhin <dmukhin@ford.com>
> > >>>>>
> > >>>>> Move PL011 emulator to the new location for UART emulators.
> > >>>>>
> > >>>>> No functional change intended.
> > >>>>>
> > >>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > >>>>> ---
> > >>>>>  xen/arch/arm/Kconfig                               |  7 -------
> > >>>>>  xen/arch/arm/Makefile                              |  1 -
> > >>>>>  xen/drivers/Kconfig                                |  2 ++
> > >>>>>  xen/drivers/Makefile                               |  1 +
> > >>>>>  xen/drivers/vuart/Kconfig                          | 14 ++++++++=
++++++
> > >>>>>  xen/drivers/vuart/Makefile                         |  1 +
> > >>>>>  .../arm/vpl011.c =3D> drivers/vuart/vuart-pl011.c}   |  0
> > >>>>>  7 files changed, 18 insertions(+), 8 deletions(-)
> > >>>>>  create mode 100644 xen/drivers/vuart/Kconfig
> > >>>>>  create mode 100644 xen/drivers/vuart/Makefile
> > >>>>>  rename xen/{arch/arm/vpl011.c =3D> drivers/vuart/vuart-pl011.c} =
(100%)
> > >>>>
> > >>>> I question the placement under drivers/. To me, driver !=3D emulat=
or. I
> > >>>> wonder what others think. But yes, we already have drivers/vpci/. =
That
> > >>>> may want moving then ...
> > >>>
> > >>> re: driver !=3D emulator: I agree; but I followed drivers/vpci.
> > >>>
> > >>> Do you think common/vuart would be a better location?
> > >>
> > >> Or maybe common/emul/... This wants discussing, I think.
> > >
> > > Will something like the following work
> > >   common/hvm/vuart
> > > ?
> >
> > Not really, emulators may not be limited to HVM. But iirc common/emul/ =
is
> > what we settled on anyway at the last Community Call?
>=20
> Yes, that is what I recall as well

Ack, will use common/emul/


