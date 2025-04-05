Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0887BA7C717
	for <lists+xen-devel@lfdr.de>; Sat,  5 Apr 2025 02:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938763.1339269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0rOi-0001Rw-QZ; Sat, 05 Apr 2025 00:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938763.1339269; Sat, 05 Apr 2025 00:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0rOi-0001Pc-N2; Sat, 05 Apr 2025 00:28:32 +0000
Received: by outflank-mailman (input) for mailman id 938763;
 Sat, 05 Apr 2025 00:28:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SPaY=WX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0rOh-0001PO-9q
 for xen-devel@lists.xenproject.org; Sat, 05 Apr 2025 00:28:31 +0000
Received: from fhigh-b2-smtp.messagingengine.com
 (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e253ebc9-11b4-11f0-9ffb-bf95429c2676;
 Sat, 05 Apr 2025 02:28:25 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 1540725401F8;
 Fri,  4 Apr 2025 20:28:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Fri, 04 Apr 2025 20:28:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Apr 2025 20:28:21 -0400 (EDT)
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
X-Inumbo-ID: e253ebc9-11b4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1743812902;
	 x=1743899302; bh=zsaUbvW20l/czplj88g6L7K4iAZfyvXqaJTjw8kaLhg=; b=
	axM21uAZbB/vYpQTdDMexvN8p+hrMR0d5H+4MX6W2AqsByzm56oWZgwO/g7CbAIn
	WMDltSNpjnPBjXK2blcEc/klk1H0kI30MJmrqdPTTb8eW/sR71XSoaED8VXI82y3
	zU8uzwaL+uWENIB305u8B4aztwOHwASJbfHcsLmWzkIFfoWrX3+8Ur59BlryyU/j
	jp74VzR0S2wosl1zWA+imTNNdUgkdEX6WMquzJCGwMNAV67wNXDOnnV0Fs+XfGsq
	pLjO2KE8DNgkHOk3/QpDKb8Vn5Ye3vbFy70P+IsnGJctzIR1ZS+jYzIaDqwPr2qs
	18IXpsP8I9e0EBFNxGS7oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743812902; x=1743899302; bh=zsaUbvW20l/czplj88g6L7K4iAZfyvXqaJT
	jw8kaLhg=; b=NUUGoaPWr2mbflsJRrgEYWCO+Jk78DZTgmijB+fro3wmVESWi42
	dZsc4XuJ3vbv1be6diYdOwRQF9EQm/rD4z1+kgQjp/ewslHi0N/q77q8A/9HIF3W
	Wgisd0kdiZUrdupZOi3fSmmU/gtHtaOUMPB6I9wnjpO0UQdF2PB76k6DjhQCncr8
	9trip81SuWHXfrWwtcU2EZUwj+fDmBd/IK8Y6jdlhW5OdhsC2QX8XNuGjAlJsnxg
	8D0yrGr+j6zT0LMlmdwuZep6z87wdVEYX6dKTb3KswmLRdHO5QUVT9LG52TLC6p0
	8+11vlaEVC1GOQmo06SIeu8zqAsNdcETu+A==
X-ME-Sender: <xms:JnnwZ48WJ55saYv4Rmw3UMdsjNN-DkNWPNjqhP5tvnqP_qKvqf_Z2Q>
    <xme:JnnwZwsxs4rWDnDnizjPPN6XmR0lwbX6dFPsMB6LQqTWuGmctbmJm5L141rLqndV1
    2HwwcKnmKvXKg>
X-ME-Received: <xmr:JnnwZ-Ab4MOXHOtDa7vZ_8HFACDrBENs9oYdAmMCYHdjvouieF0e3QPG1rFMtxnJ4D3uVRP_SuMHn_xEYKMrNkH7MSqxYY6KUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduledvkeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepveeujeetgeelleetudeuvefhtefgffejvedtvdfgieevheethe
    elgeeuledvjeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghith
    hrihigrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgt
    phhtthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsg
    gvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlhes
    lhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:JnnwZ4eK2vZ_TXpoPacsw1Xhu5I9Pt0qEwJQtpNx45WVXXt-tCWlyw>
    <xmx:JnnwZ9MJOnaZZ9F0lJI9s0ZoYKhmKJXqnLGknwAdbGHDlAj-zdKnrw>
    <xmx:JnnwZyld9AReYNl1s0AQ9j6Ht_IwHiwEa7vU0_KweAKdP7fFlqo1Tg>
    <xmx:JnnwZ_sRKIruXK5X2krkZKndjYEWPgnRLj-P3tixtEi-UhdyhEhf4Q>
    <xmx:JnnwZ0fkr6PnfyntLmx281JHplCxSL-wG_qOK2qK9lH1f9wG3mgcelw8>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 5 Apr 2025 02:28:19 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 01/11] ci: prevent grub unpacking initramfs
