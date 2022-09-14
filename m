Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7945B81D7
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 09:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406818.649201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYMYX-0008Bk-DJ; Wed, 14 Sep 2022 07:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406818.649201; Wed, 14 Sep 2022 07:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYMYX-00088n-Ae; Wed, 14 Sep 2022 07:11:33 +0000
Received: by outflank-mailman (input) for mailman id 406818;
 Wed, 14 Sep 2022 07:11:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LQJu=ZR=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oYMYV-00088h-FE
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 07:11:31 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 723e52f9-33fc-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 09:11:28 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 7DB2132005BC;
 Wed, 14 Sep 2022 03:11:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 14 Sep 2022 03:11:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Sep 2022 03:11:23 -0400 (EDT)
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
X-Inumbo-ID: 723e52f9-33fc-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663139484; x=
	1663225884; bh=surybMSUyy8slcdQIfJp1hbkyOSBYEO9RZYrDRimR3s=; b=p
	upZWJr0YX577GGczG2cHf6tLTM/FxiqJYT9bNZEHo6tOube5JYJ0cTVMyiAWBcCo
	OcEKnliVyEkg2lrSyviyBOihVbigdeGnmph0u4zcEo34r5LhlxEF4cLWPDlzT5m3
	iF+nvX4oI7Ht+HiPWK5hTgk6sjHgm8PMJONXEMyRn/618qZtw7p+uiTAadGU2fV8
	/ty7idRNsQiAEmFgzt71/hb46TB73+xB0PwGWJjz/IqoMxZpDKZJFOpwvvpB+L22
	BXfIqkdPwdOa0nBC+fXKbfTdA4Ps8uNqLV9BXnLxpnpfRF6GD/mfcwzZac/uz1P0
	ocllfcjWPfpyKer0ApvXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663139484; x=1663225884; bh=surybMSUyy8slcdQIfJp1hbkyOSB
	YEO9RZYrDRimR3s=; b=ZsnL3CcIjh/mDMLFcjTLZmDsHsEiDhpbWZHLDJgkdRCm
	eHqrjLar0QSm/bJpF/4ASEanPT5ECWdcZHThZM8G0OgXjMJgbG5os/W9YjUR4WPQ
	c0+00Jzdiil8p7IDoAsyuYDvkd9dqxr7lofFz6YkLitaijpVoyPzmWjw4ULBoPZj
	17YtJoOQK+gbkBXSrfjYhmcLLS0yDTRrMdc91dMCRAYXF332iT6S1MGGtYxm8sQv
	SraTh4TH2JsNtS3+eHnLBXIAXpLyC70pFSsqYbsr/zFEQ9GcprblFw31l5yr9Lkj
	cM2KlA+UgKoXRbOEZkAUR7HjvzQxxOOl2gl5iUH1lA==
X-ME-Sender: <xms:m34hY3NTX2q6BaQWGwkc3zYpIhaokldSoXy1bGQiX31nkAPlHE8Qbg>
    <xme:m34hYx_2id9GRM4tvE3wgzwMAEYHeBG300CR_3bStN_JfupkvUuoeSfal8SPOQcxx
    GsumSjuIiUTLfU>
X-ME-Received: <xmr:m34hY2T90d7tId-PqGiJXRvfKPe8EtjeQabVa2ecoMp3Raw27tpmFG7Wx2ii>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduhedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelfeejueekheekgeeitdegkeek
    leetvdfhuddufefgffehffehueevvdeileefhfenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    uggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:m34hY7snJB6246ZUFI5EbRIYm2aO0R30l1_8aNV0aIuSgU5_fiwRpA>
    <xmx:m34hY_ewvld7_SWOfEKUdcSIEHDMHxKNYZIiNMEmkp26fPX23WHNOQ>
    <xmx:m34hY33fyYXqbqMzGeAXfQ4NTUS0KRtFclFSrxrsYvIrmx2bq9UPRw>
    <xmx:nH4hYwpG_HiO0uZxLYoQckVfY2uD6l8mq9wBB5ZuViFqOta75Au2Nw>
Feedback-ID: iac594737:Fastmail
Date: Wed, 14 Sep 2022 03:11:19 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: Setting constant-time mode CPU flag
Message-ID: <YyF+mRpYDxEPG/59@itl-email>
References: <YxFk2GaIQVCAFsyi@itl-email>
 <1d7b9e30-975b-b49f-fe09-e2aeda9e2af6@suse.com>
 <1b85702f-7efd-b13f-40d4-615750e20f4c@citrix.com>
 <YyCSIxyH4hDmTXIh@itl-email>
 <037151d0-0920-5d99-9932-df044729c00a@suse.com>
 <YyC8PMxsQyRp07vW@itl-email>
 <61f083c8-34c7-563b-b010-8d8d0286da6a@suse.com>
 <YyF3UoneRmBGQSHo@itl-email>
 <62f0ebdb-d06b-f361-40e9-711258c03a56@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CD7E7MzccNHbMBkD"
Content-Disposition: inline
In-Reply-To: <62f0ebdb-d06b-f361-40e9-711258c03a56@suse.com>


--CD7E7MzccNHbMBkD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Sep 2022 03:11:19 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: Setting constant-time mode CPU flag

