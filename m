Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F49A8533A2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 15:53:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679961.1057751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZu9o-0001iC-Jc; Tue, 13 Feb 2024 14:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679961.1057751; Tue, 13 Feb 2024 14:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZu9o-0001gV-Fq; Tue, 13 Feb 2024 14:53:12 +0000
Received: by outflank-mailman (input) for mailman id 679961;
 Tue, 13 Feb 2024 14:53:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zAib=JW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rZu9m-0001gP-NT
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 14:53:10 +0000
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com
 [103.168.172.147]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 988242ac-ca7f-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 15:53:07 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id E468F13800B5;
 Tue, 13 Feb 2024 09:53:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 13 Feb 2024 09:53:05 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Feb 2024 09:53:04 -0500 (EST)
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
X-Inumbo-ID: 988242ac-ca7f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1707835985;
	 x=1707922385; bh=DFfeuBoVBxksTdKSx0VpgsUDX+NEgO6od69uHWLszc0=; b=
	dcz9yctKQC0vh9OoSyvra9SoskehQuDACtmPWzo6Iury+EMkGFgqOPT8tm3hN7Sc
	rmOmnCWR5ONkEXRdRSJbwdRR1Lq+416lLvrvphTYLQElaqqzgEod/lGRDPjwlk3B
	lfKpF+BD7L1PT3Sx4zPvibiY3eogxuTvgeA0nUlPLeyaidoKw8FJE/nUldE+uFfD
	8M5fVF0nn+5CCfCv41nwawp2+fsCd2z7aHW0nMq0LIaovzIBkUoLyqcxK/y6ebvS
	R+MAkIUpxFH4YdrihzRUHfkFowNUTCQdnGdyLgOz6RglgFU+7MdmZE8HY3YVvhnf
	O9f+yWFFyeMFN3AOLxtzEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707835985; x=1707922385; bh=DFfeuBoVBxksTdKSx0VpgsUDX+NE
	gO6od69uHWLszc0=; b=vEpqm2BMOT/Dz/ZyFO5EAwtLXtwPBgt5+MN+X/bKQ+IS
	GxjY8A9m9U3rczWo9wJqSYIGnuZVjMP2QllmRZJEJZGr2u44E5sfsOklhpWsflNg
	3KVABOa3qCZsWaBaS+B2CrTG0Jcm5NQHwQO6jmsc4eMyjEfz+pIk8TWwQEnNKxxs
	4n6wItv4EEBjwGYwLPCYfqxWRQd7J0jpTtOUXDVpvMqX+6lsXXg2yCC+Ng4phx4n
	DcjipDz+vi23AVpfW+ps+iUyfQ8AH6X0lR3P/z303vIEy1bycj7HSOnFJ62UGoLb
	xAwfI3GYXilDDovNYVnAj8EgF3ZQqziO66uOBRQM7Q==
X-ME-Sender: <xms:UYLLZWJAFdVZEw8RJqE--gSe47LTjlTL0RAzT8fXLsMqU6g4ex8BhQ>
    <xme:UYLLZeKRMnCvrS6cguEGGqBztDraVZ6qy6hzjmMuaS1BeQQG9ogUhjObcsuW5ldfP
    dABrPFof4DL8Q>
X-ME-Received: <xmr:UYLLZWuBUaRqfFhbTi-Gwvh1h9DSh84oerHIUqMfmbs_PLEMakTP-PvEbpc6b5jHYMjbTd9OJ35mqGIwU9iIpTKK1b6NZSJcdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeihfelhfekhefgveejjeet
    vedtgfduveelgeekteehueeufeefudegveejueefhfenucffohhmrghinhepghhithhhuh
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:UYLLZbaogY7ggXl2BOfwWfo0ershlv-HFr79opgr4HEn8YjB5ANykg>
    <xmx:UYLLZdYd1ML_VZam_rCLaCxsGjq66F_0pVPDt-lbN95PqfFnUEC-AA>
    <xmx:UYLLZXCUTR3UKq6Ov22mKdFsCmBAGE2drAEDwCeazCF3ZW1MLDAn0g>
    <xmx:UYLLZSOCu9y3ZerXbEghDFBdbNL1NtCBCGtrrwQNt7cnUq5eSS6z-w>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 13 Feb 2024 15:53:02 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers
