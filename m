Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 348EE6F44CE
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:13:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528600.821969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpoc-0001bt-KU; Tue, 02 May 2023 13:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528600.821969; Tue, 02 May 2023 13:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpoc-0001Xd-HV; Tue, 02 May 2023 13:13:10 +0000
Received: by outflank-mailman (input) for mailman id 528600;
 Tue, 02 May 2023 13:13:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zdoi=AX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ptpob-0001XX-4v
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:13:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13f1ec27-e8eb-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 15:13:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6C2532219E;
 Tue,  2 May 2023 13:13:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2887B134FB;
 Tue,  2 May 2023 13:13:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UEh0CGIMUWRGUwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 02 May 2023 13:13:06 +0000
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
X-Inumbo-ID: 13f1ec27-e8eb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683033186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4/WSpv2WTFYkjPxg73ZtghIvmSLUD0+J5pZNvX3ePHA=;
	b=cvAOgHeqfHd4AvN/MDxZQvnltSnD5mrJ0GsdCeoO/R7Wc+xaMwfOnMVtxh6ZFySjFAnVvI
	RdIsKBEoEKjCm0l4dvyedwItYFhqfpdU+ztP6MGo0K5Lv5BP/a+8wxoLPUm4lJ9haPf734
	Ansikwl+1hWnzcsjkpDVJdRqNYJDXeM=
Message-ID: <ca098773-5428-c97f-87ae-402fffd114bb@suse.com>
Date: Tue, 2 May 2023 15:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230430144646.13624-1-jgross@suse.com>
 <0c01a75d-8a98-3931-28fa-68ed373e9a2e@apertussolutions.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/sysctl: fix XEN_SYSCTL_getdomaininfolist handling
 with XSM
In-Reply-To: <0c01a75d-8a98-3931-28fa-68ed373e9a2e@apertussolutions.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kMsB1mAB7fj1RnTAIn2sTf0i"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kMsB1mAB7fj1RnTAIn2sTf0i
Content-Type: multipart/mixed; boundary="------------sjLKwfXhK0tKd9Q2bGaxUaA7";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <ca098773-5428-c97f-87ae-402fffd114bb@suse.com>
Subject: Re: [PATCH] xen/sysctl: fix XEN_SYSCTL_getdomaininfolist handling
 with XSM
References: <20230430144646.13624-1-jgross@suse.com>
 <0c01a75d-8a98-3931-28fa-68ed373e9a2e@apertussolutions.com>
In-Reply-To: <0c01a75d-8a98-3931-28fa-68ed373e9a2e@apertussolutions.com>

--------------sjLKwfXhK0tKd9Q2bGaxUaA7
Content-Type: multipart/mixed; boundary="------------wTeax1LXCXbzJqxcuuMG6NSl"

