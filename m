Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B151C0C5F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 22:07:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDwST-0008N2-BU; Fri, 27 Sep 2019 20:03:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tE9W=XW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDwSR-0008MT-5r
 for xen-devel@lists.xen.org; Fri, 27 Sep 2019 20:03:15 +0000
X-Inumbo-ID: d58a1b9c-e161-11e9-9681-12813bfff9fa
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.49]) by localhost (Halon) with ESMTPS
 id d58a1b9c-e161-11e9-9681-12813bfff9fa;
 Fri, 27 Sep 2019 20:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yikvVbwyETkwTtYZH0aLxekrW0vX8H90hrm2w2G1LN8=;
 b=6cltdoYhCoKbJ/BAHc6u4gt3BXQdeZIBLE8GcEpw/JBxgX8d+3nLUvhHFydDJvXVAqJKkpycVsP3ZEi9x4/2/QB7SwQqkKlhKF9+8KoOcmw4iYYfrriZIGvLKbC6D9KxA8PDxaUuairWAJlRkFud2Q/LXPWqvmOVZgRo5yK1GQo=
Received: from DB7PR08CA0034.eurprd08.prod.outlook.com (2603:10a6:5:16::47) by
 AM6PR08MB4786.eurprd08.prod.outlook.com (2603:10a6:20b:cc::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Fri, 27 Sep 2019 20:03:09 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by DB7PR08CA0034.outlook.office365.com
 (2603:10a6:5:16::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.20 via Frontend
 Transport; Fri, 27 Sep 2019 20:03:09 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=none action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 27 Sep 2019 20:03:07 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Fri, 27 Sep 2019 20:03:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf8327e31a34ff5b
X-CR-MTA-TID: 64aa7808
Received: from 691a6cd7113d.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 30B5FCA0-425E-4C12-9B01-557106F280EF.1; 
 Fri, 27 Sep 2019 20:02:59 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 691a6cd7113d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 27 Sep 2019 20:02:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsCe+AP0ZFBzH6ZmgnLTPHci0y/+/8ypl/HKU2E8H+fzCusAj1wrMHD4TRvG4/0MfCTwjMxFtYsjDNog2eD4J/omwa+2ZN1zhz4hupcLpnorL6zpbIwnzBKF8xRTs3mQyL0oWbCDr8T6V9Tm0hjWdknBluF93YMyEN1S6y+BoDSVsB+1GiiPHrlom3EigDn0vPQmIAdGsGclHnT+1eLlq/Ch/mgrYv0+szs6Ijn+Rzi/W46o5KDM7asqdqWrfMVjj2qd7KBsSzxaokJqLTz4HOjl6ZwDte6fYj7MoHJyYHLhWCjbYuLVjbDk0V3dpbePUkXkujIdPJ1Gk3c0eJfxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yikvVbwyETkwTtYZH0aLxekrW0vX8H90hrm2w2G1LN8=;
 b=M3KzbmI4H1rJGXrahESrRktri5wQuxiG5nnKI7Hq8PeRtksIYttqFgJZLpP5ohOsowsXpYkcv+R723lk41JR5UVK3TMoTjqhRqNVON41wP7Y+rg9OuBuiIU4DwXdlAE/OjSDB78qeHxT0fvuPewUF/4yZXpNT1a55BmBlpV6xU3UFo30JcEYfY6xLXqlcKVFboHHqL4ic6ydM7o7RkIvkqjy09/6aLIfwl0Tu59jlOYZ1hVEwJjmWFKBXvlOIylOjSv/aXxO/9WE5HSjTuarCZJPA6g/OdI/QUw1z1jJfOhVXT8BSFsbARlODgnkScOk7YZJyP73y9YNf9s8lN+14A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yikvVbwyETkwTtYZH0aLxekrW0vX8H90hrm2w2G1LN8=;
 b=6cltdoYhCoKbJ/BAHc6u4gt3BXQdeZIBLE8GcEpw/JBxgX8d+3nLUvhHFydDJvXVAqJKkpycVsP3ZEi9x4/2/QB7SwQqkKlhKF9+8KoOcmw4iYYfrriZIGvLKbC6D9KxA8PDxaUuairWAJlRkFud2Q/LXPWqvmOVZgRo5yK1GQo=
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com (10.175.20.10) by
 VI1PR0802MB2383.eurprd08.prod.outlook.com (10.172.81.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Fri, 27 Sep 2019 20:02:57 +0000
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d]) by VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d%12]) with mapi id 15.20.2284.023; Fri, 27 Sep
 2019 20:02:56 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Oleksandr <olekstysh@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Thread-Topic: [Xen-devel] [PATCH v5 5/8] xen/arm: assign devices to boot
 domains
