Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DDF157E15
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 16:05:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1AaI-0000qL-5v; Mon, 10 Feb 2020 15:02:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1AaH-0000qE-B4
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 15:02:49 +0000
X-Inumbo-ID: 669b04ce-4c16-11ea-b4d7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 669b04ce-4c16-11ea-b4d7-12813bfff9fa;
 Mon, 10 Feb 2020 15:02:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 04CB1ADF8;
 Mon, 10 Feb 2020 15:02:48 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200203144340.4614-1-andrew.cooper3@citrix.com>
 <20200203144340.4614-5-andrew.cooper3@citrix.com>
 <76961409-b553-0ccc-6cd1-33ccf5cc75a0@suse.com>
 <cf596ea9-f9dd-b938-9666-34165edb8a0c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <afeace96-6c2d-207e-1ed7-f7f70d909072@suse.com>
Date: Mon, 10 Feb 2020 16:02:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <cf596ea9-f9dd-b938-9666-34165edb8a0c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] AMD/IOMMU: Treat head/tail pointers as
 byte offsets
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDIuMjAyMCAxNTo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNS8wMi8yMDIw
IDEwOjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDMuMDIuMjAyMCAxNTo0MywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21t
dV9jbWQuYwo+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2NtZC5j
Cj4+PiBAQCAtMjQsMTYgKzI0LDE0IEBAIHN0YXRpYyBpbnQgcXVldWVfaW9tbXVfY29tbWFuZChz
dHJ1Y3QgYW1kX2lvbW11ICppb21tdSwgdTMyIGNtZFtdKQo+Pj4gIHsKPj4+ICAgICAgdWludDMy
X3QgdGFpbCwgaGVhZDsKPj4+ICAKPj4+IC0gICAgdGFpbCA9IGlvbW11LT5jbWRfYnVmZmVyLnRh
aWw7Cj4+PiAtICAgIGlmICggKyt0YWlsID09IGlvbW11LT5jbWRfYnVmZmVyLmVudHJpZXMgKQo+
Pj4gKyAgICB0YWlsID0gaW9tbXUtPmNtZF9idWZmZXIudGFpbCArIElPTU1VX0NNRF9CVUZGRVJf
RU5UUllfU0laRTsKPj4+ICsgICAgaWYgKCB0YWlsID09IGlvbW11LT5jbWRfYnVmZmVyLnNpemUg
KQo+Pj4gICAgICAgICAgdGFpbCA9IDA7Cj4+PiAgCj4+PiAtICAgIGhlYWQgPSBpb21tdV9nZXRf
cmJfcG9pbnRlcihyZWFkbChpb21tdS0+bW1pb19iYXNlICsKPj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIElPTU1VX0NNRF9CVUZGRVJfSEVBRF9PRkZTRVQpKTsKPj4+
ICsgICAgaGVhZCA9IHJlYWRsKGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9DTURfQlVGRkVSX0hF
QURfT0ZGU0VUKTsKPj4+ICAgICAgaWYgKCBoZWFkICE9IHRhaWwgKQo+PiBTdXJlbHkgeW91IHdh
bnQgdG8gbWFzayBvZmYgcmVzZXJ2ZWQgKG9yIG1vcmUgZ2VuZXJhbGx5Cj4+IHVucmVsYXRlZCkg
Yml0cywgYmVmb3JlIGNvbnN1bWluZyB0aGUgdmFsdWUgZm9yIHRoZSBwdXJwb3NlCj4+IGhlcmUg
KGFuZCBlbHNld2hlcmUgYmVsb3cpPwo+IAo+IFJlc2VydmVkIGJpdHMgYXJlIGRlZmluZWQgaW4g
dGhlIElPTU1VIHNwZWMgdG8gYmUgcmVhZC1vbmx5IHplcm8uCj4gCj4gSXQgaXMgYWxzbyB1bmRl
ZmluZWQgYmVoYXZpb3VyIGZvciB0aGlzIHZhbHVlIHRvIGV2ZXIgYmUgb3V0c2lkZSBvZiB0aGUK
PiBzaXplIGNvbmZpZ3VyZWQgZm9yIGNvbW1hbmQgYnVmZmVyLCBzbyB1c2luZyB0aGUgdmFsdWUg
bGlrZSB0aGlzIGlzIHNwZWMKPiBjb21wbGlhbnQuCj4gCj4gQXMgZm9yIGFjdHVhbGx5IG1hc2tp
bmcgdGhlIHZhbHVlcywgdGhhdCBicmVha3MgdGhlIG9wdGltaXNlcnMgYWJpbGl0eQo+IHRvIGNv
bnN0cnVjdCBjb21tYW5kcyBpbiB0aGUgY29tbWFuZCByaW5nLsKgIFRoaXMgYXNwZWN0IGNhbiBi
ZSB3b3JrZWQKPiBhcm91bmQgd2l0aCBvdGhlciBjb2RlIGNoYW5nZXMsIGJ1dCBJIGFsc28gdGhp
bmsgaXQgaXMgaW1wbGF1c2libGUgdGhhdAo+IHRoZSByZW1haW5pbmcgcmVzZXJ2ZWQgYml0cyBo
ZXJlIGFyZSBnb2luZyB0byBzcHJvdXQgaW5jb21wYXRpYmxlIGZ1dHVyZQo+IHVzZXMuCgpJbXBs
YXVzaWJsZSAtIHBlcmhhcHMuIEJ1dCBpbXBvc3NpYmxlIC0gbm8uIFRoZXJlIGNvdWxkIGJlIGEg
c2ltcGxlCmZsYWcgYml0IGFwcGVhcmluZyBzb21ld2hlcmUgaW4gdGhlc2UgcmVnaXN0ZXJzLiBJ
IHNpbXBseSBkb24ndCBpdAppcyBhIGdvb2QgaWRlYSB0byBzZXQgYSBwcmVjZWRlbnQgb2Ygbm90
IGhvbm9yaW5nIHJlc2VydmVkIGJpdCBhcwpiZWluZyByZXNlcnZlZC4gVGhlIHNwZWMgc2F5aW5n
ICJyZWFkLW9ubHkgemVybyIgY2FuIG9ubHkgYmUgdmlld2VkCmFzIGNvcnJlY3QgZm9yIHRoZSBj
dXJyZW50IHZlcnNpb24gb2YgdGhlIHNwZWMsIG9yIGVsc2Ugd2h5IHdvdWxkCnRoZSBiaXRzIGJl
IGNhbGxlZCAicmVzZXJ2ZWQiIHJhdGhlciB0aGFuIGUuZy4gInJlYWQtYXMtemVybyI/CgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
