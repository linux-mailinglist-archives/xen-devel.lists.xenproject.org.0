Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD6064C476
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 08:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461777.719925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5MT2-0008U3-LV; Wed, 14 Dec 2022 07:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461777.719925; Wed, 14 Dec 2022 07:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5MT2-0008S2-IS; Wed, 14 Dec 2022 07:46:16 +0000
Received: by outflank-mailman (input) for mailman id 461777;
 Wed, 14 Dec 2022 07:46:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8nZ=4M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p5MT1-0008Ru-A2
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 07:46:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 623f6c35-7b83-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 08:46:14 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 812E821878;
 Wed, 14 Dec 2022 07:46:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 575C6138F6;
 Wed, 14 Dec 2022 07:46:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zGTtE0V/mWNoRwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 14 Dec 2022 07:46:13 +0000
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
X-Inumbo-ID: 623f6c35-7b83-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1671003973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GmTzt/eB5MUdxyQ5AL6gTML5riPlOse+Ynz/1qPbKhI=;
	b=T0veXJaeIC9WlRAzKmiR6frbfCazkAdMGwgnicds48QZDRyumdHWeCb7JqF4mkH83RXJ7V
	rIF3dwUiR+Ptb9svZT1Wo0zUmSY1z5nLtWx9iLcyMmoy3M4ZGS0GjSYOdyKkFdMm45DxF0
	VgwyASJcpvXUE2uDUd8gdUeky0AToOc=
Message-ID: <9a63c162-1684-1703-22f4-89c5dbf1ae71@suse.com>
Date: Wed, 14 Dec 2022 08:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 01/12] tools/xenstore: manage per-transaction domain
 accounting data in an array
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101160422.7212-1-jgross@suse.com>
 <20221101160422.7212-2-jgross@suse.com>
 <34de8b28-76d9-dcd4-8193-c327a02d94f3@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <34de8b28-76d9-dcd4-8193-c327a02d94f3@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OecxqhHZiILGZPa5uMZs7kD7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OecxqhHZiILGZPa5uMZs7kD7
Content-Type: multipart/mixed; boundary="------------m5qimV0hDTSSwtDXFx24DZ6i";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <9a63c162-1684-1703-22f4-89c5dbf1ae71@suse.com>
Subject: Re: [PATCH 01/12] tools/xenstore: manage per-transaction domain
 accounting data in an array
References: <20221101160422.7212-1-jgross@suse.com>
 <20221101160422.7212-2-jgross@suse.com>
 <34de8b28-76d9-dcd4-8193-c327a02d94f3@xen.org>
In-Reply-To: <34de8b28-76d9-dcd4-8193-c327a02d94f3@xen.org>

--------------m5qimV0hDTSSwtDXFx24DZ6i
Content-Type: multipart/mixed; boundary="------------U0mD0bG83tRouharJal0Zcbo"

