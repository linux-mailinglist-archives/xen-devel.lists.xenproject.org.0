Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E9B15056
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 17:35:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNfbI-0008Pc-AP; Mon, 06 May 2019 15:32:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SrHI=TG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNfbG-0008PX-C3
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:32:18 +0000
X-Inumbo-ID: 2155636e-7014-11e9-843c-bc764e045a96
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2155636e-7014-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 15:32:17 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id E4F8624B1;
 Mon,  6 May 2019 11:32:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 06 May 2019 11:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xUC4lO
 3nylnopLJZj4hhkeU4B6MWFhAwbF0ZIjdFPXw=; b=ENb6ap4f7MOgk4X8hQp/tP
 tQRHASVchIZNEP5c2GgBAeokuan1fM+XAMQBrdsxppBlTs6a1XCI3BdiLdG5uqHK
 nIbIfZhj4oN/WjxTiDTlo85yPDx5xgD6UINwjTUxt4ZJwDCNWiY540IOel3COkrT
 CAUMocOFQhWn/SxM7dIpUlcOUv2j/Ng5VjV7fCxcg0Mq8poerIRR8KX8Ht0uuouF
 8+btz07taGxUYNrYCMAGiqSszlfxmam13T6o0mQ17SvhDJbuLRVEBXmwb2I4nvPu
 P9HO07TkakkWT/DbNF1R4JwfC6zz3HMOR/fRuEiFWjaKdZf0s7ClKQcWFvDS0RRg
 ==
X-ME-Sender: <xms:f1PQXCk78nI7CQHUd8tE0hecrMWkLacC_S9GlqVfhqA0pVGNrKji4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeejgdelvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehgtderredtreejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:f1PQXGLzwGsaqAlGNX-SNC3HKBnjw4tENQ2tjcHBn4337KmP_rGJsg>
 <xmx:f1PQXDa2KKVD0l1Z8hTNkgFlz21Ml6fFyWzskD4W76VL16ETjswlvw>
 <xmx:f1PQXIa4ZYzCkV0L25ekF1-oi4ZIYOz5-yBOAXEFmcBsRxJdpRIJxg>
 <xmx:gFPQXH0Pqo8_Ey_Ri16j7ZODuz5P-wkpmffLFvZNuN9HHu0IqCG2Fg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 27253E4841;
 Mon,  6 May 2019 11:32:14 -0400 (EDT)
Date: Mon, 6 May 2019 17:32:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190506153211.GV1502@mail-itl>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
 <7c7a7dcc-ff17-feb7-1e88-96c31b0e72a7@suse.com>
MIME-Version: 1.0
In-Reply-To: <7c7a7dcc-ff17-feb7-1e88-96c31b0e72a7@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============4163486073433210775=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4163486073433210775==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KqIDP7BYbqnwKRO+"
Content-Disposition: inline


--KqIDP7BYbqnwKRO+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2019 at 05:15:19PM +0200, Juergen Gross wrote:
> On 06/05/2019 16:50, Marek Marczykowski-G=C3=B3recki wrote:
> > diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> > index ccdffc0..b0f0f7e 100644
> > --- a/xen/include/public/xen.h
> > +++ b/xen/include/public/xen.h
> > @@ -923,6 +923,8 @@ typedef struct dom0_vga_console_info {
> >              /* Mode attributes (offset 0x0, VESA command 0x4f01). */
> >              uint16_t mode_attrs;
> >  #endif
> > +            /* high 32 bits of lfb_base */
> > +            uint32_t ext_lfb_base;
>=20
> You will need to put this addition into an:
>=20
> #if __XEN_INTERFACE_VERSION__ >=3D 0x00040d00
> ...
> #endif
>=20
> section (only available from Xen 4.13 onwards).

Why exactly? I don't see this structure used in any hypercall argument.
The only externally accessible place is start_info structure, where it
has explicit struct size already.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--KqIDP7BYbqnwKRO+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzQU3sACgkQ24/THMrX
1yxvhgf/W0E+dpMj3QuSPUyAea+Z/Cr2MIxYS8Fb4AD2PAKmW6jomNCMcQIa1i2A
vtWaOfhExbEOO35cYe4dyqFHG+C+1/49fuCOuYlu3cUnR+Dhw5qXF3LhUe6PX2mm
5CKtYn6Y81HdpbL/Baz7dMd7X/U5UKJJge6evNtcqQyRogVne4SA+sFaN7UgeyLT
UuwfTVD/N0QFxna0b4kl5pWuBOP/MIRYjQQdT5kVP+6dkFWxsO2odW33dLqEVO6o
kyrBpeuU1n06AIQ0f7m3SaxEoRioPgKF6oavlVgThdBRPMmLdB89kocybdMvc+GU
7UcFy7BGhslTSntgWE+KKq6y74R0VQ==
=KbC2
-----END PGP SIGNATURE-----

--KqIDP7BYbqnwKRO+--


--===============4163486073433210775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4163486073433210775==--

