Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027AA63A9EA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 14:46:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448920.705501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozeRF-00026S-Rj; Mon, 28 Nov 2022 13:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448920.705501; Mon, 28 Nov 2022 13:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozeRF-00024g-OD; Mon, 28 Nov 2022 13:44:49 +0000
Received: by outflank-mailman (input) for mailman id 448920;
 Mon, 28 Nov 2022 13:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwc9=34=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ozeRE-00024a-97
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 13:44:48 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d09f925f-6f22-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 14:44:45 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7FA6B5C0136;
 Mon, 28 Nov 2022 08:44:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 28 Nov 2022 08:44:43 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 08:44:42 -0500 (EST)
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
X-Inumbo-ID: d09f925f-6f22-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1669643083; x=
	1669729483; bh=me2xJR9KwKVEE8ktVSM+nRFnWYDYu52Yxlt4XSskicY=; b=U
	TTF3+0y5QEh9eH+LuP/VNDq2iKlI7mS5r74wvlOCIjiPzgyU6/nT7420hiJ6t4ma
	EV6YNmoy4n4KAy/P3svfsw/q7OX0rTxX/toJpi4KCX4PZ/LiiAIpR7YN2toZLKC8
	yOa56dF84TJqwt4+Q5L0ClwItRhUdRU3OxB4I/O3kPBhLqLV5DVReG82SEpOugkY
	jyvALZKIakZICYu1fIdYzXl2kASWWqIb6pVXnpX4sD5rTcaBdTw2vfeOlHb2GoPO
	79bcI82YbOcYLsZNCMYd0mBSoEHH6A7wOeJS2VqLE36ugfOyGKQ18GZ82JK/yLWF
	31MMyFby1Cl6HonQZKcnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669643083; x=1669729483; bh=me2xJR9KwKVEE8ktVSM+nRFnWYDY
	u52Yxlt4XSskicY=; b=xN2M/q4xDa1cSYUbAuKlhx+Uh4BZxc0Nulb5ZP7y49JN
	xFuBr9LtQybNzFW3ttFnH9nxvItGjdi8dwkcJFHeyDUpCyJxrosev52oL6faznJG
	fBsOfVgJUOUeP+OkQB3YTheC/z879+9Wr56wereGH/u8HlSk3qUYByTTOdJ+cP5a
	BhGTFdnE3IDIWsXBqZi1r+V2Pk4j9zvV3RamZrA3utQ6supI1oN1a4Q6DzeB6R8D
	iA6v8BorjyZMUidtu0I7/sznLffJ7pCJzMK4PPImUmZOA1Uomk13R/g4TldhC4JQ
	1yvNwrU6uRJ6V1BRiYfsPrGAynpaNInKOiaFgX3y7w==
X-ME-Sender: <xms:S7uEYykVLI8r8lfb0IyrQY3bkjdnNC8A3Io39pHr61BU7Sjwc037gw>
    <xme:S7uEY530iejorV1b2BsoB0dKYYDrWmRb1Skrd7RAYcgxu26jsmb4M_HcCC14F75wA
    y90bMGP-VqVgA>
X-ME-Received: <xmr:S7uEYwqNnpL8vOFpDVKd0oJm4qU3KAXrsqwivAntSG8iseGY6aEtcJxIASmCPkTvNr5chl5e1jxgpiwSNWJaHs9IkDNPqsEkPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:S7uEY2l1VNZoxcR4_YV3eP3TAnVZ7_vECghRq7QEp6uu2r8KbaS9_g>
    <xmx:S7uEYw0YgqpGsjFG28fAT9i3cBfmyVxLsXYKgdbT7eCQHMVhNDmfeA>
    <xmx:S7uEY9uH4m3XhOslCff-9QuqVtXX8Xf41WZ03XABEKfnAZMoMd3dZg>
    <xmx:S7uEYzSOI8XYbz1C_7JICLumAlXy_PacKMvUOHHZex8-FbM34SQc4g>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 28 Nov 2022 14:44:39 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] xen-pciback: Consider INTx disabled when MSI/MSI-X is
 enabled
Message-ID: <Y4S7R2dN7kpJnPpY@mail-itl>
References: <20221118154931.1928298-1-marmarek@invisiblethingslab.com>
 <CAKf6xpuCxftyQ+PKN_ffJ0onsSxcT8kVSwkM7Z10pfjqf0XFgA@mail.gmail.com>
 <Y3f9O0S8kVXZ+py+@mail-itl>
 <CAKf6xpvUcR=rta6SD7mw_pvgQJTxKjN5VHpC6x-zCAiaJ=pKfg@mail.gmail.com>
 <Y3kFYeml1CPL318u@mail-itl>
 <CAKf6xpts-u_JUtTGnzhxmRHZYVFnVMksTERZWS8EC+7BGsoViw@mail.gmail.com>
 <Y3ukZqLaTqzjY/ro@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aozQvSbj7iUV5V+i"
