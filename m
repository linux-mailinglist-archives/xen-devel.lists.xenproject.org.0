Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0444264C825
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 12:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462142.720321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Q5R-00079L-15; Wed, 14 Dec 2022 11:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462142.720321; Wed, 14 Dec 2022 11:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Q5Q-00076W-U3; Wed, 14 Dec 2022 11:38:08 +0000
Received: by outflank-mailman (input) for mailman id 462142;
 Wed, 14 Dec 2022 11:38:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8nZ=4M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p5Q5P-00076J-0n
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 11:38:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6760706-7ba3-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 12:38:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8BD921FF05;
 Wed, 14 Dec 2022 11:38:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C69D138F6;
 Wed, 14 Dec 2022 11:38:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xeIREZ21mWO/RwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 14 Dec 2022 11:38:05 +0000
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
X-Inumbo-ID: c6760706-7ba3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1671017885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4kJHOoA2MomV4EuPcRpBb9reZiDh6rY4+5RNbO7b728=;
	b=XjVtK/zKVl5e8yl1fMyZX8WMPh0x8QSkCMKO88q99y6jM/U8C6nUURuzNld2bH0cHN9lG7
	38I2wAN/6Lc1HqSJ/YVVslU6k2iRDtN61HEbNYLXa5b/2DHuH/vriYxaNLp+G5PgzTkT3C
	yZ5fGjPgddExeGSk+7pu8lx12j+2ezA=
Message-ID: <359c146a-ab34-9a0a-ee1b-9cc166fcc83d@suse.com>
Date: Wed, 14 Dec 2022 12:38:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 2/3] xen/spinlock: split recursive spinlocks from
 normal ones
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220910154959.15971-1-jgross@suse.com>
 <20220910154959.15971-3-jgross@suse.com>
 <71281857-7387-afc1-f9b0-e076e4f076a8@suse.com>
 <a6aadbc6-e34e-43db-26e5-5379ce2d88d3@suse.com>
 <ca86527a-94f6-a42e-4dbc-ed9134cec31b@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <ca86527a-94f6-a42e-4dbc-ed9134cec31b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Q8uEK9yNpgQX8xKERkwkdiaN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Q8uEK9yNpgQX8xKERkwkdiaN
Content-Type: multipart/mixed; boundary="------------yjqBUejQ4EyVpiD1Bz7O3kuT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Message-ID: <359c146a-ab34-9a0a-ee1b-9cc166fcc83d@suse.com>
Subject: Re: [RFC PATCH 2/3] xen/spinlock: split recursive spinlocks from
 normal ones
References: <20220910154959.15971-1-jgross@suse.com>
 <20220910154959.15971-3-jgross@suse.com>
 <71281857-7387-afc1-f9b0-e076e4f076a8@suse.com>
 <a6aadbc6-e34e-43db-26e5-5379ce2d88d3@suse.com>
 <ca86527a-94f6-a42e-4dbc-ed9134cec31b@suse.com>
In-Reply-To: <ca86527a-94f6-a42e-4dbc-ed9134cec31b@suse.com>

--------------yjqBUejQ4EyVpiD1Bz7O3kuT
Content-Type: multipart/mixed; boundary="------------mjrR1drdHDF0t2e9nfZz0G4D"

