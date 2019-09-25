Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61365BE792
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 23:37:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDEvt-0002zC-Mw; Wed, 25 Sep 2019 21:34:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KYcU=XU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDEvr-0002z4-MG
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 21:34:43 +0000
X-Inumbo-ID: 484ab614-dfdc-11e9-963a-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.77]) by localhost (Halon) with ESMTPS
 id 484ab614-dfdc-11e9-963a-12813bfff9fa;
 Wed, 25 Sep 2019 21:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBMA3GGximoB2VauTNWtNrwR+wUSsvHvqCXX47doDu4=;
 b=LlSnsSwtc7W6I8UjL/uUyQ/0E0fgxeXmqtTGZKl10OCpbYf0DPuJag2cBTyTM3xYXpTbEWMFgng6VxWbtPy35dV9ljCDaS8dwDva5tNl7CGuFfFdGhHT2UWPR8QpEnou2lowZ1GDVan0zglSXd+GLDIC77f8V6IK9sGj5laD0MM=
Received: from VI1PR08CA0138.eurprd08.prod.outlook.com (2603:10a6:800:d5::16)
 by AM5PR0801MB1956.eurprd08.prod.outlook.com (2603:10a6:203:4b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Wed, 25 Sep
 2019 21:34:38 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0138.outlook.office365.com
 (2603:10a6:800:d5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.16 via Frontend
 Transport; Wed, 25 Sep 2019 21:34:38 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 25 Sep 2019 21:34:36 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Wed, 25 Sep 2019 21:34:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ad443c1fa068d1f6
X-CR-MTA-TID: 64aa7808
Received: from ea6233c70716.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.1.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6AD6B418-F87D-4DEB-896D-3C28A0384A96.1; 
 Wed, 25 Sep 2019 21:34:29 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea6233c70716.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 25 Sep 2019 21:34:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFIdo0RSIgsPnLudvOBPp4DOV3rY216C1W+9KibSSi5vxXlBb7bMSjlvKqjIiBdVPx6VGfNg9Ofqb5hE0oQhzDKKU1H+vFqhd2/Cv0Vx1OQ1zagDAOnwIh7TrT6xSMx++mrUqSpV3rbe5DThw7QZIag5Tp0PLxWlm6sapEBTNewPI7o/QMvLoN1YH9aDjoWETP1QqU9SjPbjbMed9mGn5H1ivjmgeY3fNW5ShFOIKbK70Sb891McERJlkh5FrCpDQD3/9isc8qLgmVg688YhjBj0yo6iH6031VMoxUVfje2zgrdhvgMa0+o4BeBDFl/au/khJ6Nu5n5Tjpe3WJj85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBMA3GGximoB2VauTNWtNrwR+wUSsvHvqCXX47doDu4=;
 b=gcuHt/t/HpqiBSVHN0t9UDfYtvgeyrema3Jn0F0X9HhgDPpU7A5qUFYwu6Cj0dPIRwRMP/LAV0guU8yr5TJY/FJjawM/TK4EQ/sETJM3REmhGexUq9tYdUEc2vAYu1pa/b1gO2qUM20rbUaR61iTAuul2ymHbzdSPKPI0ZPS9rLDMrbqklBBWtWyqvF9nYT5JqWjR+VDxh33Hp2DBueOn/w3qN5Oh/Ashma8i0JKJrosgtQwk3xSjGR7R7LlExrt1qmllrYtJ7BNN1VEjUdJDzO9uR3z6kANXaN4gRH0f4RNamZx8ahm2tQSl8FduQTF9gzNtH2wcXLSq8O2M2tu2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBMA3GGximoB2VauTNWtNrwR+wUSsvHvqCXX47doDu4=;
 b=LlSnsSwtc7W6I8UjL/uUyQ/0E0fgxeXmqtTGZKl10OCpbYf0DPuJag2cBTyTM3xYXpTbEWMFgng6VxWbtPy35dV9ljCDaS8dwDva5tNl7CGuFfFdGhHT2UWPR8QpEnou2lowZ1GDVan0zglSXd+GLDIC77f8V6IK9sGj5laD0MM=
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com (10.175.20.10) by
 VI1PR0802MB2479.eurprd08.prod.outlook.com (10.175.20.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 21:34:28 +0000
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d]) by VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d%12]) with mapi id 15.20.2284.023; Wed, 25 Sep
 2019 21:34:27 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Oleksandr' <olekstysh@gmail.com>, 
 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
