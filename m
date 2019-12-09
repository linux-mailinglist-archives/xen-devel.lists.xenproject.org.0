Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E48116EF3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:32:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieK3B-0000fv-4g; Mon, 09 Dec 2019 14:30:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieK39-0000fp-DH
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:30:11 +0000
X-Inumbo-ID: 662d44e7-1a90-11ea-87e5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 662d44e7-1a90-11ea-87e5-12813bfff9fa;
 Mon, 09 Dec 2019 14:30:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DDA38AC3C;
 Mon,  9 Dec 2019 14:30:08 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191204162025.37510-1-roger.pau@citrix.com>
 <20191204162025.37510-3-roger.pau@citrix.com>
 <b4f32391-894b-a781-ad54-39d53d3bf728@suse.com>
 <20191209102502.GO980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d37b893-436a-ac5e-2977-5996f29c8205@suse.com>
Date: Mon, 9 Dec 2019 15:30:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209102502.GO980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/4] x86/apic: force phys mode if
 interrupt remapping is disabled
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxMToyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIERl
YyAwNSwgMjAxOSBhdCAxMDozMjozNEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDQuMTIuMjAxOSAxNzoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gQ2x1c3RlciBtb2Rl
IGNhbiBvbmx5IGJlIHVzZWQgd2l0aCBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1cHBvcnQsIHNpbmNl
Cj4+PiB0aGUgdG9wIDE2Yml0cyBvZiB0aGUgQVBJQyBJRCBhcmUgZmlsbGVkIHdpdGggdGhlIGNs
dXN0ZXIgSUQsIGFuZAo+Pj4gaGVuY2Ugb24gc3lzdGVtcyB3aGVyZSB0aGUgcGh5c2ljYWwgSUQg
aXMgc3RpbGwgc21hbGxlciB0aGFuIDI1NSB0aGUKPj4+IGNsdXN0ZXIgSUQgaXMgbm90LiBGb3Jj
ZSB4MkFQSUMgdG8gdXNlIHBoeXNpY2FsIG1vZGUgaWYgdGhlcmUncyBubwo+Pj4gaW50ZXJydXB0
IHJlbWFwcGluZyBzdXBwb3J0Lgo+Pj4KPj4+IE5vdGUgdGhhdCB0aGlzIHJlcXVpcmVzIGEgZnVy
dGhlciBwYXRjaCBpbiBvcmRlciB0byBlbmFibGUgeDJBUElDCj4+PiB3aXRob3V0IGludGVycnVw
dCByZW1hcHBpbmcgc3VwcG9ydC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4KPj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gYWxiZWl0IC4uLgo+Pgo+Pj4gLS0tIGEveGVuL2FyY2gv
eDg2L2dlbmFwaWMveDJhcGljLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9nZW5hcGljL3gyYXBp
Yy5jCj4+PiBAQCAtMjI2LDcgKzIyNiwyMyBAQCBib29sZWFuX3BhcmFtKCJ4MmFwaWNfcGh5cyIs
IHgyYXBpY19waHlzKTsKPj4+ICBjb25zdCBzdHJ1Y3QgZ2VuYXBpYyAqX19pbml0IGFwaWNfeDJh
cGljX3Byb2JlKHZvaWQpCj4+PiAgewo+Pj4gICAgICBpZiAoIHgyYXBpY19waHlzIDwgMCApCj4+
PiAtICAgICAgICB4MmFwaWNfcGh5cyA9ICEhKGFjcGlfZ2JsX0ZBRFQuZmxhZ3MgJiBBQ1BJX0ZB
RFRfQVBJQ19QSFlTSUNBTCk7Cj4+PiArICAgIHsKPj4+ICsgICAgICAgIGlmICggIWlvbW11X2lu
dHJlbWFwICkKPj4+ICsgICAgICAgICAgICAvKgo+Pj4gKyAgICAgICAgICAgICAqIEZvcmNlIHBo
eXNpY2FsIG1vZGUgaWYgdGhlcmUncyBubyBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1cHBvcnQ6Cj4+
PiArICAgICAgICAgICAgICogdGhlIElEIGluIGNsdXN0ZXJlZCBtb2RlIHJlcXVpcmVzIGEgMzIg
Yml0IGRlc3RpbmF0aW9uIGZpZWxkIGR1ZQo+Pj4gKyAgICAgICAgICAgICAqIHRvIHRoZSB1c2Fn
ZSBvZiB0aGUgaGlnaCAxNiBiaXRzIHRvIHN0b3JlIHRoZSBjbHVzdGVyIElELgo+Pj4gKyAgICAg
ICAgICAgICAqLwo+Pj4gKyAgICAgICAgICAgIHgyYXBpY19waHlzID0gdHJ1ZTsKPj4+ICsgICAg
ICAgIGVsc2UKPj4+ICsgICAgICAgICAgICB4MmFwaWNfcGh5cyA9ICEhKGFjcGlfZ2JsX0ZBRFQu
ZmxhZ3MgJiBBQ1BJX0ZBRFRfQVBJQ19QSFlTSUNBTCk7Cj4+Cj4+IC4uLiBJIHdvbmRlciB3aHkg
eW91IGRpZG4ndCBtYWtlIHRoaXMKPj4KPj4gICAgICAgICB4MmFwaWNfcGh5cyA9ICFpb21tdV9p
bnRyZW1hcCB8fCAoYWNwaV9nYmxfRkFEVC5mbGFncyAmIEFDUElfRkFEVF9BUElDX1BIWVNJQ0FM
KTsKPj4KPj4gKG5vdCB0aGUgbGVhc3QgYmVjYXVzZSBvZiBhbGxvd2luZyB0byBkcm9wIHRoZSBz
b21ld2hhdCB1Z2x5ICEhKS4KPiAKPiBGZWVsIGZyZWUgdG8gZG8gaXQgYXQgY29tbWl0IChhbmQg
cmVpbmRlbnQgdGhlIGNvbW1lbnQpLCBvciBlbHNlIEkgY2FuCj4gcmVzZW5kIGEgbmV3IHZlcnNp
b24gaWYgdGhhdCdzIHRvbyBpbnRydXNpdmUuCgpEb2luZyB0aGVzZSBhZGp1c3RtZW50cyBhdCBj
b21taXQgdGltZSBvdWdodCB0byBiZSBmaW5lLiBJdCdzCmp1c3QgdGhhdCBJJ2QgcHJlZmVyIHRv
IHdhaXQgd2l0aCBjb21taXR0aW5nIHRoaXMgc2VyaWVzIHVudGlsCjQuMTMgaXMgZnVsbHkgZmlu
aXNoZWQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
