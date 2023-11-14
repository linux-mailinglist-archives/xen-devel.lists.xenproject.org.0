Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A1A7EAA9C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 07:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632146.986218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2nBR-0003ly-Em; Tue, 14 Nov 2023 06:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632146.986218; Tue, 14 Nov 2023 06:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2nBR-0003j0-CC; Tue, 14 Nov 2023 06:46:01 +0000
Received: by outflank-mailman (input) for mailman id 632146;
 Tue, 14 Nov 2023 06:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OFhv=G3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2nBP-000327-9Z
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 06:45:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7725e887-82b9-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 07:45:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 16AB01F86A;
 Tue, 14 Nov 2023 06:45:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD3A313460;
 Tue, 14 Nov 2023 06:45:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id COc7NKQXU2VCQwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Nov 2023 06:45:56 +0000
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
X-Inumbo-ID: 7725e887-82b9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699944357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ExSZOruRy+li31Iu1++WI76czYIT7VGYIQ+BNC4P7Kw=;
	b=tkOpMC6kLAl4mOUKY8dLdlJaBmaURrQQMJKWVXzenk6h9HknNrb96AIy/lk7J/V+WO5Lt4
	WVmx0VQh4TG5WG/Z/W6d4Rji3BeWrmw8iDaC0PhMvur551cMN6FfXZprjOcHVNnhDCG+ov
	/0ZQm3osu2XbaU2D8qQCsOUgMaxyviM=
Message-ID: <f9e8900b-10a9-4c88-bc99-118c61b549d7@suse.com>
Date: Tue, 14 Nov 2023 07:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/29] tools/xenstored: support complete log
 capabilities in stubdom
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-29-jgross@suse.com>
 <7e09a127-4977-486e-b028-48f4559cadb5@xen.org>
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
In-Reply-To: <7e09a127-4977-486e-b028-48f4559cadb5@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CgjmWsofyaEtcgLPtwcGQN9H"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CgjmWsofyaEtcgLPtwcGQN9H
Content-Type: multipart/mixed; boundary="------------w0JinH19cQzGciwc0P4I4Ccs";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Message-ID: <f9e8900b-10a9-4c88-bc99-118c61b549d7@suse.com>
Subject: Re: [PATCH v2 28/29] tools/xenstored: support complete log
 capabilities in stubdom
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-29-jgross@suse.com>
 <7e09a127-4977-486e-b028-48f4559cadb5@xen.org>
In-Reply-To: <7e09a127-4977-486e-b028-48f4559cadb5@xen.org>

--------------w0JinH19cQzGciwc0P4I4Ccs
Content-Type: multipart/mixed; boundary="------------4nwRHu50SL08a14ekSsQUfD7"

