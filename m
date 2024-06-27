Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD2F919EEF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 07:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749709.1157940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMi5d-0000Fy-Bd; Thu, 27 Jun 2024 05:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749709.1157940; Thu, 27 Jun 2024 05:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMi5d-0000Dh-8u; Thu, 27 Jun 2024 05:54:37 +0000
Received: by outflank-mailman (input) for mailman id 749709;
 Thu, 27 Jun 2024 05:54:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xlGX=N5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sMi5b-0000Db-Hg
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 05:54:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba652426-3449-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 07:54:33 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1306E21B54;
 Thu, 27 Jun 2024 05:54:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EBEE31369A;
 Thu, 27 Jun 2024 05:54:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id voPuN5j+fGYUYAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 27 Jun 2024 05:54:32 +0000
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
X-Inumbo-ID: ba652426-3449-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1719467673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=W0Z9cSGoB7Y2ifrUa6lzImX4CuBDzv+gDMFoaIRNuL0=;
	b=aaF8Bz7yORLegw6rMpdXI99A5eO862CBD1cVKhf4sYZojKvL/zldnqajiNOw1rznwRqjQi
	v3HNnNxkAx+C4On5bxyh6mL4V0Le509U1vf7kF8H/WPfnM06vKcyhdkhbTTcBRZ855agek
	9Eu2HM2BVxoWtophmUf184JLt5IOhxA=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1719467673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=W0Z9cSGoB7Y2ifrUa6lzImX4CuBDzv+gDMFoaIRNuL0=;
	b=aaF8Bz7yORLegw6rMpdXI99A5eO862CBD1cVKhf4sYZojKvL/zldnqajiNOw1rznwRqjQi
	v3HNnNxkAx+C4On5bxyh6mL4V0Le509U1vf7kF8H/WPfnM06vKcyhdkhbTTcBRZ855agek
	9Eu2HM2BVxoWtophmUf184JLt5IOhxA=
