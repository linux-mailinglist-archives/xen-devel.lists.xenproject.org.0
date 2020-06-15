Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCBD1F99A6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:09:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpnv-0006uq-T3; Mon, 15 Jun 2020 14:09:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Im8M=74=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jkpnt-0006ui-Nm
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:09:37 +0000
X-Inumbo-ID: d81ae8b8-af11-11ea-b801-12813bfff9fa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d81ae8b8-af11-11ea-b801-12813bfff9fa;
 Mon, 15 Jun 2020 14:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quv6W6xWEea6OAdOmQANiiOhCg9pSEvOjFb0PBq3SYY=;
 b=DbrdWq2XbCEth9JxifTHtV8UfOiZxB/X7IyN+SmIHW5+ykaI57N9x4W0CPQMq/FMSucvQ8Wk4lavRg1AVRr7oKhRRDJJVvje3RRt93vvBq8dT4zUGIaeY7vkKLZuoATX9wcPoiTV0vNx73QUbrA+FaPWoddG81FTaRMbCbYQ3pM=
Received: from AM6PR08CA0047.eurprd08.prod.outlook.com (2603:10a6:20b:c0::35)
 by VI1PR08MB3566.eurprd08.prod.outlook.com (2603:10a6:803:81::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Mon, 15 Jun
 2020 14:09:34 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::4c) by AM6PR08CA0047.outlook.office365.com
 (2603:10a6:20b:c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Mon, 15 Jun 2020 14:09:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Mon, 15 Jun 2020 14:09:33 +0000
Received: ("Tessian outbound 3e82c366635e:v59");
 Mon, 15 Jun 2020 14:09:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7cfaea07e978a1af
X-CR-MTA-TID: 64aa7808
Received: from c49ba98c9300.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 769075FC-3119-4A26-B106-82907FBE62F9.1; 
 Mon, 15 Jun 2020 14:09:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c49ba98c9300.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Jun 2020 14:09:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7nKtNZ4XfDMkutfuVwiIRx69K8rg2vBHWzfn/KVPFJJAWONLjldAP0Uy1yJsvNqUWwE6nDWzk8GCCOlubALXLZWIDqILeR7IZiAAQ3OWbmwRGVpRz90Hqfd0R0/vtxi3/np29QAwVyfghSGnX45ufYDhZPQ/zE7po29N2uMrNcAw2M4FK5pszhFlRKOVKbI8Hc/hCPy2vtBH4SCaH8CSZbJsqs244xYpkTtT56et2HpNrEntNyqer2p+eKQynA6qGgZnLFzyNOEMkdYlWeM3ULHfvE3M0fhs0a1Whwwswu17wmR/5hS4lRug+bIq/VshSmkmK+pOeanjc6KrDAT4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quv6W6xWEea6OAdOmQANiiOhCg9pSEvOjFb0PBq3SYY=;
 b=m8Hvzq4b7hgTYxDCL0OqwBD88CIwDcbNAwgiA8iK0Mn8vFrRYf7NZMuZXn+2CotI2NagAat9TqWX66/BSzv6Ukv0Ag6O+hkaW5HB64He62C12zjPqVABay6in0r5tvS78bEuwWmBlUv2iutKwY1i90eexz4bEKvdrq+ygFyUzZg6BLxgJZ7L91ocprUthNXfquhE+e1+XNPh4Zj5Qn5PcBQb4ULhufIDV8J8iH9+5/Vq3t8krVDOQg0Lr8F30gjwTFl+ZQ4lWI/ZUUUEWwTEcDX3gKijR+dYvEf6CpUNm7BgsrTNaTWwxNYnGpBPIt7Exleef9pUYpMLHuoBQX/dtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quv6W6xWEea6OAdOmQANiiOhCg9pSEvOjFb0PBq3SYY=;
 b=DbrdWq2XbCEth9JxifTHtV8UfOiZxB/X7IyN+SmIHW5+ykaI57N9x4W0CPQMq/FMSucvQ8Wk4lavRg1AVRr7oKhRRDJJVvje3RRt93vvBq8dT4zUGIaeY7vkKLZuoATX9wcPoiTV0vNx73QUbrA+FaPWoddG81FTaRMbCbYQ3pM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3388.eurprd08.prod.outlook.com (2603:10a6:10:41::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.26; Mon, 15 Jun
 2020 14:09:25 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.028; Mon, 15 Jun 2020
 14:09:25 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWP+e0l1aGgjLKI0+XFOOVnv/iZKjTuR6AgAACMICAAActAIAADWwAgABcfQCAAHaFAIABD0cAgAQLJQA=
Date: Mon, 15 Jun 2020 14:09:25 +0000
Message-ID: <0D644096-05E3-44F3-A1FD-75006C718F23@arm.com>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3u7ztgSmJbhjVATrfJEBBVkHbZei6ydBQeV8nzdDFA3Q@mail.gmail.com>
 <alpine.DEB.2.21.2006111143530.2815@sstabellini-ThinkPad-T480s>
 <74475748-e884-1e6e-633d-bf67d5ed32fe@xen.org>
 <alpine.DEB.2.21.2006111250180.2815@sstabellini-ThinkPad-T480s>
 <48F66B8F-3AEF-4E54-A572-C246F5A7C117@arm.com>
 <alpine.DEB.2.21.2006120944460.2815@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006120944460.2815@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d92da315-3ca5-45ec-5aa0-08d81135bae2
x-ms-traffictypediagnostic: DB7PR08MB3388:|VI1PR08MB3566:
X-Microsoft-Antispam-PRVS: <VI1PR08MB35663211D3EDE8711AA838D39D9C0@VI1PR08MB3566.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04359FAD81
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: OI+/DdvJqOMY9BGNfRTYbm4lrwYqnv1WxRBKwu9HYdjB1id/rowDPL2ejNo1e6r/hHYXrYvr229ouOSNnuuLVb9N8hbcSU3TZ3qhGnNE68vtAhWpbUBDoNw9o9hUkN10JXIpivaI6GgERTAIv4Nxpainm65lcZZu5/XPGB/WblVFma2w38MHxHQplv6DXrwYsoiHoSA22uQnszednBmGged/PCVKWlNDHSkEOx7h8avvSCUqLTTuj5HfnDBnvosQ7qxEYSyCftyJS/b0w2ENht3SxkzNrZmHqtY4fgjfpaMWUOcLHoEMrrMeoucqCEJtEZr4RkLj85Hd4q0hjZBeQlPPKqadHzN46KYe1s2a/WyOuibIpn0rM8Njgg5dp/i3
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(478600001)(6512007)(5660300002)(2906002)(91956017)(66946007)(4326008)(66556008)(54906003)(7416002)(76116006)(83380400001)(66476007)(316002)(64756008)(66446008)(71200400001)(86362001)(6486002)(53546011)(26005)(8676002)(6506007)(186003)(6916009)(36756003)(33656002)(8936002)(2616005)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: lyO21IKMrgQl5XufDntT3kcYPl23fD2sdi3IjH6ChW7ka/VaFAJzzmrIybKUdgze1IAuo7UjhZsNVBhOr5ZwifgKCiujM8gxxSMrIQE0AnIVTxigEavpKuOxd0430X48uuCIW5jbNyStcUnbvQ9skenZcbUTJiYByHd3oDvN/Ksn1Eb0TJNiol/Rt12wqLC52ZpAZ3t9/p9/C+l1oROhsvdWC2yvvyXkr1BRdWeomndexgZmKU1vn/3QH43oOqMKp4VJLzrOme9k1qs+zKpPeEFE1xSw/mdEvGoF6496zjyHT3L4691eHcolcHX5Natmqaym8DVCz45iKFP8puabx0Py40JBqiKDR85pGFj5xDPxZj8qrhHhwEkDFTX3a1xVPqor+sBuNwe2gdRV4spLfVgzxMjTknesnvcHkhNES7ZjhkP/UZe+LZdSZLNhY37H4juCjzr5Tnrc03aMcRiMirZB25GQ4OrVbiMAUj5U2L8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DFAFB69C777EBF4381DC603F9FF3B510@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3388
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966005)(82740400003)(2906002)(478600001)(5660300002)(81166007)(186003)(356005)(4326008)(54906003)(47076004)(86362001)(36756003)(70206006)(8676002)(70586007)(6512007)(53546011)(6506007)(316002)(36906005)(82310400002)(6862004)(33656002)(83380400001)(2616005)(107886003)(336012)(8936002)(26005)(6486002)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e014153a-8cb9-4b27-d97e-08d81135b5e1
X-Forefront-PRVS: 04359FAD81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z2OiVT4iPNEF9e/p3sk3Pnagm1D5jRqScFo/zqVsTxAY8d5/yZ6c1Rum9QRFGNbwHsZeMcX4PXxPJjiQE5MQszxljRRae1fplP125xfowKa6qi3o+ymp00TqDllRPrZlHzV5ETopYpObpkrwypghu9OsHT3Wi6UojNoopeNJa1VOCbF/tfuAmPgV7n5IT6xeZcL0xtalq5qTq51cElpNuLMFAuVSm8x3mT8C3UklDEB8VTY5ILNzmvP+dGlKFDAp0UStlQ3uCPhy3W8Tn+qhroisu8GJAGfJE6Q/elvth1emQjCgavIvwMfT5mULSXwvUBorv4Dv+zuCxGBgXha49UtaWo1WPPLUfPzOKYBnFnAD3PWWlCyLgXguH/ch4W86KgYKKaTIVozMZ9sKYLYyqeyAeqd/y0dj90l+zi64IbY=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 14:09:33.8550 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d92da315-3ca5-45ec-5aa0-08d81135bae2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3566
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
Cc: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTMgSnVuIDIwMjAsIGF0IDAxOjI0LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gRnJpLCAxMiBKdW4gMjAyMCwgQmVy
dHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiBPbiAxMiBKdW4gMjAyMCwgYXQgMDI6MDksIFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4g
T24gVGh1LCAxMSBKdW4gMjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+PiBIaSBTdGVmYW5v
LA0KPj4+PiANCj4+Pj4gT24gMTEvMDYvMjAyMCAxOTo1MCwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPj4+Pj4gT24gVGh1LCAxMSBKdW4gMjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+
Pj4+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+Pj4+PiAgICAgfQ0KPj4+Pj4+Pj4g
DQo+Pj4+Pj4+PiAtICAgIF9fY29weV90b19ndWVzdChydW5zdGF0ZV9ndWVzdCh2KSwgJnJ1bnN0
YXRlLCAxKTsNCj4+Pj4+Pj4+ICsgICAgdi0+YXJjaC5ydW5zdGF0ZV9ndWVzdC5wYWdlID0gcGFn
ZTsNCj4+Pj4+Pj4+ICsgICAgdi0+YXJjaC5ydW5zdGF0ZV9ndWVzdC5vZmZzZXQgPSBvZmZzZXQ7
DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAgIHNwaW5fdW5sb2NrKCZ2LT5hcmNoLnJ1bnN0YXRl
X2d1ZXN0LmxvY2spOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICByZXR1cm4gMDsNCj4+Pj4+
Pj4+ICt9DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArLyogVXBkYXRlIHBlci1W
Q1BVIGd1ZXN0IHJ1bnN0YXRlIHNoYXJlZCBtZW1vcnkgYXJlYSAoaWYgcmVnaXN0ZXJlZCkuDQo+
Pj4+Pj4+PiAqLw0KPj4+Pj4+Pj4gK3N0YXRpYyB2b2lkIHVwZGF0ZV9ydW5zdGF0ZV9hcmVhKHN0
cnVjdCB2Y3B1ICp2KQ0KPj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4+ICsgICAgc3RydWN0IHZjcHVfcnVu
c3RhdGVfaW5mbyAqZ3Vlc3RfcnVuc3RhdGU7DQo+Pj4+Pj4+PiArICAgIHZvaWQgKnA7DQo+Pj4+
Pj4+PiArDQo+Pj4+Pj4+PiArICAgIHNwaW5fbG9jaygmdi0+YXJjaC5ydW5zdGF0ZV9ndWVzdC5s
b2NrKTsNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gLSAgICBpZiAoIGd1ZXN0X2hhbmRsZSApDQo+Pj4+
Pj4+PiArICAgIGlmICggdi0+YXJjaC5ydW5zdGF0ZV9ndWVzdC5wYWdlICkNCj4+Pj4+Pj4+ICAg
ICB7DQo+Pj4+Pj4+PiAtICAgICAgICBydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lICY9IH5YRU5f
UlVOU1RBVEVfVVBEQVRFOw0KPj4+Pj4+Pj4gKyAgICAgICAgcCA9IF9fbWFwX2RvbWFpbl9wYWdl
KHYtPmFyY2gucnVuc3RhdGVfZ3Vlc3QucGFnZSk7DQo+Pj4+Pj4+PiArICAgICAgICBndWVzdF9y
dW5zdGF0ZSA9IHAgKyB2LT5hcmNoLnJ1bnN0YXRlX2d1ZXN0Lm9mZnNldDsNCj4+Pj4+Pj4+ICsN
Cj4+Pj4+Pj4+ICsgICAgICAgIGlmICggVk1fQVNTSVNUKHYtPmRvbWFpbiwgcnVuc3RhdGVfdXBk
YXRlX2ZsYWcpICkNCj4+Pj4+Pj4+ICsgICAgICAgIHsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICB2
LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lIHw9IFhFTl9SVU5TVEFURV9VUERBVEU7DQo+Pj4+
Pj4+PiArICAgICAgICAgICAgZ3Vlc3RfcnVuc3RhdGUtPnN0YXRlX2VudHJ5X3RpbWUgfD0gWEVO
X1JVTlNUQVRFX1VQREFURTsNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEkgdGhpbmsgdGhhdCB0aGlzIHdy
aXRlIHRvIGd1ZXN0X3J1bnN0YXRlIHNob3VsZCB1c2Ugd3JpdGVfYXRvbWljIG9yDQo+Pj4+Pj4+
IGFub3RoZXIgYXRvbWljIHdyaXRlIG9wZXJhdGlvbi4NCj4+Pj4+PiANCj4+Pj4+PiBJIHRob3Vn
aHQgYWJvdXQgc3VnZ2VzdGluZyB0aGUgc2FtZSwgYnV0ICBndWVzdF9jb3B5XyogaGVscGVycyBt
YXkgbm90DQo+Pj4+Pj4gZG8gYSBzaW5nbGUgbWVtb3J5IHdyaXRlIHRvIHN0YXRlX2VudHJ5X3Rp
bWUuDQo+Pj4+Pj4gV2hhdCBhcmUgeW91IHRyeWluZyB0byBwcmV2ZW50IHdpdGggdGhlIHdyaXRl
X2F0b21pYygpPw0KPj4+Pj4gDQo+Pj4+PiBJIGFtIHRoaW5raW5nIHRoYXQgd2l0aG91dCB1c2lu
ZyBhbiBhdG9taWMgd3JpdGUsIGl0IHdvdWxkIGJlIChhdCBsZWFzdA0KPj4+Pj4gdGhlb3JldGlj
YWxseSkgcG9zc2libGUgZm9yIGEgZ3Vlc3QgdG8gc2VlIGEgcGFydGlhbCB3cml0ZSB0bw0KPj4+
Pj4gc3RhdGVfZW50cnlfdGltZSwgd2hpY2ggaXMgbm90IGdvb2QuIA0KPj4+PiANCj4+Pj4gSXQg
aXMgYWxyZWFkeSB0aGUgY2FzZSB3aXRoIGV4aXN0aW5nIGltcGxlbWVudGF0aW9uIGFzIFhlbiBt
YXkgd3JpdGUgYnl0ZSBieQ0KPj4+PiBieXRlLiBTbyBhcmUgeW91IHN1Z2dlc3RpbmcgdGhlIGV4
aXN0aW5nIGNvZGUgaXMgYWxzbyBidWdneT8NCj4+PiANCj4+PiBXcml0aW5nIGJ5dGUgYnkgYnl0
ZSBpcyBhIGRpZmZlcmVudCBjYXNlLiBUaGF0IGlzIE9LLiBJbiB0aGF0IGNhc2UsIHRoZQ0KPj4+
IGd1ZXN0IGNvdWxkIHNlZSB0aGUgc3RhdGUgYWZ0ZXIgMyBieXRlcyB3cml0dGVuIGFuZCBpdCB3
b3VsZCBiZSBmaW5lIGFuZA0KPj4+IGNvbnNpc3RlbnQuIElmIHRoaXMgaGFkbid0IGJlZW4gdGhl
IGNhc2UsIHRoZW4geWVzLCB0aGUgZXhpc3RpbmcgY29kZQ0KPj4+IHdvdWxkIGFsc28gYmUgYnVn
Z3kuDQo+Pj4gDQo+Pj4gU28gaWYgd2UgZGlkIHRoZSB3cml0ZSB3aXRoIGEgbWVtY3B5LCBpdCB3
b3VsZCBiZSBmaW5lLCBubyBuZWVkIGZvcg0KPj4+IGF0b21pY3M6DQo+Pj4gDQo+Pj4gbWVtY3B5
KCZndWVzdF9ydW5zdGF0ZS0+c3RhdGVfZW50cnlfdGltZSwNCj4+PiAgICAgICAgJnYtPnJ1bnN0
YXRlLnN0YXRlX2VudHJ5X3RpbWUsDQo+Pj4gICAgICAgIFhYWCk7DQo+Pj4gDQo+Pj4gDQo+Pj4g
VGhlIHw9IGNhc2UgaXMgZGlmZmVyZW50OiBHQ0MgY291bGQgaW1wbGVtZW50IGl0IGluIGFueSB3
YXkgaXQgbGlrZXMsDQo+Pj4gaW5jbHVkaW5nIGdvaW5nIHRocm91Z2ggYSB6ZXJvLXdyaXRlIHRv
IGFueSBvZiB0aGUgYnl0ZXMgaW4gdGhlIHdvcmQsIG9yDQo+Pj4gZG9pbmcgYW4gYWRkaXRpb24g
dGhlbiBhIHN1YnRyYWN0aW9uLiBHQ0MgZG9lc24ndCBtYWtlIGFueSBndWFyYW50ZWVzLg0KPj4+
IElmIHdlIHdhbnQgZ3VhcmFudGVlcyB3ZSBuZWVkIHRvIHVzZSBhdG9taWNzLg0KPj4gDQo+PiBX
b3VsZG7igJl0IHRoYXQgcmVxdWlyZSBhbGwgYWNjZXNzZXMgdG8gc3RhdGVfZW50cnlfdGltZSB0
byB1c2UgYWxzbyBhdG9taWMgb3BlcmF0aW9ucyA/DQo+PiBJbiB0aGlzIGNhc2Ugd2UgY291bGQg
bm90IHByb3BhZ2F0ZSB0aGUgY2hhbmdlcyB0byBhIGd1ZXN0IHdpdGhvdXQgY2hhbmdpbmcgdGhl
IGludGVyZmFjZSBpdHNlbGYuDQo+PiANCj4+IEFzIHRoZSBjb3B5IHRpbWUgbmVlZHMgdG8gYmUg
cHJvdGVjdGVkLCB0aGUgd3JpdGUgYmFycmllcnMgYXJlIHRoZXJlIHRvIG1ha2Ugc3VyZSB0aGF0
IGR1cmluZyB0aGUgY29weSB0aGUgYml0IGlzIHNldCBhbmQgdGhhdCB3aGVuIHdlIHVuc2V0IGl0
LCB0aGUgY29weSBpcyBkb25lLg0KPj4gSSBhZGRlZCBmb3IgdGhpcyBwdXJwb3NlIGEgYmFycmll
ciBhZnRlciB0aGUgbWVtY3B5IHRvIG1ha2Ugc3VyZSB0aGF0IHdoZW4vaWYgd2UgdW5zZXQgdGhl
IGJpdCB0aGUgY29weSBoYXMgYWxyZWFkeSBiZWVuIGRvbmUuDQo+IA0KPiBBcyB5b3Ugc2F5LCB3
ZSBoYXZlIGEgZmxhZyB0byBtYXJrIGEgdHJhbnNpdGlvbmcgcGVyaW9kLCB0aGUgZmxhZyBpcw0K
PiBYRU5fUlVOU1RBVEVfVVBEQVRFLiBTbywgSSB0aGluayBpdCBpcyBPSyBpZiB3ZSBkb24ndCB1
c2UgYXRvbWljcyBkdXJpbmcNCj4gdGhlIHRyYW5zaXRpb25pbmcgcGVyaW9kLiBCdXQgd2UgbmVl
ZCB0byBtYWtlIHN1cmUgdG8gdXNlIGF0b21pY3MgZm9yIHRoZQ0KPiB1cGRhdGUgb2YgdGhlIFhF
Tl9SVU5TVEFURV9VUERBVEUgZmxhZyBpdHNlbGYuDQo+IA0KPiBEb2VzIGl0IG1ha2Ugc2Vuc2U/
IE9yIG1heWJlIEkgbWlzdW5kZXJzdG9vZCBzb21lIG9mIHRoZSB0aGluZ3MgeW91DQo+IHdyb3Rl
Pw0KDQpUbyBhY2hpZXZlIHRoaXMgeW91IHdvdWxkIGRvIGFuIGF0b21pYyBvcGVyYXRpb24gb24g
c3RhdGVfZW50cnlfdGltZSB0byBzZXQvdW5zZXQgdGhlIFhFTl9SVU5TVEFURV9VUERBVEUgYml0
Lg0KVGhpcyBmaWVsZCBpcyBob2xkaW5nIGEgZmxhZyBpbiB0aGUgdXBwZXIgYml0IGJ1dCBhbHNv
IGEgdmFsdWUsIHNvIGFsbCBvcGVyYXRpb25zIG9uIHN0YXRlX2VudHJ5X3RpbWUgd291bGQgbmVl
ZCB0byBiZSBjaGFuZ2VkIHRvIHVzZSBhdG9taWMgb3BlcmF0aW9ucy4NCg0KQWxzbyB0aGlzIHN0
YXRlX2VudHJ5X3RpbWUgbWlnaHQgYWxzbyBiZSBhY2Nlc3NlZCBieSB0aGUgZ3Vlc3Qgb24gb3Ro
ZXIgY29yZXMgYXQgdGhlIHNhbWUgdGltZSAodG8gcmV0cmlldmUgdGhlIHRpbWUgcGFydCkuDQoN
ClRvIHByZXZlbnQgc29tZXRoaW5nIGJlaW5nIHVzZWQgYXMgYXRvbWljIGFuZCBub24gYXRvbWlj
LCBzcGVjaWZpYyB0eXBlcyBhcmUgdXN1YWxseSB1c2VkIChhdG9taWNfdCkgYW5kIHRoaXMgc3Ry
dWN0dXJlIGlzIGFsc28gdXNlZCBieSBndWVzdHMgc28gbW9kaWZ5aW5nIGl0IHdpbGwgbm90IGJl
IGVhc3kuDQoNCk9yIGRpZCBJIG1pc3N1bmRlcnN0b29kIHNvbWV0aGluZyBoZXJlID8NCg0KUmVn
YXJkcw0KQmVydHJhbmQNCg0KDQoNCg0K

