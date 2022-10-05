Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193EF5F5898
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 18:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416315.660982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og7ZD-0003r5-VG; Wed, 05 Oct 2022 16:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416315.660982; Wed, 05 Oct 2022 16:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og7ZD-0003o3-SD; Wed, 05 Oct 2022 16:48:19 +0000
Received: by outflank-mailman (input) for mailman id 416315;
 Wed, 05 Oct 2022 16:48:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xhym=2G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1og7ZB-0003nx-J1
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 16:48:18 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8013709f-44cd-11ed-9377-c1cf23e5d27e;
 Wed, 05 Oct 2022 18:48:14 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 78C7532009A0;
 Wed,  5 Oct 2022 12:48:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 05 Oct 2022 12:48:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Oct 2022 12:48:10 -0400 (EDT)
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
X-Inumbo-ID: 8013709f-44cd-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664988491; x=
	1665074891; bh=Wz79Y4QspfEe6xO7znUVT3XLtocL4VjnzI0m/nYf2tU=; b=0
	MSdH3B9/uLN4p8fpR6yYaYJiErne9bLH+kz12ZxfOFxP73m8Z2LFBIZPGmwcEj3O
	+w01s8fcZG2UtDiDDQrqnp0gxuoRRyguqbKkOKgx9kBJwgcnMglRPnwarADmOQrw
	GL66eTlIl3KmWmsgCMkRPqDrZq3Qu/nAJZHj28mTUZqtYXfg+77PcrpxySk1d4Fj
	VkSkxWbSUpWxbANkcT6lpmsFvhCI8hg5JFSy/W4WkOU43N6R4gfuQnoRAWtVx4NG
	WyKXrZgpJwo6G1BGBz2cWvUlLgqiz7xhhdcYpXuM2WHqS6fkGCMAZz6CCVSHdwLE
	ISefBChC/TRWcmlptRkRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664988491; x=1665074891; bh=Wz79Y4QspfEe6xO7znUVT3XLtocL
	4VjnzI0m/nYf2tU=; b=YX4kAzE7AE+Z+QRvAr8gEZdqY4tkcjzYPpD5/r4Mwt7g
	JLc6SV18cSJCUEmRfvi26G3rMAmKSeW5cWe0UdXYHUNGTKOUEBrDQEBkb14atWZt
	/2dnlajtp7jOA8OBHo+zjAZakoZgNtQ17IP0EyZZ1WpdfZyIXSoRDOr0tbQ9Evex
	TUa9NF591QC0c8d6PSDgoZAvWobXcAapBRjnB6rcMxm4Z/T5TiM1KUCcW7qlBnfG
	i2kCkicsX0n3n/VZRAGxUDqFJPxpgyUz+9a7uBuX2uUFqFcpzbGh988uyL+WQfsj
	FRNg9aeStSeqODrAMSB3zsoXZHQ4fYNdzgleax/XMw==
X-ME-Sender: <xms:SrU9Y-_jOXgMmKM8m1pbV6HahL1ooJ7jhO-LW3RXAiP5wLamIKiV2g>
    <xme:SrU9Y-viuN1GWSk4L_OJMXQz6EJHPg_B8V3PSXkXLAaF8iiKz1SIxSWTIqmMau-tm
    PM1rgKquoquDw>
X-ME-Received: <xmr:SrU9Y0AYnHVOykcyymN2bzOVtxGxG_EfoeKuPOJabTqBjLRYaEeSg2ES5GenMBboCOAxnRZDUE9nLdTumYJII90s7f1rlI5wHXet>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeifedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:SrU9Y2c_I3GG_SRWnW8S3VwPxn6UZCiUAjhbVhjWBJ9U7ny8jbYNCA>
    <xmx:SrU9YzNNMNiCEoQLFQtu9hZA8k0SyoGbSH-gocBmfxs-Icdj1xoKXQ>
    <xmx:SrU9YwlN11docgzOZXI-5OrI2JB1Le9_ZKTb6ljTBExcnEu55aPmtQ>
    <xmx:S7U9YyZogJrCdJHSOXREjv-2rU98y1rYHb64DKLOZ-X0JKUOBOSEwQ>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 5 Oct 2022 18:48:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
Message-ID: <Yz21RxJ9xXP8ODb0@mail-itl>
References: <Yz17cLIb1V0zjEjK@mail-itl>
 <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com>
 <Yz2Fvp9Q9aeYKnDY@mail-itl>
 <ecdc11dc-6090-e050-bcba-aafbd8aaf3b6@suse.com>
 <Yz2L9eTdbA3vS43g@mail-itl>
 <e306ac5f-2ce8-944d-ed5d-5aae566c8a80@suse.com>
 <Yz2kKU5qEvD25iJX@mail-itl>
 <a8366482-ba75-19e7-4e82-ba968ec9ddcb@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5Wzz3ezRb+3DS3xP"
Content-Disposition: inline
In-Reply-To: <a8366482-ba75-19e7-4e82-ba968ec9ddcb@suse.com>


--5Wzz3ezRb+3DS3xP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 5 Oct 2022 18:48:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt

