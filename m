Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497F7154839
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 16:39:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izjE6-0006XJ-EY; Thu, 06 Feb 2020 15:37:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CJ3H=32=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1izjE5-0006XE-0Q
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 15:37:57 +0000
X-Inumbo-ID: a4ac2cc0-48f6-11ea-8f7d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4ac2cc0-48f6-11ea-8f7d-bc764e2007e4;
 Thu, 06 Feb 2020 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581003476;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dy/YNSGJ8dtSSPFBFLBtcb6iGHtA799myQ2IjMSdhzc=;
 b=Guz0nxGumfXGbz6hd0VJatMdIXBsJaTYFG0eVqdy7c2/Er9RafygYTuQ
 th3oUd8pCCfUHCie0y1cAZJzcmL8iC0tXIThY2DTwz5ey4SqTzf2OfAyr
 QGijgjUjAYczeR5EwY/eu0BoPFYDuxjQvVJMGTbsstYaOVYbLzf0LYbhP c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6aTZuc4rfXSh5psRcS5mp4kJAYxnjhAITQqnurcGLKCKkicVZRJmUBbwGjI1lcWbRB6jUWP8eO
 g11WlOv11oSkpwzyv4MduuZikFdFEG0y9aclvfOcT5vtZhey13L7ISpqF/lZ71kbVw9+VfUyOo
 cTMi3idsnoNZfDA48wTnmmR1DnzmgNMbiuKeWMwMOwyR3/MObe1WSRGsxIuTKbZhEkJlR+7NCN
 knCus1GTaFO54/vr9PiyKec3DcwUyD7yUZAAUds3L0gq7g/blUGt0V5Xu2SiZq3rBWOJYzoLM7
 1xo=
