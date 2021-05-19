Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9F1388FC1
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 16:03:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130176.243983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljMmx-0006Tp-JI; Wed, 19 May 2021 14:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130176.243983; Wed, 19 May 2021 14:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljMmx-0006Ry-G4; Wed, 19 May 2021 14:03:07 +0000
Received: by outflank-mailman (input) for mailman id 130176;
 Wed, 19 May 2021 14:03:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ufKr=KO=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ljMmv-0006Rs-IG
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 14:03:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a8854df-f6d0-4079-8833-320895bd9a7d;
 Wed, 19 May 2021 14:03:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C452AFB1;
 Wed, 19 May 2021 14:03:03 +0000 (UTC)
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
X-Inumbo-ID: 0a8854df-f6d0-4079-8833-320895bd9a7d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621432983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N3n94Kxto49aIydwtZ1YuEe2MS4KN56hEGTksL0LjdY=;
	b=YVNlgj45CvUJq9jL3eo0h4JKgNrp1Ww/ztsiWFiEagrBYVFtsNQnqX1ysL7Ku2CltUXo3r
	Y2oW0XNK8iWHFREu84lsGWoRwRcW5vB/DWgW5MkTUTSgBH2rIu4hVL1eL3PkqfyVkpVa73
	M9R68zjm3q5yjR1BVGqcn1rDL1W/Mos=
Message-ID: <671922d6fea6fe534de09d552044838df0b484c4.camel@suse.com>
Subject: Re: [PATCH v3 5/5] tools/ocaml: Fix redefinition errors
From: Dario Faggioli <dfaggioli@suse.com>
To: Julien Grall <julien@xen.org>, Costin Lupu <costin.lupu@cs.pub.ro>, 
	xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>, David Scott
	 <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Date: Wed, 19 May 2021 16:03:02 +0200
In-Reply-To: <bb15b60d-ebbb-d0c1-9b95-605cf5ae5a41@xen.org>
References: <cover.1620633386.git.costin.lupu@cs.pub.ro>
	 <50763a92df0c58ed0d7749717b7ff5e2a039a4dd.1620633386.git.costin.lupu@cs.pub.ro>
	 <bb15b60d-ebbb-d0c1-9b95-605cf5ae5a41@xen.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-w+dynnTqWcY8kpkCqqOG"
User-Agent: Evolution 3.40.1 (by Flathub.org) 
MIME-Version: 1.0


--=-w+dynnTqWcY8kpkCqqOG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

So...

On Mon, 2021-05-17 at 19:16 +0100, Julien Grall wrote:
> On 10/05/2021 09:35, Costin Lupu wrote:
> > If PAGE_SIZE is already defined in the system (e.g. in
> > /usr/include/limits.h
> > header) then gcc will trigger a redefinition error because of -
> > Werror. This
> > patch replaces usage of PAGE_* macros with XC_PAGE_* macros in
> > order to avoid
> > confusion between control domain page granularity (PAGE_*
> > definitions) and
> > guest domain page granularity (which is what we are dealing with
> > here).
> >=20
> > Same issue applies for redefinitions of Val_none and Some_val
> > macros which
> > can be already define in the OCaml system headers (e.g.
> > /usr/lib/ocaml/caml/mlvalues.h).
> >=20
... At least this part is absolutely necessary for building Xen on
openSUSE Tumbleweed, therefore:

> > Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>
>=20
Tested-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-w+dynnTqWcY8kpkCqqOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmClGpYACgkQFkJ4iaW4
c+7SlhAAuO1vCJRxW044qTtSm4mHQ4mq8qw7LrNlm73PK23e8asr4ocLr+cG2AgY
pEEjCcpDtUZ6Hj8oPDpUpEuCOjL7q9rX1Q+fAWV6ifcHyigLb4sD31yAc7m0N8oT
Co4/3sioxANylWeFcWNoygwBVAZtzjuePtNqev92ZkXhHaW6sVFNriC1a1EePAm9
/BVWpi+7zvawZBn+ZIKiD1HYE/wM/cEY2LmPJL0gzMGnxv4d0ITEIVzTrEG8GC2T
NzDVzw8K3dBz3Ulz7/nJpvMCohY1hqRL5a8ixIJTMjv0N09URC/8HUThlm1L6JIb
5QIf618huy5bnHZ2i/YzjTk4DwRXl3n/Lgsb/8Fw4uTguMmRNsrjRF+KUhiW7bPz
A9Kwr72PFaJHNNB02lsH10zgbB/q228gVXoL0Vn0An017o9EPhfpgIvAvCQTA7I9
p0MLbXfQ4uV/0Ow+7RWInofckWyejr38yYfsXcWyH2k9dxudow6UMHZP6VO3KnxN
t7JBsO8ZQ0zx/1iWpBNE3GT+UrAN91OXgf9O6PMLfT6WmSyKA9gm26n3SxoiTa+d
TiuwWXWkY3iBkmfvPqIgDT6PdzZDpGwoEQY5TmGJFOSBKAn8oO1Dc15dmLIPk4Oi
0OkOHTxkaM0xUOxDZIZvlA2ZWh3pgBrGNpNH2bYoRe72MezRAfA=
=F9cj
-----END PGP SIGNATURE-----

--=-w+dynnTqWcY8kpkCqqOG--


