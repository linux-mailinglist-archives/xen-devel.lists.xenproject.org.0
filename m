Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B7B48914
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 11:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115041.1461804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYYg-0005MG-6w; Mon, 08 Sep 2025 09:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115041.1461804; Mon, 08 Sep 2025 09:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYYg-0005Kl-3w; Mon, 08 Sep 2025 09:53:10 +0000
Received: by outflank-mailman (input) for mailman id 1115041;
 Mon, 08 Sep 2025 09:53:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dbc6=3T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uvYYe-0005Kf-UX
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 09:53:09 +0000
Received: from fout-b5-smtp.messagingengine.com
 (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c0ed4e3-8c99-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 11:53:03 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id ADD0A1D00068;
 Mon,  8 Sep 2025 05:53:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Mon, 08 Sep 2025 05:53:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Sep 2025 05:52:59 -0400 (EDT)
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
X-Inumbo-ID: 9c0ed4e3-8c99-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1757325181;
	 x=1757411581; bh=cR7RUvZMenD1jeAwc6PFFl10oTT3YqXfPHHL/bwY6t8=; b=
	efJm/QJUyTdh+au/mDtGCVin62X+OTKoszpfRer1aBaNgor2xCGCYSUP3HaazHup
	0buCiAQhszuqXxgONHbemIkorg/HUvQVqPrcNFKeheVFeZj+oaJg/tNjxiQDwoh0
	z1Fe4w4lijxVoFyZVkp1mS3fgz6Vsb9ALCk1fTGHTJXMT9O/KfCAT9hpFausnOuw
	r3FMwWp+KpuEMDK7h7JK5gc2GJDIpFC6Oh2M8FtFPLv9HTpA/jWrlcSFzvl0yqIS
	XYUWt+UW+d0gMGxl68iOnxOpMd5ra81hmphUotPjcYQo2iuxWRAOxpVmC8VUHix0
	XWrpf0WkvynaAixeA5nIcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757325181; x=1757411581; bh=cR7RUvZMenD1jeAwc6PFFl10oTT3YqXfPHH
	L/bwY6t8=; b=g58cze0DMI7Uk6qQFPssGI3mUiCmF0yUCiFIOtfZCPztQMY0v9S
	grycycPp3995DINOPqqc4vJYdcI/t44LjYBjcGUlAmZ1OBrj3jk5HGMrbGB3CxJM
	eJb6qgmi1+qKK4g+5PQqFKMcRYCMx31F2rFBvpvOwRDHk1Z6roLr0IolV9fd3T/j
	ZWDphALbVu+Qa7lHVhx4Fod0672H7X8MpKvxEvjm2+D0Fh2tT0pLCC9y2MBBPWif
	mPc5xBJBoq/faMgzkJsPCinjg1c6VT/A4898PgaTWyIXOAmzdQTUnxhmASBhOD7w
	hth0ft0Nv546dTjsgpxJmviALQ0QmXhFzbw==
X-ME-Sender: <xms:fae-aBaTkX08sU5rn1boW0vZwepGg-z-RWxAvaSvvdrKKVsFaS2NvA>
    <xme:fae-aIEm5HZMaaOhi21sGTE9Mi5zieX5MIKuYeJnTuB36FhvflUwIdSjXEZlJxPac
    Hr_e6H9VRSJfg>
X-ME-Received: <xmr:fae-aPnQIFkF4QHwxgxJBC34Qa3-P9nYQvhByXqZgTzxlXZTT8RiF3ZizNbK8iJh5OD39F1CKyoK2WMPwDZnko3rH3Ucj37EE6E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujedvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeduuddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopehgvghrrghlugdrvghluggvrhdqvhgrshhssegtlhhouhgurdgtoh
    hmpdhrtghpthhtoheprhhoshhsrdhlrghgvghrfigrlhhlsegtihhtrhhigidrtghomhdp
    rhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtghomh
    dprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhr
    tghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtph
    htthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtthhopehjuhhl
    ihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigi
    drtghomh
X-ME-Proxy: <xmx:fae-aLfzkvk5_Zs56sq_zD3LNoQUG63TWyK38tFUj9L_RhclNb_X9Q>
    <xmx:fae-aNEBIaCE8domZ7zUgYdYefU3XHDUGUrSkVGjXGzl9x9PoiIzRw>
    <xmx:fae-aBinJpBIdx0-8Ne71A3Kr4tmIDmmvrJaP8XU7QXcboFj3axYtg>
    <xmx:fae-aB0g5rGRhZ9X0JGUI9gNUUBL553kmBUH5Le_iigKnCOsm8vPYg>
    <xmx:fae-aGUcJg3dqdGeujjPs1ZZk6iD03HPIHj7yNGYZkjwjLqmOXEx7Wyu>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 8 Sep 2025 11:52:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/2] efi: Add a function to check if Secure Boot mode
 is enabled
