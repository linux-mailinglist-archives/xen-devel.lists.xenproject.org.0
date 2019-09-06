Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78553AB46B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 10:53:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i69w7-0001v2-Br; Fri, 06 Sep 2019 08:49:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pN+4=XB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i69w6-0001up-17
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 08:49:42 +0000
X-Inumbo-ID: 42bb147c-d083-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42bb147c-d083-11e9-a337-bc764e2007e4;
 Fri, 06 Sep 2019 08:49:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 75DE4AD14;
 Fri,  6 Sep 2019 08:49:38 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-4-jgross@suse.com>
 <efd9f3e4-d2d3-8bf7-ba9a-6337f598191a@suse.com>
 <129b35af-da91-5811-ec3c-b37caeb1451e@suse.com>
 <8565aa67-9ef2-49cb-3a9b-06c14eda7d82@suse.com>
 <fcfecb6b-ca9d-5382-1b0d-1b587cef36d6@suse.com>
 <5fff41d3-286d-66b3-43e4-80bf29ee4db3@suse.com>
 <c5e744c2-73e7-3a6c-6404-b7596c1c24e3@suse.com>
 <c417375c-b216-8160-e4aa-bc61e0a7a901@suse.com>
 <88dca7fb-c1f5-d7e8-b59f-0169490cc9bf@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <65545e29-c6c2-ba2a-0626-e3c4f9867217@suse.com>
