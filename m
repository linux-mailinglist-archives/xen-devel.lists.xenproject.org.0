Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673F0157FF5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 17:40:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1C4Z-0001K4-Ks; Mon, 10 Feb 2020 16:38:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1C4Y-0001Jv-9d
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 16:38:10 +0000
X-Inumbo-ID: b804ec5b-4c23-11ea-b4e3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b804ec5b-4c23-11ea-b4e3-12813bfff9fa;
 Mon, 10 Feb 2020 16:38:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C914AAE99;
 Mon, 10 Feb 2020 16:38:07 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200203144340.4614-1-andrew.cooper3@citrix.com>
 <20200203144340.4614-5-andrew.cooper3@citrix.com>
 <76961409-b553-0ccc-6cd1-33ccf5cc75a0@suse.com>
 <cf596ea9-f9dd-b938-9666-34165edb8a0c@citrix.com>
 <afeace96-6c2d-207e-1ed7-f7f70d909072@suse.com>
 <30ddc44a-a915-5183-74a8-4dd149bcadf1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <582f8263-bb1c-8379-d029-5d0ed8b173af@suse.com>
Date: Mon, 10 Feb 2020 17:38:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <30ddc44a-a915-5183-74a8-4dd149bcadf1@citrix.com>
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

T24gMTAuMDIuMjAyMCAxNjoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMC8wMi8yMDIw
IDE1OjAyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTAuMDIuMjAyMCAxNTo1NSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA1LzAyLzIwMjAgMTA6MzYsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDAzLjAyLjIwMjAgMTU6NDMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IC0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9jbWQuYwo+Pj4+PiArKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfY21kLmMKPj4+Pj4gQEAgLTI0LDE2ICsy
NCwxNCBAQCBzdGF0aWMgaW50IHF1ZXVlX2lvbW11X2NvbW1hbmQoc3RydWN0IGFtZF9pb21tdSAq
aW9tbXUsIHUzMiBjbWRbXSkKPj4+Pj4gIHsKPj4+Pj4gICAgICB1aW50MzJfdCB0YWlsLCBoZWFk
Owo+Pj4+PiAgCj4+Pj4+IC0gICAgdGFpbCA9IGlvbW11LT5jbWRfYnVmZmVyLnRhaWw7Cj4+Pj4+
IC0gICAgaWYgKCArK3RhaWwgPT0gaW9tbXUtPmNtZF9idWZmZXIuZW50cmllcyApCj4+Pj4+ICsg
ICAgdGFpbCA9IGlvbW11LT5jbWRfYnVmZmVyLnRhaWwgKyBJT01NVV9DTURfQlVGRkVSX0VOVFJZ
X1NJWkU7Cj4+Pj4+ICsgICAgaWYgKCB0YWlsID09IGlvbW11LT5jbWRfYnVmZmVyLnNpemUgKQo+
Pj4+PiAgICAgICAgICB0YWlsID0gMDsKPj4+Pj4gIAo+Pj4+PiAtICAgIGhlYWQgPSBpb21tdV9n
ZXRfcmJfcG9pbnRlcihyZWFkbChpb21tdS0+bW1pb19iYXNlICsKPj4+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVfQ01EX0JVRkZFUl9IRUFEX09GRlNFVCkp
Owo+Pj4+PiArICAgIGhlYWQgPSByZWFkbChpb21tdS0+bW1pb19iYXNlICsgSU9NTVVfQ01EX0JV
RkZFUl9IRUFEX09GRlNFVCk7Cj4+Pj4+ICAgICAgaWYgKCBoZWFkICE9IHRhaWwgKQo+Pj4+IFN1
cmVseSB5b3Ugd2FudCB0byBtYXNrIG9mZiByZXNlcnZlZCAob3IgbW9yZSBnZW5lcmFsbHkKPj4+
PiB1bnJlbGF0ZWQpIGJpdHMsIGJlZm9yZSBjb25zdW1pbmcgdGhlIHZhbHVlIGZvciB0aGUgcHVy
cG9zZQo+Pj4+IGhlcmUgKGFuZCBlbHNld2hlcmUgYmVsb3cpPwo+Pj4gUmVzZXJ2ZWQgYml0cyBh
cmUgZGVmaW5lZCBpbiB0aGUgSU9NTVUgc3BlYyB0byBiZSByZWFkLW9ubHkgemVyby4KPj4+Cj4+
PiBJdCBpcyBhbHNvIHVuZGVmaW5lZCBiZWhhdmlvdXIgZm9yIHRoaXMgdmFsdWUgdG8gZXZlciBi
ZSBvdXRzaWRlIG9mIHRoZQo+Pj4gc2l6ZSBjb25maWd1cmVkIGZvciBjb21tYW5kIGJ1ZmZlciwg
c28gdXNpbmcgdGhlIHZhbHVlIGxpa2UgdGhpcyBpcyBzcGVjCj4+PiBjb21wbGlhbnQuCj4+Pgo+
Pj4gQXMgZm9yIGFjdHVhbGx5IG1hc2tpbmcgdGhlIHZhbHVlcywgdGhhdCBicmVha3MgdGhlIG9w
dGltaXNlcnMgYWJpbGl0eQo+Pj4gdG8gY29uc3RydWN0IGNvbW1hbmRzIGluIHRoZSBjb21tYW5k
IHJpbmcuwqAgVGhpcyBhc3BlY3QgY2FuIGJlIHdvcmtlZAo+Pj4gYXJvdW5kIHdpdGggb3RoZXIg
Y29kZSBjaGFuZ2VzLCBidXQgSSBhbHNvIHRoaW5rIGl0IGlzIGltcGxhdXNpYmxlIHRoYXQKPj4+
IHRoZSByZW1haW5pbmcgcmVzZXJ2ZWQgYml0cyBoZXJlIGFyZSBnb2luZyB0byBzcHJvdXQgaW5j
b21wYXRpYmxlIGZ1dHVyZQo+Pj4gdXNlcy4KPj4gSW1wbGF1c2libGUgLSBwZXJoYXBzLiBCdXQg
aW1wb3NzaWJsZSAtIG5vLiBUaGVyZSBjb3VsZCBiZSBhIHNpbXBsZQo+PiBmbGFnIGJpdCBhcHBl
YXJpbmcgc29tZXdoZXJlIGluIHRoZXNlIHJlZ2lzdGVycy4gSSBzaW1wbHkgZG9uJ3QgaXQKPj4g
aXMgYSBnb29kIGlkZWEgdG8gc2V0IGEgcHJlY2VkZW50IG9mIG5vdCBob25vcmluZyByZXNlcnZl
ZCBiaXQgYXMKPj4gYmVpbmcgcmVzZXJ2ZWQuIFRoZSBzcGVjIHNheWluZyAicmVhZC1vbmx5IHpl
cm8iIGNhbiBvbmx5IGJlIHZpZXdlZAo+PiBhcyBjb3JyZWN0IGZvciB0aGUgY3VycmVudCB2ZXJz
aW9uIG9mIHRoZSBzcGVjLAo+IAo+IEl0cyBwZXJmZWN0bHkgZWFzeSB0byBkbyBmb3J3YXJkIGNv
bXBhdGlibGUgY2hhbmdlcyB3aXRoIGEgc3BlYyB3cml0dGVuCj4gaW4gdGhpcyB3YXkuCj4gCj4g
SXQgbWVhbnMgdGhhdCBuZXcgYmVoYXZpb3VycyBoYXZlIHRvIGJlIG9wdGVkIGluIHRvLCBhbmQg
dGhpcyBpcyBob3cgdGhlCj4gQU1EIElPTU1VIHNwZWMgaGFzIGV2b2x2ZWQuwqAgTm90aWNlIGhv
dyBldmVyeSBuZXcgZmVhdHVyZSBkZWNsYXJlcyAidGhpcwo+IGJpdCBpcyByZXNlcnZlZCB1bmxl
c3MgJE9USEVSX1RISU5HIGlzIGVuYWJsZWQuIgo+IAo+IEl0IGlzIGFsc28gYSB2ZXJ5IHNhbmUg
d2F5IG9mIGRvaW5nIGZvcndhcmQgY29tcGF0aWJpbGl0eSwgZnJvbQo+IHNvZnR3YXJlJ3MgcG9p
bnQgb2Ygdmlldy4KClllcy4gQnV0IGRvZXMgdGhlIElPTU1VIHNwZWMgc3BlbGwgb3V0IHRoYXQg
aXQnbGwgZm9sbG93IHRoaXMKaW4gdGhlIGZ1dHVyZT8KCj4+IG9yIGVsc2Ugd2h5IHdvdWxkCj4+
IHRoZSBiaXRzIGJlIGNhbGxlZCAicmVzZXJ2ZWQiIHJhdGhlciB0aGFuIGUuZy4gInJlYWQtYXMt
emVybyI/Cj4gCj4gUmVhZCBUYWJsZSAxLCBidXQgaXQgYWxzbyBvdWdodCB0byBiZSBvYnZpb3Vz
LsKgICJSZXNlcnZlZCIsICJSZXN2IiBhbmQKPiAiUmVzIiBhcmUgYWxsIHNob3J0ZXIgdG8gd3Jp
dGUgdGhhbiAicmVhZC1hcy16ZXJvIiwgZXNwZWNpYWxseSBpbiB0aGUKPiBkaWFncmFtcyBvZiBh
IGZldyBpbmRpdmlkdWFsIGJpdHMgaW4gYSByZWdpc3Rlci4KClRoZXJlJ3MgYWxzbyB0aGUgY29t
bW9uIGFjcm9ueW0gInJheiIsIHdoaWNoIGlzIGFzIHNob3J0LiBUaGF0IHRhYmxlCmluIHBhcnRp
Y3VsYXIgc2F5cyBub3RoaW5nIGFib3V0IGZ1dHVyZSB1c2VzIG9mIGN1cnJlbnRseSByZXNlcnZl
ZApiaXRzLiBKdXN0IHRha2UgdGhlIEV4dGVuZGVkIEZlYXR1cmUgUmVnaXN0ZXIgYXMgYSByZWZl
cmVuY2U6IEhvdwp3b3VsZCBuZXcgZmVhdHVyZXMgYmUgYWR2ZXJ0aXNlZCAoaW4gY3VycmVudGx5
IHJlc2VydmVkIGJpdHMpIGlmIHVzZQpvZiB0aG9zZSBiaXRzIHdhcyB0byBiZSBxdWFsaWZpZWQg
YnkgeWV0IHNvbWUgb3RoZXIgZmVhdHVyZSBiaXQocykuClBhc3QgZ3Jvd3RoIG9mIHRoZSBzZXQg
b2YgdXNlZCBiaXRzIGFsc28gaGFzbid0IGZvbGxvd2VkIGEgcGF0dGVybgp5b3Ugc2VlbSB0byBz
dWdnZXN0LgoKRG9uJ3QgZ2V0IG1lIHdyb25nIC0gSSBhZ3JlZSBpdCdzIHVubGlrZWx5IGZvciB0
aGVzZSBiaXRzIHRvIGdhaW4KYSBtZWFuaW5nIHRoYXQgd291bGQgY29uZmxpY3Qgd2l0aCBhIG1v
cmUgcmVsYXhlZCB1c2UgbGlrZSB5b3UgZG8Kc3VnZ2VzdC4gQnV0IEkgZG9uJ3QgdGhpbmsgYmV0
dGVyIGNvZGUgZ2VuZXJhdGlvbiBzaG91bGQgYmUgYW4KYXJndW1lbnQgYWdhaW5zdCBoYXZpbmcg
Y29kZSB3cml0dGVuIGFzIGNvbXBhdGlibHkgYXMgcG9zc2libGUuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
