Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8913E8C7EE1
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 01:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723673.1128704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7kBz-0004aD-Bc; Thu, 16 May 2024 23:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723673.1128704; Thu, 16 May 2024 23:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7kBz-0004Xn-7s; Thu, 16 May 2024 23:07:19 +0000
Received: by outflank-mailman (input) for mailman id 723673;
 Thu, 16 May 2024 23:07:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s7kBx-0004Xh-8v
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 23:07:17 +0000
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com
 [103.168.172.148]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08c9b460-13d9-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 01:07:15 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 6C835138148E;
 Thu, 16 May 2024 19:07:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 16 May 2024 19:07:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 19:07:12 -0400 (EDT)
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
X-Inumbo-ID: 08c9b460-13d9-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1715900834;
	 x=1715987234; bh=Xbp6CAWgID8AeK7m7gdmyM1hQxHlHcEfEmPP7h9liDg=; b=
	P0YYATx4KDP1JBFMqxMHNhmLO9rS+j3jX8bpNQ1vreYOZTCnwx9NMDKU8sVQZ7X0
	yeGmzsC0ALx53VVOa2QeXtiYrwx0sGIk+oyDtpN6e/4P2qM7HjXK/TMer8xuOm2g
	Jc7GZ+3jGnKoYozHvBBDrttgKiMaejDJM00BRJ9y6UUl/oMwT0M1yn5TTyA43CI8
	A1Ajet9Wv8CRPXeaRk7BTnxWhSjdleknqa/a5vY8JNuYZG+TosyFZ+3uvIRpTT/Q
	gJVVRYlheJBHdRn1ncaJlAK/Cpm/9bkaPR/qNcjp1+WPsVaxeYfccqxf4JWw+CMS
	VU8CayJcR6C5Xmxe460u0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715900834; x=1715987234; bh=Xbp6CAWgID8AeK7m7gdmyM1hQxHl
	HcEfEmPP7h9liDg=; b=LYorJPv9yz3l75eOR72FMXmlmQclBancDuDo3Ucaqz9P
	MphLQjP8EW/fHf9r7G3W022aw8jDgz9VevEbsGJFlityovksb9nwzz3BwYfWuPA8
	DH7zdHtBKdAHFRC2kUNDvngHwtjgP54a3Qt311WtrLIcKT2HA43gBBYwSSG7Gg6j
	BtaUZYJvLRZfZJEy/LL8HDr27bft+H+cUAIWhc952LdkoR6BxGL2GvHzS0dyryK8
	X+OpgAOCZI91B7+CilqVw8ID+qgLMTiKSPK5DrY4n51n+nZH2LkQLCLS3DLgUopi
	AJ/EPyR/2C1xY8NisZCtFuFL+XFYh/EE/U7zZlI1Mw==
X-ME-Sender: <xms:opFGZvzA6ChIE1-3jbFF9CiRXZwXeuJ0881cPd_InEdXxG7P1jLjZw>
    <xme:opFGZnSvwkAYHwQ-1EBoZ6Wtw6m_3EZ1sJ9I-7yuiNXf2deSKmgCXI3dJmq8ShL9d
    mKqLO7ScUMciA>
X-ME-Received: <xmr:opFGZpVE18oeh_dW45TsgMI5vre90_P_82QABQE-dsXcLwBH52ysvSCDvFIvDvks1lRLuoaTQaZeYk9gxCzZbPCTgumCT5lJ8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehvddgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdet
    vdfhkedutedvleffgeeutdektefhtefhfffhfeetgefhieegledvtddtkedtnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:opFGZph9hXkayskPMt4V2gF9Blgo5sGKnpKof1PDcz383ODKGAjM_g>
    <xmx:opFGZhDOEIHHugNdWAI4ryUn3e0VeOoxpRJHooGJfm7E9nmP503mvA>
    <xmx:opFGZiK58GQ_KsI_EfmVPW46ptaS_4JeMtHrBFu5xDCB8ijpsJLnsA>
    <xmx:opFGZgDxyNpMo5LlZmZqkbPNq_VJuonmGrN2FYUm_PyC6OGBXRnIKg>
    <xmx:opFGZls01ety3u9xpjgqbermP_uHNcxq3L8Q3TXZ3o-pG9EQO5VHikf9>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 17 May 2024 01:07:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	Edwin =?utf-8?B?VMO2csO2aw==?= <edwin.torok@cloud.com>
Subject: Re: [PATCH v2 2/4] tools: Import standalone sd_notify()
 implementation from systemd
Message-ID: <ZkaRnYqQJGfNURyb@mail-itl>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
 <20240516185804.3309725-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CkPsxyEqsUgIAhd0"
Content-Disposition: inline
In-Reply-To: <20240516185804.3309725-3-andrew.cooper3@citrix.com>


--CkPsxyEqsUgIAhd0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 May 2024 01:07:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	Edwin =?utf-8?B?VMO2csO2aw==?= <edwin.torok@cloud.com>
Subject: Re: [PATCH v2 2/4] tools: Import standalone sd_notify()
 implementation from systemd

On Thu, May 16, 2024 at 07:58:02PM +0100, Andrew Cooper wrote:
> ... in order to avoid linking against the whole of libsystemd.
>=20
> Only minimal changes to the upstream copy, to function as a drop-in
> replacement for sd_notify() and as a header-only library.

Maybe add explicit link to the original source?

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
>=20
> v2:
>  * New
> ---
>  tools/include/xen-sd-notify.h | 98 +++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 tools/include/xen-sd-notify.h
>=20
> diff --git a/tools/include/xen-sd-notify.h b/tools/include/xen-sd-notify.h
> new file mode 100644
> index 000000000000..eda9d8b22d9e
> --- /dev/null
> +++ b/tools/include/xen-sd-notify.h
> @@ -0,0 +1,98 @@

=2E..

> +static inline void xen_sd_closep(int *fd) {

Static inline is one of the changes vs upstream, and gitlab-ci is not
happy about it:

/builds/xen-project/patchew/xen/tools/xenstored/../../tools/include/xen-sd-=
notify.h:45:3: error: cleanup argument not a function
   45 |   int __attribute__((cleanup(sd_closep))) fd =3D -1;
      |   ^~~

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--CkPsxyEqsUgIAhd0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZGkZ0ACgkQ24/THMrX
1yyr+wf/di0Bt03NikRjB4TFM7zPsNqDzMD/NrS2oiKUJo9xR6rvGGYhZrf2WL69
zUbFa4FRs6MZmlUrmzchp1/zA/0V4n7Cu0o8H7GMNF0yQHq+EyASigWCAm0Mp4vq
0ljMWG8/MoN0BkwTYu1vDdaVDPVlExLrTATSjSrrcc54Epp1ccVqbH6SztQTKDOF
vsZ0KInAT22ytWrEps8+23jDI1SQGQEv7gmuKUHKeHLJhKuppH8Td3AgGy9W2/Td
UpKeyzfV346n9AZxqPLftG1OrB4fQ44l1fwv2Xhd8PN9+bnfQRKZMHjDMVWz0iy8
v+tXmDfpUdbI8YZAtUhd8JY5nyTOIw==
=KL2a
-----END PGP SIGNATURE-----

--CkPsxyEqsUgIAhd0--

