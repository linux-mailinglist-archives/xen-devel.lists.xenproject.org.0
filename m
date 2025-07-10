Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1EAAFF692
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 03:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038915.1411058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZgZF-0007F5-6Y; Thu, 10 Jul 2025 01:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038915.1411058; Thu, 10 Jul 2025 01:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZgZF-0007BQ-3y; Thu, 10 Jul 2025 01:59:21 +0000
Received: by outflank-mailman (input) for mailman id 1038915;
 Thu, 10 Jul 2025 01:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dti5=ZX=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uZgZC-0007BG-8F
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 01:59:19 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b5b377d-5d31-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 03:59:15 +0200 (CEST)
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
X-Inumbo-ID: 7b5b377d-5d31-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752112754; x=1752371954;
	bh=rZYLY5SjhJZHCigmulEbIo0Rs+4Fp5LaE52kYkHQHfY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jA+QDICMvjSzWMvsBxMZDwGF2rE3xFnXv7M/pFxnbricK/RR+n06Bem4dGPX02EAl
	 gVXlPItDhqpDueVLf4b66I5/b8BsEY+7R5l81JQufQXr5+rpV5uBa+2BYj7XU3CrGZ
	 EWCf6we6JkMlMSXd13voQ8QjvVUyZQCAXKNKk/KDRvV4AQ8JboOIdiX6BzhOx8skuS
	 iBS9sv/e9oSBHZLHABilFcJbbdT+cICqdQcYBCxbBLMn8Boi/ifsf5TOdwrCidrwWX
	 zCCYMa5qkEbyerCQXqoXWVw2hdFQaSA+tJZDNZRnVaqflEpGCH86yoYgQ9SwqQxbtp
	 okYXBS06su/dw==
Date: Thu, 10 Jul 2025 01:59:10 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 13/16] drivers/vuart: move PL011 emulator code
Message-ID: <aG8eaUx0wW19xS6W@kraken>
In-Reply-To: <3da8604c-797c-4ad2-b059-4bf9c5bfb86a@suse.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-14-dmukhin@ford.com> <6b2938a2-aa42-421f-b948-44e74f463b21@suse.com> <aFpUNB8BP6+COTRp@kraken> <3da8604c-797c-4ad2-b059-4bf9c5bfb86a@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f45b916930ffb29a411150838f205df8073d07a7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 09:33:04AM +0200, Jan Beulich wrote:
> On 24.06.2025 09:31, dmkhn@proton.me wrote:
> > On Tue, Jun 24, 2025 at 07:50:33AM +0200, Jan Beulich wrote:
> >> On 24.06.2025 05:56, dmkhn@proton.me wrote:
> >>> From: Denis Mukhin <dmukhin@ford.com>
> >>>
> >>> Move PL011 emulator to the new location for UART emulators.
> >>>
> >>> No functional change intended.
> >>>
> >>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>> ---
> >>>  xen/arch/arm/Kconfig                               |  7 -------
> >>>  xen/arch/arm/Makefile                              |  1 -
> >>>  xen/drivers/Kconfig                                |  2 ++
> >>>  xen/drivers/Makefile                               |  1 +
> >>>  xen/drivers/vuart/Kconfig                          | 14 ++++++++++++=
++
> >>>  xen/drivers/vuart/Makefile                         |  1 +
> >>>  .../arm/vpl011.c =3D> drivers/vuart/vuart-pl011.c}   |  0
> >>>  7 files changed, 18 insertions(+), 8 deletions(-)
> >>>  create mode 100644 xen/drivers/vuart/Kconfig
> >>>  create mode 100644 xen/drivers/vuart/Makefile
> >>>  rename xen/{arch/arm/vpl011.c =3D> drivers/vuart/vuart-pl011.c} (100=
%)
> >>
> >> I question the placement under drivers/. To me, driver !=3D emulator. =
I
> >> wonder what others think. But yes, we already have drivers/vpci/. That
> >> may want moving then ...
> >
> > re: driver !=3D emulator: I agree; but I followed drivers/vpci.
> >
> > Do you think common/vuart would be a better location?
>=20
> Or maybe common/emul/... This wants discussing, I think.

Will something like the following work
  common/hvm/vuart
?

>=20
> Jan


