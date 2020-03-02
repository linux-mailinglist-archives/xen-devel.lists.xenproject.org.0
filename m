Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EED1757BB
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 10:55:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8hkE-0006Df-W3; Mon, 02 Mar 2020 09:52:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8hkD-0006DZ-Do
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 09:52:13 +0000
X-Inumbo-ID: 7d68a818-5c6b-11ea-9f1a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d68a818-5c6b-11ea-9f1a-12813bfff9fa;
 Mon, 02 Mar 2020 09:52:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E3617B248;
 Mon,  2 Mar 2020 09:52:11 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200228171348.21864-1-jgross@suse.com>
 <50a31456-80f3-8308-479f-2a0d522ad518@citrix.com>
 <9b2088ef-8545-9b93-e3d7-bec41ed56407@suse.com>
 <944f4772-02cb-d5ad-cfbd-884c25341380@suse.com>
 <c6f73d60-b437-93f8-926a-920804d026bf@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ee4b7cb8-5481-dc3e-3ff4-d49d487cdd17@suse.com>
Date: Mon, 2 Mar 2020 10:52:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c6f73d60-b437-93f8-926a-920804d026bf@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: make sure stop_machine_run() is
 always called in a tasklet
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDMuMjAyMCAxMDozNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwMi4wMy4yMCAx
MDowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI5LjAyLjIwMjAgMDY6NDcsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAyOC4wMi4yMCAyMDowNiwgQW5kcmV3IENvb3BlciB3cm90ZToK
Pj4+PiBPbiAyOC8wMi8yMDIwIDE3OjEzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+PiBAQCAt
NzAwLDYgKzY4OCwzMiBAQCBpbnQgbWljcm9jb2RlX3VwZGF0ZShYRU5fR1VFU1RfSEFORExFX1BB
UkFNKGNvbnN0X3ZvaWQpIGJ1ZiwgdW5zaWduZWQgbG9uZyBsZW4pCj4+Pj4+ICAgICAgICByZXR1
cm4gcmV0Owo+Pj4+PiAgICB9Cj4+Pj4+ICAgIAo+Pj4+PiAraW50IG1pY3JvY29kZV91cGRhdGUo
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTShjb25zdF92b2lkKSBidWYsIHVuc2lnbmVkIGxvbmcgbGVu
KQo+Pj4+PiArewo+Pj4+PiArICAgIGludCByZXQ7Cj4+Pj4+ICsgICAgc3RydWN0IHVjb2RlX2J1
ZiAqYnVmZmVyOwo+Pj4+PiArCj4+Pj4+ICsgICAgaWYgKCBsZW4gIT0gKHVpbnQzMl90KWxlbiAp
Cj4+Pj4+ICsgICAgICAgIHJldHVybiAtRTJCSUc7Cj4+Pj4+ICsKPj4+Pj4gKyAgICBpZiAoIG1p
Y3JvY29kZV9vcHMgPT0gTlVMTCApCj4+Pj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+
PiArCj4+Pj4+ICsgICAgYnVmZmVyID0geG1hbGxvY19mbGV4X3N0cnVjdChzdHJ1Y3QgdWNvZGVf
YnVmLCBidWZmZXIsIGxlbik7Cj4+Pj4+ICsgICAgaWYgKCAhYnVmZmVyICkKPj4+Pj4gKyAgICAg
ICAgcmV0dXJuIC1FTk9NRU07Cj4+Pj4+ICsKPj4+Pj4gKyAgICByZXQgPSBjb3B5X2Zyb21fZ3Vl
c3QoYnVmZmVyLT5idWZmZXIsIGJ1ZiwgbGVuKTsKPj4+Pj4gKyAgICBpZiAoIHJldCApCj4+Pj4+
ICsgICAgewo+Pj4+PiArICAgICAgICB4ZnJlZShidWZmZXIpOwo+Pj4+PiArICAgICAgICByZXR1
cm4gLUVGQVVMVDsKPj4+Pj4gKyAgICB9Cj4+Pj4+ICsgICAgYnVmZmVyLT5sZW4gPSBsZW47Cj4+
Pj4+ICsKPj4+Pj4gKyAgICByZXR1cm4gY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgwLCBtaWNy
b2NvZGVfdXBkYXRlX2hlbHBlciwgYnVmZmVyKTsKPj4+Pgo+Pj4+IEFueSByZWFzb24gd2h5IGNw
dSAwIGhlcmU/wqAgVGhlcmUgaXMgbm8gcmVzdHJpY3Rpb24gYXQgdGhlIG1vbWVudCwgYW5kCj4+
Pj4gcnVubmluZyB0aGUgdGFza2xldCBvbiB0aGUgY3VycmVudCBDUFUgaXMgc3VyZWx5IGJldHRl
ciB0aGFuIHBva2luZwo+Pj4+IENQVTAncyB0YXNrbGV0IHF1ZXVlIHJlbW90ZWx5LCB0aGVuIGlu
dGVycnVwdGluZyBpdC4KPj4+Cj4+PiBBcyBzdG9wX21hY2hpbmVfcnVuKCkgaXMgc2NoZWR1bGlu
ZyBhIHRhc2tsZXQgb24gYWxsIG90aGVyIGNwdXMgaXQKPj4+IGRvZXNuJ3QgcmVhbGx5IG1hdHRl
ci4gSW4gdGhlIGVuZCBJIGRvbid0IHJlYWxseSBtaW5kIGVpdGhlciB3YXkuCj4+Cj4+IEkgdGhp
bmsgYW55IGNhc2Ugd2hlcmUgd2UgY2FuIGF2b2lkIGFzc2lnbmluZyBzcGVjaWFsIG1lYW5pbmcK
Pj4gdG8gQ1BVIDAgaXMgaGVscGZ1bC4gV2hpbGUgd2Ugd29uJ3QgZ2V0IHRvIGJlaW5nIGFibGUg
dG8gb2ZmbGluZQo+PiB0aGUgQlNQIGFueSB0aW1lIHNvb24sIHdlIHNob3VsZG4ndCBwdXQgbW9y
ZSByb2FkIGJsb2NrcyBvbiB0aGUKPj4gcGF0aCB0aGVyZS4KPiAKPiBBcyBJIHNhaWQ6IGZpbmUg
d2l0aCBtZS4gU2hhbGwgSSByZXNlbmQgb3IgY2FuIHRoaXMgYmUgZG9uZSB3aGlsZQo+IGNvbW1p
dHRpbmc/CgpObyBuZWVkIHRvIHJlLXNlbmQuIEFuZCBmb3IgY29tcGxldGVuZXNzLCB3aXRoIHRo
ZSBhZGp1c3RtZW50ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
