Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE70780EB2A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 13:01:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652987.1019221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD1SN-0000lv-Cf; Tue, 12 Dec 2023 12:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652987.1019221; Tue, 12 Dec 2023 12:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD1SN-0000jd-82; Tue, 12 Dec 2023 12:01:47 +0000
Received: by outflank-mailman (input) for mailman id 652987;
 Tue, 12 Dec 2023 12:01:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rD1SL-0000jV-KH
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 12:01:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37ee00e4-98e6-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 13:01:44 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A47C91F381;
 Tue, 12 Dec 2023 12:01:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7AA8C13725;
 Tue, 12 Dec 2023 12:01:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id P1hWHKdLeGWWQwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 12:01:43 +0000
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
X-Inumbo-ID: 37ee00e4-98e6-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702382503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FDRQqvbxbFjhR+tSrmaOEiscLNB5HmtWiVCC6TrP330=;
	b=fLmY75EyO19nS9kfcnVueXIDt2+5y3g8gVPcaa6LLRx7phmas1gPQC9vW1bB25lpK17E32
	XOWOTpQYWfsltnaYliaGSbdx8ljM1CBMpSDb1LBboh6PLBu1kvQScxELMqiB1P9z3H2G+r
	yYroNHIkJfeZ5It8uEzPMx91khRqD/A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702382503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FDRQqvbxbFjhR+tSrmaOEiscLNB5HmtWiVCC6TrP330=;
	b=fLmY75EyO19nS9kfcnVueXIDt2+5y3g8gVPcaa6LLRx7phmas1gPQC9vW1bB25lpK17E32
	XOWOTpQYWfsltnaYliaGSbdx8ljM1CBMpSDb1LBboh6PLBu1kvQScxELMqiB1P9z3H2G+r
	yYroNHIkJfeZ5It8uEzPMx91khRqD/A=
Message-ID: <a3dd7a99-5706-4c6a-bf71-b159bc2a88c5@suse.com>
Date: Tue, 12 Dec 2023 13:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OSSTEST PATCH 2/3] create_build_jobs: Enable X86_GENERIC for
 i386 kernel pvops jobs.
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20231208160226.14739-1-anthony.perard@citrix.com>
 <20231208160226.14739-3-anthony.perard@citrix.com> <ZXgcBIAkmWrLvo-h@macbook>
 <6a175474-e6d4-4410-bde1-47c9895baeac@suse.com>
 <0fef2f6d-9211-4f0d-a261-e1b2e180813f@perard>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <0fef2f6d-9211-4f0d-a261-e1b2e180813f@perard>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9UvtDfc8jPTxoO8oWnhUMpU7"
