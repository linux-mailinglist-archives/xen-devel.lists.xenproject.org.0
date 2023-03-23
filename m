Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B6B6C6CB7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 16:55:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513951.795745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNHW-00074p-64; Thu, 23 Mar 2023 15:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513951.795745; Thu, 23 Mar 2023 15:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNHW-00072H-3G; Thu, 23 Mar 2023 15:55:14 +0000
Received: by outflank-mailman (input) for mailman id 513951;
 Thu, 23 Mar 2023 15:55:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pfNHV-00071d-FG
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 15:55:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18136dde-c993-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 16:55:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A48CA22964;
 Thu, 23 Mar 2023 15:55:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FE8613596;
 Thu, 23 Mar 2023 15:55:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TUcbGV92HGRDNQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Mar 2023 15:55:11 +0000
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
X-Inumbo-ID: 18136dde-c993-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679586911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FasMwf/QcBP60aF/SHDe1xF2V6iJUqnXfpSReLQqZ2I=;
	b=PMPxQtplo2jFaKDQ1Yl4lTI5ZxCEOTm1J4bztWKDjTJJZCJbTxI2iahGz1xAKUA79xPVqk
	iWvWtU39a29IsfUlCsvZHceBrDwnZfn6EHzyB8gG7BuZmDP/NBbgIKor4zJmaJEvjn3Aws
	S793aT6JDM89V75OMrKM4JcqG0Ly4tI=
Message-ID: <41ab8c98-ee53-8a21-56cb-2c6d801af0b8@suse.com>
Date: Thu, 23 Mar 2023 16:55:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [linux-linus test] 179607: regressions - trouble:
 fail/pass/starved
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <osstest-179607-mainreport@xen.org>
 <ea0532e0-12c4-674d-392f-216658071f77@suse.com>
In-Reply-To: <ea0532e0-12c4-674d-392f-216658071f77@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eT21vdPb2Tih4Op1OwBGPxGW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eT21vdPb2Tih4Op1OwBGPxGW
Content-Type: multipart/mixed; boundary="------------rZ4YdWAE2V4hcl6j0r5a0pd9";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <41ab8c98-ee53-8a21-56cb-2c6d801af0b8@suse.com>
Subject: Re: [linux-linus test] 179607: regressions - trouble:
 fail/pass/starved
References: <osstest-179607-mainreport@xen.org>
 <ea0532e0-12c4-674d-392f-216658071f77@suse.com>
In-Reply-To: <ea0532e0-12c4-674d-392f-216658071f77@suse.com>

--------------rZ4YdWAE2V4hcl6j0r5a0pd9
Content-Type: multipart/mixed; boundary="------------0x6Cv05VhnwztwtE7jQjmySN"