X-SBRS: 2.7
X-MesageID: 12049725
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,410,1574139600"; d="scan'208";a="12049725"
Date: Thu, 6 Feb 2020 16:37:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200206153741.GY4679@Air-de-Roger>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-8-roger.pau@citrix.com>
 <20200206134935.x4eonkizd4ybln6r@debian>
 <20200206140914.GX4679@Air-de-Roger>
 <84925af7-d61f-df0a-10d9-263aae79d486@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84925af7-d61f-df0a-10d9-263aae79d486@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 7/7] x86/tlb: use Xen L0 assisted TLB
 flush when available
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMDYsIDIwMjAgYXQgMDM6NDY6NTZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDYuMDIuMjAyMCAxNTowOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgRmViIDA2LCAyMDIwIGF0IDAxOjQ5OjM1UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4g
Pj4gT24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDc6MTE6MTVQTSArMDEwMCwgUm9nZXIgUGF1IE1v
bm5lIHdyb3RlOgo+ID4+PiBVc2UgWGVuJ3MgTDAgSFZNT1BfZmx1c2hfdGxicyBoeXBlcmNhbGwg
aW4gb3JkZXIgdG8gcGVyZm9ybSBmbHVzaGVzLgo+ID4+PiBUaGlzIGdyZWF0bHkgaW5jcmVhc2Vz
IHRoZSBwZXJmb3JtYW5jZSBvZiBUTEIgZmx1c2hlcyB3aGVuIHJ1bm5pbmcKPiA+Pj4gd2l0aCBh
IGhpZ2ggYW1vdW50IG9mIHZDUFVzIGFzIGEgWGVuIGd1ZXN0LCBhbmQgaXMgc3BlY2lhbGx5IGlt
cG9ydGFudAo+ID4+PiB3aGVuIHJ1bm5pbmcgaW4gc2hpbSBtb2RlLgo+ID4+Pgo+ID4+PiBUaGUg
Zm9sbG93aW5nIGZpZ3VyZXMgYXJlIGZyb20gYSBQViBndWVzdCBydW5uaW5nIGBtYWtlIC1qMzIg
eGVuYCBpbgo+ID4+PiBzaGltIG1vZGUgd2l0aCAzMiB2Q1BVcyBhbmQgSEFQLgo+ID4+Pgo+ID4+
PiBVc2luZyB4MkFQSUMgYW5kIEFMTEJVVCBzaG9ydGhhbmQ6Cj4gPj4+IHJlYWwJNG0zNS45NzNz
Cj4gPj4+IHVzZXIJNG0zNS4xMTBzCj4gPj4+IHN5cwkzNm0yNC4xMTdzCj4gPj4+Cj4gPj4+IFVz
aW5nIEwwIGFzc2lzdGVkIGZsdXNoOgo+ID4+PiByZWFsICAgIDFtMi41OTZzCj4gPj4+IHVzZXIg
ICAgNG0zNC44MThzCj4gPj4+IHN5cyAgICAgNW0xNi4zNzRzCj4gPj4+Cj4gPj4+IFRoZSBpbXBs
ZW1lbnRhdGlvbiBhZGRzIGEgbmV3IGhvb2sgdG8gaHlwZXJ2aXNvcl9vcHMgc28gb3RoZXIKPiA+
Pj4gZW5saWdodGVubWVudHMgY2FuIGFsc28gaW1wbGVtZW50IHN1Y2ggYXNzaXN0ZWQgZmx1c2gg
anVzdCBieSBmaWxsaW5nCj4gPj4+IHRoZSBob29rLiBOb3RlIHRoYXQgdGhlIFhlbiBpbXBsZW1l
bnRhdGlvbiBjb21wbGV0ZWx5IGlnbm9yZXMgdGhlCj4gPj4+IGRpcnR5IENQVSBtYXNrIGFuZCB0
aGUgbGluZWFyIGFkZHJlc3MgcGFzc2VkIGluLCBhbmQgYWx3YXlzIHBlcmZvcm1zIGEKPiA+Pj4g
Z2xvYmFsIFRMQiBmbHVzaCBvbiBhbGwgdkNQVXMuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4+PiAtLS0KPiA+Pj4g
Q2hhbmdlcyBzaW5jZSB2MToKPiA+Pj4gIC0gQWRkIGEgTDAgYXNzaXN0ZWQgaG9vayB0byBoeXBl
cnZpc29yIG9wcy4KPiA+Pj4gLS0tCj4gPj4+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNv
ci5jICAgICAgICB8IDEwICsrKysrKysrKysKPiA+Pj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4v
eGVuLmMgICAgICAgICAgIHwgIDYgKysrKysrCj4gPj4+ICB4ZW4vYXJjaC94ODYvc21wLmMgICAg
ICAgICAgICAgICAgICAgICB8IDExICsrKysrKysrKysrCj4gPj4+ICB4ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L2h5cGVydmlzb3IuaCB8IDE3ICsrKysrKysrKysrKysrKysrCj4gPj4+ICA0IGZp
bGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
aXNvci5jCj4gPj4+IGluZGV4IDRmMjdiOTg3NDAuLjQwODViMTk3MzQgMTAwNjQ0Cj4gPj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKPiA+Pj4gKysrIGIveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydmlzb3IuYwo+ID4+PiBAQCAtMTgsNiArMTgsNyBAQAo+ID4+PiAgICoK
PiA+Pj4gICAqIENvcHlyaWdodCAoYykgMjAxOSBNaWNyb3NvZnQuCj4gPj4+ICAgKi8KPiA+Pj4g
KyNpbmNsdWRlIDx4ZW4vY3B1bWFzay5oPgo+ID4+PiAgI2luY2x1ZGUgPHhlbi9pbml0Lmg+Cj4g
Pj4+ICAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+Cj4gPj4+ICAKPiA+Pj4gQEAgLTY0LDYgKzY1LDE1
IEBAIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCkKPiA+Pj4gICAgICAgICAgb3BzLT5yZXN1
bWUoKTsKPiA+Pj4gIH0KPiA+Pj4gIAo+ID4+PiAraW50IGh5cGVydmlzb3JfZmx1c2hfdGxiKGNv
bnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsCj4gPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50IG9yZGVyKQo+ID4+PiArewo+ID4+PiArICAgIGlmICgg
b3BzICYmIG9wcy0+Zmx1c2hfdGxiICkKPiA+Pj4gKyAgICAgICAgcmV0dXJuIG9wcy0+Zmx1c2hf
dGxiKG1hc2ssIHZhLCBvcmRlcik7Cj4gPj4+ICsKPiA+Pgo+ID4+IElzIHRoZXJlIGEgd2F5IHRv
IG1ha2UgdGhpcyBhbiBhbHRlcm5hdGl2ZSBjYWxsPyBJIGNvbnNpZGVyIHRsYiBmbHVzaCBhCj4g
Pj4gZnJlcXVlbnQgb3BlcmF0aW9uIHdoaWNoIGNhbiB1c2Ugc29tZSBvcHRpbWlzYXRpb24uCj4g
Pj4KPiA+PiBUaGlzIGNhbiBiZSBkb25lIGFzIGEgbGF0ZXIgaW1wcm92ZW1lbnQgaWYgaXQgaXMg
dG9vIGRpZmZpY3VsdCB0aG91Z2guCj4gPj4gVGhpcyBwYXRjaCBhbHJlYWR5IGhhcyBzb21lIHN1
YnN0YW50aWFsIGltcHJvdmVtZW50Lgo+ID4gCj4gPiBJIGNhbiBsb29rIGludG8gbWFraW5nIHRo
aXMgYW4gYWx0ZXJuYXRpdmUgY2FsbCwgaWYgaXQgdHVybiBvdXQgdG8gYmUKPiA+IHRvbyBjb21w
bGV4IEkgd2lsbCBsZWF2ZSBpdCBvdXQgZm9yIGEgc2VwYXJhdGUgcGF0Y2guCj4gCj4gSXQnbGwg
YmUgdHdvIHN0ZXBzIC0gbWFrZSBhIGdsb2JhbCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgaW5zdGFu
Y2UKPiB3aGljaCB0aGUgcGVyLWh5cGVydmlzb3IgaW5zdGFuY2VzIGdldCBfY29waWVkXyBpbnRv
IHVwb24gYm9vdAo+IChhdCB0aGF0IHBvaW50IGFsbCBvZiB0aG9zZSBjYW4gZ28gaW50byAuaW5p
dC4qIHNlY3Rpb25zKSwgYW5kCj4gdGhlbiBzd2l0Y2ggdGhlIGNhbGwocykgb2YgaW50ZXJlc3Qu
IEkuZS4gd2hpbGUgdGhlIDJuZCBzdGVwIGNhbgo+IG9mIGNvdXJzZSBiZSBkb25lIHJpZ2h0IGhl
cmUsIHRoZSBmaXJzdCB3aWxsIHdhbnQgdG8gYmUgaW4gYQo+IHByZXJlcSBwYXRjaC4KCkRvbmUu
IEkndmUgb25seSBzd2l0Y2hlZCB0aGUgZmx1c2hfdGxiIG9wZXJhdGlvbiwgc2luY2UgdGhlIHJl
c3QgYXJlCm5vdCByZWxldmFudCBmcm9tIGEgcGVyZm9ybWFuY2UgUG9WLgoKV2lsbCB3YWl0IHVu
dGlsIG5leHQgd2VlayBiZWZvcmUgcG9zdGluZyBhIG5ldyB2ZXJzaW9uLgoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
