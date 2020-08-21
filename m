Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35EB24CDF7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 08:27:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k90Vr-0002cW-2Q; Fri, 21 Aug 2020 06:26:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=75zu=B7=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1k90Vp-0002cP-55
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 06:26:53 +0000
X-Inumbo-ID: e35f09bc-293c-4679-8b2c-07e43b18ba00
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.63]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e35f09bc-293c-4679-8b2c-07e43b18ba00;
 Fri, 21 Aug 2020 06:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtQa3YTJeTJRi77dDJuwHG/TemKX8hji/cKKwlq5D9g=;
 b=wfkHtzZSbHv053KpqPKOVp8n7GBa/a8bZVDxs8QXn7CPN6sE9FrYJBHIdBOXRfD8fMLMvF5MDJVMhZpsheIEIvZyRuO8f36eW9NgB19mNx7HRI/WNl+Ognv/QHYFMpttp8mexvFSb100kJkPayU6+wuqsBuHBKy1jS7pDXAYyqM=
Received: from AM6P193CA0094.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::35)
 by AM8PR08MB5763.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 06:26:49 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::a2) by AM6P193CA0094.outlook.office365.com
 (2603:10a6:209:88::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Fri, 21 Aug 2020 06:26:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 06:26:48 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Fri, 21 Aug 2020 06:26:48 +0000
X-CR-MTA-TID: 64aa7808
Received: from 322860a1b621.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C1E26E08-1FAD-4B4A-8FB9-87795A05BFB5.1; 
 Fri, 21 Aug 2020 06:26:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 322860a1b621.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Aug 2020 06:26:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0WVdefVDAWJlsrX3oxAdOAMHfeHcN6U3dR/xKD3W5moNNcUE+y8z/LWpBqA2egKibHR4KM7j0nSueTmgsu4tqhIcn7CFDDTJOawZGrkInpLKZOUL4M1xuLTeYtUMrekpJ/DjXdB7hY0pCWecMg1XFUJ+y1249KJIirNbgl0ytQpPYGht84c+3lkh9IPFlDkLC/1NnR4WBCsTlpLpYwz6vn+Gqs09fHDITsJEsOS25iWrEdfE7arrR1ddssfxJHupZ/Qt+k4VAWObtaRFYT8H5DVhCmSkU8J+ulNtbPC6Swwv/gHVG3RQ8yFo8lGYTyNSN0wu5O8XrmSvq+tTsk4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtQa3YTJeTJRi77dDJuwHG/TemKX8hji/cKKwlq5D9g=;
 b=V0g8wGu/IqiqGacYtGw9gAIvWtZGg69tQCRSdnRl7Ov0G6AvD2AKID/EPt6Jq9A1q8XijSGxt7MIjZPTXQjP7FavE5XUfyBS2UY78NNPFAPhNijXuVKw18ThBxWU+D+Fz23DBUDSOP/hvnq/y7TFzLyuSOcmUXFhMdXdfufAtIkyW+qnAqJRvsFLncK+XmQYXqFadwZpXwtpzrScmvG6VgnCS0lH4goYHgZVb9+PVfupjtUWDnDcms+wSCFvZsTxlzKzY/asUtAAys+k3spglG/KImM/hewyKuRBn/AzqD6/he09gqhIgSNv4zPoI5N+9nK1x/cAxGAflhjumGGYtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtQa3YTJeTJRi77dDJuwHG/TemKX8hji/cKKwlq5D9g=;
 b=wfkHtzZSbHv053KpqPKOVp8n7GBa/a8bZVDxs8QXn7CPN6sE9FrYJBHIdBOXRfD8fMLMvF5MDJVMhZpsheIEIvZyRuO8f36eW9NgB19mNx7HRI/WNl+Ognv/QHYFMpttp8mexvFSb100kJkPayU6+wuqsBuHBKy1jS7pDXAYyqM=
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 06:26:42 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::60e0:726f:fcef:2be6]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::60e0:726f:fcef:2be6%4]) with mapi id 15.20.3305.024; Fri, 21 Aug 2020
 06:26:42 +0000
