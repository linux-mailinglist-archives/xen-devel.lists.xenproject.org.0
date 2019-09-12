Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959D8B14E9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 21:49:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8V3p-0007PZ-R1; Thu, 12 Sep 2019 19:47:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ONwL=XH=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i8V3n-0007PP-W1
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 19:47:20 +0000
X-Inumbo-ID: 20932606-d596-11e9-b299-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.56]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20932606-d596-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 19:47:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsvQyRLUcO6lSIg+NrHVEAe4jFOFfXcgO4Z0c6S2p6lCnz+wLIZ1D52LWSt0fEk+oV1FMVzgAZzqz2VFG7aVbtCTnK2ScetZkD54YpwVa/3RJHv9ioTXPf9UDVXGspAB1+1OcGgYLSyfKhwpTbB7zAsDzr+QxU98ADMQL7HplP1You8on92PG1T6SGqZim6vX4sqo9tCYKi1Dpk14jRXCayX3GBtLJ+7R1MbQp4R/aQu06j4l5MqbT4kOMNceW9UaAW/Qe4oCOtaSy9QDwouYFGjfC2rkGQoouuFKM0Ec5cpkLMspaPJGTJY3bKwvuJaMYAGp5dyxDyq7UoA4bujJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFoyGA8gZ+SddT2UVpr0emKF6cI8qTC3Ib4hYKD3G+0=;
 b=jB2IS3eq4+ci6pS6U9NPTjaeVeUxtyCHyaMAOiEMKgudK7pEUaxzUIk9L4XN0WVMyFqEihqsDOA7uWK69EOz1NKt7oHjkexOFa3wmR1ry5Z6M4I3P45ZK4a16+61NyywE6f5W76gkw9MhiOBZSxVmbJqCcsUMkY8w03hi0C4YK3F7Qro9R0p+QEs3D+oSVdDVPohea9XTyhNH2InWm/eddXJ7KWlJp+/m5sC/Wp5XHth5eXjL5f4tUynzcR6RQSbv8eCzhYw9pMMx8cuAVZaEnx0O8qgzxQ/J0FM2aMoxccSHHDHQ+HI9Zy8L5skdpEI4guPYxPg/LzkD/YMWPGGmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFoyGA8gZ+SddT2UVpr0emKF6cI8qTC3Ib4hYKD3G+0=;
 b=HF0Nm34CnCaUy5PRpmCQlr2+ztOIQS1PgKUjPKs/tDB/N7wipjzFHwjiv6R6dd313f5jYpaWMoM7HLTaREsmODpFwOA1lS6n9sSbgWbxZtG6A51Za9gyeZC3uh3IK1sOiEN80YHWBAvl+Whx3sII2wYQTN1JpE433p/G1Oe4oTc=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5060.eurprd03.prod.outlook.com (20.178.22.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Thu, 12 Sep 2019 19:47:16 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Thu, 12 Sep 2019
 19:47:16 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 2/5] xen/arm: optee: check for preemption while freeing
 shared buffers
Thread-Index: AQHVWeNlIytwW28PUEKII1lAK5bjtackBZ8AgALq7YCAAZ81AIAAAjmA
Date: Thu, 12 Sep 2019 19:47:16 +0000
Message-ID: <87ftl1fgak.fsf@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-3-volodymyr_babchuk@epam.com>
 <d72ca72d-81b7-f74d-86fd-24cc54bb4102@arm.com> <87impyfyw6.fsf@epam.com>
 <2a5adc32-80fb-d67f-46e5-074ca92fa372@arm.com>
