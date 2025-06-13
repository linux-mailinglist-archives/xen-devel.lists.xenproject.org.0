Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD623AD87FD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 11:34:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014150.1392397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ0nX-00069k-NW; Fri, 13 Jun 2025 09:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014150.1392397; Fri, 13 Jun 2025 09:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ0nX-00067L-Kc; Fri, 13 Jun 2025 09:34:07 +0000
Received: by outflank-mailman (input) for mailman id 1014150;
 Fri, 13 Jun 2025 09:34:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uQ0nV-000678-Ib
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 09:34:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b845b4e-4839-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 11:34:04 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BA9B72186F;
 Fri, 13 Jun 2025 09:34:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A9F0137FE;
 Fri, 13 Jun 2025 09:34:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FMy4H4vwS2jDPAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Jun 2025 09:34:03 +0000
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
X-Inumbo-ID: 8b845b4e-4839-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1749807243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HmL+SUXn84DQyTGwzvsf9NWUSwsHo91ICHEyzRG2yx8=;
	b=lpN24zC7WD/eK117SwoAYZ/cF4nU4+LEabvXcZ1LQUS4N2KgjxvNSp13d+HcdT0yuMH1ru
	w20z1WQqCRNJqy/2iZADfifYW9CDf2OC8QxPHbhPGVE1mYE+g+gieCY8dzgCAiDwLdl/2c
	oAnr+dltr60BXACms8kgR5iSe/d2jpQ=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1749807243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HmL+SUXn84DQyTGwzvsf9NWUSwsHo91ICHEyzRG2yx8=;
	b=lpN24zC7WD/eK117SwoAYZ/cF4nU4+LEabvXcZ1LQUS4N2KgjxvNSp13d+HcdT0yuMH1ru
	w20z1WQqCRNJqy/2iZADfifYW9CDf2OC8QxPHbhPGVE1mYE+g+gieCY8dzgCAiDwLdl/2c
	oAnr+dltr60BXACms8kgR5iSe/d2jpQ=
Message-ID: <759aabab-a5d6-4fdf-b19a-65ad5363340d@suse.com>
Date: Fri, 13 Jun 2025 11:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 00/12] kexec: add kexec support to Mini-OS
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
References: <20250321092451.17309-1-jgross@suse.com>
 <25fce343-d18c-46b5-ac68-5ba4c1335df9@suse.com>
