Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ECB7F742D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 13:48:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640666.999214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VbB-0007d0-23; Fri, 24 Nov 2023 12:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640666.999214; Fri, 24 Nov 2023 12:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VbA-0007aA-V9; Fri, 24 Nov 2023 12:47:56 +0000
Received: by outflank-mailman (input) for mailman id 640666;
 Fri, 24 Nov 2023 12:47:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUjn=HF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r6Vb9-00075b-DH
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 12:47:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af9b3d79-8ac7-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 13:47:54 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E4A8721C0C;
 Fri, 24 Nov 2023 12:47:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2EBD1340B;
 Fri, 24 Nov 2023 12:47:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TSlYKnmbYGUTJwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 24 Nov 2023 12:47:53 +0000
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
X-Inumbo-ID: af9b3d79-8ac7-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700830073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OYHedQBnJY15XZhMAd5H6ml7PVh7BVJsJmASk8AHfoY=;
	b=nRFtU9jlWZYGRm8Z0E40OCEgaO0Yf/dz3Y8TGON2UJofzq+0Wxn3RCQtq1PSSvFx/8Ioao
	t9gPnLK+b4Ykm/rWEkkh1jFbEB0c8tJ8kYw0U5h0ATvcbvKbzYLLUUxkJbtKmeGKiQXbOj
	wdyg2yISjDnLnX3Mm7c6JMrmdS7plXA=
Message-ID: <7a4ca8fe-da45-428f-a300-241b2bf0b2f2@suse.com>
Date: Fri, 24 Nov 2023 13:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Discussion]: Making "LIBXL_HOTPLUG_TIMEOUT" configurable through
 'xl.conf'
Content-Language: en-US
To: Divin Raj <divin.raj@arm.com>, Xen-devel
 <xen-devel@lists.xenproject.org>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>
Cc: Olaf Hering <olaf@aepfle.de>, Jan Beulich <jbeulich@suse.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
References: <4a54e7e7-c041-44d3-a16e-d331e9fdd414@arm.com>
 <20231115182340.505df6c3.olaf@aepfle.de>
 <4f418916-b76d-425a-96a2-05b56a3dc195@suse.com>
 <20231116085629.40a0445b.olaf@aepfle.de>
 <A6D4B8C2-E781-4964-A757-C72F38169246@arm.com>
 <20231116105321.4a59eed4.olaf@aepfle.de>
 <47ec45a1-2004-410c-86c7-861d03c1939b@arm.com>
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
In-Reply-To: <47ec45a1-2004-410c-86c7-861d03c1939b@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8h407fNXi9WwSufgbpZopa3w"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: -3.33
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-3.33 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.14)[68.38%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.19)[-0.974];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[opensuse.org:url];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8h407fNXi9WwSufgbpZopa3w
Content-Type: multipart/mixed; boundary="------------KiOcREk6wMFjJ0yZms9PUraz";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Divin Raj <divin.raj@arm.com>, Xen-devel
 <xen-devel@lists.xenproject.org>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>
Cc: Olaf Hering <olaf@aepfle.de>, Jan Beulich <jbeulich@suse.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
Message-ID: <7a4ca8fe-da45-428f-a300-241b2bf0b2f2@suse.com>
Subject: Re: [Discussion]: Making "LIBXL_HOTPLUG_TIMEOUT" configurable through
 'xl.conf'
References: <4a54e7e7-c041-44d3-a16e-d331e9fdd414@arm.com>
 <20231115182340.505df6c3.olaf@aepfle.de>
 <4f418916-b76d-425a-96a2-05b56a3dc195@suse.com>
 <20231116085629.40a0445b.olaf@aepfle.de>
 <A6D4B8C2-E781-4964-A757-C72F38169246@arm.com>
 <20231116105321.4a59eed4.olaf@aepfle.de>
 <47ec45a1-2004-410c-86c7-861d03c1939b@arm.com>
In-Reply-To: <47ec45a1-2004-410c-86c7-861d03c1939b@arm.com>

--------------KiOcREk6wMFjJ0yZms9PUraz
Content-Type: multipart/mixed; boundary="------------Q2Des5hqV5SkGb0ZOjmF0nTx"

