Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C12B0BF27
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 10:39:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051186.1419504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udm2t-0001Ai-J2; Mon, 21 Jul 2025 08:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051186.1419504; Mon, 21 Jul 2025 08:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udm2t-00017c-GE; Mon, 21 Jul 2025 08:38:51 +0000
Received: by outflank-mailman (input) for mailman id 1051186;
 Mon, 21 Jul 2025 08:38:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y65U=2C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1udm2s-00016n-W9
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 08:38:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f63a4ab-660e-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 10:38:49 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD2C921990;
 Mon, 21 Jul 2025 08:38:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F76A13A88;
 Mon, 21 Jul 2025 08:38:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rk5WIZb8fWjWdQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 21 Jul 2025 08:38:46 +0000
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
X-Inumbo-ID: 1f63a4ab-660e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753087127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=juBdV6h11RM4bYBFyQJPt9eFqSCmNvBeGkTZGrGAc6E=;
	b=XvoyGepbEr07sLrIVHhL18QidQee5//mm/Qz/BYXFqfkBL605uvL/SMS1uzRhBFO4kBEgI
	EggTnHdS+GJ0JwI1na48xLsZ8nLAgthOb5B2EtOQymmbSsOVjqLAw1FSKx22nUN6n3QQS8
	X0t0oLro0ftUTJqA4S/6v8PcLTCjXws=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753087126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=juBdV6h11RM4bYBFyQJPt9eFqSCmNvBeGkTZGrGAc6E=;
	b=OZOV1PV5TOkMeU9j3oftyvl5kJf0NnzO+Lc+18etrtA65lnDOyYXIFwQosraEOzxbL0Hpa
	GT6Xw0JtfnHoQweHyVXsqc3vfugI/KKCv0uTCuQILS2AJwWHueNwyXcOYhDG9iUinPx+c4
	M8AX6H8y8MfybgLhZRW2NB4/4LfjJ7M=
