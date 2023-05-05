Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38AE6F7CA2
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 08:00:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530219.825675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puoTR-0000ZV-EV; Fri, 05 May 2023 05:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530219.825675; Fri, 05 May 2023 05:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puoTR-0000Wv-Bf; Fri, 05 May 2023 05:59:21 +0000
Received: by outflank-mailman (input) for mailman id 530219;
 Fri, 05 May 2023 05:59:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U57p=A2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1puoTP-0000Wp-Pi
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 05:59:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8c3eedf-eb09-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 07:59:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7C4F221E44;
 Fri,  5 May 2023 05:59:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5799913513;
 Fri,  5 May 2023 05:59:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OxTyEzWbVGTedQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 05 May 2023 05:59:17 +0000
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
X-Inumbo-ID: f8c3eedf-eb09-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683266357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B4hrcc2cZgLfaRZrHv5ILnE7WRWszh0eF+pWeBIt/DI=;
	b=bUIAvbfofH4x8PaIi+zNc3HF2sePEX7IJeN86HmLXJndFdaITErVc1EQ+KYzMe9OKiZnB9
	RO6824ZfsTloOogdHZfT1dcxvHKqwmUMpOnd8vaJ3C+J2tsi24Muf61hp9ItyTlLMY+1HQ
	cU+SgqUDuWT4dXfkrJmukC28WHQZfK8=
Message-ID: <30246788-c90e-e338-de4b-e7bb2e440f4e@suse.com>
Date: Fri, 5 May 2023 07:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1] xen/sched/null: avoid crash after failed domU creation
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20230501203046.168856-1-stewart.hildebrand@amd.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230501203046.168856-1-stewart.hildebrand@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1r2vBuGWKZJSNerkRJ9qgZg8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1r2vBuGWKZJSNerkRJ9qgZg8
Content-Type: multipart/mixed; boundary="------------03jFee1iNTSgY4Evcw7jPZLX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Message-ID: <30246788-c90e-e338-de4b-e7bb2e440f4e@suse.com>
Subject: Re: [PATCH v1] xen/sched/null: avoid crash after failed domU creation
References: <20230501203046.168856-1-stewart.hildebrand@amd.com>
In-Reply-To: <20230501203046.168856-1-stewart.hildebrand@amd.com>

--------------03jFee1iNTSgY4Evcw7jPZLX
Content-Type: multipart/mixed; boundary="------------08zeABpPTNQOu4WKvLXjlc0o"

--------------08zeABpPTNQOu4WKvLXjlc0o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDUuMjMgMjI6MzAsIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90ZToNCj4gV2hlbiBj
cmVhdGluZyBhIGRvbVUsIGJ1dCB0aGUgY3JlYXRpb24gZmFpbHMsIHRoZXJlIGlzIGEgY29y
bmVyIGNhc2UgdGhhdCBtYXkNCj4gbGVhZCB0byBhIGNyYXNoIGluIHRoZSBudWxsIHNjaGVk
dWxlciB3aGVuIHJ1bm5pbmcgYSBkZWJ1ZyBidWlsZCBvZiBYZW4uDQo+IA0KPiAoWEVOKSAq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+IChYRU4pIFBhbmlj
IG9uIENQVSAwOg0KPiAoWEVOKSBBc3NlcnRpb24gJ25wYy0+dW5pdCA9PSB1bml0JyBmYWls
ZWQgYXQgY29tbW9uL3NjaGVkL251bGwuYzozNzkNCj4gKFhFTikgKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKg0KPiANCj4gVGhlIGV2ZW50cyBsZWFkaW5nIHRv
IHRoZSBjcmFzaCBhcmU6DQo+IA0KPiAqIG51bGxfdW5pdF9pbnNlcnQoKSB3YXMgaW52b2tl
ZCB3aXRoIHRoZSB1bml0IG9mZmxpbmUuIFNpbmNlIHRoZSB1bml0IHdhcw0KPiAgICBvZmZs
aW5lLCB1bml0X2Fzc2lnbigpIHdhcyBub3QgY2FsbGVkLCBhbmQgbnVsbF91bml0X2luc2Vy
dCgpIHJldHVybmVkLg0KPiAqIExhdGVyIGR1cmluZyBkb21haW4gY3JlYXRpb24sIHRoZSB1
bml0IHdhcyBvbmxpbmVkDQo+ICogRXZlbnR1YWxseSwgZG9tYWluIGNyZWF0aW9uIGZhaWxl
ZCBkdWUgdG8gYmFkIGNvbmZpZ3VyYXRpb24NCj4gKiBudWxsX3VuaXRfcmVtb3ZlKCkgd2Fz
IGludm9rZWQgd2l0aCB0aGUgdW5pdCBzdGlsbCBvbmxpbmUuIFNpbmNlIHRoZSB1bml0IHdh
cw0KPiAgICBvbmxpbmUsIGl0IGNhbGxlZCB1bml0X2RlYXNzaWduKCkgYW5kIHRyaWdnZXJl
ZCBhbiBBU1NFUlQuDQo+IA0KPiBUbyBmaXggdGhpcywgb25seSBjYWxsIHVuaXRfZGVhc3Np
Z24oKSB3aGVuIG5wYy0+dW5pdCBpcyBub24tTlVMTCBpbg0KPiBudWxsX3VuaXRfcmVtb3Zl
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0Lmhp
bGRlYnJhbmRAYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------08zeABpPTNQOu4WKvLXjlc0o
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------08zeABpPTNQOu4WKvLXjlc0o--

--------------03jFee1iNTSgY4Evcw7jPZLX--

--------------1r2vBuGWKZJSNerkRJ9qgZg8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRUmzQFAwAAAAAACgkQsN6d1ii/Ey/l
gAf+IbHz8hfyLQmPAE2DThyZ1ZaNXSc0mEoTGBoYsRoLm9PIpUSNAysxfqtBkOJq7YuUzReXsUgo
QdV3XGKI/i/8m0GnxWMfRykDDtUFX+7vHH6gw1fAptLKz38ASEqezxrqy6kNx9UZxFVZ+TGKoD5Z
HaxKw8OudFhg3Fd7NLDpfI2k4Vmj7z1eZlC/E7ZuNl2LYFkHVYNt/0su4mLMkvN/OSGev9KorGdN
ezUYgpjGPbRofc4kSgfke9eg+DYzJzhRgrG9H3N0L7a9I9aiJGaDiSATIxXMGInsunIIMIqZj7T0
go6aqcv/n72TizkoCCsEjznwhxYSvrIh5721pLO73g==
=7h+W
-----END PGP SIGNATURE-----

--------------1r2vBuGWKZJSNerkRJ9qgZg8--

