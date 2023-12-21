Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 435D381B4A6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 12:06:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658833.1028231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGsj-0005IK-1w; Thu, 21 Dec 2023 11:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658833.1028231; Thu, 21 Dec 2023 11:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGsi-0005F9-VE; Thu, 21 Dec 2023 11:06:24 +0000
Received: by outflank-mailman (input) for mailman id 658833;
 Thu, 21 Dec 2023 11:06:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRZ7=IA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rGGsh-0005F1-H1
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 11:06:23 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f97bbdf9-9ff0-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 12:06:22 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6E9F31FB71;
 Thu, 21 Dec 2023 11:06:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A2E513725;
 Thu, 21 Dec 2023 11:06:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Boq0CC0chGW7UwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 21 Dec 2023 11:06:21 +0000
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
X-Inumbo-ID: f97bbdf9-9ff0-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1703156781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kVJxjiTYYVqjZO/Z+GYaW3NzMb+nuGOjQmNEWqKhKf4=;
	b=C92dl2Wl8NijU5XIClbb3XqdCB9DUlqqEE0crc8xQOcrtS/Kx0MoUzGmv9PF0RIhfBiSxf
	t+PX0b2QquZSQusGrWKZxGk4zzgR7Mnw8LYyFafgV1l6L+lvfAfHB2EmKj4fd0rB3C8/6j
	1eiHE+tUhJH8hesuuhuvpTKfGfDE05k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1703156781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kVJxjiTYYVqjZO/Z+GYaW3NzMb+nuGOjQmNEWqKhKf4=;
	b=C92dl2Wl8NijU5XIClbb3XqdCB9DUlqqEE0crc8xQOcrtS/Kx0MoUzGmv9PF0RIhfBiSxf
	t+PX0b2QquZSQusGrWKZxGk4zzgR7Mnw8LYyFafgV1l6L+lvfAfHB2EmKj4fd0rB3C8/6j
	1eiHE+tUhJH8hesuuhuvpTKfGfDE05k=
