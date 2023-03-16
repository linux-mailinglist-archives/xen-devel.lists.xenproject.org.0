Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA746BD7B7
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 19:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510779.789135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrwA-00045M-RK; Thu, 16 Mar 2023 18:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510779.789135; Thu, 16 Mar 2023 18:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrwA-00043a-Nf; Thu, 16 Mar 2023 18:02:50 +0000
Received: by outflank-mailman (input) for mailman id 510779;
 Thu, 16 Mar 2023 18:02:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItE1=7I=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pcrw9-0003Xn-7a
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 18:02:49 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2584869-c424-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 19:02:48 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C97643200943;
 Thu, 16 Mar 2023 14:02:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 16 Mar 2023 14:02:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Mar 2023 14:02:45 -0400 (EDT)
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
X-Inumbo-ID: c2584869-c424-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1678989766; x=1679076166; bh=7BTs8CaTWFGvvtNJDfTZph81LQISZET8aHx
	fA9adzAw=; b=iMpM50IlN2bx8b5lQnokdfrRXUoQ5Fu+WH1MyUohHT2VMxxaQ5P
	BCPIwceE+JGtwggJubLy6L/0kQ1tjFsL2GyCUIUCR4ZsUrKnrohjg1YL1vCuNwok
	UlR2uUe3auHbJcwe4w08Nh1sR8vOwV2jMCPVnQqjDo5mGkFXJRZlYA4Iz1AxNIdI
	jSMW1R+XgNXHM/7HE82F+z1ZAju9g//RoI06MMBY9y8HjoulSe/YZmomFpam2RhI
	ys+tI0pfwU0DnsKGcokBZqT0hFe/GyccSq0FsFk6thvd8SAApM6Apmb26hN/c7Pz
	ihl6PpYnlBeAB26aEPhHrrUWkDlptR/gwjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1678989766; x=1679076166; bh=7BTs8CaTWFGvv
	tNJDfTZph81LQISZET8aHxfA9adzAw=; b=EtdH2E+yjfwDRDLeUu8m3DMRrr81v
	SYkN+X3EjG5VSUGT7EASFSbKUSU1vUtLFWlVzvtzjwLCviqgnGm0jSU8GzzUBEM9
	9sZ94WirT2EibBa5XP/lNTyjtMU2vsLGglGkQ5fGnkZqtcMqLLc1a6FR3OSTzFjH
	3lnzzQoHrk7byWwsAR1tRmcohVD3ct07gBgXwHaoQHCmyA+NMEt8SysXXDHgNfEA
	tQCnSAEDlp+0NkE19V6xrfsyBr2LLMUYFpMVEUUKySpNhODc8puba8JEu/8owwCY
	OVuKKZE8QWnyod29XaAyv6ZCor1tmEIoPsibvDPjndZkZM8l8R1SEPl3w==
X-ME-Sender: <xms:xlkTZKyWjLYrW7FM8CTWofVGj63zTep6VPp05KOylVJgMQj-V9k8Xw>
    <xme:xlkTZGTLwF_s-55dXGCdTOltx35_A3hwBoQEaqFzgxDcSyhlxJGycaMWyOdc83iES
    98DfzsHfCPPGw>
X-ME-Received: <xmr:xlkTZMXJYis3a4TSY8LeQh94NV5BsY7hfzlcdfqu_aLRongDY90DanqetF_1YqlAjla1uTNJRuMAJ8yliZczeD__ztCN94B02Gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeftddguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:xlkTZAhT1lYqGRQv2VHKQ_bqTs-QaEhTtcOW_qz-Ypwp_UP2vJMPrw>
    <xmx:xlkTZMBOfj9QKaXhxaEtGTwA8gE4GyvP-LcpBf-SWzCzwux5U5_gVw>
    <xmx:xlkTZBKkbh2axrbCdjeerQcOUFSnquXba34auqOLUNNdQvh2ic8Gig>
    <xmx:xlkTZPNzvABSzj3_fzI9ioF-4FzNEidmxRdkPiLNzn1lG4AWj7UV7A>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 16 Mar 2023 19:02:42 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 3/7] tools: Delete trailing whitespace in python scripts
Message-ID: <ZBNZwzCpe3e3HTPu@mail-itl>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
 <20230314141520.3652451-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XlwlU7QZw00SNn6M"
Content-Disposition: inline
In-Reply-To: <20230314141520.3652451-4-andrew.cooper3@citrix.com>


--XlwlU7QZw00SNn6M
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Mar 2023 19:02:42 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 3/7] tools: Delete trailing whitespace in python scripts

On Tue, Mar 14, 2023 at 02:15:16PM +0000, Andrew Cooper wrote:
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--XlwlU7QZw00SNn6M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQTWcIACgkQ24/THMrX
1yz8Ygf/RzpZm5CyGxYRivhjpEwaJmiKSHIqF49rPJlL1DVcbzeTozTUCOa4dpFG
kOg+KscmjOr2UKwraAdoyvZkHYWJugiNaqtIEZBBVxUqIWqG8G67fFSJWqc5G69i
ijQ1AsI+3EVgJ/uiDIrLGzIWGKaQ0yw5DLT48lelEdrJoxBwm5QRKxWNcBAMz4lT
WKtJxSv9wnP6CbvzmAcD3p5VPd6+meqXkDM7mjgVJ06u2ilbuVMeIweaNJThme1V
7EKCbwUUAPwRarOJbRHgrJjW2t+A793AEY9zMt8PXz8bfMuf7cRAt6LHUjVdKCBG
kjCpGRG4tA+otUZoW1Pq1cEW31+phA==
=78Yl
-----END PGP SIGNATURE-----

--XlwlU7QZw00SNn6M--

