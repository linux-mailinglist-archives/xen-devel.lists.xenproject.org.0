Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD4A6A0B43
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 14:56:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500408.771770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVC54-00089e-PB; Thu, 23 Feb 2023 13:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500408.771770; Thu, 23 Feb 2023 13:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVC54-00086Y-Lr; Thu, 23 Feb 2023 13:56:18 +0000
Received: by outflank-mailman (input) for mailman id 500408;
 Thu, 23 Feb 2023 13:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qn+w=6T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pVC52-00086R-SS
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 13:56:16 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5e64e92-b381-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 14:56:15 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 5E6973200912;
 Thu, 23 Feb 2023 08:56:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 23 Feb 2023 08:56:12 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 08:56:10 -0500 (EST)
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
X-Inumbo-ID: d5e64e92-b381-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1677160571; x=
	1677246971; bh=ktNn8gxAYMhFy1BFDptQTmujADyAA36Lpgi5DYjsqqg=; b=q
	dU+ZYlWYJaEI4NLJJ2xbYZpbMQ6XHWjZZ6tQP2jBwGhXuTcRFS8SmaNF8gJQu/gR
	EIOKn7Svr5MNqOE8SBolGpv9m7Ax2tK1upRqaOMz8aA7HqiEIGNl0DUX990Kdl8q
	hIADYoIvcSKzfHLxINB4WA6nblWogNTj8oswSqhgLHS8j5LWLQCOQBXI/282BUvO
	vHvZFWAxxXuWBpP/6ui/NR/L6JRtPnQRyyTJ0CJ37h3404hwXbKyN9If5uqYzxf1
	IewxoYvHdwecVvxAdcBxmLLJxl+WBniDzJki5wgILndIZ/t6NmlAtCAEW1RcWiBB
	SK9HbLNNeecw3rXKmldnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677160571; x=1677246971; bh=ktNn8gxAYMhFy1BFDptQTmujADyA
	A36Lpgi5DYjsqqg=; b=stCKBIAUcE07yqf/7O3FjsjPqctSGbTte05ZLXA/ObpW
	rKxLdN6KurU/tR6Wj2tQP0mopZ71Ybma0jCcWsh9XJYUfYNzdmKRXJ0lFLXEnIg9
	IyrJN6WUdWBU1Ukw4zhVldk+a+DJeIbay7fpsBIcHqrm3KEBo8P3dGBGjudgW2jK
	pENfsI9B0KvNOc3IVB+f8XNcAyvWwhl8rqwXKHNC5/twyMf+s4J5eCAUPcDIzKtN
	OfCfJmnj9kwVpmbJh+GhkSLBo4wZgdnJmI5LYT0+6tYwGqXORvmqPEZLASHkt5jz
	ykPUUdRSFX6u94R2QIpKYylh1P9/R1iZlU7MKTR+2A==
X-ME-Sender: <xms:e3D3Y-x6TcRQZPhBOPSGQ6VROC7Jb9zuGQWgJsUNfvQoTdft2JI4jw>
    <xme:e3D3Y6R683IEba3vLIKzanOGb9ttqUjqNNL3bIUIoaFI7A3zEsB-vTnZF8E6wNKWK
    vMPOPBKRmYUZg>
X-ME-Received: <xmr:e3D3YwXoavC_3XfkJS9x54PKvzrIE6v0FPQw-Cdhl8G1ey7T7I_e-98dAj4InsrXt2vd665v5u5DWk4WYsTL7ECDfiUHqp7BmbE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekuddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieel
    uddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomh
    grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:e3D3Y0i0eOkLWnkoytDZQPHXfMl68X9oDFrEcvoNJhZUoiiqzUU0RA>
    <xmx:e3D3YwA3AbkIopy0x3qf946zPDCTvhb7hYFMtUAndnqsazUaR7z02g>
    <xmx:e3D3Y1IH1REk8Wr6GUJPJ0L7v2h-_hK8C24sqenHl6OeEvmiSN8tyw>
    <xmx:e3D3Y_5y7OurRDaq4XX8ztz96TKwtk3re7OXOn40VdJUV1cf5KEqGA>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 23 Feb 2023 14:56:07 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Call SetVirtualAddressMap() by default
Message-ID: <Y/dwd5Gkv5Ps61eC@mail-itl>
References: <9a0e5021a612951c4174c45099edc8a4fb5bd3bb.1677091168.git.demi@invisiblethingslab.com>
 <dc46acc1-9eb9-8091-28df-405a66879a85@suse.com>
 <Y/dlPXeJlPRwEB1s@mail-itl>
 <49f35c93-2235-4223-89dd-3e6256a17369@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="re6ZZuhP7xjg3N5M"
Content-Disposition: inline
In-Reply-To: <49f35c93-2235-4223-89dd-3e6256a17369@suse.com>


--re6ZZuhP7xjg3N5M
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Feb 2023 14:56:07 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Call SetVirtualAddressMap() by default

