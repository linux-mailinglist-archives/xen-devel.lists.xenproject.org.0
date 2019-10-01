Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD95C4255
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 23:10:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFPM7-0004jg-P3; Tue, 01 Oct 2019 21:06:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFPM6-0004jb-9s
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 21:06:46 +0000
X-Inumbo-ID: 5e170314-e48f-11e9-bf31-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::621]) by localhost (Halon) with ESMTPS
 id 5e170314-e48f-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 21:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/LCTqCwGGzvM4Azk+4NclYQRPoC0q0ocd+HPJOamsw=;
 b=PS/Upy0Zg8qvF17mkJUtsX/3QdqjQeHvZWvIoIoaEIoXyl3/0tD6Yro9MLhXMsZ2TEDIAy6wk1cOMLCJwZEdTIPMkrxGpgYxIebrM6A+adls4aJkIxoziFq3ReLXrq3CTvY8SxXNGExfsUxdo1pNwuW0CvgHH0fRpawPyGPWFB8=
Received: from HE1PR08CA0047.eurprd08.prod.outlook.com (2603:10a6:7:2a::18) by
 HE1PR0802MB2476.eurprd08.prod.outlook.com (2603:10a6:3:da::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:06:39 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by HE1PR08CA0047.outlook.office365.com
 (2603:10a6:7:2a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Tue, 1 Oct 2019 21:06:39 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 21:06:37 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Tue, 01 Oct 2019 21:06:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14e76976cff537be
X-CR-MTA-TID: 64aa7808
Received: from 7b1fa20355b5.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 97F060E3-27AD-4302-B2DE-0CE9397234F4.1; 
 Tue, 01 Oct 2019 21:06:27 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7b1fa20355b5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 01 Oct 2019 21:06:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5OnJZFvgBskmMq2ilTrQZzVskP+WjAyDd/SLNk45IkkBP/NVmnBx0rpSO5iPo2Dva/5DPDY69bEEytUkaL85Kc98x1r2YpP6dFTklAvLhra9U/mxy6oTwnMHhAdwT2B2ROT92kfzdkq5dXrGSlIV37Luxr2rXyrIlc4yN+0Q+IxWd1jNnnCxvrsOl3FcoD8GRTVOtqLqco6rlLQMDUq7WVoJ36VIfRECa9gCO9ya058JyX2DSmFvngXLzDu22ase3saZHWwxo20ljm1nJd4NTQfyOdzy7UeQnyn4ndNNxtkno24cGjAws+glEUvEZKkFD1SfCglq9br8hgWZdITPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/LCTqCwGGzvM4Azk+4NclYQRPoC0q0ocd+HPJOamsw=;
 b=VbkJeNjyBj09lZ351sCsbdBL8NfvkHwFhZtKQ8n06m3nIJhv8eH1d3NhRBN5y1GMbhx5ojxArgdCZjRF72spFYEAo2FW/pFuIroLhNqAzopf3+OJFqauoY577dGoFL1qdxJ2XGCCV+M0wdeN8xIVlXMXwGNwGJGJk8E7TVHKOG+JGy6BaRUCXUyNQ+Nvdr9yFTw19YDJdEZTlmo7s7iW7cC4rsXMgp3Myo8AxAUYWk2RpEEhHeXZL8g2bP/g+olpUlzakyiSHhmlwxAIOYSBE+FazzanfjJV3EuEfR8Ywu65O6AdK1NHPWkloVFWli/RTRWz7TvqH/k1Lr2Bxn1fvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/LCTqCwGGzvM4Azk+4NclYQRPoC0q0ocd+HPJOamsw=;
 b=PS/Upy0Zg8qvF17mkJUtsX/3QdqjQeHvZWvIoIoaEIoXyl3/0tD6Yro9MLhXMsZ2TEDIAy6wk1cOMLCJwZEdTIPMkrxGpgYxIebrM6A+adls4aJkIxoziFq3ReLXrq3CTvY8SxXNGExfsUxdo1pNwuW0CvgHH0fRpawPyGPWFB8=
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com (20.179.44.81) by
 DBBPR08MB4396.eurprd08.prod.outlook.com (20.179.42.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:06:22 +0000
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9]) by DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9%4]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 21:06:22 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH RFC for-4.13 03/10] xen/arm: traps: Rework entry/exit
 from the guest path
