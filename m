Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5D47E3577
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 08:04:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628586.980206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0G7Y-0000Qf-VU; Tue, 07 Nov 2023 07:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628586.980206; Tue, 07 Nov 2023 07:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0G7Y-0000P0-RB; Tue, 07 Nov 2023 07:03:32 +0000
Received: by outflank-mailman (input) for mailman id 628586;
 Tue, 07 Nov 2023 07:03:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ht7K=GU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r0G7X-0000Nd-0d
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 07:03:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c041674f-7d3b-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 08:03:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 45EC922C69;
 Tue,  7 Nov 2023 07:03:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E7D1132FD;
 Tue,  7 Nov 2023 07:03:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9q75BT/hSWV2KQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Nov 2023 07:03:27 +0000
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
X-Inumbo-ID: c041674f-7d3b-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699340607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nz0ZoeivXbxcQetK7MURKdI9SaQjB8enap9dT0j7iaA=;
	b=TM8JSHUGxSRnCgMO2g8Kdhhejj2h+hOANctHS278XGZZJml/Jus1vGLingwEWJKvjmlYxz
	dy9SIgZKaUp0sRbKorHwyN4nwUYFO1OheEU9n1uNTGd5QXMcL707mvIvpWV8SflfjqZRof
	RuUxVGAw9QvBYjOuVXpVV3hBpUOuxD8=
Message-ID: <fa441108-1a84-47da-8070-baa3302f8216@suse.com>
Date: Tue, 7 Nov 2023 08:03:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/29] tools/xenlogd: add 9pfs open request support
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-10-jgross@suse.com>
 <CAKf6xpt44k5zVjeeYR3vaAxXXc0oMn=r0m+eKpa6KMB6idK-qw@mail.gmail.com>
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
In-Reply-To: <CAKf6xpt44k5zVjeeYR3vaAxXXc0oMn=r0m+eKpa6KMB6idK-qw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EDU76HeuOEHUjs7vUjSkclql"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EDU76HeuOEHUjs7vUjSkclql
Content-Type: multipart/mixed; boundary="------------3cDH7yUVj7JmIQj7wZGR2bw8";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <fa441108-1a84-47da-8070-baa3302f8216@suse.com>
Subject: Re: [PATCH 09/29] tools/xenlogd: add 9pfs open request support
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-10-jgross@suse.com>
 <CAKf6xpt44k5zVjeeYR3vaAxXXc0oMn=r0m+eKpa6KMB6idK-qw@mail.gmail.com>
In-Reply-To: <CAKf6xpt44k5zVjeeYR3vaAxXXc0oMn=r0m+eKpa6KMB6idK-qw@mail.gmail.com>

--------------3cDH7yUVj7JmIQj7wZGR2bw8
Content-Type: multipart/mixed; boundary="------------ofUivaIjDtwjUVJoouoel1I4"