Message-ID: <Z_B5I-cKaLU0xcxL@mail-itl>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
 <e1d07b26a92a45ed387594dd789453def1ef1eb2.1743678257.git-series.marmarek@invisiblethingslab.com>
 <a64136e8-c74e-4f47-b52f-cd5b25c57b2e@suse.com>
 <d832f7c5-5a59-46c5-b5c6-109dd13a77e3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z9yLbrtw/D6qN8wq"
Content-Disposition: inline
In-Reply-To: <d832f7c5-5a59-46c5-b5c6-109dd13a77e3@citrix.com>


--Z9yLbrtw/D6qN8wq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 5 Apr 2025 02:28:19 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 01/11] ci: prevent grub unpacking initramfs

On Thu, Apr 03, 2025 at 12:39:11PM +0100, Andrew Cooper wrote:
> On 03/04/2025 12:29 pm, Jan Beulich wrote:
> > On 03.04.2025 13:04, Marek Marczykowski-G=C3=B3recki wrote:
> >> It fails on larger initramfs (~250MB one) and sometimes even smaller
> >> depending on memory size/memory map, let Linux do it.
> > Iirc grub only unpacks gzip-ed modules, so wouldn't a yet better approa=
ch
> > be to use a better compressing algorithm, which simply as a side effect
> > would keep grub from decompressing it, while at the same time moving
> > farther away from any critical boundaries?
>=20
> Yes and no.
>=20
> This is going to change anyway when I (or a delgee) moves initrd
> generation from the test step itself into the test artefacts repo.

Out of curiosity, I tried this:
https://gitlab.com/xen-project/people/marmarek/xen/-/commit/51b5fde81680620=
6e6e0c72ec0146c5ab3da4351
pipeline:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1753304751

It avoids repacking base alpine initrd, but it still needs to pack
per-job stuff (test script, but also toolstack). The gains are not
great, that step still takes over a minute. The overall job time went
down by just 40-50s (for example from 6m50s to 6m03s). This isn't very
surprising, because the base initrd.cpio.gz is 60MB and the final one is
over 200MB, so the part that was needlessly re-compressed is about 30%.
The numbers checks out, as the (debug) build artifacts zip is about
150MB.

One further idea would be to produce cpio.gz archive as part of the
build artifact, to avoid zip (used by gitlab for artifacts) -> cpio.gz
recompression. But that either makes build artifacts bigger for every
job, or need setting a variable for jobs that are used later for tests.
Unless we decide to store toolstack _only_ as cpio.gz in artifacts?

I tried the latter idea here:
https://gitlab.com/xen-project/people/marmarek/xen/-/commit/a4774213d83ca05=
c0b0b0fff80e49cf3aa32b67b
pipeline:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1753312631

This helped quite a bit more. The 1m of compressing initrd is gone now.
Compressing remaining test-specific files and concatenating it all
together takes 2-3s. Now that 6m50s job is down to 3m40s. I'm not
exactly sure where that extra minute went (maybe related to number of
files in the build artifact? Fetching/extracting artifacts seems to be
faster a bit), but those times are not very consistent anyway, so it
could be also just random fluctuation.=20

Looking further at the test log, some time is used for fetching
artifacts. I've looked into gitlab docs if those can be cached on the
runner, but I haven't found a solution that would really help (you can
cache arbitrary paths, including artifacts, but it doesn't prevent
re-downloading them and unpacking over the cached version...).
So, I'll stop here, polish the above patches and submit them in v2 of
this series.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Z9yLbrtw/D6qN8wq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfweSMACgkQ24/THMrX
1yzu2QgAhhXLPl5Z2+W25OsSPCeqCzA7pmaEcKm4F1LtqHaNZDE7Q6hIWKk1D8zJ
AUXw+IfPzPdzRSZZwJJXpPFnBhYyMGJxRiTpfJSy6ANiwargyu7hPYD96bTiZa7P
cW8EFABxUKkjAf8d53b7xNsSWIxQPFdVQCoCWlsVxdKzNcYmyuVpyUhVLmDN2Nyh
j6caD5XgWbBTevv64+jKBa2ZI5JwfUgArVVkN0G11v5CBkJRzYcyg4PWP2hiDbjM
JwA+JqDzgi/Z6gy747xDmZW9EfGftMD1vlDnFGEEpMqrM0POaD49JB0DLafin6Xd
ew6DAcAJ1IpL2+KQTl8XG1J8XBMgRw==
=9JlT
-----END PGP SIGNATURE-----

--Z9yLbrtw/D6qN8wq--

