Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF8BC08B1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:36:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDsFX-0005Mt-4y; Fri, 27 Sep 2019 15:33:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u2/q=XW=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iDsFV-0005Mm-GZ
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:33:37 +0000
X-Inumbo-ID: 2bdfac8a-e13c-11e9-b588-bc764e2007e4
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by localhost (Halon) with ESMTPS
 id 2bdfac8a-e13c-11e9-b588-bc764e2007e4;
 Fri, 27 Sep 2019 15:33:36 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 07C5122220;
 Fri, 27 Sep 2019 11:33:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 27 Sep 2019 11:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qmvwaD
 ARkY3FMwH7telujdqH7hN0L2gMiy/zHe9kYIg=; b=VYuHBjBG84pax4KTx2jLqF
 JbYZRNDP4+5/KPgGfaC9fYh13GQoFLCO/dySWZI/0Mr0z+g0qgzMUBigamxb7kxS
 riQTKlsAbgd8MNHytSECA1B4aDoeRlWuBCiAgUhFn7iEjo7sqw9Hw5qVR3wIZnpY
 kGQi9YCRmjjuUwo9J85KLw91kWljaYnoLxdCBMwaKMtbfyUs2bjmxEqKhSG5+7et
 bDDIL7qH0T2TyFqokBi3oRXgacZARSRXK11SYMlRx+2uyYtEV0YkoCGdOyX6wnk/
 oStcF8iIpNIzIWhj8+kkJisJbjiA8BM1s80D1sEhRYYOnnfp4rZ4AtaownKd/LDQ
 ==
X-ME-Sender: <xms:zyuOXeu9znm3YTSu_jFMqOMlEeHjb7NNQa8NTyTkFhCiHbljTbLBJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeigdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:zyuOXU5ROyxu1a50sPK-VSArDu0ij_JbAeIx0m-UEdyTF_mjJvTcgA>
 <xmx:zyuOXVLq69zhnuau2FEqNxlH-RPLnNmo4RIgFWx47p0_jo2BcxZctQ>
 <xmx:zyuOXWRl7z5uoUBrDCLMBHDL6LPebKFB34DvySK40Onwr50vg5uOZQ>
 <xmx:0CuOXannD-o-Zmxqri7Qqkz7I5gynWV5FsUqaSvJoDUk3rASepLMiw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0863880061;
 Fri, 27 Sep 2019 11:33:34 -0400 (EDT)
Date: Fri, 27 Sep 2019 17:33:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190927153332.GW8065@mail-itl>
References: <20190926213428.GU8065@mail-itl>
 <ae728728-9459-44d8-34f3-8ae78e273789@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ae728728-9459-44d8-34f3-8ae78e273789@redhat.com>
Subject: Re: [Xen-devel] VM_BUG_ON_PAGE(!PageOffline(page),
 page) in alloc_xenballooned_pages
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============1834858972950722309=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1834858972950722309==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SqTQPb5cgNiYHXAZ"
Content-Disposition: inline


--SqTQPb5cgNiYHXAZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: VM_BUG_ON_PAGE(!PageOffline(page), page) in
 alloc_xenballooned_pages

On Fri, Sep 27, 2019 at 09:44:35AM +0200, David Hildenbrand wrote:
> On 26.09.19 23:34, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > I've hit VM_BUG_ON_PAGE(!PageOffline(page), page) in
> > alloc_xenballooned_pages, when trying to use gnttab from userspace
> > application. It happens on Xen PV, but not on Xen PVH or HVM with the
> > same kernel. This happens at least with 5.1.6, but also 5.2.15
> > (as seen below). Based on this, it looks related to 0266def91377
> > (xen/balloon: Fix mapping PG_offline pages to user space) and probably
> > 77c4adf6a6df (xen/balloon: mark inflated pages PG_offline).
> >=20
> > Any idea? Below is full message.
>=20
> Now that's weird. Weird because half a year passed since=20
> 0266def91377 (xen/balloon: Fix mapping PG_offline pages to user space).

Not sure about others, but in Qubes we use PVH/HVM VMs mostly.

