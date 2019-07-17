Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D8F6B698
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 08:24:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hndJQ-0003OR-5m; Wed, 17 Jul 2019 06:21:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hndJO-0003OM-OQ
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 06:21:10 +0000
X-Inumbo-ID: 0e78894c-a85b-11e9-a013-ebb0f1a0a469
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e78894c-a85b-11e9-a013-ebb0f1a0a469;
 Wed, 17 Jul 2019 06:21:05 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 06:21:04 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 06:19:39 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 06:19:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFmpfvGN8NFm4DqtgIOEwDcn+zo2zH6uw2oHCzj2BXW0vwCbjdshkNozHVb/6n2gjYAAHjdC7Nv5CO24Et3GGlOfGkdxROnAVUt+mqk2s6WbgyVk6U64xamLUI4oHa0nvRBLCzzIJB1LWyqJJ49Bm+iBe/Fd2ztvq+0Q50XaLf/dgWIcWoGuH8C61p40CnNxWVnNrZUZ8OLwPhJC8RrvgiOE9btypfRHOuIf41QZk5mFxqaaGu9R+1FrJWtA4Zz33DHifyiJa1xc561oS7nRBqiLMlrAOWEo6FoZcQM4PsAhTQV39eJYklx5Rt7lYNfzgL772Hu6w0hPhk+2q866Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2UVH6uBw0OCQb9mlI99terehXP9JepLyIXN5zSEFio=;
 b=F9rnsMti01izmOnUb7+FiGqc0E/en78rzQFO7WnsyYqYf+n8Oe/1bWADjV5nZjGL4OKRiITf4hyiYOXIUA4rgtQOfnh2q0SS6PgiKffHd96r5r2keHhXdWd1sDPrNWFXD496DVLu7V9DzZR2dvGjCzEehstcmknOObX0YCRrJ6ZFx2f/FPt2xj/bX9OUCO80HOXalRl0BhYhp45UsQX1ACteLUR1sMX4KVFrNVd7rO8wbDFc490NGlbDLOGijDtIS724IMHQqNCnlKIFICEmT9H7ArxCdBrrIQRwevixrNSk1JIAdvlyMpNcFOKBEailNj+jHt5bIyidl/z0u5wXsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2427.namprd18.prod.outlook.com (20.179.104.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 17 Jul 2019 06:19:37 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 06:19:37 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v3 02/14] AMD/IOMMU: use bit field for
 extended feature register
