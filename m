Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2085CEDA4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 22:39:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHZjn-0001Qk-5I; Mon, 07 Oct 2019 20:36:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xf97=YA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iHZjm-0001Qf-5V
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 20:36:10 +0000
X-Inumbo-ID: 158aece8-e942-11e9-80e3-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 158aece8-e942-11e9-80e3-bc764e2007e4;
 Mon, 07 Oct 2019 20:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7M02zQYMgyh4csd8l7J2MMVeFFATWQCkM4ZmDnr8B2w=;
 b=LPgGorTqnneaRNUV/f2IZH56S7FEx2lY2u/608Zvsiix0Kqy+/ST4XhO8vE4qKYQzRL1ehXXWhKTMnqx6YAaTo+r78iUO3UYXsInNd2nJXRhgCTnkaqf7QOebgQIm75E2e/KnS7M9vuHatgo1ydIQpFejSlAmpoJ9TKnCOpS8QQ=
Received: from DB6PR0801CA0060.eurprd08.prod.outlook.com (2603:10a6:4:2b::28)
 by DB7PR08MB3097.eurprd08.prod.outlook.com (2603:10a6:5:1d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Mon, 7 Oct
 2019 20:36:02 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::205) by DB6PR0801CA0060.outlook.office365.com
 (2603:10a6:4:2b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.24 via Frontend
 Transport; Mon, 7 Oct 2019 20:36:02 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 7 Oct 2019 20:36:00 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Mon, 07 Oct 2019 20:36:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c7bb91fcca74cf8
X-CR-MTA-TID: 64aa7808
Received: from 927e78013b09.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 913DBA98-01A5-4B9A-AA32-FD99E3FE402A.1; 
 Mon, 07 Oct 2019 20:35:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 927e78013b09.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Oct 2019 20:35:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuJChT/1cmQpqLwHRu1lDbkH66nLCn1/WOdDQv6Si9fhKEULW+Gcl0W8RzZCqZBSqbOQhbSxfAkz/YeO5lfTk21uK6Auir33UjHBCT+pfGpjiN+TcPQuBiTslZAARqeCVQF9KNeI1SlA/PYQo7kPhFaFonSMYdRnp5ZdNwCRDC4tGCchCJqV9NqN2WP4sRpLuQjXOWhEtyp2DE6ZDeZ697Vy4wYGU5WUt3HeZSfSS032S6XEeEn9vbzebGj3UZhp0meYzTQMLrOOhMv9glpPnv15KEkqiFz0fx5nKd0ERH6fz6RNf+AwPWAkW9gfdleR5Lkp62c9dYlOuVQkQbTpkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7M02zQYMgyh4csd8l7J2MMVeFFATWQCkM4ZmDnr8B2w=;
 b=OhwEE/IfDBRtMKdT20wqyNBMkp5cYeXgYwAFg38Wrvz8e8U/9fFwHwU0Adh61wRzZ0AYDrMu7O3Efkj8SW9VuI9lBDDNUbLDfWam5d8GI7JFBFDXzy2qTb6o9tWE1G43og9jjLfFHCvd9/NSXqB+pM2FedK4cxhZhl8qMJEeHpaHIClwL7zgUVZmyE3Gv29xeAsC8EGNH3qzrE944HwbBQ2Gh34xneDwpLd0oEvFRUGFaMYFx3+Wmm4mKj9mVrBfkec0DDO8RfIs5W3rwXNl+mIz89EKn2xBPg+uE5/wAQmMg45VXqyuI0/pvFw+jI5145zCJn/O8BbbpMZ+djLezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7M02zQYMgyh4csd8l7J2MMVeFFATWQCkM4ZmDnr8B2w=;
 b=LPgGorTqnneaRNUV/f2IZH56S7FEx2lY2u/608Zvsiix0Kqy+/ST4XhO8vE4qKYQzRL1ehXXWhKTMnqx6YAaTo+r78iUO3UYXsInNd2nJXRhgCTnkaqf7QOebgQIm75E2e/KnS7M9vuHatgo1ydIQpFejSlAmpoJ9TKnCOpS8QQ=
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com (20.179.44.81) by
 DBBPR08MB4853.eurprd08.prod.outlook.com (20.179.45.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 20:35:52 +0000
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9]) by DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9%4]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 20:35:52 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [[PATCH for-4.13]] xen/arm: mm: Allow generic xen page-tables
 helpers to be called early
