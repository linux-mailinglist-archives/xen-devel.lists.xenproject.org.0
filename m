Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84907224A72
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 11:51:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwjTl-0000Xc-3A; Sat, 18 Jul 2020 09:50:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMbn=A5=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jwjTi-0000XX-VF
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 09:49:59 +0000
X-Inumbo-ID: 08d51a62-c8dc-11ea-bca7-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08d51a62-c8dc-11ea-bca7-bc764e2007e4;
 Sat, 18 Jul 2020 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayHNGyMcSChVd48UGuW8lKhQv9KuZrlATPwlK5jI0eY=;
 b=fowoEiVVE5tPkGWq/e04rQl6c/J1N9lfJzwWWOc+eXILXV8F3V9nnhRKZX9gGCsuzfCLLxrksfkTAAmS3PXzFapRUroepib0vUMzOyuDOHuVcnX2MUkF5JXdmlDDJJoUUwgLnxhhAWtZbjomPFbe/Ku/QXbXW0TYms78bS2YQgc=
Received: from DB7PR03CA0080.eurprd03.prod.outlook.com (2603:10a6:10:72::21)
 by DBBPR08MB4362.eurprd08.prod.outlook.com (2603:10a6:10:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Sat, 18 Jul
 2020 09:49:54 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::44) by DB7PR03CA0080.outlook.office365.com
 (2603:10a6:10:72::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Sat, 18 Jul 2020 09:49:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Sat, 18 Jul 2020 09:49:53 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62");
 Sat, 18 Jul 2020 09:49:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 69eefec932568b59
X-CR-MTA-TID: 64aa7808
Received: from e1f9c8ece4aa.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 034F86B5-542A-4F5C-85A1-73E26A6ED3D8.1; 
 Sat, 18 Jul 2020 09:49:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e1f9c8ece4aa.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 18 Jul 2020 09:49:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6IFExYEOBaoechXXWMV4TnL69XI1lDjSAhtQs7S5pwz4tGafgwPa6vFq9fIwNhuPfQunlWURVZfI+zcoB2UEayEC0x6bNpxvoakTOH8XVL2+VBmebN/ZOb21m9eaSeGXHo5Rte9HdJLpsAqwp+rtdu8Yrd18U1N3FS3Bi0N0uRI7+rHKYCTtFiI8FALZl8vV9wFrp6LOskrmExtGIZD+XWdD4MLSvsY21B2iXHAStiI5hPy6j8kIWyqFY+MNPIga++Ll+4GsN/661VDlonccT4zfbHFZm4EyozwKYfWipDBSuRG62MZWbu7DHw3liBgJOszVpbY0sztdkjvrQ3Uqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayHNGyMcSChVd48UGuW8lKhQv9KuZrlATPwlK5jI0eY=;
 b=jyeNbgcRf2wYrjJxxR2lxegP4I2MVUgT0NoyUnk+Ch4lJojqRRgNVFcXaaoZKj2WfpbaFDpd1mVoswz2QjzZFQ2eImcwm+T+MNMcS02OwsBzdmJJ9jp6p9PeJ/vGE+4kWCV0ncuYtjb2igekIWSJP2Ee7kcPbI/dBH3KE13M6iZcD0UhRO71IKlGn0l1DkNOtBFxXjY9siWF/en2qKgYNGk2rgS1234m7cPKcF0hiLr9gu8bjLeXu8C7t3JwhWOyty5VH9gzcHk0ftCcKg9Ngqww2BnTlnEgyDx/mTtSxtFOEmgdp9xTw3hg5X1MtlE3PgAi+4rjuiqxPk8sWUWKEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayHNGyMcSChVd48UGuW8lKhQv9KuZrlATPwlK5jI0eY=;
 b=fowoEiVVE5tPkGWq/e04rQl6c/J1N9lfJzwWWOc+eXILXV8F3V9nnhRKZX9gGCsuzfCLLxrksfkTAAmS3PXzFapRUroepib0vUMzOyuDOHuVcnX2MUkF5JXdmlDDJJoUUwgLnxhhAWtZbjomPFbe/Ku/QXbXW0TYms78bS2YQgc=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB4561.eurprd08.prod.outlook.com (2603:10a6:208:12d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Sat, 18 Jul
 2020 09:49:45 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::b572:771:2750:14ed]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::b572:771:2750:14ed%5]) with mapi id 15.20.3174.029; Sat, 18 Jul 2020
 09:49:44 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAR7YAIAAIxaAgAATSQCAAA4jAIAACVuAgAEsKIA=
Date: Sat, 18 Jul 2020 09:49:43 +0000
Message-ID: <C150EBE5-5687-4C7D-9EDB-5E4B52782A45@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <20200717111644.GS7191@Air-de-Roger>
 <3B8A1B9D-A101-4937-AC42-4F62BE7E677C@arm.com>
 <20200717143120.GT7191@Air-de-Roger>
 <8AF78FF1-C389-44D8-896B-B95C1A0560E2@arm.com>
 <20200717155525.GY7191@Air-de-Roger>
