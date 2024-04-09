Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A7089D586
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 11:27:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702202.1097074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru7kT-0005mT-Jk; Tue, 09 Apr 2024 09:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702202.1097074; Tue, 09 Apr 2024 09:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru7kT-0005k3-Fw; Tue, 09 Apr 2024 09:26:37 +0000
Received: by outflank-mailman (input) for mailman id 702202;
 Tue, 09 Apr 2024 09:26:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/B/Z=LO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ru7kR-0005js-MX
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 09:26:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fd9196d-f653-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 11:26:05 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E23C21981;
 Tue,  9 Apr 2024 09:26:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1819013980;
 Tue,  9 Apr 2024 09:26:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NeH6A6sJFWZXWwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 09 Apr 2024 09:26:03 +0000
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
X-Inumbo-ID: 2fd9196d-f653-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712654763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tz9hn/qgNtGL6TOQsZaPonXsTvNTDaX8hFzAggQ+pvo=;
	b=BOZIXrgIKwl8zk0ly4dXTtE3DrhdZO1oJLyPh24Sr2kJahjkhjXJty31S3VLT9oJ0flKAA
	DTHHCYKNv4p3Fe+cO8Pp8coDmeyFnBWWmZmZOren51uQWGj7+KXPWxvZgxRdgQmL9h1v3n
	lCUp6kYfgx9aQJfYIr7PE7hx107vCTE=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=BOZIXrgI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712654763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tz9hn/qgNtGL6TOQsZaPonXsTvNTDaX8hFzAggQ+pvo=;
	b=BOZIXrgIKwl8zk0ly4dXTtE3DrhdZO1oJLyPh24Sr2kJahjkhjXJty31S3VLT9oJ0flKAA
	DTHHCYKNv4p3Fe+cO8Pp8coDmeyFnBWWmZmZOren51uQWGj7+KXPWxvZgxRdgQmL9h1v3n
	lCUp6kYfgx9aQJfYIr7PE7hx107vCTE=
Message-ID: <70e7a017-0343-4d6d-9d46-3875f71e6bf9@suse.com>
Date: Tue, 9 Apr 2024 11:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux Xen PV CPA W^X violation false-positives
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
References: <20240124165401.35784-1-jandryuk@gmail.com>
 <a2246242-627a-493b-9cd4-c76b0cb301ee@suse.com>
 <CAKf6xps9X=6GYxuk9u2cPYh_pzpLu2MQ00smydRQ40TjxDhgEQ@mail.gmail.com>
 <9b5a105a-650c-4b33-9f4e-03612fb6701c@suse.com>
 <f86bc525-1a77-4b7a-b1b3-9a22d9525e90@perard>
