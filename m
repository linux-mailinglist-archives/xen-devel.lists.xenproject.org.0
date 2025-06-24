Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72024AE5DC5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:31:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023196.1399126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTy7h-00043D-82; Tue, 24 Jun 2025 07:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023196.1399126; Tue, 24 Jun 2025 07:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTy7h-00042N-5R; Tue, 24 Jun 2025 07:31:17 +0000
Received: by outflank-mailman (input) for mailman id 1023196;
 Tue, 24 Jun 2025 07:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTy7f-00040v-G4
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:31:15 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34ce7faa-50cd-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 09:31:13 +0200 (CEST)
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
X-Inumbo-ID: 34ce7faa-50cd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750750272; x=1751009472;
	bh=m4tkI/DAqBg5rxuU99pgQ/A8zGC86vUO0IgnqLYERYI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RL7r2O94A7isnlu8LEcHToWsqAIyPTtnc7mliPjWelPitgg7Rn5cX8HqW5qYXYgqX
	 0eP1hFwu3DsImXwwHQJAdn/gvKkt1N/0g060J9AhmjjmT8S5E1571O0W4z7olUd/7K
	 qZYJRIfm7MBo2LVfbUi+HrDOejax2uBDxsQj7U7MmNZCq72DbJrjh42uc0oe1sj51v
	 Lz+bWBbOSe70mtMFA5CDqygE8OJN8u2f5jQCYDUQwUx3GCGwj+gHgn0hWckSaraw5w
	 LwdZatbOvbksJEgaY8LcU3JBsLC4MNxg6TBN1pkwaxPbLi1VKIjaMModzUufxsbe16
	 ljhdkRgX1GYEA==
Date: Tue, 24 Jun 2025 07:31:05 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 13/16] drivers/vuart: move PL011 emulator code
Message-ID: <aFpUNB8BP6+COTRp@kraken>
In-Reply-To: <6b2938a2-aa42-421f-b948-44e74f463b21@suse.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-14-dmukhin@ford.com> <6b2938a2-aa42-421f-b948-44e74f463b21@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d2e80d935fc37cdffd1531920a5f260b0e2d4858
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 07:50:33AM +0200, Jan Beulich wrote:
> On 24.06.2025 05:56, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Move PL011 emulator to the new location for UART emulators.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >  xen/arch/arm/Kconfig                               |  7 -------
> >  xen/arch/arm/Makefile                              |  1 -
> >  xen/drivers/Kconfig                                |  2 ++
> >  xen/drivers/Makefile                               |  1 +
> >  xen/drivers/vuart/Kconfig                          | 14 ++++++++++++++
> >  xen/drivers/vuart/Makefile                         |  1 +
> >  .../arm/vpl011.c =3D> drivers/vuart/vuart-pl011.c}   |  0
> >  7 files changed, 18 insertions(+), 8 deletions(-)
> >  create mode 100644 xen/drivers/vuart/Kconfig
> >  create mode 100644 xen/drivers/vuart/Makefile
> >  rename xen/{arch/arm/vpl011.c =3D> drivers/vuart/vuart-pl011.c} (100%)
>=20
> I question the placement under drivers/. To me, driver !=3D emulator. I
> wonder what others think. But yes, we already have drivers/vpci/. That
> may want moving then ...

re: driver !=3D emulator: I agree; but I followed drivers/vpci.

Do you think common/vuart would be a better location?

>=20
> Jan


