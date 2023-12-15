Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FA58148C5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 14:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655112.1022792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE7zS-0004RH-Ef; Fri, 15 Dec 2023 13:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655112.1022792; Fri, 15 Dec 2023 13:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE7zS-0004OV-Bs; Fri, 15 Dec 2023 13:12:30 +0000
Received: by outflank-mailman (input) for mailman id 655112;
 Fri, 15 Dec 2023 13:12:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=25p9=H2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rE7zQ-0004OP-2U
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 13:12:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9545a5ed-9b4b-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 14:12:22 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 87047220CA;
 Fri, 15 Dec 2023 13:12:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62C22137D4;
 Fri, 15 Dec 2023 13:12:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rwlWFrZQfGWVEAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 15 Dec 2023 13:12:22 +0000
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
X-Inumbo-ID: 9545a5ed-9b4b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702645942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8dZJ8+Q6HOrbbBJMuaEeEQTg47YvTBVHao9Abb7CCgU=;
	b=DYpTGVlEX+WjodErI2/b06hyXilI9WGUyoRxCjwSoyplLRcMWhdh0Te1xA2PlV1XtvLxb3
	AU1aESa+CBHUzERRL3BKBDRHZFDi1SXngvJ97AwAca/JNSMXfHCXmk1f65Lmpq9+J7zTbq
	2Q38B1PA7WUH5B0o+s7NIi5ntBrxi6E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702645942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8dZJ8+Q6HOrbbBJMuaEeEQTg47YvTBVHao9Abb7CCgU=;
	b=DYpTGVlEX+WjodErI2/b06hyXilI9WGUyoRxCjwSoyplLRcMWhdh0Te1xA2PlV1XtvLxb3
	AU1aESa+CBHUzERRL3BKBDRHZFDi1SXngvJ97AwAca/JNSMXfHCXmk1f65Lmpq9+J7zTbq
	2Q38B1PA7WUH5B0o+s7NIi5ntBrxi6E=
