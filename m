Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AF610360A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 09:33:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXLN7-00030k-0c; Wed, 20 Nov 2019 08:29:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ykW7=ZM=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iXLN5-00030f-KC
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 08:29:55 +0000
X-Inumbo-ID: ea29b0b6-0b6f-11ea-a30b-12813bfff9fa
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.116]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea29b0b6-0b6f-11ea-a30b-12813bfff9fa;
 Wed, 20 Nov 2019 08:29:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcsL/5TXeuBGfsD4B3ufoINHVI8ZVJJJzLp3F76NQ1Hlyspoh58YPMR7WC5adzvIOKXDsk+obyA0Qx73Mc2Vl501SzieGv6GmjBvmbwRPyWlP8BsDO0GS46TdvT3S6NVUe2fnE27jyfQr32/+1tmJZ7DOExJKY/7ejbU0fRpABoN6xJ9w/H+0AD0D250rViwaXjZq01ut9RJT7FVx/TsgtXiSDBF8nLmhib89NMMu5d/Thg/jcpJZ5Tl7pv13/2YsgyBreKZrMLYOXys+jxIeA/5jpiUAdAxbULPmkQIUSfVnJPcjF6lJO2lRwHqC1kWZdlczLcvJo46pvFJ2ui5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7LeFA6Va0pBc+mpr/LlPRheLW3L1uyqAvPkjNzL2YU=;
 b=TXNiFTs4/zkkdoddvRtsz4NVUJfAlROOpZJTi5v4iU7AvrweyLuB2qRSOGG/xkzeRpjqeqrxBDx/yYgZ085VVOGx58hdXtkrP9Pj6tqLP8Vtsb3Sn9xesSn+0o6BhzKSf5CVdTOhVvhUmZFSmiGSlrkk7TYvc83rkP7+WiW0pGyGEmwK0qij61CQrwu4wGxoihdlDMb3238LS1UJl/V4vU9yePBnJ+m5P6DHaEsZT2VjBzmTJ8Rh+1fWTFwAo1qBriysGPRN/yJm762YTEnppEPvx4PvjraO6K5hq83HgpjzBh/ysgaALbo1FxuesRK36i0OUQXB/BxUirlHISeZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7LeFA6Va0pBc+mpr/LlPRheLW3L1uyqAvPkjNzL2YU=;
 b=RCLbVedW+Iu+KKnp63Yh6/EGiZqjA886sNE2i1vVaez0kFMr/zKr6dK6fPRIY7uF0KhOLnZFhpTBVX/yiHzYcIPGrDLBsXDGiiF5YTRjwu5wHGWq5vtctEMB7o2gmWBxSCWlEuWvRf1E0cj8ZWjlpoz9hnfr3QxzXipP3bLiDZ4=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5619.eurprd02.prod.outlook.com (10.255.31.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Wed, 20 Nov 2019 08:29:47 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2474.015; Wed, 20 Nov 2019
 08:29:47 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
Thread-Index: AQHVnhoIoDKnH00r7U+BYd+Jg1p+RKeSVi8A///jqICAAYNIgA==
Date: Wed, 20 Nov 2019 08:29:47 +0000
Message-ID: <cb030ad4-df5c-6f28-f5c8-1add63d3b80d@bitdefender.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
 <8c928769-c0ea-8a48-3bda-aba7d17133ba@bitdefender.com>
 <9141e27c-edd4-301a-ee76-e3fcf5e787af@suse.com>
 <559c1807-2f5d-2267-c563-448c0bd88725@bitdefender.com>
 <b653b14f-bf46-85ef-c412-876d5ad26ade@suse.com>
In-Reply-To: <b653b14f-bf46-85ef-c412-876d5ad26ade@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0032.eurprd05.prod.outlook.com
 (2603:10a6:208:55::45) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0666beb0-42d9-4aa6-fe73-08d76d93cd73
x-ms-traffictypediagnostic: AM0PR02MB5619:|AM0PR02MB5619:|AM0PR02MB5619:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB5619288113D742680906B980AB4F0@AM0PR02MB5619.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(136003)(376002)(39860400002)(396003)(199004)(189003)(66946007)(476003)(486006)(2616005)(11346002)(6486002)(3846002)(5660300002)(6512007)(4744005)(6436002)(8936002)(26005)(2906002)(31696002)(8676002)(81166006)(186003)(81156014)(316002)(6116002)(54906003)(86362001)(4326008)(99286004)(6246003)(229853002)(25786009)(305945005)(64756008)(66476007)(52116002)(6916009)(14454004)(66556008)(478600001)(386003)(6506007)(53546011)(102836004)(71190400001)(66066001)(76176011)(31686004)(36756003)(256004)(446003)(7736002)(7416002)(66446008)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5619;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gJWgeSu+H7GsUzNU1Em53jShnzZx793BqD59jwz1kckdwqEkSLNDzn6afdiSBAnVsVIV18RE/CH6V+8ydbb5RgSPEtkdbw9IlGV/UT7ketAaIipOIX5dKOYHWs0gbpGNdMCSEf4eK/Y9XhvVYIDqueRvdbH9v9XWm9YMXqnmIIX0LVUGGrKqdpV4tUAU0jOi/b7iVzXrTQrotwUqAkrjo3m1uoMlGzQIt76ixEdSmPIRaJPKgfHBGXSXG60/B9tH8pPWNsLgCgsVkqpXzCiFYoHdj66gQPklYDzBCO3atZuKBRVZV3JRtuNgZCnIZ32IDspXJfc7aCOXJkUFyyC2596fY8zmeYtH7qXmRiWnJhzcIPuIzp4GvkGJ+4LCASGRlISfIxMmFthr+rRBUhnRDuFH5HA4pXyIY6XP0orGqZtIf6ao52zZ5yeA+Y+GqUX9
Content-ID: <6B81FB26059AB0468E0499C65779239E@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0666beb0-42d9-4aa6-fe73-08d76d93cd73
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 08:29:47.3933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5GZ++tyVReGI7KUlNMeIXEKe1F3LJc95HkHlmtpGKrHPzvv5Y4DYR4BxKdtZosMUlpnGW4gwueTeweOBtEcCsdMQXG2sEBrwMtcbbXSvZIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5619
Subject: Re: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTEuMjAxOSAxMToyMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE5LjExLjIwMTkg
MTA6MDUsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4gT24gMTguMTEuMjAxOSAx
NjowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTguMTEuMjAxOSAxNDozOSwgQWxleGFu
ZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+IEZvciB0aGlzIEhWTU9QX0FMVFAyTV9JTlRF
UkZBQ0VfVkVSU0lPTiBzaG91dCBiZSBpbmNyZWFzZWQuIEkgd2lsbCBsZWF2ZQ0KPj4+PiBpdCB0
byBUYW1hcyB0byBkZWNpZGUgaWYgd2Ugd2lsbCBuZWVkIGEgZGlmZmVyZW50IHN0cnVjdHVyZSBm
b3INCj4+Pj4geGVuX2h2bV9hbHRwMm1fc3VwcHJlc3NfdmVfbXVsdGkgdG8ga2VlcCB0aGUgY29t
cGF0aWJpbGl0eS4NCj4+Pg0KPj4+IFdhc24ndCBpcyB0aGF0IGR1ZSB0byB0aGUgcG9zc2libGUg
Z3Vlc3QgZXhwb3N1cmUgaXQgd2FzIGRlY2lkZWQNCj4+PiB0aGF0IHRoZSBpbnRlcmZhY2UgdmVy
c2lvbiBhcHByb2FjaCB3YXMgbm90IHN1aXRhYmxlIGhlcmUsIGFuZCBoZW5jZQ0KPj4+IGl0IHNo
b3VsZG4ndCBiZSBidW1wZWQgYW55IGZ1cnRoZXI/DQo+Pj4NCj4+DQo+PiBUaGF0IGlzIGNvcnJl
Y3QgYnV0IHRoZXJlIHdhcyBhbHNvIHJlcXVlc3RlZCB0byBhZGQgdGhlIG5ldyBvcGFxdWUgZmll
bGQNCj4+IHNvIEkgZG9uJ3Qga25vdyBob3cgdG8gaGF2ZSB0aGF0IGFuIHN0aWxsIGtlZXAgdGhl
IHNhbWUgdmVyc2lvbi4NCj4gDQo+IE5ldyBzdWItb3A/DQo+IA0KDQpXb3VsZG4ndCBpdCBiZSBz
aW1wbGVyIHRvIGhhdmUgYSBuZXcgc3RydWN0dXJlIHRvIHVzZSBmb3IgdGhpcywgDQpzb21ldGhp
bmcgbGlrZSAic3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlX211bHRpIiBhbmQgdGhl
biB0aGUgDQp2ZXJzaW9uIHdpbGwgYmUgdW5jaGFuZ2VkDQoNCkFsZXgNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
