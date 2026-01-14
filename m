Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4A5D1CF49
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 08:52:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202604.1518100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfvfY-00028n-0r; Wed, 14 Jan 2026 07:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202604.1518100; Wed, 14 Jan 2026 07:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfvfX-00026l-Tj; Wed, 14 Jan 2026 07:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1202604;
 Wed, 14 Jan 2026 07:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J70X=7T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vfvfW-00026f-4x
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 07:51:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3bf3099-f11d-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 08:51:52 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DD66D33688;
 Wed, 14 Jan 2026 07:51:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE8AE3EA63;
 Wed, 14 Jan 2026 07:51:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id InzOLBZLZ2lDLwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 14 Jan 2026 07:51:50 +0000
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
X-Inumbo-ID: e3bf3099-f11d-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1768377111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5QzQ3pX9jcY8TtdldB9SckMYIraUVSsrfoex7nqahqA=;
	b=crNqdH/MY8ECyROJ7FGlH1Vto7hxXWxrOhZN6mj0MyrprWJZmXZuOI+5fHbhsLs6R81zmp
	c2d2NVxAHpRs2MwOEsgTPm7APl8O4McEWECiQaujvEOa2HDNzhCnckDU9w+ahjET08fKKr
	SI9lo+vVqYqNGF4ZAFauwhwlAJndaqw=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1768377110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5QzQ3pX9jcY8TtdldB9SckMYIraUVSsrfoex7nqahqA=;
	b=Oq83Pk99pXNvDYF1Jrw6UWZ+9wX0+rabzlld81uirZRXx6aMzDDtnwfSeEzuQm3+D1ztqO
	g9D74pUjQKimaoXu6PkjmrKBO7hpt5by5qwEjKB1MqKGxy/PNwmde4q6J47hj/NBUdAdHn
	XVo05GaS920klhlD7ILgSO3AbdkkjB4=
