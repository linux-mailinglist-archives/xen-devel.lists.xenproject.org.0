Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FCFB15927
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 08:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063452.1429166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh0hU-0007FH-SP; Wed, 30 Jul 2025 06:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063452.1429166; Wed, 30 Jul 2025 06:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh0hU-0007Cp-PY; Wed, 30 Jul 2025 06:54:08 +0000
Received: by outflank-mailman (input) for mailman id 1063452;
 Wed, 30 Jul 2025 06:54:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txka=2L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uh0hT-0007Cj-D8
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 06:54:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbbc90ca-6d11-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 08:54:05 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 699AD1F45A;
 Wed, 30 Jul 2025 06:54:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39FAC1388B;
 Wed, 30 Jul 2025 06:54:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jSeHDIzBiWjcOgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 30 Jul 2025 06:54:04 +0000
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
X-Inumbo-ID: fbbc90ca-6d11-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753858444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1pwlGGVQ1PbVtWJ0AWIRE2fq53aepYxKBjcH1l7+iNU=;
	b=BYVXXwuoR36VOJDIpqJe8akIaE514USuiibvmWdUWq0ZrJ65TLIbCS9H7l0OcjnSTs+Jl7
	3mOghvljSmOwyNTEDRTU1GvczeBeH/KCzX5QrA0rNqcCCF+iVnxb7NGD9YLCs5xo6epcv3
	HKsBpJuPeTO0OyMfbsSayz31p8X2Ang=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=BYVXXwuo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753858444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1pwlGGVQ1PbVtWJ0AWIRE2fq53aepYxKBjcH1l7+iNU=;
	b=BYVXXwuoR36VOJDIpqJe8akIaE514USuiibvmWdUWq0ZrJ65TLIbCS9H7l0OcjnSTs+Jl7
	3mOghvljSmOwyNTEDRTU1GvczeBeH/KCzX5QrA0rNqcCCF+iVnxb7NGD9YLCs5xo6epcv3
	HKsBpJuPeTO0OyMfbsSayz31p8X2Ang=
Message-ID: <c2f3e37b-1325-41a9-921b-8105312db488@suse.com>
Date: Wed, 30 Jul 2025 08:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] xenstored: use fread() instead of mmap() for
 reading live update state
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>
References: <20250729110146.10580-1-jgross@suse.com>
 <20250729110146.10580-2-jgross@suse.com>
 <dfd09f68-1d2a-42b7-ba8f-c1f54c6861ce@citrix.com>
 <d2eb4a63-1bec-497d-911f-cf458533cd6f@citrix.com>
 <17bb1fd7-132b-400b-90ce-7ada6c87c388@suse.com>
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
In-Reply-To: <17bb1fd7-132b-400b-90ce-7ada6c87c388@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------x5X6rXzL4MJlpeS8qPNvy30P"
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 699AD1F45A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid]
X-Spam-Score: -6.41

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------x5X6rXzL4MJlpeS8qPNvy30P
Content-Type: multipart/mixed; boundary="------------jcSrKswc0bxcqeaPfh2V1K58";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <c2f3e37b-1325-41a9-921b-8105312db488@suse.com>
Subject: Re: [PATCH v2 1/9] xenstored: use fread() instead of mmap() for
 reading live update state
References: <20250729110146.10580-1-jgross@suse.com>
 <20250729110146.10580-2-jgross@suse.com>
 <dfd09f68-1d2a-42b7-ba8f-c1f54c6861ce@citrix.com>
 <d2eb4a63-1bec-497d-911f-cf458533cd6f@citrix.com>
 <17bb1fd7-132b-400b-90ce-7ada6c87c388@suse.com>
In-Reply-To: <17bb1fd7-132b-400b-90ce-7ada6c87c388@suse.com>

--------------jcSrKswc0bxcqeaPfh2V1K58
Content-Type: multipart/mixed; boundary="------------1BaMYNHJP94CRLLxUzk0o2R8"

