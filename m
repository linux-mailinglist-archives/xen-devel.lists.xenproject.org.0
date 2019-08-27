Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3F39F16F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 19:22:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2f7g-000867-EH; Tue, 27 Aug 2019 17:19:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GJdN=WX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i2f7f-000862-2t
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 17:19:11 +0000
X-Inumbo-ID: c7635a82-c8ee-11e9-b95f-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7635a82-c8ee-11e9-b95f-bc764e2007e4;
 Tue, 27 Aug 2019 17:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7GFjHGZ19uBPciah3S1DKIsX7f4dEgDp7DF43CjR/0=;
 b=bpGZJH0pnQzkEl6NZ/YMq3wvSmDapxRQzwH66xH9Iax+HgAKTM1wmsZJETOzi+fXJArHisxthadYqTqy2iZJXg3kK57S0gXq3EMM8mtsX7aHXcPxp9CqH31rHiev86hEB386C4xCwStRwQPuw2mYH2+4TZdcIv20Wj3QbRcsiAU=
Received: from DB6PR0802CA0046.eurprd08.prod.outlook.com (2603:10a6:4:a3::32)
 by AM6PR08MB4951.eurprd08.prod.outlook.com (2603:10a6:20b:eb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Tue, 27 Aug
 2019 17:19:06 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::208) by DB6PR0802CA0046.outlook.office365.com
 (2603:10a6:4:a3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Tue, 27 Aug 2019 17:19:05 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com; lists.xenproject.org; dmarc=temperror
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2199.13 via Frontend Transport; Tue, 27 Aug 2019 17:19:04 +0000
Received: ("Tessian outbound eec90fc31dfb:v27");
 Tue, 27 Aug 2019 17:19:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 99631b73809f1792
X-CR-MTA-TID: 64aa7808
Received: from 1a61efa91445.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 755F1289-2D27-491F-B83D-81A12D9BCF65.1; 
 Tue, 27 Aug 2019 17:18:58 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1a61efa91445.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Aug 2019 17:18:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nk07OsDDuL2a3LRxas+somqLFzO53OLbkb5N/51bIgsk1KS0s6hQeNxu3sP/eWnscnPHQuuu40agAbgaCPuhc/mGHuFpijV9B7oj/f+9lneSNZg2CWxsEAN1WW+/zCrWh1g/HmJyr0pZ6pdOV26jw4D8/d5x2r7kpx11sCxGEr4oOwoaLGMdqG6V3BNpbPZefiYZzlyjcXjbDz9NWQi2UF2gtXeAkUi7SwgK7g5VQDWE53lkjbk906xRZZ2amx2TQ0YkQM839C0AoxqLpH9mIeKg+g3ZwTDJTYleWldE11OLi7xMYvbUi0so3Jkj2FcPXBTQFhu0H1hLpPlJklFNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7GFjHGZ19uBPciah3S1DKIsX7f4dEgDp7DF43CjR/0=;
 b=ekQs2ofIdM25OoG1djQDeF+w01KjewhUhwNtk1YeX8D2bELj9ZyzIaoTQqdJpIaYEEA+bMF7BevUvsKmMDYYCtOsEflipqTop11lkzbOp5+Z6QIuV9g1db3qIaiP4PF+5iB9VDWrPdg76uIlWAKA1NXTWZNHlbz/0iFkTzZGhZzHASUyFcJVEbBM9qpIknp7QT8A/iwsI8xqfXhsUwiOpU9nCOJr/jXRIc2IyLG3YVarv4KJ1laSe18u+z0gAkUaTjWfdZtmHgyL01De+IMLb5Zre/ddDh1qBIrO6eV+Pb0O3S8tL2WDl3Kds+KMGecBBDbd0/KOEqWOhKBgeu5SEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7GFjHGZ19uBPciah3S1DKIsX7f4dEgDp7DF43CjR/0=;
 b=bpGZJH0pnQzkEl6NZ/YMq3wvSmDapxRQzwH66xH9Iax+HgAKTM1wmsZJETOzi+fXJArHisxthadYqTqy2iZJXg3kK57S0gXq3EMM8mtsX7aHXcPxp9CqH31rHiev86hEB386C4xCwStRwQPuw2mYH2+4TZdcIv20Wj3QbRcsiAU=
Received: from AM5PR0802MB2500.eurprd08.prod.outlook.com (10.175.45.12) by
 AM5PR0802MB2435.eurprd08.prod.outlook.com (10.175.44.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 17:18:57 +0000
Received: from AM5PR0802MB2500.eurprd08.prod.outlook.com
 ([fe80::b8de:99da:f3d4:5ef3]) by AM5PR0802MB2500.eurprd08.prod.outlook.com
 ([fe80::b8de:99da:f3d4:5ef3%12]) with mapi id 15.20.2199.021; Tue, 27 Aug
 2019 17:18:57 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Andrii Anisov <andrii.anisov@gmail.com>
Thread-Topic: [PATCH] arm/traps.c: Adjust HPFAR_EL2 representation
Thread-Index: AQHVXPUvr7HRaxcnbEC8sCZjHU7s4qcPPRYA
Date: Tue, 27 Aug 2019 17:18:56 +0000
Message-ID: <b16ba4e7-fc3c-2546-6442-6ad32255e5ff@arm.com>
References: <1566923614-12503-1-git-send-email-andrii.anisov@gmail.com>
In-Reply-To: <1566923614-12503-1-git-send-email-andrii.anisov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::32) To AM5PR0802MB2500.eurprd08.prod.outlook.com
 (2603:10a6:203:a0::12)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2a01:cb08:86b1:6600:6c22:29c9:79f4:12e3]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 204f6b61-790d-4459-afc8-08d72b12a938
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR0802MB2435; 
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2435:|AM6PR08MB4951:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <AM6PR08MB49518BEB61273723D3FEBE3880A00@AM6PR08MB4951.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1148;OLM:1148;
x-forefront-prvs: 0142F22657
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(199004)(189003)(6116002)(99286004)(6916009)(71190400001)(186003)(71200400001)(102836004)(966005)(25786009)(53546011)(6506007)(478600001)(229853002)(54906003)(316002)(6306002)(31696002)(386003)(486006)(2616005)(44832011)(86362001)(446003)(11346002)(476003)(31686004)(6512007)(6246003)(53936002)(6486002)(64756008)(66446008)(66556008)(4744005)(81156014)(81166006)(8936002)(8676002)(7736002)(46003)(4326008)(6436002)(36756003)(305945005)(52116002)(76176011)(14454004)(256004)(66476007)(2906002)(66946007)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2435;
 H:AM5PR0802MB2500.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: gHp3fs8b6ppcUUXTCiuWDqfMzyqsmTavvUm9e/oBVkGBiIzvG5+Lo37Bte20Oeb4Quok7i3vWLLQtdBzdwmoL1/sPnT6jcKmnO94Kin5zJr+AX77Kiv6BKadf8/yQXyYiET8UEel0yuUymHd7dPxqXZG4n4acDRGIx4ecUem+OAr8DVrHhZaSfLvuDnTbX4jBN7ZZgOmnEB8YCMI+XipDlrovMSPYwxFKfAYCnhkZRn6RGLc5KJsSaXoCvjn2qtl065uh9OaGump5HdGHR3bNjqRv47B0wGWnESy+1aatSfJ2/hxZetw6fMp+8nWxbHJYaTqvboB4V18Bn9DCOp+C+tzhSio7WU3OUnv6qVhK70yhIN+PuwUazDxk97iuB8WWeHZart12QLO22OX/Jv1OQg1xQquiri0IUV+1UbJUdI=
