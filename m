Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D733DA38CA
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 16:07:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3hVX-0000DS-Fu; Fri, 30 Aug 2019 14:04:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3hVW-0000DN-9Z
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 14:04:06 +0000
X-Inumbo-ID: 03bf3da6-cb2f-11e9-ae8a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03bf3da6-cb2f-11e9-ae8a-12813bfff9fa;
 Fri, 30 Aug 2019 14:04:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4AED3ABF6;
 Fri, 30 Aug 2019 14:03:59 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-5-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f3817846-1474-a31e-2a0f-7c562248b8e3@suse.com>
Date: Fri, 30 Aug 2019 16:04:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830082953.2192-5-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 4/6] remove late (on-demand) construction
 of IOMMU page tables
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
Cc: PetrePircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAxMDoyOSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IE5vdyB0aGF0IHRoZXJl
IGlzIGEgcGVyLWRvbWFpbiBJT01NVS1lbmFibGUgZmxhZywgd2hpY2ggc2hvdWxkIGJlIHNldCBp
Zgo+IGFueSBkZXZpY2UgaXMgZ29pbmcgdG8gYmUgcGFzc2VkIHRocm91Z2gsIHN0b3AgZGVmZXJy
aW5nIHBhZ2UgdGFibGUKPiBjb25zdHJ1Y3Rpb24gdW50aWwgdGhlIGFzc2lnbm1lbnQgaXMgZG9u
ZS4gQWxzbyBkb24ndCB0ZWFyIGRvd24gdGhlIHRhYmxlcwo+IGFnYWluIHdoZW4gdGhlIGxhc3Qg
ZGV2aWNlIGlzIGRlLWFzc2lnbmVkOyBkZWZlciB0aGF0IHRhc2sgdW50aWwgZG9tYWluCj4gZGVz
dHJ1Y3Rpb24uCj4gCj4gVGhpcyBhbGxvd3MgdGhlIGhhc19pb21tdV9wdCgpIGhlbHBlciBhbmQg
aW9tbXVfc3RhdHVzIGVudW1lcmF0aW9uIHRvIGJlCj4gcmVtb3ZlZC4gQ2FsbHMgdG8gaGFzX2lv
bW11X3B0KCkgYXJlIHNpbXBseSByZXBsYWNlZCBieSBjYWxscyB0bwo+IGlzX2lvbW11X2VuYWJs
ZWQoKS4gUmVtYWluaW5nIG9wZW4tY29kZWQgdGVzdHMgb2YgaW9tbXVfaGFwX3B0X3NoYXJlIGNh
bgo+IGFsc28gYmUgcmVwbGFjZWQgYnkgY2FsbHMgdG8gaW9tbXVfdXNlX2hhcF9wdCgpLgo+IFRo
ZSBhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2VfdGFibGUoKSBhbmQgaW9tbXVfY29uc3RydWN0KCkg
ZnVuY3Rpb25zIGJlY29tZQo+IHJlZHVuZGFudCwgYXMgZG9lcyB0aGUgJ3N0cmljdCBtb2RlJyBk
b20wIHBhZ2VfbGlzdCBtYXBwaW5nIGNvZGUgaW4KPiBpb21tdV9od2RvbV9pbml0KCksIGFuZCBp
b21tdV90ZWFyZG93bigpIGNhbiBiZSBtYWRlIHN0YXRpYyBpcyBpdHMgb25seQo+IHJlbWFpbmlu
ZyBjYWxsZXIsIGlvbW11X2RvbWFpbl9kZXN0cm95KCksIGlzIHdpdGhpbiB0aGUgc2FtZSBzb3Vy
Y2UKPiBtb2R1bGUuCj4gCj4gQWxsIGluIGFsbCwgYWJvdXQgMjIwIGxpbmVzIG9mIGNvZGUgYXJl
IHJlbW92ZWQgZnJvbSB0aGUgaHlwZXJ2aXNvci4KPiAKPiBOT1RFOiBUaGlzIHBhdGNoIHdpbGwg
Y2F1c2UgYSBzbWFsbCBhbW91bnQgb2YgZXh0cmEgcmVzb3VyY2UgdG8gYmUgdXNlZAo+ICAgICAg
IHRvIGFjY29tbW9kYXRlIElPTU1VIHBhZ2UgdGFibGVzIHRoYXQgbWF5IG5ldmVyIGJlIHVzZWQs
IHNpbmNlIHRoZQo+ICAgICAgIHBlci1kb21haW4gSU9NTVUtZW5hYmxlIGZsYWcgaXMgY3VycmVu
dGx5IHNldCB0byB0aGUgdmFsdWUgb2YgdGhlCj4gICAgICAgZ2xvYmFsIGlvbW11X2VuYWJsZSBm
bGFnLiBBIHN1YnNlcXVlbnQgcGF0Y2ggd2lsbCBhZGQgYW4gb3B0aW9uIHRvCj4gICAgICAgdGhl
IHRvb2xzdGFjayB0byBhbGxvdyBpdCB0byBiZSB0dXJuZWQgb2ZmIGlmIHRoZXJlIGlzIG5vIGlu
dGVudGlvbgo+ICAgICAgIHRvIGFzc2lnbiBwYXNzdGhyb3VnaCBoYXJkd2FyZSB0byB0aGUgZG9t
YWluLgo+ICAgICAgIFRvIGFjY291bnQgZm9yIHRoZSBleHRyYSByZXNvdXJjZSwgJ2lvbW11X21l
bWtiJyBoYXMgYmVlbiBhZGRlZCB0bwo+ICAgICAgIGRvbWFpbl9idWlsZF9pbmZvLiBUaGlzIHBh
dGNoIHNldHMgaXQgdW5jb25kaXRpb25hbGx5IHRvIGEgdmFsdWUKPiAgICAgICBjYWxjdWxhdGVk
IGJhc2VkIG9uIHRoZSBkb21haW4ncyBtYXhpbXVtIG1lbW9yeSBidXQsIHdoZW4gdGhlCj4gICAg
ICAgdG9vbHN0YWNrIG9wdGlvbiBtZW50aW9uZWQgYWJvdmUgaXMgYWRkZWQsIGl0IGNhbiBiZSBz
ZXQgdG8gemVybwo+ICAgICAgIGlmIHRoZSBwZXItZG9tYWluIElPTU1VLWVuYWJsZSBmbGFnIGlz
IHR1cm5lZCBvZmYuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBi
aXRkZWZlbmRlci5jb20+Cj4gQWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJp
dGRlZmVuZGVyLmNvbT4KCkh5cGVydmlzb3IgcGFydHMKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCkFuZCB0aGFua3MgZm9yIGRvaW5nIHRoZSB0b29sIHN0YWNr
IGFkanVzdG1lbnQhCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
