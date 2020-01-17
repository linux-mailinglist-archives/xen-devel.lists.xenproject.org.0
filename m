Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F0F140601
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 10:26:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isNr9-0005Cr-RZ; Fri, 17 Jan 2020 09:23:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isNr7-0005Cl-Qz
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 09:23:53 +0000
X-Inumbo-ID: 0efcbc4e-390b-11ea-ac27-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0efcbc4e-390b-11ea-ac27-bc764e2007e4;
 Fri, 17 Jan 2020 09:23:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1FE56ABB1;
 Fri, 17 Jan 2020 09:23:44 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <631aece1177fcd2326855f0ff4b53dadfcfc3680.1578503483.git.tamas.lengyel@intel.com>
 <1ea9f58b-5f86-7450-d0e3-d17252b94b20@suse.com>
 <CABfawhnxpuYsmidRtXY+o0B5Woj8OsbbsahHtWnsrqQk_1vOdw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e8d6f0cc-a5e8-c027-e644-51dfbba07ced@suse.com>
Date: Fri, 17 Jan 2020 10:23:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABfawhnxpuYsmidRtXY+o0B5Woj8OsbbsahHtWnsrqQk_1vOdw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 11/18] x86/mem_sharing: ASSERT that
 p2m_set_entry succeeds
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDEuMjAyMCAxNzoxMiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFRodSwgSmFu
IDE2LCAyMDIwIGF0IDk6MDcgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gT24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4g
U2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4K
Pj4+IC0tLQo+Pj4gIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIHwgNDIgKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0
aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPj4+IGlu
ZGV4IDkzZTc2MDU5MDAuLjNmMzZjZDZiYmMgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYv
bW0vbWVtX3NoYXJpbmcuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMK
Pj4+IEBAIC0xMTE3LDExICsxMTE3LDE5IEBAIGludCBhZGRfdG9fcGh5c21hcChzdHJ1Y3QgZG9t
YWluICpzZCwgdW5zaWduZWQgbG9uZyBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gsCj4+PiAgICAgICAg
ICBnb3RvIGVycl91bmxvY2s7Cj4+PiAgICAgIH0KPj4+Cj4+PiArICAgIC8qCj4+PiArICAgICAq
IE11c3Qgc3VjY2VlZCwgd2UganVzdCByZWFkIHRoZSBlbnRyeSBhbmQgaG9sZCB0aGUgcDJtIGxv
Y2sKPj4+ICsgICAgICogdmlhIGdldF90d29fZ2Zucy4KPj4+ICsgICAgICovCj4+PiAgICAgIHJl
dCA9IHAybV9zZXRfZW50cnkocDJtLCBfZ2ZuKGNnZm4pLCBzbWZuLCBQQUdFX09SREVSXzRLLAo+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9yYW1fc2hhcmVkLCBhKTsKPj4+ICsgICAg
QVNTRVJUKCFyZXQpOwo+Pgo+PiBBbmQgdGhlcmUncyBubyByaXNrIG9mIC1FTk9NRU0gYmVjYXVz
ZSBvZiBuZWVkaW5nIHRvIHNwbGl0IGEKPj4gbGFyZ2VyIG9yZGVyIHBhZ2U/IEF0IHRoZSB2ZXJ5
IGxlYXN0IHRoZSByZWFzb25pbmcgaW4gdGhlCj4+IGNvbW1lbnQgd291bGQgbmVlZCBmdXJ0aGVy
IGV4dGVuZGluZy4KPiAKPiBObyBiZWNhdXNlIHdlIGFyZSBwbHVnZ2luZyBhIGhvbGUgaW4gdGhl
IGRvbWFpbi4gVGhlcmUgaXMgbm8gbGFyZ2VyCj4gcGFnZSBtYXBwZWQgaW4gaGVyZSB0aGF0IHdv
dWxkIG5lZWQgdG8gYmUgYnJva2VuIHVwLgoKcDJtX2lzX2hvbGUoKSBhbHNvIGNvdmVycyBwMm1f
bW1pb19kbSBhbmQgcDJtX2ludmFsaWQuIFRoZSBmb3JtZXIKKHNob3VsZCByZWFsbHkgYmUgdGhl
IGxhdHRlcikgaXMgd2hhdCB5b3UnbGwgZ2V0IGJhY2sgZm9yIGUuZy4gYQpHRk4gYmV5b25kIG1h
eF9tYXBwZWRfcGZuLiBBaXVpIHN1Y2ggYSAic2V0IiBtYXkgdGhlbiByZXF1aXJlCnRhYmxlIHBv
cHVsYXRpb24sIHdoaWNoIG1heSBzdGlsbCB5aWVsZCAtRU5PTUVNIChhdCBsZWFzdCBFUFQKbG9v
a3MgdG8gcmV0dXJuIC1FTk9FTlQgaW4gdGhpcyBjYXNlIGluc3RlYWQ7IEkgZ3Vlc3MgSSdsbCBt
YWtlCmEgcGF0Y2gpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