Content-Disposition: inline
In-Reply-To: <Y3ukZqLaTqzjY/ro@mail-itl>


--aozQvSbj7iUV5V+i
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Nov 2022 14:44:39 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] xen-pciback: Consider INTx disabled when MSI/MSI-X is
 enabled

On Mon, Nov 21, 2022 at 05:16:37PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, Nov 21, 2022 at 10:41:34AM -0500, Jason Andryuk wrote:
> > On Sat, Nov 19, 2022 at 11:33 AM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On Sat, Nov 19, 2022 at 09:36:54AM -0500, Jason Andryuk wrote:
> > > > Hi, Marek,
> > > >
> > > > On Fri, Nov 18, 2022 at 4:46 PM Marek Marczykowski-G=C3=B3recki
> > > > <marmarek@invisiblethingslab.com> wrote:
> > > > >
> > > > > On Fri, Nov 18, 2022 at 03:46:47PM -0500, Jason Andryuk wrote:
> > > > > > I was trying to test your xen-pciback v3 patch, and I am having
> > > > > > assignment fail consistently now.  It is actually failing to
> > > > > > quarantine to domIO in the first place, which matches the failu=
re from
> > > > > > the other day (when I more carefully read through the logs).  I=
t now
> > > > > > consistently fails to quarantine on every boot unlike the other=
 day
> > > > > > where it happened once.
> > > > >
> > > > > Does this include the very first assignment too, or only after do=
main
> > > > > reboot? If the latter, maybe some cleanup missed clearing MASKALL?
> > > >
> > > > It's the quarantine during dom0 boot that fails.  Later assignment
> > > > during VM boot fails.  I tried warm reboots and cold boots and it
> > > > happened both times.
> > > >
> > > > I also modified my initrd to halt in there and checked the config
> > > > space.  MASKALL wasn't set at that time.  I need to double check -
> > > > MASKALL may have been unset after dom0 booted in that case.
> > > >
> > > > I'll test more to figure when and how MASKALL is getting set.
> >=20
> > I'm testing with a laptop without a battery.  It seems MASKALL remains
> > set when rebooting or when left plugged in.
> >=20
> > From unplugged, a cold boot doesn't have MASKALL set and the network vm=
 boots.
> >=20
> > After that, rebooting the laptop leaves MASKALL set on the NIC when
> > the laptop reboots.   NIC assignment fails.
> >=20
> > Shutdown and later boot while left plugged in keeps MASKALL set.  NIC
> > assignment fails.  I have only tested this scenario for short periods
> > of time, so I don't know if it would eventually clear after a longer
> > time.
>=20
> That's interesting, seems like firmware is not resetting the device
> properly. Maybe related to enabled wake on lan?
>=20
> Anyway, resetting the device at domain create/destroy is AFAIR normally
> done by pciback (at the instruction by the toolstack). Should it maybe
> be done when assigning to pciback initially too? Or maybe in this
> specific case, device reset doesn't properly clear MASKALL, so pciback
> should clear it explicitly (after ensuring the MSI-X enable is cleared
> too)?

Can you check if `echo 1 > /sys/bus/pci/devices/$SBDF/reset` clears
MASKALL on this device?

I'm tempted to add libxl__device_pci_reset() as part of
libxl__device_pci_assignable_add().

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--aozQvSbj7iUV5V+i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOEu0cACgkQ24/THMrX
1ywlKQgAjmX9f7oEMMKhPvTU9Cwer1pxYt/jaRfYJThGAZvH/4w7VkyNInSN2u6G
7obNR47Rju6OXU1j7JOO5uW6DDQ6oo4tyRzYUpJl3a0QVSRpTgSN32eisomrGSSB
1/TU7XFcKS+ZBXJaRqq6whhdiXwFRuPhuO96pd4JVcxRoL2ocGzS/3B01Vv4OF5N
0bamXgj9FFQvUcXHcQRWzwj/mjOShwe/dYeDjaAmCf4kKJBAX5TJg3mEu3e7yz3d
MiKHnU0bLSOC38cW3/XMs16NH3cMYD48ickM7Eca5PmZAX7wQrAeCJiVBuH8IHPR
ZlSWFUeLsMnImI4snXIT4aex+c/2Mw==
=Yg9M
-----END PGP SIGNATURE-----

--aozQvSbj7iUV5V+i--

