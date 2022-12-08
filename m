Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BF164711A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 14:55:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457173.715039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3HMo-0007QL-4B; Thu, 08 Dec 2022 13:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457173.715039; Thu, 08 Dec 2022 13:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3HMo-0007OJ-1T; Thu, 08 Dec 2022 13:55:14 +0000
Received: by outflank-mailman (input) for mailman id 457173;
 Thu, 08 Dec 2022 13:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IMKo=4G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1p3HMm-0007Mg-4T
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 13:55:12 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec898c28-76ff-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 14:55:10 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E0CF5C0110;
 Thu,  8 Dec 2022 08:55:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 08 Dec 2022 08:55:07 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 08:55:05 -0500 (EST)
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
X-Inumbo-ID: ec898c28-76ff-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1670507707; x=1670594107; bh=6GKpjudIqv
	TWDk1IikFFGhAigKJs3+rT6h11l7fzCp8=; b=mDFCuZoklYstfq7H4HG1qETEV0
	W+f8FY8dt794xsufTS3A9fTJbGcI8BtMShglShqIzajIyq3HryDtYBJ9xWsp8Qd0
	gBvtN1zxV9kD9U6eZ2c/koXQx7wAaqsYcMAZuGIa4bCBi84JH1+D1GY8F8O800aM
	TNe5J+I0t1RzJ8Wm9j/TCVmjCFYcFhmPBqn5O9Ewx+BnthtH2ydNQjr6uOLmwrDE
	b5GkYZZzHATWYUCKLYjlkoDEt3Vj7nHXYL3A1xSZMQCKqyAiWsurHV+apiw+CwB6
	ZDl4w4Vx72tQnQriCXgzDu1weIRW3NmYPlGxHXdRjRtQisC4sGBppKK6AxLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670507707; x=
	1670594107; bh=6GKpjudIqvTWDk1IikFFGhAigKJs3+rT6h11l7fzCp8=; b=Z
	8QOdcPshuupEpeJx3YgCY5X1eHI371vnP77kt4cV2hFIcgbQR1JFaw8kKt+d/aa2
	t2/8fifmvU/wTioWS9W5TKkVB2MhOVmVL/DuwatHXv0gaChNl7PCSFntWoAQ7XyP
	J8AWur2GwgDhTV+/WWp8BltgFeMxCDIZBgQM9H6M7qtt7AIXmqooNzhsFhky/CqK
	VCk0/ii1AsQPeFFk05Cp9/zCKwO55KyiTwyoNh9OO/zjf16fkIkWyKvlt7DxEUCu
	QCvhH5LZ3pP+ImX8tYs0HzejELUt3v/b/bCgHVb0Y1aa55ih02EtUOPPHn49wCnm
	seDRlmlHeq4LbZkebWNYg==
X-ME-Sender: <xms:uuyRY1qahaXJDEDXIIk4i0KzYCWVEvn4anML35uKYTBEF9aPjd6IJA>
    <xme:uuyRY3qwfSE2PAZlciN4-gFFGIpd-1NLsC3cB9Tecu_DhmaxzuO_XSr2B28PpDouu
    C1bRHfUzhUYGA>
X-ME-Received: <xmr:uuyRYyMY6qIrlzR2GRdPVmN9XRmkinLH2rPolAOJYuBDwLWeOuoEzAb6I_M9aS9UID8B5tbCwOKo63wSpRHKxHkj6CSLHSLtGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehgfeuvdej
    keeikeeludelteevfeegffegteefffetheetffduudejuedugfdvteenucffohhmrghinh
    epqhhusggvshdqohhsrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:uuyRYw4lg46xf1wtvrKkLRFbrCWzDuTQo4EtCzwrPateB9rU5p_JPg>
    <xmx:uuyRY04fTQqLGNPNQw9qb19VUdiVI3pmwfx_ql7oiIQB6buUIdT6Mg>
    <xmx:uuyRY4gExa2qR8wMfKiY6Oo8HVdJKId--nPvhig1X-JixGBA7ONZYQ>
    <xmx:u-yRYzZN_CVlZA3sah7SeEdKXkmQjMFPSpuGPON2iv9ewtlMwtjXpQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 8 Dec 2022 14:55:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: intel-gfx@lists.freedesktop.org
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	"Demi M. Obenour" <demi@invisiblethingslab.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Subject: i915 and PAT attributes on Xen PV
Message-ID: <Y5Hst0bCxQDTN7lK@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/WNi7iDpw1KwqA/X"
Content-Disposition: inline


