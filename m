Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BBEBE6B3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 22:54:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDEFW-0007LB-80; Wed, 25 Sep 2019 20:50:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KYcU=XU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDEFT-0007L5-UY
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 20:50:56 +0000
X-Inumbo-ID: 2a4b639e-dfd6-11e9-963a-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.56]) by localhost (Halon) with ESMTPS
 id 2a4b639e-dfd6-11e9-963a-12813bfff9fa;
 Wed, 25 Sep 2019 20:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gj8NxgmWfoptoiMWslR0ktlxYswun8cpzjOxOEbfVKc=;
 b=j6uNnE77X2Iv7hYmOgm0zfKL2pcgIA9mWMKF9id9Ra6Xm4bP8J+BUu3jcvj2SOhdBh7E6C7/ZVYPKL3NYqpYyVq7ZmFJGVFZ7KYPIJgXQKCWfDuyOF5VhcUsgl1+QlhyhfswsAAuwaSyGF8Ra/anjtz7rQdIoCYTN16XeIIQmMU=
Received: from DB6PR0801CA0049.eurprd08.prod.outlook.com (2603:10a6:4:2b::17)
 by AM6PR08MB2965.eurprd08.prod.outlook.com (2603:10a6:209:49::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.23; Wed, 25 Sep
 2019 20:50:50 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by DB6PR0801CA0049.outlook.office365.com
 (2603:10a6:4:2b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.16 via Frontend
 Transport; Wed, 25 Sep 2019 20:50:50 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=none action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 25 Sep 2019 20:50:49 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Wed, 25 Sep 2019 20:50:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f19c64e402715159
X-CR-MTA-TID: 64aa7808
Received: from f259670395a5.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 458AB77A-6903-4E74-B31B-D3A4265DE4DF.1; 
 Wed, 25 Sep 2019 20:50:40 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f259670395a5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Sep 2019 20:50:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egNJvhKwYB5ZgNBoU94w1tvyc3CGmsJTP10HIMZUbTZhjzgigt9VmvqPdiSX7opM3SzqZk2pTEOmIO75ksEp5srr5nDL9eeNTd6pyNaWIwgyQ6UXAG2K0+o/JJtMSRLFGv2iKhePkfKe0egQ1RAIBP5+LESaXOysMtHNpL2oc15u1uQMVyc10yi1iHk7JAaRtR6UvwulJFLjc3Nozh20XNr33ZPU4c3z5T4tqnwWWu8mpZeK8R9wxq0p52iIn/BK6nKjqkiF4Zt6S9Jq5En2lIj9whpp0P8jlANzK0xvXQY9e55akv5keCA0X7FeRYddo8Hdc4opoa9Ja3suOIsKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gj8NxgmWfoptoiMWslR0ktlxYswun8cpzjOxOEbfVKc=;
 b=lpCtL0590MsmuXZCEM4G6OY4hLXf6+0/g2O4LdTrWJMSpdqqNQk1zPSD1/kOEx3sqeA4wHk+vXUZHqto+F8CPvj25u4/P3ppCnPj5VfvH2F/UrViLsbJRclx0VFrFeSTlYJQ1ewLoGJMSHwlPROSQbi7Z5Z5XNYkC+62U3lZYxG3yIJJG3LbNvK7rTsKwIZOaw7GR5cmKgF/OEoPAJXEWJrKOFQbZp2B9S7iF3ulqLpLUL/ImWCUb3v/QwXFL8Aou+C2ajsCEMYhwqEqA1XerF83EAg0HzmBq/Cd+SLrkvnLAWGwRYIDaU3bE0DYyKzjfyzeplBFIwJVYrtUjcFURg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gj8NxgmWfoptoiMWslR0ktlxYswun8cpzjOxOEbfVKc=;
 b=j6uNnE77X2Iv7hYmOgm0zfKL2pcgIA9mWMKF9id9Ra6Xm4bP8J+BUu3jcvj2SOhdBh7E6C7/ZVYPKL3NYqpYyVq7ZmFJGVFZ7KYPIJgXQKCWfDuyOF5VhcUsgl1+QlhyhfswsAAuwaSyGF8Ra/anjtz7rQdIoCYTN16XeIIQmMU=
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com (10.175.20.10) by
 VI1PR0802MB2512.eurprd08.prod.outlook.com (10.175.20.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Wed, 25 Sep 2019 20:50:37 +0000
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d]) by VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d%12]) with mapi id 15.20.2284.023; Wed, 25 Sep
 2019 20:50:37 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v5 2/8] xen/arm: export device_tree_get_reg and
 device_tree_get_u32
