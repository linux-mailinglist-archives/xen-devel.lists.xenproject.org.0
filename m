Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FED16E077
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 07:10:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoL78-0004Kt-Nv; Fri, 19 Jul 2019 05:07:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M1ZL=VQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hoL77-0004Ko-Pd
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 05:07:25 +0000
X-Inumbo-ID: 1828c9ee-a9e3-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1828c9ee-a9e3-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 05:07:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 74663AD51;
 Fri, 19 Jul 2019 05:07:23 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-8-jgross@suse.com>
 <d6c0b816a66282436f24441c626fd31bb8a39a44.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b7fe6bb5-7a51-ea74-012a-cda7011261b3@suse.com>
Date: Fri, 19 Jul 2019 07:07:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <d6c0b816a66282436f24441c626fd31bb8a39a44.camel@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 07/60] xen/sched: build a linked list of
 struct sched_unit
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMTkgMDI6MDEsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFR1ZSwgMjAxOS0w
NS0yOCBhdCAxMjozMiArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gSW4gb3JkZXIgdG8g
bWFrZSBpdCBlYXN5IHRvIGl0ZXJhdGUgb3ZlciBzY2hlZF91bml0IGVsZW1lbnRzIG9mIGEKPj4g
ZG9tYWluIGJ1aWxkIGEgc2luZ2xlIGxpbmtlZCBsaXN0IGFuZCBhZGQgYW4gaXRlcmF0b3IgZm9y
IGl0Lgo+Pgo+IEhvdyBhYm91dCBhICcsJyBiZXR3ZWVuIGRvbWFpbiBhbmQgYnVpbGQ/CgpPa2F5
LgoKPiAKPj4gRm9yIGNvbXBsZXRlbmVzcyBhZGQgYW5vdGhlciBpdGVyYXRvciBmb3JfZWFjaF9z
Y2hlZF91bml0X3ZjcHUoKQo+PiB3aGljaAo+PiB3aWxsIGl0ZXJhdGUgb3ZlciBhbGwgdmNwdXMg
aWYgYSBzY2hlZF91bml0IChyaWdodCBub3cgb25seSBvbmUpLgo+PiBUaGlzCj4gCj4gIm92ZXIg
YWxsIHZjcHVzIG9mIGEgc2NoZWRfdW5pdCIgPwoKT2gsIG9mIGNvdXJzZSEKCj4gCj4+IHdpbGwg
YmUgbmVlZGVkIGxhdGVyIGZvciBsYXJnZXIgc2NoZWR1bGluZyBncmFudWxhcml0eSAoZS5nLiBj
b3JlcykuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPj4KPiBPbmUgcXVlc3Rpb246Cj4gCj4+IEBAIC0yNzksOCArMjc5LDE2IEBAIHN0cnVjdCB2
Y3B1Cj4+ICAgc3RydWN0IHNjaGVkX3VuaXQgewo+PiAgICAgICBzdHJ1Y3QgdmNwdSAgICAgICAg
ICAgKnZjcHU7Cj4+ICAgICAgIHZvaWQgICAgICAgICAgICAgICAgICAqcHJpdjsgICAgICAvKiBz
Y2hlZHVsZXIgcHJpdmF0ZSBkYXRhICovCj4+ICsgICAgc3RydWN0IHNjaGVkX3VuaXQgICAgICpu
ZXh0X2luX2xpc3Q7Cj4+ICAgfTsKPj4gICAKPj4gKyNkZWZpbmUgZm9yX2VhY2hfc2NoZWRfdW5p
dChkLAo+PiBlKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiAr
ICAgIGZvciAoIChlKSA9IChkKS0+c2NoZWRfdW5pdF9saXN0OyAoZSkgIT0gTlVMTDsgKGUpID0g
KGUpLQo+Pj4gbmV4dF9pbl9saXN0ICkKPj4gKwo+PiArI2RlZmluZSBmb3JfZWFjaF9zY2hlZF91
bml0X3ZjcHUoaSwKPj4gdikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+
ICsgICAgZm9yICggKHYpID0gKGkpLT52Y3B1OyAodikgIT0gTlVMTCAmJiAodiktPnNjaGVkX3Vu
aXQgPT0KPj4gKGkpOyAgICAgICAgIFwKPj4gKyAgICAgICAgICAodikgPSAodiktPm5leHRfaW5f
bGlzdCApCj4+ICsKPj4KPiBTbywgaGVyZS4uLiBzb3JyeSBpZiBpdCdzIG1lIG5vdCBzZWVpbmcg
aXQsIGJ1dCB3aHkgdGhlCj4gKHYpLT5zY2hlZF91bml0ID09IChpKSBjaGVjayBpcyBuZWNlc3Nh
cnk/Cj4gCj4gRG8gd2UgZXhwZWN0IHRvIHB1dCBpbiB0aGUgbGlzdCBvZiB2Y3B1cyBvZiBhIHBh
cnRpY3VsYXIgdW5pdCwgdmNwdXMKPiB0aGF0IGFyZSBpbiBhbm90aGVyIHVuaXQ/CgpZZXMuIEkn
bSBtYWtpbmcgdXNlIG9mIHRoZSBmYWN0IHRoYXQgYWxsIHZjcHVzIGluIGEgdW5pdCBhcmUgY29u
c2VjdXRpdmUKYXMgSSdtIHJlLXVzaW5nIHRoZSBhbHJlYWR5IGV4aXN0aW5nIGxpc3Qgb2YgdmNw
dXMgaW4gYSBkb21haW46Cgpkb20tPnZjcHUwLT52Y3B1MS0+dmNwdTItPnZjcHUzCiAgICAgICBe
ICAgICAgICAgICAgIF4KICAgICAgICEgICAgICAgICAgICAgIQp1bml0MC0rICAgICAgICAgICAg
ICEKICAgICAgICAgICAgICAgICAgICAgIQp1bml0Mi0tLS0tLS0tLS0tLS0tLSsKCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
