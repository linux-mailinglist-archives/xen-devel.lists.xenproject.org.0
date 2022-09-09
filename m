Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B4C5B38B6
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 15:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404333.646772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdqR-0002rK-Mf; Fri, 09 Sep 2022 13:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404333.646772; Fri, 09 Sep 2022 13:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdqR-0002ok-JR; Fri, 09 Sep 2022 13:14:55 +0000
Received: by outflank-mailman (input) for mailman id 404333;
 Fri, 09 Sep 2022 13:14:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWdqP-0002oc-Pl
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 13:14:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63cf106f-3041-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 15:14:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 38E632234C;
 Fri,  9 Sep 2022 13:14:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DFAC1139D5;
 Fri,  9 Sep 2022 13:14:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fo9INUs8G2OQPgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 09 Sep 2022 13:14:51 +0000
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
X-Inumbo-ID: 63cf106f-3041-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662729292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=scRnJP/JuV2jZCnjGe22eIFb49vl3mT1NhXdMvi1pWo=;
	b=LQKOdNl4ocaI4OLwhEoHRAb2uhKJg6P2MldBDhq9nimpaGWeNVOv/L1dMWCNNNC0zl3/GA
	/cYQ/RI0s8akh08r1l2xUHm7EYiblMHeB/j4wZAnM9M8eYGXRQpdatZxmfVtV4IqQBuWZl
	dewLI17br9vtBr49NQvTgMjPLq2OJvo=
Message-ID: <ef0dd380-af85-65bc-e2be-1cabbb3ab45b@suse.com>
Date: Fri, 9 Sep 2022 15:14:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3] xen/gnttab: fix gnttab_acquire_resource()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20220909125347.25734-1-jgross@suse.com>
 <903fe035-73ae-72cd-f721-1b418295a7c4@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <903fe035-73ae-72cd-f721-1b418295a7c4@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------v4yN6R9YHbRWeJ1F4y0KuElI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------v4yN6R9YHbRWeJ1F4y0KuElI
Content-Type: multipart/mixed; boundary="------------BYzJJGhgAed6S6vxevYZmy4c";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <ef0dd380-af85-65bc-e2be-1cabbb3ab45b@suse.com>
Subject: Re: [PATCH v3] xen/gnttab: fix gnttab_acquire_resource()
References: <20220909125347.25734-1-jgross@suse.com>
 <903fe035-73ae-72cd-f721-1b418295a7c4@citrix.com>
In-Reply-To: <903fe035-73ae-72cd-f721-1b418295a7c4@citrix.com>

--------------BYzJJGhgAed6S6vxevYZmy4c
Content-Type: multipart/mixed; boundary="------------yk0i6c1rtOQ1Cwx44R4waejR"

