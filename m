Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317841EF65A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 13:20:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhAN5-0005az-Fi; Fri, 05 Jun 2020 11:18:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wSaP=7S=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jhAN3-0005au-M6
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 11:18:46 +0000
X-Inumbo-ID: 51c78c8a-a71e-11ea-af9f-12813bfff9fa
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51c78c8a-a71e-11ea-af9f-12813bfff9fa;
 Fri, 05 Jun 2020 11:18:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 049FC5C012C;
 Fri,  5 Jun 2020 07:18:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 05 Jun 2020 07:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8tbOzL
 dqHoqtee8s7JzdRooeTy5fY0jAVkxsEy3PYkU=; b=jreeL1NDetYYbk51rbHgXV
 rKJXOfwAJA8R9G/uwNkpUeTyY7COvHoH1GbsuKa5KaJbKyOckwgGQ2Wmbyi9ycRI
 zO0rbnh9Mn8507alpSSV4cduv8kxEb8qoindgeyQxMihHXw9YeqUG4wrxCrdSKtD
 n8m6hMU8F8rNKu8jkrDrz9NGh4R/R1krWFma6MjoW23Al4esnV6jUbpp3Fs+R3C0
 ShwTDcfgOqykoRs+CQh8+R/NOoMBd4o6knvt85BCiEWIsFf45uL7SnODJ8RcifoW
 HvkwzGHpGrXjswbvXGu9S0fbWLNU4Vnf2QB2jNtskZ+yQW1ftDPLPZswSBo2dQEg
 ==
X-ME-Sender: <xms:FCraXjUFHxl4XrJB3zVzXqvB8qMIwdmESRfsXJXiL1EhE34aeQFeqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegfedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekgedt
 gfdvieehhfehtddvleeiieeuteevheetffejjeejvdeijeevhfeufeefgeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmnecukfhppeeluddrieehrdefgedrfeefnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghkse
 hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:FCraXrnxtJtp1pfAmNp_sllHJQIK71mNG9tJ_qxSCEcvceduHaHEEA>
 <xmx:FCraXvZ5IxkCjF05G9TUuGubL2_id69U76T_Z8czBgxMOYcypJELbg>
 <xmx:FCraXuVdWZszDw1Z6B6CYzkpS1f3nuUMQ7IcFuH9cnPLBRAzgIFaNA>
 <xmx:FSraXvnhTxxXaaQ-icBJR71w-_p2mGmMzVq2wQwvbGRTN8O9IbMbtg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 57AEE328005A;
 Fri,  5 Jun 2020 07:18:44 -0400 (EDT)
Date: Fri, 5 Jun 2020 13:18:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
Message-ID: <20200605111840.GE98582@mail-itl>
References: <20200604014621.GA203658@mail-itl>
 <e9c6dba3-2780-b155-5b12-3eb44dc31957@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/7F8UcOhwbEJvS7n"
Content-Disposition: inline
In-Reply-To: <e9c6dba3-2780-b155-5b12-3eb44dc31957@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--/7F8UcOhwbEJvS7n
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom

On Fri, Jun 05, 2020 at 11:38:17AM +0200, Jan Beulich wrote:
> On 04.06.2020 03:46, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > (continuation of a thread from #xendevel)
> >=20
> > During system shutdown quite often I hit infinite stream of errors like
> > this:
> >=20
> >     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
> >     (XEN) domain_crash called from io.c:178
> >=20
> > This is all running on Xen 4.13.0 (I think I've got this with 4.13.1
> > too), nested within KVM. The KVM part means everything is very slow, so
> > various race conditions are much more likely to happen.
> >=20
> > It started happening not long ago, and I'm pretty sure it's about
> > updating to qemu 4.2.0 (in linux stubdom), previous one was 3.0.0.
> >=20
> > Thanks to Andrew and Roger, I've managed to collect more info.
> >=20
> > Context:
> >     dom0: pv
> >     dom1: hvm
> >     dom2: stubdom for dom1
> >     dom3: hvm
> >     dom4: stubdom for dom3
> >     dom5: pvh
> >     dom6: pvh
> >=20
> > It starts I think ok:
> >=20
> >     (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> >     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> >     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> >     (XEN) d3v0 handle_pio port 0xb004 write 0x0001
> >     (XEN) d3v0 handle_pio port 0xb004 write 0x2001
> >     (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
>=20
> I can't seem to be able to spot the call site of this, in any of
> qemu, libxl, or libxc. I'm in particular curious as to the further
> actions taken on the domain after this was invoked: Do any ioreq
> servers get unregistered immediately (which I think would be a
> problem)?

It is here:
https://github.com/qemu/qemu/blob/master/hw/i386/xen/xen-hvm.c#L1539

I think it's called from cpu_handle_ioreq(), and I think the request
state is set to STATE_IORESP_READY before exiting (unless there is some
exit() hidden in another function used there).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--/7F8UcOhwbEJvS7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl7aKhEACgkQ24/THMrX
1yxDHAf+NCJzXnzBD4v148UxdvvTkENOTAZwdNbopbDpxkG1z+EcUES6FBtF1AGa
oEeKB0MXVTZWCbiIrKe1LiiToeAJx+8eQH8xCXTGPezNOFC8OYPuc57I6lkY4q6k
UvvWOv+d5bwe+aos3bp5PZvMptEwMdvG9S6fVURWRPgpP6rVkRRS6eA94fBnChEP
y8gOkq/617gZ6kAR1Dvys0RJ0m0IIqEAKeBJWLMgZ4eKTSg+aE/mayNIP9LhWvWM
rCJDKu6Jc80Lfr2Dq8Uzqq44KY5DwfANZSOq1umSqkUPtByOhOYFQssjhenIjNd1
RrcDYzjpdllQklL/6INmW3E+oaSE7A==
=lyNc
-----END PGP SIGNATURE-----

--/7F8UcOhwbEJvS7n--