X-Spam-Level: ***************
X-Spam-Score: 15.00
X-Spam-Flag: YES
X-Spam-Level: 
X-Rspamd-Server: rspamd1
X-Rspamd-Queue-Id: A47C91F381
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=fLmY75Ey;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Result: default: False [-7.70 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAM_FLAG(5.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -7.70

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9UvtDfc8jPTxoO8oWnhUMpU7
Content-Type: multipart/mixed; boundary="------------eao9NKA7HGJ2o0FoMDzBPvJ2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <a3dd7a99-5706-4c6a-bf71-b159bc2a88c5@suse.com>
Subject: Re: [OSSTEST PATCH 2/3] create_build_jobs: Enable X86_GENERIC for
 i386 kernel pvops jobs.
References: <20231208160226.14739-1-anthony.perard@citrix.com>
 <20231208160226.14739-3-anthony.perard@citrix.com> <ZXgcBIAkmWrLvo-h@macbook>
 <6a175474-e6d4-4410-bde1-47c9895baeac@suse.com>
 <0fef2f6d-9211-4f0d-a261-e1b2e180813f@perard>
In-Reply-To: <0fef2f6d-9211-4f0d-a261-e1b2e180813f@perard>

--------------eao9NKA7HGJ2o0FoMDzBPvJ2
Content-Type: multipart/mixed; boundary="------------Uvp1P0VVgnWDsh34SSbh2dcV"

--------------Uvp1P0VVgnWDsh34SSbh2dcV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTIuMjMgMTI6NTYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUdWUsIERl
YyAxMiwgMjAyMyBhdCAwOTo0ODo0NkFNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gT24gMTIuMTIuMjMgMDk6MzgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24g
RnJpLCBEZWMgMDgsIDIwMjMgYXQgMDQ6MDI6MjVQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6DQo+Pj4+IFRoaXMgaXMgZm9sbG93aW5nIGEgZmFpbHVyZSB0byBidWlsZCAiYXJj
aC94ODYveGVuL2VubGlnaHRlbi5jIiBpbg0KPj4+PiBidWlsZC1pMzg2LXB2b3BzIGpvYnMg
d2l0aCBsaW51eCA5NjhmMzVmNGFiMWMgKCJNZXJnZSB0YWcNCj4+Pj4gJ3Y2LjctcmMzLXNt
YjMtY2xpZW50LWZpeGVzJyBvZiBnaXQ6Ly9naXQuc2FtYmEub3JnL3NmcmVuY2gvY2lmcy0y
LjYiKQ0KPj4+PiBpbiBsaW51eC1saW51cyBicmFuY2guDQo+Pj4NCj4+PiBDb3VsZCB3ZSBl
eHBhbmQgYSBiaXQgb24gd2h5IENPTkZJR19YODZfR0VORVJJQyBpcyByZXF1aXJlZD8gIEl0
IHdvdWxkDQo+Pj4gc2VlbSB0byBtZSB0aGF0IG9wdGlvbiBzaG91bGQgaGF2ZSBiZWVuIHNl
bGVjdGVkIGJ5IGRlZmF1bHQgYWxyZWFkeT8NCj4+DQo+PiBObywgdGhlIGtlcm5lbCdzIGRl
ZmF1bHQgZm9yIDMyLWJpdCB4ODYgYnVpbGRzIGlzIHN0aWxsIHVzaW5nIHRoZSBNNjg2Lg0K
Pj4NCj4+IEkgZ3Vlc3MgdGhpcyBpcyBmb3IgaGlzdG9yaWNhbCByZWFzb25zLg0KPiANCj4g
SWYgSSBhZGQgdGhlIGZvbGxvd2luZyB0byB0aGUgcGF0Y2ggZGVzY3JpcHRpb24sIHRha2Vu
IGZyb20gSnVlcmdlbg0KPiBwYXRjaCwgd291bGQgdGhhdCBiZSBvaz8NCj4gDQo+ICAgICAg
VG9kYXkgdGhlIGNwdSB0eXBlIGZvciBhIDMyLWJpdCB4ODYga2VybmVsIGlzIG5vdCBzcGVj
aWZpZWQgaW4gdGhlDQo+ICAgICAgdXNlZCBrZXJuZWwgY29uZmlnLCByZXN1bHRpbmcgaW4g
dGhlIE02ODYgdG8gYmUgdXNlZC4NCj4gDQo+ICAgICAgSW5zdGVhZCBvZiB1c2luZyB0aGUg
TTY4NiB3aGljaCBpc24ndCBldmVuIGEgNjQtYml0IGNwdSAodGh1cyBub3QNCj4gICAgICBj
YXBhYmxlIHRvIHJ1biBhIFhlbiBndWVzdCksIHVzZSB0aGUgWDg2X0dFTkVSSUMgdmFyaWFu
dCB3aGljaCBpcw0KPiAgICAgIG1vcmUgYXBwcm9wcmlhdGUuDQo+IA0KPiByZWY6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTIwNzA4MDk1My4yNzk3Ni0xLWpncm9zc0Bz
dXNlLmNvbS8NCj4gDQo+IEknbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFuIEp1ZXJnZW4gd2l0
aCAibm90IDY0Yml0IGNwdSAtPiBjYW4ndCBydW4geGVuDQo+IGd1ZXN0IiwgbWF5YmUgaXQn
cyBiZWNhdXNlIHdlIGNhbiBvbmx5IHJ1biBYZW4gb24gNjQtYml0IGNwdXMgbm93YWRheXMs
DQo+IHNvIGlmIHdlIGNhbid0IHJ1biBYZW4sIHRoZXJlJ3Mgbm8gWGVuIGd1ZXN0Pw0KDQpD
b3JyZWN0Lg0KDQoNCkp1ZXJnZW4NCg0K
--------------Uvp1P0VVgnWDsh34SSbh2dcV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Uvp1P0VVgnWDsh34SSbh2dcV--

--------------eao9NKA7HGJ2o0FoMDzBPvJ2--

--------------9UvtDfc8jPTxoO8oWnhUMpU7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmV4S6cFAwAAAAAACgkQsN6d1ii/Ey+Z
Vwf/VdvMe2Wcx9zwrK6fX3xO2nVCH8PXtFzW8oeLcAeLZMeyVPlaDTnxg3mlHBrn4XjNJnymWUda
TYBcLVHPDoVUwMv6lTYc1CFZVn/R7Kvh7e4m0jZTWyfK3o2mAJ4GxzLqRsB7rjGPWg7ntwoIN52H
Xoo4jVsJKNA/EEFGO99KhuBAqeUm2GqeWnVhHcIuqSbmLqmMGeu/Mxzu2Xb1fEj7wlBjx4yWkrKo
1sdPm/Ek1hRekR1sx4Yt0jeyxxbDSqmi98VYOkVz7N3Axpk3telEsJyLNm9JTCkyEaMZ4Hfx6wTp
WmYysyoYAF0oTiWtn77B35gCOddxNv4zZC4y1FiVag==
=r2n/
-----END PGP SIGNATURE-----

--------------9UvtDfc8jPTxoO8oWnhUMpU7--

