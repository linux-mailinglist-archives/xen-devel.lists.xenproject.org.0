Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6004A7B517
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 23:37:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsZlt-0002AK-54; Tue, 30 Jul 2019 21:35:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WuyF=V3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsZlr-0002AF-Rc
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 21:35:00 +0000
X-Inumbo-ID: dec8b822-b311-11e9-8400-1738ea1f9bba
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.72]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dec8b822-b311-11e9-8400-1738ea1f9bba;
 Tue, 30 Jul 2019 21:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMJtQ+7CyHTxu2yhfGwZPwweSWHNclus0zKX7AYJnQ0=;
 b=yYyQVq9B2SZY0eQKdqTLb7s5NbVqa/FWDqiG/XeCbAqGT0H13lQmChX0s596c2ndLzOcxVTOOVLgju3xzmDtUbiSKXtjoyOeM/t9B4SPHvGKwGkdcKhnmHJUv9z386eRQ2Q6shpmqXIix8oWkxz96XaBZos0hw3rKIX0T10esCo=
Received: from VI1PR0802CA0023.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::33) by VE1PR08MB4958.eurprd08.prod.outlook.com
 (2603:10a6:803:110::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.13; Tue, 30 Jul
 2019 21:34:51 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by VI1PR0802CA0023.outlook.office365.com
 (2603:10a6:800:aa::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.12 via Frontend
 Transport; Tue, 30 Jul 2019 21:34:51 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com; lists.xenproject.org; dmarc=temperror
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 30 Jul 2019 21:34:50 +0000
Received: ("Tessian outbound a1fd2c3cfdb0:v26");
 Tue, 30 Jul 2019 21:34:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b33999b22cd950b8
X-CR-MTA-TID: 64aa7808
Received: from bce313c488ff.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BC9641F8-EA05-4200-985B-1747622D6435.1; 
 Tue, 30 Jul 2019 21:34:45 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bce313c488ff.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 30 Jul 2019 21:34:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqxlSZ8QbM6j0v+S/8KN+c2gEYPfLOiBmBTmLrVyShxHVfdV1vtofdUzPAr4h7lnVvHH5F+Bix7XBmKXfinuev9fytGEuCIGAUK2h2mgsnVYIxsbbpFRlKHXW44vP19NSuKvHFBQtWAFmRIyIkFQ7NbZs7l9UEt1wTG4E+R3jSASO0syhvTJBLviNvR4H1ysaT2ck5UCLE760UTE6teYtJFvQBwS1Vs9XQXI4GL6uaDraucVwscXZt4Euur/2tggdNjk8H1+4iyilcAG4g55fXiYfPK1gmuyB5N3y3Mv2c8osdFukHZaCt76vMIJC+2O2QimNMW66utvOjO2Zeg1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMJtQ+7CyHTxu2yhfGwZPwweSWHNclus0zKX7AYJnQ0=;
 b=b5xv3ix0CF8YNbkXlELDovaXWZRUI0Hfzv0uz0VSkUAnzIcRNfSfkbuUNMVeOSVuLHaN411n7rPHNxTKlD1gqilV7BIUXnAjfgBAeD/4941B9HhJSKwSULKzfc8JvMgDvVoNMV71ZpQhV665GBpIrF7wudpP0Ez7uR7Iik7QOResNncdRme66rKekIQ0EtqJSv+VMAJOXtNrCMrdHl0BQN0UDp9zk/O7ooSh4glzKMBZMPkVgXzeWVePyXxb5N9kAU3ZHkcg/cEwlM6aTg2/zGLvVrt8o0Nzsjskxmb4ey5N+3OGOx949H1M6WuUlKW/otvVeWzjg0gC/BYBo5KSpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMJtQ+7CyHTxu2yhfGwZPwweSWHNclus0zKX7AYJnQ0=;
 b=yYyQVq9B2SZY0eQKdqTLb7s5NbVqa/FWDqiG/XeCbAqGT0H13lQmChX0s596c2ndLzOcxVTOOVLgju3xzmDtUbiSKXtjoyOeM/t9B4SPHvGKwGkdcKhnmHJUv9z386eRQ2Q6shpmqXIix8oWkxz96XaBZos0hw3rKIX0T10esCo=
Received: from DB8PR08MB5499.eurprd08.prod.outlook.com (10.255.185.80) by
 DB8PR08MB5019.eurprd08.prod.outlook.com (10.255.16.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Tue, 30 Jul 2019 21:34:42 +0000
Received: from DB8PR08MB5499.eurprd08.prod.outlook.com
 ([fe80::716d:55cb:fc6c:dad]) by DB8PR08MB5499.eurprd08.prod.outlook.com
 ([fe80::716d:55cb:fc6c:dad%2]) with mapi id 15.20.2136.010; Tue, 30 Jul 2019
 21:34:42 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v2 33/35] xen/arm32: head: Rework and document launch()
Thread-Index: AQHVQNYgp8jJQ2XDfEWBljFzWr3G5abjt9gAgAADqwA=
Date: Tue, 30 Jul 2019 21:34:42 +0000
Message-ID: <a74d6b3c-4a9a-8006-fdc3-d3a7c0edb8d3@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-34-julien.grall@arm.com>
 <alpine.DEB.2.21.1907301421030.28600@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1907301421030.28600@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR02CA0036.eurprd02.prod.outlook.com
 (2603:10a6:6:15::49) To DB8PR08MB5499.eurprd08.prod.outlook.com
 (2603:10a6:10:fa::16)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: bd9ee618-4de2-47c6-e69f-08d71535c0d1
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR08MB5019; 
X-MS-TrafficTypeDiagnostic: DB8PR08MB5019:|VE1PR08MB4958:
X-Microsoft-Antispam-PRVS: <VE1PR08MB49586907BD1D9B8A81974E1880DC0@VE1PR08MB4958.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0114FF88F6
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(199004)(189003)(99286004)(8676002)(81156014)(81166006)(3846002)(8936002)(31686004)(6116002)(53936002)(71190400001)(478600001)(68736007)(6436002)(229853002)(6486002)(6512007)(6246003)(25786009)(14454004)(71200400001)(66556008)(66066001)(4326008)(2906002)(316002)(54906003)(6916009)(14444005)(256004)(5660300002)(31696002)(26005)(102836004)(7736002)(186003)(305945005)(44832011)(386003)(6506007)(53546011)(486006)(86362001)(11346002)(476003)(2616005)(446003)(36756003)(52116002)(76176011)(66946007)(66476007)(64756008)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5019;
 H:DB8PR08MB5499.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: Jpb99f89FAsaGWzAAYgkf+koH0wBf2MmCRtF/y4oCWfyXy50yIAF1xdxxMQDpJ0ry8pnwah1x6mW1w6Y6IqBuBwNYGjM8HvKKKbjt1lmJepDmFPwZXucf9OgNzmY62pj2y9Y1E0qhmvK/+c04KmGilxHxXeVwIqol3Ema3V75km9WfKIZrvv57cntM1rwLU5FPJ6ELAVENF6v8p/mYl4mfTyEONDzudcGgyMHyYz8EirQHLicmnybfCcwtnxYRH3XJn6kjw8y+O8e4TVajgd4lzNVNz4blPnbN0iOB7EF4w1q7geVrxe0oaWvoPwxHHYZAhxvrpeukB0XGvUmWN6Bih0V6dbjq8b+wSSw/6fXXS0yQNoY/fFVbYlVIfnZGIYmipaMMWr5Jnyi8AUcytnoZRf3W2WTWJY6ZOtRkf7HHY=
Content-ID: <56871DB141B1C34DA1BF5DE655ED61F3@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5019
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(2980300002)(189003)(199004)(36906005)(36756003)(14454004)(107886003)(31696002)(81156014)(436003)(53546011)(5660300002)(386003)(6506007)(63370400001)(26005)(102836004)(316002)(86362001)(14444005)(356004)(186003)(63350400001)(11346002)(76130400001)(336012)(81166006)(70586007)(22756006)(54906003)(6486002)(7736002)(6116002)(50466002)(6246003)(31686004)(486006)(229853002)(305945005)(3846002)(446003)(478600001)(26826003)(99286004)(8676002)(76176011)(126002)(47776003)(6512007)(476003)(6862004)(2616005)(25786009)(4326008)(70206006)(2906002)(8936002)(23676004)(66066001)(2486003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4958;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b69e781f-4b09-47e1-7183-08d71535bb7b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VE1PR08MB4958; 
NoDisclaimer: True
X-Forefront-PRVS: 0114FF88F6
X-Microsoft-Antispam-Message-Info: VlBa5+wmJ4vRcodYz2XPvHXYaCQdVgwNOt7Gkjjcwu9QFHZu87dJE5Hv4ueeLbqsDN1xxsiavxE3JAZqc3eUB7gSAysbN7ibSVwdXCWbjlEpLpVDQYbw3VeeHsf5WFwmI+9AqHIDModEJWU4CS/RZw+mY8qHmWfyvhjquccAC98PU9FRJnqhqQMql0lWMcAaiKM8TNPNLq4YDaHqf9UU3dmIHfvLG92NDcEBBh8ZZplP8TE0AIjkGRXGB9NP2KpalnFoRqQSIwWsLEIXW3A8RONBvuLnk9TBpoQ0pQyxxJb3MJCeT7InDDZgrLFyqpvaqZoF3zbSmF6ajmHCwE+2zp/YD6LVxiqJk1syGcQefhc8WT15JHUmc++PQWEkwuOs34197x4sbJOBkIZvhXJMmxhjsDKmnIwAkJs0kcQnF14=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2019 21:34:50.7284 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9ee618-4de2-47c6-e69f-08d71535c0d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4958
Subject: Re: [Xen-devel] [PATCH v2 33/35] xen/arm32: head: Rework and
 document launch()
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
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDMwLzA3LzIwMTkgMjI6MjEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24g
TW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gQm9vdCBDUFUgYW5kIHNl
Y29uZGFyeSBDUFVzIHdpbGwgdXNlIGRpZmZlcmVudCBlbnRyeSBwb2ludCB0byBDIGNvZGUuIEF0
DQo+PiB0aGUgbW9tZW50LCB0aGUgZGVjaXNpb24gb24gd2hpY2ggZW50cnkgdG8gdXNlIGlzIHRh
a2VuIHdpdGhpbiBsYXVuY2goKS4NCj4+DQo+PiBJbiBvcmRlciB0byBhdm9pZCB1c2luZyBjb25k
aXRpb25hbCBpbnN0cnVjdGlvbiBhbmQgbWFrZSB0aGUgY2FsbA0KPj4gY2xlYXJlciwgbGF1bmNo
KCkgaXMgcmV3b3JrZWQgdG8gdGFrZSBpbiBwYXJhbWV0ZXJzIHRoZSBlbnRyeSBwb2ludCBhbmQg
aXRzDQo+PiBhcmd1bWVudHMuDQo+Pg0KPj4gTGFzdGx5LCBkb2N1bWVudCB0aGUgYmVoYXZpb3Ig
YW5kIHRoZSBtYWluIHJlZ2lzdGVycyB1c2FnZSB3aXRoaW4gdGhlDQo+PiBmdW5jdGlvbi4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPg0K
Pj4NCj4+IC0tLQ0KPj4gICAgICBDaGFuZ2VzIGluIHYyOg0KPj4gICAgICAgICAgLSBQYXRjaCBh
ZGRlZA0KPj4gLS0tDQo+PiAgIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCAzNCArKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMNCj4+IGluZGV4IGUw
ZjhjMmUwY2IuLjZkNTVhMjExOWEgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIv
aGVhZC5TDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TDQo+PiBAQCAtMTcwLDYg
KzE3MCwxMSBAQCBwcmltYXJ5X3N3aXRjaGVkOg0KPj4gICAgICAgICAgIC8qIFVzZSBhIHZpcnR1
YWwgYWRkcmVzcyB0byBhY2Nlc3MgdGhlIFVBUlQuICovDQo+PiAgICAgICAgICAgbW92X3cgcjEx
LCBFQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUw0KPj4gICAjZW5kaWYNCj4+ICsgICAgICAgIFBS
SU5UKCItIFJlYWR5IC1cclxuIikNCj4+ICsgICAgICAgIC8qIFNldHVwIHRoZSBhcmd1bWVudHMg
Zm9yIHN0YXJ0X3hlbiBhbmQganVtcCB0byBDIHdvcmxkICovDQo+PiArICAgICAgICBtb3YgICBy
MCwgcjEwICAgICAgICAgICAgICAgIC8qIHIwIDo9IFBoeXNpY2FsIG9mZnNldCAqLw0KPj4gKyAg
ICAgICAgbW92ICAgcjEsIHI4ICAgICAgICAgICAgICAgICAvKiByMSA6PSBwYWRkcihGRFQpICov
DQo+PiArICAgICAgICBsZHIgICByMiwgPXN0YXJ0X3hlbg0KPj4gICAgICAgICAgIGIgICAgIGxh
dW5jaA0KPj4gICBFTkRQUk9DKHN0YXJ0KQ0KPj4gICANCj4+IEBAIC0yMzQsNiArMjM5LDkgQEAg
c2Vjb25kYXJ5X3N3aXRjaGVkOg0KPj4gICAgICAgICAgIC8qIFVzZSBhIHZpcnR1YWwgYWRkcmVz
cyB0byBhY2Nlc3MgdGhlIFVBUlQuICovDQo+PiAgICAgICAgICAgbW92X3cgcjExLCBFQVJMWV9V
QVJUX1ZJUlRVQUxfQUREUkVTUw0KPj4gICAjZW5kaWYNCj4+ICsgICAgICAgIFBSSU5UKCItIFJl
YWR5IC1cclxuIikNCj4+ICsgICAgICAgIC8qIEp1bXAgdG8gQyB3b3JsZCAqLw0KPj4gKyAgICAg
ICAgbGRyICAgcjIsID1zdGFydF9zZWNvbmRhcnkNCj4+ICAgICAgICAgICBiICAgICBsYXVuY2gN
Cj4+ICAgRU5EUFJPQyhpbml0X3NlY29uZGFyeSkNCj4+ICAgDQo+PiBAQCAtNTc4LDE5ICs1ODYs
MjUgQEAgc2V0dXBfZml4bWFwOg0KPj4gICAgICAgICAgIG1vdiAgIHBjLCBscg0KPj4gICBFTkRQ
Uk9DKHNldHVwX2ZpeG1hcCkNCj4+ICAgDQo+PiArLyoNCj4+ICsgKiBTZXR1cCB0aGUgaW5pdGlh
bCBzdGFjayBhbmQganVtcCB0byB0aGUgQyB3b3JsZA0KPj4gKyAqDQo+PiArICogSW5wdXRzOg0K
Pj4gKyAqICAgcjAgOiBBcmd1bWVudCAwIG9mIHRoZSBDIGZ1bmN0aW9uIHRvIGNhbGwNCj4+ICsg
KiAgIHIxIDogQXJndW1lbnQgMSBvZiB0aGUgQyBmdW5jdGlvbiB0byBjYWxsDQo+PiArICogICBy
MiA6IEMgZW50cnkgcG9pbnQNCj4+ICsgKg0KPj4gKyAqIENsb2JiZXJzIHIzDQo+PiArICovDQo+
PiAgIGxhdW5jaDoNCj4+IC0gICAgICAgIFBSSU5UKCItIFJlYWR5IC1cclxuIikNCj4+IC0NCj4+
IC0gICAgICAgIGxkciAgIHIwLCA9aW5pdF9kYXRhDQo+PiAtICAgICAgICBhZGQgICByMCwgI0lO
SVRJTkZPX3N0YWNrICAgIC8qIEZpbmQgdGhlIGJvb3QtdGltZSBzdGFjayAqLw0KPj4gLSAgICAg
ICAgbGRyICAgc3AsIFtyMF0NCj4+ICsgICAgICAgIGxkciAgIHIzLCA9aW5pdF9kYXRhDQo+PiAr
ICAgICAgICBhZGQgICByMywgI0lOSVRJTkZPX3N0YWNrICAgIC8qIEZpbmQgdGhlIGJvb3QtdGlt
ZSBzdGFjayAqLw0KPj4gKyAgICAgICAgbGRyICAgc3AsIFtyM10NCj4+ICAgICAgICAgICBhZGQg
ICBzcCwgI1NUQUNLX1NJWkUgICAgICAgIC8qICh3aGljaCBncm93cyBkb3duIGZyb20gdGhlIHRv
cCkuICovDQo+PiAgICAgICAgICAgc3ViICAgc3AsICNDUFVJTkZPX3NpemVvZiAgICAvKiBNYWtl
IHJvb20gZm9yIENQVSBzYXZlIHJlY29yZCAqLw0KPj4gLSAgICAgICAgdGVxICAgcjEyLCAjMA0K
Pj4gLSAgICAgICAgbW92ZXEgcjAsIHIxMCAgICAgICAgICAgICAgICAvKiBNYXJzaGFsIGFyZ3M6
IC0gcGh5c19vZmZzZXQgKi8NCj4+IC0gICAgICAgIG1vdmVxIHIxLCByOCAgICAgICAgICAgICAg
ICAgLyogICAgICAgICAgICAgICAtIERUQiBhZGRyZXNzICovDQo+PiAtICAgICAgICBiZXEgICBz
dGFydF94ZW4gICAgICAgICAgICAgIC8qIGFuZCBkaXNhcHBlYXIgaW50byB0aGUgbGFuZCBvZiBD
ICovDQo+PiAtICAgICAgICBiICAgICBzdGFydF9zZWNvbmRhcnkgICAgICAgIC8qICh0byB0aGUg
YXBwcm9wcmlhdGUgZW50cnkgcG9pbnQpICovDQo+PiArDQo+PiArICAgICAgICAvKiBKdW1wIHRv
IEMgd29ybGQgKi8NCj4+ICsgICAgICAgYnggICAgcjINCj4gDQo+IFdoeSBieD8NClRoZSBvbmx5
IHR3byBvdGhlciBwb3NzaWJsZSBpbnN0cnVjdGlvbnMgd291bGQgYmU6DQogICAgMSkgYmx4IHIy
OiB3ZSBkb24ndCBuZWVkIHRvIHNhdmUgdGhlIHJldHVybiBhZGRyZXNzDQogICAgMikgbW92IHBj
LCByMjogVGhlIEFybSBBcm0gcmVjb21tZW5kcyB0byB1c2UgYngvYmx4IGluc3RlYWQgb2YgdGhp
cy4NCg0KU28gYnggc2VlbXMgdGhlIGJlc3QgZml0LiBBbnkgb3RoZXIgc3VnZ2VzdGlvbj8NCg0K
QWxzbywgSSB3b3VsZCBwcm9iYWJseSByZXBsYWNlIGFsbCB0aGUgIm1vdiBwYywgbHIiIEkgYWRk
ZWQgd2l0aCAiYnggbHIiLg0KDQpDaGVlcnMsDQoNCi0tIA0KSnVsaWVuIEdyYWxsDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
