Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D300FCEE2B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 23:06:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHa9P-0003qZ-4s; Mon, 07 Oct 2019 21:02:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xf97=YA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iHa9N-0003qU-PG
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 21:02:37 +0000
X-Inumbo-ID: c8274efd-e945-11e9-97c0-12813bfff9fa
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8274efd-e945-11e9-97c0-12813bfff9fa;
 Mon, 07 Oct 2019 21:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrDAgM9eG3k1uSH6z5QhEe5MZwALhCdMyvi9ouzAn/Y=;
 b=9MnoWnC/N3dOjmYcTb4ZxzsfiFOGH8zuWIT798NXeKVGxB4kgx2y3uA8LbmPMgUGWd3RIVzH6Q0MgARWBNM0w5LNX40M+GvW06Nyy+8NJLviosjXhuycDqmABW8xd70M3Yb+85vnF17L7s1KHCXoE/AFhYfc6ChhWjk72dCt5HE=
Received: from VI1PR0802CA0018.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::28) by VI1PR08MB2655.eurprd08.prod.outlook.com
 (2603:10a6:802:19::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Mon, 7 Oct
 2019 21:02:31 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by VI1PR0802CA0018.outlook.office365.com
 (2603:10a6:800:aa::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.24 via Frontend
 Transport; Mon, 7 Oct 2019 21:02:31 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 7 Oct 2019 21:02:30 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Mon, 07 Oct 2019 21:02:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 266fd52e2ebdccee
X-CR-MTA-TID: 64aa7808
Received: from b4d61e60ff36.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 072ACF12-3199-48C4-84F9-2AA16E1A7F2F.1; 
 Mon, 07 Oct 2019 21:02:22 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4d61e60ff36.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Oct 2019 21:02:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgdDzGj9kPpXl3h2DgTH8fP1nTtJNsiwIeqvY2Pd7giCADfeP7JYvqc4IC4T3/6rUV/hzKCWYgv9qPE9U9b0ltqGrqrzNfbtq+jMYeOMPHeJs/YM+Xskqp3JpTiAQDXBSEwEmfuE2ZqWSpY0kdRWaIFB6NeO5NPF5rmgnnV9jlAsW98qhWeR8lPRSAq1ihpKgbp0SMbQvc4QZODXveoqt4vhfG3GLhP8QUePRlmkEJJ599TUuvVuCAl/CVQt2rUqN2DiK41IVZPX5jqZlRgpUbg44HP6CrbHGZ02xF960bQW7/xCTGCzsJj9WakGsAJv5z7wbeq/bWSNX6doyqTCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrDAgM9eG3k1uSH6z5QhEe5MZwALhCdMyvi9ouzAn/Y=;
 b=HLZNCOutajIF0m36AmTWkXyvgp3ZnvdF0Az8tqot72ht7oM2R5plhTBu2eltZ6QEHGx1THlDtFT4XPq3LnIYyrSQlvlterXiZqlmscjsY/kzf+ANnJ4vXr0ujT+4taLWdD2syn27ulHhX/8U4RfDkE0SrGCZUYth/gdghrXJmKlQuWww3GyOYVkOSNiNWI6etFlt0rZoOWKt2udl70czw4dst7mvntpomZcEzepVN6jHVm1aCgttrY1hoMKbLT8G0jzcRTlCpXEmWjxyL+fYlFrUVw1ibdVG1/0n4fqhnI8lEMt4qh5Gg5FvJtdcRrChM1xWfvcaEqi5U0bVJiqGxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrDAgM9eG3k1uSH6z5QhEe5MZwALhCdMyvi9ouzAn/Y=;
 b=9MnoWnC/N3dOjmYcTb4ZxzsfiFOGH8zuWIT798NXeKVGxB4kgx2y3uA8LbmPMgUGWd3RIVzH6Q0MgARWBNM0w5LNX40M+GvW06Nyy+8NJLviosjXhuycDqmABW8xd70M3Yb+85vnF17L7s1KHCXoE/AFhYfc6ChhWjk72dCt5HE=
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com (20.179.44.81) by
 DBBPR08MB4428.eurprd08.prod.outlook.com (20.179.43.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 21:02:20 +0000
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9]) by DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9%4]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 21:02:20 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Oleksandr <olekstysh@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 2/2] xen/arm: domain_build: Don't expose
 IOMMU specific properties to the guest
