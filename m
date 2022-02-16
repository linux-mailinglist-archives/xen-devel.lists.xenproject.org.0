Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A3E4B8072
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 07:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273688.468948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKDde-00016s-Rl; Wed, 16 Feb 2022 06:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273688.468948; Wed, 16 Feb 2022 06:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKDde-00013J-N6; Wed, 16 Feb 2022 06:18:06 +0000
Received: by outflank-mailman (input) for mailman id 273688;
 Wed, 16 Feb 2022 06:18:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BoLq=S7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nKDdd-00013B-Ai
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 06:18:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3308c8ce-8ef0-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 07:18:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 09F151F37D;
 Wed, 16 Feb 2022 06:18:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC43913A3E;
 Wed, 16 Feb 2022 06:18:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eATMKBuXDGLvHAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Feb 2022 06:18:03 +0000
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
X-Inumbo-ID: 3308c8ce-8ef0-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644992284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5bvR+cQM7kV3vvOlHMfT04Bu7E+So7C7IqAwG4VLIwk=;
	b=HG60knYSaJ8Bu4MJJmZhbIq1qFdmwucRgKon//DxRsRgGBJDGC32h7nnRLzT5qj2XljJcn
	y99ZTUaFxE35fXM4RwDqocIu2AQS7GF8U8nLDj19rGa9GKvJTnOqjoWkyqvRuMy4BfUI/B
	Y6KiNN3KFBJKRRrcuxmitQVuIKp7oGQ=
Message-ID: <779968b4-5985-06bc-be35-ce5b0b719930@suse.com>
Date: Wed, 16 Feb 2022 07:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <wei.chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
 <d6f36774-ecb5-15f4-b0c0-6114724060e6@suse.com>
 <AC1B6659-FDCF-49A0-AB6E-EF2196C46D8C@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <AC1B6659-FDCF-49A0-AB6E-EF2196C46D8C@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ovTIL74uuOjogk659WmZWxj3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ovTIL74uuOjogk659WmZWxj3
Content-Type: multipart/mixed; boundary="------------H6jlegWSQ5SX3fL7M84qUChf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <wei.chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
Message-ID: <779968b4-5985-06bc-be35-ce5b0b719930@suse.com>
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
 <d6f36774-ecb5-15f4-b0c0-6114724060e6@suse.com>
 <AC1B6659-FDCF-49A0-AB6E-EF2196C46D8C@arm.com>
In-Reply-To: <AC1B6659-FDCF-49A0-AB6E-EF2196C46D8C@arm.com>

--------------H6jlegWSQ5SX3fL7M84qUChf
Content-Type: multipart/mixed; boundary="------------yzPp4c76nno0cq0RsKiSyjO6"