Thread-Index: AQHVbXFKz2vdTFCm5029/okJjYrYJ6czq3OAgAC6WgCAAEwigIAAE4QAgBNsJQCAB5EiAA==
Date: Mon, 7 Oct 2019 20:35:52 +0000
Message-ID: <40fc893e-2739-2fec-4b17-2aaa733ddc6c@arm.com>
References: <20190917160202.16770-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1909191613060.19418@sstabellini-ThinkPad-T480s>
 <5a093a67-51f6-2d3d-6a98-87753cf4d186@arm.com>
 <alpine.DEB.2.21.1909200813510.3272@sstabellini-ThinkPad-T480s>
 <72de38de-2856-8873-ed70-6c354786bba3@arm.com>
 <alpine.DEB.2.21.1910021756570.2691@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1910021756570.2691@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0406.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::34) To DBBPR08MB4554.eurprd08.prod.outlook.com
 (2603:10a6:10:d1::17)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ee7f15c0-6c51-47ed-b934-08d74b65f71a
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: DBBPR08MB4853:|DB7PR08MB3097:
X-Microsoft-Antispam-PRVS: <DB7PR08MB3097385DB1129D205DE233C1809B0@DB7PR08MB3097.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 01834E39B7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(189003)(199004)(102836004)(6506007)(229853002)(478600001)(386003)(6436002)(53546011)(71190400001)(6486002)(99286004)(52116002)(31696002)(31686004)(25786009)(71200400001)(86362001)(26005)(6916009)(4326008)(81166006)(81156014)(8936002)(8676002)(66446008)(66946007)(66476007)(66556008)(64756008)(14454004)(6512007)(76176011)(6246003)(5660300002)(476003)(4744005)(7736002)(305945005)(486006)(44832011)(11346002)(446003)(2616005)(54906003)(186003)(316002)(36756003)(256004)(3846002)(6116002)(2906002)(66066001)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4853;
 H:DBBPR08MB4554.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: N3cAo8sGcS6O0RLmWjlGOOgDc2XzLn+Xji+oH9GNa2FxCyvDP3gSVLhRDn27PMBVzwOYdIjaDeaqTkaHllqaMVyKO0XpXLVV+L07o1gzr4O32rcmpGoJ3AaE6aZ1qqExRnlzod7OnsMkX4dzvZ41Tg11UCQ8/dpPCtlZGvJaOtf0cs+JxZ4lFFeqdtDZFUE5JJyljWXws3DLMkCXPyzvg9eO11TlidjFPgTM8lqFEtl3AhmQpXkO2Hb9GkabHXs1yPp2bx+cMZ5+jjM9nsqExfHubCAAcbughzwhwCYE8mgyr+TX/T1F4gNdOIb3qA/M6wB98aMMhHUhJKCSPznR6aV+PaoFIAyjHYrwF35DJiDeaXA3B1EFWfNy3MuCTELdp3bWayPjKtiobFydpJtJFf/vnPYxCfRLbMg0yxuWEtw=
