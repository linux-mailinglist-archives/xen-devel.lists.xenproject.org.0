Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D52122F3D7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 17:29:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k053y-0005zG-Dx; Mon, 27 Jul 2020 15:29:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s7zT=BG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1k053w-0005z8-Uu
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 15:29:12 +0000
X-Inumbo-ID: ebc99238-d01d-11ea-a792-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.69]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebc99238-d01d-11ea-a792-12813bfff9fa;
 Mon, 27 Jul 2020 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gh+GZNaeqoxrikv21vTVFcnARyS7tqp7e4GjswCzLT8=;
 b=UseO7oMBnx1wDjVvQiOiZnBJdi4hb8zeW5X1LOnVPwBHLT6ZZTS+XCTvC8vETmRbh5FHAjFzubuL88hDe4mtpuu0aZYcF87fuAqSZCYy00dfvn6JBW9kMa5zEeDbLAW7aTXpPH1Q55jdfBScyv8HTONuEryX+xTDzdJckMkIFhM=
Received: from AM6P195CA0033.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::46)
 by DB7PR08MB3753.eurprd08.prod.outlook.com (2603:10a6:10:7e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Mon, 27 Jul
 2020 15:29:09 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::aa) by AM6P195CA0033.outlook.office365.com
 (2603:10a6:209:81::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Mon, 27 Jul 2020 15:29:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Mon, 27 Jul 2020 15:29:09 +0000
Received: ("Tessian outbound 73b502bf693a:v62");
 Mon, 27 Jul 2020 15:29:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7e691fa6351b41b
X-CR-MTA-TID: 64aa7808
Received: from 0e295821c243.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 44BE6E17-536E-4ED8-9F8D-E98B98866A57.1; 
 Mon, 27 Jul 2020 15:29:03 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e295821c243.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Jul 2020 15:29:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eN5VA8AdJ09hS8KsXMR8ugUtUC3Eu0NVNDDKfwXEVdno8bv6YaS5WLaAkYAvzUg7+EJderxvzhlrjk7oGgak1YZB2qAwS/OTbquh3CJVCrM9vtbEBW+bqV6xDBJpbiy47YbgP7TrFkDdxLHKxEtAhhh50lyEBarTyx30phbmRX8sEclXK1CePUbKXOPmvpv/Th63ANADA6jbU7wA3TZEAJsxZLm7W0wruygti0LMxw5JaYoUI/s3NrDxtGXFczNd+8TGYoBP6NSU0dtuvPdMXuk4wLUw1xIGG63hTGegjUFQx5Jt+2MImRtQ9sX6Ny+9OAPRLQJqXR37OIx1AN8omQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gh+GZNaeqoxrikv21vTVFcnARyS7tqp7e4GjswCzLT8=;
 b=Zebc6RKo0HKDdteCLmJShfiBmYkNswEdq7tVOrnWJ28g5Wl/xnHfl3BotM25gGyhSw3ajhj9qO6RRQ0erLVcOKrXKts3qwta0ipsMxnazlZJqSqhF5jRIJBOPHncg0auMfIzBnoaX4ZPxJ5kut7zRo6QahftNdmAxwLJE9aohKpgZgugQM+kvW4851FUUg0EmWP5brXr0l6Osj7p2/eBIewzM+Gx2o20Rrlh5gW4uGGLCh8kfFejOWMeJp7ASchmV9DLhI7SFvVf9poTBbBbAo0lggHGI776k7DXwr98HYYc4Mxsbj3/fnd6ZCTsgj+qJCmk50GdUR2se9ny04IljQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gh+GZNaeqoxrikv21vTVFcnARyS7tqp7e4GjswCzLT8=;
 b=UseO7oMBnx1wDjVvQiOiZnBJdi4hb8zeW5X1LOnVPwBHLT6ZZTS+XCTvC8vETmRbh5FHAjFzubuL88hDe4mtpuu0aZYcF87fuAqSZCYy00dfvn6JBW9kMa5zEeDbLAW7aTXpPH1Q55jdfBScyv8HTONuEryX+xTDzdJckMkIFhM=
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com (2603:10a6:20b:4c::19)
 by AM6PR08MB3879.eurprd08.prod.outlook.com (2603:10a6:20b:8c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 15:29:01 +0000
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5]) by AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5%6]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 15:29:01 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
Thread-Topic: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
Thread-Index: AQHWYPbO0TX+B10vbkuLRSjkBERSxqkWZWGAgAUt/4A=
Date: Mon, 27 Jul 2020 15:29:01 +0000
Message-ID: <389FC8F3-DDB6-473E-8F89-795EDC21B4E4@arm.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <756d7979-0ebf-b9a4-72bd-18782762f7da@xen.org>
In-Reply-To: <756d7979-0ebf-b9a4-72bd-18782762f7da@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f41d8b28-8324-4be1-b6a5-08d83241ce93
x-ms-traffictypediagnostic: AM6PR08MB3879:|DB7PR08MB3753:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB37536C3415C59F3C9909725AFC720@DB7PR08MB3753.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uPlvfw2h0zcqEbqOPqs5eALaZYbMneD4q+Mn84hgKdNsCr41VmSJ3df5QXjBOlsndueLiykh/9gyTEqX5kILuVj9mqXo18/QYPFD5I56C0c56itTDRg86GZW7KGeet7iIe7zrG2LxLl4rPpQEX+yzsiR8ZqKoFCbvgKwKrTx8ZH4HBvp7l0N2UHYpX7CZQ4t+4KX9WRP4Ytw+OBT6K6MRUmKINGKHoal6PsmxMd1q4SxSK+HqYVkLrhXHYMUaUF+TPXi45x02lTOghjeA6Yul0g0e/ErvlfOQEbZQGQMtWm+oQ+AJHbNmN0H05Cr+o+jZaDGuF556O9ivTh5elw7bQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(478600001)(71200400001)(4326008)(54906003)(6916009)(2616005)(6486002)(8676002)(316002)(8936002)(55236004)(6512007)(53546011)(83380400001)(6506007)(186003)(86362001)(33656002)(5660300002)(64756008)(26005)(91956017)(66946007)(76116006)(2906002)(66446008)(66556008)(66476007)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: /F1zS39wOx9OUULj1CI1O+9LQ2iPJxr7UmcfAQq9gre6w6itHy+0NeSrXEsY3WUfTub6nQBvkBBhIGBGi6BSXBb6B5dcaRoUNCwUrRegN4lyWcrkiAtmigeb3JPsDMtQk5m9iVrEzxK3ms5j+4olEibVizsVkShlo697HUP6BQZ3QlXa8s2M7XaGJsct1txWDIr90CvgO0CFNDrrIG7GZRT6nlwKmk7fhUSl4QRxVDEyWaKKSm2L+yKoaWIMTavI8FcV4ns5nCFS2PCnNafBr64Q/MQmxkI0Uv9ANT4o233jNEzIAlhnkVdGJ2Z6pKeFzDPCtPdr2lhMtO3giAc+0emtPJuqzEx7fkQm/4PTRqAQGsLEXhFwI0y/ILCCU6xDdVy+yXEudVAy9N9gR45koU3wViCuCos3TtZuyZrO/Q7wpAfIKjOLqVF20JAuz4voHW7+KCHO/Oyq22FJn9R2WA8gpTbfDzetAFqN8Mdjwb8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BB12CB1A9972D41A3DA41F1295AE3C5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3879
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6fed4ed4-166d-4e86-81f5-08d83241ca18
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x+uD4FxYCE4CvJJZ2n/pdz9At9/ItP9exxaflZss8b9T6VblM3SXTFh5YxfLTffiMqddTkWTnLWa4TT5pAmhDHWrb3IcpLB/OhrwpuSjwzcaEijQPd3ups/emkn51N6GgjQLP4FjTLepsXQYtpko5RukXlNXGmYfmx/H8GQTriBlSbO3fZkr2KgKF4gE4Anfi+/mngORCwjOnlTeFgfUbZDezb6fLi2DdVXfQSFO0KziHbNOV1faLX5QY0y30yYPQ0UqAIjLYlgz1NCY0YYqJyptX4oLU3wNKE9dD9/sqjaOSlG1V41X5a3zHUw/iMBWF2zX5MnYNAdMO5MGMXzzJS4QXO0lfLjxKbyPqBQwLDszBKIlZvZ3LVLTsANNxifJ6HzVw1potXf6Ks/T9eknzQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966005)(6486002)(6506007)(53546011)(5660300002)(82310400002)(4326008)(2906002)(26005)(6862004)(81166007)(47076004)(107886003)(82740400003)(83380400001)(356005)(70586007)(54906003)(70206006)(6512007)(8936002)(8676002)(336012)(2616005)(186003)(478600001)(86362001)(36756003)(33656002)(36906005)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 15:29:09.2415 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f41d8b28-8324-4be1-b6a5-08d83241ce93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3753
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjQgSnVsIDIwMjAsIGF0IDk6MjMgYW0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgUmFodWwsDQo+IA0KPiBPbiAyMy8wNy8yMDIwIDE2OjQw
LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IFhFTiBkdXJpbmcgYm9vdCB3aWxsIHJlYWQgdGhlIFBD
SSBkZXZpY2UgdHJlZSBub2RlIOKAnHJlZ+KAnSBwcm9wZXJ0eQ0KPj4gYW5kIHdpbGwgbWFwIHRo
ZSBQQ0kgY29uZmlnIHNwYWNlIHRvIHRoZSBYRU4gbWVtb3J5Lg0KPj4gWEVOIHdpbGwgcmVhZCB0
aGUg4oCcbGludXgsIHBjaS1kb21haW7igJ0gcHJvcGVydHkgZnJvbSB0aGUgZGV2aWNlIHRyZWUN
Cj4+IG5vZGUgYW5kIGNvbmZpZ3VyZSB0aGUgaG9zdCBicmlkZ2Ugc2VnbWVudCBudW1iZXIgYWNj
b3JkaW5nbHkuDQo+PiBBcyBvZiBub3cgInBjaS1ob3N0LWVjYW0tZ2VuZXJpYyIgY29tcGF0aWJs
ZSBib2FyZCBpcyBzdXBwb3J0ZWQuDQo+PiBDaGFuZ2UtSWQ6IElmMzJmNzc0OGI3ZGM4OWRkMzcx
MTRkYzUwMjk0MzIyMmEyYTM2YzQ5DQo+PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFo
dWwuc2luZ2hAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gIHhlbi9hcmNoL2FybS9LY29uZmlnICAgICAg
ICAgICAgICAgIHwgICA3ICsNCj4+ICB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICAgICAg
ICB8ICAgMSArDQo+PiAgeGVuL2FyY2gvYXJtL3BjaS9NYWtlZmlsZSAgICAgICAgICAgfCAgIDQg
Kw0KPj4gIHhlbi9hcmNoL2FybS9wY2kvcGNpLWFjY2Vzcy5jICAgICAgIHwgMTAxICsrKysrKysr
KysrKysrDQo+PiAgeGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYyAgfCAxOTggKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gIHhlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3Qt
Z2VuZXJpYy5jIHwgMTMxICsrKysrKysrKysrKysrKysrKw0KPj4gIHhlbi9hcmNoL2FybS9wY2kv
cGNpLmMgICAgICAgICAgICAgIHwgMTEyICsrKysrKysrKysrKysrKysNCj4+ICB4ZW4vYXJjaC9h
cm0vc2V0dXAuYyAgICAgICAgICAgICAgICB8ICAgMiArDQo+PiAgeGVuL2luY2x1ZGUvYXNtLWFy
bS9kZXZpY2UuaCAgICAgICAgfCAgIDcgKy0NCj4+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL3BjaS5o
ICAgICAgICAgICB8ICA5NyArKysrKysrKysrKysrLQ0KPj4gIDEwIGZpbGVzIGNoYW5nZWQsIDY1
NCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gQXMgYSBnZW5lcmFsIGNvbW1l
bnQsIEkgd291bGQgc3VnZ2VzdCB0byBzcGxpdCB0aGUgcGF0Y2ggaW4gc21hbGxlciBjaHVuay4g
VGhpcyB3b3VsZCBoZWxwIHRoZSByZXZpZXcgYW5kIGFsc28gYWxsb3cgdG8gcHJvdmlkZSBtb3Jl
IGV4cGxhbmF0aW9uIG9uIHdoYXQgaXMgZG9uZS4NCg0KT2sgSSB3aWxsIHNwbGl0IHRoZSBwYXRj
aGVzIGluIG5leHQgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggc2VyaWVzLg0KPiANCj4gRm9yIGluc3Rh
bmNlLCBJIHRoaW5rIGl0IGlzIHBvc3NpYmxlIHRvIGEgc3BsaXQgbG9va2luZyBsaWtlOg0KPiAg
ICAtIEFkZCBmcmFtZXdvcmsgdG8gYWNjZXNzIGFuIGhvc3RicmlkZ2UNCj4gICAgLSBBZGQgc3Vw
cG9ydCBmb3IgRUNBTQ0KPiAgICAtIEFkZCBjb2RlIHRvIGluaXRpYWxpemUgdGhlIFBDSSBzdWJz
eXN0ZW0NCj4gDQo+IFRoZXJlIGlzIGFsc28gc29tZSBzbWFsbCBmaXhlcyBpbiB0aGlzIGNvZGUg
dGhhdCBwcm9iYWJseSBjYW4gbW92ZSBpbiB0aGVyZSBvd24gcGF0Y2hlcy4NCg0KQWNrLg0KPiAN
Cj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

