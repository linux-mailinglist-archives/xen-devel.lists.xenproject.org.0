Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7707DED23
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 08:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626724.977234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyRu8-00042V-Gq; Thu, 02 Nov 2023 07:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626724.977234; Thu, 02 Nov 2023 07:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyRu8-00040Y-EA; Thu, 02 Nov 2023 07:14:12 +0000
Received: by outflank-mailman (input) for mailman id 626724;
 Thu, 02 Nov 2023 07:14:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WoC4=GP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qyRu7-0003yP-0P
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 07:14:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 691729b7-794f-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 08:14:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 483211F85D;
 Thu,  2 Nov 2023 07:14:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18ABE138EC;
 Thu,  2 Nov 2023 07:14:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id swFRBD5MQ2UxKwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 02 Nov 2023 07:14:06 +0000
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
X-Inumbo-ID: 691729b7-794f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698909246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UT1M2jSCAXzhf4jcdyUiHxHURVMYy4hQejuum3hEcPA=;
	b=sn4x4G4IgpNCTvHLoqkHcBENVselkNxEbr/LpzJ5kfQsUr6eCn+mFK9kO9flWQOfbLfB1q
	PocwT7eHMCtWyh6LwNtygorbGLtfnIOYbv8m2q/j1YGa3RgQazjPaaosA9RncXuikD+Vmf
	fU5+4tvmwBkN5GHd68V5OXL9Jmd3Nzc=
Message-ID: <b955031f-435f-4e66-af2e-4d6e591b255b@suse.com>
Date: Thu, 2 Nov 2023 08:14:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] Mini-OS: don't crash if no shutdown node is available
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20231101090024.28934-1-jgross@suse.com>
 <20231101090024.28934-3-jgross@suse.com>
 <e287ebbb-77e4-461e-ae21-e2c6a8027686@citrix.com>
 <769a0a44-6a1c-40a9-aa8a-ddebd794cd79@suse.com>
 <b3d8390f-1cd9-461c-9d98-364a01f33bb5@citrix.com>
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
In-Reply-To: <b3d8390f-1cd9-461c-9d98-364a01f33bb5@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ESSZqUgGe3ve2bAtKJEN9Cmf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ESSZqUgGe3ve2bAtKJEN9Cmf
Content-Type: multipart/mixed; boundary="------------K8yLpcUejeLEAZ6HbT0U93YO";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <b955031f-435f-4e66-af2e-4d6e591b255b@suse.com>
Subject: Re: [PATCH 2/3] Mini-OS: don't crash if no shutdown node is available
References: <20231101090024.28934-1-jgross@suse.com>
 <20231101090024.28934-3-jgross@suse.com>
 <e287ebbb-77e4-461e-ae21-e2c6a8027686@citrix.com>
 <769a0a44-6a1c-40a9-aa8a-ddebd794cd79@suse.com>
 <b3d8390f-1cd9-461c-9d98-364a01f33bb5@citrix.com>
In-Reply-To: <b3d8390f-1cd9-461c-9d98-364a01f33bb5@citrix.com>

--------------K8yLpcUejeLEAZ6HbT0U93YO
Content-Type: multipart/mixed; boundary="------------NVSg8UOzcfgNLJfKbKHUfv0q"

