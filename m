Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A174E6A4C7F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 21:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502918.774955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWkVG-0000rw-9y; Mon, 27 Feb 2023 20:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502918.774955; Mon, 27 Feb 2023 20:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWkVG-0000of-6b; Mon, 27 Feb 2023 20:53:46 +0000
Received: by outflank-mailman (input) for mailman id 502918;
 Mon, 27 Feb 2023 20:53:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/yXf=6X=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pWkVF-0000oZ-CT
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 20:53:45 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d072bb6e-b6e0-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 21:53:42 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 12FD732002FB;
 Mon, 27 Feb 2023 15:53:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 27 Feb 2023 15:53:39 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 15:53:37 -0500 (EST)
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
X-Inumbo-ID: d072bb6e-b6e0-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1677531218; x=
	1677617618; bh=RVavUoNX4EDZuLj6Sm5XmnX0jbm/NN++mhcZCvWhnP4=; b=H
	5ekDTUKhz1V8Bxbkt3JIDn7yFY8Sz3Oa5sNWFuia12SB5cVVSbFbR+J29Y0i4Qd4
	IO5z6MkaqgUQwZEU/HXHBmqIJPglKdsnfpPQSyvAu+JboS4rt4POa0/e998o7VFK
	6/C1VTDD+qwCW7diGpGYVnuXYip9Bovwd+l88LAWtxL4rrFb78cw06ogzDdki+Hq
	5In/R4JeV/kP6ppA40wFOw9nFTW8yd4+3pXCF2toP9hQgb5gLF7Q69smDO+0kuYF
	LOo++tO48QqR0FwYZqstQAIf6BArJux+pjtVfVqyMDdi53i0nNrhNbGvhv8y7G3T
	iixzePzrguudJT/R8JkWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677531218; x=1677617618; bh=RVavUoNX4EDZuLj6Sm5XmnX0jbm/
	NN++mhcZCvWhnP4=; b=MB8HyW+sjWTtHj0ONpqQ4+UHlKI7L8G4/U/1JaeOvOCr
	4ecHIiQTr/hQcFiEn1BHoFBQRxy4dQNb5qxZwrqjZr/zNn2xu5aDZdZjpARFIMbO
	17hAl5TEwFpxFiKbAoRcum0y07m047idTM407bL/lNxahqjboJkXkVdwLb4+O4pa
	AkwAKQR/4IiYAUFJhfeaqiFe5eb4oKNumiZj7zFWQlb3og4fxvfO3xMKYqJIoB/W
	KZ2S28w7380BNNoLW1rm2Cv5JeIOgO7mhhPehAzASjcqQDIUeFI7ACa/M/wBeZAe
	UaCvCZw/hfpfKRYIkwKmEbAgCHTA1q6+d6nkNR63DQ==
X-ME-Sender: <xms:Uhj9Y14Q9OQT9n5bjNFA7xoGbTJ0C1hLgwzGQAds7iUgJ1f7oiZgxg>
    <xme:Uhj9Yy6IPaWTL9VMQ-6qC2roc1HsawBe7Cij1BwhMwxzDSURmaxkJqDeSD6hZhZwB
    lbLGwAIdlgW8OA>
X-ME-Received: <xmr:Uhj9Y8enVAmwJ7fWH_zcbzpsSMRluklBE2ziLXfHprPkAI7tIffEGZvPNc8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekteegiefhteehffegvdeggeej
    udelleeltdffveevtdetfeejuefgieeuhfeuleenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    uggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Uhj9Y-KlH4rO115_UiBSP4reIEMsi1GgbARHHfRhWVifOjLkmy_iTg>
    <xmx:Uhj9Y5JxHmPglHwlfxVe_KpqSMzAYm_5RSMdZ9PnpZuxGiwR4Kec0g>
    <xmx:Uhj9Y3wjfl1ibyUybUjWC6zcb332DU-lb1_xb6M-Pe8j_uqUoBFpJg>
    <xmx:Uhj9Y5384G-UxTp_sMbeVxRXNFzpF-BvSWz3cuqRbRkArHiXRDIejg>
Feedback-ID: iac594737:Fastmail
Date: Mon, 27 Feb 2023 15:53:32 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 4/5] Build system: Replace git:// and http:// with
 https://
Message-ID: <Y/0YUK+lzX/pHWNl@itl-email>
References: <cover.1677356813.git.demi@invisiblethingslab.com>
 <85a65c8c5cbd7cab3b9eb57aed27a59443c7a6ff.1677356813.git.demi@invisiblethingslab.com>
 <5a66c333-51e8-6e82-9bfb-10d52164e96e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xOCM4c90/6pTg/XH"
