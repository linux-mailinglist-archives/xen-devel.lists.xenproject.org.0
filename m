Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF7FBE71C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 23:27:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDElP-0001mx-88; Wed, 25 Sep 2019 21:23:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KYcU=XU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDElO-0001ms-5A
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 21:23:54 +0000
X-Inumbo-ID: c5557e52-dfda-11e9-963a-12813bfff9fa
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.41]) by localhost (Halon) with ESMTPS
 id c5557e52-dfda-11e9-963a-12813bfff9fa;
 Wed, 25 Sep 2019 21:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmjQuaGRyRlQZ75qLMY8BXcFrMqK0bUfkjI8/2NbmCk=;
 b=9N62G/o+mXipGINfRpWgBLJX1hn1YbHn+077h0fvejqyA7rMCiQhR1NQFxd9l7o3OKfy4YCRzCSRjp6/qG9DQRAO4iO8uCT3PkljlSNnsWw2qr6te6ODzTE/TSS6n455p9RodLb6P2trkqKKfbjhrY0ctL8DSHA0x8uT95Z6nh4=
Received: from DB6PR0801CA0064.eurprd08.prod.outlook.com (2603:10a6:4:2b::32)
 by AM6PR08MB4103.eurprd08.prod.outlook.com (2603:10a6:20b:a4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Wed, 25 Sep
 2019 21:23:48 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by DB6PR0801CA0064.outlook.office365.com
 (2603:10a6:4:2b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.20 via Frontend
 Transport; Wed, 25 Sep 2019 21:23:48 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=none action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 25 Sep 2019 21:23:46 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Wed, 25 Sep 2019 21:23:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9ae70a09782f9fc4
X-CR-MTA-TID: 64aa7808
Received: from 5d25f16da3ea.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C8190E1-82D6-4800-AFB1-B4B6768E325E.1; 
 Wed, 25 Sep 2019 21:23:41 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5d25f16da3ea.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 25 Sep 2019 21:23:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H36jZEn/bbWKFZZHxRCzHo+R/cZgeh0MlSc9PlP+WDBBFjKQCHrG6hoj8mpW//uwlEMawEcHtlOIDHuQrMXBLWpAf/MZdpOQAaBTEBWvn1Qs3uLUvPjh6WwL57uG3lsR9tEppP5644zCCEXYO833kiCvoyyB2Lill1mfjS5L6vUfSmqKeCC7Rp8pEdI2v9Etzkr22XmrmUP/t8dQOldBZkjBUSZgjt9kqEuMHNvj4LQyHqp5EF8Ebdq+kX0hrNwAOav9bC71WLdtS9KM+F6Qr5QJMpJYYqPfDJ7mUYAH5vYN7V3squuvFrTDHxEbw7R0KKPtbzDXeaJXPzBtyo+XZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmjQuaGRyRlQZ75qLMY8BXcFrMqK0bUfkjI8/2NbmCk=;
 b=Pzy4pSdqYDFsFVpVXxsO7pvKi0ykQOZjo4KRtv5WIPyRKEHOObaFOrkMHwfn5K2vnaI1U+0A+Jx9DZrV7sCAutI+PlYiJSkUVlnLlPYg8HyIxd/pTHTfoaiGdsK2+T3tE8Z69t633kd0VOOKJPDY5oLqZs+6mBrvv8aM83S74wuB5Bu5lkG28tHMc1Xu1tUNLYMehs7mgSZxhhCSgqNGlZnRANbgtQuhWf7EExyCAl1hMAyv7mhgFsffSkedNbg9wm08oqIBM9zfmsRwmIG51qeHqicVi6cSj6HMABiHtky9BW1OpVvsn+6aztK1Q92zo3/QXD91zcp0sXvafU1mqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmjQuaGRyRlQZ75qLMY8BXcFrMqK0bUfkjI8/2NbmCk=;
 b=9N62G/o+mXipGINfRpWgBLJX1hn1YbHn+077h0fvejqyA7rMCiQhR1NQFxd9l7o3OKfy4YCRzCSRjp6/qG9DQRAO4iO8uCT3PkljlSNnsWw2qr6te6ODzTE/TSS6n455p9RodLb6P2trkqKKfbjhrY0ctL8DSHA0x8uT95Z6nh4=
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com (10.175.20.10) by
 VI1PR0802MB2285.eurprd08.prod.outlook.com (10.172.81.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Wed, 25 Sep 2019 21:23:39 +0000
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d]) by VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d%12]) with mapi id 15.20.2284.023; Wed, 25 Sep
 2019 21:23:39 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v5 7/8] xen/arm: introduce nr_spis