Thread-Index: AQHVc9H5tbWV79MYzkyfQYK3VyEBxKc85FcAgAK2+wCAAFoiAA==
Date: Fri, 27 Sep 2019 20:02:56 +0000
Message-ID: <d24ff53d-b153-b00f-4374-5fe9fbd80e47@arm.com>
References: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
 <20190925184924.21691-5-sstabellini@kernel.org>
 <0eef5f6f-a8f2-4a6c-745f-56a16314d3ac@arm.com>
 <e1ccdeff-58f7-11ff-f07f-1e9457ca578d@gmail.com>
In-Reply-To: <e1ccdeff-58f7-11ff-f07f-1e9457ca578d@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0045.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::33)
 To VI1PR0802MB2431.eurprd08.prod.outlook.com
 (2603:10a6:800:af::10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9d8977bd-0547-44fc-50ee-08d74385b715
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2383; 
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2383:|VI1PR0802MB2383:|AM6PR08MB4786:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4786E24EB6F8DA4A45A2266680810@AM6PR08MB4786.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 0173C6D4D5
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(189003)(199004)(14444005)(31686004)(316002)(25786009)(64756008)(4326008)(6246003)(66446008)(66476007)(66556008)(66946007)(8936002)(110136005)(81156014)(8676002)(76176011)(81166006)(53546011)(52116002)(102836004)(478600001)(6436002)(486006)(44832011)(54906003)(2906002)(386003)(446003)(6506007)(966005)(186003)(229853002)(6486002)(26005)(14454004)(66066001)(11346002)(2616005)(31696002)(476003)(71200400001)(86362001)(6116002)(3846002)(256004)(71190400001)(99286004)(5660300002)(6512007)(36756003)(6306002)(305945005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2383;
 H:VI1PR0802MB2431.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: ml+axdjst+2jxev0f/+dpXzGUrdB8M1tkyHW9rrKjzXKAC270dE++Vj2SlLMMePhLjeIIbbqvn747I8ueYJnBFRPM4pnJIRuMZSitgW0/CNMvD8fXmtJIrxXpmFFAwICfEGonyX/r9P8jI0++457cg93HWlo6jGbA3JZFMzNl9HlE/01OYgJNPLVzaqwrko+vig6QhguAJSPO/61F7OUeJsBiET8E/wREry6FMQL7I8g4ZzusPJNWPL2m0Omo2bNTzk9nqOJ0AqVgY4ROj0/fn6LMLxlaf1BMMcBR02cr1FDvpLyWYocI985abM74LY1SDY4SSHe6ADDsHV7SeKwknkocnIWg3RmVvO6zoTnrYmerl4ocpQWceycX5mRZa6CF3DYD51lYbLGtqMs4S2sATmEHFtqk5sNOL1cUsrqt7QjX2W3TirLu4EJtLFfzcpgU9bJL7kE6oaFdiUvJhaLig==
Content-ID: <A62B193C87C4BB479177296789232EF7@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2383
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(8936002)(478600001)(476003)(23676004)(386003)(6506007)(76176011)(81156014)(486006)(36756003)(86362001)(31696002)(14454004)(966005)(99286004)(53546011)(50466002)(4326008)(6246003)(107886003)(6512007)(6306002)(305945005)(2906002)(7736002)(6116002)(6486002)(229853002)(14444005)(54906003)(316002)(110136005)(3846002)(47776003)(22756006)(5660300002)(66066001)(8676002)(81166006)(26826003)(70586007)(126002)(25786009)(11346002)(31686004)(356004)(436003)(70206006)(102836004)(446003)(76130400001)(336012)(2616005)(2486003)(186003)(26005)(63350400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4786;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b5f9f856-3b6c-47a3-1ab3-08d74385b06e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR08MB4786; 
NoDisclaimer: True
X-Forefront-PRVS: 0173C6D4D5
X-Microsoft-Antispam-Message-Info: ReqilD4t7m9dSb6uJ6juBPSO2/t4Qc0kOFJGQyOq8DyGWKcVMstTUAggw6++7wYKphVFTfjiYIZFFBd/+Tg19+V6Y7nNnnnSvpNVhASD1IfPzPDzJgdfq3ecYJ9PZq++FWDdyvQfDv5STzMyLYkBy3Tg0xYGN2DzuHxEpDPh5gosjhoasnXBU59j4x4M/bTYQCUtvTSn7+WsyjZlenApfGTH55cL3Z2Shpj9qdRs6afQnFElhYPRvhfN2i7aFzKB6fK0TiuP7Kst6dM8ayc/SfIWV3oHfUL1xbRpaXHlZCbxyKX3NIEGrVi0RZLJHSu9+Bv6wKMTEKokK0jSNvOVm7zhgMIZOFrt4upFN14qeRH8PeADietGSdr/R3+/Ygvw7Kg+XAbHdDyYrFG6Re1dU4igFXe5OpUX5JvRksWaJXRSPb3HBcchzww+OJcf7NSZeET1gH0V1H2mhqQLRj1fqw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2019 20:03:07.7042 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8977bd-0547-44fc-50ee-08d74385b715
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4786
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

SGksDQoNCk9uIDI3LzA5LzIwMTkgMTU6NDAsIE9sZWtzYW5kciB3cm90ZToNCj4gDQo+IE9uIDI2
LjA5LjE5IDAwOjEyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBPbiAyNS8wOS8yMDE5IDE5OjQ5
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4gU2NhbiB0aGUgdXNlciBwcm92aWRlZCBk
dGIgZnJhZ21lbnQgYXQgYm9vdC4gRm9yIGVhY2ggZGV2aWNlIG5vZGUsIG1hcA0KPj4+IG1lbW9y
eSB0byBndWVzdHMsIGFuZCByb3V0ZSBpbnRlcnJ1cHRzIGFuZCBzZXR1cCB0aGUgaW9tbXUuDQo+
Pj4NCj4+PiBUaGUgbWVtb3J5IHJlZ2lvbiB0byByZW1hcCBpcyBzcGVjaWZpZWQgYnkgdGhlICJ4
ZW4scmVnIiBwcm9wZXJ0eS4NCj4+Pg0KPj4+IFRoZSBpb21tdSBpcyBzZXR1cCBieSBwYXNzaW5n
IHRoZSBub2RlIG9mIHRoZSBkZXZpY2UgdG8gYXNzaWduIG9uIHRoZQ0KPj4+IGhvc3QgZGV2aWNl
IHRyZWUuIFRoZSBwYXRoIGlzIHNwZWNpZmllZCBpbiB0aGUgZGV2aWNlIHRyZWUgZnJhZ21lbnQg
YXMNCj4+PiB0aGUgInhlbixwYXRoIiBzdHJpbmcgcHJvcGVydHkuDQo+Pj4NCj4+PiBUaGUgaW50
ZXJydXB0cyBhcmUgcmVtYXBwZWQgYmFzZWQgb24gdGhlIGluZm9ybWF0aW9uIGZyb20gdGhlDQo+
Pj4gY29ycmVzcG9uZGluZyBub2RlIG9uIHRoZSBob3N0IGRldmljZSB0cmVlLiBDYWxsDQo+Pj4g
aGFuZGxlX2RldmljZV9pbnRlcnJ1cHRzIHRvIHJlbWFwIGludGVycnVwdHMuIEludGVycnVwdHMg
cmVsYXRlZCBkZXZpY2UNCj4+PiB0cmVlIHByb3BlcnRpZXMgYXJlIGNvcGllZCBmcm9tIHRoZSBk
ZXZpY2UgdHJlZSBmcmFnbWVudCwgc2FtZSBhcyBhbGwNCj4+PiB0aGUgb3RoZXIgcHJvcGVydGll
cy4NCj4+Pg0KPj4+IEFsc28gYWRkIHRoZSBuZXcgZmxhZyBYRU5fRE9NQ1RMX0NERl9pb21tdSB0
byB0aGF0IGRvbTBsZXNzIGRvbVUgY2FuIHVzZQ0KPj4+IHRoZSBJT01NVS4NCj4+Pg0KPj4+IFNp
Z25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4NCj4+
PiAtLS0NCj4+PiBDaGFuZ2VzIGluIHY1Og0KPj4+IC0gdXNlIGxvY2FsIHZhcmlhYmxlIGZvciBu
YW1lDQo+Pj4gLSB1c2UgbWFwX3JlZ2lvbnNfcDJtdA0KPj4+IC0gYWRkIHdhcm5pbmcgZm9yIG5v
dCBwYWdlIGFsaWduZWQgYWRkcmVzc2VzL3NpemVzDQo+Pj4gLSBpbnRyb2R1Y2UgaGFuZGxlX3Bh
c3N0aHJvdWdoX3Byb3ANCj4+Pg0KPj4+IENoYW5nZXMgaW4gdjQ6DQo+Pj4gLSB1c2UgdW5zaWdu
ZWQNCj4+PiAtIGltcHJvdmUgY29tbWl0IG1lc3NhZ2UNCj4+PiAtIGNvZGUgc3R5bGUNCj4+PiAt
IHVzZSBkdF9wcm9wX2NtcA0KPj4+IC0gdXNlIGRldmljZV90cmVlX2dldF9yZWcNCj4+PiAtIGRv
bid0IGNvcHkgb3ZlciB4ZW4scmVnIGFuZCB4ZW4scGF0aA0KPj4+IC0gZG9uJ3QgY3JlYXRlIHNw
ZWNpYWwgaW50ZXJydXB0IHByb3BlcnRpZXMgZm9yIGRvbVU6IGNvcHkgdGhlbSBmcm9tIHRoZQ0K
Pj4+IMKgwqDCoCBmcmFnbWVudA0KPj4+IC0gaW4tY29kZSBjb21tZW50DQo+Pj4NCj4+PiBDaGFu
Z2VzIGluIHYzOg0KPj4+IC0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQ0KPj4+IC0gcmVtb3ZlIHN1
cGVyZmx1b3VzIGNhc3QNCj4+PiAtIG1lcmdlIGNvZGUgd2l0aCB0aGUgY29weSBjb2RlDQo+Pj4g
LSBhZGQgaW50ZXJydXAtcGFyZW50DQo+Pj4gLSBkZW1vdmUgZGVwdGggPiAyIGNoZWNrDQo+Pj4g
LSByZXVzZSBjb2RlIGZyb20gaGFuZGxlX2RldmljZV9pbnRlcnJ1cHRzDQo+Pj4gLSBjb3B5IGlu
dGVycnVwdHMgZnJvbSBob3N0IGR0DQo+Pj4NCj4+PiBDaGFuZ2VzIGluIHYyOg0KPj4+IC0gcmVu
YW1lICJwYXRoIiB0byAieGVuLHBhdGgiDQo+Pj4gLSBncmFtbWFyIGZpeA0KPj4+IC0gdXNlIGdh
ZGRyX3RvX2dmbiBhbmQgbWFkZHJfdG9fbWZuDQo+Pj4gLSByZW1vdmUgZGVwdGggPD0gMiBsaW1p
dGF0aW9uIGluIHNjYW5uaW5nIHRoZSBkdGIgZnJhZ21lbnQNCj4+PiAtIGludHJvZHVjZSBhbmQg
cGFyc2UgeGVuLHJlZw0KPj4+IC0gY29kZSBzdHlsZQ0KPj4+IC0gc3VwcG9ydCBtb3JlIHRoYW4g
b25lIGludGVycnVwdCBwZXIgZGV2aWNlDQo+Pj4gLSBzcGVjaWZ5IG9ubHkgdGhlIEdJQyBpcyBz
dXBwb3J0ZWQNCj4+PiAtLS0NCj4+PiDCoMKgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8
IDEwMSANCj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4+PiDCoMKg
IDEgZmlsZSBjaGFuZ2VkLCA5NyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4+DQo+
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYw0KPj4+IGluZGV4IDlkOTg1ZDNiYmUuLjQxNDg5M2JjMjQgMTAwNjQ0
DQo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4gQEAgLTE3MDEsNiArMTcwMSw4NSBAQCBzdGF0aWMg
aW50IF9faW5pdCBtYWtlX3ZwbDAxMV91YXJ0X25vZGUoc3RydWN0IA0KPj4+IGtlcm5lbF9pbmZv
ICpraW5mbykNCj4+PiDCoMKgIH0NCj4+PiDCoMKgICNlbmRpZg0KPj4+ICsvKg0KPj4+ICsgKiBT
Y2FuIGRldmljZSB0cmVlIHByb3BlcnRpZXMgZm9yIHBhc3N0aHJvdWdoIHNwZWNpZmljIGluZm9y
bWF0aW9uLg0KPj4+ICsgKiBSZXR1cm5zIC1FTk9FTlQgd2hlbiBubyBwYXNzdGhyb3VnaCBwcm9w
ZXJ0aWVzIGFyZSBmb3VuZA0KPj4+ICsgKsKgwqDCoMKgwqDCoMKgwqAgPCAwIG9uIGVycm9yDQo+
Pj4gKyAqwqDCoMKgwqDCoMKgwqDCoCAwIG9uIHN1Y2Nlc3MNCj4+PiArICovDQo+Pj4gK3N0YXRp
YyBpbnQgX19pbml0IGhhbmRsZV9wYXNzdGhyb3VnaF9wcm9wKHN0cnVjdCBrZXJuZWxfaW5mbyAq
a2luZm8sDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGZkdF9w
cm9wZXJ0eSANCj4+PiAqcHJvcCwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25z
dCBjaGFyICpuYW1lLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQzMl90IGFk
ZHJlc3NfY2VsbHMsIA0KPj4+IHVpbnQzMl90IHNpemVfY2VsbHMpDQo+Pj4gK3sNCj4+PiArwqDC
oMKgIGNvbnN0IF9fYmUzMiAqY2VsbDsNCj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBpLCBsZW47
DQo+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5vZGU7DQo+Pj4gK8KgwqDCoCBp
bnQgcmVzOw0KPj4+ICsNCj4+PiArwqDCoMKgIC8qIHhlbixyZWcgc3BlY2lmaWVzIHdoZXJlIHRv
IG1hcCB0aGUgTU1JTyByZWdpb24gKi8NCj4+PiArwqDCoMKgIGlmICggZHRfcHJvcF9jbXAoInhl
bixyZWciLCBuYW1lKSA9PSAwICkNCj4+PiArwqDCoMKgIHsNCj4+PiArwqDCoMKgwqDCoMKgwqAg
cGFkZHJfdCBtc3RhcnQsIHNpemUsIGdzdGFydDsNCj4+PiArwqDCoMKgwqDCoMKgwqAgY2VsbCA9
IChjb25zdCBfX2JlMzIgKilwcm9wLT5kYXRhOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBsZW4gPSBm
ZHQzMl90b19jcHUocHJvcC0+bGVuKSAvDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKChh
ZGRyZXNzX2NlbGxzICogMiArIHNpemVfY2VsbHMpICogc2l6ZW9mKHVpbnQzMl90KSk7DQo+Pj4g
Kw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBmb3IgKCBpID0gMDsgaSA8IGxlbjsgaSsrICkNCj4+PiAr
wqDCoMKgwqDCoMKgwqAgew0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldmljZV90cmVl
X2dldF9yZWcoJmNlbGwsIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMsDQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZtc3RhcnQsICZzaXplKTsNCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBnc3RhcnQgPSBkdF9uZXh0X2NlbGwoYWRkcmVzc19jZWxscywg
JmNlbGwpOw0KPj4+ICsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIGdzdGFydCAm
IH5QQUdFX01BU0sgfHwgbXN0YXJ0ICYgflBBR0VfTUFTSyB8fCBzaXplIA0KPj4+ICYgflBBR0Vf
TUFTSyApDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcHJpbnRrKFhFTkxP
R19XQVJOSU5HLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICJEb21VIHBhc3N0aHJvdWdoIGNvbmZpZyBoYXMgbm90IHBhZ2UgDQo+Pj4gYWxpZ25l
ZCBhZGRyZXNzZXMvc2l6ZXNcbiIpOw0KPj4gSSBkb24ndCB0aGluayB0aGlzIGlzIHdpc2UgdG8g
Y29udGludWUsIHRoZSBtb3JlIHRoaXMgaXMgYSBwcmludGsgdGhhdA0KPj4gY2FuIG9ubHkgaGFw
cGVuIGluIGRlYnVnIGJ1aWxkLiBTbyBzb21lb25lIHVzaW5nIGEgcmVsZWFzZSBidWlsZCBtYXkg
bm90DQo+PiBub3RpY2UgdGhlIGVycm9yLg0KPj4NCj4+IFNvIEkgdGhpbmsgdGhpcyB3YW50cyB0
byBiZSBhIHByaW50ayhYRU5MT0dfRVJSLC4uLikgYW5kIGFsc28gcmV0dXJuIGFuDQo+PiBlcnJv
ci4NCj4+DQo+Pj4gKw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcyA9IG1hcF9yZWdp
b25zX3AybXQoa2luZm8tPmQsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGdhZGRyX3RvX2dmbihnc3RhcnQpLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBQRk5fRE9XTihzaXplKSwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFkZHJfdG9fbWZuKG1zdGFydCksDQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHAybV9tbWlvX2RpcmVjdF9kZXYpOw0KPj4g
Q29kaW5nIHN0eWxlLg0KPj4NCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIHJlcyA8
IDAgKQ0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsNCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRwcmludGsoWEVOTE9HX0VSUiwNCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiRmFpbGVkIHRvIG1hcCAlIlBSSXBhZGRy
IiB0byB0aGUgZ3Vlc3QgDQo+Pj4gYXQlIlBSSXBhZGRyIlxuIiwNCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtc3RhcnQsIGdzdGFydCk7DQo+PiBT
aW1pbGFybHksIHRoaXMgd2FudHMgdG8gYmUgYSBwcmludGsuDQo+Pg0KPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7DQo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfQ0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+Pj4gKw0KPj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gMDsNCj4+PiArwqDCoMKgIH0NCj4+PiArwqDCoMKgIC8qDQo+Pj4gK8KgwqDC
oMKgICogeGVuLHBhdGggc3BlY2lmaWVzIHRoZSBjb3JyZXNwb25kaW5nIG5vZGUgaW4gdGhlIGhv
c3QgRFQuDQo+Pj4gK8KgwqDCoMKgICogQm90aCBpbnRlcnJ1cHQgbWFwcGluZ3MgYW5kIElPTU1V
IHNldHRpbmdzIGFyZSBiYXNlZCBvbiBpdCwNCj4+PiArwqDCoMKgwqAgKiBhcyB0aGV5IGFyZSBk
b25lIGJhc2VkIG9uIHRoZSBjb3JyZXNwb25kaW5nIGhvc3QgRFQgbm9kZS4NCj4+PiArwqDCoMKg
wqAgKi8NCj4+PiArwqDCoMKgIGVsc2UgaWYgKCBkdF9wcm9wX2NtcCgieGVuLHBhdGgiLCBuYW1l
KSA9PSAwICkNCj4+PiArwqDCoMKgIHsNCj4+PiArwqDCoMKgwqDCoMKgwqAgbm9kZSA9IGR0X2Zp
bmRfbm9kZV9ieV9wYXRoKHByb3AtPmRhdGEpOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIG5v
ZGUgPT0gTlVMTCApDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHsNCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkcHJpbnRrKFhFTkxPR19FUlIsICJDb3VsZG4ndCBmaW5kIG5vZGUgJXMgaW4gaG9z
dF9kdCFcbiIsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChj
aGFyICopcHJvcC0+ZGF0YSk7DQo+PiBTYW1lIGhlcmUuDQo+Pg0KPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+IA0KPiBJ
IGhhdmUgdG8gYWRtaXQgdGhhdCBJIGRvbid0IGtub3cgYWJvdXQgZG9tMGxlc3MgZmVhdHVyZSBl
bm91Z2ggLi4uDQo+IA0KPiANCj4gQnV0LCBzaG91bGRuJ3Qgd2UgY2hlY2sgaWYgdGhlIGRldmlj
ZSBpcyBiZWhpbmQgdGhlIElPTU1VIGFuZCB0cnkgdG8gYWRkIA0KPiBpdCAoaW9tbXVfYWRkX2R0
X2RldmljZSkgYmVmb3JlIGFzc2lnbmluZyBpdCAodGhpcyBpcyBuZWVkZWQgZm9yIGRyaXZlcnMg
DQo+IHdoaWNoIHN1cHBvcnQgZ2VuZXJpYyBJT01NVSBEVCBiaW5kaW5ncyBpbiB0aGUgZmlyc3Qg
cGxhY2UpLg0KPiANCj4gW3BsZWFzZSB0YWtlIGEgbG9vayBhdCANCj4gaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA5L21zZzAyNzE0Lmh0
bWwgDQo+IGlmIHNvXQ0KPiANCj4gSnVsaWVuLCB3aGF0IGRvIHlvdSB0aGluaz8NCg0KWWVzIHlv
dSBhcmUgcmlnaHQuDQoNCkBTdGVmYW5vLCB0aGlzIGlzIGEgcmVjZW50bHkgbWVyZ2VkIGZlYXR1
cmUuIFdpdGhvdXQgaXQsIHlvdSB3aWxsIG5vdCBiZSANCmFibGUgdG8gdXNlIHBhc3N0aHJvdWdo
IHdpdGggZG9tMGxlc3MgZ3Vlc3Qgd2hlbiB0aGUgSU9NTVUgKHN1Y2ggYXMgDQpJUE1NVSkgaXMg
dXNpbmcgdGhlIGdlbmVyaWMgRFQgYmluZGluZ3MuDQoNCkNoZWVycywNCg0KLS0gDQpKdWxpZW4g
R3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
