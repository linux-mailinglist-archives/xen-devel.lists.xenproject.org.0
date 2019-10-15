Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B86BD8183
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 23:13:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKU3w-0004NK-Lc; Tue, 15 Oct 2019 21:09:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dEpp=YI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKU3v-0004NF-NJ
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 21:08:59 +0000
X-Inumbo-ID: ff7470d8-ef8f-11e9-a531-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff7470d8-ef8f-11e9-a531-bc764e2007e4;
 Tue, 15 Oct 2019 21:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW1sbGOZPce1mXFgHUff2X0pjEfdL7pGeJg47XOpNtQ=;
 b=jk6MBuD8ikTd3hMxgbPgEPHGUPEGu66FmTKUYWJUn5Y3ctXvjs/4xeijO4ipnnlcU9u9FIQtaBbUAigsZiT+9ShlorwD1JPsVuEAtW0+WC4CbinbmWmnlLUwurl0j7s4T1RBn3O1XM3KeGysPUDm/frQ2PeGt/5lutY57CjQcag=
Received: from AM6PR08CA0030.eurprd08.prod.outlook.com (2603:10a6:20b:c0::18)
 by DB6PR0801MB2021.eurprd08.prod.outlook.com (2603:10a6:4:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Tue, 15 Oct
 2019 21:08:53 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by AM6PR08CA0030.outlook.office365.com
 (2603:10a6:20b:c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 21:08:53 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 21:08:51 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Tue, 15 Oct 2019 21:08:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a23775c2fec0bf62
X-CR-MTA-TID: 64aa7808
Received: from c781bdd805f9.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF9D3BE6-4693-452B-8512-3ACF5553B588.1; 
 Tue, 15 Oct 2019 21:08:40 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c781bdd805f9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Oct 2019 21:08:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISHA2cKbkm9Cq0TQ2RoIadEckQd0bj7Po/c1UcQYv5JdHNloDfQNWZ1rquMOPTEq3S9rLs3H5faEVlxcYZFqxgzwiK2riVDuYRE5ccLB+0ckVL4vStXb1qqKPhus15ltaVvkfMD/xUOxIGrrj+VfYzminJgfI5LibKlu7v5iLXyxsILWrNkNCMN4Iy6IF1MJTGzdp8EM11Pm13lQLxXKYYULtVmN9NiPv7f9RGNMamXlWAFO+S8THwNFEjLtQSWGpXYon5f11uSdLdDR9P/YYhOs5pNH9IxCM4kqxugBON69I09EGtDtUSmftTxw6nQJRupajVxOjXZHyWbuSZHnRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW1sbGOZPce1mXFgHUff2X0pjEfdL7pGeJg47XOpNtQ=;
 b=Ip6kDclYUNQcyz6KJBQlBKkOeO/NORk+P13nY5ePdaHsHc0qKx3pKpRAQ7rymeLs7k0+whj83DBC7fTHfXUWNVShqpkVvnTjemBA7EXCaP3/POBFAeGPn/dk63ggmfg/QBX8N8hFtJGPbOHvEa19cWeNKnFbZZfqKfwZABMf8g8AP/FR3oQp6RAfVC6yXrjgTecKssYtejPYfwbeN33R6dYAKUdaYOqJrS3AH6uJvIiIHAcP+mcA/75ww9no9WVuwyk13WNIM4H2bDJ4Wt7JTfxa7d7dK7ExfIf9QzuiGjHe9XUT1FU2+wQjMguoPLGG/tUQlXavBM14NQzj+yZh3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW1sbGOZPce1mXFgHUff2X0pjEfdL7pGeJg47XOpNtQ=;
 b=jk6MBuD8ikTd3hMxgbPgEPHGUPEGu66FmTKUYWJUn5Y3ctXvjs/4xeijO4ipnnlcU9u9FIQtaBbUAigsZiT+9ShlorwD1JPsVuEAtW0+WC4CbinbmWmnlLUwurl0j7s4T1RBn3O1XM3KeGysPUDm/frQ2PeGt/5lutY57CjQcag=
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com (20.179.44.81) by
 DBBPR08MB4346.eurprd08.prod.outlook.com (20.179.42.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Tue, 15 Oct 2019 21:08:38 +0000
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9]) by DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9%4]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 21:08:38 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH for-4.13] xen/arm: Don't use _end in is_xen_fixed_mfn()
Thread-Index: AQHVg467lwMKdvMkWkmKN32oZFn8VqdcLEWA///9sACAAAhXgA==
Date: Tue, 15 Oct 2019 21:08:37 +0000
Message-ID: <9520fef5-a21b-e4cc-12d1-97794b979883@arm.com>
References: <20191015181802.21957-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910151221270.30080@sstabellini-ThinkPad-T480s>
 <bfb3ac7c-19bc-90f0-381b-32a1491a967c@arm.com>
 <alpine.DEB.2.21.1910151249160.30080@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1910151249160.30080@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::25) To DBBPR08MB4554.eurprd08.prod.outlook.com
 (2603:10a6:10:d1::17)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 50fe7286-9f0c-4a8f-3850-08d751b3e14a
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: DBBPR08MB4346:|DB6PR0801MB2021:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <DB6PR0801MB20212DA4A4903DEC275AD6D680930@DB6PR0801MB2021.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(199004)(189003)(51444003)(7736002)(31686004)(6246003)(71200400001)(76176011)(71190400001)(86362001)(6512007)(66476007)(3846002)(256004)(6116002)(66556008)(6486002)(8936002)(14454004)(81166006)(81156014)(6306002)(14444005)(8676002)(52116002)(4326008)(25786009)(305945005)(7416002)(64756008)(66446008)(99286004)(6436002)(66946007)(186003)(66066001)(5660300002)(44832011)(2616005)(229853002)(2906002)(966005)(11346002)(476003)(446003)(486006)(478600001)(316002)(102836004)(6506007)(386003)(6916009)(53546011)(36756003)(31696002)(54906003)(26005)(6606295002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4346;
 H:DBBPR08MB4554.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: xp5Ahx/Z4jfBatpPnBBFC99zeylAn3wN8EplE5cHS/+BAneExkF2naAzOA5N/YioE9AxzNU8//BtVr+6zUKQmpF0+92LHHJKpX9gHBnqc3lKfJsW8SiF/AsaLgFi7CUYphY4vbhKI3s1DuOrjH0PpulIoSpIRjaJV91I4TIQLFJwpaTaR9R4Y9yRcWCk+pFo6jw8XLZJczncvgA2tcZtuV+jiMVdI0r9Om6ryWHQhICRiU1a1eaVcypkOvMTQ9PpMW16AArgJshYSWWhvo/zgDK37SR7pSd9YJIvBu7Ps7dzuHS7v3NQBMz3TiHe9Bo2uw8bLRugMAC51jPEGGXnuROMDtXii48ltv6zKeApKty3zaoTseugrRRYd7T3k/jcozPjb798XyKkl3f/TG55JG6T8Kx6krKWUE1UYdfiIfFWqp2ydeAFeefc74YW2MMGKLgAFaBTCBYuN/1FUHpJ5g==
x-ms-exchange-transport-forked: True
Content-ID: <5ACC50ED5F7EA4418CFB193277EA0AB9@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4346
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(189003)(199004)(51444003)(53546011)(70586007)(76130400001)(6486002)(14444005)(81166006)(31686004)(8676002)(186003)(36906005)(70206006)(2486003)(2906002)(36756003)(23676004)(26005)(316002)(54906003)(102836004)(386003)(6246003)(99286004)(6506007)(4326008)(47776003)(476003)(126002)(25786009)(86362001)(305945005)(486006)(76176011)(81156014)(7736002)(2616005)(356004)(66066001)(8936002)(6512007)(436003)(446003)(11346002)(63350400001)(6306002)(31696002)(3846002)(336012)(6862004)(229853002)(22756006)(478600001)(26826003)(5660300002)(14454004)(50466002)(6116002)(966005)(6606295002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB2021;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 82fd7ac0-38d1-4c3b-ed30-08d751b3d8f8
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hrkFbDlqvM1wi/c5W8A8SLUXmOhuurJnIJYvUGLAJBZQFZ728KEwuNTyLobItGS1nHkGNSMeu8J1k9lB77EEbzfkP2U7+IwI+Wbcz7fKrWtvoQZwHKz0LMKzZmc7LxnUEFSTGIZ4FomdAzHVYl8NauSPGXs0wDwe5NoEOc4j5EwvpUCGb+b50MfttOKJdYn3wy8gJAb7C1HYN1OatL8oQYsFsM6KZiJlarx2f2BnpfRTyzmRcQrFWb1RtIQsFPUXTuTttn/93OzDEEtwuEb7CuQtvQj4w63mToNxszlP/TpB2dWtW4w91JxKOyTzQ5Hs5NMWJQDO+FXi1tviU/qh2jgVzT60YdnN2KxwtCMyx2B1gv0it+7TKXPUtsXvUnQv+h4xqCBfElxFpvAujW9vlNBZWA+0iqlLYCZuwtQYJby+n0oE1Cn/N9r8Kuyh2ePN7Xv33za5d+8eGcYai050OQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 21:08:51.6357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50fe7286-9f0c-4a8f-3850-08d751b3e14a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2021
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Don't use _end in
 is_xen_fixed_mfn()
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
Cc: "jgross@suse.com" <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE1LzEwLzIwMTkgMjE6MzgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24g
VHVlLCAxNSBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gT24g
MTUvMTAvMjAxOSAyMDoyOCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+IE9uIFR1ZSwg
MTUgT2N0IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4gdmlydF90b19tYWRkcigpIGlz
IHVzaW5nIHRoZSBoYXJkd2FyZSBwYWdlLXRhYmxlIHdhbGsgaW5zdHJ1Y3Rpb25zIHRvDQo+Pj4+
IHRyYW5zbGF0ZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBwaHlzaWNhbCBhZGRyZXNzLiBUaGUgZnVu
Y3Rpb24gc2hvdWxkDQo+Pj4+IG9ubHkgYmUgY2FsbGVkIG9uIHZpcnR1YWwgYWRkcmVzcyBtYXBw
ZWQuDQo+Pj4+DQo+Pj4+IF9lbmQgcG9pbnRzIHBhc3QgdGhlIGVuZCBvZiBYZW4gYmluYXJ5IGFu
ZCBtYXkgbm90IGJlIG1hcHBlZCB3aGVuIHRoZQ0KPj4+PiBiaW5hcnkgc2l6ZSBpcyBwYWdlLWFs
aWduZWQuIFRoaXMgbWVhbnMgdmlydF90b19tYWRkcigpIHdpbGwgbm90IGJlIGFibGUNCj4+Pj4g
dG8gZG8gdGhlIHRyYW5zbGF0aW9uIGFuZCB0aGVyZWZvcmUgY3Jhc2ggWGVuLg0KPj4+Pg0KPj4+
PiBOb3RlIHRoZXJlIGlzIGFsc28gYW4gb2ZmLWJ5LW9uZSBpc3N1ZSBpbiB0aGlzIGNvZGUsIGJ1
dCB0aGUgcGFuaWMgd2lsbA0KPj4+PiB0cnVtcCB0aGF0Lg0KPj4+Pg0KPj4+PiBCb3RoIGlzc3Vl
cyBjYW4gYmUgZml4ZWQgYnkgdXNpbmcgX2VuZCAtIDEgaW4gdGhlIGNoZWNrLg0KPj4+Pg0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPj4+
Pg0KPj4+PiAtLS0NCj4+Pj4NCj4+Pj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQo+Pj4+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNp
dHJpeC5jb20+DQo+Pj4+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4NCj4+Pj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+Pj4gQ2M6IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+Pj4+IENjOiBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+DQo+Pj4+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9y
Zz4NCj4+Pj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+Pj4+IENjOiBqZ3Jvc3NAc3VzZS5j
b20NCj4+Pj4NCj4+Pj4geDg2IHNlZW1zIHRvIGJlIGFmZmVjdGVkIGJ5IHRoZSBvZmYtYnktb25l
IGlzc3VlLiBKYW4sIEFuZHJldz8NCj4+Pj4NCj4+Pj4gVGhpcyBjb3VsZCBiZSByZWFjaGVkIGJ5
IGEgZG9tYWluIHZpYSBYRU5fU1lTQ1RMX3BhZ2Vfb2ZmbGluZV9vcC4NCj4+Pj4gSG93ZXZlciwg
dGhlIG9wZXJhdGlvbiBpcyBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkIChzZWUgWFNBLTc3KS4gU28g
d2UgYXJlDQo+Pj4+IGZpbmUgaGVyZS4NCj4+Pj4gLS0tDQo+Pj4+ICAgIHhlbi9pbmNsdWRlL2Fz
bS1hcm0vbW0uaCB8IDIgKy0NCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
YXJtL21tLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgNCj4+Pj4gaW5kZXggMjYyZDkyZjE4
ZC4uMTc0YWNkODg1OSAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5o
DQo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaA0KPj4+PiBAQCAtMTUzLDcgKzE1
Myw3IEBAIGV4dGVybiB1bnNpZ25lZCBsb25nIHhlbmhlYXBfYmFzZV9wZHg7DQo+Pj4+ICAgIA0K
Pj4+PiAgICAjZGVmaW5lIGlzX3hlbl9maXhlZF9tZm4obWZuKSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXA0KPj4+PiAgICAgICAgKChtZm5fdG9fbWFkZHIobWZuKSA+PSB2aXJ0
X3RvX21hZGRyKCZfc3RhcnQpKSAmJiAgICAgICAgICAgXA0KPj4+PiAtICAgICAobWZuX3RvX21h
ZGRyKG1mbikgPD0gdmlydF90b19tYWRkcigmX2VuZCkpKQ0KPj4+PiArICAgICAobWZuX3RvX21h
ZGRyKG1mbikgPD0gdmlydF90b19tYWRkcihfZW5kIC0gMSkpKQ0KPj4+DQo+Pj4gVGhhbmsgeW91
IGZvciBzZW5kaW5nIHRoZSBwYXRjaCBhbmQgSSB0aGluayB0aGF0ICJfZW5kIC0gMSIgaXMgdGhl
IHJpZ2h0DQo+Pj4gZml4LiBJIGFtIGp1c3Qgd29uZGVyaW5nIHdoZXRoZXIgd2Ugd2FudC9uZWVk
IGFuIGV4cGxpY2l0IGNhc3Qgb2Ygc29tZQ0KPj4+IHNvcnQgaGVyZSwgYmVjYXVzZSB0ZWNobmlj
YWxseSBfZW5kIGlzIGEgY2hhcltdIGFuZCAxIGlzIGEgaW50ZWdlci4NCj4+PiBNYXliZToNCj4+
Pg0KPj4+ICAgICAoKHZhZGRyX3QpX2VuZCAtIDEpDQo+Pj4NCj4+PiA/DQo+Pg0KPj4gSSB2YWd1
ZWx5IHJlbWVtYmVyIGEgbGVuZ3RoeSBkaXNjdXNzaW9uIGFib3V0IGl0IGxhc3QgeWVhci4gQnV0
IEkgZG9uJ3QNCj4+IHRoaW5rIHRoZXJlIHdhcyBhbnkgY29uY2x1c2lvbiBpbiBpdC4NCj4+DQo+
PiBJbiB0aGlzIGNhc2UsIHdoYXQgYXJlIHlvdSB0cnlpbmcgdG8gcHJldmVudCB3aXRoIHRoZSBj
YXN0PyBJcyBpdA0KPj4gdW5kZXJmbG93IG9mIGFuIGFycmF5PyBJZiBzbywgaG93IHRoZSBjYXN0
IGlzIGFjdHVhbGx5IGdvaW5nIHRvIHByZXZlbnQNCj4+IHRoZSBjb21waWxlciB0byBkbyB0aGUg
d3JvbmcgdGhpbmc/DQo+IA0KPiBZZXMsIHRoZXJlIHdhcyBhIGxvbmcgZGlzY3Vzc2lvbiBhdCB0
aGUgYmVnaW5uaW5nIG9mIHRoZSB5ZWFyOyBpdCB3YXMNCj4gYWJvdXQgaG93IHRvIGRlZmluZSBf
c3RhcnQgYW5kIF9lbmQgc28gdGhhdCB3ZSBjb3VsZCBhdm9pZCBjb21waWxlcnMNCj4gdW5kZWZp
bmVkIGJlaGF2aW9yLiBUaGUgbWFpbiB1bmRlcmx5aW5nIGlzc3VlIGlzIHRoYXQgY29tcGFyaXNv
bnMNCj4gYmV0d2VlbiBwb2ludGVycyB0byBkaWZmZXJlbnQgb2JqZWN0cyBhcmUgdW5kZWZpbmVk
IFsxXSAoX3N0YXJ0IGFuZCBfZW5kDQo+IGNhbiBiZSBpbnRlcnByZXRlZCBhcyBwb2ludGVycyB0
byBkaWZmZXJlbnQgb2JqZWN0cykuDQo+IA0KPiBUaGlzIGNhc2UgaXMgYSBiaXQgZGlmZmVyZW50
LCBhbmQgZWFzaWVyLiBUaGUgaXNzdWUgaXMgdGhhdCwgYmVjYXVzZSB0aGUNCj4gcmVzdWx0IG9m
ICJfZW5kIC0gMSIgaXMgbm90IHdpdGhpbiB0aGUgYm91bmRhcmllcyBvZiB0aGUgX2VuZCBhcnJh
eSwNCj4gdGhlbiB0aGUgb3BlcmF0aW9uIGlzICJ1bmRlZmluZWQiIGJ5IHRoZSBDIHNwZWNpZmlj
YXRpb24gKEM5OSA2LjUuNikuDQo+IFVuZGVmaW5lZCBpcyBub3QgZ29vZC4NCj4gDQo+IFNvLCBJ
IGFtIG5vdCByZWFsbHkgYXNraW5nIGZvciBhbnkgY29tcGxleCBmaXgsIG9yIGh5cGVydmlzb3It
d2lkZQ0KPiByZXdvcmsuIEkgYW0gb25seSBhc2tpbmcgdG8gYXZvaWQgaW50cm9kdWNpbmcgbmV3
IHVuZGVmaW5lZCBiZWhhdmlvci4NCj4gQ2FzdGluZyB0byB2YWRkcl90IHNob3VsZCBzb2x2ZSBp
dCBJIHRoaW5rLg0KDQpJIGFncmVlIHRoYXQgd2Ugc2hvdWxkIG5vdCBhZGQgbW9yZSB1bmRlZmlu
ZWQgYmVoYXZpb3IgaW4gWGVuLiBIb3dldmVyLA0KSSBkb24ndCBsaWtlIGNhc3QgaWYgdGhleSBj
YW4ndCBiZSBqdXN0aWZpZWQuDQoNCkluIHRoaXMgcGFydGljdWxhciBjYXNlLCB5b3Ugc2VlbSB0
byBiZSB1bnN1cmUgdGhpcyBpcyBnb2luZyB0byByZW1vdmUgDQphbiB1bmRlZmluZWQgYmVoYXZp
b3IuIElJUkMsIEkgcG9pbnRlZCBvdXQgaW4gdGhlIHBhc3QgdGhhdCBjb21waWxlciBjYW4gDQpz
ZWUgdGhyb3VnaCBjYXN0Lg0KDQpTbyBjYW4gd2UgaGF2ZSBzb21lIGNlcnRhaW50eSB0aGF0IHlv
dXIgc3VnZ2VzdGlvbiBpcyBnb2luZyB0byB3b3JrPw0KDQpDaGVlcnMsDQoNCj4gDQo+IFsxXSBo
dHRwczovL21hcmMuaW5mby8/bD14ZW4tZGV2ZWwmbT0xNTQ5MDQ3MjIyMjczMTINCj4gDQoNCi0t
IA0KSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
