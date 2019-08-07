Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B745D8499B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:33:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJEN-0005Eq-UL; Wed, 07 Aug 2019 10:31:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvJEM-0005Ek-4J
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:31:42 +0000
X-Inumbo-ID: 8a827220-b8fe-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a827220-b8fe-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 10:31:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 08BA0B117;
 Wed,  7 Aug 2019 10:31:39 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-4-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1383f85e-bc08-c0be-bb02-f68b76ac1be5@suse.com>
Date: Wed, 7 Aug 2019 12:31:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730134419.2739-4-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxNTo0NCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IE5PVEU6IFRoaXMgcGF0
Y2ggd2lsbCBjYXVzZSBhIHNtYWxsIGFtb3VudCBvZiBleHRyYSByZXNvdXJjZSB0byBiZSB1c2Vk
Cj4gICAgICAgIHRvIGFjY29tbW9kYXRlIElPTU1VIHBhZ2UgdGFibGVzIHRoYXQgbWF5IG5ldmVy
IGJlIHVzZWQsIHNpbmNlIHRoZQo+ICAgICAgICBwZXItZG9tYWluIElPTU1VIGZsYWcgZW5hYmxl
IGZsYWcgaXMgY3VycmVudGx5IHNldCB0byB0aGUgdmFsdWUKPiAgICAgICAgb2YgdGhlIGdsb2Jh
bCBpb21tdV9lbmFibGUgZmxhZy4gQSBzdWJzZXF1ZW50IHBhdGNoIHdpbGwgYWRkIGFuCj4gICAg
ICAgIG9wdGlvbiB0byB0aGUgdG9vbHN0YWNrIHRvIGFsbG93IGl0IHRvIGJlIHR1cm5lZCBvZmYg
aWYgdGhlcmUgaXMKPiAgICAgICAgbm8gaW50ZW50aW9uIHRvIGFzc2lnbiBwYXNzdGhyb3VnaCBo
YXJkd2FyZSB0byB0aGUgZG9tYWluLgoKSW4gcGFydGljdWxhciBpZiB0aGUgZGVmYXVsdCBvZiB0
aGlzIGlzIGdvaW5nIHRvIGJlICJ0cnVlIiAoSQpkaWRuJ3QgbG9vayBhdCB0aGF0IHBhdGNoIHll
dCwgYnV0IHRoZSB3b3JkaW5nIGFib3ZlIG1ha2VzIG1lCmFzc3VtZSBzbyksIGluIGF1dG8tYmFs
bG9vbmluZyBtb2RlIHdpdGhvdXQgc2hhcmVkIHBhZ2UgdGFibGVzCm1vcmUgbWVtb3J5IHNob3Vs
ZCBpbW8gYmUgYmFsbG9vbmVkIG91dCBvZiBEb20wIG5vdy4gSXQgaGFzCmFsd2F5cyBiZWVuIGEg
YnVnIHRoYXQgSU9NTVUgcGFnZSB0YWJsZXMgd2VyZW4ndCBhY2NvdW50ZWQgZm9yLApidXQgaXQg
d291bGQgYmVjb21lIGV2ZW4gbW9yZSBwcm9taW5lbnQgdGhlbi4KCj4gLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS9tdHJyLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL210cnIuYwo+IEBAIC03ODMs
NyArNzgzLDggQEAgSFZNX1JFR0lTVEVSX1NBVkVfUkVTVE9SRShNVFJSLCBodm1fc2F2ZV9tdHJy
X21zciwgaHZtX2xvYWRfbXRycl9tc3IsIDEsCj4gICAKPiAgIHZvaWQgbWVtb3J5X3R5cGVfY2hh
bmdlZChzdHJ1Y3QgZG9tYWluICpkKQo+ICAgewo+IC0gICAgaWYgKCAoaGFzX2lvbW11X3B0KGQp
IHx8IGNhY2hlX2ZsdXNoX3Blcm1pdHRlZChkKSkgJiYgZC0+dmNwdSAmJiBkLT52Y3B1WzBdICkK
PiArICAgIGlmICggKGlzX2lvbW11X2VuYWJsZWQoZCkgfHwgY2FjaGVfZmx1c2hfcGVybWl0dGVk
KGQpKSAmJiBkLT52Y3B1ICYmCj4gKyAgICAgICAgIGQtPnZjcHVbMF0gKQoKQXMgYSByZWFsbHkg
bWlub3IgY29tbWVudCAtIEkgdGhpbmsgaXQgd291bGRuJ3QgYmUgYmFkIGZvciBib3RoCmQtPnZj
cHUgcmVmZXJlbmNlcyB0byBlbmQgdXAgb24gdGhlIHNhbWUgbGluZS4KCj4gQEAgLTYyNSw4ICs1
NDgsNyBAQCBzdGF0aWMgdm9pZCBpb21tdV9kdW1wX3AybV90YWJsZSh1bnNpZ25lZCBjaGFyIGtl
eSkKPiAgICAgICBvcHMgPSBpb21tdV9nZXRfb3BzKCk7Cj4gICAgICAgZm9yX2VhY2hfZG9tYWlu
KGQpCj4gICAgICAgewo+IC0gICAgICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQpIHx8Cj4g
LSAgICAgICAgICAgICBkb21faW9tbXUoZCktPnN0YXR1cyA8IElPTU1VX1NUQVRVU19pbml0aWFs
aXplZCApCj4gKyAgICAgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSApCj4gICAgICAgICAg
ICAgICBjb250aW51ZTsKCldoeSBkbyB5b3UgZHJvcCB0aGUgaHdkb20gY2hlY2sgaGVyZT8KCj4g
LS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9pb21tdS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9pb21tdS5oCj4gQEAgLTIxLDcgKzIxLDcgQEAgc3RydWN0IGFyY2hfaW9tbXUKPiAgIH07
Cj4gICAKPiAgIC8qIEFsd2F5cyBzaGFyZSBQMk0gVGFibGUgYmV0d2VlbiB0aGUgQ1BVIGFuZCB0
aGUgSU9NTVUgKi8KPiAtI2RlZmluZSBpb21tdV91c2VfaGFwX3B0KGQpIChoYXNfaW9tbXVfcHQo
ZCkpCj4gKyNkZWZpbmUgaW9tbXVfdXNlX2hhcF9wdChkKSAoaXNfaW9tbXVfZW5hYmxlZChkKSkK
CkknZCBzdWdnZXN0IGRyb3BwaW5nIHRoZSBzdHJheSBvdXRlciBwYWlyIG9mIHBhcmVudGhlc2Vz
IGF0IHRoZQpzYW1lIHRpbWUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