--------------ofUivaIjDtwjUVJoouoel1I4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTEuMjMgMjA6MzMsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDEsIDIwMjMgYXQgNjoxM+KAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gQWRkIHRoZSBvcGVuIHJlcXVlc3Qgb2YgdGhlIDlwZnMgcHJvdG9j
b2wuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KPj4gLS0tDQo+PiAgIHRvb2xzL3hlbmxvZ2QvaW8uYyAgICAgIHwgMTMwICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgdG9vbHMveGVubG9n
ZC94ZW5sb2dkLmggfCAgIDQgKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMzQgaW5zZXJ0
aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5sb2dkL2lvLmMgYi90b29s
cy94ZW5sb2dkL2lvLmMNCj4+IGluZGV4IDc3OGUxZGMyYzkuLmMyYjI1OWY0MmUgMTAwNjQ0
DQo+PiAtLS0gYS90b29scy94ZW5sb2dkL2lvLmMNCj4+ICsrKyBiL3Rvb2xzL3hlbmxvZ2Qv
aW8uYw0KPiANCj4+IEBAIC03MzQsNiArNzQ1LDEyMSBAQCBzdGF0aWMgdm9pZCBwOV93YWxr
KGRldmljZSAqZGV2aWNlLCBzdHJ1Y3QgcDlfaGVhZGVyICpoZHIpDQo+PiAgICAgICBmcmVl
KG5hbWVzKTsNCj4+ICAgfQ0KPj4NCj4+ICtzdGF0aWMgaW50IG9wZW5fZmxhZ3NfZnJvbV9t
b2RlKHVpbnQ4X3QgbW9kZSkNCj4+ICt7DQo+PiArICAgIGludCBmbGFnczsNCj4+ICsNCj4+
ICsgICAgc3dpdGNoICggbW9kZSAmIFA5X09NT0RFTUFTSyApDQo+PiArICAgIHsNCj4+ICsg
ICAgY2FzZSBQOV9PUkVBRDoNCj4+ICsgICAgICAgIGZsYWdzID0gT19SRE9OTFk7DQo+PiAr
ICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgY2FzZSBQOV9PV1JJVEU6DQo+PiArICAg
ICAgICBmbGFncyA9IE9fV1JPTkxZOw0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiArDQo+PiAr
ICAgIGNhc2UgUDlfT1JEV1I6DQo+PiArICAgICAgICBmbGFncyA9IE9fUkRXUjsNCj4+ICsg
ICAgICAgIGJyZWFrOw0KPj4gKw0KPj4gKyAgICBkZWZhdWx0Og0KPj4gKyAgICAgICAgcmV0
dXJuIC0xOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIGlmICggbW9kZSAmIFA5X09UUlVO
QyApDQo+PiArICAgICAgICBmbGFncyB8PSBPX1RSVU5DOw0KPiANCj4gIiIiDQo+IEluIGFk
ZGl0aW9uLCBpZiBtb2RlIGhhcyB0aGUgT1RSVU5DICgweDEwKSBiaXQgc2V0LCB0aGUgZmls
ZSBpcyB0byBiZQ0KPiB0cnVuY2F0ZWQsIHdoaWNoIHJlcXVpcmVzIHdyaXRlIHBlcm1pc3Np
b24gKGlmIHRoZSBmaWxlIGlzDQo+IGFwcGVuZC1vbmx5LCBhbmQgcGVybWlzc2lvbiBpcyBn
cmFudGVkLCB0aGUgb3BlbiBzdWNjZWVkcyBidXQgdGhlIGZpbGUNCj4gd2lsbCBub3QgYmUg
dHJ1bi0gY2F0ZWQpOw0KPiAiIiINCj4gDQo+IFRoaXMgcmVsaWVzIG9uIGxpYmMgT19UUlVO
QyBoYW5kbGluZyAtIEkgdGhpbmsgdGhhdCBpcyBwcm9iYWJseSBiZXR0ZXINCj4gdGhhbiBz
b21ldGhpbmcgY3VzdG9tIHNvIHlvdSBnZXQgdGhlIGxpYmMgc2VtYW50aWNzLg0KDQpUaGF0
IHdhcyBteSB0aGlua2luZywgeWVzLg0KDQo+IA0KPj4gKw0KPj4gKyAgICByZXR1cm4gZmxh
Z3M7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgZ2V0X2lvdW5pdChk
ZXZpY2UgKmRldmljZSwgc3RydWN0IHN0YXQgKnN0KQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJu
IChkZXZpY2UtPm1heF9zaXplIC0gc3QtPnN0X2Jsa3NpemUpICYgfihzdC0+c3RfYmxrc2l6
ZSAtIDEpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBwOV9vcGVuKGRldmljZSAq
ZGV2aWNlLCBzdHJ1Y3QgcDlfaGVhZGVyICpoZHIpDQo+PiArew0KPj4gKyAgICB1aW50MzJf
dCBmaWQ7DQo+PiArICAgIHVpbnQ4X3QgbW9kZTsNCj4+ICsgICAgc3RydWN0IHA5X2ZpZCAq
ZmlkcDsNCj4+ICsgICAgc3RydWN0IHN0YXQgc3Q7DQo+PiArICAgIHN0cnVjdCBwOV9xaWQg
cWlkOw0KPj4gKyAgICB1aW50MzJfdCBpb3VuaXQ7DQo+PiArICAgIGludCBmbGFnczsNCj4+
ICsgICAgaW50IHJldDsNCj4+ICsNCj4+ICsgICAgcmV0ID0gZmlsbF9kYXRhKGRldmljZSwg
IlViIiwgJmZpZCwgJm1vZGUpOw0KPj4gKyAgICBpZiAoIHJldCAhPSAyICkNCj4+ICsgICAg
ew0KPj4gKyAgICAgICAgcDlfZXJyb3IoZGV2aWNlLCBoZHItPnRhZywgRUlOVkFMKTsNCj4+
ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKyAgICBpZiAoIG1vZGUgJiB+KFA5
X09NT0RFTUFTSyB8IFA5X09UUlVOQyB8IFA5X09SRU1PVkUpICkNCj4+ICsgICAgew0KPj4g
KyAgICAgICAgcDlfZXJyb3IoZGV2aWNlLCBoZHItPnRhZywgRUlOVkFMKTsNCj4+ICsgICAg
ICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBmaWRwID0gZmluZF9maWQo
ZGV2aWNlLCBmaWQpOw0KPj4gKyAgICBpZiAoICFmaWRwICkNCj4+ICsgICAgew0KPj4gKyAg
ICAgICAgcDlfZXJyb3IoZGV2aWNlLCBoZHItPnRhZywgRU5PRU5UKTsNCj4gDQo+IElmIHRo
ZSBob3N0X3BhdGggcG9pbnRzIGF0IGEgcG9wdWxhdGVkIGRpcmVjdG9yeSwgdGhlcmUgaXMg
bm90aGluZw0KPiB0aGF0IHBvcHVsYXRlcyB0aGUgZmlkcyBmb3IgcHJlLWV4aXN0aW5nIGZp
bGVzIGFuZCBkaXJlY3Rvcmllcz8gIFNvDQo+IHRob3NlIGZpbGVzIGNhbm5vdCBiZSBvcGVu
ZWQ/ICBJIGd1ZXNzIHRoYXQncyBub3QgbmVlZGVkIGZvcg0KPiBYZW5zdG9yZS1zdHViZG9t
Pw0KDQpJdCBpcyB0aGUgZ3Vlc3Qgd2hpY2ggaXMgYXNzb2NpYXRpbmcgYSBmaWQgd2l0aCBh
IGZpbGUuIEZvciBvcGVuaW5nIGFuDQpleGlzdGluZyBmaWxlIHRoZSBndWVzdCBzaG91bGQg
dXNlIHRoZSBXQUxLIGNvbW1hbmQgdG8gd2FsayB0aGUgcGF0aCBmcm9tDQphIGtub3duIGZp
ZCAoZS5nLiB0aGUgcm9vdCBmaWQgYXNzb2NpYXRlZCBhdCBBVFRBQ0ggdGltZSkgdG8gdGhl
IHRhcmdldA0KZmlsZS4NCg0KDQpKdWVyZ2VuDQo=
--------------ofUivaIjDtwjUVJoouoel1I4
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ofUivaIjDtwjUVJoouoel1I4--

--------------3cDH7yUVj7JmIQj7wZGR2bw8--

--------------EDU76HeuOEHUjs7vUjSkclql
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVJ4T4FAwAAAAAACgkQsN6d1ii/Ey+3
uwf/Q7yHJu4s7lSjsiSEDG5NJ0tHB0T9D/ommLT6512JgTUrCePOZoZ7RZmzkwoKABEvE8CMmp91
4lLHaM5nG5rJrzzA00oTKaqhK69dLV1FKdPcgG2LAJKqoWFX0BEOJ3cd5sYQieUWohoUUk+nPqHu
Mv0v7MEOYVTe+tV+ciQkwvqXUNlZ5Xl/IP7it4Yvxr2ASf3DJI9//fLNYt72YX79TDgHV5TK/43N
9gMKsmsiSAO1M6O4tIrzwRJM+VS8RsrH4UC16DiInqFTRUdEwjz3xyTbPwl8Fq+4CMcn8B4nd822
MRFAMgnskFi+8VYBgl1cXOjnxHe+/Fg6NpESOmM5dQ==
=BFz1
-----END PGP SIGNATURE-----

--------------EDU76HeuOEHUjs7vUjSkclql--

