Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E8299A345
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 14:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816976.1231076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szEPS-0005l2-8D; Fri, 11 Oct 2024 12:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816976.1231076; Fri, 11 Oct 2024 12:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szEPS-0005if-4k; Fri, 11 Oct 2024 12:06:18 +0000
Received: by outflank-mailman (input) for mailman id 816976;
 Fri, 11 Oct 2024 12:06:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5FLX=RH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1szEPR-0005Ij-FX
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 12:06:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3731c5a3-87c9-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 14:06:15 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 23F101FCE0;
 Fri, 11 Oct 2024 12:06:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB2731370C;
 Fri, 11 Oct 2024 12:06:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id I0LbM7YUCWelYwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 11 Oct 2024 12:06:14 +0000
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
X-Inumbo-ID: 3731c5a3-87c9-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728648375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AP0lE6GELvjDU5tE5u0JtEumVZXQfjmSmXY1XghR4tw=;
	b=ODPL4t6hHkumrDnkrdEuWDx9YayMdRSZzVZzAZLqJ87MoL7VBopu4oqr4rbUZMlM0XWjGT
	sU0HgdbvGDeomhgHKvJ1pAkiYtnE7cevQTdhsJtQyXobjcbARQ3W9C1K+zAzPwRXtip5ze
	Xh23xL5WtsnC5e6YrI+liT8s5zZMHY0=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ODPL4t6h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728648375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AP0lE6GELvjDU5tE5u0JtEumVZXQfjmSmXY1XghR4tw=;
	b=ODPL4t6hHkumrDnkrdEuWDx9YayMdRSZzVZzAZLqJ87MoL7VBopu4oqr4rbUZMlM0XWjGT
	sU0HgdbvGDeomhgHKvJ1pAkiYtnE7cevQTdhsJtQyXobjcbARQ3W9C1K+zAzPwRXtip5ze
	Xh23xL5WtsnC5e6YrI+liT8s5zZMHY0=
Message-ID: <e6938fd7-2cb8-412f-b3e3-1943eeb271d8@suse.com>
Date: Fri, 11 Oct 2024 14:06:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: Remove dependency between pciback and privcmd
To: Jiqian Chen <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZXUb7OBS6mGfOIbLlsELebFw"
X-Rspamd-Queue-Id: 23F101FCE0
X-Spam-Score: -6.41
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZXUb7OBS6mGfOIbLlsELebFw
Content-Type: multipart/mixed; boundary="------------KzonHHoe46ML3HTmZO8toNtL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <e6938fd7-2cb8-412f-b3e3-1943eeb271d8@suse.com>
Subject: Re: [PATCH v3] xen: Remove dependency between pciback and privcmd
References: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
In-Reply-To: <20241011034227.1278144-1-Jiqian.Chen@amd.com>

--------------KzonHHoe46ML3HTmZO8toNtL
Content-Type: multipart/mixed; boundary="------------HIhyeYz3LjAO61Tn6TXjB10r"

