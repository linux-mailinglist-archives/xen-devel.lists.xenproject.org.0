Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6097766E2BC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 16:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479573.743504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHoE3-0007vL-7P; Tue, 17 Jan 2023 15:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479573.743504; Tue, 17 Jan 2023 15:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHoE3-0007tS-35; Tue, 17 Jan 2023 15:50:15 +0000
Received: by outflank-mailman (input) for mailman id 479573;
 Tue, 17 Jan 2023 15:50:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uRIs=5O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pHoE1-0007tM-Oi
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 15:50:13 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a08a9428-967e-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 16:50:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DE96E20063;
 Tue, 17 Jan 2023 15:50:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B98C11390C;
 Tue, 17 Jan 2023 15:50:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 86XnK7PDxmMvWQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 17 Jan 2023 15:50:11 +0000
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
X-Inumbo-ID: a08a9428-967e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673970611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ylkLwEQ9wpikNwd/2MHRgca3vP7wm2XPPZEd4mvvd2I=;
	b=oZjBqEoR0o1huc2iD7qOoL95ms2uXjhIEpOA+pRp7RU8aD7mQacKA865VrAS+Lwo1k6Sh9
	wUMxFedgjXbBoKjeU8rU0F1EqP/Y97iy6DaXC8eTcLxCgNpYGSfYZkiAh7qX5oc2o8Gnwl
	GdjieTXBlSzyQNnlJeHWck2cqy7DDsU=
Message-ID: <371fadc8-64d8-230e-f57b-1d081456b260@suse.com>
Date: Tue, 17 Jan 2023 16:50:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 04/17] tools/xenstore: introduce dummy nodes for
 special watch paths
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-5-jgross@suse.com>
 <a944a5ea-0e9f-add6-cbe7-8b06054c637a@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <a944a5ea-0e9f-add6-cbe7-8b06054c637a@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3h00L3ae711oQvX3mcdw033D"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3h00L3ae711oQvX3mcdw033D
Content-Type: multipart/mixed; boundary="------------WJZmKry62k8Amme0t0pkjTEc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <371fadc8-64d8-230e-f57b-1d081456b260@suse.com>
Subject: Re: [PATCH v3 04/17] tools/xenstore: introduce dummy nodes for
 special watch paths
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-5-jgross@suse.com>
 <a944a5ea-0e9f-add6-cbe7-8b06054c637a@xen.org>
In-Reply-To: <a944a5ea-0e9f-add6-cbe7-8b06054c637a@xen.org>

--------------WJZmKry62k8Amme0t0pkjTEc
Content-Type: multipart/mixed; boundary="------------aGbzozR4sYm9HMgVI0vUqdjI"

--------------aGbzozR4sYm9HMgVI0vUqdjI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDEuMjMgMTU6MDIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE3LzAxLzIwMjMgMDk6MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiAr
c3RhdGljIHZvaWQgZmlyZV9zcGVjaWFsX3dhdGNoZXMoY29uc3QgY2hhciAqbmFtZSkNCj4+
ICt7DQo+PiArwqDCoMKgIHZvaWQgKmN0eCA9IHRhbGxvY19uZXcoTlVMTCk7DQo+PiArwqDC
oMKgIHN0cnVjdCBub2RlICpub2RlOw0KPj4gKw0KPj4gK8KgwqDCoCBpZiAoIWN0eCkNCj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+PiArDQo+PiArwqDCoMKgIG5vZGUgPSByZWFk
X25vZGUoTlVMTCwgY3R4LCBuYW1lKTsNCj4+ICsNCj4+ICvCoMKgwqAgaWYgKG5vZGUpDQo+
PiArwqDCoMKgwqDCoMKgwqAgZmlyZV93YXRjaGVzKE5VTEwsIGN0eCwgbmFtZSwgbm9kZSwg
dHJ1ZSwgTlVMTCk7DQo+PiArwqDCoMKgIGVsc2UNCj4+ICvCoMKgwqDCoMKgwqDCoCBzeXNs
b2coTE9HX0VSUiwgInNwZWNpYWwgbm9kZSAlcyBub3QgZm91bmRcbiIsIG5hbWUpOw0KPiAN
Cj4gTklUOiBIb3cgYWJvdXQgdXNpbmcgbG9nKCkgc28gaXQgaXMgYWxzbyBwcmludGVkIGlu
IHRoZSB0cmFjZSBsb2c/IFRoaXMgd291bGQgYmUgDQo+IGhhbmR5IHRvIGF2b2lkIGhhdmlu
ZyB0byBjaGVjayBtdWx0aXBsZSBsb2cgZmlsZXMuDQoNClRoaXMgd291bGQgcmVxdWlyZSB0
byBtb3ZlIHBhdGNoIDE0IGluIGZyb250IG9mIHRoaXMgb25lLg0KDQpJIHRoaW5rIHRoaXMg
aXMgcG9zc2libGUgd2l0aG91dCBwcm9ibGVtcy4NCg0KPiANCj4gV2l0aCBvciB3aXRob3V0
Og0KPiANCj4gUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQoNClRoYW5rcywNCg0KDQpKdWVyZ2VuDQoNCg==
--------------aGbzozR4sYm9HMgVI0vUqdjI
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------aGbzozR4sYm9HMgVI0vUqdjI--

--------------WJZmKry62k8Amme0t0pkjTEc--

--------------3h00L3ae711oQvX3mcdw033D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPGw7MFAwAAAAAACgkQsN6d1ii/Ey/u
uQf+PzL5UxChEcJSrD3ZO1M6GEbPtiUJtqHcAUiBoQ8A/8OP506+4ID0b8exkJP5ksywc2LptlsF
8UEEq3aduU/oyFyMlPAua2rEIfEJGe0YdsOwbq66C/aO4dlp91e+nN76SDwPIgmu6NttR6qbiyEW
p9RBn/flWuezcnbe+WTlehoW6Eb2noYnil0IrVohaVmLzba8CU4QPyqMGCwLHkrNxO2GY9tNeVnc
GQZk+yU+j+sjxDc2R5lk5f7WQPrQDiuyFo6n1Tx/FizeqPBTgX1h5AEiaao7NM32G0mf/XQ3MT7Y
iJgyDfigljOhOSJjKV8EQlGRDVgQkYqeJPFYC+x83Q==
=mJDj
-----END PGP SIGNATURE-----

--------------3h00L3ae711oQvX3mcdw033D--

