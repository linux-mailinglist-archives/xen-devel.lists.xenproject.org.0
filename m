Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EEB5F57AA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 17:36:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416289.660948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og6Qa-0003Xg-4i; Wed, 05 Oct 2022 15:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416289.660948; Wed, 05 Oct 2022 15:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og6Qa-0003VS-1o; Wed, 05 Oct 2022 15:35:20 +0000
Received: by outflank-mailman (input) for mailman id 416289;
 Wed, 05 Oct 2022 15:35:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xhym=2G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1og6QY-0003VL-B6
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 15:35:18 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cede8f3-44c3-11ed-9377-c1cf23e5d27e;
 Wed, 05 Oct 2022 17:35:14 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8AD253200488;
 Wed,  5 Oct 2022 11:35:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 05 Oct 2022 11:35:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Oct 2022 11:35:09 -0400 (EDT)
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
X-Inumbo-ID: 4cede8f3-44c3-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664984110; x=
	1665070510; bh=lTcbQqqeWc2OmCvINha5oPtLh8mV297W9YFO64soRUs=; b=J
	989BNhT+w/draC5p+5ZBRrrJH75HqVNoRE7cmBkaSlpHl/JQ4UFX195hfwInwSlS
	bCzscooZPQJ66zQa7modNl+wTaRU+GbMNvkDfQfjobqEEKFlWM1PMvmk3eziuGX7
	yiQkEv2rT5ssOwp/KpCBrW89GFWbXTU4MEefYgbU/kgOtGAguoZ+WLSztfLdNHvN
	42+44UWb8htesoir5BTSTWjd6c2d+onQcK1sTg09HlxUoA0ERheckPu7QUkb131j
	rmlx5QHUsix5cClKqGO8X6Q5qpJlrvUyVhRn9JWWvfKUvd8/huWdXVusdCQPcNRG
	cjvpzsQ7WgwfFORvHUL2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664984110; x=1665070510; bh=lTcbQqqeWc2OmCvINha5oPtLh8mV
	297W9YFO64soRUs=; b=ehpJ582SL0YYy0Eg/KvAOPWsZe9++Du814dI+msCCi2Q
	EkUIzQW036QaE7Zs+4moufwGIzXfQsDrgnSASQujGExYirnaxSyOYuaKETrcJo0Q
	GcLufFNrV+kiHJmfrxUmsFkw8HzNW6wRRIHCAYSPYGMXBhjIR6rUlzV7ioYEjCDA
	0NZ7RkxmCNtgJc9AUTxcQThqsPwYpMVdTGv+mrUl0tPk8ZWh2538DeTA7wO7rvTl
	pcBRom6vsEGpKtuzOiRvEoSCgKF7p5ft7snLo8ZuZfNi69BP8IpecZvoTnaueWHu
	/QMdmtM0j5VK4pomKK9E/5eISQhbHe8UzIGRm35Frg==
X-ME-Sender: <xms:LaQ9Y8tWVQ15UjtdGxCryudMXHcWj9CqdltiGMriyy7DiYBf-v20Iw>
    <xme:LaQ9Y5dyaq43kKKYvM1MnOBykeLgemR9BZvege6HlMXBiuYQQvFDwYLj3emK-pjAF
    UhHyHOkwYgCiA>
X-ME-Received: <xmr:LaQ9Y3zM2nJsP-LLLCwV9JtKoAhuEgiv2zyMF8kPAeaPDyER3NOopPLMDQZJPTHasWhwWQLwNrnuubWWNI50zyyr1tQcS4I5h2Q->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeifedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:LaQ9Y_PkE8oS2U-bAGLe_yuxHrbtjgexi68krUPe9hV9nlBxnEYnDg>
    <xmx:LaQ9Y8-RcvBZpxPcoTlAIZRRJZ3b_lKywCaRt7KoC1Wzijzmfna2FQ>
    <xmx:LaQ9Y3Wrgr34eNm3F0_rU9JsJhd_qETYWIlr8DTfX2J_FzmiqHoTBA>
    <xmx:LqQ9Y1LBe2FHny8cNrAoVH8V0DesZott2t13pTRQLzWAWadAU9t2ig>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 5 Oct 2022 17:35:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
Message-ID: <Yz2kKU5qEvD25iJX@mail-itl>
References: <Yz17cLIb1V0zjEjK@mail-itl>
 <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com>
 <Yz2Fvp9Q9aeYKnDY@mail-itl>
 <ecdc11dc-6090-e050-bcba-aafbd8aaf3b6@suse.com>
 <Yz2L9eTdbA3vS43g@mail-itl>
 <e306ac5f-2ce8-944d-ed5d-5aae566c8a80@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QvVVrjpr6f5GNPbq"
