Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BF888565A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 10:22:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696274.1087057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEcs-0001Tj-2u; Thu, 21 Mar 2024 09:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696274.1087057; Thu, 21 Mar 2024 09:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEcr-0001RZ-Vp; Thu, 21 Mar 2024 09:22:17 +0000
Received: by outflank-mailman (input) for mailman id 696274;
 Thu, 21 Mar 2024 09:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WD1U=K3=kernel.org=conor@srs-se1.protection.inumbo.net>)
 id 1rnEcq-0001RS-U4
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 09:22:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80d84ac3-e764-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 10:22:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 51D1261189;
 Thu, 21 Mar 2024 09:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD5FC433C7;
 Thu, 21 Mar 2024 09:22:10 +0000 (UTC)
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
X-Inumbo-ID: 80d84ac3-e764-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711012933;
	bh=qjQQK6j3m/jVOwIC8r/wFiiwGts62l6f+srMNq0rfGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zh9XA9tZPR7D24e7FmpEPBzSUZJ2wGbgGGTPrvJXn4aJvw5wSzoQi65T3I2I1YYbD
	 MXgGbo/umdTlO5IDswxBcMSOO1ylsnwo0bwyl1RVnJe1UBBVx0fdx70FL/NqkFr2dL
	 ppJ9HxqHByOv+PE0+l2/KBpyXN1KUGp54NFhbVS0wHuKpoME7YcQkBTieJo5bGjKRh
	 OkXAKS39j1zkcMlg0F6lOzBuvzFBk0KaX+5KzFmzm43zioFjEzPSdCPlXmak8QrAml
	 /vkkaP+FvO2ickK0KCVJ8CyvoXMJ27/eaXMJghXAudrnpVx2SIq9+6f8LzJU1gFGup
	 +DvvmaFpwW8vQ==
Date: Thu, 21 Mar 2024 09:22:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org,
	Oleksii <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v6 03/20] xen/riscv: introduce extenstion support check
 by compiler
Message-ID: <20240321-cranium-deluxe-77d762948b96@spud>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <d4df95eb7a30df3f882b67f200964232fee9d6c1.1710517542.git.oleksii.kurochko@gmail.com>
 <6ddc9d8a-20e7-4e4d-ae1a-d2ea01479b38@suse.com>
 <04c1424cec1342dcfb849d361f5eb9f3e7f34734.camel@gmail.com>
 <20240320-oak-uprising-db787f501695@spud>
 <a7ac74fd-384e-4f1d-a056-e6695ecff7d9@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="alPnOWaOvdc6lB6s"
Content-Disposition: inline
In-Reply-To: <a7ac74fd-384e-4f1d-a056-e6695ecff7d9@suse.com>


--alPnOWaOvdc6lB6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 09:31:59AM +0100, Jan Beulich wrote:
> On 20.03.2024 20:44, Conor Dooley wrote:
> > On Wed, Mar 20, 2024 at 07:58:05PM +0100, Oleksii wrote:
> >> On Mon, 2024-03-18 at 17:58 +0100, Jan Beulich wrote:
> >>> On 15.03.2024 19:05, Oleksii Kurochko wrote:
> >>>> Currently, RISC-V requires two extensions: _zbb and _zihintpause.
> >>>
> >>> Do we really require Zbb already?
> >> After an introduction of Andrew C. patches [1] it is requited for
> >> __builtin_ffs{l}
> >>
> >> [1]
> >> https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.coop=
er3@citrix.com/T/#t
> >>>
> >>>> This patch introduces a compiler check to check if these extensions
> >>>> are supported.
> >>>> Additionally, it introduces the riscv/booting.txt file, which
> >>>> contains
> >>>> information about the extensions that should be supported by the
> >>>> platform.
> >>>>
> >>>> In the future, a feature will be introduced to check whether an
> >>>> extension
> >>>> is supported at runtime.
> >>>> However, this feature requires functionality for parsing device
> >>>> tree
> >>>> source (DTS), which is not yet available.
> >>>
> >>> Can't you query the CPU for its features?
> >> I couldn't find such reg ( or SBI call ) in the spec.
> >=20
> > There isn't.
> >=20
> >> SBI call sbi_probe_extension() exists, but it doesn't check for every
> >> possible extension. As far as I understand it checks only for that one
> >> which are present in SBI spec.
> >=20
> > Yeah, it only checks for SBI extensions, not ISA extensions.
>=20
> And there was never a consideration to add, at the architecture level,
> some straightforward way for all layers of software to be able to
> easily detect availability of extensions? I find the lack thereof
> pretty surprising ...

No, there sorta is. There's a "configuration structure" spec in the
works, but the (public?) documentation for it is very nascent:
https://github.com/riscv/configuration-structure/

It uses (what I seem to recall is an m-mode) CSR to give the address
of an ASN.1 structure in memory which is intended to encode a whole
raft of information. The CSR itself might be M-Mode, but that doesn't
prevent accessing the data itself at any layer in the stack. The last
time I read it I got the impression it was supposed to be usable for
describing an entire system (including things like i2c or spi
controllers). I don't think it ever explicitly says that in the spec,
but there's a note (IIRC) that mentions being unsuitable for describing
devices on dynamic buses like PCI, so that kinda implies anything else
is fair game.

Hope that helps?

--alPnOWaOvdc6lB6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfv8QAAKCRB4tDGHoIJi
0gH8AQDkq72OBEG0QTVAtRar04f1ATCvaDGKG+PhzPcn7TLnzAD9GyagSQmI9tri
tWADNzMq5fw1eXLfwSLkJlgWFOj7dQI=
=uVKi
-----END PGP SIGNATURE-----

--alPnOWaOvdc6lB6s--

