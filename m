Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A361A1EE0A7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 11:09:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jglrb-0000Z5-Ka; Thu, 04 Jun 2020 09:08:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmK+=7R=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jglra-0000Yu-Ax
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 09:08:38 +0000
X-Inumbo-ID: f958f74a-a642-11ea-81bc-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::61a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f958f74a-a642-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 09:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkgxyVdMG3hPkxRUYURCQ8qGCtpJOxqrUT6RtKnXsXA=;
 b=xLsPhkYdNBYj96pIV0hBEyEE/mI6IDSy4oOux6bTg018gAjX2ge2PlnWnat8QEUYeVs2K3X128daywV7WtxsiUr1vYtmCsRLlE7DzVHPB5Ojcu/9LM9aszfH3v216lZB6EPRVa7lXsW4YO7xqc4mjxwiLR3w/M133jvEdk36ywE=
Received: from AM0PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:208:1::48)
 by VI1PR08MB5357.eurprd08.prod.outlook.com (2603:10a6:803:12e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 4 Jun
 2020 09:08:34 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:1:cafe::62) by AM0PR04CA0071.outlook.office365.com
 (2603:10a6:208:1::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Thu, 4 Jun 2020 09:08:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Thu, 4 Jun 2020 09:08:33 +0000
Received: ("Tessian outbound 952576a3272a:v57");
 Thu, 04 Jun 2020 09:08:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef18dfa405aa7f49
X-CR-MTA-TID: 64aa7808
Received: from 19b7b11a8bfc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D4BE9F9D-3B69-4563-A915-F1B2A599C087.1; 
 Thu, 04 Jun 2020 09:08:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19b7b11a8bfc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 Jun 2020 09:08:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEmtfAlPwn8YkEqBs8ujWDsTDXqMCrJ5JrA1Sb2e3W8liWYVs2V9133qj8s6z2U3tSe/YlvQQb99V1L8y80vsITtF1IYaHRXi22fj9VLyXyywEMGL4SqBdOCkzWkHole2BVOQVOkqGi65M+TpPpWaCqVoqDAprFFebf92WtT41xng2GRvL1nHX7ArVyp4fuWqmx+pa/djgqg6VB14zkaljAsVZohF+v1WAefvSOX1/9kpXMM1NY6gsHufdZPPhDuE0q3IG6h4znR9+oFkFdGr7EzfM6Xtv1rFfhBeCG4fFkQizxt3iXilBVE1UvRh3p8io8tkYmBqJldepOCjXy7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkgxyVdMG3hPkxRUYURCQ8qGCtpJOxqrUT6RtKnXsXA=;
 b=KZLtmbUqniLHDJU966WUFwLwU09rmuXjF4rbeoHtl00DgK17pPJA76BC7QcO75bgslwieJcV3WwVLnot9aui50KQJ1TnL1WD6vWGB8FqoJyL/ia531+0WOXEri/BaSAMbQr6IiXxjU8aIvRoKkYdWy6QVWGKWSuNJqjqxCs2PK6uusb41rSFIKmPcob9pCB8SeTco6DCM0vqUcTPpD1plAHLyVUe1gUp9gFz2VbnfogogEpP0bm41QNHVgg/vDCe43EUxaspajsbcuY5qRglvmjN2biU4weTu5k0+gr0zLjuZ+d7hl6IB/EWAxVXE77808iPJWRdMn/6DcbRQn6SMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkgxyVdMG3hPkxRUYURCQ8qGCtpJOxqrUT6RtKnXsXA=;
 b=xLsPhkYdNBYj96pIV0hBEyEE/mI6IDSy4oOux6bTg018gAjX2ge2PlnWnat8QEUYeVs2K3X128daywV7WtxsiUr1vYtmCsRLlE7DzVHPB5Ojcu/9LM9aszfH3v216lZB6EPRVa7lXsW4YO7xqc4mjxwiLR3w/M133jvEdk36ywE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3627.eurprd08.prod.outlook.com (2603:10a6:10:49::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 4 Jun
 2020 09:08:26 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3066.019; Thu, 4 Jun 2020
 09:08:26 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: Keystone Issue
Thread-Topic: Keystone Issue
Thread-Index: AQHWOBaIAfEL/lLkK0WiNSn4kZcZc6jDwRQAgAAfVYCAACZwgIACvmKAgABfPYCAAA+JgIAA6NEAgAAP9wCAAAJxgA==
Date: Thu, 4 Jun 2020 09:08:26 +0000
Message-ID: <00E14EAD-BD23-4A3A-872E-0C47C26B7B41@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
 <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
 <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
 <CALYbLDh3C02+CV88LqR2zv+ggRgup-Qhi+udGzgePmkdM0KcFw@mail.gmail.com>
 <deee1523-cfb5-f186-11a3-33fa1f7b94c1@xen.org>
 <8C39F9D0-8351-4671-9A39-D5D4BFF02BD6@arm.com>
 <3ff17aa9-0aae-d598-40ce-4e90d4e50cc7@xen.org>
In-Reply-To: <3ff17aa9-0aae-d598-40ce-4e90d4e50cc7@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 128cf710-ce50-43dc-53ba-08d80866db82
x-ms-traffictypediagnostic: DB7PR08MB3627:|VI1PR08MB5357:
X-Microsoft-Antispam-PRVS: <VI1PR08MB5357A0E101A5259F8D78B8239D890@VI1PR08MB5357.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04244E0DC5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: OzxdE0fB5tP4nWhuehPuRzPmJbfknOyURO1gjvDnRqXr/lpJorAfvfOZARCVGxmrriAOlRyXxQzsPGoQL5V/qo3Ik/NVysOQtLb1lAAeMZr4SwU+sGP16OBqcTh0JA4g+w39Tlq8PQzbmHjlGitmPfo7cgaRbI2QyBdH7o+9Le4kityO/tpU7t8mefTGfFF44kJNwpW4tJ5TV6ZNWnlJZgI+BEYAjOGY+IfX5jjykO+EskS5XUregvoN5tQL4EvOTJLB9r/Ama3L9R67eJcsMnUuOoC5hssf+TUAkc3oLn6RLRlmHb3NdohKH61jv1By
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(36756003)(7116003)(3480700007)(26005)(6506007)(478600001)(6512007)(6916009)(4326008)(53546011)(54906003)(86362001)(6486002)(71200400001)(8676002)(316002)(83380400001)(91956017)(2616005)(186003)(76116006)(8936002)(33656002)(66556008)(2906002)(66946007)(66446008)(64756008)(5660300002)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: HmVT2DZR8qWV/HMOsWHb65GKSFNJPsU9tbr3IW1IHd24zIGWweFA614+zwZlbVrmYh9WeSWRF1vZXOrXtoaD+fZSukZqniS778GX0x83oAJVxQdzW70BdG1aWPU4d+kF7gbYznLfemnnSJWFCgKdLt5W38NdhUYnN05LCMCkMSl1z0LwWv0j4taelibOjeMriuXbK8rtE4qnqTdkRHtZ5a7YK9HAVkWG34rTTy/+MqUl/LhFbLCoRI+pI53f/2fH3GW/YQOn2dAyc4cgXucNyANhXKrh8pCNkkOFoTpuSOwfW/CI6cIcuCrCJ1F9v/kQT4kuHhrVgq+QqcRS3UQ1EPCx0F64v208zRKYMJbkbWMWQgImi8kFuJ4m25AnyortA31/Ifgi10iPCmWyKJhLnuCgqiZESPp6FalAvk5v/x/Y3cQ6ek5rj9gAQNjzjH3SUSoWxDVf9KmyXTs+Qz2Hzq9ofBrcLYRZTK+k/Y1FeECyONL4CPqVdtJHfLIhdEm4
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C98B0223A349554CA454F9B7F663B0DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3627
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(46966005)(81166007)(83380400001)(6486002)(33656002)(8676002)(336012)(478600001)(82740400003)(2906002)(5660300002)(82310400002)(36756003)(8936002)(356005)(70206006)(2616005)(7116003)(53546011)(3480700007)(47076004)(54906003)(86362001)(36906005)(4326008)(316002)(70586007)(186003)(6862004)(6506007)(6512007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5ccd4846-90ab-43e3-425c-08d80866d743
X-Forefront-PRVS: 04244E0DC5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4p6D+tEIiOwD+aw5m3dWgsRLmpxtxtlMcoZdL9DB6m9dVhEs2YxENx6+6KV8IbDZOm1U4NmfWLbAD8DKrfZ+cOE/85cCbk0oW0VLSlDWFCkA8XUWOH5VnrGxa6AdLzdfqAGjutsaKIqqUwC5D98nrxW0lm+2XtOXh/mIWAjgOPCgZJ0P/sJwJQURH6n3lcrT+j5rS+xwhBwxjOGoV75+PUFabsEnoPyP/fNOEkIiwzL6J2EK43Xo+sKX6CmN/P8qy0hFWoVt5UhrXIuhPT9zxpBnDOVOdj27OQJNdyK+GceoXTb8vemFtz7FmWHwRIzrEduqKCg2If454LbCLjRN9Ure6z6jVkVD9qD3RwbI575CBhyw1E+X5i8wzZFtLINxaF5vdyfERC8ctbkN8KzfjQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2020 09:08:33.4513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 128cf710-ce50-43dc-53ba-08d80866db82
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5357
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 CodeWiz2280 <codewiz2280@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gNCBKdW4gMjAyMCwgYXQgMDk6NTksIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwNC8wNi8yMDIwIDA5OjAyLCBCZXJ0cmFuZCBN
YXJxdWlzIHdyb3RlOg0KPj4gSGksDQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+Pj4gT24gMyBK
dW4gMjAyMCwgYXQgMTk6MDksIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0K
Pj4+IA0KPj4+IA0KPj4+IA0KPj4+IE9uIDAzLzA2LzIwMjAgMTg6MTMsIENvZGVXaXoyMjgwIHdy
b3RlOg0KPj4+PiBIaSBKdWxpZW4sDQo+Pj4gDQo+Pj4gSGVsbG8sDQo+Pj4gDQo+Pj4gSW4gZ2Vu
ZXJhbCwgd2UgYXZvaWQgdG9wIHBvc3Qgb24geGVuLWRldmVsLCBpbnN0ZWFkIHdlIHJlcGx5IGlu
bGluZS4gSSBiZWxpZXZlIGdtYWlsIHNob3VsZCBhbGxvdyB5b3UgdG8gZG8gaXQgOikuDQo+Pj4g
DQo+Pj4+IFRoZSBvZmZzZXQgaXMgYWxyZWFkeSBhcHBsaWVkIHRvIHRoZSBtZW1vcnkgbm9kZXMg
aW4gdGhlIGRldmljZSB0cmVlLCBtZWFuaW5nIGEgZGlyZWN0IExpbnV4IGJvb3QgZnJvbSB1Ym9v
dCB3b3VsZCBoYXZlIG9ubHkgdGhlIDM2LWJpdCBhZGRyZXNzZXMgaW4gdGhlIGRldmljZSB0cmVl
ICgweDhfMDAwMF8wMDAwIGFuZCAweDhfODAwMF8wMDAwKS4gIExpbnV4IHdvdWxkIHN0YXJ0IGV4
ZWN1dGluZyBmcm9tIGEgMzItYml0IGFkZHJlc3Mgc3BhY2UgaG93ZXZlciBhbmQgdGhlbiBzd2l0
Y2ggb3ZlciB0byB0aGUgYWxpYXNlZCAzNi1iaXQgYWRkcmVzc2VzIGluIHRoZSBkZXZpY2UgdHJl
ZSBhcyBkaXNjdXNzZWQgYmVsb3cgYnkgZWFybHlfcGFnaW5nX2luaXQoKS4NCj4+Pj4gSSBoYWQg
dG8gYWRkIHRoZSAzMi1iaXQgbWVtb3J5IG5vZGUgMHg4MDAwXzAwMDAgaW4gdWJvb3QgaW4gcGxh
Y2Ugb2YgdGhlIDB4OF8wMDAwXzAwMDAgbm9kZSBvdGhlcndpc2UgWGVuIHdvdWxkIGRldGVjdCB0
aGUgMzItYml0IHByb2Nlc3NvciBhbmQgcGFuaWMgb24gIlVuYWJsZSB0byBkZXRlY3QgdGhlIGZp
cnN0IG1lbW9yeSBiYW5rIiBpbiBkb21haW5fYnVpbGQuYy4NCj4+PiANCj4+PiBTbyBmb3IgMzIt
Yml0IFhlbiByZXF1aXJlcyB0byBoYXZlIHRoZSBmaXJzdCBiYW5rIGJlbG93IDRHQi4gVGhpcyBp
cyBiZWNhdXNlIHlvdSBjYW4ndCBib290IGZyb20gYSBwaHlzaWNhbCBhZGRyZXNzIGFib3ZlIDMy
LWJpdC4NCj4+PiANCj4+PiBPYnZpb3VzbHksIHRoaXMgY2hlY2sgd291bGRuJ3Qgd29yayBvbiB5
b3VyIHBsYXRmb3JtIGJlY2F1c2UgYWxsIHlvdXIgbWVtb3J5IHdpbGwgYmUgYWJvdmUgNEdCLg0K
Pj4gSSB0aGluayB0aGF0IHRoZSBLZXlzdG9uZSBib2FyZCBoYXMgbG93IG1lbW9yeSBhY2Nlc3Np
YmxlIGF0IDIgZGlmZmVyZW50IGFkZHJlc3MgKG9uZSBsb3cgYW5kIG9uZSBoaWdoKS4NCj4+IEkg
d291bGQgaGVyZSBzdWdnZXN0IHRvIGhhdmUgYSBkdGIgd2l0aCAyIHJlZ2lvbnMgKG9uZSB1bmRl
ciA0R0IgYW5kIG9uZSBvdmVyKSBhbmQgcmVtb3ZlIGZyb20gdGhlIHJlZ2lvbiBvdmVyIDRHIHRo
ZSBhcmVhIGFscmVhZHkgYWRkcmVzc2VkIGJ5IHRoZSByZWdpb24gdW5kZXIgNEdCLg0KPiANCj4g
SSB0aG91Z2h0IGFib3V0IHRoaXMuIEhvd2V2ZXIsIGluIGFuIGVhcmxpZXIgcmVwbHksIERhdmlk
IHdyb3RlOg0KPiANCj4gIjQuIFRoZSBkb20wIGtlcm5lbCB3aWxsIGJvb3QgZnJvbSB4ZW4gaWYg
dGhlIGVhcmx5X3BhZ2luZ19pbml0IHN3aXRjaCBzdGVwIGlzIHNraXBwZWQsIGFuZCB0aGUgbG93
IG1lbSBzdGF5cyBpbiAzMi1iaXQuLi4uYnV0IHRoZXJlIGlzIGENCj4gcHJvYmxlbSB3aXRoIHRo
ZSBwZXJpcGhlcmFscyBzbyB0aGlzIGlzIG5vdCBhbiBhY2NlcHRhYmxlIHNvbHV0aW9uLiINCj4g
DQo+IEl0IGlzIG5vdCBjbGVhciB0byBtZSB3aGF0IHNvcnQgb2YgaXNzdWVzIHdpbGwgYXJpc2Ug
d2l0aCB0aGUgcGVyaXBoZXJhbHMuIEJ1dCBJIGhhdmUgYXNzdW1lZCB0aGF0IGl0IHdvdWxkbid0
IGJlIHBvc3NpYmxlIGZvciBEb20wIHRvIGtlZXAgdXNpbmcgdGhlIG1lbW9yeSBiZWxvdyA0R0Iu
DQoNCkkgd291bGQgaGF2ZSB0aG91Z2h0IHRoYXQgbGludXggd291bGQgaGF2ZSBuZWVkIHNvbWUg
bWVtb3J5LCBldmVuIHNtYWxsIGluIHRoZSAzMmJpdCBzcGFjZSBpbiBvcmRlciB0byBib290Lg0K
SSBjb3VsZCB1bmRlcnN0YW5kIHRoYXQgc29tZSBtZW1vcnkgaW4gdGhlIGxvdyBhZGRyZXNzIHNw
YWNlIG5lZWRzIHRvIGJlIHJlc2VydmVkIGJ5IExpbnV4IGFzIERNQSBhcmVhIGZvciBwZXJpcGhl
cmFscyBub3Qgc3VwcG9ydGluZyAzNi1iaXQgYWRkcmVzc2VzLCBidXQgdGhlIHdob2xlIGxvdyBt
ZW1vcnkgc291bmRzIGxpa2UgYSBiaWcgcmVzdHJpY3Rpb24uDQoNCldvdWxkIGl0IGJlIHBvc3Np
YmxlIHRvIGhhdmUgYSBiaXQgbW9yZSBpbmZvcm1hdGlvbiBvbiB0aGUg4oCccHJvYmxlbSB3aXRo
IHBlcmlwaGVyYWxz4oCdIGhlcmUgPw0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg==

