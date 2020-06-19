Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CE7200441
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 10:46:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmCes-00078j-SS; Fri, 19 Jun 2020 08:45:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBT4=AA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jmCer-00078e-IC
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 08:45:57 +0000
X-Inumbo-ID: 49cd7ddc-b209-11ea-bb8b-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.41]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49cd7ddc-b209-11ea-bb8b-bc764e2007e4;
 Fri, 19 Jun 2020 08:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8NAY2KUazQ/5vajcMbELbyEbERL6Tt41EYXFTZPD/A=;
 b=7jMc2RudMZCB2jUVJeOYJ84iT9vS4Rpgs8fsWsy3pY6fo878EkndF1crqZx8IQ3TLcKuaB7tasBsDH9olUissaPR2a0JxmxhZRlYWxEkO2dXy1NeQrjuJ5AO1dGxUMp5bDc7+LSZjTinti2KxXq5E1fBEI41tjGdvfcO9/xIUy4=
Received: from DB6PR1001CA0006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::16)
 by HE1PR08MB2683.eurprd08.prod.outlook.com (2603:10a6:7:2b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.25; Fri, 19 Jun
 2020 08:45:54 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::b) by DB6PR1001CA0006.outlook.office365.com
 (2603:10a6:4:b7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Fri, 19 Jun 2020 08:45:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 08:45:53 +0000
Received: ("Tessian outbound cdcc6148d2f4:v59");
 Fri, 19 Jun 2020 08:45:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 570f18e698e1fc00
X-CR-MTA-TID: 64aa7808
Received: from 7a2918b6f7c6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1F222A07-C281-40E8-B776-8584FDBE8EB0.1; 
 Fri, 19 Jun 2020 08:45:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a2918b6f7c6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 Jun 2020 08:45:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJgt2zU2wMTvI97b9VAk8zTcxWiZTzzx7iIxutQhUs2LBCiLHng2NdPXUgcOrQOIo7iHnSGuyCGpIRo3+7QsleA7ytCJCfaVVBRMVe6gEXRyjZ9R4Ht03qOM7azGqzDxPhXxEhoNTSnKDNZtGVDVjzQpSTylx7AGqP01ne9NkRh/Ttyz+h9kA1oNICI3UuKUQxnmM3jVzyBKhqiQV3hYsl940EJvY8klwR6oA/qMi2NLFrKEM0GHfHPngJR6iXFKmdJA19QAXTi8Ca4kBYd2ORXYGYM+2/X1FoAR0GWamnd0TOac6ys/mDD+yEzqwb1BKPceG5Ul//ugpzTOnVcUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8NAY2KUazQ/5vajcMbELbyEbERL6Tt41EYXFTZPD/A=;
 b=aOWPFYWQtbKNTbLxXA88dv2cJO5B06E1Z+ldsyGOoKAegTMSzWDGH+a/D9Ym0UxF1u9mgQKdJ8FsUCtOk0Ch33feWR0Hzin/qQklELD2582SJx31d4VhVKM3/nxrF9YN7Z4EGVIDHwQDwSywcYyzXNM6JsJTqKf3gAo2JNO7QfGc6Q2G5qeM63trQshQdR/XePoKZgAfNTKiZmp1gkvpk5K6/ixJKMoD5oWLijzDewL14tnCrLEaw0/WA2Wg9KuZxfm6uSaz82p8eyS87gpDxx+XDc7my4S+u4aVE3CBpXmY68yR/PyKf4w3g02umGWaxT7XIMUksqcwJCMSY1bCMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8NAY2KUazQ/5vajcMbELbyEbERL6Tt41EYXFTZPD/A=;
 b=7jMc2RudMZCB2jUVJeOYJ84iT9vS4Rpgs8fsWsy3pY6fo878EkndF1crqZx8IQ3TLcKuaB7tasBsDH9olUissaPR2a0JxmxhZRlYWxEkO2dXy1NeQrjuJ5AO1dGxUMp5bDc7+LSZjTinti2KxXq5E1fBEI41tjGdvfcO9/xIUy4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3387.eurprd08.prod.outlook.com (2603:10a6:10:45::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Fri, 19 Jun
 2020 08:45:46 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 08:45:46 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Tee-dev] TEE with XEN
Thread-Topic: [Tee-dev] TEE with XEN
Thread-Index: AdZCuN8SyGfGPx9hRva/eeajiUtqpQAw/zsAAIeJWwAAHsEHgA==
Date: Fri, 19 Jun 2020 08:45:46 +0000
Message-ID: <68572FBC-8AE3-44A4-A815-1A9A7FFFA098@arm.com>
References: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
 <8a6ba53e-59c8-0c18-00e9-2902b6edaf39@xen.org>
In-Reply-To: <8a6ba53e-59c8-0c18-00e9-2902b6edaf39@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 77d9986e-8ada-45d7-2bc0-08d8142d2d2c
x-ms-traffictypediagnostic: DB7PR08MB3387:|HE1PR08MB2683:
X-Microsoft-Antispam-PRVS: <HE1PR08MB2683F407B40304AA7CE550159D980@HE1PR08MB2683.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: pDq3vheIwV16leFs7cn5vpImXIJRhuKLvMnZWSkv7QXmgwiRnsZgFectr9h3TPtH7uhlM/EolHKjPlCfob5kAWNsS3GInDkD7CPmoZxDqoKntLHTihV6I+02lSbvbj5MXMlYVgQBMn5Oh0XtojPDQvNtcgwuInn6ev54icH5cseJh7n74Ry+14sZBkxvZaFPhlYIuVlWlOKbdnfIoWf/+ejzsvmyGapBCpeJZYMg0nCc/5eVY0526Edot5YU7aknPNBqucpb0cax1TLBs23mt7pPLYeWWverRLjML0rcQZfgRU0euAAMy+cCCT7jpECcIHTJz7uSs8ktGP9LKL//vA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(83380400001)(6512007)(86362001)(8936002)(6486002)(478600001)(5660300002)(8676002)(2906002)(36756003)(4326008)(2616005)(186003)(6916009)(66446008)(64756008)(54906003)(66476007)(53546011)(33656002)(6506007)(76116006)(91956017)(66946007)(316002)(66556008)(71200400001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 0E9toorM09dFfLlzYGPi4c3W84SQziWu7L/Sv3ro6DDD42/fhozELyPasqAPtVL7Dp5htSEyni5YbGWuCejliVaxhFguaP7qM3/H/DkZgkL4kNdLz/CYW6WdD9N/k4TcpXEHyNl8tO6/mOejnOGZfvp/2de8AMenuH1Shcy24UNqFmtRMPsOqMuaDmIr1GKRATHJlRjCo7s3EYi2oLxUkMc2iZY1aWSjZBDXxbyjKD5+ne/W8v1CcE2PeOC01XB4n3FvUCorqoanB/1NR3C6GgD+Ggjf4oK57ULXcvq73wtV1xpJmw1IMah8xUxH/gfffn8F+LFkiAWN0Gld9Cgt76IeTl4Z+Nd0piIxmJEhvP1HDuhkhdVSPgE/di7sMxmNhI7VQf8iDs7777mxt3e0pFiWVgFCsrxceoCyzYLJDJwhPQ+QbBqPlld+4OMSrqtHCMsw49hLVpI5zdlIOo0ssJC2AvzT+KKxyJXFtmJpKUg3NSYuv/4IuKBHvg9f2gEr
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C1A9EDA11296C4395B8185FADACD7AE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3387
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(6512007)(70586007)(70206006)(2616005)(6486002)(186003)(356005)(8936002)(82310400002)(336012)(478600001)(83380400001)(26005)(36756003)(33656002)(81166007)(2906002)(47076004)(86362001)(4326008)(8676002)(53546011)(54906003)(5660300002)(6862004)(316002)(82740400003)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1b4febd1-7ad3-43f2-a8db-08d8142d28df
X-Forefront-PRVS: 0439571D1D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KOZ4LuC43s9NZmL3eK1J5XT2BaKsuepM3CqV3Mr9OfTD4Y8FbvPbg9WleEVtWFjGfMAu5XsnakyWbPBmWSz+4nyZ6FhyN9Dy80TYGCb8rU4yBKcF8BNPtAgyVjUfFJE07x441KbJoTsWCr8pZbVe7pn/PBAKfVNqx8LQWVToWdefktpmI070Eu/MIi+tj/2nBYyE03VWJ2RS3bRTxkNY/tEZ1aX1+/FXigd7b0esntox0EcuUASyZ/Q/EvDWo1mECcD9j0wURPXgJfI9ANNIvDKCEH0rgPlMqjzSkmNV2iKPAVPfWhxoFmpeC3eZJYvFoV4kYTp2j888MIWl5tX+rSyLq82THrdvPxJqZxEriDkzAapaTqyTTMY/1grfe8AWEPSiN3jqfrcAhZNL5k72tg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 08:45:53.6808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d9986e-8ada-45d7-2bc0-08d8142d2d2c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2683
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <vlad.babchuk@gmail.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Stefano Babic <sbabic@denx.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCj4gT24gMTggSnVuIDIwMjAsIGF0IDE5OjA1LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+ICtCZXJ0cmFuZCBhbmQgU3RlZmFubw0KPiANCj4gT24gMTYv
MDYvMjAyMCAwMjoyNCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+PiBIaSBQZW5nLA0KPj4g
T24gTW9uLCAxNSBKdW4gMjAyMCBhdCAwNTowNywgUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+
IHdyb3RlOg0KPj4+IA0KPj4+IEhpIEFsbCwNCj4+PiANCj4+PiBXaGlsZSBlbmFibGluZyB0cnVz
dHkgb3Mgd2l0aCB4ZW4sIEkgdG9vayBzYW1lIGFwcHJvYWNoIGFzIE9QLVRFRSwNCj4+PiB3aXRo
IE9QLVRFRSBydW5uaW5nIGluIHNlY3VyZSB3b3JsZC4gQnV0IEkgYW0gYWxzbyB0aGlua2luZyB0
aGlzIG1pZ2h0DQo+Pj4gaW50cm9kdWNlIHBvdGVudGlhbCBpc3N1ZSBpcyB0aGF0IHNlY3VyZSB3
b3JsZCBPUyBjb21tdW5pY2F0ZSB3aXRoIERvbVUuDQo+Pj4gSWYgdGhlcmUgYXJlIHNvbWUgbWlz
YmVoYXZpb3IgaW4gc2VjdXJlIHdvcmxkIE9TLCBpdCBtaWdodCBsZXQgWEVODQo+Pj4gaHlwZXJ2
aXNvciBub3Qgd29yayBwcm9wZXIuDQo+Pj4gDQo+Pj4gSW4gbXkgc2V0dXAsIHRydXN0eSBvcyBz
b21ldGltZXMgcGFuaWMgaW4gc2VjdXJlIHdvcmxkLCB4ZW4gd2lsbCBub3QgYWJsZQ0KPj4+IHRv
IGNvbnRyb2wgdGhlIHBhbmljIGNvcmUgYW55bW9yZS4NCj4gDQo+IE1heSBJIGFzayBpbiB3aGlj
aCBjYXNlIFRydXN0eSBpcyBwYW5pY2tpbmc/DQoNCkluIGFueSBjYXNlLCBvcHRlZSBzaG91bGQg
cHJvdGVjdCBpdHNlbGYgYWdhaW5zdCB0aGlzIGFuZCBpdCBzaG91bGQgYmUgY29uc2lkZXJlZCB0
aGF0IG9wdGVlIGlzIG1vcmUgcHJpdmlsZWRnZWQgdGhlbiBYZW4uDQpTbyBpZiBvcHRlZSBpcyBj
cmFzaGluZyB3ZSBjYW5ub3QgZXhwZWN0IHRoYXQgWGVuIGNhbiByZWNvdmVyIG9yIGZpeCBpdC4N
Cg0KSSB3b3VsZCBtb3JlIGNvbnNpZGVyIHRoaXMgYXMgYSBidWcgdGhhdCBvcHRlZSBuZWVkcyB0
byBiZSByb2J1c3QgYWdhaW5zdC4NCg0KPiANCj4+PiANCj4+PiBTbyBJIGFtIHRoaW5raW5nIHdo
ZXRoZXIgd2UgbmVlZCB0byBlbXVsYXRpbmcgc2VjdXJlIHdvcmxkIGluIGEgWEVOIFZNDQo+Pj4g
d2hpY2ggaXMgdGhlIFZNIHJ1bm5pbmcgRG9tVS4gSnVzdCBsaWtlIHdoYXQgQUNSTiBkaWQgdG8g
cnVuIHRydXN0eQ0KPj4+IG9zLg0KPj4gV2VsbCwgaXQgZGVwZW5kcyBvbiB3aG9tIHlvdSBhcmUg
dHJ1c3RpbmcgbW9yZS4gQm90aCBYRU4gYW5kIFRFRSBhcmUgbWluaW1hbA0KPj4gT1MgaW1wbGVt
ZW50YXRpb25zIHdpdGggYWltIGF0IHNlY3VyaXR5LiBJJ20gc3BlYWtpbmcgYWJvdXQgZ2VuZXJp
YyBURUUgT1MsIG5vdA0KPj4gYWJvdXQgcGFydGljdWxhciBPUyBsaWtlIE9QLVRFRSBvciBUcnVz
dHkuIFByb2JsZW0gaXMgdGhhdCwgaWYgVEVFIGlzDQo+PiBydW5uaW5nIGluc2lkZQ0KPj4gVk0s
IGl0IHdpbGwgYmUgc3VzY2VwdGlibGUgdG8gYSBoeXBlcnZpc29yIG1pc2JlaGF2aW91ci4gWW91
IG5lZWQgdG8gdW5kZXJzdGFuZA0KPj4gdGhhdCBYZW4gYW5kIHByaXZpbGVnZWQgZG9tYWluIChk
b20wLCBtb3N0bHkpIGNhbiBhY2Nlc3MgbWVtb3J5IG9mIGFueSBndWVzdC4NCj4+IEF0IGxlYXN0
LCBpbiBkZWZhdWx0IGNvbmZpZ3VyYXRpb24uIFRoZXJlIGFyZSBtZWFucyB0byBoYXJkZW4gdGhp
cw0KPj4gc2V0dXAuIEJ1dCBhbnl3YXlzLA0KPj4gWGVuIGNhbid0IGJlIHN0b3BwZWQgZnJvbSBy
ZWFkaW5nIFRFRSdzIHNlY3JldHMuDQo+IA0KPiBJSVJDLCB3ZSBkaXNjdXNzZWQgdGhpcyBhcHBy
b2FjaCBmb3IgT1AtVEVFIGluIHRoZSBwYXN0LiBUaGVyZSB3YXMgb3RoZXIgcG90ZW50aWFsIHBp
dGZhbGxzIHdpdGggaXQuIEZvciBpbnN0YW5jZSwgeW91IHdvdWxkbid0IGJlIGFibGUgdG8gZGly
ZWN0bHkgYWNjZXNzIGFueSBzZWN1cmUgZGV2aWNlIGZyb20gdGhhdCBndWVzdCAoaXQgaXMgcnVu
bmluZyBpbiBub24tc2VjdXJlIHdvcmxkKS4NCj4gDQo+IFRoZXJlIGFyZSBhbHNvIGlzc3VlcyBp
biB0ZXJtIG9mIGxhdGVuY3kgYXMgeW91IG1heSBoYXZlIHRoZSBmb2xsb3dpbmcgbW9kZWw6DQo+
IA0KPiBkb21VIC0+IFhlbiAtPiBkb21VIFRFRSAtPiAoWGVuIC0+IGhvc3QgVEVFIC0+IFhlbiAt
PiBkb21VIFRFRSkgLT4gWGVuIC0+IGRvbVUuDQo+IA0KPiBUaGUgYml0IGluICgpIGlzIGlmIHlv
dSByZXF1aXJlIHRvIGNhbGwgdGhlIGhvc3QgVEVFLg0KPiANCj4gT25lIHBvc3NpYmlsaXR5IHdv
dWxkIGJlIHRvIHVzZSBTZWN1cmUtRUwyIGZvciB5b3VyIFRydXN0eSBPUy4gQnV0IEkgZG9uJ3Qg
a25vdyB3aGV0aGVyIHlvdXIgcGxhdGZvcm0gc3VwcG9ydHMgaXQuDQo+IA0KPiBEZXBlbmRpbmcg
b24gd2hldGhlciB5b3UgY2FuIG1vZGlmeSBUcnVzdHkgT1MsIGFsdGVybmF0aXZlIHdvdWxkIGJl
IHRvIG1ha2UgaXR2aXJ0dWFsaXphdGlvbiBhd2FyZSBhcyBPUC1URUUgZGlkLiBUaGUgY29yZSB3
b3VsZCBuZWVkIHRvIGJlIHJlc2lsaWVudCBhbmQgdGhlIHBhbmljIG9ubHkgYWZmZWN0IGEgZ2l2
ZW4gY2xpZW50Lg0KDQpJIGRvIG5vdCBoYXZlIHJpZ2h0IGEgY2xlYXIgaWRlYSBvZiB3aGF0IGlz
IHRoZSBzdGF0dXMgb2Ygb3B0ZWUgYW5kIHhlbiBidXQgaW4gdGhlb3J5IEkgd291bGQgc2VlIDIg
cG9zc2libGUgd2F5cyB0byBoYW5kbGUgdGhpczoNCi0gd2l0aG91dCBvcHRlZSBtb2RpZmljYXRp
b24sIHNvbWV0aGluZyBpbiBhIGd1ZXN0IChEb20wIG9yIGFuIG90aGVyIHByaXZpbGVkZ2VkIG9u
ZSkgbmVlZHMgdG8gaGF2ZSBhY2Nlc3MgdG8gb3B0ZWUgYW5kIGVtdWxhdGUgb3B0ZWUgYWNjZXNz
IGZvciBvdGhlcnMuDQotIHdpdGggb3B0ZWUgbW9kaWZpY2F0aW9ucywgb3B0ZWUgbmVlZHMgdG8g
aGF2ZSBhIGNvbmNlcHQgb2YgY2xpZW50IGFuZCBYZW4gd291bGQgbmVlZCB0byBwYXNzdGhyb3Vn
aCBvcHRlZSByZXF1ZXN0cyBidXQgYmVpbmcgcmVzcG9uc2libGUgb2YgYWRkaW5nIGEg4oCcY2xp
ZW504oCdIGlkZW50aWZpZXIuIE1heWJlIGFsc28gaW5mb3JtaW5nIE9wdGVlIHdoZW4gYSBuZXcg
Y2xpZW50IGlzIGNyZWF0ZWQvcmVtb3ZlZC4NCg0KVGhlIHNlY29uZCBzY2VuYXJpbyBjb3VsZCB0
aGVuIGJlIHNvbWVob3cgc3BsaXR0ZWQgaW4gdGhlIHByZXZpb3VzIG9uZSBmcm9tIEp1bGllbiBp
ZiBzb21lIHBhcnRzIHdvdWxkIG5lZWQgdG8gYmUgZW11bGF0ZWQgc29tZXdoZXJlIGluIHNvbWUg
a2luZCBvZiBjb21iaW5hdGlvbiBvZiB0aGUgMiBtb2RlbHMuDQoNCkluIGFueSBjYXNlIGkgd291
bGQgYWx3YXlzIGNvbnNpZGVyIHRoYXQgYW55dGhpbmcgcnVubmluZyBvbiBvcHRlZSAob3IgaW4g
Z2VuZXJhbCBpbiB0aGUgc2VjdXJlIHdvcmxkKSBpcyBtb3JlIHRydXN0ZWQgdGhlbiBYZW4uDQoN
ClJlZ2FyZHMNCkJlcnRyYW5kDQoNCg==

