Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45C7435DF
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 09:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557322.870578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF8fr-0005zc-O0; Fri, 30 Jun 2023 07:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557322.870578; Fri, 30 Jun 2023 07:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF8fr-0005wb-Kq; Fri, 30 Jun 2023 07:36:11 +0000
Received: by outflank-mailman (input) for mailman id 557322;
 Fri, 30 Jun 2023 07:36:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c0kD=CS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qF8fq-0004bB-9r
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 07:36:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c787e859-1718-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 09:36:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9F7591F8C8;
 Fri, 30 Jun 2023 07:36:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 78AC013915;
 Fri, 30 Jun 2023 07:36:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id I9HxG+iFnmQUNQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 30 Jun 2023 07:36:08 +0000
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
X-Inumbo-ID: c787e859-1718-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688110568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z97oIavw+21YvOCGRqlSwDtMZrI1sWPlTQeKoest9uI=;
	b=RHtomJEO/0U1gBet4Fjv1BsJvCiKdO6e9LjfLD2FZnCAA3On9FS3w+odf0ysgkJ6J39AgM
	w/XgRVClA4X+199PA+/H+AMCeIs9rO95ptT2CZxzqkPn4fmBW1WALSX0eqrzu5gAVCwrwv
	LHFiwkzFmtEuqa8JV2v5dRnQNpj2l7E=
Message-ID: <9903797f-0d6c-3729-332d-540dae288fff@suse.com>
Date: Fri, 30 Jun 2023 09:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 10/11] tools/xenstore: drop use of tdb
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-11-jgross@suse.com>
 <e7e5d74e-9a74-2147-cd4d-e8e359742406@xen.org>
 <5ad21b11-2ed3-8c6f-f206-90bbda5ca9fb@suse.com>
In-Reply-To: <5ad21b11-2ed3-8c6f-f206-90bbda5ca9fb@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Vb0UvnpKvpceY6bdHUal2rdK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Vb0UvnpKvpceY6bdHUal2rdK
Content-Type: multipart/mixed; boundary="------------irMhnR08i1ogy1PA6og65Wry";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <9903797f-0d6c-3729-332d-540dae288fff@suse.com>
Subject: Re: [PATCH 10/11] tools/xenstore: drop use of tdb
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-11-jgross@suse.com>
 <e7e5d74e-9a74-2147-cd4d-e8e359742406@xen.org>
 <5ad21b11-2ed3-8c6f-f206-90bbda5ca9fb@suse.com>
In-Reply-To: <5ad21b11-2ed3-8c6f-f206-90bbda5ca9fb@suse.com>

--------------irMhnR08i1ogy1PA6og65Wry
Content-Type: multipart/mixed; boundary="------------0t1FeJGcHXwq0cuokhvpg7yC"

