Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI3fAQE4EGoaVAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 13:03:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FA35B2AA9
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 13:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316662.1586042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNen-00076b-Hx; Fri, 22 May 2026 11:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316662.1586042; Fri, 22 May 2026 11:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNen-00074U-F1; Fri, 22 May 2026 11:03:09 +0000
Received: by outflank-mailman (input) for mailman id 1316662;
 Fri, 22 May 2026 11:03:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wQNem-00074M-92
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 11:03:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQNel-00204M-Hb
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 13:03:07 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a1037eb-e002-0a2a0a5209dd-0a2a4502d2d4-4
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 13:03:07 +0200
Received: from [103.168.172.144] (helo=fout-a1-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a1037e9-af86-0a2a45020019-67a8ac90cea9-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 13:03:06 +0200
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id 4DFEEEC00F3;
 Fri, 22 May 2026 07:03:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Fri, 22 May 2026 07:03:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 May 2026 07:03:02 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1779447785;
	 x=1779534185; bh=wzMxu6DpRwzhvtfIxgBsUGd6A+m2pVfueym5QBf5w/M=; b=
	PkKgFNXffeBTd+v2F6jpv0LUlIbvHu8jzSjSDZZW5B3ct+XJo5GrXcAJSf8kFyb/
	ttPyUUbhK19hKJEaKofmgEjrmXB6MHyQWyCkd3JYqqJx7SBzGkmxISfTlrrSFCtz
	PzHQ4j2UYgtsZknEgBMuWTQNLGnOnVdNCQV+tvs3trvh5rGs+I41y+LnZjhvVwRd
	UZxdPcwsMxOxGXdCSvug9eBsF4a6nt0i03sGyWiDDa8WDBFm2wVTNfmrIFONSZL6
	g8B1bJI6UTkBQvTZYwAG71EcIltccJucSCD3O+CIvk1h/Ta/v9mX+387TbUkjB9r
	121JrUxTpGVf1MkF/9Z6BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779447785; x=1779534185; bh=wzMxu6DpRwzhvtfIxgBsUGd6A+m2pVfueym
	5QBf5w/M=; b=fdbOhnrB5ClSIFSrYIhn3I/aaukOMjHKKp0rwoVdsFe8kjN5D5G
	zolVo7zzoSFuKgwpQdHcwcLwMy6ZghHnWw2rpc0ZGxMR8kYAaGNbZPrG45HsVRJ1
	Vr4Io16W5q9m8LFZ8pFVBWpS3iArYxg75oTu2Z5ZcKVTRmDz3GaEOvyIr+w8CrBP
	ofNj81k+0AMD1y1+ZCj6Ld9jDqU6NJ8V9OPW3kIw0ziPAiyHW/Xp30XWHpmzp0+1
	yiguq1eEUVjRGRl6OVNMqky/YQNqG1rYY9iz5uuT7i+DXclMH0AbZt7G9sQUPmi9
	/yQ5XDChTyaXULWxktuSMd2CDhQ8XCxp7HA==
X-ME-Sender: <xms:6DcQagmPvgNulfEG4cGfNTnfyg00uACIpEpT1-rSW0pSefmEfph5OA>
    <xme:6DcQamN7W8n6pMY597G8LUIx0fZNoMjaoH-prFEN0N_d6km9Jhv970hkPM-2jMLKR
    -kNkbMp0OlReVXPUoCFxv17-L2Cn9Mh9uddjiYMG065F_r9>
X-ME-Received: <xmr:6DcQaq6cAgN9hNQDnTIE1QL0-f2wn5L6tWC8Y7LdSmbPxEsT9UquSahgo81Mm3JYX9J3V_BwimtSWUPphqCSpswjVNPdBE7rrP8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduhedttddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfekuddtffettefhieeuheff
    keeuffelvdffuddtteetledtveekfeekleehjefgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgv
    thhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopegrtggtvghksehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpth
    htohepohhlvghkshhiihdrkhhurhhotghhkhhosehgmhgrihhlrdgtohhmpdhrtghpthht
    oheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhope
    hsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjuhhlihgv
    nhesgigvnhdrohhrghdprhgtphhtthhopegsvghrthhrrghnugdrmhgrrhhquhhishesrg
    hrmhdrtghomhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdp
    rhgtphhtthhopehvohhlohguhihmhihrpggsrggstghhuhhksegvphgrmhdrtghomh
X-ME-Proxy: <xmx:6DcQaqaptlop6gm8t6kC3KoGGRoezDuyVyQ38ZaBL8INCY49GjRy5A>
    <xmx:6DcQandqI676eGmMF8Ab8j24YtxhSV4z9sxnk9qSsXT1nODQYYnspQ>
    <xmx:6DcQap6KGVw9m1iO6-rqFj42Mvg5tW8GfxHktcsXysZLDS6-MG342w>
    <xmx:6DcQakbc_3AlkVBLRsbyNbCZLjoLgQCrMe-a-K-CNv3TOCjN4_qI-w>
    <xmx:6TcQasIEeEU15QtIZTv3pgsQsANp4e6mKJbyg1rw1EF6vWklgEW5IE94>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 22 May 2026 13:02:59 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Szymon =?utf-8?Q?Aceda=C5=84ski?= <accek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, oleksii.kurochko@gmail.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 for-4.22] EFI: Fix boot from a device without a file
 system
