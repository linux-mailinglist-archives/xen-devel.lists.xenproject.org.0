Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93478127865
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 10:42:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiEki-00021g-Bt; Fri, 20 Dec 2019 09:39:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiEkg-00021b-Tk
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 09:39:18 +0000
X-Inumbo-ID: 96eeea9c-230c-11ea-9319-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96eeea9c-230c-11ea-9319-12813bfff9fa;
 Fri, 20 Dec 2019 09:39:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AE7B8AD94;
 Fri, 20 Dec 2019 09:39:15 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191219094236.22002-1-aisaila@bitdefender.com>
 <b37fe84e-fe6f-9db4-ac5d-3dfbf7811470@suse.com>
 <9f1b936d-8a3c-8ef3-a184-c0846b01d250@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fcfd9555-9e02-5405-443a-e3f981f06494@suse.com>
Date: Fri, 20 Dec 2019 10:39:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9f1b936d-8a3c-8ef3-a184-c0846b01d250@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTIuMjAxOSAxMDowOSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMTkuMTIuMjAxOSAxMjo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE5LjEyLjIw
MTkgMTA6NDIsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gVGhpcyBwYXRjaCBh
aW1zIHRvIHNhbml0aXplIGluZGV4ZXMsIHBvdGVudGlhbGx5IGd1ZXN0IHByb3ZpZGVkCj4+PiB2
YWx1ZXMsIGZvciBhbHRwMm1fZXB0cFtdIGFuZCBhbHRwMm1fcDJtW10gYXJyYXlzLgo+Pj4KPj4+
IFJlcXVlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4gU2lnbmVk
LW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4+PiAt
LS0KPj4+IENDOiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4+
PiBDQzogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+Pj4gQ0M6IFBldHJl
IFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+Cj4+PiBDQzogR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgo+Pj4gQ0M6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPj4+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+Pj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+PiBDQzogIlJvZ2VyIFBh
dSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+IENDOiBKdW4gTmFrYWppbWEgPGp1
bi5uYWthamltYUBpbnRlbC5jb20+Cj4+PiBDQzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRl
bC5jb20+Cj4+PiAtLS0KPj4+IENoYW5nZXMgc2luY2UgVjQ6Cj4+PiAJLSBDaGFuZ2UgYm91bmRz
IGNoZWNrIGZyb20gTUFYX0VQVFAgdG8gTUFYX0FMVFAyTQo+Pj4gCS0gTW92ZSBhcnJheV9pbmRl
eF9ub3NwZWMoKSBjbG9zZXIgdG8gdGhlIGJvdW5kcyBjaGVjay4KPj4+IC0tLQo+Pj4gICB4ZW4v
YXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIHwgMTUgKysrKysrKysrLS0tLS0tCj4+PiAgIHhlbi9h
cmNoL3g4Ni9tbS9wMm0uYyAgICAgICAgfCAyMCArKysrKysrKysrKysrKy0tLS0tLQo+Pj4gICAy
IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2
L21tL21lbV9hY2Nlc3MuYwo+Pj4gaW5kZXggMzIwYjlmZTYyMS4uMzNlMzc5ZGI4ZiAxMDA2NDQK
Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9tZW1fYWNjZXNzLmMKPj4+IEBAIC0zNjcsMTAgKzM2NywxMSBAQCBsb25nIHAybV9z
ZXRfbWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIHVpbnQzMl90IG5yLAo+
Pj4gICAgICAgaWYgKCBhbHRwMm1faWR4ICkKPj4+ICAgICAgIHsKPj4+ICAgICAgICAgICBpZiAo
IGFsdHAybV9pZHggPj0gTUFYX0FMVFAyTSB8fAo+IAo+IE9rLCBzbyBoYXZlIGlmICggYWx0cDJt
X2lkeCA+PSAgbWluKEFSUkFZX1NJWkUoZC0+YXJjaC5hbHRwMm1fZXB0cCksIAo+IE1BWF9FUFRQ
KSB8fAo+IGhlcmUgYW5kIHRoZW4uLi4KPiAKPj4+IC0gICAgICAgICAgICAgZC0+YXJjaC5hbHRw
Mm1fZXB0cFthbHRwMm1faWR4XSA9PSBtZm5feChJTlZBTElEX01GTikgKQo+Pj4gKyAgICAgICAg
ICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FycmF5X2luZGV4X25vc3BlYyhhbHRwMm1faWR4LCBN
QVhfQUxUUDJNKV0gPT0KPiAKPiBoYXZlIE1BWF9FUFRQIGhlcmUgYW5kIC4uLgo+IAo+Pgo+PiBB
cyBpbXBsaWVkIGJ5IGEgcmVwbHkgdG8gdjQsIHRoaXMgaXMgc3RpbGwgbGF0ZW50bHkgYnVnZ3k6
IFRoZXJlJ3MKPj4gbm8gZ3VhcmFudGVlIGFueW9uZSB3aWxsIG5vdGljZSB0aGUgaXNzdWUgaGVy
ZSB3aGVuIGJ1bXBpbmcKPj4gTUFYX0FMVFAyTSBwYXN0IE1BWF9FUFRQLiBUaGUgb25seSBmdXR1
cmUgcHJvb2YgdGhpbmcgdG8gZG8gaGVyZQo+PiBpcywgYXMgc3VnZ2VzdGVkLCB1c2luZyBzb21l
IGZvcm0gb2YgbWluKE1BWF9BTFRQMk0sIE1BWF9FUFRQKSBpbgo+PiB0aGUgYWN0dWFsIGJvdW5k
cyBjaGVjay4gVGhlbiBlYWNoIGFycmF5IGFjY2VzcyBpdHNlbGYgY2FuIGJlIG1hZGUKPj4gdXNl
IHRoZSBjb3JyZWN0IGJvdW5kLiBJbiBmYWN0IHlvdSdkIHByb2JhYmx5IGhhdmUgbm90aWNlZCB0
aGlzIGlmCj4+IHlvdSBoYWQgbWFkZSB1c2Ugb2YgYXJyYXlfYWNjZXNzX25vc3BlYygpIHdoZXJl
IHBvc3NpYmxlICh3aGljaAo+PiBhbHNvIHdvdWxkIGhlbHAgcmVhZGFiaWxpdHkpIC0gYXBwYXJl
bnRseSBub3QgaGVyZSwgYnV0IC4uLiA+Cj4+PiArICAgICAgICAgICAgIG1mbl94KElOVkFMSURf
TUZOKSApCj4+PiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gICAKPj4+IC0gICAg
ICAgIGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYWx0cDJtX2lkeF07Cj4+PiArICAgICAgICBh
cDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5X2luZGV4X25vc3BlYyhhbHRwMm1faWR4LCBN
QVhfQUxUUDJNKV07Cj4gCj4gTUFYX0FMVFAyTSBoZXJlID8KClllcywgdGhhdCdzIGhvdyBJIHRo
aW5rIGl0IG91Z2h0IHRvIGJlLiBHaXZlIG90aGVycyBhIGNoYW5jZSB0bwpkaXNhZ3JlZSB3aXRo
IG1lLCB0aG91Z2guCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
