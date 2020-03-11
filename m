Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AEF1816C9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 12:25:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBzRE-0008GT-Bz; Wed, 11 Mar 2020 11:22:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GIj9=44=suse.de=colyli@srs-us1.protection.inumbo.net>)
 id 1jBzPQ-0008Ev-UG
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 11:20:20 +0000
X-Inumbo-ID: 4a9ad994-638a-11ea-af6c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a9ad994-638a-11ea-af6c-12813bfff9fa;
 Wed, 11 Mar 2020 11:20:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B7121AED2;
 Wed, 11 Mar 2020 11:20:18 +0000 (UTC)
To: Matteo Croce <mcroce@redhat.com>
References: <20200311002254.121365-1-mcroce@redhat.com>
From: Coly Li <colyli@suse.de>
Organization: SUSE Labs
Message-ID: <89925759-cbc1-e8f0-b9b3-23fd062ebbcd@suse.de>
Date: Wed, 11 Mar 2020 19:20:11 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311002254.121365-1-mcroce@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Mar 2020 11:22:10 +0000
Subject: Re: [Xen-devel] [PATCH v3] block: refactor duplicated macros
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 xen-devel@lists.xenproject.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAyMC8zLzExIDg6MjIg5LiK5Y2ILCBNYXR0ZW8gQ3JvY2Ugd3JvdGU6Cj4gVGhlIG1hY3Jv
cyBQQUdFX1NFQ1RPUlMsIFBBR0VfU0VDVE9SU19TSElGVCBhbmQgU0VDVE9SX01BU0sgYXJlIGRl
ZmluZWQKPiBzZXZlcmFsIHRpbWVzIGluIGRpZmZlcmVudCBmbGF2b3VycyBhY3Jvc3MgdGhlIHdo
b2xlIHRyZWUuCj4gRGVmaW5lIHRoZW0ganVzdCBvbmNlIGluIGEgY29tbW9uIGhlYWRlci4KPiAK
PiBXaGlsZSBhdCBpdCwgcmVwbGFjZSByZXBsYWNlICJQQUdFX1NISUZUIC0gOSIgd2l0aCAiUEFH
RV9TRUNUT1JTX1NISUZUIiB0b28KPiBhbmQgcmVuYW1lIFNFQ1RPUl9NQVNLIHRvIFBBR0VfU0VD
VE9SU19NQVNLLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRlbyBDcm9jZSA8bWNyb2NlQHJlZGhh
dC5jb20+CgpIaSBNYXR0ZW8sCgpGb3IgdGhlIGJjYWNoZSBwYXJ0LCBpdCBsb29rcyBnb29kIHRv
IG1lLgoKQWNrZWQtYnk6IENvbHkgTGkgPGNvbHlsaUBzdXNlLmRlPgoKPiAtLS0KPiB2MzoKPiBB
cyBHdW9xaW5nIEppYW5nIHN1Z2dlc3RlZCwgcmVwbGFjZSAiUEFHRV9TSElGVCAtIDkiIHdpdGgg
IlBBR0VfU0VDVE9SU19TSElGVCIKPiAKPiB2MjoKPiBBcyBEYW4gV2lsbGlhbXMgc3VnZ2VzdGVk
Ogo+IAo+ICAjZGVmaW5lIFBBR0VfU0VDVE9SU19NQVNLICAgICAgICAgICAgKH4oUEFHRV9TRUNU
T1JTIC0gMSkpCj4gCj4gIGJsb2NrL2Jsay1saWIuYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0K
PiAgYmxvY2svYmxrLXNldHRpbmdzLmMgICAgICAgICAgICAgfCAgNCArKy0tCj4gIGJsb2NrL3Bh
cnRpdGlvbi1nZW5lcmljLmMgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9ibG9jay9icmQuYyAg
ICAgICAgICAgICAgfCAgMyAtLS0KPiAgZHJpdmVycy9ibG9jay9udWxsX2Jsa19tYWluLmMgICAg
fCAxNCArKysrKy0tLS0tLS0tLQo+ICBkcml2ZXJzL2Jsb2NrL3pyYW0venJhbV9kcnYuYyAgICB8
ICA4ICsrKystLS0tCj4gIGRyaXZlcnMvYmxvY2svenJhbS96cmFtX2Rydi5oICAgIHwgIDIgLS0K
PiAgZHJpdmVycy9kYXgvc3VwZXIuYyAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL21k
L2JjYWNoZS91dGlsLmggICAgICAgICB8ICAyIC0tCj4gIGRyaXZlcnMvbWQvZG0tYnVmaW8uYyAg
ICAgICAgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvbWQvZG0taW50ZWdyaXR5LmMgICAgICAg
IHwgMTAgKysrKystLS0tLQo+ICBkcml2ZXJzL21kL2RtLXRhYmxlLmMgICAgICAgICAgICB8ICAy
ICstCj4gIGRyaXZlcnMvbWQvbWQuYyAgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2
ZXJzL21kL3JhaWQxLmMgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbWQvcmFpZDEw
LmMgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9tZC9yYWlkNS1jYWNoZS5jICAgICAg
ICAgfCAxMCArKysrKy0tLS0tCj4gIGRyaXZlcnMvbWQvcmFpZDUuaCAgICAgICAgICAgICAgIHwg
IDIgKy0KPiAgZHJpdmVycy9tbWMvY29yZS9ob3N0LmMgICAgICAgICAgfCAgMyArKy0KPiAgZHJp
dmVycy9udm1lL2hvc3QvZmMuYyAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL252bWUvdGFy
Z2V0L2xvb3AuYyAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvc2NzaS94ZW4tc2NzaWZyb250LmMg
ICAgIHwgIDQgKystLQo+ICBmcy9lcm9mcy9pbnRlcm5hbC5oICAgICAgICAgICAgICB8ICAyICst
Cj4gIGZzL2V4dDIvZGlyLmMgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZnMvaW9tYXAv
YnVmZmVyZWQtaW8uYyAgICAgICAgICAgfCAgMiArLQo+ICBmcy9saWJmcy5jICAgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCj4gIGZzL25mcy9ibG9ja2xheW91dC9ibG9ja2xheW91dC5oIHwg
IDIgLS0KPiAgZnMvbmlsZnMyL2Rpci5jICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBpbmNs
dWRlL2xpbnV4L2Jsa2Rldi5oICAgICAgICAgICB8ICA0ICsrKysKPiAgaW5jbHVkZS9saW51eC9k
ZXZpY2UtbWFwcGVyLmggICAgfCAgMSAtCj4gIG1tL3BhZ2VfaW8uYyAgICAgICAgICAgICAgICAg
ICAgIHwgIDQgKystLQo+ICBtbS9zd2FwZmlsZS5jICAgICAgICAgICAgICAgICAgICB8IDEyICsr
KysrKy0tLS0tLQo+ICAzMSBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspLCA2NSBkZWxl
dGlvbnMoLSkKPiAKCltzbmlwcGVkXQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9iY2FjaGUv
dXRpbC5oIGIvZHJpdmVycy9tZC9iY2FjaGUvdXRpbC5oCj4gaW5kZXggYzAyOWY3NDQzMTkwLi41
NTE5NmUwZjM3YzMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZC9iY2FjaGUvdXRpbC5oCj4gKysr
IGIvZHJpdmVycy9tZC9iY2FjaGUvdXRpbC5oCj4gQEAgLTE1LDggKzE1LDYgQEAKPiAgCj4gICNp
bmNsdWRlICJjbG9zdXJlLmgiCj4gIAo+IC0jZGVmaW5lIFBBR0VfU0VDVE9SUwkJKFBBR0VfU0la
RSAvIDUxMikKPiAtCj4gIHN0cnVjdCBjbG9zdXJlOwo+ICAKPiAgI2lmZGVmIENPTkZJR19CQ0FD
SEVfREVCVUcKCltzbmlwcGVkXQoKCi0tIAoKQ29seSBMaQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
