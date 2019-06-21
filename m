Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F3F4EA84
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 16:26:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heKSU-0008Ck-MQ; Fri, 21 Jun 2019 14:24:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mzu6=UU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1heKST-0008CV-7I
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 14:24:05 +0000
X-Inumbo-ID: 369a93dc-9430-11e9-85bf-1b6b4e8f50d2
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 369a93dc-9430-11e9-85bf-1b6b4e8f50d2;
 Fri, 21 Jun 2019 14:24:01 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 19pVEMataOi29uXnV7lfO8PToLbb4jCydNtDymDzYgwzD2S8iZ7ZombN6DOvZb1br7SDPH8K8t
 vqHLkJKVVwCxZCO3l69Ou0NFHyo3tm4q0yIheJoNXP3WCTcXhLg0ZbOaJMuSMyrDq4cV9lC+s1
 UAFAIy2xsuwpL9r4EoV5g2YwAjIK3zBr2fz+0SU+CZQu7naQNRnuvqnttziBoD/7PJIFgWIcgr
 ZJBIg/LGtnsUV1wwdVQ56SRBLdQ/yBBfk+veroW0aPdf8CqVILGBZli/WAmxDKye2GTPJR3MGD
 kME=
X-SBRS: 2.7
X-MesageID: 2052570
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2052570"
To: Jan Beulich <JBeulich@suse.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8795020000780021F32C@prv1-mh.provo.novell.com>
 <f149d827-ac66-3460-2fa3-9c653bfbf91b@citrix.com>
 <5D0CE53E020000780023A293@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b7821a1f-469c-8586-64ec-96197ec56610@citrix.com>