Message-ID: <ahA35DwKm8LM9H_x@mail-itl>
References: <5ee376dc0df448437f386ab2606c42d63a515ca1.1779194154.git.accek@invisiblethingslab.com>
 <809b9976089eaf02e864684461ced4e939dbcc83.1779271357.git.accek@invisiblethingslab.com>
 <31ee4635-0eaa-41cd-8fad-223fb11cb9bc@suse.com>
 <b7708cbf-ea9f-4ba1-a93d-3981eacabbc7@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+lvQ2y5XmQnkW01G"
Content-Disposition: inline
In-Reply-To: <b7708cbf-ea9f-4ba1-a93d-3981eacabbc7@app.fastmail.com>
X-purgate-ID: tlsNG-720697/1779447786-8117D161-0B31C4AF/0/0
X-purgate-type: clean
X-purgate-size: 5782
X-Spamd-Result: default: False [-1.28 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:accek@invisiblethingslab.com,m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,citrix.com,kernel.org,xen.org,arm.com,amd.com,epam.com,apertussolutions.com,vates.tech,lists.xenproject.org];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,messagingengine.com:dkim,invisiblethingslab.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 18FA35B2AA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--+lvQ2y5XmQnkW01G
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 13:02:59 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Szymon =?utf-8?Q?Aceda=C5=84ski?= <accek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, oleksii.kurochko@gmail.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 for-4.22] EFI: Fix boot from a device without a file
 system

