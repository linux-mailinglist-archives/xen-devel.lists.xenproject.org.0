Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AE7AD2CE
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 07:31:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7CBz-00024y-VY; Mon, 09 Sep 2019 05:26:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7CBy-00024t-Rq
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 05:26:22 +0000
X-Inumbo-ID: 5a64256e-d2c2-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a64256e-d2c2-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 05:26:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 80698AD78;
 Mon,  9 Sep 2019 05:26:18 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-2-jgross@suse.com>
 <1918d920-f5e2-a288-b7d0-4fc094efb4b8@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c0798a13-8ca0-dcfe-b8c5-44dbf0a07f88@suse.com>
Date: Mon, 9 Sep 2019 07:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1918d920-f5e2-a288-b7d0-4fc094efb4b8@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 01/48] xen/sched: use new sched_unit
 instead of vcpu in scheduler interfaces
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMTkgMTE6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTg3LDEzICs4NywxMyBAQCBzY2hl
ZF9pZGxlX3N3aXRjaF9zY2hlZChzdHJ1Y3Qgc2NoZWR1bGVyICpuZXdfb3BzLCB1bnNpZ25lZCBp
bnQgY3B1LAo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgaW50Cj4+IC1zY2hlZF9pZGxlX2NwdV9w
aWNrKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHZjcHUgKnYpCj4+ICtzY2hl
ZF9pZGxlX2NwdV9waWNrKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHNjaGVk
X3VuaXQgKnVuaXQpCj4+ICAgewo+PiAtICAgIHJldHVybiB2LT5wcm9jZXNzb3I7Cj4+ICsgICAg
cmV0dXJuIHVuaXQtPnZjcHVfbGlzdC0+cHJvY2Vzc29yOwo+PiAgIH0KPiAKPiBOZWl0aGVyIHRo
aXMgbm9yIGFueSBvZiB0aGUgY3B1X3BpY2sgZnVuY3Rpb25zIGluIHRoZSBzY2hlZF8qLmMgZmls
ZXMKPiBhY3R1YWxseSBtZWFuIHRvIG1vZGlmeSAiKnVuaXQiLCBzbyB1bmxlc3MgbGF0ZXIgY2hh
bmdlcyBuZWVkIHRoaXMgYmUKPiBub24tY29uc3QgSSB0aGluayBpdCBzaG91bGQgZ2V0ICJjb25z
dCIgYWRkZWQuCgpJIHRoaW5rIGNvbnN0IGlzIGZpbmUuCgo+IAo+PiBAQCAtMzA4LDkgKzMwOCwx
NyBAQCBzdGF0aWMgdm9pZCBzY2hlZF9zcGluX3VubG9ja19kb3VibGUoc3BpbmxvY2tfdCAqbG9j
azEsIHNwaW5sb2NrX3QgKmxvY2syLAo+PiAgIGludCBzY2hlZF9pbml0X3ZjcHUoc3RydWN0IHZj
cHUgKnYsIHVuc2lnbmVkIGludCBwcm9jZXNzb3IpCj4+ICAgewo+PiAgICAgICBzdHJ1Y3QgZG9t
YWluICpkID0gdi0+ZG9tYWluOwo+PiArICAgIHN0cnVjdCBzY2hlZF91bml0ICp1bml0Owo+PiAg
IAo+PiAgICAgICB2LT5wcm9jZXNzb3IgPSBwcm9jZXNzb3I7Cj4+ICAgCj4+ICsgICAgaWYgKCAo
dW5pdCA9IHh6YWxsb2Moc3RydWN0IHNjaGVkX3VuaXQpKSA9PSBOVUxMICkKPj4gKyAgICAgICAg
cmV0dXJuIDE7Cj4+ICsgICAgdi0+c2NoZWRfdW5pdCA9IHVuaXQ7Cj4+ICsgICAgdW5pdC0+dmNw
dV9saXN0ID0gdjsKPj4gKyAgICB1bml0LT51bml0X2lkID0gdi0+dmNwdV9pZDsKPj4gKyAgICB1
bml0LT5kb21haW4gPSBkOwo+IAo+IEkgZ3Vlc3MgaXQgZG9lc24ndCBtYXR0ZXIgbXVjaCBzaW5j
ZSB0aGlzIHdpbGwgY2hhbmdlIHF1aXRlIGEgYml0IHdpdGgKPiBzdWJzZXF1ZW50IHBhdGNoZXMs
IGJ1dCBnZW5lcmFsbHkgSSdkIGNvbnNpZGVyIGl0IGJldHRlciB0byBpbml0aWFsaXplCj4gcmVs
ZXZhbnQgc3RydWN0dXJlIGZpZWxkcyBmaXJzdCwgYmVmb3JlIGhvb2tpbmcgaXQgdXAgdGhlIHN0
cnVjdHVyZQo+IGl0c2VsZi4KCldpbGwgY2hhbmdlLgoKPiAKPj4gQEAgLTQ1MiwxMyArNDY1LDE3
IEBAIGludCBzY2hlZF9tb3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1cG9v
bCAqYykKPj4gICAKPj4gICB2b2lkIHNjaGVkX2Rlc3Ryb3lfdmNwdShzdHJ1Y3QgdmNwdSAqdikK
Pj4gICB7Cj4+ICsgICAgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQgPSB2LT5zY2hlZF91bml0Owo+
PiArCj4+ICAgICAgIGtpbGxfdGltZXIoJnYtPnBlcmlvZGljX3RpbWVyKTsKPj4gICAgICAga2ls
bF90aW1lcigmdi0+c2luZ2xlc2hvdF90aW1lcik7Cj4+ICAgICAgIGtpbGxfdGltZXIoJnYtPnBv
bGxfdGltZXIpOwo+PiAgICAgICBpZiAoIHRlc3RfYW5kX2NsZWFyX2Jvb2wodi0+aXNfdXJnZW50
KSApCj4+ICAgICAgICAgICBhdG9taWNfZGVjKCZwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIHYtPnBy
b2Nlc3NvcikudXJnZW50X2NvdW50KTsKPj4gLSAgICBzY2hlZF9yZW1vdmVfdmNwdSh2Y3B1X3Nj
aGVkdWxlcih2KSwgdik7Cj4+ICsgICAgc2NoZWRfcmVtb3ZlX3VuaXQodmNwdV9zY2hlZHVsZXIo
diksIHVuaXQpOwo+PiAgICAgICBzY2hlZF9mcmVlX3ZkYXRhKHZjcHVfc2NoZWR1bGVyKHYpLCB2
LT5zY2hlZF9wcml2KTsKPj4gKyAgICB4ZnJlZSh1bml0KTsKPj4gKyAgICB2LT5zY2hlZF91bml0
ID0gTlVMTDsKPiAKPiBBbG9uZyB0aGUgbGluZXMgb2YgdGhlIGFib3ZlLCBzdG9yaW5nIE5VTEwg
d291bGQgZ2VuZXJhbGx5IGJldHRlciBiZQo+IGRvbmUgcHJpb3IgdG8gYWN0dWFsbHkgZnJlZWlu
ZyB0aGUgcG9pbnRlZCBhdCBzdHJ1Y3R1cmUuCgpZZXMuCgo+IAo+PiAtLS0gYS94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+PiBAQCAtMTQw
LDYgKzE0MCw3IEBAIHZvaWQgZXZ0Y2huX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCk7IC8qIGZy
b20gZG9tYWluX2tpbGwgKi8KPj4gICB2b2lkIGV2dGNobl9kZXN0cm95X2ZpbmFsKHN0cnVjdCBk
b21haW4gKmQpOyAvKiBmcm9tIGNvbXBsZXRlX2RvbWFpbl9kZXN0cm95ICovCj4+ICAgCj4+ICAg
c3RydWN0IHdhaXRxdWV1ZV92Y3B1Owo+PiArc3RydWN0IHNjaGVkX3VuaXQ7Cj4gCj4gSW4gQyBJ
IGRvbid0IHRoaW5rIHRoaXMgaXMgbmVlZGVkIHdpdGggLi4uCj4gCj4+IEBAIC0xNjAsNiArMTYx
LDcgQEAgc3RydWN0IHZjcHUKPj4gICAKPj4gICAgICAgc3RydWN0IHRpbWVyICAgICBwb2xsX3Rp
bWVyOyAgICAvKiB0aW1lb3V0IGZvciBTQ0hFRE9QX3BvbGwgKi8KPj4gICAKPj4gKyAgICBzdHJ1
Y3Qgc2NoZWRfdW5pdCAqc2NoZWRfdW5pdDsKPiAKPiAuLi4gdGhpcyBiZWluZyBhaGVhZCBvZiBh
bnkgZnVuY3Rpb24gcHJvdG90eXBlcyB1c2luZyB0aGUgc3RydWN0LgoKUmlnaHQuCgo+IAo+PiBA
QCAtMjcyLDYgKzI3NCwxMiBAQCBzdHJ1Y3QgdmNwdQo+PiAgICAgICBzdHJ1Y3QgYXJjaF92Y3B1
IGFyY2g7Cj4+ICAgfTsKPj4gICAKPj4gK3N0cnVjdCBzY2hlZF91bml0IHsKPj4gKyAgICBzdHJ1
Y3QgZG9tYWluICAgICAgICAgKmRvbWFpbjsKPj4gKyAgICBzdHJ1Y3QgdmNwdSAgICAgICAgICAg
KnZjcHVfbGlzdDsKPj4gKyAgICBpbnQgICAgICAgICAgICAgICAgICAgIHVuaXRfaWQ7Cj4gCj4g
QW55IHJlYXNvbiBmb3IgdGhpcyBiZWluZyBwbGFpbiBpbnQgKHJhdGhlciB0aGFuIHVuc2lnbmVk
IGludCk/CgpJIGp1c3QgY29waWVkIHRoZSB2Y3B1X2lkIHR5cGUuIFdpbGwgY2hhbmdlIHRvIHVu
c2lnbmVkIGludC4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
