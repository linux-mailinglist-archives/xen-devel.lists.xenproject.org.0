Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F6D41EED
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 10:21:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hayTj-0006bu-OW; Wed, 12 Jun 2019 08:19:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yu3J=UL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hayTi-0006bp-Ou
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 08:19:30 +0000
X-Inumbo-ID: cc385fbe-8cea-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc385fbe-8cea-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 08:19:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 42656AF21;
 Wed, 12 Jun 2019 08:19:28 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-4-jgross@suse.com>
 <afe9fd8d-36b5-e946-2084-36bf8f7dcaba@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <4e594f85-b33b-87ca-2253-53a70ab8808f@suse.com>
Date: Wed, 12 Jun 2019 10:19:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <afe9fd8d-36b5-e946-2084-36bf8f7dcaba@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 03/60] xen/sched: let sched_switch_sched()
 return new lock address
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
 George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDYuMTkgMTA6MDUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjgvMDUvMjAxOSAx
MTozMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQEAgLTE4NzAsOCArMTg3MSwxOSBAQCBpbnQg
c2NoZWR1bGVfY3B1X3N3aXRjaCh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1Y3QgY3B1cG9vbCAqYykK
Pj4gICAgICAgb2xkX2xvY2sgPSBwY3B1X3NjaGVkdWxlX2xvY2tfaXJxKGNwdSk7Cj4+ICAgCj4+
ICAgICAgIHZwcml2X29sZCA9IGlkbGUtPnNjaGVkX3ByaXY7Cj4+IC0gICAgcHByaXZfb2xkID0g
cGVyX2NwdShzY2hlZHVsZV9kYXRhLCBjcHUpLnNjaGVkX3ByaXY7Cj4+IC0gICAgc2NoZWRfc3dp
dGNoX3NjaGVkKG5ld19vcHMsIGNwdSwgcHByaXYsIHZwcml2KTsKPj4gKyAgICBwcHJpdl9vbGQg
PSBzZC0+c2NoZWRfcHJpdjsKPj4gKyAgICBuZXdfbG9jayA9IHNjaGVkX3N3aXRjaF9zY2hlZChu
ZXdfb3BzLCBjcHUsIHBwcml2LCB2cHJpdik7Cj4+ICsKPj4gKyAgICBwZXJfY3B1KHNjaGVkdWxl
ciwgY3B1KSA9IG5ld19vcHM7Cj4+ICsgICAgc2QtPnNjaGVkX3ByaXYgPSBwcHJpdjsKPj4gKwo+
PiArICAgIC8qCj4+ICsgICAgICogKFJlPylyb3V0ZSB0aGUgbG9jayB0byB0aGUgcGVyIHBDUFUg
bG9jayBhcyAvbGFzdC8gdGhpbmcuIEluIGZhY3QsCj4+ICsgICAgICogaWYgaXQgaXMgZnJlZSAo
YW5kIGl0IGNhbiBiZSkgd2Ugd2FudCB0aGF0IGFueW9uZSB0aGF0IG1hbmFnZXMKPj4gKyAgICAg
KiB0YWtpbmcgaXQsIGZpbmRzIGFsbCB0aGUgaW5pdGlhbGl6YXRpb25zIHdlJ3ZlIGRvbmUgYWJv
dmUgaW4gcGxhY2UuCj4+ICsgICAgICovCj4+ICsgICAgc21wX21iKCk7Cj4gCj4gSSByZWFsaXNl
IHlvdSdyZSBqdXN0IG1vdmluZyBleGlzdGluZyBjb2RlLCBidXQgdGhpcyBiYXJyaWVyIHN0aWNr
cyBvdXQKPiBsaWtlIGEgc29yZSB0aHVtYi4KPiAKPiBBIGZ1bGwgbWVtb3J5IGJhcnJpZXIgaXMg
YSBtYXNzaXZlIG92ZXJoZWFkIGZvciB3aGF0IHNob3VsZCBiZQo+IHNtcF93bWIoKS7CoCBUaGUg
bWF0Y2hpbmcgYmFycmllciBpcyBhY3R1YWxseSBoaWRkZW4gaW4gdGhlIGltcGxpY2l0Cj4gc2Vt
YW50aWNzIG9mIG1hbmFnaW5nIHRvIGxvY2sgc2QtPnNjaGVkdWxlX2xvY2sgKHdoaWNoIGlzIHRy
aWFsIGFuIGVycm9yCj4gYW55d2F5KSwgYnV0IHRoZSBvbmx5IHRoaW5nIHRoYXQgbWF0dGVycyBo
ZXJlIGlzIHRoYXQgYWxsIG90aGVyIHdyaXR0ZW4KPiBkYXRhIGlzIGluIHBsYWNlIGZpcnN0Lgo+
IAo+IEJleW9uZCB0aGF0LCBsb2NhbCBjYXVzYWxpdHkgd2lsbCBjYXVzZSBhbGwgcmVhZHMgdG8g
YmUgaW4gb3JkZXIgKG5vdAo+IHRoYXQgdGhlIGFyZSBpbXBvcnRhbnQpIGR1ZSB0byBsb2dpYyBk
ZXBlbmRlbmNpZXMuwqAgQW55IHRoYXQgbWlzcyBvdXQgb24KPiB0aGlzIGFyZSBhIG9wdGltaXNh
dGlvbi13YWl0aW5nLXRvLWhhcHBlbiBhcyB0aGUgY29tcGlsZXIgY291bGQgZWxpZGUKPiB0aGVt
IGZ1bGx5LgoKTm90IHRoYXQgaXQgd291bGQgcmVhbGx5IG1hdHRlciBmb3IgcGVyZm9ybWFuY2Ug
KHN3aXRjaGluZyBjcHVzIGJldHdlZW4KY3B1cG9vbHMgaXMgYSBfdmVyeV8gcmFyZSBvcGVyYXRp
b24pLCBJJ20gZmluZSB0cmFuc2Zvcm1pbmcgdGhlIGJhcnJpZXIKaW50byBzbXBfd21iKCkuCgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
