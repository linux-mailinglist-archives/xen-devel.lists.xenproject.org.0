Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5017C7FBD02
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 15:43:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643258.1003253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7zIJ-0001Jn-SL; Tue, 28 Nov 2023 14:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643258.1003253; Tue, 28 Nov 2023 14:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7zIJ-0001I7-PO; Tue, 28 Nov 2023 14:42:35 +0000
Received: by outflank-mailman (input) for mailman id 643258;
 Tue, 28 Nov 2023 14:42:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7TP6=HJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7zII-0001Hz-JX
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 14:42:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d216c39-8dfc-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 15:42:33 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B53C219A0;
 Tue, 28 Nov 2023 14:42:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE2C513763;
 Tue, 28 Nov 2023 14:42:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yej/MFf8ZWWGQgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 28 Nov 2023 14:42:31 +0000
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
X-Inumbo-ID: 5d216c39-8dfc-11ee-98e3-6d05b1d4d9a1
Message-ID: <6ee9c6e2-7ebf-42c6-a923-57f9da093160@suse.com>
Date: Tue, 28 Nov 2023 15:42:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>,
 Julia Zhang <Julia.Zhang@amd.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-4-Jiqian.Chen@amd.com> <ZWX4R9UEE6oXiqaz@macbook>
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
In-Reply-To: <ZWX4R9UEE6oXiqaz@macbook>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c9lh7FAeFFG1TW4tV3CZpuRA"
X-Spamd-Bar: +++++++++++++++++
X-Spam-Score: 17.20
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine)
X-Rspamd-Queue-Id: 3B53C219A0
X-Spam-Flag: NO
X-Spam-Level: *****************
X-Spamd-Result: default: False [17.20 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 ARC_NA(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 NEURAL_SPAM_LONG(2.40)[0.685];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c9lh7FAeFFG1TW4tV3CZpuRA
Content-Type: multipart/mixed; boundary="------------oqQfMm0yUt44SI3k0RCz1uAq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>,
 Julia Zhang <Julia.Zhang@amd.com>
Message-ID: <6ee9c6e2-7ebf-42c6-a923-57f9da093160@suse.com>
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-4-Jiqian.Chen@amd.com> <ZWX4R9UEE6oXiqaz@macbook>
In-Reply-To: <ZWX4R9UEE6oXiqaz@macbook>

--------------oqQfMm0yUt44SI3k0RCz1uAq
Content-Type: multipart/mixed; boundary="------------GE9RhkctmMjbfm1pjd41clpL"

--------------GE9RhkctmMjbfm1pjd41clpL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMTEuMjMgMTU6MjUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIEZyaSwg
Tm92IDI0LCAyMDIzIGF0IDA2OjQxOjM2UE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0K
Pj4gSW4gUFZIIGRvbTAsIGl0IHVzZXMgdGhlIGxpbnV4IGxvY2FsIGludGVycnVwdCBtZWNo
YW5pc20sDQo+PiB3aGVuIGl0IGFsbG9jcyBpcnEgZm9yIGEgZ3NpLCBpdCBpcyBkeW5hbWlj
LCBhbmQgZm9sbG93DQo+PiB0aGUgcHJpbmNpcGxlIG9mIGFwcGx5aW5nIGZpcnN0LCBkaXN0
cmlidXRpbmcgZmlyc3QuIEFuZA0KPj4gaWYgeW91IGRlYnVnIHRoZSBrZXJuZWwgY29kZXMs
IHlvdSB3aWxsIGZpbmQgdGhlIGlycQ0KPj4gbnVtYmVyIGlzIGFsbG9jZWQgZnJvbSBzbWFs
bCB0byBsYXJnZSwgYnV0IHRoZSBhcHBseWluZw0KPj4gZ3NpIG51bWJlciBpcyBub3QsIG1h
eSBnc2kgMzggY29tZXMgYmVmb3JlIGdzaSAyOCwgdGhhdA0KPj4gY2F1c2VzIHRoZSBpcnEg
bnVtYmVyIGlzIG5vdCBlcXVhbCB3aXRoIHRoZSBnc2kgbnVtYmVyLg0KPj4gQW5kIHdoZW4g
d2UgcGFzc3Rocm91Z2ggYSBkZXZpY2UsIFFFTVUgd2lsbCB1c2UgaXRzIGdzaQ0KPj4gbnVt
YmVyIHRvIGRvIG1hcHBpbmcgYWN0aW9ucywgc2VlIHhlbl9wdF9yZWFsaXplLT4NCj4+IHhj
X3BoeXNkZXZfbWFwX3BpcnEsIGJ1dCB0aGUgZ3NpIG51bWJlciBpcyBnb3QgZnJvbSBmaWxl
DQo+PiAvc3lzL2J1cy9wY2kvZGV2aWNlcy94eHh4Onh4Onh4LngvaXJxIGluIGN1cnJlbnQg
Y29kZSwNCj4+IHNvIGl0IHdpbGwgZmFpbCB3aGVuIG1hcHBpbmcuDQo+PiBBbmQgaW4gY3Vy
cmVudCBjb2RlcywgdGhlcmUgaXMgbm8gbWV0aG9kIHRvIHRyYW5zbGF0ZQ0KPj4gaXJxIHRv
IGdzaSBmb3IgdXNlcnNwYWNlLg0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBiZSBjbGVhbmVy
IHRvIGp1c3QgaW50cm9kdWNlIGEgbmV3IHN5c2ZzIG5vZGUgdGhhdA0KPiBjb250YWlucyB0
aGUgZ3NpIGlmIGEgZGV2aWNlIGlzIHVzaW5nIG9uZSAobXVjaCBsaWtlIHRoZSBpcnEgc3lz
ZnMNCj4gbm9kZSk/DQo+IA0KPiBTdWNoIGlvY3RsIHRvIHRyYW5zbGF0ZSBmcm9tIElSUSB0
byBHU0kgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBYZW4sIHNvDQo+IHBsYWNpbmcgaXQgaW4g
cHJpdmNtZCBkb2VzIHNlZW0gcXVpdGUgc3RyYW5nZSB0byBtZS4gIEkgdW5kZXJzdGFuZA0K
PiB0aGF0IGZvciBwYXNzdGhyb3VnaCB3ZSBuZWVkIHRoZSBHU0ksIGJ1dCBzdWNoIHRyYW5z
bGF0aW9uIGxheWVyIGZyb20NCj4gSVJRIHRvIEdTSSBpcyBhbGwgTGludXggaW50ZXJuYWws
IGFuZCBpdCB3b3VsZCBiZSBtdWNoIHNpbXBsZXIgdG8ganVzdA0KPiBleHBvc2UgdGhlIEdT
SSBpbiBzeXNmcyBJTU8uDQoNCllvdSBhcmUgYXdhcmUgdGhhdCB3ZSBoYXZlIGEgWGVuIHNw
ZWNpZmljIHZhcmlhbnQgb2YgYWNwaV9yZWdpc3Rlcl9nc2koKT8NCg0KSXQgaXMgdGhlIFhl
biBldmVudCBjaGFubmVsIGRyaXZlciBiZWluZyByZXNwb25zaWJsZSBmb3IgdGhlIEdTSTwt
PklSUQ0KbWFwcGluZy4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------GE9RhkctmMjbfm1pjd41clpL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------GE9RhkctmMjbfm1pjd41clpL--

--------------oqQfMm0yUt44SI3k0RCz1uAq--

--------------c9lh7FAeFFG1TW4tV3CZpuRA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVl/FcFAwAAAAAACgkQsN6d1ii/Ey9O
JAf9HyaJQCiJsNVDeoqgzc+ndZwacqCF6EW4OWMmj66iKJKg8cXwmy2F6CA3XW16XklD2U1Zw0dU
JlTOS0vFWzcVhRaV6i+gGVMVngtx9sERX6j0THc6yLPd+9YHpnnXc2lRSguxEbWmhwGwV+G1Z//O
MNV8wyS0T8lqrTOVbocTDw7jCzkL2gQO5IpoPFJUOaB0JVd89vgdnc3cUO8gt//yKUxVlLbIN2kw
VP0f6ULiA5KkH+K/cL9xGpIW0V6t5m87wsFOE2Bb/9phAArDMxf1tSf2d7/AjuX+4whXv5YVKOxf
6J/3RmGUrZ0op0gX4vlTVDeC/JHMrFX6sDhQcmGYUg==
=+J8g
-----END PGP SIGNATURE-----

--------------c9lh7FAeFFG1TW4tV3CZpuRA--