Content-Language: en-US
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
In-Reply-To: <f86bc525-1a77-4b7a-b1b3-9a22d9525e90@perard>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Tu2PG8GmNWKWV09o0ICA6B8G"
X-Spam-Level: 
X-Spamd-Result: default: False [-6.40 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3E23C21981
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -6.40

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Tu2PG8GmNWKWV09o0ICA6B8G
Content-Type: multipart/mixed; boundary="------------vh8kPMaTp8oziu0Y1uYsI07r";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Message-ID: <70e7a017-0343-4d6d-9d46-3875f71e6bf9@suse.com>
Subject: Re: Linux Xen PV CPA W^X violation false-positives
References: <20240124165401.35784-1-jandryuk@gmail.com>
 <a2246242-627a-493b-9cd4-c76b0cb301ee@suse.com>
 <CAKf6xps9X=6GYxuk9u2cPYh_pzpLu2MQ00smydRQ40TjxDhgEQ@mail.gmail.com>
 <9b5a105a-650c-4b33-9f4e-03612fb6701c@suse.com>
 <f86bc525-1a77-4b7a-b1b3-9a22d9525e90@perard>
In-Reply-To: <f86bc525-1a77-4b7a-b1b3-9a22d9525e90@perard>

--------------vh8kPMaTp8oziu0Y1uYsI07r
Content-Type: multipart/mixed; boundary="------------CeUSB0hRix7rPc4K2PIJVUo7"

--------------CeUSB0hRix7rPc4K2PIJVUo7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDQuMjQgMTI6MjIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAyOCwgMjAyNCBhdCAwMjowMDoxNFBNICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0K
Pj4gSGkgSmFzb24sDQo+Pg0KPj4gT24gMjguMDMuMjQgMDI6MjQsIEphc29uIEFuZHJ5dWsg
d3JvdGU6DQo+Pj4gT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgNzo0NuKAr0FNIErDvHJnZW4g
R3Jvw58gPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+DQo+Pj4+IE9uIDI0LjAxLjI0
IDE3OjU0LCBKYXNvbiBBbmRyeXVrIHdyb3RlOg0KPj4+Pj4gKw0KPj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiBuZXc7DQo+Pj4+PiArICAgICAgICAgICAgIH0NCj4+Pj4+
ICsgICAgIH0NCj4+Pj4+ICsNCj4+Pj4+ICAgICAgICAgZW5kID0gc3RhcnQgKyBucGcgKiBQ
QUdFX1NJWkUgLSAxOw0KPj4+Pj4gICAgICAgICBXQVJOX09OQ0UoMSwgIkNQQSBkZXRlY3Rl
ZCBXXlggdmlvbGF0aW9uOiAlMDE2bGx4IC0+ICUwMTZsbHggcmFuZ2U6IDB4JTAxNmx4IC0g
MHglMDE2bHggUEZOICVseFxuIiwNCj4+Pj4+ICAgICAgICAgICAgICAgICAgICh1bnNpZ25l
ZCBsb25nIGxvbmcpcGdwcm90X3ZhbChvbGQpLA0KPj4+Pg0KPj4+PiBKYXNvbiwgZG8geW91
IHdhbnQgdG8gc2VuZCBhIFYyIHdpdGggeW91ciBTaWduZWQtb2ZmLCBvciB3b3VsZCB5b3Ug
bGlrZSBtZSB0bw0KPj4+PiB0cnkgdXBzdHJlYW1pbmcgdGhlIHBhdGNoPw0KPj4+DQo+Pj4g
SGkgSsO8cmdlbiwNCj4+Pg0KPj4+IFllcywgcGxlYXNlIHVwc3RyZWFtIHlvdXIgYXBwcm9h
Y2guICBJIHdhc24ndCBzdXJlIGhvdyB0byBkZWFsIHdpdGgNCj4+PiBpdCwgc28gaXQgd2Fz
IG1vcmUgb2YgYSBidWcgcmVwb3J0Lg0KPj4NCj4+IFRoZSBmaW5hbCBzb2x1dGlvbiB3YXMg
YSBiaXQgbW9yZSBjb21wbGljYXRlZCwgYXMgdGhlcmUgYXJlIHNvbWUNCj4+IGNvcm5lciBj
YXNlcyB0byBiZSBjb25zaWRlcmVkLiBPVE9IIGl0IGlzIG5vdyBjb21wbGV0ZSBieSBsb29r
aW5nDQo+PiBhdCBhbGwgdXNlZCB0cmFuc2xhdGlvbiBlbnRyaWVzLg0KPj4NCj4+IEFyZSB5
b3UgYWJsZSB0byB0ZXN0IHRoZSBhdHRhY2hlZCBwYXRjaD8gSSBkb24ndCBzZWUgdGhlIG9y
aWdpbmFsDQo+PiBpc3N1ZSBhbmQgY2FuIG9ubHkgdmVyaWZ5IHRoZSBwYXRjaCBkb2Vzbid0
IGNhdXNlIGFueSByZWdyZXNzaW9uLg0KPj4NCj4+DQo+PiBKdWVyZ2VuDQo+IA0KPiBIaSBK
w7xyZ2VuLA0KPiANCj4gSSBnYXZlIGEgdHJ5IHRvIHRoZSBwYXRjaCBpbiB0aGlzIGVtYWls
IHdpdGggb3NzdGVzdCwgYW5kIEkgY2FuJ3QgZmluZCBhDQo+IHNpbmdsZSAiQ1BBIGRldGVj
dGVkIFdeWCB2aW9sYXRpb24iIGxvZyBlbnRyeSwgd2hlbiB0aGVyZSdzIHNlZW1zIHRvIGJl
DQo+IG1hbnkgaW4gb3NzdGVzdCBpbiBnZW5lcmFsLCBmcm9tIGRvbTAgaXQgc2VlbXMgYXMg
aXQncyBvbiB0aGUgaG9zdA0KPiBzZXJpYWwgY29uc29sZSB1c3VhbGx5Lg0KPiANCj4gaHR0
cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE4NTI1Mi8N
Cj4gDQo+IElmIHlvdSBsb29rIGluIHNldmVyYWwgInNlcmlhbC0kaG9zdC5sb2cqIiBmaWxl
cywgdGhlcmUgd2lsbCBiZSB0aGUNCj4gIkNQQSBkZXRlY3RlZCIgbWVzc2FnZSwgYnV0IHRo
ZXkgaGFwcGVuIG9uIHByZXZpb3VzIHRlc3QgcnVuLg0KPiANCj4gSSBkaWQgYW4gb3RoZXIg
c21hbGxlciBydW4gYmVmb3JlIHRoaXMgb25lLCBhbmQgc2FtZSB0aGluZzoNCj4gaHR0cDov
L2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE4NTE4Ni8NCj4g
DQo+IEFuZCB0aGlzIG90aGVyIHJ1biBhcyB3ZWxsLCB3aGljaCBJIGZhaWxlZCB0byBzZXR1
cCBwcm9wZXJseSB3aXRoIGxvdHMNCj4gb2YgYnJva2VuLCBidXQgbm8gZmFpbHVyZSBkdWUg
dG8gdGhlIHBhdGNoIGFuZCBJIGNhbid0IGZpbmQgYW55ICJDUEENCj4gZGV0ZWN0ZWQiIG1l
c3NhZ2VzLg0KPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0
L2xvZ3MvMTg1MjQ4Lw0KPiANCj4gSSBob3BlIHRoYXQgaGVscHM/DQoNClllcywgaXQgZG9l
cy4gVGhhbmtzIGZvciB0ZXN0aW5nLg0KDQoNCkp1ZXJnZW4NCg0K
--------------CeUSB0hRix7rPc4K2PIJVUo7
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------CeUSB0hRix7rPc4K2PIJVUo7--

--------------vh8kPMaTp8oziu0Y1uYsI07r--

--------------Tu2PG8GmNWKWV09o0ICA6B8G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmYVCaoFAwAAAAAACgkQsN6d1ii/Ey97
YQf/TLAkxkXFwAxwKK6nZPXusNpNsm6xUbn/cgSF3dQXEbRVCfppcNuvXGixadQaU17ZVdwxQpTZ
7FYHm12JfqZG6iR6RaxMsSz62cbPC9E8ltj357v1UYrgdM/Jn1m2b1RnlTLdrRa/nA6lyYdWvUXy
ostoot2UT3YS0KXexM9Cd/iec1EOYX83GL5bH7GmEh/9K4VOLVmfVPC7AO1VINqegEtsN94aM91n
mwOPeTqKYI4slL/Ju8wa8MtmC9dbrCWXhNkHhakk2+TX6nVtkeheosO9afcAKffcW3zDKNNakqYq
m6/3AjBpzCmgOpIyfHYt436rI64IGMWVVB8C/qCAPg==
=dt/h
-----END PGP SIGNATURE-----

--------------Tu2PG8GmNWKWV09o0ICA6B8G--

