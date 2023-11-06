Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0C37E1B89
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 08:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627782.978634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzuPr-0002JJ-2w; Mon, 06 Nov 2023 07:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627782.978634; Mon, 06 Nov 2023 07:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzuPq-0002GA-WF; Mon, 06 Nov 2023 07:52:59 +0000
Received: by outflank-mailman (input) for mailman id 627782;
 Mon, 06 Nov 2023 07:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=czoR=GT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qzuPp-0002G4-Ov
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 07:52:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f6226f2-7c79-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 08:52:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17BBC216DA;
 Mon,  6 Nov 2023 07:52:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD8B8138F3;
 Mon,  6 Nov 2023 07:52:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Fzx6NFebSGWjRgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Nov 2023 07:52:55 +0000
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
X-Inumbo-ID: 7f6226f2-7c79-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699257176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dNDJrSNSTE4bfSynjWIOGWS0hiaABGumsmPSUh7IwNo=;
	b=YAgYWAf5wVlkeqtaqu01kYEyDwtTvUt0vYsIGdPPnVLMIhlYiKzM7xeJ0TiBv1TY4/10+X
	ZlgAPCw+UXOsQXIA6YgiUYO/DJww0vS++1xJoGr2CMPjvskHgrOQIId/rPz/X1sp92KteN
	i0qP7OjYeFt0pNmkbmPSdA797do6rpQ=
Message-ID: <1833e1d0-1c4d-465e-ac39-9eb0548c3eba@suse.com>
Date: Mon, 6 Nov 2023 08:52:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/29] tools/xenlogd: add 9pfs attach request support
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-8-jgross@suse.com>
 <CAKf6xptypy5bnkwofJ_e7qHickAaR-qhMsHtwM-r7Pt2jBvvBQ@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <CAKf6xptypy5bnkwofJ_e7qHickAaR-qhMsHtwM-r7Pt2jBvvBQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ovl4gz4NQZpSlH8DBaKX00aI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ovl4gz4NQZpSlH8DBaKX00aI
Content-Type: multipart/mixed; boundary="------------yznEd5np0LfQKDtss3EuFxPM";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <1833e1d0-1c4d-465e-ac39-9eb0548c3eba@suse.com>
Subject: Re: [PATCH 07/29] tools/xenlogd: add 9pfs attach request support
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-8-jgross@suse.com>
 <CAKf6xptypy5bnkwofJ_e7qHickAaR-qhMsHtwM-r7Pt2jBvvBQ@mail.gmail.com>
In-Reply-To: <CAKf6xptypy5bnkwofJ_e7qHickAaR-qhMsHtwM-r7Pt2jBvvBQ@mail.gmail.com>

--------------yznEd5np0LfQKDtss3EuFxPM
Content-Type: multipart/mixed; boundary="------------8PJViXBMUeW1yKuTa2wf8gc9"

