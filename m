Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D6AADB2C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:29:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7KcJ-0000ML-GK; Mon, 09 Sep 2019 14:26:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiN8=XE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7KcH-0000MG-S3
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:26:05 +0000
X-Inumbo-ID: be84cc92-d30d-11e9-ac0d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be84cc92-d30d-11e9-ac0d-12813bfff9fa;
 Mon, 09 Sep 2019 14:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568039160;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=T0vw8RWOCOSxzzztvx1zRb/VRH9+whId12I9Q5kJtr4=;
 b=Eid4TOhLCtAOIbpmI90aqfwFDsOCW9B1sDALwd6kGWhIOO+5kN+0H4pP
 /itAhemCDDwO1rlQaqkAsgVdPS+KoF0+35eFElL82PqzjYuSI/qVeis+5
 OAqqp3u8+VAbmW1dWOBHC1bBJjGhgPlrHs91c0zyd2LdUiMLbnw1wP7I6 k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: A0D5gUJii5wLgCK4ushi7LmJO4NRsW79BcKhjy8AqL49EeddlpQ+H1+AtHLkmGq7NeTJeUunpH
 9YZh0giOGVL6SMh0+puBP8zq9PtGIZtVdz3qow7EBXZMGHuOVYYqS06Vqw9HGBUhIv4r3EYYm9
 ZxpuYTbgQ0BB0wBF2/xdQp7umdkvbm1BQvJReKTwkfBQ8dFAqa1niFqIDxkBEpUj6yV1UwrGWJ
 maJmZPkfT5Pi0G0SAkVjhOYYVxP0f6KrN9syPkWa732uKyWXvGiQLACmlRMlZQnGkCQHFwv1DX
 Zzg=
X-SBRS: 2.7
X-MesageID: 5507105
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,486,1559534400"; 
   d="scan'208";a="5507105"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23926.24791.68467.930732@mariner.uk.xensource.com>
Date: Mon, 9 Sep 2019 15:25:27 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20190909134333.10927-1-andrew.cooper3@citrix.com>
References: <20190909134333.10927-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2] tools/ocaml: Fix xenctrl ABI and
 introduce build-time checks
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
Cc: Wei Liu <wl@xen.org>, Rob Hoes <Rob.Hoes@citrix.com>,
 Edvin Torok <edvin.torok@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Roger
 Pau Monne <roger.pau@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggdjJdIHRvb2xzL29jYW1sOiBGaXggeGVuY3Ry
