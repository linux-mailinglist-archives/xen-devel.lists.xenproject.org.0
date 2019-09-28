Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C983C107B
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 11:40:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iE99n-000177-51; Sat, 28 Sep 2019 09:36:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2MMb=XX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iE99l-000172-Lt
 for xen-devel@lists.xenproject.org; Sat, 28 Sep 2019 09:36:49 +0000
X-Inumbo-ID: 7d56660c-e1d3-11e9-9691-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.45]) by localhost (Halon) with ESMTPS
 id 7d56660c-e1d3-11e9-9691-12813bfff9fa;
 Sat, 28 Sep 2019 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IAlHnQnBA0CyogNOFMssdKi4VjYKqfQ+2C/diwhYRc=;
 b=lR+nVMWcAE8wT2k3KXiaD37r8cbIJRTYTdyeYlfjw4o8pYW5MOWYY/WYQsCbiD721TZ2Isa2futYLsqLD8I6UyMPSwdqxgDLRPX658VdYiUoKzI1vE/0pQY6kFZ8CYbu230ELq8OrNDTf5qK8Li7bOpCmJk0GpvNeyPO9GfCmCg=
Received: from VE1PR08CA0002.eurprd08.prod.outlook.com (2603:10a6:803:104::15)
 by DBBPR08MB4281.eurprd08.prod.outlook.com (2603:10a6:10:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Sat, 28 Sep
 2019 09:36:44 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VE1PR08CA0002.outlook.office365.com
 (2603:10a6:803:104::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Sat, 28 Sep 2019 09:36:44 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Sat, 28 Sep 2019 09:36:42 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Sat, 28 Sep 2019 09:36:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29e004f952d1566c
X-CR-MTA-TID: 64aa7808
Received: from f45d3aed286d.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9575D079-744A-4C66-B70F-4E2EE0BC627D.1; 
 Sat, 28 Sep 2019 09:36:37 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f45d3aed286d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Sat, 28 Sep 2019 09:36:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+2LkJyKxixUQ9nqbvzKI3vtFfwOG+HAZqg/71lgQm8SfcVQO1dWDEqG7E1SR32dxlf/e3/O5tNJo8s4ZIipruASOV/Iuaupxpm/fLJxlHQNJd1TxnOP1zpGm4ECShhabVYekZMJwk0xye7dbn2t4nf5UyQZQNR9S0dYK7wRazGCkWwNyAjroCfWb2CEMMH+ZBv2JH40UpS3igKJmYOui28pqqCnzjxcQ3agHi+uYC6EhUynkoGtjUcmWaDg/R+8xaOcV/W4skZBtyovGzN3zeY+l5UN8xNHUSQrZ1kiSiF+g9yiowmwprIiK73Svora7A0kGUbXpWwW+CnXzTl6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IAlHnQnBA0CyogNOFMssdKi4VjYKqfQ+2C/diwhYRc=;
 b=R4BgZamgOTkjpqqlY7UoduzXZPTyLVID6EkuAVrq+D+Avm4vbwoluf/B8T3WDnmtElq5oz6cWwC3YgqRA3wI3UZXBN/h6hecp08bEZaGw60JUD3OuPVl48EQIsTqb1oUkM3gu5481eIHafcRZMy8UCj6ePuhLHsCj4I3EPSZoDpsUogQRklgCSXgiucO1IA86yDGASqsSFB+K8oHI2/YmcuiWzv4yXVfoPJNJPJR1g/QPr7925lLEBzt2cXirucYkkLEGpvmJCLwRE6sa/zgdo44pKOEXCHEi16oNq2j5TF9czRaEpAEwvD2YRimiUhR2IHB8MHBcSQZUgbHhhslJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IAlHnQnBA0CyogNOFMssdKi4VjYKqfQ+2C/diwhYRc=;
 b=lR+nVMWcAE8wT2k3KXiaD37r8cbIJRTYTdyeYlfjw4o8pYW5MOWYY/WYQsCbiD721TZ2Isa2futYLsqLD8I6UyMPSwdqxgDLRPX658VdYiUoKzI1vE/0pQY6kFZ8CYbu230ELq8OrNDTf5qK8Li7bOpCmJk0GpvNeyPO9GfCmCg=
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com (10.175.20.10) by
 VI1PR0802MB2512.eurprd08.prod.outlook.com (10.175.20.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Sat, 28 Sep 2019 09:36:35 +0000
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d]) by VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d%12]) with mapi id 15.20.2284.023; Sat, 28 Sep
 2019 09:36:35 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Thread-Topic: [PATCH V6 0/8] iommu/arm: Add Renesas IPMMU-VMSA support +
 Linux's iommu_fwspec
