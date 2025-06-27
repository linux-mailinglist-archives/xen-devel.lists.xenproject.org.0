Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626B3AEBD00
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 18:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027814.1402281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVBoJ-00075t-Bn; Fri, 27 Jun 2025 16:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027814.1402281; Fri, 27 Jun 2025 16:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVBoJ-00073a-87; Fri, 27 Jun 2025 16:20:19 +0000
Received: by outflank-mailman (input) for mailman id 1027814;
 Fri, 27 Jun 2025 16:20:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9k5L=ZK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uVBoG-00073U-Sx
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 16:20:17 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 985ac14c-5372-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 18:20:10 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 2A634EC0237;
 Fri, 27 Jun 2025 12:20:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Fri, 27 Jun 2025 12:20:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 12:20:02 -0400 (EDT)
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
X-Inumbo-ID: 985ac14c-5372-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751041209;
	 x=1751127609; bh=ZZVBX7SqKAgFWWed/Qm/9P37J5UgF6jpOyUv6CjRlYU=; b=
	ckDgxDeBzCrBc0QgJX+5kbj2jhS7JVdXYw+2UZqx5103dBhdPrht0xkG7zbFR+mD
	OIP8LLq9S31F21qoUfccrL1uDCrpb4/noF1bQj+z7yY4Qfx52r8PSUXAl3iqpGXm
	tCTLhbMx0LtxFaDBwTfTG5EKYDueodI97O3Jc7VTJxQ2MpJ+6dnQkRFFx3f0GFX3
	VXDzenRpkiqpk3fJZjb7HKHyuJgra9+ivn0/7YC1cpx6E739PeZp1VWMk72LCuMu
	iQG6lXpj6DK8g8a4R4D/TCJQ8Pq6ZlQwZlkJQjKzcnST5TTokDgYCUkJT4mUN6oj
	v1k8kNVXPr+2AxUgLXWJlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751041209; x=1751127609; bh=ZZVBX7SqKAgFWWed/Qm/9P37J5UgF6jpOyU
	v6CjRlYU=; b=oE4V5LF78diF3/s9ghvnPd+njq+D3ntdUpc+Et+1Cwm9nA4MCUo
	mNqGaaP2gK1pePCAgBpp4S9ZZtYqmhuXrgcIpPhDQbMzkS+rFqPay77eHTEE9E36
	Mc7OVT84cbi9om7Wf8ecQ6IUzcuWaz8oFQMpsUM7cmnmmdKHzSUnikd6vNnYQhra
	ff3Mw+eYyNHB29RWoHuGuDHR9FFMr/RX1II/sDrOwsd/wnXvYBZee7V6OmxYC/QD
	D2KkxWK1GLNJjQJxsXQp93FeRaS6xtGz1PVcenREZd270ZN5azoEkHmQy+ecT6pL
	yTzGa5ie0oWCFj+iDlSJFCNWZfsgJfNy7Zw==
X-ME-Sender: <xms:s8ReaA2fW1k-UHmdirDXAtJCWkR61c2Rb6HLRKqE5_dCrURLluJaIQ>
    <xme:s8ReaLGC2ori8bfXtVjf9QUw-oyta92Kpvzb4VFQIOKhmDeglLYf04P-vEa1_JyNR
    1Bl7D9j4dYrIA>
X-ME-Received: <xmr:s8ReaI4DAWGhDn2Lvm7YN7-HPuLN6SJMTNcNqd8KEoLpl2dVF6ZYABJmBVZ3Wcn0WgOXDt3THpqHz36xQPjQMx6rQRwc2le1y6c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleetfeev
    hfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepfhhrvgguihgrnhhordiiihhglhhiohestghl
    ohhuugdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnph
    hrohhjvggtthdrohhrghdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshho
    lhhuthhiohhnshdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtoh
    hm