--------------NVSg8UOzcfgNLJfKbKHUfv0q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTEuMjMgMTc6NTcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDAxLzExLzIw
MjMgNDo0MiBwbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IE9uIDAxLjExLjIzIDE3OjM4
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDAxLzExLzIwMjMgOTowMCBhbSwgSnVl
cmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gSXQgbWlnaHQgYmUgcGVyZmVjdGx5IGZpbmUgbm90
IHRvIGhhdmUgYSBjb250cm9sL3NodXRkb3duIFhlbnN0b3JlDQo+Pj4+IG5vZGUuIElmIHRo
aXMgaXMgdGhlIGNhc2UsIGRvbid0IGNyYXNoLCBidXQganVzdCB0ZXJtaW5hdGUgdGhlDQo+
Pj4+IHNodXRkb3duIHRocmVhZCBhZnRlciBpc3N1aW5nIGEgbWVzc2FnZSB0aGF0IHNodXRk
b3duIGlzbid0IGF2YWlsYWJsZS4NCj4+Pj4NCj4+Pj4gSW4gZmluaV9zaHV0ZG93bigpIGNs
ZWFyaW5nIHRoZSB3YXRjaCBjYW4gcmVzdWx0IGluIGFuIGVycm9yIG5vdywgaW4NCj4+Pj4g
Y2FzZSB0aGUgZWFybHkgZXhpdCBhYm92ZSB3YXMgdGFrZW4uIEp1c3QgaWdub3JlIHRoaXMg
ZXJyb3Igbm93Lg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+Pj4NCj4+PiBXaGljaCBjYXNlcyBtaWdodCB3ZSBub3QgaGF2
ZSBhIGNvbnRyb2wvc2h1dGRvd24gbm9kZT8NCj4+DQo+PiBYZW5zdG9yZS1zdHViZG9tLiBJ
dCBzaG91bGQgX25ldmVyXyBzaHV0ZG93biwgYW5kIGl0IGlzbid0IHJlYWxseSB1bmRlcg0K
Pj4gY29udHJvbCBvZiBYZW4gdG9vbHMgKG90aGVyIHRoYW4gYmVpbmcgY3JlYXRlZCkuDQo+
Pg0KPj4+IEknbSBhbGwgZm9yIGNvcGluZyBiZXR0ZXIgd2l0aCBpdHMgYWJzZW5jZSwgYnV0
IGl0J3Mgbm90IGEgcGllY2Ugb2YgdGhlDQo+Pj4gWGVuIEFCSSB3aGljaCBpcyBvcHRpb25h
bC4NCj4+DQo+PiBJJ2QgbGlrZSB0byBkaWZmZXIgaGVyZS4gU2VlIHJlYXNvbmluZyBhYm92
ZS4NCj4gDQo+IElmIHdlJ3JlIGdvaW5nIHRvIHBlcm1pdCB0aGlzIGNvbmZpZ3VyYXRpb24s
IHRoZW4gSSB0aGluayBpdCBuZWVkcyBhbg0KPiBleHRlbnNpb24gdG8geGVuc3RvcmUtcGF0
aHMgdG8gbWFrZSBpdCBvZmZpY2lhbGx5IG9wdGlvbmFsLg0KPiANCj4gQW5kIEkgdGhpbmsg
aXQncyByZWFzb25hYmxlIHRvIHN1cHBvcnQsIGJ1dCBJIHdvdWxkbid0IGdvIGFzIGZhciBh
cw0KPiBzYXlpbmcgIm5ldmVyIi7CoCBJZiB5b3UndmUgY2xlYXZlZCB0aGUgZ2xvYmFsIHhl
bnN0b3JlZCBpbg0KPiB0d2Fpbi90cmluZS9ldGMsIHRoZW4gaW5kaXZpZHVhbCBwYXJ0cyBv
ZiBpdCBjYW4gc2h1dCBkb3duIG5vcm1hbGx5Lg0KDQpYZW5zdG9yZS1zdHViZG9tIGlzIGEg
dmVyeSBzcGVjaWFsIGNhc2UuIEkgZG9uJ3QgdGhpbmsgaXRzIHNodXRkb3duIG5vZGUNCmNh
biBiZSB1bmRlciBjb250cm9sIG9mIHRoZSBub3JtYWwgWGVuIHRvb2xzLCBhcyBvbmx5IHRo
ZSBzdHViZG9tIGNhbiBrbm93DQp3aGV0aGVyIGl0IGlzIGFibGUgdG8gcmVhY3QgaW4gYW55
IHNlbnNpYmxlIHdheSB0byBpdC4gSXQgbmVlZHMgdG8gdGFrZQ0Kc3BlY2lmaWMgbWVhc3Vy
ZXMgdG8gZW5zdXJlIHRoYXQgZXZlbiBpdHMgQUJJLWNvbXBsaWFudCByZWFjdGlvbiB0byBh
DQpzaHV0ZG93biByZXF1ZXN0IGlzIHZpc2libGUgdG8gWGVuIHRvb2xzIChyZW1lbWJlciB0
aGF0IHRoaXMgcmVhY3Rpb24gaXMNCmEgd3JpdGUgdG8gdGhlIHNodXRkb3duIG5vZGUgY2F1
c2luZyBhIHdhdGNoIGV2ZW50IGluIGRvbTAsIHdoaWNoIHdvbid0DQp3b3JrIHdpdGggWGVu
c3RvcmUgZ29pbmcgZG93bikuDQoNCkluIHRoZSBlbmQgdGhlcmUgaXMgbm8gd2F5IHRoZSBz
aHV0ZG93biBub2RlIGNhbiBiZSBwcmVzZW50IHdoZW4gc3RhcnRpbmcNClhlbnN0b3JlLXN0
dWJkb20uIFRoZXJlIGlzIG5vIFhlbnN0b3JlIGF0IHRoZSB0aW1lIHRoZSBub2RlIGlzIHBy
b2JlZCBpbg0KdG9kYXkncyBNaW5pLU9TIGJvb3Qgc2VxdWVuY2UuDQoNCg0KSnVlcmdlbg0K

--------------NVSg8UOzcfgNLJfKbKHUfv0q
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------NVSg8UOzcfgNLJfKbKHUfv0q--

--------------K8yLpcUejeLEAZ6HbT0U93YO--

--------------ESSZqUgGe3ve2bAtKJEN9Cmf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVDTD0FAwAAAAAACgkQsN6d1ii/Ey8D
fQf+KrJzbFZmG8UUWJxSD7t5q0Hw7rtSkCgqhuFaV2nuzrGtR7E6bZswV2Wv5Ud4f2DEEtC4uI3D
tMYVtHggF763lzhAUgYoEn5RFYcGPBs9z7xIsVZX6vWDXQS7HEQ8vWBjr+XisZq4+JjdfIdsFzm8
tW39xBS+QVABF7n6p9hUv99SkjvLCxHtJknND89gLMqnGrCvoMbbaiBovYZE3d3l7w683KkSEthF
EfYo+8dV0AnFje08BHnGCsPTvkZfIPKbQXQHU5ZSBnBqvMr9Z4P/V5XBRlsJYiJtHYPrWH9EPzfw
OV18ToQSILDJu7xZYjkvjr9iBYRjImOwZOLHAMwMDQ==
=IsaG
-----END PGP SIGNATURE-----

--------------ESSZqUgGe3ve2bAtKJEN9Cmf--

