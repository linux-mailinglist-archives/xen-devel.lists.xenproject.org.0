Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA04C7FBB2F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 14:17:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643152.1003082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xxT-0006wo-IH; Tue, 28 Nov 2023 13:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643152.1003082; Tue, 28 Nov 2023 13:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xxT-0006v4-FZ; Tue, 28 Nov 2023 13:16:59 +0000
Received: by outflank-mailman (input) for mailman id 643152;
 Tue, 28 Nov 2023 13:16:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7TP6=HJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7xxR-0006uv-MP
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 13:16:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6763a479-8df0-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 14:16:56 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7224F219A1;
 Tue, 28 Nov 2023 13:16:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 206BC13763;
 Tue, 28 Nov 2023 13:16:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pGFzBkfoZWVwJgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 28 Nov 2023 13:16:55 +0000
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
X-Inumbo-ID: 6763a479-8df0-11ee-98e3-6d05b1d4d9a1
Message-ID: <9ce278bb-475e-4244-8332-fef1c55f0f73@suse.com>
Date: Tue, 28 Nov 2023 14:16:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] xen/spinlock: introduce new type for recursive
 spinlocks
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>
References: <20231120113842.5897-1-jgross@suse.com>
 <20231120113842.5897-5-jgross@suse.com>
 <e31f93a7-5270-4c09-8ada-c9bc24172c70@cloud.com>
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
In-Reply-To: <e31f93a7-5270-4c09-8ada-c9bc24172c70@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------l0JJANiGUqpZscuNanGmICbm"
X-Spamd-Bar: ++++++++++++++++++
X-Spam-Score: 18.43
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine)
X-Rspamd-Queue-Id: 7224F219A1
X-Spam-Flag: NO
X-Spam-Level: ******************
X-Spamd-Result: default: False [18.43 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 BAYES_HAM(-3.00)[100.00%];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_SPAM_SHORT(2.87)[0.958];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 NEURAL_SPAM_LONG(0.55)[0.158];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------l0JJANiGUqpZscuNanGmICbm
Content-Type: multipart/mixed; boundary="------------DAbHinjON15YijQLRQ1ojxpZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>
Message-ID: <9ce278bb-475e-4244-8332-fef1c55f0f73@suse.com>
Subject: Re: [PATCH v3 04/13] xen/spinlock: introduce new type for recursive
 spinlocks
References: <20231120113842.5897-1-jgross@suse.com>
 <20231120113842.5897-5-jgross@suse.com>
 <e31f93a7-5270-4c09-8ada-c9bc24172c70@cloud.com>
In-Reply-To: <e31f93a7-5270-4c09-8ada-c9bc24172c70@cloud.com>

--------------DAbHinjON15YijQLRQ1ojxpZ
Content-Type: multipart/mixed; boundary="------------n0jqP6vbLAXR0LVZZ7HARrNK"

--------------n0jqP6vbLAXR0LVZZ7HARrNK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjMgMTk6NTksIEFsZWphbmRybyBWYWxsZWpvIHdyb3RlOg0KPiBPbiAyMC8x
MS8yMDIzIDExOjM4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSW50cm9kdWNlIGEgbmV3
IHR5cGUgInJzcGlubG9ja190IiB0byBiZSB1c2VkIGZvciByZWN1cnNpdmUgc3BpbmxvY2tz
Lg0KPj4NCj4+IEZvciBub3cgaXQgaXMgb25seSBhbiBhbGlhcyBvZiBzcGlubG9ja190LCBz
byBib3RoIHR5cGVzIGNhbiBzdGlsbCBiZQ0KPj4gdXNlZCBmb3IgcmVjdXJzaXZlIHNwaW5s
b2Nrcy4gVGhpcyB3aWxsIGJlIGNoYW5nZWQgbGF0ZXIsIHRob3VnaC4NCj4+DQo+PiBTd2l0
Y2ggYWxsIHJlY3Vyc2l2ZSBzcGlubG9ja3MgdG8gdGhlIG5ldyB0eXBlLg0KPj4NCj4+IERl
ZmluZSB0aGUgaW5pdGlhbGl6ZXIgaGVscGVycyBhbmQgdXNlIHRoZW0gd2hlcmUgYXBwcm9w
cmlhdGUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPg0KPj4gLS0tDQo+PiBWMjoNCj4+IC0gY2FydmVkIG91dCBmcm9tIFYxIHBhdGNo
DQo+PiAtLS0NCj4+IMKgIHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tbS5oIHzCoCAyICst
DQo+PiDCoCB4ZW4vYXJjaC94ODYvbW0vbW0tbG9ja3MuaMKgwqDCoCB8wqAgMiArLQ0KPj4g
wqAgeGVuL2NvbW1vbi9kb21haW4uY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0N
Cj4+IMKgIHhlbi9jb21tb24vaW9yZXEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIg
Ky0NCj4+IMKgIHhlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jwqDCoMKgIHzCoCA0ICsrLS0N
Cj4+IMKgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHzCoCAyICstDQo+PiDCoCB4
ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaMKgwqDCoMKgwqDCoCB8wqAgNiArKystLS0NCj4+IMKg
IHhlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5owqDCoMKgIHwgMTkgKysrKysrKysrKysrKysr
LS0tLQ0KPj4gwqAgOCBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxNSBkZWxl
dGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNt
L21tLmggYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vbW0uaA0KPj4gaW5kZXggMDVkZmUz
NTUwMi4uOGE2ZTBjMjgzZiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9tbS5oDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vbW0uaA0KPj4g
QEAgLTU5Niw3ICs1OTYsNyBAQCB1bnNpZ25lZCBsb25nIGRvbWFpbl9nZXRfbWF4aW11bV9n
cGZuKHN0cnVjdCBkb21haW4gKmQpOw0KPj4gwqAgLyogRGVmaW5pdGlvbiBvZiBhbiBtbSBs
b2NrOiBzcGlubG9jayB3aXRoIGV4dHJhIGZpZWxkcyBmb3IgZGVidWdnaW5nICovDQo+PiDC
oCB0eXBlZGVmIHN0cnVjdCBtbV9sb2NrIHsNCj4+IC3CoMKgwqAgc3BpbmxvY2tfdMKgwqDC
oMKgwqDCoMKgwqAgbG9jazsNCj4+ICvCoMKgwqAgcnNwaW5sb2NrX3TCoMKgwqDCoMKgwqDC
oCBsb2NrOw0KPiANCj4gQ29uc2lkZXJpbmcgaXQncyByc3BpbmxvY2tfdCByYXRoZXIgdGhh
biBzcGlubG9ja19yZWN1cnNpdmUsIGRvIHdlIHdhbnQNCj4gdG8gY2hhbmdlIGFsc28gbW1f
bG9ja19yZWN1cnNpdmUoKSBhbmQgcGFnaW5nX2xvY2tfcmVjdXJzaXZlKCkgaW50bw0KPiBt
bV9ybG9jaygpIGFuZCBwYWdpbmdfcmxvY2soKSA/DQoNCkkgZG9uJ3QgdGhpbmsgdGhpcyBz
aG91bGQgYmUgcGFydCBvZiB0aGlzIHNlcmllcy4NCg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL3hlbi9zcGlubG9jay5oIGIveGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmgNCj4+
IGluZGV4IGJiZTE0NzI1NzEuLjE5NTYxZDVlNjEgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vc3BpbmxvY2suaA0KPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NwaW5sb2Nr
LmgNCj4gID4gW3NuaXBdDQo+PiBAQCAtMTgyLDggKzE5MSwxMCBAQCB0eXBlZGVmIHN0cnVj
dCBzcGlubG9jayB7DQo+PiDCoCAjZW5kaWYNCj4+IMKgIH0gc3BpbmxvY2tfdDsNCj4+ICt0
eXBlZGVmIHNwaW5sb2NrX3QgcnNwaW5sb2NrX3Q7DQo+PiDCoCAjZGVmaW5lIHNwaW5fbG9j
a19pbml0KGwpICgqKGwpID0gKHNwaW5sb2NrX3QpU1BJTl9MT0NLX1VOTE9DS0VEKQ0KPj4g
KyNkZWZpbmUgcnNwaW5fbG9ja19pbml0KGwpICgqKGwpID0gKHJzcGlubG9ja190KVNQSU5f
TE9DS19VTkxPQ0tFRCkNCj4gDQo+IG5pdDogQm90aCB2YXJpYW50cyBvZiBbcl1zcGluX2xv
Y2tfaW5pdChsKSBjb3VsZCBiZSBpbmxpbmUgZnVuY3Rpb25zDQo+IHJhdGhlciB0aGFuIG1h
Y3Jvcy4NCg0KSSB3YXMgZm9sbG93aW5nIHRoZSBzcGluX2xvY2tfaW5pdCgpIGV4YW1wbGUs
IGFuZCBJIGd1ZXNzIHRoYXQgaXMgZm9sbG93aW5nDQp0aGUgTGludXgga2VybmVsIGV4YW1w
bGUuDQoNCkkgZG9uJ3QgbWluZCBlaXRoZXIgd2F5LCBidXQgbWF5YmUgb3RoZXIgbWFpbnRh
aW5lcnMgaGF2ZSBhIHByZWZlcmVuY2U/DQoNCg0KSnVlcmdlbg0K
--------------n0jqP6vbLAXR0LVZZ7HARrNK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------n0jqP6vbLAXR0LVZZ7HARrNK--

--------------DAbHinjON15YijQLRQ1ojxpZ--

--------------l0JJANiGUqpZscuNanGmICbm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVl6EYFAwAAAAAACgkQsN6d1ii/Ey81
dggAlJ5dgIorsdgTvd/RO97g2je9gKcchT16sY7lCPOF9Q1zTi4tX2WBcBQE7x5uy4Iw5twQkKms
m/DG5+WQ/Iq0Xs+yGiIZMyRDJlt2DjWWuekYeJMZXn7DYOyhR8WneML36GzPEPqJL+A9KxOwC7b1
6Wff/WNPRcYmzBrB+0EL4VOlF/Jf+az4oo9RCOP+IHm+pHYwWn4P6TAgwrNCM9BbuuvHkJz53M4v
9FufiRVd7WjVU1R2DoUntppTYVLiMneT9r0hZbeC1nfRckBIQIzGUUvFJqioOdP9d47mBh6Nut0I
N/tNRBuWt4EmP46z6UAsrbq7zPYsyD1tvDIPwNMGHg==
=lUKk
-----END PGP SIGNATURE-----

--------------l0JJANiGUqpZscuNanGmICbm--

