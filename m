Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D6D693E76
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 07:48:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494133.764092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRScy-0003Xc-UV; Mon, 13 Feb 2023 06:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494133.764092; Mon, 13 Feb 2023 06:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRScy-0003V9-Qz; Mon, 13 Feb 2023 06:47:52 +0000
Received: by outflank-mailman (input) for mailman id 494133;
 Mon, 13 Feb 2023 06:47:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DRhn=6J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pRScx-0003Uy-Iv
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 06:47:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5364316a-ab6a-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 07:47:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EDAB835354;
 Mon, 13 Feb 2023 06:47:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B64C11391B;
 Mon, 13 Feb 2023 06:47:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bCkYKhLd6WOzDAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Feb 2023 06:47:46 +0000
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
X-Inumbo-ID: 5364316a-ab6a-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676270866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NlMwrQ+B8I/w6bXL/LW7Sau/IV5bLsON9okQ/ZmOaxI=;
	b=Q0vWAxLIJptSJLevPEJt2ZjLTlA+dagTglf+Fdm1Mz5itMGe95i7Uphqk7aH1qZulE9LGj
	E+BXB+1MvbQCxvjWrVZEr8xO868+CtiAyO52EW6ZdD/o4pzs4hgJ8PBnJNrzWe50RB3aX6
	qSQ9ybD1O9VNaWBG6Ukqk6sGpdDqeR0=
Message-ID: <7e4efddc-2006-5092-d025-0a431cda5957@suse.com>
Date: Mon, 13 Feb 2023 07:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 7/7] Mini-OS: add read and write support to 9pfsfront
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-8-jgross@suse.com>
 <20230210185916.2qjo6yh7c3usheyp@begin>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230210185916.2qjo6yh7c3usheyp@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PrFEyCxYjiP4ohKFKzj6DVV2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PrFEyCxYjiP4ohKFKzj6DVV2
Content-Type: multipart/mixed; boundary="------------fqimO9s0fMTKrHoCeSwrp6ZL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <7e4efddc-2006-5092-d025-0a431cda5957@suse.com>
Subject: Re: [PATCH v2 7/7] Mini-OS: add read and write support to 9pfsfront
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-8-jgross@suse.com>
 <20230210185916.2qjo6yh7c3usheyp@begin>
In-Reply-To: <20230210185916.2qjo6yh7c3usheyp@begin>

--------------fqimO9s0fMTKrHoCeSwrp6ZL
Content-Type: multipart/mixed; boundary="------------Y6e47tOoLmM0IZqFj560FLQV"

