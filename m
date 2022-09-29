Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EF25EF5F7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 15:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413764.657639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtCO-0000AN-4o; Thu, 29 Sep 2022 13:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413764.657639; Thu, 29 Sep 2022 13:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtCO-00007N-1o; Thu, 29 Sep 2022 13:03:32 +0000
Received: by outflank-mailman (input) for mailman id 413764;
 Thu, 29 Sep 2022 13:03:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VH9u=2A=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1odtCM-00007H-Nw
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 13:03:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cf69c9c-3ff7-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 15:03:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3F65421CF4;
 Thu, 29 Sep 2022 13:03:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 225821348E;
 Thu, 29 Sep 2022 13:03:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 08DTBqGXNWNtGwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 29 Sep 2022 13:03:29 +0000
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
X-Inumbo-ID: 1cf69c9c-3ff7-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664456609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KIxb67JcftxEENpWL1/xaTe3LEWiMHpVX+wSLAbp8nE=;
	b=lkkzFncLpeFux4ku3O3Wmdxl7bJMAyVqfMB0+68SzTaiDf7Gfa5ugstkcxKKI0ThTMDpLE
	Fahh5l8/4dDtTRokaLf2zix53dUWYdh1S3rj8q+T2Osiw7DY4vOYzh+DqMw3Y6Neh11MI9
	SWHne7cocAdDEB8ed4FSII2Lf5UMpoA=
Message-ID: <6fea6ec4-0181-22fa-808f-ea66e43bbeba@suse.com>
Date: Thu, 29 Sep 2022 15:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Proposal for physical address based hypercalls
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
 <850214fa-7e26-8a19-c318-9ded849fffda@citrix.com>
 <6d2e1b23-2299-01fd-0e79-1c9ab1b5bace@suse.com>
 <94aab958-c141-4c43-a249-a55d8e5be735@suse.com>
 <6a3d38a8-bac3-fa59-e882-0d95a8d3e5d0@suse.com>
 <ba0eeb4f-3465-e6c9-5782-8c6d6a59ca38@suse.com>
 <6b766de0-90bb-db4c-e90d-d5c8baafae9a@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <6b766de0-90bb-db4c-e90d-d5c8baafae9a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------krG5JfJceoew4vetuW93qR9U"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------krG5JfJceoew4vetuW93qR9U
Content-Type: multipart/mixed; boundary="------------W9PBFNGWKlEAjqJRH3SLjP1p";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Message-ID: <6fea6ec4-0181-22fa-808f-ea66e43bbeba@suse.com>
Subject: Re: Proposal for physical address based hypercalls
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
 <850214fa-7e26-8a19-c318-9ded849fffda@citrix.com>
 <6d2e1b23-2299-01fd-0e79-1c9ab1b5bace@suse.com>
 <94aab958-c141-4c43-a249-a55d8e5be735@suse.com>
 <6a3d38a8-bac3-fa59-e882-0d95a8d3e5d0@suse.com>
 <ba0eeb4f-3465-e6c9-5782-8c6d6a59ca38@suse.com>
 <6b766de0-90bb-db4c-e90d-d5c8baafae9a@suse.com>
In-Reply-To: <6b766de0-90bb-db4c-e90d-d5c8baafae9a@suse.com>

--------------W9PBFNGWKlEAjqJRH3SLjP1p
Content-Type: multipart/mixed; boundary="------------0NzgRnHWvACaQlxWpdYliY83"