Message-ID: <f82d5a55-9524-4678-aac0-88fffbdf7e40@suse.com>
Date: Fri, 15 Dec 2023 14:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix C compatibility issue in mini-os
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Florian Weimer <fweimer@redhat.com>
Cc: xen-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <87edfn8yn8.fsf@oldenburg.str.redhat.com>
 <cc41e7e9-13cf-48dd-a0a0-3e0d9d9b4051@suse.com>
 <875y0z8xif.fsf@oldenburg.str.redhat.com>
 <6abd038c-fe93-4a7a-bc60-3d5c483e199e@suse.com>
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
In-Reply-To: <6abd038c-fe93-4a7a-bc60-3d5c483e199e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3VDvbSgVffxRdWsrUShjHvWz"
X-Spam-Level: 
X-Spam-Level: 
X-Spamd-Result: default: False [-3.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: -3.99
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3VDvbSgVffxRdWsrUShjHvWz
Content-Type: multipart/mixed; boundary="------------6lQZrnNj0PVYQuamDnjGtJaH";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Florian Weimer <fweimer@redhat.com>
Cc: xen-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <f82d5a55-9524-4678-aac0-88fffbdf7e40@suse.com>
Subject: Re: [PATCH] Fix C compatibility issue in mini-os
References: <87edfn8yn8.fsf@oldenburg.str.redhat.com>
 <cc41e7e9-13cf-48dd-a0a0-3e0d9d9b4051@suse.com>
 <875y0z8xif.fsf@oldenburg.str.redhat.com>
 <6abd038c-fe93-4a7a-bc60-3d5c483e199e@suse.com>
In-Reply-To: <6abd038c-fe93-4a7a-bc60-3d5c483e199e@suse.com>

--------------6lQZrnNj0PVYQuamDnjGtJaH
Content-Type: multipart/mixed; boundary="------------IYTZKUAnktfbxqhv4EWuuHYz"

--------------IYTZKUAnktfbxqhv4EWuuHYz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMTIuMjMgMTM6MjksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4xMi4yMDIz
IDEzOjIzLCBGbG9yaWFuIFdlaW1lciB3cm90ZToNCj4+ICogSmFuIEJldWxpY2g6DQo+Pg0K
Pj4+IE9uIDE1LjEyLjIwMjMgMTI6NTksIEZsb3JpYW4gV2VpbWVyIHdyb3RlOg0KPj4+PiBU
aGUgY2Mtb3B0aW9uIGNoZWNrIGFsd2F5cyBmYWlscyAodGhhdCwgaXQgcGlja3MgdGhlIHNl
Y29uZCBvcHRpb24NCj4+Pj4gdW5jb25kaXRpb25hbGx5KSBpZiB0aGUgY29tcGlsZXIgZG9l
cyBub3Qgc3VwcG9ydCBpbXBsaWNpdCBjb252ZXJzaW9uDQo+Pj4+IGZyb20gaW50ZWdlcnMg
dG8gcG9pbnRlcnMuICBKdXN0IGRyb3AgdGhlIGluaXRpYWxpemF0aW9uIGJlY2F1c2UgaXQN
Cj4+Pj4gc2VlbXMgdW5uZWNlc3NhcnkgaW4gdGhpcyBjb250ZXh0Lg0KPj4+DQo+Pj4gRGlk
IHlvdSBwYXkgYXR0ZW50aW9uIHRvIC4uLg0KPj4+DQo+Pj4+IC0tLSBhL0NvbmZpZy5taw0K
Pj4+PiArKysgYi9Db25maWcubWsNCj4+Pj4gQEAgLTIxLDcgKzIxLDcgQEAgZW5kZWYNCj4+
Pj4gICAjIG9mIHdoaWNoIHdvdWxkIGluZGljYXRlIGFuICJ1bnJlY29nbml6ZWQgY29tbWFu
ZC1saW5lIG9wdGlvbiIgd2FybmluZy9lcnJvci4NCj4+Pg0KPj4+IC4uLiB0aGUgY29tbWVu
dCB0aGUgdGFpbCBvZiB3aGljaCBpcyB2aXNpYmxlIGhlcmU/DQo+Pg0KPj4gSSBkaWRuJ3Qg
aW52ZXN0aWdhdGUgaG93IHRoZSBtZWNoYW5pY3Mgb2YgdGhlIHNlbGVjdGlvbiBhcmUNCj4+
IGFjY29tcGxpc2hlZC4gIEkgd2FzIHNvIGhhcHB5IHRoYXQgSSBmaW5hbGx5IGZvdW5kIHRo
ZSBzb3VyY2Ugb2YgdGhlDQo+PiBpbnQtY29udmVyc2lvbiBlcnJvciBhbmQgZ290IGEgYml0
IGNhcnJpZWQgYXdheS4NCj4+DQo+PiBMb29raW5nIGF0IHRoZSBzaGVsbCBzY3JpcHQgZnJh
Z21lbnQ6DQo+Pg0KPj4+PiAgICMgVXNhZ2U6IGNmbGFncy15ICs9ICQoY2FsbCBjYy1vcHRp
b24sJChDQyksLW1hcmNoPXdpbmNoaXAtYzYsLW1hcmNoPWk1ODYpDQo+Pj4+IC1jYy1vcHRp
b24gPSAkKHNoZWxsIGlmIHRlc3QgLXogImBlY2hvICd2b2lkKnA9MTsnIHwgXA0KPj4+PiAr
Y2Mtb3B0aW9uID0gJChzaGVsbCBpZiB0ZXN0IC16ICJgZWNobyAndm9pZCpwOycgfCBcDQo+
Pj4+ICAgICAgICAgICAgICAgICAkKDEpICQoMikgLWMgLW8gL2Rldi9udWxsIC14IGMgLSAy
PiYxIHwgZ3JlcCAtLSAkKDIpIC1gIjsgXA0KPj4+PiAgICAgICAgICAgICAgICAgdGhlbiBl
Y2hvICIkKDIpIjsgZWxzZSBlY2hvICIkKDMpIjsgZmkgOykNCj4+DQo+PiBJIGNhbiBzZWUg
dGhhdCB0aGUgZXhpdCBzdGF0dXMgb2YgdGhlIGNvbXBpbGVyIGRvZXMgbm90IG1hdHRlciwg
c28gdGhlDQo+PiBwYXRjaCB3aWxsIG5vdCBtYWtlIGEgZGlmZmVyZW5jZS4NCj4gDQo+IEFu
IG9wdGlvbiBtYXkgYmUgdG8gdXNlIFhlbidzIChuZXdlcikgdmFyaWFudA0KPiANCj4gY2Mt
b3B0aW9uID0gJChzaGVsbCBpZiAkKDEpICQoMjotV25vLSU9LVclKSAtV2Vycm9yIC1jIC1v
IC9kZXYvbnVsbCAteCBjIC9kZXYvbnVsbCA+L2Rldi9udWxsIDI+JjE7IFwNCj4gICAgICAg
ICAgICAgICAgdGhlbiBlY2hvICIkKDIpIjsgZWxzZSBlY2hvICIkKDMpIjsgZmkgOykNCj4g
DQo+IGhlcmUgYXMgd2VsbCAob21pdHRlZCBhbGwgY29tbWVudGFyeSkuIENjLWluZyBtYWlu
dGFpbmVycyBmb3IgcG9zc2libGUNCj4gaW5wdXQuDQoNClRoZXJlIGlzIG5vIHVyZ2VudCBu
ZWVkIGZvciB0aGF0LCBhcyBpbiBNaW5pLU9TIEknbSBub3QgYXdhcmUgb2YgYW55IHVzZSBj
YXNlDQp0byB0ZXN0IGZvciBhICItVy4uLiIgb3B0aW9uLCBidXQgdGhlIGFwcHJvYWNoIGlz
IHJlYWxseSBjbGVhbmVyIElNTy4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------IYTZKUAnktfbxqhv4EWuuHYz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------IYTZKUAnktfbxqhv4EWuuHYz--

--------------6lQZrnNj0PVYQuamDnjGtJaH--

--------------3VDvbSgVffxRdWsrUShjHvWz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmV8ULUFAwAAAAAACgkQsN6d1ii/Ey97
vAf/f9SudulCJH+IkwfJv3CDes54h0PBvaXodUcy6E68supzHVPeP1Dxd+h5OyyYkcmYq2ZwXfb0
xWAuSaaYeZwDMzCDq/rh9f9dktjveO0uXV4gLZ5xfuui9PpJoQ7o1sZCpYyaEZgThaIhQRSmocJI
5m7yKT6CDY2di0s/H7i0YaP75CfgQabaBe+AtmxDJrK91CBji9V5eCjXCQyXQs212L3r314at3/t
s60bHSm6+nzXzP9SQG4fEHZSkpxID4IB7u0MmqOE7VsXk6R7FrCQTb6PTG4jgs42gF1xVdDn0uLH
Y5ZnrXwp2U5784FpDmyFUm4UGwDFegl2eblv9ve1qA==
=fi4V
-----END PGP SIGNATURE-----

--------------3VDvbSgVffxRdWsrUShjHvWz--

