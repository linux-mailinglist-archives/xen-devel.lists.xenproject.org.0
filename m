Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFD655056B
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jun 2022 16:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351874.578623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2Z6V-0003pa-Pk; Sat, 18 Jun 2022 14:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351874.578623; Sat, 18 Jun 2022 14:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2Z6V-0003n2-Lu; Sat, 18 Jun 2022 14:07:11 +0000
Received: by outflank-mailman (input) for mailman id 351874;
 Sat, 18 Jun 2022 14:07:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c8TN=WZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o2Z6U-0003mr-2O
 for xen-devel@lists.xenproject.org; Sat, 18 Jun 2022 14:07:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0ea9b44-ef0f-11ec-b725-ed86ccbb4733;
 Sat, 18 Jun 2022 16:07:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6AB331F74A;
 Sat, 18 Jun 2022 14:07:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3BABE1342C;
 Sat, 18 Jun 2022 14:07:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hdGqDAzcrWJsYwAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 18 Jun 2022 14:07:08 +0000
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
X-Inumbo-ID: f0ea9b44-ef0f-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655561228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iJ5dO8R/0jN47PrOOM8KMUMIFakJdFFnhXMc95nQrRY=;
	b=WqxxO9gExdamolPAt72JjvvZZjNQOVhU0xeF+4sq5FaXmr71Ju76gYSuRGPq97OPIpj+Sz
	0htcfWGdjqRq76GczJSisAw0ZMobLn7cWdAlTtLfEE3qYpbXTLPTx0PKN71MAaxz0sn3mM
	6tPAD4c6MGbskTWkdxSQjl1VdM6ikpw=
Message-ID: <8815b69d-f687-3b0f-1b9c-6bd273cd3404@suse.com>
Date: Sat, 18 Jun 2022 16:07:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] mini-os: fix number of pages for PVH
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20220618104816.11527-1-jgross@suse.com>
 <20220618104816.11527-4-jgross@suse.com>
 <20220618121328.54byw5ggucap6x5j@begin>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220618121328.54byw5ggucap6x5j@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p9xLAeNx0XdfvcYeMBn0FF8F"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p9xLAeNx0XdfvcYeMBn0FF8F
Content-Type: multipart/mixed; boundary="------------E4wgi72Bwn6iiqNLXv2KDhkQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <8815b69d-f687-3b0f-1b9c-6bd273cd3404@suse.com>
Subject: Re: [PATCH 3/3] mini-os: fix number of pages for PVH
References: <20220618104816.11527-1-jgross@suse.com>
 <20220618104816.11527-4-jgross@suse.com>
 <20220618121328.54byw5ggucap6x5j@begin>
In-Reply-To: <20220618121328.54byw5ggucap6x5j@begin>

--------------E4wgi72Bwn6iiqNLXv2KDhkQ
Content-Type: multipart/mixed; boundary="------------KvEEbbqzaVpnHYxCeQAofYnQ"

--------------KvEEbbqzaVpnHYxCeQAofYnQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDYuMjIgMTQ6MTMsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSGVsbG8sDQo+
IA0KPiBKdWVyZ2VuIEdyb3NzLCBsZSBzYW0uIDE4IGp1aW4gMjAyMiAxMjo0ODoxNiArMDIw
MCwgYSBlY3JpdDoNCj4+IEBAIC0xMjQsNyArMTI2LDcgQEAgdm9pZCBhcmNoX21tX3ByZWlu
aXQodm9pZCAqcCkNCj4+ICAgICAgICAgICBkb19leGl0KCk7DQo+PiAgICAgICB9DQo+PiAg
IA0KPj4gLSAgICBsYXN0X2ZyZWVfcGZuID0gZTgyMF9nZXRfbWF4cGZuKHJldCk7DQo+PiAr
ICAgIGxhc3RfZnJlZV9wZm4gPSBlODIwX2dldF9tYXhwZm4ocmV0IC0gZTgyMF9pbml0aWFs
X3Jlc2VydmVkX3BmbnMpOw0KPiANCj4gTW1tLCBidXQgdGhlIHJlc2VydmVkIHBmbiBjb3Vs
ZCBiZSBpbiB0aGUgbWlkZGxlIG9mIHRoZSBlODIwIGFkZHJlc3MNCj4gc3BhY2UuDQoNClRo
YXQgZG9lc24ndCBtYXR0ZXIuDQoNCmU4MjBfZ2V0X21heHBmbihuKSB3aWxsIGp1c3QgcmV0
dXJuIHRoZSBwZm4gb2YgdGhlIG4tdGggUkFNIHBmbiBpdCBpcw0KZmluZGluZyBpbiB0aGUg
RTgyMCBtYXAuIFRoaXMgc2hvdWxkIGJlIHRoZSBsYXN0IHBmbiB3aXRoIGFsbG9jYXRlZA0K
bWVtb3J5LiBXaXRob3V0IHN1YnRyYWN0aW5nIHRoZSBudW1iZXIgb2YgcmVzZXJ2ZWQgcGZu
cyAod2hpY2ggY29udGFpbg0Kbm9ybWFsbHkgbWVtb3J5IHdoaWNoIGlzIGFsbG9jYXRlZCBm
b3IgdGhlIGd1ZXN0LCBidXQgbm90IHVzYWJsZSBhcw0KUkFNKSwgTWluaS1PUyB0cmllcyB0
byB1c2UgUkFNIGJleW9uZCBpdHMgYWxsb2NhdGlvbiwgd2hpY2ggZmFpbHMuDQoNCg0KSnVl
cmdlbg0K
--------------KvEEbbqzaVpnHYxCeQAofYnQ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------KvEEbbqzaVpnHYxCeQAofYnQ--

--------------E4wgi72Bwn6iiqNLXv2KDhkQ--

--------------p9xLAeNx0XdfvcYeMBn0FF8F
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKt3AsFAwAAAAAACgkQsN6d1ii/Ey/Z
iwf/YdA1009qcPXsrTxCmMp/3SAyk1katT1ziIVATeduWpDSAKo5f29uSzZ2PZG+LYHh5M/AaM8n
9qTZ5wGiEdCANYMG6cbHkSE6f0b2/1oEJ3dqPrruA6FLcZgy93cpJrR+DETLG/Cadtq3+21lTwfJ
y9JtLftI1ycNzyd08NmZ5Z5E0wZoBSjE6R26iODOJtQICXtYPB9IT4XiwXGJZCe2bYZGCdBopcdr
ejSw3I6+yE3+X2dwZKPep2JHD7GuzEE+cveUf6dSo71F4ZbuEM6IVnWJWDDOnEBjxz7viLLtWtMs
nZjWRHnsjRsDion1jSUCkHYWTdaAbuWJQJYTAoX71A==
=aw8p
-----END PGP SIGNATURE-----

--------------p9xLAeNx0XdfvcYeMBn0FF8F--

