Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39B424A1CA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 16:33:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8P8i-0006pi-IA; Wed, 19 Aug 2020 14:32:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=63PW=B5=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k8P8g-0006pd-Rw
 for xen-devel@lists.xen.org; Wed, 19 Aug 2020 14:32:31 +0000
X-Inumbo-ID: bb5830f3-f6d4-480b-9a41-3400cd69340a
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.60]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb5830f3-f6d4-480b-9a41-3400cd69340a;
 Wed, 19 Aug 2020 14:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6clOcgGEaM7TUlRRS0NheEzK8kd2cFP3DdfJ0zCQQ8=;
 b=Gs1RTdJ33tRzqm5FZSf2ovHygFe5RNnVbnU3v6hy903R2dkEAiJ6ctf1W0Q3uFyZuqiXTbLxzI+q7KmXXNPL4fPhMaNurbdOEDIpxzEmHmxba4aZaS5UVB9/TsQU9BhH0BEBGY0SE6H7WuZw4L3DxPZVqVaI7Jer6Uc9EyQgymI=
Received: from DB7PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:10:36::37)
 by AM0PR08MB3124.eurprd08.prod.outlook.com (2603:10a6:208:5e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Wed, 19 Aug
 2020 14:32:26 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::5c) by DB7PR05CA0024.outlook.office365.com
 (2603:10a6:10:36::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Wed, 19 Aug 2020 14:32:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 14:32:26 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Wed, 19 Aug 2020 14:32:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 39969ca024ae7938
X-CR-MTA-TID: 64aa7808
Received: from 137fc19af3d7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 90220515-7C7D-49B5-807E-7874154F821A.1; 
 Wed, 19 Aug 2020 14:32:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 137fc19af3d7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Aug 2020 14:32:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6ckUmAR+7ueIvtMcILHvZaT5L1D/6xmD1w11kvAK8ygG7G2wDMkkAEyxwU6sk5wb1Du76Q9G1MXvyjSEp+4GXQU62DrcIdBERGeZkwJKf8K6arHSGf6c5uLM3bEZdnypml/2nfYmQtFg/8Am9KTrbGdLyN6GQQAlBgj7hs7uphFSNGmenv/5NiBmSnBbBlZp3kCnn2k6rqe1+dPt5jtVu1ovA4ytTxav1o78xwBhmht/5Zkjwg//HUSanvJXWB/XiTxgTk1FYiHKDYATHpeg3kYNms/SHId9QYqGkC9RUVg69xR4es8jq8B/dLNUqm90e2/umeiptJaKF76QPzkaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6clOcgGEaM7TUlRRS0NheEzK8kd2cFP3DdfJ0zCQQ8=;
 b=EGG30QdUf3kYdHrE54JX+HcB5eIXFPdDshZa4VQsYKlItTez+6P2lUgbq5b6K+YUbKU1DUdraS4allhul7qcb6D+vDULRd3OoKd+GcLq26WV5UbJeorAODhQq8Iu9XHCUTiXNUOLgTShdKpe6aD0c4CZQR10EkL7c/w4CqwWFuOZf8C6T8SsZ7Wx8sf60izVWMiyYVUQ9uJnkjPDb+WILhB3MDWYpcjxV19RrYl2DZKOTG/adB3VFzOsBk4AltCHMUKTjeXwxThiQi4K3AX5twKjzMjjf8flGG7LSr7b5ZGBZ+NdRiBLtiyK1IUn/c/9IBHYU6qK4Hw/tZZHr+i7DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6clOcgGEaM7TUlRRS0NheEzK8kd2cFP3DdfJ0zCQQ8=;
 b=Gs1RTdJ33tRzqm5FZSf2ovHygFe5RNnVbnU3v6hy903R2dkEAiJ6ctf1W0Q3uFyZuqiXTbLxzI+q7KmXXNPL4fPhMaNurbdOEDIpxzEmHmxba4aZaS5UVB9/TsQU9BhH0BEBGY0SE6H7WuZw4L3DxPZVqVaI7Jer6Uc9EyQgymI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1656.eurprd08.prod.outlook.com (2603:10a6:4:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Wed, 19 Aug
 2020 14:32:18 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 14:32:18 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>, nd <nd@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Subject: Re: [BUG] Xen build for RCAR failing
Thread-Topic: [BUG] Xen build for RCAR failing
Thread-Index: AdZUKc5JeR7gPpESR52uLkZK1kYwOwAEsnEAAAD8OlAAAEBtgAABZtcgAANXdAAAh1iJgADaJ12wAA6tYIAAF6P1gAAB/qoABu1UhQAAAR01AA==
Date: Wed, 19 Aug 2020 14:32:18 +0000
Message-ID: <CC0FE15D-1A76-497E-A620-E751D3D5A2D9@arm.com>
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
 <1D0E7281-95D7-482E-BF6D-EE5B1FEE4876@arm.com>
 <ab84437081a346d6bf0f73581382c74e@in.bosch.com>
 <D84A5DA7-683C-480B-8837-C51D560FC2E1@arm.com>
 <139024a891324455a13a3d468908798d@in.bosch.com>
 <C3BCAA62-51EF-49DD-B978-6657BC6D5A21@arm.com>
 <67b4454424c4485fb59d542d052aaf2d@in.bosch.com>
 <CAPD2p-nZZpDBZ5yc=gVvVAW1oFdN0KZ2jMH-T59W_sntsENwxw@mail.gmail.com>
 <3f155a0b598745a3b2d158599dd992fd@in.bosch.com>
 <0AC5E91F-7C7A-4B5A-AE55-E48574AB04C5@arm.com>
 <5b0ab35ff5074d75835bd7171f11f9e9@in.bosch.com>
In-Reply-To: <5b0ab35ff5074d75835bd7171f11f9e9@in.bosch.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: in.bosch.com; dkim=none (message not signed)
 header.d=none; in.bosch.com;
 dmarc=none action=none header.from=arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8cccfd34-88a2-4409-5cf3-08d8444cb1af
x-ms-traffictypediagnostic: DB6PR0801MB1656:|AM0PR08MB3124:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3124DFA58C5B108F4B21B7419D5D0@AM0PR08MB3124.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: tH1IKWUsokaPcOPYztHwO56bfFeT8HKA/YaIIrvcIUENrALeoRvEkfP9pI+49+qGeRnPEYSi+34T/2c9eg128npXuVHCFmZ3JZ9FQJWvVgNDg/OXgFbGXm4R4ly6HjYKromQc4B8+8q5IHdWoP6b+4UGmX6luMCXJmT5GOttx15TWBT8FGueFZtYjzXcVsY/qc642Mud7uO48WsIt+xhT77a+zqHYh2XLVHH1/3StqmJ8kCL1fsEZghCQ9rxZUDXi57hzubhFmh03Bw6Ml6zY40PIrmwbwfwVj6fgh3V3cneG2HkrSGLV6iLmGe5oGRacDudbwzY2R9fyWbvdGQgGA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(66446008)(8936002)(6916009)(6512007)(2616005)(186003)(36756003)(6506007)(2906002)(33656002)(53546011)(26005)(91956017)(478600001)(54906003)(71200400001)(76116006)(64756008)(66556008)(66476007)(8676002)(5660300002)(86362001)(66946007)(316002)(6486002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: vLgyaV+0SUGzSvPmxfTgKos/y0DS4QZXVFpljacxCmWsVo5JfTkstcA1MBU2Hh2mXqSnb5QX++If7yktlo3ILgvMgVxV1G/RmHK6lBDTQFs14SjWyvvkmDfhffHbD3au26rbjWP29Hpx5hKn8m381JaaO0w5p5m98cOorfuhU4A+vjn+0POupVON1pxXarbZb3e/WzLdTwGKeMfuTjynzAT5QOtu5fwYyeBCb9WpzTfb6us+afKxKSzd345XwGjsq9+mLQahmnBbahO2eI0BHBdtZpYXCa2LlxgFIvql6Xxrxrhwtaa/1rVlId9hr0IPeWgv98G4qJybdTpu0nSoeFOJ4miWC4LAiHCnAX0hrVxJxQymGdHcMJslXuEX001f1/0lOTaNTAKfNGWGNENHOVKIY5N+vk6zjUNqTueWstMRuMuRD8nco+4U2jbD/KFBla3WciibxI1TB+FZ9NLvb5z4g+3mZ/en6YRtnpHsvwwakM25wFst+xM3hdaaSDElaR5W8/VWp3m80wCRUiJYFIwB/Z5fUoiwvSn8f1wlObD1UPKuJS3F4sKmIXNWw2K2094QS5bUEv7GudebRLcYmIr5y1TLMTp5/3pQ+4M+x+UL3ajd2N9/AgOZDQGlUH/Os7IahOVVB3o6HBgsoXP4HA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <750FD7DB0EAEDA4CA813FFBAB3AF2065@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1656
Original-Authentication-Results: in.bosch.com; dkim=none (message not signed)
 header.d=none; in.bosch.com;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0990f7d0-465c-4917-78e8-08d8444cad28
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Rd6s0oELQeECXJzhNFfRvYzLG15KYxtIkKvLud85BC9qpNvZnf1ykSqNbRkf9qa0btD6pHBD51KCgNTeowGEVj8jo+gJtPIObfNGtDhiywZAjspAEbmS0nIbS/L4/+t3wS+Grc8E2vTW0hfLhkQbbO2sQVD1/7rD8CRhFUqMJPsMbMFCmBvqXWcOklGh8vGxkSIhZAB4Naazgfk1S38U/P++sIXNf6rcQmh8uD/ZXo/jwRcvoZy0bNT/MYX8lZLVcgZzpQSFochLVylbH5WVBeNccPNsKRJfOw5TWOneatsqObXHRLA42GkxYTnMR+qAwvou5LygxmuI+Y6gk1ki7Rhyo5EVbaojzkv7CCpxseOgZohjLQjeDmdf+7xCSAl91CzjNrIvNeflwh2P9yLZQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966005)(36756003)(33656002)(5660300002)(81166007)(356005)(186003)(82310400002)(2906002)(6486002)(8936002)(47076004)(70586007)(316002)(6862004)(54906003)(86362001)(8676002)(53546011)(6506007)(6512007)(82740400003)(336012)(26005)(4326008)(2616005)(70206006)(478600001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 14:32:26.2123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cccfd34-88a2-4409-5cf3-08d8444cb1af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3124
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTWFuaWthbmRhbiwNCg0KPiBPbiAxOSBBdWcgMjAyMCwgYXQgMTU6MDAsIE1hbmlrYW5kYW4g
Q2hvY2thbGluZ2FtIChSQkVJL0VDRjMpIDxNYW5pa2FuZGFuLkNob2NrYWxpbmdhbUBpbi5ib3Nj
aC5jb20+IHdyb3RlOg0KPiANCj4gSGVsbG8gQmVydHJhbmQsDQo+IA0KPiBJIHRyaWVkIHRvIGJ1
aWxkIFhlbiBvbiBSQ0FSIHdpdGggdGhlIGZvbGxvd2luZyBidWlsZCBjb25maWd1cmF0aW9uLg0K
PiANCj4gQnVpbGQgQ29uZmlndXJhdGlvbjoNCj4gQkJfVkVSU0lPTiAgICAgICAgPSAiMS4zMC4w
Ig0KPiBCVUlMRF9TWVMgICAgICAgICA9ICJ4ODZfNjQtbGludXgiDQo+IE5BVElWRUxTQlNUUklO
RyAgID0gInVuaXZlcnNhbCINCj4gVEFSR0VUX1NZUyAgICAgICAgPSAiYWFyY2g2NC1wb2t5LWxp
bnV4Ig0KPiBNQUNISU5FICAgICAgICAgICA9ICJzYWx2YXRvci14Ig0KPiBESVNUUk8gICAgICAg
ICAgICA9ICJwb2t5Ig0KPiBESVNUUk9fVkVSU0lPTiAgICA9ICIyLjEuMiINCj4gVFVORV9GRUFU
VVJFUyAgICAgPSAiYWFyY2g2NCBjb3J0ZXhhNTctY29ydGV4YTUzIg0KPiBUQVJHRVRfRlBVICAg
ICAgICA9ICIiDQo+IFNPQ19GQU1JTFkgICAgICAgID0gInJjYXItZ2VuMzpyOGE3Nzk1Ig0KPiBt
ZXRhICAgICAgICAgICAgICANCj4gbWV0YS1wb2t5ICAgICAgICAgDQo+IG1ldGEteW9jdG8tYnNw
ICAgID0gInRtcDpjY2E4ZGQxNWM4MDk2NjI2MDUyZjZkOGQyNWZmMWU5YTYwNjEwNGEzIg0KPiBt
ZXRhLXJjYXItZ2VuMyAgICA9ICJ0bXA6OTVjYjQ4YmEwOWJjN2U1NWZkNTQ5ODE3ZTNlMjY3MjM0
MDllNjhkNSINCj4gbWV0YS1saW5hcm8tdG9vbGNoYWluIA0KPiBtZXRhLW9wdGVlICAgICAgICA9
ICJ0bXA6MmY1MWQzODA0ODU5OWQ5ODc4ZjE0OWQ2ZDE1NTM5ZmI5NzYwM2Y4ZiINCj4gbWV0YS1v
ZSAgICAgICAgICAgPSAidG1wOjU1YzhhNzZkYTVkYzA5OWE3YmMzODM4NDk1YzY3MjE0MGNlZGI3
OGUiDQo+IG1ldGEtdmlydHVhbGl6YXRpb24gPSAibW9ydHk6ZjM2NDMyMTJjMmE4N2EyOWUyYzgw
NjZhMWE1NDQ2MTJkMTU5OGRlOCINCj4gbWV0YS1zZWxpbnV4ICAgICAgPSAiamV0aHJvOjRjNzVk
OWNiY2YxZDc1MDQzYzdjNWFiMzE1YWEzODNkOWIyMjc1MTAiDQo+IG1ldGEtbmV0d29ya2luZyAg
IA0KPiBtZXRhLXB5dGhvbiAgICAgICA9ICJ0bXA6NTVjOGE3NmRhNWRjMDk5YTdiYzM4Mzg0OTVj
NjcyMTQwY2VkYjc4ZSINCj4gbWV0YS1yY2FyLWdlbjMteGVuID0gIm1hc3RlcjphZmZlYmE3ODg1
MzRhMDRkZDMwYTIxZGJiYjgxYTU3M2JkMDMzZGZhIg0KPiANCj4gQWxzbyBlbmFibGVkIHRoZSBl
YXJseSBwcmludGsgaW4geGVuIDQuNyBhbmQgSSBjb3VsZCBhYmxlIHRvIGJvb3QgWGVuIGFuZCBE
b20wLg0KPiANCj4gQnV0IEkgY291bGRu4oCZdCBlbnRlciBpbnRvIHRoZSBjb21tYW5kIHByb21w
dCBvZiBEb20wLiBBdHRhY2hpbmcgdGhlIGNvbXBsZXRlIGxvZyBmb3IgeW91ciByZWZlcmVuY2Uu
DQo+IA0KPiBJIGNvdWxkIGV4ZWN1dGUgdGhlIHNwZWNpYWwga2V5cygwLHEsZSxSKSBpbiB4ZW4g
Y29uc29sZS4gQnV0IGV2ZW4gYWZ0ZXIgZW5hYmxpbmcgaHZjMCBpbiBEb20wIGNvbW1hbmRsaW5l
LCBhbSBub3Qgc2VlaW5nIGFueSBsb2dzIGFmdGVyIGEgcG9pbnQgYW5kIEkgY291bGRu4oCZdCBk
byBhbnkgb3BlcmF0aW9uIG9uIERvbTAuDQo+IA0KPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nIGhl
cmUuIFRoYW5rcyBpbiBhZHZhbmNlLg0KDQpYZW4gaXMgYm9vdGluZyBwcm9wZXJseSBoZXJlIGFu
ZCB0aGUga2VybmVsIGh2YzAgY29uc29sZSBpcyBhbHNvIHdvcmtpbmcgKFsgICAgMC4zNDYxOTld
IGNvbnNvbGUgW2h2YzBdIGVuYWJsZWQpDQoNCkl0IHNlZW1zIHRoYXQgYWxsIHlvdXIgY29yZXMg
YXJlIGVuZGluZyB1cCBpbiBpZGxlIGluIExpbnV4IChhbGwgRUxSIGFyZSBhdCB0aGUgc2FtZSBh
ZGRyZXNzKS4NCg0KU28geW91IHByb2JhYmx5IGhhdmUgYSBwcm9ibGVtIG1vdW50aW5nIGEgcm9v
dCBmaWxlc3lzdGVtIG9yIHlvdSBuZXR3b3JrIGlzIG5vdCBjb21pbmcgdXAuDQpBbiBvdGhlciBz
b2x1dGlvbiB3b3VsZCBiZSB0aGF0IHlvdSBsaW51eCBpcyBtaXNzaW5nIHRoZSBodmMwIGNvbnNv
bGUgZW50cnkgaW4gaW5pdHRhYi4NCg0KSSB3b3VsZCBzdWdnZXN0IHRvIHRyeSB0aGUgZm9sbG93
aW5nOg0KLSBwYXNzIGNvbnNvbGU9dHR5U0MxIHdoaWNoIGlzIHByb2JhYmx5IHRoZSBzZWNvbmQg
c2VyaWFsIGxpbmUgb2YgeW91ciBib2FyZCBhbmQgY29ubmVjdCB0byBpdCB0byBzZWUgaWYgbGlu
dXggZ29lcyBmdXJ0aGVyDQotIHVzZSBhbiBzZGNhcmQgYmFzZWQgb3IgdXNiIGJhc2VkIHJvb3Qg
ZmlsZXN5c3RlbSBpbnN0ZWFkIG9mIE5GUw0KLSBhZGQgcm9vdHdhaXQgb3B0aW9uDQoNCkJ1dCBh
bGwgaW4gYWxsIFhlbiB3b3JrcyB3ZWxsIGFuZCB5b3Ugbm93IGhhdmUgYSBsaW51eCBib290IGlz
c3VlIHByb2JhYmx5IG5vdCByZWxhdGVkIHRvIHhlbi4NCg0KUmVnYXJkcw0KQmVydHJhbmQNCg0K
UFM6IFlvdSBtaWdodCB3YW50IHRvIHN3aXRjaCB0byB4ZW4tdXNlciBtYWlsaW5nIGxpc3QgaW5z
dGVhZCBvZiB4ZW4tZGV2ZWwgOi0p

