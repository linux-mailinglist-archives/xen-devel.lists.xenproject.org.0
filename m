Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AA55B82A7
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 10:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406838.649223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYNUG-00073B-IW; Wed, 14 Sep 2022 08:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406838.649223; Wed, 14 Sep 2022 08:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYNUG-00070V-FP; Wed, 14 Sep 2022 08:11:12 +0000
Received: by outflank-mailman (input) for mailman id 406838;
 Wed, 14 Sep 2022 08:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LQJu=ZR=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oYNUE-00070P-Ql
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 08:11:11 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c832cd89-3404-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 10:11:07 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 83D423200957;
 Wed, 14 Sep 2022 04:11:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 14 Sep 2022 04:11:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Sep 2022 04:11:03 -0400 (EDT)
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
X-Inumbo-ID: c832cd89-3404-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663143064; x=
	1663229464; bh=vj+y3+GGgkN862ndlWOKlat1PtH5lOn+JU5tw72tph0=; b=N
	YH4aj73cU3m64O3u9jKtry5EwA+L65Gn/JjPspvgZjaGpZDm0FbY0lw4pTUk8TMh
	dM1EYTXAw5vYTT1FGESool2Hk7qDbrhd1vE9m40lRS8Ij0AqV7T89ePzKvALg7xJ
	3Qr6Y9A4ZsbchVLgOltDdbsceqxNqHtgZ6ucxnULVXMr2389xXAEmgeRHa+Zx7r6
	z/FvDwgZmzYqc3HN45X7NHUxzXofOlwhwnRA0UgjpDeT/kX9NeZCLkKkbZ9mKpCZ
	ULKXgDHPl0Ek8mVEojHvy6IM1oM43c9A5A7fK8XNlyKTFxDsrDVmEEshx4wxvbDq
	3iDzloZIvGbsVSEmZlU/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663143064; x=1663229464; bh=vj+y3+GGgkN862ndlWOKlat1PtH5
	lOn+JU5tw72tph0=; b=XrBN0xQ6L9jjnWfbuC3d1J8qUMrnn/I3VWdR1e5/EJ+F
	x9BkA9sns7utmFB0n8JzfFErRBxe8jeagzbhLC/qCIHzbDEUibFLnMvQ5KLTwOR/
	BdY0hUi4dtyLmsiRtFHWeqt3B3cUFsIO56s5Wbs/ld7GUyQ6mPZHbn+1XtOuWqs8
	B8Pb9ns5bnG99A/vC1CeASkw193V3q7ZSlDOQ1MsMj9PYCAw3We7Kc4beiMn1rJs
	IIEC0d2mQRZTyycY5Vzb64CQ+z8zRUMpagy+XKW/mL9LZLEhV6HHNMbIddJ7/Hra
	FJTHCcPveZVI+e4Wq/SPhrj8+psRtk51nGBEHQOQZw==
X-ME-Sender: <xms:l4whYzP269NaM8yDi8sftCnF2iMqTLLnYY-Z-frqRHhkvldhG6VC5Q>
    <xme:l4whY9_Bo7PpBMb18c0dXdy4dkCWxuwCBowfjMLERDMDthtDET8qWrhBEHABrqppw
    9Hbu8NpdOMu-Rk>
X-ME-Received: <xmr:l4whYyQ-3K8ZctERpmJV0qBDEllO1jTAIAmkTj0OFujx1BDi4tj9gTxLgr5m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduiedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleefjeeukeehkeegiedtgeekkeel
    tedvhfduudefgfffheffheeuvedvieelfefhnecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
    vghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:l4whY3s5robtheEfU8gmWqHcdgV3KyvNbUYCYWMq3B-0vJzCsBj8ew>
    <xmx:l4whY7e_esMvWPe56FackwgsAB4ies-WOrSeOrVOavOU9KaQtqLX_A>
    <xmx:l4whYz2nHHObYxTIMLHQ771mMI0PJf0v76t0RYYuVK3TH4t7lIaWeg>
    <xmx:mIwhY8psI4uofVdowgsaxPTmYJtuYPitbew5qde3oTiYJRxhfnKb5w>
