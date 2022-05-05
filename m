Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA0A51B918
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 09:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321545.542552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVwp-00061h-MB; Thu, 05 May 2022 07:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321545.542552; Thu, 05 May 2022 07:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVwp-0005z2-Io; Thu, 05 May 2022 07:30:51 +0000
Received: by outflank-mailman (input) for mailman id 321545;
 Thu, 05 May 2022 07:30:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YMz1=VN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nmVwn-0005yw-Uz
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 07:30:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48cc7b53-cc45-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 09:30:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 89312210E0;
 Thu,  5 May 2022 07:30:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 307CC13A65;
 Thu,  5 May 2022 07:30:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /s1tCih9c2KZcQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 05 May 2022 07:30:48 +0000
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
X-Inumbo-ID: 48cc7b53-cc45-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651735848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+fW1f7/zymDhOc4ll/u+MKfC167UDYSprVePkH1SmY4=;
	b=cOikIPDcirvjLvuLc7EXXIdct59fi5RZDnVKERqquJ9hXiaQ329CODYLcyZwQOVSgmdsvK
	RSD3nB2VT+frThbkl33sWjaUeZNtKoG0dpvQS7iicW7IIBlBKNjBLBP4EWPgn71Iyh4f09
	hVAX2Lmlt6v17Mir7+v0+7MgutokGTo=
Message-ID: <3ac34875-0e3d-076a-e5b1-7561a5e7a5fa@suse.com>
Date: Thu, 5 May 2022 09:30:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 5/7] xenstored: send an evtchn notification on
 introduce_domain
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 anthony.perard@citrix.com, wl@xen.org
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-5-sstabellini@kernel.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220505001656.395419-5-sstabellini@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SUfep81T9IQVwUKKhrl7tmsE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SUfep81T9IQVwUKKhrl7tmsE
Content-Type: multipart/mixed; boundary="------------pKXn5jatHkAgUxsB8retxnTu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 anthony.perard@citrix.com, wl@xen.org
Message-ID: <3ac34875-0e3d-076a-e5b1-7561a5e7a5fa@suse.com>
Subject: Re: [PATCH v6 5/7] xenstored: send an evtchn notification on
 introduce_domain
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-5-sstabellini@kernel.org>
In-Reply-To: <20220505001656.395419-5-sstabellini@kernel.org>

--------------pKXn5jatHkAgUxsB8retxnTu
Content-Type: multipart/mixed; boundary="------------1rlfoowGkiJN1XT1U8g2KLfg"

--------------1rlfoowGkiJN1XT1U8g2KLfg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDUuMjIgMDI6MTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gRnJvbTog
THVjYSBNaWNjaW8gPGx1Y21pY2Npb0BnbWFpbC5jb20+DQo+IA0KPiBXaGVuIHhzX2ludHJv
ZHVjZV9kb21haW4gaXMgY2FsbGVkLCBzZW5kIG91dCBhIG5vdGlmaWNhdGlvbiBvbiB0aGUN
Cj4geGVuc3RvcmUgZXZlbnQgY2hhbm5lbCBzbyB0aGF0IGFueSAoZG9tMGxlc3MpIGRvbWFp
biB3YWl0aW5nIGZvciB0aGUNCj4geGVuc3RvcmUgaW50ZXJmYWNlIHRvIGJlIHJlYWR5IGNh
biBjb250aW51ZSB3aXRoIHRoZSBpbml0aWFsaXphdGlvbi4NCj4gQmVmb3JlIHNlbmRpbmcg
dGhlIG5vdGlmaWNhdGlvbiwgY2xlYXIgWEVOU1RPUkVfUkVDT05ORUNUSU5HLg0KPiANCj4g
VGhlIGV4dHJhIG5vdGlmaWNhdGlvbiBpcyBoYXJtbGVzcyBmb3IgZG9tYWlucyB0aGF0IGRv
bid0IHJlcXVpcmUgaXQuDQo+IA0KPiBJbiB4c193aXJlLmggdXBkYXRlIHRoZSBjb21tbWVu
dCBvbiB0b3Agb2YgWEVOU1RPUkVfUkVDT05ORUNUSU5HIHRvDQo+IGdlbmVyYWxpemUgaXRz
IG1lYW5pbmcgdG8gc3VpdCB0aGUgZG9tMGxlc3MgdXNlLWNhc2UgYmV0dGVyLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTHVjYSBNaWNjaW8gPGx1Y21pY2Npb0BnbWFpbC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQHhp
bGlueC5jb20+DQo+IENDOiBqZ3Jvc3NAc3VzZS5jb20NCj4gQ0M6IGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20NCj4gQ0M6IHdsQHhlbi5vcmcNCj4gLS0tDQo+IElmIHlvdSBoYXZlIGJl
dHRlciBzdWdnZXN0aW9ucyBmb3IgdGhlIHdvcmRpbmcgaW4geHNfd2lyZS5oIHBsZWFzZQ0K
PiBzdWdnZXN0IQ0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------1rlfoowGkiJN1XT1U8g2KLfg
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------1rlfoowGkiJN1XT1U8g2KLfg--

--------------pKXn5jatHkAgUxsB8retxnTu--

--------------SUfep81T9IQVwUKKhrl7tmsE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJzfScFAwAAAAAACgkQsN6d1ii/Ey/D
GwgAgzGSePVAcOSdWAzfdEdr6BsuPI1/+v1h5xaRs/5hPXOBe8124DOcyOpqzHL6Km515qe2kVl4
tfJ4hH+94gZhbQxkIw5EYIup13Hup7fGXQgiHvhJxeKWXCfCSmo4dEX8kI4MzG1lmL8PlX23d2zi
ez3crw8womVl9rBgLkq4KgdQHhJxnUtl7fW8ZcnrLn5FLYNEDBGtqsYn0NoKMg8CVpaxAsHHOV4Y
5u9Q2YwiTU129YygKuOo7r6gVZXwizKuZXeLyjw8b3yXLNb4Vc3SSBZTMvEfJqpRcrXPHoxO5WJu
XZM3DIFp7k2M6A5TokHdh+XpwdQQ5rUCG4GbXgLA5g==
=4jYQ
-----END PGP SIGNATURE-----

--------------SUfep81T9IQVwUKKhrl7tmsE--

