Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A93D5804A1D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 07:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647409.1010503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAOzJ-0005JJ-Nm; Tue, 05 Dec 2023 06:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647409.1010503; Tue, 05 Dec 2023 06:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAOzJ-0005Gv-KR; Tue, 05 Dec 2023 06:32:57 +0000
Received: by outflank-mailman (input) for mailman id 647409;
 Tue, 05 Dec 2023 06:32:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mnjk=HQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAOzH-0005Gp-Sd
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 06:32:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f2d92aa-9338-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 07:32:54 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1BF9321FF7;
 Tue,  5 Dec 2023 06:32:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7544136CF;
 Tue,  5 Dec 2023 06:32:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zJC+NhXEbmVaEAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 05 Dec 2023 06:32:53 +0000
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
X-Inumbo-ID: 1f2d92aa-9338-11ee-98e5-6d05b1d4d9a1
Message-ID: <2142bcca-7f77-4579-bf62-dd6b2442bab6@suse.com>
Date: Tue, 5 Dec 2023 07:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/29] tools/xenlogd: add 9pfs response generation
 support
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-6-jgross@suse.com>
 <CAKf6xpvHdBsWn9z5Yu9MY18Q2CzT-YKVqEa1fYnptwTxve31cQ@mail.gmail.com>
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
In-Reply-To: <CAKf6xpvHdBsWn9z5Yu9MY18Q2CzT-YKVqEa1fYnptwTxve31cQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wiwPbVt0xPaEf2uA0l9CB1TC"
X-Spamd-Bar: +++++++++++++++++++++
X-Spam-Score: 21.33
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine)
X-Rspamd-Queue-Id: 1BF9321FF7
X-Spam-Flag: NO
X-Spam-Level: *********************
X-Spamd-Result: default: False [21.33 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-0.00)[34.20%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 NEURAL_SPAM_SHORT(2.97)[0.990];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 NEURAL_SPAM_LONG(3.36)[0.960];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wiwPbVt0xPaEf2uA0l9CB1TC
Content-Type: multipart/mixed; boundary="------------QOdDnHko9QT0yqqWCyIXDU05";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <2142bcca-7f77-4579-bf62-dd6b2442bab6@suse.com>
Subject: Re: [PATCH v2 05/29] tools/xenlogd: add 9pfs response generation
 support
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-6-jgross@suse.com>
 <CAKf6xpvHdBsWn9z5Yu9MY18Q2CzT-YKVqEa1fYnptwTxve31cQ@mail.gmail.com>
In-Reply-To: <CAKf6xpvHdBsWn9z5Yu9MY18Q2CzT-YKVqEa1fYnptwTxve31cQ@mail.gmail.com>

--------------QOdDnHko9QT0yqqWCyIXDU05
Content-Type: multipart/mixed; boundary="------------QLQ9uB2PN50nvuMy0nT2uYtk"

--------------QLQ9uB2PN50nvuMy0nT2uYtk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTIuMjMgMjA6MzAsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIEZyaSwgTm92
IDEwLCAyMDIzIGF0IDE6NDHigK9QTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPj4gK3N0YXRpYyB2b2lkIGZpbGxfYnVmZmVyKHN0cnVjdCByaW5nICpyaW5n
LCB1aW50OF90IGNtZCwgdWludDE2X3QgdGFnLA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IGNoYXIgKmZtdCwgLi4uKQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IHA5X2hl
YWRlciAqaGRyID0gcmluZy0+YnVmZmVyOw0KPj4gKyAgICB2b2lkICpkYXRhID0gaGRyICsg
MTsNCj4+ICsgICAgY29uc3QgY2hhciAqZjsNCj4+ICsgICAgY29uc3Qgdm9pZCAqcGFyOw0K
Pj4gKyAgICBjb25zdCBjaGFyICpzdHJfdmFsOw0KPj4gKyAgICBjb25zdCBzdHJ1Y3QgcDlf
cWlkICpxaWQ7DQo+PiArICAgIHVuc2lnbmVkIGludCBsZW47DQo+PiArICAgIHZhX2xpc3Qg
YXA7DQo+PiArICAgIHVuc2lnbmVkIGludCBhcnJheV9zeiA9IDA7DQo+PiArICAgIHVuc2ln
bmVkIGludCBlbGVtX3N6ID0gMDsNCj4+ICsNCj4+ICsgICAgaGRyLT5jbWQgPSBjbWQ7DQo+
PiArICAgIGhkci0+dGFnID0gdGFnOw0KPj4gKw0KPj4gKyAgICB2YV9zdGFydChhcCwgZm10
KTsNCj4+ICsNCj4+ICsgICAgZm9yICggZiA9IGZtdDsgKmY7IGYrKyApDQo+PiArICAgIHsN
Cj4+ICsgICAgICAgIGlmICggIWFycmF5X3N6ICkNCj4+ICsgICAgICAgICAgICBwYXIgPSB2
YV9hcmcoYXAsIGNvbnN0IHZvaWQgKik7DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAg
ICB7DQo+PiArICAgICAgICAgICAgcGFyICs9IGVsZW1fc3o7DQo+PiArICAgICAgICAgICAg
YXJyYXlfc3otLTsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIHN3aXRjaCAo
ICpmICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgIGNhc2UgJ2EnOg0KPj4gKyAgICAg
ICAgICAgIGYrKzsNCj4+ICsgICAgICAgICAgICBpZiAoICEqZiB8fCBhcnJheV9zeiApDQo+
PiArICAgICAgICAgICAgICAgIGZtdF9lcnIoZm10KTsNCj4+ICsgICAgICAgICAgICBhcnJh
eV9zeiA9ICooY29uc3QgdW5zaWduZWQgaW50ICopcGFyOw0KPj4gKyAgICAgICAgICAgIGlm
ICggYXJyYXlfc3ogPiAweGZmZmYgKQ0KPj4gKyAgICAgICAgICAgIHsNCj4+ICsgICAgICAg
ICAgICAgICAgc3lzbG9nKExPR19DUklULCAiYXJyYXkgc2l6ZSAldSBpbiBmaWxsX2J1ZmZl
cigpIiwgYXJyYXlfc3opOw0KPj4gKyAgICAgICAgICAgICAgICBleGl0KDEpOw0KPj4gKyAg
ICAgICAgICAgIH0NCj4+ICsgICAgICAgICAgICAqKF9fcGFja2VkIHVpbnQxNl90ICopZGF0
YSA9IGFycmF5X3N6Ow0KPiANCj4gQ29tcGlsaW5nIG9uIEZlZG9yYSAzOSwgZ2NjIDEzLjIu
MToNCj4gDQo+IGlvLmM6IEluIGZ1bmN0aW9uIOKAmGZpbGxfYnVmZmVy4oCZOg0KPiBpby5j
OjIzMzoxMzogZXJyb3I6IOKAmHBhY2tlZOKAmSBhdHRyaWJ1dGUgaWdub3JlZCBmb3IgdHlw
ZSDigJh1aW50MTZfdCAq4oCZDQo+IHtha2Eg4oCYc2hvcnQgdW5zaWduZWQgaW50ICrigJl9
IFstV2Vycm9yPWF0dHJpYnV0ZXNdDQo+ICAgIDIzMyB8ICAgICAgICAgICAgICooX19wYWNr
ZWQgdWludDE2X3QgKilkYXRhID0gYXJyYXlfc3o7DQo+ICAgICAgICB8ICAgICAgICAgICAg
IF4NCj4gDQo+IEZvciBhbGwgdGhlc2UgdXNlcyBvZiBfX3BhY2tlZC4NCg0KTWVoLg0KDQpP
a2F5LCB3aWxsIGFkZCBnZXRfdW5hbGlnbmVkKCkgYW5kIHB1dF91bmFsaWduZWQoKSBmb3Ig
dGhhdCBwdXJwb3NlIGRlYWxpbmcNCndpdGggdGhlIGlzc3VlIGluIGEgY2xlYW4gd2F5Lg0K
DQoNCkp1ZXJnZW4NCg==
--------------QLQ9uB2PN50nvuMy0nT2uYtk
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------QLQ9uB2PN50nvuMy0nT2uYtk--

--------------QOdDnHko9QT0yqqWCyIXDU05--

--------------wiwPbVt0xPaEf2uA0l9CB1TC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVuxBUFAwAAAAAACgkQsN6d1ii/Ey+Z
hwf7BUtNdEp7NGZiJnpFaO609OVJJiPflSiBbCl4Qa0DkzX8G4Ihwh4KAchGC1rZ//xtezB0+j69
ziCeM4G6dV5qlCRwoAQyWhGNQQTriP3X1BYIglGIKgINcC253EButRO5cZwaGxOGJrWfgBIJHvLh
qVHp6iRJTE8C0KHTHT9thctjlm8J+Xv2gmFTYvgANhQO6XDJ/+bOSxC1rr5iQac715Ja445/2BsJ
KvDKo4knXl4ylEQW15x5V2gSee5cP8nRTnlGTS847L9+Y6SU127bk9N+Z2bcKn7YfoZQMGwt6wk7
wDi21rvuBA1wYEktGlEGKbTqyElw7NXHqG8kDUO0rg==
=RjaV
-----END PGP SIGNATURE-----

--------------wiwPbVt0xPaEf2uA0l9CB1TC--

