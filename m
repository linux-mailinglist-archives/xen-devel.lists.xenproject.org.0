Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D30C58886B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 10:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379636.613242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9Jv-0001Dz-PJ; Wed, 03 Aug 2022 08:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379636.613242; Wed, 03 Aug 2022 08:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9Jv-0001BU-Lj; Wed, 03 Aug 2022 08:01:35 +0000
Received: by outflank-mailman (input) for mailman id 379636;
 Wed, 03 Aug 2022 08:01:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCkI=YH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oJ9Ju-0001BM-5q
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 08:01:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d23a05b-1302-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 10:01:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 88B4133F84;
 Wed,  3 Aug 2022 08:01:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61FC613AD8;
 Wed,  3 Aug 2022 08:01:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XUxzFlwr6mKrXAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 Aug 2022 08:01:32 +0000
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
X-Inumbo-ID: 7d23a05b-1302-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659513692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v8b1NqxwDCxooa1mIq0gP8PGUtFnRNv14tMnVpQO/ss=;
	b=NWhLLaWSW1W8Y2DIOtoKw5EYCQD7ohdgshmMFyWSZcqAfShpKvv+PapDFqcQ+9VnYxHxwW
	ap+utokTB0ddrKoTkgusX/9VSI1P83/ocSVRxEL8lQ3r6Hku6Odv8OFscutgQNFXsHRd6e
	CGxT8DTWIKd44xUxEIoWkV6V7hYsBNU=
Message-ID: <8b51d326-feb5-2aac-80f7-969ef8bd2ba6@suse.com>
Date: Wed, 3 Aug 2022 10:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220802132747.22507-1-jgross@suse.com>
 <20220802132747.22507-2-jgross@suse.com>
 <266615bb-1465-f38c-5eee-ad2f4e7256fa@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/3] xen/sched: introduce cpupool_update_node_affinity()
In-Reply-To: <266615bb-1465-f38c-5eee-ad2f4e7256fa@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------O54ttd6Vs0G5ETyL65UenXA5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------O54ttd6Vs0G5ETyL65UenXA5
Content-Type: multipart/mixed; boundary="------------MO0k5DZmyNAcWJETroDaLwPc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Message-ID: <8b51d326-feb5-2aac-80f7-969ef8bd2ba6@suse.com>
Subject: Re: [PATCH 1/3] xen/sched: introduce cpupool_update_node_affinity()
References: <20220802132747.22507-1-jgross@suse.com>
 <20220802132747.22507-2-jgross@suse.com>
 <266615bb-1465-f38c-5eee-ad2f4e7256fa@suse.com>
In-Reply-To: <266615bb-1465-f38c-5eee-ad2f4e7256fa@suse.com>

--------------MO0k5DZmyNAcWJETroDaLwPc
Content-Type: multipart/mixed; boundary="------------Umuf1Ub56bwqiO3LWRjNYTap"