X-ME-Proxy: <xmx:s8ReaJ2Da-YCgNcuK-L9H7woYBDmHmE7A4zWt00vm9_I-RDhkW5vYg>
    <xmx:s8ReaDHcBWu6ewpTlQaxC-ZAGl4Vz7_-NP1XHu_B-7DQF1fTWFO59g>
    <xmx:s8ReaC9jZdGkTAoyaivcVQOxStdH5w4hoDRyAmprNT4MHyFkdDumtA>
    <xmx:s8ReaIkGOeMTew2IDhVJ5KUsgBB9W1IL7UMWpA7RTaPHtjfKGXrP_w>
    <xmx:ucReaLe11bEPCBAOTkK-pXtjHJf-Oq9olTZU5Hu55hIC9zdJAmZd2CTg>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 27 Jun 2025 18:19:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with
 GRUB2
Message-ID: <aF7EsHeJ1GAwvrDz@mail-itl>
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <CACHz=Zj_YibxBOQytCQAmTAG=yyBXUx2s1Jr+fXqHgxHQmSDOQ@mail.gmail.com>
 <aFxbi6dnKjydzyNk@mail-itl>
 <CACHz=Zj=LsfbUVMkuKHx-xpy+NMQh13NUJ_-sPSq3OMwSurHPA@mail.gmail.com>
 <aF1hIARPp6a0wWmi@mail-itl>
 <CACHz=ZiVT-iSzEsG48NjJzJgdd=Ns-+dVTUTZKqVq78Py-kp2A@mail.gmail.com>
 <aF6onqQMlms2svXT@mail-itl>
 <CACHz=Zi3THWcucw6ioZhKaeeDxM+e+E1rb-NvczG=mkVjD5qzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NQ0ctA3HwDKAsDNG"
Content-Disposition: inline
In-Reply-To: <CACHz=Zi3THWcucw6ioZhKaeeDxM+e+E1rb-NvczG=mkVjD5qzg@mail.gmail.com>


--NQ0ctA3HwDKAsDNG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Jun 2025 18:19:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with
 GRUB2

On Fri, Jun 27, 2025 at 04:58:43PM +0100, Frediano Ziglio wrote:
> On Fri, Jun 27, 2025 at 3:20=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> > So, it looks like major distributions use a patched grub version that
> > changes behavior of "linux" command. IIUC many of those patches are
> > about hardening SecureBoot, and shim-review kinda suggest using patched
> > version (many of the submissions explicitly mention the at least patch
> > grub for NX). So, I think this needs figuring out how to make your
> > approach working with grub flavor that is actually used by SB-enabled
> > distributions...
> >
>=20
> We (xenserver) would like to provide booting using separate
> hypervisor, kernel and initrd.
> Using "linux" was an old discussed option which had a nice usage.
> The merged patches allow to have a fully UKI file bundling kernel and
> initrd loaded from no-ESP partition which is nice to have.
> For the final solution I was thinking about using "xen_hypervisor" and
> "xen_module" already present for ARM. From the user perspective is
> surely less confusing than using "linux" to pass something which is
> not Linux.

In which case, loading initrd using Linux-specific grub part doesn't
make sense, no? Or is that xen_module going to use similar mechanism?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--NQ0ctA3HwDKAsDNG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhexLAACgkQ24/THMrX
1ywMOggAk29E3mJcF3bkb7YZQjihG672c4QzHADy+2pVCcJllaq3kSQuJxJWB+0z
yMkEPlaAfGaTRwVFSoIf7iIKBSO6Ay4PGnpUv5kM8sd9PTgT9EJqgUAMhBxpz2lZ
+FAIktmVogP3JzBxiAVB3/QPDmrsIMf6v3Dz/xf0mZ+G/KQKPmQEuQ6bvUMwZdpR
Ztfg53nJL6tyhTzAEexUZJdmfgPlbCpxQ9/VW4nklrAqAq8f2kmt0E713eZFzCc4
vBHc0qubmMRnSVvj9VaKF836K7IZ/Sw3maa2mcFmoWF69PQ0feptQSJObqxF+gV+
FnH7V56YOy0WEWgDoq7HNuFfGo/SLg==
=nrMT
-----END PGP SIGNATURE-----

--NQ0ctA3HwDKAsDNG--

