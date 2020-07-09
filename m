Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C00219DDC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jul 2020 12:31:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtToc-0006h4-6r; Thu, 09 Jul 2020 10:30:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2lT=AU=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jtToa-0006XK-Ty
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2020 10:30:04 +0000
X-Inumbo-ID: 25de565a-c1cf-11ea-8496-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.80]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25de565a-c1cf-11ea-8496-bc764e2007e4;
 Thu, 09 Jul 2020 10:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V70iKL15+X3CYs9tSao7Y8W3ZX5EWgAu8UTy9G+d8Bw=;
 b=HwP8xcBfCBdwlwsPyza1iDJOugfD7AohXMr0oYMcgY/3zH4bhUcMuHD7cok1FIPqKCYod6wkHMnVMsvhWIUwG1JdgDSEZ57+lC+r4rKfZ0S3X4/PFFQU6/+PY8LTfsLD0cFaM3w2jFCzc5RkGtkNg7tqHNmMnb1PbJLh/1fskUU=
Received: from DB7PR03CA0079.eurprd03.prod.outlook.com (2603:10a6:10:72::20)
 by AM0PR08MB3604.eurprd08.prod.outlook.com (2603:10a6:208:e3::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 10:30:00 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::89) by DB7PR03CA0079.outlook.office365.com
 (2603:10a6:10:72::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Thu, 9 Jul 2020 10:30:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 10:29:59 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62");
 Thu, 09 Jul 2020 10:29:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c080f6014f919a71
X-CR-MTA-TID: 64aa7808
Received: from cc472f304b99.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C4C06E2-9759-4C10-B0B9-035BF97ACE68.1; 
 Thu, 09 Jul 2020 10:29:54 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc472f304b99.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Jul 2020 10:29:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8m6CqWCn1OlkqPjbfoBY8FmGq+7Fxo21/RX8YG/csRCKjs0ZsuTK2m+XSco8OwYf6dLl2u4NMYG+LUinUkQkdZF7fliR0zmenB/X4Q9izXPTMQIGu1V8oKkQHZuSr4LxXGyls67N45oPy02X/20/iVwoZnkP/CaeOG0R8tXGlj0Vz7pXhp6qD4s0GXODokyXJaT4AYArW7Qdb5FORDKD7n7MCc7pko4tlr6dJfRj+qQcfsqfT+x0cGJ4Ikq6W4qTbayCejqpCt7W9AISkQixt3wXNmUgSSfUfMvIO2o2qRrfsAweoQ/KthGm7WkwWyrgEjx2LbHu69oNeQuPcOoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V70iKL15+X3CYs9tSao7Y8W3ZX5EWgAu8UTy9G+d8Bw=;
 b=ZvCVKHxu4tIEnZN9cZhCz1HmIr9XW/bidUOeu372bNaoo2f8Ztn/JU5at/oQOpBCs/Xv57pobEOhfa79jOg+GtGPFgGVP/Qmt/43V3m5WHzGiX+BD4VdVqSE9UTWQWxrD98Sq2QF4rEutv3lKNEH/D59unz+vBNxgKVpfm1g745eisH1TVwdSoRaimA43tLXP6jjgVN6O79AT/p/rV1bpJzd+fjz9YEIZq3PcnZU2ZUtrxOnIV03zpcdiav2hLWYlUv5o9efZZFoeBzVvpNfErwAv2t5Kq9jO99eOWqqDu0nj6YN4V+tJSriDYNgM2OtsGV1ZSWQLwxtFRsggeE2TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V70iKL15+X3CYs9tSao7Y8W3ZX5EWgAu8UTy9G+d8Bw=;
 b=HwP8xcBfCBdwlwsPyza1iDJOugfD7AohXMr0oYMcgY/3zH4bhUcMuHD7cok1FIPqKCYod6wkHMnVMsvhWIUwG1JdgDSEZ57+lC+r4rKfZ0S3X4/PFFQU6/+PY8LTfsLD0cFaM3w2jFCzc5RkGtkNg7tqHNmMnb1PbJLh/1fskUU=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4776.eurprd08.prod.outlook.com (2603:10a6:10:f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Thu, 9 Jul
 2020 10:29:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 10:29:52 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: PCI passthrough on arm Design Session MoM
Thread-Topic: PCI passthrough on arm Design Session MoM
Thread-Index: AQHWVScSHsZRWGBXYkau2LjYpe8C1aj9rgiAgAFfbAA=
Date: Thu, 9 Jul 2020 10:29:52 +0000
Message-ID: <227BD2A5-1FC7-4B1A-8B93-4DBECC43BDA2@arm.com>
References: <4E0A40D3-2979-4A91-9376-C2B19B9F582E@arm.com>
 <20200708133205.GE7191@Air-de-Roger>
In-Reply-To: <20200708133205.GE7191@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a226a2d5-a98e-49a7-155d-08d823f30860
x-ms-traffictypediagnostic: DBBPR08MB4776:|AM0PR08MB3604:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3604DC1C1BF38BF8E748B7D39D640@AM0PR08MB3604.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04599F3534
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: E1b7T49HIwV2Z6/eQ5sqJkHaFQKEcCisQyfbq9eaJhifR2fpIr0lXpzwWc3pC3MquKNckibv1y/PdeeWQ7R14LJjDL6OxXD/ejPKq/6nTcKe6rzqlZEvEgXWJVxOe85mJvsUSTl82+Nggi/D/Kc9JiC8p/z3o/7aga4br2eNavsT7oM/vQDdeVMmL2Kx/gtPR814RzX5gp1d5WypMV6Q+aamuE6QQ2WAqTqpUzfUwJ8ejTvrDpobdYa431qFraYgC0V8xXOfAhbehBbzAElk3JtTOoZ4NnKX9305Pu/ELNFoKMtPUt7bGsbZtebY0RNjbINJC0kpHNwyV42cpV4DukVdKEPj+1nc5hat5qZ/xskc7D2SXuys32I1vKsu3TxOn6okJ8Kl2yycTTsft9+KJQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(316002)(76116006)(5660300002)(36756003)(6916009)(66446008)(64756008)(66556008)(6486002)(66476007)(8676002)(66946007)(2906002)(71200400001)(8936002)(91956017)(6506007)(53546011)(186003)(2616005)(33656002)(26005)(966005)(86362001)(478600001)(83380400001)(4326008)(54906003)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Xk5Md9rOybQXIcbYDNBs0Mc45uxLR54skGkTzR0ZIsK0sNshZvWW0AcUaPnLjfnEYXGhIozvaGpBjui2DCR3bIq8WmbjKp8xzhCLyPO5c8mhEB1Hg8w6uU2iedJ+P+yku6Y6ATS8EyTMoB0AA9R0dj7R2PAidNe2iZbSUbfBr9ipYCyFUn5GuIIaUfn3TNvJANAGcCHZSwNZDU3E/V+30TVbJDrx92CFZXFvOAWxSu0+5fd5xCqGiaV1Mt+8W2BAyoxeK2B1TDc17qy7rcrNPfsBybO4ZT9lP8F9rACAmvC6tmV7NIDiGNSmZL4KfqELXx2VovqdgvGuhKbPq/6z3xUzffzUL5eq5M7m/1NiuRMj6rcRQzEqeI+RHvCLM0XGFhawj/9UaXkmHxf82SlDufNSQ4Z+0Jm9LzelJKio69ohhBICkvnoNZ7eAYgFpE7l95Yvtiaadgi25g/y8Pj1P4nEvCS9Y7c8dxrTdPAUmyBux+G/g7h9BkcdJY4mpRcn
Content-Type: text/plain; charset="utf-8"
Content-ID: <88476A19FF81CC47AF83457E67DFCDFB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4776
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966005)(47076004)(186003)(356005)(336012)(81166007)(82310400002)(33656002)(6486002)(82740400003)(86362001)(36756003)(6862004)(70206006)(70586007)(6506007)(4326008)(5660300002)(53546011)(8936002)(2906002)(2616005)(26005)(83380400001)(316002)(8676002)(6512007)(54906003)(966005)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: eb41ebff-3291-473e-2a80-08d823f30435
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qmmZ8Cmes5f6k4MtCxxTcceVaIkSvXn7q6SWA1FFVs4XQJGoVHh0aISpulCTW3HfnBJBFf17gXLHPCG17seaOQjlNYBbWkpIKE7LjwRNcpFYmiCZevnlkMbxpCPn7Hq83xP7EYNMiEPVkaDfuDDLXssaEku07l84kt3+izEPjozNMwdECTqRz739QCfHkZYGGVc5nxs9vaKjwl0xGbPlF3HU6EUxhV769zlgqNsa91QAhNyrjA4nVgolzA2L7Q+M+jUTOCNgvhNkXswQwHGzA6eJi0EMiDC8ztNPO/dSGLNkyxxqLVFA5pxiJTHb39oCJr7W87vEkOZB3n/N2XEMqjvn5F2SYMs67VvGX4w6V6mFVOMiwHn5ZNPq5jGoS5EDxmvw2sezvi7iznUOZkSKBr1pzS4JvgKSsc4PIMgRVR2nbcYyFWSW3zz/FHB8tqptK75MC/enjk0EPDk6eszUV8RS4HwVpaE6ZuHvfJ3sVos=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 10:29:59.7404 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a226a2d5-a98e-49a7-155d-08d823f30860
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3604
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gOCBKdWwgMjAyMCwgYXQgMTQ6MzIsIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgSnVsIDA4LCAyMDIwIGF0IDEyOjU1
OjM2UE0gKzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSwNCj4+IA0KPj4gSGVy
ZSBhcmUgdGhlIG5vdGVzIHdlIHRvb2sgZHVyaW5nIHRoZSBkZXNpZ24gc2Vzc2lvbiBhcm91bmQg
UENJIGRldmljZXMgcGFzc3Rocm91Z2ggb24gQXJtLg0KPj4gRmVlbCBmcmVlIHRvIGNvbW1lbnQg
b3IgYWRkIGFueXRoaW5nIDotKQ0KPj4gDQo+PiBCZXJ0cmFuZA0KPj4gDQo+PiBQQ0kgZGV2aWNl
cyBwYXNzdGhyb3VnaCBvbiBBcm0gRGVzaWduIFNlc3Npb24NCj4+ID09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09DQo+PiANCj4+IERhdGU6IDcvNy8yMDIwDQo+PiANCj4+IC0g
WDg2IFZQQ0kgc3VwcG9ydCAgaXMgZm9yIHRoZSBQVkggZ3Vlc3QgLg0KPiANCj4gQ3VycmVudCB2
UENJIGlzIG9ubHkgZm9yIFBWSCBkb20wLiBXZSBuZWVkIHRvIGRlY2lkZSB3aGF0IHRvIGRvIGZv
cg0KPiBQVkggZG9tVXMsIHdoZXRoZXIgd2Ugd2FudCB0byB1c2UgdlBDSSBvciB4ZW5wdCBmcm9t
IFBhdWw6DQo+IA0KPiBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvcGF1
bGR1L3hlbnB0LmdpdDthPXN1bW1hcnkNCj4gDQo+IE9yIHNvbWV0aGluZyBlbHNlLiBJIHRoaW5r
IHRoaXMgZGVjaXNpb24gYWxzbyBuZWVkcyB0byB0YWtlIGludG8NCj4gYWNjb3VudCBBcm0uDQoN
CldlIGFyZSBjdXJyZW50bHkgdXNpbmcgdnBjaSBmb3IgZ3Vlc3RzLg0KQnV0IHdlIGNvdWxkIGFs
c28gbG9vayBpbnRvIHhlbnB0IGJ1dCBmcm9tIGEgcXVpY2sgY2hlY2sgaXQgZG9lcyByZXF1aXJl
IGEgRG9tMCB3aGljaCB3b3VsZCBkZWZlYXQgdGhlIERvbTBsZXNzIHVzZSBjYXNlLg0KDQo+IA0K
Pj4gLSBYODYgUENJIGRldmljZXMgZGlzY292ZXJ5IGNvZGUgc2hvdWxkIGJlIGNoZWNrZWQgYW5k
IG1heWJlIHVzZWQgb24gQXJtIGFzIGl0IGlzIG5vdCB2ZXJ5IGNvbXBsZXgNCj4+IAktIFJlbWFy
ayBmcm9tIEp1bGllbjogVGhpcyBtaWdodCBub3Qgd29yayBpbiBudW1iZXIgb2YgY2FzZXMNCj4+
IC0gU2FuaXRhdGlvbiBvZiBlYWNoIHRoZSBQQ0kgYWNjZXNzIGZvciBlYWNoIGd1ZXN0IGluIFhF
TiBpcyByZXF1aXJlZA0KPj4gLSBNU0kgdHJhcCBpcyBub3QgcmVxdWlyZWQgZm9yIGdpY3YzIGJ1
dCBpdCByZXF1aXJlZCBmb3IgZ2ljdjJtDQo+PiAJLSBXZSBkbyBub3QgcGxhbiB0byBzdXBwb3J0
IG5vbiBJVFMgR0lDDQo+PiAtIENoZWNrIHBvc3NpYmlsaXR5IHRvIGFkZCBzb21lIHNwZWNpZmlj
YXRpb25zIGluIEVCQlIgZm9yIFBDSSBlbnVtZXJhdGlvbiAoYWRkcmVzcyBhc3NpZ25tZW50IHBh
cnQpDQo+PiAtIFBDSSBlbnVtZXJhdGlvbiBzdXBwb3J0IHNob3VsZCBub3QgZGVwZW5kIG9uIERP
TTAgZm9yIHNhZmV0eSByZWFzb25zDQo+PiAtIFBDSSBlbnVtZXJhdGlvbiBjb3VsZCBiZSBkb25l
IGluIHNldmVyYWwgcGxhY2VzDQo+PiAJLSBEVEIsIHdpdGggc29tZSBlbnRyaWVzIGdpdmluZyB2
YWx1ZXMgdG8gYmUgYXBwbGllZCBieSBYZW4NCj4+IAktIEluIFhFTiAoY29tcGxleCwgbm90IHdh
bnRlZCBvdXQgb2YgZGV2aWNlcyBkaXNjb3ZlcnkpDQo+PiAJLSBJbiBGaXJtd2FyZSBhbmQgdGhl
biB4ZW4gZGV2aWNlIGRpc2NvdmVyeQ0KPj4gLSBBcyBwZXIgSnVsaWVuIGl0IGlzIGRpZmZpY3Vs
dCB0byB0ZWxsIHRoZSBYRU4gb24gd2hpY2ggc2VnbWVudCBQQ0kgZGV2aWNlIGlzIHByZXNlbnQN
Cj4+IAktIEN1cnJlbnQgdGVzdCBpbXBsZW1lbnRhdGlvbiBpcyBkb25lIG9uIEp1bm8gd2hlcmUg
dGhlcmUgaXMgb25seSBvbmUgc2VnbWVudA0KPj4gCS0gVGhpcyBzaG91bGQgYmUgaW52ZXN0aWdh
dGVkIHdpdGggYW4gb3RoZXIgaGFyZHdhcmUgaW4gdGhlIG5leHQgbW9udGhzDQo+IA0KPiBJJ20g
bm90IHN1cmUgdGhlIHNlZ21lbnRzIHVzZWQgYnkgWGVuIG5lZWQgdG8gbWF0Y2ggdGhlIHNlZ21l
bnRzIHVzZWQNCj4gYnkgdGhlIGd1ZXN0LiBUaGlzIGlzIGp1c3QgYW4gYWJzdHJhY3QgdmFsdWUg
YXNzaWduZWQgZnJvbSB0aGUgT1MgKG9yDQo+IFhlbikgaW4gb3JkZXIgdG8gZGlmZmVyZW50aWF0
ZSBkaWZmZXJlbnQgTU1DRkcgKEVDQU0pIHJlZ2lvbnMsIGFuZA0KPiB3aGV0aGVyIHN1Y2ggbnVt
YmVycyBtYXRjaCBkb2Vzbid0IHNlZW0gcmVsZXZhbnQgdG8gbWUsIGFzIGF0IHRoZSBlbmQNCj4g
WGVuIHdpbGwgdHJhcCBFQ0FNIGFjY2Vzc2VzIGFuZCBtYXAgc3VjaCBhY2Nlc3NlcyB0byB0aGUg
WGVuIGFzc2lnbmVkDQo+IHNlZ21lbnRzLg0KPiANCj4gU2VnbWVudHMgbWF0Y2hpbmcgYmV0d2Vl
biB0aGUgT1MgYW5kIFhlbiBpcyBvbmx5IHJlbGV2YW50IHdoZW4gUENJDQo+IGluZm9ybWF0aW9u
IG5lZWRzIHRvIGJlIGNvbnZleWVkIGJldHdlZW4gdGhlIE9TIGFuZCBYZW4gdXNpbmcgc29tZQ0K
PiBraW5kIG9mIGh5cGVyY2FsbCwgYnV0IEkgdGhpbmsgeW91IHdhbnQgdG8gYXZvaWQgdXNpbmcg
c3VjaCBzaWRlLWJhbmQNCj4gY29tbXVuaWNhdGlvbiBjaGFubmVscyBhbnl3YXk/DQoNCldlIGRl
ZmluaXRlbHkgd2FudCB0byBhdm9pZCB0aGVtLg0KT24gdGhlIGp1bm8gYm9hcmQgd2UgdXNlIGN1
cnJlbmx0eSB0aGlzIHF1ZXN0aW9uIHdhcyBpZ25vcmVkIGZvciBub3cgYXMgdGhlcmUgaXMgb25s
eSBvbmUgcmVnaW9uLg0KVGhpcyBpcyBkZWZpbml0ZWx5IHNvbWV0aGluZyB3ZSBuZWVkIHRvIGlu
dmVzdGlnYXRlLg0KDQo+IA0KPj4gLSBKdWxpZW4gbWVudGlvbmVkIHRoYXQgY2xvY2tzIGlzc3Vl
cyB3aWxsIGJlIGNvbXBsZXggdG8gc29sdmUgYW5kIG1vc3QgaGFyZHdhcmUgYXJlIG5vdCBmb2xs
b3dpbmcgdGhlIEVDQU0gc3RhbmRhcmQNCj4+IC0gSnVsaWVuIG1lbnRpb25lZCB0aGF0IExpbnV4
IGFuZCBYZW4gY291bGQgZG8gdGhlIGVudW1lcmF0aW9uIGluIGEgZGlmZmVyZW50IHdheSwgbWFr
aW5nIGl0IGNvbXBsZXggdG8gaGF2ZSBsaW51eCBkb2luZyBhbiBlbnVtZXJhdGlvbiBhZnRlciBY
ZW4NCj4+IC0gV2Ugc2hvdWxkIHB1c2ggdGhlIGNvZGUgd2UgaGF2ZSBBU0FQIG9uIHRoZSBtYWls
aW5nIGxpc3QgZm9yIGEgcmV2aWV3IGFuZCBkaXNjdXNzaW9uIG9uIHRoZSBkZXNpZ24NCj4+IAkt
IEFybSB3aWxsIHRyeSB0byBkbyB0aGF0IGJlZm9yZSBlbmQgb2YgSnVseQ0KPiANCj4gSSB3aWxs
IGJlIGhhcHB5IHRvIGdpdmUgaXQgYSBsb29rIGFuZCBwcm92aWRlIGZlZWRiYWNrLg0KDQpUaGFu
a3MsIHdlIHdpbGwgdHJ5IHRvIHB1c2ggb3VyIHN0YXR1cyBmb3IgdGhlIGVuZCBvZiBuZXh0IHdl
ZWsuDQoNCj4gDQo+IEZvciBzdWNoIGNvbXBsZXggcGllY2VzIG9mIHdvcmsgSSB3b3VsZCByZWNv
bW1lbmQgdG8gZmlyc3Qgc2VuZCBzb21lDQo+IGtpbmQgb2YgZG9jdW1lbnQgdG8gdGhlIG1haWxp
bmcgbGlzdCBpbiBvcmRlciB0byBtYWtlIHN1cmUgdGhlDQo+IGRpcmVjdGlvbiB0YWtlbiBpcyBh
Y2NlcHRlZCBieSB0aGUgY29tbXVuaXR5LCBhbmQgd2UgY2FuIGFsc28gcHJvdmlkZQ0KPiBmZWVk
YmFjayBvciBwb2ludCB0byBleGlzdGluZyBjb21wb25lbnRzIHRoYXQgY2FuIGJlIGhlbHBmdWwg
OikuIElmDQo+IHlvdSBoYXZlIGNvZGUgZG9uZSBhbHJlYWR5IHRoYXQncyBhbHNvIGZpbmUsIGZl
ZWwgZnJlZSB0byBzZW5kIGl0Lg0KDQpXZSBoYXZlIHNvbWUgY29kZSBkb25lIGFscmVhZHkgYnV0
IHdlIHdpbGwgZGVmaW5pdGVseSBzcGVuZCBzb21lIHRpbWUgaW50byB3cml0aW5nIGEgZGVzaWdu
IHRvIGFncmVlIG9uIGJlZm9yZSBnb2luZyB0byBmYXIuDQpUaGVyZSBhcmUgc3RpbGwgc29tZSBh
cmVhcyB0aGF0IHdlIHdhbnQgdG8gY2hlY2sgdGVjaG5pY2FsbHkgZm9yIGZlYXNpYmlsaXR5IChy
ZWdpb25zLCBNU0ksIGNsb2NrcyBmb3IgZXhhbXBsZSkuDQoNClRoYW5rcyBhIGxvdCBmb3IgeW91
ciBmZWVkYmFjaw0KQmVydHJhbmQNCg0K