--------------Q2Des5hqV5SkGb0ZOjmF0nTx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMTEuMjMgMTY6MTgsIERpdmluIFJhaiB3cm90ZToNCj4gT24gMTEvMTYvMjMgOTo1
MyBBTSwgT2xhZiBIZXJpbmcgd3JvdGU6DQo+PiBUaHUsIDE2IE5vdiAyMDIzIDA5OjIxOjA2
ICswMDAwIEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFuY2VsbHVAYXJtLmNvbT46DQo+Pg0KPj4+
IEkgc2VlIHlvdXIgcGF0Y2ggaXMgaGFuZGxpbmcgdGhpcyBpc3N1ZSBidXQgbWF5YmUgd2Fz
IG5vdCBtZWFudCB0byBiZSANCj4+PiB1cHN0cmVhbWVkLA0KPj4+IHNvIEkgd291bGQgbGlr
ZSB0byBhc2sgaWYgeW91IGFyZSB3aWxsaW5nIHRvIG1ha2UgaXQgdXBzdHJlYW0tYWJsZSBv
ciBpZiBpdOKAmXMgDQo+Pj4gbm90IHBsYW5uZWQNCj4+PiB0byBkbyBzby4NCj4+DQo+PiBS
aWdodCBub3cgSSBkbyBub3QgaGF2ZSB0aGUgdGltZSB0byB3b3JrIG9uIHRoaXMuDQo+Pg0K
Pj4gRmlyc3QgdGhlcmUgbmVlZCB0byBiZSBhbiBhZ3JlZW1lbnQgYWJvdXQgaG93IHRoZSB0
aW1lb3V0IG5lZWRzIHRvIGJlIGNvbmZpZ3VyZWQuDQo+Pg0KPj4NCj4+IE9sYWYNCj4gDQo+
IEhlbGxvIGV2ZXJ5b25lLA0KPiANCj4gRm9sbG93aW5nIG91ciBlYXJsaWVyIGRpc2N1c3Np
b24sIHdlIGxlYXJuZWQgdGhhdCB0aGVyZSBpcyBhbHJlYWR5IGEgc29sdXRpb24gdG8gDQo+
IGZpeCB0aGUgTElCWEwgaG90cGx1ZyB0aW1lb3V0IGlzc3VlLiBDdXJyZW50bHksIHdlIGhh
dmUgdHdvIG9wdGlvbnM6DQo+IA0KPiAxLiBYZW5zdG9yZSBLZXkvVmFsdWUgQXBwcm9hY2g6
IFRoaXMgaXMgaW1wbGVtZW50ZWQgaW4gdGhlIHBhdGNoIA0KPiAibGlieGwuTElCWExfSE9U
UExVR19USU1FT1VULnBhdGNoIi4gVGhpcyBtZXRob2QgZG9lcyBub3QgcmVxdWlyZSByZWNv
bXBpbGluZyANCj4gbGlieGwuIEl0IGludm9sdmVzIHNldHRpbmcgdXAgYSBrZXkvdmFsdWUg
aW4gWGVuc3RvcmUgYmVmb3JlIGRvbWFpbiBjcmVhdGlvbi4gDQo+IFRoZSBwYXRjaCBjYW4g
YmUgdmlld2VkIGhlcmU6IA0KPiBbaHR0cHM6Ly9idWlsZC5vcGVuc3VzZS5vcmcvcGFja2Fn
ZS92aWV3X2ZpbGUvb3BlblNVU0U6RmFjdG9yeS94ZW4vbGlieGwuTElCWExfSE9UUExVR19U
SU1FT1VULnBhdGNoP2V4cGFuZD0xXS4NCg0KSSBkb24ndCBsaWtlIHRoaXMgYXBwcm9hY2gu
IEl0IHdhcyB1c2VkIHRvIHNvbHZlIHRoZSBwcm9ibGVtIHdpdGhvdXQNCmFmZmVjdGluZyB0
aGUgQUJJLCBidXQgaXQgaXMgYmFzaWNhbGx5IGEgaGFjay4NCg0KPiANCj4gMi4gQ29uZmln
dXJhdGlvbiB2aWEgJ3hsLmNvbmYnOiBXZSBjYW4gbWFrZSAiTElCWExfSE9UUExVR19USU1F
T1VUIiBjb25maWd1cmFibGUgDQo+IHRocm91Z2ggdGhlICd4bC5jb25mJyBmaWxlLg0KDQpB
cyBPbGFmIGhhcyBzYWlkIGFscmVhZHk6IHRoaXMgd291bGRuJ3QgY292ZXIgYWN0aW9ucyBl
LmcuIGJ5IGxpYnZpcnQuDQoNCkkgdGhpbmsgd2UgbWlnaHQgd2FudCBzb21ldGhpbmcgbGlr
ZSBsaWJ4bC5jb25mIChvciB4ZW4uY29uZj8pIHNldHRpbmcNCmRlZmF1bHRzIGZvciBBTEwg
dG9vbCBzdGFja3MuIEkgdGhpbmsgd2Ugc2hvdWxkIGV2ZW4gbW92ZSBzb21lIG9mIHRoZQ0K
c2V0dGluZ3MgZnJvbSB4bC5jb25mIGludG8gdGhlIG5ldyBmaWxlIChsaWtlIGF1dG9iYWxs
b29uLCBtYXhfZ3JhbnRfZnJhbWVzLA0KZXRjLikuDQoNCg0KSnVlcmdlbg0K
--------------Q2Des5hqV5SkGb0ZOjmF0nTx
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Q2Des5hqV5SkGb0ZOjmF0nTx--

--------------KiOcREk6wMFjJ0yZms9PUraz--

--------------8h407fNXi9WwSufgbpZopa3w
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVgm3kFAwAAAAAACgkQsN6d1ii/Ey+x
egf8D/TntIXjNTMyOvX5e05WjZbc8UlkyADKc+aaC85Tp3lHzCHEQf7ZaiZBdDPYu26gzEukqwjq
l6d5An8aj7Rb6goUz5vndY2/XXFtEkveXkF9tZPKsdFoRiUXnC3GgBs1Wiw9J6oiLep4SOh/NAhK
HKLnXAv3/ylznqvp+BZtXNLFv6hn1oQi+cBHir7XU/vVKcCFWtNXyitk+yVvVFyVGR1YXnrZwzFa
mFWHhxt8brMeAWZdoSEz05WYcgIkzSbvJRy/B/P0xv0OFofx3oKxz8t61P7oTaeICgyogJCRSPhe
+prbw5BbrO3sgDWYY2gO0gceuh+8CsE2rAPNozQjdw==
=ed1i
-----END PGP SIGNATURE-----

--------------8h407fNXi9WwSufgbpZopa3w--

