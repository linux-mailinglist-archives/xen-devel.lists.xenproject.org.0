Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E42DAADFEF
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 14:59:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978539.1365306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCeMK-0002Ho-HE; Wed, 07 May 2025 12:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978539.1365306; Wed, 07 May 2025 12:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCeMK-0002FH-E4; Wed, 07 May 2025 12:58:48 +0000
Received: by outflank-mailman (input) for mailman id 978539;
 Wed, 07 May 2025 12:58:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rlNr=XX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uCeMJ-0002DK-8K
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 12:58:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00bdff47-2b43-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 14:58:42 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 446441F449;
 Wed,  7 May 2025 12:58:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D45813882;
 Wed,  7 May 2025 12:58:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rj0xBQFZG2hXOwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 07 May 2025 12:58:41 +0000
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
X-Inumbo-ID: 00bdff47-2b43-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746622721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=k5Uls9ZZa7Eov+ZryOPU8nHBjfUEKIAHW2KciQ26+UE=;
	b=jVtRNKrmJAvMoPd1CtiXRd8iozAREhf5WO08DMWkQvy8J4/RUT+7FSXCBfFISjiUuivFQl
	ojo8Rar4jzq8wD0qIjX/47GSRmun1A9Qx84g2R/5o/59FoJVtvU3AezL0AWsENRyysOLJx
	4v6Acat4o9d6W7CJfzfMNwxmnVfh1Fg=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746622721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=k5Uls9ZZa7Eov+ZryOPU8nHBjfUEKIAHW2KciQ26+UE=;
	b=jVtRNKrmJAvMoPd1CtiXRd8iozAREhf5WO08DMWkQvy8J4/RUT+7FSXCBfFISjiUuivFQl
	ojo8Rar4jzq8wD0qIjX/47GSRmun1A9Qx84g2R/5o/59FoJVtvU3AezL0AWsENRyysOLJx
	4v6Acat4o9d6W7CJfzfMNwxmnVfh1Fg=
Message-ID: <25fce343-d18c-46b5-ac68-5ba4c1335df9@suse.com>
Date: Wed, 7 May 2025 14:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 00/12] kexec: add kexec support to Mini-OS
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org
References: <20250321092451.17309-1-jgross@suse.com>
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
In-Reply-To: <20250321092451.17309-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9t1pxHRHl1XxBzO4BxzU8OQl"
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Score: -4.20

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9t1pxHRHl1XxBzO4BxzU8OQl
Content-Type: multipart/mixed; boundary="------------1nuSvqvc0jIZgwarDdAcook4";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org
Message-ID: <25fce343-d18c-46b5-ac68-5ba4c1335df9@suse.com>
Subject: Re: [MINI-OS PATCH 00/12] kexec: add kexec support to Mini-OS
References: <20250321092451.17309-1-jgross@suse.com>
In-Reply-To: <20250321092451.17309-1-jgross@suse.com>

--------------1nuSvqvc0jIZgwarDdAcook4
Content-Type: multipart/mixed; boundary="------------CYFil5ptbogTSG3FLtieNw0r"

