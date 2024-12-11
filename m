Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829B39ECB7C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 12:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854652.1267807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLL5p-00030g-9q; Wed, 11 Dec 2024 11:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854652.1267807; Wed, 11 Dec 2024 11:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLL5p-0002y2-6i; Wed, 11 Dec 2024 11:41:25 +0000
Received: by outflank-mailman (input) for mailman id 854652;
 Wed, 11 Dec 2024 11:41:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dco5=TE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tLL5n-0002xu-Tf
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 11:41:24 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7654565-b7b4-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 12:41:21 +0100 (CET)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 1879B1140105;
 Wed, 11 Dec 2024 06:41:20 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Wed, 11 Dec 2024 06:41:20 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Dec 2024 06:41:18 -0500 (EST)
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
X-Inumbo-ID: d7654565-b7b4-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1733917280; x=1734003680; bh=px
	oXU/wqIbkzSyF/1YFlLcAuQp8pdCkQQkcCxhXVQ7Y=; b=I6lbiXY+9bniIdq/Em
	hEfmzBKVGFS94QrshSkXBEM2MxrYvx9VW86kvyLk1zkk5RWrqqXttfc747f4qJap
	S6c5HMy2mXcHx5l00L/FC6h5yIgxdjPDCk84Lxt+2l6BhROQ+AURFJLYPX7igisT
	eBu92tvugr94clH2/GPfDwNXOMv/v54jYeUnvPLD/sfVAZDivEfCvTEUCSJhOOxF
	AvFZMYxYIvoHE2giUUhnBMl1IOeoeu7KAYIwbJ61mr/vXakPbqaz2txfmDIjUyMA
	wNnh3raIJ/xW0dsnYsbFMlX2NcK/CMAwuiYGBLKPvU7xWcVuQ4ylcII5q9nxEdrK
	vhWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733917280; x=
	1734003680; bh=pxoXU/wqIbkzSyF/1YFlLcAuQp8pdCkQQkcCxhXVQ7Y=; b=Y
	2i29EQn3cr69Y/DJsv30iVlWTrqSdDeLFi2U1vzjmFO7jgngeoFZHuzk6W64VDVW
	ptD93mOf3ZyVwCLyYiVvqDPTbC2sqisGUeMFhI3A2PJNhqwkjx7of9hhmks3Jsyf
	5B72pqqli8hEVE74iR0JcdJx2d6v4rP5ei3Mo0cAAtRh5nRPN6aPltz1lsHrNUZc
	wKlPg80sE93EuO2WRdtYqyBq1S7a2Zyx1YxV95i5IkS+OffwaovtM/4x9MQytg6A
	tefblPRKD7GPBoGrv0G2joqMECm7+LFQcr4dGvjXyr44BbsmInJQjo/GEp0o6Aaw
	I4fbL55yypP8bCIotDAXg==
X-ME-Sender: <xms:X3pZZxxWy6bJat7Q5JmS2il4wIXRXSjZ7RV1B8N6kMPJgHcKqIlsqQ>
    <xme:X3pZZxTutqXqSA5iV2CHrZmzNT2beuLeUY3Pe4AwBio3aGvXJAZ_625SiRYXEqhJx
    kCfvarNLUxa_w>
X-ME-Received: <xmr:X3pZZ7WumbK1peumvojzDSgK6MY7PRYm4O3HhNGWN-JWX0H_SjaYBEYmEs0MbrU20evRsasc7gwyRwva6LnUlUgJh43VRpeyBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkedtgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggusehgtderredttdejnecuhfhr
    ohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmh
    grrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrght
    thgvrhhnpedugffgieelueeukedthfffledvhfejfeefheeuieekhfeludeljeejleegje
    duffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    rghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprh
    gtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghv
    vghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehjghhroh
    hsshesshhushgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepohhlvghkshgrnhgurhgpthihshhhtghhvghnkhhose
    gvphgrmhdrtghomhdprhgtphhtthhopehrvghgrhgvshhsihhonhhssehlihhsthhsrdhl
    ihhnuhigrdguvghv
X-ME-Proxy: <xmx:X3pZZzhtJWiXl8M9qRn7H3-NhGhNdYN39UXnJ12f_OTZchaVaVZ41w>
    <xmx:X3pZZzCV83O3MUaPg7LMdoMrWoZLpZfJF5oGII_oAJAaoJbDt3NCNw>
    <xmx:X3pZZ8JB5t_SuUSiypGJ-QyGXjh6J-KIAhGafue_co9y3Lu-gTKaNg>
    <xmx:X3pZZyDdk4HZPvufd94QnOlt-raHXAAW55cZVe_faupdxJl-W-2t7A>
    <xmx:YHpZZ-7YvnXD5JAG6E0voQbUetLVkZcud05MeHMEXnPa_Sp4dM5GmHgO>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 11 Dec 2024 12:41:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev
Subject: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
Message-ID: <Z1l6XbHP6BTTZSwr@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GmdDK/bWMBAmn8YR"
Content-Disposition: inline


--GmdDK/bWMBAmn8YR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Dec 2024 12:41:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev
Subject: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU

Hi,

With Linux 6.6.64 I get the following crash on domU boot:

(XEN) d5v0 Triple fault - invoking HVM shutdown action 1
(XEN) *** Dumping Dom5 vcpu#0 state: ***
(XEN) ----[ Xen-4.19.0  x86_64  debug=3Dn  Tainted:  M     ]----
(XEN) CPU:    4
(XEN) RIP:    0008:[<ffffffff82b64050>]
(XEN) RFLAGS: 0000000000010086   CONTEXT: hvm guest (d5v0)
(XEN) rax: ffffffff82b64050   rbx: ffffffffffe00000   rcx: 00000000c0000101
(XEN) rdx: 0000000000000000   rsi: 0000000003a00038   rdi: 0000000002a9bc98
(XEN) rbp: 0000000000000000   rsp: 0000000002aa0ce8   r8:  0000000000000000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 0000000080000011   cr4: 0000000000000020
(XEN) cr3: 0000000002022000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000002a9ccc0   gss: 0000000000000000
(XEN) ds: 0010   es: 0010   fs: 0000   gs: 0000   ss: 0010   cs: 0008

Linux 6.6.63 works fine.

Looking at the changes, I suspect one of those:

    83d123e27623 x86/pvh: Call C code via the kernel virtual mapping
    f662b4a69e1d x86/pvh: Set phys_base when calling xen_prepare_pvh()

But I haven't tested this hypothesis yet.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--GmdDK/bWMBAmn8YR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmdZel0ACgkQ24/THMrX
1ywnkAf7B78k0a25zBk76rTR71NW+VMvQKr2hh5quoNnasjgSp2Avq6Rs7CSA8Kq
o1LTT6WtYXzcDLRzOvlrrb25RT/wXJhaKYcl3S40L1atfCVOtx7uTsKbRjpLmHLf
HxZeV1AIzk/JlbJyUFJ6bCFzyIncOzIp4GGyb+NeUKanK2g3tWDj1+7P4qgdHaYl
X1QKBqwpZpeOM4TcYoR0NnflOqoseguGz4ARJihvGWtNIs7ahvkhsS9sbFDOJhGT
5mE/MGL2v3W2Q3ifAM9UXYl1oufZ5ye4cFXCeFsZ8qR8LjzeY2LAdeYxFzE/rVZ4
toWQ3eWCiZGVXTh0E0yNCCVeP7tY9Q==
=nPqk
-----END PGP SIGNATURE-----

--GmdDK/bWMBAmn8YR--