Content-Disposition: inline
In-Reply-To: <e306ac5f-2ce8-944d-ed5d-5aae566c8a80@suse.com>


--QvVVrjpr6f5GNPbq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 5 Oct 2022 17:35:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt

On Wed, Oct 05, 2022 at 05:04:29PM +0200, Juergen Gross wrote:
> On 05.10.22 15:51, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Oct 05, 2022 at 03:34:56PM +0200, Juergen Gross wrote:
> > > On 05.10.22 15:25, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Wed, Oct 05, 2022 at 02:57:01PM +0200, Juergen Gross wrote:
> > > > > On 05.10.22 14:41, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > When booting Xen with Linux dom0 nested under KVM,
> > > > > > CONFIG_XEN_VIRTIO_FORCE_GRANT=3Dy makes it unable to use virtio=
 devices
> > > > > > provided by L0 hypervisor (KVM with qemu). With PV dom0, grants=
 are
> > > > > > required for virtio even if just CONFIG_XEN_VIRTIO is enabled.
> > > > > >=20
> > > > > > This is probably uncommon corner case, but one that has bitten =
me in my
> > > > > > CI setup... I think Xen should set smarter
> > > > > > virtio_require_restricted_mem_acc(), that enforces it only for =
devices
> > > > > > really provided by another Xen VM (not by the "outer host"), bu=
t I'm not
> > > > > > sure how that could be done. Any ideas?
> > > > > >=20
> > > > >=20
> > > > > It should be possible to add a boot parameter for that purpose. U=
sing it
> > > > > would open a security hole, though (basically like all PCI passth=
rough to
> > > > > PV guests).
> > > >=20
> > > > What about excluding just dom0? At least currently, there is no way=
 for
> > > > dom0 to see virtio devices provided by another Xen domU.
> > >=20
> > > Even not via hotplug?
> >=20
> > That's why I said "currently", IIUC hotplug of virtio devices under Xen
> > doesn't work yet, no?
> > With hotplug working, it would need to be a proper detection where the
> > backend lives, and probably with some extra considerations re Xen on
> > Xen (based on below, pv-shim could use grants).
>=20
> As stated before, this isn't a problem specific to virtio devices. The sa=
me
> applies to Xen PV devices.

Why is that an issue for Xen PV devices? They always use grants, so no need
for exception. But more relevant here, there is no protocol for L0
hypervisor (that would need to be Xen) to provide PV device to nested L1
guest (besides pv-shim case, which is already handled), so L1 guest
cannot confuse PV device provided by L0 and L1.

> > For me specifically, a command line option would work (because I don't
> > use Xen-based virtio devices when nested under KVM, or anywhere at all,
> > at least not yet), but I can see future cases where you have virtio
> > devices from both L0 and L1 in the same guest, and then it wouldn't be
> > that simple.
>=20
> Lets think of a general solution covering all PV devices (Xen and virtio).

In fact, I wonder what's the security benefit of
CONFIG_XEN_VIRTIO_FORCE_GRANT. If the backend lives in dom0 (or
stubdomain), it can access whole guest memory anyway, whether frontend
likes it or not. But if the backend is elsewhere (or guest is protected
with AMD SEV-SNP, XSM or similar), then the backend won't be able to access
memory outside of what frontend shares explicitly. So, in the non-dom0 case,
backend trying to provide non-grant-based virtio device will simply not
function (because of inability to access guest's memory), instead of
gaining unintended access. Am I missing some implicit memory sharing
here?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--QvVVrjpr6f5GNPbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmM9pCkACgkQ24/THMrX
1ywGXQf/XDwhrncXUZl9w1kxEZJoQfmJylbOrKU90oOtW1kKB172iFbMfYz/6Ry7
L3YQuGI2Tui+wXTjlIn0uC1c2TlXyII8WJwomK11Sq1mEQAAv673vSzmjq57hxj/
XKMvNeXZGQ0WYOefmKZJHwycLjza1iQ5VMu+LnOMtG/3t+NQ4BTh1QhQhu7CJ4Qi
9efKZDtH6pGLVrF1vpo2Ihqn/c0cLLp3IDwSPfvtBlmHei7vFjfHOtzb8eAdm6Ha
XygnzjUqsa9yKBcw80JsiYcyPl5U9XhaAhKLF8DqYzQc5btwErujeD3plkEn9tEW
aSBkdIYTo894Ot2gwpJosRdU8yEB+w==
=dmqI
-----END PGP SIGNATURE-----

--QvVVrjpr6f5GNPbq--

