Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMQeNiXS32kNZQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 20:00:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 484B9406F32
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 20:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282833.1565264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4Wc-0004wU-Hw; Wed, 15 Apr 2026 17:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282833.1565264; Wed, 15 Apr 2026 17:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4Wc-0004tR-F8; Wed, 15 Apr 2026 17:59:42 +0000
Received: by outflank-mailman (input) for mailman id 1282833;
 Wed, 15 Apr 2026 17:59:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wD4Wb-0004tL-4r
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 17:59:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD4Wa-00Fo2C-Hx
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 19:59:40 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69dfd1f9-2eae-0a2a0a5409dd-0a2a4508c85a-26
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:59:40 +0200
Received: from [202.12.124.151] (helo=fout-b8-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69dfd20b-fab6-0a2a45080019-ca0c7c97d1bb-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:59:40 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id BEBBF1D00178;
 Wed, 15 Apr 2026 13:59:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 15 Apr 2026 13:59:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Apr 2026 13:59:36 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1776275978;
	 x=1776362378; bh=TItQ1Z10KOZDPzGlEFaeVgGZZIHK2+KajL7t9C/o4mM=; b=
	Tec/2A3sBHuO8GSwNUPExGaG222ls2FUa7QbrgjUx/BRV0KjsHWwf4orU6AwO7v9
	RW8CojmfHvMrYaIkYfFNkw5xB/oQ0cbsEUIJd8WSyq9ne37Cz0L+pswKB9PP9318
	sYJVY+WZZntJayMu5ndQ+P/IWsEzR4wa/p431dY6RTsVA1WjnZke9e+hJ7pH9fyL
	hPK+xTWf08mkOWr7OXlGU3+c4zYBr82jBKH3c243NtrpKQzGwJzM4ga7EpagmIhX
	OlJ/v+JCPm1CWDdGzOUsbwV/swkzQJvfqpnyEUEIyC7AgFfEhjb/IdgM7j/j+pnf
	GEr2zhFrlW0S/+KyLbfn4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776275978; x=1776362378; bh=TItQ1Z10KOZDPzGlEFaeVgGZZIHK2+KajL7
	t9C/o4mM=; b=YNUrjIXRcY5lhC+BYaYk22i8ZxTm8f6l1V9mN0qGroCF37mz7Jn
	u35+susCAjvqwxPvrkh3CsC597TMlxqAXi5IJerrI0MrKsLm3rjOcvSX19hm425s
	UZ+JIUqBWIQbxW1cEqYE+dSoxDz/n6UvUHbb5mBcQwEP1c3acDO+x6cvKLgKJ0wy
	c6IsoeHBj9IOTdNQ+RmD6oejqsDBxMfFE+l/StB+zl4op+t7Ud5BDZ+0ijoSltJ+
	VzrbJTK9ZTWdEHGurtfgQaOz14T+bWATWj82/HOannUdHshWIUSMzTMI5rVTisqZ
	4TxntLnBnaGBwwMCxVy2QOCY1yEJ/vp36wQ==
X-ME-Sender: <xms:CtLfaWGIWzlpVZUOIdW0u_5q_tsLVvMM-qhP-z5sicPWVTKQazg17w>
    <xme:CtLfaeMdGZt-4NxMTCWlc8XVvvDR8J2JK2IeIXLh4xplhQCgeAnbjOymV5s3Tzftp
    I0JFIWt9Vuo2xsOYg7_ZtM82q63X3CK5Ty4-fNOdyq8wUNp0A>
X-ME-Received: <xmr:CtLfaYc-4qQOquA5331iOaS5EHk5eLUuWLvd4_EZk6z5Qqld7rWIHtltq47->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeggeejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgr
    thgvshdrthgvtghhpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:CtLfabsTl7RWx73OfT0q9OnsTU04nDvDn5cnX_Ki1MO7oF5xh83JJA>
    <xmx:CtLfaZklhy900oHUV-lLcHOssFExGpzdIIvZ3BVLV5508jnvXDnMTQ>
    <xmx:CtLfadzRWgMWNZbekdIAh_Nzxomx6IlV65DJO2Hz0WyygGa8hUlzfw>
    <xmx:CtLfabNKQJug3uIiHLU2b7a2rKxQiC_oayzxbWJHE0ehuxHaGoC3Mw>
    <xmx:CtLfaZ2_FuF01yqkZlzDdy6uFcvSUPhfipWTx6f5BeDjGKfkQJqSkvSC>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 15 Apr 2026 19:59:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v3 03/13] Add debian rootfs artifact
Message-ID: <ad_SBvYvvFmOspSQ@mail-itl>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
 <ad97jcRfLG7nXk29@l14>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iO2MMPZnQIZUJ200"
Content-Disposition: inline
In-Reply-To: <ad97jcRfLG7nXk29@l14>
X-purgate-ID: tlsNG-c1860d/1776275980-F5358497-608B4827/0/0
X-purgate-type: clean
X-purgate-size: 4493
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 484B9406F32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--iO2MMPZnQIZUJ200
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Apr 2026 19:59:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v3 03/13] Add debian rootfs artifact

