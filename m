Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E8F2611C5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 15:06:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFdJf-0004oi-MK; Tue, 08 Sep 2020 13:05:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjYd=CR=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kFdJe-0004oc-2i
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 13:05:42 +0000
X-Inumbo-ID: 4f962236-e83d-4792-b338-c86641a6587e
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::617])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f962236-e83d-4792-b338-c86641a6587e;
 Tue, 08 Sep 2020 13:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kcerATzAjpIbNHSWsLQI/C+H0zm4C83hl0owqH8bxo=;
 b=EjV56CtWEUPoW2ZFyRVfBGxnGkdEk0G4rKYoEBnbULJrqLlf1dSLGOA/zjdPhC/Sv+ztOrWWg+MbloExa2m6yNA3ruX4qHEWIUD/ygglfUKXJX7gNbM14Gi5Q2rA3fFTq+EktL6zdJk6+6EyViQFS2KFbRsy2lkz+IWcvoyMBrg=
Received: from DB6PR0202CA0018.eurprd02.prod.outlook.com (2603:10a6:4:29::28)
 by VI1PR08MB3789.eurprd08.prod.outlook.com (2603:10a6:803:bd::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 13:05:31 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::68) by DB6PR0202CA0018.outlook.office365.com
 (2603:10a6:4:29::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Tue, 8 Sep 2020 13:05:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 13:05:30 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Tue, 08 Sep 2020 13:05:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ab8ae85fccb6957
X-CR-MTA-TID: 64aa7808
Received: from fcdd71827c5e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 095CD82A-81FF-47C3-8974-B366F342D6D4.1; 
 Tue, 08 Sep 2020 13:05:22 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcdd71827c5e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Sep 2020 13:05:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArIMGV6iEy9VUPr4CxjlAd1lprIkCM0XJL8NB62SGg61ugOS4QfT53nppYnSZ3rc0wz7YuJDgcm5l7a/9rZ6ggY7fVyzyDX8U0r7PSLltzfSBGo6Gp5YGrIiNAORfw4Z8BqsWnnv1uvsMBmd5R57rvtsbGXaumnafwcOEAVVMaJ5bep8JpvUOY6Hb32h5LGONrwRB0wrpVWv7W9zs7xghbRYXRRiZfRFh9AfFZ5lUNXs+ELSFAom2wWD2UTqdQ4kOAXe0sNykXjXQlZRJ/Lst7m8VEmpdIA7doRWR4xWevPRz14heXUVuVep7JZOk2H+Tt/QVZRmgnUHKmF+GlGQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kcerATzAjpIbNHSWsLQI/C+H0zm4C83hl0owqH8bxo=;
 b=YrI8SPJiTEEmhq7pxOFOeGpiaWTsOEdfY+p+cggslBlxdFyLTB4M5pA9xcoK/nwK86XNjwqH3B+5t6VXF4zTe8pRQOaXVXrZ3Ro5+Ou8ajzuimnJwKBLeLo8FooceJtB6+DbUeSWoYNGFZ1R/gg66mfCa+uraYi9En6gtQ+CWjNo4gBSNYwD9AjdreiJBgbUiC1K8rnRzqocmdS66CXAlC2k7pUC91TgzZeMXts3Dvzn3cRJmlPsaJqB31i+jv9iJFKmuwY4+Po8ld28Yc+9j7KxghHv6X+XzsvoZINEeDzhFT+majqnFQ4OtL+AJ+Kp1fMfpqaPr2+mKO9AU7zp6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kcerATzAjpIbNHSWsLQI/C+H0zm4C83hl0owqH8bxo=;
 b=EjV56CtWEUPoW2ZFyRVfBGxnGkdEk0G4rKYoEBnbULJrqLlf1dSLGOA/zjdPhC/Sv+ztOrWWg+MbloExa2m6yNA3ruX4qHEWIUD/ygglfUKXJX7gNbM14Gi5Q2rA3fFTq+EktL6zdJk6+6EyViQFS2KFbRsy2lkz+IWcvoyMBrg=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4364.eurprd08.prod.outlook.com (2603:10a6:10:c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 13:05:18 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 13:05:18 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] Arm64: fix build with gcc 10
Thread-Topic: [PATCH] Arm64: fix build with gcc 10
Thread-Index: AQHWhd9Vq9iCRBnsnkuk6dw8UeDDDqletaaA
Date: Tue, 8 Sep 2020 13:05:18 +0000
Message-ID: <F0DDBF49-93F2-4203-A62E-045DD2F4EA9E@arm.com>
References: <4c3c3f21-29bf-268c-039e-5adecff05f3a@suse.com>
In-Reply-To: <4c3c3f21-29bf-268c-039e-5adecff05f3a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a23ad19a-cee0-4b93-680b-08d853f7dd06
x-ms-traffictypediagnostic: DBBPR08MB4364:|VI1PR08MB3789:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3789C58CDEC603605538F0F09D290@VI1PR08MB3789.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:549;OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JH6DBqJyos7LvWF3ZXUSSMWfNAa7prRhF45L3P47dCsPBVJzr5ONV0BlfminHlIkm/LGqNFXt05p7sdS0ikRYAylfRyMYEodxuM949QWgj3VPxWIX1+kQSui5sG3lh4WPPJlU1YdHXrgLYQm7CQQv9tGLhhZxU1hAh1SVrxgCBvgEt40UflIO1YSknbSnj029fCkTBuYRPam+gxUt5SGtnyMcnUM3P8CqFdElXWw0rb17owY9U8HM3S483l0UMBf5lu7FmpaBe2qbopj31UKbHRW8KvylPApfXzyZ96Mt6sonZYIdNkFxoMKAb5x1OWj7ERQXB9z/70AbLpwk/2pPQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(91956017)(76116006)(54906003)(6916009)(6486002)(2616005)(6512007)(2906002)(36756003)(66476007)(64756008)(66446008)(66946007)(5660300002)(86362001)(66556008)(186003)(26005)(478600001)(4326008)(8936002)(33656002)(8676002)(53546011)(71200400001)(6506007)(83380400001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: q/b6JsenZ+oy92r8zePsHNsZJAk/KGOuUpxmGzFWkqZiz4EaNUNf61UxcU9/MAj0RHsse24Or2I0/ySTzwQHpQ7xC8fPB5yntDcJfbw9bOVumVbJ7h19vHb2hhqVb/VikRaSwKwqAu+plj1Ii9Bnej/XDFUP+vyhdoxR2U037/ICQxB0JC6xRV81k6h7jlyFCBvLZJ/51w9VBReOQKfKQXBye15vtcg+GCXCryVqemMsvEGo1izA0Sp5rtW9yi02/9YngNm8y+cU/9KixeZ7mYQq8/f+odn2Uy96b8Id7qlLJbFNsIAS2rtoKwv062suwTPzFaTTiEJwShQe+S6zx60/IgLiklosMKae6wzejtiPcMdPykeeQGcDsfHD4Phd+oPkoshdKv+eeG5/NhCXbv8AItYaLz1+uUszQOTVqqhA8EUwRWE/Q+mKyf/2qFS62uITLhGiytR0ICIl0EzJ8WszCioKmGongBVa68ANG79Lhzg3n68eMUEx9ET0/lFfmVXmtq73Tpr4OoOhbprU7rrhVhdeO+8ra7Fq1oXEkpXDDtoF++FsLIrn4e34rSa4fKDhg2Cn+xrLHjxQLNugV8UtrEIkanVddPQW6a/Kn+57JSZlDFxiRQF65cFtUJaq8XdZ8XudtFy4oMlW2ulrig==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <684B2188E7B0404185982C6B10B4C63B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4364
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 064899b2-3fbb-4d97-2a96-08d853f7d608
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pgy9Z5Oy7/b1T8kBkjun/VSD5Un0K+lgttCKFWxEv4ZYGuWGO23QL3n9a2+uPqZVJEKiJvEjbbelLsfrvDZAElaN5kna6Db0CmDPRvOQl8HuPpm31x0bePGpM3nMoG+NhXX7G5mJYpRHh2aG1VYhaZ8w2c4A+K8wS9vFNaaXGqxGq5TwLpa+1cMTLQOeZ1GWB5LQRvFE//4SCOvt9n/M9+Bw1e+ZVD+QEQk+tb1fqBt8UKYLQNJ70yh8Kk1skq4DMdsJpfAszNc37efasGrucToBoGj8LwxyNwWI5AgzOskdBDPTyAgDHQDuue/ETqEcNVgeG5eEKld/nwtYmyn1d8XK8FgirN5HAgZ8xHH1K0qFx1Q2p7z1SfkLDsXoyZEh0a81Oj0IN2oxMdDdXRg6bg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966005)(6862004)(70206006)(26005)(316002)(82740400003)(47076004)(86362001)(4326008)(2616005)(53546011)(6506007)(82310400003)(81166007)(83380400001)(6512007)(356005)(5660300002)(36756003)(70586007)(2906002)(8676002)(33656002)(186003)(107886003)(8936002)(336012)(54906003)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 13:05:30.2877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a23ad19a-cee0-4b93-680b-08d853f7dd06
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3789
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

DQoNCj4gT24gOCBTZXAgMjAyMCwgYXQgMTM6NTMsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBXaXRoIGdjYzEwIGlubGluaW5nIGlzIChubyBsb25nZXI/KSB0
aGUgZGVmYXVsdCBmb3IgY2VydGFpbiBhdG9taWNzLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBKdWxp
ZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcmNoLm1rDQo+ICsr
KyBiL3hlbi9hcmNoL2FybS9hcmNoLm1rDQo+IEBAIC0xMiw2ICsxMiw3IEBAIENGTEFHUy0kKENP
TkZJR19BUk1fMzIpICs9IC1tY3B1PWNvcnRleC0NCj4gDQo+IENGTEFHUy0kKENPTkZJR19BUk1f
NjQpICs9IC1tY3B1PWdlbmVyaWMNCj4gQ0ZMQUdTLSQoQ09ORklHX0FSTV82NCkgKz0gLW1nZW5l
cmFsLXJlZ3Mtb25seSAjIE5vIGZwIHJlZ2lzdGVycyBldGMNCj4gKyQoY2FsbCBjYy1vcHRpb24t
YWRkLENGTEFHUy0kKENPTkZJR19BUk1fNjQpLENDLC1tbm8tb3V0bGluZS1hdG9taWNzKQ0KDQpX
aHkgbm90IGFkZGluZyB0aGlzIGJlZm9yZSB3aXRoIHRoZSBvdGhlciDigJxjYWxsIGNjLW9wdGlv
buKAnSA/DQoNCkFsc28gaXQgbWlnaHQgYmUgYSBnb29kIGlkZWEgdG8gaGF2ZSBhIHNlbnRlbmNl
IGluIHRoZSBjb21taXQgbWVzc2FnZSB3aXRoIHRoZQ0KZXJyb3IgaGFwcGVuaW5nIHdoZW4gdGhp
cyBpcyBub3QgYWRkZWQ6DQp1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2FhcmNoNjRfbGRhZGQ0
X2FjcV9yZWzigJkNCg0KQmVjYXVzZSBzb21lIG1pZ2h0IG5lZWQgdG8gYmFja3BvcnQgdGhpcyB0
byBvdGhlciBYZW4gcmVsZWFzZXMgaWYgdGhleSBzd2l0Y2ggdG8NCmEgbmV3IGNvbXBpbGVyIChh
bHRob3VnaCBpIGNvdWxkIG5vdCByZXByb2R1Y2UgdGhhdCB3aXRoIFhlbiA0LjE0KS4NCg0KSSB0
ZXN0ZWQgdGhlIHBhdGNoIHdpdGggWW9jdG8gbWFzdGVyIHdoaWNoIGlzIHVzaW5nIGdjYyAxMC4y
IGFuZCB0aGlzIHdvcmtzLg0KDQpCZXJ0cmFuZA0KDQo+IA0KPiBpZm5lcSAoJChmaWx0ZXIgY29t
bWFuZCBsaW5lIGVudmlyb25tZW50LCQob3JpZ2luIENPTkZJR19FQVJMWV9QUklOVEspKSwpDQo+
ICAgICAkKGVycm9yIFlvdSBtdXN0IHVzZSAnbWFrZSBtZW51Y29uZmlnJyB0byBlbmFibGUvZGlz
YWJsZSBlYXJseSBwcmludGsgbm93KQ0KPiANCg0K

