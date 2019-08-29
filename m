Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4135A165E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:38:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3HmK-0006S9-KU; Thu, 29 Aug 2019 10:35:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3HmJ-0006S4-Fc
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:35:43 +0000
X-Inumbo-ID: c004e886-ca48-11e9-ae64-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c004e886-ca48-11e9-ae64-12813bfff9fa;
 Thu, 29 Aug 2019 10:35:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3538B653;
 Thu, 29 Aug 2019 10:35:41 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190820153745.40103-1-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D545BBD@SHSMSX104.ccr.corp.intel.com>
 <824ee21b-d9d9-434b-2125-25420cadfcea@suse.com>
 <20190829102620.6gut2dmpouynbj44@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9ad33ffe-ee2f-d000-505c-69162f1d6cb9@suse.com>
Date: Thu, 29 Aug 2019 12:35:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829102620.6gut2dmpouynbj44@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] p2m/ept: pass correct level to
 atomic_write_ept_entry in ept_invalidate_emt
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, JunNakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxMjoyNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBB
dWcgMjcsIDIwMTkgYXQgMDU6MjM6MzNQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDIzLjA4LjIwMTkgMDc6NTgsICBUaWFuLCBLZXZpbiAgd3JvdGU6Cj4+Pj4gRnJvbTogUm9nZXIg
UGF1IE1vbm5lIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5jb21dCj4+Pj4gU2VudDogVHVlc2Rh
eSwgQXVndXN0IDIwLCAyMDE5IDExOjM4IFBNCj4+Pj4KPj4+PiBUaGUgbGV2ZWwgcGFzc2VkIHRv
IGVwdF9pbnZhbGlkYXRlX2VtdCBjb3JyZXNwb25kcyB0byB0aGUgRVBUIGVudHJ5Cj4+Pj4gcGFz
c2VkIGFzIHRoZSBtZm4gcGFyYW1ldGVyLCB3aGljaCBpcyBhIHBvaW50ZXIgdG8gYW4gRVBUIHBh
Z2UgdGFibGUsCj4+Pj4gaGVuY2UgdGhlIGVudHJpZXMgaW4gdGhhdCBwYWdlIHRhYmxlIHdpbGwg
aGF2ZSBvbmUgbGV2ZWwgbGVzcyB0aGFuIHRoZQo+Pj4+IHBhcmVudC4KPj4+Pgo+Pj4+IEZpeCB0
aGUgY2FsbCB0byBhdG9taWNfd3JpdGVfZXB0X2VudHJ5IHRvIHBhc3MgdGhlIGNvcnJlY3QgbGV2
ZWwsIGllOgo+Pj4+IG9uZSBsZXZlbCBsZXNzIHRoYW4gdGhlIHBhcmVudC4KPj4+Pgo+Pj4+IEZp
eGVzOiA1MGZlNmU3MzcwNSAoJ3B2aCBkb20wOiBhZGQgYW5kIHJlbW92ZSBmb3JlaWduIHBhZ2Vz
JykKPj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPj4+PiAtLS0KPj4+PiBDYzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwu
Y29tPgo+Pj4+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPj4+PiBDYzog
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgo+Pj4+IENjOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+Pj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+Pj4g
Q2M6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPj4+PiBDYzogUGF1
bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPj4+PiAtLS0KPj4+PiAgIHhlbi9h
cmNoL3g4Ni9tbS9wMm0tZXB0LmMgfCAyICstCj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvbW0vcDJtLWVwdC5jIGIveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYwo+Pj4+IGluZGV4IDZi
ODQ2OGM3OTMuLjIzYWU2ZTlkYTMgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3Ay
bS1lcHQuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMKPj4+PiBAQCAtMzY3
LDcgKzM2Nyw3IEBAIHN0YXRpYyBib29sX3QgZXB0X2ludmFsaWRhdGVfZW10KHN0cnVjdCBwMm1f
ZG9tYWluCj4+Pj4gKnAybSwgbWZuX3QgbWZuLAo+Pj4+ICAgICAgICAgICBlLmVtdCA9IE1UUlJf
TlVNX1RZUEVTOwo+Pj4+ICAgICAgICAgICBpZiAoIHJlY2FsYyApCj4+Pj4gICAgICAgICAgICAg
ICBlLnJlY2FsYyA9IDE7Cj4+Pj4gLSAgICAgICAgcmMgPSBhdG9taWNfd3JpdGVfZXB0X2VudHJ5
KHAybSwgJmVwdGVbaV0sIGUsIGxldmVsKTsKPj4+PiArICAgICAgICByYyA9IGF0b21pY193cml0
ZV9lcHRfZW50cnkocDJtLCAmZXB0ZVtpXSwgZSwgbGV2ZWwgLSAxKTsKPj4+PiAgICAgICAgICAg
QVNTRVJUKHJjID09IDApOwo+Pj4+ICAgICAgICAgICBjaGFuZ2VkID0gMTsKPj4+PiAgICAgICB9
Cj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPi4K
Pj4+Cj4+PiBPbmUgc21hbGwgY29tbWVudCBhYm91dCByZWFkYWJpbGl0eS4gV2hhdCBhYm91dCBy
ZW5hbWluZyAnbGV2ZWwnCj4+PiB0byAncGFyZW50X2xldmVsJyBpbiB0aGlzIGZ1bmN0aW9uPwo+
Pgo+PiBBbmQgYWxzbyB0YWtpbmcgdGhlIG9wcG9ydHVuaXR5IGFuZCBtYWtpbmcgaXQgdW5zaWdu
ZWQgaW50Pwo+IAo+IEkndmUgYmVlbiB0aGlua2luZyBhYm91dCB0aGlzLCBhbmQgSSdtIG5vdCBz
dXJlIHJlbmFtaW5nIGxldmVsIHRvCj4gcGFyZW50X2xldmVsIGlzIGNvcnJlY3QsIGxldmVsIGFj
dHVhbGx5IG1hdGNoZXMgdGhlIGxldmVsIG9mIHRoZSBtZm4KPiBhbHNvIHBhc3NlZCBhcyBhIHBh
cmFtZXRlciwgYW5kIGhlbmNlIGl0J3MgY29ycmVjdC4gSXQncyB0aGUgZnVuY3Rpb24KPiBpdHNl
bGYgdGhhdCBhY3R1YWxseSBpdGVyYXRlcyBvdmVyIHRoZSBwYWdlIHRhYmxlIGVudHJpZXMsIGFu
ZCBoZW5jZQo+IGRlc2NlbmRzIG9uZSBsZXZlbCBpbnRvIHRoZSBwYWdlIHRhYmxlcy4KPiAKPiBp
ZTogSSBjb3VsZCBhZGQgc29tZXRoaW5nIGxpa2UgQVNTRVJUKGxldmVsKSB0byBtYWtlIHN1cmUg
bm8gbGV2ZWwgMAo+IGVudHJpZXMgYXJlIHBhc3NlZCB0byB0aGUgZnVuY3Rpb24sIGJ1dCByZW5h
bWluZyBkb2Vzbid0IHNlZW0gY29ycmVjdAo+IHRvIG1lLgoKSG1tLCBJJ20gYWZyYWlkIEkndmUg
bWFkZSB0aGUgY2hhbmdlIGFzIHJlcXVlc3RlZCBieSBLZXZpbiB3aGlsZQpjb21taXR0aW5nLiBQ
ZXJzb25hbGx5IEkgdGhpbmsgZWl0aGVyIG5hbWUgaXMgZmluZSwgYnV0IGlmIEtldmluCmFncmVl
cyB3aXRoIHlvdXIgcmVzcG9uc2UsIHRoZW4gbWF5YmUgd2Ugc2hvdWxkIHVuZG8gdGhhdCBhZGp1
c3RtZW50LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
