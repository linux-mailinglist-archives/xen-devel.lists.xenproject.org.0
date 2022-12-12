Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 149BC64AAB5
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 23:59:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459977.717767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4rkW-0001vO-5u; Mon, 12 Dec 2022 22:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459977.717767; Mon, 12 Dec 2022 22:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4rkW-0001si-3E; Mon, 12 Dec 2022 22:58:16 +0000
Received: by outflank-mailman (input) for mailman id 459977;
 Mon, 12 Dec 2022 22:58:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PhXI=4K=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p4rkU-0001sc-Pk
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 22:58:15 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73466cf4-7a70-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 23:58:12 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F0B95C0180;
 Mon, 12 Dec 2022 17:58:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 12 Dec 2022 17:58:10 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 17:58:09 -0500 (EST)
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
X-Inumbo-ID: 73466cf4-7a70-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670885890; x=
	1670972290; bh=oLwm2dssxrwsdrFJechFNbbN6Ajsqr37GspcafJEHGI=; b=m
	3Xo/y/yrZMaaIeGEJXHt5zcHRuexuVylfAyFeNxTSH7f5PlB3myzLpLlgJVz26AZ
	pUliv0JM0bQJvT802OBZzziHUtM7jgm/ftQojlhi2Xwu9EH4hBDmBRf4CaXJwlIG
	db/Ejv0C8XcgMI6SoIswFEs8Kp1sBj1EQRgaGpImNg9Vs0j4/m+n0MV67Eb7FkTC
	rKpgY3LctyVjZXvQllWIrfY6HmAE5qTabpMr4/+0QdkfbYVD0bmAQG5TE8ejfRqk
	VJqfmpOUcHcYbyHlbzNa6tgKmVgRYH9w3Mb/obRt9692x/Mizo3o/O7IvIqG64Za
	kkeNC6YE9L5jPcBFN7Cdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670885890; x=1670972290; bh=oLwm2dssxrwsdrFJechFNbbN6Ajs
	qr37GspcafJEHGI=; b=e7FXx1yeCcvOG5V19MLL38Qro3yzz6RdfgEbQyqEG5Wc
	n3OIbyn7OEoSt68dqhYvqwuRt1Q39BWteCnx8OpYgkvhsm8Q7+ABVHZCslwW1ClP
	7rRLnPysP2/gE4n0vWYZhY/za54Rmo4Xr6QfYlBu4VjidXfrU6NHmtKDbsThu2Jy
	zJBxZwsvUPBV/tgrmfJ5W6AFV+vVQPMriNHZUKG8FqgMbpKPQ/lecS9O4/lHApsQ
	TA+GizQD+Xq+JnXLQUnCW5FgPkOGqu4vYOP9BnHumCPy54iPPiZyxCQMDyz4gSvW
	KionUAjyWbDlCSqWmDK1VxpEr2KRvnP+iPuFXOoNpQ==
X-ME-Sender: <xms:ArKXY5ai66yhcw_4y_mLyE1ISl5qwRW9ooYrNYBqy3qasPfFMDGbPg>
    <xme:ArKXYwYapZKP4_Dw-2TcJsbQBjGbW3Mu5QSOU6XooF-ZNt_eV1zVu_frPk9FEvNzK
    V6WhrF-rUufBxw>
X-ME-Received: <xmr:ArKXY7_Qle4XUsJE4-QqDLD8RkTcReSv3EiKnuPVc5x5MqyxDBmLduwJIQO3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdelgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffejgeej
    geffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:ArKXY3rnTIYctyj_ELzs8nDm_H_xUUkR0fRm754D8gX7wgR9ue2HBQ>
    <xmx:ArKXY0rvcbMR84y-0f7-uvHRSBcZrL034k3lyecX7OaYZe4u1bH8gw>
    <xmx:ArKXY9T6nQmFd0OobJTbBlzFwdjdKjNkw2ro2BZNOuxVdEHyYFHHUg>
    <xmx:ArKXY_Vmcy5OgDue35lL_FjRnmfS9lKLCPlPGPgW7j7yf7RnpgTOJQ>