From: Wei Chen <Wei.Chen@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andre Przywara
 <Andre.Przywara@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Steve Capper
 <Steve.Capper@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
Thread-Topic: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
Thread-Index: AQHWdQ1DU6QzTrGCRkmVmocCo7wV0qk9lfsAgAAC9YCAAAS2AIAACKqAgAATZwCAACb7gIAEMhbQ
Date: Fri, 21 Aug 2020 06:26:42 +0000
Message-ID: <AM0PR08MB3747A4D7FF5D1F3AAC9E88189E5B0@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20200818031112.7038-1-wei.chen@arm.com>
 <ef6a40d7-7def-3726-870c-f9bf22e2a388@arm.com>
 <139F007F-5C70-4AB3-B2BC-3A7D414A5C06@arm.com>
 <ba38efd7-2fdd-e354-7a24-bcd67f9793b2@arm.com>
 <D52E4104-F43D-4A8D-A135-79569EC0BDDA@arm.com>
 <f475e3f7-f820-7bd8-4b41-b8378ec7faaf@arm.com>
 <53293879-DCD2-407A-A7C1-561313879424@arm.com>
In-Reply-To: <53293879-DCD2-407A-A7C1-561313879424@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 2C13033D79A23B47B97BD77044CDFF8F.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.113]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 172dba4a-cd3f-4fe2-634c-08d8459b2f63
x-ms-traffictypediagnostic: AM0PR08MB3745:|AM8PR08MB5763:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM8PR08MB57634BFF029248E3A482BC039E5B0@AM8PR08MB5763.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: nAxJ8fTy4equNa96slrQMdDxrASiZzwJGJhJzxbIwt+36fGoVZkmvs+6pFpZaopf1Iiqot+kIB2ida42g6wssdptkCjydm4abTbif6JRIgwjr5BAtn3e2EF+fJR6JpNUpZNhRbVqG1YynIdOXHhivEl5h4TxzVGswLz0MKLcoCZw0SF9uiIxJ0v34qWx+KuDUGi2UFwOrxkpSqbHk1DwdZ2RY/qyLZv4kPGGe3UOnOj0Kn/4cKfKqLnBJBQkYPMU7Qk9aiJoGvrybLAt3kUAv7JX1d5WdM/rgfwkx2EtEUEcAzYYz+8ouzyraBdAK77BBczL+2EhzFfaYJbVHc6c22gNkHoHzTc/XQ7NBn1J9PpfaR3/CmAGdfNn1pRIxxM8WhGUJAgfs/7CTJ+k1lYDNQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3747.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(966005)(8936002)(316002)(8676002)(86362001)(478600001)(186003)(71200400001)(110136005)(33656002)(83380400001)(54906003)(26005)(66556008)(6506007)(66946007)(5660300002)(52536014)(9686003)(76116006)(66476007)(55016002)(4326008)(53546011)(6636002)(7696005)(64756008)(2906002)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: G2af9absqJETryBGl3xCCHxajdIHKib2mnQaMvXYKFilWC3GcajdtHdpvkSHQ+G1hG+LIA9H08Jj6LsS8/R9Ev58cbUYglhTK2+tjvEpIJLNcEq79r89KZ9lMoZf0mO+8Rcm5dQiRXd+r7cXBir7HdqCnhS49EyhkctUg452NFZPyr08fuw86FWUfT1LfbdXAcUmSUGIagj+INREYceBZwndj6fC8Xus3Dxg+TiE2YkZAvJ8XcfqYLPsF9jWc2cM8c2DwrDJXCUk9qK7xDjnYax9CSx2H2CKudwZAFDoqoXzYLO4CBx0s+gh4mpDs/3jj4YRZlnEGw6fZvC3RXm4YeKqSgQPC8EQeuJyNWb20lnfY3Avecrjjt2UrvONDs5COOKUIVhrxi5IHr6xEPbGU63ASgYXwoz4wrWe1LDpXRmsNFM8QL6+muCeeNgGuirMAkgDEf6RV5YW44SbaJj+Tq993qTzMNDBSqqx1MtZ/OVRZaktQCf0Z7hSgzSbSDPifZ8z3IGDYlCc9KV73eypwxNiVQ+rZ7mhpN+ijcOQgj1v9zO89IDYXkOmFCfMYDxfb2DvD2ycJX32C4FWHP/us+iK2IiZIahqRlX4BsLBHUTFqzLL9WakCkV78ExdAFsxdKSvqkNi9scm99iAjO0d0g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3745
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8b398dec-e51f-4ef0-ab3b-08d8459b2b88
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tN/bCNyPzcJmiNkPAOEB6jRPK8yWZqI9fyid672CzAj7eO4s4LBXceQzhB6fK60eEuSa9Y4kx8DvbsKbDpo+QlX+0lp0VjE3e9acWtuafGL/8saUx6E8vEiiWhgT9Uch4sOFTNj5+0+kZBmWjQNZPgBouVDyYBGY0/6cRT+JTQQz0q/1vbev6MFS5Zg1HnxSpPksarWCb/9MZndJtSommLc/iRtgqB+SnH9hzkYEX0AISNqYEQVcWIaiKm92XYo17avoAefe38uoNF7zKK8/emqnj3KgAw8qxaHSVWB1JaTeRN/hcxi+1DH9q4KVuxTGVTiOo9QS8uxoEtlFr8QS/sc74NGkfdbMtAQ34Kx65j73u5vqj5yio3DAoFWhdA0YHlGNaEYk6T2mYfAhE/lSpKPfqYJLrNETN/ho0DmLi2zzP+Zp0664n0d7etDYX6It+eKOJz99ZTo5fZVG2khZ1H0nczN1GkwE8P+8SZv9HaE=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(33656002)(8936002)(52536014)(55016002)(966005)(8676002)(54906003)(478600001)(36906005)(336012)(9686003)(316002)(70206006)(6636002)(4326008)(110136005)(186003)(70586007)(53546011)(356005)(82310400002)(5660300002)(7696005)(81166007)(6506007)(26005)(83380400001)(47076004)(82740400003)(2906002)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 06:26:48.9515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 172dba4a-cd3f-4fe2-634c-08d8459b2f63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5763
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

