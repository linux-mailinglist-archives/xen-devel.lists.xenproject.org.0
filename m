Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09099C4AA7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 11:29:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFau9-00070r-8N; Wed, 02 Oct 2019 09:26:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFau7-00070m-Dh
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 09:26:39 +0000
X-Inumbo-ID: bbd00b2e-e4f6-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id bbd00b2e-e4f6-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 09:26:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EC9E0AEF8;
 Wed,  2 Oct 2019 09:26:36 +0000 (UTC)
To: Paul Durrant <pdurrant@gmail.com>
References: <20191001151159.861-1-paul.durrant@citrix.com>
 <2857a023-87ed-8220-7b22-51f1048f9de6@suse.com>
 <CACCGGhBHZgObmuP9UJrHGgp3=BKMot55qJ61Cx0+Tr_L_kV1mQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <809d558c-9556-6be9-14bd-7c7023c39f17@suse.com>
Date: Wed, 2 Oct 2019 11:26:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACCGGhBHZgObmuP9UJrHGgp3=BKMot55qJ61Cx0+Tr_L_kV1mQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v2] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxMDo1OSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IE9uIFdlZCwgMiBPY3Qg
MjAxOSBhdCAwOTo0MiwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4K
Pj4gT24gMDEuMTAuMjAxOSAxNzoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gTm93IHRoYXQg
eGwuY2ZnIGhhcyBhbiBvcHRpb24gdG8gZXhwbGljaXRseSBlbmFibGUgSU9NTVUgbWFwcGluZ3Mg
Zm9yIGEKPj4+IGRvbWFpbiwgbWlncmF0aW9uIG1heSBiZSBuZWVkbGVzc2x5IHZldG9lZCBkdWUg
dG8gdGhlIGNoZWNrIG9mCj4+PiBpc19pb21tdV9lbmFibGVkKCkgaW4gcGFnaW5nX2xvZ19kaXJ0
eV9lbmFibGUoKS4KPj4+IFRoZXJlIGlzIGFjdHVhbGx5IG5vIG5lZWQgdG8gcHJldmVudCBsb2dk
aXJ0eSBmcm9tIGJlaW5nIGVuYWJsZWQgdW5sZXNzCj4+PiBkZXZpY2VzIGFyZSBhc3NpZ25lZCB0
byBhIGRvbWFpbiBhbmQgdGhhdCBkb21haW4gaXMgc2hhcmluZyBIQVAgbWFwcGluZ3MKPj4+IHdp
dGggdGhlIElPTU1VIChpbiB3aGljaCBjYXNlIGRpc2FibGluZyB3cml0ZSBwZXJtaXNzaW9ucyBp
biB0aGUgUDJNIG1heQo+Pj4gY2F1c2UgRE1BIGZhdWx0cykuIEl0IGlzIHF1aXRlIHBvc3NpYmxl
IHRoYXQgc29tZSBhc3NpZ25lZCBkZXZpY2VzIG1heQo+Pj4gcHJvdmlkZSBpbmZvcm1hdGlvbiBh
Ym91dCB3aGljaCBwYWdlcyBtYXkgaGF2ZSBiZWVuIGRpcnRpZWQgYnkgRE1BIHZpYQo+Pj4gYW4g
QVBJIGV4cG9ydGVkIGJ5IHRoZWlyIG1hbmFnaW5nIGVtdWxhdG9yLiBUaHVzIFhlbidzIGxvZ2Rp
cnR5IG1hcCBpcyBvbmx5Cj4+PiBvbmUgc291cmNlIG9mIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJl
IGF2YWlsYWJsZSB0byB0aGUgdG9vbHN0YWNrIHdoZW4KPj4+IHBlcmZvcm1pbmcgYSBtaWdyYXRp
b24gYW5kIGhlbmNlIGl0IGlzIHRoZSB0b29sc3RhY2sgdGhhdCBpcyBiZXN0IHBsYWNlZAo+Pj4g
dG8gZGVjaWRlIHVuZGVyIHdoYXQgY2lyY3Vtc3RhbmNlcyBpdCBjYW4gYmUgcGVyZm9ybWVkLCBu
b3QgdGhlIGh5cGVydmlzb3IuCj4+Cj4+IFdoaWxlIEknbSBoYXBweSBhYm91dCB0aGUgZXh0ZW5k
ZWQgZGVzY3JpcHRpb24sIGl0J3Mgc3RpbGwgd3JpdHRlbiBpbgo+PiBhIHdheSBzdWdnZXN0aW5n
IHRoYXQgdGhpcyBpcyB0aGUgb25seSBwb3NzaWJsZSB3YXkgb2Ygdmlld2luZyB0aGluZ3MuCj4+
IEFzIGV4cHJlc3NlZCBieSBHZW9yZ2UgYW5kIG1lLCBwdXR0aW5nIHRoZSBoeXBlcnZpc29yIGlu
IGEgcG9zaXRpb24gdG8KPj4gYmUgYWJsZSB0byBqdWRnZSBpcyBhdCBsZWFzdCBhbiBhbHRlcm5h
dGl2ZSB3b3J0aCBjb25zaWRlcmluZy4KPj4KPiAKPiBUaGlzIGlzIGEgc21hbGwgcGF0Y2ggYW5k
IGl0IGRvZXMgbm90IGNsb3NlIHRoZSBkb29yIG9uIGJlaW5nIGFibGUgdG8KPiBhZGQgc3VjaCBh
biBpbnRlcmZhY2UgbGF0ZXIuIEknbSBub3Qgc2F5aW5nIHRoYXQgSSBkaXNsaWtlIHRoYXQKPiBh
bHRlcm5hdGl2ZSwgYnV0IGl0IHdpbGwgaW5ldml0YWJseSBiZSBxdWl0ZSBhIGxvdCBtb3JlIGNv
ZGUgYW5kIEknbQo+IG5vdCBzdXJlIGl0IHJlYWxseSBidXlzIGFueXRoaW5nLgo+IAo+PiBXaGF0
J3Mgd29yc2UgdGhvdWdoIC0geW91IGRvbid0IGdvIGFsbCB0aGUgd2F5IHRvIHRoZSBlbmQgb2Yg
d2hhdCB5b3VyCj4+IGFyZ3VtZW50YXRpb24gd291bGQgbGVhZCB0bzogVGhlcmUncyBubyByZWFz
b24gZm9yIFhlbiB0byB2ZXRvIHRoZQo+PiByZXF1ZXN0IHRoZW4gZXZlbiBpbiB0aGUgc2hhcmVk
IHBhZ2UgdGFibGUgY2FzZS4KPiAKPiBXZWxsLCBJIGFkZHJlc3MgdGhhdCBpbiB0aGUgY29tbWl0
IGNvbW1lbnQuCgpEbyB5b3U/IEkndmUganVzdCByZWFkIGl0IGFnYWluLCB3aXRob3V0IGZpbmRp
bmcgbWVudGlvbiBvZiB0aGlzIGNhc2UuCgo+PiBUaGUgb25seSBkZXZpY2UKPj4gYXNzaWduZWQg
dG8gYSBndWVzdCBpbiBxdWVzdGlvbiBtYXkgYmUgZG9pbmcgRE1BIHJlYWRzIG9ubHkuIEZvbGxv
d2luZwo+PiB5b3VyIHJlYXNvbmluZywgWGVuIHNob3VsZG4ndCBiZSBnZXR0aW5nIGluIHRoZSB3
YXkgdGhlbiBlaXRoZXIuIE9uY2UKPj4gYWdhaW4gdGhlIHNpdHVhdGlvbiBjb3VsZCBiZSB0YWtl
biBjYXJlIG9mIGJ5IGluZm9ybWluZyBYZW4gYWJvdXQgdGhpcwo+PiBwcm9wZXJ0eSBvZiBhIGRl
dmljZSAoYXNzdW1pbmcgaXQgY2FuJ3QgdGVsbCBhbGwgYnkgaXRzZWxmKS4KPiAKPiBJIGFtIG5v
dCBhd2FyZSBvZiBhIG1lY2hhbnNpbSB0byBjb25maWd1cmUgZXZlbiBhIFBDSSBleHByZXNzIGRl
dmljZQo+IHRvIG9ubHkgYWxsb3cgcmVhZCBUTFBzIGFuZCB0aHVzIHdlIG11c3QgYXNzdW1lIHRo
YXQgYW55IGRldmljZSB3aXRoCj4gYnVzIG1hc3RlcmluZyBlbmFibGVkIG1heSBhdHRlbXB0IHRv
IGlzc3VlIGEgd3JpdGUgVExQLiBUaHVzIEkgdGhpbmsKPiBpdCBpcyByZWFzb25hYmxlIGZvciBY
ZW4gdG8gdmV0byBsb2dkaXJ0eSBpbiB0aGUgY2FzZSBvZiBzaGFyZWQgRVBUCj4gYmVjYXVzZSBh
IHNpZGUgZWZmZWN0IG9mIFhlbidzIGJlaGF2aW91ciBtYXkgaGF2ZSBkZXRyaW1lbnRhbCBhZmZl
Y3QKPiBvbiBkZXZpY2UgZnVuY3Rpb25hbGl0eSwgYW5kIGNhdXNlIGJ1cyBlcnJvcnMgdG8gYmUg
cmVwb3J0ZWQuCgpJIGRvbid0IGZvbGxvdyB5b3UgaGVyZTogVGhlcmUncyBubyBuZWVkIHRvIGNv
bmZpZ3VyZSBhIGRldmljZSB0aGlzCndheS4gSWYgaXQgaXMgY2xhaW1lZCAoZS5nLiBieSBhbiBh
ZG1pbiBvciBpdHMgbWFudWZhY3R1cmVyKSB0byBvbmx5CmV2ZXIgaXNzdWUgRE1BIHJlYWRzLCB0
aGVuIHRoYXQncyBhbGwgd2UgbmVlZC4gQW55IGVycm9uZW91cyBvcgptYWxpY2lvdXMgd3JpdGUg
KG90aGVyIHRoYW4gcGVyaGFwcyB0aGUgb25lcyB0byB0cmlnZ2VyIE1TSSkgd291bGQKcG90ZW50
aWFsbHkgcmVzdWx0IGluIG1pc2JlaGF2aW9yIG9mIHRoZSBndWVzdCwgYnV0IG5vdCB0aGUgaG9z
dCAoSQpkb24ndCBzZWUgd2h5IHlvdSBtZW50aW9uICJidXMgZXJyb3JzIiAtIGl0IHdvdWxkIGJl
IElPTU1VIGZhdWx0cywKd2l0aCBhc3NvY2lhdGVkIGFib3J0cyByZXBvcnRlZCBiYWNrIHRvIHRo
ZSBkZXZpY2UpLiBBbmQgaXQncyBvbmx5CnRoZSBsYXR0ZXIgeW91IHNheSB5b3UncmUgY29uY2Vy
bmVkIGFib3V0IHdoZW4gaXQgY29tZXMgdG8gYWxsb3cgWGVuCnRvIHZldG8gc29tZXRoaW5nLgoK
PiBJIGd1ZXNzCj4gaXQgd291bGQgYmUgcmVhc29uYWJsZSB0byBjaGVjayBhbGwgYXNzaWduZWQg
ZGV2aWNlcycgQk1FIGJpdCBhbmQgb25seQo+IHZldG8gaWYgYW55IGFyZSBzZXQgdGhvdWdoLiBJ
IHdvdWxkIHByZWZlciB0aGF0IGJlIGFuIGluY3JlbWVudGFsCj4gcGF0Y2ggdGhvdWdoLgoKU3Vy
ZSAtIHRoaXMgd291bGRuJ3QgcmVhbGx5IGJlbG9uZyBoZXJlLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