Thread-Index: AQHVc3z0cnhjMqeiCEmn4F0XFf6SLac8FbYAgAABrICAAHNGAIAABciAgABalQA=
Date: Wed, 25 Sep 2019 21:34:27 +0000
Message-ID: <7f18c7f3-1d25-6d24-b44b-27cf77163eec@arm.com>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
 <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
 <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
 <7d50ae35-2642-7fe5-89c7-c4ee09f263d0@gmail.com>
 <94de3adfac564f8e920bd04b3cf54734@AMSPEX02CL03.citrite.net>
In-Reply-To: <94de3adfac564f8e920bd04b3cf54734@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR07CA0019.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::32) To VI1PR0802MB2431.eurprd08.prod.outlook.com
 (2603:10a6:800:af::10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1226fc80-6242-4c89-5e24-08d7420029e5
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2479; 
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2479:|AM5PR0801MB1956:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1956BD82FEFA1A0BBDF3B36580870@AM5PR0801MB1956.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 01713B2841
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(13464003)(199004)(189003)(4326008)(3846002)(6116002)(76176011)(66476007)(26005)(102836004)(52116002)(386003)(6506007)(53546011)(5660300002)(86362001)(25786009)(186003)(2906002)(7416002)(44832011)(446003)(99286004)(7736002)(305945005)(66066001)(6486002)(54906003)(6436002)(229853002)(11346002)(2616005)(476003)(486006)(316002)(6512007)(110136005)(66556008)(478600001)(8936002)(6246003)(81166006)(66946007)(64756008)(66446008)(256004)(81156014)(31696002)(36756003)(31686004)(8676002)(14444005)(14454004)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2479;
 H:VI1PR0802MB2431.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: C3DvJZYm5QCwbN+MltcCyedIhaPsFe/KIWqvOcDg4D3l7d3jtqC0E6BxWa+93YDOHcjo5xI6neX5AU2tCAHcSKzbXneEXWAeDMpQ20/kqlHUP0gIGb0nw821BSpDijHVdxHUzz6Lw136D1dbMAR0Gh2wW6uSpVziU0mgwb5u9wJD+aL8oz63/vgyntdaQyEqPeVg4NhCsdKYNlvXvR41cvUoC4LSnNcF1YS8XDKrN7FvhT3SP7zNluxB8y7k4c4NSuCpu7dk1Gf1MtaikJOFZnCo/XibieT8bWDvhaArTQ6Jz0lIgNXDAGOwgCVIpeHrRCJTG7fg9fIvtfduayQf1mXNxjUdDca8oqbh77ICg66lmvaHh9/iTlY25z/jS20wJWBK8NOVNd2db+OxqQSy2uoT8BLMw6m1sBfxLYPDC3U=
x-ms-exchange-transport-forked: True
Content-ID: <0E282AB989E39949A6C1D880E36DDABA@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2479
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(376002)(199004)(189003)(13464003)(486006)(6512007)(54906003)(316002)(31686004)(126002)(476003)(4326008)(22756006)(66066001)(99286004)(336012)(356004)(11346002)(2616005)(6486002)(36756003)(102836004)(81156014)(63350400001)(6506007)(26005)(8676002)(81166006)(186003)(8936002)(436003)(47776003)(446003)(50466002)(386003)(6246003)(76176011)(53546011)(107886003)(3846002)(6116002)(229853002)(86362001)(2906002)(305945005)(7736002)(23676004)(25786009)(70206006)(76130400001)(70586007)(31696002)(110136005)(36906005)(5660300002)(14454004)(2486003)(26826003)(14444005)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1956;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 21187ed6-b67a-49de-edb3-08d74200246c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR0801MB1956; 
NoDisclaimer: True
X-Forefront-PRVS: 01713B2841
X-Microsoft-Antispam-Message-Info: bO7uwTMWxeiSJgCu2qnViN160zGna/qNPMxemewwEH4kaR17xBPi1Nzt5T/MnIhutUysqWWVB73QpdNxuhWPWLMp2XtuSFe466rg3DsuLtuQichI8T7cuKjS3Y4/MvlivRBI7ZQbNdWSoBs49xgc6pzda5a4xTCMLWKJ6wTdwBoJ8l9NwnuvB4gG96FngnKjDBH61oJoOjpvz0Wmg7a9q4tEV/HBffuWkp6e2PSHGLzAS+wqmWTDfoBJG8ZptwVrddj1kjCwqdtSzq0DCp2DqnjMakfKmWGn6LGl74WrZxBYbRqLOJ4p+Xjj0E4XSxqpBFG/mRegsI2lgwfoTI6uprg63UVwUSrKAQKE/+htGkCI9vEqK4lQolEz4Jmx2xdPHnoW9E0BtZ1PfvLRd/yR0/Hfi9Oxm8QqgHyVarq6sqo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 21:34:36.5985 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1226fc80-6242-4c89-5e24-08d7420029e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1956
Subject: Re: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDI1LzA5LzIwMTkgMTc6MTAsIFBhdWwgRHVycmFudCB3cm90ZToNCj4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBPbGVrc2FuZHIgPG9sZWtzdHlzaEBnbWFp
bC5jb20+DQo+PiBTZW50OiAyNSBTZXB0ZW1iZXIgMjAxOSAxNjo1MA0KPj4gVG86IFBhdWwgRHVy
cmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyAnSmFuIEJldWxpY2gnIDxqYmV1bGljaEBz
dXNlLmNvbT4NCj4+IENjOiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIu
Y29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExp
dQ0KPj4gPHdsQHhlbi5vcmc+OyBLb25yYWRSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT47IEFuZHJldyBDb29wZXINCj4+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsg
RGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9yZz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3Jn
PjsgR2VvcmdlIER1bmxhcA0KPj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFRhbWFzIEsg
TGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IElhbiBKYWNrc29uDQo+PiA8SWFuLkphY2tz
b25AY2l0cml4LmNvbT47IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29t
PjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPj4gVm9sb2R5bXlyIEJhYmNodWsg
PFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47IEp1bGllbiBHcmFsbA0KPj4gPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPj4g
U3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MTMgMC80XSBhZGQgcGVyLWRvbWFpbiBJ
T01NVSBjb250cm9sDQo+Pg0KPj4NCj4+IFtDQyBKdWxpZW5dDQo+Pg0KPj4NCj4+IEhpIFBhdWwN
Cj4+DQo+PiBJIG1heSBtaXN0YWtlLCBidXQgbG9va3MgbGlrZQ0KPj4NCj4+IDgwZmYzZDMzOGRj
OTMyNjBiNDFmZmVlZWJiMGY4NTJjMmVkZWY5Y2UgaW9tbXU6IHRpZHkgdXANCj4+IGlvbW11X3Vz
ZV9oYXBfcHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkgbWFjcm9zDQo+Pg0KPj4gdHJpZ2dl
cnMgQVNTRVJUX1VOUkVBQ0hBQkxFIG9uIEFybSBpZiBubyBJT01NVSBoYXMgYmVlbiBmb3VuZCAo
SSBidWlsdA0KPj4gd2l0aCBteSBwbGF0Zm9ybSdzIElPTU1VIGRyaXZlciBkaXNhYmxlZDogIyBD
T05GSUdfSVBNTVVfVk1TQSBpcyBub3Qgc2V0KSAuDQo+Pg0KPj4gU28sIGlvbW11X3NldHVwKCkg
Y2FsbHMgY2xlYXJfaW9tbXVfaGFwX3B0X3NoYXJlKCkgd2l0aA0KPj4gaW9tbXVfaGFwX3B0X3No
YXJlIGJlaW5nIHNldCAoQ09ORklHX0lPTU1VX0ZPUkNFX1BUX1NIQVJFPXkpIHdoaWNoLA0KPj4g
YWN0dWFsbHksIHRyaWdnZXJzIEFTU0VSVC4NCj4+DQo+IA0KPiBIZXJlIGEgbWluaW1hbCBwYXRj
aCwgbGVhdmluZyAnZm9yY2UgcHQgc2hhcmUnIGluIHBsYWNlLiBEb2VzIHRoaXMgYXZvaWQgdGhl
IHByb2JsZW0/DQo+IA0KPiAtLS04PC0tLQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zeXNj
dGwuYyBiL3hlbi9jb21tb24vc3lzY3RsLmMNCj4gaW5kZXggZTg3NjNjN2ZkZi4uZjg4YTI4NWU3
ZiAxMDA2NDQNCj4gLS0tIGEveGVuL2NvbW1vbi9zeXNjdGwuYw0KPiArKysgYi94ZW4vY29tbW9u
L3N5c2N0bC5jDQo+IEBAIC0yNjgsOSArMjY4LDExIEBAIGxvbmcgZG9fc3lzY3RsKFhFTl9HVUVT
VF9IQU5ETEVfUEFSQU0oeGVuX3N5c2N0bF90KSB1X3N5c2N0bCkNCj4gICAgICAgICAgIHBpLT5t
YXhfbWZuID0gZ2V0X3VwcGVyX21mbl9ib3VuZCgpOw0KPiAgICAgICAgICAgYXJjaF9kb19waHlz
aW5mbyhwaSk7DQo+ICAgICAgICAgICBpZiAoIGlvbW11X2VuYWJsZWQgKQ0KPiArICAgICAgICB7
DQo+ICAgICAgICAgICAgICAgcGktPmNhcGFiaWxpdGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBf
ZGlyZWN0aW87DQo+IC0gICAgICAgIGlmICggaW9tbXVfaGFwX3B0X3NoYXJlICkNCj4gLSAgICAg
ICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX2lvbW11X2hhcF9w
dF9zaGFyZTsNCj4gKyAgICAgICAgICAgIGlmICggaW9tbXVfaGFwX3B0X3NoYXJlICkNCj4gKyAg
ICAgICAgICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9pb21t
dV9oYXBfcHRfc2hhcmU7DQo+ICsgICAgICAgIH0NCj4gDQo+ICAgICAgICAgICBpZiAoIGNvcHlf
dG9fZ3Vlc3QodV9zeXNjdGwsIG9wLCAxKSApDQo+ICAgICAgICAgICAgICAgcmV0ID0gLUVGQVVM
VDsNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oIGIveGVuL2luY2x1ZGUv
eGVuL2lvbW11LmgNCj4gaW5kZXggN2MzMDAzZjNmMS4uNmExMGEyNDEyOCAxMDA2NDQNCj4gLS0t
IGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11
LmgNCj4gQEAgLTY4LDggKzY4LDYgQEAgc3RhdGljIGlubGluZSB2b2lkIGNsZWFyX2lvbW11X2hh
cF9wdF9zaGFyZSh2b2lkKQ0KPiAgIHsNCj4gICAjaWZuZGVmIGlvbW11X2hhcF9wdF9zaGFyZQ0K
PiAgICAgICBpb21tdV9oYXBfcHRfc2hhcmUgPSBmYWxzZTsNCj4gLSNlbGlmIGlvbW11X2hhcF9w
dF9zaGFyZQ0KPiAtICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPiAgICNlbmRpZg0KDQpJSE1P
LCBjYWxsaW5nIHRoaXMgZnVuY3Rpb24gaXMgYSBtaXN0YWtlIG9uIHBsYXRmb3JtIG9ubHkgc3Vw
cG9ydGluZyANCnNoYXJlZCBwYWdlLXRhYmxlIHNvIHRoZSBBU1NFUlQoKSBzaG91bGQgYmUga2Vw
dCBoZXJlLg0KDQpUaGlzIHJhaXNlcyB0aGUgcXVlc3Rpb24gd2h5IHRoZSBmdW5jdGlvbiBpcyBh
Y3R1YWxseSBjYWxsZWQgZnJvbSBjb21tb24gDQpjb2RlLiBpb21tdV9oYXBfZW5hYmxlZCgpIHNo
b3VsZCB0ZWNobmljYWxseSBub3QgYmUgdXNlZCBpbiBhbnkgY29kZSBpZiANCnRoZSBJT01NVSBp
cyBub3QgZW5hYmxlZC9wcmVzZW50LiBTbyB3aGF0IGFyZSB5b3UgdHJ5aW5nIHRvIHByZXZlbnQg
aGVyZT8NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
