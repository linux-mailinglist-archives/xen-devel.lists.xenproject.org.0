Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4B02AF4A6
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 16:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25056.52625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrwX-0000R6-DX; Wed, 11 Nov 2020 15:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25056.52625; Wed, 11 Nov 2020 15:21:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrwX-0000Qh-AF; Wed, 11 Nov 2020 15:21:53 +0000
Received: by outflank-mailman (input) for mailman id 25056;
 Wed, 11 Nov 2020 15:21:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kcrwV-0000Qc-Qg
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:21:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2fbb3ae-22ba-45c8-8de5-2fc9cd435877;
 Wed, 11 Nov 2020 15:21:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D379ABD6;
 Wed, 11 Nov 2020 15:21:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kcrwV-0000Qc-Qg
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:21:51 +0000
X-Inumbo-ID: a2fbb3ae-22ba-45c8-8de5-2fc9cd435877
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a2fbb3ae-22ba-45c8-8de5-2fc9cd435877;
	Wed, 11 Nov 2020 15:21:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605108110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C2tzLP1jGK1O/DkKtMWgOwpHBBkfzLcFObx5rJsZWCA=;
	b=irXMa44ydziTpzt1nw2uB0Xr4C8Upc32cRGasy9nnjYLtytP2pPB8euK558KP6qyj1lP6B
	5W/YpEcOg4f06WhqzoQgTO5cdalZv8uTKqsZ8XnEmZ5xfeg+CzOhEhcCoDaVcUftxzpd6h
	F40ou3oWHTrp7vJkONTmJikK20dy1gY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4D379ABD6;
	Wed, 11 Nov 2020 15:21:50 +0000 (UTC)
Message-ID: <aa3c1df3fcc5e815a6d652211316f0f196a718cb.camel@suse.com>
Subject: Re: [PATCH 11/12] xen/hypfs: add scheduling granularity entry to
 cpupool entries
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Wed, 11 Nov 2020 16:21:49 +0100
In-Reply-To: <20201026091316.25680-12-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
	 <20201026091316.25680-12-jgross@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-1LrBIHAIuR7ko6p+dcz+"
User-Agent: Evolution 3.38.1 (by Flathub.org) 
MIME-Version: 1.0


--=-1LrBIHAIuR7ko6p+dcz+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-10-26 at 10:13 +0100, Juergen Gross wrote:
> Add a "sched-gran" entry to the per-cpupool hypfs directories.
>=20
> For now make this entry read-only and let it contain one of the
> strings "cpu", "core" or "socket".
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-1LrBIHAIuR7ko6p+dcz+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+sAY0ACgkQFkJ4iaW4
c+7LMRAAvwNbWlmIUNyzL3kBxZHL7K+YsrFiHqjcZYagKTXmdQ2m54D9+q56IIvE
nKajH1DPcaFbDAJFQse9gI6pNzvqSzO9ICJs+TKVzx05SbCEYRndcjMa8shMxtXp
pOhut+knIwWFX7XJo21g4Hp63X2r685d0yuBD0zf5zAVMwU4R8Lu5zlSCzZoO3/E
JP+l3axGw/EW5xfssOh8lpBbGHUzqjtOE0YqlaVmN9mB84dRM5MYOT2b65OaK8F5
UN+Ilw8LR0L2B+UXFWlxwpOhNgeZWfKu+zajpTJpvU0+039+70qXKEy7tj82d1zw
LrfcW7H74b5V+L5+ZVgiyb+593Id5yiaXLDwIH4SwoYjZl04eET5byH9qHJmvkwi
Yw01xogf19Nz8ZwaFQqY4QcVOCnUnd8dbU1CpxI1JErjI90/qIEzo8ycsRJLRqX6
FT/qmpn4ZxLJeQAVtPh0WHZbIiy96mXlACvcXPt+u4BMKbX5o3EEmURYAztGbfni
E1jfOnwgDnqA0GoySfLAZnlmkRfrzZAl1R1ln2qt9PvJ04r9i8aB5UmeceX5g82Y
efVTX7lXhW50jtWACHBc7QIQhawRV+e38sqo0MKgTziiNuv1r3VD7cxA1e2Zc45h
dd12wudci1y1hlEUXD3X5VQf6YG++1JjvTr+C85KpdTYeRaEX+Q=
=zMF9
-----END PGP SIGNATURE-----

--=-1LrBIHAIuR7ko6p+dcz+--


