Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ED17663F4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 08:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571334.894915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPGlA-0001lN-0S; Fri, 28 Jul 2023 06:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571334.894915; Fri, 28 Jul 2023 06:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPGl9-0001io-U3; Fri, 28 Jul 2023 06:15:31 +0000
Received: by outflank-mailman (input) for mailman id 571334;
 Fri, 28 Jul 2023 06:15:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qPGl8-0001id-BD
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 06:15:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2540ec67-2d0e-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 08:15:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DD8AB1F8A4;
 Fri, 28 Jul 2023 06:15:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B445D133F7;
 Fri, 28 Jul 2023 06:15:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VGGGKv5cw2TBJwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Jul 2023 06:15:26 +0000
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
X-Inumbo-ID: 2540ec67-2d0e-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690524926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bzo/P3g3e3DrIikhZd7xQtkA9oW8qnq9Suvg/AYXn5k=;
	b=gZE8pUdFEosQ9Xy6WXssNTEz5D02adpjdCko15JTupaQASEd/uROc8w0sTCRCQd/qeGyhz
	iSrao5YtDjyfm7k2n4ZiDf3JQkpPm1d0glsTnJmA1PdtsUV+Exy0P7Pr90YmDCs/o8lFgd
	vLFXk0ukcvA1vhIiqLYATR3jD5Ccz6I=
Message-ID: <c4113e90-8660-c645-d59a-15ac3720c230@suse.com>
Date: Fri, 28 Jul 2023 08:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 14/25] tools/xenstore: change talloc_free() to take a
 const pointer
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-15-jgross@suse.com>
 <de4f8574-c042-e2bb-a3ec-8bcee118a2c0@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <de4f8574-c042-e2bb-a3ec-8bcee118a2c0@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cm3v7Vv1qBPbMEaYA8H6k0KM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cm3v7Vv1qBPbMEaYA8H6k0KM
Content-Type: multipart/mixed; boundary="------------0AcT0GQubeuVtKrNldP9J9mQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <c4113e90-8660-c645-d59a-15ac3720c230@suse.com>
Subject: Re: [PATCH v3 14/25] tools/xenstore: change talloc_free() to take a
 const pointer
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-15-jgross@suse.com>
 <de4f8574-c042-e2bb-a3ec-8bcee118a2c0@xen.org>
In-Reply-To: <de4f8574-c042-e2bb-a3ec-8bcee118a2c0@xen.org>

--------------0AcT0GQubeuVtKrNldP9J9mQ
Content-Type: multipart/mixed; boundary="------------X8FlmhIIPX9a5eyJGiyGuph6"

