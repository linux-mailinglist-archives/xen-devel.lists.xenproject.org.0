Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE0E6A1F49
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 17:04:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501250.772918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVaYl-0007rK-7s; Fri, 24 Feb 2023 16:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501250.772918; Fri, 24 Feb 2023 16:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVaYl-0007p3-5D; Fri, 24 Feb 2023 16:04:35 +0000
Received: by outflank-mailman (input) for mailman id 501250;
 Fri, 24 Feb 2023 16:04:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3H5S=6U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pVaYk-0007ow-1d
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 16:04:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecc1c406-b45c-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 17:04:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B4A8F3EA44;
 Fri, 24 Feb 2023 16:04:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 99D9E13A3A;
 Fri, 24 Feb 2023 16:04:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QHEkJA/g+GOHJAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Feb 2023 16:04:31 +0000
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
X-Inumbo-ID: ecc1c406-b45c-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677254671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6rBdkRoznX2BXlF69UXYYpsxISvtDwjUaU4drdRzA7Q=;
	b=OpgzoOJQ7Wz21/Zy9sJKL/aucQ01/GwxNksezZuxknhx7VFKW2nQ8KdamjPu6mnG13uE45
	wTuFWGKbIt0IIamplt7Xxo5QHojYgTw58qpreolYRFrbrRtB2s75EGJUVjqOV1fls6LjcQ
	UJNwCqLH4D0AhwgDka884tzIWqq91Ys=
Message-ID: <4cc21538-9d37-9a68-1089-5858615fabf8@suse.com>
Date: Fri, 24 Feb 2023 17:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: xenstored: Interaction bettwen SET_PERMS and transaction
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b7b9bde2-5856-979d-a2e4-d01145a0cb6c@xen.org>
 <338d9214-fce4-6158-7696-bf8a7421ee9a@suse.com>
 <3bb3e5d3-06c5-8c06-014e-5aef226b5f31@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <3bb3e5d3-06c5-8c06-014e-5aef226b5f31@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MuKLFfM0pz3yt2aBzsUpuMVS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MuKLFfM0pz3yt2aBzsUpuMVS
Content-Type: multipart/mixed; boundary="------------KFo6UWHr5E1m9YxTO1782Hmq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <4cc21538-9d37-9a68-1089-5858615fabf8@suse.com>
Subject: Re: xenstored: Interaction bettwen SET_PERMS and transaction
References: <b7b9bde2-5856-979d-a2e4-d01145a0cb6c@xen.org>
 <338d9214-fce4-6158-7696-bf8a7421ee9a@suse.com>
 <3bb3e5d3-06c5-8c06-014e-5aef226b5f31@xen.org>
In-Reply-To: <3bb3e5d3-06c5-8c06-014e-5aef226b5f31@xen.org>

--------------KFo6UWHr5E1m9YxTO1782Hmq
Content-Type: multipart/mixed; boundary="------------QQ4dY4XnC6WGiO7Iy9Zv8CUc"

