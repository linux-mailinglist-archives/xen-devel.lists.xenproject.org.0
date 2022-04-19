Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0805071DE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 17:33:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308255.523917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpqY-0000FR-Hq; Tue, 19 Apr 2022 15:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308255.523917; Tue, 19 Apr 2022 15:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpqY-0000DF-Ev; Tue, 19 Apr 2022 15:32:54 +0000
Received: by outflank-mailman (input) for mailman id 308255;
 Tue, 19 Apr 2022 15:32:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lfI/=U5=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1ngpqW-0000D6-LE
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 15:32:52 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f809e7c7-bff5-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 17:32:50 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C79395C00F7;
 Tue, 19 Apr 2022 11:32:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Apr 2022 11:32:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Apr 2022 11:32:47 -0400 (EDT)
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
X-Inumbo-ID: f809e7c7-bff5-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1650382368; x=1650468768; bh=of63eWPuDEYsw
	D9VFk/UpPjX4fxK7mSjw3zQWtJ8FuE=; b=Dd4VW1xnuqewU17gKmsMq/Ja106ec
	2Iyqb2PHieTicO1fT5qCXG76dQi/i21T7BqBaYjVu0ZrsnX12T8lxOISax321xaA
	Y1horh3HBwY7aGdRMzBxmFni13qHctznzClsjZrBABnthmayOz7DEfM8gNO+Uc1a
	n+j1VAthw5bdS8hsZoYKNqmzmEKoUoSezSf2z0uBJtPTfvQcxSUtHSIC/gqpxZQK
	6Wumq9LtUzCiy2GG+3VDDprG6tjT3+jWB2RMXZY3LhI52ALno9KeYCT6zQurxJ6S
	mBPy4CTgF4Yg/T80q2RaK7B4yVPVXeQ4kdnGDTKtYu1Mx/Peghfw/AMKQ==
X-ME-Sender: <xms:INZeYhRKMvuNi0lJHJJwOmSHi9ENG6MAeGkWcXrsqa98loL4otTzjQ>
    <xme:INZeYqyeXQ0fz99E2UHIjNGquaRn3xBoU8MNJ3h7yamKD-DrNbzvPYoCKT3Yb_Vkt
    LVzLpr0M7khSEA>
X-ME-Received: <xmr:INZeYm1vWzNpKK6rLQqMEWoHliV57RZomkkYQf2YuNyqyTD95L1Od5Q0kTFd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtfedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeffvghmihcuofgr
    rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmqeenucggtffrrghtthgvrhhnpedujefgjeeggeelhfevkeeltdekvdeuhfet
    iefffefhkeehhfevhefhkefgudegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:INZeYpDLaYfsAKbDsKupWUqaYJVKE8TpvOesJJdSK922lMSRbNw_lg>
    <xmx:INZeYqjQ8nl-ejkmU_bivxcJ2a2dEmxpiESK0yybf-qt-61YfPGrnA>
    <xmx:INZeYtpjoJ-gzcMTwO1EIChvgQVrQE3K2RHu9tlNEZVmJ1D83z_uxw>
    <xmx:INZeYugrXHgIh8vu9U0X-OMs_9k35VXGO0KKqKg7bs2FVW-Ht6srPA>
Date: Tue, 19 Apr 2022 11:32:23 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v3 0/4] EFI System Resource Table support
Message-ID: <Yl7WHv6+M+eJwQep@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2wCPjxNWfxWFtXWq"
Content-Disposition: inline


--2wCPjxNWfxWFtXWq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Apr 2022 11:32:23 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v3 0/4] EFI System Resource Table support

This adds support for the EFI System Resource Table.  This involves
reserving the table in Xen and adding a new hypercall so that dom0 can
access it.

Changes since v2:

- Use the esrt_desc global variable instead of passing it as a function
  parameter
- Add an overflow check for the ESRT size
- Create a new memory region for the ESRT to avoid wasting memory
- Add hypercall to retrieve the ESRT
- Add file local variables used during development
- Remove extra consts
- Follow the EFI naming convention in struct definitions
- Move struct definitions to header file
- Fix inverted logic in overflow check
- Remove BUILD_BUG_ON()s
- Avoid overriding attribute of memory descriptor containing ESRT

Changes since v1:

- Remove the esrt_status enum
- Use EFI types
- Fix style nits
- Remove an unused overflow check


Demi Marie Obenour (4):
  Grab the EFI System Resource Table and check it
  Add a dedicated memory region for the ESRT
  Add a new hypercall to get the ESRT
  Add emacs file-local variables

 xen/arch/arm/efi/efi-boot.h     |  1 +
 xen/arch/x86/efi/efi-boot.h     | 67 +++++++++++++++++++++++++--------
 xen/arch/x86/include/asm/e820.h |  2 +-
 xen/common/efi/boot.c           | 65 ++++++++++++++++++++++++++++++--
 xen/common/efi/efi.h            | 20 ++++++++++
 xen/common/efi/runtime.c        | 27 ++++++++++++-
 xen/include/efi/efiapi.h        |  3 ++
 xen/include/public/platform.h   |  7 ++++
 8 files changed, 172 insertions(+), 20 deletions(-)

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--2wCPjxNWfxWFtXWq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJe1h0ACgkQsoi1X/+c
IsEr7hAAsAjtZsbGL5/mSvGSJn/rrTqwuq5tKN4wpxNVe7Z14rFnsb9NLrMa2Qz5
qDcNe3njClHYJjSArpOvU6gsfXODs8EVONYGO90iUC4ounue1v+UiLvq/kP0inaM
j2f49a6gPNDO+OU35BdT1zzkhQVoA+yN2izisMp0KMFK+g+TWvsOtg/l1UhLT6Fo
w/rIosqWomIOF81ORPXS5qQUyIOYJchQDtIOheDpZ5KHxi23UFmjkNNogauRJAUa
GYa3hN8C05TCLN0QH3uKViI2h2UD3p5HZ0ha7mP1rRSZ/N2s4lyFx+GDjB0cRcfk
BQ4BeIe56BW6SJt5B9oNOiJh4BWarm99GBSNK6u3ADFmovV5v7PA4fdhRSqgeAHm
S/xpeiyj8bhv6+8XcMYZSxfs7jW+yjMnmIrT7aQ1gTAdv1N6lPMqQVBXdVnrpi1D
JIAIHSC/ihAYHtuNBO9qXLoljsHyjmP9OITC3bnVNBFPwbaggjQTbEB5ePoozUL4
aTskS5a0w4rmUY2+4sUp9IdmIMJ/2QA3K7EZAWAkTCSyqwf7HtpAjTxRIG4Jx/EA
Hi0Gfqs9gnnd+KyK+EvPBiBcZvmskZxyz4Q9BpqCoiQWuyfH75gZyzmtSz5rPinp
xuUR62Gv8aTBzes1dkcbEuF0G6CJQ2ZkWFQT2IrJ0anNF9XaSP0=
=+x46
-----END PGP SIGNATURE-----

--2wCPjxNWfxWFtXWq--