--------------yk0i6c1rtOQ1Cwx44R4waejR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDkuMjIgMTU6MTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA5LzA5LzIw
MjIgMTM6NTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBDb21taXQgOWRjNDYzODZkODlk
ICgiZ250dGFiOiB3b3JrIGFyb3VuZCAibWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCINCj4+
IHdhcm5pbmciKSB3YXMgd3JvbmcsIGFzIHZhZGRycyBjYW4gbGVnaXRpbWF0ZWx5IGJlIE5V
TEwgaW4gY2FzZQ0KPj4gWEVOTUVNX3Jlc291cmNlX2dyYW50X3RhYmxlX2lkX3N0YXR1cyB3
YXMgc3BlY2lmaWVkIGZvciBhIGdyYW50IHRhYmxlDQo+PiB2MS4gVGhpcyB3b3VsZCByZXN1
bHQgaW4gY3Jhc2hlcyBpbiBkZWJ1ZyBidWlsZHMgZHVlIHRvDQo+PiBBU1NFUlRfVU5SRUFD
SEFCTEUoKSB0cmlnZ2VyaW5nLg0KPj4NCj4+IENoZWNrIHZhZGRycyBvbmx5IHRvIGJlIE5V
TEwgaW4gdGhlIHJjID09IDAgY2FzZS4NCj4+DQo+PiBFeHBhbmQgdGhlIHRlc3RzIGluIHRv
b2xzL3Rlc3RzL3Jlc291cmNlIHRvIHZlcmlmeSB0aGF0IHVzaW5nDQo+PiBYRU5NRU1fcmVz
b3VyY2VfZ3JhbnRfdGFibGVfaWRfc3RhdHVzIG9uIGEgVjEgZ3JhbnQgdGFibGUgd2lsbCBy
ZXN1bHQNCj4+IGluIEVJTlZBTC4NCj4+DQo+PiBGaXhlczogOWRjNDYzODZkODlkICgiZ250
dGFiOiB3b3JrIGFyb3VuZCAibWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCIgd2FybmluZyIp
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+
PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiAjIHhlbg0K
Pj4gUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0K
Pj4gLS0tDQo+PiBWMjoNCj4+IC0gcmV3b3JrIChKYW4gQmV1bGljaCwgSnVsaWVuIEdyYWxs
KQ0KPj4gVjM6DQo+PiAtIGFkZGVkIHRlc3Qgc3VwcG9ydCAoQW5kcmV3IENvb3BlcikNCj4+
IC0tLQ0KPj4gICB0b29scy90ZXN0cy9yZXNvdXJjZS90ZXN0LXJlc291cmNlLmMgfCAxMSAr
KysrKysrKysrKw0KPj4gICB4ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgICAgICAgICAgICAg
fCAgMiArLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdHMvcmVzb3VyY2UvdGVz
dC1yZXNvdXJjZS5jIGIvdG9vbHMvdGVzdHMvcmVzb3VyY2UvdGVzdC1yZXNvdXJjZS5jDQo+
PiBpbmRleCAxODkzNTNlYmNiLi43MWE4MWYyMDdlIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMv
dGVzdHMvcmVzb3VyY2UvdGVzdC1yZXNvdXJjZS5jDQo+PiArKysgYi90b29scy90ZXN0cy9y
ZXNvdXJjZS90ZXN0LXJlc291cmNlLmMNCj4+IEBAIC0xMDYsNiArMTA2LDE3IEBAIHN0YXRp
YyB2b2lkIHRlc3RfZ250dGFiKHVpbnQzMl90IGRvbWlkLCB1bnNpZ25lZCBpbnQgbnJfZnJh
bWVzLA0KPj4gICAgICAgaWYgKCByYyApDQo+PiAgICAgICAgICAgcmV0dXJuIGZhaWwoIiAg
ICBGYWlsOiBVbm1hcCBncmFudCB0YWJsZSAlZCAtICVzXG4iLA0KPj4gICAgICAgICAgICAg
ICAgICAgICAgIGVycm5vLCBzdHJlcnJvcihlcnJubykpOw0KPj4gKw0KPj4gKyAgICAvKiBW
ZXJpZnkgdGhhdCB0aGUgYXR0ZW1wdCB0byBtYXAgdGhlIHN0YXR1cyBmcmFtZXMgaXMgZmFp
bGluZyBmb3IgVjEuICovDQo+PiArICAgIHJlcyA9IHhlbmZvcmVpZ25tZW1vcnlfbWFwX3Jl
c291cmNlKA0KPj4gKyAgICAgICAgZmgsIGRvbWlkLCBYRU5NRU1fcmVzb3VyY2VfZ3JhbnRf
dGFibGUsDQo+PiArICAgICAgICBYRU5NRU1fcmVzb3VyY2VfZ3JhbnRfdGFibGVfaWRfc3Rh
dHVzLCAwLCAxLA0KPj4gKyAgICAgICAgKHZvaWQgKiopJmdudHRhYiwgUFJPVF9SRUFEIHwg
UFJPVF9XUklURSwgMCk7DQo+PiArICAgIGlmICggcmVzIHx8IGVycm5vICE9IEVJTlZBTCAp
DQo+PiArICAgICAgICBmYWlsKCIgICAgRmFpbDogTWFwIHN0YXR1cyBub3QgZmFpbGluZyB3
aXRoIEVJTlZBTCAlZCAtICVzXG4iLA0KPj4gKyAgICAgICAgICAgICByZXMgPyAwIDogZXJy
bm8sIHJlcyA/ICJubyBlcnJvciIgOiBzdHJlcnJvcihlcnJubykpOw0KPiANCj4gSSdkIHJl
Y29tbWVuZCBub3QgY2hlY2tpbmcgZm9yIEVJTlZBTCBzcGVjaWZpY2FsbHkuwqAgVGhpcyBo
YXMgYml0dGVuIFhURg0KPiBpbiB0aGUgcGFzdCB3aGVuIFhTQXMgaGF2ZSBjYXVzZWQgb25l
IGVycm9yIHRvIHR1cm4gaW50byBhbm90aGVyLCBhbmQNCj4gcGxlbnR5IG9mIGh5cGVyY2Fs
bHMgaGF2ZSBleGFjdCBlcnJub3Mgd2hpY2ggY2hhbmdlIGRlcGVuZGluZyBvbiBob3cgWGVu
DQo+IGlzIGNvbXBpbGVkLg0KPiANCj4gSSdkIGdvIHdpdGggdGhlIG1vcmUgc2ltcGxlOg0K
PiANCj4gaWYgKCByZXMgKQ0KPiB7DQo+ICDCoMKgwqAgZmFpbCgiwqDCoMKgIEZhaWw6IE1h
bmFnZWQgdG8gbWFwIGdudHRhYiB2MiBzdGF0dXMgZnJhbWVzIGluIHYxIG1vZGVcbiIpOw0K
PiAgwqDCoMKgIHhlbmZvcmVpZ25tZW1vcnlfdW5tYXBfcmVzb3VyY2UoZmgsIHJlcyk7DQo+
IH0NCj4gDQo+IEV2ZXJ5dGhpbmcgZWxzZSBsb29rcyBmaW5lLCBzbyBJJ20gaGFwcHkgdG8g
Zml4IHRoaXMgdXAgb24gY29tbWl0Lg0KDQpUaGFua3MuIFBsZWFzZSBhZGFwdCB0aGUgY29t
bWl0IG1lc3NhZ2UgYWNjb3JkaW5nbHkuDQoNCkJUVywgSSd2ZSB2ZXJpZmllZCB0aGF0IHRo
ZSBzeXN0ZW0gY3Jhc2hlcyB3aXRob3V0IHRoZSBoeXBlcnZpc29yIGNoYW5nZS4NCg0KDQpK
dWVyZ2VuDQo=
--------------yk0i6c1rtOQ1Cwx44R4waejR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------yk0i6c1rtOQ1Cwx44R4waejR--

--------------BYzJJGhgAed6S6vxevYZmy4c--

--------------v4yN6R9YHbRWeJ1F4y0KuElI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMbPEsFAwAAAAAACgkQsN6d1ii/Ey/g
MAf+MCbYG+Qqu3kPPFLrrezIkKdi/gzscwu9YJU4BYUEtlurRWTejLuFRBN6uDhac1ehX7YZGiwn
imiSRjRm3VMth+s7YsDX5m5Al598miwyQPZiNiR+d/riCQPGH4phLca3aiUdZr6iqJd5UR2xTYCI
Ve9n2b1IJUugJBuNwyY07V/7Uo/ax4ZWcnQeuamm5OndB0MLp39dAWdUKqTJImS1u9t4wDl+UFpn
iShZySOcDN0SPCufGiUX+gRgN1GacCeQnjaqX+tnkZMdjS+C8Re6kQAv1oGdrGqjg8Gdyb6xGZzG
GHcVEib6i05J0je5joOPRHaboBYyYlpzW6Komff6kg==
=EuHx
-----END PGP SIGNATURE-----

--------------v4yN6R9YHbRWeJ1F4y0KuElI--