bCBBQkkgYW5kIGludHJvZHVjZSBidWlsZC10aW1lIGNoZWNrcyIpOgo+IGMvcyBmMDg5ZmRkZDk0
MSBicm9rZSB0aGUgT2NhbWwgQUJJIGJ5IHJlbnVtZXJpbmcgWEVOX1NZU0NUTF9QSFlTQ0FQX2Rp
cmVjdGlvCj4gd2l0aG91dCBhZGp1c3RpbmcgdGhlIE9jYW1sIHBoeXNpbmZvX2NhcF9mbGFnIGVu
dW1lcmF0aW9uLiAgRml4IHRoaXMgYnkKPiBpbnNlcnRpbmcgQ0FQX1BWIGJldHdlZW4gQ0FQX0hW
TSBhbmQgQ0FQX0RpcmVjdElPLgouLi4KPiAgdHlwZSBwaHlzaW5mb19jYXBfZmxhZyA9Cj4gIAl8
IENBUF9IVk0KPiArCXwgQ0FQX1BWCj4gIAl8IENBUF9EaXJlY3RJTwoKSXQgaXMgc3VyZWx5IHNj
YW5kYWxvdXMgdGhhdCB3ZSBoYWQgdGhpcyBvcGVuLWNvZGluZyBoZXJlIG9mIGEKZHVwbGljYXRp
b24gb2YgYSBYZW4gQUJJIGxpc3QuICBUaGFua3MgZm9yIHRyeWluZyB0byBmaXggaXQuCgo+ICsv
Kgo+ICsgKiBWYXJpb3VzIGZpZWxkcyB3aGljaCBhcmUgYSBiaXRtYXAgaW4gdGhlIEMgQUJJIGFy
ZSBjb252ZXJ0ZWQgdG8gbGlzdHMgb2YKPiArICogaW50ZWdlcnMgaW4gdGhlIE9jYW1sIEFCSSBm
b3IgbW9yZSBpZGlvbWF0aWMgaGFuZGxpbmcuCgpFcnIsIEkgZG9uJ3QgdGhpbmsgeW91IG1lYW4g
bGlzdHMgb2YgaW50ZWdlcnMuICBJIHRoaW5rIHlvdSBtZWFuCmxpc3RzIGVudW1zLCB3aGljaCBo
YXBwZW4gdG8gYmUgZW51bXMuCgo+ICsJICogZW11bGF0aW9uX2ZsYWdzOiB4ODZfYXJjaF9lbXVs
YXRpb25fZmxhZ3MgbGlzdDsKPiArCSAqCj4gKwkgKiBUaGVzZSBCVUlMRF9CVUdfT04oKSdzIG1h
cCB0aGUgQyBBQkkgdG8gdGhlIE9jYW1sIEFCSS4gIElmIHRoZXkKPiArCSAqIHRyaXAsIHhlbmN0
cmwubWx7LGl9IG5lZWQgdXBkYXRpbmcgdG8gbWF0Y2guCj4gKwkgKi8KPiArCUJVSUxEX0JVR19P
TihYRU5fWDg2X0VNVV9MQVBJQyAgICAhPSAoMXUgPDwgIDApKTsKPiArCUJVSUxEX0JVR19PTihY
RU5fWDg2X0VNVV9IUEVUICAgICAhPSAoMXUgPDwgIDEpKTsKPiArCUJVSUxEX0JVR19PTihYRU5f
WDg2X0VNVV9QTSAgICAgICAhPSAoMXUgPDwgIDIpKTsKPiArCUJVSUxEX0JVR19PTihYRU5fWDg2
X0VNVV9SVEMgICAgICAhPSAoMXUgPDwgIDMpKTsKPiArCUJVSUxEX0JVR19PTihYRU5fWDg2X0VN
VV9JT0FQSUMgICAhPSAoMXUgPDwgIDQpKTsKPiArCUJVSUxEX0JVR19PTihYRU5fWDg2X0VNVV9Q
SUMgICAgICAhPSAoMXUgPDwgIDUpKTsKPiArCUJVSUxEX0JVR19PTihYRU5fWDg2X0VNVV9WR0Eg
ICAgICAhPSAoMXUgPDwgIDYpKTsKPiArCUJVSUxEX0JVR19PTihYRU5fWDg2X0VNVV9JT01NVSAg
ICAhPSAoMXUgPDwgIDcpKTsKPiArCUJVSUxEX0JVR19PTihYRU5fWDg2X0VNVV9QSVQgICAgICAh
PSAoMXUgPDwgIDgpKTsKPiArCUJVSUxEX0JVR19PTihYRU5fWDg2X0VNVV9VU0VfUElSUSAhPSAo
MXUgPDwgIDkpKTsKPiArCUJVSUxEX0JVR19PTihYRU5fWDg2X0VNVV9WUENJICAgICAhPSAoMXUg
PDwgMTApKTsKCkkgcmVhbGx5IGRvbid0IGxpa2UgdGhpcyBhcHByb2FjaC4gIEluc3RlYWQgb2Yg
YXV0b21hdGljYWxseSBkZXJpdmluZwp0aGUgb2NhbWwgZW51bSBmcm9tIHRoZSBYZW4gQUJJLCBv
ciBhdXRvbWF0aWNhbGx5IGNoZWNraW5nIHRoYXQgdGhlCm9jYW1sIEFCSSBhZ3JlZXMgd2l0aCB0
aGUgWGVuIG9uZSwgeW91IGFyZSBpbnN0ZWFkIGFkZGluZyBhIG5ldyBsaXN0CndoaWNoIGR1cGxp
Y2F0ZXMgdGhlIG9jYW1sIEFCSS4KCkkgc3VnZ2VzdCB3ZSBkbyBzb21ldGhpbmcgaW4gdGhlIGJ1
aWxkIHN5c3RlbSAtIGEgbmV3IHNjcmlwdCBvciBzaGVsbApydW5lLCB3aGljaCBpcyBnaXZlbiB0
aGUgc3RyaW5ncyBgeDg2X2FyY2hfZW11bGF0aW9uX2ZsYWdzJyBhbmQKYFg4Nl9FTVUnIChhbmQg
Y29ycmVzcG9uZGluZ2x5IGZvciB0aGUgb3RoZXIgZW51bXMpLgoKVGhlIG5ldyB0aGluZyB3b3Vs
ZCBzZWFyY2ggeGVuY3RybC5tbFtpXSBmb3IgdGhlIHR5cGUgYW5kIHJlYWQgdGhlCmVudW0gbGlz
dCB0aGVyZSB3aXRoIGFuIGFkLWhvYyBzaG9kZHkgb2NhbWwgcGFyc2VyIGFuZCB0aGVuIGRvIG9u
ZSBvcgptb3JlIG9mOgoKKGEpIHN5bnRoZXNpc2UgdGhlIGVudW0gY29udmVyc2lvbiBmdW5jdGlv
biB0byBtYXAgdGhlIGZsYWcKICAgIG51bWJlcnMgYmFjayBhbmQgZm9ydGggKGllIHRoZSBudW1i
ZXJzIGluIG9jYW1sIHdvdWxkIG5vCiAgICBsb25nZXIgbmVlZCB0byBtYXRjaCkKCihiKSBzeW50
aGVzaXNlIHRoZSBCVUlMRF9CVUdfT04gbGlzdCB5b3UgaGF2ZSBhYm92ZQoKKGMpIHNlYXJjaCB0
aGUgWGVuIGhlYWRlcnMgaXRzZWxmIGFuZCBjaGVjayB0aGUgdmFsdWUgY29ycmVzcG9uZGVuY2Vz
CgpJZGVhbGx5IGl0IHdvdWxkIGhhdmUgYmVlbiBiZXR0ZXIgdG8gYXV0b21hdGljYWxseSBnZW5l
cmF0ZQp4ZW5jdHJsLm1sW2ldIGZyb20gdGhlIFhlbiBoZWFkZXJzIGJ1dCBJIHJlamVjdGVkIHRo
YXQgYXMgYmVpbmcgdG9vCm11Y2ggYW5ub3lpbmcgaW50ZXJhY3Rpb24gd2l0aCB0aGUgb2NhbWwg
YnVpbGQuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
