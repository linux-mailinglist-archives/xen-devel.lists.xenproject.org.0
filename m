Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CF5AB7E0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 14:10:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6D26-00033E-1B; Fri, 06 Sep 2019 12:08:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6D24-000339-JM
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 12:08:04 +0000
X-Inumbo-ID: f96e338c-d09e-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f96e338c-d09e-11e9-a337-bc764e2007e4;
 Fri, 06 Sep 2019 12:08:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 576B5ABE3;
 Fri,  6 Sep 2019 12:08:01 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ac7a20e8-9e5e-f664-1d7f-d59105f90223@suse.com>
 <20190906093707.wn5zn4nzqxrffwo3@Air-de-Roger>
 <b3ad1cbb-a45b-612c-28b1-e5c203b24676@suse.com>
 <20190906114531.sfkzr53souo36meq@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ac4e4862-d12a-ab05-79cd-093dec1bdce5@suse.com>
Date: Fri, 6 Sep 2019 14:08:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906114531.sfkzr53souo36meq@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] IOMMU/x86: make page type checks
 consistent when mapping pages
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
Cc: GeorgeDunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDkuMjAxOSAxMzo0NSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gRnJpLCBT
ZXAgMDYsIDIwMTkgYXQgMTI6NTI6MTFQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDA2LjA5LjIwMTkgMTE6MzcsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gV2VkLCBK
dWwgMDMsIDIwMTkgYXQgMTI6MTg6NDVQTSArMDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
LS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL3Ay
bS5jCj4+Pj4gQEAgLTgyOSwxMyArODI5LDEzIEBAIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2Uoc3Ry
dWN0IGRvbWFpbiAqZCwKPj4+PiAgICAgICAgICAgICoKPj4+PiAgICAgICAgICAgICogUmV0YWlu
IHRoaXMgcHJvcGVydHkgYnkgZ3JhYmJpbmcgYSB3cml0YWJsZSB0eXBlIHJlZiBhbmQgdGhlbgo+
Pj4+ICAgICAgICAgICAgKiBkcm9wcGluZyBpdCBpbW1lZGlhdGVseS4gIFRoZSByZXN1bHQgd2ls
bCBiZSBwYWdlcyB0aGF0IGhhdmUgYQo+Pj4+IC0gICAgICAgICAqIHdyaXRhYmxlIHR5cGUgKGFu
ZCBhbiBJT01NVSBlbnRyeSksIGJ1dCBhIGNvdW50IG9mIDAgKHN1Y2ggdGhhdAo+Pj4+IC0gICAg
ICAgICAqIGFueSBndWVzdC1yZXF1ZXN0ZWQgdHlwZSBjaGFuZ2VzIHN1Y2NlZWQgYW5kIHJlbW92
ZSB0aGUgSU9NTVUKPj4+PiAtICAgICAgICAgKiBlbnRyeSkuCj4+Pj4gKyAgICAgICAgICogd3Jp
dGFibGUgdHlwZSAoYW5kIGFuIElPTU1VIGVudHJ5IGlmIG5lY2Vzc2FyeSksIGJ1dCBhIGNvdW50
IG9mIDAKPj4+PiArICAgICAgICAgKiAoc3VjaCB0aGF0IGFueSBndWVzdC1yZXF1ZXN0ZWQgdHlw
ZSBjaGFuZ2VzIHN1Y2NlZWQgYW5kIHJlbW92ZSB0aGUKPj4+PiArICAgICAgICAgKiBJT01NVSBl
bnRyeSkuCj4+Pj4gICAgICAgICAgICAqLwo+Pj4+ICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8
ICgxVUwgPDwgcGFnZV9vcmRlcik7ICsraSwgKytwYWdlICkKPj4+PiAgICAgICAgICAgewo+Pj4+
IC0gICAgICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMoZCkgKQo+Pj4+ICsgICAgICAg
ICAgICBpZiAoICFpb21tdV9lbmFibGVkICkKPj4+Cj4+PiBUaGF0J3Mga2luZCBvZiBhIHN0cm9u
ZyBjaGVjayBmb3IgYSBkb21haW4gdGhhdCBtaWdodCBuZXZlciB1c2UgdGhlCj4+PiBpb21tdSBh
dCBhbGwuIElzbid0IGl0IGZpbmUgdG8ganVzdCByZWx5IG9uCj4+PiBhcmNoX2lvbW11X3BvcHVs
YXRlX3BhZ2VfdGFibGUgZmluZGluZyBub24td3JpdGFibGUgcGFnZXMgYW5kIHRodXMgbm90Cj4+
PiBhZGRpbmcgdGhlbSB0byB0aGUgaW9tbXUgcGFnZS10YWJsZXM/Cj4+Cj4+IE5vIC0gdGhlIGNv
ZGUgY2hhbmdlIGhlcmUgaXMgdG8gdGFrZSBjYXJlIG9mIHBhZ2UgYWRkaXRpb25zIHRvCj4+IHRo
ZSBkb21haW4gYWZ0ZXIgaXQgaGFzIGJvb3RlZC4KPiAKPiBQbGVhc2UgYmVhciB3aXRoIG1lLCBi
dXQgQUZBSUNUIGFyY2hfaW9tbXVfcG9wdWxhdGVfcGFnZV90YWJsZSBjb3VsZAo+IGJlIHVzZWQg
YWZ0ZXIgdGhlIGRvbWFpbiBoYXMgYm9vdGVkIGlmIGEgcGNpIGRldmljZSBpcyBob3QgcGx1Z2dl
ZC4KPiAKPiBJZiB0aGlzIGlzIHRvIGRlYWwgd2l0aCBhZGRpdGlvbnMgdG8gZG9tYWlucyBoYXZp
bmcgYW4gaW9tbXUgYWxyZWFkeQo+IGVuYWJsZWQsIGlzbid0IGl0IGVub3VnaCB0byB1c2UgbmVl
ZF9pb21tdV9wdF9zeW5jPwo+IAo+IFRoYXQncyBnb2luZyB0byByZXR1cm4gdHJ1ZSBmb3IgYWxs
IFBWIGRvbWFpbnMsIGV4Y2VwdCBmb3IgZG9tMCBub3QKPiBydW5uaW5nIGluIHN0cmljdCBtb2Rl
LCB3aGljaCBpcyBleHBlY3RlZCBiZWNhdXNlIGluIHRoYXQgY2FzZSBkb20wCj4gYWxyZWFkeSBo
YXMgdGhlIHdob2xlIFJBTSBtYXBwZWQgaW50byB0aGUgaW9tbXUgcGFnZS10YWJsZXM/CgpXZWxs
LCBteSBwcmV2aW91cyByZXBseSB3YXNuJ3QgcHJlY2lzZSBlbm91Z2gsIEkgZ3Vlc3MuIFRoZSBj
aGFuZ2UKcmVhbGx5IGlzIGFib3V0IGJvdGggY2FzZXM6IElmIHRoZSBkb21haW4gaXMgYWxyZWFk
eSB1c2luZyBhbiBJT01NVSwKbmVlZF9pb21tdV9wdF9zeW5jKCkgd291bGQgYmUgZW5vdWdoIGlu
ZGVlZC4gSWYgSU9NTVUgdXNlIF9tYXlfIGJlCmVuYWJsZWQgbGF0ZXIgb24sIHdlIG5lZWQgdG8g
dHJhbnNpdGlvbiBwYWdlcyBvdXQgb2YgdGhlaXIgaW5pdGlhbApQR1Rfbm9uZSBzdGF0ZSByaWdo
dCBhd2F5LiBJZiB3ZSBkZWZlcnJlZCB0aGlzIHVudGlsIHRoZSBwb2ludAp3aGVyZSB0aGUgSU9N
TVUgZ2V0cyBlbmFibGVkIGZvciB0aGUgZG9tYWluLCB3ZSdkIGhhdmUgdG8gd2F0Y2ggb3V0CmZv
ciBQR1Rfbm9uZSBwYWdlcyB0aGVyZSwgd2hpY2ggd291bGQgYmUgZXh0cmEgaGFzc2xlLgoKPj4+
PiArICAgICAgICAgICAgICAgICAgICB7Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHB1
dF9wYWdlX2FuZF90eXBlKHBhZ2UpOwo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICBmbHVz
aF9mbGFncyB8PSBJT01NVUZfcmVhZGFibGUgfCBJT01NVUZfd3JpdGFibGU7Cj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgfQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgIGVsc2UgaWYgKCAhcmMg
KQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICByYyA9IC1FQlVTWTsKPj4+Cj4+PiBJcyBp
dCBmaW5lIHRvIHJldHVybiBhbiBlcnJvciBoZXJlPyBBRkFJQ1QgeW91IGNvdWxkIGhhdmUgYSBS
TyBwYWdlCj4+PiBzaGFyZWQgd2l0aCBYZW4gd2l0aCBQR1Rfbm9uZSwgYW5kIG5vdCBoYXZpbmcg
YW4gaW9tbXUgbWFwcGluZyBmb3IgaXQKPj4+IHdvdWxkIGJlIGV4cGVjdGVkLCBoZW5jZSByZXR1
cm5pbmcgYW4gZXJyb3Igc2VlbXMgd3Jvbmc/Cj4+Cj4+IE5vLCBwYWdlcyBzaGFyZWQgd2l0aCBY
ZW4gZG9uJ3QgbGl2ZSBvbiBkLT5wYWdlX2xpc3QgKHdoaWNoIGlzIHdoYXQgdGhlCj4+IGxvb3Ag
aXRlcmF0ZXMgb3ZlcikuCj4gCj4gU28gdGhlbiB0aGVyZSBzaG91bGQgYmUgbm8gUEdUX25vbmUg
cGFnZXMgaW4gZC0+cGFnZV9saXN0Pwo+IAo+IFRoZSBvbmx5IHVzZXIgSSBjYW4gZmluZCBvZiBQ
R1Rfbm9uZSBpcyBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0LgoKUGx1cyB0aGUgaW1wbGljaXQg
dXNlIHdoZW4gYSBwYWdlIGdldHMgZmlyc3QgYWRkZWQgdG8gYSBkb21haW4gKGJ5CnNldHRpbmcg
LT51LmludXNlLnR5cGVfaW5mbyB0byB6ZXJvKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