--------------mjrR1drdHDF0t2e9nfZz0G4D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTIuMjIgMTI6MjksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNC4xMi4yMDIy
IDEyOjEwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTQuMTIuMjIgMTE6MzksIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDEwLjA5LjIwMjIgMTc6NDksIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcG9kLmMNCj4+Pj4g
KysrIGIveGVuL2FyY2gveDg2L21tL3AybS1wb2QuYw0KPj4+PiBAQCAtMzk3LDcgKzM5Nyw3
IEBAIGludCBwMm1fcG9kX2VtcHR5X2NhY2hlKHN0cnVjdCBkb21haW4gKmQpDQo+Pj4+ICAg
IA0KPj4+PiAgICAgICAgLyogQWZ0ZXIgdGhpcyBiYXJyaWVyIG5vIG5ldyBQb0QgYWN0aXZp
dGllcyBjYW4gaGFwcGVuLiAqLw0KPj4+PiAgICAgICAgQlVHX09OKCFkLT5pc19keWluZyk7
DQo+Pj4+IC0gICAgc3Bpbl9iYXJyaWVyKCZwMm0tPnBvZC5sb2NrLmxvY2spOw0KPj4+PiAr
ICAgIHNwaW5fYmFycmllcigmcDJtLT5wb2QubG9jay5sb2NrLmxvY2spOw0KPj4+DQo+Pj4g
VGhpcyBpcyBnZXR0aW5nIHVud2llbGR5IGFzIHdlbGwsIGFuZCAuLi4NCj4+Pg0KPj4+PiBA
QCAtMTYwLDIxICsxNjUsMzAgQEAgdHlwZWRlZiB1bmlvbiB7DQo+Pj4+ICAgIA0KPj4+PiAg
ICB0eXBlZGVmIHN0cnVjdCBzcGlubG9jayB7DQo+Pj4+ICAgICAgICBzcGlubG9ja190aWNr
ZXRzX3QgdGlja2V0czsNCj4+Pj4gLSAgICB1MTYgcmVjdXJzZV9jcHU6U1BJTkxPQ0tfQ1BV
X0JJVFM7DQo+Pj4+IC0jZGVmaW5lIFNQSU5MT0NLX05PX0NQVSAgICAgICAgKCgxdSA8PCBT
UElOTE9DS19DUFVfQklUUykgLSAxKQ0KPj4+PiAtI2RlZmluZSBTUElOTE9DS19SRUNVUlNF
X0JJVFMgICgxNiAtIFNQSU5MT0NLX0NQVV9CSVRTKQ0KPj4+PiAtICAgIHUxNiByZWN1cnNl
X2NudDpTUElOTE9DS19SRUNVUlNFX0JJVFM7DQo+Pj4+IC0jZGVmaW5lIFNQSU5MT0NLX01B
WF9SRUNVUlNFICAgKCgxdSA8PCBTUElOTE9DS19SRUNVUlNFX0JJVFMpIC0gMSkNCj4+Pj4g
ICAgICAgIHVuaW9uIGxvY2tfZGVidWcgZGVidWc7DQo+Pj4+ICAgICNpZmRlZiBDT05GSUdf
REVCVUdfTE9DS19QUk9GSUxFDQo+Pj4+ICAgICAgICBzdHJ1Y3QgbG9ja19wcm9maWxlICpw
cm9maWxlOw0KPj4+PiAgICAjZW5kaWYNCj4+Pj4gICAgfSBzcGlubG9ja190Ow0KPj4+PiAg
ICANCj4+Pj4gK3N0cnVjdCBzcGlubG9ja19yZWN1cnNpdmUgew0KPj4+PiArICAgIHN0cnVj
dCBzcGlubG9jayBsb2NrOw0KPj4+PiArICAgIHUxNiByZWN1cnNlX2NwdTpTUElOTE9DS19D
UFVfQklUUzsNCj4+Pj4gKyNkZWZpbmUgU1BJTkxPQ0tfTk9fQ1BVICAgICAgICAoKDF1IDw8
IFNQSU5MT0NLX0NQVV9CSVRTKSAtIDEpDQo+Pj4+ICsjZGVmaW5lIFNQSU5MT0NLX1JFQ1VS
U0VfQklUUyAgKDE2IC0gU1BJTkxPQ0tfQ1BVX0JJVFMpDQo+Pj4+ICsgICAgdTE2IHJlY3Vy
c2VfY250OlNQSU5MT0NLX1JFQ1VSU0VfQklUUzsNCj4+Pj4gKyNkZWZpbmUgU1BJTkxPQ0tf
TUFYX1JFQ1VSU0UgICAoKDF1IDw8IFNQSU5MT0NLX1JFQ1VSU0VfQklUUykgLSAxKQ0KPj4+
PiArfTsNCj4+Pg0KPj4+IC4uLiBJJ20gbm90IHN1cmUgYW55d2F5IGl0J3MgYSBnb29kIGlk
ZWEgdG8gZW1iZWQgc3BpbmxvY2tfdCBpbnNpZGUgdGhlDQo+Pj4gbmV3IHN0cnVjdC4gSSdk
IHByZWZlciBpZiBub24tb3B0aW9uYWwgZmllbGRzIHdlcmUgYWx3YXlzIGF0IHRoZSBzYW1l
DQo+Pj4gcG9zaXRpb24sIGFuZCB0aGVyZSdzIG5vdCBnb2luZyB0byBiZSB0aGF0IG11Y2gg
ZHVwbGljYXRpb24gaWYgd2Ugd2VudA0KPj4+IHdpdGgNCj4+Pg0KPj4+IHR5cGVkZWYgc3Ry
dWN0IHNwaW5sb2NrIHsNCj4+PiAgICAgICBzcGlubG9ja190aWNrZXRzX3QgdGlja2V0czsN
Cj4+PiAgICAgICB1bmlvbiBsb2NrX2RlYnVnIGRlYnVnOw0KPj4+ICNpZmRlZiBDT05GSUdf
REVCVUdfTE9DS19QUk9GSUxFDQo+Pj4gICAgICAgc3RydWN0IGxvY2tfcHJvZmlsZSAqcHJv
ZmlsZTsNCj4+PiAjZW5kaWYNCj4+PiB9IHNwaW5sb2NrX3Q7DQo+Pj4NCj4+PiB0eXBlZGVm
IHN0cnVjdCByc3BpbmxvY2sgew0KPj4+ICAgICAgIHNwaW5sb2NrX3RpY2tldHNfdCB0aWNr
ZXRzOw0KPj4+ICAgICAgIHUxNiByZWN1cnNlX2NwdTpTUElOTE9DS19DUFVfQklUUzsNCj4+
PiAjZGVmaW5lIFNQSU5MT0NLX05PX0NQVSAgICAgICAgKCgxdSA8PCBTUElOTE9DS19DUFVf
QklUUykgLSAxKQ0KPj4+ICNkZWZpbmUgU1BJTkxPQ0tfUkVDVVJTRV9CSVRTICAoMTYgLSBT
UElOTE9DS19DUFVfQklUUykNCj4+PiAgICAgICB1MTYgcmVjdXJzZV9jbnQ6U1BJTkxPQ0tf
UkVDVVJTRV9CSVRTOw0KPj4+ICNkZWZpbmUgU1BJTkxPQ0tfTUFYX1JFQ1VSU0UgICAoKDF1
IDw8IFNQSU5MT0NLX1JFQ1VSU0VfQklUUykgLSAxKQ0KPj4+ICAgICAgIHVuaW9uIGxvY2tf
ZGVidWcgZGVidWc7DQo+Pj4gI2lmZGVmIENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUNCj4+
PiAgICAgICBzdHJ1Y3QgbG9ja19wcm9maWxlICpwcm9maWxlOw0KPj4+ICNlbmRpZg0KPj4+
IH0gcnNwaW5sb2NrX3Q7DQo+Pj4NCj4+PiBUaGlzIHdvdWxkIGFsc28gZWxpbWluYXRlIHRo
ZSBzaXplIGluY3JlYXNlIG9mIHJlY3Vyc2l2ZSBsb2NrcyBpbg0KPj4+IGRlYnVnIGJ1aWxk
cy4gQW5kIGZ1bmN0aW9ucyBsaWtlIHNwaW5fYmFycmllcigpIHRoZW4gYWxzbyB3b3VsZA0K
Pj4+IChoYXZlIHRvKSBwcm9wZXJseSBpbmRpY2F0ZSB3aGF0IGtpbmQgb2YgbG9jayB0aGV5
IGFjdCBvbi4NCj4+DQo+PiBZb3UgYXJlIGF3YXJlIHRoYXQgdGhpcyB3b3VsZCByZXF1aXJl
IHRvIGR1cGxpY2F0ZSBhbGwgdGhlIHNwaW5sb2NrDQo+PiBmdW5jdGlvbnMgZm9yIHRoZSBy
ZWN1cnNpdmUgc3BpbmxvY2tzPw0KPiANCj4gV2VsbCwgdG8gYmUgaG9uZXN0IEkgZGlkbid0
IHJlYWxseSBjb25zaWRlciB0aGlzIGFzcGVjdCwgYnV0IEkgdGhpbmsNCj4gdGhhdCdzIGEg
cmVhc29uYWJsZSBwcmljZSB0byBwYXkgKHdpdGggc29tZSBkZS1kdXBsaWNhdGlvbiBwb3Rl
bnRpYWwNCj4gaWYgd2Ugd2FudGVkIHRvKSwgcHJvdmlkZWQgd2Ugd2FudCB0byBnbyB0aGlz
IHJvdXRlIGluIHRoZSBmaXJzdCBwbGFjZS4NCg0KT2theS4NCg0KPiBUaGUgbGF0ZXN0IHdp
dGggdGhpcyBhc3BlY3QgaW4gbWluZCBJIHdvbmRlciB3aGV0aGVyIHdlIGFyZW4ndCBiZXR0
ZXINCj4gb2ZmIHdpdGggdGhlIGN1cnJlbnQgc3RhdGUgKHRoZSBtb3JlIHRoYXQgaWlyYyBB
bmRyZXcgdGhpbmtzIHRoYXQgd2UNCj4gc2hvdWxkIGdldCByaWQgb2YgcmVjdXJzaXZlIGxv
Y2tpbmcgYWx0b2dldGhlcikuDQoNClRoZSBxdWVzdGlvbiBpcyBob3cgKGFuZCB3aGVuKSB0
byByZWFjaCB0aGF0IGdvYWwuDQoNCkluIHRoZSBlbmQgdGhpcyB3YXMgdGhlIHJlYXNvbiB0
byBzZW5kIHRoZSBzZXJpZXMgYXMgUkZDIGZpcnN0Lg0KDQpJJ20gd2FpdGluZyB3aXRoIGFk
ZHJlc3NpbmcgeW91ciBjb21tZW50cyB1bnRpbCB0aGVyZSBpcyBjb25zZW5zdXMNCnRoYXQg
dGhlIHdob2xlIGlkZWEgaXMgcmVhbGx5IHdvcnRoIHRvIGJlIHB1cnN1ZWQuDQoNCg0KSnVl
cmdlbg0K
--------------mjrR1drdHDF0t2e9nfZz0G4D
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mjrR1drdHDF0t2e9nfZz0G4D--

--------------yjqBUejQ4EyVpiD1Bz7O3kuT--

--------------Q8uEK9yNpgQX8xKERkwkdiaN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOZtZwFAwAAAAAACgkQsN6d1ii/Ey/N
2wf/U/q3+0T+llgvSl3hvV60Ms3R/R6JlI2SmfZO3QP+Wr19L2+aMoRyCYJSMgdq+fL9m+f1HOTa
Z6ZiQgaaZOPJXsSImG7ExPucTLeDMD4QiUdN4j4PBALfC557ce2Cc3n3gmCljb7y4MC6BIg6Bcxn
eCV6txxTz12FxaAFo9PcXSpsvHxRQZOpvBAwwOYYMTDcx2ZXrpeFJOC1m5/cY3tw03ecr2UYa4gE
O6dvhtxFu0VKdYe/VieFLq+9TIkJ7N44nQSyMRunU+3FvCnqVH90whhGCrAmNwg02wSlceVegjKc
icgJtUQ12zMtsg89npz5NT11C7UCXDpU54sImzhnnA==
=JIiu
-----END PGP SIGNATURE-----

--------------Q8uEK9yNpgQX8xKERkwkdiaN--

