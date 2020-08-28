Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB3F2552FA
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 04:23:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBU2v-0000cq-SD; Fri, 28 Aug 2020 02:23:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UB2A=CG=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kBU2t-0000cg-IJ
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 02:23:15 +0000
X-Inumbo-ID: 0d8e00c8-02fd-4c65-bc6a-74aadf3763d0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d8e00c8-02fd-4c65-bc6a-74aadf3763d0;
 Fri, 28 Aug 2020 02:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHY11X+McKjclwL7xpBDKj0mX4zJvMmhANGizpRbA3A=;
 b=oKk8j9nqbjFbiaC1fQFOWRVDA+mATk/V/O5+oMPyOkNHtA/ta+h/vzZJptDKlLRwvawMBuYELhBEnQIwbquQuGgwdCSlCU9md/H7OT3w9/ngY1wxYyLgulPvinjkWXr+xpEK+8v+3Uu2z+nk6vs0chYBHDqtYQpS4BEoc9jaNg8=
Received: from AM5PR0602CA0004.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::14) by DB7PR08MB3467.eurprd08.prod.outlook.com
 (2603:10a6:10:48::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 28 Aug
 2020 02:23:11 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::b4) by AM5PR0602CA0004.outlook.office365.com
 (2603:10a6:203:a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Fri, 28 Aug 2020 02:23:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 02:23:10 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Fri, 28 Aug 2020 02:23:10 +0000
X-CR-MTA-TID: 64aa7808
Received: from 8f73f9546ca7.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1736C14F-8E45-404A-9633-E78F7E9439D7.1; 
 Fri, 28 Aug 2020 02:23:05 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f73f9546ca7.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Aug 2020 02:23:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYrfrH+8FTY2R2Q3e8mcmehmTZ8WwQjfjts83RCfbU4SpFAP1fQ6fscJIa7roBKoPldEj2XHQZb46ubYrihOHHSljWIYuv0EjmRKf5jynRq2gJ7rS3fUpfMeGI8L8aIGXySyERSdUXkW0kzoHjb+RK+fxOdE4IvpKbDYCvEMA1CEMHl7eqaWU23ZezoR/2GOi0cFpLxyVdTPgg5fQMxz1Hn257L3CykTQiktdUmdB15MxqHUrShdZqu38VQRuNAzdRLbI+/3nVTgv4ezgaWixz2BCAnAuriRfuZf2v0fB1D4MmWnnG/fRBMboBtQRWvoLZVSYqiMV80+rpT/PSIkqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHY11X+McKjclwL7xpBDKj0mX4zJvMmhANGizpRbA3A=;
 b=oXtx5SkqEvvNnmcYdkV+cmL5E24ENYJtD2U4HYR0SZ5f0JenFD0S4+gCFwPifn4c7KFvOWPn6PYD+MtJEqI95HP4cQ95tVelwBZ8uk9983rJDncjVYl8B3V6KV3pZbR3/P1QL0wnzMUyVKPK+NlomuF3VIvnsp/VbF2m/B9Ruuco1jnX81L67pVriEPal90cH4zDMYd8thsF3F2tvzyXY2Tj07HCrjEhU+9HU/t98xMFrGKwrnuuNckLjX1c0TGVHZQuMFyhEW91L4YoQBhSmyuDMYv++ZvgS1ihqPwhg2U3/OA0pBifcHjw1faZF+bfxetuTdP/WKYcV2hKc/ZFCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHY11X+McKjclwL7xpBDKj0mX4zJvMmhANGizpRbA3A=;
 b=oKk8j9nqbjFbiaC1fQFOWRVDA+mATk/V/O5+oMPyOkNHtA/ta+h/vzZJptDKlLRwvawMBuYELhBEnQIwbquQuGgwdCSlCU9md/H7OT3w9/ngY1wxYyLgulPvinjkWXr+xpEK+8v+3Uu2z+nk6vs0chYBHDqtYQpS4BEoc9jaNg8=
Received: from DB7PR08MB3753.eurprd08.prod.outlook.com (2603:10a6:10:7e::15)
 by DB6PR0802MB2549.eurprd08.prod.outlook.com (2603:10a6:4:a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 28 Aug
 2020 02:23:03 +0000
Received: from DB7PR08MB3753.eurprd08.prod.outlook.com
 ([fe80::e5fa:93c4:7937:922]) by DB7PR08MB3753.eurprd08.prod.outlook.com
 ([fe80::e5fa:93c4:7937:922%3]) with mapi id 15.20.3326.021; Fri, 28 Aug 2020
 02:23:03 +0000
From: Wei Chen <Wei.Chen@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Andre Przywara
 <Andre.Przywara@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Kaly Xin
 <Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH v4 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Topic: [PATCH v4 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Index: AQHWevncVy3USlwzOkCvBWb/o+u4mKlMAkyAgADLtfA=
Date: Fri, 28 Aug 2020 02:23:03 +0000
Message-ID: <DB7PR08MB3753B8AF2762BBD99C40511C9E520@DB7PR08MB3753.eurprd08.prod.outlook.com>
References: <20200825160603.32388-1-wei.chen@arm.com>
 <20200825160603.32388-3-wei.chen@arm.com>
 <8B738286-083C-42D3-B4FA-7E9FB8915499@arm.com>
In-Reply-To: <8B738286-083C-42D3-B4FA-7E9FB8915499@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: F8342A3A174D444BA67DA556C2A3E8AD.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.113]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1f2b739a-3095-4153-b8c8-08d84af94f13
x-ms-traffictypediagnostic: DB6PR0802MB2549:|DB7PR08MB3467:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3467FAA2E5DA2997A83FE9239E520@DB7PR08MB3467.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Z8IWySu3d85hsyRtlsCKtHrgE0JlUQvYFIYMgfQnKZfXM0XizMNfQ/PVbqUgfOraYOV77pfLFtu3e8OGt4PeqXS7P6dZmR0rm16/7JihQ2QXFcRlkxWk6iYxNG4aqicHFrAlkHNaUjlM5A7ZhipaCLKbFYtb2ToFr49YcHhW4qGxmst71wjJLNXEuGtZQW4FZOHXbeHzj7UpZgEO9K9dx3MLLhgaBTVMOOtcRW9gIXgImvjcGhjSQC79sMg7EqG9f01bLbyO8dTSiCOwJw+IFtsHxnr8zazKF9PrS7BvYyYWMsjFvFkuELd5wXvZ/7KF5tz4ozDPAM+7xajOdC0mBQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3753.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(9686003)(7696005)(71200400001)(83380400001)(15650500001)(8936002)(6506007)(186003)(53546011)(4326008)(6636002)(54906003)(52536014)(6862004)(55016002)(8676002)(33656002)(316002)(5660300002)(478600001)(76116006)(66446008)(86362001)(64756008)(2906002)(66946007)(66476007)(26005)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: u2wLM4ojyZDDNxdjnNN59ay5H1mg0PsexNgCkmDT9iL9fOgUcJ/o+XNaLEwFXaulTg+2Ue4X3dfy9CILlpkzyQ+ICYborVdc3C8LmiHkf7wqJ6N5aymhub7zs+5hbvwbkNDmpbM/kkP8H3YXTVXX+Lc7i3h7S9xjp1aX0S/1/d2Bxm60m7tawSitz4U6iIwF2TxDjq6x/nvSBoLJPjPlwN7AgcbEJGoUVACQrPZwmkjwQVgK5QWgRMATUMbns3VcM5D5tPeyF7f44AT+QzCjhD860lVEY0DrvG8i0UYHwwpunwyDEiJMu8oKYPD+/pYdLQ80j9solcYDVO7wQNahtXdFoy9HoqJL0pGOK1atHBv4L8pFkSyWVwROTbOPySfJL2DSNx83YL8Vju2ksviHAy2lmFg7Z3YjzAAR723N0pHCRaIKEkxW29BkZOjEJ+YieRWxA9mBqW0WxrudAJRfTcIqJwCJKALp4IkGFhXEgSf8fztxuluLcuuiH2wjinYa/GBp/9NneuxqEoyKPSX5yClTIXzsQHY7yIoEMWd2LRwvHQr2TcS2ZetXp5FlOz3VC/HwQVDTMfEibI9vDtsqS5rxbPRHbCERRNrjrfv7FGxRC8fnaBDl2NwAVLAXrTCdInijEhgxS7y97WidclbtPg==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2549
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c6b9b127-bf62-491f-7b71-08d84af94ab9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sO4gEhOL+oJ8YyAX7KJ0lOUQvQdpLLg05SK8W0gWuxWFIRO7qSzG8vzjYlX9dt4uMAVRlJccFAqTOZh+D/Bk3P8RBMcdEf4gmj5po6IpULpcBCI8Mlmo0PdGVX/xWG7lH+GAaKVdyyTA6pljbgZt2ZvuZW6VRDQkh1Mn7+R7hAB3BJtDqYtN7WRVOM1MMFd91sFoCXWjcAvy/gRGQ+smvxWmwG6+QBlciuyU7y54E7Jh4p2W18L9V55WTsDt4fvVgsCV1sT/y9eBBL5TgdCuJU1z+5kpCpec4/8CP8QnPwCL7bF8YynAIZhN/9LwyOEEmkRBHJiNKcPIKcbGtTkoM6H21FQ8ZOOuudkZtpFcZYvAUejAI4IYGnN7V9N7vnkJbyFoI7Bzqdlu61BhAunhGw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(26005)(82740400003)(316002)(8676002)(9686003)(36906005)(5660300002)(186003)(6506007)(6862004)(55016002)(70586007)(70206006)(2906002)(6636002)(54906003)(86362001)(4326008)(53546011)(33656002)(8936002)(47076004)(478600001)(356005)(81166007)(336012)(83380400001)(52536014)(7696005)(15650500001)(82310400002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 02:23:10.5717 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2b739a-3095-4153-b8c8-08d84af94f13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3467
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

SGkgQmVydGFuZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFNlbnQ6IDIwMjDE6jjU
wjI3yNUgMjI6MTMNCj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogWGVu
LWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBzc3RhYmVsbGluaUBrZXJu
ZWwub3JnOw0KPiBqdWxpZW5AeGVuLm9yZzsgQW5kcmUgUHJ6eXdhcmEgPEFuZHJlLlByenl3YXJh
QGFybS5jb20+OyBQZW5ueSBaaGVuZw0KPiA8UGVubnkuWmhlbmdAYXJtLmNvbT47IEthbHkgWGlu
IDxLYWx5LlhpbkBhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjQgMi8yXSB4ZW4vYXJtOiBUaHJvdyBtZXNzYWdlcyBmb3IgdW5rbm93bg0KPiBGUC9TSU1E
IGltcGxlbWVudCBJRA0KPiANCj4gDQo+IA0KPiA+IE9uIDI1IEF1ZyAyMDIwLCBhdCAxNzowNiwg
V2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gQXJtIElEX0FBNjRQ
RlIwX0VMMSByZWdpc3RlciBwcm92aWRlcyB0d28gZmllbGRzIHRvIGRlc2NyaWJlIENQVQ0KPiA+
IEZQL1NJTUQgaW1wbGVtZW50YXRpb25zLiBDdXJyZW50bHksIHdlIGV4YWN0bHkga25vdyB0aGUg
bWVhbmluZyBvZg0KPiA+IDB4MCwgMHgxIGFuZCAweGYgb2YgdGhlc2UgZmllbGRzLiBYZW4gdHJl
YXRzIHZhbHVlIDwgOCBhcyBGUC9TSU1EDQo+ID4gZmVhdHVyZXMgcHJlc2VudGVkLiBJZiB0aGVy
ZSBpcyBhIHZhbHVlIDB4MiBidW1wZWQgaW4gdGhlIGZ1dHVyZSwNCj4gPiBYZW4gYmVoYXZpb3Jz
IGZvciB2YWx1ZSA8PSAweDEgY2FuIGFsc28gdGFrZSBlZmZlY3QuIEJ1dCB3aGF0IFhlbg0KPiA+
IGRvbmUgZm9yIHZhbHVlIDw9IDB4MSBtYXkgbm90IGFsd2F5cyBjb3ZlciBuZXcgdmFsdWUgMHgy
IHJlcXVpcmVkLg0KPiA+IFdlIHRocm93IHRoZXNlIG1lc3NhZ2VzIHRvIGJyZWFrIHRoZSBzaWxl
bmNlIHdoZW4gWGVuIGRldGVjdGVkDQo+ID4gdW5rbm93biBGUC9TSU1EIElEcyB0byBub3RpY2Ug
dXNlciB0byBjaGVjay4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hl
bkBhcm0uY29tPg0KPiANCj4gV2l0aCB0aGUgc21hbGwgdHlwbyBhZnRlciBmaXhlZDoNCj4gUmV2
aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4g
DQo+ID4gLS0tDQo+ID4geGVuL2FyY2gvYXJtL3NldHVwLmMgfCAxMiArKysrKysrKysrKysNCj4g
PiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4gPiBpbmRleCA3
OTY4Y2VlNDdkLi42YTMxZWNhOTg0IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1
cC5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4gPiBAQCAtMTMzLDYgKzEzMywx
OCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJvY2Vzc29yX2lkKHZvaWQpDQo+ID4gICAgICAgICAg
ICBjcHVfaGFzX3NpbWQgPyAiIEFkdmFuY2VkU0lNRCIgOiAiIiwNCj4gPiAgICAgICAgICAgIGNw
dV9oYXNfZ2ljdjMgPyAiIEdJQ3YzLVN5c1JlZyIgOiAiIik7DQo+ID4NCj4gPiArICAgIC8qIFdh
cm4gdXNlciBpZiB3ZSBmaW5kIHVua25vd24gZmxvYXRpbmctcG9pbnQgZmVhdHVyZXMgKi8NCj4g
PiArICAgIGlmICggY3B1X2hhc19mcCAmJiAoYm9vdF9jcHVfZmVhdHVyZTY0KGZwKSA+PSAyKSAp
DQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJXQVJOSU5HOiBVbmtub3duIEZs
b2F0aW5nLXBvaW50DQo+IElEOiVkLCAiDQo+ID4gKyAgICAgICAgICAgICAgICJ0aGlzIG1heSBy
ZXN1bHQgdG8gY29ycnVwdGlvbiBvbiB0aGUgcGxhdGZvcm1cbiIsDQo+IA0KPiBzL3RvL2luLw0K
PiANCj4gPiArICAgICAgICAgICAgICAgYm9vdF9jcHVfZmVhdHVyZTY0KGZwKSk7DQo+ID4gKw0K
PiA+ICsgICAgLyogV2FybiB1c2VyIGlmIHdlIGZpbmQgdW5rbm93biBBZHZhbmNlZFNJTUQgZmVh
dHVyZXMgKi8NCj4gPiArICAgIGlmICggY3B1X2hhc19zaW1kICYmIChib290X2NwdV9mZWF0dXJl
NjQoc2ltZCkgPj0gMikgKQ0KPiA+ICsgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiV0FS
TklORzogVW5rbm93biBBZHZhbmNlZFNJTUQNCj4gSUQ6JWQsICINCj4gPiArICAgICAgICAgICAg
ICAgInRoaXMgbWF5IHJlc3VsdCB0byBjb3JydXB0aW9uIG9uIHRoZSBwbGF0Zm9ybVxuIiwNCj4g
DQo+IHNhbWUgYXMgdXBwZXINCg0KSSB3b3VsZCBmaXggYWJvdmUgdHdvIHR5cG9zIGFuZCBzZW5k
IGEgbmV3IHZlcnNpb24uDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgIGJvb3RfY3B1X2ZlYXR1
cmU2NChzaW1kKSk7DQo+ID4gKw0KPiA+ICAgICBwcmludGsoIiAgRGVidWcgRmVhdHVyZXM6ICUw
MTYiUFJJeDY0IiAlMDE2IlBSSXg2NCJcbiIsDQo+ID4gICAgICAgICAgICBib290X2NwdV9kYXRh
LmRiZzY0LmJpdHNbMF0sIGJvb3RfY3B1X2RhdGEuZGJnNjQuYml0c1sxXSk7DQo+ID4gICAgIHBy
aW50aygiICBBdXhpbGlhcnkgRmVhdHVyZXM6ICUwMTYiUFJJeDY0IiAlMDE2IlBSSXg2NCJcbiIs
DQo+ID4gLS0NCj4gPiAyLjE3LjENCj4gPg0KPiANCj4gDQoNCg==

