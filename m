Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029B133E110
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 23:03:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98492.186873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMHmT-0001zk-2T; Tue, 16 Mar 2021 22:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98492.186873; Tue, 16 Mar 2021 22:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMHmS-0001zL-VT; Tue, 16 Mar 2021 22:03:12 +0000
Received: by outflank-mailman (input) for mailman id 98492;
 Tue, 16 Mar 2021 22:03:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqCR=IO=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lMHmR-0001zF-JO
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 22:03:11 +0000
Received: from wnew3-smtp.messagingengine.com (unknown [64.147.123.17])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ededde26-63bc-4a44-8a85-7217511a7845;
 Tue, 16 Mar 2021 22:03:10 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 9604DE70;
 Tue, 16 Mar 2021 18:03:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 16 Mar 2021 18:03:09 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id D3179240054;
 Tue, 16 Mar 2021 18:03:05 -0400 (EDT)
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
X-Inumbo-ID: ededde26-63bc-4a44-8a85-7217511a7845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AoyIDT
	hAW8nctfMtr9MDZyqtoc2Z154bW8bqp9W1djU=; b=HgqUmXLdGz9/TIWV12kIAt
	t0fCLcsm73l9UUHiH5YSrNhvY9RSyyJPZ1XEIoTt8VnM8/c5K4Upowd+V+UUkzC/
	/4vZkpS141NELeRJ6fpyU3qvcFZQOeYq5o7BeUB+GW6L+1VqKxNa15CCxrATXKEh
	NdPHAVVPBh793ReNtwvlbb8DQjY86GyLeLBZKhcrh2RTUjIT4BnOIGYq8q+7TtBG
	3mxD2gddY7R70/mlQ7W0FW1MUYMA1Rfz0qswrozVsLdpM9RkXQWIEB0AoUQZmRSd
	tU7MBSLqD//cjT2pmtz8W4MSXh11DuPXUbI9Q2c5djhNZY1l2VHkvEj+KdyvZwCA
	==
X-ME-Sender: <xms:GytRYCNJuQldgvLkDWMvQVH-d8jhpbnysC5oNU2o_-TtivYo9yigOw>
    <xme:GytRYA-y06mGkQS2_mAFUB4W8vjeNRox0siFxY7WPruPBcIM3hWeSVD6ujpVrFriP
    x6G9hqOnUrWKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgudehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteev
    ffeigffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppe
    eluddrieejrdejledrgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:GytRYJSiUKAMH_5cJ-nUYN1QJiXn0gcYN2STSDSi8bKnkodXUkk8lg>
    <xmx:GytRYCuduTG2meZkYbXA1S9UVaLsHPEIgG28rg9G8gRPOScFhCxXcQ>
    <xmx:GytRYKdRJFlTxI_qvW7OBoRw2oryygldpAOyVtEgp8RE3QsQsJGPeg>
    <xmx:HCtRYAveWQegKouKQjG8l854iwIOrSLJdFvuDsMDAA16aeJX3uY-zKWO9ZE>
Date: Tue, 16 Mar 2021 23:03:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, piotr.krol@3mdeb.com,
	Olivier Lambert <olivier.lambert@vates.fr>,
	Trammell Hudson <hudson@trmm.net>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Roman Shaposhnik <roman@zededa.com>
Subject: Re: Working Group for Secure Boot
Message-ID: <YFErFr69MqWvQBHa@mail-itl>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
 <1039be05-cbf2-95aa-5eba-246fb06be8e5@gmail.com>
 <e1d7b456-e710-d699-8fcf-234de10e9b36@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7iZ1OBKMTPuvUzsU"
Content-Disposition: inline
In-Reply-To: <e1d7b456-e710-d699-8fcf-234de10e9b36@gmail.com>


--7iZ1OBKMTPuvUzsU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 12:42:26PM -0700, Bob Eshleman wrote:
> Which of these dates work best for you? Which absolutely
> do not work?
>=20
>   Mon. March 29th, 16:00 UTC
>   Wed. March 31st, 16:00 UTC
>   Mon. April  5th, 16:00 UTC

All three works for me, with a slight preference to either Monday.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--7iZ1OBKMTPuvUzsU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmBRKxcACgkQ24/THMrX
1yz1ugf/TNaMrXLiC5cvIRllDpnJAYUgrtSqapxmKfwrUqY8gH//TAhAjF8Hdnp5
qfbmbenqla2s5bpJT5ln08v+mxpfGwNyZqCAMdXP1yAW1TQxjlcUqVAak2eidtLn
WfNB8oDhbxrzHdv6/lS2OEkN8xfGvb8t7p9LDrhejD3UvCqleyrssf29we5p1r8b
vH8Ow6d/RtEOAoC5zobMIGqR9ZaGBugwn5AWbUVfQ8355p+cb6mupEYWSdDh75Ix
PeSu5Hxt88YKgS2Oq1QNx0tbHWyiFA9Z9Y8MwjQBZA2bLkClbRFWPRSacVvkBVyO
dMTAevJ0qHxGA9ihuzAqUcTE4HM9Xg==
=csJ1
-----END PGP SIGNATURE-----

--7iZ1OBKMTPuvUzsU--

