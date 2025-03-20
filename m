Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C84A6ABFD
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 18:29:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923023.1326770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvJhh-0000RK-S8; Thu, 20 Mar 2025 17:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923023.1326770; Thu, 20 Mar 2025 17:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvJhh-0000Po-Oe; Thu, 20 Mar 2025 17:29:13 +0000
Received: by outflank-mailman (input) for mailman id 923023;
 Thu, 20 Mar 2025 17:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W2V2=WH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tvJhg-0000Pi-Hv
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 17:29:12 +0000
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4ae5079-05b0-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 18:29:10 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 1464D2540146;
 Thu, 20 Mar 2025 13:29:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 20 Mar 2025 13:29:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 13:29:05 -0400 (EDT)
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
X-Inumbo-ID: d4ae5079-05b0-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742491747;
	 x=1742578147; bh=dP6EDAIzxBmMqsd8P5v8c+8bUHQbplQJJ+arzKRHh7A=; b=
	nt35H4wnYXEcBMTfpBuz5zpNMfpeecq7+v2h9USWsXiB+31sueynQGayNfGg7Ath
	N38YGo9ZcAHy8gEkHH73Iufa9tZ6BCby2bZ2U48sICZXtMbKM6iI/WMuKwLrp/TA
	9fabV4PDD/OgYbPbyrtskt2nAczdtvg1UdgvpqwDtYF6xbX/DCBDJYvxEpbyHYZg
	tSBrlTRLZ5gnytz+XqWsI/rOpAZdlEOfzVqU6bB3XfMKtyR+cSO/7BPbxSXx7KLm
	Bbzor/+om3vOvlenj5lekIB/+8FybJGJLbWX+5RXzzKPYQgXwbFk3q5TElx7kQva
	N7/vNAynUj9yrPDjJzA2Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742491747; x=1742578147; bh=dP6EDAIzxBmMqsd8P5v8c+8bUHQbplQJJ+a
	rzKRHh7A=; b=ab5AIeO3/zoaOfH5PTkNPFuaoACZxg80bqHavqjIf63talb68gq
	l8t37C2oZqXdkAykRh9gMz/yzgYK81NXDtspviGRe6eJx1Werfjj5lhBvzZQ5k9A
	RqXLyIZReqEUgardyHsae4smr/n/OYXrIzjWy1ObMZt1WvCqKqzV3fTxjpWto4DR
	+ZatuRsBY6WZ4JdWKhMxkEc+kYws3Z3ZKzwxjA8gcgh3pxO6bJF2mkhTQEm1lJMn
	M7BQS0D92FsnfsQa/ro6VJ8r+iQE3eLBo3xJifGLc0BEMkmQUZOwToW3J5GmDEmx
	Euqrp2ODb7sU9t1WbKisdiZTYXi6huh8Bdw==
X-ME-Sender: <xms:Y1DcZ_748cyHclG5yF3CBR6treqlVB9BjNhP-cbW4DMUNhlyxksDfw>
    <xme:Y1DcZ05U2b4q_KUXKUl1KBSsCG3RsmAhrJGurr4at47gFatALfQRRhOxR-VlWODX-
    l0EdzAg8l-FIg>
X-ME-Received: <xmr:Y1DcZ2dRj9dw9llumsvNI0TNl6thNFXIKMzDSBgwsRje_14U1Tr9tZsGRSMEndQzcmvdLO52W6Mi5xtCwNaPPOgPBfL1opb0qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgs
    vghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrg
    hrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepfhhrvgguvghrihgtrdhpihgvrhhr
    vghtsehquhgsvghsqdhoshdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvg
    hrfeestghithhrihigrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegr
    mhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtoh
    eprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:Y1DcZwKf_yyFWmaPdFCewHmD0id6settzGcwsNRIK9MG8VHiUtBMHw>
    <xmx:Y1DcZzJEzl8EXLMXLGV0yWK_ovpI0VnG6aav4zEaXf8_qAoFkfG0wQ>
    <xmx:Y1DcZ5yRFtdXSLzrZljXa4oxKdmdrqwpAJjqiNoita9g_ieLA-1gGA>
    <xmx:Y1DcZ_K429ETctpnkjjeef_zh6eNm_xAjzCT1ozGAUXZNdQFsHze9Q>
    <xmx:Y1DcZ0WEIlYVgqyYt0J4ENTuzxtpT2OdIzlaFS_7Zg0DUZEkLW2pJZ-q>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 20 Mar 2025 18:29:03 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
