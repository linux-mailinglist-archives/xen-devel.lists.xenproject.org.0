Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF456371AD
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 06:16:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447773.704384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy4a6-0000zw-Kf; Thu, 24 Nov 2022 05:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447773.704384; Thu, 24 Nov 2022 05:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy4a6-0000yA-Gl; Thu, 24 Nov 2022 05:15:26 +0000
Received: by outflank-mailman (input) for mailman id 447773;
 Thu, 24 Nov 2022 05:15:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RNnI=3Y=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oy4a5-0000y4-43
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 05:15:25 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe37c887-6bb6-11ed-8fd2-01056ac49cbb;
 Thu, 24 Nov 2022 06:15:22 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D35A35C00D5;
 Thu, 24 Nov 2022 00:15:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 24 Nov 2022 00:15:20 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Nov 2022 00:15:19 -0500 (EST)
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
X-Inumbo-ID: fe37c887-6bb6-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1669266920; x=
	1669353320; bh=N4mgkDJMuEsjYD95MYifdN6mbV2R36yGwgOo4yfvF8c=; b=h
	Fb2rB0XQXk7qVIZmRjy+ZMZhpyAT5BMXgH29GTb17HYvjOekAik8oZQniM/fdIdO
	/Kf6FyTj7auQQP+nPDv3dl0OlCYgsrz8gq2tbI4Qf2BwnUj7PB2tIZutBq10SiQX
	msDUFFhyhNi8ugI+3c0BvOrxAv9lv8wdFgb6sOtrtM5zM4pSXbeAFqPVpbUhWWOC
	v9wD5a/QBBU3Hn5GLjnZTZ/ynBFslj1nfIE6DUtAkrbqe1PUH5fMDSoVPEvpWqks
	9eR95CCaPpxlvlBb4yIo4caC74cW/1Few8DfAai4UIKui8HnoEs9AQqWTY1La5A7
	jgUzPpAbLqJm2lgocx8Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669266920; x=1669353320; bh=N4mgkDJMuEsjYD95MYifdN6mbV2R
	36yGwgOo4yfvF8c=; b=dPeZ/mlY4OrUZPKsl2VqL2+xzZJ4OWRg1MGO0h9pR+Je
	ZhYq2Enz1fTOYgKQreVTMsfKV1SyhuuTRdLmAttfC2i8uCuGQUlVS5fW9lfLv9OX
	bEgz61Rt31/qQku9zo/7SQHpSSC+/4WF7mbFB8l0/p050KixtFEkvLUT3yuPaM6t
	JQSb8qJPYXGrpw6AsZtvlnkqsIssm8dTP5hcEFXavPsnZLIhFGUElKOJxLeTkOZf
	4BKteIWD3OFmtLcaIoWY2rZtszWazdbCSahfduZoe+bfRmjo48zyGVOeuJ/+xGR2
	UFD9n8Ll/ooUV2Kf9QlsCPnm8ChRcj4G494lqQIm/Q==
X-ME-Sender: <xms:6P1-Y16h45GthdqhDWcMr3SO8mSdB1wK8MmYjUojZKEDEkJYvT4PPg>
    <xme:6P1-Yy5FhC9hbwlUMAOhuqYku5II3nq6KO-cMJaW0e7l5oW1Qvq9Xj1T2A5mCYlXp
    -C8bgtMyoEkHQ>
X-ME-Received: <xmr:6P1-Y8cgQbPbbeun-CyhXVsBYFhOs4x2w4Qu82Nyhpciy1SW28ptLpQCIu8f72DI8r_MtsF-Jvj_PBYk4OnpnRKMYoADQ874Tg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedvgdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhffff
    iefhgffgvddtledukeelteeiiefggeeftdfgvefgiefgjeeljefgleeigfenucffohhmrg
    hinheptghithhrihigrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:6P1-Y-IqheTmSFCjs9apKwdsHlmQthsEwEueZERjmgVjwPRobQ69lA>
    <xmx:6P1-Y5IS1rHBzSxR0FFXVGNFenzIPIwnc846NmLy0XgrjoUHphFm8Q>
    <xmx:6P1-Y3ywU0iKTc-MACkFk71xL31GLanKgS1uQbijxi6eQpTO4HwKVg>
    <xmx:6P1-Y3hGXLsZtbreRxHK5gs0OutuRfKxPG0pwQXvDo98HzfsLM8CVQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 24 Nov 2022 06:15:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/5] gfx: improvements when using multiboot2 and EFI +
 misc
Message-ID: <Y37940yMRg2iX3IN@mail-itl>
References: <20221123154525.63068-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uzfpZsZBiGb3GVj9"
Content-Disposition: inline
In-Reply-To: <20221123154525.63068-1-roger.pau@citrix.com>


--uzfpZsZBiGb3GVj9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Nov 2022 06:15:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/5] gfx: improvements when using multiboot2 and EFI +
 misc

On Wed, Nov 23, 2022 at 04:45:19PM +0100, Roger Pau Monne wrote:
> Marek: after this series using console=3D without the vga option should
> result in Xen not attempting to touch the selected GOP mode and the
> screen not getting cleared.

Thanks, this seems to work mostly fine.
There is one message printed from setup_efi_pci(): ... ROM ... bytes at ...
I'm not sure what to do about this one (although for Qubes, I can simply
patch it out ;) ).

But to get dom0 display image from BGRT, it seems something else is
needed too. Linux complains "Incorrect checksum in table [BGRT]". The
only relevant google result I get is this: https://support.citrix.com/artic=
le/CTX460227/citrix-hypervisor-acpi-warning-incorrect-checksum-in-table-bgrt
It blames firmware. But then, it's suspicious that it's also about Xen.
And also, native Linux on the same hw does not complain about the
checksum. So, I think it's rather Xen to blame...
The table lives in area marked as EfiACPIReclaimMemory in memory map, so
I think it shouldn't be clobbered by Xen, at least in theory. I'll look
into it later. It's getting off-topic for this thread anyway.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--uzfpZsZBiGb3GVj9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmN+/eMACgkQ24/THMrX
1yymDwf9HEWHg0V/rEgq5bRglQHh22n0dIjzKO4m1YWL9zIeNhhR9Cd2BXrSwaDb
tvCZw4i75mCZ6WkJs6aLZCWbf4YU51QvDQf2AlUmab2kMpT5Cns9+0bIEgkVRPHf
z0FlNoZ9beAGEbD029ZmuKw9eGKakgD/Jpl5iH0CaniOEnHqQLl9daBMZ96FTKXv
A+Fcj3bX+Rj5l7JG63pITF38B9KRL15bR/d195bRwiNe91R7zsXd6JRDIwGOptmF
nr0GiP/X5Nfy0yMlU+oI47KoJD6ON5kOCOgA/Z1+aqOiYN2Gti2y2lY0VuBDgmuX
DKfxvzzMsNQjujHPabzXHUh85vQffg==
=SWfF
-----END PGP SIGNATURE-----

--uzfpZsZBiGb3GVj9--