Thread-Index: AQHUsatXg1jQ864iqUOt18VtyH/J/KdHgHaA///1JQCAABO1AP//+CKAgAAyKACAArKCgIAG248A
Date: Mon, 7 Oct 2019 21:02:20 +0000
Message-ID: <9a29bc73-18b8-67ad-1215-3e7fccdd6e09@arm.com>
References: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
 <1548090247-20078-3-git-send-email-andrii.anisov@gmail.com>
 <d7ee428b-6010-7f04-c412-d65f657f1518@arm.com>
 <1238d45f-1693-6afb-4eff-e8af3b9e4f7d@gmail.com>
 <e9ce8c39-fa90-461d-0958-a0b2a0cf968a@arm.com>
 <d43ca714-130b-091b-79db-c20d1a6da2b0@gmail.com>
 <435b4ce8-6c9c-a9d3-f5b5-b19bf68f1ab9@arm.com>
 <92577653-a113-9028-e267-9724079402e5@gmail.com>
In-Reply-To: <92577653-a113-9028-e267-9724079402e5@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::25) To DBBPR08MB4554.eurprd08.prod.outlook.com
 (2603:10a6:10:d1::17)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1b448df8-f1c1-4ef4-7f0f-08d74b69aaa6
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: DBBPR08MB4428:|VI1PR08MB2655:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <VI1PR08MB26553EB45D1A4E27DDF2C0D6809B0@VI1PR08MB2655.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01834E39B7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(189003)(199004)(6486002)(71200400001)(86362001)(66066001)(110136005)(54906003)(229853002)(25786009)(316002)(2501003)(71190400001)(44832011)(66476007)(7736002)(14444005)(31696002)(66446008)(66556008)(64756008)(256004)(66946007)(36756003)(52116002)(305945005)(5660300002)(102836004)(3846002)(26005)(186003)(6116002)(76176011)(6246003)(966005)(14454004)(53546011)(6506007)(11346002)(8676002)(486006)(81156014)(81166006)(476003)(99286004)(2616005)(2906002)(386003)(6436002)(446003)(6306002)(6512007)(8936002)(31686004)(478600001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4428;
 H:DBBPR08MB4554.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: bH0vOksr8MYPinD1OAQsluNripUgDhoAQRaDiPmVIoM2l19JJpVkpwD9WPKHEMjCWTasJnAg1qSLn3eZrAndog9vW6HOdxwSxTdxRd8yVXbM46j+nCIGAHUeci6HtOt1rXFH/idh8uk2ciNSZklwCEV7/9m2cRgs9Pc//JlHb4dCJDAl016oM+i4Ur1uJiIXO6EkFJzl5rwkeGr1QBI+mPVDstSxYX8rIJq1Uj43G8cpkaZEflg9FERL59rt27KqdmfkoWM11EjvJNIg04dfNG2OqvqE42cuwY6bdzsZBf/NOvMDySa9WpufDy0VT7cuV16CM4cZcQ9RIVofwnDOxbzOo/g3ofIGFXiNsH0dNXAunmJnIL6WS/1zerZOy8XAw0M9+wVuCOsy4UH7k8DYy2zCHRgQyvmylbIsVbBXqR1lzAySbiaARNSMNQvSRoXdkpK3q3b7EdZNpCLz0Xqr2g==
x-ms-exchange-transport-forked: True
Content-ID: <DD8B176CD9DA184A91EFD82267EB5EA4@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4428
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(39860400002)(199004)(189003)(2906002)(50466002)(70586007)(86362001)(478600001)(316002)(66066001)(6512007)(6306002)(486006)(22756006)(36756003)(476003)(126002)(47776003)(76176011)(31696002)(70206006)(81166006)(7736002)(81156014)(229853002)(356004)(23676004)(25786009)(2486003)(8676002)(99286004)(54906003)(26826003)(4326008)(31686004)(53546011)(5660300002)(6506007)(386003)(2501003)(966005)(63350400001)(2616005)(6486002)(6116002)(336012)(446003)(305945005)(14444005)(26005)(102836004)(186003)(3846002)(76130400001)(107886003)(11346002)(6246003)(110136005)(436003)(14454004)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2655;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 67296e3d-d72a-4739-eec8-08d74b69a4b7
NoDisclaimer: True
X-Forefront-PRVS: 01834E39B7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ra4Rx0MDcHVHPYAXwNO7AfJOzLbvk024rWhtyaX1FHOO6UvecG0AMcEnfFQPsbbAvGvG7eNVDS1dO5NYF/z1ENiyoeDxCQGmjSlFf+hG4zFRu39mDthOYjekdVQHMehDeCwKP1UKCLG7yVVJm0LYMlM4r168WHz54HacSQo3H3jmYYPMIF3FWbE23IGfbqowqdEJZIl63a9Lf+gasSTba0BPh/OwTuwruENzskxNUfnukLhn0FLI1TfMXF/M5/ysyAUDXFeS1QY5E1JIROZGLrrL5V1iFet6BR9PaZ/tY9zmN6B1VuKG96a8dL/C8u0xUgtjesDt2RSuO5fTPuHWeKuYIJzu1VMqHTxAMsv2B58P880KnSkijTbOLKJl8+LySdeJLxfSaGn8yqUJRMOhHmK0Rvxlnj4iuIlrgzA+YnrlMLOrUeL9R6O+fVrO88XlISQNjmlWenRtNBPF1KCgkw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2019 21:02:30.1450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b448df8-f1c1-4ef4-7f0f-08d74b69aaa6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2655
Subject: Re: [Xen-devel] [PATCH 2/2] xen/arm: domain_build: Don't expose
 IOMMU specific properties to the guest
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDAzLzEwLzIwMTkgMTM6MTgsIE9sZWtzYW5kciB3cm90ZToNCj4gDQo+IE9uIDAx
LjEwLjE5IDIyOjA3LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBPbiAxMC8xLzE5IDU6MDcgUE0s
IE9sZWtzYW5kciB3cm90ZToNCj4+Pg0KPj4+IE9uIDAxLjEwLjE5IDE4OjM2LCBKdWxpZW4gR3Jh
bGwgd3JvdGU6DQo+Pj4+IE9uIDAxLzEwLzIwMTkgMTY6MjUsIE9sZWtzYW5kciB3cm90ZToNCj4+
Pj4+DQo+Pj4+PiBPbiAwMS4xMC4xOSAxODowNCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+ID4g
MS4gR2l2aW5nIHRoZSBJT01NVSB0byBEb20wIGlzIGEgYmFkIGlkZWEuDQo+Pg0KPj4gUGxlYXNl
IHRvIHRyeSBleHBhbmQgeW91ciB0aG91Z2h0cyBpbiB0aGUgc2FtZSBlLW1haWwgd2hlbiB5b3Ug
c2F5IA0KPj4gInRoaXMgaXMgYSBiYWQgaWRlYSIuDQo+IA0KPiBXZWxsLCB0aGlzIHdhcyBhIGNv
bmNsdXNpb24gSSBoYWQgZ290IGZyb20gdGhlIGRpc2N1c3Npb24gWzFdLiBTb3JyeSBmb3IgDQo+
IG5vdCBiZWluZyBjbGVhciBoZXJlLg0KPiANCj4gDQo+Pg0KPj4gQnV0LCB0aGlzIGlzIGNsZWFy
bHkgd2hhdCBoYXBwZW4gaW4gY3VycmVudCBYZW4gc2V0dXAgaWYgdGhlIGRyaXZlciBpcyANCj4+
IG5vdCBlbmFibGVkLiBXaGF0IEkgd2FudCB0byBhdm9pZCBpcyBleHBvc2luZyBhbiBoYWxmIGNv
bXBsZXRlIA0KPj4gYmluZGluZ3MgdG8gdGhlIGd1ZXN0ICh5b3UgZG9uJ3Qga25vdyBob3cgaXQg
d2lsbCBiZWhhdmUpLg0KPj4NCj4+IFNvIHdlIGVpdGhlciByZW1vdmUgYWxsIHRoZSBwcm9wZXJ0
aWVzIGFuZCBub2RlIHJlbGF0ZWQgdG8gdGhlIElPTU1VcyANCj4+IG9yIG5vdGhpbmcuDQo+IEkg
dGhpbmssIEkgZ290IGl0LiBPdXIgdGFyZ2V0IGlzICpub3QqIHRvIGFkZCBhIHdheSBmb3IgRG9t
MCB0byB1c2UgDQo+IElPTU1VLCBidXQgdG8gYmUgY29uc2lzdGVudCBpbiByZW1vdmluZyBJT01N
VSBub2RlL21hc3RlciBkZXZpY2UgDQo+IHByb3BlcnRpZXMuIE5vdywgd2UgcmVtb3ZlIHRoZSBJ
T01NVSBub2RlIGlmIFhlbiBpZGVudGlmaWVzIGl0ICh0aGUgDQo+IElPTU1VIGRyaXZlciBpcyBw
cmVzZW50IGluIFhlbiksDQo+IHNvIGxvb2tzIGxpa2Ugd2UgaGF2ZSB0byByZW1vdmUgbWFzdGVy
IGRldmljZSBwcm9wZXJ0aWVzIG9ubHkgaWYgdGhpcyANCj4gbWFzdGVyIGRldmljZSBpcyBiZWhp
bmQgdGhlIElPTU1VIHdoaWNoIG5vZGUgaXMgcmVtb3ZlZC4gVGhpcywgSSBob3BlLCANCj4gd2ls
bCBhdm9pZCBleHBvc2luZyBhbiBoYWxmIGNvbXBsZXRlIGJpbmRpbmdzIHRvIGd1ZXN0LiBBbSBJ
IHJpZ2h0Pw0KPiANCj4gDQo+IFsxXSANCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA4L21zZzAwODU4Lmh0bWwNCj4gDQo+IA0KPiAt
LS0tLS0tLS0tDQo+IA0KPiBJZiB5b3UgaGFwcHkgd2l0aCB0aGF0IGxvZ2ljIEkgd2lsbCBjcmFm
dCBhIHByb3BlciBwYXRjaC4NCg0KVGhlIGxvZ2ljIGxvb2tzIGFscmlnaHQgdG8gbWUuIE9uZSBj
b21tZW50IGJlbG93LCBJIHdpbGwgbG9vayBhdCB0aGUgDQpyZXN0IG9uY2UgdGhpcyBpcyBmb3Jt
YWxseSBzZW50Lg0KDQo+IA0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiBpbmRleCA2NzAyMWQ5Li42
ZDQ1ZTU1IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gKysr
IGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+IEBAIC00ODAsMTAgKzQ4MCwyNiBAQCBz
dGF0aWMgaW50IF9faW5pdCB3cml0ZV9wcm9wZXJ0aWVzKHN0cnVjdCBkb21haW4gDQo+ICpkLCBz
dHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0KPiAgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGR0X3By
b3BlcnR5ICpwcm9wLCAqc3RhdHVzID0gTlVMTDsNCj4gIMKgwqDCoMKgIGludCByZXMgPSAwOw0K
PiAgwqDCoMKgwqAgaW50IGhhZF9kb20wX2Jvb3RhcmdzID0gMDsNCj4gK8KgwqDCoCBzdHJ1Y3Qg
ZHRfZGV2aWNlX25vZGUgKmlvbW11X25vZGU7DQo+IA0KPiAgwqDCoMKgwqAgaWYgKCBraW5mby0+
Y21kbGluZSAmJiBraW5mby0+Y21kbGluZVswXSApDQo+ICDCoMKgwqDCoMKgwqDCoMKgIGJvb3Rh
cmdzID0gJmtpbmZvLT5jbWRsaW5lWzBdOw0KPiANCj4gK8KgwqDCoCAvKg0KPiArwqDCoMKgwqAg
KiBJZiB3ZSBza2lwIHRoZSBJT01NVSBkZXZpY2Ugd2hlbiBjcmVhdGluZyBEVCBmb3IgRG9tMCAo
ZXZlbiBpZg0KDQpJIHdvdWxkIHByZWZlciBpZiB3ZSB1c2UgImh3ZG9tIiBvdmVyICJEb20wIi4g
VGhleSBhcmUgYm90aCB0aGUgc2FtZSBvbiANCkFybSwgYnV0IHRoaXMgbWF5IGNoYW5nZSBpbiB0
aGUgZnV0dXJlICh3ZSBtYXkgYWN0dWFsbHkgZHJvcCBEb20wIDspKS4NCg0KPiArwqDCoMKgwqAg
KiB0aGUgSU9NTVUgZGV2aWNlIGlzIG5vdCB1c2VkIGJ5IFhlbiksIHdlIHNob3VsZCBhbHNvIHNr
aXAgdGhlIElPTU1VDQo+ICvCoMKgwqDCoCAqIHNwZWNpZmljIHByb3BlcnRpZXMgb2YgdGhlIG1h
c3RlciBkZXZpY2UgYmVoaW5kIGl0IGluIG9yZGVyIHRvIA0KPiBhdm9pZA0KPiArwqDCoMKgwqAg
KiBleHBvc2luZyBhbiBoYWxmIGNvbXBsZXRlIElPTU1VIGJpbmRpbmdzIHRvIERvbTAuDQo+ICvC
oMKgwqDCoCAqIFVzZSAiaW9tbXVfbm9kZSIgYXMgYW4gaW5kaWNhdG9yIG9mIHRoZSBtYXN0ZXIg
ZGV2aWNlIHdoaWNoIA0KPiBwcm9wZXJ0aWVzDQo+ICvCoMKgwqDCoCAqIHNob3VsZCBiZSBza2lw
cGVkLg0KPiArwqDCoMKgwqAgKi8NCj4gK8KgwqDCoCBpb21tdV9ub2RlID0gZHRfcGFyc2VfcGhh
bmRsZShub2RlLCAiaW9tbXVzIiwgMCk7DQo+ICvCoMKgwqAgaWYgKCBpb21tdV9ub2RlICkNCj4g
K8KgwqDCoCB7DQo+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIGRldmljZV9nZXRfY2xhc3MoaW9tbXVf
bm9kZSkgIT0gREVWSUNFX0lPTU1VICkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW9tbXVf
bm9kZSA9IE5VTEw7DQo+ICvCoMKgwqAgfQ0KPiArDQo+ICDCoMKgwqDCoCBkdF9mb3JfZWFjaF9w
cm9wZXJ0eV9ub2RlIChub2RlLCBwcm9wKQ0KPiAgwqDCoMKgwqAgew0KPiAgwqDCoMKgwqDCoMKg
wqDCoCBjb25zdCB2b2lkICpwcm9wX2RhdGEgPSBwcm9wLT52YWx1ZTsNCj4gQEAgLTU0MCw2ICs1
NTYsMTkgQEAgc3RhdGljIGludCBfX2luaXQgd3JpdGVfcHJvcGVydGllcyhzdHJ1Y3QgZG9tYWlu
IA0KPiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywNCj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb250aW51ZTsNCj4gIMKgwqDCoMKgwqDCoMKgwqAgfQ0KPiANCj4gK8KgwqDCoMKg
wqDCoMKgIGlmICggaW9tbXVfbm9kZSApDQo+ICvCoMKgwqDCoMKgwqDCoCB7DQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC8qIERvbid0IGV4cG9zZSBJT01NVSBzcGVjaWZpYyBwcm9wZXJ0aWVz
IHRvIERvbTAgKi8NCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCBkdF9wcm9wZXJ0eV9u
YW1lX2lzX2VxdWFsKHByb3AsICJpb21tdXMiKSApDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29udGludWU7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCBk
dF9wcm9wZXJ0eV9uYW1lX2lzX2VxdWFsKHByb3AsICJpb21tdS1tYXAiKSApDQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKCBkdF9wcm9wZXJ0eV9uYW1lX2lzX2VxdWFsKHByb3AsICJpb21tdS1tYXAt
bWFzayIpICkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4g
K8KgwqDCoMKgwqDCoMKgIH0NCj4gKw0KPiAgwqDCoMKgwqDCoMKgwqDCoCByZXMgPSBmZHRfcHJv
cGVydHkoa2luZm8tPmZkdCwgcHJvcC0+bmFtZSwgcHJvcF9kYXRhLCBwcm9wX2xlbik7DQo+IA0K
PiAgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIHJlcyApDQo+IA0KPiANCg0KQ2hlZXJzLA0KDQotLSAN
Ckp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
