Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B968B5B9BA0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 15:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407365.649859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYodH-0006Ez-V5; Thu, 15 Sep 2022 13:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407365.649859; Thu, 15 Sep 2022 13:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYodH-0006BW-Rk; Thu, 15 Sep 2022 13:10:19 +0000
Received: by outflank-mailman (input) for mailman id 407365;
 Thu, 15 Sep 2022 13:10:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/0/a=ZS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oYodH-0006BQ-2O
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 13:10:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be7d9dcb-34f7-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 15:10:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 48AF31F8AE;
 Thu, 15 Sep 2022 13:10:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3331D13A49;
 Thu, 15 Sep 2022 13:10:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4MA9CzkkI2MTVwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 15 Sep 2022 13:10:17 +0000
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
X-Inumbo-ID: be7d9dcb-34f7-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663247417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C6UJ+Vo60tenYFuyHOS0X67/+j2cgnpWV9YLB3cVj6Y=;
	b=oOTPJHdplWuCa+G1vDrWgCv4V/OGwcaithsoh4FFisY4lLjE6gIzPLLLAavZE4bO4fSmor
	1voBbcgidO4lU6Z4ZQ2AY4ow7bZaoAJEC3yX4aG/lILMSZ2vFU2DkcGLpgoZEl2nsqicI/
	W08N+8C0osdN6+cHh2clP2srK0SXRGo=
Message-ID: <17313adf-2881-9902-0d66-a4e723158434@suse.com>
Date: Thu, 15 Sep 2022 15:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Sander Eikelenboom <linux@eikelenboom.it>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c38ca372-e3ea-2f72-6cdd-81433002d21e@eikelenboom.it>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Bisected: drivers/block/xen-blkback/xenbus.c:327
 xen_blkif_disconnect+0x24f/0x260
In-Reply-To: <c38ca372-e3ea-2f72-6cdd-81433002d21e@eikelenboom.it>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EBEDFISbmEqIMyHenYqnZVTS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EBEDFISbmEqIMyHenYqnZVTS
Content-Type: multipart/mixed; boundary="------------C1hgxAGmeMgBIKo99LbrGa7g";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Sander Eikelenboom <linux@eikelenboom.it>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <17313adf-2881-9902-0d66-a4e723158434@suse.com>
Subject: Re: Bisected: drivers/block/xen-blkback/xenbus.c:327
 xen_blkif_disconnect+0x24f/0x260
References: <c38ca372-e3ea-2f72-6cdd-81433002d21e@eikelenboom.it>
In-Reply-To: <c38ca372-e3ea-2f72-6cdd-81433002d21e@eikelenboom.it>

--------------C1hgxAGmeMgBIKo99LbrGa7g
Content-Type: multipart/mixed; boundary="------------429UP0hUq6ZGG0HWvIvXMAC0"