Message-ID: <59d67a78-14a0-42ac-b0dc-3d75c109f767@suse.com>
Date: Thu, 27 Jun 2024 07:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Disaggregated (Xoar) Dom0 Building
To: Lonnie Cumberland <lonnie@outstep.com>, xen-devel@lists.xenproject.org
References: <376f0fe4-4ae8-461d-87f2-0fa2e6913689@outstep.com>
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
In-Reply-To: <376f0fe4-4ae8-461d-87f2-0fa2e6913689@outstep.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RCXIz4VorD6UABgzQQMbW0Ns"
X-Spam-Score: -4.43
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.43 / 50.00];
	BAYES_HAM(-2.97)[99.85%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_SPAM_SHORT(0.53)[0.176];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	HAS_ATTACHMENT(0.00)[]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RCXIz4VorD6UABgzQQMbW0Ns
Content-Type: multipart/mixed; boundary="------------HMShch6EvQOvYQBrlkXIKxee";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Lonnie Cumberland <lonnie@outstep.com>, xen-devel@lists.xenproject.org
Message-ID: <59d67a78-14a0-42ac-b0dc-3d75c109f767@suse.com>
Subject: Re: Disaggregated (Xoar) Dom0 Building
References: <376f0fe4-4ae8-461d-87f2-0fa2e6913689@outstep.com>
In-Reply-To: <376f0fe4-4ae8-461d-87f2-0fa2e6913689@outstep.com>

--------------HMShch6EvQOvYQBrlkXIKxee
Content-Type: multipart/mixed; boundary="------------I9lmmSluAhSoNaEjVDMU4uj7"

--------------I9lmmSluAhSoNaEjVDMU4uj7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDYuMjQgMTg6NDcsIExvbm5pZSBDdW1iZXJsYW5kIHdyb3RlOg0KPiBIZWxsbyBB
bGwsDQo+IA0KPiBJIGhvcGUgdGhhdCBldmVyeW9uZSBpcyBkb2luZyB3ZWxsIHRvZGF5Lg0K
PiANCj4gQ3VycmVudGx5LCBJIGFtIGludmVzdGlnYXRpbmcgYW5kIHJlc2VhcmNoaW5nIHRo
ZSBpZGVhcyBvZiAiRGlzYWdncmVnYXRpbmciIERvbTAgDQo+IGFuZCBoYXZlIHRoZSBYb2Fy
IFhlbiBwYXRjaGVzICgiQnJlYWtpbmcgVXAgaXMgSGFyZCB0byBEbzogU2VjdXJpdHkgYW5k
IA0KPiBGdW5jdGlvbmFsaXR5IGluIGEgQ29tbW9kaXR5IEh5cGVydmlzb3IiIDIwMTEpIGF2
YWlsYWJsZSB3aGljaCB3ZXJlIGRldmVsb3BlZCANCj4gYWdhaW5zdCB2ZXJzaW9uIDIyMTU1
IG9mIHhlbi11bnN0YWJsZS4gVGhlIExpbnV4IHBhdGNoZXMgYXJlIGFnYWluc3QgTGludXgg
d2l0aCANCj4gcHZvcHMgMi42LjMxLjEzIGFuZCBkZXZlbG9wZWQgb24gYSBzdGFuZGFyZCBV
YnVudHUgMTAuMDQgaW5zdGFsbC4gTXkgZWZmb3J0IA0KPiB3b3VsZCBhbHNvIGJlIHVwIHVw
ZGF0ZSB0aGVzZSBwYXRjaGVzLg0KPiANCj4gSSBoYXZlIGJlZW4gYWJsZSB0byBsb2NhdGUg
dGhlIFhlbiAiRG9tMCBEaXNhZ2dyZWdhdGlvbiIgDQo+IChodHRwczovL3dpa2kueGVucHJv
amVjdC5vcmcvd2lraS9Eb20wX0Rpc2FnZ3JlZ2F0aW9uKSBhbSByZWFkaW5nIHVwIG9uIHRo
aW5ncyANCj4gbm93IGJ1dCB3YW50ZWQgdG8gYXNrIHRoZSBkZXZlbG9wZXJzIGxpc3QgYWJv
dXQgYW55IGV4cGVyaWVuY2UgeW91IG1heSBoYXZlIGhhZCANCj4gaW4gdGhpcyBhcmVhIHNp
bmNlIHRoZSByZXNlYXJjaCBvYmplY3RpdmUgaXMgdG8gaW50ZWdyYXRlIFhvYXIgd2l0aCB0
aGUgbGF0ZXN0IA0KPiBYZW4gNC4yMCwgaWYgcG9zc2libGUsIGFuZCB0byB0YWtlIGl0IGZ1
cnRoZXIgdG8gYmFzaWNhbGx5IGVsaW1pbmF0ZSBEb20wIGFsbCANCj4gdG9nZXRoZXIgd2l0
aCBpbmRpdmlkdWFsIE1pbmktT1Mgb3IgVW5pa2VybmVsICJTZXJ2aWNlIGFuZCBEcml2ZXIg
Vk0ncyIgaW5zdGVhZCANCj4gdGhhdCBhcmUgbG9hZGVkIGF0IFVFRkkgYm9vdCB0aW1lLg0K
PiANCj4gQW55IGd1aWRhbmNlLCB0aG91Z2h0cywgb3IgaWRlYXMgd291bGQgYmUgZ3JlYXRs
eSBhcHByZWNpYXRlZCwNCg0KSnVzdCBzb21lIHBvaW50ZXJzLCB0aGlzIGlzIG5vdCBhbiBl
eGhhdXN0aXZlIGxpc3Q6DQoNCi0geW91IHNob3VsZCBoYXZlIGEgbG9vayBhdCBkb20wbGVz
cyAoc2VlIGRvY3MvZmVhdHVyZXMvZG9tMGxlc3MucGFuZG9jIGluDQogICB0aGUgWGVuIHNv
dXJjZSB0cmVlKSBhbmQgaHlwZXJsYXVjaCAoc2VlIGRvY3MvZGVzaWducy9sYXVuY2gvaHlw
ZXJsYXVuY2gucnN0DQogICBpbiB0aGUgWGVuIHNvdXJjZSB0cmVlKQ0KDQotIFhlbnN0b3Jl
IGluIGEgc3R1Yi1kb21haW4gaXMgd29ya2luZyBmaW5lLCBpdCBpcyB0aGUgZGVmYXVsdCBp
biBvcGVuU1VTRSBhbmQNCiAgIFNMRQ0KDQotIFF1YmVzT1MgaGFzIGEgbG90IG9mIHRoZSBk
aXNhZ2dyZWdhdGlvbiB5b3UgYXJlIGxvb2tpbmcgZm9yIGltcGxlbWVudGVkDQoNCi0gSSdt
IHByZXR0eSBzdXJlIG9ubHkgdmVyeSBmZXcgY2hhbmdlcyBzaG91bGQgYmUgbmVlZGVkIGZv
ciB0aGUgTGludXgga2VybmVsLA0KICAgaWYgYW55Lg0KDQoNCkp1ZXJnZW4NCg==
--------------I9lmmSluAhSoNaEjVDMU4uj7
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------I9lmmSluAhSoNaEjVDMU4uj7--

--------------HMShch6EvQOvYQBrlkXIKxee--

--------------RCXIz4VorD6UABgzQQMbW0Ns
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmZ8/pgFAwAAAAAACgkQsN6d1ii/Ey86
Xwf5ASJiz+FXce0UcPM1RfANDfpP6jIDY0mbN9JJHmeumUAtFjXo0ORQwtpXHeHttL+xd3fKTYIR
ld+92rmivkWvZ8LUPy7mZK0BMR81tdOYguoQ7gcAYBDyztoWfrizryxNu4fYaNLqt62/mchFZzTC
TeN7nN/S09875TIoWIJ1xv6dePRnXbJx7ccma/Ti7cBccK7XsTCJQ0EHgTBEePx8LZiRRBjKDrIt
wjwpy9k7us8X2c8iugAWazs1eh0rAoJRWs3O7ZyloRppEz5ReIyaUBscOljWlu0Y7dbbuMXk48Hb
msAyzHtITP8xoo7m7+2rgbmVKFgxaAMVcN3Yo4FqDw==
=Bf/x
-----END PGP SIGNATURE-----

--------------RCXIz4VorD6UABgzQQMbW0Ns--