In-Reply-To: <20200717155525.GY7191@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2a01:e0a:13:6f10:f1a2:5155:728:f8e7]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 37629de2-53aa-4c88-e403-08d82affec1b
x-ms-traffictypediagnostic: AM0PR08MB4561:|DBBPR08MB4362:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB43623C284606CF617B3E1A4E9D7D0@DBBPR08MB4362.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ikuAN19Olh1pbr5DmshrAzs1VqmuRsqbGP92OY04SekOMZ8j6bkrjQK3AbYSMwGIzRHJY53NeFmeG5suuhnT1x26yymt/41HMTELs3ok3K1+aPcsJ7ewqagAro/HT6IUivfH287lKMf5cG8SrokrEoVcVhuFZjE48syW/+rhIaREj1OVVhdOmggqeju7NiC7mRAUmdExgqvOfyK3VkR/dU9OXBrIe4ot1407r63OeSP0ikZePUscu8GWolAGWQ1rvYLO42KnW1eUqZ+t1ttMXWtmbx9Waay7l5oNZN8uwRDiw4ujZFDddjpu7HqJxZvc6JsYaXJhMm9V7Sus0EpM3g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3682.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(76116006)(478600001)(33656002)(30864003)(316002)(36756003)(66946007)(8676002)(66556008)(64756008)(66446008)(66476007)(83380400001)(54906003)(91956017)(71200400001)(2616005)(8936002)(6916009)(4326008)(2906002)(53546011)(6506007)(86362001)(186003)(6486002)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: KX0adZ8dg+BkCNVA8Er8bJKWK5JKAI5witSRpcX+rKV1eI/bs+BdFr0flArJ5uykIjtu4ef4to0hXnvoOM545H+VwMZKyWPHsWTZfM29VlOZS/OuzBPlDM68bYPPAUWafQO51SHDzOToPqFUwsVs4KImml0GzhBoklEacpQqW6v4t898waDXb/ioEkFA6fb67El5K9ntpw+GIpRV0JBPesGZwdDn8Ql30iJpbnLOkrZ8FpXKvyjPuMu0ARoIysTzrH3STWqbh4fuoVgrTXWcec6VxaA9REg2pWHCW0Mia/9yLLI2ME7L07TbxI5EYIUWUDz1NoC1UcvZwu6Z7W9vFGFhi9eehSkjRfCbRPWhxaFGn1vT0RYB6zSE4lOjgomFlrSNckNIAg9YiGpUV7HeoxjVcAb535JydR18l6kBL4WP9XNu67SIFRF+v5dvtUuyuNarLO1q9GshMX5PjfFnF6axQfmlBxsj3Ywroh0MUfJyDU75Vf0lysL1v/fGEm1XQTLTtrjpSl0dpuy+GOBNX5QUOm6cq1vPfHGGofppNxA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71CA4FD7B3F0CA40B01E2A4428CEE149@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4561
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966005)(186003)(70586007)(70206006)(53546011)(26005)(478600001)(6506007)(336012)(4326008)(2616005)(6862004)(54906003)(8936002)(33656002)(2906002)(316002)(107886003)(8676002)(83380400001)(47076004)(5660300002)(81166007)(6512007)(86362001)(36756003)(82740400003)(30864003)(356005)(6486002)(82310400002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 49a02d3f-8fc8-494c-81ae-08d82affe690
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MaWij7+AhYS+PUIYpsfRSX/FNqJqdTViVWn3hbguk9vn0l9Z3GDfmHi+0RihZaXEE0Zpzy/uOquWqa06S83sZRENFvaCYY0EtWD0Kuvpz+t8Hb2MDBYaz4E+nMqsObg+nXTRmcR1kVafZiGUhrGQU6vbh4ohPUJfUK2LdvUCxzJ+tfTxW3n2dTsOxyRORqK4xH8ZO6SJNhWk3ltXdFvQ1PkHFMr4iYcnLEfH0SzXRKF6R4bbblj6Hh7PT+nb65np0JZg0shPLvclZdWrxLW+tH2TFHTMGIQPNN7DRJOT+U0nj+DpVN24Rm1QP6PWk8pYtOEDFQjGooySF/YXzb3m+qsJupX3r8omg+qhsX0XGtyKBVCzEnF6qHHl6nDOePNMa5uCN9xLiVWKnk5BKrkkCQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2020 09:49:53.9123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37629de2-53aa-4c88-e403-08d82affec1b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4362
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

DQoNCj4gT24gMTcgSnVsIDIwMjAsIGF0IDE3OjU1LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEp1bCAxNywgMjAyMCBhdCAwMzoy
MTo1N1BNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+IE9uIDE3IEp1bCAyMDIw
LCBhdCAxNjozMSwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3Rl
Og0KPj4+IE9uIEZyaSwgSnVsIDE3LCAyMDIwIGF0IDAxOjIyOjE5UE0gKzAwMDAsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+Pj4+PiBPbiAxNyBKdWwgMjAyMCwgYXQgMTM6MTYsIFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+Pj4+PiAqIEFDUyBjYXBh
YmlsaXR5IGlzIGRpc2FibGUgZm9yIEFSTSBhcyBvZiBub3cgYXMgYWZ0ZXIgZW5hYmxpbmcgaXQN
Cj4+Pj4+PiBkZXZpY2VzIGFyZSBub3QgYWNjZXNzaWJsZS4NCj4+Pj4+PiAqIERvbTBMZXNzIGlt
cGxlbWVudGF0aW9uIHdpbGwgcmVxdWlyZSB0byBoYXZlIHRoZSBjYXBhY2l0eSBpbnNpZGUgWGVu
DQo+Pj4+Pj4gdG8gZGlzY292ZXIgdGhlIFBDSSBkZXZpY2VzICh3aXRob3V0IGRlcGVuZGluZyBv
biBEb20wIHRvIGRlY2xhcmUgdGhlbQ0KPj4+Pj4+IHRvIFhlbikuDQo+Pj4+PiANCj4+Pj4+IEkg
YXNzdW1lIHRoZSBmaXJtd2FyZSB3aWxsIHByb3Blcmx5IGluaXRpYWxpemUgdGhlIGhvc3QgYnJp
ZGdlIGFuZA0KPj4+Pj4gY29uZmlndXJlIHRoZSByZXNvdXJjZXMgZm9yIGVhY2ggZGV2aWNlLCBz
byB0aGF0IFhlbiBqdXN0IGhhcyB0byB3YWxrDQo+Pj4+PiB0aGUgUENJIHNwYWNlIGFuZCBmaW5k
IHRoZSBkZXZpY2VzLg0KPj4+Pj4gDQo+Pj4+PiBUQkggdGhhdCB3b3VsZCBiZSBteSBwcmVmZXJy
ZWQgbWV0aG9kLCBiZWNhdXNlIHRoZW4geW91IGNhbiBnZXQgcmlkIG9mDQo+Pj4+PiB0aGUgaHlw
ZXJjYWxsLg0KPj4+Pj4gDQo+Pj4+PiBJcyB0aGVyZSBhbnl3YXkgZm9yIFhlbiB0byBrbm93IHdo
ZXRoZXIgdGhlIGhvc3QgYnJpZGdlIGlzIHByb3Blcmx5DQo+Pj4+PiBzZXR1cCBhbmQgdGh1cyB0
aGUgUENJIGJ1cyBjYW4gYmUgc2Nhbm5lZD8NCj4+Pj4+IA0KPj4+Pj4gVGhhdCB3YXkgQXJtIGNv
dWxkIGRvIHNvbWV0aGluZyBzaW1pbGFyIHRvIHg4Niwgd2hlcmUgWGVuIHdpbGwgc2Nhbg0KPj4+
Pj4gdGhlIGJ1cyBhbmQgZGlzY292ZXIgZGV2aWNlcywgYnV0IHlvdSBjb3VsZCBzdGlsbCBwcm92
aWRlIHRoZQ0KPj4+Pj4gaHlwZXJjYWxsIGluIGNhc2UgdGhlIGJ1cyBjYW5ub3QgYmUgc2Nhbm5l
ZCBieSBYZW4gKGJlY2F1c2UgaXQgaGFzbid0DQo+Pj4+PiBiZWVuIHNldHVwKS4NCj4+Pj4gDQo+
Pj4+IFRoYXQgaXMgZGVmaW5pdGVseSB0aGUgaWRlYSB0byByZWx5IGJ5IGRlZmF1bHQgb24gYSBm
aXJtd2FyZSBkb2luZyB0aGlzIHByb3Blcmx5Lg0KPj4+PiBJIGFtIG5vdCBzdXJlIHdldGhlciBh
IHByb3BlciBlbnVtZXJhdGlvbiBjb3VsZCBiZSBkZXRlY3RlZCBwcm9wZXJseSBpbiBhbGwNCj4+
Pj4gY2FzZXMgc28gaXQgd291bGQgbWFrZSBzZW5zIHRvIHJlbHkgb24gRG9tMCBlbnVtZXJhdGlv
biB3aGVuIGEgWGVuDQo+Pj4+IGNvbW1hbmQgbGluZSBhcmd1bWVudCBpcyBwYXNzZWQgYXMgZXhw
bGFpbmVkIGluIG9uZSBvZiBSYWh1bOKAmXMgbWFpbHMuDQo+Pj4gDQo+Pj4gSSBhc3N1bWUgTGlu
dXggc29tZWhvdyBrbm93cyB3aGVuIGl0IG5lZWRzIHRvIGluaXRpYWxpemUgdGhlIFBDSSByb290
DQo+Pj4gY29tcGxleCBiZWZvcmUgYXR0ZW1wdGluZyB0byBhY2Nlc3MgdGhlIGJ1cy4gV291bGQg
aXQgYmUgcG9zc2libGUgdG8NCj4+PiBhZGQgdGhpcyBsb2dpYyB0byBYZW4gc28gaXQgY2FuIGZp
Z3VyZSBvdXQgb24gaXQncyBvd24gd2hldGhlciBpdCdzDQo+Pj4gc2FmZSB0byBzY2FuIHRoZSBQ
Q0kgYnVzIG9yIHdoZXRoZXIgaXQgbmVlZHMgdG8gd2FpdCBmb3IgdGhlIGhhcmR3YXJlDQo+Pj4g
ZG9tYWluIHRvIHJlcG9ydCB0aGUgZGV2aWNlcyBwcmVzZW50Pw0KPj4gDQo+PiBUaGF0IG1pZ2h0
IGJlIHBvc3NpYmxlIHRvIGRvIGJ1dCB3aWxsIGFueXdheSByZXF1aXJlIGEgY29tbWFuZCBsaW5l
IGFyZ3VtZW50DQo+PiB0byBiZSBhYmxlIHRvIGZvcmNlIHhlbiB0byBsZXQgdGhlIGhhcmR3YXJl
IGRvbWFpbiBkbyB0aGUgaW5pdGlhbGl6YXRpb24gYW55d2F5IGluDQo+PiBjYXNlIFhlbiBkZXRl
Y3Rpb24gZG9lcyBub3Qgd29yayBwcm9wZXJseS4NCj4+IEluIHRoZSBjYXNlIHdoZXJlIHRoZXJl
IGlzIGEgRG9tMCBpIHdvdWxkIG1vcmUgZXhwZWN0IHRoYXQgd2UgbGV0IGl0IGRvIHRoZSBpbml0
aWFsaXphdGlvbg0KPj4gYWxsIHRoZSB0aW1lIHVubGVzcyB0aGUgdXNlciBpcyB0ZWxsaW5nIHVz
aW5nIGEgY29tbWFuZCBsaW5lIGFyZ3VtZW50IHRoYXQgdGhlIGN1cnJlbnQgb25lDQo+PiBpcyBj
b3JyZWN0IGFuZCBzaGFsbCBiZSB1c2VkLg0KPiANCj4gRlJULCBvbiB4ODYgd2UgbGV0IGRvbTAg
ZW51bWVyYXRlIGFuZCBwcm9iZSB0aGUgUENJIGRldmljZXMgYXMgaXQNCj4gZmVlbHMgbGlrZSwg
YnV0IHZQQ0kgdHJhcHMgaGF2ZSBhbHJlYWR5IGJlZW4gc2V0IHRvIGFsbCB0aGUgZGV0ZWN0ZWQN
Cj4gZGV2aWNlcywgYW5kIHZQQ0kgYWxyZWFkeSBzdXBwb3J0cyBsZXR0aW5nIGRvbTAgc2l6ZSB0
aGUgQkFScywgb3IgZXZlbg0KPiBjaGFuZ2UgaXQncyBwb3NpdGlvbiAodGhlb3JldGljYWxseSwg
SSBoYXZlbid0IHNlZW4gYSBkb20wIGNoYW5nZSB0aGUNCj4gcG9zaXRpb24gb2YgdGhlIEJBUnMg
eWV0KS4NCj4gDQo+IFNvIG9uIEFybSB5b3UgY291bGQgYWxzbyBsZXQgZG9tMCBkbyBhbGwgb2Yg
dGhpcywgdGhlIHF1ZXN0aW9uIGlzDQo+IHdoZXRoZXIgdlBDSSB0cmFwcyBjb3VsZCBiZSBzZXQg
ZWFybGllciAod2hlbiBkb20wIGlzIGNyZWF0ZWQpIGlmIHRoZQ0KPiBQQ0kgYnVzIGhhcyBiZWVu
IGluaXRpYWxpemVkIGFuZCBjYW4gYmUgc2Nhbm5lZC4NCj4gDQo+IEkgaGF2ZSBubyBpZGVhIGhv
d2V2ZXIgaG93IGJhcmUgbWV0YWwgTGludXggb24gQXJtIGZpZ3VyZXMgb3V0IHRoZQ0KPiBzdGF0
ZSBvZiB0aGUgUENJIGJ1cywgb3IgaWYgaXQncyBzb21ldGhpbmcgdGhhdCdzIHBhc3NlZCBvbiB0
aGUgRFQsIG9yDQo+IHNpZ25hbGVkIHNvbWVob3cgZnJvbSB0aGUgZmlybXdhcmUvYm9vdGxvYWRl
ci4NCg0KVGhpcyBpcyBkZWZpbml0ZWx5IHNvbWV0aGluZyB3ZSB3aWxsIGNoZWNrIGFuZCB3ZSB3
aWxsIGFsc28gdHJ5IHRvIGtlZXAgdGhlIHNhbWUNCmJlaGF2aW91ciBhcyB4ODYgdW5sZXNzIHRo
aXMgaXMgbm90IHBvc3NpYmxlLiBJIHdvdWxkIG5vdCBzZWUgd2h5IHdlIGNvdWxkIG5vdCANCnNl
dCB0aGUgdlBDSSB0cmFwcyBlYXJsaWVyIGFuZCBqdXN0IHJlbGF5IHRoZSB3cml0ZXMgdG8gdGhl
IGhhcmR3YXJlIGJ1dCBkZXRlY3QNCmlmIEJBUnMgYXJlIGNoYW5nZWQuDQoNCj4gDQo+Pj4+PiBU
aGlzIHNob3VsZCBiZSBsaW1pdGVkIHRvIHJlYWQtb25seSBhY2Nlc3NlcyBpbiBvcmRlciB0byBi
ZSBzYWZlLg0KPj4+Pj4gDQo+Pj4+PiBFbXVsYXRpbmcgYSBQQ0kgYnJpZGdlIGluIFhlbiB1c2lu
ZyB2UENJIHNob3VsZG4ndCBiZSB0aGF0DQo+Pj4+PiBjb21wbGljYXRlZCwgc28geW91IGNvdWxk
IGxpa2VseSByZXBsYWNlIHRoZSByZWFsIGJyaWRnZXMgd2l0aA0KPj4+Pj4gZW11bGF0ZWQgb25l
cy4gT3IgZXZlbiBwcm92aWRlIGEgZmFrZSB0b3BvbG9neSB0byB0aGUgZ3Vlc3QgdXNpbmcgYW4N
Cj4+Pj4+IGVtdWxhdGVkIGJyaWRnZS4NCj4+Pj4gDQo+Pj4+IEp1c3Qgc2hvd2luZyBhbGwgYnJp
ZGdlcyBhbmQga2VlcGluZyB0aGUgaGFyZHdhcmUgdG9wb2xvZ3kgaXMgdGhlIHNpbXBsZXN0DQo+
Pj4+IHNvbHV0aW9uIGZvciBub3cuIEJ1dCBtYXliZSBzaG93aW5nIGEgZGlmZmVyZW50IHRvcG9s
b2d5IGFuZCBvbmx5IGZha2UNCj4+Pj4gYnJpZGdlcyBjb3VsZCBtYWtlIHNlbnNlIGFuZCBiZSBp
bXBsZW1lbnRlZCBpbiB0aGUgZnV0dXJlLg0KPj4+IA0KPj4+IEFjay4gSSd2ZSBhbHNvIGhlYXJk
IHJ1bW9ycyBvZiBYZW4gb24gQXJtIHBlb3BsZSBiZWluZyB2ZXJ5IGludGVyZXN0ZWQNCj4+PiBp
biBWaXJ0SU8gc3VwcG9ydCwgaW4gd2hpY2ggY2FzZSB5b3UgbWlnaHQgZXhwb3NlIGJvdGggZnVs
bHkgZW11bGF0ZWQNCj4+PiBWaXJ0SU8gZGV2aWNlcyBhbmQgUENJIHBhc3N0aHJvdWdoIGRldmlj
ZXMgb24gdGhlIFBDSSBidXMsIHNvIGl0IHdvdWxkDQo+Pj4gYmUgZ29vZCB0byBzcGVuZCBzb21l
IHRpbWUgdGhpbmtpbmcgaG93IHRob3NlIHdpbGwgZml0IHRvZ2V0aGVyLg0KPj4+IA0KPj4+IFdp
bGwgeW91IGFsbG9jYXRlIGEgc2VwYXJhdGUgc2VnbWVudCB1bnVzZWQgYnkgaGFyZHdhcmUgdG8g
ZXhwb3NlIHRoZQ0KPj4+IGZ1bGx5IGVtdWxhdGVkIFBDSSBkZXZpY2VzIChWaXJ0SU8pPw0KPj4+
IA0KPj4+IFdpbGwgT1NlcyBzdXBwb3J0IGhhdmluZyBzZXZlcmFsIHNlZ21lbnRzPw0KPj4+IA0K
Pj4+IElmIG5vdCB5b3UgbGlrZWx5IG5lZWQgdG8gaGF2ZSBlbXVsYXRlZCBicmlkZ2VzIHNvIHRo
YXQgeW91IGNhbiBhZGp1c3QNCj4+PiB0aGUgYnJpZGdlIHdpbmRvdyBhY2NvcmRpbmdseSB0byBm
aXQgdGhlIHBhc3N0aHJvdWdoIGFuZCB0aGUgZW11bGF0ZWQNCj4+PiBNTUlPIHNwYWNlLCBhbmQg
bGlrZWx5IGJlIGFibGUgdG8gZXhwb3NlIHBhc3N0aHJvdWdoIGRldmljZXMgdXNpbmcgYQ0KPj4+
IGRpZmZlcmVudCB0b3BvbG9neSB0aGFuIHRoZSBob3N0IG9uZS4NCj4+IA0KPj4gSG9uZXN0bHkg
dGhpcyBpcyBub3Qgc29tZXRoaW5nIHdlIGNvbnNpZGVyZWQuIEkgd2FzIG1vcmUgdGhpbmtpbmcg
dGhhdA0KPj4gdGhpcyB1c2UgY2FzZSB3b3VsZCBiZSBoYW5kbGVkIGJ5IGNyZWF0aW5nIGFuIG90
aGVyIFZQQ0kgYnVzIGRlZGljYXRlZA0KPj4gdG8gdGhvc2Uga2luZCBvZiBkZXZpY2VzIGluc3Rl
YWQgb2YgbWl4aW5nIHBoeXNpY2FsIGFuZCB2aXJ0dWFsIGRldmljZXMuDQo+IA0KPiBKdXN0IG1l
bnRpb25pbmcgaXQgYW5kIHlvdXIgcGxhbnMgd2hlbiBndWVzdHMgbWlnaHQgYWxzbyBoYXZlIGZ1
bGx5DQo+IGVtdWxhdGVkIGRldmljZXMgb24gdGhlIFBDSSBidXMgd291bGQgYmUgcmVsZXZhbnQg
SSB0aGluay4NCg0KV2Ugd2lsbCBhZGQgdGhpcy4NCg0KPiANCj4gQW55d2F5LCBJIGRvbid0IHRo
aW5rIGl0J3Mgc29tZXRoaW5nIG1hbmRhdG9yeSBoZXJlLCBhcyBmcm9tIGEgZ3Vlc3QNCj4gUG9W
IGhvdyB3ZSBleHBvc2UgUENJIGRldmljZXMgc2hvdWxkbid0IG1hdHRlciB0aGF0IG11Y2gsIGFz
IGxvbmcgYXMNCj4gaXQncyBkb25lIGluIGEgc3BlYyBjb21wbGlhbnQgd2F5Lg0KPiANCj4gU28g
eW91IGNhbiBzdGFydCB3aXRoIHRoaXMgYXBwcm9hY2ggaWYgaXQncyBlYXNpZXIsIEkganVzdCB3
YW50ZWQgdG8NCj4gbWFrZSBzdXJlIHlvdSBoYXZlIGluIG1pbmQgdGhhdCBhdCBzb21lIHBvaW50
IEFybSBndWVzdHMgbWlnaHQgYWxzbw0KPiByZXF1aXJlIGZ1bGx5IGVtdWxhdGVkIFBDSSBkZXZp
Y2VzIHNvIHRoYXQgeW91IGRvbid0IHBhaW50IHlvdXJzZWx2ZXMNCj4gaW4gYSBjb3JuZXIuDQoN
CkRlZmluaXRlbHkgdGhhdOKAmXMgbm90IHNvbWV0aGluZyB3ZSBkaWQgdGhpbmsgb2YgYW5kIHRo
YW5rcyBmb3IgdGhlIHJlbWFyaw0KYXMgd2UgbmVlZCB0byBrZWVwIHRoaXMgaW4gbWluZC4NCg0K
PiANCj4+PiANCj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+ICMgRW11bGF0ZWQgUENJIGRldmljZSB0
cmVlIG5vZGUgaW4gbGlieGw6DQo+Pj4+Pj4gDQo+Pj4+Pj4gTGlieGwgaXMgY3JlYXRpbmcgYSB2
aXJ0dWFsIFBDSSBkZXZpY2UgdHJlZSBub2RlIGluIHRoZSBkZXZpY2UgdHJlZQ0KPj4+Pj4+IHRv
IGVuYWJsZSB0aGUgZ3Vlc3QgT1MgdG8gZGlzY292ZXIgdGhlIHZpcnR1YWwgUENJIGR1cmluZyBn
dWVzdA0KPj4+Pj4+IGJvb3QuIFdlIGludHJvZHVjZWQgdGhlIG5ldyBjb25maWcgb3B0aW9uIFt2
cGNpPSJwY2lfZWNhbSJdIGZvcg0KPj4+Pj4+IGd1ZXN0cy4gV2hlbiB0aGlzIGNvbmZpZyBvcHRp
b24gaXMgZW5hYmxlZCBpbiBhIGd1ZXN0IGNvbmZpZ3VyYXRpb24sDQo+Pj4+Pj4gYSBQQ0kgZGV2
aWNlIHRyZWUgbm9kZSB3aWxsIGJlIGNyZWF0ZWQgaW4gdGhlIGd1ZXN0IGRldmljZSB0cmVlLg0K
Pj4+Pj4+IA0KPj4+Pj4+IEEgbmV3IGFyZWEgaGFzIGJlZW4gcmVzZXJ2ZWQgaW4gdGhlIGFybSBn
dWVzdCBwaHlzaWNhbCBtYXAgYXQgd2hpY2gNCj4+Pj4+PiB0aGUgVlBDSSBidXMgaXMgZGVjbGFy
ZWQgaW4gdGhlIGRldmljZSB0cmVlIChyZWcgYW5kIHJhbmdlcw0KPj4+Pj4+IHBhcmFtZXRlcnMg
b2YgdGhlIG5vZGUpLiBBIHRyYXAgaGFuZGxlciBmb3IgdGhlIFBDSSBFQ0FNIGFjY2VzcyBmcm9t
DQo+Pj4+Pj4gZ3Vlc3QgaGFzIGJlZW4gcmVnaXN0ZXJlZCBhdCB0aGUgZGVmaW5lZCBhZGRyZXNz
IGFuZCByZWRpcmVjdHMNCj4+Pj4+PiByZXF1ZXN0cyB0byB0aGUgVlBDSSBkcml2ZXIgaW4gWGVu
Lg0KPj4+Pj4gDQo+Pj4+PiBDYW4ndCB5b3UgZGVkdWNlIHRoZSByZXF1aXJlbWVudCBvZiBzdWNo
IERUIG5vZGUgYmFzZWQgb24gdGhlIHByZXNlbmNlDQo+Pj4+PiBvZiBhICdwY2k9JyBvcHRpb24g
aW4gdGhlIHNhbWUgY29uZmlnIGZpbGU/DQo+Pj4+PiANCj4+Pj4+IEFsc28gSSB3b3VsZG4ndCBk
aXNjYXJkIHRoYXQgaW4gdGhlIGZ1dHVyZSB5b3UgbWlnaHQgd2FudCB0byB1c2UNCj4+Pj4+IGRp
ZmZlcmVudCBlbXVsYXRvcnMgZm9yIGRpZmZlcmVudCBkZXZpY2VzLCBzbyBpdCBtaWdodCBiZSBo
ZWxwZnVsIHRvDQo+Pj4+PiBpbnRyb2R1Y2Ugc29tZXRoaW5nIGxpa2U6DQo+Pj4+PiANCj4+Pj4+
IHBjaSA9IFsgJzA4OjAwLjAsYmFja2VuZD12cGNpJywgJzA5OjAwLjAsYmFja2VuZD14ZW5wdCcs
ICcwYTowMC4wLGJhY2tlbmQ9cWVtdScsIC4uLiBdDQo+Pj4+PiANCj4+Pj4+IEZvciB0aGUgdGlt
ZSBiZWluZyBBcm0gd2lsbCByZXF1aXJlIGJhY2tlbmQ9dnBjaSBmb3IgYWxsIHRoZSBwYXNzZWQN
Cj4+Pj4+IHRocm91Z2ggZGV2aWNlcywgYnV0IEkgd291bGRuJ3QgcnVsZSBvdXQgdGhpcyBjaGFu
Z2luZyBpbiB0aGUgZnV0dXJlLg0KPj4+PiANCj4+Pj4gV2UgbmVlZCBpdCBmb3IgdGhlIGNhc2Ug
d2hlcmUgbm8gZGV2aWNlIGlzIGRlY2xhcmVkIGluIHRoZSBjb25maWcgZmlsZSBhbmQgdGhlIHVz
ZXINCj4+Pj4gd2FudHMgdG8gYWRkIGRldmljZXMgdXNpbmcgeGwgbGF0ZXIuIEluIHRoaXMgY2Fz
ZSB3ZSBtdXN0IGhhdmUgdGhlIERUIG5vZGUgZm9yIGl0DQo+Pj4+IHRvIHdvcmsuIA0KPj4+IA0K
Pj4+IFRoZXJlJ3MgYSBwYXNzdGhyb3VnaCB4bC5jZmcgb3B0aW9uIGZvciB0aGF0IGFscmVhZHks
IHNvIHRoYXQgaWYgeW91DQo+Pj4gZG9uJ3Qgd2FudCB0byBhZGQgYW55IFBDSSBwYXNzdGhyb3Vn
aCBkZXZpY2VzIGF0IGNyZWF0aW9uIHRpbWUgYnV0DQo+Pj4gcmF0aGVyIGhvdHBsdWcgdGhlbSB5
b3UgY2FuIHNldDoNCj4+PiANCj4+PiBwYXNzdGhyb3VnaD1lbmFibGVkDQo+Pj4gDQo+Pj4gQW5k
IGl0IHNob3VsZCBzZXR1cCB0aGUgZG9tYWluIHRvIGJlIHByZXBhcmVkIHRvIHN1cHBvcnQgaG90
DQo+Pj4gcGFzc3Rocm91Z2gsIGluY2x1ZGluZyB0aGUgSU9NTVUgWzBdLg0KPj4gDQo+PiBJc27i
gJl0IHRoaXMgb3B0aW9uIGNvdmVyaW5nIG1vcmUgdGhlbiBQQ0kgcGFzc3Rocm91Z2ggPw0KPj4g
DQo+PiBMb3RzIG9mIEFybSBwbGF0Zm9ybSBkbyBub3QgaGF2ZSBhIFBDSSBidXMgYXQgYWxsLCBz
byBmb3IgdGhvc2UNCj4+IGNyZWF0aW5nIGEgVlBDSSBidXMgd291bGQgYmUgcG9pbnRsZXNzLiBC
dXQgeW91IG1pZ2h0IG5lZWQgdG8NCj4+IGFjdGl2YXRlIHRoaXMgdG8gcGFzcyBkZXZpY2VzIHdo
aWNoIGFyZSBub3Qgb24gdGhlIFBDSSBidXMuDQo+IA0KPiBXZWxsLCB5b3UgY2FuIGNoZWNrIHdo
ZXRoZXIgdGhlIGhvc3QgaGFzIFBDSSBzdXBwb3J0IGFuZCBkZWNpZGUNCj4gd2hldGhlciB0byBh
dHRhY2ggYSB2aXJ0dWFsIFBDSSBidXMgdG8gdGhlIGd1ZXN0IG9yIG5vdD8NCj4gDQo+IFNldHRp
bmcgcGFzc3Rocm91Z2g9ZW5hYmxlZCBzaG91bGQgcHJlcGFyZSB0aGUgZ3Vlc3QgdG8gaGFuZGxl
DQo+IHBhc3N0aHJvdWdoLCBpbiB3aGF0ZXZlciBmb3JtIGlzIHN1cHBvcnRlZCBieSB0aGUgaG9z
dCBJTU8uDQoNClRydWUsIHdlIGNvdWxkIGp1c3Qgc2F5IHRoYXQgd2UgY3JlYXRlIGEgUENJIGJ1
cyBpZiB0aGUgaG9zdCBoYXMgb25lIGFuZA0KcGFzc3Rocm91Z2ggaXMgYWN0aXZhdGVkLg0KQnV0
IHdpdGggdmlydHVhbCBkZXZpY2UgcG9pbnQsIHdlIG1pZ2h0IGV2ZW4gbmVlZCBvbmUgb24gZ3Vl
c3Qgd2l0aG91dA0KUENJIHN1cHBvcnQgb24gdGhlIGhhcmR3YXJlIDotKQ0KDQo+IA0KPj4+Pj4+
IExpbWl0YXRpb246DQo+Pj4+Pj4gKiBOZWVkIHRvIGF2b2lkIHRoZSDigJxpb21lbeKAnSBhbmQg
4oCcaXJx4oCdIGd1ZXN0IGNvbmZpZw0KPj4+Pj4+IG9wdGlvbnMgYW5kIG1hcCB0aGUgSU9NRU0g
cmVnaW9uIGFuZCBJUlEgYXQgdGhlIHNhbWUgdGltZSB3aGVuDQo+Pj4+Pj4gZGV2aWNlIGlzIGFz
c2lnbmVkIHRvIHRoZSBndWVzdCB1c2luZyB0aGUg4oCccGNp4oCdIGd1ZXN0IGNvbmZpZyBvcHRp
b25zDQo+Pj4+Pj4gd2hlbiB4bCBjcmVhdGVzIHRoZSBkb21haW4uDQo+Pj4+Pj4gKiBFbXVsYXRl
ZCBCQVIgdmFsdWVzIG9uIHRoZSBWUENJIGJ1cyBzaG91bGQgcmVmbGVjdCB0aGUgSU9NRU0gbWFw
cGVkDQo+Pj4+Pj4gYWRkcmVzcy4NCj4+Pj4+IA0KPj4+Pj4gSXQgd2FzIG15IHVuZGVyc3RhbmRp
bmcgdGhhdCB5b3Ugd291bGQgaWRlbnRpdHkgbWFwIHRoZSBCQVIgaW50byB0aGUNCj4+Pj4+IGRv
bVUgc3RhZ2UtMiB0cmFuc2xhdGlvbiwgYW5kIHRoYXQgY2hhbmdlcyBieSB0aGUgZ3Vlc3Qgd29u
J3QgYmUNCj4+Pj4+IGFsbG93ZWQuDQo+Pj4+IA0KPj4+PiBJbiBmYWN0IHRoaXMgaXMgbm90IHBv
c3NpYmxlIHRvIGRvIGFuZCB3ZSBoYXZlIHRvIHJlbWFwIGF0IGEgZGlmZmVyZW50IGFkZHJlc3MN
Cj4+Pj4gYmVjYXVzZSB0aGUgZ3Vlc3QgcGh5c2ljYWwgbWFwcGluZyBpcyBmaXhlZCBieSBYZW4g
b24gQXJtIHNvIHdlIG11c3QgZm9sbG93DQo+Pj4+IHRoZSBzYW1lIGRlc2lnbiBvdGhlcndpc2Ug
dGhpcyB3b3VsZCBvbmx5IHdvcmsgaWYgdGhlIEJBUnMgYXJlIHBvaW50aW5nIHRvIGFuDQo+Pj4+
IGFkZHJlc3MgdW51c2VkIGFuZCBvbiBKdW5vIHRoaXMgaXMgZm9yIGV4YW1wbGUgY29uZmxpY3Rp
bmcgd2l0aCB0aGUgZ3Vlc3QNCj4+Pj4gUkFNIGFkZHJlc3MuDQo+Pj4gDQo+Pj4gVGhpcyB3YXMg
bm90IGNsZWFyIGZyb20gbXkgcmVhZGluZyBvZiB0aGUgZG9jdW1lbnQsIGNvdWxkIHlvdSBwbGVh
c2UNCj4+PiBjbGFyaWZ5IG9uIHRoZSBuZXh0IHZlcnNpb24gdGhhdCB0aGUgZ3Vlc3QgcGh5c2lj
YWwgbWVtb3J5IG1hcCBpcw0KPj4+IGFsd2F5cyB0aGUgc2FtZSwgYW5kIHRoYXQgQkFScyBmcm9t
IFBDSSBkZXZpY2VzIGNhbm5vdCBiZSBpZGVudGl0eQ0KPj4+IG1hcHBlZCB0byB0aGUgc3RhZ2Ut
MiB0cmFuc2xhdGlvbiBhbmQgaW5zdGVhZCBhcmUgcmVsb2NhdGVkIHNvbWV3aGVyZQ0KPj4+IGVs
c2U/DQo+PiANCj4+IFdlIHdpbGwuDQo+PiANCj4+PiANCj4+PiBJJ20gdGhlbiBjb25mdXNlZCBh
Ym91dCB3aGF0IHlvdSBkbyB3aXRoIGJyaWRnZSB3aW5kb3dzLCBkbyB5b3UgYWxzbw0KPj4+IHRy
YXAgYW5kIGFkanVzdCB0aGVtIHRvIHJlcG9ydCBhIGRpZmZlcmVudCBJT01FTSByZWdpb24/DQo+
PiANCj4+IFllcyB0aGlzIGlzIHdoYXQgd2Ugd2lsbCBoYXZlIHRvIGRvIHNvIHRoYXQgdGhlIHJl
Z2lvbnMgcmVmbGVjdCB0aGUgVlBDSSBtYXBwaW5ncw0KPj4gYW5kIG5vdCB0aGUgaGFyZHdhcmUg
b25lLg0KPj4gDQo+Pj4gDQo+Pj4gQWJvdmUgeW91IG1lbnRpb25lZCB0aGF0IHJlYWQtb25seSBh
Y2Nlc3Mgd2FzIGdpdmVuIHRvIGJyaWRnZQ0KPj4+IHJlZ2lzdGVycywgYnV0IEkgZ3Vlc3Mgc29t
ZSBhcmUgYWxzbyBlbXVsYXRlZCBpbiBvcmRlciB0byByZXBvcnQNCj4+PiBtYXRjaGluZyBJT01F
TSByZWdpb25zPw0KPj4gDQo+PiB5ZXMgdGhhdOKAmXMgZXhhY3QuIFdlIHdpbGwgY2xlYXIgdGhp
cyBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KPiANCj4gSWYgeW91IGhhdmUgdG8gZ28gdGhpcyByb3V0
ZSBmb3IgZG9tVXMsIGl0IG1pZ2h0IGJlIGVhc2llciB0byBqdXN0DQo+IGZha2UgYSBQQ0kgaG9z
dCBicmlkZ2UgYW5kIHBsYWNlIGFsbCB0aGUgZGV2aWNlcyB0aGVyZSBldmVuIHdpdGgNCj4gZGlm
ZmVyZW50IFNCREYgYWRkcmVzc2VzLiBIYXZpbmcgdG8gcmVwbGljYXRlIGFsbCB0aGUgYnJpZGdl
cyBvbiB0aGUNCj4gcGh5c2ljYWwgUENJIGJ1cyBhbmQgZml4aW5nIHVwIGl0J3MgTU1JTyB3aW5k
b3dzIHNlZW1zIG11Y2ggbW9yZQ0KPiBjb21wbGljYXRlZCB0aGFuIGp1c3QgZmFraW5nL2VtdWxh
dGluZyBhIHNpbmdsZSBicmlkZ2U/DQoNClRoYXTigJlzIGRlZmluaXRlbHkgc29tZXRoaW5nIHdl
IGhhdmUgdG8gZGlnIG1vcmUgb24uIFRoZSB3aG9sZSBwcm9ibGVtYXRpYw0Kb2YgUENJIGVudW1l
cmF0aW9uIGFuZCBCQVIgdmFsdWUgYXNzaWduYXRpb24gaW4gWGVuIG1pZ2h0IGJlIHB1c2hlZCB0
bw0KZWl0aGVyIERvbTAgb3IgdGhlIGZpcm13YXJlIGJ1dCB3ZSBtaWdodCBpbiBmYWN0IGZpbmQg
b3Vyc2VsZiB3aXRoIGV4YWN0bHkgdGhlDQpzYW1lIHByb2JsZW0gb24gdGhlIFZQQ0kgYnVzLg0K
DQpCZXJ0cmFuZA0KDQo+IA0KPiBSb2dlci4NCg0K

