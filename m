Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10E46713BD
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 07:18:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480138.744363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI1lS-0008GX-SX; Wed, 18 Jan 2023 06:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480138.744363; Wed, 18 Jan 2023 06:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI1lS-0008EL-PO; Wed, 18 Jan 2023 06:17:38 +0000
Received: by outflank-mailman (input) for mailman id 480138;
 Wed, 18 Jan 2023 06:17:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI1lR-0008EF-QG
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 06:17:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc8af248-96f7-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 07:17:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BE5AF3EB16;
 Wed, 18 Jan 2023 06:17:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96FC7138FE;
 Wed, 18 Jan 2023 06:17:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gkJPI/6Ox2MCWQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 06:17:34 +0000
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
X-Inumbo-ID: cc8af248-96f7-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674022654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tNetT30kYb9UcwFqdvmcjguPRiSiyULR5xJDUZjPoXU=;
	b=eLgSxHm1VUQ8qFPmNjbDCluJEydLuJ9OUVnFTvsxsYnWv8kBJpR4wEYiTOvao5pU5THwfp
	WpqvU9/lhFORMrOcoBVjJMl7mFyG1hKduecFt+uZd+QABQ/uDo9bNB63iqSUFfg/3ZyJUa
	rMWa4xGtXyzPwPqrFiUn95iIV46VC9E=
Message-ID: <fb160e56-8a6a-85fd-0140-ae25322479c7@suse.com>
Date: Wed, 18 Jan 2023 07:17:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 12/17] tools/xenstore: don't let hashtable_remove()
 return the removed value
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-13-jgross@suse.com>
 <19a0c39c-31b3-ce9c-6f03-466b6109b88f@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <19a0c39c-31b3-ce9c-6f03-466b6109b88f@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qtF0F3RaJ2QFxDb3dMyQx9Y5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qtF0F3RaJ2QFxDb3dMyQx9Y5
Content-Type: multipart/mixed; boundary="------------xLgdbenKbId05eKM6NYcvJ00";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <fb160e56-8a6a-85fd-0140-ae25322479c7@suse.com>
Subject: Re: [PATCH v3 12/17] tools/xenstore: don't let hashtable_remove()
 return the removed value
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-13-jgross@suse.com>
 <19a0c39c-31b3-ce9c-6f03-466b6109b88f@xen.org>
In-Reply-To: <19a0c39c-31b3-ce9c-6f03-466b6109b88f@xen.org>

--------------xLgdbenKbId05eKM6NYcvJ00
Content-Type: multipart/mixed; boundary="------------YkEu9guguiIbAOElqmBK4qbW"

