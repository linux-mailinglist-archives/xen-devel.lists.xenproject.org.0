Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 224BE80080C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 11:15:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645404.1007578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r90Xo-0008SR-3W; Fri, 01 Dec 2023 10:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645404.1007578; Fri, 01 Dec 2023 10:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r90Xo-0008Q0-0n; Fri, 01 Dec 2023 10:14:48 +0000
Received: by outflank-mailman (input) for mailman id 645404;
 Fri, 01 Dec 2023 10:14:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hHVa=HM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r90Xl-0008Pu-SD
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 10:14:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 729c98bd-9032-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 11:14:44 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 818E921BD7;
 Fri,  1 Dec 2023 10:14:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 524501379A;
 Fri,  1 Dec 2023 10:14:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DllpEhKyaWUDXgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 01 Dec 2023 10:14:42 +0000
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
X-Inumbo-ID: 729c98bd-9032-11ee-98e5-6d05b1d4d9a1
Message-ID: <29d97321-f4f0-4472-bb7d-92f4fbb87105@suse.com>
Date: Fri, 1 Dec 2023 11:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/29] tools/xenstored: add helpers for filename
 handling
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-28-jgross@suse.com>
 <369145c5-0bcd-42e5-aff3-b2e58549674e@xen.org>
 <e3376d27-3b36-4290-8f7a-e99db1e2fbbf@suse.com>
 <2f024e6b-8f4b-4784-a1ef-1acb04c5a4dc@xen.org>
 <f15e5a60-e1b0-445b-9374-f8feda10f0b0@suse.com>
 <b18acbe0-b8f9-47d6-a85d-c4a7bd158809@xen.org>
 <34c2307e-f99d-41ab-b76c-948389c64bd0@suse.com>
 <CAKf6xpsupA-eR_KLgncv-DPqNzLKxU=h_fxJfJ4F7kpfTgTQ3w@mail.gmail.com>
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
In-Reply-To: <CAKf6xpsupA-eR_KLgncv-DPqNzLKxU=h_fxJfJ4F7kpfTgTQ3w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fZV0xUg1CkvVb7ndFnqa4X55"
X-Spam-Level: ***************
X-Spamd-Bar: +++++++++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [15.00 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 15.00
X-Rspamd-Queue-Id: 818E921BD7
X-Spam-Flag: YES
X-Spam: Yes

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fZV0xUg1CkvVb7ndFnqa4X55
Content-Type: multipart/mixed; boundary="------------SqGS3DRR5bVPMIKfoTY9dAcR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <29d97321-f4f0-4472-bb7d-92f4fbb87105@suse.com>
Subject: Re: [PATCH v2 27/29] tools/xenstored: add helpers for filename
 handling
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-28-jgross@suse.com>
 <369145c5-0bcd-42e5-aff3-b2e58549674e@xen.org>
 <e3376d27-3b36-4290-8f7a-e99db1e2fbbf@suse.com>
 <2f024e6b-8f4b-4784-a1ef-1acb04c5a4dc@xen.org>
 <f15e5a60-e1b0-445b-9374-f8feda10f0b0@suse.com>
 <b18acbe0-b8f9-47d6-a85d-c4a7bd158809@xen.org>
 <34c2307e-f99d-41ab-b76c-948389c64bd0@suse.com>
 <CAKf6xpsupA-eR_KLgncv-DPqNzLKxU=h_fxJfJ4F7kpfTgTQ3w@mail.gmail.com>
In-Reply-To: <CAKf6xpsupA-eR_KLgncv-DPqNzLKxU=h_fxJfJ4F7kpfTgTQ3w@mail.gmail.com>

--------------SqGS3DRR5bVPMIKfoTY9dAcR
Content-Type: multipart/mixed; boundary="------------bNUS5DO0mcum7QD5HWTOIazs"

--------------bNUS5DO0mcum7QD5HWTOIazs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMTEuMjMgMjE6NDIsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDE1LCAyMDIzIGF0IDE6MTTigK9BTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPj4NCj4+IE9uIDE0LjExLjIzIDIxOjUzLCBKdWxpZW4gR3JhbGwgd3JvdGU6
DQo+Pj4gSGkgSnVlcmdlbiwNCj4+Pg0KPj4+IE9uIDE0LzExLzIwMjMgMDk6MjYsIEp1ZXJn
ZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IE9uIDE0LjExLjIzIDEwOjEwLCBKdWxpZW4gR3JhbGwg
d3JvdGU6DQo+Pj4+PiBIaSBKdWVyZ2VuLA0KPj4+Pj4NCj4+Pj4+IE9uIDE0LzExLzIwMjMg
MDY6NDUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+Pj4gT24gMTMuMTEuMjMgMjM6MjUs
IEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+Pj4gSGkgSnVlcmdlbiwNCj4+Pj4+Pj4NCj4+
Pj4+Pj4gT24gMTAvMTEvMjAyMyAxNjowOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4+
Pj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZWQvbHVfZGFlbW9uLmMgYi90b29scy94
ZW5zdG9yZWQvbHVfZGFlbW9uLmMNCj4+Pj4+Pj4+IGluZGV4IDcxYmNhYmFkZDMuLjYzNTEx
MTFhYjAgMTAwNjQ0DQo+Pj4+Pj4+PiAtLS0gYS90b29scy94ZW5zdG9yZWQvbHVfZGFlbW9u
LmMNCj4+Pj4+Pj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9sdV9kYWVtb24uYw0KPj4+Pj4+
Pj4gQEAgLTI0LDcgKzI0LDcgQEAgdm9pZCBsdV9nZXRfZHVtcF9zdGF0ZShzdHJ1Y3QgbHVf
ZHVtcF9zdGF0ZSAqc3RhdGUpDQo+Pj4+Pj4+PiAgICAgICAgc3RhdGUtPnNpemUgPSAwOw0K
Pj4+Pj4+Pj4gICAgICAgIHN0YXRlLT5maWxlbmFtZSA9IHRhbGxvY19hc3ByaW50ZihOVUxM
LCAiJXMvc3RhdGVfZHVtcCIsDQo+Pj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgIHhl
bnN0b3JlX2RhZW1vbl9ydW5kaXIoKSk7DQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAg
ICAgIHhlbnN0b3JlX3J1bmRpcigpKTsNCj4+Pj4+Pj4NCj4+Pj4+Pj4gLi4uIGNhbGwgYW5k
IC4uLg0KPj4+Pj4+Pg0KPj4+Pj4+Pj4gICAgICAgIGlmICghc3RhdGUtPmZpbGVuYW1lKQ0K
Pj4+Pj4+Pj4gICAgICAgICAgICBiYXJmKCJBbGxvY2F0aW9uIGZhaWx1cmUiKTsNCj4+Pj4+
Pj4+IEBAIC02NSw3ICs2NSw3IEBAIEZJTEUgKmx1X2R1bXBfb3Blbihjb25zdCB2b2lkICpj
dHgpDQo+Pj4+Pj4+PiAgICAgICAgaW50IGZkOw0KPj4+Pj4+Pj4gICAgICAgIGZpbGVuYW1l
ID0gdGFsbG9jX2FzcHJpbnRmKGN0eCwgIiVzL3N0YXRlX2R1bXAiLA0KPj4+Pj4+Pj4gLSAg
ICAgICAgICAgICAgICAgICB4ZW5zdG9yZV9kYWVtb25fcnVuZGlyKCkpOw0KPj4+Pj4+Pj4g
KyAgICAgICAgICAgICAgICAgICB4ZW5zdG9yZV9ydW5kaXIoKSk7DQo+Pj4+Pj4+DQo+Pj4+
Pj4+IC4uLiB0aGlzIG9uZSBjb3VsZCBiZSByZXBsYWNlZCB3aXRoIGFic29sdXRlX2ZpbGVu
YW1lKCkuDQo+Pj4+Pj4NCj4+Pj4+PiBObywgSSBkb24ndCB0aGluayB0aGlzIGlzIGEgZ29v
ZCBpZGVhLg0KPj4+Pj4+DQo+Pj4+Pj4gSSBkb24ndCB3YW50IHRoZSBkYWVtb24gdG8gc3Rv
cmUgdHJhY2UgZmlsZXMgc3BlY2lmaWVkIGFzIHJlbGF0aXZlIGZpbGVzDQo+Pj4+Pj4gdG8g
YmUgc3RvcmVkIGluIC92YXIvcnVuL3hlbiwgd2hpbGUgSSB3YW50IGFsbCBmaWxlcyBvZiB0
aGUgc3R1YmRvbSB0byBiZQ0KPj4+Pj4+IHN0b3JlZCB1bmRlciAvdmFyL2xpYi94ZW4uDQo+
Pj4+Pg0KPj4+Pj4gV2h5PyBUaGlzIGlzIGEgYml0IG9kZCB0byBoYXZlIGEgZGlmZmVyZW50
IGJlaGF2aW9yIGJldHdlZW4gc3R1YmRvbSBhbmQNCj4+Pj4+IGRhZW1vbi4gSXQgd291bGQg
YmUgbXVjaCBlYXNpZXIgZm9yIHRoZSB1c2VyIGlmIHRoZXkga25ldyBhbGwgdGhlIGZpbGVz
IHdvdWxkDQo+Pj4+PiBiZSBhdCB0aGUgc2FtZSBwbGFjZSByZWdhcmRsZXNzIHRoZSB2ZXJz
aW9uIHVzZWQuDQo+Pj4+DQo+Pj4+IFRoZSBtYWluIGRpZmZlcmVuY2UgaXMgdGhhdCBzdHVi
ZG9tIGhhcyBhY2Nlc3MgdG8gb25seSBfb25lXyBkaXJlY3RvcnkgaW4gZG9tMC4NCj4+Pg0K
Pj4+IFdvdWxkIHlvdSBiZSBhYmxlIHRvIGV4cGxhaW4gd2h5IHdlIGNhbiBvbmx5IGdpdmUg
YWNjZXNzIHRvIGEgc2luZ2xlIGRpcmVjdG9yeT8NCj4+PiBJcyB0aGlzIGJlY2F1c2Ugb2Yg
dGhlIDlwZnMgcHJvdG9jb2w/DQo+Pg0KPj4gWWVzLiBJIGNhbiBtb3VudCBhIHNwZWNpZmlj
IGRvbTAgZGlyZWN0b3J5IGluIHRoZSBndWVzdC4NCj4gDQo+IEknbSBmaW5lIHdpdGggYSBz
aW5nbGUgZGlyZWN0b3J5IGJlaW5nIHVzZWQgZm9yIHN0dWJkb20uICBUd28NCj4gZGlyZWN0
b3JpZXMgY291bGQgYmUgZXhwb3J0ZWQsIGFuZCBtaW5pLW9zIHdvdWxkIG5lZWQgdG8gdXNl
IHRoZSAidGFnIg0KPiB0byBkaWZmZXJlbnRpYXRlIHRoZSB0d28uICBUaGF0IG1heSBub3Qg
YmUgd29ydGggdGhlIGFkZGVkIGNvZGUuICBRRU1VDQo+IGNhbiBwcm92aWRlIG11bHRpcGxl
IDlwZnMgZXhwb3J0cyBhbmQgTGludXggY2FuIG1vdW50IHRoZW0gYnkgdGFnDQo+IG5hbWUu
DQoNClRoZSBtYWluIHRoaW5nIGlzIHRoYXQgdGhlIGRhZW1vbiBpcyBtZWFudCB0byBzb2x2
ZSBleGFjdGx5IG9uZSBwcm9ibGVtOg0KaGF2aW5nIGEgd2F5IHRvIGVuYWJsZSBpbmZyYXN0
cnVjdHVyZSBkb21haW5zIChYZW5zdG9yZS1zdHViZG9tLCBkcml2ZXINCmRvbWFpbnMsIGRl
dmljZS1tb2RlbCBzdHViZG9tcykgdG8gYWNjZXNzIHNvbWUgZmV3IGZpbGVzIGluIGRvbTAs
IGUuZy4gZm9yDQpsb2dnaW5nIG9yIGNvbmZpZyBwdXJwb3Nlcy4NCg0KVGhlIGRhZW1vbiBz
aG91bGQgYmUgYXMgc2ltcGxlIGFzIHBvc3NpYmxlIGFuZCwgb2YgY291cnNlLCBoYXZlIHdh
eXMgdG8NCmNvbnRyb2wgcmVzb3VyY2UgdXNhZ2UgKGZpbGUgc3lzdGVtIHNwYWNlKSB1c2Vk
IGJ5IHRoZSBkb21VcyBjb25maWd1cmVkIHRvDQp1c2UgaXQuDQoNCkl0IHNob3VsZCBfbm90
XyBiZSBhIGEgcmVwbGFjZW1lbnQgb2YgdGhlIGZ1bGwtYmxvd24gYmFja2VuZCBpbiBlLmcu
IHFlbXUuDQoNCg0KSnVlcmdlbg0K
--------------bNUS5DO0mcum7QD5HWTOIazs
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------bNUS5DO0mcum7QD5HWTOIazs--

--------------SqGS3DRR5bVPMIKfoTY9dAcR--

--------------fZV0xUg1CkvVb7ndFnqa4X55
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVpshEFAwAAAAAACgkQsN6d1ii/Ey8l
nwgAmpIO8td5RpUlPFPvD9OmiEDzd9XPJIO5y/WlqFUJrHQCesuv71SHO9UtW1acfFUCDXJe/Wiq
D3nLfoZDoYhw5xRDC80NEa4IxJ+FJWB94m39/2WKX3FeLtg5yVcbeIR2Q48kmaLVlaqIhcR/gmVy
yXajPrQ1Mr4u6+VNr+PoOyBF0R1IiYWjXsLCY1y5QJz99XiEZUvGW4I9Qx+AnhKVrSKRuZYFDl2M
raXc8rQGwClfq/ne2pMio2Ry10ng1ifPsFDmZt3LHvop8q5JkDFYRXcmpeYvbi0TeiEV6pVZ20S4
Zq9Sr95MAJyO+0Bg8Ir7v2WuLcR5s8miJZNEIH4FVg==
=2NnA
-----END PGP SIGNATURE-----

--------------fZV0xUg1CkvVb7ndFnqa4X55--

