Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A87B553DA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 17:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122281.1466092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux5t5-0001ng-B1; Fri, 12 Sep 2025 15:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122281.1466092; Fri, 12 Sep 2025 15:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux5t5-0001kZ-7t; Fri, 12 Sep 2025 15:40:35 +0000
Received: by outflank-mailman (input) for mailman id 1122281;
 Fri, 12 Sep 2025 15:40:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TRZT=3X=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ux5t4-0001kT-Do
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 15:40:34 +0000
Received: from fout-a6-smtp.messagingengine.com
 (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0c9b1b4-8fee-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 17:40:32 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id 3232DEC04C3;
 Fri, 12 Sep 2025 11:40:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Fri, 12 Sep 2025 11:40:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Sep 2025 11:40:28 -0400 (EDT)
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
X-Inumbo-ID: d0c9b1b4-8fee-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1757691631;
	 x=1757778031; bh=d/7uUIl3/7ovbLOxZ3GgywGud51wODORRvQXRsz3s6A=; b=
	bUgULeMYcYJLjvuQcdghS/TmnJNHaqPV3Hg2HUTtOdh1QFtbhStOVVMfQNg23qZa
	jSgdwfTHVOT6W4tgwqYG7qdLND2MoUnyP30VQ497Is8F8Yut5h1JmrjzWpE2VRiU
	NQFqBx4cOvXJKGDccMxJxpkNwcLsLYLCJ3UNuEB5j5l0ReIGJfylzd/2NZZABZCh
	khGRJD4a74nppCa9+WNP8D1ZvJ0gs/upKyinyOKC7DI89xgmfFOM26t92AoRozyR
	Qz+fr6eIE13MnePnHwAlOMbNNgfvt6ofTh4lfa7xks16vDLAZQNLCsP3gBckFrv3
	1vItMVDFrgfk1RoE1ID+0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757691631; x=1757778031; bh=d/7uUIl3/7ovbLOxZ3GgywGud51wODORRvQ
	XRsz3s6A=; b=mEMSuGDtB9TzZ/YzH0R7CPEiSDtn18w3+JSNRTqkM4vWgkBfWjL
	hc+59U/Fme6IA2GRR03esNeIaUWMxKdS0LJByv6VtR5CDLqqQMU0gdNDEEi6cQMx
	bpnCfbhy/HwPjkcdVZQo2nzpODxJmgx/UQqDvBcm/ujx2iQ3FRlzCQE/OaF4bQKh
	y7WiEtQI3pnp0QgV0LbPoL+4PC1Og7XLxpIGTl2kZMcKjd3//qUC4nyx9PPLYs6L
	ZiuPaGUlrsPo6TvvqRKELksonrjtzADxtmVNDdzbbR0FjyRB8cmAcXUeZycmkgK3
	/DCSDvsIU2lYWhQHIGaKy8z6EXilREQjVwg==
X-ME-Sender: <xms:7j7EaCWGoLL9jauf8bGIOXwR17fNT6w6j_T-6_AAbi0cLz5CCnxISg>
    <xme:7j7EaEh96oNGKMXoHaus9r6qDXmPidGCqjykjnD6HzvdssoY8a9u2GnTtZub5OUcH
    59VtxTVY46f7Q>
X-ME-Received: <xmr:7j7EaDinMyusQdbk7lv5WAt7UWGqjKRxtKRkj2kgxEt7gMuZl-mhbDmy_dtmM9EfvJ8xAKk4Z_jeH59lhFTxhZOwkwGRsyqdzEM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvleeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedufedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvg
    hnphhrohhjvggtthdrohhrghdprhgtphhtthhopegumhhukhhhihhnsehfohhrugdrtgho
    mhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpd
    hrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohep
    jhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnh
    drohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgt
    phhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:7j7EaKGNxB10iXxIgZ6M9YeJ2QoY24Az2SWWiWf2U8yMGhpzqdyS-A>
    <xmx:7j7EaIA_BYA2ZqJXypR5IWq31EfRXlQfO8hR_pY7IZaAH8-LdYOkgQ>
    <xmx:7j7EaIDsNj1Oy2R4cWWilkYSBmfUfCjUCjkoXt8BQW9AgTJFcyvm3g>
    <xmx:7j7EaOOlowwrgDn-2gYm_uoAQaL7ZMqQ5BYyXLW6C39f-aERefeamA>
    <xmx:7z7EaL7gUd5866oeqJLOr9ZFV1iixNIV9aHQBFva293hqFE52oUX9gld>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 12 Sep 2025 17:40:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Denis Mukhin <dmukhin@ford.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: Re: [PATCH v4 7/8] CI: Update x86 to use Debian Trixie
Message-ID: <aMQ-66ipqJ3kmats@mail-itl>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
 <20250912144427.1905141-8-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fiUeKHBbhTAFVbIy"
Content-Disposition: inline
In-Reply-To: <20250912144427.1905141-8-andrew.cooper3@citrix.com>


--fiUeKHBbhTAFVbIy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Sep 2025 17:40:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Denis Mukhin <dmukhin@ford.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: Re: [PATCH v4 7/8] CI: Update x86 to use Debian Trixie

On Fri, Sep 12, 2025 at 03:44:26PM +0100, Andrew Cooper wrote:
> With the exception of the custom IBT job, copy all Debian 12 jobs making
> Debian 13 versions, then trim the Debian 12 ranconfig jobs.
>=20
> Update the test jobs using Debian 12 to use 13.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fiUeKHBbhTAFVbIy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjEPusACgkQ24/THMrX
1yz8KAf/dbUffz4fEa4yRtUeDlEI4yuaMEUK84j4z7Nc5pgjka+6JOUMl8VmqZx4
qzK7YszO8DxZ6Fz/tjsEIeKGoj8Whaa+lCtAvZXMavlDOBtBvB8nxr194HB8jjnD
vtaOiCUbnncnAcjkgbMRLVmJ1zfi5oA4FQhsruNEg49NhANsT+s8/CPL4xFSUJLZ
cpRQ+TI+FRIy2+OEWYFUbvHwPyrSHgz9CBvowPzSKsvTDi6ra56RMTUF1dDCZ5+k
3xH3xdTfnfQg+0lG6/t1hfM6x4mPVtR7Go66SJFmu2Ai6T8JQa1pYi/ip9PRABCb
6D/SyqnGaBYXaISxufQAoSxHnOPFWA==
=RHJd
-----END PGP SIGNATURE-----

--fiUeKHBbhTAFVbIy--