Message-ID: <aL6nedjTUxgKh2uq@mail-itl>
References: <cover.1757071716.git.gerald.elder-vass@cloud.com>
 <8d66f9ce2c9c352794c0c144f6e00d0a9d465dbe.1757071716.git.gerald.elder-vass@cloud.com>
 <ed2e2406-bfab-4111-a9d0-025c85b51bdb@suse.com>
 <CAOJ+D-UkSveZ4LdYK5GA3VucxxSbQgBv5m9jfZ0H_MyuHP-UZQ@mail.gmail.com>
 <bf218191-fca6-439d-ad75-04162335b3ca@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WArpHYyzDXvmIVQj"
Content-Disposition: inline
In-Reply-To: <bf218191-fca6-439d-ad75-04162335b3ca@suse.com>


--WArpHYyzDXvmIVQj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 8 Sep 2025 11:52:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/2] efi: Add a function to check if Secure Boot mode
 is enabled

On Mon, Sep 08, 2025 at 11:41:55AM +0200, Jan Beulich wrote:
> On 08.09.2025 11:35, Gerald Elder-Vass wrote:
> >>> +          size =3D=3D 1 && data =3D=3D 0) )
> >>
> >> ... any reason it's literal 1 here?
> >=20
> > The size variable is also used as output from GetVariable and we should
> > verify that the size of the returned data is as expected, it is simply =
one
> > byte so probably not worth defining any macros to make it clearer
>=20
> I don't understand this reply. Why would the initializer of the variable
> use one thing (sizeof()) and the checking of the variable another (literal
> 1)? Even consistently using 1 would already be better imo; consistently
> using sizeof() is what I think would be best.

'size' as input value is the allocated size of the data parameter, so
makes sense to be sizeof(data). IOW, 'size' as the input value comes
=66rom the size of the 'data' variable, while the output value check comes
=66rom UEFI spec. While the size of the 'data' variable should match the
spec, IMO changing its type (to a wider one) should not break the
behavior here.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--WArpHYyzDXvmIVQj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmi+p3kACgkQ24/THMrX
1ywVqAf/dxDyv8lw6FnoT5OcEwtuInoXnylyxZMhsFu/XF554KvnGTZusr6e2mH8
nN7ADPdxVcKMIj1nudKe6iEFA4RmxOeMdP622+qlsC9oLoRCsPi5XrgQzqTGgYBh
KQZJrDMbVkCtfPbNjdKDneZiHluY/5oY5Dh4Vhq6uy1qZsxUoAS2NCv+uNKTRKZG
KnzWWiiP0DVehe1+JkYNom19rIFng1l7nK3AeKHKATmB65No5SzOdehbWC6hauK8
XWji6z0s1mKZaUdStfKc6M8R+Lu984xsO17SBeCdAZcIvrGWSUeORsWBq43AsFmF
/qNJrdL/QvdigKjjLiTF3REoDBN9ZA==
=BNds
-----END PGP SIGNATURE-----

--WArpHYyzDXvmIVQj--

