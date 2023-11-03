Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035CF7DFF6E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 08:38:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627087.978004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyokJ-0004YY-T1; Fri, 03 Nov 2023 07:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627087.978004; Fri, 03 Nov 2023 07:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyokJ-0004Vn-QP; Fri, 03 Nov 2023 07:37:35 +0000
Received: by outflank-mailman (input) for mailman id 627087;
 Fri, 03 Nov 2023 07:37:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jk6d=GQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qyokH-0004UT-Kp
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 07:37:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8f028ba-7a1b-11ee-98d7-6d05b1d4d9a1;
 Fri, 03 Nov 2023 08:37:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE5FE2188B;
 Fri,  3 Nov 2023 07:37:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C87FD13907;
 Fri,  3 Nov 2023 07:37:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kO3zLjujRGXyPgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 03 Nov 2023 07:37:31 +0000
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
X-Inumbo-ID: d8f028ba-7a1b-11ee-98d7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698997051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RNZj5b6E7O2waT3iIX8xiP4PnSvF74nYVJ1yWqtxz1g=;
	b=CbaukewniaD8v7+cDdwhG66fpoHfYaSTL7TVW8qwmF/HAFTXjle9b8NA0BJ3J2TQhaSVdq
	IfS7uz4s+K2RYMApJfO9Is1UxGkXn0C9nqexGFzJCOB9ePwdFqp4A4rXHOX7T7QAw/Phko
	ffD1Br/gAYDyNdbzsIpaLKAzHtPg77w=
Message-ID: <0dff5b9e-7b37-48cc-a701-3f5b0fc8575c@suse.com>
Date: Fri, 3 Nov 2023 08:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/29] tools/xenlogd: connect to frontend
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-4-jgross@suse.com>
 <CAKf6xptkUPBSTsij=CAWaiYxTCtGH4zpZWiLuvb=teX3i_sjrA@mail.gmail.com>
 <30b8cb38-ecc8-4d4e-bf18-512e893de153@suse.com>
 <CAKf6xpumCFYor9uE8Km2M24vvpko4RmA+Vm-qRdLoFLCkxmhfw@mail.gmail.com>
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
In-Reply-To: <CAKf6xpumCFYor9uE8Km2M24vvpko4RmA+Vm-qRdLoFLCkxmhfw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CTdw9ol59GQ8Fbdq0K5hcLRa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CTdw9ol59GQ8Fbdq0K5hcLRa
Content-Type: multipart/mixed; boundary="------------vPT9LrhCysISvG0WXM1UYq9s";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <0dff5b9e-7b37-48cc-a701-3f5b0fc8575c@suse.com>
Subject: Re: [PATCH 03/29] tools/xenlogd: connect to frontend
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-4-jgross@suse.com>
 <CAKf6xptkUPBSTsij=CAWaiYxTCtGH4zpZWiLuvb=teX3i_sjrA@mail.gmail.com>
 <30b8cb38-ecc8-4d4e-bf18-512e893de153@suse.com>
 <CAKf6xpumCFYor9uE8Km2M24vvpko4RmA+Vm-qRdLoFLCkxmhfw@mail.gmail.com>
In-Reply-To: <CAKf6xpumCFYor9uE8Km2M24vvpko4RmA+Vm-qRdLoFLCkxmhfw@mail.gmail.com>

--------------vPT9LrhCysISvG0WXM1UYq9s
Content-Type: multipart/mixed; boundary="------------waHWLFgLrOm09nnv31zfGGsX"