Message-ID: <ZcuCTnMpFib4ArHW@mail-itl>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <893be03d-22cc-4b8c-8a54-6479961c5aa2@suse.com>
 <b591cd2a-2b49-436e-9cf7-788d9064a778@xen.org>
 <4530606b-1b5e-47a4-aa41-e12e9178b06d@suse.com>
 <ZcrlcuNU9y8WymiK@mail-itl>
 <817ceec4-ed12-4360-a6ce-f87732f62251@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mt9SbzcEVrn24iEJ"
Content-Disposition: inline
In-Reply-To: <817ceec4-ed12-4360-a6ce-f87732f62251@suse.com>


--mt9SbzcEVrn24iEJ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Feb 2024 15:53:02 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers

On Tue, Feb 13, 2024 at 08:45:54AM +0100, Jan Beulich wrote:
> On 13.02.2024 04:43, Marek Marczykowski wrote:
> > On Mon, Feb 12, 2024 at 10:04:38AM +0100, Jan Beulich wrote:
> >> On 08.02.2024 23:00, Julien Grall wrote:
> >>> On 05/02/2024 13:27, Jan Beulich wrote:
> >>>> In preparation of dropping the register parameters from
> >>>> serial_[rt]x_interrupt() and in turn from IRQ handler functions,
> >>>> register state needs making available another way for the few key
> >>>> handlers which need it. Fake IRQ-like state.
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> The use of guest_cpu_user_regs() in dbc_uart_poll() is inconsistent =
with
> >>>> other console poll functions we have, and it's unclear whether that's
> >>>> actually generally correct.
> >>>
> >>> Is it? Looking at ns16550_poll() we would pass guest_user_regs() if=
=20
> >>> run_in_exception() doesn't exist. But looking at the caller, no-on se=
ems=20
> >>> to care about the 'regs'. So is this just a latent bug?
> >>
> >> What do you mean by "doesn't exist"? ns16550_poll() assumes it exists.
> >> And I can spot any use of guest_user_regs() on the respective generic
> >> or Arm-specific bug.c paths.
> >>
> >>> BTW, do you have an idea why the poll function is not run in an=20
> >>> exception handler?
> >>
> >> "The poll function" being which one? If you mean the one in xhci-dbc.c
> >> then that's why I had Cc-ed Marek. Moving him to To: - maybe that
> >> manages to finally catch his attention.
> >=20
> > TBH, I don't know. That's part of the original xue patch at
> > https://github.com/connojd/xue/blob/master/patches/xen-xue-dbgp.patch
> > and it works for me as it is.
>=20
> "Works" meaning what? Doesn't crash on you? Or does also provide
> sensible output in _all_ cases (i.e. including when e.g. the poll
> happens to run on an idle vCPU)?

Generally provides sensible output, for example during boot (it is using
idle vCPU then, right?).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--mt9SbzcEVrn24iEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXLgk4ACgkQ24/THMrX
1yxYqQf/QZCLPTxbKmXZI+CXVOH0exzR0oHacrk7Sb7hN5FhSBcbMsCiQ5HZ4IdF
eumV1VDdDKw0piFz5vnLk/X++4j9N37ySeyE26jUpzp4aB0JHzBqU+ItedpinVGe
MauH1EdhqsBJ+kKUVP5FTUQCbaLLowdsTzHl2fP07/xOTRNWXyhxiMJSLrrbuCkN
ul2kKAmkTiRCQt3pGcYo9kSEMieQOckHwhZ5TokbzlTYTEJ40Ehp15lSQmDX04an
ILN2Z6DtpimhQyUgnia6+/wgzrLXYVjkrtdYpnbe2wG4trf+Sqpv8OYlDFgiUjJN
HtDj59AJbaCgFGJvODIHlcHC3On/Aw==
=fsI6
-----END PGP SIGNATURE-----

--mt9SbzcEVrn24iEJ--

