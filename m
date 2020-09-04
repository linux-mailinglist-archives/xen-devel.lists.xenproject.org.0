Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEEC25D6B0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 12:44:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE9CA-0003Hs-1g; Fri, 04 Sep 2020 10:43:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9G2Q=CN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kE9C7-0003Hn-Oc
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 10:43:47 +0000
X-Inumbo-ID: 2e1b6011-89d5-4bed-bf79-67abb5375158
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.52]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e1b6011-89d5-4bed-bf79-67abb5375158;
 Fri, 04 Sep 2020 10:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tUnUpRIAd4MxmhkRP0+cHA+WBREO9AuHi/E1RTDzCQ=;
 b=Fih2aR8qD0BNCsmOdZO8uTwDDMbY8YIJmSF996XC+s3zkdUIqmclJEIiQjPvVTOk4c7hoy4KOORh/+i1PAkMyRrdWqQ7XteEqqmHEHRPbRoywTc2SChPHA3CBaVdQdSBI6KJOxtRpdIALLOW0tKv6We0WCehvdBstt/13RNYKkc=
Received: from AM5PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:206:1::42)
 by DB6PR08MB2646.eurprd08.prod.outlook.com (2603:10a6:6:20::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Fri, 4 Sep
 2020 10:43:44 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::a) by AM5PR04CA0029.outlook.office365.com
 (2603:10a6:206:1::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Fri, 4 Sep 2020 10:43:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Fri, 4 Sep 2020 10:43:44 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Fri, 04 Sep 2020 10:43:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 650a5c3d6bd9e1f1
X-CR-MTA-TID: 64aa7808
Received: from 81e85ea2673e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 97529D4B-256C-4E45-9386-2DA1893E7F11.1; 
 Fri, 04 Sep 2020 10:43:34 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 81e85ea2673e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Sep 2020 10:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtKVyFPWca5NtobSV5ts0nKoIT2560mCz1XmWhjSlvdpfrQM+8ACiHHjRfcbz093E/ahdCQGByhZ76SXAodJqMIVCvHbJRCEkIFYwEuQVtQi442OoT5EZOdnVmMJrMD4W2ZRdXS0VeJ5PQNUMBl/uSB8y+Bff8l4/pGZE0Pkx209iXasjlVnCvu+Wm3m2YvwwmXOwcBtljOxgf+RL58Hw6MtO+GPnBr7y6mSdwzm/Ozqvvb5jdCTs0Wmub24/39IcOZH1Xdy76pPJ9rw9MgNYG8HbKF0Ttx9l8Z8CFSHNapAdC3//ivVvyp6OmQbiYhwW6i0PYkLpO0WFqLnFv42tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tUnUpRIAd4MxmhkRP0+cHA+WBREO9AuHi/E1RTDzCQ=;
 b=A0u2EHM1JHWC1Oj19ha6iggq+DpDFlF+lOOfC61F8sgQSXwTsUmBdc3bzLzYTfZaVI9602oaWSkJryH6bM9uFMW3xhFHDviw7Bos1W8wLwdcWEOml02x2qTZc19yQPonLPfwKtp3Br6EdnkJtqZ96jkM4mGTYmR1qfkbz59e/+bEfVschzV6uXFNFyU884TgfPScnuQSxJAPTviiFc1nz5PjWy1qMi+9Ofi61DWlw2nhm/4z1jUz50qhxymW6p8waUwO3nahWHSiMISR4AKInxfbvDo/tHcHJcdTb96lnh7srTPtXRJnBhO5db6D/oJm1ADhl9SlKvCGzUONhn4S8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tUnUpRIAd4MxmhkRP0+cHA+WBREO9AuHi/E1RTDzCQ=;
 b=Fih2aR8qD0BNCsmOdZO8uTwDDMbY8YIJmSF996XC+s3zkdUIqmclJEIiQjPvVTOk4c7hoy4KOORh/+i1PAkMyRrdWqQ7XteEqqmHEHRPbRoywTc2SChPHA3CBaVdQdSBI6KJOxtRpdIALLOW0tKv6We0WCehvdBstt/13RNYKkc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3259.eurprd08.prod.outlook.com (2603:10a6:5:1f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Fri, 4 Sep
 2020 10:43:32 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3348.016; Fri, 4 Sep 2020
 10:43:32 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, "open list:X86"
 <xen-devel@lists.xenproject.org>
Subject: Re: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Topic: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Index: AQHWgqFQIv5YQfrx8UWhPeAs1v6hhqlYRMuAgAAGaQA=
Date: Fri, 4 Sep 2020 10:43:32 +0000
Message-ID: <6D291A71-A0A6-401E-B9F6-BF6F992E60DF@arm.com>
References: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
 <e0c040bd-8b85-8dc9-37ee-04dd83adf072@suse.com>
In-Reply-To: <e0c040bd-8b85-8dc9-37ee-04dd83adf072@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 625a3cad-b6a5-4477-f9b5-08d850bf656d
x-ms-traffictypediagnostic: DB7PR08MB3259:|DB6PR08MB2646:
X-Microsoft-Antispam-PRVS: <DB6PR08MB2646CF32F2FC2400BF38F9DD9D2D0@DB6PR08MB2646.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: McmDGDUrWJskEJSFVuuQmqufJqZMrYJuK7Tm8idJIq41xJ8s0MZ3VqN9nWiBfnGGeRz7o9cbl+V/+nMNPiBE4gDF4evgrSdRnjmb6NpjNtfJXsSKWcr6Wq2R3c42rqd4KoEa3mwiIQt2VhBT2lqd5+2nRj5CQ7+Q8urHuT4pNETbFFFnhvfMZeJ8+f3nNYC2Ks/RCvNGUGKw2BQas/eUKk1uVZJrkHtm0CIZJhB1R3rB5udJ+Ef1VxRZXkANjEYCf3abmNPKc4lFDYCzO3eIAhzDWS2fAtaIiYpTfkW+UAemij42pAdFf80xoKhgTwN1s4k55Q9E9pfeuhqliI8eEx0kB7W7PZHUyX6sbR1x+/QPmm6302HkbtD4n+up8VkzS4RR5a1ltu1uA6U92tHlkw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(6512007)(316002)(478600001)(8936002)(71200400001)(6486002)(66946007)(66476007)(64756008)(66446008)(66556008)(91956017)(54906003)(86362001)(33656002)(4326008)(966005)(8676002)(5660300002)(6916009)(186003)(26005)(53546011)(6506007)(2906002)(76116006)(83380400001)(2616005)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Jqu8LKGDheMpYPRs/P+/FlXlnVGykE3tHkTsGNsKub87Jir+3AAUzSmcR+trgQDJF9HjYdlyk0nTNDAydsy2G5qtmorwdhtBly6qOgaZ3pJGtTUL5k6yn2Z8073UwRWf4BlSW9QKhi7bK28XbTPk5QweQ2GtG2a/7/dpWYpg8i302O3FKPdV/M2oTkzMw6opkJVfLXh5GcyRYKk+dGyjoqnNi036QBWEC8LO5oolWviOqmpVilTDHG4l1cVACfN6Roh7swTOZEETSpef3VvTB/XiJfOqV7SHRBvRE4vzPa4uqrDieOEQF/0G4oaUKKkbIdgwUOg/iyeXV82iHx05ztls47qRGkuw5HPUIAWe34K/wje+tmq3NAVnPXesasbXGYoGWzLz50k1CiVc8y7I4sp1mpjsNS4nCHA9PHCbZl3ADgGvxVtO8msU8835+5kRJIIaX35VqOU3DO7OPwCPrknsp2QncPStp6LUDr5SOgp9Gf4FlWa1MDKZhcx1/NO4hwFho8j77lbamRBCcTAYjn5AtokOKsgzTcBGyj7MLFLaQyoFOr/u8jVNIu0dNNZwafsTDOxFr3gYc7/YciZgTxBdg7W7eQeilSTYpzhR/GO0ZILDl8h5ARcN6Nq/Efyb7L98JV72bPoPjPnEUY4eKw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <04F42B3123BE8D4F9B83FF0C0F15AB66@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3259
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: cb2ba1a9-dc41-4b4c-51e0-08d850bf5e9a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: axew2ej2RWwgzQXTTTuRIdcd2S+MFK6T2EN7tDVy8pTzFv86lbJ/bjk5yUPRT/RlnU2dmqkmm54ZKtRMIXuMVa9z5Ca4XKl8xtAWC28vmImU9DaMMHmoO3qBPSKWDeW49Gem3V4+AGtvKWVyqYspzD4WJ/VP9ECdjhhGtjyTpvp7IFj7SMlRROIKtpChoNoxoHyj+t4KFZ1NCD9KFm5XUs00ZtSlIgc2U2+N2KPVWHuE3DL9LmY1uMH5mlJ6ajyrR/h8kpMz9lcGRs41/v5CFmn1Q/ZXXF4ojnp3R/oa75oyLdSwY5E+x2bEJgMYgiJdaXv8Gvb29BX/DraBXn1LhdTFjg4eGMp+MLYAnrrv7xsGpTmNh7W2fVJGPsUmQ5THxq1WissWkaAannUssPTTI+tcsFnoEhsiTmX1hU6+LNvqgpBwzVKkucEDMjRaJNU+f7cG2ZZWbPC3IG6Nc2Q8wJYJLXcUyN8+VsKMXN6vKac=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(82310400003)(6486002)(6512007)(2906002)(70586007)(70206006)(336012)(966005)(81166007)(478600001)(33656002)(26005)(83380400001)(186003)(316002)(36756003)(356005)(36906005)(86362001)(2616005)(8936002)(47076004)(82740400003)(4326008)(53546011)(6506007)(6862004)(5660300002)(54906003)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2020 10:43:44.3027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 625a3cad-b6a5-4477-f9b5-08d850bf656d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2646
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gNCBTZXAgMjAyMCwgYXQgMTE6MjAsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNC4wOS4yMDIwIDExOjU0LCBHZW9yZ2UgRHVubGFwIHdy
b3RlOg0KPj4gQXQgdGhlIGNvbW11bml0eSBjYWxsIGxhc3QgbW9udGggYXMgd2VsbCBhcyB0aGlz
LCB3ZSBkaXNjdXNzZWQgd2hldGhlciB0byBjb250aW51ZSB0aGUg4oCcR2l0bGFiIGV4cGVyaW1l
bnTigJ0uICBJdCB3YXMgZ2VuZXJhbGx5IGFncmVlZCB0aGF0IHJldmlld2luZyBKdWVyZ2Vu4oCZ
cyBsb25nIHNlcmllcyB3YXMgZmFpcmx5IHN1Yi1vcHRpbWFsLCBhbmQgdGhhdCBlbWFpbCB3YXMg
bW9yZSBzdWl0ZWQgdG8gdGhhdCBzb3J0IG9mIHNlcmllcy4NCj4+IA0KPj4gVGhhdCBzYWlkLCB0
aGVyZSB3YXMgZ2VuZXJhbCBhZ3JlZW1lbnQgdGhhdCByZXF1aXJpbmcgYWxsIHBhdGNoZXMgdG8g
Z28gdGhyb3VnaCBlbWFpbCB3YXMgZ29pbmcgdG8gbGltaXQgY29udHJpYnV0aW9uLCBwYXJ0aWN1
bGFybHkgb2Ygb25lLW9mZiDigJxkcml2ZS1ieeKAnSBjb250cmlidXRpb25zLiAgQXMgc3VjaCwg
aXQgd2FzIHByb3Bvc2VkIHRoYXQgd2UgY29uc2lkZXIgYWxsb3dpbmcgYm90aCBHaXRsYWIgUFJz
LCBhbmQgZW1haWw6IHRoYXQgZm9yIG9uZS1vZmYgb3Igc2hvcnQgc2VyaWVzLCBHaXRsYWIgUFJz
IHdvdWxkIGJlIGFjY2VwdGVkLCBidXQgdGhhdCBmb3IgbG9uZ2VyIHNlcmllcyBhbmQvb3IgbG9u
Z2VyIHRlcm0gY29udHJpYnV0b3JzLCB3ZSB3b3VsZCBlbmNvdXJhZ2UgcGVvcGxlIHRvIHN3aXRj
aCB0byBwYXRjaGJvbWJpbmcgdGhlIG1haWxpbmcgbGlzdC4NCj4+IA0KPj4gV2UgZGVjaWRlZCB0
byBjb250aW51ZSB0aGUg4oCcR2l0bGFiIEV4cGVyaW1lbnTigJ0sIGJ1dCB3aXRoIHNob3J0IFBS
cy4gIEFzIHN1Y2gsIEFuZHkgQ29vcGVyIGhhcyBwb3N0ZWQgdHdvIFBSczoNCj4+IA0KPj4gaHR0
cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hlbi8tL21lcmdlX3JlcXVlc3RzLzINCj4gDQo+
IFRoaXMgbG9va3MgdG8gYmUgY29uZnVzaW5nLCB0byBtZSBhdCBsZWFzdC4gRm9sbG93aW5nIHRo
aXMgbGluayBJDQo+IGNhbid0IHNlZSB0aGUgYWN0dWFsIGNoYW5nZSBkaXJlY3RseS4gRm9sbG93
aW5nIGVpdGhlciBvZiB0aGUgbGlua3MNCj4gYWZ0ZXIgIlJlcXVlc3QgdG8gbWVyZ2UiIGdpdmVz
IGEgNDA0IGVycm9yIChhZnRlciBnaXRsYWIgbm90IGJlaW5nDQo+IGFibGUgdG8gc2lnbiBtZSBp
biB2aWEgR29vZ2xlLCBidXQgdGhlbiBiZWluZyBhYmxlIHRvIHNpZ24gbWUgaW4NCj4gdmlhIGdp
dGh1Yikgb24gYm90aA0KPiANCj4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3Bs
ZS9hbmR5aGhwL3hlbg0KPiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2Fu
ZHloaHAveGVuLy0vdHJlZS94ZW4tcHYtc2VnYmFzZQ0KDQpJIHRoaW5rIHlvdSBtaXNzZWQgb24g
dG9wIHRoZSDigJxDb21taXRz4oCdIGFuZCDigJxDaGFuZ2VzIg0KDQpKdXN0IGNsaWNrIG9uIGNo
YW5nZXMgYW5kIHlvdSB3aWxsIHNlZSB0aGUgZGlmZiBvciBvbiBjb21taXQgYW5kIHRoZW4geW91
IHdpbGwgc2VlIHRoZSB3aG9sZSB0aGluZy4NCg0KPiANCj4gVGhlcmUncyBhbHNvIGFuIGVuZGxl
c3NseSBjaXJjbGluZyBraW5kLW9mLWljb24gbmV4dCB0byAiQ2hlY2tpbmcNCj4gcGlwZWxpbmUg
c3RhdHVzIiwgaW5kaWNhdGluZyB0byBtZSB0aGUgcGFnZSB0cmllcyB0byBsb2FkIHNvbWUNCj4g
aW5mb3JtYXRpb24sIGJ1dCBjYW4ndCBxdWl0ZSBjb21wbGV0ZSBkb2luZyBzby4NCg0KSSBoYXZl
IHRoZSBzYW1lIGhlcmUuDQoNCj4gDQo+IEkgYWxzbyB3b25kZXIgaG93IG9uZSBpcyB0byBiZWNv
bWUgYXdhcmUgb2YgcGVuZGluZyBtZXJnZSByZXF1ZXN0cy4NCj4gRm9yIHRoZSBvbmVzIGhlcmUs
IHlvdXIgbWFpbCB3YXMgdGhlIG9ubHkgaW5kaWNhdGlvbiBzbyBmYXIgdGhhdA0KPiB0aGV5IGV4
aXN0ZWQuIEkgaG9wZSB0aGUgYW5zd2VyIHRvIHRoaXMgaXMgbm90IGdvaW5nIHRvIGJlIHRvIHBv
bGwNCj4gZ2l0bGFiLmNvbS4gSSdtIHNvcnJ5IGlmIEknbSBtYWtpbmcgbmV3YmllIG1pc3Rha2Vz
IG9yIGFzc3VtcHRpb25zDQo+IGhlcmUsIGJ1dCBhcyBmYXIgYXMgZ2l0bGFiIGdvZXMgSSdtIGFm
cmFpZCBJIGFtLg0KDQpPbiBvdGhlciBnaXRsYWIgcHJvamVjdHMgKGZvciBleGFtcGxlIFhlbi1G
dXNhKSwgaSByZWNlaXZlIG1haWxzIGZyb20gZ2l0bGFiDQp3aGVuIHRoZXJlIGlzIGEgcHVsbCBy
ZXF1ZXN0IGFuZCBpIGFsc28gc2VlIGEgbGlzdCBvZiBwZW5kaW5nIHJlcXVlc3RzIHdoZW4NCkkg
Z28gdG8gbXkgdGhlIGZ1c2EgZ2l0bGFiIGFjY291bnQuDQoNCg0KDQo+IA0KPiBBcyBpdCBzdGFu
ZHMgSSdtIGFmcmFpZCBJJ2xsIGJlIGFibGUgdG8gc2VlIHdoYXQgaXMgcHJvcG9zZWQgdG8gYmUN
Cj4gY29tbWl0dGVkIChhbmQgYWZhaWNzIGFsc28gYXBwcm92ZWQgYWxyZWFkeSkgb25seSB3aGVu
IGl0IGhpdHMgdGhlDQo+IHN0YWdpbmcgdHJlZS4NCg0KSSB0cmllZCB0byBhZGQgYSBjb21tZW50
IGFuZCB0aGF0IGlzIHdvcmtpbmcgd2VsbA0KDQpSZW1hcmtzIGZyb20gbXkgc2lkZToNCi0gSG93
IGNhbiBpIGFjay90ZXN0L3JlamVjdCBvbiB0aGlzID8NCi0gSSBmb3VuZCBubyB3YXkgdG8gcHV0
IGEg4oCcZ2xvYmFs4oCdIGNvbW1lbnQgb3IgdG8gcHV0IGEgY29tbWVudCBvbiB0aGUgY29tbWl0
IG1lc3NhZ2UsIGRpZCBJIG1pc3Mgc29tZXRoaW5nID8NCg0KQmVydHJhbmQNCg0KPiANCj4gSmFu
DQo+IA0KPj4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hlbi8tL21lcmdlX3JlcXVl
c3RzLzMNCj4+IA0KPj4gQW5kIEnigJlkIGVuY291cmFnZSBvdGhlcnMgdG8gdHJ5IHN1Ym1pdHRp
bmcgc2ltcGxlIG9uZS1vci10d28tcGF0Y2ggc2VyaWVzIGFzIFBScyB0byBHaXRsYWIgaW5zdGVh
ZCwgYXMgd2UgY29udGludWUgdGhlIGV4cGVyaW1lbnQuDQo+PiANCj4+IC1HZW9yZ2UNCj4+IA0K
PiANCj4gDQoNCg==

