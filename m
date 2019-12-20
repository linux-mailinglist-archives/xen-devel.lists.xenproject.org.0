Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AF6127B06
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 13:27:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiHKM-0008IO-IR; Fri, 20 Dec 2019 12:24:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiHKL-0008IJ-E1
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 12:24:17 +0000
X-Inumbo-ID: a3282550-2323-11ea-9345-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3282550-2323-11ea-9345-12813bfff9fa;
 Fri, 20 Dec 2019 12:24:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 199F0B21E;
 Fri, 20 Dec 2019 12:24:15 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191219094236.22002-1-aisaila@bitdefender.com>
 <b37fe84e-fe6f-9db4-ac5d-3dfbf7811470@suse.com>
 <9f1b936d-8a3c-8ef3-a184-c0846b01d250@bitdefender.com>
 <fcfd9555-9e02-5405-443a-e3f981f06494@suse.com>
 <d0b0e561-a2b2-ccc9-0d52-60615530dbe6@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a52e719e-46bf-b3f2-ccde-a6ec3d3f6700@suse.com>
Date: Fri, 20 Dec 2019 13:24:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d0b0e561-a2b2-ccc9-0d52-60615530dbe6@bitdefender.com>
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

T24gMjAuMTIuMjAxOSAxMjo0OSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMjAuMTIuMjAxOSAxMTozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIwLjEyLjIw
MTkgMTA6MDksIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAx
OS4xMi4yMDE5IDEyOjQzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxOS4xMi4yMDE5IDEw
OjQyLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPj4+Pj4gVGhpcyBwYXRjaCBhaW1z
IHRvIHNhbml0aXplIGluZGV4ZXMsIHBvdGVudGlhbGx5IGd1ZXN0IHByb3ZpZGVkCj4+Pj4+IHZh
bHVlcywgZm9yIGFsdHAybV9lcHRwW10gYW5kIGFsdHAybV9wMm1bXSBhcnJheXMuCj4+Pj4+Cj4+
Pj4+IFJlcXVlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4K
Pj4+Pj4gLS0tCj4+Pj4+IENDOiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRl
ci5jb20+Cj4+Pj4+IENDOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4+
Pj4+IENDOiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPgo+Pj4+
PiBDQzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgo+Pj4+PiBD
QzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+PiBDQzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4+Pj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+Cj4+Pj4+IENDOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
Pj4+PiBDQzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPgo+Pj4+PiBDQzog
S2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBDaGFuZ2Vz
IHNpbmNlIFY0Ogo+Pj4+PiAJLSBDaGFuZ2UgYm91bmRzIGNoZWNrIGZyb20gTUFYX0VQVFAgdG8g
TUFYX0FMVFAyTQo+Pj4+PiAJLSBNb3ZlIGFycmF5X2luZGV4X25vc3BlYygpIGNsb3NlciB0byB0
aGUgYm91bmRzIGNoZWNrLgo+Pj4+PiAtLS0KPj4+Pj4gICAgeGVuL2FyY2gveDg2L21tL21lbV9h
Y2Nlc3MuYyB8IDE1ICsrKysrKysrKy0tLS0tLQo+Pj4+PiAgICB4ZW4vYXJjaC94ODYvbW0vcDJt
LmMgICAgICAgIHwgMjAgKysrKysrKysrKysrKystLS0tLS0KPj4+Pj4gICAgMiBmaWxlcyBjaGFu
Z2VkLCAyMyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVt
X2FjY2Vzcy5jCj4+Pj4+IGluZGV4IDMyMGI5ZmU2MjEuLjMzZTM3OWRiOGYgMTAwNjQ0Cj4+Pj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPj4+Pj4gKysrIGIveGVuL2FyY2gv
eDg2L21tL21lbV9hY2Nlc3MuYwo+Pj4+PiBAQCAtMzY3LDEwICszNjcsMTEgQEAgbG9uZyBwMm1f
c2V0X21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCB1aW50MzJfdCBuciwK
Pj4+Pj4gICAgICAgIGlmICggYWx0cDJtX2lkeCApCj4+Pj4+ICAgICAgICB7Cj4+Pj4+ICAgICAg
ICAgICAgaWYgKCBhbHRwMm1faWR4ID49IE1BWF9BTFRQMk0gfHwKPj4+Cj4+PiBPaywgc28gaGF2
ZSBpZiAoIGFsdHAybV9pZHggPj0gIG1pbihBUlJBWV9TSVpFKGQtPmFyY2guYWx0cDJtX2VwdHAp
LAo+Pj4gTUFYX0VQVFApIHx8Cj4+PiBoZXJlIGFuZCB0aGVuLi4uCgpUaGUgMXN0IGFyZyB0byBt
aW4oKSBlcXVhbHMgdGhlIDJuZCwgd2hpY2ggaXMgLi4uCgo+Pj4+PiAtICAgICAgICAgICAgIGQt
PmFyY2guYWx0cDJtX2VwdHBbYWx0cDJtX2lkeF0gPT0gbWZuX3goSU5WQUxJRF9NRk4pICkKPj4+
Pj4gKyAgICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FycmF5X2luZGV4X25vc3BlYyhh
bHRwMm1faWR4LCBNQVhfQUxUUDJNKV0gPT0KPj4+Cj4+PiBoYXZlIE1BWF9FUFRQIGhlcmUgYW5k
IC4uLgo+Pj4KPj4+Pgo+Pj4+IEFzIGltcGxpZWQgYnkgYSByZXBseSB0byB2NCwgdGhpcyBpcyBz
dGlsbCBsYXRlbnRseSBidWdneTogVGhlcmUncwo+Pj4+IG5vIGd1YXJhbnRlZSBhbnlvbmUgd2ls
bCBub3RpY2UgdGhlIGlzc3VlIGhlcmUgd2hlbiBidW1waW5nCj4+Pj4gTUFYX0FMVFAyTSBwYXN0
IE1BWF9FUFRQLiBUaGUgb25seSBmdXR1cmUgcHJvb2YgdGhpbmcgdG8gZG8gaGVyZQo+Pj4+IGlz
LCBhcyBzdWdnZXN0ZWQsIHVzaW5nIHNvbWUgZm9ybSBvZiBtaW4oTUFYX0FMVFAyTSwgTUFYX0VQ
VFApIGluCj4+Pj4gdGhlIGFjdHVhbCBib3VuZHMgY2hlY2suIFRoZW4gZWFjaCBhcnJheSBhY2Nl
c3MgaXRzZWxmIGNhbiBiZSBtYWRlCj4+Pj4gdXNlIHRoZSBjb3JyZWN0IGJvdW5kLiBJbiBmYWN0
IHlvdSdkIHByb2JhYmx5IGhhdmUgbm90aWNlZCB0aGlzIGlmCj4+Pj4geW91IGhhZCBtYWRlIHVz
ZSBvZiBhcnJheV9hY2Nlc3Nfbm9zcGVjKCkgd2hlcmUgcG9zc2libGUgKHdoaWNoCj4+Pj4gYWxz
byB3b3VsZCBoZWxwIHJlYWRhYmlsaXR5KSAtIGFwcGFyZW50bHkgbm90IGhlcmUsIGJ1dCAuLi4g
Pgo+Pj4+PiArICAgICAgICAgICAgIG1mbl94KElOVkFMSURfTUZOKSApCj4+Pj4+ICAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+PiAgICAKPj4+Pj4gLSAgICAgICAgYXAybSA9IGQt
PmFyY2guYWx0cDJtX3AybVthbHRwMm1faWR4XTsKPj4+Pj4gKyAgICAgICAgYXAybSA9IGQtPmFy
Y2guYWx0cDJtX3AybVthcnJheV9pbmRleF9ub3NwZWMoYWx0cDJtX2lkeCwgTUFYX0FMVFAyTSld
Owo+Pj4KPj4+IE1BWF9BTFRQMk0gaGVyZSA/Cj4+Cj4+IFllcywgdGhhdCdzIGhvdyBJIHRoaW5r
IGl0IG91Z2h0IHRvIGJlLiBHaXZlIG90aGVycyBhIGNoYW5jZSB0bwo+PiBkaXNhZ3JlZSB3aXRo
IG1lLCB0aG91Z2guCj4+Cj4gCj4gVGhlcmUgaXMgYSBzbGlnaHQgcHJvYmxlbSB3aXRoIHVzaW5n
IChBUlJBWV9TSVpFKC4uKSkgaXQgd2lsbCBnaXZlIAo+ICJlcnJvcjogc3RhdGljIGFzc2VydGlv
biBmYWlsZWQ6IiBvbiAgX19tdXN0X2JlX2FycmF5KHgpIGJlY2F1c2UgCj4gZC0+YXJjaC5hbHRw
Mm1fZXB0cCBpcyBub3Qgc3RhdGljLgoKLi4uIGNhdXNpbmcgdGhpcy4gT25jZSB5b3UgdXNlIHRo
ZSBjb3JyZWN0IGFycmF5IGFib3ZlLCBJIHRoaW5rCnRoaW5ncyB3aWxsIHdvcmsuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
