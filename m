Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E636ED96B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 02:53:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525686.817022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr6vD-0001g4-5R; Tue, 25 Apr 2023 00:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525686.817022; Tue, 25 Apr 2023 00:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr6vD-0001ce-1E; Tue, 25 Apr 2023 00:52:43 +0000
Received: by outflank-mailman (input) for mailman id 525686;
 Tue, 25 Apr 2023 00:52:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHzL=AQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pr6vB-0001cW-8K
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 00:52:41 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78e5f1e0-e303-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 02:52:38 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8D4993200495;
 Mon, 24 Apr 2023 20:52:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 24 Apr 2023 20:52:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 20:52:34 -0400 (EDT)
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
X-Inumbo-ID: 78e5f1e0-e303-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1682383955; x=1682470355; bh=4UNFZP9kqDVw+Elbus8NO1IbwHvk8fPFHGj
	+YDTr5Ok=; b=bq3q0GsU35KUBPRGS3uzB0PTd7696MIJtoITC0jt0fJNovyhmJs
	j1jGtasH/C/cEJebQuOk9PeVdd87qzs6IErzKrTs+5quGgJWHUH4fuYKrAogQqG7
	edZvJCy3sa4+m3FR03nmkoVpUSMps5q0q2K4x1jSJl41qlzf8r+4Cwy2U2NntqNl
	om4am7NcK+dFDdG2F/QVHOPSRsYq0ZZZTk3etr2ZeH+choOgAekrWPviSwvIDnfR
	5D/6Y9q864amMpSfyUj1V5tyIraCZIT6J54pUJ1YlFyjwakb4+P/QLB6MQFUhxop
	gOwjkb/qcLuuhhtYGbOfNKJ7OgN18FtdpEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682383955; x=1682470355; bh=4UNFZP9kqDVw+
	Elbus8NO1IbwHvk8fPFHGj+YDTr5Ok=; b=P3XN88dHM4ZPfjR9XC2p8J7rmmIQ0
	S2hlVe2Dpt7uO6bUC6Ucmh9kYbc1Q5iLmPGLWP36n0TEZjmKNQ6eId/qSF6LdlWk
	CVWvRQn517yfXfaKt7DNMLegg55tQ2LkNbWwfgnceAxsq72EMWt9eBBH1NGfgiBp
	01i099v63IXHtouSXEvpMCIByzXtUkkiiZBmnLil1QhY6OdixhXMzpgijIHVAsIG
	l+cXSPf2GsA89cN4PZOnmxvtN3vrJxeIrEbFDIirIiqEBAU0m7Bi/8A59y5vOIy9
	HrhfMKGRLj17Fsyv3Bt3BadCyiBIQ/1OKx/GGRaHsmf61LaIYol95d5WQ==
X-ME-Sender: <xms:UiRHZDycxzqYyz9svoI_BG29w0j0197nW8ZgATteVNnNxAdI48bTsw>
    <xme:UiRHZLSJobTk626Gs9QgHcRr4a09E0ONiiKmxnwl6mLc4mpla3vrQlEBftrj4FOXz
    ojuMJkPjH1dqA>
X-ME-Received: <xmr:UiRHZNWxzwuSO9CZtWG1IYfRCXsl4Gr3UQwyIWnq4max3oYRj8BTTBnES-VqlMUkIZCiVggqK-MbM7_rlktwIzhx7TXJ4q79KfE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduuddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:UyRHZNiBc4z1RHN9JnZeOYHvs9lWXUv0eGbVPF6ZXvCzTedAaqNJPA>
    <xmx:UyRHZFAdOtOydd5rKjlPCU46T40Em_iRKSQEmYHMVI5aMucfabpKVQ>
    <xmx:UyRHZGL3ugzlGX7z6oU57md36kZFVqbcOVv83eswOdiiBsSvh3JjmQ>
    <xmx:UyRHZIpUT6yUCX55iQZV1zuSrUe9nKfiEN8M6BNptDt91PmXwzDPkw>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 25 Apr 2023 02:52:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 6/6] automation: include tail of serial log in the gitlab
 outout
Message-ID: <ZEckT63hoBPm/Ss3@mail-itl>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
 <a3d33c869b7fcf4f72047daa4dcbcf4ff97143c3.1682369736.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2304241718120.3419@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vUtS7quP9sWuIv9L"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2304241718120.3419@ubuntu-linux-20-04-desktop>


--vUtS7quP9sWuIv9L
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Apr 2023 02:52:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 6/6] automation: include tail of serial log in the gitlab
 outout

On Mon, Apr 24, 2023 at 05:39:19PM -0700, Stefano Stabellini wrote:
> On Mon, 24 Apr 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > Make it a bit easier to see what has failed.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  automation/scripts/qubes-x86-64.sh | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qu=
bes-x86-64.sh
> > index 6442f7dda515..9b89d90f653c 100755
> > --- a/automation/scripts/qubes-x86-64.sh
> > +++ b/automation/scripts/qubes-x86-64.sh
> > @@ -228,5 +228,6 @@ fi
> > =20
> >  sleep 1
> > =20
> > +tail -n 100 smoke.serial
> >  (grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}=
" smoke.serial) || exit 1
> >  exit 0
>=20
> Isn't smoke.serial already in stdout and also part of the artifacts? The
> user can always click on the full output or on the smoke.serial file
> among artifacts.  Maybe the issue is that it is called ".serial" instead
> of ".txt" so the browser will not try to open it directly in a browser
> window. If we rename it to ".txt" the user could just click on
> "artifacts" and then on "serial.txt" and it would be all there.
>=20
> 100 lines is not much, but I think in general it is better if we make it
> easier to access smoke.serial in its entirety instead.

Yes, you can click on it to get it full. But that's two extra clicks,
and if the thing that matters is just that panic message at the end, you
can also have it right in the job preview.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--vUtS7quP9sWuIv9L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRHJFAACgkQ24/THMrX
1yzRywf/dxt7WmWAF3GoT6qvr02OD9nqm8EkDGDqqlnesXRF6yNhr0fIIF7VqlT2
dcTbCPgakmNvAElvyJl/8eTk9DTeO5nPD9vMCAQhwrcPewW93fcuHd4rgpDvXnAK
4GO9NCCKrwKqgg58VOsi1LbmWl4Of92ExedPGHr2U5mY7daLdeOu86GtQ1bNRLZe
86sz3adAe5BKLGaibZOq+6TRJI0VlRjNsUsio2K6vQxbd7RHCPdRd8HM7t3P+tnO
LO3z4/V2BtpBCQTKiWesFyqwZOIKcP3dSx6JII5aaKq+Jh3CVT+YbZMUIwCjniTE
tBIOZ7Tohxqzu07tiD/42wCsfhxanw==
=DKjK
-----END PGP SIGNATURE-----

--vUtS7quP9sWuIv9L--

