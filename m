Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2030F12612D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:47:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihuF7-0008NV-Mg; Thu, 19 Dec 2019 11:45:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiZr=2J=amazon.com=prvs=249f004f8=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihuF5-0008NQ-LG
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 11:45:19 +0000
X-Inumbo-ID: 035d5b90-2255-11ea-88e7-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 035d5b90-2255-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 11:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576755912; x=1608291912;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zdv36sfBDUrpZuS56xBNFCJOdACRsBCMsJgoIHAfJtE=;
 b=IP3DkntH5oW0X5T6IDes453rWFtgKSkBVb5nkylXXB70/VOeYY2/yNTr
 AzJCHz/kFFzTipj/JYFOjsbCsXICGpvklBXZeljbt73/hBmSSpiC7JPvw
 moAyL6nBx3QWcLIKudbSiQbWx16qJ9/ft42DHVJG0Mv1SXbo95IAEkM1O g=;
IronPort-SDR: tiDq7L5aNe+EtgKc4OrrXcxyXpmPCLOCc6GZi5AVRI4aT3d4YHiwAxe6isEScHqWPEuNUkNu+1
 kd+eMz6k41aw==
X-IronPort-AV: E=Sophos;i="5.69,331,1571702400"; 
   d="scan'208";a="8326581"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 19 Dec 2019 11:45:10 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id CDBF7A1787; Thu, 19 Dec 2019 11:45:08 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 11:45:08 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 11:45:07 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 19 Dec 2019 11:45:07 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] x86/save: reserve HVM save record numbers
 that have been consumed...
Thread-Index: AQHVtb2HD8UZZLEQMEaUpPbPmxeuyqfAS8OAgADZnRCAACP1gIAAAonAgAAIAQCAAAMtsA==
Date: Thu, 19 Dec 2019 11:45:07 +0000
Message-ID: <121745b60779415aab50d1364e6c6395@EX13D32EUC003.ant.amazon.com>
References: <20191218160926.12538-1-pdurrant@amazon.com>
 <f72c26d5-ba96-5804-126a-865af62ceff1@citrix.com>
 <671333aff34f4e92bded1ad705264e02@EX13D32EUC003.ant.amazon.com>
 <0a4f237a-b744-50f8-7bd2-e53ddffea78e@citrix.com>
 <80696690f8874a4da7a6c2f724cc78b4@EX13D32EUC003.ant.amazon.com>
 <cc25d9e4-412f-a297-7f3c-8543d10cca59@citrix.com>
In-Reply-To: <cc25d9e4-412f-a297-7f3c-8543d10cca59@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.49]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/save: reserve HVM save record numbers
 that have been consumed...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAxOSBEZWNlbWJlciAyMDE5IDExOjMwDQo+
IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0hdIHg4Ni9zYXZlOiByZXNl
cnZlIEhWTSBzYXZlIHJlY29yZCBudW1iZXJzDQo+IHRoYXQgaGF2ZSBiZWVuIGNvbnN1bWVkLi4u
DQo+IA0KPiBPbiAxOS8xMi8yMDE5IDExOjA2LCBEdXJyYW50LCBQYXVsIHdyb3RlOg0KPiA+PiBJ
dCBpcyBub3QgZmFpciBvciByZWFzb25hYmxlIHRvIGluY2x1ZGUgZXh0cmEgaGVhZHJvb20gaW4g
YSAib2ggZGVhciB3ZQ0KPiA+PiBzY3Jld2VkIHVwIC0gd2lsbCB0aGUgY29tbXVuaXR5IGJlIGtp
bmQgZW5vdWdoIHRvIGhlbHAgdXMgd29yayBhcm91bmQNCj4gPj4gb3VyIEFCSSBwcm9ibGVtcyIg
c2NlbmFyaW8uDQo+ID4+DQo+ID4gSSB3b3VsZCBoYXZlIHRob3VnaHQgYWxsIHRoZSBwYWluIHlv
dSB3ZW50IHRocm91Z2ggdG8ga2VlcCBYZW5TZXJ2ZXINCj4gZ29pbmcgd2l0aCBpdHMgbm9uLXVw
c3RyZWFtZWQgaHlwZXJjYWxsIG51bWJlcnMgd291bGQgaGF2ZSBtYWRlIHlvdSBhDQo+IGxpdHRs
ZSBtb3JlIHN5bXBhdGhldGljIHRvIGRlYWxpbmcgd2l0aCBwYXN0IG1pc3Rha2VzLg0KPiANCj4g
SSBjb3VsZCBvYmplY3QgdG8gdGhlIHByaW5jaXBsZSBvZiB0aGUgcGF0Y2gsIGlmIHlvdSdkIHBy
ZWZlciA6KQ0KPiANCj4gSWYgeW91IHJlY2FsbCBmb3IgdGhlIGxlZ2FjeSB3aW5kb3cgUFYgZHJp
dmVyIEFCSSBicmVha2FnZXMsIEkgZGlkbid0DQo+IGFjdHVhbGx5IHJlc2VydmUgYW55IG51bWJl
cnMgdXBzdHJlYW0gaW4gdGhlIGVuZC7CoCBBbGwgY29tcGF0aWJpbGl0eSB3YXMNCj4gaGFuZGxl
ZCBsb2NhbGx5Lg0KDQpBbmQgSSByZW1lbWJlciBob3cgbmFzdHkgdGhlIGhhY2tzIHdlcmUgOy0p
DQoNCkdpdmVuIHdlIGRvbid0IHlldCBoYXZlIGEgY2xhc2ggdGhhdCByZXF1aXJlcyBzdWNoIG5h
c3RpbmVzcywgSSBqdXN0IHdhbnQgdG8gYXZvaWQgaXQgaGFwcGVuaW5nIGJlZm9yZSB3ZSBtYW5h
Z2UgdG8gZGlzcGVuc2Ugd2l0aCB0aGUgZG93bnN0cmVhbS1vbmx5IGxlZ2FjeSBjb2RlLg0KDQo+
IA0KPiA+PiBGb3Igbm93LCBJJ2QganVzdCBsZWF2ZSBpdCBhcyBhIGNvbW1lbnQsIGFuZCBzdHJp
Y3RseSBvbmx5IGNvdmVyaW5nIHRoZQ0KPiA+PiBvbmVzIHlvdSBoYXZlIHVzZWQuwqAgVGhlcmUg
aXMgbm8gbmVlZCB0byBhY3R1YWxseSBidW1wIHRoZSBzdHJ1Y3R1cmUNCj4gPj4gc2l6ZXMgaW4g
eGVuIGZvciBub3cgLSBzaW1wbHkgdGhhdCB0aGUgb25lcyB5b3UgaGF2ZSBjdXJyZW50bHkgdXNl
ZA0KPiA+PiBkb24ndCBnZXQgYWxsb2NhdGVkIGZvciBzb21ldGhpbmcgZGlmZmVyZW50IGluIHRo
ZSBmdXR1cmUuDQo+ID4+DQo+ID4gT2ssIHdlIGNhbiBkZWZlciBhY3R1YWxseSBidW1waW5nIEhW
TV9TQVZFX0NPREVfTUFYLCBidXQgaXQncyBhbG1vc3QNCj4gY2VydGFpbiB0byBoYXBwZW4gZXZl
bnR1YWxseS4NCj4gDQo+IFRoYXQncyBmaW5lLg0KPiANCg0KT2suIEknbGwgc2VuZCBhIHYyIHdp
dGgganVzdCB0aGUgY29tbWVudCAoYW5kIGFzc3VtZSBXZWkncyBSLWIgc3RpbGwgc3RhbmRzKS4N
Cg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