Thread-Index: AQHVdJmX5czwtFbw3UWw2EKaW7ISC6dGQAeAgAAO6YA=
Date: Tue, 1 Oct 2019 21:06:21 +0000
Message-ID: <af8c7f32-699b-7611-495b-575a81361952@arm.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-4-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011312180.20899@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1910011312180.20899@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::26) To DBBPR08MB4554.eurprd08.prod.outlook.com
 (2603:10a6:10:d1::17)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4c1cb475-acb2-4716-a8dc-08d746b33fd8
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: DBBPR08MB4396:|DBBPR08MB4396:|HE1PR0802MB2476:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB247655C79D3F4DE2A0C51284809D0@HE1PR0802MB2476.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0177904E6B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(189003)(199004)(6512007)(14454004)(76176011)(7736002)(54906003)(305945005)(2906002)(316002)(25786009)(8936002)(5660300002)(81166006)(229853002)(81156014)(99286004)(6486002)(3846002)(36756003)(8676002)(6116002)(6436002)(4326008)(52116002)(6246003)(256004)(14444005)(66066001)(86362001)(31696002)(31686004)(186003)(66556008)(53546011)(66476007)(64756008)(486006)(66446008)(44832011)(26005)(476003)(66946007)(386003)(11346002)(102836004)(2616005)(71190400001)(71200400001)(478600001)(446003)(6916009)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4396;
 H:DBBPR08MB4554.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 0PMfTL7x2tkeRuZ4O0+X6/DUSeLHnRsRiIGK3h+3dXUVbl7n8Z6d3qC0zNbpdon2Kt8hMBwv0dvuW3iSqmwE4HL1OOE09uWrl9AeXlNNKcqJZTHOF8+UjNSIq7fIRCdsOAVWx1FRFOQUyvtMqOXdrROlLolklR41axXCyzmwpw4VPfzKFpCvSyBEe+cPBNSdsM9toD4eOF09tBcQGwZZI9nPO6rQ8I60snUg2za2WRsY+tQQs/6TWuEFctbWCutZI/+HhBbXu6GPj1O7hHyZox4oldouXT9XV0wtlzC26p9AoqeR6ERLkWl1mNVweXrCK8UJRn6qI4BQERFGiXoTGCpNXPrT9gqpp9rJZJyBFezS/fHIC8NYLnr3CsJ08QF5dBbyYulmxBMcn+jVN+t3gDVMFPEfEIoxPUDD3m5uEHY=
Content-ID: <DC6AB8CDFC1E6440918866FA3C6E9510@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4396
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(199004)(189003)(50466002)(14454004)(63350400001)(476003)(486006)(70586007)(2616005)(25786009)(66066001)(47776003)(336012)(436003)(11346002)(356004)(26826003)(446003)(478600001)(31686004)(76130400001)(5660300002)(7736002)(305945005)(126002)(70206006)(23676004)(8676002)(6116002)(36756003)(229853002)(316002)(3846002)(81166006)(2486003)(8936002)(26005)(36906005)(53546011)(81156014)(6486002)(76176011)(102836004)(99286004)(22756006)(6246003)(2906002)(14444005)(4326008)(31696002)(54906003)(86362001)(386003)(6512007)(186003)(6862004)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2476;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 94010b0c-3993-4dfb-a535-08d746b3361e
NoDisclaimer: True
X-Forefront-PRVS: 0177904E6B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9++YyAH9yTF+2f2drOXy1jYEoi17eZad0qWWzJ2vtNRG92XZCxgezHrsUs3M8KnKRPGjG/TWtnNZRTYViqarEqTcDY0rWt2Z4nB0V93r1pzQjRPMCALMMP6yJRg73ANgpab4XYvXgW2YE9Nl9shUj1eAIHAQXfaogDkqzCRWf8Xb8uI/Fw1Au5oLU6GK5ipwuTPjpogUGE1Szg2Jc3WcZ68B90YWAd/TpNaME8flA+RRQ9HR9qfMJNbeiQmh96uAp4Yihm+z6PLyLm8zSdr4zov2IidXRawvUiAOI90d2+w0Qn1o+d7aHeN3XUcpFGxFvczrLAgFrq6GW4HD+RalqRcOIVBbMlGUNsZyeZT0XYF4ZZM7U9xR/I2mtzPVUT75Em8Id0rYAVFJaxQ448kj9RP2NTKAzTpABJNjIkY7A2g=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 21:06:37.8867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1cb475-acb2-4716-a8dc-08d746b33fd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2476
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 03/10] xen/arm: traps: Rework
 entry/exit from the guest path
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
 Andre Przywara <Andre.Przywara@arm.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDAxLzEwLzIwMTkgMjE6MTIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gVGh1LCAyNiBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gQXQgdGhlIG1vbWVu
dCwgZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKCkgYW5kIGxlYXZlX2h5cGVydmlzb3JfdGFpbCgpIGFy
ZQ0KPj4gdXNlZCB0byBkZWFsIHdpdGggYWN0aW9ucyB0byBiZSBkb25lIGJlZm9yZS9hZnRlciBh
bnkgZ3Vlc3QgcmVxdWVzdCBpcw0KPj4gaGFuZGxlZC4NCj4+DQo+PiBXaGlsZSB0aGV5IGFyZSBt
ZWFudCB0byB3b3JrIGluIHBhaXIsIHRoZSBmb3JtZXIgaXMgY2FsbGVkIGZvciBtb3N0IG9mDQo+
PiB0aGUgdHJhcHMsIGluY2x1ZGluZyB0cmFwcyBmcm9tIHRoZSBzYW1lIGV4Y2VwdGlvbiBsZXZl
bCAoaS5lLg0KPj4gaHlwZXJ2aXNvcikgd2hpbHN0IHRoZSBsYXR0ZXIgd2lsbCBvbmx5IGJlIGNh
bGxlZCB3aGVuIHJldHVybmluZyB0byB0aGUNCj4+IGd1ZXN0Lg0KPj4NCj4+IEFzIHBvaW50ZWQg
b3V0LCB0aGUgZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKCkgaXMgbm90IGNhbGxlZCBmcm9tIGFsbCB0
aGUNCj4+IHRyYXBzLCBzbyB0aGlzIG1ha2VzIHBvdGVudGlhbGx5IGRpZmZpY3VsdCB0byBleHRl
bmQgaXQgZm9yIHRoZSBkZWFsaW5nDQo+PiB3aXRoIHNhbWUgZXhjZXB0aW9uIGxldmVsLg0KPj4N
Cj4+IEZ1cnRoZXJtb3JlLCBzb21lIGFzc2VtYmx5IG9ubHkgcGF0aCB3aWxsIHJlcXVpcmUgdG8g
Y2FsbA0KPj4gZW50ZXJfaHlwZXJ2aXNvcl90YWlsKCkuIFNvIHRoZSBmdW5jdGlvbiBpcyBub3cg
ZGlyZWN0bHkgY2FsbCBieQ0KPj4gYXNzZW1ibHkgaW4gZm9yIGd1ZXN0IHZlY3RvciBvbmx5LiBU
aGlzIG1lYW5zIHRoYXQgdGhlIGNoZWNrIHdoZXRoZXIgd2UNCj4+IGFyZSBjYWxsZWQgaW4gYSBn
dWVzdCB0cmFwIGNhbiBub3cgYmUgcmVtb3ZlZC4NCj4+DQo+PiBUYWtlIHRoZSBvcHBvcnR1bml0
eSB0byByZW5hbWUgZW50ZXJfaHlwZXJ2aXNvcl90YWlsKCkgYW5kDQo+PiBsZWF2ZV9oeXBlcnZp
c29yX3RhaWwoKSB0byBzb21ldGhpbmcgbW9yZSBtZWFuaW5nZnVsIGFuZCBkb2N1bWVudCB0aGVt
Lg0KPj4gVGhpcyBzaG91bGQgaGVscCBldmVyeW9uZSB0byB1bmRlcnN0YW5kIHRoZSBwdXJwb3Nl
IG9mIHRoZSB0d28NCj4+IGZ1bmN0aW9ucy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPj4NCj4+IC0tLQ0KPj4NCj4+IEkgaGF2ZW4n
dCBkb25lIHRoZSAzMi1iaXRzIHBhcnQgeWV0LiBJIHdhbnRlZCB0byBnYXRoZXIgZmVlZGJhY2sg
YmVmb3JlDQo+PiBsb29raW5nIGluIGRldGFpbHMgaG93IHRvIGludGVncmF0ZSB0aGF0IHdpdGgg
QXJtMzIuDQo+PiAtLS0NCj4+ICAgeGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMgfCAgNCArKy0N
Cj4+ICAgeGVuL2FyY2gvYXJtL3RyYXBzLmMgICAgICAgfCA3MSArKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5z
ZXJ0aW9ucygrKSwgMzggZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9hcm02NC9lbnRyeS5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMNCj4+IGluZGV4
IDQwZDlmM2VjOGMuLjllYWZhZTUxNmIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJt
NjQvZW50cnkuUw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMNCj4+IEBAIC0x
NDcsNyArMTQ3LDcgQEANCj4+ICAgDQo+PiAgICAgICAgICAgLmlmIFxoeXAgPT0gMCAgICAgICAg
IC8qIEd1ZXN0IG1vZGUgKi8NCj4+ICAgDQo+PiAtICAgICAgICBibCAgICAgIGxlYXZlX2h5cGVy
dmlzb3JfdGFpbCAvKiBEaXNhYmxlcyBpbnRlcnJ1cHRzIG9uIHJldHVybiAqLw0KPj4gKyAgICAg
ICAgYmwgICAgICBsZWF2ZV9oeXBlcnZpc29yX3RvX2d1ZXN0IC8qIERpc2FibGVzIGludGVycnVw
dHMgb24gcmV0dXJuICovDQo+PiAgIA0KPj4gICAgICAgICAgIGV4aXRfZ3Vlc3QgXGNvbXBhdA0K
Pj4gICANCj4+IEBAIC0xNzUsNiArMTc1LDggQEANCj4+ICAgICAgICAgICAgICAgICAgICAgICBT
S0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUKQ0KPj4gICAgICAgICAgIG1zciAgICAg
ZGFpZmNsciwgXGlmbGFncw0KPj4gICAgICAgICAgIG1vdiAgICAgeDAsIHNwDQo+PiArICAgICAg
ICBibCAgICAgIGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdA0KPj4gKyAgICAgICAgbW92ICAg
ICB4MCwgc3ANCj4+ICAgICAgICAgICBibCAgICAgIGRvX3RyYXBfXHRyYXANCj4+ICAgMToNCj4+
ICAgICAgICAgICBleGl0ICAgIGh5cD0wLCBjb21wYXQ9XGNvbXBhdA0KPj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMNCj4+IGluZGV4IGEz
Yjk2MWJkMDYuLjIwYmEzNGVjOTEgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMu
Yw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMNCj4+IEBAIC0yMDA2LDQ3ICsyMDA2LDQ2
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBuZWVkc19zc2JkX2ZsaXAoc3RydWN0IHZjcHUgKnYpDQo+
PiAgICAgICAgICAgICAgICBjcHVfcmVxdWlyZV9zc2JkX21pdGlnYXRpb24oKTsNCj4+ICAgfQ0K
Pj4gICANCj4+IC1zdGF0aWMgdm9pZCBlbnRlcl9oeXBlcnZpc29yX2hlYWQoc3RydWN0IGNwdV91
c2VyX3JlZ3MgKnJlZ3MpDQo+PiArLyoNCj4+ICsgKiBBY3Rpb25zIHRoYXQgbmVlZHMgdG8gYmUg
ZG9uZSBhZnRlciBleGl0aW5nIHRoZSBndWVzdCBhbmQgYmVmb3JlIGFueQ0KPj4gKyAqIHJlcXVl
c3QgZnJvbSBpdCBpcyBoYW5kbGVkLg0KPj4gKyAqLw0KPj4gK3ZvaWQgZW50ZXJfaHlwZXJ2aXNv
cl9mcm9tX2d1ZXN0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gICB7DQo+PiAtICAg
IGlmICggZ3Vlc3RfbW9kZShyZWdzKSApDQo+PiAtICAgIHsNCj4+IC0gICAgICAgIHN0cnVjdCB2
Y3B1ICp2ID0gY3VycmVudDsNCj4+ICsgICAgc3RydWN0IHZjcHUgKnYgPSBjdXJyZW50Ow0KPj4g
ICANCj4+IC0gICAgICAgIC8qIElmIHRoZSBndWVzdCBoYXMgZGlzYWJsZWQgdGhlIHdvcmthcm91
bmQsIGJyaW5nIGl0IGJhY2sgb24uICovDQo+PiAtICAgICAgICBpZiAoIG5lZWRzX3NzYmRfZmxp
cCh2KSApDQo+PiAtICAgICAgICAgICAgYXJtX3NtY2NjXzFfMV9zbWMoQVJNX1NNQ0NDX0FSQ0hf
V09SS0FST1VORF8yX0ZJRCwgMSwgTlVMTCk7DQo+PiArICAgIC8qIElmIHRoZSBndWVzdCBoYXMg
ZGlzYWJsZWQgdGhlIHdvcmthcm91bmQsIGJyaW5nIGl0IGJhY2sgb24uICovDQo+PiArICAgIGlm
ICggbmVlZHNfc3NiZF9mbGlwKHYpICkNCj4+ICsgICAgICAgIGFybV9zbWNjY18xXzFfc21jKEFS
TV9TTUNDQ19BUkNIX1dPUktBUk9VTkRfMl9GSUQsIDEsIE5VTEwpOw0KPj4gICANCj4+IC0gICAg
ICAgIC8qDQo+PiAtICAgICAgICAgKiBJZiB3ZSBwZW5kZWQgYSB2aXJ0dWFsIGFib3J0LCBwcmVz
ZXJ2ZSBpdCB1bnRpbCBpdCBnZXRzIGNsZWFyZWQuDQo+PiAtICAgICAgICAgKiBTZWUgQVJNIEFS
TSBEREkgMDQ4N0EuaiBEMS4xNC4zIChWaXJ0dWFsIEludGVycnVwdHMpIGZvciBkZXRhaWxzLA0K
Pj4gLSAgICAgICAgICogYnV0IHRoZSBjcnVjaWFsIGJpdCBpcyAiT24gdGFraW5nIGEgdlNFcnJv
ciBpbnRlcnJ1cHQsIEhDUl9FTDIuVlNFDQo+PiAtICAgICAgICAgKiAoYWxpYXMgb2YgSENSLlZB
KSBpcyBjbGVhcmVkIHRvIDAuIg0KPj4gLSAgICAgICAgICovDQo+PiAtICAgICAgICBpZiAoIHYt
PmFyY2guaGNyX2VsMiAmIEhDUl9WQSApDQo+PiAtICAgICAgICAgICAgdi0+YXJjaC5oY3JfZWwy
ID0gUkVBRF9TWVNSRUcoSENSX0VMMik7DQo+PiArICAgIC8qDQo+PiArICAgICAqIElmIHdlIHBl
bmRlZCBhIHZpcnR1YWwgYWJvcnQsIHByZXNlcnZlIGl0IHVudGlsIGl0IGdldHMgY2xlYXJlZC4N
Cj4+ICsgICAgICogU2VlIEFSTSBBUk0gRERJIDA0ODdBLmogRDEuMTQuMyAoVmlydHVhbCBJbnRl
cnJ1cHRzKSBmb3IgZGV0YWlscywNCj4+ICsgICAgICogYnV0IHRoZSBjcnVjaWFsIGJpdCBpcyAi
T24gdGFraW5nIGEgdlNFcnJvciBpbnRlcnJ1cHQsIEhDUl9FTDIuVlNFDQo+PiArICAgICAqIChh
bGlhcyBvZiBIQ1IuVkEpIGlzIGNsZWFyZWQgdG8gMC4iDQo+PiArICAgICAqLw0KPj4gKyAgICBp
ZiAoIHYtPmFyY2guaGNyX2VsMiAmIEhDUl9WQSApDQo+PiArICAgICAgICB2LT5hcmNoLmhjcl9l
bDIgPSBSRUFEX1NZU1JFRyhIQ1JfRUwyKTsNCj4+ICAgDQo+PiAgICNpZmRlZiBDT05GSUdfTkVX
X1ZHSUMNCj4+IC0gICAgICAgIC8qDQo+PiAtICAgICAgICAgKiBXZSBuZWVkIHRvIHVwZGF0ZSB0
aGUgc3RhdGUgb2Ygb3VyIGVtdWxhdGVkIGRldmljZXMgdXNpbmcgbGV2ZWwNCj4+IC0gICAgICAg
ICAqIHRyaWdnZXJlZCBpbnRlcnJ1cHRzIGJlZm9yZSBzeW5jaW5nIGJhY2sgdGhlIFZHSUMgc3Rh
dGUuDQo+PiAtICAgICAgICAgKg0KPj4gLSAgICAgICAgICogVE9ETzogSW52ZXN0aWdhdGUgd2hl
dGhlciB0aGlzIGlzIG5lY2Vzc2FyeSB0byBkbyBvbiBldmVyeQ0KPj4gLSAgICAgICAgICogdHJh
cCBhbmQgaG93IGl0IGNhbiBiZSBvcHRpbWlzZWQuDQo+PiAtICAgICAgICAgKi8NCj4+IC0gICAg
ICAgIHZ0aW1lcl91cGRhdGVfaXJxcyh2KTsNCj4+IC0gICAgICAgIHZjcHVfdXBkYXRlX2V2dGNo
bl9pcnEodik7DQo+PiArICAgIC8qDQo+PiArICAgICAqIFdlIG5lZWQgdG8gdXBkYXRlIHRoZSBz
dGF0ZSBvZiBvdXIgZW11bGF0ZWQgZGV2aWNlcyB1c2luZyBsZXZlbA0KPj4gKyAgICAgKiB0cmln
Z2VyZWQgaW50ZXJydXB0cyBiZWZvcmUgc3luY2luZyBiYWNrIHRoZSBWR0lDIHN0YXRlLg0KPj4g
KyAgICAgKg0KPj4gKyAgICAgKiBUT0RPOiBJbnZlc3RpZ2F0ZSB3aGV0aGVyIHRoaXMgaXMgbmVj
ZXNzYXJ5IHRvIGRvIG9uIGV2ZXJ5DQo+PiArICAgICAqIHRyYXAgYW5kIGhvdyBpdCBjYW4gYmUg
b3B0aW1pc2VkLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgdnRpbWVyX3VwZGF0ZV9pcnFzKHYpOw0K
Pj4gKyAgICB2Y3B1X3VwZGF0ZV9ldnRjaG5faXJxKHYpOw0KPj4gICAjZW5kaWYNCj4+ICAgDQo+
PiAtICAgICAgICB2Z2ljX3N5bmNfZnJvbV9scnModik7DQo+PiAtICAgIH0NCj4+ICsgICAgdmdp
Y19zeW5jX2Zyb21fbHJzKHYpOw0KPj4gICB9DQo+PiAgIA0KPj4gICB2b2lkIGRvX3RyYXBfZ3Vl
c3Rfc3luYyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgew0KPj4gICAgICAgY29u
c3QgdW5pb24gaHNyIGhzciA9IHsgLmJpdHMgPSByZWdzLT5oc3IgfTsNCj4+ICAgDQo+PiAtICAg
IGVudGVyX2h5cGVydmlzb3JfaGVhZChyZWdzKTsNCj4+IC0NCj4+ICAgICAgIHN3aXRjaCAoIGhz
ci5lYyApDQo+PiAgICAgICB7DQo+PiAgICAgICBjYXNlIEhTUl9FQ19XRklfV0ZFOg0KPj4gQEAg
LTIxODAsOCArMjE3OSw2IEBAIHZvaWQgZG9fdHJhcF9oeXBfc3luYyhzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVncykNCj4+ICAgew0KPj4gICAgICAgY29uc3QgdW5pb24gaHNyIGhzciA9IHsgLmJp
dHMgPSByZWdzLT5oc3IgfTsNCj4+ICAgDQo+PiAtICAgIGVudGVyX2h5cGVydmlzb3JfaGVhZChy
ZWdzKTsNCj4+IC0NCj4+ICAgICAgIHN3aXRjaCAoIGhzci5lYyApDQo+PiAgICAgICB7DQo+PiAg
ICNpZmRlZiBDT05GSUdfQVJNXzY0DQo+PiBAQCAtMjIxOCwyNyArMjIxNSwyMSBAQCB2b2lkIGRv
X3RyYXBfaHlwX3N5bmMoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgIA0KPj4gICB2
b2lkIGRvX3RyYXBfaHlwX3NlcnJvcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAg
ew0KPj4gLSAgICBlbnRlcl9oeXBlcnZpc29yX2hlYWQocmVncyk7DQo+PiAtDQo+PiAgICAgICBf
X2RvX3RyYXBfc2Vycm9yKHJlZ3MsIFZBQk9SVF9HRU5fQllfR1VFU1QocmVncykpOw0KPj4gICB9
DQo+PiAgIA0KPj4gICB2b2lkIGRvX3RyYXBfZ3Vlc3Rfc2Vycm9yKHN0cnVjdCBjcHVfdXNlcl9y
ZWdzICpyZWdzKQ0KPj4gICB7DQo+PiAtICAgIGVudGVyX2h5cGVydmlzb3JfaGVhZChyZWdzKTsN
Cj4+IC0NCj4+ICAgICAgIF9fZG9fdHJhcF9zZXJyb3IocmVncywgdHJ1ZSk7DQo+PiAgIH0NCj4+
ICAgDQo+PiAgIHZvaWQgZG9fdHJhcF9pcnEoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+
PiAgIHsNCj4+IC0gICAgZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKHJlZ3MpOw0KPj4gICAgICAgZ2lj
X2ludGVycnVwdChyZWdzLCAwKTsNCj4+ICAgfQ0KPj4gICANCj4+ICAgdm9pZCBkb190cmFwX2Zp
cShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgew0KPj4gLSAgICBlbnRlcl9oeXBl
cnZpc29yX2hlYWQocmVncyk7DQo+PiAgICAgICBnaWNfaW50ZXJydXB0KHJlZ3MsIDEpOw0KPj4g
ICB9DQo+IA0KPiBJIGFtIE9LIHdpdGggdGhlIGdlbmVyYWwgYXBwcm9hY2ggYnV0IG9uZSB0aGlu
ZyB0byBub3RlIGlzIHRoYXQgdGhlIGZpcQ0KPiBoYW5kbGVyIGRvZXNuJ3QgdXNlIHRoZSBndWVz
dF92ZWN0b3IgbWFjcm8gYXQgdGhlIG1vbWVudC4NCg0KZG9fdHJhcF9maXEoKSBpcyBub3QgY2Fs
bGVkIGZyb20gYXJtNjQgSW5zdGVhZCwgd2UgY2FsbCBkb19iYWRfbW9kZSgpLiANClNvIEkgZG9u
J3Qgc2VlIGFuIGlzc3VlIGhlcmUuDQoNCkFzIGRvX2JhZF9tb2RlKCkgZG9lcyBub3QgY2FsbCBl
bnRlcl9oeXBlcnZpc29yX2hlYWQoKSwgdGhlIGZpcSBoYW5kbGVyIA0KZG9lcyBub3QgdXNlIGd1
ZXN0X3ZlY3Rvci4NCg0KVGhhdCBzYWlkLCBpdCBpcyBpbnRlcmVzdGluZyB0byBzZWUgdGhhdCB3
ZSBkb24ndCBkZWFsIHRoZSBzYW1lIHdheSB0aGUgDQpGSVEgb24gQXJtMzIgYW5kIEFybTY0LiBP
biB0aGUgZm9ybWVyLCB3ZSB3aWxsIGNhbGwgZG9fSVJRIHdoaWxlIHRoZSANCmxhdHRlciB3aWxs
IGNyYXNoIHRoZSBndWVzdC4NCg0KSXQgd291bGQgYmUgZ29vZCBpZiB3ZSBjYW4gaGF2ZSB0aGUg
c2FtZSBiZWhhdmlvciBhY2Nyb3NzIHRoZSB0d28gYXJjaCANCmlmIHBvc3NpYmxlLiBJIHZhZ3Vl
bHkgcmVjYWxsIHNvbWVvbmUgKEFuZHJlPykgbWVudGlvbmluZyBzb21lIGNoYW5nZXMgDQphcm91
bmQgRklRIGluIEtWTSByZWNlbnRseS4gQW5kcmUsIGFyZSBGSVEgbWVhbnQgdG8gd29yayB3aXRo
IEd1ZXN0Pw0KDQpBbHNvLCBhIHNpZGUgZWZmZWN0IG9mIG5vdCBjYWxsaW5nIGVudGVyX2h5cGVy
dmlzb3JfaGVhZCgpIGlzIHdvcmthcm91bmQgDQphcmUgbm90IHJlLWVuYWJsZWQuIFdlIGFyZSBn
b2luZyB0byBwYW5pYyBzb29uIGFmdGVyLCBzbyBpdCBtYXkgbm90IGJlIA0KdGhhdCBtdWNoIGFu
IGlzc3VlLg0KDQpJIHdpbGwgaGF2ZSBhIHRoaW5rIGFib3V0IGl0Lg0KDQpDaGVlcnMsDQoNCi0t
IA0KSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