--------------0x6Cv05VhnwztwtE7jQjmySN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDMuMjMgMTQ6MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDE0LjAzLjIz
IDEzOjUyLCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6DQo+PiBmbGlnaHQgMTc5NjA3
IGxpbnV4LWxpbnVzIHJlYWwgW3JlYWxdDQo+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5w
cm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTc5NjA3Lw0KPj4NCj4+IFJlZ3Jlc3Npb25zIDot
KA0KPj4NCj4+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5n
LA0KPj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46DQo+PiDCoCB0
ZXN0LWFtZDY0LWFtZDY0LWZyZWVic2QxMi1hbWQ2NCAxMyBndWVzdC1zdGFydMKgwqDCoMKg
wqDCoMKgwqDCoCBmYWlsIFJFR1IuIHZzLiAxNzgwNDINCj4+IMKgIHRlc3QtYW1kNjQtYW1k
NjQteGwtY3JlZGl0McKgIDE5IGd1ZXN0LXNhdmVyZXN0b3JlLjLCoMKgwqDCoMKgIGZhaWwg
UkVHUi4gdnMuIDE3ODA0Mg0KPj4gwqAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1zaGFkb3fCoMKg
IDE0IGd1ZXN0LXN0YXJ0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFpbCBSRUdSLiB2
cy4gMTc4MDQyDQo+IA0KPiAuLi4NCj4gDQo+IEluIHRoZSBsb2dzIFsxXSBJJ20gc2VlaW5n
IGVycm9ycyBsaWtlOg0KPiANCj4gTWFyIDEzIDIzOjUxOjI2LjI3NTQyMSBbwqAgMjcxLjcx
Mzc0MF0geGVuYnIwOiBwb3J0IDIodmlmMS4wKSBlbnRlcmVkIGZvcndhcmRpbmcgDQo+IHN0
YXRlDQo+IE1hciAxMyAyMzo1MToyNi4yODczNDYgKFhFTikgY29tbW9uL2dyYW50X3RhYmxl
LmM6Mjk4MjpkMHYzIGNvcHkgYmV5b25kIHBhZ2UgYXJlYQ0KPiBNYXIgMTMgMjM6NTE6NDgu
MTE1MzgzIChYRU4pIGNvbW1vbi9ncmFudF90YWJsZS5jOjI5ODI6ZDB2MyBjb3B5IGJleW9u
ZCBwYWdlIGFyZWENCj4gTWFyIDEzIDIzOjUxOjQ5LjEyMzM0NyAoWEVOKSBjb21tb24vZ3Jh
bnRfdGFibGUuYzoyOTgyOmQwdjMgY29weSBiZXlvbmQgcGFnZSBhcmVhDQo+IE1hciAxMyAy
Mzo1MTo0OS40NTkzNjcgKFhFTikgY29tbW9uL2dyYW50X3RhYmxlLmM6Mjk4MjpkMHYzIGNv
cHkgYmV5b25kIHBhZ2UgYXJlYQ0KPiANCj4gR2l2ZW4gdGhlIHZpZiByZWxhdGVkIG1lc3Nh
Z2UgZGlyZWN0bHkgYmVmb3JlIHRob3NlIGVycm9ycyB0aGUgY2hhbmNlIGlzIGhpZ2gNCj4g
dGhpcyBwcm9ibGVtIGlzIHJlbGF0ZWQgdG8gbmV0YmFjay4NCj4gDQo+IFJvc3MsIHlvdXIg
cGF0Y2ggInhlbi9uZXRiYWNrOiBFbnN1cmUgcHJvdG9jb2wgaGVhZGVycyBkb24ndCBmYWxs
IGluIHRoZQ0KPiBub24tbGluZWFyIGFyZWEiICh1cHN0cmVhbSBjb21taXQgYWQ3ZjQwMmFl
NGY0NjY2KSBkaWQgdGhlIG1vc3QgcmVjZW50IGNoYW5nZXMNCj4gaW4gbmV0YmFjayBhZmZl
Y3RpbmcgR05UVEFCT1BfY29weSBvcGVyYXRpb25zLiBUaGVyZSBhcmUgcHJvYmFibHkgcGFn
ZSBib3VuZGFyeQ0KPiBjaGVja3MgKHByb2JhYmx5IG9uIG5ldGJhY2sgc2lkZSkgbWlzc2lu
Zy4gQ291bGQgeW91IHBsZWFzZSBoYXZlIGEgbG9vaz8NCg0KT2theSwgSSd2ZSBoYWQgYSB0
cnkgKHNlZSBhdHRhY2hlZCBwYXRjaCkuDQoNCkFudGhvbnksIGFzIEkgY2FuJ3QgcmVwcm9k
dWNlIHRoZSBvcmlnaW5hbCBwcm9ibGVtLCB3b3VsZCBpdCBiZSBwb3NzaWJsZSB0bw0Kc3Rh
cnQgYW4gT1NTdGVzdCBydW4gb2YgdGhlIGxpbnV4LWxpbnVzIHRlc3Qgd2l0aCBteSBwYXRj
aCBhcHBsaWVkIHRvIHRoZQ0KdXNlZCBrZXJuZWw/DQoNCg0KSnVlcmdlbg0K
--------------0x6Cv05VhnwztwtE7jQjmySN
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-netback-don-t-do-grant-copy-across-page-boundary.patch"
Content-Disposition: attachment;
 filename*0="0001-xen-netback-don-t-do-grant-copy-across-page-boundary.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA4YWNlMDJlZGJhNzQwYmZkYjBmOWJkODhhZTM0YWNkZDljZTE4ZTU4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CkRhdGU6IFRodSwgMjMgTWFyIDIwMjMgMDc6Mjk6NTYgKzAxMDAKU3ViamVjdDogW1BBVENI