--------------wTeax1LXCXbzJqxcuuMG6NSl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDUuMjMgMTU6MDMsIERhbmllbCBQLiBTbWl0aCB3cm90ZToNCj4gT24gNC8zMC8y
MyAxMDo0NiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IEluIGNhc2UgWFNNIGlzIGFjdGl2
ZSwgdGhlIGhhbmRsaW5nIG9mIFhFTl9TWVNDVExfZ2V0ZG9tYWluaW5mb2xpc3QNCj4+IGNh
biBmYWlsIGlmIHRoZSBsYXN0IGRvbWFpbiBzY2FubmVkIGlzbid0IGFsbG93ZWQgdG8gYmUg
YWNjZXNzZWQgYnkNCj4+IHRoZSBjYWxsaW5nIGRvbWFpbiAoaS5lLiB4c21fZ2V0ZG9tYWlu
aW5mbyhYU01fSE9PSywgZCkgaXMgZmFpbGluZykuDQo+Pg0KPj4gRml4IHRoYXQgYnkganVz
dCBpZ25vcmluZyBzY2FubmVkIGRvbWFpbnMgd2hlcmUgeHNtX2dldGRvbWFpbmluZm8oKQ0K
Pj4gaXMgcmV0dXJuaW5nIGFuIGVycm9yLCBsaWtlIGl0IGlzIGVmZmVjdGl2ZWx5IGRvbmUg
d2hlbiBzdWNoIGENCj4+IHNpdHVhdGlvbiBvY2N1cnMgZm9yIGEgZG9tYWluIG5vdCBiZWlu
ZyB0aGUgbGFzdCBvbmUgc2Nhbm5lZC4NCj4+DQo+PiBGaXhlczogZDA0NmYzNjFkYzkzICgi
WGVuIFNlY3VyaXR5IE1vZHVsZXM6IFhTTSIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IMKgIHhlbi9jb21tb24vc3lz
Y3RsLmMgfCAzICstLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3N5c2N0bC5j
IGIveGVuL2NvbW1vbi9zeXNjdGwuYw0KPj4gaW5kZXggMDI1MDVhYjA0NC4uMGNiZmU4YmQ0
NCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9jb21tb24vc3lzY3RsLmMNCj4+ICsrKyBiL3hlbi9j
b21tb24vc3lzY3RsLmMNCj4+IEBAIC04OSw4ICs4OSw3IEBAIGxvbmcgZG9fc3lzY3RsKFhF
Tl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX3N5c2N0bF90KSB1X3N5c2N0bCkNCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggbnVtX2RvbWFpbnMgPT0gb3AtPnUuZ2V0ZG9t
YWluaW5mb2xpc3QubWF4X2RvbWFpbnMgKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBicmVhazsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHhz
bV9nZXRkb21haW5pbmZvKFhTTV9IT09LLCBkKTsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmICggcmV0ICkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggeHNtX2dl
dGRvbWFpbmluZm8oWFNNX0hPT0ssIGQpICkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29udGludWU7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBn
ZXRkb21haW5pbmZvKGQsICZpbmZvKTsNCj4gDQo+IA0KPiBUaGlzIGNoYW5nZSBkb2VzIG5v
dCBtYXRjaCB0aGUgY29tbWl0IG1lc3NhZ2UuIFRoaXMgc2F5cyBpdCBmaXhlcyBhbiBpc3N1
ZSwgYnV0IA0KPiB1bmxlc3MgSSBhbSB0b3RhbGx5IG1pc3Npbmcgc29tZXRoaW5nLCB0aGlz
IGNoYW5nZSBpcyBub3RoaW5nIG1vcmUgdGhhbiANCj4gZm9ybWF0dGluZyB0aGF0IGRyb3Bz
IHRoZSB1c2Ugb2YgYW4gaW50ZXJtZWRpYXRlIHZhcmlhYmxlLiBQbGVhc2UgZmVlbCBmcmVl
IHRvIA0KPiBjb3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcgaGVyZSwgb3RoZXJ3aXNlIEkgYmVs
aWV2ZSB0aGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGJlIA0KPiBjaGFuZ2VkIHRvIHJlZmxl
Y3QgdGhlIGNvZGUgY2hhbmdlLg0KDQpZb3UgYXJlIG1pc3NpbmcgdGhlIGZhY3QgdGhhdCBy
ZXQgZ2V0dGluZyBzZXQgYnkgYSBmYWlsaW5nIHhzbV9nZXRkb21haW5pbmZvKCkNCmNhbGwg
bWlnaHQgcmVzdWx0IGluIHRoZSByZXQgdmFsdWUgYmVpbmcgcHJvcGFnYXRlZCB0byB0aGUg
c3lzY3RsIGNhbGxlci4gQW5kDQp0aGlzIHNob3VsZCBub3QgaGFwcGVuLiBTbyB0aGUgZml4
IGlzIHRvIE5PVCBtb2RpZnkgcmV0IGhlcmUuDQoNCj4gU2Vjb25kLCBhcyBmYXIgYXMgdGhl
IHByb2JsZW0gZGVzY3JpcHRpb24gZ29lcy4gVGhlICpvbmx5KiB0aW1lIHRoZSBjYWxsIHRv
IA0KPiB4c21fZ2V0ZG9tYWluaW5mbygpIGF0IHRoaXMgbG9jYXRpb24gd2lsbCByZXR1cm4g
YW55dGhpbmcgb3RoZXIgdGhhbiAwLCBpcyB3aGVuIA0KPiBGTEFTSyBpcyBiZWluZyB1c2Vk
IGFuZCBhIGRvbWFpbiB3aG9zZSB0eXBlIGlzIG5vdCBhbGxvd2VkIGdldGRvbWFpbmluZm8g
aXMgDQo+IG1ha2luZyB0aGUgY2FsbC4gWFNNX0hPT0sgc2lnbmFscyBhIG5vLW9wIGNoZWNr
IGZvciB0aGUgZGVmYXVsdC9kdW1teSBwb2xpY3ksIA0KPiBhbmQgdGhlIFNJTE8gcG9saWN5
IGRvZXMgbm90IG92ZXJyaWRlIHRoZSBkZWZhdWx0L2R1bW15IHBvbGljeSBmb3IgdGhpcyBj
aGVjay4NCg0KWW91ciBzdGF0ZW1lbnQgc291bmRzIGFzIGlmIHhzbV9nZXRkb21haW5pbmZv
KCkgd291bGQgYWx3YXlzIHJldHVybiB0aGUgc2FtZQ0KdmFsdWUgZm9yIGEgZ2l2ZW4gY2Fs
bGVyIGRvbWFpbi4gSXNuJ3QgdGhhdCByZXR1cm4gdmFsdWUgYWxzbyBkZXBlbmRpbmcgb24g
dGhlDQpkb21haW4gc3BlY2lmaWVkIHZpYSB0aGUgc2Vjb25kIHBhcmFtZXRlcj8gSW4gY2Fz
ZSBpdCBpc24ndCwgd2h5IGRvZXMgdGhhdA0KcGFyYW1ldGVyIGV2ZW4gZXhpc3Q/DQoNCg0K
SnVlcmdlbg0K
--------------wTeax1LXCXbzJqxcuuMG6NSl
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------wTeax1LXCXbzJqxcuuMG6NSl--

--------------sjLKwfXhK0tKd9Q2bGaxUaA7--

--------------kMsB1mAB7fj1RnTAIn2sTf0i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRRDGEFAwAAAAAACgkQsN6d1ii/Ey+E
vwf7Bj/AW2e3YlGXtK2EzdoSzUIvg1jbx7l6aodqBSCPKlePgvW9LejgbmI6LNzl/nXPCgEGke1y
gLLyufR1XqiTdngcQTeW2Klx18n0lxleHC0wMCNFJlcqtfiKcKLZu0K3dJjkP/d4ljV42vwlJD5u
4M1SuHguS5VKv8NhwqUb0NBvazN6pg2481LAwapyKFeh+SFvXsjGVo2aE0pR5kQa17R5ZBvnJ9OP
ZUCX47fFG4yVtWR1RxmsRieZTGK0XAysv94PokZSqtgE5bF4vCEfk1AUXmXo/KcaN+y3hoJ0y2Ee
qi8m9bKS5OpNxwxtacwmpGLpCbspz/978sF9jj72Pw==
=Df7a
-----END PGP SIGNATURE-----

--------------kMsB1mAB7fj1RnTAIn2sTf0i--