--------------4nwRHu50SL08a14ekSsQUfD7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjMgMjM6NDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEwLzExLzIwMjMgMTY6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBX
aXRoIDlwZnMgYmVpbmcgZnVsbHkgYXZhaWxhYmxlIGluIFhlbnN0b3JlLXN0dWJkb20gbm93
LCB0aGVyZSBpcyBubw0KPj4gcmVhc29uIHRvIG5vdCBmdWxseSBzdXBwb3J0IGFsbCBsb2dn
aW5nIGNhcGFiaWxpdGllcyBpbiBzdHViZG9tLg0KPj4NCj4+IE9wZW4gdGhlIGxvZ2ZpbGUg
b24gc3R1YmRvbSBvbmx5IGFmdGVyIHRoZSA5cGZzIGZpbGUgc3lzdGVtIGhhcyBiZWVuDQo+
PiBtb3VudGVkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0Bn
bWFpbC5jb20+DQo+PiAtLS0NCj4+IMKgIHRvb2xzL2hvdHBsdWcvTGludXgvbGF1bmNoLXhl
bnN0b3JlLmluIHzCoCAxICsNCj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9jb250cm9sLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMwICsrKysrKysrKysrKystLS0tLS0tLS0tLS0t
DQo+PiDCoCB0b29scy94ZW5zdG9yZWQvbWluaW9zLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCAzICsrKw0KPj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25z
KCspLCAxNSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvaG90cGx1
Zy9MaW51eC9sYXVuY2gteGVuc3RvcmUuaW4gDQo+PiBiL3Rvb2xzL2hvdHBsdWcvTGludXgv
bGF1bmNoLXhlbnN0b3JlLmluDQo+PiBpbmRleCBlODU0Y2ExZWI4Li5kYTRlZWNhN2M1IDEw
MDY0NA0KPj4gLS0tIGEvdG9vbHMvaG90cGx1Zy9MaW51eC9sYXVuY2gteGVuc3RvcmUuaW4N
Cj4+ICsrKyBiL3Rvb2xzL2hvdHBsdWcvTGludXgvbGF1bmNoLXhlbnN0b3JlLmluDQo+PiBA
QCAtOTgsNiArOTgsNyBAQCB0ZXN0IC1mIEBDT05GSUdfRElSQC9AQ09ORklHX0xFQUZfRElS
QC94ZW5jb21tb25zICYmIC4gDQo+PiBAQ09ORklHX0RJUkAvQENPTkZJR19MRUFGDQo+PiDC
oMKgwqDCoMKgIFsgLXogIiRYRU5TVE9SRV9ET01BSU5fU0laRSIgXSAmJiBYRU5TVE9SRV9E
T01BSU5fU0laRT04DQo+PiDCoMKgwqDCoMKgIFhFTlNUT1JFX0RPTUFJTl9BUkdTPSIkWEVO
U1RPUkVfRE9NQUlOX0FSR1MgLS1tZW1vcnkgJFhFTlNUT1JFX0RPTUFJTl9TSVpFIg0KPj4g
wqDCoMKgwqDCoCBbIC16ICIkWEVOU1RPUkVfTUFYX0RPTUFJTl9TSVpFIiBdIHx8IA0KPj4g
WEVOU1RPUkVfRE9NQUlOX0FSR1M9IiRYRU5TVE9SRV9ET01BSU5fQVJHUyAtLW1heG1lbSAk
WEVOU1RPUkVfTUFYX0RPTUFJTl9TSVpFIg0KPj4gK8KgwqDCoCBbIC16ICIkWEVOU1RPUkVE
X1RSQUNFIiBdIHx8IFhFTlNUT1JFX0RPTUFJTl9BUkdTPSIkWEVOU1RPUkVfRE9NQUlOX0FS
R1MgDQo+PiAtVCB4ZW5zdG9yZWQtdHJhY2UubG9nIg0KPiANCj4gSSBhbSBwcm9iYWJseSBt
aXNzaW5nIHNvbWV0aGluZywgYnV0IGFueSByZWFzb24gdG8gbm90IHVzZSANCj4gQFhFTl9M
T0dfRElSQC94ZW5zdG9yZWQtdHJhY2UubG9nIGFzIHdlIGRvIGZvciB4ZW5zdG9yZWQ/DQoN
Clllcy4gU3R1YmRvbSBoYXMgbm8gYWNjZXNzIHRvIFhFTl9MT0dfRElSLg0KDQoNCkp1ZXJn
ZW4NCg==
--------------4nwRHu50SL08a14ekSsQUfD7
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4nwRHu50SL08a14ekSsQUfD7--

--------------w0JinH19cQzGciwc0P4I4Ccs--

--------------CgjmWsofyaEtcgLPtwcGQN9H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVTF6QFAwAAAAAACgkQsN6d1ii/Ey8x
jAgAnF5mcHGgtt6qkQVp8zk1Lc+qRlAy9x9uw7cns1h5N0zDOOIPosu6O/qQnwZRmfwIBXJi6RKe
mvzNmG/xcDbVpqPZ8Dlg9eH6FgAdfvVNnFjBN9REMHLYGu6Dw7iLdmYQYT4PKZfNkELzupA9jfSp
pf/ul0yA8WHV4X+9mxF5B/UphlrDX/9MnQrzMl2Vc3JYGmctyPZV5lfckT8OmULRx94Uxl3euIab
wIoHsZ0roiXGjO/UaWmzxSvm7YBC8tpWVscLZGg0My/jk06jy6WqZtVyrqhZdot8O19FXXEM/2Tt
5MTalt59CqpCPGV1B6oQF9Y8XkM+rnuwMabMH6IJSw==
=FMvT
-----END PGP SIGNATURE-----

--------------CgjmWsofyaEtcgLPtwcGQN9H--

