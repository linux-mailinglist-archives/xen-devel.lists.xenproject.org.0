Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15864B3CC5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 16:42:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9sAR-0000mt-5h; Mon, 16 Sep 2019 14:39:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9sAP-0000mR-4Z
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 14:39:49 +0000
X-Inumbo-ID: d46753e0-d88f-11e9-95ee-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d46753e0-d88f-11e9-95ee-12813bfff9fa;
 Mon, 16 Sep 2019 14:39:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 193B5B64E;
 Mon, 16 Sep 2019 14:39:46 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914064217.4877-1-jgross@suse.com>
 <616613a5-e617-4ada-1339-7a6458e8351c@suse.com>
 <bbf43f0d-3803-4091-e7f4-44c83b2b14a8@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ddbc0ee3-f8ba-9b85-ac1f-3b533f91de4a@suse.com>
Date: Mon, 16 Sep 2019 16:39:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bbf43f0d-3803-4091-e7f4-44c83b2b14a8@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: rework and rename
 vcpu_force_reschedule()
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
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDkuMjAxOSAxNDo0OSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxNi4wOS4xOSAx
MToyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE0LjA5LjIwMTkgMDg6NDIsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiB2Y3B1X2ZvcmNlX3Jlc2NoZWR1bGUoKSBpcyBvbmx5IHVzZWQgZm9y
IG1vZGlmeWluZyB0aGUgcGVyaW9kaWMgdGltZXIKPj4+IG9mIGEgdmNwdS4gRm9yY2luZyBhIHZj
cHUgdG8gZ2l2ZSB1cCB0aGUgcGh5c2ljYWwgY3B1IGZvciB0aGF0IHB1cnBvc2UKPj4+IGlzIGtp
bmQgb2YgYnJ1dGFsLgo+Pj4KPj4+IFNvIGluc3RlYWQgb2YgZG9pbmcgdGhlIHJlc2NoZWR1bGUg
ZGFuY2UganVzdCBvcGVyYXRlIG9uIHRoZSB0aW1lcgo+Pj4gZGlyZWN0bHkuIEJ5IHByb3RlY3Rp
bmcgcGVyaW9kaWMgdGltZXIgbW9kaWZpY2F0aW9ucyBhZ2FpbnN0IGNvbmN1cnJlbnQKPj4+IHRp
bWVyIGFjdGl2YXRpb24gdmlhIGEgcGVyLXZjcHUgbG9jayBpdCBpcyBldmVuIG5vIGxvbmdlciBy
ZXF1aXJlZCB0bwo+Pj4gYm90aGVyIHRoZSB0YXJnZXQgdmNwdSBhdCBhbGwgZm9yIHVwZGF0aW5n
IGl0cyB0aW1lci4KPj4+Cj4+PiBSZW5hbWUgdGhlIGZ1bmN0aW9uIHRvIHZjcHVfc2V0X3Blcmlv
ZGljX3RpbWVyKCkgYXMgdGhpcyBub3cgcmVmbGVjdHMKPj4+IHRoZSBmdW5jdGlvbmFsaXR5Lgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4K
Pj4gSSBjb250aW51ZSB0byBiZSB1bmhhcHB5IGFib3V0IHRoZXJlIGJlaW5nIG5vIHdvcmQgYXQg
YWxsIGFib3V0IC4uLgo+Pgo+Pj4gQEAgLTcyNCwyNCArNzI1LDYgQEAgc3RhdGljIHZvaWQgdmNw
dV9taWdyYXRlX2ZpbmlzaChzdHJ1Y3QgdmNwdSAqdikKPj4+ICAgICAgIHZjcHVfd2FrZSh2KTsK
Pj4+ICAgfQo+Pj4gICAKPj4+IC0vKgo+Pj4gLSAqIEZvcmNlIGEgVkNQVSB0aHJvdWdoIGEgZGVz
Y2hlZHVsZS9yZXNjaGVkdWxlIHBhdGguCj4+PiAtICogRm9yIGV4YW1wbGUsIHVzaW5nIHRoaXMg
d2hlbiBzZXR0aW5nIHRoZSBwZXJpb2RpYyB0aW1lciBwZXJpb2QgbWVhbnMgdGhhdAo+Pj4gLSAq
IG1vc3QgcGVyaW9kaWMtdGltZXIgc3RhdGUgbmVlZCBvbmx5IGJlIHRvdWNoZWQgZnJvbSB3aXRo
aW4gdGhlIHNjaGVkdWxlcgo+Pj4gLSAqIHdoaWNoIGNhbiB0aHVzIGJlIGRvbmUgd2l0aG91dCBu
ZWVkIGZvciBzeW5jaHJvbmlzYXRpb24uCj4+PiAtICovCj4+PiAtdm9pZCB2Y3B1X2ZvcmNlX3Jl
c2NoZWR1bGUoc3RydWN0IHZjcHUgKnYpCj4+Cj4+IC4uLiB0aGUgb3JpZ2luYWxseSBpbnRlbmRl
ZCBzeW5jaHJvbml6YXRpb24tZnJlZSBoYW5kbGluZy4gRm9yY2luZwo+PiB0aGUgdkNQVSB0aHJv
dWdoIHRoZSBzY2hlZHVsZXIgbWF5IHNlZW0gaGFyc2ggKGFuZCBxdWl0ZSBzb21lCj4+IG92ZXJo
ZWFkKSwgeWVzLCBidXQgSSBkb24ndCB0aGluayB0aGUgYWJvdmUgd2FzIHdyaXR0ZW4gKGFuZAo+
PiBkZWNpZGVkKSB3aXRob3V0IGNvbnNpZGVyYXRpb24uIE9uZSBlZmZlY3Qgb2YgdGhpcyBjYW4g
YmUgc2VlbiBieQo+PiB5b3UgLi4uCj4+Cj4+PiArdm9pZCB2Y3B1X3NldF9wZXJpb2RpY190aW1l
cihzdHJ1Y3QgdmNwdSAqdiwgc190aW1lX3QgdmFsdWUpCj4+PiArewo+Pj4gKyAgICBzcGluX2xv
Y2soJnYtPnBlcmlvZGljX3RpbWVyX2xvY2spOwo+Pj4gKwo+Pj4gKyAgICBzdG9wX3RpbWVyKCZ2
LT5wZXJpb2RpY190aW1lcik7Cj4+Cj4+IC4uLiBpbnRyb2R1Y2luZyBhIG5ldyBzdG9wX3RpbWVy
KCkgaGVyZSwgaS5lLiB3aGljaCBkb2Vzbid0IHJlcGxhY2UKPj4gYW55IGV4aXN0aW5nIG9uZS4g
VGhlIGltcGxpY2F0aW9uIGlzIHRoYXQgb3RoZXIgdGhhbiBiZWZvcmUgdGhlCj4+IHBlcmlvZGlj
IHRpbWVyIG1heSBub3cgbm90IHJ1biAoZm9yIGEgYnJpZWYgbW9tZW50KSBkZXNwaXRlIGl0Cj4+
IGJlaW5nIHN1cHBvc2VkIHRvIHJ1biAtIGFmdGVyIGFsbCBpdCBoYXMgYmVlbiBhY3RpdmUgc28g
ZmFyCj4+IHdoZW5ldmVyIGEgdkNQVSB3YXMgcnVubmluZy4KPj4KPj4gVGhlbiBhZ2FpbiwgbG9v
a2luZyBhdCB0aGUgaW52b2x2ZWQgY29kZSBwYXRocyB5ZXQgYWdhaW4sIEkgd29uZGVyCj4+IHdo
ZXRoZXIgdGhpcyBoYXMgYmVlbiB3b3JraW5nIHJpZ2h0IGF0IGFsbDogVGhlcmUncyBhbiBlYXJs
eSBleGl0Cj4+IGZyb20gc2NoZWR1bGUoKSB3aGVuIHByZXYgPT0gbmV4dCwgd2hpY2ggYnlwYXNz
ZXMKPj4gdmNwdV9wZXJpb2RpY190aW1lcl93b3JrKCkuIEFuZCBJIGNhbid0IHNlZW0gdG8gYmUg
YWJsZSB0byBzcG90Cj4+IGFueXRoaW5nIG9uIHRoZSB2Y3B1X2ZvcmNlX3Jlc2NoZWR1bGUoKSBw
YXRoIHdoaWNoIHdvdWxkIGd1YXJhbnRlZQo+PiB0aGlzIHNob3J0Y3V0IHRvIG5vdCBiZSB0YWtl
bi4KPiAKPiBGaXJzdCwgdGhlIGN1cnJlbnQgInN5bmNocm9uaXphdGlvbi1mcmVlIiBoYW5kbGlu
ZyBpcyBub3QgZXhpc3RpbmcuIFRoZQo+IHN5bmNocm9uaXphdGlvbiBpcyBqdXN0IGhpZGRlbiBp
biB0aGUgY2FsbHMgb2YgdmNwdV9taWdyYXRlXyooKSBhbmQgaXQKPiBpcyBkb25lIHZpYSB0aGUg
c2NoZWR1bGVyIGxvY2suCgpTdXJlLCBidXQgdGhlIHNjaGVkdWxlciBsb2NrIG5lZWRzIHRvIGJl
IHRha2VuIGR1cmluZyBzY2hlZHVsaW5nCm9mIHRoZSB2Q1BVIGFueXdheS4gVGhlcmUgd2FzIG5v
ICJleHRyYSIgc3luY2hyb25pemF0aW9uIGludm9sdmVkLgoKPiBZZXMsIEknbSBhZGRpbmcgYSBz
dG9wX3RpbWVyKCksIGJ1dCB0aGUgcmVsYXRlZCBzdG9wX3RpbWVyKCkgY2FsbCBpbgo+IHRoZSBv
bGQgY29kZSB3YXMgaW4gc2NoZWR1bGUoKS4gU28gc3RhdGljYWxseSB5b3UgYXJlIHJpZ2h0LCBi
dXQKPiBkeW5hbWljYWxseSB0aGVyZSBpcyBubyBuZXcgc3RvcF90aW1lcigpIGNhbGwgaW52b2x2
ZWQuCgpJIGRpZCBzcGVjaWZpY2FsbHkgY2hlY2sgdGhhdCBteSBjb21tZW50IGlzIG5vdCBqdXN0
IGFib3V0IHRoZQoic3RhdGljIiBwYXJ0IChhcyB5b3UgY2FsbCBpdCkuIEFzIHNhaWQgLSB0aGVy
ZSB3YXMgbm8gc3RvcF90aW1lcigpCmJlZm9yZSBiZWhpbmQgYSBydW5uaW5nIHZDUFUncyBiYWNr
LiBUaGlzIGlzIHdoYXQgd29ycmllcyBtZS4KCj4gQW5kIGxhc3Q6IHRoZSBjYXNlIHByZXYgPT0g
bmV4dCB3b3VsZCBub3Qgb2NjdXIgdG9kYXksIGFzIHRoZSBtaWdyYXRlCj4gZmxhZyBiZWluZyBz
ZXQgaW4gdmNwdS0+cGF1c2VfZmxhZ3Mgd291bGQgY2F1c2UgdGhlIHZjcHUgdG8gYmUgdGFrZW4K
PiBhd2F5IGZyb20gdGhlIGNwdS4gU28gaXQgaXMgd29ya2luZyB0b2RheSwgYnV0IHNldHRpbmcg
dGhlIHBlcmlvZGljCj4gdGltZXIgcmVxdWlyZXMgdHdvIHNjaGVkdWxpbmcgZXZlbnRzIGluIGNh
c2UgdGhlIHRhcmdldCB2Y3B1IGlzCj4gY3VycmVudGx5IHJ1bm5pbmcuCgpJJ20gbm90IGdvaW5n
IHRvIGNsYWltIEkgZnVsbHkgdW5kZXJzdG9vZCB0aGUgY29kZSB3aGVuIGxvb2tpbmcgYXQKaXQg
aW4gdGhlIG1vcm5pbmcsIGJ1dCBJIGNvdWxkbid0IGZpbmQgdGhlIHBsYWNlKHMpIGd1YXJhbnRl
ZWluZwp0aGF0IGJ5IHRoZSB0aW1lIHRoZSBtaWdyYXRpb24gb2YgdGhlIHZDUFUgaXMgb3ZlciBp
dCB3b3VsZG4ndCBiZQpydW5uYWJsZSBhZ2FpbiByaWdodCBhd2F5LCBhbmQgaGVuY2UgcG90ZW50
aWFsbHkgcmUtY2hvc2VuIGFzIHRoZQp2Q1BVIHRvIHJ1biBvbiB0aGUgcENQVSBpcyB3YXMgcnVu
bmluZyBvbiBiZWZvcmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
