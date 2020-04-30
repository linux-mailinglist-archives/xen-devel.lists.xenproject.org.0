Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AF11C0A6B
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 00:27:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUHeO-0004TZ-Ml; Thu, 30 Apr 2020 22:27:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jGNe=6O=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jUHeM-0004TU-Qc
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 22:27:23 +0000
X-Inumbo-ID: c27cd6f0-8b31-11ea-ae69-bc764e2007e4
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c27cd6f0-8b31-11ea-ae69-bc764e2007e4;
 Thu, 30 Apr 2020 22:27:22 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EE4875C008E;
 Thu, 30 Apr 2020 18:27:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 30 Apr 2020 18:27:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tu6fQI
 GLVqP401hYJBo2JmEUMbfen8l7Ynb5clEVg/o=; b=cRkop69obxub7GCuItFLxw
 WRoPuk+HaSEt9z0x9T5JHx0uUBjh97ZiSAhmJXgGyCQH8ENTHyF8LF8T0hsZMghf
 3s9zQTzTl1QLaZ4s/79tJWiZNiSuBpceELguQy6heMm2gjGZn0kvJ0u75/KzfzU6
 SAU+fXEBeFDHb33g8ZNWxgLmZ9kJXWAxtStw+TviDEZzBhad9GZ57Xeyznv2e4bQ
 7sgjVmZri8CLxjYM2MMaVqQZQIp3ezPS8mGaUA8UTRcYCP4NoLVskNFAZ+ua17tq
 H8ZMczJW7C+2rDq0ErQoNRN9ynYVkaPaKr70c9kfUpcKZzUOf7a6bYNBfdGe+Jng
 ==
X-ME-Sender: <xms:yVCrXqLZyuUnVCwr1OWB0D0NXexYRkebEal7YbmgXnCvatmSUPY0DQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeehkeel
 hfdvfedviedvveehffefteeiteehteekteeileehjefhveeutdekledvnecuffhomhgrih
 hnpehhthhtphdrihhnnecukfhppeeluddrieehrdefgedrfeefnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:yVCrXrGzBB5hTOgzSk-XTGizVI4DUu50GfnPWddmMtmREB6RO2xvIg>
 <xmx:yVCrXspzNcTZOUJPk56rYisfR5GutrlVFv-9km11xn2uUfLBxGgh_Q>
 <xmx:yVCrXsR7llY7Iuz0zY6VGxheSlTg6ktuBu5ntUoDKV8QbPJRVcaF-A>
 <xmx:yVCrXvPCrPnJ-WLF_WBm2daChV6NZs3H1Mi1BkVCFejMm7iTk6oyGQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5E10F3280067;
 Thu, 30 Apr 2020 18:27:20 -0400 (EDT)
Date: Fri, 1 May 2020 00:27:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: [RFC] UEFI Secure Boot on Xen Hosts
Message-ID: <20200430222717.GA6364@mail-itl>
References: <20200429225108.GA54201@bobbye-pc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <20200429225108.GA54201@bobbye-pc>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: michal.zygowski@3mdeb.com, daniel.kiper@oracle.com,
 krystian.hebel@3mdeb.com, xen-devel@lists.xenproject.org,
 olivier.lambert@vates.fr, piotr.krol@3mdeb.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC] UEFI Secure Boot on Xen Hosts

On Wed, Apr 29, 2020 at 05:51:08PM -0500, Bobby Eshleman wrote:
> # Option #3: Lean on Grub2's LoadFile2() Verification
>=20
> Grub2 will provide a LoadFile2() method to subsequent programs that suppo=
rts
> signature verification of arbitrary files.  Linux is moving in the
> direction of using LoadFile2() for loading the initrd [2], and Grub2 will
> support verifying the signatures of files loaded via LoadFile2().=20

This description gives me flashbacks to how xen.efi loads dom0
kernel+initramfs (Loaded Image Protocol). Practical issues encountered:

1. It works only when xen.efi is loaded via appropriate EFI boot
service directly. If xen.efi is loaded by a filesystem driver in
grub/other bootloader, it can't load dom0 kernel+initramfs.

2. Given variety of UEFI implementations and boot medias, it was almost
impossible to force bootloader to use the right file loading method
(cases like the same file accessible both via UEFI fs0: and via grub's
filesystem driver). Which means loading xen.efi via a bootloader (as
opposed to directly from UEFI) was hit or miss (mostly miss).

3. To avoid the above issue, one was forced to load xen.efi directly
=66rom EFI. This gave up any possibility to manipulate xen cmdline, or
even choose system to boot in case of some EFI implementations.

4. Even if one is lucky to boot xen.efi via grub2-efi, then still only
xen options could be modified. But not those for dom0.

5. It was impossible to load xen/kernel/initrd using fancy grub/ipxe
features like HTTP.

In practice the above points mean:

* To get a usable product, one is forced to enable all kind of
  workarounds (not only related to EFI) _in default configuration_,
  because otherwise there is very little chance to enable them only when
  needed.

* If something goes wrong, in most cases you need to boot from
  alternative media (to edit xen.cfg, or efi variables). If you happen
  to forget your rescue usb stick, you are out of luck.

So, please, can someone confirm the LoadFile2() approach wouldn't have
any of the above issues?

> This is set
> for release in GRUB 2.06 sometime in the latter half of 2020.
>=20
> In Xen, this approach could be used for loading dom0 as well, offering a =
very
> simple verified load interface.
>=20
> Currently the initrd argument passed from Linux to LoadFile2() is a vendor
> media device path GUID [3].
>=20
> Changes to Xen:
> - Xen would need to pass these device paths to Grub
> - Xen would be changed to load dom0 with the LoadFile2() interface via bo=
ot services
>=20
> Changes to Grub:
> - Xen dom0 kernel/initrd device paths would need to be introduced to Grub
>=20
> Potential Issues:
> - How will Xen handle more boot modules than just a dom0 and dom0
>   initrd?
> - Would each boot module need a unique vendor guid?

Both above points applies for example to loading dom0
kernel+initrd+microcode update+xsm.

> - Would this interfere with the DomB proposal?  I suspect not because
>   the DomB proposal suggests launching DomUs from an already booted
>   DomB, at which point other means could be used.

domB probably not, but what about dom0less, where multiple domains are
loaded by Xen itself? I know dom0less currently is ARM only (not sure
how that relates to EFI, if at all), but I think in general it would be
good to plan for supporting more modules.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl6rUMQACgkQ24/THMrX
1yzMLwf5ARUssFF46x1oNhWhkBv9iOECgnnKvT86eUlgrxA5TP/92nZoNv72E444
NaekJSR9KbNpIvh+0uwsbSUPTIlUsaa82bUVfJpgF4EKmGtmlpct24t8dlE9Kc7m
Kln6cEcnm99bAUA0LV3IfZZFNy9lCIIBu6MvBHjIewSdV81QqXBbe6AX1Hiwo/IF
fhdHkekpct/d/osIUnXrzgzN1DcjbFs/AuLq4hebJvnnraqS2aNwczwftzREKKOp
MEEoh9ScGvAbSFdyENMQTOT/8m6sXRF+MHOJ0Jx+xpGeGBP5KFRI8kJH22y4aXKC
cQz1ASdmCWU9kPKhdQfskLisGeXRWw==
=q+QN
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--