--------------CYFil5ptbogTSG3FLtieNw0r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGluZz8NCg0KT24gMjEuMDMuMjUgMTA6MjQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IEFk
ZCBiYXNpYyBrZXhlYyBzdXBwb3J0IHRvIE1pbmktT1MgZm9yIHJ1bm5pbmcgaW4geDg2IFBW
SCBtb2RlLg0KPiANCj4gV2l0aCB0aGlzIHNlcmllcyBhcHBsaWVkIGl0IGlzIHBvc3NpYmxl
IHRvIGFjdGl2YXRlIGFub3RoZXIga2VybmVsDQo+IGZyb20gd2l0aGluIE1pbmktT1MuDQo+
IA0KPiBSaWdodCBub3cgbm8gWGVuIHJlbGF0ZWQgdGVhcmRvd24gaXMgZG9uZSAoc28gbm8g
cmVzZXQgb2YgZ3JhbnQgdGFibGUsDQo+IGV2ZW50IGNoYW5uZWxzLCBQViBkZXZpY2VzKS4g
VGhlc2Ugc2hvdWxkIGJlIGFkZGVkIHZpYSBrZXhlYyBjYWxsYmFja3MNCj4gd2hpY2ggYXJl
IGFkZGVkIGFzIGEgZnJhbWV3b3JrLg0KPiANCj4gVGhpcyBpcyBhIG1ham9yIGJ1aWxkaW5n
IGJsb2NrIGZvciBzdXBwb3J0IG9mIFhlbnN0b3JlLXN0dWJkb20gbGl2ZQ0KPiB1cGRhdGUg
KGluIGZhY3QgSSd2ZSB0ZXN0ZWQgdGhlIGtleGVjIHBhdGggdG8gd29yayB1c2luZyB0aGUg
UFZIDQo+IHZhcmlhbnQgb2YgWGVuc3RvcmUtc3R1YmRvbSkuDQo+IA0KPiBKdWVyZ2VuIEdy
b3NzICgxMik6DQo+ICAgIGFkZCBrZXhlYyBmcmFtZXdvcmsNCj4gICAgTWluaS1PUzogYWRk
IGZpbmFsIGtleGVjIHN0YWdlDQo+ICAgIG1pbmktb3M6IGFkZCBlbGYuaA0KPiAgICBtaW5p
LW9zOiBhbmFseXplIG5ldyBrZXJuZWwgZm9yIGtleGVjDQo+ICAgIG1pbmktb3M6IGtleGVj
OiBmaW5hbGl6ZSBwYXJhbWV0ZXIgbG9jYXRpb24gYW5kIHNpemUNCj4gICAgbWluaS1vczog
cmVzZXJ2ZSBtZW1vcnkgYmVsb3cgYm91bmRhcnkNCj4gICAgbWluaS1vczoga2V4ZWM6IGJ1
aWxkIHBhcmFtZXRlcnMgZm9yIG5ldyBrZXJuZWwNCj4gICAgbWluaS1vczoga2V4ZWM6IG1v
dmUgdXNlZCBwYWdlcyBhd2F5IGZvciBuZXcga2VybmVsDQo+ICAgIE1pbmktT1M6IG1tOiBj
aGFuZ2Ugc2V0X3JlYWRvbmx5KCkgdG8gY2hhbmdlX3JlYWRvbmx5KCkNCj4gICAgTWluaS1P
Uzoga2V4ZWM6IHN3aXRjaCByZWFkLW9ubHkgYXJlYSB0byBiZSB3cml0YWJsZSBhZ2Fpbg0K
PiAgICBtaW5pLW9zOiBrZXhlYzogYWRkIGtleGVjIGNhbGxiYWNrIGZ1bmN0aW9uYWxpdHkN
Cj4gICAgbWluaS1vczoga2V4ZWM6IGRvIHRoZSBmaW5hbCBrZXhlYyBzdGVwDQo+IA0KPiAg
IENvbmZpZy5tayAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gICBNYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICB8ICAgMSArDQo+ICAgYXJjaC94ODYva2V4ZWMuYyAgICAgICAgICAg
fCAyNzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICBhcmNoL3g4Ni9taW5p
b3MteDg2Lmxkcy5TICB8ICAxNiArKw0KPiAgIGFyY2gveDg2L21tLmMgICAgICAgICAgICAg
IHwgMjM4ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+ICAgYXJjaC94ODYvdGVzdGJ1
aWxkL2FsbC1ubyAgfCAgIDEgKw0KPiAgIGFyY2gveDg2L3Rlc3RidWlsZC9hbGwteWVzIHwg
ICAyICsNCj4gICBhcmNoL3g4Ni90ZXN0YnVpbGQva2V4ZWMgICB8ICAgNCArDQo+ICAgYXJj
aC94ODYveDg2X2h2bS5TICAgICAgICAgfCAgNDYgKysrKysNCj4gICBpbmNsdWRlL2VsZi5o
ICAgICAgICAgICAgICB8IDM0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+ICAgaW5jbHVkZS9rZXhlYy5oICAgICAgICAgICAgfCAgNjMgKysrKysrKw0KPiAg
IGluY2x1ZGUvbW0uaCAgICAgICAgICAgICAgIHwgICA4ICsNCj4gICBpbmNsdWRlL3g4Ni9v
cy5oICAgICAgICAgICB8ICAgNSArDQo+ICAga2V4ZWMuYyAgICAgICAgICAgICAgICAgICAg
fCAyNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgbW0uYyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgODkgKysrKysrKysrLQ0KPiAgIDE1IGZpbGVzIGNoYW5nZWQsIDEy
ODkgaW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gveDg2L2tleGVjLmMNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC94ODYv
dGVzdGJ1aWxkL2tleGVjDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZWxmLmgN
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9rZXhlYy5oDQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGtleGVjLmMNCj4gDQoNCg==
--------------CYFil5ptbogTSG3FLtieNw0r
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------CYFil5ptbogTSG3FLtieNw0r--

--------------1nuSvqvc0jIZgwarDdAcook4--

--------------9t1pxHRHl1XxBzO4BxzU8OQl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgbWQAFAwAAAAAACgkQsN6d1ii/Ey9S
UQf9ESMFpK2vy7i6gIXSwBc6KQcqKgjuvyQUmLmSEM6yIsNrRlIuQjofjbpkDlCvTwViMtWRjMoi
SEA5PLU4NEBUMC6QRgS/Zz/Vigy0J3m4QYefoLAXu6FJaoKw1+w1MEf5wL6WRg+JcRDgwTkhdMz7
xAcaJEGeXBTw7u6Zbk38gT5kuzoubltCvmrv12Qgwb1QJoZYnXeMcrEny2pnIWkJ5kPGw8bVksfv
aTUCVUCE8AykpWRCEbNAXTRfcY6egoQms2T8Bcqo8fXWj410msS3mBFHZQLhNVv1ovKZceEUPEoN
xjPFVyYXD9SK80g/Y5L37mUVyY2MGKyFNSPWQ1L6Kg==
=H4l7
-----END PGP SIGNATURE-----

--------------9t1pxHRHl1XxBzO4BxzU8OQl--

