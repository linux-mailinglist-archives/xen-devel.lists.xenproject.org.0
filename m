Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C16104059
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 17:09:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXSWc-0000BD-U0; Wed, 20 Nov 2019 16:08:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXSWb-0000B8-CQ
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 16:08:13 +0000
X-Inumbo-ID: f33edc72-0baf-11ea-a31a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f33edc72-0baf-11ea-a31a-12813bfff9fa;
 Wed, 20 Nov 2019 16:08:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2BB60B2EAE;
 Wed, 20 Nov 2019 16:08:11 +0000 (UTC)
To: Hongyan Xia <hongyax@amazon.com>, Wei Liu <wl@xen.org>
References: <cover.1570034362.git.hongyax@amazon.com>
 <a20119602bc7adadba49a5cfae687edae5f55323.1570034362.git.hongyax@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11439730-b9c1-1b57-c15c-03569df48dd0@suse.com>
Date: Wed, 20 Nov 2019 17:08:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a20119602bc7adadba49a5cfae687edae5f55323.1570034362.git.hongyax@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/9] x86/mm: introduce l{1,
 2}t local variables to map_pages_to_xen
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxOToxNiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gRnJvbTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBUaGUgcGwyZSBhbmQgcGwxZSB2YXJpYWJsZXMgYXJl
IGhlYXZpbHkgKGFiKXVzZWQgaW4gdGhhdCBmdW5jdGlvbi4gSXQKPiBpcyBmaW5lIGF0IHRoZSBt
b21lbnQgYmVjYXVzZSBhbGwgcGFnZSB0YWJsZXMgYXJlIGFsd2F5cyBtYXBwZWQgc28KPiB0aGVy
ZSBpcyBubyBuZWVkIHRvIHRyYWNrIHRoZSBsaWZlIHRpbWUgb2YgZWFjaCB2YXJpYWJsZS4KPiAK
PiBXZSB3aWxsIHNvb24gaGF2ZSB0aGUgcmVxdWlyZW1lbnQgdG8gbWFwIGFuZCB1bm1hcCBwYWdl
IHRhYmxlcy4gV2UKPiBuZWVkIHRvIHRyYWNrIHRoZSBsaWZlIHRpbWUgb2YgZWFjaCB2YXJpYWJs
ZSB0byBhdm9pZCBsZWFrYWdlLgo+IAo+IEludHJvZHVjZSBzb21lIGx7MSwyfXQgdmFyaWFibGVz
IHdpdGggbGltaXRlZCBzY29wZSBzbyB0aGF0IHdlIGNhbgo+IHRyYWNrIGxpZmUgdGltZSBvZiBw
b2ludGVycyB0byB4ZW4gcGFnZSB0YWJsZXMgbW9yZSBlYXNpbHkuCj4gCj4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGggYSBj
b3VwbGUgb2YgcmVtYXJrczoKCj4gLS0tIGEveGVuL2FyY2gveDg2L21tLmMKPiArKysgYi94ZW4v
YXJjaC94ODYvbW0uYwo+IEBAIC01MDYxLDEwICs1MDYxLDEyIEBAIGludCBtYXBfcGFnZXNfdG9f
eGVuKAo+ICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICAgZWxzZQo+ICAgICAg
ICAgICAgICAgICAgewo+IC0gICAgICAgICAgICAgICAgICAgIHBsMmUgPSBsM2VfdG9fbDJlKG9s
M2UpOwo+ICsgICAgICAgICAgICAgICAgICAgIGwyX3BnZW50cnlfdCAqbDJ0Owo+ICsKPiArICAg
ICAgICAgICAgICAgICAgICBsMnQgPSBsM2VfdG9fbDJlKG9sM2UpOwoKSGVyZSBhbmQgZWxzZXdo
ZXJlIGFzc2lnbm1lbnRzIGNvdWxkIGhhdmUgYmVjb21lIHZhcmlhYmxlCmluaXRpYWxpemVycy4K
Cj4gQEAgLTUxMjMsMTIgKzUxMjcsMTIgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCj4gICAgICAg
ICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAgICAgICAgfQo+ICAKPiAtICAgICAgICAgICAg
cGwyZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKPiAtICAgICAgICAgICAgaWYgKCBwbDJlID09
IE5VTEwgKQo+ICsgICAgICAgICAgICBsMnQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7Cj4gKyAg
ICAgICAgICAgIGlmICggbDJ0ID09IE5VTEwgKQo+ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9NRU07Cj4gIAo+ICAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEwyX1BBR0VUQUJMRV9F
TlRSSUVTOyBpKysgKQo+IC0gICAgICAgICAgICAgICAgbDJlX3dyaXRlKHBsMmUgKyBpLAo+ICsg
ICAgICAgICAgICAgICAgbDJlX3dyaXRlKGwydCArIGksCgpUaGUgc3R5bGUgaGVyZSBhbmQgLi4u
Cgo+IEBAIC01MjIyLDEyICs1MjI5LDEyIEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAo+ICAgICAg
ICAgICAgICAgICAgICAgIGdvdG8gY2hlY2tfbDM7Cj4gICAgICAgICAgICAgICAgICB9Cj4gIAo+
IC0gICAgICAgICAgICAgICAgcGwxZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKPiAtICAgICAg
ICAgICAgICAgIGlmICggcGwxZSA9PSBOVUxMICkKPiArICAgICAgICAgICAgICAgIGwxdCA9IGFs
bG9jX3hlbl9wYWdldGFibGUoKTsKPiArICAgICAgICAgICAgICAgIGlmICggbDF0ID09IE5VTEwg
KQo+ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICAKPiAgICAgICAgICAg
ICAgICAgIGZvciAoIGkgPSAwOyBpIDwgTDFfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCj4gLSAg
ICAgICAgICAgICAgICAgICAgbDFlX3dyaXRlKCZwbDFlW2ldLAo+ICsgICAgICAgICAgICAgICAg
ICAgIGwxZV93cml0ZSgmbDF0W2ldLAoKLi4uIGhlcmUgKGFuZCBwZXJoYXBzIGVsc2V3aGVyZSB3
aGVuIHRvdWNoZWQgYW55d2F5KSB3b3VsZCBoYXZlCmJlZW4gbmljZSBpZiBpdCB3YXMgYnJvdWdo
dCBpbiBzeW5jIChJIGd1ZXNzIEknbSBndWlsdHkgb2YgdGhlCmRpZmZlcmVuY2UpLgoKPiBAQCAt
NTI3Miw2ICs1Mjc5LDcgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCj4gICAgICAgICAgICAgICAg
ICAgICAgKCgxdSA8PCBQQUdFVEFCTEVfT1JERVIpIC0gMSkpID09IDApKSApCj4gICAgICAgICAg
ICAgIHsKPiAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYmFzZV9tZm47Cj4gKyAgICAg
ICAgICAgICAgICBsMV9wZ2VudHJ5X3QgKmwxdDsKCmNvbnN0LCBhcyB0aGlzIGxvb2tzIHRvIGJl
IHVzZWQgZm9yIGxvb2t1cCBvbmx5PwoKPiBAQCAtNTMyNSw2ICs1MzMzLDcgQEAgaW50IG1hcF9w
YWdlc190b194ZW4oCj4gICAgICAgICAgICAgICAgICAoKDFVTCA8PCAoTDNfUEFHRVRBQkxFX1NI
SUZUIC0gUEFHRV9TSElGVCkpIC0gMSkpKSApCj4gICAgICAgICAgewo+ICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIGJhc2VfbWZuOwo+ICsgICAgICAgICAgICBsMl9wZ2VudHJ5X3QgKmwydDsK
ClNhbWUgaGVyZSB0aGVuLiBUaGVyZSBhbHNvIGxvb2sgdG8gYmUgbW9yZSBjYXNlcyBmdXJ0aGVy
IHVwIHRoYXQKSSBkaWQgbWlzcyBpbml0aWFsbHkuCgpXaGV0aGVyIHlvdSBhZGRyZXNzIHRoZSBz
dHlsZSBhc3BlY3RzIGZ1cnRoZXIgdXAgSSdsbCBsZWF2ZSB0byB5b3UsCmJ1dCBJJ2QgcmVhbGx5
IGxpa2UgdG8gc2VlIHRoZSBjb25zdC1uZXNzIGFkZGVkIHdoZXJldmVyIHBvc3NpYmxlLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
