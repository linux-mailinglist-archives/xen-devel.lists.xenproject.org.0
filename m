Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1A6250F12
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 04:32:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAOkh-00020Y-BA; Tue, 25 Aug 2020 02:31:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BGsN=CD=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kAOkf-00020K-1K
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 02:31:57 +0000
X-Inumbo-ID: bbd69418-b528-47d9-b452-60ca10cd2a92
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.75]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbd69418-b528-47d9-b452-60ca10cd2a92;
 Tue, 25 Aug 2020 02:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjVogehV8ITbb2JbbEFo+ugEth5inCuHB6CFTE309u4=;
 b=Jkq8Dbb9lME868KuuF1TGDMz5PF69o6rXUvDayFYvcoPSIbUUq22imuCY8pbCEIxYid+bjtRznB6tUe9FHftVYsBMEVVLONR77Kg4uYDXDxCCxvoqPo8f59uxDsICOCXt9yi9BY8nWwf92XoYDQ3DL+GsJcSfOpn+PKsGzs6qFs=
Received: from AM6P191CA0104.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::45)
 by VE1PR08MB4654.eurprd08.prod.outlook.com (2603:10a6:802:a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Tue, 25 Aug
 2020 02:31:51 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::31) by AM6P191CA0104.outlook.office365.com
 (2603:10a6:209:8a::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Tue, 25 Aug 2020 02:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 02:31:51 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Tue, 25 Aug 2020 02:31:50 +0000
X-CR-MTA-TID: 64aa7808
Received: from 8ccb52155d8b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 782939A2-DF85-4734-B3AA-F24815D757EC.1; 
 Tue, 25 Aug 2020 02:31:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ccb52155d8b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 02:31:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3tec/pqvSRpGMpKF4vAQIMgyIjvqccUBUPBbG3ZIUHkdvhgxPrqoasrYbMxWxbLE+ZS/6iAM4lw1hrS5pzKGNIqa5ZRTN1czB6w4yK/uSRRYHwN4pnhLtzWvV3FRhuUFp75nDSLmdFmhlPRJgxgZtb6OA1XjPN6YI5kJzIQfwMU6iJGYUdP4dC+bY+m/xPq+on1l28QbHO6OJWlbb9LXcr1L5JLkZKxOVSKkHdHzSjjkzaDDI5w2/mEFWZZHBs97LdE5ViDybeVIwHNXszSAJPgIYj2RSOR2c4iybdpMHEPI6PiXVLY72K7imXty12+BmUl4cYuqcgAmZjqYtoOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjVogehV8ITbb2JbbEFo+ugEth5inCuHB6CFTE309u4=;
 b=UR9yzW5gs3nWcXOkXEvpjtzGgRzsHsCKP69dWdWvxy+EE/BQZaGtN1YpH26oBUJreEYM5mxxJ8IC+QOHClQrp+8AvzGj4e4NYfhNx0laN7aeF0Ah7Ux9Yp463gZa1ljipxuCjJRrbabggGOch7kPO2JRTbEweIiPfY84sAtoiYylYICq02GcYPerPAJG0VyZX9AUAByZpKiDuTeP4Y7EkB3safY7yosgJe8SddKlwr8tJ297Hg4/MKG2GhKoZgrZBN4UG3Y1a7AmS1N8lrvK/A6vP/t4Uer44/+70u9bn7Kg7XG9FslgF3a9CcWIlywP3heaEY/xjFrixDCtKMmTPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjVogehV8ITbb2JbbEFo+ugEth5inCuHB6CFTE309u4=;
 b=Jkq8Dbb9lME868KuuF1TGDMz5PF69o6rXUvDayFYvcoPSIbUUq22imuCY8pbCEIxYid+bjtRznB6tUe9FHftVYsBMEVVLONR77Kg4uYDXDxCCxvoqPo8f59uxDsICOCXt9yi9BY8nWwf92XoYDQ3DL+GsJcSfOpn+PKsGzs6qFs=
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB3748.eurprd08.prod.outlook.com (2603:10a6:208:fb::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 02:31:44 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::60e0:726f:fcef:2be6]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::60e0:726f:fcef:2be6%4]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 02:31:44 +0000
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>
CC: Andre Przywara <Andre.Przywara@arm.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Kaly Xin
 <Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH v2 1/2] xen/arm: Missing N1/A76/A75 FP registers in vCPU
 context switch
