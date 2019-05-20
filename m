Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3202723967
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 16:07:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSiuX-0004pD-2N; Mon, 20 May 2019 14:05:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x+15=TU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hSiuV-0004p8-0C
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 14:05:03 +0000
X-Inumbo-ID: 41579f9a-7b08-11e9-9489-d3ba8def8d0c
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41579f9a-7b08-11e9-9489-d3ba8def8d0c;
 Mon, 20 May 2019 14:05:00 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 3beyqnKCOm6vngGE/kqhUIadVbXRUkYbf070MOtxqzENOQobMMYpGR2/35QyXQF6/4dp4782A/
 wXcuF5xYXWsZq0tIGAtQr6IvTurIxPHsvGXj5ZI3RSytDLEM3zA49FRjdfaQPJm+H3+WHDtqVy
 LZKxWnmmOXgh5+Sw9m9yZP1SaEJlakNPlTz0Ncmt5AQj2pAmP61gSJ8W26yWEudm9btLmdoJQY
 oeCexLd50YGz4L9btKZ/NGNDx96dDz3W46JqH8eBoBSR8HK0TaPuhgxOGFbzF+xeyTY88w/e28
 KjA=
X-SBRS: 2.7
X-MesageID: 638365
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="638365"
Date: Mon, 20 May 2019 16:04:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190520140449.5ihqctltaeiegqiz@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE927002000078002300BA@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CDE927002000078002300BA@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 13/15] x86/IRQ: tighten vector checks
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDQ6NTI6MzJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVXNlIHZhbGlkX2lycV92ZWN0b3IoKSByYXRoZXIgdGhhbiAiPiAwIi4KPiAKPiBBbHNv
IHJlcGxhY2UgYW4gb3Blbi1jb2RlZCB1c2Ugb2YgSVJRX1ZFQ1RPUl9VTkFTU0lHTkVELgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2Vk
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoZSBxdWVzdGlv
biBJIGhhdmUgYmVsb3cgaXMgbm90IGRpcmVjdGx5IHJlbGF0ZWQgdG8gdGhlIHVzYWdlIG9mCnZh
bGlkX2lycV92ZWN0b3IsIGJ1dCByYXRoZXIgd2l0aCB0aGUgZXhpc3RpbmcgY29kZS4KCj4gLS0t
Cj4gdjM6IE5ldy4KPiAKPiAtLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKPiArKysgYi94ZW4vYXJj
aC94ODYvaXJxLmMKPiBAQCAtMzQyLDcgKzM0Miw3IEBAIHZvaWQgY2xlYXJfaXJxX3ZlY3Rvcihp
bnQgaXJxKQo+ICAKPiAgaW50IGlycV90b192ZWN0b3IoaW50IGlycSkKPiAgewo+IC0gICAgaW50
IHZlY3RvciA9IC0xOwo+ICsgICAgaW50IHZlY3RvciA9IElSUV9WRUNUT1JfVU5BU1NJR05FRDsK
PiAgCj4gICAgICBCVUdfT04oaXJxID49IG5yX2lycXMgfHwgaXJxIDwgMCk7Cj4gIAo+IEBAIC00
NTIsMTUgKzQ1MiwxOCBAQCBzdGF0aWMgdm1hc2tfdCAqaXJxX2dldF91c2VkX3ZlY3Rvcl9tYXNr
Cj4gICAgICAgICAgICAgIGludCB2ZWN0b3I7Cj4gICAgICAgICAgICAgIAo+ICAgICAgICAgICAg
ICB2ZWN0b3IgPSBpcnFfdG9fdmVjdG9yKGlycSk7Cj4gLSAgICAgICAgICAgIGlmICggdmVjdG9y
ID4gMCApCj4gKyAgICAgICAgICAgIGlmICggdmFsaWRfaXJxX3ZlY3Rvcih2ZWN0b3IpICkKPiAg
ICAgICAgICAgICAgewo+IC0gICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJJUlEg
JWQgYWxyZWFkeSBhc3NpZ25lZCB2ZWN0b3IgJWRcbiIsCj4gKyAgICAgICAgICAgICAgICBwcmlu
dGsoWEVOTE9HX0lORk8gIklSUSVkIGFscmVhZHkgYXNzaWduZWQgdmVjdG9yICUwMnhcbiIsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgaXJxLCB2ZWN0b3IpOwo+ICAgICAgICAgICAgICAgICAg
Cj4gICAgICAgICAgICAgICAgICBBU1NFUlQoIXRlc3RfYml0KHZlY3RvciwgcmV0KSk7Cj4gIAo+
ICAgICAgICAgICAgICAgICAgc2V0X2JpdCh2ZWN0b3IsIHJldCk7Cj4gICAgICAgICAgICAgIH0K
PiArICAgICAgICAgICAgZWxzZSBpZiAoIHZlY3RvciAhPSBJUlFfVkVDVE9SX1VOQVNTSUdORUQg
KQo+ICsgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJJUlElZCBtYXBwZWQg
dG8gYm9ndXMgdmVjdG9yICUwMnhcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaXJxLCB2
ZWN0b3IpOwoKTWF5YmUgYWRkIGFuIGFzc2VydF91bnJlYWNoYWJsZSBoZXJlPyBJdCBzZWVtcyBy
ZWFsbHkgYm9ndXMgdG8gY2FsbAppcnFfZ2V0X3VzZWRfdmVjdG9yX21hc2sgd2l0aCBhbiB1bmFz
c2lnbmVkIHZlY3Rvci4KCkJ1dCBJJ20gbm90IHN1cmUgSSBmdWxseSB1bmRlcnN0YW5kIHRoaXMg
cGllY2Ugb2YgY29kZSwgbmVpdGhlciB3aHkgYQp2ZWN0b3Igd2l0aG91dCBhIElSUSBhc3NpZ25l
ZCBjYW4gaGF2ZSBhIHZlY3RvciBhc3NpZ25lZC4gSXMgdGhpcwpjb3ZlcmluZyB1cCBmb3IgdGhl
IGxhY2sgb2YgY2xlYW51cCBlbHNld2hlcmU/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