Message-ID: <Z9xQYKa1UOXw6u3J@mail-itl>
References: <Z9wPVGd0fEsbaO_s@mail-itl>
 <a9831a95-2828-4b46-8cae-58b2c531f507@suse.com>
 <Z9wfKB0vdngn3xXX@mail-itl>
 <Z9wnzRbwb3HQaSMu@l14>
 <Z9wxcYapF5eno29b@mail-itl>
 <7698a70a-db0a-4d5d-b5ad-8c0636bc5a33@suse.com>
 <Z9w1BLntGv4ksws0@mail-itl>
 <fb116d7e-e678-4ac9-920a-de7e5b227417@suse.com>
 <Z9w7PPEbF1STQNBt@mail-itl>
 <19a66aaa-e3e8-43be-a988-14586c2fd71b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H0U/lCevOfb54q/S"
Content-Disposition: inline
In-Reply-To: <19a66aaa-e3e8-43be-a988-14586c2fd71b@suse.com>


--H0U/lCevOfb54q/S
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Mar 2025 18:29:03 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86

On Thu, Mar 20, 2025 at 05:09:12PM +0100, Jan Beulich wrote:
> On 20.03.2025 16:58, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Mar 20, 2025 at 04:48:02PM +0100, Jan Beulich wrote:
> >> On 20.03.2025 16:32, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Thu, Mar 20, 2025 at 04:21:18PM +0100, Jan Beulich wrote:
> >>>> On 20.03.2025 16:17, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>> On Thu, Mar 20, 2025 at 02:35:59PM +0000, Anthony PERARD wrote:
> >>>>>> On Thu, Mar 20, 2025 at 02:59:04PM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> >>>>>>> On Thu, Mar 20, 2025 at 02:49:27PM +0100, Jan Beulich wrote:
> >>>>>>>> On 20.03.2025 13:51, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>>>>>> On Thu, Mar 20, 2025 at 10:18:28AM +0000, Anthony PERARD wrote:
> >>>>>>>>>> On Wed, Mar 19, 2025 at 02:40:33PM +0100, Marek Marczykowski-G=
=C3=B3recki wrote:
> >>>>>>>>>>> There are clearly some build path embedding left. And
> >>>>>>>>>>> -ffile-prefix-map=3D/-fdebug-prefix-map=3D doesn't work corre=
ctly with
> >>>>>>>>>>> XEN_ROOT having xen/.. at the end.
> >>>>>>>>>>> BTW, would it be acceptable to have this?
> >>>>>>>>>>>
> >>>>>>>>>>>     $(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(rea=
lpath $(XEN_ROOT))=3D.)
> >>>>>>>>>>
> >>>>>>>>>> Hi,
> >>>>>>>>>>
> >>>>>>>>>> Could you avoid using $(XEN_ROOT) in hypervisor build system? =
(It's fine
> >>>>>>>>>> in "tools/"). In "xen/", there's a few variables you can use i=
f they are
> >>>>>>>>>> needed: $(abs_objtree) $(abs_srctree) for absolutes path, and =
$(srctree)
> >>>>>>>>>> $(objtree) for relative path. That also should avoid the need =
to use
> >>>>>>>>>> $(realpath ).
> >>>>>>>>>
> >>>>>>>>> XEN_ROOT is literally "$(abs_srctree)/..". And I need to resolv=
e it to
> >>>>>>>>> not have /.. for prefix-map to work correctly. Would it be bett=
er to use
> >>>>>>>>> literal $(realpath $(abs_srctree)/..)? Or use just $(abs_srctre=
e) and
> >>>>>>>>> have paths in debug symbols relative to hypervisor source dir, =
instead
> >>>>>>>>> of xen repo root? I'm not sure if that wouldn't confuse some to=
ols...
> >>>>>>>>
> >>>>>>>> abs_srctree being computed using realpath, can't we replace
> >>>>>>>>
> >>>>>>>> export XEN_ROOT :=3D $(abs_srctree)/..
> >>>>>>>>
> >>>>>>>> by something as simpl{e,istic} as
> >>>>>>>>
> >>>>>>>> export XEN_ROOT :=3D $(patsubst %/xen,%,$(abs_srctree))
> >>>>>>>>
> >>>>>>>> ?
> >>>>>>>
> >>>>>>> That works too. It's slightly less robust, but I don't expect "xe=
n"
> >>>>>>> directory to be renamed, so shouldn't be an issue. I'll leave als=
o a
> >>>>>>> comment there why not /.. .
> >>>>>>
> >>>>>> I don't think $(XEN_ROOT) is present in the binaries produce by the
> >>>>>> hypervisor's build system. There's only a few use if that variable=
: to
> >>>>>> load some makefile, to execute makefile that build xsm policy and =
to
> >>>>>> generate cpuid-autogen.h. Otherwise I don't think the compile have=
 this