--------------429UP0hUq6ZGG0HWvIvXMAC0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDkuMjIgMTQ6NDksIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToNCj4gSGkgSnVl
cmdlbiwNCj4gDQo+IEknbSBoYXZpbmcgdHJvdWJsZSBib290aW5nIG15IERvbVUncyB3aGVu
IHRyeWluZyB0byB1c2UgYSBsaW51eC01LjE5IGtlcm5lbCBmb3IgDQo+IGJvdGggRG9tMCBh
bmQgRG9tVS4NCj4gQSBkb20wIDUuMTkga2VybmVsIHdpdGggYSBkb21VIDUuMTgga2VybmVs
IGJvb3RzIGZpbmUuDQo+IEknbSB1c2luZyBkdXJlY3Qga2VybmVsIGJvb3QgdG8gYm9vdCB0
aGUgZG9tVSBndWVzdCAoa2VybmVsPcKgIGFuZCByYW1kaXNrPSANCj4gcGFyYW1ldGVycyku
DQo+IA0KPiBTaW5jZSBib3RoIHhlbi1ibGtiYWNrIGFuZCB4ZW4tYmxrZnJvbnQgY291bGQg
YmUgaW50byBwbGF5LA0KPiBJIGJpc2VjdGVkIHRoaXMgYnkga2VlcGluZyBkb20wIGZpeGVk
IGFzIGEgNS4xOSBrZXJuZWwgYW5kIGRvIHRoZSBiaXNlY3Rpbmcgb24gDQo+IHRoZSBkb21V
IGtlcm5lbC4NCj4gDQo+IEJpc2VjdGluZyBsZWFkcyB0byBjb21taXQgNDU3MzI0MGYwNzY0
ZWU3OWQ3NTU4ZDc0ZmM1MzViYWExZTExMGQyMCAieGVuL3hlbmJ1czogDQo+IGVsaW1pbmF0
ZSB4ZW5idXNfZ3JhbnRfcmluZygpIg0KPiBSZXZlcnRpbmcgdGhpcyBzcGVjaWZpYyBjb21t
aXQgbWFrZXMgdGhlIGRvbVUgYm9vdCBmaW5lIGFnYWluLg0KPiANCj4gSSBoYXZlIGFkZGVk
IHRoZSBzcGxhdCBmcm9tIGRvbTAga2VybmVsIGJlbG93IChmcm9tIHVzaW5nIDUuMTkuOCBr
ZXJuZWwgZm9yIGJvdGggDQo+IGRvbTAgYW5kIGRvbVUpLA0KPiB0aGUgZG9tVSBkb2VzIG5v
dCBzZWVtIHRvIGhhdmUgYW55IGludGVyZXNzdGluZyBsb2dnaW5nLA0KPiBhcGFydCBmcm9t
IG5vdCBiZWluZyBhYmxlIHRvIGZpbmQgdGhlIHJvb3QgZmlsZXN5c3RlbS4NCj4gDQo+IERv
IHlvdSBoYXZlIGFueSBpZGVhcyA/DQoNCk91Y2guIFdoYXQgYSBzaWxseSwgc2lsbHksIHNp
bGx5IGVycm9yIQ0KDQpEb2VzIHRoZSBhdHRhY2hlZCBwYXRjaCBmaXggaXQgZm9yIHlvdT8N
Cg0KDQpKdWVyZ2VuDQo=
--------------429UP0hUq6ZGG0HWvIvXMAC0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-xenbus-fix-xenbus_setup_ring.patch"
Content-Disposition: attachment;
 filename="0001-xen-xenbus-fix-xenbus_setup_ring.patch"
Content-Transfer-Encoding: base64

