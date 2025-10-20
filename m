Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E907ABF057D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 11:58:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146058.1478537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAmdv-0006zW-9k; Mon, 20 Oct 2025 09:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146058.1478537; Mon, 20 Oct 2025 09:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAmdv-0006wp-62; Mon, 20 Oct 2025 09:57:31 +0000
Received: by outflank-mailman (input) for mailman id 1146058;
 Mon, 20 Oct 2025 09:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iYer=45=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vAmdt-0006wj-6U
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 09:57:29 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e503e92-ad9b-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 11:57:26 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 4C07EEC0009;
 Mon, 20 Oct 2025 05:57:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 20 Oct 2025 05:57:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Oct 2025 05:57:23 -0400 (EDT)
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
X-Inumbo-ID: 2e503e92-ad9b-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1760954245;
	 x=1761040645; bh=wpyzH9gwE++5tx2gzcWwYIYBt4oY1z4RM5ZzelUnXnI=; b=
	27/hsRRbK8gdkRLmK8PoBrCS4L5QXw0lcqtaPF5Bp01fFLn3N5cP8LD9Ef4chLZP
	4iAZchH4vUVPl/MYIceKysdG2bGKKGcl0hp5ge1XNjUEsrTdVAdn86EYhRKlnbDZ
	DP1gWS3NCqX4t5/qjBm8whBKzyHyiuGJxkL6G2z7JlX06rmW7Zh+FzK1gC4bKTLx
	AjW7L3hUk4FXnokFE716iOhT7OdJQ38PRjuRQf/a7kpMjQSe8oT9ivdRjRsikTwd
	ArXOKT7SDEuJyGhD102PuPdCteh5LsCLk4VOHMqPDz3n87Cys9lqyMmRpVAG8HSi
	DhMrNu0PavJyG7DPTaXkKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760954245; x=1761040645; bh=wpyzH9gwE++5tx2gzcWwYIYBt4oY1z4RM5Z
	zelUnXnI=; b=uQN9zrjkoCDn1B8UV2l0G79HQyPDx42emCkaKLAC5EsPhnqXVIM
	07QiPCllEFx0UONPb785ipP4sb3TCBOAHwUW9yxqV2d9PMS05UL0aFnZr5u3Zv3A
	TZ52L9RQonmaw3Utk4xImuHiHUCVXEosGD1F5hq4XpxK2OqWOJv8ECGqIawL9vYG
	/XnYxV7JlQZ1oa5mv/0VBhoupzdKY3zjDY963nuWUYM9E98AZ1eQ/Cieb3ztyEFV
	5X6CmltBJ3hcoyz+VoC2izN2hV9ivDIWGXefCJsjc8JrhM+HH4QDhQrt/6gx0+kO
	z3dy0hGYMMWq8mha2Y1Yq6CG7+qlWL4Ad4Q==
X-ME-Sender: <xms:hAf2aEFhIXKpLu68uiUYkoIwePMN7XV5EjqNV1M168qylqK6I27IRw>
    <xme:hAf2aP6uNs5va2y8atqZgH9hxVdY1cdCINrNN39zRBo_eURAx7hQM7coIfl-JnEty
    SHXwlmlesJ0-NNZMBevBpMdjQS9AySw9G8rVRMAQAJCH73AhA>
X-ME-Received: <xmr:hAf2aByLxgt9gSmT-ZmUqmHBXjRTWQxYZyco4A2HBZtBO9lvDRMWdRm4tUhJIATkI-UlWBopps_RUaaX2vxOWI1lMgTWvZq8FlI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddufeejheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepledpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihig
    rdgtohhmpdhrtghpthhtohepuggvmhhiohgsvghnohhurhesghhmrghilhdrtghomhdprh
    gtphhtthhopegrlhgvjhgrnhgurhhordhgrghrtghirghvrghllhgvjhhosegrmhgurdgt
    ohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhope
    hgrhihghhorhhiihgpshhtrhgrshhhkhhosegvphgrmhdrtghomhdprhgtphhtthhopehs
    vghrghhihigpkhhisghrihhksegvphgrmhdrtghomhdprhgtphhtthhopegrnhgurhgvfi
    drtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepphgruhhlseigvghn
    rdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojh
    gvtghtrdhorhhg
X-ME-Proxy: <xmx:hAf2aGMY4feK0S465BDms5GUEAaLpxhhcjBKnyKBSDjXZPKti3pLUg>
    <xmx:hAf2aPmDhJ3JFBo-gtDfaotBmDZCafBFV32cTTy3gVfi6s0yZxR4XA>
    <xmx:hAf2aDSdK8kcKoc4tlsFZYbJKxYKazkPOHz2PysKBRNwXofbqAGqVw>
    <xmx:hAf2aGWjxaNJFSmlkHgeO0T-zdtFfYyWdiGElUh_i-UclGS_z4D0vQ>
    <xmx:hQf2aDZ47fX0MrjGCzm4_eqK7EyrVH_HhZwNjEm_giI3e_Y2xWaT4t40>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 20 Oct 2025 11:57:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5] x86: make Viridian support optional