--------------0t1FeJGcHXwq0cuokhvpg7yC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDYuMjMgMTM6MzAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDIwLjA2LjIz
IDE1OjA5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBIaSBKdWVyZ2VuLA0KPj4NCj4+IE9u
IDMwLzA1LzIwMjMgMTA6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gVG9kYXkgYWxs
IFhlbnN0b3JlIG5vZGVzIGFyZSBzdG9yZWQgaW4gYSBUREIgZGF0YSBiYXNlLiBUaGlzIGRh
dGEgYmFzZQ0KPj4+IGhhcyBzZXZlcmFsIGRpc2FkdmFudGFnZXM6DQo+Pj4NCj4+PiAtIGl0
IGlzIHVzaW5nIGEgZml4ZWQgc2l6ZWQgaGFzaCB0YWJsZSwgcmVzdWx0aW5nIGluIGhpZ2gg
bWVtb3J5DQo+Pj4gwqDCoCBvdmVyaGVhZCBmb3Igc21hbGwgaW5zdGFsbGF0aW9ucyB3aXRo
IG9ubHkgdmVyeSBmZXcgVk1zLCBhbmQgYSByYXRoZXINCj4+PiDCoMKgIGxhcmdlIHBlcmZv
cm1hbmNlIGhpdCBmb3Igc3lzdGVtcyB3aXRoIGxvdHMgb2YgVk1zIGR1ZSB0byBtYW55DQo+
Pj4gwqDCoCBjb2xsaXNpb25zDQo+Pj4NCj4+PiAtIFhlbnN0b3JlIGlzIG9ubHkgc2luZ2xl
LXRocmVhZGVkLCB3aGlsZSBUREIgaXMgZGVzaWduZWQgdG8gYmUgZml0DQo+Pj4gwqDCoCBm
b3IgbXVsdGktdGhyZWFkZWQgdXNlIGNhc2VzLCByZXN1bHRpbmcgaW4gbXVjaCBoaWdoZXIg
Y29kZQ0KPj4+IMKgwqAgY29tcGxleGl0eSB0aGFuIG5lZWRlZA0KPj4+DQo+Pj4gLSBzcGVj
aWFsIHVzZSBjYXNlcyBvZiBYZW5zdG9yZSBhcmUgbm90IHBvc3NpYmxlIHRvIGltcGxlbWVu
dCB3aXRoIFREQg0KPj4+IMKgwqAgaW4gYW4gZWZmZWN0aXZlIHdheSwgd2hpbGUgYW4gaW1w
bGVtZW50YXRpb24gb2YgYSBkYXRhIGJhc2UgdGFpbG9yZWQNCj4+PiDCoMKgIGZvciBYZW5z
dG9yZSBjb3VsZCBzaW1wbGlmeSBzb21lIGhhbmRsaW5nIChlLmcuIHRyYW5zYWN0aW9ucykg
YSBsb3QNCj4+Pg0KPj4+IFNvIGRyb3AgdXNpbmcgVERCIGFuZCBzdG9yZSB0aGUgbm9kZXMg
ZGlyZWN0bHkgaW4gbWVtb3J5IG1ha2luZyB0aGVtDQo+Pj4gZWFzaWx5IGFjY2Vzc2libGUu
IFVzZSBhIGhhc2gtYmFzZWQgbG9va3VwIG1lY2hhbmlzbSBmb3IgZmFzdCBsb29rdXANCj4+
PiBvZiBub2RlcyBieSB0aGVpciBmdWxsIHBhdGguDQo+Pj4NCj4+PiBGb3Igbm93IG9ubHkg
cmVwbGFjZSBUREIga2VlcGluZyB0aGUgY3VycmVudCBhY2Nlc3MgZnVuY3Rpb25zLg0KPj4+
DQo+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0K
DQouLi4NCg0KPj4+IC3CoMKgwqAgc2V0X3RkYl9rZXkoZGJfbmFtZSwgJmtleSk7DQo+Pj4g
LcKgwqDCoCBkYXRhID0gdGRiX2ZldGNoKHRkYl9jdHgsIGtleSk7DQo+Pj4gLcKgwqDCoCBp
ZiAoIWRhdGEuZHB0cikNCj4+PiAtwqDCoMKgwqDCoMKgwqAgZXJybm8gPSAodGRiX2Vycm9y
KHRkYl9jdHgpID09IFREQl9FUlJfTk9FWElTVCkgPyBFTk9FTlQgOiBFSU87DQo+Pj4gLcKg
wqDCoCBlbHNlDQo+Pj4gLcKgwqDCoMKgwqDCoMKgICpzaXplID0gZGF0YS5kc2l6ZTsNCj4+
PiArwqDCoMKgIGhkciA9IGhhc2h0YWJsZV9zZWFyY2gobm9kZXMsIGRiX25hbWUpOw0KPj4+
ICvCoMKgwqAgaWYgKCFoZHIpIHsNCj4+PiArwqDCoMKgwqDCoMKgwqAgZXJybm8gPSBFTk9F
TlQ7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBOVUxMOw0KPj4+ICvCoMKgwqAgfQ0K
Pj4+ICsNCj4+PiArwqDCoMKgICpzaXplID0gc2l6ZW9mKCpoZHIpICsgaGRyLT5udW1fcGVy
bXMgKiBzaXplb2YoaGRyLT5wZXJtc1swXSkgKw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBoZHIt
PmRhdGFsZW4gKyBoZHItPmNoaWxkbGVuOw0KPj4NCj4+IEFGQUlDVCwgdGhpcyBpcyB0aGUg
c2FtZSBjb21wdXRhdGlvbiBhcyBpbiB3cml0ZV9ub2RlX3Jhdy4gQ2FuIHdlIGludHJvZHVj
ZSBhIA0KPj4gd3JhcHBlciBmb3IgaXQ/DQo+IA0KPiBPa2F5Lg0KDQpUaGVyZSBpcyBhIGRp
ZmZlcmVuY2U6IGhlcmUgd2UgYXJlIHVzaW5nIHRoZSB2YWx1ZXMgZnJvbSB4c190ZGJfcmVj
b3JkX2hkciwNCndoaWxlIGluIHdyaXRlX25vZGVfcmF3KCkgdGhlIHZhbHVlcyBhcmUgdGFr
ZW4gZnJvbSBzdHJ1Y3Qgbm9kZS4NCg0KSSdsbCBjaGFuZ2UgdGhhdCBpbiBhIGZvbGxvd3Vw
IHBhdGNoLg0KDQoNCkp1ZXJnZW4NCg==
--------------0t1FeJGcHXwq0cuokhvpg7yC
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0t1FeJGcHXwq0cuokhvpg7yC--

--------------irMhnR08i1ogy1PA6og65Wry--

--------------Vb0UvnpKvpceY6bdHUal2rdK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSehecFAwAAAAAACgkQsN6d1ii/Ey/Y
QggAhK2R4X2HYWjTXZZWUoX4WNOpiNEtd843ZlxAkPlAGbraJrn+jZjZGSEh3bSZhiXxBAomxL20
IzqG8axIOtBT3KPjLMf6gZlyZVWu4MWKMnJS5GoVFZTI2wFAP9ow3Dzz+UQdHDj1Z9DCeZZsEJtQ
e4nJUThS6tnXIFrhzHKnWC8Ioju22EyY3TEDBbXPzNL1VvskSnX6fAPgJ4b9r1uCs/Y9K9dIN0ip
kINqmHAdLhqQ7AL0JvWTYUZumQwY3y2+NFj8o4JYTPaDxto5ui010iRMA0seCGWTbpoQ1TziMOEd
fFSghrN03fdCGYd/+zmVnKBZeLO1RIm9/PM5IyCT/g==
=a/WL
-----END PGP SIGNATURE-----

--------------Vb0UvnpKvpceY6bdHUal2rdK--