--------------1BaMYNHJP94CRLLxUzk0o2R8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDcuMjUgMDg6MTgsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDI5LjA3LjI1
IDIxOjI1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMjkvMDcvMjAyNSA4OjIxIHBt
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDI5LzA3LzIwMjUgMTI6MDEgcG0sIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZWQv
bHUuYyBiL3Rvb2xzL3hlbnN0b3JlZC9sdS5jDQo+Pj4+IGluZGV4IDc3ZTBkMzc3YzUuLmYy
YzhiOTJkMDcgMTAwNjQ0DQo+Pj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9sdS5jDQo+Pj4+
ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9sdS5jDQo+Pj4+IEBAIC0yNyw5ICsyNywxMSBAQCBz
dHJ1Y3QgbGl2ZV91cGRhdGUgKmx1X3N0YXR1czsNCj4+Pj4gwqAgc3RydWN0IGx1X2R1bXBf
c3RhdGUgew0KPj4+PiDCoMKgwqDCoMKgIHZvaWQgKmJ1ZjsNCj4+Pj4gK8KgwqDCoCB1bnNp
Z25lZCBpbnQgYnVmX3NpemU7DQo+Pj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHNpemU7
DQo+Pj4+IC3CoMKgwqAgaW50IGZkOw0KPj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBvZmZz
ZXQ7DQo+Pj4+IMKgwqDCoMKgwqAgY2hhciAqZmlsZW5hbWU7DQo+Pj4+ICvCoMKgwqAgRklM
RSAqZnA7DQo+Pj4gSSBrbm93IHRoZXJlJ3MgYWxyZWFkeSBvbmUgdW5zaWduZWQgaW50IHNp
emUgaGVyZSwgYnV0IGxpZmUgaXMgdG9vIHNob3J0DQo+Pj4gdG8gbm90IHVzZSBzaXplX3Qg
ZnJvbSB0aGUgZ2V0LWdvLg0KPj4NCj4+IFRoYXQgc2FpZCwgb2Zmc2V0IHJlYWxseSBuZWVk
cyB0byBiZSBhbiBvZmZzNjRfdCBpZiB5b3Ugd2FudCAzMmJpdA0KPj4gZ3Vlc3RzIHRvIDlQ
IHNhZmVseSBvbiBhIG1vZGVybiBmaWxlc3lzdGVtLg0KPiANCj4gRm9yIDMyYml0IGd1ZXN0
cyBJIGRvbid0IHNlZSBhIHByb2JsZW0gaGVyZSwgYXMgdGhpcyB3b3VsZCBtZWFuIHRoZSBY
ZW5zdG9yZQ0KPiBzdGF0ZSB3b3VsZCBleGNlZWQgNEdCLCB3aGljaCBzZWVtcyB1bmxpa2Vs
eSB1c2luZyBhbiBpbi1tZW1vcnkgZGF0YSBiYXNlIGluDQo+IGEgc3lzdGVtIHN1cHBvcnRp
bmcgbGVzcyB0aGFuIDJHQiBvZiBtZW1vcnkgKHRoZSBNaW5pLU9TIGxpbWl0IGZvciAzMmJp
dCBpcw0KPiAxR0IsIHdoaWxlIGEgMzJiaXQgZGFlbW9uIGNhbiB1c2UgbWF4LiAyR0Igb2Yg
dmlydHVhbCBtZW1vcnkpLg0KPiANCj4gVXNpbmcgdW5zaWduZWQgaW50IGlzIGEgcG90ZW50
aWFsIHByb2JsZW0gaW4gNjRiaXQgbW9kZSwgdGhvdWdoLiBTbyBzd2l0Y2hpbmcNCj4gdG8g
c2l6ZV90IGZvciBzaXplIGFuZCBvZmY2NF90IGZvciBvZmZzZXQgc2VlbXMgc2Vuc2libGUu
DQoNCk1laCwgb2ZmNjRfdCBzZWVtcyB0byBiZSB1bmtub3duIGluIE1pbmktT1MgZW52aXJv
bm1lbnQuIFdpbGwgdXNlIHNpemVfdCBmb3INCm9mZnNldCwgdG9vLg0KDQoNCkp1ZXJnZW4N
Cg==
--------------1BaMYNHJP94CRLLxUzk0o2R8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------1BaMYNHJP94CRLLxUzk0o2R8--

--------------jcSrKswc0bxcqeaPfh2V1K58--

--------------x5X6rXzL4MJlpeS8qPNvy30P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiJwYsFAwAAAAAACgkQsN6d1ii/Ey+9
EAf/RxUZWDEVQJO5bcFB4zyLhkNq5Kkd9/qgvy//cziuWw0JmlNhfYUn7wDGmMQ8Hgd1uMT2Za5B
YNZ9CClvDI1nf/itnxyi3GR4HYK05Hr4E+L6116ZWhsvTS13irw7YWEBdHneFxfTKbRw/ero60Ei
HONFK8BhdlWyXPb6Z/1gcx56+WEEhEq9FRD0rUu81N4YkVV80Hd9LCRJ/ZxqRLi/NHcUQLNmpgXu
BvwmwQ9HNuUGczaTKKH4WgUx/epx3qJ3aHqYr2VLmn4jf4EJsA6wm+N8kRMdmraVWTJTd7HH4EMH
wezJKfYfmol5nMCXHkSzRqvdZA2OYOEddYNFD4diIw==
=kY5J
-----END PGP SIGNATURE-----

--------------x5X6rXzL4MJlpeS8qPNvy30P--