Message-ID: <a9c255fb-781c-43ce-a7f0-9aa8228e250c@suse.com>
Date: Mon, 21 Jul 2025 10:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Enable Xenstore-stubdom Live Update
To: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Julien Grall <julien@xen.org>
References: <20250702081305.14440-1-jgross@suse.com>
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
In-Reply-To: <20250702081305.14440-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0ch5WAIEBKxAxdvfKptC8Of9"
X-Spam-Level: 
X-Spamd-Result: default: False [-5.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -5.20

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0ch5WAIEBKxAxdvfKptC8Of9
Content-Type: multipart/mixed; boundary="------------ujSRj0FGp0HfSh4LnfgAl5Pg";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Julien Grall <julien@xen.org>
Message-ID: <a9c255fb-781c-43ce-a7f0-9aa8228e250c@suse.com>
Subject: Re: [PATCH 0/9] Enable Xenstore-stubdom Live Update
References: <20250702081305.14440-1-jgross@suse.com>
In-Reply-To: <20250702081305.14440-1-jgross@suse.com>

--------------ujSRj0FGp0HfSh4LnfgAl5Pg
Content-Type: multipart/mixed; boundary="------------ki9r81DApO6rrwYAoEC0Qzfj"

--------------ki9r81DApO6rrwYAoEC0Qzfj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW50aG9ueSwNCg0KY291bGQgeW91IHBsZWFzZSBoYXZlIGEgbG9vayBhdCBwYXRjaGVzIDMs
IDQgYW5kIDc/IFRoZXkgYXJlIGxhY2tpbmcgYQ0KdG9vbHMgbWFpbnRhaW5lcidzIGNvbW1l
bnQuDQoNCg0KSnVlcmdlbg0KDQpPbiAwMi4wNy4yNSAxMDoxMiwgSnVlcmdlbiBHcm9zcyB3
cm90ZToNCj4gV2l0aCB0aGlzIHNlcmllcyBhcHBsaWVkIEkgd2FzIGFibGUgdG8gcGVyZm9y
bSBMaXZlIFVwZGF0ZSBvZiBYZW5zdG9yZQ0KPiBydW5uaW5nIGluIGEgUFZIIHN0dWJkb20u
DQo+IA0KPiBUaGlzIHNlcmllcyBpcyBiYXNlZCBvbiBhIHJlbGF0ZWQgTWluaS1PUyBwYXRj
aCBzZXJpZXMgQU5EIGl0IG5lZWRzDQo+IHRoZSBNaW5pLU9TIGNvbW1pdCBpZCB1cGRhdGVk
IGFjY29yZGluZ2x5IGluIENvbmZpZy5tay4NCj4gDQo+IE9uZSByZWxldmFudCBjaGFuZ2Ug
aW4gdGhpcyBzZXJpZXMgaXMgaG93IHRoZSBYZW5zdG9yZSBzdGF0ZSBpcyBiZWluZw0KPiBy
ZWFkIGFmdGVyIGFjdGl2YXRpbmcgdGhlIG5ldyBiaW5hcnkuIEluc3RlYWQgb2YgdXNpbmcg
bW1hcCgpIHRoZQ0KPiBzdGF0ZSByZWNvcmRzIGFyZSByZWFkIG9uZSBieSBvbmUgdmlhIGZy
ZWFkKCkuIFRoaXMgbWlnaHQgaGF2ZSBhDQo+IHNtYWxsIHBlcmZvcm1hbmNlIGltcGFjdCBm
b3IgdGhlIGRhZW1vbiBsaXZlIHVwZGF0ZSBjYXNlLCBidXQgaXQNCj4gc2hvdWxkIGJlIG5l
Z2xlY3RhYmxlLg0KPiANCj4gSnVlcmdlbiBHcm9zcyAoOSk6DQo+ICAgIHN0dWJkb206IGNv
bmZpZ3VyZSBrZXhlYyBmb3IgUFZIIFhlbnN0b3JlIHN0dWJkb20NCj4gICAgdG9vbHMveGVu
c3RvcmU6IHBlcmZvcm0ga2V4ZWMgZm9yIHN0dWJkb20gbGl2ZSB1cGRhdGUNCj4gICAgbGli
ZXZ0Y2huOiBhZGQgT19DTE9FWEVDIHN1cHBvcnQgZm9yIE1pbmktT1MNCj4gICAgbGlieGVu
Z250dGFiOiBzZXQgdGhlIGNsb2V4ZWMgZmxhZyBvbiBNaW5pLU9TDQo+ICAgIHhlbnN0b3Jl
ZDogdXNlIHJlYWQoKSBpbnN0ZWFkIG9mIG1tYXAoKSBmb3IgcmVhZGluZyBsaXZlIHVwZGF0
ZSBzdGF0ZQ0KPiAgICB4ZW5zdG9yZWQ6IGRvbid0IHVzZSB4ZW5ldnRjaG5fZmRvcGVuKCkg
aW4gc3R1YmRvbQ0KPiAgICB0b29scy9saWJ4ZW5ldnRjaG46IGFkZCB4ZW5ldnRjaG5fYmlu
ZCgpIHVuZGVyIE1pbmktT1MNCj4gICAgeGVuc3RvcmVkOiByZWJpbmQgZXZlbnQgY2hhbm5l
bHMgYWZ0ZXIgbGl2ZSB1cGRhdGUgaW4gc3R1YmRvbQ0KPiAgICB0b29scy94ZW5zdG9yZWQ6
IG1ha2Ugc3R1YmRvbV9pbml0KCkgbGl2ZSB1cGRhdGUgYXdhcmUNCj4gDQo+ICAgc3R1YmRv
bS94ZW5zdG9yZXB2aC1taW5pb3MuY2ZnIHwgIDIgKw0KPiAgIHRvb2xzL2luY2x1ZGUveGVu
ZXZ0Y2huLmggICAgICB8IDExICsrKysNCj4gICB0b29scy9saWJzL2V2dGNobi9taW5pb3Mu
YyAgICAgfCAyMyArKysrKysrLS0NCj4gICB0b29scy9saWJzL2dudHRhYi9taW5pb3MuYyAg
ICAgfCAgMSArDQo+ICAgdG9vbHMveGVuc3RvcmVkL2NvcmUuYyAgICAgICAgIHwgIDUgKy0N
Cj4gICB0b29scy94ZW5zdG9yZWQvY29yZS5oICAgICAgICAgfCAxMyArKysrLQ0KPiAgIHRv
b2xzL3hlbnN0b3JlZC9kb21haW4uYyAgICAgICB8IDI1ICsrKysrLS0tLQ0KPiAgIHRvb2xz
L3hlbnN0b3JlZC9kb21haW4uaCAgICAgICB8ICAyICstDQo+ICAgdG9vbHMveGVuc3RvcmVk
L2x1LmMgICAgICAgICAgIHwgOTMgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LQ0KPiAgIHRvb2xzL3hlbnN0b3JlZC9sdV9taW5pb3MuYyAgICB8IDMzICsrKysrKysrKysr
LQ0KPiAgIHRvb2xzL3hlbnN0b3JlZC9taW5pb3MuYyAgICAgICB8IDIyICsrKysrKy0tDQo+
ICAgdG9vbHMveGVuc3RvcmVkL3Bvc2l4LmMgICAgICAgIHwgMTAgKysrKw0KPiAgIDEyIGZp
bGVzIGNoYW5nZWQsIDE4MyBpbnNlcnRpb25zKCspLCA1NyBkZWxldGlvbnMoLSkNCj4gDQoN
Cg==
--------------ki9r81DApO6rrwYAoEC0Qzfj
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ki9r81DApO6rrwYAoEC0Qzfj--

--------------ujSRj0FGp0HfSh4LnfgAl5Pg--

--------------0ch5WAIEBKxAxdvfKptC8Of9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh9/JUFAwAAAAAACgkQsN6d1ii/Ey+W
WAf/WmbotZBF33ZEuRcJ3zrJdZ/+0TuXJOoG00UPrcXuI5fwdH3KVBLRRQWS2Fhb6i4ZMMkc0iXA
V3+GxR1nxwVIaCPPS97i7/x62HMMEwNGSi2hdfpT3VNqhkqbIZv1yN8A9ggtcQzRE1lgmjAx/Euf
5hsRw3pbid0JLUajgyV0jvcpXSE6ygNK9TQL9cPyvsJTSIyDvZ6y42jzdsTGO3QcLBKBqEa1t2Go
bgugtgm38Oy1lcsYu1LeLBf5GK+c6Tp6GwtEg4NQFnqkVLwuCMdA25aS2cJseGAEcgLsHl7UXgUE
RK9OhIKxexhJaOqtXuvingELhhhHgA0UPyFv6qPmnQ==
=1dT1
-----END PGP SIGNATURE-----

--------------0ch5WAIEBKxAxdvfKptC8Of9--