--------------0NzgRnHWvACaQlxWpdYliY83
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDkuMjIgMTQ6NTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOS4wOS4yMDIy
IDE0OjI2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjkuMDkuMjIgMTM6MzIsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IEZpbmFsbHkgLSBpbiBob3cgZmFyIGFyZSB3ZSBjb25j
ZXJuZWQgb2YgUFYgZ3Vlc3RzIHVzaW5nIGxpbmVhcg0KPj4+IGFkZHJlc3NlcyBmb3IgaHlw
ZXJjYWxsIGJ1ZmZlcnM/IEkgYXNrIGJlY2F1c2UgSSBkb24ndCB0aGluayB0aGUgbW9kZWwN
Cj4+PiBsZW5kcyBpdHNlbGYgdG8gdXNlIGFsc28gZm9yIHRoZSBQViBndWVzdCBpbnRlcmZh
Y2VzLg0KPj4NCj4+IEdvb2QgcXVlc3Rpb24uDQo+Pg0KPj4gQXMgbG9uZyBhcyB3ZSBzdXBw
b3J0IFBWIGd1ZXN0cyB3ZSBjYW4ndCBkcm9wIHN1cHBvcnQgZm9yIGxpbmVhciBhZGRyZXNz
ZXMNCj4+IElNTy4gU28gdGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgd2UgYXJlIGZpbmUgd2l0
aCBQViBndWVzdHMgbm90IHVzaW5nIHRoZQ0KPj4gcHJlLXJlZ2lzdGVyZWQgYnVmZmVycywg
b3IgaWYgd2Ugd2FudCB0byBpbnRyb2R1Y2UgYW4gaW50ZXJmYWNlIGZvciBQVg0KPj4gZ3Vl
c3RzIHVzaW5nIEdGTnMgaW5zdGVhZCBvZiBNRk5zLg0KPiANCj4gR0ZOID09IE1GTiBmb3Ig
UFYsIGFuZCB1c2luZyBQRk4gc3BhY2UgKGJlaW5nIGVudGlyZWx5IGNvbnRyb2xsZWQgYnkg
dGhlDQoNClNpZ2guIEkgbWVhbnQgdG8gd3JpdGUgUEZOcywgb2YgY291cnNlLg0KDQo+IGd1
ZXN0KSBkb2Vzbid0IGxvb2sgYXR0cmFjdGl2ZSBlaXRoZXIuIFBsdXMgYW55IGZvcm0gb2Yg
dHJhbnNsYXRpb24gd2UnZA0KPiBuZWVkIHRvIGRvIGZvciBQViB3b3VsZCBpbnZvbHZlIGdl
dHRpbmcgYW5kIHB1dHRpbmcgcGFnZSByZWZlcmVuY2VzIChmb3INCj4gd3JpdGVzIGFsc28g
dHlwZSByZWZlcmVuY2VzKSwgYWxvbmcgdGhlIGxpbmVzIG9mIHdoYXQgaXMgYWxyZWFkeQ0K
PiBoYXBwZW5pbmcgZm9yIEhWTS4gU2luY2UgInB1dCIgbWF5IGludm9sdmUgZnJlZWluZyBh
IHBhZ2UsIHdoaWNoIGluIHR1cm4NCj4gcmVxdWlyZSBsb2NrcyB0byBiZSB0YWtlbiwgd2Un
ZCBuZWVkIHRvIGNhcmVmdWxseSBjaGVjayB0aGF0IG5vIHN1Y2gNCj4gdHJhbnNsYXRpb24g
Y2FuIG9jY3VyIGZyb20gYW4gaW5hcHByb3ByaWF0ZSBjYWxsIGNoYWluLg0KDQpTb3VuZHMg
bGlrZSBhIGdvb2QgcmVhc29uIHRvIGNvbnRpbnVlIHVzaW5nIGxpbmVhciBhZGRyZXNzZXMg
dGhlbi4NCg0KDQpKdWVyZ2VuDQo=
--------------0NzgRnHWvACaQlxWpdYliY83
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0NzgRnHWvACaQlxWpdYliY83--

--------------W9PBFNGWKlEAjqJRH3SLjP1p--

--------------krG5JfJceoew4vetuW93qR9U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM1l6AFAwAAAAAACgkQsN6d1ii/Ey+/
mQf+K/t/QM0SB/F84lP30njxetrja+wvtS2ctxli9P6d+yxE1eIfAnr5aSceuHhArqXdMZWn9vMF
BhDzZmfpyDkASaoRl/xOtyp/C/4JNpW4CoaBWdoOGLso1atUWYdhldwEFQWs58B8ruhjdi3d36QA
brZzp9A3ubea9vZe/OOXWKnIW07+6uqANVReyHoEcTs7Gqnh88uGE7TPVC+9Cqb4IMmgdQ/mVen0
AzZ8Xi3aT1M51SvvjuAbfk3Xz0ngEW8Io4W0gEPYCeyPNy8+t28GvfczmyqwRXefEYpycBDZZcqh
UdHblWlh4YnlxbJ3PtynP3r2FSE17PyxhFPcDvxJxA==
=eQnt
-----END PGP SIGNATURE-----

--------------krG5JfJceoew4vetuW93qR9U--

