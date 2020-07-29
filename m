Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F8A231A09
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 09:09:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0gD8-0000X4-O8; Wed, 29 Jul 2020 07:09:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kSGO=BI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k0gD7-0000Wz-0Q
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 07:09:09 +0000
X-Inumbo-ID: 646ee81c-d16a-11ea-8c20-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.85]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 646ee81c-d16a-11ea-8c20-bc764e2007e4;
 Wed, 29 Jul 2020 07:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2cKBtYay6SUBHhKq0BxG/6jpeaOSxBEP3HVwLHv64Y=;
 b=H/3M88cx7YA03hfxYsWo37rfC+zJVWlOCYnOvjKt5r/inaqvKhHDqjIoNv+FdGj0kGwV3DjkAsAR5cIh1P+XGdHCNCiqmI4TEbxOM/thGBiZ8ttkVxv4B8kehi6HqJTOHCFMHv3VkIb5NMnZ/LLFmvfGvBzyY/YIduoU3XPCmX8=
Received: from AM6P192CA0094.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::35)
 by VI1PR08MB3024.eurprd08.prod.outlook.com (2603:10a6:803:45::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Wed, 29 Jul
 2020 07:09:04 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::2a) by AM6P192CA0094.outlook.office365.com
 (2603:10a6:209:8d::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Wed, 29 Jul 2020 07:09:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 07:09:04 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62");
 Wed, 29 Jul 2020 07:09:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9e8ac2cd3a0c897f
X-CR-MTA-TID: 64aa7808
Received: from 00240e42dc7e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 58E921A7-443D-469E-A455-B61E884DF8FB.1; 
 Wed, 29 Jul 2020 07:08:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00240e42dc7e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Jul 2020 07:08:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TS69m3nXzlJyyKMa1Bgz2VZGb79s0/tshaohVikmEoL6doyij5byz3b9tEZYbFfQgheYcwDJnZsVOwg/r0kMqgsF/NcRfhI+5UkGqPisXrgMybtK3gHjpaVvqWMherqk9X2+StjL2zR05lTDYGvZ2S1uVSLEQ9B2YFDP1cKJoU0c8yw3V8w4nEyl5WSXWgwymS3fsGriiY/QFbL6yNtaxnniW8tPiVdFETE69bzj9AoMAJqaw3HI2NwpC5vrq4aTzBhKzPhybvH6zHkH/a65I+X0gYbFTSij9nWCQsCoIreSC+v9KTrcBQMTsf8itmnl/Ii1lmLpWI16gIMfHsiayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2cKBtYay6SUBHhKq0BxG/6jpeaOSxBEP3HVwLHv64Y=;
 b=ERkNFSrG26/sM5yF1HHzgABmqF2zOuMm3hEkti8gJsAxoccpYVb1M2oSDsK7+B7ayJVP+p6ah9IEf+CHsr++uYDsqphh00+oGgN0K1I0kg+egdy7S5URNSZ8on3Z1EFAovNavrvG2D+h50c/przriEEFgh5KfDGX2L1Uu6KLgqBfQWBeBYWlK+qDg2LN+DVMLJg6gli/OwalhyBHtjLPMjuCO3L9WERKjDQRTHcauSNgOgVeAc15eTdEtbgTwy0XuJEQ8scKH7lwOLn7cKjRFnNVOiqzafsIMC8NUmAc35V9ZSE06Zbzhby2t+HeZInHowb+943//2XgpiU47LMxYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2cKBtYay6SUBHhKq0BxG/6jpeaOSxBEP3HVwLHv64Y=;
 b=H/3M88cx7YA03hfxYsWo37rfC+zJVWlOCYnOvjKt5r/inaqvKhHDqjIoNv+FdGj0kGwV3DjkAsAR5cIh1P+XGdHCNCiqmI4TEbxOM/thGBiZ8ttkVxv4B8kehi6HqJTOHCFMHv3VkIb5NMnZ/LLFmvfGvBzyY/YIduoU3XPCmX8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3161.eurprd08.prod.outlook.com (2603:10a6:5:1d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Wed, 29 Jul
 2020 07:08:57 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3216.033; Wed, 29 Jul 2020
 07:08:56 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH v2] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWZPcpcJdIAbXhcEqLxJ7JubPXUKkdZ+eAgAC8aQA=
Date: Wed, 29 Jul 2020 07:08:56 +0000
Message-ID: <FCAB700B-4617-4323-BE1E-B80DDA1806C1@arm.com>
References: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
 <8d2d7f03-450c-d50c-630b-8608c6d42bb9@suse.com>
In-Reply-To: <8d2d7f03-450c-d50c-630b-8608c6d42bb9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2a01:cb10:b9:6f00:456:e93c:a708:a06e]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 61defd00-357c-4bb3-90c1-08d8338e4722
x-ms-traffictypediagnostic: DB7PR08MB3161:|VI1PR08MB3024:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3024F95ACD36D9D04165A6D79D700@VI1PR08MB3024.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 34eYB54tesb4p30YBLba2E/PGOPHJa6+Arce25ZqoeE1fwJ1WBPABUgOt/IcuMKkOk2PxzZHWq6T8vIzvF+gjK8CrRVky7VSPZU+jk5dbelgIA+HcpQITaqPneVvtVNqaXH4VZJGHZiuXzJjgk16s3KNmj+pBkaKF4E0nePizFyrzPL1ilBV56tgkpcT24KHLqQk1959LDMrEfOYTUCwmEF2P0Y1dzeI5gPtG+BHxWd4F44Pn9yNdC2/G9+IetHQg0u1q+/L0uGRht4LSwTeyyutoZ5Nz0eNwHUlQWu0BDkIElzExLDi9PehvbdvuHdo6MncTsRGir/LzA2qK6SFV1K276bWmLUcUHMfId3my5IZ4BBkgLLBqJjy44O7pRmf
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(6512007)(6506007)(53546011)(71200400001)(54906003)(83380400001)(33656002)(8936002)(6916009)(36756003)(4326008)(186003)(6486002)(316002)(8676002)(76116006)(86362001)(64756008)(5660300002)(2906002)(66946007)(66446008)(478600001)(7416002)(2616005)(66476007)(91956017)(66556008)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: okYkwMG0R4VCtIt3KI9twYS5FUBebYecLx1bNrdEet6YrlclMcm43CspUovtV/aIZ807Q7YrRAG5NOKZP5TtastWqW5fTKKchAHNzgnxhv1BwyCCB89/lkR5Hw+aCZjOGldA0bhBR9rVtXZ2bnm/C03o4e/Z1Ki1MGjqTt6rVT1WYufx5AzLelsxa5/JfvKPnFakcSdI2a5PKL4mIm8qPJDXXz/5qs45e+Qas1BKEmc7QZNUUsvT0JRYgdueMOdB4m5sPwlXLhVwBREGc/NBKhP8GVbySNnit2w/euZzAQmvsBKAZch47DswyyZeu3ySPHNxGMroX8omejdPlSEJCHDV+9nrPrazDOmjOdreKJsXAx3r5CV769UELqz7yK+NpmY3kR5zM9k4h0mGrvz2YHs5yiyeK+cN5TnqnkkbF5Q5SEyntHubQBfvofOog3JnEoMAQJZhdORymhKql5Ot7aaI4Tjp5YJnxblZymcOJRFXuUl0u1FKsbaKnVyXn7SJ9GW4LZCS9qSPmSZlFiQmrjh5GjvWulHI4FYb2pOOSk8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <30EC55053AF9844B8F10D7D301AC1229@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3161
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: af9dd93d-a4b4-4eb8-f0aa-08d8338e4266
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KKVXRE6i+9VlH3CDNRozMeMGz/XxR0QZbTKWV1ez7QaZIcDWfapRxM321cS2O6cUCimUKQ46Lx25oDYBocH3An17Fa6Bgf7o4d35G34hATmzCHt32lnxd+FHMGuPQlnk1p6TfMkGHmxeXXzjUxiIF09sHxKgK51muFSXq3OiijFFh9Whs1OZZCj8CExkA4KU5y/O1ZfpPpZZNX/wLOxdDWyZcQeDrozAhn5tkq1N7CkvrOZe5KTcwaRxSoBpUVfrh9j58kjb8roT8qcrib8tSSdAtrg5BlJ+T8ce5vrd9/M8AXZJUk1ABuLeK6iJS1t5loFE8eMJa0n2Y1Dn3ae/vBk+tkNAZmZcxyPdPd7UmgF4f4w2ny6iT3lbdPyYpnEQcNsghZPUmnGmCZ7/8/wdNUiYaKBcdJbNuWehyfhXTBU=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(346002)(39850400004)(396003)(46966005)(6862004)(6512007)(478600001)(2616005)(6486002)(336012)(4326008)(107886003)(2906002)(26005)(36756003)(8936002)(36906005)(86362001)(54906003)(53546011)(6506007)(186003)(33656002)(316002)(8676002)(82740400003)(356005)(81166007)(70586007)(82310400002)(47076004)(70206006)(5660300002)(83380400001)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 07:09:04.4035 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61defd00-357c-4bb3-90c1-08d8338e4722
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3024
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjggSnVsIDIwMjAsIGF0IDIxOjU0LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjguMDcuMjAyMCAxNzo1MiwgQmVydHJhbmQgTWFycXVp
cyB3cm90ZToNCj4+IEF0IHRoZSBtb21lbnQgb24gQXJtLCBhIExpbnV4IGd1ZXN0IHJ1bm5pbmcg
d2l0aCBLVFBJIGVuYWJsZWQgd2lsbA0KPj4gY2F1c2UgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVu
IGEgY29udGV4dCBzd2l0Y2ggaGFwcGVucyBpbiB1c2VyIG1vZGU6DQo+PiAoWEVOKSBwMm0uYzox
ODkwOiBkMXYwOiBGYWlsZWQgdG8gd2FsayBwYWdlLXRhYmxlIHZhIDB4ZmZmZmZmODM3ZWJlMGNk
MA0KPj4gVGhlIGVycm9yIGlzIGNhdXNlZCBieSB0aGUgdmlydHVhbCBhZGRyZXNzIGZvciB0aGUg
cnVuc3RhdGUgYXJlYQ0KPj4gcmVnaXN0ZXJlZCBieSB0aGUgZ3Vlc3Qgb25seSBiZWluZyBhY2Nl
c3NpYmxlIHdoZW4gdGhlIGd1ZXN0IGlzIHJ1bm5pbmcNCj4+IGluIGtlcm5lbCBzcGFjZSB3aGVu
IEtQVEkgaXMgZW5hYmxlZC4NCj4+IFRvIHNvbHZlIHRoaXMgaXNzdWUsIHRoaXMgcGF0Y2ggaXMg
ZG9pbmcgdGhlIHRyYW5zbGF0aW9uIGZyb20gdmlydHVhbA0KPj4gYWRkcmVzcyB0byBwaHlzaWNh
bCBhZGRyZXNzIGR1cmluZyB0aGUgaHlwZXJjYWxsIGFuZCBtYXBwaW5nIHRoZQ0KPj4gcmVxdWly
ZWQgcGFnZXMgdXNpbmcgdm1hcC4gVGhpcyBpcyByZW1vdmluZyB0aGUgY29udmVyc2lvbiBmcm9t
IHZpcnR1YWwNCj4+IHRvIHBoeXNpY2FsIGFkZHJlc3MgZHVyaW5nIHRoZSBjb250ZXh0IHN3aXRj
aCB3aGljaCBpcyBzb2x2aW5nIHRoZQ0KPj4gcHJvYmxlbSB3aXRoIEtQVEkuDQo+PiBUaGlzIGlz
IGRvbmUgb25seSBvbiBhcm0gYXJjaGl0ZWN0dXJlLCB0aGUgYmVoYXZpb3VyIG9uIHg4NiBpcyBu
b3QNCj4+IG1vZGlmaWVkIGJ5IHRoaXMgcGF0Y2ggYW5kIHRoZSBhZGRyZXNzIGNvbnZlcnNpb24g
aXMgZG9uZSBhcyBiZWZvcmUNCj4+IGR1cmluZyBlYWNoIGNvbnRleHQgc3dpdGNoLg0KPj4gVGhp
cyBpcyBpbnRyb2R1Y2luZyBzZXZlcmFsIGxpbWl0YXRpb25zIGluIGNvbXBhcmlzb24gdG8gdGhl
IHByZXZpb3VzDQo+PiBiZWhhdmlvdXIgKG9uIGFybSBvbmx5KToNCj4+IC0gaWYgdGhlIGd1ZXN0
IGlzIHJlbWFwcGluZyB0aGUgYXJlYSBhdCBhIGRpZmZlcmVudCBwaHlzaWNhbCBhZGRyZXNzIFhl
bg0KPj4gd2lsbCBjb250aW51ZSB0byB1cGRhdGUgdGhlIGFyZWEgYXQgdGhlIHByZXZpb3VzIHBo
eXNpY2FsIGFkZHJlc3MuIEFzDQo+PiB0aGUgYXJlYSBpcyBpbiBrZXJuZWwgc3BhY2UgYW5kIHVz
dWFsbHkgZGVmaW5lZCBhcyBhIGdsb2JhbCB2YXJpYWJsZSB0aGlzDQo+PiBpcyBzb21ldGhpbmcg
d2hpY2ggaXMgYmVsaWV2ZWQgbm90IHRvIGhhcHBlbi4gSWYgdGhpcyBpcyByZXF1aXJlZCBieSBh
DQo+PiBndWVzdCwgaXQgd2lsbCBoYXZlIHRvIGNhbGwgdGhlIGh5cGVyY2FsbCB3aXRoIHRoZSBu
ZXcgYXJlYSAoZXZlbiBpZiBpdA0KPj4gaXMgYXQgdGhlIHNhbWUgdmlydHVhbCBhZGRyZXNzKS4N
Cj4+IC0gdGhlIGFyZWEgbmVlZHMgdG8gYmUgbWFwcGVkIGR1cmluZyB0aGUgaHlwZXJjYWxsLiBG
b3IgdGhlIHNhbWUgcmVhc29ucw0KPj4gYXMgZm9yIHRoZSBwcmV2aW91cyBjYXNlLCBldmVuIGlm
IHRoZSBhcmVhIGlzIHJlZ2lzdGVyZWQgZm9yIGEgZGlmZmVyZW50DQo+PiB2Y3B1LiBJdCBpcyBi
ZWxpZXZlZCB0aGF0IHJlZ2lzdGVyaW5nIGFuIGFyZWEgdXNpbmcgYSB2aXJ0dWFsIGFkZHJlc3MN
Cj4+IHVubWFwcGVkIGlzIG5vdCBzb21ldGhpbmcgZG9uZS4NCj4gDQo+IEJlc2lkZSBtZSB0aGlu
a2luZyB0aGF0IGFuIGluLXVzZSBhbmQgc3RhYmxlIEFCSSBjYW4ndCBiZSBjaGFuZ2VkIGxpa2UN
Cj4gdGhpcywgbm8gbWF0dGVyIHdoYXQgaXMgImJlbGlldmVkIiBrZXJuZWwgY29kZSBtYXkgb3Ig
bWF5IG5vdCBkbywgSQ0KPiBhbHNvIGRvbid0IHRoaW5rIGhhdmluZyBhcmNoLWVzIGRpdmVyZ2Ug
aW4gYmVoYXZpb3IgaGVyZSBpcyBhIGdvb2QNCj4gaWRlYS4gVXNlIG9mIGNvbW1vbmx5IGF2YWls
YWJsZSBpbnRlcmZhY2VzIHNob3VsZG4ndCBsZWFkIHRvIGhlYWQNCj4gYWNoZXMgb3Igc3VycHJp
c2VzIHdoZW4gcG9ydGluZyBjb2RlIGZyb20gb25lIGFyY2ggdG8gYW5vdGhlci4gSSdtDQo+IHBy
ZXR0eSBzdXJlIGl0IHdhcyBzdWdnZXN0ZWQgYmVmb3JlOiBXaHkgZG9uJ3QgeW91IHNpbXBseSBp
bnRyb2R1Y2UNCj4gYSBwaHlzaWNhbCBhZGRyZXNzIGJhc2VkIGh5cGVyY2FsbCAoYW5kIHRoZW4g
YWxzbyBvbiB4ODYgYXQgdGhlIHNhbWUNCj4gdGltZSwga2VlcGluZyBmdW5jdGlvbmFsIHBhcml0
eSk/IEkgZXZlbiBzZWVtIHRvIHJlY2FsbCBnaXZpbmcgYQ0KPiBzdWdnZXN0aW9uIGhvdyB0byBm
aXQgdGhpcyBpbnRvIGEgZnV0dXJlICJwaHlzaWNhbCBhZGRyZXNzZXMgb25seSINCj4gbW9kZWws
IGFzIGxvbmcgYXMgd2UgY2FuIHNldHRsZSBvbiB0aGUgYmFzaWMgcHJpbmNpcGxlcyBvZiB0aGF0
DQo+IGNvbnZlcnNpb24gcGF0aCB0aGF0IHdlIHdhbnQgdG8gZ28gc29vbmVyIG9yIGxhdGVyIGFu
eXdheSAoYXMgSQ0KPiB1bmRlcnN0YW5kKS4NCg0KSSBmdWxseSBhZ3JlZSB3aXRoIHRoZSDigJxw
aHlzaWNhbCBhZGRyZXNzIG9ubHnigJ0gbW9kZWwgYW5kIGkgdGhpbmsgaXQgbXVzdCBiZQ0KZG9u
ZS4gSW50cm9kdWNpbmcgYSBuZXcgaHlwZXJjYWxsIHRha2luZyBhIHBoeXNpY2FsIGFkZHJlc3Mg
YXMgcGFyYW1ldGVyDQppcyB0aGUgbG9uZyB0ZXJtIHNvbHV0aW9uIChhbmQgSSB3b3VsZCBldmVu
IHZvbHVudGVlciB0byBkbyBpdCBpbiBhIG5ldyBwYXRjaHNldCkuDQpCdXQgdGhpcyB3b3VsZCBu
b3Qgc29sdmUgdGhlIGlzc3VlIGhlcmUgdW5sZXNzIGxpbnV4IGlzIG1vZGlmaWVkLg0KU28gSSBk
byBzZWUgdGhpcyBwYXRjaCBhcyBhIOKAnGJ1ZyBmaXjigJ0uDQoNCj4gDQo+PiAtLS0gYS94ZW4v
YXJjaC94ODYvZG9tYWluLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYw0KPj4gQEAg
LTE2NDIsNiArMTY0MiwzMCBAQCB2b2lkIHBhcmF2aXJ0X2N0eHRfc3dpdGNoX3RvKHN0cnVjdCB2
Y3B1ICp2KQ0KPj4gICAgICAgICAgd3Jtc3JfdHNjX2F1eCh2LT5hcmNoLm1zcnMtPnRzY19hdXgp
Ow0KPj4gIH0NCj4+ICAraW50IGFyY2hfdmNwdV9zZXR1cF9ydW5zdGF0ZShzdHJ1Y3QgdmNwdSAq
diwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2Y3B1X3JlZ2lzdGVy
X3J1bnN0YXRlX21lbW9yeV9hcmVhIGFyZWEpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgdmNwdV9y
dW5zdGF0ZV9pbmZvIHJ1bnN0YXRlOw0KPj4gKw0KPj4gKyAgICBydW5zdGF0ZV9ndWVzdCh2KSA9
IGFyZWEuYWRkci5oOw0KPj4gKw0KPj4gKyAgICBpZiAoIHYgPT0gY3VycmVudCApDQo+PiArICAg
IHsNCj4+ICsgICAgICAgIF9fY29weV90b19ndWVzdChydW5zdGF0ZV9ndWVzdCh2KSwgJnYtPnJ1
bnN0YXRlLCAxKTsNCj4+ICsgICAgfQ0KPiANCj4gUG9pbnRsZXNzIGJyYWNlcyAoYW5kIEkgdGhp
bmsgdGhlcmUgYXJlIG1vcmUgaW5zdGFuY2VzKS4NCg0KU286DQppZiBjb25kDQogICBpbnN0cnVj
dGlvbg0KZWxzZQ0Kew0KICAgeHh4DQp9DQoNCmlzIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBk
b25lIGluIFhlbiA/DQoNClNvcnJ5IGlmIGkgZG8gdGhvc2Uga2luZCBvZiBtaXN0YWtlcyBpbiB0
aGUgZnV0dXJlIGFzIGkgYW0gbW9yZSB1c2VkIHRvIGEgbW9kZWwNCndoZXJlIG5vIGJyYWNlcyBp
cyBhbiBhYnNvbHV0ZSBuby1nby4gSSB3aWxsIHRyeSB0byByZW1lbWJlciB0aGlzLg0KDQo+IA0K
Pj4gKyAgICBlbHNlDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHZjcHVfcnVuc3RhdGVfZ2V0KHYs
ICZydW5zdGF0ZSk7DQo+PiArICAgICAgICBfX2NvcHlfdG9fZ3Vlc3QocnVuc3RhdGVfZ3Vlc3Qo
diksICZydW5zdGF0ZSwgMSk7DQo+PiArICAgIH0NCj4+ICsgICAgcmV0dXJuIDA7DQo+IA0KPiBN
aXNzaW5nIGJsYW5rIGxpbmUgYmVmb3JlIG1haW4gInJldHVybiIuDQoNCkkgd2lsbCBmaXggaXQu
DQpCZXJ0cmFuZA0KDQo=

