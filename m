Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298B3806B36
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 11:02:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649062.1013356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAojT-00087C-AI; Wed, 06 Dec 2023 10:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649062.1013356; Wed, 06 Dec 2023 10:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAojT-000856-7W; Wed, 06 Dec 2023 10:02:19 +0000
Received: by outflank-mailman (input) for mailman id 649062;
 Wed, 06 Dec 2023 10:02:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lx6I=HR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAojR-00084y-Fb
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 10:02:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88c12505-941e-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 11:02:16 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D8C501FD03;
 Wed,  6 Dec 2023 10:02:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C9A613408;
 Wed,  6 Dec 2023 10:02:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uGqkJKVGcGXhTwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 06 Dec 2023 10:02:13 +0000
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
X-Inumbo-ID: 88c12505-941e-11ee-98e5-6d05b1d4d9a1
Message-ID: <8224404e-ed23-438b-8a61-23d76a980cc5@suse.com>
Date: Wed, 6 Dec 2023 11:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>, xen-devel@lists.xenproject.org
References: <20231206071039.24435-1-jgross@suse.com>
 <20231206071039.24435-3-jgross@suse.com>
 <96711b23-9dd9-4029-aaea-a3e755c4bd3e@suse.com>
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
In-Reply-To: <96711b23-9dd9-4029-aaea-a3e755c4bd3e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UKaMsVOQc0caseLDa7i9fmwJ"
X-Spam-Level: ****************
X-Spamd-Bar: ++++++++++++++++
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [16.93 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_SPAM_SHORT(1.93)[0.644];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,arndb.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 16.93
X-Rspamd-Queue-Id: D8C501FD03
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UKaMsVOQc0caseLDa7i9fmwJ
Content-Type: multipart/mixed; boundary="------------XepRGDaaBBcRJYEFZgLeE8IJ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>, xen-devel@lists.xenproject.org
Message-ID: <8224404e-ed23-438b-8a61-23d76a980cc5@suse.com>
Subject: Re: [PATCH v2 2/3] xen: make include/xen/unaligned.h usable on all
 architectures
References: <20231206071039.24435-1-jgross@suse.com>
 <20231206071039.24435-3-jgross@suse.com>
 <96711b23-9dd9-4029-aaea-a3e755c4bd3e@suse.com>
In-Reply-To: <96711b23-9dd9-4029-aaea-a3e755c4bd3e@suse.com>

--------------XepRGDaaBBcRJYEFZgLeE8IJ
Content-Type: multipart/mixed; boundary="------------devWEQBDbo9v3W8Y93Z9jEV5"

--------------devWEQBDbo9v3W8Y93Z9jEV5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTIuMjMgMDk6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4xMi4yMDIz
IDA4OjEwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSW5zdGVhZCBvZiBkZWZpbmluZyBn
ZXRfdW5hbGlnbmVkKCkgYW5kIHB1dF91bmFsaWduZWQoKSBpbiBhIHdheSB0aGF0DQo+PiBp
cyBvbmx5IHN1cHBvcnRpbmcgYXJjaGl0ZWN0dXJlcyBhbGxvd2luZyB1bmFsaWduZWQgYWNj
ZXNzZXMsIHVzZSB0aGUNCj4+IHNhbWUgYXBwcm9hY2ggYXMgdGhlIExpbnV4IGtlcm5lbCBh
bmQgbGV0IHRoZSBjb21waWxlciBkbyB0aGUNCj4+IGRlY2lzaW9uIGhvdyB0byBnZW5lcmF0
ZSB0aGUgY29kZSBmb3IgcHJvYmFibHkgdW5hbGlnbmVkIGRhdGEgYWNjZXNzZXMuDQo+Pg0K
Pj4gVXBkYXRlIGluY2x1ZGUveGVuL3VuYWxpZ25lZC5oIGZyb20gaW5jbHVkZS9hc20tZ2Vu
ZXJpYy91bmFsaWduZWQuaCBvZg0KPj4gdGhlIExpbnV4IGtlcm5lbC4NCj4+DQo+PiBUaGUg
Z2VuZXJhdGVkIGNvZGUgaGFzIGJlZW4gY2hlY2tlZCB0byBiZSB0aGUgc2FtZSBvbiB4ODYu
DQo+Pg0KPj4gTW9kaWZ5IHRoZSBMaW51eCB2YXJpYW50IHRvIG5vdCB1c2UgdW5kZXJzY29y
ZSBwcmVmaXhlZCBpZGVudGlmaWVycywNCj4+IGF2b2lkIHVubmVlZGVkIHBhcmVudGhlc2Vz
IGFuZCBkcm9wIHRoZSAyNC1iaXQgYWNjZXNzb3JzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+PiBPcmlnaW46IGdpdDovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQg
ODAzZjRlMWVhYjdhDQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+DQo+IA0KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KPiANCj4gTmV2ZXJ0aGVsZXNzIC4uLg0KPiANCj4+IEBAIC0xNSw2NyArNyw4MiBA
QA0KPj4gICAjaW5jbHVkZSA8YXNtL2J5dGVvcmRlci5oPg0KPj4gICAjZW5kaWYNCj4+ICAg
DQo+PiAtI2RlZmluZSBnZXRfdW5hbGlnbmVkKHApICgqKHApKQ0KPj4gLSNkZWZpbmUgcHV0
X3VuYWxpZ25lZCh2YWwsIHApICgqKHApID0gKHZhbCkpDQo+PiArLyoNCj4+ICsgKiBUaGlz
IGlzIHRoZSBtb3N0IGdlbmVyaWMgaW1wbGVtZW50YXRpb24gb2YgdW5hbGlnbmVkIGFjY2Vz
c2VzDQo+PiArICogYW5kIHNob3VsZCB3b3JrIGFsbW9zdCBhbnl3aGVyZS4NCj4+ICsgKi8N
Cj4+ICsNCj4+ICsjZGVmaW5lIGdldF91bmFsaWduZWRfdF8odHlwZSwgcHRyKSAoewkJCQkJ
XA0KPiANCj4gLi4uLCBkbyB3ZSBuZWVkIHRoZSB0cmFpbGluZyB1bmRlcnNjb3JlcyBoZXJl
IGluIGFkZGl0aW9uIHRvIHRoZSBhbHJlYWR5DQo+IHN1ZmZpY2llbnRseSBjbGVhciBfdCBz
dWZmaXhlcz8gKExlYXZpbmcgYXNpZGUgdGhhdCAuLi5fdCBnZW5lcmFsbHkgaXMgdG8NCj4g
ZGVub3RlIHR5cGVzLCBub3QgbWFjcm9zIG9yIGZ1bmN0aW9ucy4pDQoNCk1heWJlIHdlIHNo
b3VsZCBqdXN0IG5hbWUgaXQgZ2V0X3VuYWxpZ25lZF90eXBlKCk/DQoNCg0KSnVlcmdlbg0K

--------------devWEQBDbo9v3W8Y93Z9jEV5
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------devWEQBDbo9v3W8Y93Z9jEV5--

--------------XepRGDaaBBcRJYEFZgLeE8IJ--

--------------UKaMsVOQc0caseLDa7i9fmwJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVwRqUFAwAAAAAACgkQsN6d1ii/Ey8Z
Twf/RNt4DJ6z4vElWG0D+FutE4WWtmj1kO3+Zas4JcgThNi/Cas5FUhkovgYT4MXq78YfZPLy1Bo
iv4mFZrF90xcBIjY6bq4RN2/IxWkqCI9wXGfcY9vnYLkdBHtsqfeaHkKYfCpUoP4HmvdNImVgrzF
XJokYCkw26FLnCEdLxEvUkIpWmYAR3pvW1d3Y5xmhMnjzBrtQ0/bEIczP/OiZ6si2L896klBMJkD
jJebPzeI83l3XAt2jy7+weuXY8R1V/uk3RVpU4LrLIxdWI4c5z57VRJDgy2TdADARIJj+gnE3bSd
8yQC9WxcIkoYysDq+t1DeKo201K4HqirtswkerF+wg==
=Hz8+
-----END PGP SIGNATURE-----

--------------UKaMsVOQc0caseLDa7i9fmwJ--

