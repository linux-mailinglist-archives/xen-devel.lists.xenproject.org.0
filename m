Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9991C8D2CD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 14:17:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxsBx-0008GM-H7; Wed, 14 Aug 2019 12:15:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SVGA=WK=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1hxsBv-0008GH-Eq
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 12:15:47 +0000
X-Inumbo-ID: 3ccc2b44-be8d-11e9-9a1c-4b0606d632c9
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ccc2b44-be8d-11e9-9a1c-4b0606d632c9;
 Wed, 14 Aug 2019 12:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565784944;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Acb+F3ZPq739WHdL4BiwYDBWXfJhtBa3loQ1/9v5wGU=;
 b=ZFm5QOOow4N+uIck1oeQM69m8xRc6bHtzt0/eQIeAY4C3KhsuAFbSv06
 VfqxRgheavI39k21KZin4GtFjXh9Ney0+eAu90Vhy/7lARnKPMSn5nfEV
 RtQkgWavHXWpJSWpIcKsme16BvJ+9Oo0tXEWGxSceIksl7tgWwGXELqkO Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jmuEOAXWs9rd2k7o7CIE0DJOihlLssveddgQ9zYP/q0Lgb8zh6mr8+EbefRdJHETh79J12j6Ys
 hnJHF0onyM+T5Gjq2xtmgjkTyCksI3kVOQiYDp/QY/bl268/5mbjLxDeBSLZ37Dd4TdUC5FtUw
 5VEBfDZyuvzVIZsoSf94v7bSgAaWboLTKau2b4U6hhYF6oj9xaPxOPmyZfoKkyhzZNjT1Ztr4K
 sjBC4o8CzX+0KM63cluZLdFyBelFlG5Uo+ufX/SqsM7bDt1S50cPmkIDr6JYLd8vRvZjHscxeu
 nFY=
X-SBRS: 2.7
X-MesageID: 4250596
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,385,1559534400"; 
   d="scan'208";a="4250596"
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Thread-Topic: [PATCH 2/2] xen: Drop XEN_DOMCTL_{get,set}_machine_address_size
Thread-Index: AQHVUcVneA1J2fLzIEOukWgLqAVg76b6buGA
Date: Wed, 14 Aug 2019 12:15:36 +0000
Message-ID: <5B5A2CB6-B211-4214-89AA-E9779CC094E4@citrix.com>
References: <20190813105352.32412-1-andrew.cooper3@citrix.com>
 <20190813105352.32412-3-andrew.cooper3@citrix.com>
In-Reply-To: <20190813105352.32412-3-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <6EAAFF3379927F4B836BEB0CA56DC84C@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/2] xen: Drop XEN_DOMCTL_{get,
 set}_machine_address_size
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
Cc: Wei Liu <wl@xen.org>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Rob Hoes <Rob.Hoes@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTMgQXVnIDIwMTksIGF0IDExOjUzLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFRoaXMgZnVuY3Rpb25hbGl0eSBpcyBvYnNv
bGV0ZS4gIEl0IHdhcyBpbnRyb2R1Y2VkIGJ5IGMvcyA0MTI5NjMxN2EzMSBpbnRvDQo+IFhlbmQs
IGJ1dCB3YXMgbmV2ZXIgZXhwb3NlZCBpbiBsaWJ4bC4NCj4gDQo+IE5vdGhpbmcgbGltaXRzIHRo
aXMgdG8gUFYgZ3Vlc3RzLCBidXQgaXQgbWFrZXMgbm8gc2Vuc2UgZm9yIEhWTSBndWVzdHMuDQo+
IA0KPiBMb29raW5nIHRocm91Z2ggdGhlIFhlblNlcnZlciB0ZW1wbGF0ZXMsIHRoaXMgd2FzIHVz
ZWQgdG8gd29yayBhcm91bmQgYnVncyBpbg0KPiB0aGUgMzJiaXQgUkhFTC9DZW50T1MgNC43IGFu
ZCA0Ljgga2VybmVscyAoZml4ZWQgaW4gNC45KSBhbmQgUkhFTC9DZW50T1MvT0VMDQo+IDUuMiBh
bmQgNS4zIGtlcm5lbHMgKGZpeGVkIGluIDUuNCkuICBSSEVMIDQgYXMgYSBtYWpvciB2ZXJzaW9u
IHdlbnQgb3V0IG9mDQo+IHN1cHBvcnQgaW4gMjAxNywgd2hlcmVhcyB0aGUgNS4yLzUuMyBrZXJu
ZWxzIHdlbnQgb3V0IG9mIHN1cHBvcnQgd2hlbiA1LjQgd2FzDQo+IHJlbGVhc2VkIGluIDIwMDku
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPg0KPiAtLS0NCg0KDQp0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwgICAgICB8
ICA1IC0tLS0tDQp0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpICAgICB8ICA1IC0tLS0t
DQp0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyB8IDI2IOKAlOKAlOKAlOKAlOKA
lOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlA0KDQpBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8
Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