On Thu, Feb 23, 2023 at 02:21:11PM +0100, Jan Beulich wrote:
> On 23.02.2023 14:08, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Feb 23, 2023 at 11:16:28AM +0100, Jan Beulich wrote:
> >> On 22.02.2023 20:14, Demi Marie Obenour wrote:
> >>> To quote Andrew Cooper:
> >>>
> >>>> I know we've had this argument before, but not calling
> >>>> SetVirtualAddressMap() isn't a viable option.  It's a prerequisite to
> >>>> function on literally millions of devices
> >>>
> >>> Qubes OS has been shipping EFI_SET_VIRTUAL_ADDRESS_MAP for years, and=
 I
> >>> believe OpenXT and EVE ship it as well. Mark EFI_SET_VIRTUAL_ADDRESS_=
MAP
> >>> as SUPPORTED and enable it by default.
> >>
> >> This is insufficient justification. The main reason why we don't call
> >> it is because it can be called only once. Any entity taking over later
> >> (e.g. via kexec) can't do anything anymore about the virtual address
> >> associations once set. Hence what's needed to justify a change like
> >> this is an explanation of why this restriction is not really an issue
> >> to anyone in any case.
> >=20
> > AFAIR from the discussion about the original patch, kexec under Xen does
> > not preserve runtime services working anyway, so this limitation is more
> > about some possible kexec implementation in the future, not actually
> > breaking something right now. And since Linux calls
> > SetVirtualAddressMap() _and_ supports kexec just fine, it's definitely
> > possible to design this future kexec extension to work after
> > SetVirtualAddressMap() too.
> >=20
> > Relevant parts of that older discussion:
> > - https://lore.kernel.org/all/272a9354-bcb4-50a4-a251-6a453221d6e3@citr=
ix.com/T/#u
> > - https://lore.kernel.org/all/20191009235725.GT8065@mail-itl/T/#u
>=20
> Well, there are various statements there without further reference. I'm
> having a hard time seeing how a full-fledged Linux could do well without
> runtime services, or without being able to set the virtual address map
> to its liking. If they can, then a question would be why they need to
> set the virtual address map in the first place (yes, there is this
> supposed "firmware bugs" argument, which unfortunately I lack any proof
> of; at the very least I'm unaware of bug reports against Xen boiling
> down to us not making this call).=20

The second link points at a thread of one of such bug reports. The first
link points at thread, where initial message contains list of systems
affected. If that is not enough, I can point you also dig up (at least)
tens of Qubes users reporting similar issues in the past. I'm sure
Andrew could do the same about XenServer (which is why "mapbs"
workaround exists).

> Plus maybe they can merely because old
> and new OS are similar enough in their (virtual) memory layout? IOW
> kexec-ing to Linux for crash dumping purposes is just one (important)
> example of the functionality that needs retaining.=20

It works just fine with Xen calling SetVirtualAddressMap().
SetVirtualAddressMap() is relevant only for using runtime services, and
you don't need them for crash dumps. In fact, runtime services are not
accessible to post-kexec Linux anyway, so this call doesn't change
anything.
Additionally, given most stuff works
just fine with efi=3Dno-rs proves it isn't severe limitation, if it really
would need to be there - but as Andrew noted, given Linux example, it
doesn't really need to be the case - it may simply require a bit more
thinking when adding runtime services capability past kexec.

> Once we get better
> PVH Dom0 support, maybe other Dom0 OSes surface with entirely different
> needs.

I find this claim rather weird. Runtime services are a thing that Xen
needs to call, not some domain. And Xen has control over its memory
layout.

_If_ PVH dom0 would really turn out to be incompatible with
SetVirtualAddressMap() call by Xen (which I highly doubt), then some
alternative for that case can be made. But that's only speculation.

> As said back then - part of the reason why in the original
> implementation I've avoided making this call is because of the fear of
> closing possible roads we may need to take in the future.

Yet, not calling SetVirtualAddressMap() leads to actual issues _right
now_, not in some hypothetical undefined future.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--re6ZZuhP7xjg3N5M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmP3cHcACgkQ24/THMrX
1yxcPwf/bLL32pX1Oylp3u/Gbhc5EXKDuODIpm2OkRg5Mg0zQqoMHQTJD98RmFxO
Bvkclj/qfCmXqgy/e277lLuVJvR3kLKXsCMI4HYVR8PPvWbBGtdFPS7fIgWPeeFR
yGvvyUANiMtaODQvjiQDcJIZ1XyDfpYG3nh+iaicnVy7GRjlX04WZEzGUUjgswMW
/wYkrnY+3etjEJHTutgpxwAN8DSsm1KomuQ2cvVemPZHRNTRqTCxCxem3KaxaYzP
DneztmeCJ2OcFcAGXGEiufn/WRU5aTkCYi3Xxw8USNfMBC/C26vwN9eygSI5mKHx
qC/YZxs0IDFcO+xbIEoobdpjxws1hQ==
=QtmJ
-----END PGP SIGNATURE-----

--re6ZZuhP7xjg3N5M--