Thread-Index: AQHVc9H3NBL7ZInOSEmtOPgp2tAl8qc83hwA
Date: Wed, 25 Sep 2019 20:50:37 +0000
Message-ID: <5794e7da-15ec-bb47-8f1c-569ca9aa6809@arm.com>
References: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
 <20190925184924.21691-2-sstabellini@kernel.org>
In-Reply-To: <20190925184924.21691-2-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0101CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::14) To VI1PR0802MB2431.eurprd08.prod.outlook.com
 (2603:10a6:800:af::10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c8ee7164-59f6-4467-25a6-08d741fa0bd6
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2512; 
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2512:|VI1PR0802MB2512:|AM6PR08MB2965:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB296554DB0976984A4C286C0680870@AM6PR08MB2965.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2276;OLM:2276;
x-forefront-prvs: 01713B2841
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(199004)(189003)(478600001)(229853002)(102836004)(2906002)(3846002)(476003)(186003)(26005)(86362001)(6116002)(6506007)(386003)(66946007)(66446008)(31696002)(81166006)(6486002)(6436002)(53546011)(76176011)(66556008)(64756008)(5660300002)(446003)(36756003)(66476007)(6246003)(8676002)(6512007)(52116002)(44832011)(2616005)(11346002)(316002)(31686004)(8936002)(81156014)(71200400001)(6916009)(54906003)(71190400001)(99286004)(486006)(256004)(4326008)(305945005)(14454004)(7736002)(66066001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2512;
 H:VI1PR0802MB2431.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: cGRbEJ1wf2t/uW/Oi9j10btuKFZuFWJGDfautEcCpMYycYvsrg8rPDUHsXqHgsfG6WCQf4i8ZsGzu5lp2NB6DunepYlGZ1RPczUx/8zBYJLBFTJjDpJNknyTrUFOGMM+aNYMO1qsQqJWis2tG2RGqT3E1dBFhg8AV/FExBBJNRJYhP2feVaYXfsRXB6tQKx8SPSOxiG+fXUWGqMn8qUrw2D2dslvMg8SSJMz+isbFWjT+W13U4h4FI4+6FXzFn0RK2scK9RI7e4FRxIHXUwDzmP6vcCrImXdB7SHzsWswDF1pUOTp1vb33wuGGw8uZ+xvPDqPeQMFuqx2B+V9fYP62wv9C6r1ggvS1ylLTWBzOYsY6UVrPZzWhZHhOc8gTJ+pLRmU7jp4ZMuoh3RbajVDzYbXnh4nx5FT5YUxwoiVFU=
Content-ID: <5F7C5756D639634A82DCEF5956F2A338@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2512
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(53546011)(6506007)(386003)(8676002)(5660300002)(36906005)(31696002)(26826003)(86362001)(14454004)(81156014)(25786009)(316002)(3846002)(81166006)(70586007)(54906003)(6116002)(70206006)(478600001)(2906002)(476003)(356004)(305945005)(126002)(47776003)(50466002)(486006)(23676004)(2486003)(76176011)(436003)(2616005)(7736002)(336012)(6246003)(76130400001)(446003)(63350400001)(36756003)(31686004)(107886003)(11346002)(8936002)(22756006)(4326008)(99286004)(26005)(229853002)(6862004)(186003)(6512007)(6486002)(102836004)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB2965;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0d7dcd84-72e8-489f-ea81-08d741fa04b6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR08MB2965; 
NoDisclaimer: True
X-Forefront-PRVS: 01713B2841
X-Microsoft-Antispam-Message-Info: s78FH2IhRpa0rHrYwsCe5KqEKWkoRVLTG3dztxaklnriWlLfkMx4Y8s4Cfn4OqesQtFvCwI4ZukG5YIh3F3D8yePTqrqzNuw6yBhLKR8FJbbhcxKKT0pR4KRWEuqfv48lm2ykvgseIZSiWDzoncJcLo6FyYVgKmagtDtpH8tFexIm+Mpkmr5je0toLwttZGmJf29eTv49tbKZgowidoSbYWps+DVNi4E3U0aJFRHYiVeJANqr6cD6IfHflhPb1bqOsuKF2gEeovS0pqG7O5jl3f2o7L5EE4wI49vtYVFKgWPE2FGkEPfoqH2UkxFQFjvzpHd3kAe2Mpot2mkW/zAGR9jsLSc78Dy9L6MlC2hLfFc9Z2k/HBybEBBGzDGw/QnkKyCBxNZ5dTTzLIsBsGmbPXe4WidIRHLu4UHEbNdwgs=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 20:50:49.1386 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ee7164-59f6-4467-25a6-08d741fa0bd6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2965
Subject: Re: [Xen-devel] [PATCH v5 2/8] xen/arm: export device_tree_get_reg
 and device_tree_get_u32
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
VGhleSdsbCBiZSB1c2VkIGluIGxhdGVyIHBhdGNoZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+DQoNCkFja2VkLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KDQpDaGVlcnMsDQoNCj4gDQo+IC0tLQ0K
PiBDaGFuZ2VzIGluIHY1Og0KPiAtIG1vdmUgZGVjbGFyYXRpb25zIHRvIHhlbi9pbmNsdWRlL2Fz
bS1hcm0vc2V0dXAuaA0KPiANCj4gQ2hhbmdlcyBpbiB2NDoNCj4gLSBuZXcgcGF0Y2gNCj4gLS0t
DQo+ICAgeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyAgICAgIHwgOCArKysrLS0tLQ0KPiAgIHhlbi9p
bmNsdWRlL2FzbS1hcm0vc2V0dXAuaCB8IDYgKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jDQo+IGluZGV4IDYyMzE3
M2JjN2YuLmE3ODEwYWJiMTUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMN
Cj4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYw0KPiBAQCAtNTUsMTUgKzU1LDE1IEBAIHN0
YXRpYyBib29sIF9faW5pdCBkZXZpY2VfdHJlZV9ub2RlX2NvbXBhdGlibGUoY29uc3Qgdm9pZCAq
ZmR0LCBpbnQgbm9kZSwNCj4gICAgICAgcmV0dXJuIGZhbHNlOw0KPiAgIH0NCj4gICANCj4gLXN0
YXRpYyB2b2lkIF9faW5pdCBkZXZpY2VfdHJlZV9nZXRfcmVnKGNvbnN0IF9fYmUzMiAqKmNlbGws
IHUzMiBhZGRyZXNzX2NlbGxzLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdTMyIHNpemVfY2VsbHMsIHU2NCAqc3RhcnQsIHU2NCAqc2l6ZSkNCj4gK3ZvaWQgX19p
bml0IGRldmljZV90cmVlX2dldF9yZWcoY29uc3QgX19iZTMyICoqY2VsbCwgdTMyIGFkZHJlc3Nf
Y2VsbHMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBzaXplX2NlbGxz
LCB1NjQgKnN0YXJ0LCB1NjQgKnNpemUpDQo+ICAgew0KPiAgICAgICAqc3RhcnQgPSBkdF9uZXh0
X2NlbGwoYWRkcmVzc19jZWxscywgY2VsbCk7DQo+ICAgICAgICpzaXplID0gZHRfbmV4dF9jZWxs
KHNpemVfY2VsbHMsIGNlbGwpOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyB1MzIgX19pbml0IGRl
dmljZV90cmVlX2dldF91MzIoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwNCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcHJvcF9uYW1lLCB1MzIg
ZGZsdCkNCj4gK3UzMiBfX2luaXQgZGV2aWNlX3RyZWVfZ2V0X3UzMihjb25zdCB2b2lkICpmZHQs
IGludCBub2RlLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIg
KnByb3BfbmFtZSwgdTMyIGRmbHQpDQo+ICAgew0KPiAgICAgICBjb25zdCBzdHJ1Y3QgZmR0X3By
b3BlcnR5ICpwcm9wOw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9z
ZXR1cC5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oDQo+IGluZGV4IGVmY2JhNTQ1YzIu
LmZhMGE4NzIxYjIgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vc2V0dXAuaA0K
PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmgNCj4gQEAgLTExNSw2ICsxMTUsMTIg
QEAgY29uc3QgY2hhciAqYm9vdF9tb2R1bGVfa2luZF9hc19zdHJpbmcoYm9vdG1vZHVsZV9raW5k
IGtpbmQpOw0KPiAgIGV4dGVybiB1aW50MzJfdCBoeXBfdHJhcHNfdmVjdG9yW107DQo+ICAgdm9p
ZCBpbml0X3RyYXBzKHZvaWQpOw0KPiAgIA0KPiArdm9pZCBkZXZpY2VfdHJlZV9nZXRfcmVnKGNv
bnN0IF9fYmUzMiAqKmNlbGwsIHUzMiBhZGRyZXNzX2NlbGxzLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgIHUzMiBzaXplX2NlbGxzLCB1NjQgKnN0YXJ0LCB1NjQgKnNpemUpOw0KPiArDQo+
ICt1MzIgZGV2aWNlX3RyZWVfZ2V0X3UzMihjb25zdCB2b2lkICpmZHQsIGludCBub2RlLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcHJvcF9uYW1lLCB1MzIgZGZsdCk7
DQo+ICsNCj4gICAjZW5kaWYNCj4gICAvKg0KPiAgICAqIExvY2FsIHZhcmlhYmxlczoNCj4gDQoN
Ci0tIA0KSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
