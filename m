Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E9617915
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 14:09:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOLLo-0000nC-FL; Wed, 08 May 2019 12:07:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DRUi=TI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hOLLn-0000n7-5D
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 12:07:07 +0000
X-Inumbo-ID: cbdc65b6-7189-11e9-bc9a-9be679ead990
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbdc65b6-7189-11e9-bc9a-9be679ead990;
 Wed, 08 May 2019 12:07:05 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5FFD614ECF;
 Wed,  8 May 2019 08:07:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 08 May 2019 08:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=D9YWZN
 OluUMWyFDaJGx45LjHC8t/Aq96tJ5KwI8PjWQ=; b=GVE6i7GN+BDtwFEB4jchSb
 bJnSDVS0Feand1AAv5G97QsBtOIRf6dRPrNbkn79jV9cVJQ4WMZj5VvPL2H+BQw+
 DtveI+tT6ovKw2uCV9IsXAs80Ue36OyJ5XNTXxOSztv4GYtpnTNqB4Osp+xqIwT0
 uTsSkvOZnx2+NF4fHey7swfune6KOBkg7R0lyQuO+7kBDZmsbKs/c9HA00/BzBJH
 PjUhyqGgoL7noi+QXScUY7wCecvqkMXp3rq7TfY8FAnDY0xXp/3jSwA74WLNbNQC
 UcDkSiUaw6VlfxQ/kDRT9C3uA7KUCS9T+FFp2Nw0FBgHvGIDXTVgHt1nQOfZD5ag
 ==
X-ME-Sender: <xms:aMbSXPSVGf_6TlvCugSkIPhHzyB4xTS5vGHXAnZe1wBgQ3L2V6XOgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeefgdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehgtderredtreejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
 hinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
 grsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:aMbSXCStbzJ6MTPzVPx3jWleeZT7Jq75i8Sz7HfBiUQaoo-ISwsdHA>
 <xmx:aMbSXCfp8MZ-SCHTBfDvlsaPU7RKrjcYVqhP8_6oNuQH3-k_-JFwcQ>
 <xmx:aMbSXGcCwPQGFrp964WefLnP76qtglP5k28dWt6goGioGtz_9SRjZg>
 <xmx:acbSXFdn3_BlWFwHSMXpdZrbm6pfR-Yx_BHRwrir2d3swBbZBZecKg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 60104103D2;
 Wed,  8 May 2019 08:07:02 -0400 (EDT)
Date: Wed, 8 May 2019 14:06:56 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190508120656.GC1502@mail-itl>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
 <7c7a7dcc-ff17-feb7-1e88-96c31b0e72a7@suse.com>
 <20190506153211.GV1502@mail-itl>
 <5CD14B6E020000780022C646@prv1-mh.provo.novell.com>
 <20190507153825.GA1502@mail-itl>
 <5CD1AE5D020000780022C9AF@prv1-mh.provo.novell.com>
 <20190507164311.GB1502@mail-itl>
 <5CD2A765020000780022CBBC@prv1-mh.provo.novell.com>
MIME-Version: 1.0
In-Reply-To: <5CD2A765020000780022CBBC@prv1-mh.provo.novell.com>
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
Content-Type: multipart/mixed; boundary="===============8009588525908183709=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8009588525908183709==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W302I+VHGNbNYdEm"
Content-Disposition: inline


