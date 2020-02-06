Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3F01545E0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 15:15:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izhsE-0007kU-Go; Thu, 06 Feb 2020 14:11:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CJ3H=32=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1izhsD-0007kN-1R
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 14:11:17 +0000
X-Inumbo-ID: 89906dcc-48ea-11ea-8cd1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89906dcc-48ea-11ea-8cd1-bc764e2007e4;
 Thu, 06 Feb 2020 14:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580998276;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ww2yZdNzu+D7vtuqEjfW5SvzlxKPFACrQ4kvPmUEvA4=;
 b=D/iu6aaFXWcfdpVtMn1tjUYo6OJodcnGUgVdqoh4ga+cKcNIJsS0n/tU
 7aItibmj8Rxbq1fKP4ZWZ7ByMHxMDkL3bRj0cUL51hT4/aLPhGJOfCP1J
 0RE2QwM2TL+1qk536gf5jpNuosAeh/4R2jzrZ+k2e5BDOj1Eb+lseMC11 A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: y2EvXAHlg2Q8+hfCB54H88hCPd/jDkHWdE4vMiW8O3dQBiE9obqr+oyB4oytY8yGdiWGe+c+ee
 c0KX0CwEyYc5rexu8MXj3GHyHNvaAKQfkxdVM2m1aC2iU8WF+HeBwPnSwlZXSvE2iIMkmriSMu
 y14cvK4uIP+gu6pLMrjvoJU33TlTCy8PLdXvjbH4PpiAyzmuBoDSfGYNHBgvop0OnePrPgoQd6
 AJPV+z4H+qcdH9fRqMc8fjxyt//WysLLshNp8yYK9YUnAxUnAL6xoayQNIqVoFD4cb2bI2AcfX
 7oU=
