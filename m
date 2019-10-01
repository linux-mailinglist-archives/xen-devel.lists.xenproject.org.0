Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4DEC43EB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 00:47:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFQsX-00046H-KH; Tue, 01 Oct 2019 22:44:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFQsW-00046C-Bm
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 22:44:20 +0000
X-Inumbo-ID: ffbe68d0-e49c-11e9-9709-12813bfff9fa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.89]) by localhost (Halon) with ESMTPS
 id ffbe68d0-e49c-11e9-9709-12813bfff9fa;
 Tue, 01 Oct 2019 22:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61eAluV5SxgImzPumZ+YbsbxTCdfCoHmK+Cgv7T5rCM=;
 b=BI2/Ii6Og6XzZ7CZxslYpyvtm1RigqU2fHPFoKKKQTzjO2GSqw7Tb7Ea2B1ATwXJuAJxx0jEdeRqgMTvUe6znNh/UkT5W0GibGINGPjKIDO12aw8KthhrtQvx/PQQul+PYQqqJZY3AwVmOvrBUFbGzRkVV19q3iJ/+4iZ3Wor2I=
Received: from HE1PR0802CA0020.eurprd08.prod.outlook.com (2603:10a6:3:bd::30)
 by AM6PR08MB4070.eurprd08.prod.outlook.com (2603:10a6:20b:a3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Tue, 1 Oct
 2019 22:44:14 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by HE1PR0802CA0020.outlook.office365.com
 (2603:10a6:3:bd::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Tue, 1 Oct 2019 22:44:14 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 22:44:13 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Tue, 01 Oct 2019 22:44:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25b0bc7bdf05a17c
X-CR-MTA-TID: 64aa7808
Received: from a08912346a90.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC915AD3-D125-4E6C-BAE7-163AE6DAF244.1; 
 Tue, 01 Oct 2019 22:44:06 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a08912346a90.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 01 Oct 2019 22:44:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5KC2ZY8+t3eVWAERkUVLCN0OdoFqGneckvW6HKvrHepLH0nkSEZWnWzkELm5LnVp4YNtXOjhDfbAPLRV7hRpcPaT7BMyY1nNviqsayDj29STPEVuQabP9dhBJib55Mhtv57IXw6MOBochAfgfXfdBePazYJufJIT56+nJ44pUZH+4rbIxW9JMkxZivQoxcG68bZoVGTjegM+JBsrSl4y1NAMJTohEPmDVTsYhLPvu+JyarqZcbg5+1yqnBMTF0pKuZpS36hVWsEGKaDmfNbnFda9J07ZxpWyOPRBlF/grzzvTwdb3t5jh71SD3uFmM7RIaniMn6IbM60if99TPlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61eAluV5SxgImzPumZ+YbsbxTCdfCoHmK+Cgv7T5rCM=;
 b=DEHbAlYRADTtskMlShJZfhfvEQBO2hTDgCoAn13KhMIaAZh2L3eY0uatsKT9jttatc79sqn/CcYpRFq7/KzYHQ2L93yAkcsh3Y6zf5J+Iec4HmwRcwbWCajJ+2fIpRFYeAhJ+MTulkw+A/VqXIYig8nh4KK0Jri1M5asHTmBZYODKWZ2lWZH587E/gp77c7MCEwTvecLLwWANipEIvB1/nwF5OeRmlN3KegruFwsvBVaSLBrXKxV3CxFjk5jtqTetLWxcMru+6rjusMf2Wc8V5+o+jFnKACjefb+Bm81KQJjQdXEz+xTKPHXbsyYRwWhFQ3vEs4H1wROxqB2bj4kBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61eAluV5SxgImzPumZ+YbsbxTCdfCoHmK+Cgv7T5rCM=;
 b=BI2/Ii6Og6XzZ7CZxslYpyvtm1RigqU2fHPFoKKKQTzjO2GSqw7Tb7Ea2B1ATwXJuAJxx0jEdeRqgMTvUe6znNh/UkT5W0GibGINGPjKIDO12aw8KthhrtQvx/PQQul+PYQqqJZY3AwVmOvrBUFbGzRkVV19q3iJ/+4iZ3Wor2I=
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com (20.179.44.81) by
 DBBPR08MB4855.eurprd08.prod.outlook.com (20.179.46.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Tue, 1 Oct 2019 22:44:05 +0000
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9]) by DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9%4]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 22:44:04 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH RFC for-4.13 09/10] xen/arm: asm: Replace use of
 ALTERNATIVE with alternative_if