On Wed, May 20, 2026 at 02:50:57PM +0200, Szymon Aceda=C5=84ski wrote:
> On Wed, May 20, 2026, at 1:58 PM, Jan Beulich wrote:
> > On 20.05.2026 12:30, Szymon Aceda=C5=84ski wrote:
> > > @@ -1526,31 +1537,33 @@ void EFIAPI __init noreturn efi_start(EFI_HAN=
DLE ImageHandle,
> > > =20
> > >          gop =3D efi_get_gop(&gop_handle);
> > > =20
> > > -        /* Get the file system interface. */
> > > -        dir_handle =3D get_parent_handle(loaded_image, &file_name);
> > > -
> > >          /* Read and parse the config file. */
> > >          if ( read_section(loaded_image, L"config", &cfg, NULL) )
> > >              PrintStr(L"Using builtin config file\r\n");
> > > -        else if ( !cfg_file_name && file_name )
> > > +        else
> > >          {
> > > -            CHAR16 *tail;
> > > +            ensure_dir_handle(loaded_image, &dir_handle, &file_name);
> > > =20
> > > -            while ( (tail =3D point_tail(file_name)) !=3D NULL )
> > > +            if ( !cfg_file_name )
> > >              {
> > > -                wstrcpy(tail, L".cfg");
> > > -                if ( read_file(dir_handle, file_name, &cfg, NULL) )
> > > -                    break;
> > > -                *tail =3D 0;
> > > +                CHAR16 *tail;
> > > +
> > > +                while ( (tail =3D point_tail(file_name)) !=3D NULL )
> > > +                {
> > > +                    wstrcpy(tail, L".cfg");
> > > +                    if ( read_file(dir_handle, file_name, &cfg, NULL=
) )
> > > +                        break;
> > > +                    *tail =3D 0;
> > > +                }
> > > +                if ( !tail )
> > > +                    blexit(L"No configuration file found.");
> > > +                PrintStr(L"Using configuration file '");
> > > +                PrintStr(file_name);
> > > +                PrintStr(L"'\r\n");
> > >              }
> > > -            if ( !tail )
> > > -                blexit(L"No configuration file found.");
> > > -            PrintStr(L"Using configuration file '");
> > > -            PrintStr(file_name);
> > > -            PrintStr(L"'\r\n");
> > > +            else if ( !read_file(dir_handle, cfg_file_name, &cfg, NU=
LL) )
> > > +                blexit(L"Configuration file not found.");
> > >          }
> > > -        else if ( !read_file(dir_handle, cfg_file_name, &cfg, NULL) )
> > > -            blexit(L"Configuration file not found.");
> > >          pre_parse(&cfg);
> > > =20
> > >          if ( section.w )
> >=20
> > Seeing in particular this hunk - why not have read_file() call the new =
function?
>=20
> This is because get_parent_handle not only sets dir_handle, but also sets
> file_name to something like xen.efi or BOOTX64.EFI. The quoted code then
> replaces .efi with .cfg to get the path to the config file to load:

Yes, especially for this case, get_parent_handle() needs to be called
before read_file(). Other calls don't need that, but I'm not sure if having
two ways of calling read_file() would be better.

Speaking of, the dir_handle=3D=3DNULL case in read_file() is unreachable
now, right? Maybe can be replaced with an assert?

> > > +                while ( (tail =3D point_tail(file_name)) !=3D NULL )
> > > +                {
> > > +                    wstrcpy(tail, L".cfg");
> > > +                    if ( read_file(dir_handle, file_name, &cfg, NULL=
) )
>=20
> I considered calling ensure_dir_handle() from read_file() for the other
> call sites, but this would:
> - still leave the explicit call in the quoted hunk, so it's a bit
>   inconsistent (most calls implicit, one explicit)
> - requires passing loaded_image to read_file + changing dir_handle
>   argument to a pointer
>=20
> Happy to do it in v3 if you think the call-site savings outweigh
> the inconsistency and the extra argument.
>=20
> > Most of the churn here would then go away.
>=20
> The hunk above is the restructure of two else-if branches into a single
> else block with ensure_dir_handle() on top. Most of the churn is
> indentation.
>=20
> Szymon
>=20
> (ACK on sending new patch versions as new threads)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+lvQ2y5XmQnkW01G
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoQN+QACgkQ24/THMrX
1yyxoQgAjlBHwLXNAam5S09OUdm64jI8DNxh5plkhgZq3yx92YJujMLr5+Cnlg2h
66nG37AkIJfpzI8xM/KiAdnmoSy7kMbgmTOyIq5CSrntpVD41Tmy3RxDIJhTXUJj
y1SkKjwfUJ/t9FrKJT5yEn9ZKWilGW5L5odCot4zsW06oD5kHIroSJ2EHKK9ZZli
1ZtJ/1uM5bE8GId+GqXm4mgP9QG07r6rzNycfuPq8jAtbivOZaguhSpXAVKvJ4qw
B5Oc81I64xe/vTmAo8jSK22m2xK9T0tsT5DJeyMEH7Bqf/Xb9BAWZeeSp2cF9gnP
Nnsy2ymQRg6b31ARoQlokkVv2Gxeqg==
=5vdS
-----END PGP SIGNATURE-----

--+lvQ2y5XmQnkW01G--