Message-ID: <2d70de1d-e3bb-48e5-9edc-283121806d83@suse.com>
Date: Wed, 14 Jan 2026 08:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH XEN] tools: Update files examples PV&PVH with pygrub.
From: Juergen Gross <jgross@suse.com>
To: Alexandre GRIVEAUX <agriveaux@deutnet.info>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <aWV5U1hgOYqDBIk2@deutnet.info>
 <a2331e66-24ac-412f-bed5-66d9920f4efc@suse.com>
 <3e937fc7-62bb-404c-9b1b-c4172404bf35@deutnet.info>
 <4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com>
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
In-Reply-To: <4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------T5Rf0k9rgl4S9UiZr2OshQgT"
X-Spam-Score: -6.20
X-Spamd-Result: default: False [-6.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------T5Rf0k9rgl4S9UiZr2OshQgT
Content-Type: multipart/mixed; boundary="------------G1PTU2JlEUR00ME7itsfJBII";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Alexandre GRIVEAUX <agriveaux@deutnet.info>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <2d70de1d-e3bb-48e5-9edc-283121806d83@suse.com>
Subject: Re: [PATCH XEN] tools: Update files examples PV&PVH with pygrub.
References: <aWV5U1hgOYqDBIk2@deutnet.info>
 <a2331e66-24ac-412f-bed5-66d9920f4efc@suse.com>
 <3e937fc7-62bb-404c-9b1b-c4172404bf35@deutnet.info>
 <4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com>
In-Reply-To: <4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com>

--------------G1PTU2JlEUR00ME7itsfJBII
Content-Type: multipart/mixed; boundary="------------Vl3TjEfXs3EWwY9xbK5FItef"

--------------Vl3TjEfXs3EWwY9xbK5FItef
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDEuMjYgMDg6NDMsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDE0LjAxLjI2
IDA4OjI2LCBBbGV4YW5kcmUgR1JJVkVBVVggd3JvdGU6DQo+PiBMZSAxMy8wMS8yMDI2IMOg
IDA3OjE1LCBKdWVyZ2VuIEdyb3NzIGEgw6ljcml0wqA6DQo+Pj4gT24gMTIuMDEuMjYgMjM6
NDQsIEFsZXhhbmRyZSBHUklWRUFVWCB3cm90ZToNCj4+Pj4gVXBkYXRlIGZpbGVzIGV4ZW1w
bGVzIFBWJlBWSCBmb3Igbm9uIGRpcmVjdCBrZXJuZWwgYm9vdCB3aXRoIHB5Z3J1Yi4NCj4+
Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdSSVZFQVVYIDxhZ3JpdmVhdXhA
ZGV1dG5ldC5pbmZvPg0KPj4+PiAtLS0NCj4+Pj4gwqAgdG9vbHMvZXhhbXBsZXMveGxleGFt
cGxlLnB2aGxpbnV4IHwgMyArKysNCj4+Pj4gwqAgdG9vbHMvZXhhbXBsZXMveGxleGFtcGxl
LnB2bGludXjCoCB8IDMgKysrDQo+Pj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy9leGFtcGxlcy94bGV4YW1w
bGUucHZobGludXggYi90b29scy9leGFtcGxlcy8gDQo+Pj4+IHhsZXhhbXBsZS5wdmhsaW51
eA0KPj4+PiBpbmRleCAxODMwNWI4MGFmLi4yYmRkNDNjMmM1IDEwMDY0NA0KPj4+PiAtLS0g
YS90b29scy9leGFtcGxlcy94bGV4YW1wbGUucHZobGludXgNCj4+Pj4gKysrIGIvdG9vbHMv
ZXhhbXBsZXMveGxleGFtcGxlLnB2aGxpbnV4DQo+Pj4+IEBAIC0yNSw2ICsyNSw5IEBAIGtl
cm5lbCA9ICIvYm9vdC92bWxpbnV6Ig0KPj4+PiDCoCAjIEtlcm5lbCBjb21tYW5kIGxpbmUg
b3B0aW9ucw0KPj4+PiDCoCBleHRyYSA9ICJyb290PS9kZXYveHZkYTEiDQo+Pj4+IMKgICsj
IEVuYWJsZSB0byB1c2UgYSBncnViMiBlbXVsYXRpb24gaW5zaWRlIGd1ZXN0IGluc3RlYWQg
b2YgZGlyZWN0IGtlcm5lbCANCj4+Pj4gYm9vdC4NCj4+Pg0KPj4+IEkgZG9uJ3QgdGhpbmsg
dGhpcyBpcyBjb3JyZWN0Lg0KPj4+DQo+Pj4gcHlncnViIGlzIHJ1bm5pbmcgaW4gZG9tMCwg
bm90IGluIHRoZSBndWVzdC4NCj4+Pg0KPj4+DQo+Pj4gSnVlcmdlbg0KPj4NCj4+IEhlbGxv
LA0KPj4NCj4+DQo+PiBJIGRvZXNuJ3QgdW5kZXJzdGFuZCB5b3VyIHJlcGx5LCB5ZXMgcHln
cnViIGlzIHJ1bm5pbmcgb24gdGhlIERvbTAsIGFuZCB0aGlzIA0KPj4gZ29hbCBpcyB0byBi
ZWhhdmUgbGlrZSB0aGVyZSBpcyBhIGdydWIyIG9uIHRoZSBEb21VLg0KPiANCj4gWWVzLiBU
aGlzIGlzIHdoeSBJIGRvbid0IGxpa2UgdGhlIHdvcmRpbmcgImluc2lkZSBndWVzdCIsIHdo
aWNoIGlzIGp1c3Qgbm90DQo+IHRydWUuDQo+IA0KPiBQbGVhc2UgYmUgYXdhcmUgdGhhdCB3
ZSBhcmUgdHJ5aW5nIHRvIHBoYXNlIG91dCBweWdydWIsIGFzIGl0IHdpZGVucyB0aGUNCj4g
YXR0YWNrIHN1cmZhY2Ugb2YgZG9tMCBmcm9tIGEgZ3Vlc3QuIHB5Z3J1YiBuZWVkcyB0byBs
b29rIGludG8gZ3Vlc3QNCj4gY29udHJvbGxlZCBmaWxlIHN5c3RlbXMsIHNvIGFueSBidWcg
aW4gdGhlIHJlbGF0ZWQgY29kZSAoZS5nLiBmYWlsdXJlIHRvDQo+IGhhbmRsZSBhIGNvcnJ1
cHRlZCBvciBtYWxpY2lvdXNseSBtb2RpZmllZCBmaWxlIHN5c3RlbSkgbWlnaHQgcmVzdWx0
IGluDQo+IHNlY3VyaXR5IGlzc3VlcyBsaWtlIGNvZGUgaW5qZWN0aW9uLg0KPiANCj4gU28g
SSdtIG9uIHRoZSBlZGdlIHdoZXRoZXIgd2UgcmVhbGx5IHNob3VsZCBtYWtlIGl0IGVhc2ll
ciB0byB1c2UgcHlncnViLg0KDQpPbmUgZnVydGhlciBub3RlOg0KDQpUaGUgb25seSByZWFs
IGFkdmFudGFnZSBvZiBweWdydWIgaXMgaXRzIGFiaWxpdHkgdG8gZGV0ZXJtaW5lIHdoZXRo
ZXIgdG8NCmNyZWF0ZSBhIDMyLSBvciA2NC1iaXQgUFYgZ3Vlc3QgZGVwZW5kaW5nIG9uIHRo
ZSBrZXJuZWwgc2VsZWN0ZWQuDQoNCkFzIDMyLWJpdCBQViBtb2RlIGlzbid0IHN1cHBvcnRl
ZCBieSB0aGUgTGludXgga2VybmVsIHNpbmNlIHNldmVyYWwgeWVhcnMgbm93LA0KdGhpcyBm
ZWF0dXJlIG9mIHB5Z3J1YiBpcyBtb3N0bHkgaW50ZXJlc3RpbmcgZm9yIHZlcnkgZmV3IGxl
Z2FjeSBndWVzdHMgd2hpY2gNCmNhbiBiZSB1c2VkIHdpdGggMzItIE9SIDY0LWJpdCBQViBr
ZXJuZWxzLg0KDQpGb3IgbW9zdCB1c2UgY2FzZXMgaXQgaXMgbXVjaCBiZXR0ZXIgdG8gdXNl
IHRoZSBQViBvciBQVkggdmFyaWFudCBvZiBncnViMiwNCndoaWNoIHdpbGwgcmVhbGx5IHJ1
biBpbnNpZGUgdGhlIGd1ZXN0Lg0KDQoNCkp1ZXJnZW4NCg==
--------------Vl3TjEfXs3EWwY9xbK5FItef
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Vl3TjEfXs3EWwY9xbK5FItef--

--------------G1PTU2JlEUR00ME7itsfJBII--

--------------T5Rf0k9rgl4S9UiZr2OshQgT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmlnSxYFAwAAAAAACgkQsN6d1ii/Ey96
zAgAhUylUnRgJ5TOP4zc0iMXBo0NkIdw9BOjsWfeO3l1rF0jcAkZjN/EoAZYXsDPDSrylKjM0i6H
ByoPH7Dm4LIWQv3vWfizokfLWBvbPF35qUUzpa2Zx6XCcvCGRgkRMUVtDPU4ddD3EqA/GzJ7Rq/4
PDAaa2/eXT4zj1uTQRw4RJ9Z3Qqmt4xq0QcNQb97eAkUou+Y9TWGg7SbmkkvwiSSRZb1mXrru+vq
rQnFJ89ezvhzsJUqKi/eQLRhfxGdsQhwAzvzU973M6vsIp43yKqHFeATwvGplrNZxph/3T1ECV0U
QWGZoOrfOvkEgEaYUvYbQJFqapS/aJI19eQRTwX0NQ==
=hGwQ
-----END PGP SIGNATURE-----

--------------T5Rf0k9rgl4S9UiZr2OshQgT--

