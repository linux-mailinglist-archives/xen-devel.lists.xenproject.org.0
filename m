Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC5662F4C4
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 13:31:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445685.700975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0Wi-0003ip-CX; Fri, 18 Nov 2022 12:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445685.700975; Fri, 18 Nov 2022 12:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0Wi-0003gF-8h; Fri, 18 Nov 2022 12:31:24 +0000
Received: by outflank-mailman (input) for mailman id 445685;
 Fri, 18 Nov 2022 12:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GwGO=3S=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ow0Wg-0003g9-9N
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 12:31:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e82c801f-673c-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 13:31:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B12D322638;
 Fri, 18 Nov 2022 12:31:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E5CD1345B;
 Fri, 18 Nov 2022 12:31:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1JBtHRh7d2MJCwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 18 Nov 2022 12:31:20 +0000
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
X-Inumbo-ID: e82c801f-673c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1668774680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jsX2YHFa1g562+NVwBhz1DAgpbN2aWZJ8UbIyhfdKlk=;
	b=R2+Ek2HNoB9WYTGYI2q2+g2IpJKd/hsab2uUj3uhEYuIGhXtYzP2BmJSgFFJkC8Jnr79rG
	bVqDoX8uUy1VX4xar4p/Pn4mTk/kVgSrgBoPpdIN52r1W7g262EoxALfYYxX58QOFkzko4
	rjItdN5S1aPV9PTIwiv7yWCEI7Nratw=
Message-ID: <e7734cc0-6e5a-0c7e-635f-cbfef8eac90a@suse.com>
Date: Fri, 18 Nov 2022 13:31:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cC7yRuRpFun3ITprNeAFYLdZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cC7yRuRpFun3ITprNeAFYLdZ
Content-Type: multipart/mixed; boundary="------------O3hSBdtzYTgg03q05z2IzBZb";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
Message-ID: <e7734cc0-6e5a-0c7e-635f-cbfef8eac90a@suse.com>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
In-Reply-To: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>

--------------O3hSBdtzYTgg03q05z2IzBZb
Content-Type: multipart/mixed; boundary="------------u3bGQotOolJEWpCswRpv1FFn"

--------------u3bGQotOolJEWpCswRpv1FFn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMTEuMjIgMTE6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBMaW51eCdlcyByZWxh
dGl2ZWx5IG5ldyB1c2Ugb2YgSFZNT1Bfc2V0X2V2dGNobl91cGNhbGxfdmVjdG9yIGhhcw0K
PiBleHBvc2VkIGEgcHJvYmxlbSB3aXRoIHRoZSBtYXJraW5nIG9mIHRoZSByZXNwZWN0aXZl
IHZlY3RvciBhcw0KPiBwZW5kaW5nOiBGb3IgcXVpdGUgc29tZSB0aW1lIExpbnV4IGhhcyBi
ZWVuIGNoZWNraW5nIHdoZXRoZXIgYW55IHN0YWxlDQo+IElTUiBvciBJUlIgYml0cyB3b3Vs
ZCBzdGlsbCBiZSBzZXQgd2hpbGUgcHJlcGFyaW5nIHRoZSBMQVBJQyBmb3IgdXNlLg0KPiBU
aGlzIGNoZWNrIGlzIG5vdyB0cmlnZ2VyaW5nIG9uIHRoZSB1cGNhbGwgdmVjdG9yLCBhcyB0
aGUgcmVnaXN0cmF0aW9uLA0KPiBhdCBsZWFzdCBmb3IgQVBzLCBoYXBwZW5zIGJlZm9yZSB0
aGUgTEFQSUMgaXMgYWN0dWFsbHkgZW5hYmxlZC4NCj4gDQo+IEluIHNvZnR3YXJlLWRpc2Fi
bGVkIHN0YXRlIGFuIExBUElDIHdvdWxkIG5vdCBhY2NlcHQgYW55IGludGVycnVwdA0KPiBy
ZXF1ZXN0cyBhbmQgaGVuY2Ugbm8gSVJSIGJpdCB3b3VsZCBuZXdseSBiZWNvbWUgc2V0IHdo
aWxlIGluIHRoaXMNCj4gc3RhdGUuIEFzIGEgcmVzdWx0IGl0IGlzIGFsc28gd3JvbmcgZm9y
IHVzIHRvIG1hcmsgdGhlIHVwY2FsbCB2ZWN0b3IgYXMNCj4gaGF2aW5nIGEgcGVuZGluZyBy
ZXF1ZXN0IHdoZW4gdGhlIHZMQVBJQyBpcyBpbiB0aGlzIHN0YXRlLg0KPiANCj4gVG8gY29t
cGVuc2F0ZSBmb3IgdGhlICJlbmFibGVkIiBjaGVjayBhZGRlZCB0byB0aGUgYXNzZXJ0aW9u
IGxvZ2ljLCBhZGQNCj4gbG9naWMgdG8gKGNvbmRpdGlvbmFsbHkpIG1hcmsgdGhlIHVwY2Fs
bCB2ZWN0b3IgYXMgaGF2aW5nIGEgcmVxdWVzdA0KPiBwZW5kaW5nIGF0IHRoZSB0aW1lIHRo
ZSBMQVBJQyBpcyBiZWluZyBzb2Z0d2FyZS1lbmFibGVkIGJ5IHRoZSBndWVzdC4NCj4gDQo+
IEZpeGVzOiA3YjViOGNhN2RmZmQgKCJ4ODYvdXBjYWxsOiBpbmplY3QgYSBzcHVyaW91cyBl
dmVudCBhZnRlciBzZXR0aW5nIHVwY2FsbCB2ZWN0b3IiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0KDQo=
--------------u3bGQotOolJEWpCswRpv1FFn
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------u3bGQotOolJEWpCswRpv1FFn--

--------------O3hSBdtzYTgg03q05z2IzBZb--

--------------cC7yRuRpFun3ITprNeAFYLdZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmN3excFAwAAAAAACgkQsN6d1ii/Ey9D
vQf+Pwt/pOCZEsWZxv64NJAw8UANWjWp6Ss/nz2StTqgPhTVscEKXqwaBgMYZ1BnnoSSiOsDS7II
X7Ztvt4nZwX0iaUW4veBlOnZA4J3WYzboHgDk5tbG/Sfwlu82BRq+M6JXvLfpuwH3cXFMIa5Z2OB
P44x04eZYYEuVdN2TmD7fdc+vVJdkQ3rmPqQ9oldUVMpe7JhSByjSsqTosyncCmcGb0yVwyLsRGO
KUKHQJ88EHRlufGxSCCkTjUcmtgJbFdkrC45jdD/G6bzPRHpQFZzWLExWj1wimlPQFGrliM0JXhi
BP7IowzKnyyP96uVjlgOWxPLlRy6CG2Xf5ngSETnNA==
=pbrh
-----END PGP SIGNATURE-----

--------------cC7yRuRpFun3ITprNeAFYLdZ--

