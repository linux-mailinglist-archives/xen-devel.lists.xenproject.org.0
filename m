Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19303CEFF4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 02:41:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHdVx-00047B-IX; Tue, 08 Oct 2019 00:38:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=93Dx=YB=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iHdVv-000476-Rh
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 00:38:08 +0000
X-Inumbo-ID: e5127abe-e963-11e9-9bee-bc764e2007e4
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5127abe-e963-11e9-9bee-bc764e2007e4;
 Tue, 08 Oct 2019 00:38:07 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id EC16F2ED
 for <xen-devel@lists.xenproject.org>; Mon,  7 Oct 2019 20:38:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 07 Oct 2019 20:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=LZSAoG1jaIOJb3E5T3BJeQNSU2v4F
 BLXP6daEOl2w8A=; b=bme0o3JP1WAMsfQF8CENxMovQzBc2b4HSpczlqpY3Jslu
 mwobrFfjgSa85iV+67yuP42yCeEObp82LRDfL6EpoKYTu8V26owfWd7E5jBEUMwC
 N7p5d2gzgsERtejVh7jREjGgMh7Q7QlEYOnjsTNdrW+IBVqwO3UHn4Z0z9HaOdXB
 IUoIBn/KUf5M7KujKSHFew5ORlmHQsmzgpdN8jYyZ6cadKDFmpW6kGrqOj+Csv6q
 U5yofCpkDAAcK9GDLNN6muaf8TIQ+Zpflzj+SxmPF3rdafqVbqYxIq3z4tAJKyLP
 9mlspTOdH79T5qp35rYxA/07NYvCeRyw9VHAo0u9Q==
X-ME-Sender: <xms:bdqbXfVm69OFrtzuhn_-sxOVyx5HYgKM5RZPil-3YxkVGY90d2mcVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheekgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtderredttd
 ejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcu
 oehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenuc
 fkphepledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhm
 rghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvg
 hrufhiiigvpedt
X-ME-Proxy: <xmx:bdqbXd9yAWwWNwqh8fbA48cUhuN6sr66c9e0Kk7J-wDXoZ8ZQ2mjlg>
 <xmx:bdqbXXpkVg5pOY8HI0AwezbAxmaJu6HBUPhA9kgB92DCY2FQhslphg>
 <xmx:bdqbXYID9Ioc8XOfH1OsMlfyQJiB9BPtrbdCsZTZsK6VTPAe6kv1JQ>
 <xmx:bdqbXdLUxHOz5HblVWxQa-y6v9s_ptTJ_ZXYL0qFCk6MbqvpSxSKfA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id DCCD7D60062
 for <xen-devel@lists.xenproject.org>; Mon,  7 Oct 2019 20:38:04 -0400 (EDT)
Date: Tue, 8 Oct 2019 02:38:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <20191008003801.GH8065@mail-itl>
MIME-Version: 1.0
Subject: [Xen-devel] On unions usage, specifically arch.{hvm,pv}
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
Content-Type: multipart/mixed; boundary="===============0547526848933258735=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0547526848933258735==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DTi+U59iq1JqwzsZ"
Content-Disposition: inline


--DTi+U59iq1JqwzsZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: On unions usage, specifically arch.{hvm,pv}

Hi all,

To be honest, I think unions are very scary from security point of view.
It's quite easy to use a field that in given context have very different
meaning and easily results in security issue. In the most cases,
compiler can't help you here. And seeing "IOMMU: add missing HVM check"
patch recently, fixing a but that was there for a year, I think my point
is valid.
There are multiple unions in the Xen code base, but I'd start with the
one in x86's struct arch_domain: {pv,hvm}. In some cases (like the above
_patched_ one), it is obvious that using arch.pv or arch.hvm in given
context is valid. But in some it is very much not obvious, like usage of
d->arch.hvm.dirty_vram in _sh_propagate()
(xen/arch/x86/mm/shadow/multi.c) - at least one caller seems to deal
also with PV vcpus
(sh_page_fault->shadow_get_and_create_l1e->l2e_propagate_from_guest).
Maybe I'm missing something, or maybe I've just found a bug, I don't
know, that's my point. And this is after casual grep for arch.hvm and
picking random file (took like 1 minute).

I propose to implement some measures to make similar bugs less likely.
Some ideas:
1. Add asserts for guest type, if the check isn't visible in obvious
place, near arch.pv / arch.hvm usage.

or maybe even better:

2. Add wrappers (inline, #define, whatever) that perform the check
before accessing those fields. And forbid accessing those (and maybe
later others too?) unions directly, so it would be trivial to verify.
There could be multiple wrappers for most commons code patterns. For
example one for combined is_hvm_domain(d) &&
some-check-on-arch.hvm-field. Or another one just adding an ASSERT() /
BUG_ON().

Ideally such check should be part of a release build (IMO it's better to
crash early with clear message, instead of crashing later in mysterious
way or having privilege escalation bug - if that's the alternative). But
having those checks just in debug build would be an improvement already.

Thoughts?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--DTi+U59iq1JqwzsZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2b2mkACgkQ24/THMrX
1yyqjgf/azTheoLVh+Bg38EcNlV5FlzI2NqWnmEGVnVW0zugHEyg+U6/tAsN8UFi
h4rYKeB3sgCNj45dxuMBwmwA4K52/1ZaDAPjW+pOP1wK0NX821hd90sfCDTtDYa8
rwBChirBFAkqNE/9HtPClCSW4BCoYPtUaFdI5F2ZTPsknwEZQxGyh3x8yu30KEYG
m3/2p9OwoR+cnT9veWvejHldzxel7IgwIp2t4ffT5Dsr6gaQ/zyLcEVDT9Qf/HPH
Nv/M/JYnemYAgL6cpquShrBGwqaTFXd4ObRK+Y4xRkDxTK+SjwALxg+jEIdIWMvJ
6IEYuWBoR9nDVNh5JzippREAT2T9cA==
=uV38
-----END PGP SIGNATURE-----

--DTi+U59iq1JqwzsZ--


--===============0547526848933258735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0547526848933258735==--