x-ms-exchange-transport-forked: True
Content-ID: <87C0BC79CD41084397C992C7C384FEC0@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2435
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(376002)(2980300002)(199004)(189003)(6512007)(54906003)(76176011)(316002)(4326008)(63370400001)(50466002)(23676004)(86362001)(14454004)(2486003)(76130400001)(36756003)(229853002)(26826003)(386003)(6506007)(63350400001)(25786009)(70206006)(70586007)(6116002)(22756006)(99286004)(478600001)(6246003)(47776003)(31696002)(8676002)(305945005)(336012)(436003)(2906002)(6862004)(2616005)(486006)(53546011)(36906005)(26005)(966005)(126002)(476003)(186003)(102836004)(81156014)(7736002)(5660300002)(31686004)(81166006)(11346002)(356004)(6486002)(4744005)(8936002)(6306002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4951;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 65f85cad-6518-4b4f-4729-08d72b12a49b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB4951; 
NoDisclaimer: True
X-Forefront-PRVS: 0142F22657
X-Microsoft-Antispam-Message-Info: fxO3HWRxWoTEjdflXw7Dmerv74cloc6PXDEyUZUUKgjhzDt8eQtLZBd+UqIltOYTTtDy8qH8nHXENJEvUyjql4qgiOt36qtMjBx8pqHzUEMVf8vDY4/ffovtaBEEoJWx2x1V+wQUT4pgS1Eh8TiWSic3QfCJ07+MgmXyc1SsId2hDRpjK1cAIA1TuH0paJvsIrtnpJsED0vwLO1k83QtLQtPgZvp0LIf6zpMbAgwXUMtRAogRQk8PBXjDBPrf6/fxPNXNEq55m6CXjVWgYOu+4PpF1csSQ9FjCUe4hsoCFGm+386N4KNhc5bM9wcA3Xmb9wUNAOkQdEcAKYB9UcpBV+B0tYUCeHELT5hgc6NbTdWRdmDmXsyGYskT6BshtcPlZe18kAOs7AS/y7O7eBj+EAFO2BFlnVjVt67MK209v8=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2019 17:19:04.3173 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 204f6b61-790d-4459-afc8-08d72b12a938
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4951
Subject: Re: [Xen-devel] [PATCH] arm/traps.c: Adjust HPFAR_EL2 representation
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, nd <nd@arm.com>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDI3LzA4LzIwMTkgMTg6MzMsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6DQo+IEZyb206
IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+DQo+IA0KPiBJbiB0aGUgY29t
bWl0IGFmMTU2ZmYwODU5YzhkMzYyYTU3MDY2NDA2MTRjOWQxMGY2MmFkZjIsIGl0DQo+IHdhcyBs
ZWZ0IHVuYXR0ZW5kZWQgSFBGQVJfRUwyIHJlZ2lzdGVyIG91dHB1dC4gTm93IGl0IGlzIHByaW50
ZWQNCj4gd2l0aCAxNjA4IGRpZ2l0cywgd2hhdCBpcyB3YXkgdG9vIHdpZGUgZXZlbiBmb3IgdGhl
IGJpZ2dlc3QNCj4gbW9uaXRvcnMuIFNvIGNsZWFudXAgZXhjZXNzaXZlIHBhZGRpbmdzLg0KDQpB
IG1vcmUgY29tcGxldGUgcGF0Y2ggKGZpeCBhbm90aGVyIHBsYWNlKSBoYXMgYWxyZWFkeSBiZWVu
IHNlbnQgb24gdGhlIA0KbWFpbGluZyBsaXN0IChzZWUgWzFdKS4gSXQgaXMgd2FpdGluZyBvbiBT
dGVmYW5vJ3MgYWNrIGF0IHRoZSBtb21lbnQuLi4NCg0KQ2hlZXJzLA0KDQpbMV0gDQpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDgvbXNn
MDE0MzkuaHRtbA0KDQoNCi0tIA0KSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
