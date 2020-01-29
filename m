Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A28DD14C727
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 09:05:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwiIA-00007f-N5; Wed, 29 Jan 2020 08:01:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwiI9-00007W-7o
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 08:01:41 +0000
X-Inumbo-ID: 94183c12-426d-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94183c12-426d-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 08:01:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E10BAAF1;
 Wed, 29 Jan 2020 08:01:38 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <93b4ae81-6bfb-f7bd-06be-62032fd9a445@suse.com>
 <20200128145422.GP57924@desktop-tdan49n.eng.citrite.net>
 <682a8462-ded7-3f73-d8fe-ffa42738a61e@suse.com>
 <20200128172521.GS57924@desktop-tdan49n.eng.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b54a96e-a579-3442-71ef-b8904cbe7897@suse.com>
Date: Wed, 29 Jan 2020 09:01:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200128172521.GS57924@desktop-tdan49n.eng.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/HVM: relinquish resources also from
 hvm_domain_destroy()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxODoyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEph
biAyOCwgMjAyMCBhdCAwNDo0OTowOVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjguMDEuMjAyMCAxNTo1NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFR1ZSwgSmFu
IDI4LCAyMDIwIGF0IDAyOjE2OjUzUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vcnRjLmMKPj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3J0
Yy5jCj4+Pj4gQEAgLTg0NCw3ICs4NDQsOCBAQCB2b2lkIHJ0Y19kZWluaXQoc3RydWN0IGRvbWFp
biAqZCkKPj4+PiAgewo+Pj4+ICAgICAgUlRDU3RhdGUgKnMgPSBkb21haW5fdnJ0YyhkKTsKPj4+
PiAgCj4+Pj4gLSAgICBpZiAoICFoYXNfdnJ0YyhkKSApCj4+Pj4gKyAgICBpZiAoICFoYXNfdnJ0
YyhkKSB8fCAhZC0+YXJjaC5odm0ucGxfdGltZSB8fAo+Pj4+ICsgICAgICAgICBzLT51cGRhdGVf
dGltZXIuc3RhdHVzID09IFRJTUVSX1NUQVRVU19pbnZhbGlkICkKPj4+Cj4+PiBZb3UgY291bGQg
YWxzbyBjaGVjayBmb3IgdGhlIHBvcnQgcmVnaXN0cmF0aW9uIEFGQUlDVCwgd2hpY2ggaXMgbWF5
YmUKPj4+IG1vcmUgb2J2aW91cz8KPj4KPj4gWW91IGNhbGxlZCB0aGF0IGFwcHJvYWNoIGRpcnR5
IGFib3ZlIC0gSSdkIGxpa2UgdG8gcmVzdHJpY3QgaXQKPj4gdG8ganVzdCB3aGVyZSBubyBiZXR0
ZXIgYWx0ZXJuYXRpdmUgZXhpc3RzLgo+IAo+IEFjaywgaXQgZGlkbid0IHNlZW0gdGhhdCBiYWQg
aGVyZSBiZWNhdXNlIHRoaXMgaXMgYSB4ODYgZW11bGF0ZWQKPiBkZXZpY2UgdGhhdCByZWxpZXMg
b24gSU8gcG9ydHMsIHdoaWxlIHRoZSBpb3JlcSBjb2RlIChhbGJlaXQgeDg2Cj4gc3BlY2lmaWMg
QVRNKSBjb3VsZCBiZSB1c2VkIGJ5IG90aGVyIGFyY2hlcywgYW5kIGhlbmNlIHdvdWxkIGxpa2Vs
eQo+IHByZWZlciB0byBhdm9pZCB1c2luZyB4ODYgc3BlY2lmaWMgZGV0YWlscyBmb3IgZ2VuZXJp
YyBmdW5jdGlvbnMsIGxpa2UKPiB0aGUgaW5pdCBvciBkZWluaXQgb25lcy4KCkxpa2VseSwgYnV0
IHRoZSBwb3J0IEkvTyBoYW5kbGVyIHJlZ2lzdHJhdGlvbiBpcyBnb2luZyB0byByZW1haW4KeDg2
LXNwZWNpZmljLCBhbmQgaGVuY2UgdGhlcmUgd291bGQgcHJldHR5IGNlcnRhaW5seSBhbHNvIGJl
IGFuCmFyY2gtc3BlY2lmaWMgaW5pdCAoYW5kIG1heSBhIGRlaW5pdCkgZnVuY3Rpb24uCgo+Pj4g
SSBhbHNvIHdvbmRlciB3aGV0aGVyIGFsbCB0aG9zZSB0aW1lLXJlbGF0ZWQgZW11bGF0aW9ucyBj
b3VsZCBiZQo+Pj4gZ3JvdXBlZCBpbnRvIGEgc2luZ2xlIGhlbHBlciwgdGhhdCBjb3VsZCBoYXZl
IGEgZC0+YXJjaC5odm0ucGxfdGltZQo+Pj4gaW5zdGVhZCBvZiBoYXZpbmcgdG8gc3ByaW5rbGUg
c3VjaCBjaGVja3MgZm9yIGVhY2ggZGV2aWNlPwo+Pgo+PiBRdWl0ZSBwb3NzaWJsZSwgYnV0IG5v
dCBoZXJlIGFuZCBub3Qgbm93Lgo+IAo+IFN1cmUuCj4gCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLiBUaGVyZSBhcmUgdHdvIHNt
YWxsIGNoYW5nZXMgSSBpbnRlbmQgdG8gZG8sIG9uZSBkaXJlY3RseQphbmQgb25lIGluZGlyZWN0
bHkgcmVzdWx0aW5nIGZyb20gUGF1bCdzIGZlZWRiYWNrOiBBbHNvIGRyb3AKcnRjX2RlaW5pdCgp
IGZyb20gaHZtX2RvbWFpbl9kZXN0cm95KCkuIEFsc28gZHJvcCBub3cgcG9pbnRsZXNzCmlmKCkg
ZnJvbSBodm1fZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkuIEknZCB0aGVyZWZvcmUgbGlr
ZQp0byBhc2sgeW91IHRvIGNvbmZpcm0gdGhlIFItYiBjYW4gYmUgbGVmdCBpbiBwbGFjZSwgb3Ig
d2hldGhlcgppbnN0ZWFkIHlvdSdkIHJhdGhlciB3YWl0IGZvciB2MiB0byBiZSBwb3N0ZWQuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