x-ms-exchange-transport-forked: True
Content-ID: <9DD09F0195728C47B2B2867D26913757@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4853
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(199004)(189003)(76176011)(99286004)(6486002)(2486003)(6512007)(36756003)(54906003)(81166006)(8676002)(81156014)(305945005)(7736002)(316002)(23676004)(66066001)(486006)(6246003)(4326008)(53546011)(50466002)(47776003)(2616005)(229853002)(126002)(107886003)(6862004)(26005)(14454004)(186003)(25786009)(6506007)(386003)(102836004)(31686004)(8936002)(22756006)(336012)(26826003)(63350400001)(436003)(3846002)(446003)(5660300002)(478600001)(11346002)(86362001)(6116002)(31696002)(476003)(4744005)(2906002)(70206006)(356004)(70586007)(76130400001)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3097;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f506a1ed-8eed-4f1a-89c3-08d74b65f257
NoDisclaimer: True
X-Forefront-PRVS: 01834E39B7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hqmFXgZYRbVMGOCnzXHbojTedKh7ONs1fwHV3sOHDyzrp+oVa1OAoKQF6gQaf+kOAPUT5PtTMuvS9/ibnfsDyTUikYMbf2V/aouOLhQXDoDFN/hhUOddjaqDVMSGa5Rw+D14sWjyLKptsjsBN9nlzuPEkREfZ3pNuDTg/VKmTRkXNB33BgNjFba65ICJz0cDM4iReRy5dDbbmKwbf+BpAIVt5BMtBw3SUhTf+qc4ii0N+p+Srl3D786kIfJF0idy6Vxg5yq98bUXJxSOG+9LMF0BICmOI4j1PJS5T+OJjRjR49EzAKd/8tTeC3mFgzc8w+uZW38c1uoUP5dWYBbW4IzQ0+gKhiBLdIMU6Y1ZkgDUY8rUOBsOVaGJFjuqnjfl3XdKk1Rqwz5/1HDRKMb65o6ynK/sRwk002MhC6bZuyo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2019 20:36:00.5227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7f15c0-6c51-47ed-b934-08d74b65f71a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3097
Subject: Re: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
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

SGksDQoNCk9uIDAzLzEwLzIwMTkgMDI6MDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gRnJpLCAyMCBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gVGhhdCdzIG5vdCBj
b3JyZWN0LiBhbGxvY19ib290X3BhZ2VzKCkgaXMgYWN0dWFsbHkgaGVyZSB0byBhbGxvdyBkeW5h
bWljDQo+PiBhbGxvY2F0aW9uIGJlZm9yZSB0aGUgbWVtb3J5IHN1YnN5c3RlbSAoYW5kIHRoZXJl
Zm9yZSB0aGUgcnVudGltZSBhbGxvY2F0b3IpDQo+PiBpcyBpbml0aWFsaXplZC4NCj4gDQo+IExl
dCBtZSBjaGFuZ2UgdGhlIHF1ZXN0aW9uIHRoZW46IGlzIHRoZSBzeXN0ZW1fc3RhdGUgPT0NCj4g
U1lTX1NUQVRFX2Vhcmx5X2Jvb3QgY2hlY2sgc3RyaWN0bHkgbmVjZXNzYXJ5PyBJdCBsb29rcyBs
aWtlIGl0IGlzIG5vdDoNCj4gdGhlIHBhdGNoIHdvdWxkIHdvcmsgZXZlbiBpZiBpdCB3YXMganVz
dDoNCg0KSSBoYWQgYSBmZXcgdGhvdWdodHMgYWJvdXQgaXQuIE9uIEFybTMyLCB0aGlzIG9ubHkg
cmVhbGx5IHdvcmtzIGZvciANCjMyLWJpdHMgbWFjaGluZSBhZGRyZXNzIChpdCBjYW4gZ28gdXAg
dG8gNDAtYml0cykuIEkgaGF2ZW4ndCByZWFsbHkgDQpmdWxseSBpbnZlc3RpZ2F0ZWQgd2hhdCBj
b3VsZCBnbyB3cm9uZywgYnV0IGl0IHdvdWxkIGJlIGJlc3QgdG8ga2VlcCBpdCANCm9ubHkgZm9y
IGVhcmx5IGJvb3QuDQoNCkFsc28sIEkgZG9uJ3QgcmVhbGx5IHdhbnQgdG8gcmVseSBvbiB0aGlz
ICJ3b3JrYXJvdW5kIiBhZnRlciBib290LiBNYXliZSANCndlIHdvdWxkIHdhbnQgdG8ga2VlcCB0
aGVtIHVubWFwcGVkIGluIHRoZSBmdXR1cmUuDQoNCkNoZWVycywNCg0KLS0gDQpKdWxpZW4gR3Jh
bGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
