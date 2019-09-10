Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E871AEEA2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 17:38:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7iC7-0004h6-2i; Tue, 10 Sep 2019 15:36:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6bdU=XF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7iC4-0004gt-Ir
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 15:36:36 +0000
X-Inumbo-ID: c527e254-d3e0-11e9-ac1f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c527e254-d3e0-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 15:36:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09228ABB2;
 Tue, 10 Sep 2019 15:36:34 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-30-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d1e2ee8-a80f-2aa8-d10e-c549439bac87@suse.com>
Date: Tue, 10 Sep 2019 17:36:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-30-jgross@suse.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiArc3RhdGljIGJvb2wg
c2NoZWRfdGFza2xldF9jaGVjayh1bnNpZ25lZCBpbnQgY3B1KQo+ICt7Cj4gKyAgICBib29sIHRh
c2tsZXRfd29ya19zY2hlZHVsZWQgPSBmYWxzZTsKPiArICAgIGNvbnN0IGNwdW1hc2tfdCAqbWFz
ayA9IGdldF9zY2hlZF9yZXMoY3B1KS0+Y3B1czsKPiArICAgIGludCBjcHVfaXRlcjsKCnVuc2ln
bmVkIGludCA/Cgo+ICtzdGF0aWMgdm9pZCBjb250ZXh0X3NhdmVkKHN0cnVjdCB2Y3B1ICpwcmV2
KQo+ICt7Cj4gKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCA9IHByZXYtPnNjaGVkX3VuaXQ7
Cj4gKwo+ICsgICAgLyogQ2xlYXIgcnVubmluZyBmbGFnIC9hZnRlci8gd3JpdGluZyBjb250ZXh0
IHRvIG1lbW9yeS4gKi8KPiArICAgIHNtcF93bWIoKTsKPiArCj4gKyAgICBwcmV2LT5pc19ydW5u
aW5nID0gMDsKPiArICAgIHVuaXQtPmlzX3J1bm5pbmcgPSAwOwo+ICsgICAgdW5pdC0+c3RhdGVf
ZW50cnlfdGltZSA9IE5PVygpOwo+ICsKPiArICAgIC8qIENoZWNrIGZvciBtaWdyYXRpb24gcmVx
dWVzdCAvYWZ0ZXIvIGNsZWFyaW5nIHJ1bm5pbmcgZmxhZy4gKi8KPiArICAgIHNtcF9tYigpOwo+
ICsKPiArICAgIHNjaGVkX2NvbnRleHRfc2F2ZWQodmNwdV9zY2hlZHVsZXIocHJldiksIHVuaXQp
Owo+ICsKPiArICAgIHNjaGVkX3VuaXRfbWlncmF0ZV9maW5pc2godW5pdCk7Cj4gK30KPiArCj4g
Ky8qCj4gKyAqIFJlbmRlenZvdXMgb24gZW5kIG9mIGNvbnRleHQgc3dpdGNoLgo+ICsgKiBBcyBu
byBsb2NrIGlzIHByb3RlY3RpbmcgdGhpcyByZW5kZXp2b3VzIGZ1bmN0aW9uIHdlIG5lZWQgdG8g
dXNlIGF0b21pYwo+ICsgKiBhY2Nlc3MgZnVuY3Rpb25zIG9uIHRoZSBjb3VudGVyLgo+ICsgKiBU
aGUgY291bnRlciB3aWxsIGJlIDAgaW4gY2FzZSBubyByZW5kZXp2b3VzIGlzIG5lZWRlZC4gRm9y
IHRoZSByZW5kZXp2b3VzCj4gKyAqIGNhc2UgaXQgaXMgaW5pdGlhbGlzZWQgdG8gdGhlIG51bWJl
ciBvZiBjcHVzIHRvIHJlbmRlenZvdXMgcGx1cyAxLiBFYWNoCj4gKyAqIG1lbWJlciBlbnRlcmlu
ZyBkZWNyZW1lbnRzIHRoZSBjb3VudGVyLiBUaGUgbGFzdCBvbmUgd2lsbCBkZWNyZW1lbnQgaXQg
dG8KPiArICogMSBhbmQgcGVyZm9ybSB0aGUgZmluYWwgbmVlZGVkIGFjdGlvbiBpbiB0aGF0IGNh
c2UgKGNhbGwgb2YgY29udGV4dF9zYXZlZCgpCj4gKyAqIGlmIHZjcHUgd2FzIHN3aXRjaGVkKSwg
YW5kIHRoZW4gc2V0IHRoZSBjb3VudGVyIHRvIHplcm8uIFRoZSBvdGhlciBtZW1iZXJzCj4gKyAq
IHdpbGwgd2FpdCB1bnRpbCB0aGUgY291bnRlciBiZWNvbWVzIHplcm8gdW50aWwgdGhleSBwcm9j
ZWVkLgo+ICsgKi8KPiArdm9pZCBzY2hlZF9jb250ZXh0X3N3aXRjaGVkKHN0cnVjdCB2Y3B1ICp2
cHJldiwgc3RydWN0IHZjcHUgKnZuZXh0KQo+ICt7Cj4gKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAq
bmV4dCA9IHZuZXh0LT5zY2hlZF91bml0Owo+ICsKPiArICAgIGlmICggYXRvbWljX3JlYWQoJm5l
eHQtPnJlbmRlenZvdXNfb3V0X2NudCkgKQo+ICsgICAgewo+ICsgICAgICAgIGludCBjbnQgPSBh
dG9taWNfZGVjX3JldHVybigmbmV4dC0+cmVuZGV6dm91c19vdXRfY250KTsKPiArCj4gKyAgICAg
ICAgLyogQ2FsbCBjb250ZXh0X3NhdmVkKCkgYmVmb3JlIHJlbGVhc2luZyBvdGhlciB3YWl0ZXJz
LiAqLwo+ICsgICAgICAgIGlmICggY250ID09IDEgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAg
ICAgaWYgKCB2cHJldiAhPSB2bmV4dCApCj4gKyAgICAgICAgICAgICAgICBjb250ZXh0X3NhdmVk
KHZwcmV2KTsKPiArICAgICAgICAgICAgYXRvbWljX3NldCgmbmV4dC0+cmVuZGV6dm91c19vdXRf
Y250LCAwKTsKPiArICAgICAgICB9Cj4gKyAgICAgICAgZWxzZQo+ICsgICAgICAgICAgICB3aGls
ZSAoIGF0b21pY19yZWFkKCZuZXh0LT5yZW5kZXp2b3VzX291dF9jbnQpICkKPiArICAgICAgICAg
ICAgICAgIGNwdV9yZWxheCgpOwoKSG93IGNvbWUgY29udGV4dF9zYXZlZCgpIGlzIG5vdCBjYWxs
ZWQgb24gdGhpcyAiZWxzZSIgYnJhbmNoPyBIb3cKd2lsbCB2cHJldi0+aXNfcnVubmluZyBnZXQg
Y2xlYXJlZCB0aGVyZT8gT3IsIHNpbmNlIGV2ZXJ5dGhpbmcKZWxzZSBpbiB0aGUgZnVuY3Rpb24g
aXMgcGVyLXVuaXQsIGRvZXMgdGhpcyBjbGVhcmluZyB3YW50IHRvIG1vdmUKaGVyZT8KCj4gLXZv
aWQgY29udGV4dF9zYXZlZChzdHJ1Y3QgdmNwdSAqcHJldikKPiArc3RhdGljIHZvaWQgc2NoZWRf
c2xhdmUodm9pZCkKPiAgewo+IC0gICAgLyogQ2xlYXIgcnVubmluZyBmbGFnIC9hZnRlci8gd3Jp
dGluZyBjb250ZXh0IHRvIG1lbW9yeS4gKi8KPiAtICAgIHNtcF93bWIoKTsKPiArICAgIHN0cnVj
dCB2Y3B1ICAgICAgICAgICp2cHJldiA9IGN1cnJlbnQ7Cj4gKyAgICBzdHJ1Y3Qgc2NoZWRfdW5p
dCAgICAqcHJldiA9IHZwcmV2LT5zY2hlZF91bml0LCAqbmV4dDsKPiArICAgIHNfdGltZV90ICAg
ICAgICAgICAgICBub3c7Cj4gKyAgICBzcGlubG9ja190ICAgICAgICAgICAqbG9jazsKPiArICAg
IGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cgp1bnNpZ25lZCBpbnQ/Cgo+IEBAIC0xOTcx
LDYgKzIxNjQsNyBAQCB2b2lkIF9faW5pdCBzY2hlZHVsZXJfaW5pdCh2b2lkKQo+ICAgICAgaW50
IGk7Cj4gIAo+ICAgICAgb3Blbl9zb2Z0aXJxKFNDSEVEVUxFX1NPRlRJUlEsIHNjaGVkdWxlKTsK
PiArICAgIG9wZW5fc29mdGlycShTQ0hFRF9TTEFWRV9TT0ZUSVJRLCBzY2hlZF9zbGF2ZSk7CgpO
b3RpY2luZyB0aGUgIndlIGhhdmUgYSByYWNlIiBjb21tZW50IGFuZCBjb2RlIGluIHNjaGVkdWxl
KCkgSQp3b25kZXIgaWYgdGhlcmUgaXNuJ3QgZW5vdWdoIHN0YXRlIGZvciBzY2hlZHVsZSgpIHRv
IGtub3cKd2hldGhlciB0byBjYWxsIHNjaGVkX3NsYXZlKCksIHJhdGhlciB0aGFuIGhhdmluZyB0
aGlzIGV4dHJhCnNvZnRpcnEuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