Thread-Index: AQHVO/SBPI6DYZWl7E6KQgqsoIfCTKbOV0mA
Date: Wed, 17 Jul 2019 06:19:37 +0000
Message-ID: <e36a2a19-8ce3-3845-ef90-2e3f888e63f1@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <38c3d885-2edb-d450-c6e5-bc476b679bf6@suse.com>
In-Reply-To: <38c3d885-2edb-d450-c6e5-bc476b679bf6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DBBPR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::22) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ff678e6-4b34-488a-864b-08d70a7ebe76
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2427; 
x-ms-traffictypediagnostic: DM6PR18MB2427:
x-microsoft-antispam-prvs: <DM6PR18MB242780AF4EA67091CC6897F1B3C90@DM6PR18MB2427.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:758;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(199004)(189003)(7736002)(102836004)(6916009)(81166006)(81156014)(3846002)(6436002)(68736007)(6486002)(99286004)(6116002)(256004)(14444005)(31686004)(446003)(316002)(11346002)(2616005)(86362001)(486006)(31696002)(26005)(8936002)(186003)(476003)(54906003)(4326008)(66556008)(66476007)(305945005)(66446008)(64756008)(66066001)(80792005)(66946007)(25786009)(14454004)(36756003)(71190400001)(8676002)(71200400001)(52116002)(478600001)(6512007)(2906002)(229853002)(5640700003)(53546011)(53936002)(5660300002)(2351001)(2501003)(6246003)(6506007)(386003)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2427;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fm9rin+O+VB2QQ/uSpYFL0b7bjhiqKpIrLCbJJ8xqT8zMy5vObr4aKFC4ZY4vUfylS//v/lFKdi8BTnU1iDoEhFA3xJ+x4EWNIwYjMRFRYTU3bQmm36pi3TH73eLGt5ytv5VRYe0UEjSHSY9LgHm1Q29oAe67ESEMxxckO8TSp8WVCDLDte/57sNsuwAlR1BWowr8GpJG3MnczEGmDhgUP2DN05SdqiF1206PoMcfXSI0jWXJSm/gqCgzxTWBJA0JlIjupoQigqqdZP7YcwPi9Mgy/SGtFABYUFa869DhcTdoaeB86uUUO1QW6xABS1ZJ6N9KooiN1ZIGjJuB+Y8v8Y2FOQJQDygZiajGiQSNiWaeF0zefnitD7Jt2Y5dr9Z3QEU/JBADY8KlVwZQu0LwLGpmdA07jpyLS4NNqXkWuc=
Content-ID: <18BCF0DABA8A2F449C91D7C952D61077@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff678e6-4b34-488a-864b-08d70a7ebe76
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 06:19:37.5089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2427
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 02/14] AMD/IOMMU: use bit field for
 extended feature register
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxODozNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IC0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9kZXRlY3QuYw0KPiArKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXVfZGV0ZWN0LmMNCj4gQEAgLTYwLDQ5ICs2MCw3NyBAQCBzdGF0
aWMgaW50IF9faW5pdCBnZXRfaW9tbXVfY2FwYWJpbGl0aWVzDQo+ICAgIA0KPiAgICB2b2lkIF9f
aW5pdCBnZXRfaW9tbXVfZmVhdHVyZXMoc3RydWN0IGFtZF9pb21tdSAqaW9tbXUpDQo+ICAgIHsN
Cj4gLSAgICB1MzIgbG93LCBoaWdoOw0KPiAtICAgIGludCBpID0gMCA7DQo+ICAgICAgICBjb25z
dCBzdHJ1Y3QgYW1kX2lvbW11ICpmaXJzdDsNCj4gLSAgICBzdGF0aWMgY29uc3QgY2hhciAqX19p
bml0ZGF0YSBmZWF0dXJlX3N0cltdID0gew0KPiAtICAgICAgICAiLSBQcmVmZXRjaCBQYWdlcyBD
b21tYW5kIiwNCj4gLSAgICAgICAgIi0gUGVyaXBoZXJhbCBQYWdlIFNlcnZpY2UgUmVxdWVzdCIs
DQo+IC0gICAgICAgICItIFgyQVBJQyBTdXBwb3J0ZWQiLA0KPiAtICAgICAgICAiLSBOWCBiaXQg
U3VwcG9ydGVkIiwNCj4gLSAgICAgICAgIi0gR3Vlc3QgVHJhbnNsYXRpb24iLA0KPiAtICAgICAg
ICAiLSBSZXNlcnZlZCBiaXQgWzVdIiwNCj4gLSAgICAgICAgIi0gSW52YWxpZGF0ZSBBbGwgQ29t
bWFuZCIsDQo+IC0gICAgICAgICItIEd1ZXN0IEFQSUMgc3VwcG9ydGVkIiwNCj4gLSAgICAgICAg
Ii0gSGFyZHdhcmUgRXJyb3IgUmVnaXN0ZXJzIiwNCj4gLSAgICAgICAgIi0gUGVyZm9ybWFuY2Ug
Q291bnRlcnMiLA0KPiAtICAgICAgICBOVUxMDQo+IC0gICAgfTsNCj4gLQ0KPiAgICAgICAgQVNT
RVJUKCBpb21tdS0+bW1pb19iYXNlICk7DQo+ICAgIA0KPiAgICAgICAgaWYgKCAhaW9tbXVfaGFz
X2NhcChpb21tdSwgUENJX0NBUF9FRlJTVVBfU0hJRlQpICkNCj4gICAgICAgIHsNCj4gLSAgICAg
ICAgaW9tbXUtPmZlYXR1cmVzID0gMDsNCj4gKyAgICAgICAgaW9tbXUtPmZlYXR1cmVzLnJhdyA9
IDA7DQo+ICAgICAgICAgICAgcmV0dXJuOw0KPiAgICAgICAgfQ0KPiAgICANCj4gLSAgICBsb3cg
PSByZWFkbChpb21tdS0+bW1pb19iYXNlICsgSU9NTVVfRVhUX0ZFQVRVUkVfTU1JT19PRkZTRVQp
Ow0KPiAtICAgIGhpZ2ggPSByZWFkbChpb21tdS0+bW1pb19iYXNlICsgSU9NTVVfRVhUX0ZFQVRV
UkVfTU1JT19PRkZTRVQgKyA0KTsNCj4gLQ0KPiAtICAgIGlvbW11LT5mZWF0dXJlcyA9ICgodTY0
KWhpZ2ggPDwgMzIpIHwgbG93Ow0KPiArICAgIGlvbW11LT5mZWF0dXJlcy5yYXcgPQ0KPiArICAg
ICAgICByZWFkcShpb21tdS0+bW1pb19iYXNlICsgSU9NTVVfRVhUX0ZFQVRVUkVfTU1JT19PRkZT
RVQpOw0KPiAgICANCj4gICAgICAgIC8qIERvbid0IGxvZyB0aGUgc2FtZSBzZXQgb2YgZmVhdHVy
ZXMgb3ZlciBhbmQgb3Zlci4gKi8NCj4gICAgICAgIGZpcnN0ID0gbGlzdF9maXJzdF9lbnRyeSgm
YW1kX2lvbW11X2hlYWQsIHN0cnVjdCBhbWRfaW9tbXUsIGxpc3QpOw0KPiAtICAgIGlmICggaW9t
bXUgIT0gZmlyc3QgJiYgaW9tbXUtPmZlYXR1cmVzID09IGZpcnN0LT5mZWF0dXJlcyApDQo+ICsg
ICAgaWYgKCBpb21tdSAhPSBmaXJzdCAmJiBpb21tdS0+ZmVhdHVyZXMucmF3ID09IGZpcnN0LT5m
ZWF0dXJlcy5yYXcgKQ0KPiAgICAgICAgICAgIHJldHVybjsNCj4gICAgDQo+ICAgICAgICBwcmlu
dGsoIkFNRC1WaTogSU9NTVUgRXh0ZW5kZWQgRmVhdHVyZXM6XG4iKTsNCj4gICAgDQo+IC0gICAg
d2hpbGUgKCBmZWF0dXJlX3N0cltpXSApDQo+ICsjZGVmaW5lIEZFQVQoZmxkLCBzdHIpIGRvIHsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgaWYgKCAtLSgodW5p
b24gYW1kX2lvbW11X2V4dF9mZWF0dXJlcyl7fSkuZmxkcy5mbGQgPiAxICkgICBcDQo+ICsgICAg
ICAgIHByaW50ayggIi0gIiBzdHIgIjogJSN4XG4iLCBpb21tdS0+ZmVhdHVyZXMuZmxkcy5mbGQp
OyBcDQo+ICsgICAgZWxzZSBpZiAoIGlvbW11LT5mZWF0dXJlcy5mbGRzLmZsZCApICAgICAgICAg
ICAgICAgICAgICAgICBcDQo+ICsgICAgICAgIHByaW50ayggIi0gIiBzdHIgIlxuIik7ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICt9IHdoaWxlICggZmFsc2UgKQ0KPiArDQo+
ICsgICAgRkVBVChwcmVmX3N1cCwgICAgICAgICAgICJQcmVmZXRjaCBQYWdlcyBDb21tYW5kIik7
DQo+ICsgICAgRkVBVChwcHJfc3VwLCAgICAgICAgICAgICJQZXJpcGhlcmFsIFBhZ2UgU2Vydmlj
ZSBSZXF1ZXN0Iik7DQo+ICsgICAgRkVBVCh4dF9zdXAsICAgICAgICAgICAgICJ4MkFQSUMiKTsN
Cj4gKyAgICBGRUFUKG54X3N1cCwgICAgICAgICAgICAgIk5YIGJpdCIpOw0KPiArICAgIEZFQVQo
Z2FwcGlfc3VwLCAgICAgICAgICAiR3Vlc3QgQVBJQyBQaHlzaWNhbCBQcm9jZXNzb3IgSW50ZXJy
dXB0Iik7DQo+ICsgICAgRkVBVChpYV9zdXAsICAgICAgICAgICAgICJJbnZhbGlkYXRlIEFsbCBD
b21tYW5kIik7DQo+ICsgICAgRkVBVChnYV9zdXAsICAgICAgICAgICAgICJHdWVzdCBBUElDIik7
DQo+ICsgICAgRkVBVChoZV9zdXAsICAgICAgICAgICAgICJIYXJkd2FyZSBFcnJvciBSZWdpc3Rl
cnMiKTsNCj4gKyAgICBGRUFUKHBjX3N1cCwgICAgICAgICAgICAgIlBlcmZvcm1hbmNlIENvdW50
ZXJzIik7DQo+ICsgICAgRkVBVChoYXRzLCAgICAgICAgICAgICAgICJIb3N0IEFkZHJlc3MgVHJh
bnNsYXRpb24gU2l6ZSIpOw0KPiArDQo+ICsgICAgaWYgKCBpb21tdS0+ZmVhdHVyZXMuZmxkcy5n
dF9zdXAgKQ0KPiAgICAgICAgew0KPiAtICAgICAgICBpZiAoIGFtZF9pb21tdV9oYXNfZmVhdHVy
ZShpb21tdSwgaSkgKQ0KPiAtICAgICAgICAgICAgcHJpbnRrKCAiICVzXG4iLCBmZWF0dXJlX3N0
cltpXSk7DQo+IC0gICAgICAgIGkrKzsNCj4gKyAgICAgICAgRkVBVChnYXRzLCAgICAgICAgICAg
Ikd1ZXN0IEFkZHJlc3MgVHJhbnNsYXRpb24gU2l6ZSIpOw0KPiArICAgICAgICBGRUFUKGdseF9z
dXAsICAgICAgICAiR3Vlc3QgQ1IzIFJvb3QgVGFibGUgTGV2ZWwiKTsNCj4gKyAgICAgICAgRkVB
VChwYXNfbWF4LCAgICAgICAgIk1heGltdW0gUEFTSUQiKTsNCj4gICAgICAgIH0NCj4gKw0KPiAr
ICAgIEZFQVQoc21pZl9zdXAsICAgICAgICAgICAiU01JIEZpbHRlciBSZWdpc3RlciIpOw0KPiAr
ICAgIEZFQVQoc21pZl9yYywgICAgICAgICAgICAiU01JIEZpbHRlciBSZWdpc3RlciBDb3VudCIp
Ow0KPiArICAgIEZFQVQoZ2FtX3N1cCwgICAgICAgICAgICAiR3Vlc3QgVmlydHVhbCBBUElDIE1v
ZGVzIik7DQo+ICsgICAgRkVBVChkdWFsX3Bwcl9sb2dfc3VwLCAgICJEdWFsIFBQUiBMb2ciKTsN
Cj4gKyAgICBGRUFUKGR1YWxfZXZlbnRfbG9nX3N1cCwgIkR1YWwgRXZlbnQgTG9nIik7DQo+ICsg
ICAgRkVBVChzYXRzX3N1cCwgICAgICAgICAgICJTZWN1cmUgQVRTIik7DQo+ICsgICAgRkVBVCh1
c19zdXAsICAgICAgICAgICAgICJVc2VyIC8gU3VwZXJ2aXNvciBQYWdlIFByb3RlY3Rpb24iKTsN
Cj4gKyAgICBGRUFUKGRldl90Ymxfc2VnX3N1cCwgICAgIkRldmljZSBUYWJsZSBTZWdtZW50YXRp
b24iKTsNCj4gKyAgICBGRUFUKHBwcl9lYXJseV9vZl9zdXAsICAgIlBQUiBMb2cgT3ZlcmZsb3cg
RWFybHkgV2FybmluZyIpOw0KPiArICAgIEZFQVQocHByX2F1dG9fcnNwX3N1cCwgICAiUFBSIEF1
dG9tYXRpYyBSZXNwb25zZSIpOw0KPiArICAgIEZFQVQobWFyY19zdXAsICAgICAgICAgICAiTWVt
b3J5IEFjY2VzcyBSb3V0aW5nIGFuZCBDb250cm9sIik7DQo+ICsgICAgRkVBVChibGtfc3RvcF9t
cmtfc3VwLCAgICJCbG9jayBTdG9wTWFyayBNZXNzYWdlIik7DQo+ICsgICAgRkVBVChwZXJmX29w
dF9zdXAgLCAgICAgICJQZXJmb3JtYW5jZSBPcHRpbWl6YXRpb24iKTsNCj4gKyAgICBGRUFUKG1z
aV9jYXBfbW1pb19zdXAsICAgIk1TSSBDYXBhYmlsaXR5IE1NSU8gQWNjZXNzIik7DQo+ICsgICAg
RkVBVChnaW9fc3VwLCAgICAgICAgICAgICJHdWVzdCBJL08gUHJvdGVjdGlvbiIpOw0KPiArICAg
IEZFQVQoaGFfc3VwLCAgICAgICAgICAgICAiSG9zdCBBY2Nlc3MiKTsNCj4gKyAgICBGRUFUKGVw
aF9zdXAsICAgICAgICAgICAgIkVuaGFuY2VkIFBQUiBIYW5kbGluZyIpOw0KPiArICAgIEZFQVQo
YXR0cl9md19zdXAsICAgICAgICAiQXR0cmlidXRlIEZvcndhcmQiKTsNCj4gKyAgICBGRUFUKGhk
X3N1cCwgICAgICAgICAgICAgIkhvc3QgRGlydHkiKTsNCj4gKyAgICBGRUFUKGludl9pb3RsYl90
eXBlX3N1cCwgIkludmFsaWRhdGUgSU9UTEIgVHlwZSIpOw0KPiArICAgIEZFQVQodmlvbW11X3N1
cCwgICAgICAgICAiVmlydHVhbGl6ZWQgSU9NTVUiKTsNCj4gKyAgICBGRUFUKHZtX2d1YXJkX2lv
X3N1cCwgICAgIlZNR3VhcmQgSS9PIFN1cHBvcnQiKTsNCj4gKyAgICBGRUFUKHZtX3RhYmxlX3Np
emUsICAgICAgIlZNIFRhYmxlIFNpemUiKTsNCj4gKyAgICBGRUFUKGdhX3VwZGF0ZV9kaXNfc3Vw
LCAgIkd1ZXN0IEFjY2VzcyBCaXQgVXBkYXRlIERpc2FibGUiKTsNCj4gKw0KPiArI3VuZGVmIEZF
QVQNCj4gKyN1bmRlZiBNQVNLDQo+ICAgIH0NCg0KSnVzdCByZWFsaXplZCB0aGF0IEkgaGFkIGxl
ZnQgaW4gcGxhY2UgaGVyZSBhIG5vIGxvbmdlciBuZWVkZWQgI3VuZGVmLg0KTm93IGRyb3BwZWQu
DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
