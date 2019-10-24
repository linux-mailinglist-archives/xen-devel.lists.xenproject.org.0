Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3C9E34CF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 15:55:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNdY0-0006bv-Bs; Thu, 24 Oct 2019 13:53:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iNdXz-0006bq-7W
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 13:53:03 +0000
X-Inumbo-ID: 987ea33a-f665-11e9-8aca-bc764e2007e4
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 987ea33a-f665-11e9-8aca-bc764e2007e4;
 Thu, 24 Oct 2019 13:53:02 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 6A8B44B7;
 Thu, 24 Oct 2019 09:53:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 24 Oct 2019 09:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=kk+l8j
 mn37DlRB4dyDKBuu4P6DIBYYtjvT+nJC4x9NE=; b=lda+Kmljv4LibbhjN/xNaV
 JrvaYrRte47viKQnRFzkP/c6c7tZN8pWu4YbMnHvKjRj/S7iitV5aD35MlXnSSw7
 wZefQiaYVG3f1mV/I2TlIDHzaPrl4bY3qdXAGcl5q4/UhtG3G2bA1gVHCxaD+Rce
 KhcYZ9AB+Ah3uCCq8aY6Z0stpXe1DqWmlwgmPDNkjcyEXc74ZgvO9eT6MRIUxhXp
 R4iub0cys0/zs5Kc9GYrX66EcA7G8ErWqd6Vh8lTgYkX9h3Vkcx0rX449hgFwmtL
 2PJGua7ex+tX9LxZ+3XWXClWNYg2VvSRIuTU3Q+b8UHIdn1ml2FQ8IoSGJdMdnAg
 ==
X-ME-Sender: <xms:vKyxXRGogQvoh4WLpkhKaXr8KEB9BOCmVV3GeU1MATmMPcBH7I-VBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrledugdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepfdhmrghrmhgr
 rhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmfdcuoehmrghrmhgrrh
 gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdei
 hedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:vKyxXR5_Fx_vJ5ERsVuh3zxNZ8wlUipFS2RNC6yGIFbga0wTqszKww>
 <xmx:vKyxXaZdrcHDBig8HmWoVfwSWk9dN8MY-txtAAhu4hz_YdNowTL-Vw>
 <xmx:vKyxXfdG0NGwu4nqh5HSpwolL1luj75SYUj_m4jQ6cFvG-1WGW0BIA>
 <xmx:vayxXXRg3Twa1H3l-kfPpJD_YRR9befPWTCfA7HZ_VonCnApITBiig>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id A1F7B80063;
 Thu, 24 Oct 2019 09:52:59 -0400 (EDT)
Date: Thu, 24 Oct 2019 15:52:56 +0200
From: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
To: "Xia, Hongyan" <hongyax@amazon.com>
Message-ID: <20191024135256.GB4109@mail-itl>
References: <cover.d9b2d7d69cc351a30963d653b1d459c878356e4e.1571888583.git-series.marmarek@invisiblethingslab.com>
 <d9e965c0e19759f7be398044945b7be9eff41f3d.1571888583.git-series.marmarek@invisiblethingslab.com>
 <6d17d3de019b6d283178696fdbdee02c63e4fa49.camel@amazon.com>
MIME-Version: 1.0
In-Reply-To: <6d17d3de019b6d283178696fdbdee02c63e4fa49.camel@amazon.com>
Subject: Re: [Xen-devel] [PATCH v4 3/3] xen/efi: use directmap to access
 runtime services table
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============4925753620385418113=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4925753620385418113==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4 3/3] xen/efi: use directmap to access
 runtime services table

On Thu, Oct 24, 2019 at 01:11:22PM +0000, Xia, Hongyan wrote:
> It is certainly nice to have less users of the direct map. My non-EFI
> builds already work without the direct map now but once I start testing
> EFI, it is nice to have one less thing to worry about.

Note this is just yet another EFI info that's included there. Others
are: efi_ct, efi_memmap, efi_fw_vendor. So, if you'd like to get rid of
directmap, you'll need to handle the others too in some way. Doing that
for 3 or 4 tables shouldn't make significant difference.

> How important and performance-critical is this? If we really want to
> avoid switching the page table, we could reserve a virtual range and
> map it to runtime services in Xen.

Honestly I don't think that's very critical. The biggest improvement is
for XEN_FW_EFI_RT_VERSION, where you avoid switching page tables at all.
In other cases, you avoid that for too old UEFIs only. Anyway, I think
none of it is on a hot path.
This is an optimization suggested by Jan, which is nice to have, but
definitely isn't the only possible option.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2xrLgACgkQ24/THMrX
1ywxWQf+O5eVYxYrofaXUw9a++qyJFPHS/mMT5pok2EDhU4Ma0ZnTH6HOI5eM2GQ
Ezt7nk1mj5JWSt2PyoAbIXSArgO/0PIjFFSU4vZ5Uz5fCbPXhQN+kFCzc0ZwO3jm
nb3+6cIXOPOSYrrMCDm4BohJcB7aWhcg3uVqSkqffGw1FW60d3R6tTxUoDoRHNlz
unC2BZMvCzXT7C0b21eo9fRBz+vcCNOEeui+7zyhn9u5/4FOruMVCqDI7YtDub9K
dDpwV+L/WcnABPPjL1+Y6QLn6dFpTHNlck/iQWqz0tZlq821dua0MKOX9q9WmjP2
R8OZMfAbW4ACDx/xaHQJnhjkor/1rQ==
=qVZz
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--


--===============4925753620385418113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4925753620385418113==--

