Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74028223C4C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 15:22:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwQJt-0000dl-3g; Fri, 17 Jul 2020 13:22:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdYj=A4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jwQJr-0000da-51
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 13:22:31 +0000
X-Inumbo-ID: 903def94-c830-11ea-b7bb-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::614])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 903def94-c830-11ea-b7bb-bc764e2007e4;
 Fri, 17 Jul 2020 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvkgAIJsk+ABmn5vn5Yco54M0XKKWrn+K1LL18PqNLA=;
 b=32X3cfC7ySWK5c5HIWIt/Mdcwq0BoollSzcjnrDId/2sZYOEwIJBZP8DDgS1XqdXdj2J7ABJEDRnBqNb1/rmTWfxPw4csYfVlQlqSkgJSSXqQ6DP9OPsb3wrdpLCZSicETaPZmo5NRpeYXaS8x6OPDuha2+5R+rnyac6fIA8tcI=
Received: from DB8PR03CA0021.eurprd03.prod.outlook.com (2603:10a6:10:be::34)
 by HE1PR0801MB1947.eurprd08.prod.outlook.com (2603:10a6:3:4d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.24; Fri, 17 Jul
 2020 13:22:27 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::fd) by DB8PR03CA0021.outlook.office365.com
 (2603:10a6:10:be::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Fri, 17 Jul 2020 13:22:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 13:22:26 +0000
Received: ("Tessian outbound 8f45de5545d6:v62");
 Fri, 17 Jul 2020 13:22:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51c71de033baa0e7
X-CR-MTA-TID: 64aa7808
Received: from 830d997d7344.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C1C6B9D-A532-4476-8D37-E6A6D4C1586E.1; 
 Fri, 17 Jul 2020 13:22:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 830d997d7344.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jul 2020 13:22:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AU50xmYMBGAoKocptu0fZa12rIUSYdU5ni20CGSlrHA/qtLGGuNKEkxDerrTbzW94Ebhw+S3BVVAtUaG7z1uQ6g+PQfy608c+sjS7ZNQgrzZd2arpuv/1S8RZXPnadvnjO8GXN/+p6wsP3QjFdE9zcGJIrLYMyLNIeBXZMMXVQP+o1uXJVMxSd0G3h4DFysZtzW/GbrG+Hg/8HW8Awyrn3xA4r5gW+lOjJyC638e8Lk1Knq28lC7nG7HtIf4wxESWdmcsXqoxzNODvSEO5STQRBr/LOGxyoDS4C88yIbxrcGubcSLdCQKGkAb6hCPMZ7KDa94J6FcyI9LjI3QegdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvkgAIJsk+ABmn5vn5Yco54M0XKKWrn+K1LL18PqNLA=;
 b=MWi+DLqEhAQYJWfFWCVz7DSSpvVeHcMWoZsd/yOfJNpUvizHnZkqX8m4e7xkfwQkHBNwdLiJEyLYJdNxu+GHc4as9lLwtJkd7QtJaSbKenHDJjKG3BhV6f3KX21wPQ56TSKV/42ftbhsfi1mMmgENlO674nCy0QMLi/AlQaI1omRNV3zshu7wywbmEgkfqql5VI7PcgH8z6QudTbIdHdXxIZ431mC6tGwvQ3bf9RA3pAtoaKGxJjbj4HggoNraLH9843ETRp2J1EllA4t1qzvkEn6FTKJRYSeXxHcqRogeH10bjWnHPPnKNV9zKOa5ItvkOdhXWnrBO7S8F3GbdGxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvkgAIJsk+ABmn5vn5Yco54M0XKKWrn+K1LL18PqNLA=;
 b=32X3cfC7ySWK5c5HIWIt/Mdcwq0BoollSzcjnrDId/2sZYOEwIJBZP8DDgS1XqdXdj2J7ABJEDRnBqNb1/rmTWfxPw4csYfVlQlqSkgJSSXqQ6DP9OPsb3wrdpLCZSicETaPZmo5NRpeYXaS8x6OPDuha2+5R+rnyac6fIA8tcI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB4138.eurprd08.prod.outlook.com (2603:10a6:10:a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 13:22:19 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.028; Fri, 17 Jul 2020
 13:22:19 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAR7YAIAAIxaA
Date: Fri, 17 Jul 2020 13:22:19 +0000
Message-ID: <3B8A1B9D-A101-4937-AC42-4F62BE7E677C@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <20200717111644.GS7191@Air-de-Roger>
In-Reply-To: <20200717111644.GS7191@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2a01:e0a:13:6f10:d5e3:98:5df0:fb15]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 314ab100-b4b9-486f-bcd5-08d82a5472d8
x-ms-traffictypediagnostic: DB8PR08MB4138:|HE1PR0801MB1947:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB19473E303CFDA4A999CF63509D7C0@HE1PR0801MB1947.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JtUcgBYR2icIOjfXf/9dizmd6yDv7hV6PnbN+UKty/RiaAenh3KHidYbRjRWvPezQjacKOKLbVupGe635vFNiG4vtM9qPN9wd2E2g57T+sUI5c7fWiuAISdVKpt7Ex4jGV8YrmUmtDg95rycGQ9VgrFsix2i6Sg+lL9CNBZWx01KcAgzfmcWrpQ3AmqJTcuHoRh7F5NRGspbOAy5E43cCHQrCfr+/gqVzwBI+OaLdh4OFm/n4N8P2qznf8z1WpmqXdYwWhxTTHxUhF5tHk1fEsxtpFTpSlGKjv11rZQERqsyhVuNYlFYg62dmXhox9WriQCZ9Hg5AzxYXB0o+EGbgA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(186003)(83380400001)(2906002)(316002)(6916009)(6512007)(71200400001)(36756003)(66476007)(66946007)(76116006)(5660300002)(66446008)(66556008)(64756008)(30864003)(91956017)(6486002)(54906003)(478600001)(86362001)(2616005)(53546011)(4326008)(6506007)(8936002)(33656002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: nsi2jDW4TXWP1VZewJ0ti1HCd2n96yvLNc+jeWFtwzJv2ectbj5UUalhI4ArR9LAJ0zVWFjbH4OM2fy4gj4VRJfPiufAEkDauHklENPls8o2qwT7Q/sRnetUSUCdSIl6OWcQxZTJ2c0Q8p9klgQi6evPFDfK8eZUa/NS2cS1Uvt4xifwotwLjGkpShKrhoB9lIVc/RKvG5vhk4lQHkjnl/C17/tKUVkDp4zSxArajbDikjH7ZcCKixMI3Z7WkvswNxZcLGZ6EOZL4IyCkUyHPnm/05HRRk5cqSfL6vmk3lhCcq1Nix4U/EYEE66FXrSMeEhu9NrOXFm2UoshgyBBwQ8tQq3/QZxMbIoJ4G5YEiqO397l1YHr+m8g0lhZQ9ZEgs23utIhhY4v3OUyQSzkDf1FfsyzbV7Ve9snFnGOllzBlgD37uFFK1UOfWYhGIskiWPfXDSTZjxZ/5KeIkwg0reyUjHZceNExNPj0qKqObSNSebXCGVKodQOPErHFnayDPfqgmdNbRwFRclOD87BRyU1mQII8t/pu5sqPcHvQzk=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC114C99F89CD84AA9025AEFA9DB8A59@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4138
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(46966005)(33656002)(356005)(26005)(6512007)(186003)(2906002)(5660300002)(36756003)(6506007)(47076004)(53546011)(2616005)(82740400003)(478600001)(82310400002)(81166007)(316002)(6862004)(8676002)(83380400001)(30864003)(86362001)(336012)(6486002)(107886003)(54906003)(70206006)(4326008)(70586007)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d9b16987-3512-4b1f-fb21-08d82a546ec1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VRCEfB8dZeBBZeTjAe8/n9n/8nqa6swInguomKnVoEx2daLDvSK/1TQQt8YWjWTCgxBpXczxgIGkpilPP9qMPf3ehJ+5MfUyn1+XIIT+txeSyZt4Hcrrtyz+KgQrxQMt7Ygvb2lPqoWzL/RwxzamzRglr/TfZ1RSjI2X3h5hcrrW2DR4HD+ts1kW5KvT1gfSt3w210gZAr1aPzo9Z2FIHGslyIJu7A2hGg9UEQx6IcHIljk/eRJAyRZjOTRXWM8Aqyze3MuTsiyfMVFNMi9tDw7TPNFZR5DZAqCCgAI3TFsB8amtMO6SfWj8/bOA9qImQkUrM/P70bWbqsu3BSpr+CtVhXKf9fxVyjvmx6VfFfg4Y69hYo2GPby4I0dvttKIpWy/cinqk5wSDF/WKTLeig==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 13:22:26.5271 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 314ab100-b4b9-486f-bcd5-08d82a5472d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1947
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTcgSnVsIDIwMjAsIGF0IDEzOjE2LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBJJ3ZlIHdyYXBwZWQgdGhlIGVtYWlsIHRvIDgw
IGNvbHVtbnMgaW4gb3JkZXIgdG8gbWFrZSBpdCBlYXNpZXIgdG8NCj4gcmVwbHkuDQo+IA0KPiBU
aGFua3MgZm9yIGRvaW5nIHRoaXMsIEkgdGhpbmsgdGhlIGRlc2lnbiBpcyBnb29kLCBJIGhhdmUg
c29tZQ0KPiBxdWVzdGlvbnMgYmVsb3cgc28gdGhhdCBJIHVuZGVyc3RhbmQgdGhlIGZ1bGwgcGlj
dHVyZS4NCj4gDQo+IE9uIFRodSwgSnVsIDE2LCAyMDIwIGF0IDA1OjEwOjA1UE0gKzAwMDAsIFJh
aHVsIFNpbmdoIHdyb3RlOg0KPj4gSGVsbG8gQWxsLA0KPj4gDQo+PiBGb2xsb3dpbmcgdXAgb24g
ZGlzY3Vzc2lvbiBvbiBQQ0kgUGFzc3Rocm91Z2ggc3VwcG9ydCBvbiBBUk0gdGhhdCB3ZQ0KPj4g
aGFkIGF0IHRoZSBYRU4gc3VtbWl0LCB3ZSBhcmUgc3VibWl0dGluZyBhIFJldmlldyBGb3IgQ29t
bWVudCBhbmQgYQ0KPj4gZGVzaWduIHByb3Bvc2FsIGZvciBQQ0kgcGFzc3Rocm91Z2ggc3VwcG9y
dCBvbiBBUk0uIEZlZWwgZnJlZSB0bw0KPj4gZ2l2ZSB5b3VyIGZlZWRiYWNrLg0KPj4gDQo+PiBU
aGUgZm9sbG93aW5ncyBkZXNjcmliZSB0aGUgaGlnaC1sZXZlbCBkZXNpZ24gcHJvcG9zYWwgb2Yg
dGhlIFBDSQ0KPj4gcGFzc3Rocm91Z2ggc3VwcG9ydCBhbmQgaG93IHRoZSBkaWZmZXJlbnQgbW9k
dWxlcyB3aXRoaW4gdGhlIHN5c3RlbQ0KPj4gaW50ZXJhY3RzIHdpdGggZWFjaCBvdGhlciB0byBh
c3NpZ24gYSBwYXJ0aWN1bGFyIFBDSSBkZXZpY2UgdG8gdGhlDQo+PiBndWVzdC4NCj4+IA0KPj4g
IyBUaXRsZToNCj4+IA0KPj4gUENJIGRldmljZXMgcGFzc3Rocm91Z2ggb24gQXJtIGRlc2lnbiBw
cm9wb3NhbA0KPj4gDQo+PiAjIFByb2JsZW0gc3RhdGVtZW50Og0KPj4gDQo+PiBPbiBBUk0gdGhl
cmUgaW4gbm8gc3VwcG9ydCB0byBhc3NpZ24gYSBQQ0kgZGV2aWNlIHRvIGEgZ3Vlc3QuIFBDSQ0K
Pj4gZGV2aWNlIHBhc3N0aHJvdWdoIGNhcGFiaWxpdHkgYWxsb3dzIGd1ZXN0cyB0byBoYXZlIGZ1
bGwgYWNjZXNzIHRvDQo+PiBzb21lIFBDSSBkZXZpY2VzLiBQQ0kgZGV2aWNlIHBhc3N0aHJvdWdo
IGFsbG93cyBQQ0kgZGV2aWNlcyB0bw0KPj4gYXBwZWFyIGFuZCBiZWhhdmUgYXMgaWYgdGhleSB3
ZXJlIHBoeXNpY2FsbHkgYXR0YWNoZWQgdG8gdGhlIGd1ZXN0DQo+PiBvcGVyYXRpbmcgc3lzdGVt
IGFuZCBwcm92aWRlIGZ1bGwgaXNvbGF0aW9uIG9mIHRoZSBQQ0kgZGV2aWNlcy4NCj4+IA0KPj4g
R29hbCBvZiB0aGlzIHdvcmsgaXMgdG8gYWxzbyBzdXBwb3J0IERvbTBMZXNzIGNvbmZpZ3VyYXRp
b24gc28gdGhlDQo+PiBQQ0kgYmFja2VuZC9mcm9udGVuZCBkcml2ZXJzIHVzZWQgb24geDg2IHNo
YWxsIG5vdCBiZSB1c2VkIG9uIEFybS4NCj4+IEl0IHdpbGwgdXNlIHRoZSBleGlzdGluZyBWUENJ
IGNvbmNlcHQgZnJvbSBYODYgYW5kIGltcGxlbWVudCB0aGUNCj4+IHZpcnR1YWwgUENJIGJ1cyB0
aHJvdWdoIElPIGVtdWxhdGlvbiBzdWNoIHRoYXQgb25seSBhc3NpZ25lZCBkZXZpY2VzDQo+PiBh
cmUgdmlzaWJsZSB0byB0aGUgZ3Vlc3QgYW5kIGd1ZXN0IGNhbiB1c2UgdGhlIHN0YW5kYXJkIFBD
SQ0KPj4gZHJpdmVyLg0KPj4gDQo+PiBPbmx5IERvbTAgYW5kIFhlbiB3aWxsIGhhdmUgYWNjZXNz
IHRvIHRoZSByZWFsIFBDSSBidXMsIGd1ZXN0IHdpbGwNCj4+IGhhdmUgYSBkaXJlY3QgYWNjZXNz
IHRvIHRoZSBhc3NpZ25lZCBkZXZpY2UgaXRzZWxmLiBJT01FTSBtZW1vcnkNCj4+IHdpbGwgYmUg
bWFwcGVkIHRvIHRoZSBndWVzdCBhbmQgaW50ZXJydXB0IHdpbGwgYmUgcmVkaXJlY3RlZCB0byB0
aGUNCj4+IGd1ZXN0LiBTTU1VIGhhcyB0byBiZSBjb25maWd1cmVkIGNvcnJlY3RseSB0byBoYXZl
IERNQQ0KPj4gdHJhbnNhY3Rpb24uDQo+PiANCj4+ICMjIEN1cnJlbnQgc3RhdGU64oCvRHJhZnQg
dmVyc2lvbg0KPj4gDQo+PiAjIFByb3Bvc2VyKHMpOiBSYWh1bCBTaW5naCwgQmVydHJhbmQgTWFy
cXVpcw0KPj4gDQo+PiAjIFByb3Bvc2FsOg0KPj4gDQo+PiBUaGlzIHNlY3Rpb24gd2lsbCBkZXNj
cmliZSB0aGUgZGlmZmVyZW50IHN1YnN5c3RlbSB0byBzdXBwb3J0IHRoZQ0KPj4gUENJIGRldmlj
ZSBwYXNzdGhyb3VnaCBhbmQgaG93IHRoZXNlIHN1YnN5c3RlbXMgaW50ZXJhY3Qgd2l0aCBlYWNo
DQo+PiBvdGhlciB0byBhc3NpZ24gYSBkZXZpY2UgdG8gdGhlIGd1ZXN0Lg0KPj4gDQo+PiAjIFBD
SSBUZXJtaW5vbG9neToNCj4+IA0KPj4gSG9zdCBCcmlkZ2U6IEhvc3QgYnJpZGdlIGFsbG93cyB0
aGUgUENJIGRldmljZXMgdG8gdGFsayB0byB0aGUgcmVzdA0KPj4gb2YgdGhlIGNvbXB1dGVyLiAg
RUNBTTogRUNBTSAoRW5oYW5jZWQgQ29uZmlndXJhdGlvbiBBY2Nlc3MNCj4+IE1lY2hhbmlzbSkg
aXMgYSBtZWNoYW5pc20gZGV2ZWxvcGVkIHRvIGFsbG93IFBDSWUgdG8gYWNjZXNzDQo+PiBjb25m
aWd1cmF0aW9uIHNwYWNlLiBUaGUgc3BhY2UgYXZhaWxhYmxlIHBlciBmdW5jdGlvbiBpcyA0S0Iu
DQo+PiANCj4+ICMgRGlzY292ZXJpbmcgUENJIEhvc3QgQnJpZGdlIGluIFhFTjoNCj4+IA0KPj4g
SW4gb3JkZXIgdG8gc3VwcG9ydCB0aGUgUENJIHBhc3N0aHJvdWdoIFhFTiBzaG91bGQgYmUgYXdh
cmUgb2YgYWxsDQo+PiB0aGUgUENJIGhvc3QgYnJpZGdlcyBhdmFpbGFibGUgb24gdGhlIHN5c3Rl
bSBhbmQgc2hvdWxkIGJlIGFibGUgdG8NCj4+IGFjY2VzcyB0aGUgUENJIGNvbmZpZ3VyYXRpb24g
c3BhY2UuIEVDQU0gY29uZmlndXJhdGlvbiBhY2Nlc3MgaXMNCj4+IHN1cHBvcnRlZCBhcyBvZiBu
b3cuIFhFTiBkdXJpbmcgYm9vdCB3aWxsIHJlYWQgdGhlIFBDSSBkZXZpY2UgdHJlZQ0KPj4gbm9k
ZSDigJxyZWfigJ0gcHJvcGVydHkgYW5kIHdpbGwgbWFwIHRoZSBFQ0FNIHNwYWNlIHRvIHRoZSBY
RU4gbWVtb3J5DQo+PiB1c2luZyB0aGUg4oCcaW9yZW1hcF9ub2NhY2hlICgp4oCdIGZ1bmN0aW9u
Lg0KPiANCj4gV2hhdCBhYm91dCBBQ1BJPyBJIHRoaW5rIHlvdSBzaG91bGQgYWxzbyBtZW50aW9u
IHRoZSBNTUNGRyB0YWJsZSwNCj4gd2hpY2ggc2hvdWxkIGNvbnRhaW4gdGhlIGluZm9ybWF0aW9u
IGFib3V0IHRoZSBFQ0FNIHJlZ2lvbihzKSAob3IgYXQNCj4gbGVhc3QgdGhhdCdzIGhvdyBpdCB3
b3JrcyBvbiB4ODYpLiBKdXN0IHJlYWxpemVkIHRoYXQgeW91IGRvbid0DQo+IHN1cHBvcnQgQUNQ
SSBBVE0sIHNvIHlvdSBjYW4gaWdub3JlIHRoaXMgY29tbWVudC4NCg0KWWVzIGZvciBub3cgd2Ug
ZGlkIG5vdCBjb25zaWRlciBBQ1BJIHN1cHBvcnQuDQoNCj4gDQo+PiANCj4+IElmIHRoZXJlIGFy
ZSBtb3JlIHRoYW4gb25lIHNlZ21lbnQgb24gdGhlIHN5c3RlbSwgWEVOIHdpbGwgcmVhZCB0aGUN
Cj4+IOKAnGxpbnV4LCBwY2ktZG9tYWlu4oCdIHByb3BlcnR5IGZyb20gdGhlIGRldmljZSB0cmVl
IG5vZGUgYW5kIGNvbmZpZ3VyZQ0KPj4gdGhlIGhvc3QgYnJpZGdlIHNlZ21lbnQgbnVtYmVyIGFj
Y29yZGluZ2x5LiBBbGwgdGhlIFBDSSBkZXZpY2UgdHJlZQ0KPj4gbm9kZXMgc2hvdWxkIGhhdmUg
dGhlIOKAnGxpbnV4LHBjaS1kb21haW7igJ0gcHJvcGVydHkgc28gdGhhdCB0aGVyZSB3aWxsDQo+
PiBiZSBubyBjb25mbGljdHMuIER1cmluZyBoYXJkd2FyZSBkb21haW4gYm9vdCBMaW51eCB3aWxs
IGFsc28gdXNlIHRoZQ0KPj4gc2FtZSDigJxsaW51eCxwY2ktZG9tYWlu4oCdIHByb3BlcnR5IGFu
ZCBhc3NpZ24gdGhlIGRvbWFpbiBudW1iZXIgdG8gdGhlDQo+PiBob3N0IGJyaWRnZS4NCj4gDQo+
IFNvIGl0J3MgbXkgdW5kZXJzdGFuZGluZyB0aGF0IHRoZSBQQ0kgZG9tYWluIChvciBzZWdtZW50
KSBpcyBqdXN0IGFuDQo+IGFic3RyYWN0IGNvbmNlcHQgdG8gZGlmZmVyZW50aWF0ZSBhbGwgdGhl
IFJvb3QgQ29tcGxleCBwcmVzZW50IG9uDQo+IHRoZSBzeXN0ZW0sIGJ1dCB0aGUgaG9zdCBicmlk
Z2UgaXRzZWxmIGl0J3Mgbm90IGF3YXJlIG9mIHRoZSBzZWdtZW50DQo+IGFzc2lnbmVkIHRvIGl0
IGluIGFueSB3YXkuDQo+IA0KPiBJJ20gbm90IHN1cmUgWGVuIGFuZCB0aGUgaGFyZHdhcmUgZG9t
YWluIGhhdmluZyBtYXRjaGluZyBzZWdtZW50cyBpcyBhDQo+IHJlcXVpcmVtZW50LCBpZiB5b3Ug
dXNlIHZQQ0kgeW91IGNhbiBtYXRjaCB0aGUgc2VnbWVudCAoZnJvbSBYZW4ncw0KPiBQb1YpIGJ5
IGp1c3QgY2hlY2tpbmcgZnJvbSB3aGljaCBFQ0FNIHJlZ2lvbiB0aGUgYWNjZXNzIGhhcyBiZWVu
DQo+IHBlcmZvcm1lZC4NCj4gDQo+IFRoZSBvbmx5IHJlYXNvbiB0byByZXF1aXJlIG1hdGNoaW5n
IHNlZ21lbnQgdmFsdWVzIGJldHdlZW4gWGVuIGFuZCB0aGUNCj4gaGFyZHdhcmUgZG9tYWluIGlz
IHRvIGFsbG93IHVzaW5nIGh5cGVyY2FsbHMgYWdhaW5zdCB0aGUgUENJIGRldmljZXMsDQo+IGll
OiB0byBiZSBhYmxlIHRvIHVzZSBoeXBlcmNhbGxzIHRvIGFzc2lnbiBhIGRldmljZSB0byBhIGRv
bWFpbiBmcm9tDQo+IHRoZSBoYXJkd2FyZSBkb21haW4uDQo+IA0KPiBJIGhhdmUgMCB1bmRlcnN0
YW5kaW5nIG9mIERUIG9yIGl0J3Mgc3BlYywgYnV0IHdoeSBkb2VzIHRoaXMgaGF2ZSBhDQo+ICds
aW51eCwnIHByZWZpeD8gVGhlIHNlZ21lbnQgbnVtYmVyIGlzIHBhcnQgb2YgdGhlIFBDSSBzcGVj
LCBhbmQgbm90DQo+IHNvbWV0aGluZyBzcGVjaWZpYyB0byBMaW51eCBJTU8uDQoNClRoaXMgaXMg
ZXhhY3QgdGhhdCB0aGlzIGlzIG9ubHkgbmVlZGVkIGZvciB0aGUgaHlwZXJjYWxsIHdoZW4gRG9t
MCBpcw0KZG9pbmcgdGhlIGZ1bGwgZW51bWVyYXRpb24gYW5kIGNvbW11bmljYXRpbmcgdGhlIGRl
dmljZXMgdG8gWGVuLiANCk9uIGFsbCBvdGhlciBjYXNlcyB0aGlzIGNhbiBiZSBkZWR1Y2VkIGZy
b20gdGhlIGFkZHJlc3Mgb2YgdGhlIGFjY2Vzcy4gDQpSZWdhcmRpbmcgdGhlIERUIGVudHJ5LCB0
aGlzIGlzIG5vdCBjb21pbmcgZnJvbSB1cyBhbmQgdGhpcyBpcyBhbHJlYWR5DQpkZWZpbmVkIHRo
aXMgd2F5IGluIGV4aXN0aW5nIERUQnMsIHdlIGp1c3QgcmV1c2UgdGhlIGV4aXN0aW5nIGVudHJ5
LiANCg0KPiANCj4+IA0KPj4gV2hlbiBEb20wIHRyaWVzIHRvIGFjY2VzcyB0aGUgUENJIGNvbmZp
ZyBzcGFjZSBvZiB0aGUgZGV2aWNlLCBYRU4NCj4+IHdpbGwgZmluZCB0aGUgY29ycmVzcG9uZGlu
ZyBob3N0IGJyaWRnZSBiYXNlZCBvbiBzZWdtZW50IG51bWJlciBhbmQNCj4+IGFjY2VzcyB0aGUg
Y29ycmVzcG9uZGluZyBjb25maWcgc3BhY2UgYXNzaWduZWQgdG8gdGhhdCBicmlkZ2UuDQo+PiAN
Cj4+IExpbWl0YXRpb246DQo+PiAqIE9ubHkgUENJIEVDQU0gY29uZmlndXJhdGlvbiBzcGFjZSBh
Y2Nlc3MgaXMgc3VwcG9ydGVkLg0KPj4gKiBEZXZpY2UgdHJlZSBiaW5kaW5nIGlzIHN1cHBvcnRl
ZCBhcyBvZiBub3csIEFDUEkgaXMgbm90IHN1cHBvcnRlZC4NCj4+ICogTmVlZCB0byBwb3J0IHRo
ZSBQQ0kgaG9zdCBicmlkZ2UgYWNjZXNzIGNvZGUgdG8gWEVOIHRvIGFjY2VzcyB0aGUNCj4+ICBj
b25maWd1cmF0aW9uIHNwYWNlIChnZW5lcmljIG9uZSB3b3JrcyBidXQgbG90cyBvZiBwbGF0Zm9y
bXMgd2lsbA0KPj4gIHJlcXVpcmVkICBzb21lIHNwZWNpZmljIGNvZGUgb3IgcXVpcmtzKS4NCj4+
IA0KPj4gIyBEaXNjb3ZlcmluZyBQQ0kgZGV2aWNlczoNCj4+IA0KPj4gUENJLVBDSWUgZW51bWVy
YXRpb24gaXMgYSBwcm9jZXNzIG9mIGRldGVjdGluZyBkZXZpY2VzIGNvbm5lY3RlZCB0bw0KPj4g
aXRzIGhvc3QuIEl0IGlzIHRoZSByZXNwb25zaWJpbGl0eSBvZiB0aGUgaGFyZHdhcmUgZG9tYWlu
IG9yIGJvb3QNCj4+IGZpcm13YXJlIHRvIGRvIHRoZSBQQ0kgZW51bWVyYXRpb24gYW5kIGNvbmZp
Z3VyZSB0aGUgQkFSLCBQQ0kNCj4+IGNhcGFiaWxpdGllcywgYW5kIE1TSS9NU0ktWCBjb25maWd1
cmF0aW9uLg0KPj4gDQo+PiBQQ0ktUENJZSBlbnVtZXJhdGlvbiBpbiBYRU4gaXMgbm90IGZlYXNp
YmxlIGZvciB0aGUgY29uZmlndXJhdGlvbg0KPj4gcGFydCBhcyBpdCB3b3VsZCByZXF1aXJlIGEg
bG90IG9mIGNvZGUgaW5zaWRlIFhlbiB3aGljaCB3b3VsZA0KPj4gcmVxdWlyZSBhIGxvdCBvZiBt
YWludGVuYW5jZS4gQWRkZWQgdG8gdGhpcyBtYW55IHBsYXRmb3JtcyByZXF1aXJlDQo+PiBzb21l
IHF1aXJrcyBpbiB0aGF0IHBhcnQgb2YgdGhlIFBDSSBjb2RlIHdoaWNoIHdvdWxkIGdyZWF0bHkg
aW1wcm92ZQ0KPj4gWGVuIGNvbXBsZXhpdHkuIE9uY2UgaGFyZHdhcmUgZG9tYWluIGVudW1lcmF0
ZXMgdGhlIGRldmljZSB0aGVuIGl0DQo+PiB3aWxsIGNvbW11bmljYXRlIHRvIFhFTiB2aWEgdGhl
IGJlbG93IGh5cGVyY2FsbC4NCj4+IA0KPj4gI2RlZmluZSBQSFlTREVWT1BfcGNpX2RldmljZV9h
ZGQgICAgICAgIDI1IHN0cnVjdA0KPj4gcGh5c2Rldl9wY2lfZGV2aWNlX2FkZCB7DQo+PiAgICB1
aW50MTZfdCBzZWc7DQo+PiAgICB1aW50OF90IGJ1czsNCj4+ICAgIHVpbnQ4X3QgZGV2Zm47DQo+
PiAgICB1aW50MzJfdCBmbGFnczsNCj4+ICAgIHN0cnVjdCB7DQo+PiAgICAgICAgdWludDhfdCBi
dXM7DQo+PiAgICAgICAgdWludDhfdCBkZXZmbjsNCj4+ICAgIH0gcGh5c2ZuOw0KPj4gICAgLyoN
Cj4+ICAgICAqIE9wdGlvbmFsIHBhcmFtZXRlcnMgYXJyYXkuDQo+PiAgICAgKiBGaXJzdCBlbGVt
ZW50IChbMF0pIGlzIFBYTSBkb21haW4gYXNzb2NpYXRlZCB3aXRoIHRoZSBkZXZpY2UgKGlmDQo+
PiAgICAgKiBYRU5fUENJX0RFVl9QWE0gaXMgc2V0KQ0KPj4gICAgICovDQo+PiAgICB1aW50MzJf
dCBvcHRhcnJbWEVOX0ZMRVhfQVJSQVlfRElNXTsNCj4+IH07DQo+PiANCj4+IEFzIHRoZSBoeXBl
cmNhbGwgYXJndW1lbnQgaGFzIHRoZSBQQ0kgc2VnbWVudCBudW1iZXIsIFhFTiB3aWxsDQo+PiBh
Y2Nlc3MgdGhlIFBDSSBjb25maWcgc3BhY2UgYmFzZWQgb24gdGhpcyBzZWdtZW50IG51bWJlciBh
bmQgZmluZA0KPj4gdGhlIGhvc3QtYnJpZGdlIGNvcnJlc3BvbmRpbmcgdG8gdGhpcyBzZWdtZW50
IG51bWJlci4gQXQgdGhpcyBzdGFnZQ0KPj4gaG9zdCBicmlkZ2UgaXMgZnVsbHkgaW5pdGlhbGl6
ZWQgc28gdGhlcmUgd2lsbCBiZSBubyBpc3N1ZSB0byBhY2Nlc3MNCj4+IHRoZSBjb25maWcgc3Bh
Y2UuDQo+PiANCj4+IFhFTiB3aWxsIGFkZCB0aGUgUENJIGRldmljZXMgaW4gdGhlIGxpbmtlZCBs
aXN0IG1haW50YWluIGluIFhFTg0KPj4gdXNpbmcgdGhlIGZ1bmN0aW9uIHBjaV9hZGRfZGV2aWNl
KCkuIFhFTiB3aWxsIGJlIGF3YXJlIG9mIGFsbCB0aGUNCj4+IFBDSSBkZXZpY2VzIG9uIHRoZSBz
eXN0ZW0gYW5kIGFsbCB0aGUgZGV2aWNlIHdpbGwgYmUgYWRkZWQgdG8gdGhlDQo+PiBoYXJkd2Fy
ZSBkb21haW4uDQo+PiANCj4+IExpbWl0YXRpb25zOg0KPj4gKiBXaGVuIFBDSSBkZXZpY2VzIGFy
ZSBhZGRlZCB0byBYRU4sIE1TSSBjYXBhYmlsaXR5IGlzDQo+PiAgbm90IGluaXRpYWxpemVkIGlu
c2lkZSBYRU4gYW5kIG5vdCBzdXBwb3J0ZWQgYXMgb2Ygbm93Lg0KPiANCj4gSSBhc3N1bWUgeW91
IHdpbGwgbWFzayBzdWNoIGNhcGFiaWxpdHkgYW5kIHdpbGwgcHJldmVudCB0aGUgZ3Vlc3QgKG9y
DQo+IGhhcmR3YXJlIGRvbWFpbikgZnJvbSBpbnRlcmFjdGluZyB3aXRoIGl0Pw0KDQpObyB3ZSB3
aWxsIGFjdHVhbGx5IGltcGxlbWVudCB0aGF0IHBhcnQgYnV0IGxhdGVyLiBUaGlzIGlzIG5vdCBz
dXBwb3J0ZWQgaW4NCnRoZSBSRkMgdGhhdCB3ZSB3aWxsIHN1Ym1pdC4gDQoNCj4gDQo+PiAqIEFD
UyBjYXBhYmlsaXR5IGlzIGRpc2FibGUgZm9yIEFSTSBhcyBvZiBub3cgYXMgYWZ0ZXIgZW5hYmxp
bmcgaXQNCj4+ICBkZXZpY2VzIGFyZSBub3QgYWNjZXNzaWJsZS4NCj4+ICogRG9tMExlc3MgaW1w
bGVtZW50YXRpb24gd2lsbCByZXF1aXJlIHRvIGhhdmUgdGhlIGNhcGFjaXR5IGluc2lkZSBYZW4N
Cj4+ICB0byBkaXNjb3ZlciB0aGUgUENJIGRldmljZXMgKHdpdGhvdXQgZGVwZW5kaW5nIG9uIERv
bTAgdG8gZGVjbGFyZSB0aGVtDQo+PiAgdG8gWGVuKS4NCj4gDQo+IEkgYXNzdW1lIHRoZSBmaXJt
d2FyZSB3aWxsIHByb3Blcmx5IGluaXRpYWxpemUgdGhlIGhvc3QgYnJpZGdlIGFuZA0KPiBjb25m
aWd1cmUgdGhlIHJlc291cmNlcyBmb3IgZWFjaCBkZXZpY2UsIHNvIHRoYXQgWGVuIGp1c3QgaGFz
IHRvIHdhbGsNCj4gdGhlIFBDSSBzcGFjZSBhbmQgZmluZCB0aGUgZGV2aWNlcy4NCj4gDQo+IFRC
SCB0aGF0IHdvdWxkIGJlIG15IHByZWZlcnJlZCBtZXRob2QsIGJlY2F1c2UgdGhlbiB5b3UgY2Fu
IGdldCByaWQgb2YNCj4gdGhlIGh5cGVyY2FsbC4NCj4gDQo+IElzIHRoZXJlIGFueXdheSBmb3Ig
WGVuIHRvIGtub3cgd2hldGhlciB0aGUgaG9zdCBicmlkZ2UgaXMgcHJvcGVybHkNCj4gc2V0dXAg
YW5kIHRodXMgdGhlIFBDSSBidXMgY2FuIGJlIHNjYW5uZWQ/DQo+IA0KPiBUaGF0IHdheSBBcm0g
Y291bGQgZG8gc29tZXRoaW5nIHNpbWlsYXIgdG8geDg2LCB3aGVyZSBYZW4gd2lsbCBzY2FuDQo+
IHRoZSBidXMgYW5kIGRpc2NvdmVyIGRldmljZXMsIGJ1dCB5b3UgY291bGQgc3RpbGwgcHJvdmlk
ZSB0aGUNCj4gaHlwZXJjYWxsIGluIGNhc2UgdGhlIGJ1cyBjYW5ub3QgYmUgc2Nhbm5lZCBieSBY
ZW4gKGJlY2F1c2UgaXQgaGFzbid0DQo+IGJlZW4gc2V0dXApLg0KDQpUaGF0IGlzIGRlZmluaXRl
bHkgdGhlIGlkZWEgdG8gcmVseSBieSBkZWZhdWx0IG9uIGEgZmlybXdhcmUgZG9pbmcgdGhpcyBw
cm9wZXJseS4NCkkgYW0gbm90IHN1cmUgd2V0aGVyIGEgcHJvcGVyIGVudW1lcmF0aW9uIGNvdWxk
IGJlIGRldGVjdGVkIHByb3Blcmx5IGluIGFsbA0KY2FzZXMgc28gaXQgd291bGQgbWFrZSBzZW5z
IHRvIHJlbHkgb24gRG9tMCBlbnVtZXJhdGlvbiB3aGVuIGEgWGVuDQpjb21tYW5kIGxpbmUgYXJn
dW1lbnQgaXMgcGFzc2VkIGFzIGV4cGxhaW5lZCBpbiBvbmUgb2YgUmFodWzigJlzIG1haWxzLg0K
DQo+IA0KPj4gDQo+PiAjIEVuYWJsZSB0aGUgZXhpc3RpbmcgeDg2IHZpcnR1YWwgUENJIHN1cHBv
cnQgZm9yIEFSTToNCj4+IA0KPj4gVGhlIGV4aXN0aW5nIFZQQ0kgc3VwcG9ydCBhdmFpbGFibGUg
Zm9yIFg4NiBpcyBhZGFwdGVkIGZvciBBcm0uIFdoZW4NCj4+IHRoZSBkZXZpY2UgaXMgYWRkZWQg
dG8gWEVOIHZpYSB0aGUgaHlwZXIgY2FsbA0KPj4g4oCcUEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRk
4oCdLCBWUENJIGhhbmRsZXIgZm9yIHRoZSBjb25maWcgc3BhY2UgYWNjZXNzDQo+PiBpcyBhZGRl
ZCB0byB0aGUgUENJIGRldmljZSB0byBlbXVsYXRlIHRoZSBQQ0kgZGV2aWNlcy4NCj4+IA0KPj4g
QSBNTUlPIHRyYXAgaGFuZGxlciBmb3IgdGhlIFBDSSBFQ0FNIHNwYWNlIGlzIHJlZ2lzdGVyZWQg
aW4gWEVOIHNvDQo+PiB0aGF0IHdoZW4gZ3Vlc3QgaXMgdHJ5aW5nIHRvIGFjY2VzcyB0aGUgUENJ
IGNvbmZpZyBzcGFjZSwgWEVOIHdpbGwNCj4+IHRyYXAgdGhlIGFjY2VzcyBhbmQgZW11bGF0ZSBy
ZWFkL3dyaXRlIHVzaW5nIHRoZSBWUENJIGFuZCBub3QgdGhlDQo+PiByZWFsIFBDSSBoYXJkd2Fy
ZS4NCj4+IA0KPj4gTGltaXRhdGlvbjoNCj4+ICogTm8gaGFuZGxlciBpcyByZWdpc3RlciBmb3Ig
dGhlIE1TSSBjb25maWd1cmF0aW9uLg0KPiANCj4gQnV0IHlvdSBuZWVkIHRvIG1hc2sgTVNJL01T
SS1YIGNhcGFiaWxpdGllcyBpbiB0aGUgY29uZmlnIHNwYWNlIGluDQo+IG9yZGVyIHRvIHByZXZl
bnQgYWNjZXNzIGZyb20gZG9tYWlucz8gKGFuZCBieSBtYXNrIEkgbWVhbiByZW1vdmUgZnJvbQ0K
PiB0aGUgbGlzdCBvZiBjYXBhYmlsaXRpZXMgYW5kIHByZXZlbnQgcmVhZHMvd3JpdGVzIHRvIHRo
YXQNCj4gY29uZmlndXJhdGlvbiBzcGFjZSkuDQo+IA0KPiBOb3RlIHRoaXMgaXMgYWxyZWFkeSBp
bXBsZW1lbnRlZCBmb3IgeDg2LCBhbmQgSSd2ZSB0cmllZCB0byBhZGQgYXJjaF8NCj4gaG9va3Mg
Zm9yIGFyY2ggc3BlY2lmaWMgc3R1ZmYgc28gdGhhdCBpdCBjb3VsZCBiZSByZXVzZWQgYnkgQXJt
LiBCdXQNCj4gbWF5YmUgdGhpcyB3b3VsZCByZXF1aXJlIGEgZGlmZmVyZW50IGRlc2lnbiBkb2N1
bWVudD8NCg0KYXMgc2FpZCwgd2Ugd2lsbCBoYW5kbGUgTVNJIHN1cHBvcnQgaW4gYSBzZXBhcmF0
ZSBkb2N1bWVudC9zdGVwLg0KDQo+IA0KPj4gKiBPbmx5IGxlZ2FjeSBpbnRlcnJ1cHQgaXMgc3Vw
cG9ydGVkIGFuZCB0ZXN0ZWQgYXMgb2Ygbm93LCBNU0kgaXMgbm90DQo+PiAgaW1wbGVtZW50ZWQg
YW5kIHRlc3RlZC4NCj4+IA0KPj4gIyBBc3NpZ24gdGhlIGRldmljZSB0byB0aGUgZ3Vlc3Q6DQo+
PiANCj4+IEFzc2lnbiB0aGUgUENJIGRldmljZSBmcm9tIHRoZSBoYXJkd2FyZSBkb21haW4gdG8g
dGhlIGd1ZXN0IGlzIGRvbmUNCj4+IHVzaW5nIHRoZSBiZWxvdyBndWVzdCBjb25maWcgb3B0aW9u
LiBXaGVuIHhsIHRvb2wgY3JlYXRlIHRoZSBkb21haW4sDQo+PiBQQ0kgZGV2aWNlcyB3aWxsIGJl
IGFzc2lnbmVkIHRvIHRoZSBndWVzdCBWUENJIGJ1cy4NCj4+IA0KPj4gcGNpPVsgIlBDSV9TUEVD
X1NUUklORyIsICJQQ0lfU1BFQ19TVFJJTkciLCAuLi5dDQo+PiANCj4+IEd1ZXN0IHdpbGwgYmUg
b25seSBhYmxlIHRvIGFjY2VzcyB0aGUgYXNzaWduZWQgZGV2aWNlcyBhbmQgc2VlIHRoZQ0KPj4g
YnJpZGdlcy4gR3Vlc3Qgd2lsbCBub3QgYmUgYWJsZSB0byBhY2Nlc3Mgb3Igc2VlIHRoZSBkZXZp
Y2VzIHRoYXQNCj4+IGFyZSBubyBhc3NpZ25lZCB0byBoaW0uDQo+PiANCj4+IExpbWl0YXRpb246
DQo+PiAqIEFzIG9mIG5vdyBhbGwgdGhlIGJyaWRnZXMgaW4gdGhlIFBDSSBidXMgYXJlIHNlZW4g
YnkNCj4+ICB0aGUgZ3Vlc3Qgb24gdGhlIFZQQ0kgYnVzLg0KPiANCj4gSSBkb24ndCB0aGluayB5
b3UgbmVlZCBhbGwgb2YgdGhlbSwganVzdCB0aGUgb25lcyB0aGF0IGFyZSBoaWdoZXIgdXANCj4g
b24gdGhlIGhpZXJhcmNoeSBvZiB0aGUgZGV2aWNlIHlvdSBhcmUgdHJ5aW5nIHRvIHBhc3N0aHJv
dWdoPw0KPiANCj4gV2hpY2gga2luZCBvZiBhY2Nlc3MgZG8gZ3Vlc3QgaGF2ZSB0byBQQ0kgYnJp
ZGdlcyBjb25maWcgc3BhY2U/DQoNCkZvciBub3cgdGhlIGJyaWRnZXMgYXJlIHJlYWQgb25seSwg
bm8gc3BlY2lmaWMgYWNjZXNzIGlzIHJlcXVpcmVkIGJ5IGd1ZXN0cy4gDQoNCj4gDQo+IFRoaXMg
c2hvdWxkIGJlIGxpbWl0ZWQgdG8gcmVhZC1vbmx5IGFjY2Vzc2VzIGluIG9yZGVyIHRvIGJlIHNh
ZmUuDQo+IA0KPiBFbXVsYXRpbmcgYSBQQ0kgYnJpZGdlIGluIFhlbiB1c2luZyB2UENJIHNob3Vs
ZG4ndCBiZSB0aGF0DQo+IGNvbXBsaWNhdGVkLCBzbyB5b3UgY291bGQgbGlrZWx5IHJlcGxhY2Ug
dGhlIHJlYWwgYnJpZGdlcyB3aXRoDQo+IGVtdWxhdGVkIG9uZXMuIE9yIGV2ZW4gcHJvdmlkZSBh
IGZha2UgdG9wb2xvZ3kgdG8gdGhlIGd1ZXN0IHVzaW5nIGFuDQo+IGVtdWxhdGVkIGJyaWRnZS4N
Cg0KSnVzdCBzaG93aW5nIGFsbCBicmlkZ2VzIGFuZCBrZWVwaW5nIHRoZSBoYXJkd2FyZSB0b3Bv
bG9neSBpcyB0aGUgc2ltcGxlc3QNCnNvbHV0aW9uIGZvciBub3cuIEJ1dCBtYXliZSBzaG93aW5n
IGEgZGlmZmVyZW50IHRvcG9sb2d5IGFuZCBvbmx5IGZha2UNCmJyaWRnZXMgY291bGQgbWFrZSBz
ZW5zZSBhbmQgYmUgaW1wbGVtZW50ZWQgaW4gdGhlIGZ1dHVyZS4NCg0KPiANCj4+IA0KPj4gIyBF
bXVsYXRlZCBQQ0kgZGV2aWNlIHRyZWUgbm9kZSBpbiBsaWJ4bDoNCj4+IA0KPj4gTGlieGwgaXMg
Y3JlYXRpbmcgYSB2aXJ0dWFsIFBDSSBkZXZpY2UgdHJlZSBub2RlIGluIHRoZSBkZXZpY2UgdHJl
ZQ0KPj4gdG8gZW5hYmxlIHRoZSBndWVzdCBPUyB0byBkaXNjb3ZlciB0aGUgdmlydHVhbCBQQ0kg
ZHVyaW5nIGd1ZXN0DQo+PiBib290LiBXZSBpbnRyb2R1Y2VkIHRoZSBuZXcgY29uZmlnIG9wdGlv
biBbdnBjaT0icGNpX2VjYW0iXSBmb3INCj4+IGd1ZXN0cy4gV2hlbiB0aGlzIGNvbmZpZyBvcHRp
b24gaXMgZW5hYmxlZCBpbiBhIGd1ZXN0IGNvbmZpZ3VyYXRpb24sDQo+PiBhIFBDSSBkZXZpY2Ug
dHJlZSBub2RlIHdpbGwgYmUgY3JlYXRlZCBpbiB0aGUgZ3Vlc3QgZGV2aWNlIHRyZWUuDQo+PiAN
Cj4+IEEgbmV3IGFyZWEgaGFzIGJlZW4gcmVzZXJ2ZWQgaW4gdGhlIGFybSBndWVzdCBwaHlzaWNh
bCBtYXAgYXQgd2hpY2gNCj4+IHRoZSBWUENJIGJ1cyBpcyBkZWNsYXJlZCBpbiB0aGUgZGV2aWNl
IHRyZWUgKHJlZyBhbmQgcmFuZ2VzDQo+PiBwYXJhbWV0ZXJzIG9mIHRoZSBub2RlKS4gQSB0cmFw
IGhhbmRsZXIgZm9yIHRoZSBQQ0kgRUNBTSBhY2Nlc3MgZnJvbQ0KPj4gZ3Vlc3QgaGFzIGJlZW4g
cmVnaXN0ZXJlZCBhdCB0aGUgZGVmaW5lZCBhZGRyZXNzIGFuZCByZWRpcmVjdHMNCj4+IHJlcXVl
c3RzIHRvIHRoZSBWUENJIGRyaXZlciBpbiBYZW4uDQo+IA0KPiBDYW4ndCB5b3UgZGVkdWNlIHRo
ZSByZXF1aXJlbWVudCBvZiBzdWNoIERUIG5vZGUgYmFzZWQgb24gdGhlIHByZXNlbmNlDQo+IG9m
IGEgJ3BjaT0nIG9wdGlvbiBpbiB0aGUgc2FtZSBjb25maWcgZmlsZT8NCj4gDQo+IEFsc28gSSB3
b3VsZG4ndCBkaXNjYXJkIHRoYXQgaW4gdGhlIGZ1dHVyZSB5b3UgbWlnaHQgd2FudCB0byB1c2UN
Cj4gZGlmZmVyZW50IGVtdWxhdG9ycyBmb3IgZGlmZmVyZW50IGRldmljZXMsIHNvIGl0IG1pZ2h0
IGJlIGhlbHBmdWwgdG8NCj4gaW50cm9kdWNlIHNvbWV0aGluZyBsaWtlOg0KPiANCj4gcGNpID0g
WyAnMDg6MDAuMCxiYWNrZW5kPXZwY2knLCAnMDk6MDAuMCxiYWNrZW5kPXhlbnB0JywgJzBhOjAw
LjAsYmFja2VuZD1xZW11JywgLi4uIF0NCj4gDQo+IEZvciB0aGUgdGltZSBiZWluZyBBcm0gd2ls
bCByZXF1aXJlIGJhY2tlbmQ9dnBjaSBmb3IgYWxsIHRoZSBwYXNzZWQNCj4gdGhyb3VnaCBkZXZp
Y2VzLCBidXQgSSB3b3VsZG4ndCBydWxlIG91dCB0aGlzIGNoYW5naW5nIGluIHRoZSBmdXR1cmUu
DQoNCldlIG5lZWQgaXQgZm9yIHRoZSBjYXNlIHdoZXJlIG5vIGRldmljZSBpcyBkZWNsYXJlZCBp
biB0aGUgY29uZmlnIGZpbGUgYW5kIHRoZSB1c2VyDQp3YW50cyB0byBhZGQgZGV2aWNlcyB1c2lu
ZyB4bCBsYXRlci4gSW4gdGhpcyBjYXNlIHdlIG11c3QgaGF2ZSB0aGUgRFQgbm9kZSBmb3IgaXQN
CnRvIHdvcmsuIA0KDQpSZWdhcmRpbmcgcG9zc2libGVzIGJhY2tlbmQgdGhpcyBjb3VsZCBiZSBh
ZGRlZCBpbiB0aGUgZnV0dXJlIGlmIHJlcXVpcmVkLiANCg0KPiANCj4+IExpbWl0YXRpb246DQo+
PiAqIE9ubHkgb25lIFBDSSBkZXZpY2UgdHJlZSBub2RlIGlzIHN1cHBvcnRlZCBhcyBvZiBub3cu
DQo+PiANCj4+IEJBUiB2YWx1ZSBhbmQgSU9NRU0gbWFwcGluZzoNCj4+IA0KPj4gTGludXggZ3Vl
c3Qgd2lsbCBkbyB0aGUgUENJIGVudW1lcmF0aW9uIGJhc2VkIG9uIHRoZSBhcmVhIHJlc2VydmVk
DQo+PiBmb3IgRUNBTSBhbmQgSU9NRU0gcmFuZ2VzIGluIHRoZSBWUENJIGRldmljZSB0cmVlIG5v
ZGUuIE9uY2UgUENJDQo+PiBkZXZpY2UgaXMgYXNzaWduZWQgdG8gdGhlIGd1ZXN0LCBYRU4gd2ls
bCBtYXAgdGhlIGd1ZXN0IFBDSSBJT01FTQ0KPj4gcmVnaW9uIHRvIHRoZSByZWFsIHBoeXNpY2Fs
IElPTUVNIHJlZ2lvbiBvbmx5IGZvciB0aGUgYXNzaWduZWQNCj4+IGRldmljZXMuDQo+IA0KPiBQ
Q0kgSU9NRU0gPT0gQkFScz8gT3IgYXJlIHlvdSByZWZlcnJpbmcgdG8gdGhlIEVDQU0gYWNjZXNz
IHdpbmRvdz8NCg0KSGVyZSBieSBQQ0kgSU9NRU0gd2UgbWVhbiB0aGUgSU9NRU0gc3BhY2VzIHJl
ZmVycmVkIHRvIGJ5IHRoZSBCQVJzDQpvZiB0aGUgUENJIGRldmljZQ0KDQo+IA0KPj4gQXMgb2Yg
bm93IHdlIGhhdmUgbm90IG1vZGlmaWVkIHRoZSBleGlzdGluZyBWUENJIGNvZGUgdG8gbWFwIHRo
ZQ0KPj4gZ3Vlc3QgUENJIElPTUVNIHJlZ2lvbiB0byB0aGUgcmVhbCBwaHlzaWNhbCBJT01FTSBy
ZWdpb24uIFdlIHVzZWQNCj4+IHRoZSBleGlzdGluZyBndWVzdCDigJxpb21lbeKAnSBjb25maWcg
b3B0aW9uIHRvIG1hcCB0aGUgcmVnaW9uLiAgRm9yDQo+PiBleGFtcGxlOiBHdWVzdCByZXNlcnZl
ZCBJT01FTSByZWdpb246ICAweDA0MDIwMDAwIFJlYWwgcGh5c2ljYWwNCj4+IElPTUVNIHJlZ2lv
bjoweDUwMDAwMDAwIElPTUVNIHNpemU6MTI4TUIgaW9tZW0gY29uZmlnIHdpbGwgYmU6DQo+PiBp
b21lbSA9IFsiMHg1MDAwMCwweDgwMDBAMHg0MDIwIl0NCj4+IA0KPj4gVGhlcmUgaXMgbm8gbmVl
ZCB0byBtYXAgdGhlIEVDQU0gc3BhY2UgYXMgWEVOIGFscmVhZHkgaGF2ZSBhY2Nlc3MgdG8NCj4+
IHRoZSBFQ0FNIHNwYWNlIGFuZCBYRU4gd2lsbCB0cmFwIEVDQU0gYWNjZXNzZXMgZnJvbSB0aGUg
Z3Vlc3QgYW5kDQo+PiB3aWxsIHBlcmZvcm0gcmVhZC93cml0ZSBvbiB0aGUgVlBDSSBidXMuDQo+
PiANCj4+IElPTUVNIGFjY2VzcyB3aWxsIG5vdCBiZSB0cmFwcGVkIGFuZCB0aGUgZ3Vlc3Qgd2ls
bCBkaXJlY3RseSBhY2Nlc3MNCj4+IHRoZSBJT01FTSByZWdpb24gb2YgdGhlIGFzc2lnbmVkIGRl
dmljZSB2aWEgc3RhZ2UtMiB0cmFuc2xhdGlvbi4NCj4+IA0KPj4gSW4gdGhlIHNhbWUsIHdlIG1h
cHBlZCB0aGUgYXNzaWduZWQgZGV2aWNlcyBJUlEgdG8gdGhlIGd1ZXN0IHVzaW5nDQo+PiBiZWxv
dyBjb25maWcgb3B0aW9ucy4gIGlycXM9IFsgTlVNQkVSLCBOVU1CRVIsIC4uLl0NCj4gDQo+IEFy
ZSB5b3UgcHJvdmlkaW5nIHRoaXMgZm9yIHRoZSBoYXJkd2FyZSBkb21haW4gYWxzbz8gT3IgYXJl
IGlycXMNCj4gZmV0Y2hlZCBmcm9tIHRoZSBEVCBpbiB0aGF0IGNhc2U/DQoNClRoaXMgd2lsbCBv
bmx5IGJlIHVzZWQgdGVtcG9yYXJpbHkgdW50aWwgd2UgaGF2ZSBwcm9wZXIgc3VwcG9ydCB0byBk
byB0aGlzDQphdXRvbWF0aWNhbGx5IHdoZW4gYSBkZXZpY2UgaXMgYXNzaWduZWQuIFJpZ2h0IG5v
dyBvdXIgY3VycmVudCBpbXBsZW1lbnRhdGlvbg0Kc3RhdHVzIHJlcXVpcmVzIHRoZSB1c2VyIHRv
IGV4cGxpY2l0ZWx5IHJlZGlyZWN0IHRoZSBpbnRlcnJ1cHRzIHJlcXVpcmVkIGJ5IHRoZSBQQ0kN
CmRldmljZXMgYXNzaWduZWQgYnV0IGluIHRoZSBmaW5hbCB2ZXJzaW9uIHRoaXMgZW50cnkgd2ls
bCBub3QgYmUgbmVlZGVkLg0KDQpEb20wIHJlbGllcyBvbiB0aGUgZW50cmllcyBkZWNsYXJlZCBp
biB0aGUgRFQuDQoNCj4gDQo+PiBMaW1pdGF0aW9uOg0KPj4gKiBOZWVkIHRvIGF2b2lkIHRoZSDi
gJxpb21lbeKAnSBhbmQg4oCcaXJx4oCdIGd1ZXN0IGNvbmZpZw0KPj4gIG9wdGlvbnMgYW5kIG1h
cCB0aGUgSU9NRU0gcmVnaW9uIGFuZCBJUlEgYXQgdGhlIHNhbWUgdGltZSB3aGVuDQo+PiAgZGV2
aWNlIGlzIGFzc2lnbmVkIHRvIHRoZSBndWVzdCB1c2luZyB0aGUg4oCccGNp4oCdIGd1ZXN0IGNv
bmZpZyBvcHRpb25zDQo+PiAgd2hlbiB4bCBjcmVhdGVzIHRoZSBkb21haW4uDQo+PiAqIEVtdWxh
dGVkIEJBUiB2YWx1ZXMgb24gdGhlIFZQQ0kgYnVzIHNob3VsZCByZWZsZWN0IHRoZSBJT01FTSBt
YXBwZWQNCj4+ICBhZGRyZXNzLg0KPiANCj4gSXQgd2FzIG15IHVuZGVyc3RhbmRpbmcgdGhhdCB5
b3Ugd291bGQgaWRlbnRpdHkgbWFwIHRoZSBCQVIgaW50byB0aGUNCj4gZG9tVSBzdGFnZS0yIHRy
YW5zbGF0aW9uLCBhbmQgdGhhdCBjaGFuZ2VzIGJ5IHRoZSBndWVzdCB3b24ndCBiZQ0KPiBhbGxv
d2VkLg0KDQpJbiBmYWN0IHRoaXMgaXMgbm90IHBvc3NpYmxlIHRvIGRvIGFuZCB3ZSBoYXZlIHRv
IHJlbWFwIGF0IGEgZGlmZmVyZW50IGFkZHJlc3MNCmJlY2F1c2UgdGhlIGd1ZXN0IHBoeXNpY2Fs
IG1hcHBpbmcgaXMgZml4ZWQgYnkgWGVuIG9uIEFybSBzbyB3ZSBtdXN0IGZvbGxvdw0KdGhlIHNh
bWUgZGVzaWduIG90aGVyd2lzZSB0aGlzIHdvdWxkIG9ubHkgd29yayBpZiB0aGUgQkFScyBhcmUg
cG9pbnRpbmcgdG8gYW4NCmFkZHJlc3MgdW51c2VkIGFuZCBvbiBKdW5vIHRoaXMgaXMgZm9yIGV4
YW1wbGUgY29uZmxpY3Rpbmcgd2l0aCB0aGUgZ3Vlc3QNClJBTSBhZGRyZXNzLg0KDQo+IA0KPj4g
KiBYODYgbWFwcGluZyBjb2RlIHNob3VsZCBiZSBwb3J0ZWQgb24gQXJtIHNvIHRoYXQgdGhlIHN0
YWdlLTINCj4+ICB0cmFuc2xhdGlvbiBpcyBhZGFwdGVkIHdoZW4gdGhlIGd1ZXN0IGlzIGRvaW5n
IGEgbW9kaWZpY2F0aW9uIG9mIHRoZQ0KPj4gIEJBUiByZWdpc3RlcnMgdmFsdWVzICh0byBtYXAg
dGhlIGFkZHJlc3MgcmVxdWVzdGVkIGJ5IHRoZSBndWVzdCBmb3INCj4+ICBhIHNwZWNpZmljIElP
TUVNIHRvIHRoZSBhZGRyZXNzIGFjdHVhbGx5IGNvbnRhaW5lZCBpbiB0aGUgcmVhbCBCQVINCj4+
ICByZWdpc3RlciBvZiB0aGUgY29ycmVzcG9uZGluZyBkZXZpY2UpLg0KPiANCj4gSSB0aGluayB0
aGUgYWJvdmUgbWVhbnMgdGhhdCB5b3Ugd2FudCB0byBhbGxvdyB0aGUgZ3Vlc3QgdG8gY2hhbmdl
IHRoZQ0KPiBwb3NpdGlvbiBvZiB0aGUgQkFSIGluIHRoZSBzdGFnZS0yIHRyYW5zbGF0aW9uIF93
aXRob3V0XyBhbGxvd2luZyBpdA0KPiB0byBjaGFuZ2UgdGhlIHBvc2l0aW9uIG9mIHRoZSBCQVIg
aW4gdGhlIHBoeXNpY2FsIG1lbW9yeSBtYXAsIGlzIHRoYXQNCj4gY29ycmVjdD8NCg0KeWVzIHRo
aXMgaXMgY29ycmVjdC4gVGhpcyBpcyBub3QgdmVyeSBjb21wbGV4IGFuZCBtYWtlIGl0IGVhc2ll
ciB0byB1c2UNCnVubW9kaWZpZWQgZ3Vlc3RzIGFzIFZQQ0kgd291bGQgYmVoYXZlIGFzIGFuIGhh
cmR3YXJlIFBDSS4NCg0KQmVydHJhbmQNCg0KPiANCj4gVGhhbmtzLCBSb2dlci4NCg0K