--------------YkEu9guguiIbAOElqmBK4qbW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDEuMjMgMjM6MDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE3LzAxLzIwMjMgMDk6MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBM
ZXR0aW5nIGhhc2h0YWJsZV9yZW1vdmUoKSByZXR1cm4gdGhlIHZhbHVlIG9mIHRoZSByZW1v
dmVkIGVsZW1lbnQgaXMNCj4+IG5vdCB1c2VkIGFueXdoZXJlIGluIFhlbnN0b3JlLCBhbmQg
aXQgY29uZmxpY3RzIHdpdGggYSBoYXNodGFibGUNCj4+IGNyZWF0ZWQgc3BlY2lmeWluZyB0
aGUgSEFTSFRBQkxFX0ZSRUVfVkFMVUUgZmxhZy4NCj4+DQo+PiBTbyBqdXN0IGRyb3AgcmV0
dXJuaW5nIHRoZSB2YWx1ZS4NCj4gDQo+IEFueSByZWFzb24gdGhpcyBjYW4ndCBiZSB2b2lk
PyBJZiB0aGVyZSBhcmUsIHRoZW4gSSB3b3VsZCBjb25zaWRlciB0byByZXR1cm4gYSANCj4g
Ym9vbCBhcyB0aGUgcmV0dXJuIGNhbiBvbmx5IGJlIDIgdmFsdWVzLg0KDQpJIHRoaW5rIHlv
dSBhcmUgcmlnaHQuIFN3aXRjaGluZyB0byB2b2lkIHNob3VsZCBiZSBmaW5lLg0KDQo+IA0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4N
Cj4+IC0tLQ0KPj4gVjM6DQo+PiAtIG5ldyBwYXRjaA0KPj4gLS0tDQo+PiDCoCB0b29scy94
ZW5zdG9yZS9oYXNodGFibGUuYyB8IDEwICsrKysrLS0tLS0NCj4+IMKgIHRvb2xzL3hlbnN0
b3JlL2hhc2h0YWJsZS5oIHzCoCA0ICsrLS0NCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29s
cy94ZW5zdG9yZS9oYXNodGFibGUuYyBiL3Rvb2xzL3hlbnN0b3JlL2hhc2h0YWJsZS5jDQo+
PiBpbmRleCAyOTk1NDljNTFlLi42NzM4NzE5ZTQ3IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMv
eGVuc3RvcmUvaGFzaHRhYmxlLmMNCj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL2hhc2h0YWJs
ZS5jDQo+PiBAQCAtMjE0LDcgKzIxNCw3IEBAIGhhc2h0YWJsZV9zZWFyY2goc3RydWN0IGhh
c2h0YWJsZSAqaCwgdm9pZCAqaykNCj4+IMKgIH0NCj4+IMKgIC8qKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKi8NCj4+IC12b2lkICogLyogcmV0dXJucyB2YWx1ZSBhc3NvY2lhdGVkIHdpdGgg
a2V5ICovDQo+PiAraW50DQo+PiDCoCBoYXNodGFibGVfcmVtb3ZlKHN0cnVjdCBoYXNodGFi
bGUgKmgsIHZvaWQgKmspDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIC8qIFRPRE86IGNvbnNp
ZGVyIGNvbXBhY3RpbmcgdGhlIHRhYmxlIHdoZW4gdGhlIGxvYWQgZmFjdG9yIGRyb3BzIGVu
b3VnaCwNCj4+IEBAIC0yMjIsNyArMjIyLDYgQEAgaGFzaHRhYmxlX3JlbW92ZShzdHJ1Y3Qg
aGFzaHRhYmxlICpoLCB2b2lkICprKQ0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZW50cnkgKmU7
DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBlbnRyeSAqKnBFOw0KPj4gLcKgwqDCoCB2b2lkICp2
Ow0KPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgaGFzaHZhbHVlLCBpbmRleDsNCj4+IMKg
wqDCoMKgwqAgaGFzaHZhbHVlID0gaGFzaChoLGspOw0KPj4gQEAgLTIzNiwxNiArMjM1LDE3
IEBAIGhhc2h0YWJsZV9yZW1vdmUoc3RydWN0IGhhc2h0YWJsZSAqaCwgdm9pZCAqaykNCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
cEUgPSBlLT5uZXh0Ow0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaC0+ZW50cnlj
b3VudC0tOw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdiA9IGUtPnY7DQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaC0+ZmxhZ3MgJiBIQVNIVEFCTEVfRlJFRV9L
RVkpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyZWUoZS0+ayk7
DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaC0+ZmxhZ3MgJiBIQVNIVEFCTEVf
RlJFRV9WQUxVRSkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJlZShl
LT52KTsNCj4gDQo+IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCBob3cgdGhpcyBjaGFuZ2Ug
aXMgcmVsYXRlZCB0byB0aGlzIHBhdGNoLg0KDQpXaXRoIG5vdCByZXR1cm5pbmcgdGhlIHZh
bHVlIHBvaW50ZXIgYW55IGxvbmdlciB0aGVyZSB3b3VsZCBiZSBubyB3YXkNCmZvciB0aGUg
Y2FsbGVyIHRvIGZyZWUgaXQsIHNvIGl0IG11c3QgYmUgZnJlZWQgYnkgaGFzaHRhYmxlX3Jl
bW92ZSgpDQppZiB0aGUgcmVsYXRlZCBmbGFnIHdhcyBzZXQuDQoNCkkgY2FuIGFkZCBhIHNl
bnRlbmNlIHRvIHRoZSBjb21taXQgbWVzc2FnZS4NCg0KDQpKdWVyZ2VuDQo=
--------------YkEu9guguiIbAOElqmBK4qbW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------YkEu9guguiIbAOElqmBK4qbW--

--------------xLgdbenKbId05eKM6NYcvJ00--

--------------qtF0F3RaJ2QFxDb3dMyQx9Y5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPHjv4FAwAAAAAACgkQsN6d1ii/Ey8p
vwf/SdTi1M/QjZQEsCAyOlDEoLZIpZ+7iSZj0sundmrql6zC/fi16adwGjJRPBM5n+MQhzh8dCTs
4WLpBvBujEVw3MjptlT9j7OOO78w6tqVpIFW/SbSXfzSiRdxzRJ3vzvmwS0WQ52ggQ5pUFf4Q/AE
tYZFr+kczWOw6U8/IfyxWuqtbcpcdxqyrDkZHzJN3+A7b6l+3WS2qnPo5wPwjk9X2vj4xGEjrLQN
+usV7ZIx5zr1XDGcHTTEVyVqGgJ7pHgag38BUIWsHVbUarjhrbAmi8SyRKuhLkeVLfjCwQiFD6vi
X0U/uO5Kvu7QWatmTY4ju8/VS7P+aJjo3x3txw9YXA==
=yF29
-----END PGP SIGNATURE-----

--------------qtF0F3RaJ2QFxDb3dMyQx9Y5--

