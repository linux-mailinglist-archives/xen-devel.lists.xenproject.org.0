Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD713BCACC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:03:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmJB-0004IF-A8; Tue, 24 Sep 2019 15:00:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCmJ9-0004I8-Nc
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:00:51 +0000
X-Inumbo-ID: 190180e6-dedc-11e9-961f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 190180e6-dedc-11e9-961f-12813bfff9fa;
 Tue, 24 Sep 2019 15:00:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3836CAFA5;
 Tue, 24 Sep 2019 15:00:50 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-31-jgross@suse.com>
 <2ad8a8ce-4530-93c7-0161-9b806a38b05d@suse.com>
 <0e4a75eb-61cc-2c9c-0d8a-f854163acd57@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6288a88b-a5d8-dbd6-15c7-45ed19324510@suse.com>
Date: Tue, 24 Sep 2019 17:00:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0e4a75eb-61cc-2c9c-0d8a-f854163acd57@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 30/47] xen/sched: add support for
 multiple vcpus per sched unit where missing
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAxNjo0MSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMy4wOS4xOSAx
Nzo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBAQCAtMTg1MSw3ICsxODUyLDcgQEAgdm9pZCBzY2hlZF9jb250ZXh0
X3N3aXRjaGVkKHN0cnVjdCB2Y3B1ICp2cHJldiwgc3RydWN0IHZjcHUgKnZuZXh0KQo+Pj4gICAg
ICAgICAgICAgICB3aGlsZSAoIGF0b21pY19yZWFkKCZuZXh0LT5yZW5kZXp2b3VzX291dF9jbnQp
ICkKPj4+ICAgICAgICAgICAgICAgICAgIGNwdV9yZWxheCgpOwo+Pj4gICAgICAgfQo+Pj4gLSAg
ICBlbHNlIGlmICggdnByZXYgIT0gdm5leHQgKQo+Pj4gKyAgICBlbHNlIGlmICggdnByZXYgIT0g
dm5leHQgJiYgc2NoZWRfZ3JhbnVsYXJpdHkgPT0gMSApCj4+PiAgICAgICAgICAgY29udGV4dF9z
YXZlZCh2cHJldik7Cj4+PiAgIH0KPj4KPj4gV291bGQgeW91IG1pbmQgaGVscGluZyBtZSB3aXRo
IHVuZGVyc3RhbmRpbmcgd2h5IHRoaXMgY2FsbCBpcwo+PiBuZWVkZWQgd2l0aCBhIGdyYW51bGFy
aXR5IG9mIDEgb25seT8KPiAKPiBPdGhlcndpc2UgaXQgaXMgZG9uZSBqdXN0IGEgZmV3IGxpbmVz
IHVwIChncmFudWxhcml0eSAxIHdpbGwgcmVzdWx0Cj4gaW4gcmVuZGV6dm91c19vdXRfY250IGJl
aW5nIHplcm8pLgoKSS5lLiBpZiBpcyByZW5kZXp2b3VzX291dF9jbnQgaXMgemVybyBhbmQgdnBy
ZXYgIT0gdm5leHQgYnV0CnNjaGVkX2dyYW51bGFyaXR5ID4gMSB0aGUgY2FsbCBpc24ndCBuZWVk
ZWQ/IFdoeT8gQXQgdGhlIGVuZCBvZgp0aGUgc2VyaWVzIHZjcHVfY29udGV4dF9zYXZlZCgpIGdl
dHMgY2FsbGVkIGluIGFsbCBjYXNlczsgd2hhdCdzCmNvbmRpdGlvbmFsIHVwb24gZ3JhbnVsYXJp
dHkgYmVpbmcgMSB0aGVyZSBpcyB0aGUgY2FsbCB0bwp1bml0X2NvbnRleHRfc2F2ZWQoKS4KCj4+
PiArICAgIGlmICggaXNfaWRsZV91bml0KHVuaXQpICkKPj4+ICsgICAgICAgIHJldHVybiB0cnVl
Owo+Pj4gKwo+Pj4gKyAgICBmb3JfZWFjaF9zY2hlZF91bml0X3ZjcHUgKCB1bml0LCB2ICkKPj4+
ICsgICAgICAgIGlmICggdmNwdV9ydW5uYWJsZSh2KSApCj4+PiArICAgICAgICAgICAgcmV0dXJu
IHRydWU7Cj4+Cj4+IElzbid0IHRoZSBsb29wIGdvaW5nIHRvIHlpZWxkIHRydWUgYW55d2F5IGZv
ciBpZGxlIHVuaXRzPyBJZiBzbywgaXMKPj4gdGhlcmUgYSBwYXJ0aWN1bGFyIHJlYXNvbiBmb3Ig
dGhlIHNwZWNpYWwgY2FzaW5nIG9mIGlkbGUgdW5pdHMgdXAKPj4gZnJvbnQgaGVyZT8KPiAKPiBE
aWRuJ3QgSSBleHBsYWluIHRoYXQgYmVmb3JlPwoKUXVpdGUgcG9zc2libGU7IGEgZ29vZCBoaW50
IHRoYXQgYSBjb2RlIGNvbW1lbnQgd291bGRuJ3QgaHVydC4KCj4gZm9yX2VhY2hfc2NoZWRfdW5p
dF92Y3B1KCkgZm9yIGFuIGlkbGUKPiB1bml0IG1pZ2h0IGVuZCBwcmVtYXR1cmUgd2hlbiBvbmUg
b2YgdGhlIHZjcHVzIGlzIHJ1bm5pbmcgaW4gYW5vdGhlcgo+IHVuaXQgKGlkbGVfdmNwdS0+c2No
ZWRfdW5pdCAhPSBpZGxlX3VuaXQpLgoKT2gsIHRoYXQgKHYpLT5zY2hlZF91bml0ID09IChpKSBp
biB0aGUgY29uc3RydWN0IGlzIGNsZWFybHkgdW5leHBlY3RlZC4KSXMgdGhpcyByZWFsbHkgc3Rp
bGwgbmVlZGVkIGJ5IHRoZSBlbmQgb2YgdGhlIHNlcmllcz8gSSByZWFsaXplIHRoYXQKX3NvbWVf
IGNoZWNrIGlzIG5lZWRlZCwgYnV0IGNvdWxkIHRoaXMgcGVyaGFwcyBiZSBhcnJhbmdlZCBpbiBh
IHdheQp0aGF0IHlvdSdkIHN0aWxsIGhpdCBhbGwgdkNQVS1zIHdoZW4gdXNpbmcgaXQgb24gYW4g
aWRsZSB1bml0LCBubwptYXR0ZXIgd2hldGhlciB0aGV5J3JlIGluIHVzZSBhcyBhIHN1YnN0aXR1
dGUgaW4gYSAicmVhbCIgdW5pdD8KCkFzIHRvIHRoYXQgY29uc3RydWN0IC0gd2h5IGlzIHRoZSBw
YXJhbWV0ZXIgbmFtZWQgImkiIHJhdGhlciB0aGFuICJ1Ij8KQW5kIHdoeSAiZSIgaW4gZm9yX2Vh
Y2hfc2NoZWRfdW5pdCgpPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