Feedback-ID: iac594737:Fastmail
Date: Mon, 12 Dec 2022 17:58:05 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Relocate the ESRT when booting via multiboot2
Message-ID: <Y5ex/9OBFZ3hdBx/@itl-email>
References: <74145e57307e9b35cbdc296b22241e6f36405f6a.1670546744.git.demi@invisiblethingslab.com>
 <e4dfe73a-a0ff-54c4-054d-2044de1e546a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q/kQ6JmqdbhO6GPW"
Content-Disposition: inline
In-Reply-To: <e4dfe73a-a0ff-54c4-054d-2044de1e546a@suse.com>


--Q/kQ6JmqdbhO6GPW
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Dec 2022 17:58:05 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Relocate the ESRT when booting via multiboot2

On Mon, Dec 12, 2022 at 04:19:21PM +0100, Jan Beulich wrote:
> On 09.12.2022 01:52, Demi Marie Obenour wrote:
> > This was missed in the initial patchset.
> >=20
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>=20
> It looks as if, besides ...
>=20
> > --- a/xen/arch/x86/efi/efi-boot.h
> > +++ b/xen/arch/x86/efi/efi-boot.h
> > @@ -818,6 +818,8 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, =
EFI_SYSTEM_TABLE *SystemTable
> >      if ( gop )
> >          efi_set_gop_mode(gop, gop_mode);
> > =20
> > +    efi_relocate_esrt(SystemTable);
> > +
> >      efi_exit_boot(ImageHandle, SystemTable);
> >  }
> > =20
>=20
> ... this core piece, the rest is merely pure code movement, with the goal
> of avoiding a forward declaration. If such is the case, please say so in
> your description. I'll add a sentence to this effect when committing, so
> the remark if for future patches. Provided of course it is true (i.e. I'm
> not overlooking any tiny change) - please confirm.

It is indeed just code movement.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks!  Do you want me to submit a separate patch for backporting to
4.17, or do you plan on doing that?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--Q/kQ6JmqdbhO6GPW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOXsf8ACgkQsoi1X/+c
IsH0pw/+OK94ML0txCrONMxG0ZPBnrRIJCPIdRpD5g2O+Qq3w+BKrz5m0jF2TNuc
KjXyhjWWr4moX5vGdJAdXmuOzKY3XM5afmBT836mCvDawhOEJ1ohhwV1xZE59byc
QRBHQe+h69ab0xnUMKKa0V3bm6hHZ8DBmODDj3KRVyqiwXSI0ATXsMp+S0UYb+kM
wrqR5dzlgPTSggmDCR+PLXUoLeTisckxIF4QOCqEIUrdlAIq8b9UWL7AfU/pP9Lk
Hcqjmy8BOIkOg0P2y2yU0GBYRdMrGRSgfi9iO26Tfz26KxCwj2SplIjwevZ3op0B
oq/MUiYs8rtykAz1ImP/7WwxqFUveWFBjOEJmjljK2G5nHu2LdPmpoZNOvGEGxTw
caXMs0LT4PiNIXxgqtuM8gy86NHuBC1Qc6dv+x1/rxaqr7MKpDpdMUDZGmVJG2+k
iaPRB182pBe3q/n8c9LGC8r3AUqkNgh8xsf3axAb5X5SLJxtzZKZiNNnqYZMOn4r
N1isxiETyDsbjajpVpozmiixcEmFN7UaYusIsq2AyHA09gWwe1FHiaWxlWEhZq0G
TApCTO7UL+385oQXSpxgbTbMBbNK3jUiqiBFTvkwFdivlE5HpZJ1Jo6CagQSGXQ+
gkx7g0L9FysPWf+XhW3G0GuyVYv7OSmPZfdaawM4eeNoUFLOHlo=
=8+Y1
-----END PGP SIGNATURE-----

--Q/kQ6JmqdbhO6GPW--