Content-Language: en-US
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
In-Reply-To: <25fce343-d18c-46b5-ac68-5ba4c1335df9@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------z8WyUxu4jfBZtkknjzHUbVlf"
X-Spam-Flag: NO
X-Spam-Score: -6.20
X-Spamd-Result: default: False [-6.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------z8WyUxu4jfBZtkknjzHUbVlf
Content-Type: multipart/mixed; boundary="------------QS4ufNLs9K48IgXsi2pjyv9v";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
Message-ID: <759aabab-a5d6-4fdf-b19a-65ad5363340d@suse.com>
Subject: Re: [MINI-OS PATCH 00/12] kexec: add kexec support to Mini-OS
References: <20250321092451.17309-1-jgross@suse.com>
 <25fce343-d18c-46b5-ac68-5ba4c1335df9@suse.com>
In-Reply-To: <25fce343-d18c-46b5-ac68-5ba4c1335df9@suse.com>

--------------QS4ufNLs9K48IgXsi2pjyv9v
Content-Type: multipart/mixed; boundary="------------8pEQatbnGK9eKvU6H820dX8Y"

--------------8pEQatbnGK9eKvU6H820dX8Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDUuMjUgMTQ6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IFBpbmc/DQoNCkkn
ZCByZWFsbHkgYXBwcmVjaWF0ZSBzb21lIGZlZWRiYWNrLg0KDQoNCkp1ZXJnZW4NCg0KPiAN
Cj4gT24gMjEuMDMuMjUgMTA6MjQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBBZGQgYmFz
aWMga2V4ZWMgc3VwcG9ydCB0byBNaW5pLU9TIGZvciBydW5uaW5nIGluIHg4NiBQVkggbW9k
ZS4NCj4+DQo+PiBXaXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQgaXQgaXMgcG9zc2libGUgdG8g
YWN0aXZhdGUgYW5vdGhlciBrZXJuZWwNCj4+IGZyb20gd2l0aGluIE1pbmktT1MuDQo+Pg0K
Pj4gUmlnaHQgbm93IG5vIFhlbiByZWxhdGVkIHRlYXJkb3duIGlzIGRvbmUgKHNvIG5vIHJl
c2V0IG9mIGdyYW50IHRhYmxlLA0KPj4gZXZlbnQgY2hhbm5lbHMsIFBWIGRldmljZXMpLiBU
aGVzZSBzaG91bGQgYmUgYWRkZWQgdmlhIGtleGVjIGNhbGxiYWNrcw0KPj4gd2hpY2ggYXJl
IGFkZGVkIGFzIGEgZnJhbWV3b3JrLg0KPj4NCj4+IFRoaXMgaXMgYSBtYWpvciBidWlsZGlu
ZyBibG9jayBmb3Igc3VwcG9ydCBvZiBYZW5zdG9yZS1zdHViZG9tIGxpdmUNCj4+IHVwZGF0
ZSAoaW4gZmFjdCBJJ3ZlIHRlc3RlZCB0aGUga2V4ZWMgcGF0aCB0byB3b3JrIHVzaW5nIHRo
ZSBQVkgNCj4+IHZhcmlhbnQgb2YgWGVuc3RvcmUtc3R1YmRvbSkuDQo+Pg0KPj4gSnVlcmdl
biBHcm9zcyAoMTIpOg0KPj4gwqDCoCBhZGQga2V4ZWMgZnJhbWV3b3JrDQo+PiDCoMKgIE1p
bmktT1M6IGFkZCBmaW5hbCBrZXhlYyBzdGFnZQ0KPj4gwqDCoCBtaW5pLW9zOiBhZGQgZWxm
LmgNCj4+IMKgwqAgbWluaS1vczogYW5hbHl6ZSBuZXcga2VybmVsIGZvciBrZXhlYw0KPj4g
wqDCoCBtaW5pLW9zOiBrZXhlYzogZmluYWxpemUgcGFyYW1ldGVyIGxvY2F0aW9uIGFuZCBz
aXplDQo+PiDCoMKgIG1pbmktb3M6IHJlc2VydmUgbWVtb3J5IGJlbG93IGJvdW5kYXJ5DQo+
PiDCoMKgIG1pbmktb3M6IGtleGVjOiBidWlsZCBwYXJhbWV0ZXJzIGZvciBuZXcga2VybmVs
DQo+PiDCoMKgIG1pbmktb3M6IGtleGVjOiBtb3ZlIHVzZWQgcGFnZXMgYXdheSBmb3IgbmV3
IGtlcm5lbA0KPj4gwqDCoCBNaW5pLU9TOiBtbTogY2hhbmdlIHNldF9yZWFkb25seSgpIHRv
IGNoYW5nZV9yZWFkb25seSgpDQo+PiDCoMKgIE1pbmktT1M6IGtleGVjOiBzd2l0Y2ggcmVh
ZC1vbmx5IGFyZWEgdG8gYmUgd3JpdGFibGUgYWdhaW4NCj4+IMKgwqAgbWluaS1vczoga2V4
ZWM6IGFkZCBrZXhlYyBjYWxsYmFjayBmdW5jdGlvbmFsaXR5DQo+PiDCoMKgIG1pbmktb3M6
IGtleGVjOiBkbyB0aGUgZmluYWwga2V4ZWMgc3RlcA0KPj4NCj4+IMKgIENvbmZpZy5ta8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+PiDCoCBNYWtl
ZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsNCj4+
IMKgIGFyY2gveDg2L2tleGVjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDI3MyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPj4gwqAgYXJjaC94ODYvbWluaW9zLXg4Ni5sZHMu
U8KgIHzCoCAxNiArKw0KPj4gwqAgYXJjaC94ODYvbW0uY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMjM4ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+PiDCoCBhcmNoL3g4
Ni90ZXN0YnVpbGQvYWxsLW5vwqAgfMKgwqAgMSArDQo+PiDCoCBhcmNoL3g4Ni90ZXN0YnVp
bGQvYWxsLXllcyB8wqDCoCAyICsNCj4+IMKgIGFyY2gveDg2L3Rlc3RidWlsZC9rZXhlY8Kg
wqAgfMKgwqAgNCArDQo+PiDCoCBhcmNoL3g4Ni94ODZfaHZtLlPCoMKgwqDCoMKgwqDCoMKg
IHzCoCA0NiArKysrKw0KPj4gwqAgaW5jbHVkZS9lbGYuaMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMzQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+
IMKgIGluY2x1ZGUva2V4ZWMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDYzICsrKysr
KysNCj4+IMKgIGluY2x1ZGUvbW0uaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqAgOCArDQo+PiDCoCBpbmNsdWRlL3g4Ni9vcy5owqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqAgNSArDQo+PiDCoCBrZXhlYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAyNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiDCoCBtbS5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDg5ICsrKysr
KysrKy0NCj4+IMKgIDE1IGZpbGVzIGNoYW5nZWQsIDEyODkgaW5zZXJ0aW9ucygrKSwgNTEg
ZGVsZXRpb25zKC0pDQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC94ODYva2V4ZWMu
Yw0KPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gveDg2L3Rlc3RidWlsZC9rZXhlYw0K
Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZWxmLmgNCj4+IMKgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2tleGVjLmgNCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBr
ZXhlYy5jDQo+Pg0KPiANCg0K
--------------8pEQatbnGK9eKvU6H820dX8Y
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------8pEQatbnGK9eKvU6H820dX8Y--

--------------QS4ufNLs9K48IgXsi2pjyv9v--

--------------z8WyUxu4jfBZtkknjzHUbVlf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhL8IsFAwAAAAAACgkQsN6d1ii/Ey/+
+Qf/WysFGF1mnfatXjh2KnuUwTlX8nFhta/vonJgbVqjAQElKKtaPMixXgDubGz6VOV2MSMj8zzS
GDeWjdBJEaHL2G2g/WUvM4JSA9PXcaXApCwifjNw43+zZaPywIASiDwtgGk4JOsdWmwz8X2a7353
+icefOFjARu8tYkVJgWnr138c05JlAS+0fY/oOq9QSzlxa1IG0bJiYo9Biep7BiJAo1udCGr0QPw
/MHDpIws9BGSpou7URp6jSI2GDsPmxl6eybFuLKxec0FvhNCa3iO5pT252qLxIHDRkantE6NjarB
Wa1S40kujC47KePW8q3DzNX9rTPY/5M7wSy4cFpbLg==
=wXtE
-----END PGP SIGNATURE-----

--------------z8WyUxu4jfBZtkknjzHUbVlf--