Thread-Topic: [PATCH v2 1/2] xen/arm: Missing N1/A76/A75 FP registers in vCPU
 context switch
Thread-Index: AQHWecbQ1sBF1ew3NUWUNX3qV5XwE6lHPaIAgADebuA=
Date: Tue, 25 Aug 2020 02:31:43 +0000
Message-ID: <AM0PR08MB3747820B8849490D8F1C3C919E570@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20200824032825.18368-1-wei.chen@arm.com>
 <20200824032825.18368-2-wei.chen@arm.com>
 <e8f8e576-8e83-4ff0-ace6-a67c8121a911@xen.org>
In-Reply-To: <e8f8e576-8e83-4ff0-ace6-a67c8121a911@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 9FD15D54F7B4684FB3000E6DC59BB77E.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7d8b4d21-09ca-4f4f-fec5-08d8489f0611
x-ms-traffictypediagnostic: AM0PR08MB3748:|VE1PR08MB4654:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB46543FD7ECCDB256AFA4D1C79E570@VE1PR08MB4654.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: L5gFADtRdsrjYdozgcIT+uRIXf8G+YIF3tXyA1fEO+fDZ0sdmxnVzl4DgqxTT17FGsYRvNtyrrTyOu/zZy1jbMBwlc32dHttOSnIwUA2j6h5yvDriICss6XbOfX8+t3bE+TmpAhlgxG0zqAcKHMezZw305YB3/ZrtE9EZqsWz5bUabeSDXy2xtez6kfftl31JxMmXL5CB+aVgWQvEvVhTlC+MDZ28EmH9ZiGtOmMFR3TMeAZbMD4lHN83HJ23efP2x9go9MnKtPHAgwUBUDQ0hFM8ZFoCRaa/reaYQTDCiIfrc+o65kL6b0AH+jOj7VzPYfYX7bdteXs49frHWATxg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3747.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(8936002)(53546011)(478600001)(8676002)(83380400001)(71200400001)(86362001)(110136005)(316002)(54906003)(2906002)(6506007)(9686003)(5660300002)(55016002)(186003)(52536014)(66446008)(64756008)(66476007)(26005)(76116006)(66946007)(33656002)(66556008)(7696005)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: lL3tMuh4UcE4JvuEjFg119NDYW7g+p4kwWjXwij37FSULaxcigzwM2jtuOZ50ij1DW0HMhnZObmugBF3ogkz20jm0+85Klau4F2iexnieVmzHdD7Jyq0D2idP+JvZXsce78YXWfFL9eXRM7kg/Yyu8Dv1WJzgqkV/lqM4soa01to2gj7BAic6CLx0mxe/W8LIT26ShTTToYVGxd40BZgR/XPiRlMNnhz1NkBCBM7amLWTiy41l8EeL3UnAXOgWN3CWCTIDk0Y/y5SFSpz3g3KI4Rohe47IWyfZ13Px0IdiyPsndZvEBZbPv2PR0X82i29+3kL9oV4F1qZPAW6+y5yemWOz+AZBbuxlKTDKFkeq/MFYZ918VFIPTehPjh+UjzlW5FIIUvluQqYr0++mot/bOJYdpUYVrAmATw7gBPKXBzJrjl1dlzxiGcr0SCo4jGZMz3Dyc+oMg4JA3WIUTZMDYqzGt/9SQ89f6/otKPsMF2VNLwpPHJ5hWYmrLepWeZEM4yBjABwNw0AkDVHQSiQaTUcXYKanWRIFsr8XDEi1GFKZx0aHZTAiGcVp/W5KriNLdIl31m8bD58koMdSAASfZDIllI+vifpZav2n+M+YsMcz1O/Pb1XzF+rF4ZMgQ6YbvR+8fExbCfIxmALzGibQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3748
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3a210864-fa54-4ae9-9ff5-08d8489f01d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8bxcJkTm63yIRZSmGZ1oH+c0otGJBT1MybiSY96P1LCdSQICn94WuUZPJKdYfDXzEPpUQPQTkzUwhXy/Rhd1JDnRr5wflMdam+gSACAt7sww2lpC1IMW0Fe6A5Ws23GM2ALWplaap8cm9Vch079mHVtmR3ujHcFfRnMuWUzWxckBUnqGADmBgKMFPqkALP3NI7/c5WChAnwbbeD+DrQzBcU6y3dnvRltmqgEzPV7upQukJ74UQIekBmx7TnTdOySt/tcUCI5b+h5TqdNhtHzGLlWAURXFsf5V1iRRT56WKtiIZeqDIJitac67V0gotdKq1qNBJ7fYKYYtN7LXhkJVCYnjIpg28wBkUgE2zzpvi4MgTygFbYfDxwR8LO1mD1YbMukOhM4RRC7d7tVtirFg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966005)(83380400001)(53546011)(55016002)(8936002)(70586007)(478600001)(70206006)(33656002)(7696005)(8676002)(4326008)(356005)(6506007)(52536014)(336012)(54906003)(81166007)(110136005)(186003)(47076004)(9686003)(26005)(86362001)(36906005)(2906002)(82740400003)(316002)(5660300002)(82310400002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 02:31:51.0538 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8b4d21-09ca-4f4f-fec5-08d8489f0611
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4654
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

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogMjAyMOW5tDjmnIgyNOaXpSAyMToxNQ0KPiBUbzog
V2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gQ2M6IEFuZHJlIFByenl3YXJhIDxBbmRy
ZS5Qcnp5d2FyYUBhcm0uY29tPjsgQmVydHJhbmQgTWFycXVpcw0KPiA8QmVydHJhbmQuTWFycXVp
c0Bhcm0uY29tPjsgUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+Ow0KPiBLYWx5IFhp
biA8S2FseS5YaW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDEvMl0geGVuL2FybTogTWlzc2luZyBOMS9BNzYvQTc1IEZQIHJlZ2lzdGVycyBpbg0K
PiB2Q1BVIGNvbnRleHQgc3dpdGNoDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDI0LzA4LzIwMjAgMDQ6
MjgsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IFhlbiBoYXMgY3B1X2hhc19mcC9jcHVfaGFzX3NpbWQg
dG8gZGV0ZWN0IHdoZXRoZXIgdGhlIENQVSBzdXBwb3J0cw0KPiA+IEZQL1NJTUQgb3Igbm90LiBC
dXQgY3VycmVudGx5LCB0aGVzZSB0d28gTUFDUk9zIG9ubHkgY29uc2lkZXIgdmFsdWUgMA0KPiA+
IG9mIElEX0FBNjRQRlIwX0VMMS5GUC9TSU1EIGFzIEZQL1NJTUQgZmVhdHVyZXMgZW5hYmxlZC4g
QnV0IGZvciBDUFVzDQo+ID4gdGhhdCBzdXBwb3J0IEZQL1NJTUQgYW5kIGhhbGYtcHJlY2lzaW9u
IGZsb2F0aW5nLXBvaW50IGFyaXRobWV0aWMsIHRoZQ0KPiA+IElEX0FBNjRQRlIwX0VMMS5GUC9T
SU1EIGFyZSAxIChzZWUgQXJtIEFSTSBEREkwNDg3Ri5iLCBEMTMuMi42NCkuDQo+ID4gRm9yIHRo
ZXNlIENQVXMsIHhlbiB3aWxsIHRyZWF0IHRoZW0gYXMgbm8gRlAvU0lNRCBzdXBwb3J0aSwgdGhl
DQo+IA0KPiBzL3N1cHBvcnRpL3N1cHBvcnQvDQoNCkkgd2lsbCBmaXggdGhpcyB0eXBvIGluIG5l
eHQgdmVyc2lvbi4NCg0KPiANCj4gPiB2ZnBfc2F2ZS9yZXN0b3JlX3N0YXRlIHdpbGwgbm90IHRh
a2UgZWZmZWN0Lg0KPiA+DQo+ID4gIEZyb20gdGhlIFRSTSBkb2N1bWVudHMgb2YgQ29ydGV4LUE3
NS9BNzYvTjEsIHdlIGtub3cgdGhlc2UgQ1BVcw0KPiBzdXBwb3J0DQo+ID4gYmFzaWMgQWR2YW5j
ZWQgU0lNRC9GUCBhbmQgaGFsZi1wcmVjaXNpb24gZmxvYXRpbmctcG9pbnQgYXJpdGhtZXRpYy4g
SW4NCj4gPiB0aGlzIGNhc2UsIG9uIE4xL0E3Ni9BNzUgcGxhdGZvcm1zLCBYZW4gd2lsbCBhbHdh
eXMgbWlzcyB0aGUgZmxvYXRpbmcNCj4gPiBwb2ludGVyIHJlZ2lzdGVycyBzYXZlL3Jlc3RvcmUu
IElmIGRpZmZlcmVudCB2Q1BVcyBhcmUgcnVubmluZyBvbiB0aGUNCj4gPiBzYW1lIHBDUFUsIHRo
ZSBmbG9hdGluZyBwb2ludGVyIHJlZ2lzdGVycyB3aWxsIGJlIGNvcnJ1cHRlZCByYW5kb21seS4N
Cj4gPg0KPiA+IFRoaXMgcGF0Y2ggZml4ZXMgWGVuIG9uIHRoZXNlIG5ldyBjb3Jlcy4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+IFJldmll
d2VkLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+IA0K
PiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+IENo
ZWVycywNCj4gDQo+ID4gLS0tDQo+ID4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1cmUu
aCB8IDQgKystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZl
YXR1cmUuaCBiL3hlbi9pbmNsdWRlL2FzbS0NCj4gYXJtL2NwdWZlYXR1cmUuaA0KPiA+IGluZGV4
IDY3NGJlYjAzNTMuLjEwODc4ZWFkOGEgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LWFybS9jcHVmZWF0dXJlLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1
cmUuaA0KPiA+IEBAIC0xMyw4ICsxMyw4IEBADQo+ID4gICAjZGVmaW5lIGNwdV9oYXNfZWwyXzY0
ICAgIChib290X2NwdV9mZWF0dXJlNjQoZWwyKSA+PSAxKQ0KPiA+ICAgI2RlZmluZSBjcHVfaGFz
X2VsM18zMiAgICAoYm9vdF9jcHVfZmVhdHVyZTY0KGVsMykgPT0gMikNCj4gPiAgICNkZWZpbmUg
Y3B1X2hhc19lbDNfNjQgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChlbDMpID49IDEpDQo+ID4gLSNk
ZWZpbmUgY3B1X2hhc19mcCAgICAgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChmcCkgPT0gMCkNCj4g
PiAtI2RlZmluZSBjcHVfaGFzX3NpbWQgICAgICAoYm9vdF9jcHVfZmVhdHVyZTY0KHNpbWQpID09
IDApDQo+ID4gKyNkZWZpbmUgY3B1X2hhc19mcCAgICAgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChm
cCkgPCA4KQ0KPiA+ICsjZGVmaW5lIGNwdV9oYXNfc2ltZCAgICAgIChib290X2NwdV9mZWF0dXJl
NjQoc2ltZCkgPCA4KQ0KPiA+ICAgI2RlZmluZSBjcHVfaGFzX2dpY3YzICAgICAoYm9vdF9jcHVf
ZmVhdHVyZTY0KGdpYykgPT0gMSkNCj4gPiAgICNlbmRpZg0KPiA+DQo+ID4NCj4gDQo+IC0tDQo+
IEp1bGllbiBHcmFsbA0K