--------------yzPp4c76nno0cq0RsKiSyjO6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjIgMTg6NTYsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IA0KPiANCj4+IE9u
IDE1IEZlYiAyMDIyLCBhdCAxMDo0OCwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PiB3cm90ZToNCj4+DQo+PiBPbiAxNS4wMi4yMiAxMToxNSwgTHVjYSBGYW5jZWxsdSB3cm90
ZToNCj4+PiBJbnRyb2R1Y2UgYW4gYXJjaGl0ZWN0dXJlIHNwZWNpZmljIHdheSB0byBjcmVh
dGUgZGlmZmVyZW50IGNwdXBvb2xzDQo+Pj4gYXQgYm9vdCB0aW1lLCB0aGlzIGlzIHBhcnRp
Y3VsYXJseSB1c2VmdWwgb24gQVJNIGJpZy5MSVRUTEUgc3lzdGVtDQo+Pj4gd2hlcmUgdGhl
cmUgbWlnaHQgYmUgdGhlIG5lZWQgdG8gaGF2ZSBkaWZmZXJlbnQgY3B1cG9vbHMgZm9yIGVh
Y2ggdHlwZQ0KPj4+IG9mIGNvcmUsIGJ1dCBhbHNvIHN5c3RlbXMgdXNpbmcgTlVNQSBjYW4g
aGF2ZSBkaWZmZXJlbnQgY3B1IHBvb2xzIGZvcg0KPj4+IGVhY2ggbm9kZS4NCj4+PiBUaGUg
ZmVhdHVyZSBvbiBhcm0gcmVsaWVzIG9uIGEgc3BlY2lmaWNhdGlvbiBvZiB0aGUgY3B1cG9v
bHMgZnJvbSB0aGUNCj4+PiBkZXZpY2UgdHJlZSB0byBidWlsZCBwb29scyBhbmQgYXNzaWdu
IGNwdXMgdG8gdGhlbS4NCj4+PiBEb2N1bWVudGF0aW9uIGlzIGNyZWF0ZWQgdG8gZXhwbGFp
biB0aGUgZmVhdHVyZS4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNh
LmZhbmNlbGx1QGFybS5jb20+DQo+Pg0KPj4gSUlSQyBJIHN1Z2dlc3RlZCB0byBoYXZlIHRo
ZSBjb3JlIGZ1bmN0aW9uYWxpdHkgaW4gY29tbW9uIGNvZGUgaW4gb3JkZXINCj4+IHRvIGFs
bG93IHVzaW5nIGJvb3QgdGltZSBjcHVwb29sIGNyZWF0aW9uIGUuZy4gdmlhIGNvbW1hbmRs
aW5lIGZvciB4ODYsDQo+PiB0b28uDQo+IA0KPiBZZXMsIGhvd2V2ZXIgSSB0aGluayB0aGUg
cGFyc2VyIHRvIGhhbmRsZSBldmVyeXRoaW5nIGJ5IGNvbW1hbmQgbGluZSB3b3VsZA0KPiBi
ZSBodWdlIGR1ZSB0byBpbnB1dCBzYW5pdGlzYXRpb24gYW5kIG5vdCBlYXN5IGVub3VnaCBh
cyB0aGUgRFQsIGhvd2V2ZXINCj4gSSBzZWUgSHlwZXJsYXVuY2ggaGFzIHBsYW5zIHRvIHVz
ZSBEVCBvbiB4ODYgc28gSSBndWVzcyBpdCB3b3VsZCBiZSBvayB0byBtYWtlDQo+IHRoaXMg
ZmVhdHVyZSBjb21tb24gb25jZSB0aGUgRFQgaXMgYXZhaWxhYmxlIGFsc28gb24geDg2Lg0K
DQpFdmVyeXRoaW5nIG5vdCBiZWluZyBleHBsaWNpdGx5IHNwZWNpZmljIHRvIEFybSBzaG91
bGQgYmUgaW4gY29tbW9uDQpjb2RlLiBUaGluayBvZiB0aGUgd29yayBpbiBwcm9ncmVzcyBm
b3IgUmlzYy1WLg0KDQoNCkp1ZXJnZW4NCg==
--------------yzPp4c76nno0cq0RsKiSyjO6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------yzPp4c76nno0cq0RsKiSyjO6--

--------------H6jlegWSQ5SX3fL7M84qUChf--

--------------ovTIL74uuOjogk659WmZWxj3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIMlxsFAwAAAAAACgkQsN6d1ii/Ey9A
0Qf9FStUv1v/JKdYReG22mCGvkekmgzJGFf1hPFJf92Ne9KGm1/tyvZHXDD/aSfy1pFr4YBZVzYC
vyMFwFBd491/aUpqsSbkX/8D7ApdlEVPaqbXfPEQyDP85JBHDOTaJivH9e02nePu+bx4I08Go387
ZwcG6jJiyO8rT9deEVSST0uU/QByYnUM8ZeLVLHlWVPN/53rtIsOKVwR8LjOWEP3NvVLqbgI+YQl
EwvKGpq2BOPPvB52Ppw/oJC7X+/NxZD4Qi2hGFEIjgoG1WpMD8Eosa/fFOB21j5oEvcdwGSf707n
ZN3aCRIStaOnpepeOzGDYoYO388A35ofbsQX+ijmNQ==
=UAC2
-----END PGP SIGNATURE-----

--------------ovTIL74uuOjogk659WmZWxj3--