XSB4ZW4vbmV0YmFjazogZG9uJ3QgZG8gZ3JhbnQgY29weSBhY3Jvc3MgcGFnZSBib3VuZGFy
eQoKRml4IHhlbnZpZl9nZXRfcmVxdWVzdHMoKSBub3QgdG8gZG8gZ3JhbnQgY29weSBvcGVy
YXRpb25zIGFjcm9zcyBsb2NhbApwYWdlIGJvdW5kYXJpZXMuIFRoaXMgcmVxdWlyZXMgdG8g
ZG91YmxlIHRoZSBtYXhpbXVtIG51bWJlciBvZiBjb3B5Cm9wZXJhdGlvbnMgcGVyIHF1ZXVl
LCBhcyBlYWNoIGNvcHkgY291bGQgbm93IGJlIHNwbGl0IGludG8gMi4KCkNjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnCkZpeGVzOiBhZDdmNDAyYWU0ZjQgKCJ4ZW4vbmV0YmFjazogRW5z
dXJlIHByb3RvY29sIGhlYWRlcnMgZG9uJ3QgZmFsbCBpbiB0aGUgbm9uLWxpbmVhciBhcmVh
IikKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0K
IGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2NvbW1vbi5oICB8IDIgKy0KIGRyaXZlcnMvbmV0
L3hlbi1uZXRiYWNrL25ldGJhY2suYyB8IDcgKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQveGVuLW5ldGJhY2svY29tbW9uLmggYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9jb21t
b24uaAppbmRleCAzZGJmYzhhNjkyNGUuLjFmY2JkODNmN2ZmMiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9uZXQveGVuLW5ldGJhY2svY29tbW9uLmgKKysrIGIvZHJpdmVycy9uZXQveGVuLW5l
dGJhY2svY29tbW9uLmgKQEAgLTE2Niw3ICsxNjYsNyBAQCBzdHJ1Y3QgeGVudmlmX3F1ZXVl
IHsgLyogUGVyLXF1ZXVlIGRhdGEgZm9yIHhlbnZpZiAqLwogCXN0cnVjdCBwZW5kaW5nX3R4
X2luZm8gcGVuZGluZ190eF9pbmZvW01BWF9QRU5ESU5HX1JFUVNdOwogCWdyYW50X2hhbmRs
ZV90IGdyYW50X3R4X2hhbmRsZVtNQVhfUEVORElOR19SRVFTXTsKIAotCXN0cnVjdCBnbnR0
YWJfY29weSB0eF9jb3B5X29wc1tNQVhfUEVORElOR19SRVFTXTsKKwlzdHJ1Y3QgZ250dGFi
X2NvcHkgdHhfY29weV9vcHNbMiAqIE1BWF9QRU5ESU5HX1JFUVNdOwogCXN0cnVjdCBnbnR0
YWJfbWFwX2dyYW50X3JlZiB0eF9tYXBfb3BzW01BWF9QRU5ESU5HX1JFUVNdOwogCXN0cnVj
dCBnbnR0YWJfdW5tYXBfZ3JhbnRfcmVmIHR4X3VubWFwX29wc1tNQVhfUEVORElOR19SRVFT
XTsKIAkvKiBwYXNzZWQgdG8gZ250dGFiX1t1bl1tYXBfcmVmcyB3aXRoIHBhZ2VzIHVuZGVy
ICh1biltYXBwaW5nICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9u
ZXRiYWNrLmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9uZXRiYWNrLmMKaW5kZXggMWI0
MjY3NmNhMTQxLi4xYmM5MzZkZDU3OWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hlbi1u
ZXRiYWNrL25ldGJhY2suYworKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9uZXRiYWNr
LmMKQEAgLTQxMyw2ICs0MTMsMTAgQEAgc3RhdGljIHZvaWQgeGVudmlmX2dldF9yZXF1ZXN0
cyhzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSwKIAkJY29wLT5kZXN0LnUuZ21mbiA9IHZp
cnRfdG9fZ2ZuKHNrYi0+ZGF0YSArIHNrYl9oZWFkbGVuKHNrYikKIAkJCQkgICAgICAgICAg
ICAgICAtIGRhdGFfbGVuKTsKIAorCQkvKiBEb24ndCBjcm9zcyBsb2NhbCBwYWdlIGJvdW5k
YXJ5ISAqLworCQlpZiAoY29wLT5kZXN0Lm9mZnNldCArIGFtb3VudCA+IFBBR0VfU0laRSkK
KwkJCWFtb3VudCA9IFBBR0VfU0laRSAtIGNvcC0+ZGVzdC5vZmZzZXQ7CisKIAkJY29wLT5s
ZW4gPSBhbW91bnQ7CiAJCWNvcC0+ZmxhZ3MgPSBHTlRDT1BZX3NvdXJjZV9ncmVmOwogCkBA
IC00NDEsNyArNDQ1LDggQEAgc3RhdGljIHZvaWQgeGVudmlmX2dldF9yZXF1ZXN0cyhzdHJ1
Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSwKIAkJCW5yX3Nsb3RzLS07CiAJCX0gZWxzZSB7CiAJ
CQkvKiBUaGUgY29weSBvcCBwYXJ0aWFsbHkgY292ZXJlZCB0aGUgdHhfcmVxdWVzdC4KLQkJ
CSAqIFRoZSByZW1haW5kZXIgd2lsbCBiZSBtYXBwZWQuCisJCQkgKiBUaGUgcmVtYWluZGVy
IHdpbGwgYmUgbWFwcGVkIG9yIGNvcGllZCBpbiB0aGUgbmV4dAorCQkJICogaXRlcmF0aW9u
LgogCQkJICovCiAJCQl0eHAtPm9mZnNldCArPSBhbW91bnQ7CiAJCQl0eHAtPnNpemUgLT0g
YW1vdW50OwotLSAKMi4zNS4zCgo=
--------------0x6Cv05VhnwztwtE7jQjmySN
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0x6Cv05VhnwztwtE7jQjmySN--

--------------rZ4YdWAE2V4hcl6j0r5a0pd9--

--------------eT21vdPb2Tih4Op1OwBGPxGW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQcdl4FAwAAAAAACgkQsN6d1ii/Ey8n
ZAf/Z4sR3tSr+TStBgsPALMLy/wzB78lrr+9Os/DCgFy5JqBQYZUV6g3b0ZFRIRrEx+432/iu8qO
dno59YMGn3xlAXn1G0NW24YFj+kqUrH5oDSic0Vm4A0YWfs5AG02qsb8k1TeMQya9DHplcy7Xmaa
W90uQsnLZrEYVMXYb37aBWLRHvoArANeNT/4Z0WWjgkNpGbNkz0KkbwmAMSRLse8hP5RNFzjpO9C
D/xLFHc2fLLKA9TGYHfvfyIZ5u3S0Gzr4sQ3u6TJUNx13xyTH9rHOSUf214YttxV5+yjRfPqy7TJ
0U4nm2JOY527khNdILKA0BEX8DrFyQU8PyLMk2LfFQ==
=EK/A
-----END PGP SIGNATURE-----

--------------eT21vdPb2Tih4Op1OwBGPxGW--

