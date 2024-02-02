Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C48474EB
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 17:35:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675137.1050352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVwUk-0008Bz-Cu; Fri, 02 Feb 2024 16:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675137.1050352; Fri, 02 Feb 2024 16:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVwUk-0008AQ-9x; Fri, 02 Feb 2024 16:34:26 +0000
Received: by outflank-mailman (input) for mailman id 675137;
 Fri, 02 Feb 2024 16:34:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PMC9=JL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rVwUi-0008AK-Mx
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 16:34:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc1e8af-c1e8-11ee-8a43-1f161083a0e0;
 Fri, 02 Feb 2024 17:34:23 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 28F3D1F802;
 Fri,  2 Feb 2024 16:34:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7AD913A60;
 Fri,  2 Feb 2024 16:34:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +8C2No0ZvWXQQQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 02 Feb 2024 16:34:21 +0000
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
X-Inumbo-ID: ebc1e8af-c1e8-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706891662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PA6OYGu4R6n4SDeUZwkoSJyyE8lzK5shUya70YYhQ14=;
	b=HMeUqiI99OTHg3vyUTKGKpCSQwNxCu/8BdW0bscQA8XwbvlTNaGrOVUGkYV49D2gzklM3C
	IguGQs8e0pPuSqeLXRDFn8f3CyTQ26ShO4E78auE6sw/gBeAoyEHz9mx1BJRBhSoeqxcEk
	Z2ZQH/jeJCuUKZhU4LcDHmgsQQmwFE4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706891662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PA6OYGu4R6n4SDeUZwkoSJyyE8lzK5shUya70YYhQ14=;
	b=HMeUqiI99OTHg3vyUTKGKpCSQwNxCu/8BdW0bscQA8XwbvlTNaGrOVUGkYV49D2gzklM3C
	IguGQs8e0pPuSqeLXRDFn8f3CyTQ26ShO4E78auE6sw/gBeAoyEHz9mx1BJRBhSoeqxcEk
	Z2ZQH/jeJCuUKZhU4LcDHmgsQQmwFE4=