> > page:ffffea0003e7ffc0 refcount:1 mapcount:0 mapping:0000000000000000 in=
dex:0x0
> > flags: 0xffffe00001000(reserved)
>=20
> So we have a PageReserved page that is not PageOffline. I assume this
> happens when we do a __ClearPageOffline() in alloc_xenballooned_pages().
>=20
> That means, that we get such a page via balloon_retrieve(true). Which
> means that we have such a page sitting in the ballooned_pages list, which
> is weird.
>=20
> Pages enter ballooned_pages via __balloon_append() only.
>=20
> 1. Via xen_online_page(). We have a __SetPageOffline() right in front
>    of it.
> 2. Via balloon_add_region(). I don't see a __SetPageOffline().
> 3. Via decrease_reservation(). We seem to do a __SetPageOffline() on all
>    pages in the previous loop.
> 4. Via free_xenballooned_pages(). We have a __SetPageOffline() right
>    in front of it.
>=20
>=20
> So this smells like #2 (and matches your PV only observation). Also,
> it makes sense that the page is PageReserved that way.
>=20
>=20
> Wonder if it is as easy as:

Yes, besides missing semicolon it works. Thanks!

> From 0955beef5aa11da4a8398472ce3106a92599cbe6 Mon Sep 17 00:00:00 2001
> From: David Hildenbrand <david@redhat.com>
> Date: Fri, 27 Sep 2019 09:39:31 +0200
> Subject: [PATCH v1] xen/balloon: Set pages PageOffline() in
>  balloon_add_region()
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> We are missing a __SetPageOffline(), which is why we can get
> !PageOffline() pages onto the balloon list, where
> alloc_xenballooned_pages() will complain:
>=20
> page:ffffea0003e7ffc0 refcount:1 mapcount:0 mapping:0000000000000000 inde=
x:0x0
> flags: 0xffffe00001000(reserved)
> raw: 000ffffe00001000 dead000000000100 dead000000000200 0000000000000000
> raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
> page dumped because: VM_BUG_ON_PAGE(!PageOffline(page))
> ------------[ cut here ]------------
> kernel BUG at include/linux/page-flags.h:744!
> invalid opcode: 0000 [#1] SMP NOPTI
>=20
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Fixes: 77c4adf6a6df ("xen/balloon: mark inflated pages PG_offline")
> Cc: stable@vger.kernel.org # v5.1+
> Signed-off-by: David Hildenbrand <david@redhat.com>

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  drivers/xen/balloon.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> index 05b1f7e948ef..d31149068448 100644
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -687,6 +687,7 @@ static void __init balloon_add_region(unsigned long s=
tart_pfn,
>  		/* totalram_pages and totalhigh_pages do not
>  		   include the boot-time balloon extension, so
>  		   don't subtract from it. */
> +		__SetPageOffline(page)
                              ^
                              ;

>  		__balloon_append(page);
>  	}
> =20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--SqTQPb5cgNiYHXAZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2OK8sACgkQ24/THMrX
1yxaHQf5AZV9Iaq9QNfuuDlM6uBx8RCguIRtfln6Pm1NmpKe/kKEcN9hMn+ylEfl
PJcH3Ld4ggdtW0H9rcMcq5c1i/g1fZPu3SCkxMfiGg06OeSLyskQ5EYLcHJfUXSb
F3tSZBCab0Acp5hMgVfzs/pGGO4WP1/cRl+qB8h6QPSaJftO2Ss5kGr8QbfLuMQj
X5BgxgHcTfyTmGNCawTJoPHTRQyFTUrHneVtqa6kar8RI+XfqyahIXxsVb0/O6Cb
8uL7oj0qymTdyh4O82K5/84Gx3zoGLHPYTYei8YxfH3lCPJTXEsi1cK9QABKzsUD
voXmIAPNkhiHZxzPea2ud7RD7349XA==
=8PQ3
-----END PGP SIGNATURE-----

--SqTQPb5cgNiYHXAZ--


--===============1834858972950722309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1834858972950722309==--

