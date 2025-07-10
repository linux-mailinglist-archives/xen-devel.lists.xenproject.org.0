Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E5FB00B74
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 20:33:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039800.1411432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZw4M-0004w8-My; Thu, 10 Jul 2025 18:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039800.1411432; Thu, 10 Jul 2025 18:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZw4M-0004td-KD; Thu, 10 Jul 2025 18:32:30 +0000
Received: by outflank-mailman (input) for mailman id 1039800;
 Thu, 10 Jul 2025 18:32:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dti5=ZX=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uZw4J-0004tX-VM
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 18:32:29 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a0ba5dc-5dbc-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 20:32:25 +0200 (CEST)
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
X-Inumbo-ID: 3a0ba5dc-5dbc-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752172344; x=1752431544;
	bh=jy+ehOEXBrVwAFq82GcECgaf51ILhDpVVkhGsis8u5I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=e+tsQ3lwoRIu/x5wkd2TN1vi95wPnlDPDm+2RoFJnbxq8hAgPM9R+t7S9tggFC733
	 ETSxRp23IU3qS5ldV9GjjUwvtzlMk/kkGp++IJLSQKZ/P/50+eVs/5pZHu0peLuM1x
	 oZF96KhWlv8SCOuOCz5V6HWNVFn38N/tFPpahDRLipADupI9IC0sKPTwFY5p8DvG8x
	 KVL/lP2vEIRRqz3D1t1iPBOw9Y6xcniHS1sjfEvvVm6V7KkU9dFXCyVH8sqnGjkLo+
	 EP27wjVY3GnskxhxfJ6YFaGM446Q9dSyRxYRAnayFk56W4E/rYpA8ZtKw+fD4uHD8v
	 4DccIinaGNBlQ==
Date: Thu, 10 Jul 2025 18:32:15 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 13/16] drivers/vuart: move PL011 emulator code
Message-ID: <aHAHJ3JyAsc/5sa3@kraken>
In-Reply-To: <ca73a0b6-e484-48be-8ddb-4f53c18c99a0@suse.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-14-dmukhin@ford.com> <6b2938a2-aa42-421f-b948-44e74f463b21@suse.com> <aFpUNB8BP6+COTRp@kraken> <3da8604c-797c-4ad2-b059-4bf9c5bfb86a@suse.com> <aG8eaUx0wW19xS6W@kraken> <ca73a0b6-e484-48be-8ddb-4f53c18c99a0@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 134c0e112dd2d3589a5b0e491cbf68930372d5c4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 10:15:54AM +0200, Jan Beulich wrote:
> On 10.07.2025 03:59, dmkhn@proton.me wrote:
> > On Tue, Jun 24, 2025 at 09:33:04AM +0200, Jan Beulich wrote:
> >> On 24.06.2025 09:31, dmkhn@proton.me wrote:
> >>> On Tue, Jun 24, 2025 at 07:50:33AM +0200, Jan Beulich wrote:
> >>>> On 24.06.2025 05:56, dmkhn@proton.me wrote:
> >>>>> From: Denis Mukhin <dmukhin@ford.com>
> >>>>>
> >>>>> Move PL011 emulator to the new location for UART emulators.
> >>>>>
> >>>>> No functional change intended.
> >>>>>
> >>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>>>> ---
> >>>>>  xen/arch/arm/Kconfig                               |  7 -------
> >>>>>  xen/arch/arm/Makefile                              |  1 -
> >>>>>  xen/drivers/Kconfig                                |  2 ++
> >>>>>  xen/drivers/Makefile                               |  1 +
> >>>>>  xen/drivers/vuart/Kconfig                          | 14 ++++++++++=
++++
> >>>>>  xen/drivers/vuart/Makefile                         |  1 +
> >>>>>  .../arm/vpl011.c =3D> drivers/vuart/vuart-pl011.c}   |  0
> >>>>>  7 files changed, 18 insertions(+), 8 deletions(-)
> >>>>>  create mode 100644 xen/drivers/vuart/Kconfig
> >>>>>  create mode 100644 xen/drivers/vuart/Makefile
> >>>>>  rename xen/{arch/arm/vpl011.c =3D> drivers/vuart/vuart-pl011.c} (1=
00%)
> >>>>
> >>>> I question the placement under drivers/. To me, driver !=3D emulator=
. I
> >>>> wonder what others think. But yes, we already have drivers/vpci/. Th=
at
> >>>> may want moving then ...
> >>>
> >>> re: driver !=3D emulator: I agree; but I followed drivers/vpci.
> >>>
> >>> Do you think common/vuart would be a better location?
> >>
> >> Or maybe common/emul/... This wants discussing, I think.
> >
> > Will something like the following work
> >   common/hvm/vuart
> > ?
>=20
> Not really, emulators may not be limited to HVM. But iirc common/emul/ is
> what we settled on anyway at the last Community Call?

Sorry, I missed today's call, did not know about the decision.

>=20
> Jan
>=20