On Wed, Sep 14, 2022 at 08:44:25AM +0200, Jan Beulich wrote:
> On 14.09.2022 08:40, Demi Marie Obenour wrote:
> > On Wed, Sep 14, 2022 at 08:36:02AM +0200, Jan Beulich wrote:
> >> On 13.09.2022 19:22, Demi Marie Obenour wrote:
> >>> On Tue, Sep 13, 2022 at 04:47:24PM +0200, Jan Beulich wrote:
> >>>> On 13.09.2022 16:22, Demi Marie Obenour wrote:
> >>>>> On Tue, Sep 06, 2022 at 10:01:00AM +0000, Andrew Cooper wrote:
> >>>>>> On 06/09/2022 10:52, Jan Beulich wrote:
> >>>>>>> On 02.09.2022 04:05, Demi Marie Obenour wrote:
> >>>>>>>> On Intel chips (Ice Lake and later) and ARM64, a bit needs to be=
 set in
> >>>>>>>> a CPU register to enforce constant-time execution.  Linux plans =
to set
> >>>>>>>> this bit by default; Xen should do the same.  See
> >>>>>>>> https://lore.kernel.org/lkml/YwgCrqutxmX0W72r@gmail.com/T/ for d=
etails.
> >>>>>>>> I recommend setting the bit unconditionally and ignoring guest a=
ttempts
> >>>>>>>> to change it.
> >>>>>>> I don't think we ought to set it by default; I can see reasons wh=
y kernels
> >>>>>>> may want to set it by default (providing a way to turn it off). I=
n Xen
> >>>>>>> what I think we need is exposure of the bit to be guest-controlla=
ble.
> >>>>>>
> >>>>>> We absolutely should not have it set by default.=C2=A0 It's a subs=
tantial
> >>>>>> overhead for something that is only applicable to code which other=
wise
> >>>>>> crafted to be constant-time.
> >>>>>
> >>>>> Either Xen needs to set the bit by default, or guests need to both =
know
> >>>>> the bit needs to be set and be able set it.  Otherwise code that *i=
s*
> >>>>> intended to be constant-time has no way to protect itself.
> >>>>>
> >>>>>> As for why Xen doesn't enumerate/virtualise it, that's because
> >>>>>> virtualising MSR_ARCH_CAPS for guests is still not working yet, so=
 the
> >>>>>> feature can't be enumerated yet even if we did support context swi=
tching it.
> >>>>>
> >>>>> Intel and ARM64 guarantee that CPUs that do not enumerate this flag
> >>>>> behave as if it is set unconditionally.
> >>>>
> >>>> I'm not qualified to talk about the Arm side, but may I ask what you=
've
> >>>> derived this statement from for Intel? The doc page referenced by the
> >>>> link you did provide (still in context above) specifically further l=
inks
> >>>> to a page listing instruction with data operand independent timing. =
All
> >>>> other instructions, as I conclude, have variable timing unless the b=
it
> >>>> in ARCH_CAPS enumerates DOITM and then the new MSR bit (of the same =
name)
> >>>> is set.
> >>>
> >>> My understanding is that only instructions in the constant-time subset
> >>> are ever guaranteed to be constant time.
> >>
> >> Hmm, yes, I did overlook respective wording in the doc.
> >>
> >>>  On architectures where DOITM
> >>> is not enumerated, this guarantee is unconditional.
> >>
> >> I have to admit I'm suspicious of this "guarantee".
> >=20
> > Do you mean that previous CPUs had a vulnerability that has no fix?
>=20
> I'm not sure I'd call it a vulnerability, but at least if going back far
> enough in history I think you'll find insns on the list which don't have
> invariant timing. Like with other documentation on e.g. speculation
> issues I take it that Intel simply doesn't consider sufficiently old
> CPUs relevant anymore for such new documents.

Any examples?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--CD7E7MzccNHbMBkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMhfpkACgkQsoi1X/+c
IsFiBA//a1D+TXFlmwZYEv6h3uSCsG/cG/yuVbs9ISkcLg6zETnQPbW/4/yOfGjy
4f6ayvxgdoHwP6PljQbbHyrNnjm3VTinibBWWQwag+G9zZi08gRpiHScVkYeuAAT
V4HT8ujRcZ9Qqh8xw5XofQcRcekb4cSCOKBcmIlw0a11AY7HKLZTp482ciZ2kUMV
tot6pJldlTAWvfMF4OiZw5usbnWi2texJ5ShNkZBgSF/kf+14Cpo/Jw4CMtDGnIh
eu2KF2cydLnSBU+JybU3VgI2xbt1YhDMOxMbwe+ctFlQxs4xpsysDcILnx6Jp/yk
GGp15AZgf54U09pjwSobLKjbdpZiC8wvfr2VRF2+ZNOSq//eU438WUPuOK3uznlE
dfi0UNSWSd2Kqfxms6SCZQ6t3RygeFVNtnEzAAj0jIAqOZcWC++hzkc8LSMx3jXx
5HdHCFuFSg1Y9QRqBatSXnt205iCXJDwSmlY3H8cZXGo0rZ2PJa4rfTIqcjfoths
zmjhs9dWMnXZQTpTmlXrRV5ivM/SFdGpfUBDU7jFm7ubjxK818DvyeAQ6sxhJzH/
5337Emu9ezrjeKplXQL9T+iXVTOf/wK0Mzgdv+YthZgpwvyVdWOVzbGIHyRwbuhC
lUZZePZQsjrR/aoCH1ptXhWJjKQ/moQ6g3foEmWCbG4X2yNho5M=
=zAVR
-----END PGP SIGNATURE-----

--CD7E7MzccNHbMBkD--

