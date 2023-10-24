Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C76A87D47C3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 08:53:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621692.968410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvBIB-0001cp-Bc; Tue, 24 Oct 2023 06:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621692.968410; Tue, 24 Oct 2023 06:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvBIB-0001aG-90; Tue, 24 Oct 2023 06:53:31 +0000
Received: by outflank-mailman (input) for mailman id 621692;
 Tue, 24 Oct 2023 06:53:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CJyy=GG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qvBI9-0001aA-7v
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 06:53:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 083111ce-723a-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 08:53:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D7EF021B7A;
 Tue, 24 Oct 2023 06:53:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8823B1391C;
 Tue, 24 Oct 2023 06:53:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WQxvH+VpN2UKMAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 24 Oct 2023 06:53:25 +0000
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
X-Inumbo-ID: 083111ce-723a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698130405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4aw1OVLdeFc0pgyYBWBV08Sb9D5SfDWdwHWzf2lfCC8=;
	b=Uddk1vDYZ69rlxjqtq4W3pMAsUSn7HrLb3AOTcwO5fDo+WVTKCSmI4BvmdAAybakrUwYKN
	PloKm//noXJQgw6wEeMYchqyALOr7b0gotnJjZuLcU+xwEYwOA+ryo+r7ZU578L97WMVNP
	KD9muv9QmQtZRnubFpbhgnf+XD+dTlo=
