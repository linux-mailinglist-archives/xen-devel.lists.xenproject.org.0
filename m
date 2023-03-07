Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739AB6ADE49
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 13:05:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507336.780701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZW3x-0001Ty-89; Tue, 07 Mar 2023 12:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507336.780701; Tue, 07 Mar 2023 12:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZW3x-0001RJ-5L; Tue, 07 Mar 2023 12:05:01 +0000
Received: by outflank-mailman (input) for mailman id 507336;
 Tue, 07 Mar 2023 12:04:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JVyd=67=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZW3v-0001RD-Dy
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 12:04:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47c50e36-bce0-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 13:04:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B7E7D21A1B;
 Tue,  7 Mar 2023 12:04:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77C991341F;
 Tue,  7 Mar 2023 12:04:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wjxTG2koB2SzIQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Mar 2023 12:04:57 +0000
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
X-Inumbo-ID: 47c50e36-bce0-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678190697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FvzdQejLG0UyJO/IekvXYMGiMU03HkSiTcmGKnQAyoA=;
	b=gw0houZTQEO/XvGmqnNvgf3NY0xwJVY4+RpSDbHF+okNyOa1/domlK8fTEMNd4u1Y0F2Bk
	4HqTMlTUNc8YJWhLSMpd3/Us8r0rHpg69jy/uQz6ezlfZkopv7EeYQQBa7Zot9nqShxfqg
	mQ4UsOiUfTHqyahxDfvmjwxqxEyFusY=
Message-ID: <9a80af7b-1b35-ea7b-b449-ecf9f0256914@suse.com>
Date: Tue, 7 Mar 2023 13:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-2-jgross@suse.com>
 <e1353c0c-9501-3713-b759-0989447e6496@suse.com>
 <d3d2b65c-ccb4-5408-38d2-d637e1f67064@suse.com>
 <40fa3767-cc11-aba9-15bc-e528965b599a@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
