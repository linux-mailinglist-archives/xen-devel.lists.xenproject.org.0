Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CDA14BE68
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 18:19:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwUUN-0004YB-Vf; Tue, 28 Jan 2020 17:17:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g73u=3R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwUUM-0004Y5-8t
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 17:17:22 +0000
X-Inumbo-ID: 0accdf9c-41f2-11ea-ad98-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0accdf9c-41f2-11ea-ad98-bc764e2007e4;
 Tue, 28 Jan 2020 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580231841;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=18aJdCc6BG2AGblS+xnM4v6jLC55jZb6quxhvgSFF1c=;
 b=J5GttLoKU0738zf3dn9Phcza0Yf13QYipCkWNl1toNb/Poae1/xqX8WP
 kEOQBYOzTyqz4sO28vkj3VLR04Unk/4+e00309xDuoiHYGlRP5oiz6ipy
 tv95BMzU6CAq1m4cjYQURyY+uOgONURp5TimTM0rZl6iiedBWK8ggStry w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1vSBxBDmbh9cksOXhkGkjCx/n8qur9AP4ytbjlJAY1QQz3tw+XA3G7gMloMr/UGr3+DlMC7Hd8
 4Hwly81aIe/tq2OLbgs2uWq9CZVleA0yD1aya6HmjAFDqz2AO9tNEQBmRuQHBdFMAW8fQcO8q/
 Uj1tz3KXippsP1byzjWfbbpPo5shevdSbUr48nMyGN7hRpjBtkLg1n/W/yvuREsjhIY/zTx9s5
 w9nCaswSqC/qhoZNVwxN66nHdeNUW+YLX98sb2mmTbz/It92VnRKBBkLWbUmazhWIQndxW/Vkq
 BGc=
X-SBRS: 2.7
X-MesageID: 12170232
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,374,1574139600"; d="scan'208";a="12170232"
Date: Tue, 28 Jan 2020 18:16:51 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200128171651.GR57924@desktop-tdan49n.eng.citrite.net>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-8-roger.pau@citrix.com>
 <20200128141736.223qryuo3p2ss4ma@debian>
 <20200128145704.GQ57924@desktop-tdan49n.eng.citrite.net>
 <20200128162424.2typsfo76l7655sc@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128162424.2typsfo76l7655sc@debian>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDQ6MjQ6MjRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEphbiAyOCwgMjAyMCBhdCAwMzo1NzowNFBNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDI6MTc6MzZQTSArMDAwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gT24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDc6MTE6MTVQTSAr
MDEwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiBbLi4uXQo+ID4gPiA+ICAKPiA+ID4g
PiAgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpfX2luaXQgeGdfcHJvYmUodm9pZCkKPiA+
ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcC5jIGIveGVuL2FyY2gveDg2L3NtcC5j
Cj4gPiA+ID4gaW5kZXggNjVlYjdjYmRhOC4uOWJjOTI1NjE2YSAxMDA2NDQKPiA+ID4gPiAtLS0g
YS94ZW4vYXJjaC94ODYvc21wLmMKPiA+ID4gPiArKysgYi94ZW4vYXJjaC94ODYvc21wLmMKPiA+
ID4gPiBAQCAtMTUsNiArMTUsNyBAQAo+ID4gPiA+ICAjaW5jbHVkZSA8eGVuL3BlcmZjLmg+Cj4g
PiA+ID4gICNpbmNsdWRlIDx4ZW4vc3BpbmxvY2suaD4KPiA+ID4gPiAgI2luY2x1ZGUgPGFzbS9j
dXJyZW50Lmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4KPiA+ID4gPiAgI2luY2x1
ZGUgPGFzbS9zbXAuaD4KPiA+ID4gPiAgI2luY2x1ZGUgPGFzbS9tYzE0NjgxOHJ0Yy5oPgo+ID4g
PiA+ICAjaW5jbHVkZSA8YXNtL2ZsdXNodGxiLmg+Cj4gPiA+ID4gQEAgLTI1Niw2ICsyNTcsMTYg
QEAgdm9pZCBmbHVzaF9hcmVhX21hc2soY29uc3QgY3B1bWFza190ICptYXNrLCBjb25zdCB2b2lk
ICp2YSwgdW5zaWduZWQgaW50IGZsYWdzKQo+ID4gPiA+ICAgICAgaWYgKCAoZmxhZ3MgJiB+RkxV
U0hfT1JERVJfTUFTSykgJiYKPiA+ID4gPiAgICAgICAgICAgIWNwdW1hc2tfc3Vic2V0KG1hc2ss
IGNwdW1hc2tfb2YoY3B1KSkgKQo+ID4gPiA+ICAgICAgewo+ID4gPiA+ICsgICAgICAgIGlmICgg
Y3B1X2hhc19oeXBlcnZpc29yICYmCj4gPiA+ID4gKyAgICAgICAgICAgICAhKGZsYWdzICYgfihG
TFVTSF9UTEIgfCBGTFVTSF9UTEJfR0xPQkFMIHwgRkxVU0hfVkFfVkFMSUQgfAo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgRkxVU0hfT1JERVJfTUFTSykpICYmCj4gPiA+ID4gKyAg
ICAgICAgICAgICAhaHlwZXJ2aXNvcl9mbHVzaF90bGIobWFzaywgdmEsIGZsYWdzICYgRkxVU0hf
T1JERVJfTUFTSykgKQo+ID4gPiA+ICsgICAgICAgIHsKPiA+ID4gPiArICAgICAgICAgICAgaWYg
KCB0bGJfY2xrX2VuYWJsZWQgKQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgdGxiX2Nsa19lbmFi
bGVkID0gZmFsc2U7Cj4gPiA+IAo+ID4gPiBZb3UgbWF5IGRlbGV0ZSB0aGUgaWYgaGVyZSB0byBt
YWtlIHRoZSBnZW5lcmF0ZWQgbWFjaGluZSBjb2RlIHNob3J0ZXIuCj4gPiAKPiA+IEhtLCBidXQg
dGxiX2Nsa19lbmFibGVkIGlzIG1hcmtlZCBhcyByZWFkX21vc3RseSwgd2hpY2ggd29uJ3QgYmUg
dHJ1ZQo+ID4gdGhlbiwgYW5kIHdvdWxkIGxpa2VseSBoYXZlIGEgcGVyZm9ybWFuY2UgaW1wYWN0
Lgo+IAo+IE9LLiBGYWlyIGVub3VnaC4KPiAKPiA+IAo+ID4gPiBPT0kgd2h5IGlzbid0IHRsYl9j
bGtfZW5hYmxlZCBzZXQgdG8gZmFsc2Ugd2hlbiBYZW4gZGV0ZXJtaW5lcyB0byB1c2UgTDAKPiA+
ID4gYXNzaXN0ZWQgZmx1c2g/Cj4gPiAKPiA+IEwwIGFzc2lzdGVkIGZsdXNoIGNhbiBmYWlsIChp
ZTogcmV0dXJuIGFuIGVycm9yKSwgYW5kIGluIHRoYXQgY2FzZSBYZW4KPiA+IHdvdWxkIGJlIGJl
dHRlciB0byBjb250aW51ZSB1c2luZyB0aGUgdGltZXN0YW1wZWQgdGxiLCBhcyBpdCBjb3VsZAo+
ID4gYXZvaWQgc29tZSBmbHVzaGVzLgo+IAo+IERvIHlvdSBuZWVkIHRvIHNldCB0bGJfY2xrX2Vu
YWJsZWQgaW4gdGhhdCBjYXNlPwoKQUZBSUNUIGl0J3Mgc2FmZSB0byBlbmFibGUgdGhlIFRMQiB0
aW1lc3RhbXBzIGFmdGVyIGJlaW5nIGRpc2FibGVkLApidXQgaHlwZXJ2aXNvcl9mbHVzaF90bGIg
Y291bGQgZmFpbCBpbnRlcm1pdHRlbnRseSB3aXRoIEVCVVNZIGluIHRoZQpYZW4gaW1wbGVtZW50
YXRpb24sIGFuZCBJIGRvbid0IHJlYWxseSB3YW50IHRoYXQgdG8gY2F1c2Ugc3B1cmlvdXMKZW5h
Ymxpbmcgb2YgdGhlIHRpbWVzdGFtcHMgcGVyaW9kaWNhbGx5LgoKTXkgZXhwZWN0YXRpb24gd291
bGQgYmUgdGhhdCBzdWNoIGFzc2lzdGFuY2UgY291bGQgZmFpbCBzcG9yYWRpY2FsbHksCmJ1dCBp
dCBzaG91bGRuJ3QgcmUtZW5hYmxlIHRoZSB0aW1lc3RhbXBlZCBUTEIgYXMgZmFpbHVyZSB3b3Vs
ZCBiZQppbmZyZXF1ZW50LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