On Wed, Oct 05, 2022 at 05:45:56PM +0200, Juergen Gross wrote:
> On 05.10.22 17:35, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Oct 05, 2022 at 05:04:29PM +0200, Juergen Gross wrote:
> > > On 05.10.22 15:51, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Wed, Oct 05, 2022 at 03:34:56PM +0200, Juergen Gross wrote:
> > > > > On 05.10.22 15:25, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > On Wed, Oct 05, 2022 at 02:57:01PM +0200, Juergen Gross wrote:
> > > > > > > On 05.10.22 14:41, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > When booting Xen with Linux dom0 nested under KVM,
> > > > > > > > CONFIG_XEN_VIRTIO_FORCE_GRANT=3Dy makes it unable to use vi=
rtio devices
> > > > > > > > provided by L0 hypervisor (KVM with qemu). With PV dom0, gr=
ants are
> > > > > > > > required for virtio even if just CONFIG_XEN_VIRTIO is enabl=
ed.
> > > > > > > >=20
> > > > > > > > This is probably uncommon corner case, but one that has bit=
ten me in my
> > > > > > > > CI setup... I think Xen should set smarter
> > > > > > > > virtio_require_restricted_mem_acc(), that enforces it only =
for devices
> > > > > > > > really provided by another Xen VM (not by the "outer host")=
, but I'm not
> > > > > > > > sure how that could be done. Any ideas?
> > > > > > > >=20
> > > > > > >=20
> > > > > > > It should be possible to add a boot parameter for that purpos=
e. Using it
> > > > > > > would open a security hole, though (basically like all PCI pa=
ssthrough to
> > > > > > > PV guests).
> > > > > >=20
> > > > > > What about excluding just dom0? At least currently, there is no=
 way for
> > > > > > dom0 to see virtio devices provided by another Xen domU.
> > > > >=20
> > > > > Even not via hotplug?
> > > >=20
> > > > That's why I said "currently", IIUC hotplug of virtio devices under=
 Xen
> > > > doesn't work yet, no?
> > > > With hotplug working, it would need to be a proper detection where =
the
> > > > backend lives, and probably with some extra considerations re Xen on
> > > > Xen (based on below, pv-shim could use grants).
> > >=20
> > > As stated before, this isn't a problem specific to virtio devices. Th=
e same
> > > applies to Xen PV devices.
> >=20
> > Why is that an issue for Xen PV devices? They always use grants, so no =
need
> > for exception. But more relevant here, there is no protocol for L0
> > hypervisor (that would need to be Xen) to provide PV device to nested L1
> > guest (besides pv-shim case, which is already handled), so L1 guest
> > cannot confuse PV device provided by L0 and L1.
>=20
> That's the point. Today using virtio the way you are using it is possible
> only because virtio devices don't have the security features of Xen PV
> devices. With adding grant support for virtio devices this has changed.
>=20
> BTW, you can have the old virtio behavior back by not enabling
> CONFIG_XEN_VIRTIO.

Yes, I know, and currently I'm doing it. But at some point I'd like to
be able to enable CONFIG_XEN_VIRTIO without breaking the nested virt
case. Ideally KVM virtio devices would use something like grants, and
that thing would work even through nested virt, but I don't think that's
strictly necessary for ensuring new security properties of virtio
devices where they can be enforced.

> > > > For me specifically, a command line option would work (because I do=
n't
> > > > use Xen-based virtio devices when nested under KVM, or anywhere at =
all,
> > > > at least not yet), but I can see future cases where you have virtio
> > > > devices from both L0 and L1 in the same guest, and then it wouldn't=
 be
> > > > that simple.
> > >=20
> > > Lets think of a general solution covering all PV devices (Xen and vir=
tio).
> >=20
> > In fact, I wonder what's the security benefit of
> > CONFIG_XEN_VIRTIO_FORCE_GRANT. If the backend lives in dom0 (or
> > stubdomain), it can access whole guest memory anyway, whether frontend
> > likes it or not. But if the backend is elsewhere (or guest is protected
> > with AMD SEV-SNP, XSM or similar), then the backend won't be able to ac=
cess
> > memory outside of what frontend shares explicitly. So, in the non-dom0 =
case,
> > backend trying to provide non-grant-based virtio device will simply not
> > function (because of inability to access guest's memory), instead of
> > gaining unintended access. Am I missing some implicit memory sharing
> > here?
>=20
> You are missing the possibility to have a deprivileged user land virtio
> backend.

Ok, but that backend either can xenforeignmemory_map() arbitrary guest's
page (in which case it doesn't matter if the frontend driver likes
non-grant-based device or not), or it cannot (in which case,
non-grant-based device will simply not work, backend still won't have
access to the guest memory).

Sure, the error reporting might be different, but I don't think it
changes the outcome security-wise.

> And BTW, SEV won't disable guest memory access, it will just make it
> impossible to interprete memory contents from outside. A malicious
> backend can still easily crash a SEV guest by clobbering its memory.

Right.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--5Wzz3ezRb+3DS3xP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmM9tUcACgkQ24/THMrX
1ywYIgf/YrI9enxWgrm58SnJGhwYzSPY0j1rXFwnxi+OpOuxAuQycNT55Lka9k26
30nQ8V1+mOQ7OZwT/Tx+kAhnqjr8A+gWFMwCUu+jK5GWf+KRwSeKUyw4a/OS7Gsj
UewoFF3doEHD8NmfpOxHqVW48j/pTtl9xTLsacNc3uTL2L87mZe543b1WaH1Ds56
sY8fb3t5a/ghGZLEkIN/OUyZndyiuDLg5cK/ZnhRUO8RD+v46Gd+HGp8f7zp77Mu
hZap1u9Yu5sCxm7pPMIjP3dMrWZvsKljKquY4o8dGcnzLN9bE0B8/jI2MaJsjDj0
jvo7DOBxSPsLzjv7dUdlOL1ITkUEJw==
=mHfg
-----END PGP SIGNATURE-----

--5Wzz3ezRb+3DS3xP--