Message-ID: <aPYHgX1T3vev-YkX@mail-itl>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <3e4e4bc5-aa47-4357-9327-df2a9b9c9a1b@suse.com>
 <DDH3W3VM2ZDJ.PMFSGBWBTS0S@amd.com>
 <9248eda6-cf9b-4fdf-ab32-66e777585f65@gmail.com>
 <DDKPUZKA0UHL.2WRO9M23R4G3E@amd.com>
 <a7a2b126-489b-4bdc-ba0c-d0c92f8df822@gmail.com>
 <aPX2bbm2Zaa9o1hs@Mac.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5SrPJmT8nbMEI5gx"
Content-Disposition: inline
In-Reply-To: <aPX2bbm2Zaa9o1hs@Mac.lan>


--5SrPJmT8nbMEI5gx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Oct 2025 11:57:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5] x86: make Viridian support optional

On Mon, Oct 20, 2025 at 09:44:29AM +0100, Roger Pau Monn=C3=A9 wrote:
> On Sat, Oct 18, 2025 at 09:21:37PM -0400, Demi Marie Obenour wrote:
> > On 10/17/25 11:52, Alejandro Vallejo wrote:
> > > On Wed Oct 15, 2025 at 7:58 AM CEST, Demi Marie Obenour wrote:
> > >> On 10/13/25 06:01, Alejandro Vallejo wrote:
> > >>> On Wed Oct 8, 2025 at 6:04 PM CEST, Jan Beulich wrote:
> > >>>> On 30.09.2025 14:52, Grygorii Strashko wrote:
> > >>>>> --- a/xen/arch/x86/hvm/Kconfig
> > >>>>> +++ b/xen/arch/x86/hvm/Kconfig
> > >>>>> @@ -62,6 +62,16 @@ config ALTP2M
> > >>>>> =20
> > >>>>>  	  If unsure, stay with defaults.
> > >>>>> =20
> > >>>>> +config VIRIDIAN
> > >>>>> +	bool "Hyper-V enlightenments for guests" if EXPERT
> > >>>>> +	default y
> > >>>>> +	help
> > >>>>> +	  Support optimizations for Hyper-V guests such as faster hyper=
calls,
> > >>>>> +	  efficient timer and interrupt handling, and enhanced paravirt=
ualized
> > >>>>> +	  I/O. This is to improve performance and compatibility of Wind=
ows VMs.
> > >>>>
> > >>>> What is "paravirtualized I/O" about in this context?
> > >>>
> > >>> Hypervisor-assisted IPIs, TLB flushes, etc. Or so I understood back=
 when I said
> > >>> that looked ok. I see there could be confusion with Xen PV device p=
rotocols,
> > >>> but as far as the user of the help message is concerned it makes no=
 difference.
> > >>>
> > >>> One could even remove the examples and leave it as "... for Hyper-V=
 guests. This
> > >>> is to...". They are truly inconsequential.
> > >>>
> > >>> All that matters is that (modern) Windows won't run without it, and=
 that it
> > >>> provides some indeterminate hypervisor-provided assists to try to r=
educe some
> > >>> virtualization overheads.
> > >>
> > >> Qubes OS doesn't expose Viridian at all, which is why it wasn't
> > >> vulnerable to XSA-472.  It still runs Windows guests just fine.
> > >=20
> > > Can you run Windows 11?
> >=20
> > I haven't tried it, but it is documented as working.
> >=20
> > > I don't remember which, but I do know some versions of Windows refuse=
 to boot
> > > if they determine they are virtualised and don't see the mandatory pa=
rts of
> > > the TLFS.
> > >=20
> > > If 11 works, maybe Windows Server?
> >=20
> > Windows Server is more likely.
>=20
> FTR, for unrelated reasons I've tested Windows Server 2025 without
> Viridian, and it does work, albeit painfully slow.

Windows 11 works too, but also "painfully slow". Interestingly, Windows
10 works much better in the same environment (but still far from native
performance).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--5SrPJmT8nbMEI5gx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmj2B4EACgkQ24/THMrX
1yydrQf6Aphndmr/JnddbuFddNMV0U7k2cCI4DERcaXAqAd/u7za65qKnjsh4k5L
q4f6LX22Lvlu+LWeAPgUcatuo0VXCcTc2zUrSNO4Qwo44QT3uybkNmKhEqG9TrTK
/QwMssVjcXqoALGS/qm/Z8N2mnUGlZ7rS6WekknRVcsAm4xbHf2TPc+T6ycANvC6
EDUBuMFwNLzXlnj0NK1uO/rmPz7r9TTf6XwoqzXgfT062pog/omPzkwmbc//Koff
vYvLOSi2C5BkoHsoGhXGbQ5eN8fF7ogu4qNuze1KbidDoadMf4+eWT68R61QSpry
UCP7i71TudkbtS0RsxOvUI8jMS2Edg==
=RvOQ
-----END PGP SIGNATURE-----

--5SrPJmT8nbMEI5gx--