Thread-Index: AQHVc9H5ldiyvfJQhECATJdPfl5tIqc851cA
Date: Wed, 25 Sep 2019 21:23:39 +0000
Message-ID: <f801e6ad-442a-c297-603c-19b2a0f6a438@arm.com>
References: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
 <20190925184924.21691-7-sstabellini@kernel.org>
In-Reply-To: <20190925184924.21691-7-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0402CA0017.eurprd04.prod.outlook.com
 (2603:10a6:208:15::30) To VI1PR0802MB2431.eurprd08.prod.outlook.com
 (2603:10a6:800:af::10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4a7d76fe-afcb-4e4d-e71c-08d741fea698
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2285:|VI1PR0802MB2285:|AM6PR08MB4103:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4103E0C64FBA4537011D173980870@AM6PR08MB4103.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
x-forefront-prvs: 01713B2841
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(189003)(199004)(11346002)(8676002)(81156014)(8936002)(446003)(71200400001)(2906002)(4326008)(31696002)(81166006)(66476007)(66446008)(66946007)(64756008)(6246003)(86362001)(71190400001)(186003)(54906003)(6506007)(53546011)(386003)(44832011)(6436002)(76176011)(66556008)(229853002)(26005)(52116002)(3846002)(5660300002)(6486002)(316002)(36756003)(6512007)(25786009)(102836004)(14454004)(99286004)(66066001)(31686004)(6916009)(486006)(7736002)(2616005)(6116002)(476003)(305945005)(256004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2285;
 H:VI1PR0802MB2431.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rjPkUy8Q8CB3h/AxsGY7/0V1m6K254Lxw5x5dszyDlzewCaSRtcepl/zh3/WJBRxeQAiQpnDG3CYXTVfMafmhFD1aR7l4PUr8cE8NBMEGLtlqcZ7qYA2nt0p3FXkRJX+bYu4nYpahscBENW/rDUEpEw9Kd65uaa0urzv+CzNSoWI/3o9q0aM1q0qWn/kRCNQhk7dDKlgi47IfJvTPUOl9cs0fYGYEPbZmOQTCfCP6B1fWqOF0CssqopK5gmh+qN0A97y0JJho97PIn1XCwP37Bzs5C8X0DEDGFe3tjkM6jNmk3IMiImK4fu+Pz5EmAcieGjAyQin0tF7cbfmuzbxSIJuedC92WPwYFbJW9g/+J8q5LGFvwSheb7QmFQuQMgMSced5+PWnV3aQ6W/TYkgL387gIwnyDpIAr4ob71C+Ek=
Content-ID: <DFF7B2B1BD8197458B5DEB3927361C42@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2285
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(136003)(189003)(199004)(54906003)(76176011)(102836004)(22756006)(36756003)(14454004)(186003)(5660300002)(63350400001)(6512007)(50466002)(70586007)(126002)(6862004)(53546011)(6506007)(386003)(4326008)(99286004)(436003)(26005)(3846002)(6116002)(70206006)(446003)(11346002)(486006)(476003)(229853002)(2616005)(2906002)(305945005)(7736002)(76130400001)(36906005)(316002)(107886003)(478600001)(356004)(26826003)(6246003)(86362001)(8936002)(336012)(25786009)(31696002)(8676002)(6486002)(66066001)(47776003)(31686004)(81166006)(81156014)(2486003)(23676004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4103;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3c4a4e9e-2b37-467d-e324-08d741fea200
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR08MB4103; 
NoDisclaimer: True
X-Forefront-PRVS: 01713B2841
X-Microsoft-Antispam-Message-Info: ACAR+A2ZM2uhTCG7M65h1WStq34aU1XF4Aw2CR9OwBTqF3Y+4RrJSlooLg7sWgUG+8lpaqLFiHxc/YQeHbrGyxv2yJXDhKu+3bJHEkn+YK+31QTAyc92qx0BvF6Wt9JkSmi2q9gKeYyR/0kwZDKwFYVJ+6g6pZScNnltfq25Qkt0F2L3qdaF7IYQFdewhIUXgGPWH3L7Rou3TQ59LWAytbb8ccir1FNcBWJ5U9Hx+E2Lb+LwO4VivJkN2KBZ/YIANahzS5fTUM2WViEU+107ZpxaDvqlqd+iUgQ8UP2fO60iwh6sDzpZsZOoxv/1aEXvSoGmd4lEtoqRfuTfa9b/5WNdg5Ok5GqC9rILkgtR0th4yhvu3XmAx3lEZN5FwbLe8/duXEnSZrs1kWKnynlgvoh7AJAsAVR13s/F1dBEnVQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 21:23:46.8191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7d76fe-afcb-4e4d-e71c-08d741fea698
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4103
Subject: Re: [Xen-devel] [PATCH v5 7/8] xen/arm: introduce nr_spis
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

SGksDQoNCk9uIDI1LzA5LzIwMTkgMTk6NDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
V2UgZG9uJ3QgaGF2ZSBhIGNsZWFyIHdheSB0byBrbm93IGhvdyBtYW55IHZpcnR1YWwgU1BJcyB3
ZSBuZWVkIGZvciB0aGUNCj4gZG9tMC1sZXNzIGRvbWFpbnMuIEludHJvZHVjZSBhIG5ldyBvcHRp
b24gdW5kZXIgeGVuLGRvbWFpbiB0byBzcGVjaWZ5DQo+IHRoZSBudW1iZXIgb2YgU1BJcyB0byBh
bGxvY2F0ZSBmb3IgYSBkb21haW4uDQo+IA0KPiBUaGUgcHJvcGVydHkgaXMgb3B0aW9uYWwuIFdo
ZW4gYWJzZW50LCB3ZSdsbCB1c2UgdGhlIHBoeXNpY2FsIG51bWJlciBvZg0KPiBHSUMgbGluZXMg
Zm9yIGRvbTAtbGVzcyBkb21haW5zLCBqdXN0IGxpa2UgZm9yIGRvbTAuDQoNCkJhc2VkIG9uIHRo
ZSBjb2RlIGJlbG93LCB0aGlzIGlzIG5vdCBjb3JyZWN0IHdoZW4gdXNpbmcgdnBsMDExLg0KDQo+
IA0KPiBSZW1vdmUgdGhlIG9sZCBzZXR0aW5nIG9mIG5yX3NwaXMgYmFzZWQgb24gdGhlIHByZXNl
bmNlIG9mIHRoZSB2cGwwMTEuDQo+IA0KPiBUaGUgaW1wbGljYXRpb24gb2YgdGhpcyBjaGFuZ2Ug
aXMgdGhhdCB3aXRob3V0IG5yX3NwaXMgZG9tMGxlc3MgZG9tYWlucw0KPiBnZXQgdGhlIHNhbWUg
YW1vdW50IG9mIFNQSSBhbGxvY2F0ZWQgYXMgZG9tMCwgcmVnYXJkbGVzcyBvZiBob3cgbWFueQ0K
PiBwaHlzaWNhbCBkZXZpY2VzIHRoZXkgaGF2ZSBhc3NpZ25lZCwgYW5kIHJlZ2FyZGxlc3Mgb2Yg
d2hldGhlciB0aGV5IGhhdmUNCj4gYSB2aXJ0dWFsIHBsMDExICh3aGljaCBhbHNvIG5lZWRzIGFu
IGVtdWxhdGVkIFNQSSkuIEZvciBpbnN0YW5jZSwgd2UNCj4gY291bGQgZW5kIHVwIGV4cG9zaW5n
IDI1NiBTUElzIGZvciBlYWNoIGRvbTBsZXNzIGRvbWFpbiB3aXRob3V0IGENCj4gbnJfc3BpcyBw
cm9wZXJ0eS4gSWYgd2UgaGF2ZSA0IGRvbTBsZXNzIGRvbWFpbnMgd2l0aG91dCBucl9zcGlzLCBp
dA0KPiB3b3VsZCByZXN1bHQgaW4gODBLIG9mIGFkZGl0aW9uYWwgbWVtb3J5IGJlaW5nIHVzZWQu
DQoNCkkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGltcGx5IHdpdGgg
eW91ciBleGFtcGxlLiBPaywgDQp0aGlzIHRlbGwgeW91IGhvdyBtdWNoIG1lbW9yeSB5b3UgYXJl
IGdvaW5nIHRvIHdhc3RlLi4uIGJ1dCB0aGlzIGRvZXMgDQpzdGlsbCBub3QgZXhwbGFpbiB3aHkg
dGhlIG5yX3NwaXMgYXJlIGluY3JlYXNlZCBpbiB0aGUgZGVmYXVsdCBjYXNlLg0KDQo+IA0KPiBX
aGVuIG5yX3NwaXMgaXMgcHJlc2VudCwgdGhlIGRvbWFpbiBnZXRzIGV4YWN0bHkgbnJfc3BpcyBh
bGxvY2F0ZWQgU1BJcy4NCj4gSWYgdGhlIG51bWJlciBpcyB0b28gbG93LCBpdCBtaWdodCBub3Qg
YmUgZW5vdWdoIGZvciB0aGUgZGV2aWNlcw0KPiBhc3NpZ25lZCBpdCB0byBpdC4gSWYgdGhlIG51
bWJlciBpcyBsZXNzIHRoYW4gR1VFU1RfVlBMMDExX1NQSSwgdGhlDQo+IHZpcnR1YWwgcGwwMTEg
d29uJ3Qgd29yay4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3Rl
ZmFub3NAeGlsaW54LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xv
ZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjU6DQo+IC0gaW1w
cm92ZSBjb21taXQgbWVzc2FnZQ0KPiAtIGFsbG9jYXRlIGVub3VnaCBTUElzIGZvciB2cGwwMTEN
Cj4gDQo+IENoYW5nZXMgaW4gdjQ6DQo+IC0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQ0KPiANCj4g
Q2hhbmdlcyBpbiB2MzoNCj4gLSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlDQo+IC0gaW50cm9kdWNl
IG5yX3NwaXMNCj4gLS0tDQo+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMTcgKysr
KysrKysrKysrKy0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gaW5kZXggNDE0ODkzYmMyNC4uYmY0
ZDk2MGViNSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ICsr
KyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiBAQCAtMjM0NSw3ICsyMzQ1LDYgQEAg
dm9pZCBfX2luaXQgY3JlYXRlX2RvbVVzKHZvaWQpDQo+ICAgICAgICAgICBzdHJ1Y3QgZG9tYWlu
ICpkOw0KPiAgICAgICAgICAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIGRfY2ZnID0g
ew0KPiAgICAgICAgICAgICAgIC5hcmNoLmdpY192ZXJzaW9uID0gWEVOX0RPTUNUTF9DT05GSUdf
R0lDX05BVElWRSwNCj4gLSAgICAgICAgICAgIC5hcmNoLm5yX3NwaXMgPSAwLA0KPiAgICAgICAg
ICAgICAgIC5mbGFncyA9IFhFTl9ET01DVExfQ0RGX2h2bSB8IFhFTl9ET01DVExfQ0RGX2hhcCB8
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgWEVOX0RPTUNUTF9DREZfaW9tbXUsDQo+ICAgICAg
ICAgICAgICAgLm1heF9ldnRjaG5fcG9ydCA9IC0xLA0KPiBAQCAtMjM1NiwxMyArMjM1NSwyMyBA
QCB2b2lkIF9faW5pdCBjcmVhdGVfZG9tVXModm9pZCkNCj4gICAgICAgICAgIGlmICggIWR0X2Rl
dmljZV9pc19jb21wYXRpYmxlKG5vZGUsICJ4ZW4sZG9tYWluIikgKQ0KPiAgICAgICAgICAgICAg
IGNvbnRpbnVlOw0KPiAgIA0KPiAtICAgICAgICBpZiAoIGR0X3Byb3BlcnR5X3JlYWRfYm9vbChu
b2RlLCAidnBsMDExIikgKQ0KPiAtICAgICAgICAgICAgZF9jZmcuYXJjaC5ucl9zcGlzID0gR1VF
U1RfVlBMMDExX1NQSSAtIDMyICsgMTsNCj4gLQ0KPiAgICAgICAgICAgaWYgKCAhZHRfcHJvcGVy
dHlfcmVhZF91MzIobm9kZSwgImNwdXMiLCAmZF9jZmcubWF4X3ZjcHVzKSApDQo+ICAgICAgICAg
ICAgICAgcGFuaWMoIk1pc3NpbmcgcHJvcGVydHkgJ2NwdXMnIGZvciBkb21haW4gJXNcbiIsDQo+
ICAgICAgICAgICAgICAgICAgICAgZHRfbm9kZV9uYW1lKG5vZGUpKTsNCj4gICANCj4gKyAgICAg
ICAgaWYgKCAhZHRfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgIm5yX3NwaXMiLCAmZF9jZmcuYXJj
aC5ucl9zcGlzKSApDQo+ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAgIGRfY2ZnLmFyY2gubnJf
c3BpcyA9IGdpY19udW1iZXJfbGluZXMoKSAtIDMyOw0KPiArDQo+ICsgICAgICAgICAgICAvKg0K
PiArICAgICAgICAgICAgICogdnBsMDExIHVzZXMgb25lIGVtdWxhdGVkIFNQSS4gSWYgdnBsMDEx
IGlzIHJlcXVlc3RlZCwgbWFrZQ0KPiArICAgICAgICAgICAgICogc3VyZSB0aGF0IHdlIGFsbG9j
YXRlIGVub3VnaCBTUElzIGZvciBpdC4NCj4gKyAgICAgICAgICAgICAqLw0KPiArICAgICAgICAg
ICAgaWYgKCBkdF9wcm9wZXJ0eV9yZWFkX2Jvb2wobm9kZSwgInZwbDAxMSIpICkNCj4gKyAgICAg
ICAgICAgICAgICBkX2NmZy5hcmNoLm5yX3NwaXMgPSBNQVgoZF9jZmcuYXJjaC5ucl9zcGlzLA0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHVUVTVF9WUEwwMTFf
U1BJIC0gMzIgKyAxKTsNCj4gKyAgICAgICAgfQ0KPiArDQo+ICAgICAgICAgICBkID0gZG9tYWlu
X2NyZWF0ZSgrK21heF9pbml0X2RvbWlkLCAmZF9jZmcsIGZhbHNlKTsNCj4gICAgICAgICAgIGlm
ICggSVNfRVJSKGQpICkNCj4gICAgICAgICAgICAgICBwYW5pYygiRXJyb3IgY3JlYXRpbmcgZG9t
YWluICVzXG4iLCBkdF9ub2RlX25hbWUobm9kZSkpOw0KPiANCg0KQ2hlZXJzLA0KDQotLSANCkp1
bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