> >>>>>> path in the command line. What is going to be in the binary is
> >>>>>> $(abs_srctree), which you can replace by "./xen" if you want; whic=
h mean
> >>>>>> it doesn't matter if the directory is renamed or not. You might wa=
nt to
> >>>>>> also take care of $(abs_objtree) which seems to also be in `xen-sy=
ms`
> >>>>>> when doing out-of-tree build.
> >>>>>
> >>>>> So, you suggest to do -fdebug-prefix-map=3D$(abs_srctree)=3D./xen ?=
 That
> >>>>> appears to work for in-tree builds too.
> >>>>
> >>>> And why ./xen (question to Anthony)? Just . is quite fine, isn't it?
> >>>
> >>> It makes paths in debug symbols relative to xen/ subdir, not the
> >>> repository root. I'm not sure if that is a problem, but it may be for
> >>> some tools.
> >>
> >> Yet especially in the symbol table (and hence in strack traces) that's
> >> unnecessary extra space it takes up.
> >>
> >>>>> But now I actually tested how it looks with out-of-tree builds, and
> >>>>> indeed $(abs_objtree) is embedded there too. Adding
> >>>>> -fdebug-prefix-map=3D$(abs_objtree)=3D./xen appears to help for thi=
s. But,
> >>>>> -fdebug-prefix-map doesn't help with abs_srctree in out-of-tree bui=
lds
> >>>>> for some reason. -ffile-prefix-map does. And so does -fdebug-prefix=
-map
> >>>>> + -fmacro-prefix-map. Is there any preference which one to use? It
> >>>>> appears as -fmacro-prefix-map and -ffile-prefix-map have the same
> >>>>> availability in both GCC (8) and Clang (10).
> >>>>
> >>>> Then the simpler -ffile-prefix-map is better, imo. Question then is
> >>>> whether any of the options is actually needed at all for in-tree bui=
lds.
> >>>
> >>> Yes, without any of those options, both xen-syms and xen.efi contain
> >>> full source path.
> >>
> >> Even in builds without debug info?=20
> >=20
> > For in-tree build without debug info, it appears no. But with debug
> > info, something is needed even for in-tree build.
> > And BTW, IIUC out-of-tree builds will become relevant even for in-tree
> > build at some point, due to pvshim.
>=20
> That hasn't happened yet because it's not quite straightforward to arrange
> for.

Sure, but if it will happen at some point, even users doing in-tree
build would benefit from options that normally would be relevant only
for out-of-tree builds. So, it's IMO valuable to attempt make
out-of-tree builds reproducible too.

> >> Imo a goal ought to be to specify the
> >> weakest possible of these options for any particular build mode. I.e.
> >> possibly -ffile-prefix-map=3D for out of tree builds, else
> >> -fdebug-prefix-map=3D when DEBUG_INFO=3Dy, else nothing (if possible).
> >=20
> > Is it? I don't really see why making the selection overly complex if the
> > option is supported (and cc-option-add covers that case).
>=20
> Yes, cc-option-add might cover the case where nothing is needed. But the
> two options mentioned have appeared in gcc at different versions. People
> using e.g. gcc7 may still benefit from -fdebug-prefix-map=3D.

That sounds like an argument to use -fdebug-prefix-map=3D +
-fmacro-prefix-map (with separate cc-option-add), instead of just
-ffile-prefix-map. I'm fine with that.


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--H0U/lCevOfb54q/S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfcUGAACgkQ24/THMrX
1yxp7wgAhLN4w0m9qRAdctDJRAUmsETl0cnHcKpeedwtf0/zIb2PF97yBN/+Wzm8
CXa+w0azRvnyKutVhsmT/SXLyiY1jgoxP4ipzbdehUyk0IiluuequEWsYLMoVJjq
gGDU17P/p2Hg3sE6zlg+TFj3SE40Q+4y/Emk7IHDxXm/AGXXNgP21yOpfWAD8HFL
VDFm7L9CNAGc2rkW2LsyfAXRotNshWMqRMHB2tzPpsasKaiTKsPXgYJdJrc1ir+u
t7Itg70VUR5zF6F27nJFVUwa4O0jRbzaERGTstNsILdo+4tf2McQNjmcy5X81ZPa
j28Bc/Z8DwUcsJoaH3qi/AwwaEsbhQ==
=T6fb
-----END PGP SIGNATURE-----

--H0U/lCevOfb54q/S--