--------------HIhyeYz3LjAO61Tn6TXjB10r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMTAuMjQgMDU6NDIsIEppcWlhbiBDaGVuIHdyb3RlOg0KPiBDb21taXQgMmZhZTZi
YjdiZTMyICgieGVuL3ByaXZjbWQ6IEFkZCBuZXcgc3lzY2FsbCB0byBnZXQgZ3NpIGZyb20g
ZGV2IikNCj4gYWRkcyBhIHdlYWsgcmV2ZXJzZSBkZXBlbmRlbmN5IHRvIHRoZSBjb25maWcg
WEVOX1BSSVZDTUQgZGVmaW5pdGlvbiwgdGhhdA0KPiBkZXBlbmRlbmN5IGNhdXNlcyB4ZW4t
cHJpdmNtZCBjYW4ndCBiZSBsb2FkZWQgb24gZG9tVSwgYmVjYXVzZSBkZXBlbmRlbnQNCj4g
eGVuLXBjaWJhY2sgaXNuJ3QgYWx3YXlzIGJlIGxvYWRlZCBzdWNjZXNzZnVsbHkgb24gZG9t
VS4NCj4gDQo+IFRvIHNvbHZlIGFib3ZlIHByb2JsZW0sIHJlbW92ZSB0aGF0IGRlcGVuZGVu
Y3ksIGFuZCBkbyBub3QgY2FsbA0KPiBwY2lzdHViX2dldF9nc2lfZnJvbV9zYmRmKCkgZGly
ZWN0bHksIGluc3RlYWQgYWRkIGEgaG9vayBpbg0KPiBkcml2ZXJzL3hlbi9hcGNpLmMsIHhl
bi1wY2liYWNrIHJlZ2lzdGVyIHRoZSByZWFsIGNhbGwgZnVuY3Rpb24sIHRoZW4gaW4NCj4g
cHJpdmNtZF9pb2N0bF9wY2lkZXZfZ2V0X2dzaSBjYWxsIHRoYXQgaG9vay4NCj4gDQo+IEZp
eGVzOiAyZmFlNmJiN2JlMzIgKCJ4ZW4vcHJpdmNtZDogQWRkIG5ldyBzeXNjYWxsIHRvIGdl
dCBnc2kgZnJvbSBkZXYiKQ0KPiBSZXBvcnRlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfD
s3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCg0KVW5mb3J0dW5hdGVs
eSBJJ20gc2VlaW5nIGEgYnVpbGQgYnJlYWthZ2UgZm9yIHRoZSAzMi1iaXQgeDg2IGJ1aWxk
Lg0KDQpSZWFzb24gaXMgdGhhdCBkcml2ZXJzL3hlbi9hY3BpLmMgaXMgYmVpbmcgYnVpbHQg
Zm9yIERvbTAgb25seSwgc28gaGF2aW5nDQpDT05GSUdfWEVOX0FDUEkgZGVmaW5lZCBpcyBu
b3QgZW5vdWdoIGZvciBlbnN1cmluZyB0aGUgbmV3IGZ1bmN0aW9ucyBhcmUNCnByZXNlbnQu
DQoNCkkgc3VnZ2VzdCB0byBhZGQgYSBuZXcgQ09ORklHIGl0ZW0gQ09ORklHX1hFTl9ET00w
X0FDUEkgbGlrZQ0KDQpjb25maWcgWEVOX0RPTTBfQUNQSQ0KCWRlZl9ib29sIHkNCglkZXBl
bmRzIG9uIFhFTl9BQ1BJICYmIFhFTl9ET00wDQoNCmFuZCB0aGVuIHJlcGxhY2UgYWxsIENP
TkZJR19YRU5fQUNQSSBpbnN0YW5jZXMgaW4geW91ciBwYXRjaCB3aXRoDQpDT05GSUdfWEVO
X0RPTTBfQUNQSS4gVGhpcyBpbmNsdWRlcyB0aGUgdXNlIGNhc2UgaW4NCnByaXZjbWRfaW9j
dGxfcGNpZGV2X2dldF9nc2koKS4NCg0KDQpKdWVyZ2VuDQo=
--------------HIhyeYz3LjAO61Tn6TXjB10r
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------HIhyeYz3LjAO61Tn6TXjB10r--

--------------KzonHHoe46ML3HTmZO8toNtL--

--------------ZXUb7OBS6mGfOIbLlsELebFw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcJFLYFAwAAAAAACgkQsN6d1ii/Ey/9
1Af/QbUZAWY+c7Ca+FSbwKWfxGwSoWvAbiHN4qas6uzSDPzvMQySzJljQxNTxTkduaFUxE/RgDw0
XpxrCxkp/jYy4SuJ9hLu63KuTgCEIKk7WbFOcATMJG20vZtVxdVBHysWDnHgweK6Ls5KCfuIjmjw
dV4g+y0lpw2gL3JTYj1/p87WRhN+nDAtnAzM1vyWSUsMftJQvf+BEA2VNmKgzfOV+hhV+Bl2xgvF
jZ/Qf+8AMpvxoUu6I/JAquUrNLPmSUaVUnP8qBoI094qqQiBA2WHse7YeRysUv83/WBXjOIT+Z4F
X3YnW2USjj6Oo00hIgIVFtbN1iKlwn2frQ+vQgThzw==
=OVU7
-----END PGP SIGNATURE-----

--------------ZXUb7OBS6mGfOIbLlsELebFw--