--------------Umuf1Ub56bwqiO3LWRjNYTap
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDguMjIgMDk6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMi4wOC4yMDIy
IDE1OjI3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZC9jb3JlLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+PiBAQCAtMTc5
MCwyOCArMTc5MCwxNCBAQCBpbnQgdmNwdV9hZmZpbml0eV9kb21jdGwoc3RydWN0IGRvbWFp
biAqZCwgdWludDMyX3QgY21kLA0KPj4gICAgICAgcmV0dXJuIHJldDsNCj4+ICAgfQ0KPj4g
ICANCj4+IC12b2lkIGRvbWFpbl91cGRhdGVfbm9kZV9hZmZpbml0eShzdHJ1Y3QgZG9tYWlu
ICpkKQ0KPj4gK3ZvaWQgZG9tYWluX3VwZGF0ZV9ub2RlX2FmZmluaXR5X25vYWxsb2Moc3Ry
dWN0IGRvbWFpbiAqZCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IGNwdW1hc2tfdCAqb25saW5lLA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGFmZmluaXR5X21hc2tzICphZmZpbml0
eSkNCj4+ICAgew0KPj4gLSAgICBjcHVtYXNrX3Zhcl90IGRvbV9jcHVtYXNrLCBkb21fY3B1
bWFza19zb2Z0Ow0KPj4gICAgICAgY3B1bWFza190ICpkb21fYWZmaW5pdHk7DQo+PiAtICAg
IGNvbnN0IGNwdW1hc2tfdCAqb25saW5lOw0KPj4gICAgICAgc3RydWN0IHNjaGVkX3VuaXQg
KnVuaXQ7DQo+PiAgICAgICB1bnNpZ25lZCBpbnQgY3B1Ow0KPj4gICANCj4+IC0gICAgLyog
RG8gd2UgaGF2ZSB2Y3B1cyBhbHJlYWR5PyBJZiBub3QsIG5vIG5lZWQgdG8gdXBkYXRlIG5v
ZGUtYWZmaW5pdHkuICovDQo+PiAtICAgIGlmICggIWQtPnZjcHUgfHwgIWQtPnZjcHVbMF0g
KQ0KPj4gLSAgICAgICAgcmV0dXJuOw0KPj4gLQ0KPj4gLSAgICBpZiAoICF6YWxsb2NfY3B1
bWFza192YXIoJmRvbV9jcHVtYXNrKSApDQo+PiAtICAgICAgICByZXR1cm47DQo+PiAtICAg
IGlmICggIXphbGxvY19jcHVtYXNrX3ZhcigmZG9tX2NwdW1hc2tfc29mdCkgKQ0KPj4gLSAg
ICB7DQo+PiAtICAgICAgICBmcmVlX2NwdW1hc2tfdmFyKGRvbV9jcHVtYXNrKTsNCj4+IC0g
ICAgICAgIHJldHVybjsNCj4+IC0gICAgfQ0KPiANCj4gSW5zdGVhZCBvZiBzcGxpdHRpbmcg
dGhlIGZ1bmN0aW9uLCBkaWQgeW91IGNvbnNpZGVyIHVzaW5nDQo+IGNvbmRfemFsbG9jX2Nw
dW1hc2tfdmFyKCkgaGVyZSwgdGh1cyBhbGxvd2luZyAoYnV0IG5vdCByZXF1aXJpbmcpDQo+
IGNhbGxlcnMgdG8gcHJlLWFsbG9jYXRlIHRoZSBtYXNrcz8gV291bGQgaW1vIGJlIHF1aXRl
IGEgYml0IGxlc3MNCj4gY29kZSBjaHVybiAoSSB0aGluaykuDQoNClRoaXMgd291bGQgcmVx
dWlyZSB0byBjaGFuZ2UgYWxsIGNhbGxlcnMgb2YgZG9tYWluX3VwZGF0ZV9ub2RlX2FmZmlu
aXR5KCkNCnRvIGFkZCB0aGUgYWRkaXRpb25hbCBtYXNrIHBhcmFtZXRlci4gVGhlIG5vdyBj
b21tb24vc2NoZWQgbG9jYWwgc3RydWN0DQphZmZpbml0eV9tYXNrcyB3b3VsZCB0aGVuIG5l
ZWQgdG8gbWFkZSBnbG9iYWxseSB2aXNpYmxlLg0KDQpJJ20gbm90IHN1cmUgdGhpcyBpcyBh
IGdvb2QgaWRlYS4NCg0KPiANCj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5j
DQo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NwdXBvb2wuYw0KPj4gQEAgLTQxMCw2ICs0
MTAsNDggQEAgaW50IGNwdXBvb2xfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3Ry
dWN0IGNwdXBvb2wgKmMpDQo+PiAgICAgICByZXR1cm4gcmV0Ow0KPj4gICB9DQo+PiAgIA0K
Pj4gKy8qIFVwZGF0ZSBhZmZpbml0aWVzIG9mIGFsbCBkb21haW5zIGluIGEgY3B1cG9vbC4g
Ki8NCj4+ICtzdGF0aWMgaW50IGNwdXBvb2xfYWxsb2NfYWZmaW5fbWFza3Moc3RydWN0IGFm
ZmluaXR5X21hc2tzICptYXNrcykNCj4+ICt7DQo+PiArICAgIGlmICggIWFsbG9jX2NwdW1h
c2tfdmFyKCZtYXNrcy0+aGFyZCkgKQ0KPj4gKyAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+
PiArICAgIGlmICggYWxsb2NfY3B1bWFza192YXIoJm1hc2tzLT5zb2Z0KSApDQo+PiArICAg
ICAgICByZXR1cm4gMDsNCj4+ICsNCj4+ICsgICAgZnJlZV9jcHVtYXNrX3ZhcihtYXNrcy0+
aGFyZCk7DQo+PiArICAgIHJldHVybiAtRU5PTUVNOw0KPj4gK30NCj4gDQo+IFdvdWxkbid0
IHRoaXMgYmUgYSBuaWNlIGdlbmVyYWwgaGVscGVyIGZ1bmN0aW9uLCBhbHNvIHVzYWJsZSBm
cm9tDQo+IG91dHNpZGUgb2YgdGhpcyBDVT8NCg0KSSBjb25zaWRlcmVkIHRoYXQsIGJ1dCB3
YXNuJ3Qgc3VyZSB0aGlzIGlzIHJlYWxseSBoZWxwZnVsLiBUaGUgb25seQ0KcG90ZW50aWFs
IG90aGVyIHVzZXIgd291bGQgYmUgZG9tYWluX3VwZGF0ZV9ub2RlX2FmZmluaXR5KCksIHJl
cXVpcmluZw0KdG8gdXNlIHRoZSB6YWxsb2MgdmFyaWFudCBvZiB0aGUgYWxsb2NhdGlvbiBp
biB0aGUgaGVscGVyIChub3QgdGhhdCB0aGlzDQp3b3VsZCBiZSBhIG1ham9yIHByb2JsZW0s
IHRob3VnaCkuDQoNCj4gQXMgYSBuaXQgLSByaWdodCBub3cgdGhlIG9ubHkgY2FsbGVyIHRy
ZWF0cyB0aGUgcmV0dXJuIHZhbHVlIGFzIGJvb2xlYW4sDQo+IHNvIHBlcmhhcHMgdGhlIGZ1
bmN0aW9uIGJldHRlciB3b3VsZCByZXR1cm4gYm9vbD8NCg0KSSBjYW4gZG8gdGhhdC4NCg0K
DQpKdWVyZ2VuDQo=
--------------Umuf1Ub56bwqiO3LWRjNYTap
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Umuf1Ub56bwqiO3LWRjNYTap--

--------------MO0k5DZmyNAcWJETroDaLwPc--

--------------O54ttd6Vs0G5ETyL65UenXA5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLqK1wFAwAAAAAACgkQsN6d1ii/Ey8o
HggAkzcgTQrRbV+5CKhpOX9gTX364UzAof/TR5FIKPBJJK9Uvod+/sHPNJW9Yj0mbbQHPkzZ24E+
saDSUVD+xJPRbM2aGS1koOPU3+GyyFbj295u9c6axCPgGn9hELqrGE000N8vb8NhA2vzSX5vjWRV
RRB2j0BbgMRQY9hZo7eohLG2YCCcFeuhTReAm16ateKkWDh3f/Jww5fpsiAqNzkv+fvmnlzHDfqS
6WAQp3EopBN0P8v5RzY5usisljJ2uzIEKLOjo1lMrFRNs4J5x7MZJzlyvngeMH0fiptE+XXZg0qo
OG+OLWyeHpNpE5ykkZ0BM9q5YOohDFDchwRQHWtDfA==
=qEhM
-----END PGP SIGNATURE-----

--------------O54ttd6Vs0G5ETyL65UenXA5--

