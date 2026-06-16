Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id efo1M7pjMWqbiQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:54:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13656690B2A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:54:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=rdO6Obr+;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=cycgVYSh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1339354.1600540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVBR-0000zM-16; Tue, 16 Jun 2026 14:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339354.1600540; Tue, 16 Jun 2026 14:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVBQ-0000xA-Tr; Tue, 16 Jun 2026 14:54:32 +0000
Received: by outflank-mailman (input) for mailman id 1339354;
 Tue, 16 Jun 2026 14:54:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wZVBP-0000vz-4A
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 14:54:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZVBO-00AWHx-Gv
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 16:54:30 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a31639c-e002-0a2a0a5209dd-0a2a4501e7ba-16
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:54:30 +0200
Received: from [202.12.124.157] (helo=fhigh-b6-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3163a5-c1f2-0a2a45010019-ca0c7c9d9815-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:54:30 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id ADE9B7A016A;
 Tue, 16 Jun 2026 10:54:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 16 Jun 2026 10:54:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 10:54:26 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781621668;
	 x=1781708068; bh=4NfjibikXplxqzQqxkRY6GRm5CWyOnVn5MVj2H4K7Hc=; b=
	rdO6Obr+4BrYWNvN5D6YIExfYPUJCMQswle+04arbsHti5Pzeb8LtpLD1geDusx8
	P6H8eS0Et6VjbIfQ44j5MVsqFU9kam2olERQ2gQps/oEqjBfMCUJCogh05z0JqKe
	mDS/9hSgO9wp/kkoDjCjSelodNFIBKx9vae2rdna4gUA6hSF4JKKJdHo/epkF9+q
	wiF4LtDH79jZ+H5Cdu9U1nhNqv1wE/9d+u/aDsuUFP0F5NSUc+1JvIkWinzAisQF
	cYbK5uQ++hn817HbRyck4hcLthmXyNMoMCtZaGf6TpdlL6C+vSWNs0vo5uH6BYk8
	2/g/Y6mr5fWxBYRad7QkHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781621668; x=1781708068; bh=4NfjibikXplxqzQqxkRY6GRm5CWyOnVn5MV
	j2H4K7Hc=; b=cycgVYSheDZIOfDWPeoaElOBv8oa5xhNupLbARTHxDMMlXqNDmq
	0DIMjphFRFSm6UcZvMRUibbIYDrej1CV22HsaYQQyaXieKmtkYmBnBbUrLDQOObU
	cq5WE+DWyySZHCCKXA8NXtmljImriVN2yng9CWLliy316QS//vsMbwqgdwVelgDC
	+CHAqHsUdW/IyRgmAxCUj5TfAIKIYU4ILZYPsDn3EUubAX/rW/PZGk8WNZKH9du3
	b3GJ/ZORy+u9c/MlVEgly8UGynYmYqLkYcXa3M5+Vnpj0b1vjt98S91uO4GcDnB4
	Z1QtsO2a+JaPF2G543OEnKEqBRP1xD+lmdg==
X-ME-Sender: <xms:pGMxan8Zo3hqAFS62grX1QsL4IoM9hVVlAR2JTV9nda4huqHlf_dSA>
    <xme:pGMxaizw1hdP3J_abggk3BeDoB4OLwqpuoPmSRYVY3s1PSqTxxyp06GPKxieH9QJI
    J75dWML0z9AD7Gbet7tWU4Acw9_Ayz2OdvxKBp43xzJ9yM9NA>
X-ME-Received: <xmr:pGMxarOIaGZhoNomhrr45ZoyjYA6QxTXxXYOl3cq2rjkoXfPvHtthzDVMyBPcJ26BC0jL6rQwuHLu6TNK525wtyduXX4R8BbHUo>
X-ME-Proxy-Cause: dmFkZTEaaRkFiufj6xbqTREXL4O/iLhnDAfOv3ZIuQSETdhOr+OmCkIhugRZgp0/by7CEZ
    tM42V0rYim1o6cjNR8y+KYSx0yqiO+FVUmg1tx+pYacfsmHBAdcho+XkUaKJLpWq5vBaq/
    imvQ+tops5Dlm3THgYWiiMvcKAYwX6IG0Xha0Lo7YeQlZLGdzGHMblgfYwtXXDkaginqh4
    yP0+H/dGOkUMyVrFg/qZsfgyKZByJvakX/OkckExvwOhIshLENOAEsYwz2PhrEq2ka+9I3
    vZYPWD1nQZ8AQPEEs8Fn3b1MkSJWwHEIAZQ2T6If5k+O8hwM1GN4xvhUKlUjuOu+r+kirH
    rlHJTu8UoXGS/LzI3RGU8OF6MWswW5gsyevj2EoY7jcWbJx2Dq+h05OW8cAKJhq25DbDUu
    37b2BRw2rhmLrv1jRbO7eNiVaF7206yIkRhFcPm3ZbyPNrKOSLAcze50U2Srvr+7Z2yMiv
    SfJ9cLDOsbxqXWHjpGFo1rqo/z2RPyCHiYE2OUjy2fH6oH7IWMCFFHd8w8VKIUyR5oP8As
    dRHcKdo82nPXwe2qPsLqXM143sJXCLY/qhJVBDceK+Cbu4oYFR3KjP1BT3b7SlXkwQ5if7
    ZPyxY55uTYKuaILi5K1PHoP0B+4V7yH17cb7yIwu6aR9cmw3eFqh5cjDZsUA
X-ME-Proxy: <xmx:pGMxav8jQDk__TrHvgV_QK8PW4SwhB6Wq_Dq-Nk4at2nbMCnPHS1tA>
    <xmx:pGMxag78-HlV9yW-86UBBm-ue6dA1bDG9NoXwB04JiWZE24JIBePZA>
    <xmx:pGMxat7jFwPYzQMsAkWRV3T5gRPccQg3MnNZqKGzFt4AV1BFEzCKfw>
    <xmx:pGMxahrKUN-3q567jcFGmmb8PqeUQPvQ5L44Tq-NUr9tDjZA8PbZnw>
    <xmx:pGMxaqi8cXOfuVojKuskrgi1iUuw4JfXgSrUidtxoFaFRgiLMV9XDooK>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 16 Jun 2026 16:54:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/4] Align relevant sections to 4KB
