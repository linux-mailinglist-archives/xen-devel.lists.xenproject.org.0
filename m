Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F00A81FA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 14:17:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5UBB-0003OK-Jq; Wed, 04 Sep 2019 12:14:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5UBA-0003OF-RF
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 12:14:28 +0000
X-Inumbo-ID: 8a48abf0-cf0d-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a48abf0-cf0d-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 12:14:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5E51AD09;
 Wed,  4 Sep 2019 12:14:26 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190902081118.31001-1-aisaila@bitdefender.com>
 <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
 <4ba2503f-20b2-3670-ba16-8b03e69f3937@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <813b92ae-0f4a-22ec-db30-6c43be246708@suse.com>
Date: Wed, 4 Sep 2019 14:14:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4ba2503f-20b2-3670-ba16-8b03e69f3937@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a
 new view and set sve bits
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxMzo1MSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMDMuMDkuMjAxOSAxODo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAyLjA5LjIw
MTkgMTA6MTEsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gQEAgLTEzNTUsNiAr
MTM1NSwyMyBAQCB2b2lkIHAybV9pbml0X2FsdHAybV9lcHQoc3RydWN0IGRvbWFpbiAqZCwgdW5z
aWduZWQgaW50IGkpCj4+PiAgICAgICBlcHQgPSAmcDJtLT5lcHQ7Cj4+PiAgICAgICBlcHQtPm1m
biA9IHBhZ2V0YWJsZV9nZXRfcGZuKHAybV9nZXRfcGFnZXRhYmxlKHAybSkpOwo+Pj4gICAgICAg
ZC0+YXJjaC5hbHRwMm1fZXB0cFtpXSA9IGVwdC0+ZXB0cDsKPj4+ICsKPj4+ICsgICAgaWYgKCBz
ZXRfc3ZlICkKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBnZm4gPSAwLCBt
YXhfZ3BmbiA9IGRvbWFpbl9nZXRfbWF4aW11bV9ncGZuKGQpOwo+Pj4gKwo+Pj4gKyAgICAgICAg
Zm9yKCA7IGdmbiA8IG1heF9ncGZuOyArK2dmbiApCj4+PiArICAgICAgICB7Cj4+PiArICAgICAg
ICAgICAgbWZuX3QgbWZuOwo+Pj4gKyAgICAgICAgICAgIHAybV9hY2Nlc3NfdCBhOwo+Pj4gKyAg
ICAgICAgICAgIHAybV90eXBlX3QgdDsKPj4+ICsKPj4+ICsgICAgICAgICAgICBhbHRwMm1fZ2V0
X2VmZmVjdGl2ZV9lbnRyeShwMm0sIF9nZm4oZ2ZuKSwgJm1mbiwgJnQsICZhLAo+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFQMk1HRVRfcXVlcnkpOwo+Pj4gKyAg
ICAgICAgICAgIHAybS0+c2V0X2VudHJ5KHAybSwgX2dmbihnZm4pLCBtZm4sIFBBR0VfT1JERVJf
NEssIHQsIGEsIHRydWUpOwo+Pj4gKwo+Pj4gKyAgICAgICAgfQo+Pj4gKyAgICB9Cj4+PiAgIH0K
Pj4KPj4gSG93IGxvbmcgaXMgdGhpcyBsb29wIGdvaW5nIHRvIHRha2UgZm9yIGEgaHVnZSBndWVz
dD8gSU9XIGhvdwo+PiBjb21lIHRoZXJlJ3Mgbm8gcHJlZW1wdGlvbiBpbiBoZXJlLCBvciBzb21l
IG90aGVyIG1lY2hhbmlzbQo+PiB0byBib3VuZCBleGVjdXRpb24gdGltZT8KPiAKPiBCZWNhdXNl
IHRoaXMgaXMgZG9uZSBmb3IgdGhlIGluaXRpYWxpemF0aW9uIG9mIGEgbmV3IHZpZXcgYW5kIHRo
ZSBwMm0gaXMgCj4gbG9ja2VkLgoKV2VsbCwgdGhpcyBtYWtlcyBoYW5kbGluZyB0aGlzIHRoZSB3
YXkgeW91IHdhbnQgaXQgY2xvc2UgdG8KaW1wb3NzaWJsZSwgYnV0IGlzIG5vdCBhbiBhcmd1bWVu
dCBhZ2FpbnN0IHRoZSBuZWVkIGZvciBwcmVlbXB0aW9uCmhlcmUuIEp1c3QgbGlrZSBpdCBoYWQg
dHVybmVkIG91dCB0byBiZSB1bnJlYXNvbmFibGUgdG8KcHJlZW1wdGl2ZWx5IGhhbmRsZSBvdGhl
ciBQMk0gYWRqdXN0bWVudHMgKHdoaWNoIGlzIHdoeQpwMm0tZXB0LmM6cmVzb2x2ZV9taXNjb25m
aWcoKSBhbmQgcDJtLXB0LmM6ZG9fcmVjYWxjKCkgZ290CmludHJvZHVjZWQpLCBJJ20gYWZyYWlk
IHlvdSdsbCBoYXZlIHRvIHVzZSBzb21lIG90aGVyIHRlY2huaXF1ZQpoZXJlIChwb3NzaWJseSBi
dWlsZGluZyBvbiB0b3Agb2YgdGhlIG1lbnRpb25lZCBmdW5jdGlvbnMpLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
