Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96032251AD2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 16:30:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAZxD-0002tV-MD; Tue, 25 Aug 2020 14:29:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BGsN=CD=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kAZxC-0002tQ-2y
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 14:29:38 +0000
X-Inumbo-ID: 7cf662d1-9ee6-4f58-a841-4f207c1f51ad
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.49]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7cf662d1-9ee6-4f58-a841-4f207c1f51ad;
 Tue, 25 Aug 2020 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij1ofwOnhUzq2wMPvB9qWgB7TQFu7cWNt4qxQLn48kQ=;
 b=hM4N4pUSV0nfhlSun9TfLD9IhJSbBC48f60WXEYjTkSKFdAcaTdvkf+AcxrVg25k02bbCsveCxZefQaLkp43kctbAbeSPLiOSZc8hPEkwvf60Em5UjKz5aBeE03ftOhmna02U5KPc4Nj7MSL28eqvm/Vp+AdTwu2fH2zsIgxJMM=
Received: from AM0PR03CA0054.eurprd03.prod.outlook.com (2603:10a6:208::31) by
 VI1PR08MB3071.eurprd08.prod.outlook.com (2603:10a6:803:46::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24; Tue, 25 Aug 2020 14:29:33 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:0:cafe::4e) by AM0PR03CA0054.outlook.office365.com
 (2603:10a6:208::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Tue, 25 Aug 2020 14:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 14:29:32 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Tue, 25 Aug 2020 14:29:32 +0000
X-CR-MTA-TID: 64aa7808
Received: from cf47061dff71.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 13822DC1-EC98-4C2F-B064-3EBDBAE27484.1; 
 Tue, 25 Aug 2020 14:29:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf47061dff71.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 14:29:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWcz6Uqy3tMZbweHR1grX+e51lh+2uQbK3ACaheSHmZ0PP4rgrVdb3BpwE55X8KihKphMnVjb0s0XCDUJnJKLenC7EoDO5VIpmRIOMhQJMnfCDxU/pEofBqizRMkkXx/Y7hB8L05etnEENfqwNHvH76hPh2dz4ncwps/3/+xp/RZDrLqjddfJkkEn0ihWXc54+LcKzfVjdTXW4P8IJIhRnfl+MGo/3meF6q0TFD8JERTfBjuExzcKqUcJXs8y5NH0KkZFhA1o1wh6MFPw50psayOlsdKK0U2Sj6zUj609xSULyEKuDXMTz6j75JYX98hYdloddB1tu0lqfzRrcZXxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij1ofwOnhUzq2wMPvB9qWgB7TQFu7cWNt4qxQLn48kQ=;
 b=HWeSy2oNx0WVr5kH8L/+mAVGnK2kN/cbhU2K5RbtQLWGLI75nu0lAq7+BYS7omfQKo9nF7EBNlCs+nnmiivXZNb+xJUcBQYnbJ1dCz6G5MqNaWRNgDtMmFwKCFktNBvSnLU7kbU/O0KlkwOUh5pO7/qmnXS8mwnCydT2OFcUoT2TSCs1yAX0iTL3OHTVO4BGebo1m8TmRvlxBz0k8mVoyUiF1XmTK+LNaWtC+fKEAW8yRtMLGl/Ozy8Cu8DS2LPfDmURHdWeny5erdTiA8SXb99c7SBQTliDqw1cUoBHPs4oNAFZOi2HYpzentoY+QmfZsrFOTOqW7dsYg7+/Nvbmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij1ofwOnhUzq2wMPvB9qWgB7TQFu7cWNt4qxQLn48kQ=;
 b=hM4N4pUSV0nfhlSun9TfLD9IhJSbBC48f60WXEYjTkSKFdAcaTdvkf+AcxrVg25k02bbCsveCxZefQaLkp43kctbAbeSPLiOSZc8hPEkwvf60Em5UjKz5aBeE03ftOhmna02U5KPc4Nj7MSL28eqvm/Vp+AdTwu2fH2zsIgxJMM=
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB3586.eurprd08.prod.outlook.com (2603:10a6:208:e1::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 14:29:26 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::60e0:726f:fcef:2be6]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::60e0:726f:fcef:2be6%4]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 14:29:26 +0000
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>
CC: Andre Przywara <Andre.Przywara@arm.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Kaly Xin
 <Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH v3 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Topic: [PATCH v3 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Index: AQHWesf7ISKVXvDd/kiigaXYzCM0xKlIrUeAgAA0P5A=
Date: Tue, 25 Aug 2020 14:29:25 +0000
Message-ID: <AM0PR08MB37478E45D6FE9C76ED69A4A89E570@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20200825100847.27988-1-wei.chen@arm.com>
 <20200825100847.27988-3-wei.chen@arm.com>
 <232c39d0-cae6-3b5b-1046-c5bc9f6b448e@xen.org>
In-Reply-To: <232c39d0-cae6-3b5b-1046-c5bc9f6b448e@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: E7DCF42406588E40A81A9F492B10E55C.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.112]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9cfb7b11-911f-4962-29a7-08d849034882
x-ms-traffictypediagnostic: AM0PR08MB3586:|VI1PR08MB3071:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB30712DA3F1D5F1C31EEABD129E570@VI1PR08MB3071.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lHGoIUxrRiUDh01UkOdGHV745vSnHRs1iGrcJ5CGfsLfusVysVzH/3VnvYk2F2LN4m6UE7idFqmo0R+7QzK5zMcjAhunSFV06hxF9u+Hzm+tYyoTKGCG3j83UlrutbJBnhZBsmYsDjOoy0nG5E/EpW5qPLLWxWuT/pjJ3K+gTx8AWHtaPzRzBEn1MSXREaYHAmJVD7mnqFVCpSaPSEYV6snGkeAQSwltuFyJb6khlp48rfEFSMOI9a6LJj6jPoKfQRcQEnU2RfLk33yz07iz9JQYoLrEcIcTIVaxEaiRDOyQoS88hngJ+P5r5wXqaoeQB2sqdFMf73tNoXt+hxd0tg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3747.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(6506007)(53546011)(9686003)(478600001)(186003)(26005)(8676002)(33656002)(66946007)(66476007)(66556008)(64756008)(71200400001)(66446008)(76116006)(52536014)(55016002)(86362001)(7696005)(4326008)(5660300002)(316002)(8936002)(2906002)(83380400001)(15650500001)(110136005)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: u5iFGdt2XcLRxn3IUkvIFTFsQz8Ps4FiYMtuPSPK3MMf3+Ur2aa8gKd8zFrlxjdoVZRun9A0m9PnVlMEfMKTfErCfEZweFhCjalGA0RcjbJb1Q0cYa9/j0wC+rxBr2GI1M7wUW0+LQQm+VPjly6Y6qpLf4P9MD4KgieiZzwE60CWmtpficcV8mjXdA52WKmr/FqPLxBRNkck4n7WpFlD4uSHd+2P7U1fsLhMhHu76isAoyJ/DYkjLTuPY+avWrOhbv6LOkUxWQYFTpaW76hUyJU7DmrMzWlUobtOmWZXZRXSv/aANFcHlHRXGeBlo8rZhZq2RiJsejqYrsaBhD7b5npk4blfJQK1d/8N4FHBG+f7Hwlia53/n/9NI9HitzXuM7fA+7LcTAyYRUjh1aTQuVRxkdfkY9DacWrJxHmMUGRmnFNOcE6hcKPSpJAcZthpMLxshEbh/w1juUiSbBjnNTT+TjRVp5dp/sYi+AlL3uS0mjfyy45MPbjBTkNg7jyzQDw/B/EeNCU4iuswhMzmlRLXO8crI5/pxoTOTzyhZXcnDc7qZxY2nLXTvMLLh6gGs9VGG/I4lcnOCvuyfksaa1b+jTgVstjTCKbL5gf3MmtCtqZF28DW9PO1SE4gtmURRmQfJire9SEUt/1Uycym/w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3586
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4455a525-c6c8-43ae-181f-08d8490344c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YpLdv5CSTEBt22rJp90NpyKHLjKzWQtCiWyTUcH61BjZgQq0Yo1RvtdrXuqaQL93Nksx+/luS/ECQ2gOKUZfL5013mZOj3VtOeEKaUiec0DTfBgKaGdqiOs7Gtv1dAfclbbomyDNi1YZXcYKHN2zwE0x4gXIOI4cvFGcSM0PIa1nSTz0YK4i1VmHBIjC7YvemMxvMRpkvrBJTd+uG2QZjUkic7WWddV2T3N1Dv62wZmG4Dan0GHsZOCordil1kk+Try3ulePv+Twqobh90rUMtEqLrONNxSJ7HMyuqOZcTKFG3gHoHlZw4rYCrCh06TxE4/UMMMlMyI3rGfWqdqL/I5zImVusjbAV6V8i5FNUbcaOXZRQGRFNGlKfqbZHPVtJseywNPG+Si7vsx4eDRpOw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(36906005)(70586007)(47076004)(33656002)(6506007)(4326008)(70206006)(52536014)(81166007)(53546011)(478600001)(86362001)(336012)(356005)(15650500001)(8676002)(9686003)(54906003)(7696005)(5660300002)(8936002)(26005)(316002)(82740400003)(2906002)(55016002)(83380400001)(82310400002)(110136005)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 14:29:32.2554 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfb7b11-911f-4962-29a7-08d849034882
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3071
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

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjDlubQ45pyIMjXml6UgMTk6MTgN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBBbmRyZSBQcnp5d2Fy
YSA8QW5kcmUuUHJ6eXdhcmFAYXJtLmNvbT47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5k
Lk1hcnF1aXNAYXJtLmNvbT47IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgS2Fs
eQ0KPiBYaW4gPEthbHkuWGluQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MyAyLzJdIHhlbi9hcm06IFRocm93IG1lc3NhZ2VzIGZvciB1bmtub3duIEZQ
L1NJTUQNCj4gaW1wbGVtZW50IElEDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDI1LzA4LzIwMjAgMTE6
MDgsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEFybSBJRF9BQTY0UEZSMF9FTDEgcmVnaXN0ZXIgcHJv
dmlkZXMgdHdvIGZpZWxkcyB0byBkZXNjcmliZSBDUFUNCj4gPiBGUC9TSU1EIGltcGxlbWVudGF0
aW9ucy4gQ3VycmVudGx5LCB3ZSBleGFjdGx5IGtub3cgdGhlIG1lYW5pbmcgb2YNCj4gPiAweDAs
IDB4MSBhbmQgMHhmIG9mIHRoZXNlIGZpZWxkcy4gWGVuIHRyZWF0cyB2YWx1ZSA8IDggYXMgRlAv
U0lNRA0KPiA+IGZlYXR1cmVzIHByZXNlbnRlZC4gSWYgdGhlcmUgaXMgYSB2YWx1ZSAweDIgYnVt
cGVkIGluIHRoZSBmdXR1cmUsDQo+ID4gWGVuIGJlaGF2aW9ycyBmb3IgdmFsdWUgPD0gMHgxIGNh
biBhbHNvIHRha2UgZWZmZWN0LiBCdXQgd2hhdCBYZW4NCj4gPiBkb25lIGZvciB2YWx1ZSA8PSAw
eDEgbWF5IG5vdCBhbHdheXMgY292ZXIgbmV3IHZhbHVlIDB4MiByZXF1aXJlZC4NCj4gPiBXZSB0
aHJvdyB0aGVzZSBtZXNzYWdlcyB0byBicmVhayB0aGUgc2lsZW5jZSB3aGVuIFhlbiBkZXRlY3Rl
ZA0KPiA+IHVua25vd24gRlAvU0lNRCBJRHMgdG8gbm90aWNlIHVzZXIgdG8gY2hlY2suDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiBSZXZp
ZXdlZC1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPiAN
Cj4gT09JLCBpcyB0aGlzIHJldmlld2VkLWJ5IGNvbWluZyBmcm9tIGludGVybmFsIHJldmlldz8N
Cg0KQWhoLiBObywgSSByZW1lbWJlciBCZXJ0cmFuZCBnYXZlIG1lIGEgcmV2aWV3ZWQtYnkgaW4g
djIsIHNvIEkgcGlja2VkIGl0Lg0KSSBoYWQgbGVmdCBPU1MgZm9yIGEgd2hpbGUsIGFuZCBmb3Jn
b3Qgc29tZXRoaW5nLiBJZiBJIGNhbid0IHBpY2sgaXQgZGlyZWN0bHksIGNvdWxkDQp5b3UgcGxl
YXNlIHRlbGwgbWUgaG93IGNhbiBJIGhhbmRsZSBzdWNoIHJldmlld2VkLWJ5Pw0KDQo+IA0KPiA+
IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICAgICAgICAgfCAxMiArKysrKysr
KysrKysNCj4gPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oIHwgIDIgKysNCj4g
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4gPiBpbmRl
eCA3OTY4Y2VlNDdkLi5lZjM5Y2UxZWM2IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9z
ZXR1cC5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4gPiBAQCAtMTMzLDYgKzEz
MywxOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJvY2Vzc29yX2lkKHZvaWQpDQo+ID4gICAgICAg
ICAgICAgIGNwdV9oYXNfc2ltZCA/ICIgQWR2YW5jZWRTSU1EIiA6ICIiLA0KPiA+ICAgICAgICAg
ICAgICBjcHVfaGFzX2dpY3YzID8gIiBHSUN2My1TeXNSZWciIDogIiIpOw0KPiA+DQo+ID4gKyAg
ICAvKiBXYXJuIHVzZXIgaWYgd2UgZmluZCB1bmtub3duIGZsb2F0aW5nLXBvaW50IGZlYXR1cmVz
ICovDQo+ID4gKyAgICBpZiAoIGNwdV9oYXNfdW5rbm93bl9mcCApDQo+ID4gKyAgICAgICAgcHJp
bnRrKFhFTkxPR19XQVJOSU5HICJXQVJOSU5HOiBVbmtub3duIEZsb2F0aW5nLXBvaW50IElEOiVk
LCAiDQo+ID4gKyAgICAgICAgICAgICAgICJ0aGlzIG1heSByZXN1bHQgdG8gY29ycnVwdGlvbiBv
biB0aGUgcGxhdGZvcm1cbiIsDQo+ID4gKyAgICAgICAgICAgICAgIGJvb3RfY3B1X2ZlYXR1cmU2
NChmcCkpOw0KPiA+ICsNCj4gPiArICAgIC8qIFdhcm4gdXNlciBpZiB3ZSBmaW5kIHVua25vd24g
QWR2YW5jZWRTSU1EIGZlYXR1cmVzICovDQo+ID4gKyAgICBpZiAoIGNwdV9oYXNfdW5rbm93bl9z
aW1kICkNCj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIldBUk5JTkc6IFVua25v
d24gQWR2YW5jZWRTSU1EIElEOiVkLA0KPiAiDQo+ID4gKyAgICAgICAgICAgICAgICJ0aGlzIG1h
eSByZXN1bHQgdG8gY29ycnVwdGlvbiBvbiB0aGUgcGxhdGZvcm1cbiIsDQo+ID4gKyAgICAgICAg
ICAgICAgIGJvb3RfY3B1X2ZlYXR1cmU2NChzaW1kKSk7DQo+ID4gKw0KPiA+ICAgICAgIHByaW50
aygiICBEZWJ1ZyBGZWF0dXJlczogJTAxNiJQUkl4NjQiICUwMTYiUFJJeDY0IlxuIiwNCj4gPiAg
ICAgICAgICAgICAgYm9vdF9jcHVfZGF0YS5kYmc2NC5iaXRzWzBdLCBib290X2NwdV9kYXRhLmRi
ZzY0LmJpdHNbMV0pOw0KPiA+ICAgICAgIHByaW50aygiICBBdXhpbGlhcnkgRmVhdHVyZXM6ICUw
MTYiUFJJeDY0IiAlMDE2IlBSSXg2NCJcbiIsDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS1hcm0vY3B1ZmVhdHVyZS5oIGIveGVuL2luY2x1ZGUvYXNtLQ0KPiBhcm0vY3B1ZmVhdHVy
ZS5oDQo+ID4gaW5kZXggMTA4NzhlYWQ4YS4uYTMyMzA5OTg2ZSAxMDA2NDQNCj4gPiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1cmUuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vY3B1ZmVhdHVyZS5oDQo+ID4gQEAgLTE2LDYgKzE2LDggQEANCj4gPiAgICNkZWZpbmUg
Y3B1X2hhc19mcCAgICAgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChmcCkgPCA4KQ0KPiA+ICAgI2Rl
ZmluZSBjcHVfaGFzX3NpbWQgICAgICAoYm9vdF9jcHVfZmVhdHVyZTY0KHNpbWQpIDwgOCkNCj4g
PiAgICNkZWZpbmUgY3B1X2hhc19naWN2MyAgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChnaWMpID09
IDEpDQo+ID4gKyNkZWZpbmUgY3B1X2hhc191bmtub3duX2ZwICAgKGNwdV9oYXNfZnAgJiYgKGJv
b3RfY3B1X2ZlYXR1cmU2NChmcCkgPj0NCj4gMikpDQo+ID4gKyNkZWZpbmUgY3B1X2hhc191bmtu
b3duX3NpbWQgKGNwdV9oYXNfc2ltZCAmJg0KPiAoYm9vdF9jcHVfZmVhdHVyZTY0KHNpbWQpID49
IDIpKQ0KPiANCj4gSSB3b3VsZCByYXRoZXIgcHJlZmVyIGlmIHdlIGRvbid0IGludHJvZHVjZSBj
cHVfaGFzX3Vua25vd25fe2ZwLCBzaW1kfQ0KPiBidXQgb3Blbi1jb2RlIGRpcmVjdGx5IGluIHRo
ZSAnaWYnLg0KPiANCj4gT3RoZXIgdGhhbiB0aGF0IHRoZSBjb2RlIGxvb2tzIG9rIHRvIG1lLg0K
DQpUaGFua3MsIEkgY291bGQgYWRkcmVzcyBpdCBpbiB2NC4NCg0KPiANCj4gQ2hlZXJzLA0KPiAN
Cj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

