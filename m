Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D24A5293
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 11:11:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4iIy-00083t-3R; Mon, 02 Sep 2019 09:07:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4iIw-00083o-8S
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 09:07:18 +0000
X-Inumbo-ID: 0edc7ab2-cd61-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0edc7ab2-cd61-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 09:07:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 116E8B797;
 Mon,  2 Sep 2019 09:07:15 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1918d920-f5e2-a288-b7d0-4fc094efb4b8@suse.com>
Date: Mon, 2 Sep 2019 11:07:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-2-jgross@suse.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtODcsMTMg
Kzg3LDEzIEBAIHNjaGVkX2lkbGVfc3dpdGNoX3NjaGVkKHN0cnVjdCBzY2hlZHVsZXIgKm5ld19v
cHMsIHVuc2lnbmVkIGludCBjcHUsCj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQKPiAtc2NoZWRfaWRs
ZV9jcHVfcGljayhjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCB2Y3B1ICp2KQo+
ICtzY2hlZF9pZGxlX2NwdV9waWNrKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0
IHNjaGVkX3VuaXQgKnVuaXQpCj4gIHsKPiAtICAgIHJldHVybiB2LT5wcm9jZXNzb3I7Cj4gKyAg
ICByZXR1cm4gdW5pdC0+dmNwdV9saXN0LT5wcm9jZXNzb3I7Cj4gIH0KCk5laXRoZXIgdGhpcyBu
b3IgYW55IG9mIHRoZSBjcHVfcGljayBmdW5jdGlvbnMgaW4gdGhlIHNjaGVkXyouYyBmaWxlcwph
Y3R1YWxseSBtZWFuIHRvIG1vZGlmeSAiKnVuaXQiLCBzbyB1bmxlc3MgbGF0ZXIgY2hhbmdlcyBu
ZWVkIHRoaXMgYmUKbm9uLWNvbnN0IEkgdGhpbmsgaXQgc2hvdWxkIGdldCAiY29uc3QiIGFkZGVk
LgoKPiBAQCAtMzA4LDkgKzMwOCwxNyBAQCBzdGF0aWMgdm9pZCBzY2hlZF9zcGluX3VubG9ja19k
b3VibGUoc3BpbmxvY2tfdCAqbG9jazEsIHNwaW5sb2NrX3QgKmxvY2syLAo+ICBpbnQgc2NoZWRf
aW5pdF92Y3B1KHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgcHJvY2Vzc29yKQo+ICB7Cj4g
ICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwo+ICsgICAgc3RydWN0IHNjaGVkX3Vu
aXQgKnVuaXQ7Cj4gIAo+ICAgICAgdi0+cHJvY2Vzc29yID0gcHJvY2Vzc29yOwo+ICAKPiArICAg
IGlmICggKHVuaXQgPSB4emFsbG9jKHN0cnVjdCBzY2hlZF91bml0KSkgPT0gTlVMTCApCj4gKyAg
ICAgICAgcmV0dXJuIDE7Cj4gKyAgICB2LT5zY2hlZF91bml0ID0gdW5pdDsKPiArICAgIHVuaXQt
PnZjcHVfbGlzdCA9IHY7Cj4gKyAgICB1bml0LT51bml0X2lkID0gdi0+dmNwdV9pZDsKPiArICAg
IHVuaXQtPmRvbWFpbiA9IGQ7CgpJIGd1ZXNzIGl0IGRvZXNuJ3QgbWF0dGVyIG11Y2ggc2luY2Ug
dGhpcyB3aWxsIGNoYW5nZSBxdWl0ZSBhIGJpdCB3aXRoCnN1YnNlcXVlbnQgcGF0Y2hlcywgYnV0
IGdlbmVyYWxseSBJJ2QgY29uc2lkZXIgaXQgYmV0dGVyIHRvIGluaXRpYWxpemUKcmVsZXZhbnQg
c3RydWN0dXJlIGZpZWxkcyBmaXJzdCwgYmVmb3JlIGhvb2tpbmcgaXQgdXAgdGhlIHN0cnVjdHVy
ZQppdHNlbGYuCgo+IEBAIC00NTIsMTMgKzQ2NSwxNyBAQCBpbnQgc2NoZWRfbW92ZV9kb21haW4o
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpCj4gIAo+ICB2b2lkIHNjaGVkX2Rl
c3Ryb3lfdmNwdShzdHJ1Y3QgdmNwdSAqdikKPiAgewo+ICsgICAgc3RydWN0IHNjaGVkX3VuaXQg
KnVuaXQgPSB2LT5zY2hlZF91bml0Owo+ICsKPiAgICAgIGtpbGxfdGltZXIoJnYtPnBlcmlvZGlj
X3RpbWVyKTsKPiAgICAgIGtpbGxfdGltZXIoJnYtPnNpbmdsZXNob3RfdGltZXIpOwo+ICAgICAg
a2lsbF90aW1lcigmdi0+cG9sbF90aW1lcik7Cj4gICAgICBpZiAoIHRlc3RfYW5kX2NsZWFyX2Jv
b2wodi0+aXNfdXJnZW50KSApCj4gICAgICAgICAgYXRvbWljX2RlYygmcGVyX2NwdShzY2hlZHVs
ZV9kYXRhLCB2LT5wcm9jZXNzb3IpLnVyZ2VudF9jb3VudCk7Cj4gLSAgICBzY2hlZF9yZW1vdmVf
dmNwdSh2Y3B1X3NjaGVkdWxlcih2KSwgdik7Cj4gKyAgICBzY2hlZF9yZW1vdmVfdW5pdCh2Y3B1
X3NjaGVkdWxlcih2KSwgdW5pdCk7Cj4gICAgICBzY2hlZF9mcmVlX3ZkYXRhKHZjcHVfc2NoZWR1
bGVyKHYpLCB2LT5zY2hlZF9wcml2KTsKPiArICAgIHhmcmVlKHVuaXQpOwo+ICsgICAgdi0+c2No
ZWRfdW5pdCA9IE5VTEw7CgpBbG9uZyB0aGUgbGluZXMgb2YgdGhlIGFib3ZlLCBzdG9yaW5nIE5V
TEwgd291bGQgZ2VuZXJhbGx5IGJldHRlciBiZQpkb25lIHByaW9yIHRvIGFjdHVhbGx5IGZyZWVp
bmcgdGhlIHBvaW50ZWQgYXQgc3RydWN0dXJlLgoKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2No
ZWQuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gQEAgLTE0MCw2ICsxNDAsNyBA
QCB2b2lkIGV2dGNobl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpOyAvKiBmcm9tIGRvbWFpbl9r
aWxsICovCj4gIHZvaWQgZXZ0Y2huX2Rlc3Ryb3lfZmluYWwoc3RydWN0IGRvbWFpbiAqZCk7IC8q
IGZyb20gY29tcGxldGVfZG9tYWluX2Rlc3Ryb3kgKi8KPiAgCj4gIHN0cnVjdCB3YWl0cXVldWVf
dmNwdTsKPiArc3RydWN0IHNjaGVkX3VuaXQ7CgpJbiBDIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBu
ZWVkZWQgd2l0aCAuLi4KCj4gQEAgLTE2MCw2ICsxNjEsNyBAQCBzdHJ1Y3QgdmNwdQo+ICAKPiAg
ICAgIHN0cnVjdCB0aW1lciAgICAgcG9sbF90aW1lcjsgICAgLyogdGltZW91dCBmb3IgU0NIRURP
UF9wb2xsICovCj4gIAo+ICsgICAgc3RydWN0IHNjaGVkX3VuaXQgKnNjaGVkX3VuaXQ7CgouLi4g
dGhpcyBiZWluZyBhaGVhZCBvZiBhbnkgZnVuY3Rpb24gcHJvdG90eXBlcyB1c2luZyB0aGUgc3Ry
dWN0LgoKPiBAQCAtMjcyLDYgKzI3NCwxMiBAQCBzdHJ1Y3QgdmNwdQo+ICAgICAgc3RydWN0IGFy
Y2hfdmNwdSBhcmNoOwo+ICB9Owo+ICAKPiArc3RydWN0IHNjaGVkX3VuaXQgewo+ICsgICAgc3Ry
dWN0IGRvbWFpbiAgICAgICAgICpkb21haW47Cj4gKyAgICBzdHJ1Y3QgdmNwdSAgICAgICAgICAg
KnZjcHVfbGlzdDsKPiArICAgIGludCAgICAgICAgICAgICAgICAgICAgdW5pdF9pZDsKCkFueSBy
ZWFzb24gZm9yIHRoaXMgYmVpbmcgcGxhaW4gaW50IChyYXRoZXIgdGhhbiB1bnNpZ25lZCBpbnQp
PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
