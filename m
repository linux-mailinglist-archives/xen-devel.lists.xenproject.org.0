Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75F769C529
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 07:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497947.768737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTzR5-0001b0-Qc; Mon, 20 Feb 2023 06:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497947.768737; Mon, 20 Feb 2023 06:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTzR5-0001YG-ND; Mon, 20 Feb 2023 06:14:03 +0000
Received: by outflank-mailman (input) for mailman id 497947;
 Mon, 20 Feb 2023 06:14:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HMXb=6Q=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pTzR3-0001YA-Lk
 for xen-devel@lists.xen.org; Mon, 20 Feb 2023 06:14:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c23f34dc-b0e5-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 07:13:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C00155BD7F;
 Mon, 20 Feb 2023 06:13:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B0EF139DB;
 Mon, 20 Feb 2023 06:13:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r4y4G6QP82NAKwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Feb 2023 06:13:56 +0000
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
X-Inumbo-ID: c23f34dc-b0e5-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676873636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xkMgfOTP9yBloM5dxz1wd1szOdeiuzALKlIV98yQwHc=;
	b=jBrf6JHPSFjXCU9DUNW8NdNZLhDx2z932ySAqAaL0Y9uJzU65ftNlg/s7CnFU0krvRIHSi
	kXE5QR/p2HUrkqbKhrWiYOjjt2cRM6UvnnbZKiM2JKgAgSFseW/ZYlcGenOJcQk9y1cv4T
	D9Y4wqGaaV/aXXy9VCSHaoXCRdbFWGg=
Message-ID: <af173093-658c-1206-63c8-03825d66920e@suse.com>
Date: Mon, 20 Feb 2023 07:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, xen-devel@lists.xen.org
References: <20230216111325.tprjr7rdr52iqvmm@vireshk-i7>
 <5d945b2d-048a-fc66-023c-377f494b477b@citrix.com>
 <CAPD2p-mAOtfSRUgTOwu88umLfhjFugL4_WEBNJ7EJG90gPng4A@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [Discussion] Xen grants and access permissions
In-Reply-To: <CAPD2p-mAOtfSRUgTOwu88umLfhjFugL4_WEBNJ7EJG90gPng4A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fMz21R42LAA62UadcKYtrAah"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fMz21R42LAA62UadcKYtrAah
Content-Type: multipart/mixed; boundary="------------RESWvexSu3UmUpJ9nSGqwgrf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, xen-devel@lists.xen.org
Message-ID: <af173093-658c-1206-63c8-03825d66920e@suse.com>
Subject: Re: [Discussion] Xen grants and access permissions
References: <20230216111325.tprjr7rdr52iqvmm@vireshk-i7>
 <5d945b2d-048a-fc66-023c-377f494b477b@citrix.com>
 <CAPD2p-mAOtfSRUgTOwu88umLfhjFugL4_WEBNJ7EJG90gPng4A@mail.gmail.com>
In-Reply-To: <CAPD2p-mAOtfSRUgTOwu88umLfhjFugL4_WEBNJ7EJG90gPng4A@mail.gmail.com>

--------------RESWvexSu3UmUpJ9nSGqwgrf
Content-Type: multipart/mixed; boundary="------------3Gy1iyF38CUoAEuuIs9Qkisz"

