Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6A7D1203
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 17:03:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIDR1-0002fW-RY; Wed, 09 Oct 2019 14:59:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iIDR0-0002ei-0B
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 14:59:26 +0000
X-Inumbo-ID: 61f025f8-eaa5-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61f025f8-eaa5-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 14:59:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0D10EB154;
 Wed,  9 Oct 2019 14:59:24 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <09d5e0bc-074e-90c5-f0a6-60e1be23d92f@citrix.com>
 <67e9bc2c-82dc-5fd7-9b8c-29d564a30ddb@suse.com>
 <20191009101116.GA1389@Air-de-Roger.citrite.net>
 <dd2b5da6-e1fc-a490-9276-8ad44721fa9e@suse.com>
 <20191009112927.GC1389@Air-de-Roger.citrite.net>
 <6a7fb887-84cf-cc1d-011d-f2adab4083fa@suse.com>
 <20191009135645.GD1389@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <438eba9b-3ae1-abbd-08b4-95fc78816271@suse.com>
Date: Wed, 9 Oct 2019 16:59:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009135645.GD1389@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] HPET interrupt remapping during boot
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAxNTo1NiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBP
Y3QgMDksIDIwMTkgYXQgMDI6MDM6MTJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDA5LjEwLjIwMTkgMTM6MjksIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gUmlnaHQsIHRo
ZW4gSSBndWVzcyB3ZSBlaXRoZXIgbWFzayBhbGwgdGhlIGlvLWFwaWMgcGlucyBvciB3ZSBzZXR1
cAo+Pj4gcHJvcGVyIHJlbWFwcGluZyBlbnRyaWVzIGZvciBub24tbWFza2VkIHBpbnM/IChpbiBv
cmRlciB0byBhdm9pZCBpb21tdQo+Pj4gZmF1bHRzKQo+Pgo+PiBNYWtpbmcgdGhlIEV4dEludCBl
bnRyeSBpcyBhdCBsZWFzdCB3b3J0aCBhbiBleHBlcmltZW50LCB0bwo+PiAoaG9wZWZ1bGx5KSBj
b25maXJtIHRoYXQgdGhpcyB3b3VsZCB0YWtlIGNhcmUgb2YgdGhlIElPTU1VCj4+IGZhdWx0LiBC
dXQgSSdtIGFmcmFpZCAoYXMgcGVyIGFib3ZlKSBpdCdzIG5vdCBhbiBvcHRpb24gaW4KPj4gZ2Vu
ZXJhbC4gV2hhdCBJIGNvdWxkIHNlZSB1cyBkb2luZyBpcyBtYXNrIHRoZSBlbnRyeSBpZiBhbGwK
Pj4gbGVnYWN5IElSUXMgYXJlIGhhbmRsZWQgdGhyb3VnaCB0aGUgSU8tQVBJQy4gVGhpcyB3b3Vs
ZCB0YWtlCj4+IGNhcmUgb2Ygc3B1cmlvdXMgaW50ZXJydXB0cywgYXMgdGhlc2UgYXJlIHRoZSBv
bmx5IG9uZXMKPj4gd2hpY2ggY2FuIG1ha2UgaXQgdGhyb3VnaCB3aGVuIHRoZSBQSUMgbWFzayBi
aXRzIGFyZSBhbGwgc2V0Lgo+PiBIb3dldmVyLCBtYXliZSBpdCBpcyBsZWdpdGltYXRlIHRvIG1h
c2sgdGhlIEV4dEludCBlbnRyeQo+PiB3aGVuIGFuIElPTU1VIGNvbWVzIGludG8gcGxheS4KPiAK
PiBUaGF0IHdhcyBteSB0aGlua2luZywgaWU6IG1ha2Ugc3VyZSBldmVyeSBpby1hcGljIHBpbiBp
cyBtYXNrZWQgYmVmb3JlCj4gZW5hYmxpbmcgaW9tbXUgaW50ZXJydXB0IHJlbWFwcGluZy4gTm90
aGluZyB1c2VmdWwgY2FuIGhhcHBlbiBvZgo+IGhhdmluZyBpby1hcGljIHBpbnMgdW5tYXNrZWQs
IGFzIHRoZSByZW1hcHBpbmcgaXMgbm90IHNldHVwIGFueXdheS4KPiBJZi93aGVuIHRob3NlIHBp
bnMgZ2V0IHVzZWQgYSBwcm9wZXIgcmVtYXBwaW5nIGVudHJ5IGlzIGdvaW5nIHRvIGJlCj4gc2V0
dXAsIGFuZCB0aGUgcGluIHdvdWxkIHRoZW4gYmUgdW5tYXNrZWQuCgpXZWxsLCB0aGlzIGlzbid0
IHRoZSBvbmx5IG9wdGlvbi4gQW5vdGhlciB3b3VsZCBiZSB0byB0cmFuc2Zvcm0KYWxsIHVubWFz
a2VkIGVudHJpZXMgdG8gYmUgdHJhbnNsYXRlZC4KCj4+IEFzIHRvICJwcm9wZXIiIHJlbWFwcGlu
ZyBlbnRyaWVzOiBJJ2xsIGhhdmUgdG8gbG9vayBhdCB0aGUKPj4gc3BlYyB3aGF0IHRoZXkgc2F5
IGFib3V0IHRoaXMuIFRoZXJlJ3Mgb25seSBvbmUgSVJUIGluZGV4Cj4+IHRoYXQgd2UgY2FuIHB1
dCBpbiB0aGUgUlRFLCB5ZXQgdGhpcyB3b3VsZCBuZWVkIHRvIHNlcnZlIGFsbAo+PiAxNSBJUlFz
IHBvdGVudGlhbGx5IGNvbWluZyB0aHJvdWdoIHRoZSBQSUMuIFJlY2FsbCB0aGF0IHRoZQo+PiB2
ZWN0b3IgZ2V0cyBzdXBwbGllZCBieSB0aGUgUElDIGluIHRoZSBFeHRJbnQgY2FzZSwgbm90IGJ5
Cj4+IHRoZSBJTy1BUElDIFJURS4KPiAKPiBZb3UgY2FuIHNldCB0aGUgZGVsaXZlcnkgbW9kZSBv
ZiB0aGUgSVJURSB0byBFeHRJTlQsIG11Y2ggbGlrZSBob3cgdGhpcwo+IGlzIGRvbmUgb24gdGhl
IGlvLWFwaWMsIGFuZCB0aGVuIHBva2UgdGhlIFBJQyB0byBmaWd1cmUgb3V0IHdoaWNoIElSUQo+
IHRyaWdnZXJlZD8KCkhtbSwgeWVzIC0gaXQgZGlkbid0IGV2ZW4gb2NjdXIgdG8gbWUgdGhhdCBW
VC1kIG1pZ2h0IGFsbG93CkV4dEludCBhcyBkZWxpdmVyeSBtb2RlOyB0b28gbXVjaCBBTUQgSU9N
TVUgd29yayByZWNlbnRseSwKd2hlcmUgdGhlIG9ubHkgd2F5IHRvIGRlYWwgd2l0aCBFeHRJbnQg
aXMgYSAiZG9uJ3QgcmVtYXAiCmZsYWcgaW4gdGhlIGRldmljZSB0YWJsZSBlbnRyeS4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