Feedback-ID: iac594737:Fastmail
Date: Wed, 14 Sep 2022 04:10:58 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: Setting constant-time mode CPU flag
Message-ID: <YyGMlWI48qIyULH6@itl-email>
References: <1d7b9e30-975b-b49f-fe09-e2aeda9e2af6@suse.com>
 <1b85702f-7efd-b13f-40d4-615750e20f4c@citrix.com>
 <YyCSIxyH4hDmTXIh@itl-email>
 <037151d0-0920-5d99-9932-df044729c00a@suse.com>
 <YyC8PMxsQyRp07vW@itl-email>
 <61f083c8-34c7-563b-b010-8d8d0286da6a@suse.com>
 <YyF3UoneRmBGQSHo@itl-email>
 <62f0ebdb-d06b-f361-40e9-711258c03a56@suse.com>
 <YyF+mRpYDxEPG/59@itl-email>
 <b6e399a4-a5b4-0b70-313e-f5b07136c00b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o8v6Zj3B0DGUQAn1"
Content-Disposition: inline
In-Reply-To: <b6e399a4-a5b4-0b70-313e-f5b07136c00b@suse.com>


--o8v6Zj3B0DGUQAn1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Sep 2022 04:10:58 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: Setting constant-time mode CPU flag

On Wed, Sep 14, 2022 at 09:32:20AM +0200, Jan Beulich wrote:
> On 14.09.2022 09:11, Demi Marie Obenour wrote:
> > On Wed, Sep 14, 2022 at 08:44:25AM +0200, Jan Beulich wrote:
> >> On 14.09.2022 08:40, Demi Marie Obenour wrote:
> >>> On Wed, Sep 14, 2022 at 08:36:02AM +0200, Jan Beulich wrote:
> >>>> On 13.09.2022 19:22, Demi Marie Obenour wrote:
> >>>>> On Tue, Sep 13, 2022 at 04:47:24PM +0200, Jan Beulich wrote:
> >>>>>> On 13.09.2022 16:22, Demi Marie Obenour wrote:
> >>>>>>> On Tue, Sep 06, 2022 at 10:01:00AM +0000, Andrew Cooper wrote:
> >>>>>>>> On 06/09/2022 10:52, Jan Beulich wrote:
> >>>>>>>>> On 02.09.2022 04:05, Demi Marie Obenour wrote:
> >>>>>>>>>> On Intel chips (Ice Lake and later) and ARM64, a bit needs to =
be set in
> >>>>>>>>>> a CPU register to enforce constant-time execution.  Linux plan=
s to set
> >>>>>>>>>> this bit by default; Xen should do the same.  See
> >>>>>>>>>> https://lore.kernel.org/lkml/YwgCrqutxmX0W72r@gmail.com/T/ for=
 details.
> >>>>>>>>>> I recommend setting the bit unconditionally and ignoring guest=
 attempts
> >>>>>>>>>> to change it.
> >>>>>>>>> I don't think we ought to set it by default; I can see reasons =
why kernels
> >>>>>>>>> may want to set it by default (providing a way to turn it off).=
 In Xen