Date: Fri, 6 Sep 2019 10:49:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <88dca7fb-c1f5-d7e8-b59f-0169490cc9bf@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v5 3/4] xen: refactor debugtrace data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMTkgMTY6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA1LjA5LjIwMTkgMTY6
MzYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA1LjA5LjE5IDE0OjQ2LCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOgo+Pj4gT24gMDUuMDkuMTkgMTQ6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
IE9uIDA1LjA5LjIwMTkgMTQ6MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+IE9uIDA1LjA5
LjE5IDE0OjIyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA1LjA5LjIwMTkgMTQ6MTIs
IEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4gT24gMDUuMDkuMTkgMTQ6MDEsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4+Pj4+PiBPbiAwNS4wOS4yMDE5IDEzOjM5LCBKdWVyZ2VuIEdyb3NzIHdy
b3RlOgo+Pj4+Pj4+Pj4gQXMgYSBwcmVwYXJhdGlvbiBmb3IgcGVyLWNwdSBidWZmZXJzIGRvIGEg
bGl0dGxlIHJlZmFjdG9yaW5nIG9mIHRoZQo+Pj4+Pj4+Pj4gZGVidWd0cmFjZSBkYXRhOiBwdXQg
dGhlIG5lZWRlZCBidWZmZXIgYWRtaW4gZGF0YSBpbnRvIHRoZSBidWZmZXIgYXMKPj4+Pj4+Pj4+
IGl0IHdpbGwgYmUgbmVlZGVkIGZvciBlYWNoIGJ1ZmZlci4gSW4gb3JkZXIgbm90IHRvIGxpbWl0
IGJ1ZmZlciBzaXplCj4+Pj4+Pj4+PiBzd2l0Y2ggdGhlIHJlbGF0ZWQgZmllbGRzIGZyb20gdW5z
aWduZWQgaW50IHRvIHVuc2lnbmVkIGxvbmcsIGFzIG9uCj4+Pj4+Pj4+PiBodWdlIG1hY2hpbmVz
IHdpdGggUkFNIGluIHRoZSBUQiByYW5nZSBpdCBtaWdodCBiZSBpbnRlcmVzdGluZyB0bwo+Pj4+
Pj4+Pj4gc3VwcG9ydCBidWZmZXJzID40R0IuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEp1c3QgYXMgYSBm
dXJ0aGVyIHJlbWFyayBpbiB0aGlzIHJlZ2FyZDoKPj4+Pj4+Pj4KPj4+Pj4+Pj4+ICDCoMKgwqAg
dm9pZCBkZWJ1Z3RyYWNlX3ByaW50ayhjb25zdCBjaGFyICpmbXQsIC4uLikKPj4+Pj4+Pj4+ICDC
oMKgwqAgewo+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgIHN0YXRpYyBjaGFyIGJ1ZltERUJVR19U
UkFDRV9FTlRSWV9TSVpFXTsKPj4+Pj4+Pj4+IC3CoMKgwqAgc3RhdGljIHVuc2lnbmVkIGludCBj
b3VudCwgbGFzdF9jb3VudCwgbGFzdF9wcmQ7Cj4+Pj4+Pj4+PiArwqDCoMKgIHN0YXRpYyB1bnNp
Z25lZCBpbnQgY291bnQsIGxhc3RfY291bnQ7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEhvdyBsb25nIGRv
IHdlIHRoaW5rIHdpbGwgaXQgdGFrZSB1bnRpbCB0aGVpciB3cmFwcGluZyB3aWxsIGJlY29tZQo+
Pj4+Pj4+PiBhbiBpc3N1ZSB3aXRoIHN1Y2ggaHVnZSBidWZmZXJzPwo+Pj4+Pj4+Cj4+Pj4+Pj4g
Q291bnQgd3JhcHBpbmcgd2lsbCBub3QgcmVzdWx0IGluIGFueSBtaXNiZWhhdmlvciBvZiB0cmFj
aW5nLiBXaXRoCj4+Pj4+Pj4gcGVyLWNwdSBidWZmZXJzIGl0IG1pZ2h0IHJlc3VsdCBpbiBhbWJp
Z3VpdHkgcmVnYXJkaW5nIHNvcnRpbmcgdGhlCj4+Pj4+Pj4gZW50cmllcywgYnV0IEkgZ3Vlc3Mg
Y2hhbmNlcyBhcmUgcmF0aGVyIGxvdyB0aGlzIGJlaW5nIGEgcmVhbCBpc3N1ZS4KPj4+Pj4+Pgo+
Pj4+Pj4+IEJUVzogd3JhcHBpbmcgb2YgY291bnQgaXMgbm90IHJlbGF0ZWQgdG8gYnVmZmVyIHNp
emUsIGJ1dCB0byB0aGUKPj4+Pj4+PiBhbW91bnQgb2YgdHJhY2UgZGF0YSB3cml0dGVuLgo+Pj4+
Pj4KPj4+Pj4+IFN1cmUsIGJ1dCB0aGUgY2hhbmNlIG9mIGFtYmlndWl0eSBpbmNyZWFzZXMgd2l0
aCBsYXJnZXIgYnVmZmVyIHNpemVzLgo+Pj4+Pgo+Pj4+PiBXZWxsLCBiZXR0ZXIgc2FmZSB0aGFu
IHNvcnJ5LiBTd2l0Y2hpbmcgdG8gdW5zaWduZWQgbG9uZyB3aWxsIHJhcmVseQo+Pj4+PiBodXJ0
LCBzbyBJJ20gZ29pbmcgdG8gZG8ganVzdCB0aGF0LiBUaGUgb25seSBkb3duc2lkZSB3aWxsIGJl
IHNvbWUgd2FzdGUKPj4+Pj4gb2YgYnVmZmVyIHNwYWNlIGZvciB2ZXJ5IGxvbmcgcnVubmluZyB0
cmFjZXMgd2l0aCBodWdlIGFtb3VudHMgb2YKPj4+Pj4gZW50cmllcy4KPj4+Pgo+Pj4+IEhtbSwg
dHJ1ZS4gTWF5YmUgd2UgY291bGQgZ2V0IHNvbWVvbmUgZWxzZSdzIG9waW5pb24gb24gdGhpcyAt
IGFueW9uZT8KPj4+Cj4+PiBUQkgsIEkgd291bGRuJ3QgYmUgY29uY2VybmVkIGFib3V0IHRoZSBi
dWZmZXIgc3BhY2UuIEluIGNhc2UgdGhlcmUgYXJlCj4+PiByZWFsbHkgYmlsbGlvbnMgb2YgZW50
cmllcywgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBhIDEwLWRpZ2l0IGNvdW50Cj4+PiB2YWx1ZSBh
bmQgbWF5YmUgYSAxNSBkaWdpdCBvbmUgKGFuZCB0aGF0IGlzIGFscmVhZHkgYSBtYXNzaXZlIGFt
b3VudCkKPj4+IGlzbid0IHRoYXQgbGFyZ2UuIFRoZSBhdmVyYWdlIHByaW50ZWQgc2l6ZSBvZiBj
b3VudCB3aXRoIGFib3V0Cj4+PiA0IGJpbGxpb24gZW50cmllcyBpcyA5Ljc1IGRpZ2l0cyAoYW5k
IG5vdCBqdXN0IDUgOi0pICkuCj4+Cj4+IEFub3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGxldCBj
b3VudCB3cmFwIGF0IGUuZy4gNCBiaWxsaW9uIChvciBldmVuIDEKPj4gbWlsbGlvbikgYW5kIGFk
ZCBhIHdyYXAgY291bnQuIEVhY2ggYnVmZmVyIHN0cnVjdCB3b3VsZCBjb250YWluIHRoZQo+PiB3
cmFwIGNvdW50IG9mIHRoZSBsYXN0IGVudHJ5LCBhbmQgd2hlbiBoaXR0aW5nIGEgaGlnaGVyIHdy
YXAgY291bnQgYQo+PiBuZXcgZW50cnkgbGlrZSAoIndyYXAgJXUtPiV1Iiwgb2xkX3dyYXAsIG5l
d193cmFwKSB3b3VsZCBiZSBwcmludGVkLgo+PiBUaGlzIHNhdmVzIGJ1ZmZlciBzcGFjZSB3aXRo
b3V0IGxvb3NpbmcgaW5mb3JtYXRpb24uCj4gCj4gVGhpcyBzb3VuZHMgcXVpdGUgbmVhdC4KCkkn
bSBhZGRpbmcgYSBuZXcgcGF0Y2ggZm9yIHRoYXQgcHVycG9zZSwgYXMgaXQgaXMgYWRkaW5nIGEg
bmV3IGZlYXR1cmUuCgpBbnkgcHJlZmVyZW5jZXMgZm9yIHRoZSBtYXggdmFsdWUgb2YgY291bnQ/
IEknbSBpbiBmYXZvciBvZiBsaW1pdGluZyBpdAp0byA2LWRpZ2l0IG51bWJlcnMgYXMgdGhvc2Ug
YXJlIG11Y2ggZWFzaWVyIHRvIGNvbXBhcmUgYnkganVzdCBsb29raW5nCmF0IHRoZW0uCgoKSnVl
cmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
