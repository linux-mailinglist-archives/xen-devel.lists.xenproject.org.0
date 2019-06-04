Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E840734D32
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 18:25:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYCEC-0001Ff-6f; Tue, 04 Jun 2019 16:24:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYCEA-0001FR-HV
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 16:23:58 +0000
X-Inumbo-ID: 27521722-86e5-11e9-a110-abeccc2ae46d
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 27521722-86e5-11e9-a110-abeccc2ae46d;
 Tue, 04 Jun 2019 16:23:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68F8CA78;
 Tue,  4 Jun 2019 09:23:57 -0700 (PDT)
Received: from [10.37.8.2] (unknown [10.37.8.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C8753F5AF;
 Tue,  4 Jun 2019 09:23:55 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-10-julien.grall@arm.com>
 <5CF69A800200007800235346@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <70c2a03b-12f2-f845-9afc-df45f3293c79@arm.com>
Date: Tue, 4 Jun 2019 17:23:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF69A800200007800235346@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 09/14] xen/x86: mm: Re-implement
 set_gpfn_from_mfn() as a static inline function
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNi80LzE5IDU6MjEgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAz
LjA2LjE5IGF0IDE4OjAzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5o
Cj4+IEBAIC00NDIsNiArNDQyLDggQEAgaW50IGNoZWNrX2Rlc2NyaXB0b3IoY29uc3Qgc3RydWN0
IGRvbWFpbiAqZCwgc2VnX2Rlc2NfdCAqZGVzYyk7Cj4+ICAgCj4+ICAgZXh0ZXJuIHBhZGRyX3Qg
bWVtX2hvdHBsdWc7Cj4+ICAgCj4+ICtleHRlcm4gc3RydWN0IGRvbWFpbiAqZG9tX3hlbiwgKmRv
bV9pbywgKmRvbV9jb3c7CS8qIGZvciB2bWNvcmVpbmZvICovCj4gCj4gQWgsIG5vdyBJIHNlZSB3
aGF0IEFuZHJldyB3YXMgdGFsa2luZyBhYm91dC4gSW4gbXkgcGF0Y2gsIEknbGwgbW92ZQo+IHRo
ZSBkZWNsYXJhdGlvbnMgYWhlYWQgb2YgdGhlIGFzbS9tbS5oIGluY2x1c2lvbiBwb2ludCB0aGVu
LgoKRG8geW91IHBsYW4gdG8gbWVyZ2UgeW91ciBwYXRjaCBmaXJzdD8gSnVzdCB0byBrbm93IGlm
IEkgbmVlZCB0byByZWJhc2UuCgo+IAo+PiBAQCAtNDgzLDI0ICs0ODUsMjUgQEAgZXh0ZXJuIHBh
ZGRyX3QgbWVtX2hvdHBsdWc7Cj4+ICAgI2RlZmluZSBTSEFSRURfTTJQKF9lKSAgICAgICAgICAg
KChfZSkgPT0gU0hBUkVEX00yUF9FTlRSWSkKPj4gICAKPj4gICAjZGVmaW5lIGNvbXBhdF9tYWNo
aW5lX3RvX3BoeXNfbWFwcGluZyAoKHVuc2lnbmVkIGludAo+PiAqKVJEV1JfQ09NUEFUX01QVF9W
SVJUX1NUQVJUKQo+PiAtI2RlZmluZSBfc2V0X2dwZm5fZnJvbV9tZm4obWZuLCBwZm4pICh7ICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+PiAtICAgIHN0cnVjdCBkb21haW4gKmQgPSBwYWdlX2dl
dF9vd25lcihtZm5fdG9fcGFnZShfbWZuKG1mbikpKTsgXAo+PiAtICAgIHVuc2lnbmVkIGxvbmcg
ZW50cnkgPSAoZCAmJiAoZCA9PSBkb21fY293KSkgPyAgICAgICAgICAgICAgXAo+PiAtICAgICAg
ICBTSEFSRURfTTJQX0VOVFJZIDogKHBmbik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+PiAtICAgICgodm9pZCkoKG1mbikgPj0gKFJEV1JfQ09NUEFUX01QVF9WSVJUX0VORCAtIFJE
V1JfQ09NUEFUX01QVF9WSVJUX1NUQVJUKSAvIDQgfHwgXAo+PiAtICAgICAgICAgICAgKGNvbXBh
dF9tYWNoaW5lX3RvX3BoeXNfbWFwcGluZ1sobWZuKV0gPSAodW5zaWduZWQgaW50KShlbnRyeSkp
KSwgXAo+PiAtICAgICBtYWNoaW5lX3RvX3BoeXNfbWFwcGluZ1sobWZuKV0gPSAoZW50cnkpKTsg
ICAgICAgICAgICAgICAgXAo+PiAtICAgIH0pCj4+ICAgCj4+ICAgLyoKPj4gICAgKiBEaXNhYmxl
IHNvbWUgdXNlcnMgb2Ygc2V0X2dwZm5fZnJvbV9tZm4oKSAoZS5nLiwgZnJlZV9oZWFwX3BhZ2Vz
KCkpIHVudGlsCj4+ICAgICogdGhlIG1hY2hpbmVfdG9fcGh5c19tYXBwaW5nIGlzIGFjdHVhbGx5
IHNldCB1cC4KPj4gICAgKi8KPj4gICBleHRlcm4gYm9vbCBtYWNoaW5lX3RvX3BoeXNfbWFwcGlu
Z192YWxpZDsKPj4gLSNkZWZpbmUgc2V0X2dwZm5fZnJvbV9tZm4obWZuLCBwZm4pIGRvIHsgICAg
ICAgIFwKPj4gLSAgICBpZiAoIG1hY2hpbmVfdG9fcGh5c19tYXBwaW5nX3ZhbGlkICkgICAgICAg
IFwKPj4gLSAgICAgICAgX3NldF9ncGZuX2Zyb21fbWZuKG1mbiwgcGZuKTsgICAgICAgICAgIFwK
Pj4gLX0gd2hpbGUgKDApCj4+ICsKPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzZXRfZ3Bmbl9mcm9t
X21mbih1bnNpZ25lZCBsb25nIG1mbiwgdW5zaWduZWQgbG9uZyBwZm4pCj4+ICt7Cj4+ICsgICAg
c3RydWN0IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVyKG1mbl90b19wYWdlKF9tZm4obWZuKSkp
Owo+IAo+IGNvbnN0PyBBbmQgd2l0aCB0aGF0IHRoZW4KCkhtbW0geWVzLiBJIGNhbid0IHJlbWVt
YmVyIHdoeSBJIGRpZG4ndCBkbyB0aGF0IGJlZm9yZS4KCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYW5rIHlvdSEKCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
