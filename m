Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F36098363B3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 13:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669845.1042295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRtlT-0004jq-1H; Mon, 22 Jan 2024 12:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669845.1042295; Mon, 22 Jan 2024 12:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRtlS-0004i7-Ul; Mon, 22 Jan 2024 12:50:58 +0000
Received: by outflank-mailman (input) for mailman id 669845;
 Mon, 22 Jan 2024 12:50:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aFsQ=JA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rRtlR-0004hd-54
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 12:50:57 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e119d910-b924-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 13:50:55 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A0C0C5C018C;
 Mon, 22 Jan 2024 07:50:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 22 Jan 2024 07:50:53 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jan 2024 07:50:52 -0500 (EST)
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
X-Inumbo-ID: e119d910-b924-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1705927853;
	 x=1706014253; bh=bfRW3c2Zq4hjenClTikTgxLLOoMWuOS9/gMNrAcMxqM=; b=
	ICc6pDMkU8iUWS7/VMaF/VMHRoyTBUzY4BkOAz66AQsX2iIPfzt8uUde5H9Dsn3M
	fnEYvRQyJKa9OFVesyFFMRrZxi3J5fgkaVcXPS/Edsj92dn0h0bM4S+yv58v7quH
	kylO/kg1H54Du5OdgDq5fhtlFkOyvrZqNzDmCSJwCyFAVL6w8iqg3jnCUGxNthVK
	KTLACqrYPMtItzngklsDtD+ldb6KQQGbdly2ddG/hKff+OcBIbwEZ2PLHewu/pFk
	sbbBv46X0eiEUTTsrKpswuUhJU+48ds2OxF0ZHLN6bIdaDFNYVyYvssndmlfs4mW
	TsErcB/lVRG1XlnZp8wpiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705927853; x=1706014253; bh=bfRW3c2Zq4hjenClTikTgxLLOoMW
	uOS9/gMNrAcMxqM=; b=Vkg0IPeMtCn1f9NdEcoEi0z12J/8UECiT3tQa3NfKC7x
	7dMH26T3xeIZivBnlaSldFxRjms0Tejtx6zSRD8n/aq6Unj+UrZaTesItwDALstV
	7pqMvZy5Q3VHD17izjzFGsXDRvcUIGWLnKUuTEBRxwN3PLc+UzeQ8VLVTIbAGEh9
	Md9GFkgJs23/csTkJTsGfRyTDSsPQJ4t6r0disH48XmgyxC0JZ1qnvcFjz+0+6TT
	IvQOn0/7Wn7omK+P4kiNK946D0nRHQYpXxN5bZ1KSaLpvheSW+k4D2A7+V7etUUV
	EmidwNonjHG7Bjf2QPnW9xOikHajvg+pA5D71Io1jQ==
X-ME-Sender: <xms:rWSuZQZsbJnIEVfkR2kscjJz47ZebUZg4VpTdM89AN1v9wxn9caZmw>
    <xme:rWSuZbZ-tc3Z78aA54U930KsbUxFatsmUFxDWy6WuKEFNwK9yA_kj6OmZ0BRVRFJA
    gGb8unRnezD1Q>
X-ME-Received: <xmr:rWSuZa_PRkHq4tRwki-qqWqDBjot5toxOAZNz9nPpeAwahZa60-vzxOfCydMW6fTMaXV44JuL_zu_mLjLBjsLXotuCA0AEqBTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekiedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:rWSuZaoT9eVt09YmYMZ23s71Bu2BoP98vlaSoWK9_7__LUuQEEvDCg>
    <xmx:rWSuZbrf_-GXjLq9sTHnUElxSz8c0IGssj0P5nWZ-LJNfdL8HmIP5A>
    <xmx:rWSuZYT6USlc2lwn2WQPBJ8sWydpp41AGVMeQOAkP2dqDrxXpkV6QA>
    <xmx:rWSuZUAqt2R1-cCGbP11rkN4AiTK_1S4lkiNhP6MAAVkC8BoBWDU2A>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 22 Jan 2024 13:50:50 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem
Message-ID: <Za5kqtWZ4mXCFvzf@mail-itl>
References: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>
 <Za23cKyEOl1WTvhZ@itl-email>
 <CA+zSX=YNjVaGn8=kio=2iT8onHAP61pzP-dicMrr4pKJQ827gw@mail.gmail.com>
 <Za5c5pm9Qai82zvf@mail-itl>
 <CA+zSX=Zu1e1JSkje9=s5jtEsoT8vmNVhSbC3bJY5Nu-UWTA+gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M8tf+stcDvMAlpJd"
Content-Disposition: inline
In-Reply-To: <CA+zSX=Zu1e1JSkje9=s5jtEsoT8vmNVhSbC3bJY5Nu-UWTA+gw@mail.gmail.com>


--M8tf+stcDvMAlpJd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jan 2024 13:50:50 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem

On Mon, Jan 22, 2024 at 12:25:58PM +0000, George Dunlap wrote:
> On Mon, Jan 22, 2024 at 12:17=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Mon, Jan 22, 2024 at 11:54:14AM +0000, George Dunlap wrote:
> > > The other issue I have with this (and essentially where I got stuck
> > > developing credit2 in the first place) is testing: how do you ensure
> > > that it has the properties that you expect?
> >
> > Audio is actually quite nice use case at this, since it's quite
> > sensitive for scheduling jitter. I think even a simple "PCI passthrough=
 a
> > sound card and play/record something" should show results. Especially
> > you can measure how hard you can push the system (for example artificial
> > load in other domains) until it breaks.
>=20
> Are we going have a gitlab runner which says, "Marek sits in front of
> his test machine and listens to audio for pops"? :-)

Kinda ;)
We have already audio tests in qubes CI. They do more or less the above,
but using our audio virtualization. Play something, record in another
domain, and compare. Running the very same thing in gitlab-ci may be too
complicated (require bringing in some qubes infrastructure to make PV
audio work), but maybe similar test can be done based on qemu-emulated
audio or other pv audio solution?

> > > How do you develop a
> > > "regression test" to make sure that server-based workloads don't have
> > > issues in this sort of case?
> >
> > For this I believe there are several benchmarking methods already,
> > starting with old trusty "Linux kernel build time".
>=20
> First of all, AFAICT "Linux kernel bulid time" is not representative
> of almost any actual server workload; and the end-to-end throughput
> completely misses what most server workloads will actually care about,
> like latency.
>=20
> Secondly, what you're testing isn't the performance of a single
> workload on an empty system; you're testing how workloads *interact*.
> If you want ideal throughput for a single workload on an empty system,
> use the null scheduler; more complex schedulers are only necessary
> when multiple different workloads interact.

I should have clarified I meant `make -jNN`. But still, that's the same
workload on multiple vCPUs.

> FWIW this was my first stab at trying to be systematic about testing
> the scheduler:
>=20
> https://github.com/gwd/schedbench
>=20
> The rump kernel project has basically died AFAIK, so anyone trying to
> resurrect this would probably have to try to rebase that bit of it
> against something like XTF or unikernels.
>=20
>  -George

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--M8tf+stcDvMAlpJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmWuZKoACgkQ24/THMrX
1yxdOQf/fgU2PK3/aKkf52rSy8YYls9eZW5lqpAAYXzHKdVmTNEKAeRDh7MxGkLR
PpjUBaqnfOdqs9fAlt2EkM87MsE76wQ2coERlU737tbuyJJgwERfQOTG/76iMcE5
nt2b2uIxioui9iuz4qvODYJQsK8nBjojT/yKEb6RFLkAY/aG2mwH5V1zHlrbSu/F
Xb131Ik+pvYKwuPFSh3IGaEzuNuz8uz8lzzfsapOOYOQW8tqX+WrAmHilvXzXJQK
1fmOj3nAmQS6/Yhe6j+tU+KZsCazdhqwi+CaY99LmzCUwSOLZU8gHRmYy79vem1g
vQP62zH5u7HKhqesu7Ecd+7io4KCbQ==
=sCWn
-----END PGP SIGNATURE-----

--M8tf+stcDvMAlpJd--