--------------U0mD0bG83tRouharJal0Zcbo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTIuMjIgMjM6MTMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAxLzExLzIwMjIgMTY6MDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJ
biBvcmRlciB0byBwcmVwYXJlIGtlZXBpbmcgYWNjb3VudGluZyBkYXRhIGluIGFuIGFycmF5
IGluc3RlYWQgb2YNCj4+IHVzaW5nIGluZGVwZW5kZW50IGZpZWxkcywgc3dpdGNoIHRoZSBz
dHJ1Y3QgY2hhbmdlZF9kb21haW4gYWNjb3VudGluZw0KPj4gZGF0YSB0byB0aGF0IHNjaGVt
ZSwgZm9yIG5vdyBvbmx5IHVzaW5nIGFuIGFycmF5IHdpdGggb25lIGVsZW1lbnQuDQo+Pg0K
Pj4gSW4gb3JkZXIgdG8gYmUgYWJsZSB0byBleHRlbmQgdGhpcyBzY2hlbWUgYWRkIHRoZSBu
ZWVkZWQgaW5kZXhpbmcgZW51bQ0KPj4gdG8geGVuc3RvcmVkX2RvbWFpbi5oLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0t
LQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jIHwgMTcgKysrKysr
KysrLS0tLS0tLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uaCB8
wqAgNSArKysrKw0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5z
dG9yZWRfZG9tYWluLmMgDQo+PiBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4u
Yw0KPj4gaW5kZXggNTgyYjc4YjBlZS4uMzk5ZmM5MjBiYiAxMDA2NDQNCj4+IC0tLSBhL3Rv
b2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYw0KPj4gKysrIGIvdG9vbHMveGVuc3Rv
cmUveGVuc3RvcmVkX2RvbWFpbi5jDQo+PiBAQCAtOTksOCArOTksOCBAQCBzdHJ1Y3QgY2hh
bmdlZF9kb21haW4NCj4+IMKgwqDCoMKgwqAgLyogSWRlbnRpZmllciBvZiB0aGUgY2hhbmdl
ZCBkb21haW4uICovDQo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBkb21pZDsNCj4+IC3C
oMKgwqAgLyogQW1vdW50IGJ5IHdoaWNoIHRoaXMgZG9tYWluJ3MgbmJlbnRyeSBmaWVsZCBo
YXMgY2hhbmdlZC4gKi8NCj4+IC3CoMKgwqAgaW50IG5iZW50cnk7DQo+PiArwqDCoMKgIC8q
IEFjY291bnRpbmcgZGF0YS4gKi8NCj4+ICvCoMKgwqAgaW50IGFjY1tBQ0NfVFJfTl07DQo+
PiDCoCB9Ow0KPj4gwqAgc3RhdGljIHN0cnVjdCBoYXNodGFibGUgKmRvbWhhc2g7DQo+PiBA
QCAtNTU4LDcgKzU1OCw3IEBAIGludCBhY2NfZml4X2RvbWFpbnMoc3RydWN0IGxpc3RfaGVh
ZCAqaGVhZCwgYm9vbCB1cGRhdGUpDQo+PiDCoMKgwqDCoMKgIGludCBjbnQ7DQo+PiDCoMKg
wqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnkoY2QsIGhlYWQsIGxpc3QpIHsNCj4+IC3CoMKg
wqDCoMKgwqDCoCBjbnQgPSBkb21haW5fbmJlbnRyeV9maXgoY2QtPmRvbWlkLCBjZC0+bmJl
bnRyeSwgdXBkYXRlKTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBjbnQgPSBkb21haW5fbmJlbnRy
eV9maXgoY2QtPmRvbWlkLCBjZC0+YWNjW0FDQ19OT0RFU10sIHVwZGF0ZSk7DQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKCF1cGRhdGUpIHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmIChjbnQgPj0gcXVvdGFfbmJfZW50cnlfcGVyX2RvbWFpbikNCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVOT1NQQzsNCj4+IEBAIC02
MDMsOCArNjAzLDggQEAgc3RhdGljIHN0cnVjdCBjaGFuZ2VkX2RvbWFpbiAqYWNjX2dldF9j
aGFuZ2VkX2RvbWFpbihjb25zdCANCj4+IHZvaWQgKmN0eCwNCj4+IMKgwqDCoMKgwqAgcmV0
dXJuIGNkOw0KPj4gwqAgfQ0KPj4gLXN0YXRpYyBpbnQgYWNjX2FkZF9kb21fbmJlbnRyeShj
b25zdCB2b2lkICpjdHgsIHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQsIGludCB2YWwsDQo+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBkb21p
ZCkNCj4+ICtzdGF0aWMgaW50IGFjY19hZGRfY2hhbmdlZF9kb20oY29uc3Qgdm9pZCAqY3R4
LCBzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgd2hhdCwgaW50IHZhbCwgdW5zaWduZWQgaW50
IGRvbWlkKQ0KPiANCj4gQUZBSVUgIndoYXQiIHdpbGwgYmUgYSB2YWx1ZSBmcm9tIHRoZSBl
bnVtLiBTbyBsZXQncyBkbyBzb21lIGhhcmRlbmluZyBhbmQgdXNlIA0KPiB0aGUgdHlwZSAi
ZW51bSAuLi4iLg0KDQpZZXMsIHdpbGwgZG8gdGhhdCAoYW5kIGluIHRoZSBmb2xsb3dpbmcg
cGF0Y2hlcywgdG9vKS4NCg0KPiANCj4+IMKgIHsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGNo
YW5nZWRfZG9tYWluICpjZDsNCj4+IEBAIC02MTMsOSArNjEzLDkgQEAgc3RhdGljIGludCBh
Y2NfYWRkX2RvbV9uYmVudHJ5KGNvbnN0IHZvaWQgKmN0eCwgc3RydWN0IA0KPj4gbGlzdF9o
ZWFkICpoZWFkLCBpbnQgdmFsLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0K
Pj4gwqDCoMKgwqDCoCBlcnJubyA9IDA7DQo+PiAtwqDCoMKgIGNkLT5uYmVudHJ5ICs9IHZh
bDsNCj4gDQo+IEkgd291bGQgY29uc2lkZXIgdG8gYWRkaW5nIGFuIGFzc2VydCgpIChvciBw
b3NzaWJseSBydW50aW1lIGNoZWNrKSB0byBjb25maXJtIA0KPiB0aGUgJ3doYXQnIGlzIHNt
YWxsZXIgdGhhbiB0aGUgYXJyYXkgc2l6ZS4NCg0KT2theS4NCg0KDQpKdWVyZ2VuDQo=
--------------U0mD0bG83tRouharJal0Zcbo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------U0mD0bG83tRouharJal0Zcbo--

--------------m5qimV0hDTSSwtDXFx24DZ6i--

--------------OecxqhHZiILGZPa5uMZs7kD7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOZf0QFAwAAAAAACgkQsN6d1ii/Ey+W
pwf+IK9ybdWszPmD8DraNhhUA0lhDWz7e3zM38l2w/PhfAOsDe3P0n9wHv55BID7VgJwRIXd8kcy
efVdCMx5CwuwZ0Q5xNHGlLjErl79/ptzKHxdLP3YCeRwo0B9S5YcSogIeX5SyL5CrwNyaEYST0tk
RQ2qBetgjkYxRTGwO/+3J25Rd79OsOvQXe4Imnrmai9eZkVPlDVXZzhB6pqz5TiHjWHGLssSKNuI
4/TWPxOMLggLf3AUYTYS4NQCjAeXkh7x7cNCUefiTcakHuwOmEC+vhfK0IDApfoPopEs5+6ifA9u
jNACFjKqjuY6yyl8V2PSOfB+xd3+tOOv0el3v8dSlw==
=I2se
-----END PGP SIGNATURE-----

--------------OecxqhHZiILGZPa5uMZs7kD7--

