Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A9168098
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:44:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59VB-0003EC-9Z; Fri, 21 Feb 2020 14:42:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j59V9-0003E2-HS
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:41:59 +0000
X-Inumbo-ID: 5023136c-54b8-11ea-aa99-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5023136c-54b8-11ea-aa99-bc764e2007e4;
 Fri, 21 Feb 2020 14:41:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 64C8FAD61;
 Fri, 21 Feb 2020 14:41:57 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <20200221142635.GA4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41526075-cab4-064b-dbd5-3d4667bb6309@suse.com>
Date: Fri, 21 Feb 2020 15:41:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221142635.GA4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxNToyNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyMSwgMjAyMCBhdCAwMjozNjo1MlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjEuMDIuMjAyMCAxMDoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFRodSwgRmVi
IDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBI
aSwKPj4+Pgo+Pj4+IE9uIDIwLzAyLzIwMjAgMTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToK
Pj4+Pj4gQWxsb3cgYSBDUFUgYWxyZWFkeSBob2xkaW5nIHRoZSBsb2NrIGluIHdyaXRlIG1vZGUg
dG8gYWxzbyBsb2NrIGl0IGluCj4+Pj4+IHJlYWQgbW9kZS4gVGhlcmUncyBubyBoYXJtIGluIGFs
bG93aW5nIHJlYWQgbG9ja2luZyBhIHJ3bG9jayB0aGF0J3MKPj4+Pj4gYWxyZWFkeSBvd25lZCBi
eSB0aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4+Pj4+
IGFjY2Vzc2VzIGlzIHJlcXVpcmVkIGF0IGxlYXN0IGZvciB0aGUgQ1BVIG1hcHMgdXNlLWNhc2Uu
Cj4+Pj4+Cj4+Pj4+IEluIG9yZGVyIHRvIGRvIHRoaXMgcmVzZXJ2ZSAxNGJpdHMgb2YgdGhlIGxv
Y2ssIHRoaXMgYWxsb3dzIHRvIHN1cHBvcnQKPj4+Pj4gdXAgdG8gMTYzODQgQ1BVcy4gQWxzbyBy
ZWR1Y2UgdGhlIHdyaXRlIGxvY2sgbWFzayB0byAyIGJpdHM6IG9uZSB0bwo+Pj4+PiBzaWduYWwg
dGhlcmUgYXJlIHBlbmRpbmcgd3JpdGVycyB3YWl0aW5nIG9uIHRoZSBsb2NrIGFuZCB0aGUgb3Ro
ZXIgdG8KPj4+Pj4gc2lnbmFsIHRoZSBsb2NrIGlzIG93bmVkIGluIHdyaXRlIG1vZGUuIE5vdGUg
dGhlIHdyaXRlIHJlbGF0ZWQgZGF0YQo+Pj4+PiBpcyB1c2luZyAxNmJpdHMsIHRoaXMgaXMgZG9u
ZSBpbiBvcmRlciB0byBiZSBhYmxlIHRvIGNsZWFyIGl0IChhbmQKPj4+Pj4gdGh1cyByZWxlYXNl
IHRoZSBsb2NrKSB1c2luZyBhIDE2Yml0IGF0b21pYyB3cml0ZS4KPj4+Pj4KPj4+Pj4gVGhpcyBy
ZWR1Y2VzIHRoZSBtYXhpbXVtIG51bWJlciBvZiBjb25jdXJyZW50IHJlYWRlcnMgZnJvbSAxNjc3
NzIxNiB0bwo+Pj4+PiA2NTUzNiwgSSB0aGluayB0aGlzIHNob3VsZCBzdGlsbCBiZSBlbm91Z2gs
IG9yIGVsc2UgdGhlIGxvY2sgZmllbGQKPj4+Pj4gY2FuIGJlIGV4cGFuZGVkIGZyb20gMzIgdG8g
NjRiaXRzIGlmIGFsbCBhcmNoaXRlY3R1cmVzIHN1cHBvcnQgYXRvbWljCj4+Pj4+IG9wZXJhdGlv
bnMgb24gNjRiaXQgaW50ZWdlcnMuCj4+Pj4KPj4+PiBGV0lXLCBhcm0zMiBpcyBhYmxlIHRvIHN1
cHBvcnQgYXRvbWljIG9wZXJhdGlvbnMgb24gNjQtYml0IGludGVnZXJzLgo+Pj4+Cj4+Pj4+ICAg
c3RhdGljIGlubGluZSB2b2lkIF93cml0ZV91bmxvY2socndsb2NrX3QgKmxvY2spCj4+Pj4+ICAg
ewo+Pj4+PiAtICAgIC8qCj4+Pj4+IC0gICAgICogSWYgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9t
aWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5Lgo+Pj4+PiAtICAgICAqIE90aGVyd2lzZSwg
YW4gYXRvbWljIHN1YnRyYWN0aW9uIHdpbGwgYmUgdXNlZCB0byBjbGVhciBpdC4KPj4+Pj4gLSAg
ICAgKi8KPj4+Pj4gLSAgICBhdG9taWNfc3ViKF9RV19MT0NLRUQsICZsb2NrLT5jbnRzKTsKPj4+
Pj4gKyAgICAvKiBTaW5jZSB0aGUgd3JpdGVyIGZpZWxkIGlzIGF0b21pYywgaXQgY2FuIGJlIGNs
ZWFyZWQgZGlyZWN0bHkuICovCj4+Pj4+ICsgICAgQVNTRVJUKF9pc193cml0ZV9sb2NrZWRfYnlf
bWUoYXRvbWljX3JlYWQoJmxvY2stPmNudHMpKSk7Cj4+Pj4+ICsgICAgQlVJTERfQlVHX09OKF9R
Ul9TSElGVCAhPSAxNik7Cj4+Pj4+ICsgICAgd3JpdGVfYXRvbWljKCh1aW50MTZfdCAqKSZsb2Nr
LT5jbnRzLCAwKTsKPj4+Pgo+Pj4+IEkgdGhpbmsgdGhpcyBpcyBhbiBhYnVzZSB0byBjYXN0IGFu
IGF0b21pY190KCkgZGlyZWN0bHkgaW50byBhIHVpbnQxNl90LiBZb3UKPj4+PiB3b3VsZCBhdCBs
ZWFzdCB3YW50IHRvIHVzZSAmbG9jay0+Y250cy5jb3VudGVyIGhlcmUuCj4+Pgo+Pj4gU3VyZSwg
SSB3YXMgd29uZGVyaW5nIGFib3V0IHRoaXMgbXlzZWxmLgo+Pj4KPj4+IFdpbGwgd2FpdCBmb3Ig
bW9yZSBjb21tZW50cywgbm90IHN1cmUgd2hldGhlciB0aGlzIGNhbiBiZSBmaXhlZCB1cG9uCj4+
PiBjb21taXQgaWYgdGhlcmUgYXJlIG5vIG90aGVyIGlzc3Vlcy4KPj4KPj4gSXQncyBtb3JlIHRo
YW4ganVzdCBhZGRpbmcgYW5vdGhlciBmaWVsZCBzcGVjaWZpZXIgaGVyZS4gQSBjYXN0IGxpa2UK
Pj4gdGhpcyBvbmUgaXMgZW5kaWFubmVzcy11bnNhZmUsIGFuZCBoZW5jZSBhIHRyYXAgd2FpdGlu
ZyBmb3IgYSBiaWcKPj4gZW5kaWFuIHBvcnQgYXR0ZW1wdCB0byBmYWxsIGludG8uIEF0IHRoZSB2
ZXJ5IGxlYXN0IHRoaXMgc2hvdWxkIGNhdXNlCj4+IGEgYnVpbGQgZmFpbHVyZSBvbiBiaWcgZW5k
aWFuIHN5c3RlbXMsIGV2ZW4gYmV0dGVyIHdvdWxkIGJlIGlmIGl0IHdhcwo+PiBlbmRpYW5uZXNz
LXNhZmUuCj4gCj4gV2h5IGRvbid0IHdlIGxlYXZlIHRoZSBhdG9taWNfZGVjIHRoZW4/CgpCZWNh
dXNlIHlvdSBuZWVkIHRvIGludm9rZSBzbXBfcHJvY2Vzc29yX2lkKCkgdG8gY2FsY3VsYXRlIHRo
ZSB2YWx1ZQp0byB1c2UgaW4gdGhlIHN1YnRyYWN0aW9uLiBJJ20gbm90IG1lYW5pbmcgdG8gc2F5
IEknbSBlbnRpcmVseQpvcHBvc2VkIChzZWVpbmcgaG93IG11Y2ggb2YgYSBkaXNjdXNzaW9uIHdl
J3JlIGhhdmluZyksIGJ1dCB0aGUKInNpbXBsZSB3cml0ZSBvZiB6ZXJvIiBhcHByb2FjaCBpcyBj
ZXJ0YWlubHkgYXBwZWFsaW5nLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