Message-ID: <14f2857f-5afb-4c04-ab84-6b8403f1dbc8@suse.com>
Date: Thu, 21 Dec 2023 12:06:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] xen/spinlock: introduce new type for recursive
 spinlocks
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-4-jgross@suse.com>
 <ea25863a-f5da-4873-89f2-d75b3abb9ef8@xen.org>
 <36331c0f-d495-4263-95a6-e1c5abcac060@suse.com>
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
In-Reply-To: <36331c0f-d495-4263-95a6-e1c5abcac060@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xQuoa7Db0JFyaSGw14H65g0Z"
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.44 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MX_GOOD(-0.01)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-1.24)[89.54%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=C92dl2Wl
X-Spam-Score: -4.44
X-Rspamd-Queue-Id: 6E9F31FB71

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xQuoa7Db0JFyaSGw14H65g0Z
Content-Type: multipart/mixed; boundary="------------LcGcWQN2Q88jMnPh9vMlfr7X";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Message-ID: <14f2857f-5afb-4c04-ab84-6b8403f1dbc8@suse.com>
Subject: Re: [PATCH v4 03/12] xen/spinlock: introduce new type for recursive
 spinlocks
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-4-jgross@suse.com>
 <ea25863a-f5da-4873-89f2-d75b3abb9ef8@xen.org>
 <36331c0f-d495-4263-95a6-e1c5abcac060@suse.com>
In-Reply-To: <36331c0f-d495-4263-95a6-e1c5abcac060@suse.com>

--------------LcGcWQN2Q88jMnPh9vMlfr7X
Content-Type: multipart/mixed; boundary="------------CDGOX6XOYj7mHWD5pQmbiwOY"

--------------CDGOX6XOYj7mHWD5pQmbiwOY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMTIuMjMgMTE6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMi4xMi4yMDIz
IDEzOjU3LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBPbiAxMi8xMi8yMDIzIDA5OjQ3LCBK
dWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+IEBAIC0xMDksMTIgKzEwOSwxNiBAQCBzdHJ1Y3Qg
bG9ja19wcm9maWxlX3FoZWFkIHsNCj4+PiAgICAgICAgc3BpbmxvY2tfdCBsID0gX1NQSU5f
TE9DS19VTkxPQ0tFRChOVUxMKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
DQo+Pj4gICAgICAgIHN0YXRpYyBzdHJ1Y3QgbG9ja19wcm9maWxlIF9fbG9ja19wcm9maWxl
X2RhdGFfIyNsID0gX0xPQ0tfUFJPRklMRShsKTsgICAgXA0KPj4+ICAgICAgICBfTE9DS19Q
Uk9GSUxFX1BUUihsKQ0KPj4+ICsjZGVmaW5lIERFRklORV9SU1BJTkxPQ0sobCkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4gKyAg
ICByc3BpbmxvY2tfdCBsID0gX1NQSU5fTE9DS19VTkxPQ0tFRChOVUxMKTsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwNCj4+PiArICAgIHN0YXRpYyBzdHJ1Y3QgbG9ja19w
cm9maWxlIF9fbG9ja19wcm9maWxlX2RhdGFfIyNsID0gX0xPQ0tfUFJPRklMRShsKTsgICAg
XA0KPj4+ICsgICAgX0xPQ0tfUFJPRklMRV9QVFIobCkNCj4+PiAgICANCj4+PiAtI2RlZmlu
ZSBzcGluX2xvY2tfaW5pdF9wcm9mKHMsIGwpICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXA0KPj4+ICsjZGVmaW5lIF9fc3Bpbl9sb2NrX2luaXRfcHJv
ZihzLCBsLCBsb2NrdHlwZSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+
Pg0KPj4gSWYgSSBhbSBub3QgbWlzdGFrZW4gdGhlIGRvdWJsZS11bmRlcnNjb3JlIHByZWZp
eCBpcyBhIHZpb2xhdGlvbiBpbg0KPj4gTUlTUkEuIFNvIGNhbiB0aGlzIGJlIHJlbmFtZWQg
dG86DQo+Pg0KPj4gc3Bpbl9sb2NrX2luaXRfcHJvZl9fKCk/DQo+IA0KPiBJcyB0aGUgbmV3
IHBhcmFtZXRlciBuZWVkZWQgYXQgYWxsPyBDYW4ndCB3ZSB1c2UgdHlwZW9mKChzKS0+bCkg
aW4gcGxhY2Ugb2YNCj4gcGFzc2luZyB0aGUgdHlwZSBleHBsaWNpdGx5Pw0KDQpJTU8gc3Bp
bl9sb2NrX2luaXRfcHJvZigpIHNob3VsZCBiZSB1c2FibGUgZm9yIHNwaW5sb2NrX3Qgb25s
eSwgYW5kDQpyc3Bpbl9sb2NrX2luaXRfcHJvZigpIGZvciByc3BpbmxvY2tfdCBvbmx5LiBV
c2luZyB0eXBlb2YoKSB3b3VsZCBtYWtlDQplaXRoZXIgb2YgdGhlbSB1c2FibGUgZm9yIGJv
dGggdHlwZXMuDQoNCg0KSnVlcmdlbg0K
--------------CDGOX6XOYj7mHWD5pQmbiwOY
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------CDGOX6XOYj7mHWD5pQmbiwOY--

--------------LcGcWQN2Q88jMnPh9vMlfr7X--

--------------xQuoa7Db0JFyaSGw14H65g0Z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmWEHCwFAwAAAAAACgkQsN6d1ii/Ey/G
Iwf9HoGXkyADeH8sPwiJ5XYYPU1jVUtq3wpNPPgbOfrphIUIEWIYb68BfAPRVyCPYtBvf2BdP9gl
1m2JJQ2ZD6+XMADKpfTXAHOenmumhe1BguW7tLMiC7lq13XVV1qwUNFlDaGcWoZ5JbpT42Eg15tF
WYjQLhIc2QJLzQ59UtVRKx+9+bBb1h9JE7xNIPTjFe6TvKZyE4scD4IyTOAs0cFrNaVJfcdnbSV6
djme5j7iC5+s7vbUzGy0lKKs5KUn+chos+umRVRpuWWSLY3V2PRsipG6Te7/uuTLcee/BvSICx6v
jhNs26uUgYnNYTP51+TA38Z+OYZwgdA5WLT13vO58Q==
=PCLC
-----END PGP SIGNATURE-----

--------------xQuoa7Db0JFyaSGw14H65g0Z--

