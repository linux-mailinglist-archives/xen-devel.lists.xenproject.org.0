Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5906EBE6F2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 23:16:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDEb5-0000sw-27; Wed, 25 Sep 2019 21:13:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KYcU=XU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDEb3-0000sr-9B
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 21:13:13 +0000
X-Inumbo-ID: 46dc4a35-dfd9-11e9-963a-12813bfff9fa
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.58]) by localhost (Halon) with ESMTPS
 id 46dc4a35-dfd9-11e9-963a-12813bfff9fa;
 Wed, 25 Sep 2019 21:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3CYOLkz/k4w5VpIEX636zX5WQPQ/TwusKMCVOfwc5s=;
 b=sBV3FX7O1fCpJPHaPAINPX+fQTQ2CzbGIylHILtHfZwFt7ZkYGeEzvKIEl/9r4ORqwwKtkzuD4gNTZrOOtPAC005Yg0hGO89czP5gBjxJjdiOfgvs6y8nZme7SyG+8Ib0zb3RSJChEp8Z/9m5bip0xVj0TgwD8rBeR37p4TIXO4=
Received: from AM6PR08CA0007.eurprd08.prod.outlook.com (2603:10a6:20b:b2::19)
 by DB7PR08MB2970.eurprd08.prod.outlook.com (2603:10a6:5:17::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18; Wed, 25 Sep
 2019 21:13:08 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by AM6PR08CA0007.outlook.office365.com
 (2603:10a6:20b:b2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 25 Sep 2019 21:13:07 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=none action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 25 Sep 2019 21:13:06 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Wed, 25 Sep 2019 21:13:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a5f6e4a32d56ad2b
X-CR-MTA-TID: 64aa7808
Received: from e45faf0d325f.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0372F7FA-4368-4F2D-8551-372884965AA9.1; 
 Wed, 25 Sep 2019 21:12:58 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e45faf0d325f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 25 Sep 2019 21:12:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQ8EQ066cCmdtbwjIS/k9tLvMce9Gk9ApDHY5hxQf7EOtc6Qzq4d+g5BXbVZMU8ZjZjDoRy1DIFh5Exbu7RFLAUZtHbTfjojQcWuoWSv6PZ/xw0E/W/Gu6aMZfdC+troTMwdK6n/nwe+Ew6izfTS/Xg+l/kTsAOGzdPXl135ZmVN+R6l1GqVyFkDdIyoGBQg1qOJ2gh1Q3ifa/ztGeap3/Zu01n2XnNUreXP/Ksit8maQW+IKatfrhmGdn52Xj/3lUOk5JQxprmp6l1s4zmjk+xFZxdJX2CqLwtuNfmv96VBQsRXKD/xhY3MWNFnV4N0RVX7X3WosZTfTwt1RjTV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3CYOLkz/k4w5VpIEX636zX5WQPQ/TwusKMCVOfwc5s=;
 b=NNZvcueG6Rv8ST2LTNpbmHTLjutt0xcuZZ1TQVaA2WoIba8AT9YWwITgeiu18b5j+vgP4yaKGN5hv+EuIRA+PbFa6MwqbdHGqCGDaAyXadKqNdT7FyrOpIWaggDMGcgpdg/u6N+DzpAfrJoFvO1NWKom2NhXNxheCp+qPDavZPOHkWKJlfyCP7YcaciSBBEeAs+bXVfoE81tJJTyuLb7OzDzB0P8qG/JHzDbZq62B9chHTYnz+5XmuPoBj3Vz6eEdS/h7e9d5zDbRguU+ecWrE+bphW8tfjfqXNLWnJKmMMbnJBgIS+82OEfuNAizSkeuv8fFPZ5ZGfhEwqaU1VHLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3CYOLkz/k4w5VpIEX636zX5WQPQ/TwusKMCVOfwc5s=;
 b=sBV3FX7O1fCpJPHaPAINPX+fQTQ2CzbGIylHILtHfZwFt7ZkYGeEzvKIEl/9r4ORqwwKtkzuD4gNTZrOOtPAC005Yg0hGO89czP5gBjxJjdiOfgvs6y8nZme7SyG+8Ib0zb3RSJChEp8Z/9m5bip0xVj0TgwD8rBeR37p4TIXO4=
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com (10.175.20.10) by
 VI1PR0802MB2623.eurprd08.prod.outlook.com (10.175.25.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 21:12:55 +0000
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d]) by VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d%12]) with mapi id 15.20.2284.023; Wed, 25 Sep
 2019 21:12:55 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v5 5/8] xen/arm: assign devices to boot domains
