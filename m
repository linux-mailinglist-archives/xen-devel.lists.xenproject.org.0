Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC53530959
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 08:06:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335331.559486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1Cm-0004eb-4q; Mon, 23 May 2022 06:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335331.559486; Mon, 23 May 2022 06:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1Cm-0004b8-0T; Mon, 23 May 2022 06:06:12 +0000
Received: by outflank-mailman (input) for mailman id 335331;
 Mon, 23 May 2022 06:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IlF8=V7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nt1Ck-0004b2-07
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 06:06:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e688f49-da5e-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 08:06:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B67641F899;
 Mon, 23 May 2022 06:06:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E77C13AA5;
 Mon, 23 May 2022 06:06:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1CrOF00ki2JIdwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 23 May 2022 06:06:05 +0000
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
X-Inumbo-ID: 6e688f49-da5e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653285965; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tBol9KN+kIIDQUlOQe3NDj96wloUsVN38d0jaLqznSY=;
	b=pBX1vuGF+578QbT4NwNKmfgVuxNM+kCUdYmeLTA2tP2wHfqSHq/hSCEh05cLzZ6XK9gHra
	4g7nR8xi5QmBpb6u7OUPJPaZO2zATRuv1k7ZzvDfRye9Nj9xLHtWjOan1QoXUSzdL8OsD9
	p0Qk/sHiLuWiFDOjTiUMq3Nvd+xv2l0=
Message-ID: <54c20bf3-85eb-29f7-35e7-906436e4cb75@suse.com>
Date: Mon, 23 May 2022 08:06:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7 5/7] xenstored: send an evtchn notification on
 introduce_domain
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2205131405550.3842@ubuntu-linux-20-04-desktop>
 <20220513210730.679871-5-sstabellini@kernel.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220513210730.679871-5-sstabellini@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CgdslzVUpSB6QkQGJQyZhE3g"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CgdslzVUpSB6QkQGJQyZhE3g
Content-Type: multipart/mixed; boundary="------------EXfsNMHh6OoBwmctGTXbUkpS";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Message-ID: <54c20bf3-85eb-29f7-35e7-906436e4cb75@suse.com>
Subject: Re: [PATCH v7 5/7] xenstored: send an evtchn notification on
 introduce_domain
References: <alpine.DEB.2.22.394.2205131405550.3842@ubuntu-linux-20-04-desktop>
 <20220513210730.679871-5-sstabellini@kernel.org>
In-Reply-To: <20220513210730.679871-5-sstabellini@kernel.org>

--------------EXfsNMHh6OoBwmctGTXbUkpS
Content-Type: multipart/mixed; boundary="------------0x47wVZSPZvEVPpl0Znvzf8D"

--------------0x47wVZSPZvEVPpl0Znvzf8D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDUuMjIgMjM6MDcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gRnJvbTog
THVjYSBNaWNjaW8gPGx1Y21pY2Npb0BnbWFpbC5jb20+DQo+IA0KPiBXaGVuIHhzX2ludHJv
ZHVjZV9kb21haW4gaXMgY2FsbGVkLCBzZW5kIG91dCBhIG5vdGlmaWNhdGlvbiBvbiB0aGUN
Cj4geGVuc3RvcmUgZXZlbnQgY2hhbm5lbCBzbyB0aGF0IGFueSAoZG9tMGxlc3MpIGRvbWFp
biB3YWl0aW5nIGZvciB0aGUNCj4geGVuc3RvcmUgaW50ZXJmYWNlIHRvIGJlIHJlYWR5IGNh
biBjb250aW51ZSB3aXRoIHRoZSBpbml0aWFsaXphdGlvbi4NCj4gQmVmb3JlIHNlbmRpbmcg
dGhlIG5vdGlmaWNhdGlvbiwgY2xlYXIgWEVOU1RPUkVfUkVDT05ORUNUSU5HLg0KPiANCj4g
VGhlIGV4dHJhIG5vdGlmaWNhdGlvbiBpcyBoYXJtbGVzcyBmb3IgZG9tYWlucyB0aGF0IGRv
bid0IHJlcXVpcmUgaXQuDQo+IA0KPiBJbiB4c193aXJlLmggdXBkYXRlIHRoZSBjb21tbWVu
dCBvbiB0b3Agb2YgWEVOU1RPUkVfUkVDT05ORUNUSU5HIHRvDQo+IGdlbmVyYWxpemUgaXRz
IG1lYW5pbmcgdG8gc3VpdCB0aGUgZG9tMGxlc3MgdXNlLWNhc2UgYmV0dGVyLiBBbHNvDQo+
IGltcHJvdmUgZG9jcy9taXNjL3hlbnN0b3JlLXJpbmcudHh0Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTHVjYSBNaWNjaW8gPGx1Y21pY2Npb0BnbWFpbC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+
DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0K
SnVlcmdlbg0K
--------------0x47wVZSPZvEVPpl0Znvzf8D
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0x47wVZSPZvEVPpl0Znvzf8D--

--------------EXfsNMHh6OoBwmctGTXbUkpS--

--------------CgdslzVUpSB6QkQGJQyZhE3g
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKLJEwFAwAAAAAACgkQsN6d1ii/Ey+R
awf/eYjN6A3e0u3x4FCs2q/MV6o0ioKN/+4T4P+BhZ2oSUCpXA5swawo2gITXY7KsyFk0J99ANpF
Ku1pjl9AjG0O/BKTHbH7AwKXMfW+f4+czrnVnBEoGMFCaKIQ5IcjHxwCavuXP5gAMOx/zIDynWm3
y8yljiWHUsfog2KKXVCV6+R7eOlGyDJzdK/cp0vKaZcBBM+YoMyz7k8KPcZb/Td0oj84ZWe3McXf
wGwrUaFCqgtEx2aB3W/3ULVXbskxaSboJB9ZgAsrpUHysjdbyK6fk0hBkDclFE3bKMrnElY1y60p
e57z6iJj9bqV35qsQkW2yvcgYoX2jaC15umycui+0A==
=kSe5
-----END PGP SIGNATURE-----

--------------CgdslzVUpSB6QkQGJQyZhE3g--