--W302I+VHGNbNYdEm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2019 at 03:54:45AM -0600, Jan Beulich wrote:
> >>> On 07.05.19 at 18:43, <marmarek@invisiblethingslab.com> wrote:
> > On Tue, May 07, 2019 at 10:12:13AM -0600, Jan Beulich wrote:
> >> >>> On 07.05.19 at 17:38, <marmarek@invisiblethingslab.com> wrote:
> >> > What do you think about adding something that could be backported?
> >> > Xen is quite insistent on initializing framebuffer, even with
> >> > console=3Dcom1 or console=3Dnone. Which means, there is no workaroun=
d for
> >> > this problem.
> >>=20
> >> When the system is in a simple text mode the /basevideo option of
> >> xen.efi ought to help, but if it's in an LFB-based mode already (which
> >> is the case on the systems I have) then indeed I can't see any
> >> workaround.
> >>=20
> >> > Maybe, as a first step, a change that abort framebuffer initializati=
on
> >> > if lfb_base =3D=3D 0 (I assume this is never valid value here, right=
?)?
> >>=20
> >> Yes, that would be an option. But it would help only in your specific
> >> case, not if the truncation results in a non-zero value. I guess we'd
> >> better avoid filling the structure if we'd truncate the value.
> >=20
> > Yes, I was thinking about setting lfb_base=3D0 explicitly if it would
> > overflow otherwise.
> >=20
> >> But what's wrong with backporting your change as is?
> >=20
> > If this commit would be backported, what value you'd put in that #ifdef?
>=20
> I'd keep it as is. The field addition happens for 4.13. And as you say ...
>=20
> > Also, one may argue that ABI changes should not be backported... But
> > since there is clear and independent of xen version method of detecting
> > it, I don't think this would be a big issue here.
>=20
> ... there's not really any issue with surfacing this also in older
> versions.

You mean to keep it without #ifdef then? I'm not following... If you add
#ifdef __XEN_INTERFACE_VERSION__ >=3D 0x00040d00 there, the field won't be
available in Xen < 4.13. Which effectively means the patch can't be
backported as it won't compile with Xen < 4.13. Note also that this
structure is the place that Xen use to keep that information internally
(xen_vga_console_info is another name for dom0_vga_console_info), it
isn't only about passing this information to dom0.

Maybe add #ifdef __XEN_INTERFACE_VERSION__ >=3D 0x00040a00, as the oldest
fully supported version? This will mitigate one of the issues with the
lack of #ifdef (potential conflict with gbl_caps with
__XEN_INTERFACE_VERSION__ < 0x00030206).

Or use some #if meaning Xen interface >=3D 4.13, or Xen internal build?

> >> > If not, then at least abort boot when text console is still there
> >> > (blexit before efi_exit_boot). Any preference?
> >>=20
> >> What's wrong with the text console still active? Or maybe I'm
> >> misunderstandint you make...
> >=20
> > As soon as you call ExitBootServices(), you can't use
> > SIMPLE_TEXT_OUTPUT_INTERFACE anymore. Which means if a) framebuffer
> > address didn't fit, and b) you called ExitBootServices() already, you
> > don't have any means to tell the user what is wrong. Other than serial
> > console of course, if you're lucky enough to have one. So the idea was
> > to report the problem before ExitBootServices().
>=20
> Oh, so be "text console" you meant the EFI interface, not a
> console in text mode (which we can drive). Failing to boot in
> such a case seems worse to me than booting effectively
> headless.

Yes, if the alternative is booting headless, then indeed it's better
than refusing to boot with a message. But if the alternative is a
mysterious crash without any message...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--W302I+VHGNbNYdEm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzSxmAACgkQ24/THMrX
1ywO+gf7BrYBO3rM+lYbashDk6Z/zzpR/02rdX+JjPMvCZ6xrlGApOaolM7VMWQ+
NuwPRNz/RiOid6G4NG4FDTBvxRnlGJ4X29tgUFHAd8kflf5k0PI94PlIuGzRSzhR
Sf0/a7W1pdHwkJWuMDbCJaYwzf7ltNEiNmoTC2TA2P0I9lE6lthxXNe9WzEpxhMr
t4Veue29ZInZ+6RCeUcHXatr7un+fgutjm9Jad1fwAXzo/UUmluKnqx91TyVQlKt
HjVwpvNE4J4OMPzbjyEkKSwIrsEtJG7bNoiKJeoBvQ4POTBZx6TfVKC474fHJC4u
WxVDpOFmJD9Fr8lRHI9G16pWS0Lrxg==
=YSJz
-----END PGP SIGNATURE-----

--W302I+VHGNbNYdEm--


--===============8009588525908183709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8009588525908183709==--

