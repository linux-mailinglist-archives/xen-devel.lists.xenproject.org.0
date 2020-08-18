Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF712482B1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 12:14:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7yd7-00047w-LR; Tue, 18 Aug 2020 10:14:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTNL=B4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k7yd6-00047j-8J
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 10:14:08 +0000
X-Inumbo-ID: ce38135d-f5e3-4930-8513-078e64795bee
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce38135d-f5e3-4930-8513-078e64795bee;
 Tue, 18 Aug 2020 10:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJAwlNitfESwp3RkXmgWf1FI/hzfBj+Az27VJrEcyhk=;
 b=xeKGa6JzblSKUWmv1AnrygRitJZF0/QQ4BQDqSRC36PonGfaUSWhax4l6jAoGfvLo8yXM+ybmrOgUtl0Icfny7exCh3UAhkST5brwqws6GsTWWSZAndf3Rge6wyaXFK9Q0tRhB6u5sFys1iQvuYRjDSN5xhD5PHzL9aekNQB1BM=
Received: from AM6PR10CA0028.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::41)
 by AM0PR08MB4178.eurprd08.prod.outlook.com (2603:10a6:208:133::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Tue, 18 Aug
 2020 10:14:05 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::ef) by AM6PR10CA0028.outlook.office365.com
 (2603:10a6:209:89::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Tue, 18 Aug 2020 10:14:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 10:14:05 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Tue, 18 Aug 2020 10:14:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87fe990b1e4ad5d8
X-CR-MTA-TID: 64aa7808
Received: from a17ec1283ed6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3AE5F009-7DA6-4009-A950-BCE665F183E4.1; 
 Tue, 18 Aug 2020 10:13:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a17ec1283ed6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Aug 2020 10:13:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSEjQsx/4hZW0JKFFvWzKna6BecQ1fvdYwu8OfJbxyn/JUshtICQj19WQHBjqV73zj2BOXYUIhMNQX4ad0wXQJ+0OKUUXYDuRx+8V637F52ulWQh2CLLzW8xt+n6mvwN5rqFGkNvK1P8pS6QpS+SsMI1QNgP8HVS0AuaFgGkQRwwtv22Of2ZW/NbWCw7c4O/kJxflQkABmPv1FOkcbSfkX5GsPbMGNVpnzLKuSzZLyZapkHNDT4I9X3pyfNkteZyiUlHGKOn457SL3auOdnuUtGi4w19TWWLzhn1inrc7/9G0W8t+0qTr5gw0O6TL4SDCDeaL4wR7AqWVrkUuBaHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJAwlNitfESwp3RkXmgWf1FI/hzfBj+Az27VJrEcyhk=;
 b=Hb3B8HoJaYpDcFAjthRk+M6uYnojDe4/7YEWzmERizJECCIJJp27OEVjwLu9tF7U0tcYVYjUof45/ShqWX4qNAplFLjzS8mWy4fePuysN9fN4LeaybnnzLHTP4SSjm7dVkQ2IpR+diwjP/lMwD17lXzxSN6WuPGAvaCQNmabTewpvx5eGsxH+H9Auegtqxilip3XTiSPwEs4xjAam1UCfaDQco+cm/t0hGQs4BqS5uOj/P3APXns9xBbuTo2fVH1JCqpGpAcnASvIEeBf58RAu7EkIXPuekntY03XEQnM2bAKooJtfZftTQMYKUi9ux5diBjyrjMGYocIhzgbM04fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJAwlNitfESwp3RkXmgWf1FI/hzfBj+Az27VJrEcyhk=;
 b=xeKGa6JzblSKUWmv1AnrygRitJZF0/QQ4BQDqSRC36PonGfaUSWhax4l6jAoGfvLo8yXM+ybmrOgUtl0Icfny7exCh3UAhkST5brwqws6GsTWWSZAndf3Rge6wyaXFK9Q0tRhB6u5sFys1iQvuYRjDSN5xhD5PHzL9aekNQB1BM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3516.eurprd08.prod.outlook.com (2603:10a6:10:4f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 18 Aug
 2020 10:13:25 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 10:13:25 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andre Przywara <Andre.Przywara@arm.com>
CC: Wei Chen <Wei.Chen@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Steve Capper <Steve.Capper@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, nd
 <nd@arm.com>
Subject: Re: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
Thread-Topic: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
Thread-Index: AQHWdQ1DgIquqcpHPEOT+qWxYeHAMqk9lfsAgAAC9ACAAAS3AIAACKkA
Date: Tue, 18 Aug 2020 10:13:25 +0000
Message-ID: <D52E4104-F43D-4A8D-A135-79569EC0BDDA@arm.com>
References: <20200818031112.7038-1-wei.chen@arm.com>
 <ef6a40d7-7def-3726-870c-f9bf22e2a388@arm.com>
 <139F007F-5C70-4AB3-B2BC-3A7D414A5C06@arm.com>
 <ba38efd7-2fdd-e354-7a24-bcd67f9793b2@arm.com>
In-Reply-To: <ba38efd7-2fdd-e354-7a24-bcd67f9793b2@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c9a8d15a-4f37-44d8-c89b-08d8435f6feb
x-ms-traffictypediagnostic: DB7PR08MB3516:|AM0PR08MB4178:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB41782DF48574A8802DF3B76E9D5C0@AM0PR08MB4178.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: OB2nIaDEcKuvGqiFtY9YF8xVFdjckNlpXvf61Kw5E8Cgbrv6+rAbglz2d6O/NXmlsdAg0K4biPV84pQUotlHjC7CowlO2uTiICTtXWWkO2vHPepTnm8sZ75RTrUnAY03ptTn1zoyPmld0xJoKJM6L2W3GxrnJS5/IGlEH5/Tvo9COKdERkYVqlqJ0MFA1ro0YNqe/7i0VcINc0Tv5Toi9MJoB1NgvDuVq4fueUqD9pDJrCbmnSK5TUwncCaTUCLayFsPSSojK35lr5vde2E1swhcMdxKsywMnSP1I9gGvSiywzlvBzXRt6YBHeFXSIjkDxah2c53EiWjtUn39zybPRfnqYX3II/dnFQ6TDtFIK7VRr6zAICOtNWlhuuMxrG3Bg9+TtfsMfHlPAyp7qg5XA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(71200400001)(91956017)(6506007)(53546011)(66446008)(64756008)(66556008)(66476007)(83380400001)(36756003)(186003)(5660300002)(6636002)(26005)(8936002)(2906002)(2616005)(8676002)(6486002)(966005)(33656002)(86362001)(54906003)(37006003)(76116006)(66946007)(6512007)(478600001)(6862004)(316002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: xdanmkM9sFJnFYZIbzgWWsWNeV7Ihi+WXHOFfdb8iG55edVvBe4ZFgTVeWwE/KO2H5e2FAhTaCu80rlLn/jWBgn4zbWT3xot37SE+p5G+zpoF1sI7LsbCxV2SAHZUnTanQHAGWF3dKh+1tS4IbRtCjM1RLOk79us84vVcZm6enjOO4n/tl9PeAa0o5cJv8wbtOGnLPEKVC1LWZoQ4ZLSQ43Kk+9cmJdENQzv83nUnanyRPHtuFVCU8j9l1ii9nA4wask0XncJ+EV+QQwiPZ8OxPgp3Z78I7chsp10vzFyYYyWf1qgXrj7qZqGHsq0GBIxsjixTWvV9o+NcoAL/No0euHOf1PIdpRdUaUE9U8vO+2p7evbmJutRK7owIqKFTCBZlMFI/jYHo8wyOylUXkmNmxD+763ekCQCHD/uluCKCFtWDvaa5TZtUKqx5bcm7oSGc9arCBuvBa/tIYOPzleZ0Ng9SzDMlYsQqe4QaHYNz0MemZv7fEYPOk+r7/DdZUV9hlgZBfct0BUvUXeVldFiKVHAbaAjbnDLSDnq8yUij2ArG+RoOo5nP6GLRIlMbKp8CEdOW2hU59uDFP7yG4B7z714mV1GSi4mmLtLeg+bMFpDZ2WN2jEHsW3JoPjQr1b3gP8f52cI7XrDqqAghACA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <D66076578B5CD94CB81370A3C0F0CFDA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3516
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 40b6a7f7-5bc3-4c4a-ba44-08d8435f5863
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sbLTof073PYJ/KYrBnYxxHSfbKgCyK2pA7yo+SYncDVG1BFNM+vS6uhXD4Su+d1nrBOtu4ga+txY58Vdl30GG6Lli/FFcxDxMSYfT1+9MUihhEE9Dse/mM+7SRzNc8uX9bl3mZ+802cziq52sdQgFE/jk1ak2uNr0uEJl6sZ94L3HIU3qAVU0UyWq6dc5cdhKoUPH0/vXecyUgwCe2VW52ioxb/IfdYdXK3COW+DeCVSJRw5UlxdqMRiP4HFRWh1I12UETPoTF54UNAL4RLrAzbO4jlVTbcLdh9Wf67Z3xwYYP71yrT/xy9d8K1UlEVbQNxJ+DkpmQYa6nifWaYT9c2eFkUT3v2Z2tOhl4gI1IHjAhZ8LZxaZaZB+R6Or87TLS66Is7ztBrptDlriwWj68GVFvEKlZPdyehh0sUl4p7x46maun7QmI0/KoljKBPilP5RLSuLQf54asgZJjfOLVfHOUOgqUmMS4EZBmHyKuQ=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966005)(36906005)(5660300002)(47076004)(82740400003)(478600001)(54906003)(37006003)(316002)(6512007)(6486002)(2906002)(186003)(33656002)(26005)(86362001)(336012)(2616005)(8676002)(4326008)(966005)(8936002)(6636002)(6862004)(53546011)(6506007)(70206006)(70586007)(81166007)(356005)(82310400002)(36756003)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 10:14:05.0832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a8d15a-4f37-44d8-c89b-08d8435f6feb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4178
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

DQoNCj4gT24gMTggQXVnIDIwMjAsIGF0IDEwOjQyLCBBbmRyw6kgUHJ6eXdhcmEgPGFuZHJlLnBy
enl3YXJhQGFybS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTgvMDgvMjAyMCAxMDoyNSwgQmVydHJh
bmQgTWFycXVpcyB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4+PiBPbiAxOCBBdWcgMjAyMCwgYXQg
MTA6MTQsIEFuZHLDqSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4gd3JvdGU6DQo+
Pj4gDQo+Pj4gT24gMTgvMDgvMjAyMCAwNDoxMSwgV2VpIENoZW4gd3JvdGU6DQo+Pj4gDQo+Pj4g
SGkgV2VpLA0KPj4+IA0KPj4+PiBYZW4gaGFzIGNwdV9oYXNfZnAvY3B1X2hhc19zaW1kIHRvIGRl
dGVjdCB3aGV0aGVyIHRoZSBDUFUgc3VwcG9ydHMNCj4+Pj4gRlAvU0lNRCBvciBub3QuIEJ1dCBj
dXJyZW50bHksIHRoaXMgdHdvIE1BQ1JPcyBvbmx5IGNvbnNpZGVyIHZhbHVlIDANCj4+Pj4gb2Yg
SURfQUE2NFBGUjBfRUwxLkZQL1NJTUQgYXMgRlAvU0lNRCBmZWF0dXJlcyBlbmFibGVkLiBCdXQg
Zm9yIENQVXMNCj4+Pj4gdGhhdCBzdXBwb3J0IEZQL1NJTUQgYW5kIGhhbGYtcHJlY2lzaW9uIGZs
b2F0aW5nLXBvaW50IGZlYXR1cmVzLCB0aGUNCj4+Pj4gSURfQUE2NFBGUjBfRUwxLkZQL1NJTUQg
YXJlIDEuIEZvciB0aGVzZSBDUFVzLCB4ZW4gd2lsbCB0cmVhdCB0aGVtIGFzDQo+Pj4+IG5vIEZQ
L1NJTUQgc3VwcG9ydC4gSW4gdGhpcyBjYXNlLCB0aGUgdmZwX3NhdmUvcmVzdG9yZV9zdGF0ZSB3
aWxsIG5vdA0KPj4+PiB0YWtlIGVmZmVjdC4NCj4+Pj4gDQo+Pj4+IFVuZm9ydHVuYXRlbHksIENv
cnRleC1OMS9BNzYvQTc1IGFyZSB0aGUgQ1BVcyBzdXBwb3J0IEZQL1NJTUQgYW5kDQo+Pj4+IGhh
bGYtcHJlY2lzaW9uIGZsb2F0aWluZy1wb2ludC4gVGhlaXIgSURfQUE2NFBGUjBfRUwxLkZQL1NN
SUQgYXJlIDENCj4+Pj4gKHNlZSBBcm0gQVJNIERESTA0ODdGLmIsIEQxMy4yLjY0KS4gSW4gdGhp
cyBjYXNlLCBvbiBOMS9BNzYvQTc1DQo+Pj4+IHBsYXRmb3JtcywgWGVuIHdpbGwgYWx3YXlzIG1p
c3MgdGhlIGZsb2F0IHBvaW50ZXIgcmVnaXN0ZXJzIHNhdmUvcmVzdG9yZS4NCj4+Pj4gSWYgZGlm
ZmVyZW50IHZDUFVzIGFyZSBydW5uaW5nIG9uIHRoZSBzYW1lIHBDUFUsIHRoZSBmbG9hdCBwb2lu
dGVyDQo+Pj4+IHJlZ2lzdGVycyB3aWxsIGJlIGNvcnJ1cHRlZCByYW5kb21seS4NCj4+PiANCj4+
PiBUaGF0J3MgYSBnb29kIGNhdGNoLCB0aGFua3MgZm9yIHdvcmtpbmcgdGhpcyBvdXQhDQo+Pj4g
DQo+Pj4gT25lIHRoaW5nIGJlbG93Li4uDQo+Pj4gDQo+Pj4+IFRoaXMgcGF0Y2ggZml4ZXMgWGVu
IG9uIHRoZXNlIG5ldyBjb3Jlcy4NCj4+Pj4gDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVu
IDx3ZWkuY2hlbkBhcm0uY29tPg0KPj4+PiAtLS0NCj4+Pj4geGVuL2luY2x1ZGUvYXNtLWFybS9j
cHVmZWF0dXJlLmggfCA0ICsrLS0NCj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4+Pj4gDQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20tYXJtL2NwdWZlYXR1cmUuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oDQo+
Pj4+IGluZGV4IDY3NGJlYjAzNTMuLjU4ODA4OWU1YWUgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oDQo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vY3B1ZmVhdHVyZS5oDQo+Pj4+IEBAIC0xMyw4ICsxMyw4IEBADQo+Pj4+ICNkZWZpbmUgY3B1
X2hhc19lbDJfNjQgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChlbDIpID49IDEpDQo+Pj4+ICNkZWZp
bmUgY3B1X2hhc19lbDNfMzIgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChlbDMpID09IDIpDQo+Pj4+
ICNkZWZpbmUgY3B1X2hhc19lbDNfNjQgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChlbDMpID49IDEp
DQo+Pj4+IC0jZGVmaW5lIGNwdV9oYXNfZnAgICAgICAgIChib290X2NwdV9mZWF0dXJlNjQoZnAp
ID09IDApDQo+Pj4+IC0jZGVmaW5lIGNwdV9oYXNfc2ltZCAgICAgIChib290X2NwdV9mZWF0dXJl
NjQoc2ltZCkgPT0gMCkNCj4+Pj4gKyNkZWZpbmUgY3B1X2hhc19mcCAgICAgICAgKGJvb3RfY3B1
X2ZlYXR1cmU2NChmcCkgPD0gMSkNCj4+Pj4gKyNkZWZpbmUgY3B1X2hhc19zaW1kICAgICAgKGJv
b3RfY3B1X2ZlYXR1cmU2NChzaW1kKSA8PSAxKQ0KPj4+IA0KPj4+IEJ1dCB0aGlzIGlzIG9ubHkg
Z29vZCB1bnRpbCB0aGUgbmV4dCBmZWF0dXJlIGJ1bXAuIEkgdGhpbmsgd2Ugc2hvdWxkIGJlDQo+
Pj4gbW9yZSBmdXR1cmUtcHJvb2YgaGVyZS4gVGhlIGFyY2hpdGVjdHVyZSBkZXNjcmliZXMgdGhv
c2UgdHdvIGZpZWxkcyBhcw0KPj4+ICJzaWduZWQiWzFdLCBhbmQgZ3VhcmFudGVlcyB0aGF0ICJp
ZiB2YWx1ZSA+PSAwIiBpcyBhIHZhbGlkIHRlc3QgZm9yIHRoZQ0KPj4+IGZlYXR1cmUuIFdoaWNo
IG1lYW5zIHdlIGFyZSBnb29kIGFzIGxvbmcgYXMgdGhlIHNpZ24gYml0IChiaXQgMykgaXMNCj4+
PiBjbGVhciwgd2hpY2ggdHJhbnNsYXRlcyBpbnRvOg0KPj4+ICNkZWZpbmUgY3B1X2hhc19mcCAg
ICAgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChmcCkgPCA4KQ0KPj4+IFNhbWUgZm9yIHNpbWQuDQo+
Pj4gDQo+PiANCj4+IFdlIGNhbm5vdCByZWFsbHkgYmUgc3VyZSB0aGF0IGEgbmV3IHZlcnNpb24g
aW50cm9kdWNlZCB3aWxsIHJlcXVpcmUgdGhlDQo+PiBzYW1lIGNvbnRleHQgc2F2ZS9yZXN0b3Jl
IHNvIGl0IG1pZ2h0IGRhbmdlcm91cyB0byBjbGFpbSB3ZSBzdXBwb3J0DQo+PiBzb21ldGhpbmcg
d2UgaGF2ZSBubyBpZGVhIGFib3V0Lg0KPiANCj4gSSBhbSBwcmV0dHkgc3VyZSB3ZSBjYW4sIGJl
Y2F1c2UgdGhpcyBpcyB3aGF0IHRoZSBGUCBmZWF0dXJlIGRlc2NyaWJlcy4NCj4gSWYgYSBmZWF0
dXJlIGJ1bXAgd291bGQgaW50cm9kdWNlIGEgbGFyZ2VyIHN0YXRlIHRvIGJlIHNhdmVkIGFuZA0K
PiByZXN0b3JlZCwgdGhhdCB3b3VsZCBiZSBjb3ZlcmVkIGJ5IGEgbmV3IGZpZWxkLCBsb29rIGF0
IEFkdlNJTUQgYW5kIFNWRQ0KPiBmb3IgZXhhbXBsZXMuDQo+IFRoZSBmZWF0dXJlIG51bWJlciB3
b3VsZCBvbmx5IGJlIGJ1bXBlZCBpZiBpdCdzIGNvbXBhdGlibGU6DQo+ID09PT09PT09PT09PT09
PT09PT09DQo+IMK3IFRoZSBmaWVsZCBob2xkcyBhIHNpZ25lZCB2YWx1ZS4NCj4gwrcgVGhlIGZp
ZWxkIHZhbHVlIDB4RiBpbmRpY2F0ZXMgdGhhdCB0aGUgZmVhdHVyZSBpcyBub3QgaW1wbGVtZW50
ZWQuDQo+IMK3IFRoZSBmaWVsZCB2YWx1ZSAweDAgaW5kaWNhdGVzIHRoYXQgdGhlIGZlYXR1cmUg
aXMgaW1wbGVtZW50ZWQuDQo+IMK3IFNvZnR3YXJlIHRoYXQgZGVwZW5kcyBvbiB0aGUgZmVhdHVy
ZSBjYW4gdXNlIHRoZSB0ZXN0Og0KPiAgICAgIGlmIHZhbHVlID49IDAgeyAgLy8gU29mdHdhcmUg
ZmVhdHVyZXMgdGhhdCBkZXBlbmQgb24gdGhlIHByZXNlbmNlDQo+IG9mIHRoZSBoYXJkd2FyZSBm
ZWF0dXJlIH0NCj4gPT09PT09PT09PT09PT09PT09PT0NCj4gKEFSTXY4IEFSTSBEMTMuMS4zKQ0K
PiANCj4gQW5kIHRoaXMgaXMgaG93IExpbnV4IGhhbmRsZXMgdGhpcy4NCg0KVGhlbiBjaGFuZ2lu
ZyB0aGUgY29kZSB0byB1c2UgPDggc2hvdWxkIGJlIG9rLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoN
Cj4gDQo+IENoZWVycywNCj4gQW5kcmUNCj4gDQo+PiBJIGFncmVlIHRob3VnaCBhYm91dCB0aGUg
YW5hbHlzaXMgb24gdGhlIGZhY3QgdGhhdCB2YWx1ZXMgdW5kZXIgOCBzaG91bGQNCj4+IGJlIHZh
bGlkIGJ1dCBvbmx5IDAgYW5kIDEgY3VycmVudGx5IGV4aXN0IFsxXSwgb3RoZXIgdmFsdWVzIGFy
ZSByZXNlcnZlZC4NCj4+IA0KPj4gU28gSSB3b3VsZCB2b3RlIHRvIGtlZXAgdGhlIDEgZm9yIG5v
dyB0aGVyZS4NCj4+IA0KPj4gQ2hlZXJzDQo+PiBCZXJ0cmFuZA0KPj4gDQo+PiBbMV0gaHR0cHM6
Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2NzL2RkaTA1OTUvaC9hYXJjaDY0LXN5c3RlbS1yZWdpc3Rl
cnMvaWRfYWE2NHBmcjBfZWwxDQoNCg==