Message-ID: <fc36ce28-9158-4a61-9452-86569b7721ef@suse.com>
Date: Fri, 2 Feb 2024 17:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/33] tools: add 9pfs device to xenstore-stubdom
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Jason Andryuk <jandryuk@gmail.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-22-jgross@suse.com>
 <55c49bed-4039-449c-bb79-412ea9c2b5e2@perard>
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
In-Reply-To: <55c49bed-4039-449c-bb79-412ea9c2b5e2@perard>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5vFayze0PdxLtTsxg1i30oxx"
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=HMeUqiI9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.40 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 MX_GOOD(-0.01)[];
	 SIGNED_PGP(-2.00)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-0.00)[23.14%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[lists.xenproject.org,xen.org,gmail.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -4.40
X-Rspamd-Queue-Id: 28F3D1F802
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5vFayze0PdxLtTsxg1i30oxx
Content-Type: multipart/mixed; boundary="------------1UxKPinAv47F1f0AfiAeo459";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Message-ID: <fc36ce28-9158-4a61-9452-86569b7721ef@suse.com>
Subject: Re: [PATCH v3 21/33] tools: add 9pfs device to xenstore-stubdom
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-22-jgross@suse.com>
 <55c49bed-4039-449c-bb79-412ea9c2b5e2@perard>
In-Reply-To: <55c49bed-4039-449c-bb79-412ea9c2b5e2@perard>

--------------1UxKPinAv47F1f0AfiAeo459
Content-Type: multipart/mixed; boundary="------------y8GvvfIikntByqRRHYPeM7LG"

--------------y8GvvfIikntByqRRHYPeM7LG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDEuMjQgMTY6MzEsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIEph
biAwNCwgMjAyNCBhdCAxMDowMDo0M0FNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gQWRkIGEgOXBmcyBkZXZpY2UgdG8gWGVuc3RvcmUgc3R1YmRvbSBpbiBvcmRlciB0byBh
bGxvdyBpdCB0byBkbyBlLmcuDQo+PiBsb2dnaW5nIGludG8gYSBkb20wIGZpbGUuDQo+Pg0K
Pj4gVXNlIHRoZSBmb2xsb3dpbmcgcGFyYW1ldGVycyBmb3IgdGhlIG5ldyBkZXZpY2U6DQo+
Pg0KPj4gLSB0YWcgPSAieGVuIg0KPiANCj4gSXMgaXQgb2sgdG8gaGF2ZSBoZXJlIHRhZyAi
eGVuIiB3aGVuIHRoZSBkZWZhdWx0IHRhZyBpcyAiWGVuIiA/DQoNCkl0IGlzIG9rYXksIGJ1
dCBJIGFncmVlIGl0IHNob3VsZCBiZSAiWGVuIi4NCg0KSSdsbCBjaGFuZ2UgaXQuDQoNCj4g
DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvaW5jbHVkZS9saWJ4bC5oIGIvdG9vbHMvaW5jbHVk
ZS9saWJ4bC5oDQo+PiBpbmRleCA5MDdhYTBhMzMwLi4wMDY5MzI2NGY3IDEwMDY0NA0KPj4g
LS0tIGEvdG9vbHMvaW5jbHVkZS9saWJ4bC5oDQo+PiArKysgYi90b29scy9pbmNsdWRlL2xp
YnhsLmgNCj4+IEBAIC0yMDYwLDYgKzIwNjcsMTYgQEAgaW50IGxpYnhsX2NvbnNvbGVfYWRk
X3hlbnN0b3JlKGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwgdWludDMyX3QgYmFj
a2VuZCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhs
X2FzeW5jb3BfaG93ICphb19ob3cpDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBMSUJYTF9FWFRFUk5BTF9DQUxMRVJTX09OTFk7DQo+PiAgIA0KPj4gKy8qIGxpYnhs
X3A5X2FkZF94ZW5zdG9yZSB3cml0ZXMgdGhlIFhlbnN0b3JlIGVudHJpZXMgZm9yIGEgZG9t
YWluJ3MNCj4+ICsgKiBwcmltYXJ5IDlwZnMgZGV2aWNlIGJhc2VkIG9uIGRvbWlkLCBiYWNr
ZW5kIHR5cGUgYW5kIGRldmljZSBwYXJhbWV0ZXJzLg0KPj4gKyAqLw0KPj4gK2ludCBsaWJ4
bF9wOV9hZGRfeGVuc3RvcmUobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLCB1aW50
MzJfdCBiYWNrZW5kLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfcDlf
dHlwZSB0eXBlLCBjaGFyICp0YWcsIGNoYXIgKnBhdGgsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICBjaGFyICpzZWN1cml0eV9tb2RlbCwgdW5zaWduZWQgaW50IG1heF9zcGFj
ZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYXhfZmls
ZXMsIHVuc2lnbmVkIGludCBtYXhfb3Blbl9maWxlcywNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJvb2wgYXV0b19kZWxldGUsIGNvbnN0IGxpYnhsX2FzeW5jb3BfaG93ICph
b19ob3cpDQo+IA0KPiBDb3VsZCB3ZSBzaW1wbHkgcGFzcyBhICJsaWJ4bF9kZXZpY2VfcDkq
IiBpbnN0ZWFkIG9mIGFsbCB0aGVzZQ0KPiBwYXJhbWV0ZXJzPyBJdCB3b3VsZCBhbHNvIG1l
YW4gdGhhdCB3ZSBjYW4gdXBkYXRlIHRoZSBsaXN0IG9mIHBhcmFtZXRlcnMNCj4gd2l0aG91
dCBoYXZpbmcgdG8gY2hhbmdlIHRoZSBmdW5jdGlvbiBwcm90b3R5cGUuDQoNCkZpbmUgd2l0
aCBtZS4NCg0KPiBUaGVzZSBmdW5jdGlvbnMgdGVuZCB0byBiZSBjYWxsZWQgImxpYnhsX2Rl
dmljZV8qX2FkZCgpIiwgaXMgaXQgcG9zc2libGUNCj4gdG8gZm9sbG93IHRoZSBzYW1lIHNj
aGVtYT8gSW4gcGFydGljdWxhciwgSSBkb24ndCBzZWUgYW55dGhpbmcgeGVuc3RvcmUNCj4g
c3BlY2lmaWMgaW4gdGhlIGZ1bmN0aW9uLg0KDQpJdCB3YXMgbWVhbnQgdG8gYmUgc2ltaWxh
ciB0byBsaWJ4bF9jb25zb2xlX2FkZF94ZW5zdG9yZSgpLCB3aGljaCBqdXN0IHdyaXRlcw0K
dGhlIFhlbnN0b3JlIGNvbnRlbnRzIG9mIHRoZSBkZXZpY2UuDQoNCkkgdGhpbmsgeW91IGFy
ZSByaWdodCB0aGF0IGxpYnhsX2RldmljZV85cGZzX2FkZCgpIGlzIGEgYmV0dGVyIG5hbWUu
DQoNCg0KSnVlcmdlbg0K
--------------y8GvvfIikntByqRRHYPeM7LG
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------y8GvvfIikntByqRRHYPeM7LG--

--------------1UxKPinAv47F1f0AfiAeo459--

--------------5vFayze0PdxLtTsxg1i30oxx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmW9GY0FAwAAAAAACgkQsN6d1ii/Ey8e
uggAmz4AyUMNcNv7oRPcsoiyEdUYVSD4AVkv41cTDGvbiy9zomHTWOR57jzImfh1DX6pmTFTyic9
eNdc9wJE7ushlwNfFHMWEwgFwm5cRoRExLWIHobb93/8P1QhamxjFCcdi6u0pC6ZMFuj0RkZr/jC
TEc2rDayFuH+QLEphJnyCYtlbUGZK9u+l20a9rHyi8y2qNtrMeOQYvbKKlTk79EboK6dnOCwOHYA
onuTOvCSKbkeoOkX2Hxs4LRGDcjQ1EsUfUtNjfyRmmcfS3ivtvVqgm/6dsQRgB20gsMVpZ/ZLgfU
JhnDj8Y/brBRPYGPFwTnGuFGMgZ3Pl3WMTIjjBG08g==
=EjzQ
-----END PGP SIGNATURE-----

--------------5vFayze0PdxLtTsxg1i30oxx--