Thread-Index: AQHVdJmakvRy0HmRrECoJRHrsgituKdGY0kAgAAG9QA=
Date: Tue, 1 Oct 2019 22:44:04 +0000
Message-ID: <4748bf97-3354-f4eb-5df3-e19b37d635e1@arm.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-10-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011518240.2943@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1910011518240.2943@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::32) To DBBPR08MB4554.eurprd08.prod.outlook.com
 (2603:10a6:10:d1::17)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a4295cd4-338c-4231-7bb4-08d746c0e1e5
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: DBBPR08MB4855:|AM6PR08MB4070:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4070D9B37E7B84D8EE4D9D00809D0@AM6PR08MB4070.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0177904E6B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(189003)(199004)(76176011)(4326008)(2616005)(14444005)(6246003)(44832011)(256004)(476003)(446003)(11346002)(486006)(6512007)(6436002)(52116002)(99286004)(71200400001)(71190400001)(186003)(6486002)(102836004)(229853002)(53546011)(6506007)(386003)(81166006)(81156014)(8676002)(66066001)(2906002)(66446008)(7736002)(8936002)(14454004)(31686004)(6916009)(26005)(305945005)(478600001)(36756003)(3846002)(6116002)(66476007)(31696002)(66556008)(64756008)(54906003)(316002)(66946007)(5660300002)(86362001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4855;
 H:DBBPR08MB4554.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: kVTnPzbpqyZhtrqNHsvxjiYAeDcVpHFLgQS8ALXMY0uq0CKBPbn4CVL21pE+dApiMCUFZj2L45Pe0h53BiV6AiwjcLXe8ZOcj9oHHvRv2Oga6NPNEirnmS8ZcL9XvsLaa2ajOsbMQntebm3oy+PPepMWPdZtjlu1EiH1BGNDKijsUiSM4TR5D8z48r4Lwx8G/H9lDZZ5d+Z880O2gcncCcTtQSvB6Py2JDeoGaGEzw8bEu+ZJ4a73ZhVw6KxwxCRh9AIV3ugyNmd2opMymTsK7d/YHDKWfsfPupECn78xYUWlitRzQQ7VBnyaKxYVpzOca2qz2vIW9P91IZRkjnQTXoMS/+dw4guc8t7MoixBjPtk9gwLlZwsaH+ljui4Clx7oELSyxiM7xqtpD1MwALaldmJrwhY6riPCzqOpjbZ7I=
x-ms-exchange-transport-forked: True
Content-ID: <A87EB632F2CC554FACA61391F7B01377@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4855
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(189003)(199004)(6862004)(26826003)(31686004)(7736002)(305945005)(478600001)(316002)(86362001)(36906005)(8936002)(81166006)(81156014)(36756003)(8676002)(76130400001)(70206006)(70586007)(54906003)(25786009)(386003)(6506007)(53546011)(229853002)(107886003)(102836004)(6246003)(2486003)(23676004)(6512007)(47776003)(356004)(486006)(126002)(476003)(2616005)(66066001)(11346002)(446003)(336012)(63350400001)(436003)(6486002)(26005)(76176011)(186003)(5660300002)(31696002)(22756006)(4326008)(14444005)(50466002)(6116002)(3846002)(14454004)(99286004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4070;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a006ed77-47c6-4c44-eba2-08d746c0dc8a
NoDisclaimer: True
X-Forefront-PRVS: 0177904E6B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +55e+WjxDZffSoWb1fqNN4DKnyXE03yowAYe8mO9wC2Gm+1k1cN28TX2fX7Qffcj+PM+vZtRnGgpFQwOZuP0ixsdOJnxeglGvsv7xv9kovSAEG0wZwyJ+JPPeMGf8wRhVzExxtiXxavTzKjJ6BTuE9rcWUi5oLW8smG2pHNzYOD3LFodXop4Nl9Djbz3aFqmWFK4HecxiM5RRNgMa6vVrrC7bZ7iJQ/8XIQ2Kv76SYgOoVIbZi3iGFRl/KjdSXgVB2SazJd7xPYJLCCF/glOoEy4HWD1G2MGHzXpQ2k47XLFV1yAlbcpcf2Jz55fxdLw2wB5tkT2mxv888Rzd11SBUdWeaYnIpy3kXx3/b5AUh85J6yl1OzEdCjnPJo15yxRDT4ns438rmM8bCe+h+1RkGdONcOsOrLMo/IZbv3HWws=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 22:44:13.2521 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4295cd4-338c-4231-7bb4-08d746c0e1e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4070
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 09/10] xen/arm: asm: Replace
 use of ALTERNATIVE with alternative_if
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
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywNCg0KT24gMDEvMTAvMjAxOSAyMzoxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPiBPbiBUaHUsIDI2IFNlcCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBVc2lu
ZyBhbHRlcm5hdGl2ZV9pZiBtYWtlcyB0aGUgY29kZSBhIGJpdCBtb3JlIHN0cmVhbWxpbmVkLg0K
Pj4NCj4+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHVzZSB0aGUgbmV3IGF1dG8tbm9wIGluZnJh
c3RydWN0dXJlIHRvIGF2b2lkDQo+PiBjb3VudGluZyB0aGUgbnVtYmVyIG9mIG5vcCBpbiB0aGUg
ZWxzZSBwYXJ0IGZvciBhcmNoL2FybS9hcm02NC9lbnRyeS5TDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4+DQo+PiAtLS0NCj4+ICAg
ICAgVGhpcyBpcyBwcmV0dHkgbXVjaCBhIG1hdHRlciBvZiB0YXN0ZSwgYnV0IGF0IGxlYXN0IGZv
ciBhcm02NCB0aGlzDQo+PiAgICAgIGFsbG93cyB1cyB0byB1c2UgdGhlIGF1dG8tbm9wIGluZnJh
c3RydWN0dXJlLiBTbyB0aGUgYXJtMzIgaXMgbW9yZQ0KPj4gICAgICB0byBrZWVwIGlubGluZSB3
aXRoIGFybTY0Lg0KPj4gLS0tDQo+PiAgIHhlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TIHwgOSAr
KysrKystLS0NCj4+ICAgeGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMgfCA4ICsrKysrLS0tDQo+
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2VudHJ5LlMgYi94ZW4vYXJjaC9h
cm0vYXJtMzIvZW50cnkuUw0KPj4gaW5kZXggMGI0Y2QxOWFiZC4uMTQyOGNkMzU4MyAxMDA2NDQN
Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TDQo+PiArKysgYi94ZW4vYXJjaC9h
cm0vYXJtMzIvZW50cnkuUw0KPj4gQEAgLTY1LDkgKzY1LDEyIEBAIHNhdmVfZ3Vlc3RfcmVnczoN
Cj4+ICAgICAgICAgICAgKiBJZiB0aGUgU0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5UUllfRVhJ
VCBoYXMgYmVlbiBzZXQgaW4gdGhlIGNwdQ0KPj4gICAgICAgICAgICAqIGZlYXR1cmUsIHRoZSBj
aGVja2luZyBvZiBwZW5kaW5nIFNFcnJvcnMgd2lsbCBiZSBza2lwcGVkLg0KPj4gICAgICAgICAg
ICAqLw0KPj4gLSAgICAgICAgQUxURVJOQVRJVkUoIm5vcCIsDQo+PiAtICAgICAgICAgICAgICAg
ICAgICAiYiBza2lwX2NoZWNrIiwNCj4+IC0gICAgICAgICAgICAgICAgICAgIFNLSVBfU1lOQ0hS
T05JWkVfU0VSUk9SX0VOVFJZX0VYSVQpDQo+PiArICAgICAgICBhbHRlcm5hdGl2ZV9pZiBTS0lQ
X1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUDQo+PiArICAgICAgICBub3ANCj4+ICsgICAg
ICAgIGFsdGVybmF0aXZlX2Vsc2UNCj4+ICsgICAgICAgIGIgICBza2lwX2NoZWNrDQo+PiArICAg
ICAgICBhbHRlcm5hdGl2ZV9lbmRpZg0KPiANCj4gVGhpcyBjb3VsZCBiZSB3cml0dGVuIGFzOg0K
PiANCj4gYWx0ZXJuYXRpdmVfaWZfbm90IFNLSVBfU1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VY
SVQNCj4gYiAgIHNraXBfY2hlY2sNCj4gYWx0ZXJuYXRpdmVfZWxzZV9ub3BfZW5kaWYNCg0KQWN0
dWFsbHkgbXkgaW1wbGVtZW50YXRpb24gaXMgd3JvbmcgOi8uIFdlIHdhbnQgdG8gc2tpcCB0aGUg
Y2hlY2sgaWYgdGhlIA0KY2FwIGlzIHNldC4gU28gdGhpcyBzaG91bGQgYmU6DQoNCmFsdGVybmF0
aXZlX2lmIFNLSVBfU1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQNCmIgICAgc2tpcF9jaGVj
aw0KYWx0ZXJuYXRpdmVfZWxzZV9ub3BfZW5kaWYNCg0KPiANCj4gDQo+PiAgICAgICAgICAgLyoN
Cj4+ICAgICAgICAgICAgKiBTdGFydCB0byBjaGVjayBwZW5kaW5nIHZpcnR1YWwgYWJvcnQgaW4g
dGhlIGdhcCBvZiBHdWVzdCAtPiBIWVANCj4+ICAgICAgICAgICAgKiB3b3JsZCBzd2l0Y2guDQo+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMgYi94ZW4vYXJjaC9hcm0v
YXJtNjQvZW50cnkuUw0KPj4gaW5kZXggNDU4ZDEyZjE4OC4uOTFjZjZlZTZmNCAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TDQo+PiArKysgYi94ZW4vYXJjaC9hcm0v
YXJtNjQvZW50cnkuUw0KPj4gQEAgLTE3MCw5ICsxNzAsMTEgQEANCj4+ICAgICAgICAgICAgKiBp
cyBub3Qgc2V0LiBJZiBhIHZTRXJyb3IgdG9vayBwbGFjZSwgdGhlIGluaXRpYWwgZXhjZXB0aW9u
IHdpbGwgYmUNCj4+ICAgICAgICAgICAgKiBza2lwcGVkLiBFeGl0IEFTQVANCj4+ICAgICAgICAg
ICAgKi8NCj4+IC0gICAgICAgIEFMVEVSTkFUSVZFKCJibCBjaGVja19wZW5kaW5nX3ZzZXJyb3I7
IGNibnogeDAsIDFmIiwNCj4+IC0gICAgICAgICAgICAgICAgICAgICJub3A7IG5vcCIsDQo+PiAt
ICAgICAgICAgICAgICAgICAgICBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUKQ0K
Pj4gKyAgICAgICAgYWx0ZXJuYXRpdmVfaWYgU0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5UUllf
RVhJVA0KDQpUaGlzIHdvdWxkIG5lZWQgdG8gYmUgYWx0ZXJuYXRpdmVfaWZfbm90IGFzIHdhbnQg
dG8gY2FsbCB0aGUgZnVuY3Rpb24gDQp3aGVuIHRoZSBjYXAgaXMgbm90IHNldC4NCg0KPj4gKyAg
ICAgICAgYmwgICAgICBjaGVja19wZW5kaW5nX3ZzZXJyb3INCj4+ICsgICAgICAgIGNibnogICAg
eDAsIDFmDQo+PiArICAgICAgICBhbHRlcm5hdGl2ZV9lbHNlX25vcF9lbmRpZg0KPj4gKw0KPj4g
ICAgICAgICAgIG1vdiAgICAgeDAsIHNwDQo+PiAgICAgICAgICAgYmwgICAgICBlbnRlcl9oeXBl
cnZpc29yX2Zyb21fZ3Vlc3Rfbm9pcnENCj4+ICAgICAgICAgICBtc3IgICAgIGRhaWZjbHIsIFxp
ZmxhZ3MNCj4+IC0tIA0KPj4gMi4xMS4wDQo+Pg0KDQpDaGVlZXJzLA0KDQotLSANCkp1bGllbiBH
cmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
