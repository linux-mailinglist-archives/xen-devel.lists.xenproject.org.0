Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE4D5C0CC
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 18:02:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhyiL-0003GY-PW; Mon, 01 Jul 2019 15:59:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O26U=U6=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hhyiJ-0003GR-Fx
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 15:59:31 +0000
X-Inumbo-ID: 358b5623-9c19-11e9-8980-bc764e045a96
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe4d::613])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 358b5623-9c19-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgb/8af3HKYpx1U7oOi3ZhrmGOLA9MzoufnVxigjEgA=;
 b=SvTJi8ZToB++1/UxwVKBlHLaQFn2ntCVG+ex7mQD4cNhv5oRnhkfbPg78al8PxgfppLezkcm72lo49olRJtsjn7mBg9Q6FrRAsp63U1tQHvvbSPVBh+HVMEAK7Uuw99NW6q3JfLcOQ/i0n6rMg6RGsnGGJ+7OWld31lZHCcoEIs=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB2699.namprd12.prod.outlook.com (20.176.116.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 15:59:28 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::c8d:cf8b:2569:1653]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::c8d:cf8b:2569:1653%7]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 15:59:28 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v2 01/10] AMD/IOMMU: restrict feature logging
Thread-Index: AQHVLPutpx8OLktwrE25wl+Js8/nrqa18fGA
Date: Mon, 1 Jul 2019 15:59:28 +0000
Message-ID: <20190701155925.GA26642@amd.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
 <5D14DE6A020000780023B97B@prv1-mh.provo.novell.com>
In-Reply-To: <5D14DE6A020000780023B97B@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN1PR12CA0067.namprd12.prod.outlook.com
 (2603:10b6:802:20::38) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c4a8fe3-d4eb-4643-34ee-08d6fe3d18ab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2699; 
x-ms-traffictypediagnostic: DM6PR12MB2699:
x-microsoft-antispam-prvs: <DM6PR12MB2699BB860705B4AC752DAB15E5F90@DM6PR12MB2699.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:506;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(199004)(189003)(1076003)(68736007)(66446008)(64756008)(66946007)(66556008)(33656002)(2906002)(5660300002)(66476007)(81166006)(72206003)(478600001)(7736002)(8676002)(81156014)(305945005)(8936002)(66066001)(71190400001)(71200400001)(6916009)(4326008)(25786009)(14454004)(53936002)(99286004)(6512007)(52116002)(6436002)(256004)(26005)(14444005)(3846002)(229853002)(73956011)(386003)(6116002)(6506007)(6246003)(2616005)(486006)(316002)(446003)(476003)(11346002)(54906003)(186003)(86362001)(6486002)(102836004)(76176011)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2699;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2mOMU0clCwwDF3PbvRTKTDOIB6eLUzKs/hZX1fS2O9cwkkNQ3FmOdqkXFNOyMAMMAPAY6dr3Hl2I8vd34uu2wZAZxCacEneS8ei3s686D+Z1yHKV4j7haoeZ7KlxN4Xavz5y659PapsggKlX9SwiMpx+QDKdHmDYZMww9cQ87RLqFWfqydoWSxmUCtJWsBK8whYbFuwECTw6B/d5/eY1pNdTc5n6mO+a8zck4e680V89ZYrP7igGw2hIngccF/BB3r7qaOYtPi62iaewKmq/xMjqM6Ub+xhuVyi6OMOjMtZqKpNmmw9NZ4jC5gFjqPMrAgep02MO1um7ypaGD7PzSq9mu5W6Rguzbv7dieqAra9naA0tPeKsyecd6d1FbJ/w9VouA15lx0l7Jga9jL6yaF9hyRB5LjPkErWp9ufBQGQ=
Content-ID: <AD036DF9D134E94BA063782761575997@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4a8fe3-d4eb-4643-34ee-08d6fe3d18ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 15:59:28.2876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2699
Subject: Re: [Xen-devel] [PATCH v2 01/10] AMD/IOMMU: restrict feature logging
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDk6MTk6MDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIGNvbW1vbiBjYXNlIGlzIGFsbCBJT01NVXMgaGF2aW5nIHRoZSBzYW1lIGZlYXR1
cmVzLiBMb2cgdGhlbSBvbmx5Cj4gZm9yIHRoZSBmaXJzdCBJT01NVSwgb3IgZm9yIGFueSB0aGF0
IGhhdmUgYSBkaWZmZXJpbmcgZmVhdHVyZSBzZXQuCj4gCj4gUmVxdWVzdGVkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4u
d29vZHNAYW1kLmNvbT4KCj4gLS0tCj4gdjI6IE5ldy4KPiAKPiAtLS0gYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXVfZGV0ZWN0LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hbWQvaW9tbXVfZGV0ZWN0LmMKPiBAQCAtNjIsNiArNjIsNyBAQCB2b2lkIF9faW5pdCBn
ZXRfaW9tbXVfZmVhdHVyZXMoc3RydWN0IGFtCj4gIHsKPiAgICAgIHUzMiBsb3csIGhpZ2g7Cj4g
ICAgICBpbnQgaSA9IDAgOwo+ICsgICAgY29uc3Qgc3RydWN0IGFtZF9pb21tdSAqZmlyc3Q7Cj4g
ICAgICBzdGF0aWMgY29uc3QgY2hhciAqX19pbml0ZGF0YSBmZWF0dXJlX3N0cltdID0gewo+ICAg
ICAgICAgICItIFByZWZldGNoIFBhZ2VzIENvbW1hbmQiLCAKPiAgICAgICAgICAiLSBQZXJpcGhl
cmFsIFBhZ2UgU2VydmljZSBSZXF1ZXN0IiwgCj4gQEAgLTg5LDYgKzkwLDExIEBAIHZvaWQgX19p
bml0IGdldF9pb21tdV9mZWF0dXJlcyhzdHJ1Y3QgYW0KPiAgCj4gICAgICBpb21tdS0+ZmVhdHVy
ZXMgPSAoKHU2NCloaWdoIDw8IDMyKSB8IGxvdzsKPiAgCj4gKyAgICAvKiBEb24ndCBsb2cgdGhl
IHNhbWUgc2V0IG9mIGZlYXR1cmVzIG92ZXIgYW5kIG92ZXIuICovCj4gKyAgICBmaXJzdCA9IGxp
c3RfZmlyc3RfZW50cnkoJmFtZF9pb21tdV9oZWFkLCBzdHJ1Y3QgYW1kX2lvbW11LCBsaXN0KTsK
PiArICAgIGlmICggaW9tbXUgIT0gZmlyc3QgJiYgaW9tbXUtPmZlYXR1cmVzID09IGZpcnN0LT5m
ZWF0dXJlcyApCj4gKyAgICAgICAgcmV0dXJuOwo+ICsKPiAgICAgIHByaW50aygiQU1ELVZpOiBJ
T01NVSBFeHRlbmRlZCBGZWF0dXJlczpcbiIpOwo+ICAKPiAgICAgIHdoaWxlICggZmVhdHVyZV9z
dHJbaV0gKQo+IAo+IAo+IAoKLS0gCkJyaWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
