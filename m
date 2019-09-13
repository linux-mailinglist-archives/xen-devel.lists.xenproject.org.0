Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E4CB1E99
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 15:15:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8lNJ-0005Da-LH; Fri, 13 Sep 2019 13:12:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mE8E=XI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8lNH-0005DV-Jd
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 13:12:31 +0000
X-Inumbo-ID: 23971096-d628-11e9-95aa-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23971096-d628-11e9-95aa-12813bfff9fa;
 Fri, 13 Sep 2019 13:12:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 06C42AFB6;
 Fri, 13 Sep 2019 13:12:28 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-30-jgross@suse.com>
 <8d1e2ee8-a80f-2aa8-d10e-c549439bac87@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <0a38b0cf-cc53-a672-f5ce-52169335f59c@suse.com>
Date: Fri, 13 Sep 2019 15:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8d1e2ee8-a80f-2aa8-d10e-c549439bac87@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 29/48] xen/sched: add code to sync
 scheduling of all vcpus of a sched unit
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDkuMTkgMTc6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+ICtzdGF0aWMgYm9vbCBzY2hlZF90YXNrbGV0X2No
ZWNrKHVuc2lnbmVkIGludCBjcHUpCj4+ICt7Cj4+ICsgICAgYm9vbCB0YXNrbGV0X3dvcmtfc2No
ZWR1bGVkID0gZmFsc2U7Cj4+ICsgICAgY29uc3QgY3B1bWFza190ICptYXNrID0gZ2V0X3NjaGVk
X3JlcyhjcHUpLT5jcHVzOwo+PiArICAgIGludCBjcHVfaXRlcjsKPiAKPiB1bnNpZ25lZCBpbnQg
PwoKWWVzLgoKPiAKPj4gK3N0YXRpYyB2b2lkIGNvbnRleHRfc2F2ZWQoc3RydWN0IHZjcHUgKnBy
ZXYpCj4+ICt7Cj4+ICsgICAgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQgPSBwcmV2LT5zY2hlZF91
bml0Owo+PiArCj4+ICsgICAgLyogQ2xlYXIgcnVubmluZyBmbGFnIC9hZnRlci8gd3JpdGluZyBj
b250ZXh0IHRvIG1lbW9yeS4gKi8KPj4gKyAgICBzbXBfd21iKCk7Cj4+ICsKPj4gKyAgICBwcmV2
LT5pc19ydW5uaW5nID0gMDsKPj4gKyAgICB1bml0LT5pc19ydW5uaW5nID0gMDsKPj4gKyAgICB1
bml0LT5zdGF0ZV9lbnRyeV90aW1lID0gTk9XKCk7Cj4+ICsKPj4gKyAgICAvKiBDaGVjayBmb3Ig
bWlncmF0aW9uIHJlcXVlc3QgL2FmdGVyLyBjbGVhcmluZyBydW5uaW5nIGZsYWcuICovCj4+ICsg
ICAgc21wX21iKCk7Cj4+ICsKPj4gKyAgICBzY2hlZF9jb250ZXh0X3NhdmVkKHZjcHVfc2NoZWR1
bGVyKHByZXYpLCB1bml0KTsKPj4gKwo+PiArICAgIHNjaGVkX3VuaXRfbWlncmF0ZV9maW5pc2go
dW5pdCk7Cj4+ICt9Cj4+ICsKPj4gKy8qCj4+ICsgKiBSZW5kZXp2b3VzIG9uIGVuZCBvZiBjb250
ZXh0IHN3aXRjaC4KPj4gKyAqIEFzIG5vIGxvY2sgaXMgcHJvdGVjdGluZyB0aGlzIHJlbmRlenZv
dXMgZnVuY3Rpb24gd2UgbmVlZCB0byB1c2UgYXRvbWljCj4+ICsgKiBhY2Nlc3MgZnVuY3Rpb25z
IG9uIHRoZSBjb3VudGVyLgo+PiArICogVGhlIGNvdW50ZXIgd2lsbCBiZSAwIGluIGNhc2Ugbm8g
cmVuZGV6dm91cyBpcyBuZWVkZWQuIEZvciB0aGUgcmVuZGV6dm91cwo+PiArICogY2FzZSBpdCBp
cyBpbml0aWFsaXNlZCB0byB0aGUgbnVtYmVyIG9mIGNwdXMgdG8gcmVuZGV6dm91cyBwbHVzIDEu
IEVhY2gKPj4gKyAqIG1lbWJlciBlbnRlcmluZyBkZWNyZW1lbnRzIHRoZSBjb3VudGVyLiBUaGUg
bGFzdCBvbmUgd2lsbCBkZWNyZW1lbnQgaXQgdG8KPj4gKyAqIDEgYW5kIHBlcmZvcm0gdGhlIGZp
bmFsIG5lZWRlZCBhY3Rpb24gaW4gdGhhdCBjYXNlIChjYWxsIG9mIGNvbnRleHRfc2F2ZWQoKQo+
PiArICogaWYgdmNwdSB3YXMgc3dpdGNoZWQpLCBhbmQgdGhlbiBzZXQgdGhlIGNvdW50ZXIgdG8g
emVyby4gVGhlIG90aGVyIG1lbWJlcnMKPj4gKyAqIHdpbGwgd2FpdCB1bnRpbCB0aGUgY291bnRl
ciBiZWNvbWVzIHplcm8gdW50aWwgdGhleSBwcm9jZWVkLgo+PiArICovCj4+ICt2b2lkIHNjaGVk
X2NvbnRleHRfc3dpdGNoZWQoc3RydWN0IHZjcHUgKnZwcmV2LCBzdHJ1Y3QgdmNwdSAqdm5leHQp
Cj4+ICt7Cj4+ICsgICAgc3RydWN0IHNjaGVkX3VuaXQgKm5leHQgPSB2bmV4dC0+c2NoZWRfdW5p
dDsKPj4gKwo+PiArICAgIGlmICggYXRvbWljX3JlYWQoJm5leHQtPnJlbmRlenZvdXNfb3V0X2Nu
dCkgKQo+PiArICAgIHsKPj4gKyAgICAgICAgaW50IGNudCA9IGF0b21pY19kZWNfcmV0dXJuKCZu
ZXh0LT5yZW5kZXp2b3VzX291dF9jbnQpOwo+PiArCj4+ICsgICAgICAgIC8qIENhbGwgY29udGV4
dF9zYXZlZCgpIGJlZm9yZSByZWxlYXNpbmcgb3RoZXIgd2FpdGVycy4gKi8KPj4gKyAgICAgICAg
aWYgKCBjbnQgPT0gMSApCj4+ICsgICAgICAgIHsKPj4gKyAgICAgICAgICAgIGlmICggdnByZXYg
IT0gdm5leHQgKQo+PiArICAgICAgICAgICAgICAgIGNvbnRleHRfc2F2ZWQodnByZXYpOwo+PiAr
ICAgICAgICAgICAgYXRvbWljX3NldCgmbmV4dC0+cmVuZGV6dm91c19vdXRfY250LCAwKTsKPj4g
KyAgICAgICAgfQo+PiArICAgICAgICBlbHNlCj4+ICsgICAgICAgICAgICB3aGlsZSAoIGF0b21p
Y19yZWFkKCZuZXh0LT5yZW5kZXp2b3VzX291dF9jbnQpICkKPj4gKyAgICAgICAgICAgICAgICBj
cHVfcmVsYXgoKTsKPiAKPiBIb3cgY29tZSBjb250ZXh0X3NhdmVkKCkgaXMgbm90IGNhbGxlZCBv
biB0aGlzICJlbHNlIiBicmFuY2g/IEhvdwo+IHdpbGwgdnByZXYtPmlzX3J1bm5pbmcgZ2V0IGNs
ZWFyZWQgdGhlcmU/IE9yLCBzaW5jZSBldmVyeXRoaW5nCj4gZWxzZSBpbiB0aGUgZnVuY3Rpb24g
aXMgcGVyLXVuaXQsIGRvZXMgdGhpcyBjbGVhcmluZyB3YW50IHRvIG1vdmUKPiBoZXJlPwoKVGhh
dCdzIGEgYnVnIEkndmUgYWxyZWFkeSBjb3JyZWN0ZWQgaW4gbXkgdmVyc2lvbiAzIChhbmQgdGhl
IG9uZSB3aGljaAppcyBiZWluZyB0ZXN0ZWQgYnkgU2VyZ2V5KS4KCj4gCj4+IC12b2lkIGNvbnRl
eHRfc2F2ZWQoc3RydWN0IHZjcHUgKnByZXYpCj4+ICtzdGF0aWMgdm9pZCBzY2hlZF9zbGF2ZSh2
b2lkKQo+PiAgIHsKPj4gLSAgICAvKiBDbGVhciBydW5uaW5nIGZsYWcgL2FmdGVyLyB3cml0aW5n
IGNvbnRleHQgdG8gbWVtb3J5LiAqLwo+PiAtICAgIHNtcF93bWIoKTsKPj4gKyAgICBzdHJ1Y3Qg
dmNwdSAgICAgICAgICAqdnByZXYgPSBjdXJyZW50Owo+PiArICAgIHN0cnVjdCBzY2hlZF91bml0
ICAgICpwcmV2ID0gdnByZXYtPnNjaGVkX3VuaXQsICpuZXh0Owo+PiArICAgIHNfdGltZV90ICAg
ICAgICAgICAgICBub3c7Cj4+ICsgICAgc3BpbmxvY2tfdCAgICAgICAgICAgKmxvY2s7Cj4+ICsg
ICAgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPiAKPiB1bnNpZ25lZCBpbnQ/CgpZZXMu
Cgo+IAo+PiBAQCAtMTk3MSw2ICsyMTY0LDcgQEAgdm9pZCBfX2luaXQgc2NoZWR1bGVyX2luaXQo
dm9pZCkKPj4gICAgICAgaW50IGk7Cj4+ICAgCj4+ICAgICAgIG9wZW5fc29mdGlycShTQ0hFRFVM
RV9TT0ZUSVJRLCBzY2hlZHVsZSk7Cj4+ICsgICAgb3Blbl9zb2Z0aXJxKFNDSEVEX1NMQVZFX1NP
RlRJUlEsIHNjaGVkX3NsYXZlKTsKPiAKPiBOb3RpY2luZyB0aGUgIndlIGhhdmUgYSByYWNlIiBj
b21tZW50IGFuZCBjb2RlIGluIHNjaGVkdWxlKCkgSQo+IHdvbmRlciBpZiB0aGVyZSBpc24ndCBl
bm91Z2ggc3RhdGUgZm9yIHNjaGVkdWxlKCkgdG8ga25vdwo+IHdoZXRoZXIgdG8gY2FsbCBzY2hl
ZF9zbGF2ZSgpLCByYXRoZXIgdGhhbiBoYXZpbmcgdGhpcyBleHRyYQo+IHNvZnRpcnEuCgpFc3Bl
Y2lhbGx5IHBhdGNoIDM1IGFkZHMgZnVydGhlciB1c2luZyBvZiBTQ0hFRF9TTEFWRV9TT0ZUSVJR
LiBJIGhhdmUKdHJpZWQgdG8gYXZvaWQgaXQsIGJ1dCB0aGUgcmVzdWx0cyB3ZXJlIGxvb2tpbmcg
cmF0aGVyIHVnbHkgYW5kIHN0aWxsCmZ1bGwgb2YgZGVhZGxvY2tzLgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