> >>>>>>>>> what I think we need is exposure of the bit to be guest-control=
lable.
> >>>>>>>>
> >>>>>>>> We absolutely should not have it set by default.=C2=A0 It's a su=
bstantial
> >>>>>>>> overhead for something that is only applicable to code which oth=
erwise
> >>>>>>>> crafted to be constant-time.
> >>>>>>>
> >>>>>>> Either Xen needs to set the bit by default, or guests need to bot=
h know
> >>>>>>> the bit needs to be set and be able set it.  Otherwise code that =
*is*
> >>>>>>> intended to be constant-time has no way to protect itself.
> >>>>>>>
> >>>>>>>> As for why Xen doesn't enumerate/virtualise it, that's because
> >>>>>>>> virtualising MSR_ARCH_CAPS for guests is still not working yet, =
so the
> >>>>>>>> feature can't be enumerated yet even if we did support context s=
witching it.
> >>>>>>>
> >>>>>>> Intel and ARM64 guarantee that CPUs that do not enumerate this fl=
ag
> >>>>>>> behave as if it is set unconditionally.
> >>>>>>
> >>>>>> I'm not qualified to talk about the Arm side, but may I ask what y=
ou've
> >>>>>> derived this statement from for Intel? The doc page referenced by =
the
> >>>>>> link you did provide (still in context above) specifically further=
 links
> >>>>>> to a page listing instruction with data operand independent timing=
=2E All
> >>>>>> other instructions, as I conclude, have variable timing unless the=
 bit
> >>>>>> in ARCH_CAPS enumerates DOITM and then the new MSR bit (of the sam=
e name)
> >>>>>> is set.
> >>>>>
> >>>>> My understanding is that only instructions in the constant-time sub=
set
> >>>>> are ever guaranteed to be constant time.
> >>>>
> >>>> Hmm, yes, I did overlook respective wording in the doc.
> >>>>
> >>>>>  On architectures where DOITM
> >>>>> is not enumerated, this guarantee is unconditional.
> >>>>
> >>>> I have to admit I'm suspicious of this "guarantee".
> >>>
> >>> Do you mean that previous CPUs had a vulnerability that has no fix?
> >>
> >> I'm not sure I'd call it a vulnerability, but at least if going back f=
ar
> >> enough in history I think you'll find insns on the list which don't ha=
ve
> >> invariant timing. Like with other documentation on e.g. speculation
> >> issues I take it that Intel simply doesn't consider sufficiently old
> >> CPUs relevant anymore for such new documents.
> >=20
> > Any examples?
>=20
> The one I easily recall in truly ancient, so maybe of only limited
> significance: MUL on 486 and older.

That is of very limited significance indeed.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--o8v6Zj3B0DGUQAn1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMhjJUACgkQsoi1X/+c
IsHb4BAA3vCukiveJqUMGaIJMHSSaKsVGzvUMg9O0Z0X9Ki4ymVUo9EmmsYn3fn9
IuGNGfQXRswhr9nLs2vmVMIJWK6UcA7K8uGTB7kqHmJymoFkwTq9xgZjb4hgovEi
1v/I5Gdj2RNZsH3zfTMbdISVRdBziiLXgRCYMdb3+82dTmNDmL70I30lWB5/uS1F
/2bSUWAzIVNkblb92M2ZW1xDTGVTdFN1KtF7aN+IyyuW4GHk8OtUMKSHDh1gnELX
taVXy4gku9a3rxxYpdZPr1A7ktCXH+z17nZKyhdKhrzQzEjTix79dTzTNMiCj0ti
gD4QrYwKu4JbcHiqjGIziVdc2tcL+gDqPX/aYr7GvOCp0YW4GQkqxdgEeehUX27d
S6rqNF6mSSdRgsCNv3NbtaVQLwQ/oC5dIpIcA3JUflIp1Zr7/ancXyiV29qddvOp
q2v+GgxG+6zVwc9hWfL+oBdy+SETh1HO5+KTv6nWSY4DPWflJ4q3Gq5lOcDIdlMD
FJz+UpFLDFpYnwUC7sU/JPTWSOR4IqWTZVX26eUEOxClkVqjIIAvJuWs1PQmBI5W
eHKGU5n/0nzuWsS9Y8+q+r+1bdzS/MEkROU8ZTW+Fi6qGcrZikBPqPOB8lJEmeRR
KOdHgBOLGYF3v48oG79OuWy5mBQpqnAniLzGLkToE6KcBcNwcmo=
=WFDs
-----END PGP SIGNATURE-----

--o8v6Zj3B0DGUQAn1--

