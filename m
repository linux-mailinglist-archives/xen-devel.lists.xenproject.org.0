Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Nb5AEJTYi2nebwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 02:17:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9561206F6
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 02:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226940.1533312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpyqS-0000SE-5z; Wed, 11 Feb 2026 01:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226940.1533312; Wed, 11 Feb 2026 01:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpyqS-0000QW-2X; Wed, 11 Feb 2026 01:16:44 +0000
Received: by outflank-mailman (input) for mailman id 1226940;
 Wed, 11 Feb 2026 01:16:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HiTc=AP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vpyqQ-0000QQ-QZ
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 01:16:42 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ef35cea-06e7-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 02:16:36 +0100 (CET)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 1A4917A0194;
 Tue, 10 Feb 2026 20:16:35 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Tue, 10 Feb 2026 20:16:35 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Feb 2026 20:16:33 -0500 (EST)
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
X-Inumbo-ID: 4ef35cea-06e7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1770772594;
	 x=1770858994; bh=AnsFbD6A484dObcHy45DMWIYSo5yDnNHM1GpEvTgH5o=; b=
	KS15qKOufKbrMfFckdGORUHltcEmwCFGeMBdcnvmRAElmUEaqUF1cCYEcDhQcKYp
	oCyDCHjLXnj/YHblNbmFqnuKPMD0asmpXmyD/ug+8bj5ANn2vZmdLvUYQ45C9ht7
	+4bO45lGwOGmseGvl6wwAvkv0lVQCzUeDq4CfqTuP6a08tXKNzfOFziFHtHtcJ8J
	B6x8one/b7PNeVTkzdN56xc/EpCWk8Ujk6+HLijAEcFmYhysRpWqBgxbo/KqBVhm
	fVq7xu9pydB0XidSYd0iN9FtZ7tzbIlQ5ProSdl9Ij2qW0cJW6zQ0k+piKjHbmZz
	YLG+xK0UkS8lI30ahOgRAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770772594; x=1770858994; bh=AnsFbD6A484dObcHy45DMWIYSo5yDnNHM1G
	pEvTgH5o=; b=b3GgnLz1q1unOpn7qnE9EXrM6ZKdeLVckkvLPjgL1BoDIgdDf6K
	GYn2KvKibrhUX2UuQgAqt4/X1+/gyOj3fR5Q8j4gVPbJB7/S8kwlg4Nh/6yV235L
	TLoXxktvipFG3gsFJSZJNG0XllbMYhYX4ZykkBh3grsoyPbbspa1DEHCD0uM21nX
	IKD6KLNir/JXoFQhc/ptfD0Upe0W9cIIv9BXdnPMQGdgFYmy72xE2ex+yuGC90f8
	zU442sKo0ZcWP1ZQL3FMgQtP28lw7/cwvh0PRohcIUCBOYrosI4wmF/t9pf4HHHK
	ElgjW9F8wryhxqfRupsBItgAKxhEd/SRkJw==
X-ME-Sender: <xms:ctiLaTGzXofDv5PvJVhK-a4ES7mExZDX3Urv_cZfUFuYy8WHK2rhig>
    <xme:ctiLaXUSq8rAYMRNOvgvkuOHPK85keaT0vu_FeW4H8p8YAlnEXb3BNhoONG_m7oNL
    bGVjTgFn7bxd50LJblt0b3fjpxD1ZvBAIaM9BN6FxihJW1O2XY>
X-ME-Received: <xmr:ctiLaaIHMuW_sVdlf9IOORZS7xZzm0FuB4XaNM5ZAKPDj2ACMPLrmyWjQER9xm2yc2YtPfIY3-pi2r_nDbc0donhWC48LVQsqf4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdduvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvg
    hnphhrohhjvggtthdrohhrghdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhs
    shholhhuthhiohhnshdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrd
    gtohhm