In-Reply-To: <40fa3767-cc11-aba9-15bc-e528965b599a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1TmgoXA00v1XnES8SJS4UzjL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1TmgoXA00v1XnES8SJS4UzjL
Content-Type: multipart/mixed; boundary="------------XQ0cads0f5EoFmdyK3VbyXHK";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <9a80af7b-1b35-ea7b-b449-ecf9f0256914@suse.com>
Subject: Re: [PATCH 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-2-jgross@suse.com>
 <e1353c0c-9501-3713-b759-0989447e6496@suse.com>
 <d3d2b65c-ccb4-5408-38d2-d637e1f67064@suse.com>
 <40fa3767-cc11-aba9-15bc-e528965b599a@suse.com>
In-Reply-To: <40fa3767-cc11-aba9-15bc-e528965b599a@suse.com>

--------------XQ0cads0f5EoFmdyK3VbyXHK
Content-Type: multipart/mixed; boundary="------------j5f99Ah8PBiemXbhAAFhNf21"

--------------j5f99Ah8PBiemXbhAAFhNf21
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDMuMjMgMTI6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMy4yMDIz
IDEyOjMzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDcuMDMuMjMgMTE6MzEsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjAzLjIwMjMgMDc6MzIsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IFVzaW5nIGEgcmF0aGVyIG9sZGlzaCBnY2MgKDcuNSkgaXQgd2Fz
IHZlcmlmaWVkIHRoYXQgY29kZSBnZW5lcmF0aW9uDQo+Pj4+IGRvZXNuJ3QgcmVhbGx5IGRp
ZmZlciBiZXR3ZWVuIENPTkZJR19ERUJVR19JTkZPIG9uIG9yIG9mZiB3aXRob3V0DQo+Pj4+
IENPTkZJR19ERUJVRyBiZWluZyBzZXQgKG9ubHkgb2JzZXJ2ZWQgZGlmZmVyZW5jZXMgd2Vy
ZSBzbGlnaHRseQ0KPj4+PiBkaWZmZXJlbnQgc3ltYm9sIGFkZHJlc3NlcywgdmVyaWZpZWQg
dmlhICJvYmpkdW1wIC1kIikuIFRoZSBvbGQgZ2NjDQo+Pj4+IHZlcnNpb24gc2VsZWN0aW9u
IHdhcyBiYXNlZCBvbiB0aGUgYXNzdW1wdGlvbiwgdGhhdCBuZXdlciBnY2Mgd29uJ3QNCj4+
Pj4gcmVncmVzcyBpbiB0aGlzIHJlZ2FyZC4NCj4+Pg0KPj4+IFRoaXMgaXMgZ29vZCB0byBr
bm93LCBidXQgSSdtIHN0aWxsIGN1cmlvdXMgYWJvdXQgdGhlIG1lbnRpb25lZA0KPj4+IGRp
ZmZlcmVuY2VzIGluIHN5bWJvbCBhZGRyZXNzZXM6IElmIGNvZGUgZ2VuZXJhdGlvbiBkaWRu
J3QgY2hhbmdlLCB3aGF0DQo+Pj4gY2F1c2VkIGFkZHJlc3NlcyB0byBkaWZmZXI/IElzIHRo
YXQgbWVyZWx5IGJlY2F1c2UgaW5kaXZpZHVhbCBmdW5jdGlvbnMNCj4+PiBvciBvYmplY3Rz
IGFyZSBlbWl0dGVkIGluIGRpZmZlcmVudCBvcmRlciBieSB0aGUgY29tcGlsZXI/IChJZiBz
byBJJ2QNCj4+PiBiZSBpbmNsaW5lZCB0byBpbmZlciB0aGF0IGNvbXBhcmluZyBnZW5lcmF0
ZWQgY29kZSBtdXN0IGhhdmUgYmVlbg0KPj4+IHF1aXRlIGEgYml0IG9mIGVmZm9ydCwgYXMg
Zmlyc3Qgb2YgYWxsIHlvdSB3b3VsZCBoYXZlIGhhZCB0byB1bmRvIHRoYXQNCj4+PiByZS1v
cmRlcmluZy4pDQo+Pg0KPj4gSSBkaWQgYSBzaW1wbGUgZGlmZiBvZiB0aGUgdHdvIGRpc2Fz
c2VtYmx5IG91dHB1dHMgYW5kIGdvdCBvbmx5IHNtYWxsDQo+PiBkaWZmZXJlbmNlcyBmb3Ig
JXJpcCByZWxhdGl2ZSBhZGRyZXNzZXMgKHRoZSBkaWZmZXJlbmNlcyB3ZXJlIGluIHRoZQ0K
Pj4gcmFuZ2Ugb2YgKy8tIDMyIGJ5dGVzKS4NCj4gDQo+IFRoYXQncyBzdGlsbCBvZGQgYW5k
IGhlbmNlIGltbyB3YW50cyB1bmRlcnN0YW5kaW5nLiBEbyB5b3Ugc3RpbGwgaGF2ZQ0KPiBi
b3RoIGJpbmFyaWVzIGFyb3VuZD8NCg0KSSBoYXZlIGp1c3QgcmVnZW5lcmF0ZWQgdGhlIG9u
ZSB3aXRoIGRlYnVnLWluZm8uIEl0IGlzIGEgNC4xNyBidWlsZC4NCg0KSSBqdXN0IGZvdW5k
IHRoZSBhdCBsZWFzdCBvbmUgcmVhc29uOiB4ZW5fY29uZmlnX2RhdGEgaGFzIGEgZGlmZmVy
ZW50IHNpemUNCihvYnZpb3VzbHkhKSBhbmQgdGhpcyBmaW5hbGx5IGxlYWRzIHRvIGFuIG9m
ZnNldCBvZiAzMiBieXRlcyBmb3Igc3ltYm9scw0KYXQgaGlnaGVyIGFkZHJlc3NlcyAod2l0
aCBzb21lIGl0ZW1zIG9ubHkgZGlmZmVyaW5nIGJ5IDggYnl0ZXMgZHVlIHRvDQphbGlnbm1l
bnQpLg0KDQoNCkp1ZXJnZW4NCg==
--------------j5f99Ah8PBiemXbhAAFhNf21
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------j5f99Ah8PBiemXbhAAFhNf21--

--------------XQ0cads0f5EoFmdyK3VbyXHK--

--------------1TmgoXA00v1XnES8SJS4UzjL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQHKGgFAwAAAAAACgkQsN6d1ii/Ey/g
aQf8D9mwvYuzDzKeBhAUxKM837DasViukCNE/5YxYZEowzhK86XJmgutcDwzioI5Uh9sfrUbIeJ1
TGaL8ZCnIWrHvaP9KgxzGTpyyN7ROHwczOVPLsOayZMcnu38OKGWK1iZ5hOCl/tLWUyNhNgecAiA
hf9arDInTS09ng25ECJNrlqnYYmA2x0WHFXDSeDq7Or6wbwo1FrGzMmXFrgRxhOpqxMgUOpj2OM7
mDo40I6D3w7s4/ASErfhPRYf5UUa6ZU0p0sc+bJ1M3mLz4lnE0OyKzKldwhzLBM11h1RAJSuxdrx
hfDb2rqwx51ubPwleFQrMx41f2w/nTL8Oo4dPrTPIA==
=qRm1
-----END PGP SIGNATURE-----

--------------1TmgoXA00v1XnES8SJS4UzjL--