--/WNi7iDpw1KwqA/X
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 8 Dec 2022 14:55:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: intel-gfx@lists.freedesktop.org
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	"Demi M. Obenour" <demi@invisiblethingslab.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Subject: i915 and PAT attributes on Xen PV

Hi,

There is an issue with i915 on Xen PV (dom0). The end result is a lot of
glitches, like here: https://openqa.qubes-os.org/tests/54748#step/startup/8
(this one is on ADL, Linux 6.1-rc7 as a Xen PV dom0). It's using Xorg
with "modesetting" driver.

After some iterations of debugging, we narrowed it down to i915 handling
caching. The main difference is that PAT is setup differently on Xen PV
than on native Linux. Normally, Linux does have appropriate abstraction
for that, but apparently something related to i915 doesn't play well
with it. The specific difference is:
native linux:
x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
xen pv:
x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC
                                  ~~          ~~      ~~  ~~

The specific impact depends on kernel version and the hardware. The most
severe issues I see on >=3DADL, but some older hardware is affected too -
sometimes only if composition is disabled in the window manager.
Some more information is collected at
https://github.com/QubesOS/qubes-issues/issues/4782 (and few linked
duplicates...).

Kind-of related commit is here:
https://github.com/torvalds/linux/commit/bdd8b6c98239cad ("drm/i915:
replace X86_FEATURE_PAT with pat_enabled()") - it is the place where
i915 explicitly checks for PAT support, so I'm cc-ing people mentioned
there too.

Any ideas?

The issue can be easily reproduced without Xen too, by adjusting PAT in
Linux:
-----8<-----
diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 66a209f7eb86..319ab60c8d8c 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -400,8 +400,8 @@ void pat_init(void)
 		 * The reserved slots are unused, but mapped to their
 		 * corresponding types in the presence of PAT errata.
 		 */
-		pat =3D PAT(0, WB) | PAT(1, WC) | PAT(2, UC_MINUS) | PAT(3, UC) |
-		      PAT(4, WB) | PAT(5, WP) | PAT(6, UC_MINUS) | PAT(7, WT);
+		pat =3D PAT(0, WB) | PAT(1, WT) | PAT(2, UC_MINUS) | PAT(3, UC) |
+		      PAT(4, WC) | PAT(5, WP) | PAT(6, UC)       | PAT(7, UC);
 	}
=20
 	if (!pat_bp_initialized) {
-----8<-----

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/WNi7iDpw1KwqA/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOR7LYACgkQ24/THMrX
1yzsegf/UEoA3BXWjSoPh2vPR63ezhmOsqkC/ZOINc54wnoQx7XDzMjC/vUUWsHe
Wx2zWhrarVgRQ6mSV1ZC+gODIcJIn9jTmdLaf/7Ge7osLxgmejKhMaO9xuZ1ppHG
ZcRw+nCl073wchwuNvjAvCcsB3G08HtXiWUlBXj64yC8+RR3zhaqZYUs06T/o1qs
T/4Jf7yzzthVd/LOXSU/FbGfhDqEzOjyHedsOdJHiDuQT9QLitK1J7fh8iN4T5eO
EmDoYO2bo/pA9M9K1jRWfxZF3vFyyEEJPpOKwVc+ahKTMANyymXclFIJuHAAJdyX
wEMEcqHFPXnBbZ+V/vAfrXWoTJbYzg==
=29Zz
-----END PGP SIGNATURE-----

--/WNi7iDpw1KwqA/X--