Message-ID: <c75a3d53-fc36-46a6-b781-f16e1e5c6226@suse.com>
Date: Tue, 24 Oct 2023 08:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Lockdep show 6.6-rc regression in Xen HVM CPU hotplug
To: David Woodhouse <dwmw2@infradead.org>,
 xen-devel <xen-devel@lists.xenproject.org>, paulmck <paulmck@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <b28fff67f7501e4713af9b8c777f853cc44d6c6f.camel@infradead.org>
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
In-Reply-To: <b28fff67f7501e4713af9b8c777f853cc44d6c6f.camel@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eHYIw0CQB2nd1T1Vs5N9WkX6"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.97
X-Spamd-Result: default: False [-7.97 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-2.98)[99.92%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 TO_DN_ALL(0.00)[];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eHYIw0CQB2nd1T1Vs5N9WkX6
Content-Type: multipart/mixed; boundary="------------lKjFHR7NYXHM1rUa6ytStqo9";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>,
 xen-devel <xen-devel@lists.xenproject.org>, paulmck <paulmck@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Message-ID: <c75a3d53-fc36-46a6-b781-f16e1e5c6226@suse.com>
Subject: Re: Lockdep show 6.6-rc regression in Xen HVM CPU hotplug
References: <b28fff67f7501e4713af9b8c777f853cc44d6c6f.camel@infradead.org>
In-Reply-To: <b28fff67f7501e4713af9b8c777f853cc44d6c6f.camel@infradead.org>

--------------lKjFHR7NYXHM1rUa6ytStqo9
Content-Type: multipart/mixed; boundary="------------uUUbE0Bo5hmPLuaFbJubX9hr"

--------------uUUbE0Bo5hmPLuaFbJubX9hr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMTAuMjMgMjI6NTAsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToNCj4gU2luY2UgY29t
bWl0IDg3Nzk3ZmFkNmNjZSAoInhlbi9ldmVudHM6IHJlcGxhY2UgZXZ0Y2huX3J3bG9jayB3
aXRoDQo+IFJDVSIpLCBJIGNhbiBubyBsb25nZXIgaG90cGx1ZyBDUFVzIHVuZGVyIFhlbiB3
aXRoIGxvY2tkZXAgZW5hYmxlZC4NCj4gDQo+IChUaGlzIGlzIHJlYWwgWGVuIDQuMTcuMTsg
YW5ub3lpbmdseSBJIGhhdmUgZGlmZmVyZW50IGZhaWx1cmUgbW9kZXMNCj4gd2l0aCBYZW4g
Z3Vlc3RzIHVuZGVyIHFlbXUva3ZtIGFuZCBJJ2xsIGRlYWwgd2l0aCB0aG9zZSBuZXh0LikN
Cj4gDQo+IE9mZmxpbmluZyBjb21wbGFpbnMgdGh1czoNCj4gDQo+IFtyb290QGxvY2FsaG9z
dCBjcHUxXSMgZWNobyAwID4gb25saW5lDQo+IFsgICA1Mi45MzYyNjVdDQo+IFsgICA1Mi45
MzYyNzFdID09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IFsgICA1Mi45MzYyNzRd
IFdBUk5JTkc6IHN1c3BpY2lvdXMgUkNVIHVzYWdlDQo+IFsgICA1Mi45MzYyNzddIDYuNi4w
LXJjNSsgIzEzNTcgTm90IHRhaW50ZWQNCj4gWyAgIDUyLjkzNjI4MF0gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gWyAgIDUyLjkzNjI4Ml0gbGliL21hcGxlX3RyZWUuYzo4
NTYgc3VzcGljaW91cyByY3VfZGVyZWZlcmVuY2VfY2hlY2soKSB1c2FnZSENCj4gWyAgIDUy
LjkzNjI4N10NCj4gWyAgIDUyLjkzNjI4N10gb3RoZXIgaW5mbyB0aGF0IG1pZ2h0IGhlbHAg
dXMgZGVidWcgdGhpczoNCj4gWyAgIDUyLjkzNjI4N10NCj4gWyAgIDUyLjkzNjI4OV0NCj4g
WyAgIDUyLjkzNjI4OV0gUkNVIHVzZWQgaWxsZWdhbGx5IGZyb20gb2ZmbGluZSBDUFUhDQo+
IFsgICA1Mi45MzYyODldIHJjdV9zY2hlZHVsZXJfYWN0aXZlID0gMiwgZGVidWdfbG9ja3Mg
PSAxDQo+IFsgICA1Mi45MzYyOTNdIDEgbG9jayBoZWxkIGJ5IHN3YXBwZXIvMS8wOg0KPiBb
ICAgNTIuOTM2Mjk2XSAgIzA6IGZmZmZmZmZmODljMDM4MjAgKHJjdV9yZWFkX2xvY2spey4u
Li59LXsxOjN9LCBhdDogbXRyZWVfbG9hZCsweDkwLzB4NTkwDQo+IFsgICA1Mi45MzYzMjFd
DQo+IFsgICA1Mi45MzYzMjFdIHN0YWNrIGJhY2t0cmFjZToNCj4gWyAgIDUyLjkzNjMyNF0g
Q1BVOiAxIFBJRDogMCBDb21tOiBzd2FwcGVyLzEgTm90IHRhaW50ZWQgNi42LjAtcmM1KyAj
MTM1Nw0KPiBbICAgNTIuOTM2MzI5XSBIYXJkd2FyZSBuYW1lOiBYZW4gSFZNIGRvbVUsIEJJ
T1MgNC4xNy4xIDA5LzI2LzIwMjMNCj4gWyAgIDUyLjkzNjMzMl0gQ2FsbCBUcmFjZToNCj4g
WyAgIDUyLjkzNjMzNV0gIDxUQVNLPg0KPiBbICAgNTIuOTM2MzQwXSAgZHVtcF9zdGFja19s
dmwrMHg1Yi8weDkwDQo+IFsgICA1Mi45MzYzNTBdICBsb2NrZGVwX3JjdV9zdXNwaWNpb3Vz
KzB4MTVhLzB4MWMwDQo+IFsgICA1Mi45MzYzNjZdICBtdHJlZV9sb2FkKzB4NDllLzB4NTkw
DQo+IFsgICA1Mi45MzYzODVdICBpcnFfZ2V0X2lycV9kYXRhKzB4ZS8weDIwDQo+IFsgICA1
Mi45MzYzOTRdICB4ZW5fc2VuZF9JUElfb25lKzB4YTQvMHgxMDANCj4gWyAgIDUyLjkzNjQw
NF0gIF9feGVuX3NlbmRfSVBJX21hc2srMHgxYi8weDUwDQo+IFsgICA1Mi45MzY0MTRdICBn
ZW5lcmljX2V4ZWNfc2luZ2xlKzB4MzUvMHgxYzANCj4gWyAgIDUyLjkzNjQyM10gIHNtcF9j
YWxsX2Z1bmN0aW9uX3NpbmdsZSsweGMyLzB4MTQwDQo+IFsgICA1Mi45MzY0MzZdICA/IGNw
dWhwX3JlcG9ydF9pZGxlX2RlYWQrMHg0Mi8weDYwDQo+IFsgICA1Mi45MzY0NDRdICBkb19p
ZGxlKzB4ZGEvMHhlMA0KPiBbICAgNTIuOTM2NDUxXSAgY3B1X3N0YXJ0dXBfZW50cnkrMHgy
YS8weDMwDQo+IFsgICA1Mi45MzY0NTZdICBzdGFydF9zZWNvbmRhcnkrMHgxMjMvMHgxNDAN
Cj4gWyAgIDUyLjkzNjQ2NV0gIHNlY29uZGFyeV9zdGFydHVwXzY0X25vX3ZlcmlmeSsweDE3
OC8weDE3Yg0KPiBbICAgNTIuOTM2NDkwXSAgPC9UQVNLPg0KDQpJJ20gcHV6emxlZC4gVGhp
cyBwYXRoIGRvZXNuJ3QgY29udGFpbiBhbnkgb2YgdGhlIFJDVSB1c2FnZSBJJ3ZlIGFkZGVk
IGluDQpjb21taXQgODc3OTdmYWQ2Y2NlLg0KDQpBcmUgeW91IHN1cmUgdGhhdCB3aXRoIGp1
c3QgcmV2ZXJ0aW5nIGNvbW1pdCA4Nzc5N2ZhZDZjY2UgdGhlIGlzc3VlIGRvZXNuJ3QNCm1h
bmlmZXN0IGFueW1vcmU/IEknZCByYXRoZXIgZXhwZWN0IGNvbW1pdCA3MjEyNTViOTgyNmIg
aGF2aW5nIGNhdXNlZCB0aGlzDQpiZWhhdmlvciwganVzdCB0ZWxsaW5nIGZyb20gdGhlIG1l
c3NhZ2VzIGFib3ZlLg0KDQoNCkp1ZXJnZW4NCg==
--------------uUUbE0Bo5hmPLuaFbJubX9hr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------uUUbE0Bo5hmPLuaFbJubX9hr--

--------------lKjFHR7NYXHM1rUa6ytStqo9--

--------------eHYIw0CQB2nd1T1Vs5N9WkX6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmU3aeUFAwAAAAAACgkQsN6d1ii/Ey9h
/AgAjjEeb1/372jHt11lm2l777ees42Tmb+GiTrmWTelSdjFvT25OAn9JOgWNUMHGD7TCI6vHTRs
yXKxOMBQhAg6MeCArZrJJjYAE0PxB1Hp/v4dlNvC+6P+Zu7+X1653IS1dxM+J+doC4vhVpUKgZ1d
klieE26x04VbVSikAa8tZiEFbwL5uaKXnH8eGwrSiWgRwQ6DZHLv3Ji1bFIrzcWKpSdRH62vPbNW
ZnkAZ7f++8fdTBVv917qi+mjg3EcrNfp3K5grVtwP7lq74EE4P7WQSLCuDtHwiZ8X0/4mjDP43u3
eiT/tpau2GHXteBr+2C5gYNAhMMdaM4MN4tzY3vz8A==
=Jd5+
-----END PGP SIGNATURE-----

--------------eHYIw0CQB2nd1T1Vs5N9WkX6--