SGkgSnVsaWVuLCBBbmRyZSwgQmVydHJhbmQsDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4g
SXQgdG9vayBtZSBzb21lIHRpbWUgdG8gcmVtb3ZlIHRoZSBkaXNjbGFpbWVyIG1lc3NhZ2UuIA0K
QW5kIHBsZWFzZSBzZWUgbXkgY29tbWVudHMgYmVsb3cgOiApDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bh
cm0uY29tPg0KPiBTZW50OiAyMDIw5bm0OOaciDE45pelIDIxOjQyDQo+IFRvOiBBbmRyZSBQcnp5
d2FyYSA8QW5kcmUuUHJ6eXdhcmFAYXJtLmNvbT4NCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBh
cm0uY29tPjsgWGVuLWRldmVsIDx4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsg
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsNCj4gSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz47IFN0ZXZlIENhcHBlciA8U3RldmUuQ2FwcGVyQGFybS5jb20+
OyBLYWx5DQo+IFhpbiA8S2FseS5YaW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIXSB4ZW4vYXJtOiBNaXNzaW5nIE4xL0E3Ni9BNzUgRlAgcmVnaXN0ZXJz
IGluIHZDUFUNCj4gY29udGV4dCBzd2l0Y2gNCj4gDQo+IA0KPiANCj4gPiBPbiAxOCBBdWcgMjAy
MCwgYXQgMTI6MjIsIEFuZHLDqSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4NCj4g
d3JvdGU6DQo+ID4NCj4gPiBPbiAxOC8wOC8yMDIwIDExOjEzLCBCZXJ0cmFuZCBNYXJxdWlzIHdy
b3RlOg0KPiA+DQo+ID4gSGksDQo+ID4NCj4gPj4+IE9uIDE4IEF1ZyAyMDIwLCBhdCAxMDo0Miwg
QW5kcsOpIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPg0KPiB3cm90ZToNCj4gPj4+
DQo+ID4+PiBPbiAxOC8wOC8yMDIwIDEwOjI1LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPiA+
Pj4NCj4gPj4+IEhpLA0KPiA+Pj4NCj4gPj4+Pj4gT24gMTggQXVnIDIwMjAsIGF0IDEwOjE0LCBB
bmRyw6kgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGFybS5jb20+DQo+IHdyb3RlOg0KPiA+Pj4+
Pg0KPiA+Pj4+PiBPbiAxOC8wOC8yMDIwIDA0OjExLCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+Pj4N
Cj4gPj4+Pj4gSGkgV2VpLA0KPiA+Pj4+Pg0KPiA+Pj4+Pj4gWGVuIGhhcyBjcHVfaGFzX2ZwL2Nw
dV9oYXNfc2ltZCB0byBkZXRlY3Qgd2hldGhlciB0aGUgQ1BVDQo+IHN1cHBvcnRzDQo+ID4+Pj4+
PiBGUC9TSU1EIG9yIG5vdC4gQnV0IGN1cnJlbnRseSwgdGhpcyB0d28gTUFDUk9zIG9ubHkgY29u
c2lkZXIgdmFsdWUNCj4gMA0KPiA+Pj4+Pj4gb2YgSURfQUE2NFBGUjBfRUwxLkZQL1NJTUQgYXMg
RlAvU0lNRCBmZWF0dXJlcyBlbmFibGVkLiBCdXQgZm9yDQo+IENQVXMNCj4gPj4+Pj4+IHRoYXQg
c3VwcG9ydCBGUC9TSU1EIGFuZCBoYWxmLXByZWNpc2lvbiBmbG9hdGluZy1wb2ludCBmZWF0dXJl
cywgdGhlDQo+ID4+Pj4+PiBJRF9BQTY0UEZSMF9FTDEuRlAvU0lNRCBhcmUgMS4gRm9yIHRoZXNl
IENQVXMsIHhlbiB3aWxsIHRyZWF0DQo+IHRoZW0gYXMNCj4gPj4+Pj4+IG5vIEZQL1NJTUQgc3Vw
cG9ydC4gSW4gdGhpcyBjYXNlLCB0aGUgdmZwX3NhdmUvcmVzdG9yZV9zdGF0ZSB3aWxsDQo+IG5v
dA0KPiA+Pj4+Pj4gdGFrZSBlZmZlY3QuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gVW5mb3J0dW5hdGVs
eSwgQ29ydGV4LU4xL0E3Ni9BNzUgYXJlIHRoZSBDUFVzIHN1cHBvcnQgRlAvU0lNRA0KPiBhbmQN
Cj4gPj4+Pj4+IGhhbGYtcHJlY2lzaW9uIGZsb2F0aWluZy1wb2ludC4gVGhlaXIgSURfQUE2NFBG
UjBfRUwxLkZQL1NNSUQgYXJlIDENCj4gPj4+Pj4+IChzZWUgQXJtIEFSTSBEREkwNDg3Ri5iLCBE
MTMuMi42NCkuIEluIHRoaXMgY2FzZSwgb24gTjEvQTc2L0E3NQ0KPiA+Pj4+Pj4gcGxhdGZvcm1z
LCBYZW4gd2lsbCBhbHdheXMgbWlzcyB0aGUgZmxvYXQgcG9pbnRlciByZWdpc3RlcnMNCj4gc2F2
ZS9yZXN0b3JlLg0KPiA+Pj4+Pj4gSWYgZGlmZmVyZW50IHZDUFVzIGFyZSBydW5uaW5nIG9uIHRo
ZSBzYW1lIHBDUFUsIHRoZSBmbG9hdCBwb2ludGVyDQo+ID4+Pj4+PiByZWdpc3RlcnMgd2lsbCBi
ZSBjb3JydXB0ZWQgcmFuZG9tbHkuDQo+ID4+Pj4+DQo+ID4+Pj4+IFRoYXQncyBhIGdvb2QgY2F0
Y2gsIHRoYW5rcyBmb3Igd29ya2luZyB0aGlzIG91dCENCj4gPj4+Pj4NCj4gPj4+Pj4gT25lIHRo
aW5nIGJlbG93Li4uDQo+ID4+Pj4+DQo+ID4+Pj4+PiBUaGlzIHBhdGNoIGZpeGVzIFhlbiBvbiB0
aGVzZSBuZXcgY29yZXMuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIENo
ZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4+Pj4+PiAtLS0NCj4gPj4+Pj4+IHhlbi9pbmNsdWRl
L2FzbS1hcm0vY3B1ZmVhdHVyZS5oIHwgNCArKy0tDQo+ID4+Pj4+PiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IGRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1cmUuaCBiL3hlbi9pbmNsdWRlL2Fz
bS0NCj4gYXJtL2NwdWZlYXR1cmUuaA0KPiA+Pj4+Pj4gaW5kZXggNjc0YmViMDM1My4uNTg4MDg5
ZTVhZSAxMDA2NDQNCj4gPj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVy
ZS5oDQo+ID4+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1cmUuaA0KPiA+
Pj4+Pj4gQEAgLTEzLDggKzEzLDggQEANCj4gPj4+Pj4+ICNkZWZpbmUgY3B1X2hhc19lbDJfNjQg
ICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChlbDIpID49IDEpDQo+ID4+Pj4+PiAjZGVmaW5lIGNwdV9o
YXNfZWwzXzMyICAgIChib290X2NwdV9mZWF0dXJlNjQoZWwzKSA9PSAyKQ0KPiA+Pj4+Pj4gI2Rl
ZmluZSBjcHVfaGFzX2VsM182NCAgICAoYm9vdF9jcHVfZmVhdHVyZTY0KGVsMykgPj0gMSkNCj4g
Pj4+Pj4+IC0jZGVmaW5lIGNwdV9oYXNfZnAgICAgICAgIChib290X2NwdV9mZWF0dXJlNjQoZnAp
ID09IDApDQo+ID4+Pj4+PiAtI2RlZmluZSBjcHVfaGFzX3NpbWQgICAgICAoYm9vdF9jcHVfZmVh
dHVyZTY0KHNpbWQpID09IDApDQo+ID4+Pj4+PiArI2RlZmluZSBjcHVfaGFzX2ZwICAgICAgICAo
Ym9vdF9jcHVfZmVhdHVyZTY0KGZwKSA8PSAxKQ0KPiA+Pj4+Pj4gKyNkZWZpbmUgY3B1X2hhc19z
aW1kICAgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChzaW1kKSA8PSAxKQ0KPiA+Pj4+Pg0KPiA+Pj4+
PiBCdXQgdGhpcyBpcyBvbmx5IGdvb2QgdW50aWwgdGhlIG5leHQgZmVhdHVyZSBidW1wLiBJIHRo
aW5rIHdlIHNob3VsZCBiZQ0KPiA+Pj4+PiBtb3JlIGZ1dHVyZS1wcm9vZiBoZXJlLiBUaGUgYXJj
aGl0ZWN0dXJlIGRlc2NyaWJlcyB0aG9zZSB0d28gZmllbGRzDQo+IGFzDQo+ID4+Pj4+ICJzaWdu
ZWQiWzFdLCBhbmQgZ3VhcmFudGVlcyB0aGF0ICJpZiB2YWx1ZSA+PSAwIiBpcyBhIHZhbGlkIHRl
c3QgZm9yIHRoZQ0KPiA+Pj4+PiBmZWF0dXJlLiBXaGljaCBtZWFucyB3ZSBhcmUgZ29vZCBhcyBs
b25nIGFzIHRoZSBzaWduIGJpdCAoYml0IDMpIGlzDQo+ID4+Pj4+IGNsZWFyLCB3aGljaCB0cmFu
c2xhdGVzIGludG86DQo+ID4+Pj4+ICNkZWZpbmUgY3B1X2hhc19mcCAgICAgICAgKGJvb3RfY3B1
X2ZlYXR1cmU2NChmcCkgPCA4KQ0KPiA+Pj4+PiBTYW1lIGZvciBzaW1kLg0KPiA+Pj4+Pg0KPiA+
Pj4+DQo+ID4+Pj4gV2UgY2Fubm90IHJlYWxseSBiZSBzdXJlIHRoYXQgYSBuZXcgdmVyc2lvbiBp
bnRyb2R1Y2VkIHdpbGwgcmVxdWlyZSB0aGUNCj4gPj4+PiBzYW1lIGNvbnRleHQgc2F2ZS9yZXN0
b3JlIHNvIGl0IG1pZ2h0IGRhbmdlcm91cyB0byBjbGFpbSB3ZSBzdXBwb3J0DQo+ID4+Pj4gc29t
ZXRoaW5nIHdlIGhhdmUgbm8gaWRlYSBhYm91dC4NCj4gPj4+DQo+ID4+PiBJIGFtIHByZXR0eSBz
dXJlIHdlIGNhbiwgYmVjYXVzZSB0aGlzIGlzIHdoYXQgdGhlIEZQIGZlYXR1cmUgZGVzY3JpYmVz
Lg0KPiA+Pj4gSWYgYSBmZWF0dXJlIGJ1bXAgd291bGQgaW50cm9kdWNlIGEgbGFyZ2VyIHN0YXRl
IHRvIGJlIHNhdmVkIGFuZA0KPiA+Pj4gcmVzdG9yZWQsIHRoYXQgd291bGQgYmUgY292ZXJlZCBi
eSBhIG5ldyBmaWVsZCwgbG9vayBhdCBBZHZTSU1EIGFuZA0KPiBTVkUNCj4gPj4+IGZvciBleGFt
cGxlcy4NCj4gPj4+IFRoZSBmZWF0dXJlIG51bWJlciB3b3VsZCBvbmx5IGJlIGJ1bXBlZCBpZiBp
dCdzIGNvbXBhdGlibGU6DQo+ID4+PiA9PT09PT09PT09PT09PT09PT09PQ0KPiA+Pj4gwrcgVGhl
IGZpZWxkIGhvbGRzIGEgc2lnbmVkIHZhbHVlLg0KPiA+Pj4gwrcgVGhlIGZpZWxkIHZhbHVlIDB4
RiBpbmRpY2F0ZXMgdGhhdCB0aGUgZmVhdHVyZSBpcyBub3QgaW1wbGVtZW50ZWQuDQo+ID4+PiDC
tyBUaGUgZmllbGQgdmFsdWUgMHgwIGluZGljYXRlcyB0aGF0IHRoZSBmZWF0dXJlIGlzIGltcGxl
bWVudGVkLg0KPiA+Pj4gwrcgU29mdHdhcmUgdGhhdCBkZXBlbmRzIG9uIHRoZSBmZWF0dXJlIGNh
biB1c2UgdGhlIHRlc3Q6DQo+ID4+PiAgICAgaWYgdmFsdWUgPj0gMCB7ICAvLyBTb2Z0d2FyZSBm
ZWF0dXJlcyB0aGF0IGRlcGVuZCBvbiB0aGUgcHJlc2VuY2UNCj4gPj4+IG9mIHRoZSBoYXJkd2Fy
ZSBmZWF0dXJlIH0NCj4gPj4+ID09PT09PT09PT09PT09PT09PT09DQo+ID4+PiAoQVJNdjggQVJN
IEQxMy4xLjMpDQo+ID4+Pg0KPiA+Pj4gQW5kIHRoaXMgaXMgaG93IExpbnV4IGhhbmRsZXMgdGhp
cy4NCj4gPj4NCj4gPj4gVGhlbiBjaGFuZ2luZyB0aGUgY29kZSB0byB1c2UgPDggc2hvdWxkIGJl
IG9rLg0KPiA+DQo+ID4gVGhhbmtzLiBBbm90aGVyIGFuZ2xlIHRvIGxvb2sgYXQgdGhpczoNCj4g
PiBVc2luZyAiPCA4IiB3aWxsIG5ldmVyIGJlIHdvcnNlIHRoYW4gIjw9IDEiLCBzaW5jZSB3ZSBv
bmx5IGRlcml2ZSB0aGUNCj4gPiBleGlzdGVuY2Ugb2YgdGhlIGZsb2F0aW5nIHBvaW50IHJlZ2lz
dGVycyBmcm9tIGl0LiBUaGUgbW9tZW50IHdlIHNlZSBhIDINCj4gPiBpbiB0aGlzIHJlZ2lzdGVy
IGZpZWxkLCB0aGUgIjw9IDEiIHdvdWxkIGRlZmluaXRlbHkgZmFpbCB0byBzYXZlL3Jlc3RvcmUN
Cj4gPiB0aGUgRlAgcmVnaXN0ZXJzIGFnYWluLiBCdXQgdGhlIEFSTSBBUk0gZ3VhcmFudGVlcyB0
aGF0IHRob3NlIHJlZ2lzdGVycw0KPiA+IGFyZSBzdGlsbCBhcm91bmQgKHNpbmNlICJ2YWx1ZSA+
PSAwIiBoaXRzLCBzbyB0aGUgZmVhdHVyZSBpcyBwcmVzZW50LCBhcw0KPiA+IHNob3duIGFib3Zl
KS4NCj4gPiBUaGUgdGhlb3JldGljYWwgd29yc3QgY2FzZSB3aXRoICI8IDgiIHdvdWxkIGJlIHRo
YXQgaXQgd291bGQgbm90IGNvdmVyDQo+ID4gKmVub3VnaCogc3RhdGUsIGJ1dCBhcyBkZXNjcmli
ZWQgYWJvdmUgdGhpcyB3aWxsIG5ldmVyIGhhcHBlbiwgd2l0aCB0aGlzDQo+ID4gcGFydGljdWxh
ciBGUC9TSU1EIGZpZWxkLg0KPiANCj4gV2UgY291bGQgYWxzbyBpc3N1ZSBhIHdhcm5pbmcgZm9y
IGEg4oCcbm9uIHN1cHBvcnRlZCBGUC9TSU1E4oCdIGlmIHNvbWV0aGluZw0KPiBlbHNlIHRoZW4g
MCBvciAxIHNob3dzIHVwIHNvIHRoYXQgYXQgbGVhc3QgaXQgZG9lcyBub3QgcGFzc3Rocm91Z2gg
d2l0aG91dA0KPiBiZWluZyBub3RpY2VkLg0KPiANCg0KSSB0aGluayB3ZSBoYXZlIG1hZGUgdXAg
dGhlIGFncmVlbWVudCB0byB1c2UgIjwgOCIgaW4gdGhlc2UgTUFDUk9zIDogKQ0KVGhlIHJlc2V0
IGlzIHRoYXQgc2hhbGwgd2UgbmVlZCB0byB0aHJvdyBhbnkgaW5mb3JtYXRpb24gdG8gbm90aWNl
L3dhcm4NCnVzZXIgdGhhdCB3ZSBkZXRlY3RlZCBhIGZlYXR1cmUgd2UgaGF2ZW4ndCBtZXQgYmVm
b3JlLiBJbiBteSBvcGluaW9uLA0KSSBhZ3JlZSB3aXRoIEJlcnRyYW5kLCB3ZSBzaGFsbCBnaXZl
IHNvbWUgbWVzc2FnZS4NCg0KUXVvdGUgZnJvbSBBcm0gQVJNOg0KRm9yIGEgZmllbGQgZGVzY3Jp
YmluZyBzb21lIGNsYXNzIG9mIGZ1bmN0aW9uYWxpdHk6DQrigKIgVGhlIHZhbHVlIDB4MSB3YXMg
ZGVmaW5lZCBhcyBpbmRpY2F0aW5nIHRoYXQgaXRlbSBBIGlzIHByZXNlbnQuDQrigKIgVGhlIHZh
bHVlIDB4MiB3YXMgZGVmaW5lZCBhcyBpbmRpY2F0aW5nIHRoYXQgaXRlbXMgQiBhbmQgQyBhcmUg
cHJlc2VudCwgaW4gYWRkaXRpb24gdG8gaXRlbSBBDQoNCklmIHRoZXJlIGlzIGEgdmFsdWUgMHgz
IGJ1bXBlZCBpbiB0aGUgZnV0dXJlLCBpbmRpY2F0ZXMgRCBpcyBwcmVzZW50LiBCZWNhdXNlIG9m
ICI8IDgiLCB3aGF0IHhlbg0KSGFzIGRvbmUgZm9yIEEvQi9DIGNhbiBhbHNvIHRha2UgZWZmZWN0
IGZvciAweDMuIEJ1dCB3aGF0IFhlbiBkb25lIGZvciBBL0IvQyBtYXkgbm90IGFsd2F5cw0KY292
ZXIgRCByZXF1aXJlZC4gSW4gdGhpcyBjYXNlLCBJIHRoaW5rIGl0IHZhbHVhYmxlIHRvIHBvcCBz
b21lIHdhcm5pbmcgbWVzc2FnZSBmb3IgWGVuIGtub3duDQpGUC9TSU1EIHZhbHVlcy4gDQoNCj4g
Q2hlZXJzDQo+IEJlcnRyYW5kDQo+IA0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+IEFuZHJlDQo+ID4N
Cj4gPj4+PiBJIGFncmVlIHRob3VnaCBhYm91dCB0aGUgYW5hbHlzaXMgb24gdGhlIGZhY3QgdGhh
dCB2YWx1ZXMgdW5kZXIgOCBzaG91bGQNCj4gPj4+PiBiZSB2YWxpZCBidXQgb25seSAwIGFuZCAx
IGN1cnJlbnRseSBleGlzdCBbMV0sIG90aGVyIHZhbHVlcyBhcmUgcmVzZXJ2ZWQuDQo+ID4+Pj4N
Cj4gPj4+PiBTbyBJIHdvdWxkIHZvdGUgdG8ga2VlcCB0aGUgMSBmb3Igbm93IHRoZXJlLg0KPiA+
Pj4+DQo+ID4+Pj4gQ2hlZXJzDQo+ID4+Pj4gQmVydHJhbmQNCj4gPj4+Pg0KPiA+Pj4+IFsxXSBo
dHRwczovL2RldmVsb3Blci5hcm0uY29tL2RvY3MvZGRpMDU5NS9oL2FhcmNoNjQtc3lzdGVtLQ0K
PiByZWdpc3RlcnMvaWRfYWE2NHBmcjBfZWwxDQo+IA0KDQo=