--------------X8FlmhIIPX9a5eyJGiyGuph6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDcuMjMgMjM6MjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI0LzA3LzIwMjMgMTI6MDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBX
aXRoIHRhbGxvY19mcmVlKCkgYW5kIHJlbGF0ZWQgZnVuY3Rpb25zIG5vdCB0YWtpbmcgYSBw
b250ZXIgdG8gY29uc3QNCj4gDQo+IHR5cG86IHMvcG9udGVyL3BvaW50ZXIvDQo+IA0KPj4g
aXQgaXMgdGVkaW91cyB0byB1c2UgdGhlIGNvbnN0IGF0dHJpYnV0ZSBmb3IgdGFsbG9jKCkt
ZWQgbWVtb3J5IGluDQo+PiBtYW55IGNhc2VzLg0KPj4NCj4+IENoYW5nZSB0aGUgcmVsYXRl
ZCBwcm90b3R5cGVzIHRvIHVzZSAiY29uc3Qgdm9pZCAqIiBpbnN0ZWFkIG9mDQo+PiAidm9p
ZCAqIi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+DQo+PiAtLS0NCj4+IFYzOg0KPj4gLSBuZXcgcGF0Y2gNCj4+IC0tLQ0KPj4gwqAg
dG9vbHMveGVuc3RvcmUvdGFsbG9jLmMgfCA4ICsrKystLS0tDQo+PiDCoCB0b29scy94ZW5z
dG9yZS90YWxsb2MuaCB8IDQgKystLQ0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hl
bnN0b3JlL3RhbGxvYy5jIGIvdG9vbHMveGVuc3RvcmUvdGFsbG9jLmMNCj4+IGluZGV4IDIz
YzNhMjNiMTkuLjRmMDhkYmVjNTkgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZS90
YWxsb2MuYw0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmUvdGFsbG9jLmMNCj4+IEBAIC0zMTks
NyArMzE5LDcgQEAgc3RhdGljIGludCB0YWxsb2NfdW5yZWZlcmVuY2UoY29uc3Qgdm9pZCAq
Y29udGV4dCwgY29uc3QgDQo+PiB2b2lkICpwdHIpDQo+PiDCoMKgwqAgcmVtb3ZlIGEgc3Bl
Y2lmaWMgcGFyZW50IGNvbnRleHQgZnJvbSBhIHBvaW50ZXIuIFRoaXMgaXMgYSBtb3JlDQo+
PiDCoMKgwqAgY29udHJvbGxlZCB2YXJpZW50IG9mIHRhbGxvY19mcmVlKCkNCj4+IMKgICov
DQo+PiAtaW50IHRhbGxvY191bmxpbmsoY29uc3Qgdm9pZCAqY29udGV4dCwgdm9pZCAqcHRy
KQ0KPj4gK2ludCB0YWxsb2NfdW5saW5rKGNvbnN0IHZvaWQgKmNvbnRleHQsIGNvbnN0IHZv
aWQgKnB0cikNCj4+IMKgIHsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IHRhbGxvY19jaHVuayAq
dGNfcCwgKm5ld19wOw0KPj4gwqDCoMKgwqDCoCB2b2lkICpuZXdfcGFyZW50Ow0KPj4gQEAg
LTQ5OSw3ICs0OTksNyBAQCB2b2lkICp0YWxsb2NfaW5pdChjb25zdCBjaGFyICpmbXQsIC4u
LikNCj4+IMKgwqDCoCBzaG91bGQgcHJvYmFibHkgbm90IGJlIHVzZWQgaW4gbmV3IGNvZGUu
IEl0J3MgaW4gaGVyZSB0byBrZWVwIHRoZSB0YWxsb2MNCj4+IMKgwqDCoCBjb2RlIGNvbnNp
c3RlbnQgYWNyb3NzIFNhbWJhIDMgYW5kIDQuDQo+PiDCoCAqLw0KPj4gLXN0YXRpYyB2b2lk
IHRhbGxvY19mcmVlX2NoaWxkcmVuKHZvaWQgKnB0cikNCj4+ICtzdGF0aWMgdm9pZCB0YWxs
b2NfZnJlZV9jaGlsZHJlbihjb25zdCB2b2lkICpwdHIpDQo+PiDCoCB7DQo+PiDCoMKgwqDC
oMKgIHN0cnVjdCB0YWxsb2NfY2h1bmsgKnRjOw0KPj4gQEAgLTUzOSw3ICs1MzksNyBAQCBz
dGF0aWMgdm9pZCB0YWxsb2NfZnJlZV9jaGlsZHJlbih2b2lkICpwdHIpDQo+PiDCoMKgwqDC
oCB3aWxsIG5vdCBiZSBmcmVlZCBpZiB0aGUgcmVmX2NvdW50IGlzID4gMSBvciB0aGUgZGVz
dHJ1Y3RvciAoaWYNCj4+IMKgwqDCoMKgIGFueSkgcmV0dXJucyBub24temVybw0KPj4gwqAg
Ki8NCj4+IC1pbnQgdGFsbG9jX2ZyZWUodm9pZCAqcHRyKQ0KPj4gK2ludCB0YWxsb2NfZnJl
ZShjb25zdCB2b2lkICpwdHIpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIGludCBzYXZlZF9l
cnJubyA9IGVycm5vOw0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdGFsbG9jX2NodW5rICp0YzsN
Cj4+IEBAIC01NzEsNyArNTcxLDcgQEAgaW50IHRhbGxvY19mcmVlKHZvaWQgKnB0cikNCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyOw0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIH0NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB0Yy0+ZGVzdHJ1Y3RvciA9ICh0YWxs
b2NfZGVzdHJ1Y3Rvcl90KS0xOw0KPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChkKHB0cikgPT0g
LTEpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZCgodm9pZCAqKXB0cikgPT0gLTEpIHsN
Cj4gDQo+IEFGQUlDVCwgeW91IGNhbid0IHByb3BhZ2F0ZSB0aGUgY29uc3QgYmVjYXVzZSB0
aGUgZGVzdHJ1Y3RvciBtYXkgbmVlZCB0byBtb2RpZnkgDQo+IHRoZSBjb250ZW50LiBJIGd1
ZXNzIHRoaXMgaXMgYSBuZWNlc3NhcnkgZXZpbCBoZXJlIGJ1dCBpdCB3b3VsZCBiZSBnb29k
IHRvIA0KPiBkb2N1bWVudCBpdC4NCg0KT2theSwgd2lsbCBhZGQgYSBjb21tZW50Lg0KDQoN
Ckp1ZXJnZW4NCg0K
--------------X8FlmhIIPX9a5eyJGiyGuph6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------X8FlmhIIPX9a5eyJGiyGuph6--

--------------0AcT0GQubeuVtKrNldP9J9mQ--

--------------cm3v7Vv1qBPbMEaYA8H6k0KM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTDXP4FAwAAAAAACgkQsN6d1ii/Ey/B
Mwf+Kq/hVD0uzNu8ORYGrftScr7+2vMjc8hFsieA6CLhT9jsw+uweLM/lJJn1e3xD0Qjho1/YS0l
eXrMIrD9oOfYwnbLsHTgZ1G5Vu0akk/3zQUnWqMkkhXyqLxOBZJAaARHZTp4i+YRAb47vdsbbcxc
cYL1Z56MLf3p41oLOSxF0jYIMnNGa4lmCBtHJMQKytkfpnq/OvZ+y50IT5QwFvyEUWUQqoSO/bSD
xS6+5z6AeAfU2I0y3p6ZN7cEac0cmGoQKEBitpWvAC8H8tYI8M3S2O6ElBJjeSFnWrijFwNXbWvz
6SS3DGweiPmSE9xOYTuytLX2GHqJAv8YGtxT1Qol8Q==
=fS1n
-----END PGP SIGNATURE-----

--------------cm3v7Vv1qBPbMEaYA8H6k0KM--