Date: Fri, 21 Jun 2019 15:23:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5D0CE53E020000780023A293@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v8 49/50] x86emul: add a SHA test case to
 the harness
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEvMDYvMjAxOSAxNToxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMDYuMTkg
YXQgMTU6NTEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTUvMDMv
MjAxOSAxMTowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiArICAgICAgICAvKgo+Pj4gKyAgICAg
ICAgICogU0hBMjU2Uk5EUzIKPj4+ICsgICAgICAgICAqCj4+PiArICAgICAgICAgKiBTUkMxID0g
eyBDMCwgRDAsIEcwLCBIMCB9Cj4+PiArICAgICAgICAgKiBTUkMyID0geyBBMCwgQjAsIEUwLCBG
MCB9Cj4+PiArICAgICAgICAgKiBYTU0wID0gVycgPSB7ID8sID8sIFdLMSwgV0swIH0KPj4+ICsg
ICAgICAgICAqCj4+PiArICAgICAgICAgKiAoTkIgdGhhdCB0aGUgbm90YXRpb24gYWdhaW4gaXMg
bm90IEMtbGlrZSwgaS5lLiBlbGVtZW50cyBhcmUgbGlzdGVkCj4+PiArICAgICAgICAgKiBoaWdo
LXRvLWxvdyBldmVyeXdoZXJlIGluIHRoaXMgY29tbWVudC4pCj4+PiArICAgICAgICAgKgo+Pj4g
KyAgICAgICAgICogQ2goRSxGLEcpID0gKEUgJiBGKSBeICh+RSAmIEcpCj4+PiArICAgICAgICAg
KiBNYWooQSxCLEMpID0gKEEgJiBCKSBeIChBICYgQykgXiAoQiAmIEMpCj4+PiArICAgICAgICAg
Kgo+Pj4gKyAgICAgICAgICogw47CozAoQSkgPSBST1IyKEEpIF4gUk9SMTMoQSkgXiBST1IyMihB
KQo+Pj4gKyAgICAgICAgICogw47CozEoRSkgPSBST1I2KEUpIF4gUk9SMTEoRSkgXiBST1IyNShF
KQo+PiBUaGlzIGxvb2tzIGxpa2Ugc29tZSBlbmNvZGluZyBwcm9ibGVtcyAoYW5kIGxhdGVyIG9u
IGluIHRoZSBjb21tZW50KS4gIEkKPj4gY2FuJ3QgdGVsbCB3aGV0aGVyIGl0IGlzIGEgY29uc2Vx
dWVuY2Ugb2YgdGhlIGVtYWlsIG9yIHNvbWV0aGluZyBwcmVzZW50Cj4+IGluIHRoZSB1bmRlcmx5
aW5nIHBhdGNoLiAKPiBPaCAtIEkgZm9yZ290IHRvIHByb3Blcmx5IGVuZm9yY2UgVVRGOCB3aGls
ZSBjb21wb3NpbmcgdGhlIG1haWwuCj4gVGhpcyBpcyB3aGF0IGl0J2xsIGxvb2tzIGxpa2Ugd2hl
biBjb21taXR0ZWQ6Cj4KPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBTSEEyNTZSTkRTMgo+ICAg
ICAgICAgICoKPiAgICAgICAgICAqIFNSQzEgPSB7IEMwLCBEMCwgRzAsIEgwIH0KPiAgICAgICAg
ICAqIFNSQzIgPSB7IEEwLCBCMCwgRTAsIEYwIH0KPiAgICAgICAgICAqIFhNTTAgPSBXJyA9IHsg
PywgPywgV0sxLCBXSzAgfQo+ICAgICAgICAgICoKPiAgICAgICAgICAqIChOQiB0aGF0IHRoZSBu
b3RhdGlvbiBhZ2FpbiBpcyBub3QgQy1saWtlLCBpLmUuIGVsZW1lbnRzIGFyZSBsaXN0ZWQKPiAg
ICAgICAgICAqIGhpZ2gtdG8tbG93IGV2ZXJ5d2hlcmUgaW4gdGhpcyBjb21tZW50LikKPiAgICAg
ICAgICAqCj4gICAgICAgICAgKiBDaChFLEYsRykgPSAoRSAmIEYpIF4gKH5FICYgRykKPiAgICAg
ICAgICAqIE1haihBLEIsQykgPSAoQSAmIEIpIF4gKEEgJiBDKSBeIChCICYgQykKPiAgICAgICAg
ICAqCj4gICAgICAgICAgKiDOozAoQSkgPSBST1IyKEEpIF4gUk9SMTMoQSkgXiBST1IyMihBKQo+
ICAgICAgICAgICogzqMxKEUpID0gUk9SNihFKSBeIFJPUjExKEUpIF4gUk9SMjUoRSkKClRoYXQg
cmVhZHMgbXVjaCBiZXR0ZXIuCgo+Cj4+PiArc3RhdGljIGJvb2wgc2ltZF9jaGVja19hdnhfc2hh
KHZvaWQpCj4+PiArewo+Pj4gKyAgICByZXR1cm4gY3B1X2hhc19zaGEgJiYgY3B1X2hhc19hdng7
Cj4+IEkgY2FuJ3QgbG9jYXRlIGFueSBbRV1WRVggZW5jb2RpbmcgaW5mb3JtYXRpb24gZm9yIHRo
ZSBTSEEKPj4gaW5zdHJ1Y3Rpb25zLiAgSXMgdGhpcyBhIHNpZGUgZWZmZWN0IG9mIHRoZSByZXN0
IG9mIHRoZSB0ZXN0IGFsZ29yaXRobSwKPj4gb3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZyBpbiB0
aGUgbWFudWFsPwo+IFRoZXJlIGFyZSBvbmx5IGxlZ2FjeSBmb3JtcyBhcyBvZiBub3cuIE5vdGUg
dGhlIHNpbmdsZSBzZW50ZW5jZSBpbgo+IHRoZSBjb21taXQgbWVzc2FnZToKPgo+ICJBbHNvIHVz
ZSB0aGlzIGZvciBBVlg1MTJWTCBWUFJPe0wsUn17LFZ9RCBhcyB3ZWxsIGFzIHNvbWUgZnVydGhl
ciBzaGlmdHMKPiAgdGVzdGluZy4iCj4KPiBUaGUgQVZYIGFuZCBBVlg1MTJGIGZsYXZvcnMgb2Yg
dGhlIHRlc3QgYXJlIGdvb2QgdGVzdCBjYXNlcyBmb3Igb3RoZXIKPiBpbnNuczsgdGhleSBhcmUg
c3RpbGwgb25seSB1dGlsaXppbmcgbGVnYWN5IGVuY29kZWQgU0hBIGluc25zLgoKT2suwqAgQWNr
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