--------------8PJViXBMUeW1yKuTa2wf8gc9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMTEuMjMgMTY6MTMsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDEsIDIwMjMgYXQgNTo1NOKAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gQWRkIHRoZSBhdHRhY2ggcmVxdWVzdCBvZiB0aGUgOXBmcyBwcm90
b2NvbC4gVGhpcyBpbnRyb2R1Y2VzIHRoZSAiZmlkIg0KPj4gc2NoZW1lIG9mIHRoZSA5cGZz
IHByb3RvY29sLg0KPj4NCj4+IEFzIHRoaXMgd2lsbCBiZSBuZWVkZWQgbGF0ZXIsIHVzZSBh
IGRlZGljYXRlZCBtZW1vcnkgYWxsb2NhdGlvbg0KPj4gZnVuY3Rpb24gaW4gYWxsb2NfZmlk
KCkuDQo+Pg0KPj4gRm9yIGZpbGxpbmcgdGhlIHFpZCBkYXRhIHRha2UgdGhlIGFwcHJvYWNo
IGZyb20gdGhlIHFlbXUgOXBmcyBiYWNrZW5kDQo+PiBpbXBsZW1lbnRhdGlvbi4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAt
LS0NCj4+ICAgdG9vbHMveGVubG9nZC9pby5jICAgICAgfCAxMjggKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICB0b29scy94ZW5sb2dkL3hlbmxvZ2Qu
YyB8ICAgMSArDQo+PiAgIHRvb2xzL3hlbmxvZ2QveGVubG9nZC5oIHwgIDExICsrKysNCj4+
ICAgMyBmaWxlcyBjaGFuZ2VkLCAxNDAgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS90b29scy94ZW5sb2dkL2lvLmMgYi90b29scy94ZW5sb2dkL2lvLmMNCj4+IGluZGV4
IGYzNTUyMDAxOGYuLmZhODI1YzlmMzkgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5sb2dk
L2lvLmMNCj4+ICsrKyBiL3Rvb2xzL3hlbmxvZ2QvaW8uYw0KPiANCj4+ICtzdGF0aWMgc3Ry
dWN0IHA5X2ZpZCAqYWxsb2NfZmlkX21lbShkZXZpY2UgKmRldmljZSwgdW5zaWduZWQgaW50
IGZpZCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBj
aGFyICpwYXRoKQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IHA5X2ZpZCAqZmlkcDsNCj4+ICsg
ICAgc2l6ZV90IHBhdGhsZW47DQo+PiArDQo+PiArICAgIHBhdGhsZW4gPSBzdHJsZW4oZGV2
aWNlLT5ob3N0X3BhdGgpICsgc3RybGVuKHBhdGgpICsgMTsNCj4+ICsgICAgZmlkcCA9IGNh
bGxvYyhzaXplb2YoKmZpZHApICsgcGF0aGxlbiwgMSk7DQo+PiArICAgIGlmICggIWZpZHAg
KQ0KPj4gKyAgICAgICAgcmV0dXJuIE5VTEw7DQo+PiArDQo+PiArICAgIGZpZHAtPmZpZCA9
IGZpZDsNCj4+ICsgICAgc25wcmludGYoZmlkcC0+cGF0aCwgcGF0aGxlbiwgIiVzJXMiLCBk
ZXZpY2UtPmhvc3RfcGF0aCwgcGF0aCk7DQo+IA0KPiBjaGVja19ob3N0X3BhdGgoKSBzaG91
bGQgYmUgZW5oYW5jZWQgdG8gZW5zdXJlIGhvc3RfcGF0aCBoYXMgYQ0KPiB0cmFpbGluZyAn
LycsIG9yIHN3aXRjaCB0aGlzIHRvICIlcy8lcyIgdG8gZW5zdXJlIGl0J3MgYWx3YXlzIHBy
ZXNlbnQ/DQoNCk5vLCAicGF0aCIgaXMgYWx3YXlzIHN0YXJ0aW5nIHdpdGggYSAiLyIgaWYg
aXQgaXMgbm90IGVtcHR5Lg0KDQo+IA0KPj4gKw0KPj4gKyAgICByZXR1cm4gZmlkcDsNCj4+
ICt9DQo+PiArDQo+IA0KPiANCj4+ICtzdGF0aWMgdm9pZCBmcmVlX2ZpZChkZXZpY2UgKmRl
dmljZSwgc3RydWN0IHA5X2ZpZCAqZmlkcCkNCj4+ICt7DQo+PiArICAgIGlmICggIWZpZHAg
KQ0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKw0KPj4gKyAgICBkZXZpY2UtPm5fZmlkcy0t
Ow0KPj4gKyAgICBYRU5fVEFJTFFfUkVNT1ZFKCZkZXZpY2UtPmZpZHMsIGZpZHAsIGxpc3Qp
Ow0KPj4gKyAgICBmcmVlKGZpZHApOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IGZp
bGxfcWlkKGNvbnN0IGNoYXIgKnBhdGgsIHN0cnVjdCBwOV9xaWQgKnFpZCwgc3RydWN0IHN0
YXQgKnN0YnVmKQ0KPiANCj4gTml0OiBvcmRlcmluZyBpcyBpbnB1dCwgb3V0cHV0LCBvcHRp
b25hbCBpbnB1dCwgc28geW91IG1pZ2h0IHdhbnQgdG8gcmUtb3JkZXI/DQoNCkhtbSwgSSBk
aWQgaXQgb24gcHVycG9zZSwgYXMgdGhlIGxhc3QgcGFyYW1ldGVyIGlzIG9wdGlvbmFsIChh
cyB5b3Ugc2FpZCkuDQoNCj4gDQo+IHN0YnVmIGNhbiBiZSBjb25zdD8NCg0KWWVzLg0KDQo+
IA0KPj4gK3sNCj4+ICsgICAgc3RydWN0IHN0YXQgc3Q7DQo+PiArDQo+PiArICAgIGlmICgg
IXN0YnVmICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgaWYgKCBzdGF0KHBhdGgsICZzdCkg
KQ0KPj4gKyAgICAgICAgICAgIHJldHVybiBlcnJubzsNCj4+ICsNCj4+ICsgICAgICAgIHN0
YnVmID0gJnN0Ow0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHFpZC0+dHlwZSA9IFNfSVNE
SVIoc3RidWYtPnN0X21vZGUpID8gUUlEX1RZUEVfRElSIDogMDsNCj4+ICsgICAgcWlkLT52
ZXJzaW9uID0gc3RidWYtPnN0X210aW1lIF4gKHN0YnVmLT5zdF9zaXplIDw8IDgpOw0KPj4g
KyAgICBxaWQtPnBhdGggPSBzdGJ1Zi0+c3RfaW5vOw0KPj4gKw0KPj4gKyAgICByZXR1cm4g
MDsNCj4+ICt9DQo+PiArDQo+PiAgIHN0YXRpYyB2b2lkIHA5X2Vycm9yKGRldmljZSAqZGV2
aWNlLCB1aW50MTZfdCB0YWcsIHVpbnQzMl90IGVycikNCj4+ICAgew0KPj4gICAgICAgdW5z
aWduZWQgaW50IGVycm9mZjsNCj4+IEBAIC00NzYsNiArNTY1LDQxIEBAIHN0YXRpYyB2b2lk
IHA5X3ZlcnNpb24oZGV2aWNlICpkZXZpY2UsIHN0cnVjdCBwOV9oZWFkZXIgKmhkcikNCj4+
ICAgICAgICAgICAgICAgICAgIHZlcnNpb24pOw0KPj4gICB9DQo+Pg0KPj4gK3N0YXRpYyB2
b2lkIHA5X2F0dGFjaChkZXZpY2UgKmRldmljZSwgc3RydWN0IHA5X2hlYWRlciAqaGRyKQ0K
Pj4gK3sNCj4+ICsgICAgdWludDMyX3QgZmlkOw0KPj4gKyAgICB1aW50MzJfdCBkdW1teV91
MzI7DQo+PiArICAgIHVuc2lnbmVkIGludCBkdW1teV91aW50Ow0KPj4gKyAgICBzdHJ1Y3Qg
cDlfcWlkIHFpZDsNCj4+ICsgICAgaW50IHJldDsNCj4+ICsNCj4+ICsgICAgcmV0ID0gZmls
bF9kYXRhKGRldmljZSwgIlVVU1NVIiwgJmZpZCwgJmR1bW15X3UzMiwgJmR1bW15X3VpbnQs
ICZkdW1teV91aW50LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgJmR1bW15X3UzMik7DQo+
PiArICAgIGlmICggcmV0ICE9IDUgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBwOV9lcnJv
cihkZXZpY2UsIGhkci0+dGFnLCBlcnJubyk7DQo+PiArICAgICAgICByZXR1cm47DQo+PiAr
ICAgIH0NCj4gDQo+IFdlIG1pZ2h0IHdhbnQgdG8gY2hlY2sgdGhlIGZpcnN0IGR1bW15X3Uz
MiAoYWZpZCkgdG8gZW5zdXJlIGl0J3MgTk9GSUQ/DQo+ICIiIg0KPiBJZiB0aGUgY2xpZW50
IGRvZXMgbm90IHdpc2ggdG8gYXV0aGVudGljYXRlIHRoZSBjb25uZWN0aW9uLCBvciBrbm93
cw0KPiB0aGF0IGF1dGhlbnRpY2F0aW9uIGlzIG5vdCByZXF1aXJlZCwgdGhlIGFmaWQgZmll
bGQgaW4gdGhlIGF0dGFjaCBtZXMtDQo+IHNhZ2Ugc2hvdWxkIGJlIHNldCB0byBOT0ZJRCwg
ZGVmaW5lZCBhcyAodTMyaW50KX4wIGluIGZjYWxsLmguIElmIHRoZQ0KPiBjbGllbnQgZG9l
cyB3aXNoIHRvIGF1dGhlbnRpY2F0ZSwgaXQgbXVzdCBhY3F1aXJlIGFuZCB2YWxpZGF0ZSBh
biBhZmlkDQo+IHVzaW5nIGFuIGF1dGggbWVzc2FnZSBiZWZvcmUgZG9pbmcgdGhlIGF0dGFj
aC4NCj4gIiIiDQo+IA0KPiBTaW5jZSBhdXRoIGlzbid0IGltcGxlbWVudGVkLCBpdCdzIHBy
b2JhYmx5IG5vdCBuZWNlc3NhcnkgdG8gY2hlY2sgYWZpZD8NCg0KVGhhdCB3YXMgdGhlIGlk
ZWEsIHllcy4NCg0KPiANCj4gSSd2ZSBiZWVuIGxvb2tpbmcgYXQgdGhlc2UgYXMgcmVmZXJl
bmNlOg0KPiBodHRwczovL2VyaWN2aC5naXRodWIuaW8vOXAtcmZjL3JmYzlwMjAwMC5odG1s
DQo+IGh0dHBzOi8vZXJpY3ZoLmdpdGh1Yi5pby85cC1yZmMvcmZjOXAyMDAwLnUuaHRtbA0K
PiANCj4+ICsNCj4+ICsgICAgZGV2aWNlLT5yb290X2ZpZCA9IGFsbG9jX2ZpZChkZXZpY2Us
IGZpZCwgIiIpOw0KPj4gKyAgICBpZiAoICFkZXZpY2UtPnJvb3RfZmlkICkNCj4+ICsgICAg
ew0KPj4gKyAgICAgICAgcDlfZXJyb3IoZGV2aWNlLCBoZHItPnRhZywgZXJybm8pOw0KPj4g
KyAgICAgICAgcmV0dXJuOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJldCA9IGZpbGxf
cWlkKGRldmljZS0+aG9zdF9wYXRoLCAmcWlkLCBOVUxMKTsNCj4+ICsgICAgaWYgKCByZXQg
KQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBmcmVlX2ZpZChkZXZpY2UsIGRldmljZS0+cm9v
dF9maWQpOw0KPiANCj4gcm9vdF9maWQgaXMgb25seSBmcmVlZCBpbiB0aGlzIGVycm9yIHBh
dGguICBNYXliZSBmcmVlX2RldmljZSgpIHNob3VsZA0KPiBmcmVlIGFsbCB0aGUgZmlkcz8N
Cg0KTm8sIGJ1dCBpb190aHJlYWQoKSBzaG91bGQgZG8gc28gYXQgdGhlIGVuZC4NCg0KDQpK
dWVyZ2VuDQo=
--------------8PJViXBMUeW1yKuTa2wf8gc9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------8PJViXBMUeW1yKuTa2wf8gc9--

--------------yznEd5np0LfQKDtss3EuFxPM--

--------------ovl4gz4NQZpSlH8DBaKX00aI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVIm1cFAwAAAAAACgkQsN6d1ii/Ey96
FQf9FgBCFoPXBwqu/rXXjkbWDHYF21rlqPAwjRisoJq+VTDcBoBhlYqFD7LZhMkmtivYxEgX5vNe
A1AMD5JzBE6HtVm1bqjDgIyJ2+dhSIOlWem1uF60SF+QxuhhQGfw1Wgm24LocReM9HCgb2bePYPO
rEymPkMt9c13IA2JM1O9BdX9s7Q/VZZNZvABv8/ZlqcDkLuUc9AhF7PFYpeHqeP9Fl3fxfor0DIv
k3IlTideDZNFjaUR38yQOnw/DQqkaf1vPOWqYn3X1ObMAnEK1RQyy2sByuPaqFuYiL/LLUQlCA5j
+bG4QNbl3S1nyTnim3KnaGBk6vJRs/8m78hKwxqHag==
=RWOw
-----END PGP SIGNATURE-----

--------------ovl4gz4NQZpSlH8DBaKX00aI--