X-SBRS: 2.7
X-MesageID: 12057167
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,409,1574139600"; d="scan'208";a="12057167"
Date: Thu, 6 Feb 2020 15:09:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200206140914.GX4679@Air-de-Roger>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-8-roger.pau@citrix.com>
 <20200206134935.x4eonkizd4ybln6r@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206134935.x4eonkizd4ybln6r@debian>
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMDYsIDIwMjAgYXQgMDE6NDk6MzVQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEphbiAyNywgMjAyMCBhdCAwNzoxMToxNVBNICswMTAwLCBSb2dlciBQYXUgTW9u
bmUgd3JvdGU6Cj4gPiBVc2UgWGVuJ3MgTDAgSFZNT1BfZmx1c2hfdGxicyBoeXBlcmNhbGwgaW4g
b3JkZXIgdG8gcGVyZm9ybSBmbHVzaGVzLgo+ID4gVGhpcyBncmVhdGx5IGluY3JlYXNlcyB0aGUg
cGVyZm9ybWFuY2Ugb2YgVExCIGZsdXNoZXMgd2hlbiBydW5uaW5nCj4gPiB3aXRoIGEgaGlnaCBh
bW91bnQgb2YgdkNQVXMgYXMgYSBYZW4gZ3Vlc3QsIGFuZCBpcyBzcGVjaWFsbHkgaW1wb3J0YW50
Cj4gPiB3aGVuIHJ1bm5pbmcgaW4gc2hpbSBtb2RlLgo+ID4gCj4gPiBUaGUgZm9sbG93aW5nIGZp
Z3VyZXMgYXJlIGZyb20gYSBQViBndWVzdCBydW5uaW5nIGBtYWtlIC1qMzIgeGVuYCBpbgo+ID4g
c2hpbSBtb2RlIHdpdGggMzIgdkNQVXMgYW5kIEhBUC4KPiA+IAo+ID4gVXNpbmcgeDJBUElDIGFu
ZCBBTExCVVQgc2hvcnRoYW5kOgo+ID4gcmVhbAk0bTM1Ljk3M3MKPiA+IHVzZXIJNG0zNS4xMTBz
Cj4gPiBzeXMJMzZtMjQuMTE3cwo+ID4gCj4gPiBVc2luZyBMMCBhc3Npc3RlZCBmbHVzaDoKPiA+
IHJlYWwgICAgMW0yLjU5NnMKPiA+IHVzZXIgICAgNG0zNC44MThzCj4gPiBzeXMgICAgIDVtMTYu
Mzc0cwo+ID4gCj4gPiBUaGUgaW1wbGVtZW50YXRpb24gYWRkcyBhIG5ldyBob29rIHRvIGh5cGVy
dmlzb3Jfb3BzIHNvIG90aGVyCj4gPiBlbmxpZ2h0ZW5tZW50cyBjYW4gYWxzbyBpbXBsZW1lbnQg
c3VjaCBhc3Npc3RlZCBmbHVzaCBqdXN0IGJ5IGZpbGxpbmcKPiA+IHRoZSBob29rLiBOb3RlIHRo
YXQgdGhlIFhlbiBpbXBsZW1lbnRhdGlvbiBjb21wbGV0ZWx5IGlnbm9yZXMgdGhlCj4gPiBkaXJ0
eSBDUFUgbWFzayBhbmQgdGhlIGxpbmVhciBhZGRyZXNzIHBhc3NlZCBpbiwgYW5kIGFsd2F5cyBw
ZXJmb3JtcyBhCj4gPiBnbG9iYWwgVExCIGZsdXNoIG9uIGFsbCB2Q1BVcy4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiAt
LS0KPiA+IENoYW5nZXMgc2luY2UgdjE6Cj4gPiAgLSBBZGQgYSBMMCBhc3Npc3RlZCBob29rIHRv
IGh5cGVydmlzb3Igb3BzLgo+ID4gLS0tCj4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlz
b3IuYyAgICAgICAgfCAxMCArKysrKysrKysrCj4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94
ZW4uYyAgICAgICAgICAgfCAgNiArKysrKysKPiA+ICB4ZW4vYXJjaC94ODYvc21wLmMgICAgICAg
ICAgICAgICAgICAgICB8IDExICsrKysrKysrKysrCj4gPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9n
dWVzdC9oeXBlcnZpc29yLmggfCAxNyArKysrKysrKysrKysrKysrKwo+ID4gIDQgZmlsZXMgY2hh
bmdlZCwgNDQgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydmlzb3IuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKPiA+
IGluZGV4IDRmMjdiOTg3NDAuLjQwODViMTk3MzQgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
aXNvci5jCj4gPiBAQCAtMTgsNiArMTgsNyBAQAo+ID4gICAqCj4gPiAgICogQ29weXJpZ2h0IChj
KSAyMDE5IE1pY3Jvc29mdC4KPiA+ICAgKi8KPiA+ICsjaW5jbHVkZSA8eGVuL2NwdW1hc2suaD4K
PiA+ICAjaW5jbHVkZSA8eGVuL2luaXQuaD4KPiA+ICAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+Cj4g
PiAgCj4gPiBAQCAtNjQsNiArNjUsMTUgQEAgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKQo+
ID4gICAgICAgICAgb3BzLT5yZXN1bWUoKTsKPiA+ICB9Cj4gPiAgCj4gPiAraW50IGh5cGVydmlz
b3JfZmx1c2hfdGxiKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBvcmRlcikKPiA+ICt7Cj4gPiAr
ICAgIGlmICggb3BzICYmIG9wcy0+Zmx1c2hfdGxiICkKPiA+ICsgICAgICAgIHJldHVybiBvcHMt
PmZsdXNoX3RsYihtYXNrLCB2YSwgb3JkZXIpOwo+ID4gKwo+IAo+IElzIHRoZXJlIGEgd2F5IHRv
IG1ha2UgdGhpcyBhbiBhbHRlcm5hdGl2ZSBjYWxsPyBJIGNvbnNpZGVyIHRsYiBmbHVzaCBhCj4g
ZnJlcXVlbnQgb3BlcmF0aW9uIHdoaWNoIGNhbiB1c2Ugc29tZSBvcHRpbWlzYXRpb24uCj4gCj4g
VGhpcyBjYW4gYmUgZG9uZSBhcyBhIGxhdGVyIGltcHJvdmVtZW50IGlmIGl0IGlzIHRvbyBkaWZm
aWN1bHQgdGhvdWdoLgo+IFRoaXMgcGF0Y2ggYWxyZWFkeSBoYXMgc29tZSBzdWJzdGFudGlhbCBp
bXByb3ZlbWVudC4KCkkgY2FuIGxvb2sgaW50byBtYWtpbmcgdGhpcyBhbiBhbHRlcm5hdGl2ZSBj
YWxsLCBpZiBpdCB0dXJuIG91dCB0byBiZQp0b28gY29tcGxleCBJIHdpbGwgbGVhdmUgaXQgb3V0
IGZvciBhIHNlcGFyYXRlIHBhdGNoLgoKPiA+ICsgICAgcmV0dXJuIC1FTk9TWVM7Cj4gPiArfQo+
ID4gKwo+ID4gIC8qCj4gPiAgICogTG9jYWwgdmFyaWFibGVzOgo+ID4gICAqIG1vZGU6IEMKPiA+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jIGIveGVuL2FyY2gveDg2
L2d1ZXN0L3hlbi94ZW4uYwo+ID4gaW5kZXggNmRiYzVmOTUzZi4uNjM5YTJhNGIzMiAxMDA2NDQK
PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKPiA+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9ndWVzdC94ZW4veGVuLmMKPiA+IEBAIC0zMTAsMTEgKzMxMCwxNyBAQCBzdGF0aWMgdm9p
ZCByZXN1bWUodm9pZCkKPiA+ICAgICAgICAgIHB2X2NvbnNvbGVfaW5pdCgpOwo+ID4gIH0KPiA+
ICAKPiA+ICtzdGF0aWMgaW50IGZsdXNoX3RsYihjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGNvbnN0
IHZvaWQgKnZhLCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gPiArewo+ID4gKyAgICByZXR1cm4geGVu
X2h5cGVyY2FsbF9odm1fb3AoSFZNT1BfZmx1c2hfdGxicywgTlVMTCk7Cj4gPiArfQo+ID4gKwo+
ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzID0gewo+ID4gICAgICAu
bmFtZSA9ICJYZW4iLAo+ID4gICAgICAuc2V0dXAgPSBzZXR1cCwKPiA+ICAgICAgLmFwX3NldHVw
ID0gYXBfc2V0dXAsCj4gPiAgICAgIC5yZXN1bWUgPSByZXN1bWUsCj4gPiArICAgIC5mbHVzaF90
bGIgPSBmbHVzaF90bGIsCj4gPiAgfTsKPiA+ICAKPiA+ICBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNv
cl9vcHMgKl9faW5pdCB4Z19wcm9iZSh2b2lkKQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9zbXAuYyBiL3hlbi9hcmNoL3g4Ni9zbXAuYwo+ID4gaW5kZXggNjVlYjdjYmRhOC4uOWJjOTI1
NjE2YSAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zbXAuYwo+ID4gKysrIGIveGVuL2Fy
Y2gveDg2L3NtcC5jCj4gPiBAQCAtMTUsNiArMTUsNyBAQAo+ID4gICNpbmNsdWRlIDx4ZW4vcGVy
ZmMuaD4KPiA+ICAjaW5jbHVkZSA8eGVuL3NwaW5sb2NrLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9j
dXJyZW50Lmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgo+ID4gICNpbmNsdWRlIDxhc20v
c21wLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9tYzE0NjgxOHJ0Yy5oPgo+ID4gICNpbmNsdWRlIDxh
c20vZmx1c2h0bGIuaD4KPiA+IEBAIC0yNTYsNiArMjU3LDE2IEBAIHZvaWQgZmx1c2hfYXJlYV9t
YXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsIHVuc2lnbmVkIGludCBm
bGFncykKPiA+ICAgICAgaWYgKCAoZmxhZ3MgJiB+RkxVU0hfT1JERVJfTUFTSykgJiYKPiA+ICAg
ICAgICAgICAhY3B1bWFza19zdWJzZXQobWFzaywgY3B1bWFza19vZihjcHUpKSApCj4gPiAgICAg
IHsKPiA+ICsgICAgICAgIGlmICggY3B1X2hhc19oeXBlcnZpc29yICYmCj4gPiArICAgICAgICAg
ICAgICEoZmxhZ3MgJiB+KEZMVVNIX1RMQiB8IEZMVVNIX1RMQl9HTE9CQUwgfCBGTFVTSF9WQV9W
QUxJRCB8Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIEZMVVNIX09SREVSX01BU0spKSAm
Jgo+ID4gKyAgICAgICAgICAgICAhaHlwZXJ2aXNvcl9mbHVzaF90bGIobWFzaywgdmEsIGZsYWdz
ICYgRkxVU0hfT1JERVJfTUFTSykgKQo+ID4gKyAgICAgICAgewo+ID4gKyAgICAgICAgICAgIGlm
ICggdGxiX2Nsa19lbmFibGVkICkKPiA+ICsgICAgICAgICAgICAgICAgdGxiX2Nsa19lbmFibGVk
ID0gZmFsc2U7Cj4gPiArICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAgICAgfQo+ID4gKwo+
IAo+IFBlciBteSB1bmRlcnN0YW5kaW5nLCBub3QgdHVybmluZyB0bGJfY2xrX2VuYWJsZWQgYmFj
ayB0byB0cnVlIGFmdGVyIGFuCj4gYXNzaXN0ZWQgZmx1c2ggZmFpbHMgaXMgb2theSwgYmVjYXVz
ZSB0aGUgZWZmZWN0IG9mIHRsYl9jbGtfZW5hYmxlZAo+IGJlaW5nIGZhbHNlIGlzIHRvIGFsd2F5
cyBtYWtlIE5FRURfRkxVU0ggcmV0dXJuIHRydWUuIFRoYXQgY2F1c2VzCj4gZXhjZXNzaXZlIGZs
dXNoaW5nLCBidXQgaXQgaXMgb2theSBpbiB0ZXJtcyBvZiBjb3JyZWN0bmVzcy4gRG8gSQo+IHVu
ZGVyc3RhbmQgaXQgY29ycmVjdGx5PwoKWWVzLCB0aGF0J3MgbXkgdW5kZXJzdGFuZGluZy4gVGhl
IHN0YW1wZWQgVExCIGlzIGFuIG9wdGltaXphdGlvbiBpbgpvcmRlciB0byBhdm9pZCBmbHVzaGVz
LiBLZWVwaW5nIGl0IGFsd2F5cyBvZmYgaXMgc2FmZSwgT1RPSCBoYXZpbmcgaXQKb24gd2l0aG91
dCBwcm9wZXJseSB0cmFja2luZyB0aGUgZmx1c2hlcyBjYW4gaW5kZWVkIGNhdXNlIGlzc3Vlcy4K
CkZvciB0aGUgdGltZSBiZWluZyBJIHdvdWxkIHJhdGhlciBsZWF2ZSBpdCBvZmYgd2hlbiBpdCdz
IGJlZW4KZGlzYWJsZWQgKGllOiBub3QgdHVybiBpdCBvbiBpZiB0aGUgYXNzaXN0ZWQgZmx1c2gg
ZmFpbHMpLCBhcyB0aGF0J3MKc2FmZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