Content-Disposition: inline
In-Reply-To: <5a66c333-51e8-6e82-9bfb-10d52164e96e@suse.com>


--xOCM4c90/6pTg/XH
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Feb 2023 15:53:32 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 4/5] Build system: Replace git:// and http:// with
 https://

On Mon, Feb 27, 2023 at 09:42:24AM +0100, Jan Beulich wrote:
> On 25.02.2023 21:37, Demi Marie Obenour wrote:
> > --- a/stubdom/configure
> > +++ b/stubdom/configure
> > @@ -3545,7 +3545,7 @@ if test "x$LIBPCI_URL" =3D "x"; then :
> >  	if test "x$extfiles" =3D "xy"; then :
> >    LIBPCI_URL=3D\$\(XEN_EXTFILES_URL\)
> >  else
> > -  LIBPCI_URL=3D"http://www.kernel.org/pub/software/utils/pciutils"
> > +  LIBPCI_URL=3D"https://mirrors.edge.kernel.org/pub/software/utils/pci=
utils"
> >  fi
>=20
> Simply replacing https:// in the original URL does work. Why did you alter
> it beyond that? Yes, either access leads to the URL you specify, but that
> forwarding (or however it's implemented) may change down the road (and it
> could, aiui, even be dependent upon where in the world the access is comi=
ng
> from). In any event, here and below, any adjustment beyond what the title
> says wants explaining in the description.
>=20
> Jan

    $ curl --head --fail https://www.kernel.org/pub/software/utils/pciutils=
/pciutils-2.2.9.tar.bz2
    HTTP/1.1 301 Moved Permanently
    Server: nginx
    Date: Mon, 27 Feb 2023 20:46:38 GMT
    Content-Type: text/html
    Content-Length: 162
    Connection: keep-alive
    Location: https://mirrors.edge.kernel.org/pub/software/utils/pciutils/p=
ciutils-2.2.9.tar.bz2
    X-Frame-Options: DENY
    X-Content-Type-Options: nosniff
    Strict-Transport-Security: max-age=3D15768001
    Referrer-Policy: same-origin
    Content-Security-Policy: default-src 'self'; img-src https: data:

This means that all future requests should be made to
https://mirrors.edge.kernel.org/pub/software/utils/pciutils/pciutils-2.2.9.=
tar.bz2
as per the HTTP standard.  If this were a temporary redirect you would
be correct, but it is not.  See:

> Some URLS returned 301 or 302 redirects, so I replaced them with the
> URLs that were redirected to.

=66rom the commit message.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--xOCM4c90/6pTg/XH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmP9GFAACgkQsoi1X/+c
IsF9exAAhwb2DoNSJMQw+TI/tTwtLGbq79bgkeM+j03cLhC9q11NPp+zgagICuM7
UNmh6rMdKdmIdBpvGr4FHvUYwmXZeX60JzNc2Xc98KgjQ4l+KClCKQ7/TP80ccz1
Z6iv9DKu3fatGCsGyiXU3G3T3wNku26GtMcvc+8jK62RcXORVjq12moyh1hFxx/J
OYpCiZdaY8X3Qf+bOqXijBn81LjbLWt0+781gXNk76RaedTGmWs5gVNsxVrdIQak
MQBB2JIjq3oPuHJzhihO868bgLsjzUhy+uSY/3mDsg3dm6bNIgWvQB3S0tfg+MaO
ErVdEqNRThpxy61zEHSFAZK4doPQQ1yqyvksqRNg5kGnEoKW/c/54b82eddHwDJH
f2h4iPgO5Fa9vhWVPKQoK8dhKq4bW8uzl/sfr4rpf0UtgTqcZoUyBmXb2IdWVFSt
PVOE/6SVDg2xfI8roUQWLvHZPZ+G2a4w+J1QRBd+7yX/ugkDM+27yKSLe6mjM9FV
zG5qKXDg73/iTbv9p2Jk6WeSFtL8tn7KHZZwyhXzrtTN5dpa9KkIFnSVYZG1riJH
ry/FWe0k1oFCua0XQ7N0/or24TIsqNvJ6MmTBzy+WdTF7VXRW32+aYr+gdixVBXj
6VS4oQ9qCxC7knU48rTa3v79909vuGu/WpZ6z36gs+M19FSwnX8=
=7ykJ
-----END PGP SIGNATURE-----

--xOCM4c90/6pTg/XH--