RnJvbSAzOTA0NjFmM2ZiZGUwYTY1ZDE4ZTY1OTk5YTFiZDNkYjk4MzAxMzFiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
ClRvOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNjOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+CkNjOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVu
a29AZXBhbS5jb20+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKRGF0ZTog
VGh1LCAxNSBTZXAgMjAyMiAxNTowNTo0NSArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIHhlbi94
ZW5idXM6IGZpeCB4ZW5idXNfc2V0dXBfcmluZygpCgpDb21taXQgNDU3MzI0MGYwNzY0ICgi
eGVuL3hlbmJ1czogZWxpbWluYXRlIHhlbmJ1c19ncmFudF9yaW5nKCkiKQppbnRyb2R1Y2Vk
IGFuIGVycm9yIGZvciBpbml0aWFsaXphdGlvbiBvZiBtdWx0aS1wYWdlIHJpbmdzLgoKQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKRml4ZXM6IDQ1NzMyNDBmMDc2NCAoInhlbi94ZW5i
dXM6IGVsaW1pbmF0ZSB4ZW5idXNfZ3JhbnRfcmluZygpIikKUmVwb3J0ZWQtYnk6IFNhbmRl
ciBFaWtlbGVuYm9vbSA8bGludXhAZWlrZWxlbmJvb20uaXQ+ClNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi94ZW5idXMv
eGVuYnVzX2NsaWVudC5jIHwgOSArKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVu
YnVzL3hlbmJ1c19jbGllbnQuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfY2xpZW50
LmMKaW5kZXggZDVmM2Y3NjM3MTdlLi5jYWE1YzVjMzJmOGUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMveGVuL3hlbmJ1cy94ZW5idXNfY2xpZW50LmMKKysrIGIvZHJpdmVycy94ZW4veGVuYnVz
L3hlbmJ1c19jbGllbnQuYwpAQCAtMzgyLDkgKzM4MiwxMCBAQCBpbnQgeGVuYnVzX3NldHVw
X3Jpbmcoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwgZ2ZwX3QgZ2ZwLCB2b2lkICoqdmFk
ZHIsCiAJdW5zaWduZWQgbG9uZyByaW5nX3NpemUgPSBucl9wYWdlcyAqIFhFTl9QQUdFX1NJ
WkU7CiAJZ3JhbnRfcmVmX3QgZ3JlZl9oZWFkOwogCXVuc2lnbmVkIGludCBpOworCXZvaWQg
KmFkZHI7CiAJaW50IHJldDsKIAotCSp2YWRkciA9IGFsbG9jX3BhZ2VzX2V4YWN0KHJpbmdf
c2l6ZSwgZ2ZwIHwgX19HRlBfWkVSTyk7CisJYWRkciA9ICp2YWRkciA9IGFsbG9jX3BhZ2Vz
X2V4YWN0KHJpbmdfc2l6ZSwgZ2ZwIHwgX19HRlBfWkVSTyk7CiAJaWYgKCEqdmFkZHIpIHsK
IAkJcmV0ID0gLUVOT01FTTsKIAkJZ290byBlcnI7CkBAIC00MDEsMTMgKzQwMiwxNSBAQCBp
bnQgeGVuYnVzX3NldHVwX3Jpbmcoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwgZ2ZwX3Qg
Z2ZwLCB2b2lkICoqdmFkZHIsCiAJCXVuc2lnbmVkIGxvbmcgZ2ZuOwogCiAJCWlmIChpc192
bWFsbG9jX2FkZHIoKnZhZGRyKSkKLQkJCWdmbiA9IHBmbl90b19nZm4odm1hbGxvY190b19w
Zm4odmFkZHJbaV0pKTsKKwkJCWdmbiA9IHBmbl90b19nZm4odm1hbGxvY190b19wZm4oYWRk
cikpOwogCQllbHNlCi0JCQlnZm4gPSB2aXJ0X3RvX2dmbih2YWRkcltpXSk7CisJCQlnZm4g
PSB2aXJ0X3RvX2dmbihhZGRyKTsKIAogCQlncmVmc1tpXSA9IGdudHRhYl9jbGFpbV9ncmFu
dF9yZWZlcmVuY2UoJmdyZWZfaGVhZCk7CiAJCWdudHRhYl9ncmFudF9mb3JlaWduX2FjY2Vz
c19yZWYoZ3JlZnNbaV0sIGRldi0+b3RoZXJlbmRfaWQsCiAJCQkJCQlnZm4sIDApOworCisJ
CWFkZHIgKz0gUEFHRV9TSVpFOwogCX0KIAogCXJldHVybiAwOwotLSAKMi4zNS4zCgo=
--------------429UP0hUq6ZGG0HWvIvXMAC0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------429UP0hUq6ZGG0HWvIvXMAC0--

--------------C1hgxAGmeMgBIKo99LbrGa7g--

--------------EBEDFISbmEqIMyHenYqnZVTS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMjJDgFAwAAAAAACgkQsN6d1ii/Ey8o
Cgf/fzTuUgrpPZALZ2JQyPruAiDBTxpcBB8Kzq2gfHZdwFxmtMk+cZYid86cXhG1sQFbniND5PJp
M0jsx2h/5h0BeriBhblhU6tZSpnZlMdoM494sMbPBJ3199iDlgC5ijHS4OP/vZvP96gGfY/LyVIv
0A94Wm9IzZCyDKHtVQGSR9GrGfhRVdtaq4GlZQkridlVVqXyUOq9KJFcIXGAHvpVID21ePIFDtZA
h344RDH8cGRZHfjHluERKWoD4pNz13ZyEl4lAzfe/8mtz5VZVO7KNAWpD2MHvp9k0vdTNDCzYTEk
x0ydM7QExf6jtFBUKjcW54aTkCBao/ykjZ8K/qbBhA==
=W16C
-----END PGP SIGNATURE-----

--------------EBEDFISbmEqIMyHenYqnZVTS--

