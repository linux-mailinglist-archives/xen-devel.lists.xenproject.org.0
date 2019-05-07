Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A95691670C
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 17:42:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO2Av-0002d5-Oh; Tue, 07 May 2019 15:38:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vvNG=TH=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hO2Au-0002d0-IK
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 15:38:36 +0000
X-Inumbo-ID: 2a7eee10-70de-11e9-8809-4f3dc9caea27
Received: from new3-smtp.messagingengine.com (unknown [66.111.4.229])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a7eee10-70de-11e9-8809-4f3dc9caea27;
 Tue, 07 May 2019 15:38:31 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id B74D1CD49;
 Tue,  7 May 2019 11:38:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 07 May 2019 11:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5OjFjH
 xWJTviEBZZZZlA7KN1Lr4tY3GLP7Rnx6iJFnU=; b=0SiYiDpmTttMbHzPXSnhs+
 HPv36EzyShVynPbP4qv95Nh8W7CL2s8l2hM8Bv0HLtE5VuLxAtBjI8E2+brV2ZrK
 fqeM6C3GWX3ymGkiFPUjVelq7wAhFl3D+pJ1oO5kEaf2hOsF859DkJ5Xq7uotNdJ
 8sDV6569TZKHNtLOlBIErBNpKtG2upZDWwyQzKiY1Bavjx/IwGrwHAJLDxImT179
 UlYCEGGOrvJqHzJdVvHUM4tUfd/F1Nrre+RDDYWNLgukrsD7QihEiAYI/IjtOVGp
 /TJMUKSPOb+r9opy8cO9sJun0HniRCRZQxz9jFPm7mWaPWsVV0M+Z2pH1YvSmQ4w
 ==
X-ME-Sender: <xms:dabRXCEEGVJGY0OqaTg8tl0VE80eSv2uIOGCc8Wi0YjU06L7OTxFBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkedtgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehgtderredtreejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
 hinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
 grsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:dabRXE9vkfBhcH2pQwhxnsNa4UUdMp3vuEDfThgWqeUkVIal6X_u4A>
 <xmx:dabRXANEg52O-rP64aymRz16t_UlSwW-qvRE5aoymRf-P7ba_OnZgA>
 <xmx:dabRXChO1BJY-LabFseAcUWtPA1p8cKm5SEE7iQJojEl1do9aSiT9A>
 <xmx:dqbRXMPuaBIx-XuTnm_PWjzP65F2HCt4n-EG3ILR1o3GjjS-EOb_cw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 78F23E4625;
 Tue,  7 May 2019 11:38:27 -0400 (EDT)
Date: Tue, 7 May 2019 17:38:25 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190507153825.GA1502@mail-itl>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
 <7c7a7dcc-ff17-feb7-1e88-96c31b0e72a7@suse.com>
 <20190506153211.GV1502@mail-itl>
 <5CD14B6E020000780022C646@prv1-mh.provo.novell.com>
MIME-Version: 1.0
In-Reply-To: <5CD14B6E020000780022C646@prv1-mh.provo.novell.com>
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
Content-Type: multipart/mixed; boundary="===============1839491322847809691=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1839491322847809691==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Vo48LVc30GAQuLuW"
Content-Disposition: inline


--Vo48LVc30GAQuLuW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2019 at 03:10:06AM -0600, Jan Beulich wrote:
> >>> On 06.05.19 at 17:32, <marmarek@invisiblethingslab.com> wrote:
> > On Mon, May 06, 2019 at 05:15:19PM +0200, Juergen Gross wrote:
> >> On 06/05/2019 16:50, Marek Marczykowski-G=C3=B3recki wrote:
> >> > diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> >> > index ccdffc0..b0f0f7e 100644
> >> > --- a/xen/include/public/xen.h
> >> > +++ b/xen/include/public/xen.h
> >> > @@ -923,6 +923,8 @@ typedef struct dom0_vga_console_info {
> >> >              /* Mode attributes (offset 0x0, VESA command 0x4f01). */
> >> >              uint16_t mode_attrs;
> >> >  #endif
> >> > +            /* high 32 bits of lfb_base */
> >> > +            uint32_t ext_lfb_base;
> >>=20
> >> You will need to put this addition into an:
> >>=20
> >> #if __XEN_INTERFACE_VERSION__ >=3D 0x00040d00
> >> ...
> >> #endif
> >>=20
> >> section (only available from Xen 4.13 onwards).
> >=20
> > Why exactly? I don't see this structure used in any hypercall argument.
> > The only externally accessible place is start_info structure, where it
> > has explicit struct size already.
>=20
> In addition to J=C3=BCrgen's reply: While the structure isn't meant to
> be used that way, any consumer of the Xen headers could in
> principle create instances of it (rather than just using pointers
> to the Xen-provided instance), and without the consuming code
> signaling its awareness such structure sizes may not change.

Ok.

What do you think about adding something that could be backported?
Xen is quite insistent on initializing framebuffer, even with
console=3Dcom1 or console=3Dnone. Which means, there is no workaround for
this problem.

Maybe, as a first step, a change that abort framebuffer initialization
if lfb_base =3D=3D 0 (I assume this is never valid value here, right?)?
If not, then at least abort boot when text console is still there
(blexit before efi_exit_boot). Any preference?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Vo48LVc30GAQuLuW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzRpnAACgkQ24/THMrX
1ywd1gf+ITyyfJMHVDVPeJmyV93KISwK/i6SrBwp5eN2DvX/AEH8MMvDVNR6uInf
dSNayHxwtWMpD6jI7GX6+nSY4rbeVxJ7oOcexiYQHlWOOOsQ/R1asC0Atf1JwgL0
z7btXHYiknIA+A0eYUkHZNzh2nSqXkrXhHfwWhUhYYRAAI/N7N9lfY0q0ps6OFkJ
LhKr3rRQzSkMeC0/eyCmWYSpeD+TPZAC6C5O7yXF3GkcwU52p43E67Zv5MoMwLR/
YoVZ5R1s8Cg6JxY6OEB+95B7Lc1zcw4P9jRSKh0Vwoif/oHswVbMQkZtIbmqQvDK
7c5ope+GHtbtqcvC/JHm+2htaVQ4Rg==
=bxxz
-----END PGP SIGNATURE-----

--Vo48LVc30GAQuLuW--


--===============1839491322847809691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1839491322847809691==--