Thread-Index: AQHVc9H5tbWV79MYzkyfQYK3VyEBxKc85FcA
Date: Wed, 25 Sep 2019 21:12:55 +0000
Message-ID: <0eef5f6f-a8f2-4a6c-745f-56a16314d3ac@arm.com>
References: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
 <20190925184924.21691-5-sstabellini@kernel.org>
In-Reply-To: <20190925184924.21691-5-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR05CA0036.eurprd05.prod.outlook.com (2603:10a6:205::49)
 To VI1PR0802MB2431.eurprd08.prod.outlook.com
 (2603:10a6:800:af::10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8a2e57b5-a082-4c2c-61e5-08d741fd28bc
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2623; 
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2623:|VI1PR0802MB2623:|DB7PR08MB2970:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB2970D6385196FE31BD80887E80870@DB7PR08MB2970.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:983;OLM:983;
x-forefront-prvs: 01713B2841
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(189003)(199004)(486006)(2616005)(476003)(11346002)(316002)(229853002)(66556008)(6512007)(6436002)(54906003)(66066001)(6486002)(14444005)(71200400001)(14454004)(31686004)(36756003)(8676002)(71190400001)(6246003)(81166006)(8936002)(478600001)(31696002)(81156014)(256004)(66946007)(66446008)(64756008)(5660300002)(86362001)(66476007)(76176011)(4326008)(6116002)(3846002)(53546011)(52116002)(102836004)(26005)(386003)(6506007)(446003)(7736002)(99286004)(305945005)(6916009)(2906002)(25786009)(186003)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2623;
 H:VI1PR0802MB2431.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 8pXPDyzeycFTKzVWgsSm2uA4wTXhoQNPokz0Qe1nc2teipKhVDTRKqhOo7EKyPdQ9+AMyvhhiZ4wSsBPEzEY82/zvajIAQygPXLnJ8NCzQR6vMC4FLbfihJWYWUSomjUGGsctK3qaiAlmlD7jmiRFUPRKmCYzSQ5BVkLmwFMuBGWM8JCmI8WYbXj9wURDojcaKbn3LAbZkwwdI4GjUS+XRiBa53sTaU8IV06AUDcHBM8jF5T5NWi1J0FM2euuPyVzk3SZmsGbEW+Y9s81ktmDsEi0zlgI3M08z8XrYyZxoJinb0X3nqzpiX77FadJjLhPMvmlaDyfSTPzazM5LXNwIPOPpAGYlHoC3xkMpbBgdg0a05yGGcUqp0Lj6rN1h9+8k0FaEyzFKz9zeSiUIyDpQjJqSVCKl7INymW35Gi+jE=
Content-ID: <27D520F8B1480448BF8079B11AA2DBAB@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2623
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(189003)(199004)(99286004)(36906005)(126002)(2616005)(86362001)(14444005)(66066001)(70586007)(316002)(54906003)(102836004)(70206006)(476003)(356004)(76130400001)(23676004)(36756003)(6512007)(8936002)(446003)(107886003)(6506007)(31696002)(76176011)(478600001)(7736002)(5660300002)(2486003)(25786009)(305945005)(8676002)(47776003)(26826003)(53546011)(26005)(50466002)(11346002)(386003)(6116002)(81156014)(3846002)(4326008)(2906002)(63350400001)(14454004)(186003)(436003)(31686004)(336012)(486006)(6862004)(22756006)(6486002)(81166006)(229853002)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB2970;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f2398d19-b7c3-421b-bad2-08d741fd222b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB7PR08MB2970; 
NoDisclaimer: True
X-Forefront-PRVS: 01713B2841
X-Microsoft-Antispam-Message-Info: 3p99Fbb1eCebpOIbkxT4uSTTKdu9DH6WdAepFNucu1BPc7ywfy5HOjHl9urIkdZfVcvD8Wsol2pdYgU8thSiZp3/ipf4zjfI3I8TUqVqkmDYcTpHmw91l8/pTLoo1578yFuWzyqorC7KgRpWNZEXmtguz/R6+oC6AOZYd8Du4AFe7wMjfiZWphT1HKU84xL1pfQwpu8zpUg+vFfboOfUlym2ucksRSduGJlZXs7pJGLA2oKFvLvN5DK4NZKwDrSqUiEMRAQ7shpEq7HyK1u5r4te+0rryH/e+HYPW1o8Hpx2uBoevkn7dnGQF5cidPSwIqXAGzgwPOi1AsXvgyqNqxS1BuA0K1BXpURgIBTOwNVP6o7MaYq69KUnra1e1Zbo2DO3dlQ5U46KCSdTQtIW488FrX045nXRjtplt6dEH8M=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 21:13:06.1399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2e57b5-a082-4c2c-61e5-08d741fd28bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2970
Subject: Re: [Xen-devel] [PATCH v5 5/8] xen/arm: assign devices to boot
 domains
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Achin Gupta <Achin.Gupta@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, nd <nd@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywNCg0KT24gMjUvMDkvMjAxOSAxOTo0OSwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPiBTY2FuIHRoZSB1c2VyIHByb3ZpZGVkIGR0YiBmcmFnbWVudCBhdCBib290LiBGb3Ig
ZWFjaCBkZXZpY2Ugbm9kZSwgbWFwDQo+IG1lbW9yeSB0byBndWVzdHMsIGFuZCByb3V0ZSBpbnRl
cnJ1cHRzIGFuZCBzZXR1cCB0aGUgaW9tbXUuDQo+IA0KPiBUaGUgbWVtb3J5IHJlZ2lvbiB0byBy
ZW1hcCBpcyBzcGVjaWZpZWQgYnkgdGhlICJ4ZW4scmVnIiBwcm9wZXJ0eS4NCj4gDQo+IFRoZSBp
b21tdSBpcyBzZXR1cCBieSBwYXNzaW5nIHRoZSBub2RlIG9mIHRoZSBkZXZpY2UgdG8gYXNzaWdu
IG9uIHRoZQ0KPiBob3N0IGRldmljZSB0cmVlLiBUaGUgcGF0aCBpcyBzcGVjaWZpZWQgaW4gdGhl
IGRldmljZSB0cmVlIGZyYWdtZW50IGFzDQo+IHRoZSAieGVuLHBhdGgiIHN0cmluZyBwcm9wZXJ0
eS4NCj4gDQo+IFRoZSBpbnRlcnJ1cHRzIGFyZSByZW1hcHBlZCBiYXNlZCBvbiB0aGUgaW5mb3Jt
YXRpb24gZnJvbSB0aGUNCj4gY29ycmVzcG9uZGluZyBub2RlIG9uIHRoZSBob3N0IGRldmljZSB0
cmVlLiBDYWxsDQo+IGhhbmRsZV9kZXZpY2VfaW50ZXJydXB0cyB0byByZW1hcCBpbnRlcnJ1cHRz
LiBJbnRlcnJ1cHRzIHJlbGF0ZWQgZGV2aWNlDQo+IHRyZWUgcHJvcGVydGllcyBhcmUgY29waWVk
IGZyb20gdGhlIGRldmljZSB0cmVlIGZyYWdtZW50LCBzYW1lIGFzIGFsbA0KPiB0aGUgb3RoZXIg
cHJvcGVydGllcy4NCj4gDQo+IEFsc28gYWRkIHRoZSBuZXcgZmxhZyBYRU5fRE9NQ1RMX0NERl9p
b21tdSB0byB0aGF0IGRvbTBsZXNzIGRvbVUgY2FuIHVzZQ0KPiB0aGUgSU9NTVUuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+DQo+
IC0tLQ0KPiBDaGFuZ2VzIGluIHY1Og0KPiAtIHVzZSBsb2NhbCB2YXJpYWJsZSBmb3IgbmFtZQ0K
PiAtIHVzZSBtYXBfcmVnaW9uc19wMm10DQo+IC0gYWRkIHdhcm5pbmcgZm9yIG5vdCBwYWdlIGFs
aWduZWQgYWRkcmVzc2VzL3NpemVzDQo+IC0gaW50cm9kdWNlIGhhbmRsZV9wYXNzdGhyb3VnaF9w
cm9wDQo+IA0KPiBDaGFuZ2VzIGluIHY0Og0KPiAtIHVzZSB1bnNpZ25lZA0KPiAtIGltcHJvdmUg
Y29tbWl0IG1lc3NhZ2UNCj4gLSBjb2RlIHN0eWxlDQo+IC0gdXNlIGR0X3Byb3BfY21wDQo+IC0g
dXNlIGRldmljZV90cmVlX2dldF9yZWcNCj4gLSBkb24ndCBjb3B5IG92ZXIgeGVuLHJlZyBhbmQg
eGVuLHBhdGgNCj4gLSBkb24ndCBjcmVhdGUgc3BlY2lhbCBpbnRlcnJ1cHQgcHJvcGVydGllcyBm
b3IgZG9tVTogY29weSB0aGVtIGZyb20gdGhlDQo+ICAgIGZyYWdtZW50DQo+IC0gaW4tY29kZSBj
b21tZW50DQo+IA0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIGltcHJvdmUgY29tbWl0IG1lc3NhZ2UN
Cj4gLSByZW1vdmUgc3VwZXJmbHVvdXMgY2FzdA0KPiAtIG1lcmdlIGNvZGUgd2l0aCB0aGUgY29w
eSBjb2RlDQo+IC0gYWRkIGludGVycnVwLXBhcmVudA0KPiAtIGRlbW92ZSBkZXB0aCA+IDIgY2hl
Y2sNCj4gLSByZXVzZSBjb2RlIGZyb20gaGFuZGxlX2RldmljZV9pbnRlcnJ1cHRzDQo+IC0gY29w
eSBpbnRlcnJ1cHRzIGZyb20gaG9zdCBkdA0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSByZW5h
bWUgInBhdGgiIHRvICJ4ZW4scGF0aCINCj4gLSBncmFtbWFyIGZpeA0KPiAtIHVzZSBnYWRkcl90
b19nZm4gYW5kIG1hZGRyX3RvX21mbg0KPiAtIHJlbW92ZSBkZXB0aCA8PSAyIGxpbWl0YXRpb24g
aW4gc2Nhbm5pbmcgdGhlIGR0YiBmcmFnbWVudA0KPiAtIGludHJvZHVjZSBhbmQgcGFyc2UgeGVu
LHJlZw0KPiAtIGNvZGUgc3R5bGUNCj4gLSBzdXBwb3J0IG1vcmUgdGhhbiBvbmUgaW50ZXJydXB0
IHBlciBkZXZpY2UNCj4gLSBzcGVjaWZ5IG9ubHkgdGhlIEdJQyBpcyBzdXBwb3J0ZWQNCj4gLS0t
DQo+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMTAxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA5NyBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiBpbmRleCA5ZDk4NWQzYmJl
Li40MTQ4OTNiYzI0IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMN
Cj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+IEBAIC0xNzAxLDYgKzE3MDEs
ODUgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV92cGwwMTFfdWFydF9ub2RlKHN0cnVjdCBrZXJu
ZWxfaW5mbyAqa2luZm8pDQo+ICAgfQ0KPiAgICNlbmRpZg0KPiAgIA0KPiArLyoNCj4gKyAqIFNj
YW4gZGV2aWNlIHRyZWUgcHJvcGVydGllcyBmb3IgcGFzc3Rocm91Z2ggc3BlY2lmaWMgaW5mb3Jt
YXRpb24uDQo+ICsgKiBSZXR1cm5zIC1FTk9FTlQgd2hlbiBubyBwYXNzdGhyb3VnaCBwcm9wZXJ0
aWVzIGFyZSBmb3VuZA0KPiArICogICAgICAgICA8IDAgb24gZXJyb3INCj4gKyAqICAgICAgICAg
MCBvbiBzdWNjZXNzDQo+ICsgKi8NCj4gK3N0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9wYXNzdGhy
b3VnaF9wcm9wKHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZmR0X3Byb3BlcnR5ICpwcm9w
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hh
ciAqbmFtZSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQzMl90IGFkZHJlc3NfY2VsbHMsIHVpbnQzMl90IHNpemVfY2VsbHMpDQo+ICt7DQo+ICsgICAg
Y29uc3QgX19iZTMyICpjZWxsOw0KPiArICAgIHVuc2lnbmVkIGludCBpLCBsZW47DQo+ICsgICAg
c3RydWN0IGR0X2RldmljZV9ub2RlICpub2RlOw0KPiArICAgIGludCByZXM7DQo+ICsNCj4gKyAg
ICAvKiB4ZW4scmVnIHNwZWNpZmllcyB3aGVyZSB0byBtYXAgdGhlIE1NSU8gcmVnaW9uICovDQo+
ICsgICAgaWYgKCBkdF9wcm9wX2NtcCgieGVuLHJlZyIsIG5hbWUpID09IDAgKQ0KPiArICAgIHsN
Cj4gKyAgICAgICAgcGFkZHJfdCBtc3RhcnQsIHNpemUsIGdzdGFydDsNCj4gKyAgICAgICAgY2Vs
bCA9IChjb25zdCBfX2JlMzIgKilwcm9wLT5kYXRhOw0KPiArICAgICAgICBsZW4gPSBmZHQzMl90
b19jcHUocHJvcC0+bGVuKSAvDQo+ICsgICAgICAgICAgICAoKGFkZHJlc3NfY2VsbHMgKiAyICsg
c2l6ZV9jZWxscykgKiBzaXplb2YodWludDMyX3QpKTsNCj4gKw0KPiArICAgICAgICBmb3IgKCBp
ID0gMDsgaSA8IGxlbjsgaSsrICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAgZGV2aWNl
X3RyZWVfZ2V0X3JlZygmY2VsbCwgYWRkcmVzc19jZWxscywgc2l6ZV9jZWxscywNCj4gKyAgICAg
ICAgICAgICAgICAgICAgJm1zdGFydCwgJnNpemUpOw0KPiArICAgICAgICAgICAgZ3N0YXJ0ID0g
ZHRfbmV4dF9jZWxsKGFkZHJlc3NfY2VsbHMsICZjZWxsKTsNCj4gKw0KPiArICAgICAgICAgICAg
aWYgKCBnc3RhcnQgJiB+UEFHRV9NQVNLIHx8IG1zdGFydCAmIH5QQUdFX01BU0sgfHwgc2l6ZSAm
IH5QQUdFX01BU0sgKQ0KPiArICAgICAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX1dBUk5JTkcs
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAiRG9tVSBwYXNzdGhyb3VnaCBjb25maWcgaGFz
IG5vdCBwYWdlIGFsaWduZWQgYWRkcmVzc2VzL3NpemVzXG4iKTsNCg0KSSBkb24ndCB0aGluayB0
aGlzIGlzIHdpc2UgdG8gY29udGludWUsIHRoZSBtb3JlIHRoaXMgaXMgYSBwcmludGsgdGhhdCAN
CmNhbiBvbmx5IGhhcHBlbiBpbiBkZWJ1ZyBidWlsZC4gU28gc29tZW9uZSB1c2luZyBhIHJlbGVh
c2UgYnVpbGQgbWF5IG5vdCANCm5vdGljZSB0aGUgZXJyb3IuDQoNClNvIEkgdGhpbmsgdGhpcyB3
YW50cyB0byBiZSBhIHByaW50ayhYRU5MT0dfRVJSLC4uLikgYW5kIGFsc28gcmV0dXJuIGFuIA0K
ZXJyb3IuDQoNCj4gKw0KPiArICAgICAgICAgICAgcmVzID0gbWFwX3JlZ2lvbnNfcDJtdChraW5m
by0+ZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgZ2FkZHJfdG9fZ2ZuKGdzdGFydCksDQo+ICsg
ICAgICAgICAgICAgICAgICAgIFBGTl9ET1dOKHNpemUpLA0KPiArICAgICAgICAgICAgICAgICAg
ICBtYWRkcl90b19tZm4obXN0YXJ0KSwNCj4gKyAgICAgICAgICAgICAgICAgICAgcDJtX21taW9f
ZGlyZWN0X2Rldik7DQoNCkNvZGluZyBzdHlsZS4NCg0KPiArICAgICAgICAgICAgaWYgKCByZXMg
PCAwICkNCj4gKyAgICAgICAgICAgIHsNCj4gKyAgICAgICAgICAgICAgICBkcHJpbnRrKFhFTkxP
R19FUlIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIG1hcCAlIlBSSXBh
ZGRyIiB0byB0aGUgZ3Vlc3QgYXQlIlBSSXBhZGRyIlxuIiwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgIG1zdGFydCwgZ3N0YXJ0KTsNCg0KU2ltaWxhcmx5LCB0aGlzIHdhbnRzIHRvIGJlIGEg
cHJpbnRrLg0KDQo+ICsgICAgICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7DQo+ICsgICAgICAg
ICAgICB9DQo+ICsgICAgICAgIH0NCj4gKw0KPiArICAgICAgICByZXR1cm4gMDsNCj4gKyAgICB9
DQo+ICsgICAgLyoNCj4gKyAgICAgKiB4ZW4scGF0aCBzcGVjaWZpZXMgdGhlIGNvcnJlc3BvbmRp
bmcgbm9kZSBpbiB0aGUgaG9zdCBEVC4NCj4gKyAgICAgKiBCb3RoIGludGVycnVwdCBtYXBwaW5n
cyBhbmQgSU9NTVUgc2V0dGluZ3MgYXJlIGJhc2VkIG9uIGl0LA0KPiArICAgICAqIGFzIHRoZXkg
YXJlIGRvbmUgYmFzZWQgb24gdGhlIGNvcnJlc3BvbmRpbmcgaG9zdCBEVCBub2RlLg0KPiArICAg
ICAqLw0KPiArICAgIGVsc2UgaWYgKCBkdF9wcm9wX2NtcCgieGVuLHBhdGgiLCBuYW1lKSA9PSAw
ICkNCj4gKyAgICB7DQo+ICsgICAgICAgIG5vZGUgPSBkdF9maW5kX25vZGVfYnlfcGF0aChwcm9w
LT5kYXRhKTsNCj4gKyAgICAgICAgaWYgKCBub2RlID09IE5VTEwgKQ0KPiArICAgICAgICB7DQo+
ICsgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsICJDb3VsZG4ndCBmaW5kIG5vZGUgJXMg
aW4gaG9zdF9kdCFcbiIsDQo+ICsgICAgICAgICAgICAgICAgICAgIChjaGFyICopcHJvcC0+ZGF0
YSk7DQoNClNhbWUgaGVyZS4NCg0KPiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsg
ICAgICAgIH0NCj4gKw0KPiArICAgICAgICByZXMgPSBpb21tdV9hc3NpZ25fZHRfZGV2aWNlKGtp
bmZvLT5kLCBub2RlKTsNCj4gKyAgICAgICAgaWYgKCByZXMgPCAwICkNCj4gKyAgICAgICAgICAg
IHJldHVybiByZXM7DQo+ICsNCj4gKyAgICAgICAgcmVzID0gaGFuZGxlX2RldmljZV9pbnRlcnJ1
cHRzKGtpbmZvLT5kLCBub2RlLCB0cnVlKTsNCj4gKyAgICAgICAgaWYgKCByZXMgPCAwICkNCj4g
KyAgICAgICAgICAgIHJldHVybiByZXM7DQo+ICsNCj4gKyAgICAgICAgcmV0dXJuIDA7DQo+ICsg
ICAgfQ0KPiArDQo+ICsgICAgcmV0dXJuIC1FTk9FTlQ7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMg
aW50IF9faW5pdCBoYW5kbGVfcHJvcF9wZmR0KHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB2b2lkICpwZmR0LCBp
bnQgbm9kZW9mZiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQz
Ml90IGFkZHJlc3NfY2VsbHMsIHVpbnQzMl90IHNpemVfY2VsbHMsDQo+IEBAIC0xNzA5LDYgKzE3
ODgsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfcHJvcF9wZmR0KHN0cnVjdCBrZXJuZWxf
aW5mbyAqa2luZm8sDQo+ICAgICAgIHZvaWQgKmZkdCA9IGtpbmZvLT5mZHQ7DQo+ICAgICAgIGlu
dCBwcm9wb2ZmLCBuYW1lb2ZmLCByZXM7DQo+ICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVy
dHkgKnByb3A7DQo+ICsgICAgY29uc3QgY2hhciAqbmFtZTsNCj4gICANCj4gICAgICAgZm9yICgg
cHJvcG9mZiA9IGZkdF9maXJzdF9wcm9wZXJ0eV9vZmZzZXQocGZkdCwgbm9kZW9mZik7DQo+ICAg
ICAgICAgICAgIHByb3BvZmYgPj0gMDsNCj4gQEAgLTE3MTcsMTEgKzE3OTcsMjMgQEAgc3RhdGlj
IGludCBfX2luaXQgaGFuZGxlX3Byb3BfcGZkdChzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0K
PiAgICAgICAgICAgaWYgKCAhKHByb3AgPSBmZHRfZ2V0X3Byb3BlcnR5X2J5X29mZnNldChwZmR0
LCBwcm9wb2ZmLCBOVUxMKSkgKQ0KPiAgICAgICAgICAgICAgIHJldHVybiAtRkRUX0VSUl9JTlRF
Uk5BTDsNCj4gICANCj4gKyAgICAgICAgcmVzID0gMDsNCj4gICAgICAgICAgIG5hbWVvZmYgPSBm
ZHQzMl90b19jcHUocHJvcC0+bmFtZW9mZik7DQo+IC0gICAgICAgIHJlcyA9IGZkdF9wcm9wZXJ0
eShmZHQsIGZkdF9zdHJpbmcocGZkdCwgbmFtZW9mZiksDQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICBwcm9wLT5kYXRhLCBmZHQzMl90b19jcHUocHJvcC0+bGVuKSk7DQo+IC0gICAgICAg
IGlmICggcmVzICkNCj4gKyAgICAgICAgbmFtZSA9IGZkdF9zdHJpbmcocGZkdCwgbmFtZW9mZik7
DQo+ICsNCj4gKyAgICAgICAgaWYgKCBzY2FuX3Bhc3N0aHJvdWdoX3Byb3AgKQ0KPiArICAgICAg
ICAgICAgcmVzID0gaGFuZGxlX3Bhc3N0aHJvdWdoX3Byb3Aoa2luZm8sIHByb3AsIG5hbWUsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGRyZXNzX2NlbGxz
LCBzaXplX2NlbGxzKTsNCj4gKyAgICAgICAgaWYgKCByZXMgPCAwICYmIHJlcyAhPSAtRU5PRU5U
ICkNCj4gICAgICAgICAgICAgICByZXR1cm4gcmVzOw0KPiArDQo+ICsgICAgICAgIC8qIGNvcHkg
YWxsIG90aGVyIHByb3BlcnRpZXMgKi8NCj4gKyAgICAgICAgaWYgKCAhc2Nhbl9wYXNzdGhyb3Vn
aF9wcm9wIHx8IHJlcyA9PSAtRU5PRU5UICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAg
cmVzID0gZmR0X3Byb3BlcnR5KGZkdCwgbmFtZSwgcHJvcC0+ZGF0YSwgZmR0MzJfdG9fY3B1KHBy
b3AtPmxlbikpOw0KPiArICAgICAgICAgICAgaWYgKCByZXMgKQ0KPiArICAgICAgICAgICAgICAg
IHJldHVybiByZXM7DQo+ICsgICAgICAgIH0NCj4gICAgICAgfQ0KPiAgIA0KPiAgICAgICAvKiBG
RFRfRVJSX05PVEZPVU5EID0+IFRoZXJlIGlzIG5vIG1vcmUgcHJvcGVydGllcyBmb3IgdGhpcyBu
b2RlICovDQo+IEBAIC0yMjU0LDcgKzIzNDYsOCBAQCB2b2lkIF9faW5pdCBjcmVhdGVfZG9tVXMo
dm9pZCkNCj4gICAgICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiBkX2NmZyA9
IHsNCj4gICAgICAgICAgICAgICAuYXJjaC5naWNfdmVyc2lvbiA9IFhFTl9ET01DVExfQ09ORklH
X0dJQ19OQVRJVkUsDQo+ICAgICAgICAgICAgICAgLmFyY2gubnJfc3BpcyA9IDAsDQo+IC0gICAg
ICAgICAgICAuZmxhZ3MgPSBYRU5fRE9NQ1RMX0NERl9odm0gfCBYRU5fRE9NQ1RMX0NERl9oYXAs
DQo+ICsgICAgICAgICAgICAuZmxhZ3MgPSBYRU5fRE9NQ1RMX0NERl9odm0gfCBYRU5fRE9NQ1RM
X0NERl9oYXAgfA0KPiArICAgICAgICAgICAgICAgICAgICAgWEVOX0RPTUNUTF9DREZfaW9tbXUs
DQoNClRoaXMgd2lsbCBicmVhayBkb20wbGVzcyBvbiBwbGF0Zm9ybSB3aXRob3V0IGFuIElPTU1V
IGJlY2F1c2Ugc2V0dGluZyANCkNERl9pb21tdSBmb3IgdGhlbSB3aWxsIGJlIGludmFsaWQuDQoN
CkkgYWxzbyBkb24ndCB0aGluayB0aGlzIGlzIHdpc2UgdG8gYWx3YXlzIGVuYWJsZSB0aGUgSU9N
TVUuIFRoaXMgc2hvdWxkIA0Kb25seSBiZSBkb25lIGlmIHRoZXJlIGlzIGEgcGFydGlhbCBkZXZp
Y2UtdHJlZSBwcmVzZW50IChtb3N0IGxpa2VseSBpdCANCm1lYW5zIHBhc3N0aHJvdWdoIHdpbGwg
YmUgdXNlZCkuDQoNCj4gICAgICAgICAgICAgICAubWF4X2V2dGNobl9wb3J0ID0gLTEsDQo+ICAg
ICAgICAgICAgICAgLm1heF9ncmFudF9mcmFtZXMgPSA2NCwNCj4gICAgICAgICAgICAgICAubWF4
X21hcHRyYWNrX2ZyYW1lcyA9IDEwMjQsDQo+IA0KDQpDaGVlcnMsDQoNCi0tIA0KSnVsaWVuIEdy
YWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
