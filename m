Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 197FC22066D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 09:45:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvc5m-0000A8-D4; Wed, 15 Jul 2020 07:44:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7qVd=A2=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jvc5l-0000A3-MH
 for xen-devel@lists.xen.org; Wed, 15 Jul 2020 07:44:37 +0000
X-Inumbo-ID: 0772a7da-c66f-11ea-bb8b-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0772a7da-c66f-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 07:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PSrM61KNhHMHE9fzrGtKYCBSl+bRweW/9ifG6uK8Us=;
 b=ojGhL5v7Hj6YXLh1vQ3qp8YcW0CPU87dbSi+eDjgvHTekrhAo58R5S/nslxVNiaL5gCpmB6v+bPWeJYgwy/iAvmmkMSZ483A4NHl6ToCBxBeHuMoybjyp3fVA0Kc5jtuLt6vvegFK6lNhKqPpQKHxsIWl2jlijyRkFXPRGm6vBE=
Received: from AM6P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::14)
 by AM6PR08MB4550.eurprd08.prod.outlook.com (2603:10a6:20b:71::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Wed, 15 Jul
 2020 07:44:34 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::a3) by AM6P192CA0001.outlook.office365.com
 (2603:10a6:209:83::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Wed, 15 Jul 2020 07:44:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Wed, 15 Jul 2020 07:44:33 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62");
 Wed, 15 Jul 2020 07:44:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 81a4a8d1426ff4af
X-CR-MTA-TID: 64aa7808
Received: from f6a6afc1680d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F087AF4C-0902-4820-A421-8F82856249BC.1; 
 Wed, 15 Jul 2020 07:44:28 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6a6afc1680d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Jul 2020 07:44:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3YmYUfilCmQIZI9ewRECVq+Ea+A250Ckocf2OOqbHKohEFe9hWvfVhgH8IFoOyOZrYK5oogNll81IexHz9pyqy2YJj99zzBr/4FupjGjJr5Rxame1pl26MoGVxGYwWNZfW55B78HMOM6Ia18U6HNyRjgaNvtpyHcvw5QpWunhTBlmzF80tkkABf24lcTYWcQlopPxFFUtEuBCBmlxO6c1SA0DiJv1ToYBSFLb+T2Vi/BAgu8xBWsSKX8uk2BkRD1vKg7iABYVjsiXml3DhNoDUxI6JpFfuC4QU8Y1Xz0ZdtG9zugabpuj4FfjGfyguTCIr7uEPTVtX+kSFLId6HDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PSrM61KNhHMHE9fzrGtKYCBSl+bRweW/9ifG6uK8Us=;
 b=NlQOb7Tegx/5vFbk8sCda7m7wd6jyavCPsz60wnqWv9vlhPpEBuRAUuPZ0/dm7yNKvzn3Xak+nG7Rk2yNsr6TP9/U2Yv+wzQRNXBBNegIk7DFe999h32dyp0Z9geNO23ZhtIufCbpV9j+q2CesmkchTDLx0FfLnPS1tVGqrrzJhTBJMVEDdD+zr6J4AQO5o2fIKzPl7OUfDhFjj6lN84AxbDjLwRut9cod8DF9jyvFYYw+NvF3hh5D0cl3f3VHpsJAUEl1Gx/RCDrk5GqkFKmAKMP82R+Oyu+YRIuHB3XmYgFAAyCOaDySKfgX8WcDYSW1ifai/CLLjhMQ91fslJFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PSrM61KNhHMHE9fzrGtKYCBSl+bRweW/9ifG6uK8Us=;
 b=ojGhL5v7Hj6YXLh1vQ3qp8YcW0CPU87dbSi+eDjgvHTekrhAo58R5S/nslxVNiaL5gCpmB6v+bPWeJYgwy/iAvmmkMSZ483A4NHl6ToCBxBeHuMoybjyp3fVA0Kc5jtuLt6vvegFK6lNhKqPpQKHxsIWl2jlijyRkFXPRGm6vBE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1909.eurprd08.prod.outlook.com (2603:10a6:4:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Wed, 15 Jul
 2020 07:44:26 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.025; Wed, 15 Jul 2020
 07:44:26 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>
Subject: Re: [BUG] Xen build for RCAR failing
Thread-Topic: [BUG] Xen build for RCAR failing
Thread-Index: AdZUKc5JeR7gPpESR52uLkZK1kYwOwAEsnEAAAD8OlAAAEBtgAABZtcgAANXdAAAh1iJgADaJ12wAA6tYIAAF6P1gAAB/qoA
Date: Wed, 15 Jul 2020 07:44:26 +0000
Message-ID: <0AC5E91F-7C7A-4B5A-AE55-E48574AB04C5@arm.com>
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
 <1D0E7281-95D7-482E-BF6D-EE5B1FEE4876@arm.com>
 <ab84437081a346d6bf0f73581382c74e@in.bosch.com>
 <D84A5DA7-683C-480B-8837-C51D560FC2E1@arm.com>
 <139024a891324455a13a3d468908798d@in.bosch.com>
 <C3BCAA62-51EF-49DD-B978-6657BC6D5A21@arm.com>
 <67b4454424c4485fb59d542d052aaf2d@in.bosch.com>
 <CAPD2p-nZZpDBZ5yc=gVvVAW1oFdN0KZ2jMH-T59W_sntsENwxw@mail.gmail.com>
 <3f155a0b598745a3b2d158599dd992fd@in.bosch.com>
In-Reply-To: <3f155a0b598745a3b2d158599dd992fd@in.bosch.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: in.bosch.com; dkim=none (message not signed)
 header.d=none; in.bosch.com;
 dmarc=none action=none header.from=arm.com; 
x-originating-ip: [2a01:e0a:13:6f10:c444:ae10:7760:1678]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bf10cf39-1ce1-4f9a-125f-08d82892ea96
x-ms-traffictypediagnostic: DB6PR0801MB1909:|AM6PR08MB4550:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4550C5CD87331A36C5FA37629D7E0@AM6PR08MB4550.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: NR+WL9Z6Rc1ulMIjxq6K/hAYzauKXkxE5precGh9iMz7BKuYoERWrJh/u0QP0ccTbq0rQ7XcOUd/zCxRWMSEEvu7LQ5+R2CI6BO+wIAVYOu3P1BWhtNTl79b7RsCtQGpCDvCOneDGvtZ5SoKhis5TuDF/k5LEZHjlxu86bN5VLHmGyfVwK3djsa9LP1Ye14WkGsKwk7j4xXlr3yyXo0V1feGG/E/I/SzCPInhro0vrkw5zVhD4LKHg4YQ25431z+Hda1I7/2LZg1yk3yaA5khqVVJpWnkY+4vClvbTH+kBWg5lZYqU6ffAOJyse62PIE+fvYlFSRhAEdea1X6xRIZiaaKieqeAXlyGkRPN0u4xUiiXh2QM8hehKycVHQrjFrzYfvcToC0/PjkPq0csxmUA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(376002)(346002)(136003)(396003)(39850400004)(15974865002)(2906002)(54906003)(8936002)(86362001)(4326008)(66574015)(6512007)(966005)(36756003)(33656002)(2616005)(5660300002)(478600001)(316002)(186003)(6916009)(71200400001)(76116006)(6486002)(91956017)(53546011)(66446008)(66946007)(66556008)(64756008)(66476007)(6506007)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: szg6Cmy7tokavKHdrPBTfShfp3qMMyRsGzVde6Sw9rYZdNJTKinvHtmeQDQhgeef23DqivlZqo2cJs14vG6eYyD4X8XzffQqvDcLzZmz6sDYxqIk2boWwE7aM+o7tD2NZhSE7oDeW+jdUIzy0paEnaGkD2ERRJTBPJfOKWs4rTxBu5miTGI+899muyXWyAM+6ipu/V6vHIB5KDNl5GcvaZGTsaH08tmPvZ0dKwolE3TxdX1GEBV7C/NrAFe6hyGWi29D4Np+cBWm51D0q+bf8vU0TcUgXoN7xVJYq0tJ+r2a6kG8mXL/h1kMMn4yep61/uwPRBafft8RKU9KNfVA5sXOCll2tA21U9erzPXFd3x6a0MgnYMptI34fFj03gHWL4NStHBWFaKfPEJ7ZB3eCCxXwdNPY6BffdPW/dB38RBoS4QHdtSgr92LSyl0mRuTsgW83DD/L6LHcF2xH9Q6IkiNGGMFnpMFKq6ZlqcW2OGE6hLIannkMlagxYnGV5xhC7X2qGVu85vJArPSeDeVuwE/dUveJ7rszStrz31Ypzc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A846D54247F29443B6DD41CD3509882C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1909
Original-Authentication-Results: in.bosch.com; dkim=none (message not signed)
 header.d=none; in.bosch.com;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(33656002)(15974865002)(2906002)(6862004)(36906005)(6512007)(478600001)(4326008)(316002)(66574015)(82310400002)(54906003)(70206006)(966005)(70586007)(356005)(8676002)(86362001)(82740400003)(6486002)(186003)(26005)(36756003)(8936002)(336012)(53546011)(5660300002)(47076004)(6506007)(81166007)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 67669966-0489-4b04-ebf5-08d82892e63e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wtH5dH0vy2ZPTwGWDITJjjDbi0/Y+VijS1l5e9a7uO4EGzCkYivHjw0eWASGUixgYQzNgwumVVUvnoqPseUrlKGk/qrWebxPNKTCnEAHVo9tsIJWGb+aK1TB/KayatwjQ6LmODRPYMLduNRYS0ehB28TZajVU2Uv1dkfs7f5dtHpqtO+Mkyki9o4TyUDtPXvVPsAMiQRVlvMdbkCOPMw4VwkhA9bHdKFds8dCooss19m1an71qsTHIeHmtGh+fJkctWfjzPw2odjYa7qvS8kuvSwbXv5hbVJBJp/tjsix9J8gvQA5sy7869cuYpr2LV5x7rcnDdjX3lSmXth7kIbZTF2kt8e/ZIymsxj7Y8YZik5PPj4qzM5gP2AiH1KjsyaswRVyLDml4K1CIHlvMnczliK9HGaHLKVkh6mpPXJpPMBew1bOU5RazXBgU5DF/qNuxfXCbAzKMNRuYAZBvPULI9C9Kx/k+3vf1HAmRHOjRk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 07:44:33.8165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf10cf39-1ce1-4f9a-125f-08d82892ea96
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4550
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
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>, nd <nd@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTWFuaWthbmRhbiwNCg0KPiBPbiAxNSBKdWwgMjAyMCwgYXQgMDg6NDcsIE1hbmlrYW5kYW4g
Q2hvY2thbGluZ2FtIChSQkVJL0VDRjMpIDxNYW5pa2FuZGFuLkNob2NrYWxpbmdhbUBpbi5ib3Nj
aC5jb20+IHdyb3RlOg0KPiANCj4gSGVsbG8gT2xla3NhbmRyIFR5c2hjaGVua28sDQo+IFRoYW5r
cyBmb3IgeW91ciBxdWljayByZXNwb25zZS4gV2l0aCBYZW4gc3RhYmxlIDQuMTMgYnJhbmNoLCB0
aGUgbWVudGlvbmVkIGlzc3VlIGlzIHNvbHZlZC4NCj4gIA0KPiBJcyB0aGVyZSBhbnkgZG9jdW1l
bnQgd2hpY2ggSSBjb3VsZCByZWZlciB0byBicmluZyB1cCBYZW5bRE9NMF0gYW5kIGhhdmUgYW4g
aGFuZHMgb24gPyBiZWNhdXNlIGFtIGN1cnJlbnRseSBzZWVpbmcgbm8gb3V0cHV0IGFmdGVyIHRo
aXMNCj4gIA0KPiAoWEVOKSAqKiogU2VyaWFsIGlucHV0IHRvIERPTTAgKHR5cGUgJ0NUUkwtYScg
dGhyZWUgdGltZXMgdG8gc3dpdGNoIGlucHV0KQ0KPiAoWEVOKSBGcmVlZCAzMjRrQiBpbml0IG1l
bW9yeS4NCj4gKFhFTikgKioqIFNlcmlhbCBpbnB1dCB0byBYZW4gKHR5cGUgJ0NUUkwtYScgdGhy
ZWUgdGltZXMgdG8gc3dpdGNoIGlucHV0KQ0KPiAgDQo+IEF0dGFjaGluZyB0aGUgY29tcGxldGUg
bG9ncyBmb3IgcmVmZXJlbmNlLg0KDQpZb3VyIERPTTAgaXMgcHJvYmFibHkgdHJ5aW5nIHRvIHVz
ZSB0aGUgd3JvbmcgY29uc29sZS4NCllvdSBzaG91bGQgYWRkIOKAnGNvbnNvbGU9aHZjMOKAnSB0
byB5b3VyIERvbTAgbGludXggY29tbWFuZCBsaW5lIChhbmQgcmVtb3ZlIGFueSBvdGhlciBjb25z
b2xlPSBhcmd1bWVudCkNCg0KUmVnYXJkcw0KQmVydHJhbmQNCg0KPiAgDQo+IE1pdCBmcmV1bmRs
aWNoZW4gR3LDvMOfZW4gLyBCZXN0IHJlZ2FyZHMNCj4gDQo+IENob2NrYWxpbmdhbSBNYW5pa2Fu
ZGFuIA0KPiANCj4gRVMtQ00gQ29yZSBmbixBRElUIChSQkVJL0VDRjMpDQo+IFJvYmVydCBCb3Nj
aCBHbWJIIHwgUG9zdGZhY2ggMTAgNjAgNTAgfCA3MDA0OSBTdHV0dGdhcnQgfCBHRVJNQU5ZIHwg
d3d3LmJvc2NoLmNvbQ0KPiBUZWwuICs5MSA4MCA2MTM2LTQ0NTIgfCBGYXggKzkxIDgwIDY2MTct
MDcxMSB8IE1hbmlrYW5kYW4uQ2hvY2thbGluZ2FtQGluLmJvc2NoLmNvbQ0KPiANCj4gUmVnaXN0
ZXJlZCBPZmZpY2U6IFN0dXR0Z2FydCwgUmVnaXN0cmF0aW9uIENvdXJ0OiBBbXRzZ2VyaWNodCBT
dHV0dGdhcnQsIEhSQiAxNDAwMDsNCj4gQ2hhaXJtYW4gb2YgdGhlIFN1cGVydmlzb3J5IEJvYXJk
OiBGcmFueiBGZWhyZW5iYWNoOyBNYW5hZ2luZyBEaXJlY3RvcnM6IERyLiBWb2xrbWFyIERlbm5l
ciwgDQo+IFByb2YuIERyLiBTdGVmYW4gQXNlbmtlcnNjaGJhdW1lciwgRHIuIE1pY2hhZWwgQm9s
bGUsIERyLiBDaHJpc3RpYW4gRmlzY2hlciwgRHIuIFN0ZWZhbiBIYXJ0dW5nLA0KPiBEci4gTWFy
a3VzIEhleW4sIEhhcmFsZCBLcsO2Z2VyLCBDaHJpc3RvcGggS8O8YmVsLCBSb2xmIE5ham9yaywg
VXdlIFJhc2Noa2UsIFBldGVyIFR5cm9sbGVyIA0KPiDigIsNCj4gRnJvbTogT2xla3NhbmRyIFR5
c2hjaGVua28gPG9sZWtzdHlzaEBnbWFpbC5jb20+IA0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkg
MTUsIDIwMjAgMTowMCBBTQ0KPiBUbzogTWFuaWthbmRhbiBDaG9ja2FsaW5nYW0gKFJCRUkvRUNG
MykgPE1hbmlrYW5kYW4uQ2hvY2thbGluZ2FtQGluLmJvc2NoLmNvbT4NCj4gQ2M6IEJlcnRyYW5k
IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPjsgeGVu
LWRldmVsQGxpc3RzLnhlbi5vcmcNCj4gU3ViamVjdDogUmU6IFtCVUddIFhlbiBidWlsZCBmb3Ig
UkNBUiBmYWlsaW5nDQo+ICANCj4gSGVsbG8NCj4gIA0KPiBbU29ycnkgZm9yIHRoZSBwb3NzaWJs
ZSBmb3JtYXQgaXNzdWVzXQ0KPiAgDQo+IE9uIFR1ZSwgSnVsIDE0LCAyMDIwIGF0IDQ6NDQgUE0g
TWFuaWthbmRhbiBDaG9ja2FsaW5nYW0gKFJCRUkvRUNGMykgPE1hbmlrYW5kYW4uQ2hvY2thbGlu
Z2FtQGluLmJvc2NoLmNvbT4gd3JvdGU6DQo+IEhlbGxvIEJlcnRyYW5kLA0KPiANCj4gSSBzdWNj
ZWVkZWQgaW4gYnVpbGRpbmcgdGhlIGNvcmUgbWluaW1hbCBpbWFnZSB3aXRoIGR1bmZlbGwgYW5k
IGl0cyBjb21wYXRpYmxlIGJyYW5jaGVzIFtleGNlcHQgeGVuLXRyb29wcyAobW9kaWZpZWQgc29t
ZSBmaWxlcyB0byBjb21wbGV0ZSB0aGUgYnVpbGQpXS4NCj4gDQo+IEJ1dCBJIGZhY2UgdGhlIGZv
bGxvd2luZyBlcnJvciB3aGlsZSBib290aW5nLg0KPiANCj4gKFhFTikgKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKg0KPiAoWEVOKSBQYW5pYyBvbiBDUFUgMDoNCj4gKFhF
TikgVGltZXI6IFVuYWJsZSB0byByZXRyaWV2ZSBJUlEgMCBmcm9tIHRoZSBkZXZpY2UgdHJlZQ0K
PiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+ICANCj4g
IA0KPiBUaGUgcmVhc29uIGZvciB0aGF0IHByb2JsZW0gKm1pZ2h0KiBiZSBpbiB0aGUgYXJjaCB0
aW1lciBub2RlIGluIHlvdXIgZGV2aWNlIHRyZWUgd2hpY2ggY29udGFpbnMgImludGVycnVwdHMt
ZXh0ZW5kZWQiIHByb3BlcnR5IGluc3RlYWQgb2YganVzdCAiaW50ZXJydXB0cyIuIEFzIGZhciBh
cyBJIHJlbWVtYmVyIFhlbiB2NC4xMiBkb2Vzbid0IGhhdmUgcmVxdWlyZWQgc3VwcG9ydCB0byBo
YW5kbGUgImludGVycnVwdHMtZXh0ZW5kZWQiLg0KPiBJdCB3ZW50IGluIGEgYml0IGxhdGVyIFsx
XS4gSWYgdGhpcyBpcyB0aGUgcmVhbCByZWFzb24sIEkgdGhpbmsgeW91IHNob3VsZCBlaXRoZXIg
c3dpdGNoIHRvIHRoZSBuZXcgWGVuIHZlcnNpb24gb3IgbW9kaWZ5IHlvdXIgYXJjaCB0aW1lciBu
b2RlIGluIGEgd2F5IHRvIHVzZSB0aGUgImludGVycnVwdHMiIHByb3BlcnR5IFsyXS4gSSB3b3Vs
ZCBzdWdnZXN0IHVzaW5nIHRoZSBuZXcgWGVuIHZlcnNpb24gaWYgcG9zc2libGUgKGF0IGxlYXN0
IHY0LjEzKS4NCj4gIA0KPiBbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZl
cy9odG1sL3hlbi1kZXZlbC8yMDE5LTA1L21zZzAxNzc1Lmh0bWwNCj4gWzJdIGh0dHBzOi8vZ2l0
aHViLmNvbS9vdHlzaGNoZW5rbzEvbGludXgvY29tbWl0L2MyNTA0NDg0NWYyYzM2NzhmNWRmNzg5
ODgxZTdhMTI1NTU2YWY2ZmMNCj4gIA0KPiAtLSANCj4gUmVnYXJkcywNCj4gIA0KPiBPbGVrc2Fu
ZHIgVHlzaGNoZW5rbw0KPiA8YnVpbHQtdS1ib290LXhlbi1ib290dXAtZXJyb3JfNC4xMy50eHQ+
DQoNCg==

