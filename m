Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583077EAA95
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 07:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632140.986199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2n6M-0002P7-Ej; Tue, 14 Nov 2023 06:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632140.986199; Tue, 14 Nov 2023 06:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2n6M-0002Mi-Bn; Tue, 14 Nov 2023 06:40:46 +0000
Received: by outflank-mailman (input) for mailman id 632140;
 Tue, 14 Nov 2023 06:40:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OFhv=G3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2n6K-0002Mc-LL
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 06:40:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb77d188-82b8-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 07:40:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 26A2721898;
 Tue, 14 Nov 2023 06:40:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E01E713460;
 Tue, 14 Nov 2023 06:40:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lbY1NWkWU2VvQQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Nov 2023 06:40:41 +0000
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
X-Inumbo-ID: bb77d188-82b8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699944042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=D8jRoswp2vmvxsJbaIAl+n4BVon6JeW229xi/fhaL8Q=;
	b=LLNhMYqUnKNP6fbx0JmizSY9DqYTVI6JxhPxprMHYKfj5HJaPJxM1wh5KbIRkRi3jTPY7p
	sEMFsWu04kqR8tUu/xBMH7xWcA4aOYHgVDwoslYqAiu4wsT7Dn2RlWSmjZtyBxmuARPuUw
	yia8UW+b9nx2jAztijbWU/gFCIYlLuw=
Message-ID: <fe1e5b10-a9cb-4347-b148-8e5e0d290428@suse.com>
Date: Tue, 14 Nov 2023 07:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/29] tools/xenstored: mount 9pfs device in stubdom
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-27-jgross@suse.com>
 <e637cc9f-246e-4834-b255-b4cdeb40178f@xen.org>
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
In-Reply-To: <e637cc9f-246e-4834-b255-b4cdeb40178f@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3G0YkaVbmu0lA531zyR2H9iG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3G0YkaVbmu0lA531zyR2H9iG
Content-Type: multipart/mixed; boundary="------------OaDQuhlp02L2iaippGvjFUIx";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Message-ID: <fe1e5b10-a9cb-4347-b148-8e5e0d290428@suse.com>
Subject: Re: [PATCH v2 26/29] tools/xenstored: mount 9pfs device in stubdom
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-27-jgross@suse.com>
 <e637cc9f-246e-4834-b255-b4cdeb40178f@xen.org>
In-Reply-To: <e637cc9f-246e-4834-b255-b4cdeb40178f@xen.org>

--------------OaDQuhlp02L2iaippGvjFUIx
Content-Type: multipart/mixed; boundary="------------0GLT4DZcFHh2WOsvVq3pL0iZ"