--------------Y6e47tOoLmM0IZqFj560FLQV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDIuMjMgMTk6NTksIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSnVlcmdlbiBH
cm9zcywgbGUgdmVuLiAxMCBmw6l2ci4gMjAyMyAxMTo0NjoyOCArMDEwMCwgYSBlY3JpdDoN
Cj4+ICsgICAgd2hpbGUgKCBsZW4gKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBjb3VudCA9
IGxlbjsNCj4+ICsgICAgICAgIGlmICggY291bnQgPiBkZXYtPm1zaXplX21heCAtIDI0ICkN
Cj4+ICsgICAgICAgICAgICBjb3VudCA9IGRldi0+bXNpemVfbWF4IC0gMjQ7DQo+IA0KPiAy
NCBzaG91bGQgYmUgZGV0YWlsZWQsIHRvIGluY2x1ZGUgZS5nLiBzaXplb2YocDlfaGVhZGVy
KSBhbmQgdGhlIHN1bSBvZg0KPiBzaXplcyBvZiB0aGUgZmllbGRzIChJJ20gc3VycHJpc2Vk
IHRoYXQgaXQncyB0aGUgc2FtZSAyNCBmb3IgcmVhZCBhbmQNCj4gd3JpdGUsIG5vdGFibHkp
Lg0KDQpJdCB3YXMganVzdCBhIGNvbW1vbiB2YWx1ZSBjaG9zZW4gdG8gYmUgbGFyZ2UgZW5v
dWdoLiBJIGV2ZW4gY29uc2lkZXJlZA0KdG8gbGltaXQgdG8gYSBwb3dlciBvZiAyIG9yIGEg
bXVsdGlwbGUgb2YgUEFHRV9TSVpFIGluc3RlYWQuDQoNCkluZGVwZW5kZW50IGZyb20gdGhl
IGNob3NlbiBuZXcgdmFsdWUgb2YgY291bnQgSSBhZ3JlZSwgdGhhdCBhdCBsZWFzdCB0aGUN
CnRlc3QgZm9yIGNvdW50IG5lZWRpbmcgdG8gYmUgbW9kaWZpZWQgc2hvdWxkIGJlIGRvbmUg
d2l0aCBhbiBleGFjdCB2YWx1ZQ0KZm9yIHRoZSB1cHBlciBsaW1pdC4NCg0KPiANCj4+ICsg
ICAgICAgIHNlbmRfOXAoZGV2LCByZXEsICJVTFUiLCBmaWQsIG9mZnNldCwgY291bnQpOw0K
Pj4gKyAgICAgICAgcmN2XzlwKGRldiwgcmVxLCAiRCIsICZjb3VudCwgZGF0YSk7DQo+PiAr
DQo+PiArICAgICAgICBpZiAoICFjb3VudCApDQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+
PiArICAgICAgICBpZiAoIHJlcS0+cmVzdWx0ICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAg
ICAgICAgICByZXQgPSAtMTsNCj4+ICsgICAgICAgICAgICBlcnJubyA9IEVJTzsNCj4gDQo+
IEknZCBzYXkgbG9nIHJlcS0+cmVzdWx0Pw0KDQpPa2F5Lg0KDQo+IA0KPj4gKyAgICAgICAg
ICAgIGJyZWFrOw0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICAgICAgcmV0ICs9IGNvdW50Ow0K
Pj4gKyAgICAgICAgb2Zmc2V0ICs9IGNvdW50Ow0KPj4gKyAgICAgICAgZGF0YSArPSBjb3Vu
dDsNCj4+ICsgICAgICAgIGxlbiAtPSBjb3VudDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAg
ICBwdXRfZnJlZV9yZXEoZGV2LCByZXEpOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gcmV0Ow0K
Pj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IHA5X3dyaXRlKHN0cnVjdCBkZXZfOXBmcyAq
ZGV2LCB1aW50MzJfdCBmaWQsIHVpbnQ2NF90IG9mZnNldCwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHVpbnQ4X3QgKmRhdGEsIHVpbnQzMl90IGxlbikNCj4+ICt7DQo+PiAr
ICAgIHN0cnVjdCByZXEgKnJlcSA9IGdldF9mcmVlX3JlcShkZXYpOw0KPj4gKyAgICBpbnQg
cmV0ID0gMDsNCj4+ICsgICAgdWludDMyX3QgY291bnQ7DQo+PiArDQo+PiArICAgIGlmICgg
IXJlcSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGVycm5vID0gRUFHQUlOOw0KPj4gKyAg
ICAgICAgcmV0dXJuIC0xOw0KPj4gKyAgICB9DQo+PiArICAgIHJlcS0+Y21kID0gUDlfQ01E
X1dSSVRFOw0KPj4gKw0KPj4gKyAgICB3aGlsZSAoIGxlbiApDQo+PiArICAgIHsNCj4+ICsg
ICAgICAgIGNvdW50ID0gbGVuOw0KPj4gKyAgICAgICAgaWYgKCBjb3VudCA+IGRldi0+bXNp
emVfbWF4IC0gMjQgKQ0KPj4gKyAgICAgICAgICAgIGNvdW50ID0gZGV2LT5tc2l6ZV9tYXgg
LSAyNDsNCj4gDQo+IFNhbWUgaGVyZS4NCg0KWWVzLg0KDQo+IA0KPj4gKyAgICAgICAgc2Vu
ZF85cChkZXYsIHJlcSwgIlVMRCIsIGZpZCwgb2Zmc2V0LCBjb3VudCwgZGF0YSk7DQo+PiAr
ICAgICAgICByY3ZfOXAoZGV2LCByZXEsICJVIiwgJmNvdW50KTsNCj4+ICsgICAgICAgIGlm
ICggcmVxLT5yZXN1bHQgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIHJldCA9
IC0xOw0KPj4gKyAgICAgICAgICAgIGVycm5vID0gRUlPOw0KPiANCj4gU2FtZSBoZXJlLg0K
DQpZZXMuDQoNCg0KSnVlcmdlbg0K
--------------Y6e47tOoLmM0IZqFj560FLQV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Y6e47tOoLmM0IZqFj560FLQV--

--------------fqimO9s0fMTKrHoCeSwrp6ZL--

--------------PrFEyCxYjiP4ohKFKzj6DVV2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB4BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPp3RIFAwAAAAAACgkQsN6d1ii/Ey/1
SAf3c8XTGStAtXmFWG6YRrJNI2dReIKhzTCgnvFNY/C4vqoYWrFVf6zLeawbNRgomE285h8PjMiM
LxtkiZpGqLp4pBVG+MNoJaUNO40HmjmMkjepKhgj0xw2hE/ieHFacJ0vfR8vJ32JVgzhh4Q19+d2
PxUiPp4JbQKUaoMUVeiJMALCv/df1nDAc9AN/W1h5+JLIGMxzsdbZcfeYm2+By2YZrJzeUHmYwYh
roSIdX5pHzJ3gXvS5T4SKkuTjfd5o3mGtOKW3IE/c3RO3UgyKgnmQqXe0qXvvXqU87esLbrFBttQ
IsoKE9j31xyJTgNIEb+E7+8qgkqNLcapfNmAU36w
=XyW/
-----END PGP SIGNATURE-----

--------------PrFEyCxYjiP4ohKFKzj6DVV2--

