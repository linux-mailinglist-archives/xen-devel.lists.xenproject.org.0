Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7321EBB7DA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 17:27:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCQCV-0003o7-8z; Mon, 23 Sep 2019 15:24:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCQCT-0003ny-Ce
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 15:24:29 +0000
X-Inumbo-ID: 3b290836-de16-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b290836-de16-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 15:24:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC266AB98;
 Mon, 23 Sep 2019 15:24:26 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-30-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c82b5b04-ff81-8600-d959-b3dcc90575a2@suse.com>
Date: Mon, 23 Sep 2019 17:24:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-30-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 29/47] xen/sched: introduce
 unit_runnable_state()
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUb2RheSB0aGUgdmNw
dSBydW5zdGF0ZSBvZiBhIG5ldyBzY2hlZHVsZWQgdmNwdSBpcyBhbHdheXMgc2V0IHRvCj4gInJ1
bm5pbmciIGV2ZW4gaWYgYXQgdGhhdCB0aW1lIHZjcHVfcnVubmFibGUoKSBpcyBhbHJlYWR5IHJl
dHVybmluZwo+IGZhbHNlIGR1ZSB0byBhIHJhY2UgKGUuZy4gd2l0aCBwYXVzaW5nIHRoZSB2Y3B1
KS4KCkkgY2FuIHNlZSB0aGlzIHBhcnQsIC4uLgoKPiBXaXRoIGNvcmUgc2NoZWR1bGluZyB0aGlz
IGNhbiBubyBsb25nZXIgd29yayBhcyBub3QgYWxsIHZjcHVzIG9mIGEKPiBzY2hlZHVsZSB1bml0
IGhhdmUgdG8gYmUgInJ1bm5pbmciIHdoZW4gYmVpbmcgc2NoZWR1bGVkLiBTbyB0aGUgdmNwdSdz
Cj4gbmV3IHJ1bnN0YXRlIGhhcyB0byBiZSBzZWxlY3RlZCBhdCB0aGUgc2FtZSB0aW1lIGFzIHRo
ZSBydW5uYWJpbGl0eSBvZgo+IHRoZSByZWxhdGVkIHNjaGVkdWxlIHVuaXQgaXMgcHJvYmVkLgoK
Li4uIGJ1dCBJIGNvbnRpbnVlIGhhdmluZyB0cm91YmxlIGhlcmUuIElmIGl0IGhhcyBiZWVuIG9r
YXkgdG8gc2V0CmEgdkNQVSBubyBsb25nZXIgcnVubmFibGUgdG8gInJ1bm5pbmciIG5ldmVydGhl
bGVzcywgd2h5IHdvdWxkIHRoZQpzYW1lIG5vdCBiZSB0cnVlIGZvciBzY2hlZHVsZSB1bml0cz8g
UGFydCBvZiB0aGUgcHJvYmxlbSBtYXkgYmUKdGhhdCAuLi4KCj4gLS0tIGEveGVuL2luY2x1ZGUv
eGVuL3NjaGVkLWlmLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAo+IEBAIC03
Niw2ICs3NiwyOSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgdW5pdF9ydW5uYWJsZShjb25zdCBzdHJ1
Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKPiAgICAgIHJldHVybiB2Y3B1X3J1bm5hYmxlKHVuaXQtPnZj
cHVfbGlzdCk7CgouLi4gdGhpcyBjbGVhcmx5IHN0aWxsIGlzbid0IGRvaW5nIHRoZSAoSSBzdXBw
b3NlKSBpbnRlbmRlZCBsb29wLAphbmQgaGVuY2UgLi4uCgo+ICB9Cj4gIAo+ICtzdGF0aWMgaW5s
aW5lIGJvb2wgdW5pdF9ydW5uYWJsZV9zdGF0ZShjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5p
dCkKPiArewo+ICsgICAgc3RydWN0IHZjcHUgKnY7Cj4gKyAgICBib29sIHJ1bm5hYmxlLCByZXQg
PSBmYWxzZTsKPiArCj4gKyAgICBpZiAoIGlzX2lkbGVfdW5pdCh1bml0KSApCj4gKyAgICAgICAg
cmV0dXJuIHRydWU7Cj4gKwo+ICsgICAgZm9yX2VhY2hfc2NoZWRfdW5pdF92Y3B1ICggdW5pdCwg
diApCj4gKyAgICB7Cj4gKyAgICAgICAgcnVubmFibGUgPSB2Y3B1X3J1bm5hYmxlKHYpOwo+ICsK
PiArICAgICAgICB2LT5uZXdfc3RhdGUgPSBydW5uYWJsZSA/IFJVTlNUQVRFX3J1bm5pbmcKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6ICh2LT5wYXVzZV9mbGFncyAmIFZQRl9i
bG9ja2VkKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPyBSVU5TVEFURV9i
bG9ja2VkIDogUlVOU1RBVEVfb2ZmbGluZTsKPiArCj4gKyAgICAgICAgaWYgKCBydW5uYWJsZSAp
Cj4gKyAgICAgICAgICAgIHJldCA9IHRydWU7Cj4gKyAgICB9Cj4gKwo+ICsgICAgcmV0dXJuIHJl
dDsKPiArfQoKLi4uIGl0J3Mgbm90IG9idmlvdXMgd2hhdCB0aGUgZXZlbnR1YWwgZGlmZmVyZW5j
ZSBiZXR3ZWVuIHRoZSB0d28gaXMKZ29pbmcgdG8gYmUuCgpGdXJ0aGVybW9yZSBJIHRoaW5rIGEg
ZnVuY3Rpb24gb2YgdGhlIGdpdmVuIG5hbWUsIHJldHVybmluZyBib29sLCBhbmQKdGFraW5nIGEg
cG9pbnRlciB0byBjb25zdCBkZXNlcnZlcyBhIGNvbW1lbnQgYXMgdG8gdGhlIChwb3NzaWJseQpz
bGlnaHRseSB1bmV4cGVjdGVkKSBzdGF0ZSBjaGFuZ2UgaXQgZG9lcy4gVGhpcyBjb21tZW50IG1p
Z2h0IHRoZW4gYmUKd29ydGh3aGlsZSB0byBleHRlbmQgdG8gYWxzbyBvdXRsaW5lIHRoZSB1c2Fn
ZSBkaWZmZXJlbmNlIGJldHdlZW4gaXQKYW5kIGl0cyBzaWJsaW5nIGFib3ZlLgoKPiAtLS0gYS94
ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4g
QEAgLTE3NCw2ICsxNzQsNyBAQCBzdHJ1Y3QgdmNwdQo+ICAgICAgICAgIFhFTl9HVUVTVF9IQU5E
TEUodmNwdV9ydW5zdGF0ZV9pbmZvX2NvbXBhdF90KSBjb21wYXQ7Cj4gICAgICB9IHJ1bnN0YXRl
X2d1ZXN0OyAvKiBndWVzdCBhZGRyZXNzICovCj4gICNlbmRpZgo+ICsgICAgdW5zaWduZWQgaW50
ICAgICBuZXdfc3RhdGU7CgpTaW1pbGFybHkgSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIGZvciB0
aGlzIGZpZWxkIHRvIGdhaW4gYSBicmllZgpjb21tZW50IGFzIHRvIGl0cyBwdXJwb3NlIGNvbXBh
cmVkIHRvIHJ1bnN0YXRlLnN0YXRlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