--------------3Gy1iyF38CUoAEuuIs9Qkisz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDIuMjMgMTc6NDQsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPiBIZWxs
byBWaXJlc2guDQo+IA0KPiBbQ0NlZCBKw7xyZ2VuIHdobyBtaWdodCBoYXZlIHNvbWUgdGhv
dWdodHNdDQo+IFtTb3JyeSBmb3IgdGhlIHBvc3NpYmxlIGZvcm1hdCBpc3N1ZXNdDQo+IA0K
PiBPbiBUaHUsIEZlYiAxNiwgMjAyMyBhdCAxOjM2IFBNIEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20gDQo+IDxtYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4+IHdyb3RlOg0KPiANCj4gICAgIE9uIDE2LzAyLzIwMjMgMTE6MTMgYW0sIFZpcmVz
aCBLdW1hciB3cm90ZToNCj4gICAgICA+IEhpIE9sZWtzYW5kciwNCj4gICAgICA+DQo+ICAg
ICAgPiBBcyB5b3UgYWxyZWFkeSBrbm93LCBJIGFtIGxvb2tpbmcgYXQgaG93IHdlIGNhbiBp
bnRlZ3JhdGUgdGhlIFhlbg0KPiAgICAgID4gZ3JhbnRzIHdvcmsgaW4gb3VyIGltcGxlbWVu
dGF0aW9uIG9mIFJ1c3QgYmFzZWQgWGVuIHZob3N0IGZyb250ZW5kIFsxXS4NCj4gICAgICA+
DQo+ICAgICAgPiBUaGUgaHlwZXJ2aXNvciBpbmRlcGVuZGVudCB2aG9zdC11c2VyIGJhY2tl
bmRzIFsyXSB0YWxrIHRvDQo+ICAgICAgPiB4ZW4tdmhvc3QtZnJvbnRlbmQgdXNpbmcgdGhl
IHN0YW5kYXJkIHZob3N0LXVzZXIgcHJvdG9jb2wgWzNdLiBFdmVyeQ0KPiAgICAgID4gbWVt
b3J5IHJlZ2lvbiB0aGF0IHRoZSBiYWNrZW5kcyBnZXQgYWNjZXNzIHRvIGFyZSBzZW50IHRv
IGl0IGJ5IHRoZQ0KPiAgICAgID4gZnJvbnRlbmQgYXMgbWVtb3J5IHJlZ2lvbiBkZXNjcmlw
dG9ycywgd2hpY2ggY29udGFpbiBvbmx5IGFkZHJlc3MgYW5kDQo+ICAgICAgPiBzaXplIGlu
Zm9ybWF0aW9uIGFuZCBsYWNrIGFueSBwZXJtaXNzaW9uIGZsYWdzLg0KDQpUaGVyZSBhcmUg
bm8gcGVybWlzc2lvbiBmbGFncyBpbiBYZW4gUFYgZGV2aWNlIHByb3RvY29scyBlaXRoZXIu
IFRoZSBraW5kIG9mIGENCm1hcHBpbmcgKFJPIG9yIFJXKSBpbiB0aGUgYmFja2VuZCBpcyBz
ZWxlY3RlZCB2aWEgdGhlIEkvTyBvcGVyYXRpb246IGluIGNhc2UgaXQNCmlzIGEgd3JpdGUg
dHlwZSBvcGVyYXRpb24gKGd1ZXN0IHdyaXRpbmcgZGF0YSB0byBhIGRldmljZSksIHRoZSBy
ZWxhdGVkIGdyYW50cw0KYXJlIG1hcHBlciBhcyBSTyBpbiB0aGUgYmFja2VuZCwgaW4gYWxs
IG90aGVyIGNhc2VzIHRoZXkgYXJlIG1hcHBlZCBhcyBSVy4NCg0KVGhlIHNhbWUgYXBwbGll
cyB0byBncmFudGVkIHBhZ2VzIGZvciB2aXJ0aW86IHRoZSBmcm9udGVuZCBzaWRlIHdpbGwg
Z3JhbnQgdGhlDQpwYWdlIGFzIFJPIGluIGNhc2UgdGhlIEkvTyBvcGVyYXRpb24gaXMgZmxh
Z2dlZCBhcyAiRE1BX1RPX0RFVklDRSIsIGFuZCBhcyBSVw0KaW4gYWxsIG90aGVyIGNhc2Vz
LiBUaGUgYmFja2VuZCBzaG91bGQgYWx3YXlzIGtub3csIHdoaWNoIGRpcmVjdGlvbiB0aGUg
ZGF0YSBpcw0KZmxvd2luZywgc28gaXQgc2hvdWxkIGJlIGFibGUgdG8gZG8gdGhlIG1hcHBp
bmcgd2l0aCB0aGUgY29ycmVjdCBhY2Nlc3MgbW9kZS4NCg0KDQpKdWVyZ2VuDQo=
--------------3Gy1iyF38CUoAEuuIs9Qkisz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------3Gy1iyF38CUoAEuuIs9Qkisz--

--------------RESWvexSu3UmUpJ9nSGqwgrf--

--------------fMz21R42LAA62UadcKYtrAah
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPzD6QFAwAAAAAACgkQsN6d1ii/Ey/8
TQf+PNnXoQMtjxI+2nexCsiEfSLrjCX4B++4uq/3UsuUSMipeR3CcPyP6P4LZfmSpMLXHmqP6Khx
2tCWh717BLFgjWiqcOlhOQz78IZU7bmUMIaU2nxERq680EL/PFUsllkRQSKisg+Zf3xPkH8bjgn/
rYKIrhOUR8qZZ/zt7G3b1PlWpjcETLvfZrePOq65YUVwJg4D1a+2E1DAq92UYg2M+blzSlzYtMqa
ryP2secwWcWvdClINZOQI7oGj/SkoEjWcAWLuoRHnP1fUfZWtHvLMhNhmYrtH0pQ+1oGiB/wAlHT
k/zCZqaVKxa6m7YmsqzoCygRWwvKmej33aUZibihRQ==
=XcWA
-----END PGP SIGNATURE-----

--------------fMz21R42LAA62UadcKYtrAah--