--------------QQ4dY4XnC6WGiO7Iy9Zv8CUc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDIuMjMgMTc6MDEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI0LzAyLzIwMjMgMTY6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyNC4wMi4yMyAxNjowMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBGb3Igc29tZSBpbnRlcm5hbCBwdXJwb3NlLCBJIG5lZWQgdG8gd3JpdGUg
YSBzY3JpcHQgdGhhdCB3b3VsZCBkbyB0aGUgZm9sbG93aW5nOg0KPj4+DQo+Pj4gwqDCoCAx
KSBTdGFydCBhIHRyYW5zYWN0aW9uDQo+Pj4gwqDCoCAyKSBDYWxsIEdFVF9QRVJNUw0KPj4+
IMKgwqAgMykgQ2FsbCBTRVRfUEVSTVMgd2l0aCB0aGUgcGVybWlzc2lvbiBqdXN0IHJldHJp
ZXZlZA0KPj4+IMKgwqAgNCkgQ29tbWl0IHRoZSB0cmFuc2FjdGlvbg0KPj4+DQo+Pj4gKERv
bid0IGFzayB3aHkgOikpDQo+Pj4NCj4+PiBUaGlzIHdhcyBleGVjdXRlZCBmcm9tIGRvbTAg
b24gZXZlcnkgbm9kZXMuIEluIHNvbWUgY2FzZXMsIHdlIG5vdGljZWQgdGhhdCA0KSANCj4+
PiB3b3VsZCByZXR1cm4gLUVOT1NQQy4NCj4+Pg0KPj4+IFdoZW4gZGlnZ2luZyB0aHJvdWdo
IHRoZSBjb2RlLCBpdCBsb29rcyBsaWtlIHRoaXMgaXMgYmVjYXVzZSANCj4+PiB0cmFuc2Fj
dGlvbl9maXhfZG9tYWlucygpIChub3cgY2FsbGVkIGFjY19maXhfZG9tYWlucygpKSB3aWxs
IGNoZWNrIHRoYXQgdGhlIA0KPj4+IHF1b3RhIGlzIGNvcnJlY3QuDQo+Pj4NCj4+PiBUaGUg
ZG9tYWluIGlzIHF1ZXN0aW9uIHdlcmUgb3ZlciBpdHMgbGltaXQsIGJ1dCBnaXZlbiB0aGlz
IGlzIGNhbGxlZCBieSBkb20wLCANCj4+PiBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgdGhhdCBp
dCBzaG91bGQgbm90IG5ldmVyIHJldHVybiAtRU5PU1BDIChub3RlIHRoYXQgYSANCj4+PiBT
RVRfUEVSTVMgb3V0c2lkZSBvZiBhIHRyYW5zYWN0aW9uIHdvdWxkIHdvcmssIGJ1dCB0aGlz
IGNhbid0IGJlIHVzZWQgb3VyIGNhc2UpLg0KPj4+DQo+Pj4gRnVydGhlcm1vcmUsIHRoZSB0
cmFuc2FjdGlvbiBpcyBub3QgY2hhbmdpbmcgYW55IGFjY291bnRpbmcuIFNvIEkgZmluZCBh
IGJpdCANCj4+PiBzdHJhbmdlIHRoYXQgd2Ugd291bGQgcHJldmVudCBpdCBldmVuIGlmIHRo
aXMgd2FzIHJ1biBmcm9tIGFuIHVucHJpdmlsZWdlZCANCj4+PiBkb21haW4uDQo+Pj4NCj4+
PiBEbyB5b3Uga25vdyBpZiB0aGlzIGlzc3VlcyB3b3VsZCBiZSBmaXhlZCBieSB5b3VyIGN1
cnJlbnQgcmV3b3JrPw0KPj4+DQo+Pj4gSWYgbm90LCB0aGVuIEkgdGhpbmsgd2UgYXQgbGVh
c3Qgd2FudCB0byBza2lwIHRoZSBxdW90YSBjaGVjayBpZiB0aGUgZG9tYWluIA0KPj4+IGlz
IHByaXZpbGVnZWQuDQo+Pj4NCj4+PiBGb3Igbm9uLXByaXZpbGVnZWQgZG9tYWluLCBJIGFt
IG5vdCBlbnRpcmVseSBzdXJlIHdoYXQgdG8gZG8uIEkgd2FzIA0KPj4+IG9yaWdpbmFsbHkg
dGhpbmtpbmcgdG8gY2hlY2sgaWYgY2QtPm5iZW50cnkgaXMgMCBhbmQgdGhlbiBza2lwIHRo
ZSBxdW90YSANCj4+PiBjaGVjay4gQnV0IHRoaXMgd291bGQgYWxsb3cgYSBkb21haW4gdG8g
cmVtb3ZlIGEgbm9kZSBhbmQgdGhlbiByZXBsYWNlIGJ5IGEgDQo+Pj4gbmV3IG9uZSAoSSB0
aGluayB3ZSBzdGlsbCB3YW50IHRvIGZvcmJpZCB0aGF0KS4NCj4+Pg0KPj4+IFdoYXQgZG8g
eW91IHRoaW5rPw0KPj4NCj4+IFBhdGNoIHNlbnQuIENvdWxkIHlvdSBwbGVhc2UgdGVzdCBp
dCB3aXRoIHlvdXIgc2NyaXB0Pw0KPiANCj4gVGhhbmtzISBJIHdpbGwgZ2l2ZSBhIHRyeSBu
ZXh0IHdlZWsgYW5kIGxldCB5b3Uga25vdyB0aGUgcmVzdWx0Lg0KDQpUaGFua3MuDQoNCk5v
IG5lZWQgdG8gaHVycnksIGFzIEknbGwgYmUgYXdheSBtb3N0IG9mIG5leHQgd2VlayAoYWZ0
ZXIgTW9uZGF5KS4NCg0KDQpKdWVyZ2VuDQo=
--------------QQ4dY4XnC6WGiO7Iy9Zv8CUc
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------QQ4dY4XnC6WGiO7Iy9Zv8CUc--

--------------KFo6UWHr5E1m9YxTO1782Hmq--

--------------MuKLFfM0pz3yt2aBzsUpuMVS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP44A8FAwAAAAAACgkQsN6d1ii/Ey9d
KAf/ZCR8qTRSWtMbkoSWYoalmajmG2eNuHt/knBY1mI8xryuAZfAyntwrJltuJ9n+2LuQk2yEQDq
0jJ0n0RC2q5DUrOUPfkebb1LVngPqI+s0Vs55SDtL8JNNgQf0OvsWpeouSbY26XbYz2TAG6CIs5r
SNS/Jy5aW+4FJy5/s+2IcK+SUWGZNNhWZwBe9EQdfL9qZREIh9qXV9GiY5G5cLP5rW+lOm5Gvwgj
NmWsNbtcMLkcACRa1xHBEWeBLKyPXhYZcHx1rLX9SORrZ2sTj393cOucybcTITmkF7Pcqh5+5iQJ
YtxLNgtKpCGo76Kh/VsKswAZF/5w1J3bjwNzpiWduQ==
=Kwv7
-----END PGP SIGNATURE-----

--------------MuKLFfM0pz3yt2aBzsUpuMVS--