On Wed, Apr 15, 2026 at 11:50:38AM +0000, Anthony PERARD wrote:
> I'm commenting on changes I found in the branch used by the pipeline
> linked in the cover leter, since there's no copy on the mailing list of
> the patch :-( (overzealous spam filter).
>=20
> > diff --git a/scripts/debian-rootfs.sh b/scripts/debian-rootfs.sh
> > new file mode 100755
> > index 000000000000..7cb8a96e39c0
> > --- /dev/null
> > +++ b/scripts/debian-rootfs.sh
> ...
> > +PKGS=3D(
> > +    # System
> > +    bridge-utils
> > +    dropbear
> > +    udev
> > +    systemd-sysv
> > +    iproute2
> > +    inetutils-ping
> > +    util-linux
> > +    cpio
>=20
> Is `cpio` going to be used in dom0? The alpine rootfs don't have it.

Alpine does have it, via busybox. That said, I don't see it used in any
current test.

> > +# don't need persistent logging, avoid journal flush service
> > +rmdir var/log/journal
>=20
> I think this would better be done with:
>=20
>     cat >> /etc/systemd/journald.conf.d/storage.conf <<EOF
>     [Journal]
>     Storage=3Dvolatile
>     EOF
>=20
> because I think systemd intend to change the behavior in future release,
> and we are more explicit with a config file.

+1=20

> > +# Create rootfs
> > +cd /
> > +{
> > +    PATHS=3D"bin etc home init lib lib64 mnt opt root sbin srv tmp usr=
 var"
> > +    find $PATHS -print0
> > +    echo -ne "dev\0proc\0run\0sys\0"
> > +} | cpio -0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
>=20
> You should add "-R0:0" to the `cpio` command, like we do for the alpine
> rootfs.

Hm, I'm not sure if that's a good idea. There are a few intentionally
non-root files in Debian. Right now that is:

-rw-r-----   1 root     42            496 Apr  1 01:08 etc/gshadow
-rw-r-----   1 root     42            564 Apr  1 01:08 etc/shadow
-rw-r-----   1 root     42            444 Apr  1 01:08 etc/gshadow-
-rw-r-----   1 root     42            565 Apr  1 01:08 etc/shadow-
-rwxr-sr-x   1 root     42          31256 Apr 19  2025 usr/bin/expiry
-rwxr-sr-x   1 root     42         113848 Apr 19  2025 usr/bin/chage
-rwsr-xr--   1 root     printadm    51272 Mar  8  2025 usr/lib/dbus-1.0/dbu=
s-daemon-launch-helper
-rwxr-sr-x   1 root     42          43256 Jun 29  2025 usr/sbin/unix_chkpwd
drwxr-xr-x   2 systemd- systemd-        0 Apr  1 01:08 var/lib/systemd/netw=
ork
drwxr-xr-x   2 42       root            0 Apr  1 01:07 var/lib/apt/lists/au=
xfiles
drwx------   2 42       root            0 Apr  1 01:07 var/lib/apt/lists/pa=
rtial
drwxrwsr-x   2 root     mem             0 Sep  8  2025 var/mail
-rw-rw-r--   1 root     43              0 Sep  8  2025 var/log/wtmp
-rw-rw-r--   1 root     43              0 Sep  8  2025 var/log/lastlog
-rw-rw----   1 root     43              0 Sep  8  2025 var/log/btmp
-rw-r-----   1 root     adm         31508 Apr  1 01:08 var/log/apt/term.log
drwx------   2 42       root            0 Apr  1 01:08 var/cache/apt/archiv=
es/partial

While it _might_ not explode right now if we reset it to root, it may
cause issues in the future (for example APT likes to run downloads as
unprivileged user, with write access only to
/var/lib/apt/lists/partial).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--iO2MMPZnQIZUJ200
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnf0gYACgkQ24/THMrX
1yywJAf9Hox59QX1bPfUoIvyEWf6brJupObK9u+k+Palml7/JlBzUPBjOEx9kRXk
xOq1PQztrcF67Bah2eiGDSPPB8/DkLRNLUXUXRmMRzWIvFSonmYOTqx5MdEjUUiP
dA7iPxyK0/1w/GQ7aL+ZrmUCHgoceX/0U90hst0Vj9J44t2+whMpPi8qq8NpJdyZ
itoewc1fKyNvyz/b49Ao3v8lfNZ+MXL0hm3qiFYYdEzMTHagStlggr2+GcrcxoMt
SXc/jJY/YbUGerEZLcISuoaz2yRZ3gUsoovJQaqj2R4xp04PUZOLAhxTgsP+defN
kQjM5bxi1ESRIPgEsgBWG9rlSaJIDA==
=wwwp
-----END PGP SIGNATURE-----

--iO2MMPZnQIZUJ200--

