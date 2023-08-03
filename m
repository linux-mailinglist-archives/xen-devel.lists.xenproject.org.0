Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBAC76EC39
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 16:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576424.902544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZAp-0005lL-6N; Thu, 03 Aug 2023 14:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576424.902544; Thu, 03 Aug 2023 14:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZAp-0005iS-3h; Thu, 03 Aug 2023 14:19:31 +0000
Received: by outflank-mailman (input) for mailman id 576424;
 Thu, 03 Aug 2023 14:19:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dmgz=DU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qRZAn-0005iM-63
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 14:19:29 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0c78008-3208-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 16:19:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A96A81F74D;
 Thu,  3 Aug 2023 14:19:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 861A81333C;
 Thu,  3 Aug 2023 14:19:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E+wpH263y2RKDAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Aug 2023 14:19:26 +0000
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
X-Inumbo-ID: c0c78008-3208-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691072366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9mpiYXcqL7Q2jJPmy9JaK5F66QXRce8GKFt9fsWIXmI=;
	b=PtjsniYG6rpjipjCcHnN0pg94g02xC3YqT+jEZg8PpzZsDumiU4pIMlxXNgjLkoyLfrD4I
	wQoPYwJxyZz228VvIeDl1Ua3gG+wEpSJLDT69MOIGsoR2+v2Vd1R4R9Vb5DG9nOwOzZ/6O
	rz5AvawOrzHYjZYivLeBvqXSBV4j6dk=
Message-ID: <ba458b73-6994-56a6-33dd-13a35c7604fb@suse.com>
Date: Thu, 3 Aug 2023 16:19:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] libxenstat/Linux: pass nul-terminated string to strpbrk()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
References: <a7f49430-5933-8388-f73b-3f75a5877bf4@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <a7f49430-5933-8388-f73b-3f75a5877bf4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PmxH1X2QsX7U6KR0Qb02J1iE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PmxH1X2QsX7U6KR0Qb02J1iE
Content-Type: multipart/mixed; boundary="------------3h6lSz6AUEXhr6RwpHKAdL2n";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Message-ID: <ba458b73-6994-56a6-33dd-13a35c7604fb@suse.com>
Subject: Re: [PATCH] libxenstat/Linux: pass nul-terminated string to strpbrk()
References: <a7f49430-5933-8388-f73b-3f75a5877bf4@suse.com>
In-Reply-To: <a7f49430-5933-8388-f73b-3f75a5877bf4@suse.com>

--------------3h6lSz6AUEXhr6RwpHKAdL2n
Content-Type: multipart/mixed; boundary="------------BxMzJ4DwjiQAxwxdlCZjm5Xb"

--------------BxMzJ4DwjiQAxwxdlCZjm5Xb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDcuMjMgMTI6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBXaGlsZSB3aGF0ICJ0
bXAiIHBvaW50cyB0byBoYXMgYmVlbiBjbGVhcmVkIGF0IHRoZSBlbmQgb2YgdGhlIGZpcnN0
DQo+IGl0ZXJhdGlvbiBvZiBwYXJzZU5ldERldkxpbmUoKSdzIG1haW4gbG9vcCwgdGhpcyBp
cyB0b28gbGF0ZSBmb3IgdGhlDQo+IGZpcnN0IGl0ZXJhdGlvbidzIGludm9jYXRpb24gb2Yg
c3RycGJyaygpIChjb3B5aW5nIHRoZSBpbnRlcmZhY2UgbmFtZSkuDQo+IFByb3Blcmx5IG51
bC10ZXJtaW5hdGUgdGhlIHN0cmluZyBhdCBwb3B1bGF0aW9uIHRpbWUgaW5zdGVhZCwgcmVt
b3ZpbmcNCj4gdGhlIGxhdGUgY2xlYXJpbmcuDQo+IA0KPiBXaGlsZSB0aGVyZSBhbHNvIGVs
aW1pbmF0ZSBhIGNvbmZ1c2luZyAoYmVjYXVzZSBvZiBiZWluZyB3cm9uZykgY29tbWVudDoN
Cj4gQSByZWdleCBwYXJzaW5nIGVycm9yIHdvdWxkIGJlIGhhbmRsZWQgb25lIGZ1cnRoZXIg
c2NvcGUgb3V0d2FyZHMuIEhlcmUNCj4gd2UncmUgZGVhbGluZyB3aXRoIGZpZWxkIDEgdnMg
YW55IG9mIHRoZSBsYXRlciBmaWVsZHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0KDQo=
--------------BxMzJ4DwjiQAxwxdlCZjm5Xb
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------BxMzJ4DwjiQAxwxdlCZjm5Xb--

--------------3h6lSz6AUEXhr6RwpHKAdL2n--

--------------PmxH1X2QsX7U6KR0Qb02J1iE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTLt20FAwAAAAAACgkQsN6d1ii/Ey9I
Swf/RZ0OgpakolII39liPJAv/DYr57bxsOD7LKKu9NjHFF5RsNdGNHVFEQ1pwq32y5LQNI7Do4+1
YX2L8/Y4PG+EVQsT4U823a89WiX8sCNACVVekmR1Gd5+gebfF7SbecB9vl6aI+TPYgT+/5ztupIW
CQOJ69sU4cWxoQhQwohGPZGVAU4jtKdSNlFJpiD9nuuXO3O5X41VwQwuqMm4pn84xW95RVhy8bbU
UMxUQ0963pYTafM2sZQOKX4OdwK74ChcBYaAIOin1StAyBMVBkWbZAUZOMBmJQJVyL/EMwLElmX+
Y6tZw2/N+0AN8Uxtm9Ya6lS3Bn4eBiPbhqbNsyAEgQ==
=K7jw
-----END PGP SIGNATURE-----

--------------PmxH1X2QsX7U6KR0Qb02J1iE--