--------------waHWLFgLrOm09nnv31zfGGsX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMTEuMjMgMDI6NDIsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFRodSwgTm92
IDIsIDIwMjMgYXQgNDoyM+KAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gT24gMDEuMTEuMjMgMjA6MjEsIEphc29uIEFuZHJ5dWsgd3JvdGU6
DQo+Pj4gT24gV2VkLCBOb3YgMSwgMjAyMyBhdCA1OjM04oCvQU0gSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4NCj4+Pj4gQWRkIHRoZSBjb2RlIGZvciBj
b25uZWN0aW5nIHRvIGZyb250ZW5kcyB0byB4ZW5sb2dkLg0KPj4+Pg0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4NCj4+Pj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3hlbmxvZ2QveGVubG9nZC5jIGIvdG9vbHMveGVubG9nZC94ZW5s
b2dkLmMNCj4+Pj4gaW5kZXggNzkyZDEwMjZhMy4uZGEwYTA5YTEyMiAxMDA2NDQNCj4+Pj4g
LS0tIGEvdG9vbHMveGVubG9nZC94ZW5sb2dkLmMNCj4+Pj4gKysrIGIvdG9vbHMveGVubG9n
ZC94ZW5sb2dkLmMNCj4+Pg0KPj4+PiArc3RhdGljIHZvaWQgY29ubmVjdF9kZXZpY2UoZGV2
aWNlICpkZXZpY2UpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgdW5zaWduZWQgaW50IHZhbDsNCj4+
Pj4gKyAgICB4ZW5ldnRjaG5fcG9ydF9vcl9lcnJvcl90IGV2dGNobjsNCj4+PiAxLj4gKw0K
Pj4+PiArICAgIHZhbCA9IHJlYWRfZnJvbnRlbmRfbm9kZV91aW50KGRldmljZSwgInZlcnNp
b24iLCAwKTsNCj4+Pj4gKyAgICBpZiAoIHZhbCAhPSAxICkNCj4+Pj4gKyAgICAgICAgcmV0
dXJuIGNvbm5lY3RfZXJyKGRldmljZSwgImZyb250ZW5kIHNwZWNpZmllcyBpbGxlZ2FsIHZl
cnNpb24iKTsNCj4+Pj4gKyAgICB2YWwgPSByZWFkX2Zyb250ZW5kX25vZGVfdWludChkZXZp
Y2UsICJudW0tcmluZ3MiLCAwKTsNCj4+Pj4gKyAgICBpZiAoIHZhbCAhPSAxICkNCj4+Pj4g
KyAgICAgICAgcmV0dXJuIGNvbm5lY3RfZXJyKGRldmljZSwgImZyb250ZW5kIHNwZWNpZmll
cyBpbGxlZ2FsIHJpbmcgbnVtYmVyIik7DQo+Pj4NCj4+PiBMaW51eCB1c2VzIDIgcmluZ3Mg
KFhFTl85UEZTX05VTV9SSU5HUyksIGFuZCBpdCBkb2Vzbid0IGNvbm5lY3Qgd2hlbg0KPj4+
IG1heC1yaW5ncyBpcyBsZXNzIHRoYW4gdGhhdC4NCj4+Pg0KPj4+IG1heF9yaW5ncyA9IHhl
bmJ1c19yZWFkX3Vuc2lnbmVkKGRldi0+b3RoZXJlbmQsICJtYXgtcmluZ3MiLCAwKTsNCj4+
PiBpZiAobWF4X3JpbmdzIDwgWEVOXzlQRlNfTlVNX1JJTkdTKQ0KPj4+ICAgICAgIHJldHVy
biAtRUlOVkFMOw0KPj4+DQo+Pj4gbmV3X2RldmljZSgpIHdyaXRlcyBtYXgtcmluZ3MgYXMg
MS4gIFNvIHRoaXMgd29ya3MgZm9yIG1pbmktb3MsIGJ1dA0KPj4+IG5vdCBMaW51eC4gIEkn
bSBub3QgcmVxdWVzdGluZyB5b3UgdG8gY2hhbmdlIGl0IC0ganVzdCBub3RpbmcgaXQuDQo+
Pg0KPj4gVGhhbmtzIGZvciB0aGUgbm90ZS4gSSdsbCBjaGFuZ2UgaXQgdG8gYWxsb3cgbW9y
ZSByaW5ncy4NCj4gDQo+IEknbSBoYXBweSB0byB3b3JrIG9uIExpbnV4IGNvbXBhdGliaWxp
dHkgYXMgYSBmb2xsb3cgdXAsIGlmIHlvdSBqdXN0DQo+IHdhbnQgdG8gZm9jdXMgb24geW91
ciBNaW5pLU9TIHVzZSBjYXNlLg0KDQpUaGFua3MsIGJ1dCBJIHRoaW5rIHRoaXMgc2hvdWxk
IGJlIHBhcnQgb2YgdGhlIGluaXRpYWwgc2VyaWVzLg0KDQoNCkp1ZXJnZW4NCg==
--------------waHWLFgLrOm09nnv31zfGGsX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------waHWLFgLrOm09nnv31zfGGsX--

--------------vPT9LrhCysISvG0WXM1UYq9s--

--------------CTdw9ol59GQ8Fbdq0K5hcLRa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVEozsFAwAAAAAACgkQsN6d1ii/Ey81
OggAh/0KlugCglJfzISbobf49dQkr/wKpp83PtWoet8kQNWNbaBDAzZ+TrZdBuHVkb3ltar2yA0i
9DhBwJk5djSntDkRCPCdnO1yDMj3MBx42Ea8hZlfo4IUVDYRG2s1p4cCoXKBAknk/iQmH3O/22ys
gQiIbI0ISYluUcNPIVRyB1jko6X8JnzlkJa5Higoll84rgPiVCRbZry1/wNrtVDF239rdrLdI7Rv
SfAHjaZFPHBxl33wN/8XihfP2hhdSYrDt29IM3JlNkRjpY8zRhRDUBtzw9WIbbxX6bMEEbaSzHJX
8syoCP2o6c1rGa7A8ocZ/ezHFi0yEHEc/dZeuGueCA==
=o0XC
-----END PGP SIGNATURE-----

--------------CTdw9ol59GQ8Fbdq0K5hcLRa--

