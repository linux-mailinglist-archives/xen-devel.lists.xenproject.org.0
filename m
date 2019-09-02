Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E8CA5219
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 10:46:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4huJ-0006F6-Fv; Mon, 02 Sep 2019 08:41:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v281=W5=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i4huH-0006F1-Vw
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 08:41:50 +0000
X-Inumbo-ID: 80cbe9e0-cd5d-11e9-951b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80cbe9e0-cd5d-11e9-951b-bc764e2007e4;
 Mon, 02 Sep 2019 08:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567413709;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RwpLB2WTtR/XZ5nNct0XxCwdqIp9h9R4eQ47bTi7iTg=;
 b=hCKLEgcw9QY1MWIOoaUB+8+Hih04kczgOdRFa9g2DtKJAtrQbM+Ktt9l
 j0PfZ1f29VdjKQIXbv1m1DRiIpVUJBRFnFWwLqm2HmYwNaT36peaKoUhA
 lfBxHML3Zj3Ytw/xPGtTlckCght953E0dZwjamwrUdDWftZCTb3yUZTG2 o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 246VsTptCEc/8Uk8I2nypizZ+mVvcq9JfSnzppRslUDonKUICOgViu8vxhjI5UTGSRqcCGCJIO
 FU38V3S52WozcdVZDj9f41gANUwj6mxUw2dY3zABWsx7Bsp23Z7gQ76mPzEfeeDer3XcUCIizz
 qERYupJ7yIkkIZh2d550l2+kcmoxxIhWc4sSRVAfjlserhAOw+tN7JCXCh/RvIDpoa9NkOkFha
 3SXLbJGg5E208dhyF0vSyn+ngk93FHGTmTeaTM0gPBGpP9O0hsHBGq14ebcN1NVGJOlv2O5k57
 cnY=
X-SBRS: 2.7
X-MesageID: 5230835
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,457,1559534400"; 
   d="scan'208";a="5230835"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v3 3/3] Add logic to use V section entry in THE REST for
 identifying xen trees
Thread-Index: AQHVX27uInvNhEKOKkCHxeaVy9R7G6cX6r+AgAAaHYA=
Date: Mon, 2 Sep 2019 08:41:44 +0000
Message-ID: <F7D2BF57-18B4-4F91-A716-55ED143DC34B@citrix.com>
References: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
 <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
 <b074bb1de3366dddbdde8e34703e35d9e6e1eab8.1567195654.git-series.lars.kurth@citrix.com>
 <597fbb03-360d-7758-290e-278c6a341e04@suse.com>
In-Reply-To: <597fbb03-360d-7758-290e-278c6a341e04@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <315819DD5FBC78438EF666A8282E2159@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 3/3] Add logic to use V section entry in
 THE REST for identifying xen trees
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDAyLzA5LzIwMTksIDA5OjA4LCAiSmFuIEJldWxpY2giIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICBPbiAzMC4wOC4yMDE5IDIyOjA5LCBMYXJzIEt1cnRoIHdyb3Rl
Og0KICAgID4gU3BlY2lmaWNhbGx5Og0KICAgID4gKiBNb3ZlIGNoZWNrIHVudGlsIGFmdGVyIHRo
ZSBNQUlOVEFJTkVSUyBmaWxlIGhhcyBiZWVuIHJlYWQNCiAgICA+ICogQWRkIGdldF94ZW5fbWFp
bnRhaW5lcnNfZmlsZV92ZXJzaW9uKCkgZm9yIGNoZWNrDQogICAgPiAqIFJlbW92ZSB0b3Bfb2Zf
dHJlZSBhcyBub3QgbmVlZGVkIGFueSBtb3JlDQogICAgPiAqIEZhaXVsIHdpdGggZXh0ZW5kZWQg
ZXJyb3IgbWVzc2FnZSB3aGVuIHVzZWQgb3V0IG9mIHRyZWUNCiAgICA+IA0KICAgID4gU2lnbmVk
LW9mZi1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPg0KICAgIA0KICAgIEp1
c3QgYSBjb3VwbGUgb2Ygbml0cyAobXkgUGVybCBpcyBmYXIgZnJvbSBnb29kIGVub3VnaCB0byBh
Y3R1YWxseQ0KICAgIGdpdmUgYW4gYWNrKToNCiAgICANCiAgICA+IEBAIC0zMTEsNiArMzA2LDE2
IEBAIHdoaWxlICg8JG1haW50Pikgew0KICAgID4gIH0NCiAgICA+ICBjbG9zZSgkbWFpbnQpOw0K
ICAgID4gIA0KICAgID4gKyMgQ2hlY2sgd2hldGhlciB3ZSBoYXZlIGEgViBlbnRyeSB1bmRlciB0
aGUgUkVTVA0KICAgID4gKyMgaG5kIHVzZSBpdCB0byBnZXQgdGhlIGZpbGUncyB2ZXJzaW9uIG51
bWJlcg0KICAgIA0KICAgIHMvaG5kL2FuZC8gDQoNCkkgcmVhbGx5IHNob3VsZG4ndCBzZW5kIHBh
dGNoZXMgb3V0IGluIGEgcnVzaC4gVGhhbmsgeW91IQ0KICAgIA0KICAgID4gQEAgLTU2NCw2ICs1
NjksMzIgQEAgc3ViIHJhbmdlX2hhc19tYWludGFpbmVyIHsNCiAgICA+ICAgICAgcmV0dXJuIDA7
DQogICAgPiAgfQ0KICAgID4gIA0KICAgID4gK3N1YiBnZXRfeGVuX21haW50YWluZXJzX2ZpbGVf
dmVyc2lvbiB7DQogICAgPiArICAgIG15ICR0dmkgPSBmaW5kX2ZpcnN0X3NlY3Rpb24oKTsNCiAg
ICA+ICsNCiAgICA+ICsgICAgd2hpbGUgKCR0dmkgPCBAdHlwZXZhbHVlKSB7DQogICAgPiArICAg
ICAgICBteSAkc3RhcnQgPSBmaW5kX3N0YXJ0aW5nX2luZGV4KCR0dmkpOw0KICAgID4gKyAgICAg
ICAgbXkgJGVuZCA9IGZpbmRfZW5kaW5nX2luZGV4KCR0dmkpOw0KICAgID4gKyAgICAgICAgbXkg
JGk7DQogICAgPiArDQogICAgPiArICAgICAgICBmb3IgKCRpID0gJHN0YXJ0OyAkaSA8ICRlbmQ7
ICRpKyspIHsNCiAgICA+ICsgICAgICAgICAgICBteSAkbGluZSA9ICR0eXBldmFsdWVbJGldOw0K
ICAgID4gKwkgICAgaWYgKCRsaW5lID1+IG0vXlY6XHMqKC4qKS8pIHsNCiAgICANCiAgICBBIGhh
cmQgdGFiIGxvb2tzIHRvIGhhdmUgc2xpcHBlZCBpbiBoZXJlLg0KICAgIA0KICAgID4gKyAgICAg
ICAgICAgICAgICBteSAkdHlwZSA9ICQxOw0KICAgIA0KICAgIFRoaXMgdmFyaWFibGUgbG9va3Mg
dG8gYmUgdW51c2VkLCBidXQgcGVyaGFwcyBpdHMgZGVjbGFyYXRpb24NCiAgICBoYXMgc29tZSBz
aWRlIGVmZmVjdD8NCiAgICANCkl0IGlzIHJlYWxseSB1bm5lZWRlZA0KTGFycyAgICANCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
