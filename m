Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB9013D734
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 10:49:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is1jF-0008IH-O6; Thu, 16 Jan 2020 09:46:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TxvK=3F=amazon.co.uk=prvs=27736368b=pdurrant@srs-us1.protection.inumbo.net>)
 id 1is1jE-0008IC-84
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 09:46:16 +0000
X-Inumbo-ID: 0768cd68-3845-11ea-86de-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0768cd68-3845-11ea-86de-12813bfff9fa;
 Thu, 16 Jan 2020 09:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579167972; x=1610703972;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fj4LQIjMCR2gqfY/PAfCFYwZfkvi6OiFL57VWItKBqU=;
 b=K7W7d3HgLwu3A+O9dMY6FctxJDgJTZJuZkf++FD98Nj6+Yu9XFdPm0YD
 aXxqqsjBoeE3EfRvgX3h7uIhPfmZtbS54ADh55C6qntRXrli0DpSh2yoE
 g2Z+zpNhMvJYk4P7bt9dRrQZoD1feT3kVPhDXnnWluvbKyzAj9fUctss9 E=;
IronPort-SDR: hnv30VK86uDKHRxRDY+lyEE8YItYsJ0XYABR9wK3iJ79emuq7poyuAFyjem9qpMpBaozIeUbBl
 NsiPEAhmIntg==
X-IronPort-AV: E=Sophos;i="5.70,325,1574121600"; d="scan'208";a="11784738"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 16 Jan 2020 09:46:11 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 32D87A2746; Thu, 16 Jan 2020 09:46:09 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 16 Jan 2020 09:46:08 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 16 Jan 2020 09:46:08 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 16 Jan 2020 09:46:07 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v3 4/6] libxl: allow creation of domains with a specified
 or random domid
Thread-Index: AQHVzFBoLAnvKVVhW06F0xOPMrYEQKftCUOAgAABTKA=
Date: Thu, 16 Jan 2020 09:46:07 +0000
Message-ID: <e9e082e9c1a94b7a88ab45cfda5c06d7@EX13D32EUC003.ant.amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-5-pdurrant@amazon.com>
 <f8104de4-1323-fa8f-5f8a-de73a9ce63e0@suse.com>
In-Reply-To: <f8104de4-1323-fa8f-5f8a-de73a9ce63e0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.29]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 4/6] libxl: allow creation of domains
 with a specified or random domid
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE2IEphbnVhcnkgMjAyMCAxMDo0MA0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBJYW4gSmFja3Nvbg0KPiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47
IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbnRob255IFBFUkFSRA0KPiA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ow0K
PiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+OyBKdWxpZW4gR3Jh
bGwNCj4gPGp1bGllbkB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2ls
a0BvcmFjbGUuY29tPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgamFuZHJ5dWtAZ21haWwuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNC82XSBs
aWJ4bDogYWxsb3cgY3JlYXRpb24gb2YgZG9tYWlucyB3aXRoIGENCj4gc3BlY2lmaWVkIG9yIHJh
bmRvbSBkb21pZA0KPiANCj4gT24gMTYuMDEuMjAyMCAxMDozNiwgUGF1bCBEdXJyYW50IHdyb3Rl
Og0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaA0KPiA+ICsrKyBiL3hlbi9pbmNs
dWRlL3B1YmxpYy94ZW4uaA0KPiA+IEBAIC02MTQsNiArNjE0LDkgQEAgREVGSU5FX1hFTl9HVUVT
VF9IQU5ETEUobW11ZXh0X29wX3QpOw0KPiA+ICAvKiBJZGxlIGRvbWFpbi4gKi8NCj4gPiAgI2Rl
ZmluZSBET01JRF9JRExFICAgICAgICAgICB4ZW5fbWtfdWludCgweDdGRkYpDQo+ID4NCj4gPiAr
LyogTWFzayBmb3IgdmFsaWQgZG9tYWluIGlkIHZhbHVlcyAqLw0KPiA+ICsjZGVmaW5lIERPTUlE
X01BU0sgICAgICAgICAgIDB4N0ZGRg0KPiANCj4gU2VlaW5nIGl0IHVzZWQgaW4gY29udGV4dCwg
YW55IHJlYXNvbiBub3QgdG8gdXNlIHhlbl9ta191aW50KCkNCj4gaGVyZSBhcyB3ZWxsPw0KPiAN
Cg0KSSBkaWQgd29uZGVyIGJ1dCBJIHRob3VnaHQgaXQgYmVzdCBub3QgdG8gaW1wb3NlIGEgdHlw
ZSBvbiBhIG1hc2suDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