--------------0GLT4DZcFHh2WOsvVq3pL0iZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjMgMjM6MDksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEwLzExLzIwMjMgMTY6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jIGIvdG9vbHMveGVuc3RvcmVk
L2RvbWFpbi5jDQo+PiBpbmRleCAxNjJiODdiNDYwLi40MjYzYzEzNjBmIDEwMDY0NA0KPj4g
LS0tIGEvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+PiArKysgYi90b29scy94ZW5zdG9y
ZWQvZG9tYWluLmMNCj4+IEBAIC0xMjM2LDYgKzEyMzYsOCBAQCB2b2lkIHN0dWJkb21faW5p
dCh2b2lkKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJhcmZfcGVycm9yKCJGYWlsZWQgdG8g
aW5pdGlhbGl6ZSBzdHViZG9tIik7DQo+PiDCoMKgwqDCoMKgIHhlbmV2dGNobl9ub3RpZnko
eGNlX2hhbmRsZSwgc3R1YmRvbS0+cG9ydCk7DQo+PiArDQo+PiArwqDCoMKgIG1vdW50Xzlw
ZnMoKTsNCj4+IMKgICNlbmRpZg0KPj4gwqAgfQ0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hl
bnN0b3JlZC9taW5pb3MuYyBiL3Rvb2xzL3hlbnN0b3JlZC9taW5pb3MuYw0KPj4gaW5kZXgg
MjAyZDcwMzg3YS4uZmRkYmVkZTg2OSAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3Jl
ZC9taW5pb3MuYw0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmVkL21pbmlvcy5jDQo+PiBAQCAt
MTksOCArMTksMTYgQEANCj4+IMKgICNpbmNsdWRlIDxzeXMvbW1hbi5oPg0KPj4gwqAgI2lu
Y2x1ZGUgImNvcmUuaCINCj4+IMKgICNpbmNsdWRlIDx4ZW4vZ3JhbnRfdGFibGUuaD4NCj4+
ICsjaW5jbHVkZSA8bWluaS1vcy85cGZyb250Lmg+DQo+PiDCoCAjaW5jbHVkZSA8bWluaS1v
cy9ldmVudHMuaD4NCj4+IMKgICNpbmNsdWRlIDxtaW5pLW9zL2dudHRhYi5oPg0KPj4gKyNp
bmNsdWRlIDxtaW5pLW9zL3NjaGVkLmg+DQo+PiArI2luY2x1ZGUgPG1pbmktb3MveGVuYnVz
Lmg+DQo+PiArI2luY2x1ZGUgPG1pbmktb3MveG1hbGxvYy5oPg0KPj4gKw0KPj4gKyNkZWZp
bmUgUDlfU1RBVEVfUEFUSMKgwqDCoCAiZGV2aWNlLzlwZnMvMC9zdGF0ZSINCj4+ICsNCj4+
ICtzdGF0aWMgdm9pZCAqcDlfZGV2aWNlOw0KPj4gwqAgdm9pZCB3cml0ZV9waWRmaWxlKGNv
bnN0IGNoYXIgKnBpZGZpbGUpDQo+PiDCoCB7DQo+PiBAQCAtNjIsMyArNzAsMzEgQEAgdm9p
ZCBlYXJseV9pbml0KHZvaWQpDQo+PiDCoMKgwqDCoMKgIGlmIChzdHViX2RvbWlkID09IERP
TUlEX0lOVkFMSUQpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYmFyZigiY291bGQgbm90IGdl
dCBvd24gZG9taWQiKTsNCj4+IMKgIH0NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBtb3VudF90
aHJlYWQodm9pZCAqcCkNCj4+ICt7DQo+PiArwqDCoMKgIHhlbmJ1c19ldmVudF9xdWV1ZSBl
dmVudHMgPSBOVUxMOw0KPj4gK8KgwqDCoCBjaGFyICplcnI7DQo+PiArwqDCoMKgIGNoYXIg
KmR1bW15Ow0KPj4gKw0KPj4gK8KgwqDCoCBmcmVlKHhlbmJ1c193YXRjaF9wYXRoX3Rva2Vu
KFhCVF9OSUwsIFA5X1NUQVRFX1BBVEgsICI5cGZzIiwgJmV2ZW50cykpOw0KPiANCj4gQUZB
SUNULCB4ZW5idXNfd2F0Y2hfcGF0aF90b2tlbigpIGNhbiBmYWlsLiBJIGFncmVlIHRoaXMg
aXMgdW5saWtlbHksIGJ1dCBpZiBpdCANCj4gZmFpbHMsIHRoZW4gaXQgd291bGQgYmUgdXNl
ZnVsIHRvIGdldCBzb21lIGxvZ3MuIE90aGVyd2lzZS4uLg0KPiANCj4+ICsNCj4+ICvCoMKg
wqAgZm9yICg7Oykgew0KPiANCj4gLi4uIHRoaXMgbG9vcCB3b3VsZCBiZSBpbmZpbml0ZS4N
Cg0KT2theSwgd2lsbCBhZGQgbG9nZ2luZy4NCg0KPiANCj4+ICvCoMKgwqDCoMKgwqDCoCB4
ZW5idXNfd2FpdF9mb3Jfd2F0Y2goJmV2ZW50cyk7DQo+PiArwqDCoMKgwqDCoMKgwqAgZXJy
ID0geGVuYnVzX3JlYWQoWEJUX05JTCwgUDlfU1RBVEVfUEFUSCwgJmR1bW15KTsNCj4gDQo+
IENhbiB5b3UgZXhwbGFpbiB3aHkgZG9uJ3QgY2FyZSBhYm91dCB0aGUgdmFsdWUgb2YgdGhl
IG5vZGU/DQoNCkkgb25seSBjYXJlIGFib3V0IHRoZSBwcmVzZW5jZSBvZiB0aGUgInN0YXRl
IiBub2RlLiBBbGwgcmVhbCBzdGF0ZSBjaGFuZ2VzDQp3aWxsIGJlIGhhbmRsZWQgaW4gaW5p
dF85cGZyb250KCkuDQoNCj4gDQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFlcnIpDQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+ICvCoMKgwqDCoMKgwqDCoCBmcmVl
KGVycik7DQo+PiArwqDCoMKgIH0NCj4+ICsNCj4+ICvCoMKgwqAgZnJlZShkdW1teSk7DQo+
PiArDQo+PiArwqDCoMKgIGZyZWUoeGVuYnVzX3Vud2F0Y2hfcGF0aF90b2tlbihYQlRfTklM
LCBQOV9TVEFURV9QQVRILCAiOXBmcyIpKTsNCj4gDQo+IHhlbmJ1c191bndhdGNoX3BhdGhf
dG9rZW4oKSBjb3VsZCB0ZWNobmljYWxseSBmYWlscy4gSXQgd291bGQgYmUgaGVscGZ1bCB0
byANCj4gcHJpbnQgYSBtZXNzYWdlLg0KDQpJIGNhbiBhZGQgdGhhdCwgYnV0IGRvIHdlIHJl
YWxseSBjYXJlPyBUaGlzIGlzIGEgY29tbW9uIHBhdHRlcm4gaW4gTWluaS1PUy4NCg0KDQpK
dWVyZ2VuDQo=
--------------0GLT4DZcFHh2WOsvVq3pL0iZ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0GLT4DZcFHh2WOsvVq3pL0iZ--

--------------OaDQuhlp02L2iaippGvjFUIx--

--------------3G0YkaVbmu0lA531zyR2H9iG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVTFmkFAwAAAAAACgkQsN6d1ii/Ey+H
swf/dt0zqOk/OLdrupuBhhTxDNO0G23uDFmPwoeuUOgwAqe8CxgGlWFnDPMRxtM7wD3AvsNlME5R
rYjHP9S3Aesaj3NaO8nRwKfHOl1OVSTYMsSGo+EpIUD94nP5pqls6L4fmaPLGMMsGB9gG6X4EnCu
gI2DPpAzSuUWR0x7k7GB5JlhqjRvc8rSwT8GDC4SfCdzdujGqpNsYmPOa605q9kXvz1UOqDN2ihI
EP02jo9aIkdKlE9MeSJk7xmhYLhRSO/0YCt3eqTAdNeUtREeNl+tcUeP8eyKsfrzlSDd5zjvJoRD
WWLsti9DV5sv3Szl5pQxwQexaUAzw3ofROMBB8JmrA==
=BUe+
-----END PGP SIGNATURE-----

--------------3G0YkaVbmu0lA531zyR2H9iG--

