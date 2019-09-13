Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24910B226C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 16:44:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8mlu-0004Vi-Ex; Fri, 13 Sep 2019 14:42:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8mlt-0004Vd-3G
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 14:42:01 +0000
X-Inumbo-ID: a4644cd4-d634-11e9-95ad-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4644cd4-d634-11e9-95ad-12813bfff9fa;
 Fri, 13 Sep 2019 14:42:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F0BFEAF6B;
 Fri, 13 Sep 2019 14:41:58 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190913121400.23263-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5136c292-9d18-e760-cf98-c24278e9ba06@suse.com>
Date: Fri, 13 Sep 2019 16:42:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913121400.23263-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: rework and rename
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

T24gMTMuMDkuMjAxOSAxNDoxNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0KPiAtIENhcnZl
ZCBvdXQgZnJvbSBteSBjb3JlIHNjaGVkdWxpbmcgc2VyaWVzCj4gLSBSZXdvcmtlZCB0byBhdm9p
ZCBkZWFkbG9jayB3aGVuIDIgdmNwdXMgYXJlIHRyeWluZyB0byBtb2RpZnkgZWFjaAo+ICAgb3Ro
ZXJzIHBlcmlvZGljIHRpbWVycywgbGVhZGluZyB0byBhZGRyZXNzIGFsbCBjb21tZW50cyBieSBK
YW4KPiAgIEJldWxpY2guCgpPaCwgaW5kZWVkIC0gYSBtdXR1YWwgdmNwdV9wYXVzZSgpIGNhbid0
IGVuZCAgd2VsbC4KCj4gQEAgLTcyNCwyNCArNzI1LDYgQEAgc3RhdGljIHZvaWQgdmNwdV9taWdy
YXRlX2ZpbmlzaChzdHJ1Y3QgdmNwdSAqdikKPiAgICAgIHZjcHVfd2FrZSh2KTsKPiAgfQo+ICAK
PiAtLyoKPiAtICogRm9yY2UgYSBWQ1BVIHRocm91Z2ggYSBkZXNjaGVkdWxlL3Jlc2NoZWR1bGUg
cGF0aC4KPiAtICogRm9yIGV4YW1wbGUsIHVzaW5nIHRoaXMgd2hlbiBzZXR0aW5nIHRoZSBwZXJp
b2RpYyB0aW1lciBwZXJpb2QgbWVhbnMgdGhhdAo+IC0gKiBtb3N0IHBlcmlvZGljLXRpbWVyIHN0
YXRlIG5lZWQgb25seSBiZSB0b3VjaGVkIGZyb20gd2l0aGluIHRoZSBzY2hlZHVsZXIKPiAtICog
d2hpY2ggY2FuIHRodXMgYmUgZG9uZSB3aXRob3V0IG5lZWQgZm9yIHN5bmNocm9uaXNhdGlvbi4K
PiAtICovCj4gLXZvaWQgdmNwdV9mb3JjZV9yZXNjaGVkdWxlKHN0cnVjdCB2Y3B1ICp2KQo+IC17
Cj4gLSAgICBzcGlubG9ja190ICpsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2KTsKPiAt
Cj4gLSAgICBpZiAoIHYtPmlzX3J1bm5pbmcgKQo+IC0gICAgICAgIHZjcHVfbWlncmF0ZV9zdGFy
dCh2KTsKPiAtCj4gLSAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdik7Cj4gLQo+
IC0gICAgdmNwdV9taWdyYXRlX2ZpbmlzaCh2KTsKPiAtfQoKU28gdGhlIGNvbW1lbnQgc3BlY2lm
aWNhbGx5IHNhaWQgdGhpcyBhcHByb2FjaCB3YXMgY2hvc2VuIHRvCmF2b2lkIHRoZSBuZWVkIGZv
ciBzeW5jaHJvbml6YXRpb24uIFlvdSBub3cgaW50cm9kdWNlCnN5bmNocm9uaXphdGlvbi4gSSdt
IG5vdCBzZXZlcmVseSBvcHBvc2VkLCBidXQgSSB0aGluayB0aGVyZQp3YW50cyB0byBiZSBqdXN0
aWZpY2F0aW9uIHdoeSB0aGUgYWRkZWQgc3luY2hyb25pemF0aW9uIGlzIG5vdAphIHByb2JsZW0g
KGFuZCB3b3VsZCBwZXJoYXBzIG5ldmVyIGhhdmUgYmVlbikuCgo+IEBAIC0xNDU4LDE0ICsxNDQx
LDExIEBAIGxvbmcgc2NoZWRfYWRqdXN0X2dsb2JhbChzdHJ1Y3QgeGVuX3N5c2N0bF9zY2hlZHVs
ZXJfb3AgKm9wKQo+ICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCB2Y3B1
X3BlcmlvZGljX3RpbWVyX3dvcmsoc3RydWN0IHZjcHUgKnYpCj4gK3N0YXRpYyB2b2lkIHZjcHVf
cGVyaW9kaWNfdGltZXJfd29ya19sb2NrZWQoc3RydWN0IHZjcHUgKnYpCj4gIHsKPiAgICAgIHNf
dGltZV90IG5vdzsKPiAgICAgIHNfdGltZV90IHBlcmlvZGljX25leHRfZXZlbnQ7Cj4gIAo+IC0g
ICAgaWYgKCB2LT5wZXJpb2RpY19wZXJpb2QgPT0gMCApCj4gLSAgICAgICAgcmV0dXJuOwoKSSdt
IGFmcmFpZCB5b3UgY2FuJ3QgcHVsbCB0aGlzIG91dCBvZiBoZXJlLCBvciAuLi4KCj4gQEAgLTE0
NzYsMTAgKzE0NTYsMzYgQEAgc3RhdGljIHZvaWQgdmNwdV9wZXJpb2RpY190aW1lcl93b3JrKHN0
cnVjdCB2Y3B1ICp2KQo+ICAgICAgICAgIHBlcmlvZGljX25leHRfZXZlbnQgPSBub3cgKyB2LT5w
ZXJpb2RpY19wZXJpb2Q7Cj4gICAgICB9Cj4gIAo+IC0gICAgbWlncmF0ZV90aW1lcigmdi0+cGVy
aW9kaWNfdGltZXIsIHNtcF9wcm9jZXNzb3JfaWQoKSk7Cj4gKyAgICBtaWdyYXRlX3RpbWVyKCZ2
LT5wZXJpb2RpY190aW1lciwgdi0+cHJvY2Vzc29yKTsKPiAgICAgIHNldF90aW1lcigmdi0+cGVy
aW9kaWNfdGltZXIsIHBlcmlvZGljX25leHRfZXZlbnQpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9p
ZCB2Y3B1X3BlcmlvZGljX3RpbWVyX3dvcmsoc3RydWN0IHZjcHUgKnYpCj4gK3sKPiArICAgIGlm
ICggdi0+cGVyaW9kaWNfcGVyaW9kID09IDAgKQo+ICsgICAgICAgIHJldHVybjsKPiArCj4gKyAg
ICBzcGluX2xvY2soJnYtPnBlcmlvZGljX3RpbWVyX2xvY2spOwoKLi4uIHRoZSBjb25kaXRpb25h
bCBoZXJlIG5lZWRzIHRvIG1vdmUgaW50byB0aGUgbG9ja2VkIHJlZ2lvbi4KT3RoZXJ3aXNlLCBk
ZXNwaXRlIGhhdmluZyBmb3VuZCBub24temVybyBhYm92ZSwgYnkgdGhlIHRpbWUgdGhlCmxvY2sg
d2FzIGFjcXVpcmVkIHRoZSB2YWx1ZSBtYXkgaGF2ZSBjaGFuZ2VkIHRvIHplcm8uCgpBcyB0byB0
aGUgbWlncmF0ZV90aW1lcigpIGNoYW5nZTogT3RoZXIgdGhhbiBJIGZlYXJlZCwgdXNpbmcKdi0+
cHJvY2Vzc29yIG9mIGEgbm9uLXJ1bm5pbmcgdkNQVSBkb2VzIG5vdCBsb29rIHRvIGhhdmUgYW55
CmNoYW5jZSBvZiBhY3Rpbmcgb24gYW4gb2ZmbGluZSBDUFUsIHRoYW5rcyB0bwpjcHVfZGlzYWJs
ZV9zY2hlZHVsZXIoKSBkZWFsaW5nIHdpdGggYWxsIHZDUFUtcyAoYW5kIG5vdCBqdXN0CnJ1bm5p
bmcgb25lcyksIGFuZCB0aGFua3MgdG8gQ1BVIG9mZmxpbmluZyBoYXBwZW5pbmcgaW4Kc3RvcC1t
YWNoaW5lIGNvbnRleHQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