Thread-Index: AQHVdH1QQzp9/m2u20aSEUYzfut6JKdAIugAgAARc4CAAKMWAA==
Date: Sat, 28 Sep 2019 09:36:35 +0000
Message-ID: <96bea916-74a0-fa8e-582c-a702d43483c2@arm.com>
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
 <6c7d9f90-227a-c20a-090a-560a0805eb6b@arm.com>
 <71f1a62c-551c-97e1-2e1a-94339ab6e7d9@gmail.com>
 <alpine.DEB.2.21.1909271544030.2594@sstabellini-ThinkPad-T480s>
 <CAPD2p-mO7msJexqbmnmGX7z5SmN00KKQCN7pVZc-+H6OjLcUqw@mail.gmail.com>
In-Reply-To: <CAPD2p-mO7msJexqbmnmGX7z5SmN00KKQCN7pVZc-+H6OjLcUqw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0195.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::15) To VI1PR0802MB2431.eurprd08.prod.outlook.com
 (2603:10a6:800:af::10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c05b1111-5b86-48d2-74df-08d743f75f2c
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2512:|DBBPR08MB4281:
X-Microsoft-Antispam-PRVS: <DBBPR08MB4281FA843F588951A248B15A80800@DBBPR08MB4281.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0174BD4BDA
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(189003)(199004)(52116002)(256004)(4326008)(14444005)(66066001)(71190400001)(86362001)(71200400001)(316002)(64756008)(2906002)(31686004)(66476007)(110136005)(305945005)(31696002)(486006)(54906003)(66946007)(3846002)(44832011)(14454004)(66556008)(6116002)(66446008)(7736002)(476003)(6506007)(6246003)(6512007)(6436002)(81156014)(81166006)(36756003)(478600001)(446003)(386003)(53546011)(11346002)(8676002)(102836004)(26005)(5660300002)(229853002)(6486002)(25786009)(76176011)(186003)(99286004)(8936002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2512;
 H:VI1PR0802MB2431.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 3kUDj3g8KGuhzBcAWwchyIvbzVaRAR9kXnoK0I1XxQsr60ZcLPYef79BEzc0/gTaCRFnZX1YLy86ArJ7oyqFANxoGI3oH/KIUvjLRwYzVxZ9M0iL/jRn85uFiJJryWbTQmF5WM9IqJuBXj8pmMlJ7TbrZjG3w44m9G+r09JnQxA77kCMoFpgwjaB6OHb0PZxBff6Lr5+6NejusXMdqQo7lz01yoZDkEf0K2CcwrxNK88RZZ5pNYFTFFcFNgWMXY+c+N/E7bV+6qMaYefjuI5PvJo03jDN1yR6EhxE0i4x3HV/MIkXKqOy7MMCLV/VjkV2xDJW9vWnY5NKNKlKCK6kNvBxR2ef+mFbJu7A887oKNN+JRd68PETryeozAmmcAgyVFlwO/rD4RmcYDOje11WprYg2IRQGlasMGlT1e+ej8=
x-ms-exchange-transport-forked: True
Content-ID: <7E4676C0997B7A41940F71337E0113A0@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2512
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(376002)(136003)(189003)(199004)(26826003)(486006)(36756003)(107886003)(31686004)(31696002)(50466002)(478600001)(70586007)(446003)(305945005)(6486002)(2616005)(476003)(126002)(63350400001)(11346002)(86362001)(2486003)(6506007)(102836004)(186003)(6246003)(22756006)(53546011)(356004)(14444005)(6116002)(386003)(70206006)(229853002)(99286004)(54906003)(316002)(26005)(7736002)(336012)(76176011)(8676002)(36906005)(6512007)(81156014)(3846002)(76130400001)(25786009)(2906002)(81166006)(66066001)(23676004)(5660300002)(14454004)(47776003)(110136005)(4326008)(8936002)(436003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4281;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b8f6dd86-cbc2-45e9-d9e5-08d743f75a6a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DBBPR08MB4281; 
NoDisclaimer: True
X-Forefront-PRVS: 0174BD4BDA
X-Microsoft-Antispam-Message-Info: iQw+DEJX5shRxxX1tzJmCPBGrwfKU9ZgTPO4bx4csUqQ9Xuj/XxvKKl0/jUqMwChGnUhpZxfUos4Dk1yXwNblR9xoPUgHcwdLmpTeuGz4EJOgceRcwP/Qt+xn8fZz085SmX6c9hg6F+cDK34z9h1MJSPnfEN2LDwXGB6pVrTc0XbcmT+4K6W5bdXGsBAQBYWUCo/LbgWRkQ1n7vmTjdltZiUk8qo7C6+mxODe13JjyyPyB+tdP4K9nFaXQfVq0f+HHVUysVKFrkC8ypZgHSi0Dc1m48WalAHGbV4us9k2Zzsg/ecBN8rTuOYTmlVHl+AgSzTw3TfjHyds/5g/7bVHLZfJmpAALLMs5EWm0yQu/loJr9yPlx+UxkdUuoJd+/TsFT+K9cU1kR1TA7yijY15NYSUBYS31L91Bo3lv36KKQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2019 09:36:42.8216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c05b1111-5b86-48d2-74df-08d743f75f2c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4281
Subject: Re: [Xen-devel] [PATCH V6 0/8] iommu/arm: Add Renesas IPMMU-VMSA
 support + Linux's iommu_fwspec
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, nd <nd@arm.com>,
 "volodymyr_babchuk@epam.com" <volodymyr_babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI4LzA5LzIwMTkgMDA6NTIsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPiDR
gdCxLCAyOCDRgdC10L3Rgi4gMjAxOSDQsy4sIDAxOjUwIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZyANCj4gPG1haWx0bzpzc3RhYmVsbGluaUBrZXJuZWwub3JnPj46
DQo+IA0KPiAgICAgT24gVGh1LCAyNiBTZXAgMjAxOSwgT2xla3NhbmRyIHdyb3RlOg0KPiAgICAg
ID4gT24gMjYuMDkuMTkgMTc6NTYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gICAgICA+ID4gSGks
DQo+ICAgICAgPg0KPiAgICAgID4gSGkgSnVsaWVuDQo+ICAgICAgPg0KPiAgICAgID4NCj4gICAg
ICA+ID4NCj4gICAgICA+ID4gT24gOS8yNi8xOSAxMjoyMCBQTSwgT2xla3NhbmRyIFR5c2hjaGVu
a28gd3JvdGU6DQo+ICAgICAgPiA+ID4gT2xla3NhbmRyIFR5c2hjaGVua28gKDgpOg0KPiAgICAg
ID4gPiA+IMKgwqAgaW9tbXUvYXJtOiBBZGQgaW9tbXVfaGVscGVycy5jIGZpbGUgdG8ga2VlcCBj
b21tb24gZm9yDQo+ICAgICBJT01NVXMgc3R1ZmYNCj4gICAgICA+ID4gPiDCoMKgIGlvbW11L2Fy
bTogQWRkIGFiaWxpdHkgdG8gaGFuZGxlIGRlZmVycmVkIHByb2JpbmcgcmVxdWVzdA0KPiAgICAg
ID4gPiA+IMKgwqAgeGVuL2NvbW1vbjogSW50cm9kdWNlIF94cmVhbGxvYyBmdW5jdGlvbg0KPiAg
ICAgID4gPiA+IMKgwqAgeGVuL2NvbW1vbjogSW50cm9kdWNlIHhyZWFsbG9jX2ZsZXhfc3RydWN0
KCkgaGVscGVyIG1hY3Jvcw0KPiAgICAgID4gPiA+IMKgwqAgaW9tbXUvYXJtOiBBZGQgbGlnaHR3
ZWlnaHQgaW9tbXVfZndzcGVjIHN1cHBvcnQNCj4gICAgICA+ID4gPiDCoMKgIGlvbW11OiBPcmRl
ciB0aGUgaGVhZGVycyBhbHBoYWJldGljYWxseSBpbiBkZXZpY2VfdHJlZS5jDQo+ICAgICAgPiA+
ID4gwqDCoCBpb21tdS9hcm06IEludHJvZHVjZSBpb21tdV9hZGRfZHRfZGV2aWNlIEFQSQ0KPiAg
ICAgID4gPiA+IMKgwqAgaW9tbXUvYXJtOiBBZGQgUmVuZXNhcyBJUE1NVS1WTVNBIHN1cHBvcnQN
Cj4gICAgICA+ID4NCj4gICAgICA+ID4gVGhpcyBzZXJpZXMgaXMgbm93IG1lcmdlZC4NCj4gICAg
ICA+DQo+ICAgICAgPiBUaGFuayB5b3UhDQo+IA0KPiAgICAgSSBqdXN0IHdhbnRlZCB0byBwcm92
aWRlIGVhcmx5IGZlZWRiYWNrIHRoYXQgdGhpcyBzZXJpZXMgY2F1c2VzIHByb2JsZW1zDQo+ICAg
ICB3aXRoIHRoZSBsZWdhY3kgbW11LW1hc3RlcnMgYmluZGluZzoNCj4gDQo+IA0KPiBUaGlzIHNl
cmllcyB3YXMgZGV2ZWxvcGVkIGluIGEgd2F5IHRvIGFkZCBuZXcgZnVuY3Rpb25hbGl0eSwgYnV0
IG5vdCB0byANCj4gYnJha2UgZXhpc3RpbmcgKGxlZ2FjeSBiaW5kaW5ncykuIFByb2JhYmx5LCBJ
IG1pc3NlZCBzb21ldGhpbmcgDQo+IGltcG9ydGFudC7CoGlvbW11X2FkZF9kdF9kZXZpY2UoKSBj
b3VsZCByZXR1cm4gYW4gZXJyb3IgKEkgYXNzdW1lLCB0aGlzIA0KPiBpcyB3aGF0IHlvdSBhcmUg
ZmFjaW5nKSBpZiB0aGUgZGV2aWNlIG5vZGUgaW4gRFQgY29udGFpbnMgImlvbW11cyIgDQo+IHBy
b3BlcnR5IChJIG1lYW4sIHVzZXMgbmV3IGJpbmRpbmdzKSwgYnV0IHRoZSBJT01NVSBkcml2ZXIg
ZG9lc24ndCANCj4gaW1wbGVtZW50IHJlcXVpcmVkIGNhbGxiYWNrcyB5ZXQuIERvIHRoZSBkZXZp
Y2Ugbm9kZXMgaW4geW91ciBEVCBjb250YWluIA0KPiAiaW9tbXVzIiBwcm9wZXJ0eT8gQW5kIHRv
IHdoaWNoIGRvbWFpbiB0aGVzZSBkZXZpY2VzIChpbiB5b3VyIGxvZykgYXJlIA0KPiBnb2luZyB0
byBiZSBhc3NpZ25lZCAoZG9tMCBvciBvdGhlciBkb21haW5zPykuDQoNCkxvb2tpbmcgYXQgdGhl
IGJpbmRpbmdzLCBJIGRvbid0IHRoaW5rIGl0IGlzIGxlZ2l0IHRvIGhhdmUgYSBub2RlIHVzaW5n
IA0KYm90aCBsZWdhY3kgYW5kIGdlbmVyaWMgYmluZGluZyB0b2dldGhlci4gSWYgdGhpcyBpcyB3
aGF0IGhhcHBlbnMsIHRoZW4gDQpJIHdvdWxkIGNvbnNpZGVyIGl0IGFzIHVuc3VwcG9ydGVkLg0K
DQpDaGVlcnMsDQoNCi0tIA0KSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
