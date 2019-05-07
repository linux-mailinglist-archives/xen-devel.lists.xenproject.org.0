Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0F416849
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 18:45:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO3Bb-0001yZ-33; Tue, 07 May 2019 16:43:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vvNG=TH=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hO3BZ-0001yQ-Hi
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 16:43:21 +0000
X-Inumbo-ID: 36e805a2-70e7-11e9-ae36-2fe9d3518c48
Received: from new3-smtp.messagingengine.com (unknown [66.111.4.229])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36e805a2-70e7-11e9-ae36-2fe9d3518c48;
 Tue, 07 May 2019 16:43:17 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 09F5D152F9;
 Tue,  7 May 2019 12:43:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 07 May 2019 12:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JuI1TZ
 ifbzL8G3dFo+z/XhNR2SjX2GTzS7WGjf0PWjE=; b=ClKyl3bC1YQpOBr0xiIvHq
 so8aJmU52/WH+C4U/mOEOTOPEI89NS1nK7U4PnV+pZkFX3lz1KnazCivCC8AWVJP
 Yx4VzNbrWbgk4txvMTPQ4p4MSGmBmJ1w5FASfNQAZfpgogANnx2Wi9Rww4H4cWn4
 kEpDSVeuN7cQtJS/RNXzGfSR2Ee8Cffu9u6JDQEzrI7dJ1EvMOcm6ZEL4MCYpf/T
 m1HD7c8Y7Sr7cgzLn5xleszrOkbH9rCI7oeY9mSlN00HatrkRwl6HZBkvrlyTGF+
 gJoUjU3zY3S5nWqQhwvsZBVFnRsPq1CMWo94DVWX/k2i68YBzUZ1NqKV3JhTIWyg
 ==
X-ME-Sender: <xms:o7XRXGsJy-gt6c-YSNPlDJFsrb1-H_z_PyNnf5yvaSwO8f7VmpmcIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkedtgddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesghdtreertderjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvth
 hhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:o7XRXB2j91OjHjCxP5GxUeHa1noSXuHOCyY9o56BQZxYte5M_lWIkg>
 <xmx:o7XRXOCiqD5aplB0sT-GOF6eF4-FPHvZJMrzldAcVReJnoqW32tdPQ>
 <xmx:o7XRXPA4EPyQfJbCtzDG0EjSB-2YEaNIIzmpohFFKINky90km0ofFg>
 <xmx:pbXRXC6b4ucweZo56jKiL9jSYfbf7aZcct0eO-rlk999HXYPjiWPog>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id AB26510374;
 Tue,  7 May 2019 12:43:13 -0400 (EDT)
Date: Tue, 7 May 2019 18:43:11 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190507164311.GB1502@mail-itl>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
 <7c7a7dcc-ff17-feb7-1e88-96c31b0e72a7@suse.com>
 <20190506153211.GV1502@mail-itl>
 <5CD14B6E020000780022C646@prv1-mh.provo.novell.com>
 <20190507153825.GA1502@mail-itl>
 <5CD1AE5D020000780022C9AF@prv1-mh.provo.novell.com>
MIME-Version: 1.0
In-Reply-To: <5CD1AE5D020000780022C9AF@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.11.1+94 (9b965fac) (2019-01-05)
Subject: Re: [Xen-devel] [PATCH 4/5] xen: fix handling framebuffer located
 above 4GB
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8448316691333705168=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8448316691333705168==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GD0jJf8rm+K0B4Sk"
Content-Disposition: inline


--GD0jJf8rm+K0B4Sk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2019 at 10:12:13AM -0600, Jan Beulich wrote:
> >>> On 07.05.19 at 17:38, <marmarek@invisiblethingslab.com> wrote:
> > What do you think about adding something that could be backported?
> > Xen is quite insistent on initializing framebuffer, even with
> > console=3Dcom1 or console=3Dnone. Which means, there is no workaround f=
or
> > this problem.
>=20
> When the system is in a simple text mode the /basevideo option of
> xen.efi ought to help, but if it's in an LFB-based mode already (which
> is the case on the systems I have) then indeed I can't see any
> workaround.
>=20
> > Maybe, as a first step, a change that abort framebuffer initialization
> > if lfb_base =3D=3D 0 (I assume this is never valid value here, right?)?
>=20
> Yes, that would be an option. But it would help only in your specific
> case, not if the truncation results in a non-zero value. I guess we'd
> better avoid filling the structure if we'd truncate the value.

Yes, I was thinking about setting lfb_base=3D0 explicitly if it would
overflow otherwise.

> But what's wrong with backporting your change as is?

If this commit would be backported, what value you'd put in that #ifdef?
Also, one may argue that ABI changes should not be backported... But
since there is clear and independent of xen version method of detecting
it, I don't think this would be a big issue here.

> > If not, then at least abort boot when text console is still there
> > (blexit before efi_exit_boot). Any preference?
>=20
> What's wrong with the text console still active? Or maybe I'm
> misunderstandint you make...

As soon as you call ExitBootServices(), you can't use
SIMPLE_TEXT_OUTPUT_INTERFACE anymore. Which means if a) framebuffer
address didn't fit, and b) you called ExitBootServices() already, you
don't have any means to tell the user what is wrong. Other than serial
console of course, if you're lucky enough to have one. So the idea was
to report the problem before ExitBootServices().

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--GD0jJf8rm+K0B4Sk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzRtZ4ACgkQ24/THMrX
1yyyfAgAl8W5xOVYsNwgokMKqMrJ7blZq7xUpiQ9QTjocl56E39f+Wxssd4BN1u7
QOI3yeDFdm2BZMRFoM+6E2V4XsTosule0wAzQQ0HuhSsvhuHMX5tE6OAKTV6ZS6S
6X5y8Fc0TZOlrScK+SPsesi3UhlMIypz4YWP7Z3fWitR38T1vsY5D5I8butFap5B
4SAmf/IZjv9IIP2WH4cCvcAxsg+PWzIUCke6Nwy7lNMWGUjP2baUfWQTLRNBwlSq
R57z79cR5zbU2f5RxqiOrVGiCMQ6cOaZF47UWpGhMIQh1qIsAfTMn8+vB/Ir/nRj
RFOtzMrqkqIealG6bWrw9Gzmf2TwvA==
=yOIa
-----END PGP SIGNATURE-----

--GD0jJf8rm+K0B4Sk--


--===============8448316691333705168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8448316691333705168==--

