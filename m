Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8712F10DAD8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 22:19:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ianc4-00007T-9a; Fri, 29 Nov 2019 21:15:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K7vD=ZV=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ianc2-00007N-Ds
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 21:15:38 +0000
X-Inumbo-ID: 63dbac64-12ed-11ea-83b8-bc764e2007e4
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63dbac64-12ed-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 21:15:38 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id CD7566C7E;
 Fri, 29 Nov 2019 16:15:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 29 Nov 2019 16:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=C1WEdJ
 atd+WY5dkWvoyHXjS1TMHWG+o4Uv+tJghWbrg=; b=kP/nLjqyVuNpDWEacaxPwC
 yn1MU/LMCbKs0nDDR3Mm89CYZGDk1MTo6wgcPYm4ImyBYbWClGx1SLCdNj5g1IBP
 MpJxxtE/fyIjlrbu+C5ZkbTAJuSCt5YxXfShkRxy4qVdNngJbf3pr/bJyDHDJk7s
 VbvcIIIn82ZGlS1Z3jJsz9aWn7HofA6vz87t60ku2iVwx25ceGVEOepLwpwW9JQF
 fBRgugTzgqfaac0hRmJcsdBvachOPdLnaKYafTILxhQ8Ato37EHQSajI0raGUiAJ
 qYSDKCC8kH6Jr3AJNVeeH/x0cLY7DgPGNmI1BdB3ween6KmFsfRWyMj0XLzgNRRA
 ==
X-ME-Sender: <xms:eYrhXdWQC1v4E3bDKHDIyYxEuvsBUiZn7DDjjl3vTqNnZE8p2J6VZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeiledgudegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
 feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:eYrhXZ71EiQjCbIpwBXt95c2crxgX0rtV4xXxe9uNJwaqink5fYNwA>
 <xmx:eYrhXcKRZeVl9U9YXT_HP1Kd80k-O5Ir__dxv0780FyTb1A11i1wqg>
 <xmx:eYrhXSL7nmBcJ_aF4sE-wRfsR7UQveqAWlFdDZ6y2J9zR9Df1V_oQQ>
 <xmx:eYrhXZU1S4I1kW1NEKd4k812fDh6RyiUiG1Dfwlc_NuQGqlMpVfJRA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8BA6830601AC;
 Fri, 29 Nov 2019 16:15:35 -0500 (EST)
Date: Fri, 29 Nov 2019 22:15:33 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20191129211533.GF5763@mail-itl>
References: <20191129172445.32664-1-pdurrant@amazon.com>
 <20191129173611.skfu63d4kqcysnoi@debian>
 <20191129174423.hbzdjtcondvnbts2@debian>
MIME-Version: 1.0
In-Reply-To: <20191129174423.hbzdjtcondvnbts2@debian>
Subject: Re: [Xen-devel] [PATCH-for-4.13 v7] Rationalize max_grant_frames
 and max_maptrack_frames handling
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============6078002263080602672=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6078002263080602672==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1iEpPD5yDbvq0asf"
Content-Disposition: inline


--1iEpPD5yDbvq0asf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH-for-4.13 v7] Rationalize max_grant_frames and
 max_maptrack_frames handling

On Fri, Nov 29, 2019 at 05:44:23PM +0000, Wei Liu wrote:
> On Fri, Nov 29, 2019 at 05:36:11PM +0000, Wei Liu wrote:
> > On Fri, Nov 29, 2019 at 05:24:45PM +0000, Paul Durrant wrote:
> > > From: George Dunlap <george.dunlap@citrix.com>
> > >=20
> > > Xen used to have single, system-wide limits for the number of grant
> > > frames and maptrack frames a guest was allowed to create. Increasing
> > > or decreasing this single limit on the Xen command-line would change
> > > the limit for all guests on the system.
> > >=20
> > > Later, per-domain limits for these values was created. The system-wide
> > > limits became strict limits: domains could not be created with higher
> > > limits, but could be created with lower limits. However, that change
> > > also introduced a range of different "default" values into various
> > > places in the toolstack:
> > >=20
> > > - The python libxc bindings hard-coded these values to 32 and 1024,
> > >   respectively
> > > - The libxl default values are 32 and 1024 respectively.
> > > - xl will use the libxl default for maptrack, but does its own default
> > >   calculation for grant frames: either 32 or 64, based on the max
> > >   possible mfn.
> > >=20
> > > These defaults interact poorly with the hypervisor command-line limit:
> > >=20
> > > - The hypervisor command-line limit cannot be used to raise the limit
> > >   for all guests anymore, as the default in the toolstack will
> > >   effectively override this.
> > > - If you use the hypervisor command-line limit to *reduce* the limit,
> > >   then the "default" values generated by the toolstack are too high,
> > >   and all guest creations will fail.
> > >=20
> > > In other words, the toolstack defaults require any change to be
> > > effected by having the admin explicitly specify a new value in every
> > > guest.
> > >=20
> > > In order to address this, have grant_table_init treat negative values
> > > for max_grant_frames and max_maptrack_frames as instructions to use t=
he
> > > system-wide default, and have all the above toolstacks default to pas=
sing
> > > -1 unless a different value is explicitly configured.
> > >=20
> > > This restores the old behavior in that changing the hypervisor comman=
d-line
> > > option can change the behavior for all guests, while retaining the ab=
ility
> > > to set per-guest values.  It also removes the bug that reducing the
> > > system-wide max will cause all domains without explicit limits to fai=
l.
> > >=20
> > > NOTE: - The Ocaml bindings require the caller to always specify a val=
ue,
> > >         and the code to start a xenstored stubdomain hard-codes these=
 to 4
> > > 	and 128 respectively; this behavour will not be modified.
> > >=20
> > > Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> > > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > > Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
> > > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > > Release-acked-by: Juergen Gross <jgross@suse.com>
> >=20
> > Acked-by: Wei Liu <wl@xen.org>
>=20
> In theory I should wait for Marek's ack for changes to python binding,
> but the changes are trivial there so I plan to push this patch later
> tonight to both staging and staging-4.13 so that it can be tested over
> the weekend.
>=20
> Marek, I apologise in advance in case you disagree with my assessment.

FWIW, for python part:
Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--1iEpPD5yDbvq0asf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3hinQACgkQ24/THMrX
1yyewgf/R3aHJ0J6kSDDIY/B4I5RxbHUBR7JMNVk07y4QtkcObbpzHYjntOhPbWs
4sWZpP4LLeHW0J16tWbk8iov+C3JKiXOu9EaYIJM7Sjcdve2BIKoXZkPh7uTe640
65VcT0WzWxAPq2YV1WuZ+DaW2gwGwdDFiDeH6WzOWfkM+dTqRXk3VJxbezKWrYRq
Viqh9ZZmWDQZ7AAeS3I/CKF+9s2AdQ/fuQmJabck78YqWOa7pEF88/RaXh4enLRP
II1FO5yY26OsMYjZd9JoVaQbXLk65kQueWsN0GqAHQzpY60URD3fLqBEmV/RwZsK
ES3G+cPh8hLDxBvr/Fm4B5E2/H2OnA==
=2AfT
-----END PGP SIGNATURE-----

--1iEpPD5yDbvq0asf--


--===============6078002263080602672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6078002263080602672==--