X-ME-Proxy: <xmx:ctiLaf_ZoOftoWulth-rzWSAcqbfHqjYumpeborpqr9Zhn5Qf4rPbg>
    <xmx:ctiLaVIhrekL85DnWLIsd9kME2adEvfHAXVQFwyGMU7JQxxPcwd4fw>
    <xmx:ctiLackp1SxUPaZEq9kEIZ_mjtvmzpkkPh5wtuEwPxDcRnoixE2P2w>
    <xmx:ctiLaRN0hPU0DPfJRbKZwpvk9uJeAsSqCfkkK13YBEianqyUktEo3w>
    <xmx:ctiLaTcstnUKf9bp_mLBdqLWdqai7hnKllQnc-lbGpzZEnZ--Dpl6Kpj>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 11 Feb 2026 02:16:31 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] EFI: Fix relocating ESRT for dom0
Message-ID: <aYvYb4KbMkVG12tD@mail-itl>
References: <20260211001650.1592239-1-marmarek@invisiblethingslab.com>
 <33667892-789a-4e94-ae0d-d240f7062b81@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8c6GOirE1GocLifO"
Content-Disposition: inline
In-Reply-To: <33667892-789a-4e94-ae0d-d240f7062b81@citrix.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,invisiblethingslab.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8B9561206F6
X-Rspamd-Action: no action


--8c6GOirE1GocLifO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Feb 2026 02:16:31 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] EFI: Fix relocating ESRT for dom0

On Wed, Feb 11, 2026 at 12:58:25AM +0000, Andrew Cooper wrote:
> On 11/02/2026 12:16 am, Marek Marczykowski-G=C3=B3recki wrote:
> > Fix calculating the table size - it consists of a header + entries, not
> > just entries.
> > This bug caused the last entry to have garbage in its final fields,
> > including LowestSupportedFwVersion and CapsuleFlags, which (usually)
> > made fwupd to detect firmware update availability, but refuse actually
>=20
> "made fwupd able to"
>=20
> > installing it.
> >
> > Fixes: dc7da0874ba4 ("EFI: preserve the System Resource Table for dom0")
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  xen/common/efi/boot.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index 5b84dbf26e5e..45015a0dd583 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -675,7 +675,8 @@ static size_t __init get_esrt_size(const EFI_MEMORY=
_DESCRIPTOR *desc)
> >      if ( esrt_ptr->FwResourceCount > available_len / sizeof(esrt_ptr->=
Entries[0]) )
> >          return 0;
> > =20
> > -    return esrt_ptr->FwResourceCount * sizeof(esrt_ptr->Entries[0]);
> > +    return offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries) +
> > +        esrt_ptr->FwResourceCount * sizeof(esrt_ptr->Entries[0]);
>=20
> offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries[esrt_ptr->FwResourceCount])
>=20
> is a shorter expression with the same answer, and a pattern we use
> elsewhere.=C2=A0 I can fix on commit if you're happy.

Fine with me, thanks.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--8c6GOirE1GocLifO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmL2G8ACgkQ24/THMrX
1yz3qAf/RznelSPuVWAxlgyrC9YbfLl6G7CHr5AHFo/Tb2Vyv4bOQp4ewFJ6a4ve
nMek2vI3jozBwAc01LEd3zhT7ipXyRs4SH/91iuwMJ+LavS4DIJdoeUd0D0fQ1If
m+nJESKy+P+fDSU2ii1r6t5SE7l/WqFcR7d03y5hsgX08UweuBTiDFHgg65Fi9To
rdAYJ9MLpz7ACOtv78psUt9KME+DGEbIfitJZAMAANl2iTEnz7V5fmDR17QA1+5S
W9FEvFXtVvJZikhxnuQdX94bBVCAV0TQU9dilDzD+Vd+xN1aAd9eRCQANVp9Nv6V
GIGJJHJTvuz4xqE8pL24kxsZbrWdcw==
=aEe/
-----END PGP SIGNATURE-----

--8c6GOirE1GocLifO--