Message-ID: <ajFjoXvnuFUEr4x0@mail-itl>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-2-frediano.ziglio@citrix.com>
 <3506eb69-f057-4c0b-8321-03cfcc6dda2a@suse.com>
 <CAHt6W4et8om1AO+v_VVpikhd0Nsuc_V_OFSm0r1rgzFJ_2wH6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="im1Xv9KsI/aHXcTL"
Content-Disposition: inline
In-Reply-To: <CAHt6W4et8om1AO+v_VVpikhd0Nsuc_V_OFSm0r1rgzFJ_2wH6w@mail.gmail.com>
X-purgate-ID: tlsNG-d62444/1781621670-B514BFF4-A9826CBA/0/0
X-purgate-type: clean
X-purgate-size: 3168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:jbeulich@suse.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,cloud.com:email,messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,mail-itl:mid,invisiblethingslab.com:dkim,invisiblethingslab.com:from_mime];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13656690B2A


--im1Xv9KsI/aHXcTL
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 16:54:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/4] Align relevant sections to 4KB

On Tue, Jun 16, 2026 at 03:38:53PM +0100, Frediano Ziglio wrote:
> On Tue, 16 Jun 2026 at 13:27, Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 16.06.2026 12:13, Frediano Ziglio wrote:
> > > From: Frediano Ziglio <frediano.ziglio@cloud.com>
> > >
> > > Required by UEFI CA memory mitigation.
> > >
> > > It is a requirement for NX_COMPAT so the PE can be loaded with W^X pe=
rms
> > > in the pagetables.
> > >
> > > NX_COMPAT is a requirement from shim-review,
> > > https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-y=
our-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-hav=
e-you-done-to-ensure-such-compatibility
> > >
> > > Sections with different permissions must be in separate pages.
> > > In the case of debug sections they are contiguous and have the same
> > > permissions so it's not an issue if they are not aligned to the page.
> >
> > What if .debug_* starts in the middle of a page? Aren't you further
> > relying on .debug_* to be r/o (i.e. neither X nor W)? (Right now
> > .reloc is what comes immediately ahead of .debug_*, and that's r/o
> > as well, so not an issue in practice for now. Yet as indicated, the
> > description here wants to be usable as a reference when this later
> > needs extending / revisiting.)
> >
> > Jan
>=20
> Can you suggest a better wording?
> Practically I think before the .debug section you could have the
> .reloc or the SBAT, either are permission-compatible. If in the future
> we break it for some reason we'll fix it again.

Once all of the relevant SB work is upstream, I would definitely want to
have a test in CI for that. We already have a test for booting xen.efi,
extending it to try SB-signed one should not be too hard (famous last
words...).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--im1Xv9KsI/aHXcTL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoxY6EACgkQ24/THMrX
1yzfKgf/R1b8r7VAy6OppJ9jkkCuFeONSqrcFmvhVJuDDyuH99GLN/1oU2rKjU2H
lZQXzmMZf4/nVAmaEABHtbJRW5po0JQ13b5URytBrFe3xEzDWdG6mE+ukBC9PMhf
ySzxjVWtyQZrPfPOGPR5bvIptmIBmFDG9Wh+azog10HqyhUZ2/stwhCm4IysZ8Lq
7vED1hdA7wWmuTYn6VCrf16tZLL0V0kCTgrQ5uvzJcQFEk88lWwo4HOkgCPRpKUC
kAjXZv1fvvajoB0pTLTI3uGWq/Rw7WQ7T4ZSPNi+Ora449G4KlIKTEe24xm1e6Yu
vx5Dt1kLgO3yMhC9WcRH5374TcrUBg==
=PX0S
-----END PGP SIGNATURE-----

--im1Xv9KsI/aHXcTL--