In-Reply-To: <2a5adc32-80fb-d67f-46e5-074ca92fa372@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43d7bd95-8596-4592-def6-08d737ba03da
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5060; 
x-ms-traffictypediagnostic: AM0PR03MB5060:|AM0PR03MB5060:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB5060C6EAF7BCE10765374E74E6B00@AM0PR03MB5060.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(199004)(189003)(305945005)(91956017)(76116006)(256004)(6916009)(64756008)(66446008)(6116002)(81166006)(81156014)(66066001)(14454004)(8676002)(6246003)(6506007)(53546011)(14444005)(26005)(3846002)(486006)(71200400001)(316002)(6512007)(4326008)(71190400001)(8936002)(102836004)(66556008)(36756003)(55236004)(186003)(229853002)(2616005)(86362001)(76176011)(54906003)(53936002)(5660300002)(66476007)(66946007)(6486002)(476003)(11346002)(446003)(478600001)(80792005)(99286004)(2906002)(7736002)(6436002)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5060;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C7LKbXHarvq/uWs4VjLCeyPD4pjrNZaz9vublY9CosiAG+CO4ZCnrZZSVodPHY2h4IkA1c94w7k0tOueOfkivAbI98goNKOO1y0EXlrGWDb33ZCtVkKR7TA30DQuhdX7Muv0yUsqBPebMRbwt+6oDqE7Ko3GG0+q/NwfHZjjW/IRkYmKsvZobbwBRJ0YUvcKPQQl9djbr06pKF5luhHs8GpUU6D0tNH5q/YeIfttvxY459tL63Ar58Wfz48iLsmjGuYLoI9QFMkosP1hS/5JNKUqVjgEMlh22njA6Ij90Ny3dH1EzWzI1RxDJYZaO4G43VcSsCBkXLWioflgcb0VWkM4hRxApVV79bSzE+DLm/EFN7lbyhUDSl1MXpfdizcfA9DiVZvQStLJ0axBULcDL1ck9K/rp/aYsBAhQ5tRZZI=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d7bd95-8596-4592-def6-08d737ba03da
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 19:47:16.3905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OCtoqPFVT2gbaR2htY6oCLEXtpoXq07yXFzXQyhTZcgtI9a4OQuK0XdSn1Ul+LDEupppbr6Ru7VL8TmcaXRdYAttmHdFQFvIDVBroXUOs14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5060
Subject: Re: [Xen-devel] [PATCH 2/5] xen/arm: optee: check for preemption
 while freeing shared buffers
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpIFZvbG9keW15ciwKPgo+IE9uIDkvMTEvMTkgNzo1
MyBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Cj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6
Cj4+Cj4+PiBIaSBWb2xvZHlteXIsCj4+Pgo+Pj4gT24gOC8yMy8xOSA3OjQ4IFBNLCBWb2xvZHlt
eXIgQmFiY2h1ayB3cm90ZToKPj4+PiBOb3cgd2UgaGF2ZSBsaW1pdCBmb3Igb25lIHNoYXJlZCBi
dWZmZXIgc2l6ZSwgc28gd2UgY2FuIGJlIHN1cmUgdGhhdAo+Pj4+IG9uZSBjYWxsIHRvIGZyZWVf
b3B0ZWVfc2htX2J1ZigpIHdpbGwgbm90IGZyZWUgYWxsCj4+Pj4gTUFYX1RPVEFMX1NNSF9CVUZf
UEcgcGFnZXMgYXQgb25jZS4gVGh1cywgd2Ugbm93IGNhbiBjaGVjayBmb3IKPj4+PiBoeXBlcmNh
bGxfcHJlZW1wdF9jaGVjaygpIGluIHRoZSBsb29wIGluc2lkZQo+Pj4+IG9wdGVlX3JlbGlucXVp
c2hfcmVzb3VyY2VzKCkgYW5kIHRoaXMgd2lsbCBlbnN1cmUgdGhhdCB3ZSBhcmUgbm90Cj4+Pj4g
bWlzc2luZyBwcmVlbXB0aW9uLgo+Pj4KPj4+IEkgYW0gbm90IHN1cmUgdG8gdW5kZXJzdGFuZCB0
aGUgY29ycmVsYXRpb24gYmV0d2VlbiB0aGUgdHdvCj4+PiBzZW50ZW5jZXMuIEV2ZW4gaWYgcHJl
dmlvdXNseSB0aGUgZ3Vlc3QgY291bGQgcGluIHVwIHRvCj4+PiBNQVhfVE9UQUxfU0hNX0JVRl9Q
RyBpbiBvbmUgY2FsbCwgYSB3ZWxsLWJlaGF2ZWQgZ3Vlc3Qgd291bGQgcmVzdWx0IHRvCj4+PiBk
byBtdWx0aXBsZSBjYWxscyBhbmQgdGhlcmVmb3JlIHByZWVtcHRpb24gd291bGQgaGF2ZSBiZWVu
IHVzZWZ1bC4KPj4gTG9va3MgbGlrZSBub3cgSSBkb24ndCB1bmRlcnN0YW5kIHlvdS4KPj4KPj4g
SSdtIHRhbGtpbmcgYWJvdXQgc2hhcmVkIGJ1ZmZlcnMuIFdlIGhhdmUgbGltaXRlZCBzaGFyZWQg
YnVmZmVyIHRvIHNvbWUKPj4gcmVhc29uYWJsZSBzaXplLiBUaGVyZSBpcyBiYWQtIG9yIHdlbGwt
YmVoYXZpbmcgZ3Vlc3RzIGluIHRoaXMgY29udGV4dCwKPj4gYmVjYXVzZSBndWVzdCBjYW4ndCBz
aGFyZSBvbmUgYmlnIGJ1ZmZlciBpbiBtdWx0aXBsZSBjYWxscy4gSW4gb3RoZXIKPj4gd29ybGRz
LCBpZiBndWVzdCAqbmVlZHMqIHRvIHNoYXJlIDUxMk1CIGJ1ZmZlciB3aXRoIE9QLVRFRSwgaXQg
d2lsbCBiZQo+PiBmb3JjZWQgdG8gZG8gdGhpcyBpbiBvbmUgY2FsbC4gQnV0IHdlIGFyZSBmb3Ji
aWRkaW5nIGJpZyBidWZmZXJzIHJpZ2h0Cj4+IG5vdy4KPj4KPj4gb3B0ZWVfcmVsaW5xdWlzaF9y
ZXNvdXJjZXMoKSBpcyBjYWxsZWQgZHVyaW5nIGRvbWFpbiBkZXN0cnVjdGlvbi4gQXQKPj4gdGhp
cyB0aW1lIHdlIGNhbiBoYXZlIGEgbnVtYmVyIG9mIHN0aWxsIGxpdmluZyBzaGFyZWQgYnVmZmVy
cywgZWFjaCBvZgo+PiBvbmUgaXMgbm8gYmlnZ2VyIHRoYW4gNTEyIHBhZ2VzLiBUaGFua3MgdG8g
dGhpcywgd2UgY2FuIGNhbGwKPj4gaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSBvbmx5IGluIG9w
dGVlX3JlbGlucXVpc2hfcmVzb3VyY2VzKCksIGJ1dCBub3QKPj4gaW4gZnJlZV9vcHRlZV9zaG1f
YnVmKCkuCj4KPiBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiwgaG93ZXZlciBteSBwb2ludCBp
cyB0aGF0IHRoaXMgcGF0Y2ggZG9lcwo+IG5vdCBkZXBlbmRlbnQgb2YgdGhlIHByZXZpb3VzIHBh
dGNoLiBFdmVuIGlmIHRoaXMgcGF0Y2ggZ29lcyBhbG9uZSwKPiB5b3Ugd2lsbCBpbXByb3ZlIHdl
bGwtYmVoYXZlZCBndWVzdC4gRm9yIGlsbC1iZWhhdmVkIGd1ZXN0LCB0aGUKPiBwcm9ibGVtIHdp
bGwgc3RheSB0aGUgc2FtZSBzbyBubyBjaGFuZ2UuCj4KQWgsIEkgc2VlIG5vdy4gT2theSwgSSds
bCByZXdvcmsgdGhlIGNvbW1pdCBkZXNjcmlwdGlvbi4KCi0tIApWb2xvZHlteXIgQmFiY2h1ayBh
dCBFUEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
