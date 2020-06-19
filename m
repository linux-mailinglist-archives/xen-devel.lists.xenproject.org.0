Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEBC200451
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 10:50:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmCim-0007NP-LS; Fri, 19 Jun 2020 08:50:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBT4=AA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jmCik-0007NK-Sa
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 08:49:58 +0000
X-Inumbo-ID: da252614-b209-11ea-bb4b-12813bfff9fa
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.71]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da252614-b209-11ea-bb4b-12813bfff9fa;
 Fri, 19 Jun 2020 08:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHuUM1caB3fKi1KJ4cB2DVD7ajRsxVL/D26k4TX4KkE=;
 b=KZFr9p+njNXF4ds591pz/F2CHkWyipTA/rwW33C6TakgTPAMhOUB75ltXJM+TPhoufhTISHY/7Im8pHySs7Dii241cpMW52OG+SeYV0piOVFP/cGa2OinqxHQGrU7xMgW33WRVnQA0WAHL0UPi6nOMt7W33GOqAhdzd43BaCUXs=
Received: from MR2P264CA0085.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::25)
 by HE1PR0801MB1977.eurprd08.prod.outlook.com (2603:10a6:3:4d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Fri, 19 Jun
 2020 08:49:55 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::f6) by MR2P264CA0085.outlook.office365.com
 (2603:10a6:500:32::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Fri, 19 Jun 2020 08:49:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 08:49:54 +0000
Received: ("Tessian outbound 09efa10eaf29:v59");
 Fri, 19 Jun 2020 08:49:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1cf2a60be84adb22
X-CR-MTA-TID: 64aa7808
Received: from f85a629d5c6a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC0ECA7A-E341-4A15-9D4E-460F2F62C3BA.1; 
 Fri, 19 Jun 2020 08:49:48 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f85a629d5c6a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 Jun 2020 08:49:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgvFZLRJ0hWo36N6UkfOlnIP+RMjnR5dz7pVkCkqVjkJz4Y/vD0YJv8kacDe+PA/N5QKV0stKybT9KD2KSidxi0YHMi2wbu7g8bWjV4zmSqUXJ9L4yhvENEZ5yMhTHljH6ID3VsMz3HZmamemz2fHCqdws7g9Zihhou+eTcSA3DawVA8srWAk1SnDwAZNLFA6b2Bk3EUe1Ik9m2sHqUAw9JHZs9wW3d9j8H+2pq0r8Nv91CRxkO7YzAJIz1FOJH91xkZxZOUx3s+864sLW6ql6BAyvvESYA1EGNBdkdfgiVlhUQM1OOqqmY1F4aZVK5/x027QDZdmv43Gr4vAegMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHuUM1caB3fKi1KJ4cB2DVD7ajRsxVL/D26k4TX4KkE=;
 b=hgZaTJUiOgkZO0y3i4vMiLNvyzrk6zcMThnL5pECsJCrAVRu1ld6q86/e6sZg3P8qBzPUXpX4tCgZEq2QF1MdFLll3nDHJ4uw4zeCP7/TGEPNZd0DXtai13eD9zN0ZX1dJPWAIJ6RM0wniGT4253LP483Y93CdykA4NNN7F19WkQRfLnMv+bewE08qMLKJgVBsjIDCQyQvk4mKa0CdXWzuxlwlHAVB44AlwTg2s4+y68JoKujg3WT92z7UsWYHpmccAkVjizFc6a3w2gC1GX2AOoJ0bdZdgtfIFr+Jhx9z/5jT8YGIsJRlIhm7hMNDMJCVDfbDaI4JpK+ElRQ9OXpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHuUM1caB3fKi1KJ4cB2DVD7ajRsxVL/D26k4TX4KkE=;
 b=KZFr9p+njNXF4ds591pz/F2CHkWyipTA/rwW33C6TakgTPAMhOUB75ltXJM+TPhoufhTISHY/7Im8pHySs7Dii241cpMW52OG+SeYV0piOVFP/cGa2OinqxHQGrU7xMgW33WRVnQA0WAHL0UPi6nOMt7W33GOqAhdzd43BaCUXs=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3387.eurprd08.prod.outlook.com (2603:10a6:10:45::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Fri, 19 Jun
 2020 08:49:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 08:49:47 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Tee-dev] TEE with XEN
Thread-Topic: [Tee-dev] TEE with XEN
Thread-Index: AdZCuN8SyGfGPx9hRva/eeajiUtqpQAw/zsAAIeJWwAACMx1AAAWGKGA
Date: Fri, 19 Jun 2020 08:49:47 +0000
Message-ID: <D616EF58-B0DD-4D7F-8888-A086642997E2@arm.com>
References: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
 <8a6ba53e-59c8-0c18-00e9-2902b6edaf39@xen.org>
 <alpine.DEB.2.21.2006181507360.14005@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006181507360.14005@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fb736af4-d2f9-4055-d2b6-08d8142dbcc6
x-ms-traffictypediagnostic: DB7PR08MB3387:|HE1PR0801MB1977:
X-Microsoft-Antispam-PRVS: <HE1PR0801MB19770F0D66390F980990D1FF9D980@HE1PR0801MB1977.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 3x/ItV9aWpRJ14/UdOJ8puNH/xQMGLsFQqS0gNnBru2j9d+tGBSyZlLfmuLzu3FhkBg53t//AIyT0NpZLTAFR3z0M7cwL/8C9lqbOmvJtpCWXLcwH8MydMzTNNsTre0+P9SqpaCB+ZdWYkf0EeyNkKEW9plQ7S0Q6I0rizOW7Nyj12Ci/+enn+mcg8+d9GmKFR31rVhjSw2QQA4/az0MdfmbhnvNoxeExMsnQ3EV5SqbOwRNMvCae+dk6FHf6PyNZUp6ntA80eKjYdDXPGyB1qhplv/2D/KbJXKofR4rNpo9Ae14wUzrYZQSEPYqfaQRy31HWI0AfeoDGUFB3GZV0Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(83380400001)(6512007)(86362001)(8936002)(6486002)(478600001)(5660300002)(8676002)(2906002)(36756003)(4326008)(2616005)(186003)(6916009)(66446008)(64756008)(54906003)(66476007)(53546011)(33656002)(6506007)(76116006)(91956017)(66946007)(316002)(66556008)(71200400001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: XGtFa/0evpMBP0H8vttHao4M4D/7O3+w6CmhXnWHOLoPMkfyAxLhlITRhj9AG7Wyw/S4jXAO8uMANBznoQFcYr5Z7aGzzsavzdjj6Bbb97KEGIGMJsk6p5v+HtSDh6zHPgLl+/66SHeA2MJTN3khIa/91RgWFp13YtK3o3del3oU2Qywhju2EhkpdIPP+ubBV7Ud+rbuLsXRnWeB5/+vg5N8ezoGAphemAPZtOCZhj2/M3oUysG2VRBqkHmfP2M7pmOV219XkRPL4H50FNw/ZzLz2wl76M4V+F1X3Jz9x9JUVoQdf+4BYi+s9wvHfZNsVKIxJDG9Eg9EfOFqMDjKDYXuB5b0IQ4YH3Ku1RJLC7VtjcTUsv00fL94f76h3FfuDHd1/yqkK/CZ+VSSMUSi2zFbEqfskeKvC9fOkuWwO9Pc3VTcFTqlCH/c3E7tzI5H2t5pGORa4dchpE5FFB820qupAP7xVNy53yMSQArb328k/3QGSdcPoYpJpU2D2/KH
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <330E7F673DA9384F837BC46E29168CD2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3387
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(33656002)(8936002)(36756003)(6486002)(8676002)(83380400001)(54906003)(6862004)(86362001)(4326008)(478600001)(82310400002)(316002)(26005)(2616005)(186003)(5660300002)(6506007)(53546011)(81166007)(47076004)(336012)(70206006)(70586007)(356005)(36906005)(2906002)(6512007)(82740400003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 421f00a0-b84d-47e1-ed92-08d8142db8d1
X-Forefront-PRVS: 0439571D1D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 49UqTfo6mWctHLBhipRAi0OTLG3N0nBVJat3Ok4pJrFH2eAIhlpyFzcfw7BiPSmcOwP0hA3r4PU8sB30GYOWxc5f+q4YpxszF5Sf4fJyR2straJ19+C/X/GHIdLMXXZ2fJN7X16/XakuV3XcihIpNvhtxVVsyNN+EfXP2VrWbMCDKw+tq8v2yPRfdaGi54fjCdfDla1QjifSW7mXJ+ve/5xDcWWsLl28LdxJU68FZRW1sua+iLkWSbNEJphrhKKOjIZCsn1Dw2HO1WKjAnDmobFEixio8+Un8G2TXlQ3oKzoVHZ6HiBkJjzEqd1nR77yKyZwey+D0t5dGFqLyG3wYOUmpKFvi/ZLBw6juO2j+bpxPfsws2srE921K31rdP4yQap4/mh8QX1skZgswA499Q==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 08:49:54.5006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb736af4-d2f9-4055-d2b6-08d8142dbcc6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1977
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
Cc: Peng Fan <peng.fan@nxp.com>, Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <vlad.babchuk@gmail.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Stefano Babic <sbabic@denx.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTggSnVuIDIwMjAsIGF0IDIzOjE3LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCAxOCBKdW4gMjAyMCwgSnVs
aWVuIEdyYWxsIHdyb3RlOg0KPj4gK0JlcnRyYW5kIGFuZCBTdGVmYW5vDQo+IA0KPiBUaGFua3Mg
Zm9yIENDJ2luZyBtZQ0KPiANCj4gDQo+PiBPbiAxNi8wNi8yMDIwIDAyOjI0LCBWb2xvZHlteXIg
QmFiY2h1ayB3cm90ZToNCj4+PiBIaSBQZW5nLA0KPj4+IA0KPj4+IE9uIE1vbiwgMTUgSnVuIDIw
MjAgYXQgMDU6MDcsIFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPiB3cm90ZToNCj4+Pj4gDQo+
Pj4+IEhpIEFsbCwNCj4+Pj4gDQo+Pj4+IFdoaWxlIGVuYWJsaW5nIHRydXN0eSBvcyB3aXRoIHhl
biwgSSB0b29rIHNhbWUgYXBwcm9hY2ggYXMgT1AtVEVFLA0KPj4+PiB3aXRoIE9QLVRFRSBydW5u
aW5nIGluIHNlY3VyZSB3b3JsZC4gQnV0IEkgYW0gYWxzbyB0aGlua2luZyB0aGlzIG1pZ2h0DQo+
Pj4+IGludHJvZHVjZSBwb3RlbnRpYWwgaXNzdWUgaXMgdGhhdCBzZWN1cmUgd29ybGQgT1MgY29t
bXVuaWNhdGUgd2l0aCBEb21VLg0KPj4+PiBJZiB0aGVyZSBhcmUgc29tZSBtaXNiZWhhdmlvciBp
biBzZWN1cmUgd29ybGQgT1MsIGl0IG1pZ2h0IGxldCBYRU4NCj4+Pj4gaHlwZXJ2aXNvciBub3Qg
d29yayBwcm9wZXIuDQo+Pj4+IA0KPj4+PiBJbiBteSBzZXR1cCwgdHJ1c3R5IG9zIHNvbWV0aW1l
cyBwYW5pYyBpbiBzZWN1cmUgd29ybGQsIHhlbiB3aWxsIG5vdCBhYmxlDQo+Pj4+IHRvIGNvbnRy
b2wgdGhlIHBhbmljIGNvcmUgYW55bW9yZS4NCj4+IA0KPj4gTWF5IEkgYXNrIGluIHdoaWNoIGNh
c2UgVHJ1c3R5IGlzIHBhbmlja2luZz8NCj4+IA0KPj4+PiANCj4+Pj4gU28gSSBhbSB0aGlua2lu
ZyB3aGV0aGVyIHdlIG5lZWQgdG8gZW11bGF0aW5nIHNlY3VyZSB3b3JsZCBpbiBhIFhFTiBWTQ0K
Pj4+PiB3aGljaCBpcyB0aGUgVk0gcnVubmluZyBEb21VLiBKdXN0IGxpa2Ugd2hhdCBBQ1JOIGRp
ZCB0byBydW4gdHJ1c3R5DQo+Pj4+IG9zLg0KPj4+IA0KPj4+IFdlbGwsIGl0IGRlcGVuZHMgb24g
d2hvbSB5b3UgYXJlIHRydXN0aW5nIG1vcmUuIEJvdGggWEVOIGFuZCBURUUgYXJlIG1pbmltYWwN
Cj4+PiBPUyBpbXBsZW1lbnRhdGlvbnMgd2l0aCBhaW0gYXQgc2VjdXJpdHkuIEknbSBzcGVha2lu
ZyBhYm91dCBnZW5lcmljIFRFRSBPUywNCj4+PiBub3QNCj4+PiBhYm91dCBwYXJ0aWN1bGFyIE9T
IGxpa2UgT1AtVEVFIG9yIFRydXN0eS4gUHJvYmxlbSBpcyB0aGF0LCBpZiBURUUgaXMNCj4+PiBy
dW5uaW5nIGluc2lkZQ0KPj4+IFZNLCBpdCB3aWxsIGJlIHN1c2NlcHRpYmxlIHRvIGEgaHlwZXJ2
aXNvciBtaXNiZWhhdmlvdXIuIFlvdSBuZWVkIHRvDQo+Pj4gdW5kZXJzdGFuZA0KPj4+IHRoYXQg
WGVuIGFuZCBwcml2aWxlZ2VkIGRvbWFpbiAoZG9tMCwgbW9zdGx5KSBjYW4gYWNjZXNzIG1lbW9y
eSBvZiBhbnkNCj4+PiBndWVzdC4NCj4+PiBBdCBsZWFzdCwgaW4gZGVmYXVsdCBjb25maWd1cmF0
aW9uLiBUaGVyZSBhcmUgbWVhbnMgdG8gaGFyZGVuIHRoaXMNCj4+PiBzZXR1cC4gQnV0IGFueXdh
eXMsDQo+Pj4gWGVuIGNhbid0IGJlIHN0b3BwZWQgZnJvbSByZWFkaW5nIFRFRSdzIHNlY3JldHMu
DQo+PiANCj4+IElJUkMsIHdlIGRpc2N1c3NlZCB0aGlzIGFwcHJvYWNoIGZvciBPUC1URUUgaW4g
dGhlIHBhc3QuIFRoZXJlIHdhcyBvdGhlcg0KPj4gcG90ZW50aWFsIHBpdGZhbGxzIHdpdGggaXQu
IEZvciBpbnN0YW5jZSwgeW91IHdvdWxkbid0IGJlIGFibGUgdG8gZGlyZWN0bHkNCj4+IGFjY2Vz
cyBhbnkgc2VjdXJlIGRldmljZSBmcm9tIHRoYXQgZ3Vlc3QgKGl0IGlzIHJ1bm5pbmcgaW4gbm9u
LXNlY3VyZSB3b3JsZCkuDQo+IA0KPiBHaXZlbiB0aGF0IFNlY3VyZSBXb3JsZCBoYXMgYWNjZXNz
IHRvIE5vcm1hbCBXb3JsZCBidXQgbm90IHZpY2UgdmVyc2EsDQo+IGl0IGlzIG1vcmUgbmF0dXJh
bCB0byBydW4gVHJ1c3R5IGluIG9uZSBvZiB0aGUgU2VjdXJlIGV4ZWN1dGlvbiBsZXZlbHMuDQo+
IFRoZSBleHBlY3RhdGlvbiBpcyB0aGF0IFRydXN0eSBoYXMgaGlnaGVyIHByaXZpbGVnZSwgdGh1
cyBpdCBpcyBtb3JlDQo+ICJ0cnVzdGVkIiB0aGFuIGFueXRoaW5nIHJ1bm5pbmcgaW4gTm9ybWFs
IFdvcmxkLCBpbmNsdWRpbmcgWGVuLg0KPiANCj4gT2YgY291cnNlIG5vIGNsaWVudCBzaG91bGQg
YmUgYWJsZSB0byBjcmFzaCBUcnVzdHksIHNvIHRoZSByZWFsaXR5DQo+IHNvbWV0aW1lcyBjYW4g
YmUgdmVyeSBkaWZmZXJlbnQgZnJvbSB0aGUgdGhlb3J5IDotKQ0KPiANCj4gSWYgSSB3ZXJlIHlv
dSwgSSB3b3VsZCBjb25zaWRlciBydW5uaW5nIHRoZSBURUUgImluc2lkZSIgdGhlIFZNIG9ubHkg
aWYNCj4gdGhlIHNlcnZpY2UgdGhhdCB0aGUgVEVFIHByb3ZpZGVzIGlzIHN0cm9uZ2x5IGNvdXBs
ZWQgd2l0aCB0aGUgVk0gYW5kDQo+IGRvZXNuJ3QgYWN0dWFsbHkgbmVlZCBhIGhpZ2ggbGV2ZWwg
b2YgcHJpdmlsZWdlIHRvIGZ1bmN0aW9uIChpLmUuDQo+IGRvZXNuJ3QgYWNjZXNzIHNlY3VyZSBk
ZXZpY2VzIG9yIGF0IGxlYXN0IG5vdCBvZnRlbi4pDQo+IA0KDQpJIGNvdWxkIHNlZSBzb21lIHNj
ZW5hcmlvcyB3aGVyZSB0aGlzIHdvdWxkIG1ha2Ugc2Vuc2UgaWYgeW91IHRydXN0IG9uZSBWTSBt
b3JlIHRoZW4gYW4gb3RoZXIuDQpCdXQgdGhpcyBmYWxscyBpbnRvIGEgbW9kZWwgb2Yg4oCcdmly
dHVhbGl6aW5n4oCdIG9wdGVlIHVzaW5nIGEgVk0gd2hlcmUgZnJvbSB0aGUgc3lzdGVtIHBvaW50
IG9mIHZpZXcgYW55IHVzYWdlIG9mIHRoaXMgVk0gZnJvbSB0aGUgZnVuY3Rpb25hbGl0eSBjb3Vs
ZCBub3QgYmUgbW9yZSB0cnVzdGVkIHRoZW4gWGVuIEFuZCB0aGUgVk0gcHJvdmlkaW5nIHRoZSBz
ZXJ2aWNlLg0KDQo+IA0KPj4gRGVwZW5kaW5nIG9uIHdoZXRoZXIgeW91IGNhbiBtb2RpZnkgVHJ1
c3R5IE9TLCBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBtYWtlDQo+PiBpdHZpcnR1YWxpemF0aW9u
IGF3YXJlIGFzIE9QLVRFRSBkaWQuIFRoZSBjb3JlIHdvdWxkIG5lZWQgdG8gYmUgcmVzaWxpZW50
IGFuZA0KPj4gdGhlIHBhbmljIG9ubHkgYWZmZWN0IGEgZ2l2ZW4gY2xpZW50Lg0KPiANCj4gVGhp
cyB3b3VsZCBtb3N0IHByb2JhYmx5IGJlIHRoZSBiZXN0IGNvbXByb21pc2UuDQoNCkFncmVlLg0K
DQpCZXJ0cmFuZA0KDQoNCg==

