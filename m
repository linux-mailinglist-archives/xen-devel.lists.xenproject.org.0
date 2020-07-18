Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75285224A77
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 11:56:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwjZY-0001NZ-QH; Sat, 18 Jul 2020 09:56:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMbn=A5=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jwjZY-0001NU-2f
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 09:56:00 +0000
X-Inumbo-ID: e109176c-c8dc-11ea-9718-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.51]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e109176c-c8dc-11ea-9718-12813bfff9fa;
 Sat, 18 Jul 2020 09:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WY/TSg6DlnEj3Nv0jz4q3YEU60b+O33VE7wWj0RRGC0=;
 b=eHeu1ahpsnqZH5EHKC0CcOstTauIejVBG/ZWFhYhU2b2hyhw5IK1sCbZg43kq4c+3A6dvWUN/4lLg/9VIVmBMTHTldi0oib8FiQgmJz1Ppy7A+sXInuFb/eAbTsUKbQ6ox3GOF6UZiYAVNhVmY2dZgohBqYX3ovc29xCCsj5CqI=
Received: from AM5PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:206:1::40)
 by VI1PR0802MB2302.eurprd08.prod.outlook.com (2603:10a6:800:9e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Sat, 18 Jul
 2020 09:55:55 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::bc) by AM5PR04CA0027.outlook.office365.com
 (2603:10a6:206:1::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Sat, 18 Jul 2020 09:55:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Sat, 18 Jul 2020 09:55:55 +0000
Received: ("Tessian outbound 8f45de5545d6:v62");
 Sat, 18 Jul 2020 09:55:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 245270a263ebef62
X-CR-MTA-TID: 64aa7808
Received: from 1b3cd3d2aaca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77C8CFFF-41B6-4FC9-89E4-AC1DD17CD3D3.1; 
 Sat, 18 Jul 2020 09:55:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1b3cd3d2aaca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 18 Jul 2020 09:55:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBfuo87swT6+wZQb+I9M03YQz0bQF43HBoNcunK74OHIr7nUAWDEM+CbhrJ1Kv+AcLOamnmG9PhHtGUVyom7h2Jkq4nmLZiKNcprn4RHf7UKVCb2zsLGWz4gnPv+51SpcZwuaLU+yLNv3mB8gh4BPKXq5AxFNxSYmvDC0TnZqV/aYbhoxSSLVybxOFzOmgcyPgBE5ftHH1bu4ducRNNwGzF7luUMzvYYELkBZlP37QoTU1rFUQQHVpSk7PuzbFIhqV5UJ+wLtVIPLQex6Cg/dS16yT2Dq5THpoJ0xwJM9RgsT/2k+FxMvR0nEiOyLl2eby0o7wfQj6fNPWyAfyMYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WY/TSg6DlnEj3Nv0jz4q3YEU60b+O33VE7wWj0RRGC0=;
 b=jsd58WcT/TnKk/7pzbJJcTe1J+N7JvUBDf70kFPJ1Bg/DWWeWTmCH1azOcckxtPi5HUtSXBH7aE2bYW2mHVqp6KkNl4KjbDbnemIoIQziDIJa7ywURZ0I1Ku1kh8mpb48PPTdCb61p4Meu+TWLwEtjWChnWeJDN9TFOEnoldWQcW5uOlYj9sw2fnPwsssHyBtS2VkUyW15sNZpERKHvVQ237QXjKxnlKRqkfpp4vMJErSa/HwE3xdct+sdWJpQiOGZgtuRhLTpXst/eXzd8e4Cq5DSBRYLnCNlP00O9PRF20Z3y4lLQwE2AUIRmh3vbYm6wX9N9N7D1B2ua5ymBcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WY/TSg6DlnEj3Nv0jz4q3YEU60b+O33VE7wWj0RRGC0=;
 b=eHeu1ahpsnqZH5EHKC0CcOstTauIejVBG/ZWFhYhU2b2hyhw5IK1sCbZg43kq4c+3A6dvWUN/4lLg/9VIVmBMTHTldi0oib8FiQgmJz1Ppy7A+sXInuFb/eAbTsUKbQ6ox3GOF6UZiYAVNhVmY2dZgohBqYX3ovc29xCCsj5CqI=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB3684.eurprd08.prod.outlook.com (2603:10a6:208:106::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Sat, 18 Jul
 2020 09:55:42 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::b572:771:2750:14ed]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::b572:771:2750:14ed%5]) with mapi id 15.20.3174.029; Sat, 18 Jul 2020
 09:55:42 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: PCI devices passthrough on Arm design proposal
Thread-Topic: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkLzBPIgAAPUACAAArWgIAABdaAgAAFJgCAASrpgA==
Date: Sat, 18 Jul 2020 09:55:42 +0000
Message-ID: <C86FE34B-4587-4895-8001-D8CD3F9D44F0@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <8ac91a1b-e6b3-0f2b-0f23-d7aff100936d@xen.org>
 <c7d5a084-8111-9f43-57e1-bcf2bd822f5b@xen.org>
 <865D5A77-85D4-4A88-A228-DDB70BDB3691@arm.com>
 <972c0c81-6595-7c41-baa5-8882f5d1c0ff@xen.org>
 <4E6B793C-2E0A-4999-9842-24CDCDE43903@arm.com>
 <20200717160550.GZ7191@Air-de-Roger>
In-Reply-To: <20200717160550.GZ7191@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2a01:e0a:13:6f10:f1a2:5155:728:f8e7]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: da20b6bc-fc19-48bf-ade8-08d82b00c39f
x-ms-traffictypediagnostic: AM0PR08MB3684:|VI1PR0802MB2302:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB230242AE2A314A49D44F0C299D7D0@VI1PR0802MB2302.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: FT2wY3yl9rQYX8dYeo6fD0/m3BftBLiSBjHPfMp3XsAFM12y03sN06P8cbUMZK+loUls0l+YBWmUn42equH3ll0GjygG3tDxVWg8HHu48xm4sAv01DCIj05wqVbesLlgQM/SrwNxLbpVJT5Hdyeb9R8eprOo0gKiouaq/bN8dN69Jd2jGwXuLvp2LyUI9JOGs/Bpx/mJE4i+jV8EsrH53nkmAGk861ux93Hsxs/9D988zKCrkWT25tV2co3lFfzJolkZVNEA5cj6W1UqE23Pch4k0N/B5Kllw7qWYl4V7OZQcI7tzYeGB4lkexl9/egF
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3682.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(66946007)(86362001)(66476007)(64756008)(76116006)(53546011)(66446008)(6486002)(6916009)(66556008)(6506007)(91956017)(478600001)(36756003)(2906002)(2616005)(8936002)(4326008)(33656002)(5660300002)(71200400001)(8676002)(186003)(316002)(6512007)(83380400001)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: a2+yHcVBjSPQbCAOp2IviaXLY+49nJHjfMa8PY86LuIjNiDS7o6eZy9tmkm6ja2k2HvklZByxHzwOJRgCn5ukUgOV7IeY6zQIUK6PT1XdkhTpBSSUsMQSzu6xmjIj2Ikb2kJ+KF4nx8G92zF4bdF1AnxKbiPxIhJ/5KSMupp3xfAFSS4t0Jio7aTx+v3nJ8X4wdNFks0R6vKZl0IpYpvjqVOSnrM/+dhqhfpzAkUuJmv5fOYgUcxSA5d/tzrlv7gTRQiuarWKZnphafLSDDwTh4E0Y+k4l2YeeTLbRLIvbi59b6yC7ka7uKApa70huG9s40ROLamBlWAHRZ4ws5PBbUHpNzhZOHWigJMMhFCNsFf7JyWUVSMh64GSgnKIyRyJyj8qn1t+gN7gdYF10WXZg25+hqV3yA2gwBf2pCK1pefUXmqCv8LZGaof806px47KCOAzPiC6WFYLiJ01blm2CE+cy/mRr8v8JIWt0tda7spfzmiGfxgqQzQyv2CAOj9JFFyMDbUlL7zre6dazA97ZCZ1jcCUXeR0Ecrxw+cOXo=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AEBCB336CEFEE45A49AD395B592D244@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3684
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966005)(2906002)(47076004)(26005)(54906003)(186003)(6862004)(316002)(82740400003)(53546011)(86362001)(36906005)(336012)(70206006)(107886003)(70586007)(4326008)(2616005)(6506007)(356005)(8936002)(36756003)(81166007)(6486002)(33656002)(478600001)(8676002)(5660300002)(83380400001)(82310400002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 34e427be-faad-4cdf-25f1-08d82b00bbc8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cHnRDfy+jj4em55tVRv/WOsX0NHhhsz4mOHGGa0V7On5RxVp9lei8Qi7k4kobjzVjjZJbaJwQGVBdGS07CLUzPrKiKtqy2ViW654hzTeq7Iv4zOqXGPNPgAuv2vNFa8v4euQ621+WDgGIMBr+uPal0kuKJPFdsF77/Nn6KwhoZYarL8kosFAkCR/2NG0ceVwIh7ctahLRRkpCTLXZbUcP4bsfb/4qDbCXVftnkmDS+5zGR0joF39buVlgobY3hJ8oAMn6vDEJhDhra4rZTEcjG5IAD7wMUCvlk3ddhKGisU+1KkMviYxWI4ovQN+EpmbWKP43rJ0kODalpBybIGOqcYbs+sujbsDMRnNBboKMJkIppwgsDwt4ZSEU3PtEsF+EMPbjsICDoIBWhhYz+OFJQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2020 09:55:55.4371 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da20b6bc-fc19-48bf-ade8-08d82b00c39f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2302
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
Cc: Rahul Singh <Rahul.Singh@arm.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTcgSnVsIDIwMjAsIGF0IDE4OjA1LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEp1bCAxNywgMjAyMCBhdCAwMzo0
NzoyNVBNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+IE9uIDE3IEp1bCAyMDIw
LCBhdCAxNzoyNiwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gT24g
MTcvMDcvMjAyMCAxNTo0NywgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4gKiBEb20w
TGVzcyBpbXBsZW1lbnRhdGlvbiB3aWxsIHJlcXVpcmUgdG8gaGF2ZSB0aGUgY2FwYWNpdHkgaW5z
aWRlIFhlbiB0byBkaXNjb3ZlciB0aGUgUENJIGRldmljZXMgKHdpdGhvdXQgZGVwZW5kaW5nIG9u
IERvbTAgdG8gZGVjbGFyZSB0aGVtIHRvIFhlbikuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiAjIEVuYWJs
ZSB0aGUgZXhpc3RpbmcgeDg2IHZpcnR1YWwgUENJIHN1cHBvcnQgZm9yIEFSTToNCj4+Pj4+Pj4g
DQo+Pj4+Pj4+IFRoZSBleGlzdGluZyBWUENJIHN1cHBvcnQgYXZhaWxhYmxlIGZvciBYODYgaXMg
YWRhcHRlZCBmb3IgQXJtLiBXaGVuIHRoZSBkZXZpY2UgaXMgYWRkZWQgdG8gWEVOIHZpYSB0aGUg
aHlwZXIgY2FsbCDigJxQSFlTREVWT1BfcGNpX2RldmljZV9hZGTigJ0sIFZQQ0kgaGFuZGxlciBm
b3IgdGhlIGNvbmZpZyBzcGFjZSBhY2Nlc3MgaXMgYWRkZWQgdG8gdGhlIFBDSSBkZXZpY2UgdG8g
ZW11bGF0ZSB0aGUgUENJIGRldmljZXMuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBBIE1NSU8gdHJhcCBo
YW5kbGVyIGZvciB0aGUgUENJIEVDQU0gc3BhY2UgaXMgcmVnaXN0ZXJlZCBpbiBYRU4gc28gdGhh
dCB3aGVuIGd1ZXN0IGlzIHRyeWluZyB0byBhY2Nlc3MgdGhlIFBDSSBjb25maWcgc3BhY2UsIFhF
TiB3aWxsIHRyYXAgdGhlIGFjY2VzcyBhbmQgZW11bGF0ZSByZWFkL3dyaXRlIHVzaW5nIHRoZSBW
UENJIGFuZCBub3QgdGhlIHJlYWwgUENJIGhhcmR3YXJlLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gTGlt
aXRhdGlvbjoNCj4+Pj4+Pj4gKiBObyBoYW5kbGVyIGlzIHJlZ2lzdGVyIGZvciB0aGUgTVNJIGNv
bmZpZ3VyYXRpb24uDQo+Pj4+Pj4+ICogT25seSBsZWdhY3kgaW50ZXJydXB0IGlzIHN1cHBvcnRl
ZCBhbmQgdGVzdGVkIGFzIG9mIG5vdywgTVNJIGlzIG5vdCBpbXBsZW1lbnRlZCBhbmQgdGVzdGVk
Lg0KPj4+Pj4+IElJUkMsIGxlZ2FjeSBpbnRlcnJ1cHQgbWF5IGJlIHNoYXJlZCBiZXR3ZWVuIHR3
byBQQ0kgZGV2aWNlcy4gSG93IGRvIHlvdSBwbGFuIHRvIGhhbmRsZSB0aGlzIG9uIEFybT8NCj4+
Pj4gV2UgcGxhbiB0byBmaXggdGhpcyBieSBhZGRpbmcgcHJvcGVyIHN1cHBvcnQgZm9yIE1TSSBp
biB0aGUgbG9uZyB0ZXJtLg0KPj4+PiBGb3IgdGhlIHVzZSBjYXNlIHdoZXJlIE1TSSBpcyBub3Qg
c3VwcG9ydGVkIG9yIG5vdCB3YW50ZWQgd2UgbWlnaHQgaGF2ZSB0byBmaW5kIGEgd2F5IHRvIGZv
cndhcmQgdGhlIGhhcmR3YXJlIGludGVycnVwdCB0byBzZXZlcmFsIGd1ZXN0cyB0byBlbXVsYXRl
IHNvbWUga2luZCBvZiBzaGFyZWQgaW50ZXJydXB0Lg0KPj4+IA0KPj4+IFNoYXJpbmcgaW50ZXJy
dXB0cyBhcmUgYSBiaXQgcGFpbiBiZWNhdXNlIHlvdSBjb3VsZG4ndCB0YWtlIGFkdmFudGFnZSBv
ZiB0aGUgZGlyZWN0IEVPSSBpbiBIVyBhbmQgaGF2ZSB0byBiZSBjYXJlZnVsIGlmIG9uZSBndWVz
dCBkb2Vzbid0IEVPSSBpbiB0aW1lbHkgbWFuZWVyLg0KPj4+IA0KPj4+IFRoaXMgaXMgc29tZXRo
aW5nIEkgd291bGQgcmF0aGVyIGF2b2lkIHVubGVzcyB0aGVyZSBpcyBhIHJlYWwgdXNlIGNhc2Ug
Zm9yIGl0Lg0KPj4gDQo+PiBJIHdvdWxkIGV4cGVjdCB0aGF0IG1vc3QgcmVjZW50IGhhcmR3YXJl
IHdpbGwgc3VwcG9ydCBNU0kgYW5kIHRoaXMNCj4+IHdpbGwgbm90IGJlIG5lZWRlZC4NCj4gDQo+
IFdlbGwsIFBDSSBFeHByZXNzIG1hbmRhdGVzIE1TSSBzdXBwb3J0LCBzbyB3aGlsZSB0aGlzIGlz
IGp1c3QgYSBzcGVjLA0KPiBJIHdvdWxkIGV4cGVjdCBtb3N0IChpZiBub3QgYWxsKSBkZXZpY2Vz
IHRvIHN1cHBvcnQgTVNJIChvciBNU0ktWCksIGFzDQo+IEFybSBwbGF0Zm9ybXMgaGF2ZW4ndCBp
bXBsZW1lbnRlZCBsZWdhY3kgUENJIGFueXdheS4NCg0KWWVzIHRoYXTigJlzIG91ciBhc3N1bXB0
aW9uIHRvLiBCdXQgd2UgaGF2ZSB0byBzdGFydCBzb21ld2hlcmUgc28gTVNJIGlzDQpwbGFubmVk
IGJ1dCBpbiBhIGZ1dHVyZSBzdGVwLiBJIHdvdWxkIHRoaW5rIHRoYXQgc3VwcG9ydGluZyBub24g
TVNJIGlmIG5vdA0KaW1wb3NzaWJsZSB3aWxsIGJlIGEgbG90IG1vcmUgY29tcGxleCBkdWUgdG8g
dGhlIGludGVycnVwdCBzaGFyaW5nLg0KSSBkbyB0aGluayB0aGF0IG5vdCBzdXBwb3J0aW5nIG5v
biBNU0kgc2hvdWxkIGJlIG9rIG9uIEFybS4NCg0KPiANCj4+IFdoZW4gTVNJIGlzIG5vdCB1c2Vk
LCB0aGUgb25seSBzb2x1dGlvbiB3b3VsZCBiZSB0byBlbmZvcmNlIHRoYXQNCj4+IGRldmljZXMg
YXNzaWduZWQgdG8gZGlmZmVyZW50IGd1ZXN0IGFyZSB1c2luZyBkaWZmZXJlbnQgaW50ZXJydXB0
cw0KPj4gd2hpY2ggd291bGQgbGltaXQgdGhlIG51bWJlciBvZiBkb21haW5zIGJlaW5nIGFibGUg
dG8gdXNlIFBDSQ0KPj4gZGV2aWNlcyBvbiBhIGJ1cyB0byA0IChpZiB0aGUgZW51bWVyYXRpb24g
Y2FuIGJlIG1vZGlmaWVkIGNvcnJlY3RseQ0KPj4gdG8gYXNzaWduIHRoZSBpbnRlcnJ1cHRzIHBy
b3Blcmx5KS4NCj4+IA0KPj4gSWYgd2UgYWxsIGFncmVlIHRoYXQgdGhpcyBpcyBhbiBhY2NlcHRh
YmxlIGxpbWl0YXRpb24gdGhlbiB3ZSB3b3VsZA0KPj4gbm90IG5lZWQgdGhlIOKAnGludGVycnVw
dCBzaGFyaW5n4oCdLg0KPiANCj4gSSBtaWdodCBiZSBlYXNpZXIgdG8gc3RhcnQgYnkganVzdCBz
dXBwb3J0aW5nIGRldmljZXMgdGhhdCBoYXZlIE1TSQ0KPiAob3IgTVNJLVgpIGFuZCB0aGVuIG1v
dmUgdG8gbGVnYWN5IGludGVycnVwdHMgaWYgcmVxdWlyZWQ/DQoNCk1TSSBzdXBwb3J0IHJlcXVp
cmVzIGFsc28gc29tZSBzdXBwb3J0IGluIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciBwYXJ0DQpv
biBhcm0uIFNvIHRoZXJlIGlzIHNvbWUgd29yayB0byBhY2hpZXZlIHRoYXQuDQoNCj4gDQo+IFlv
dSBzaG91bGQgaGF2ZSBtb3N0IG9mIHRoZSBwaWVjZXMgeW91IHJlcXVpcmUgYWxyZWFkeSBpbXBs
ZW1lbnRlZA0KPiBzaW5jZSB0aGF0J3Mgd2hhdCB4ODYgdXNlcywgYW5kIGhlbmNlIGNvdWxkIHJl
dXNlIGFsbW9zdCBhbGwgb2YgaXQ/DQoNCkluc2lkZSBQQ0kgcHJvYmFibHkgYnV0IHRoZSBHSUMg
cGFydCB3aWxsIHJlcXVpcmUgc29tZSB3b3JrLg0KDQo+IA0KPiBJSVJDIEp1bGllbiBldmVuIHNh
aWQgdGhhdCBBcm0gd2FzIGxpa2VseSB0byByZXF1aXJlIG11Y2ggbGVzcyB0cmFwcw0KPiB0aGFu
IHg4NiBmb3IgYWNjZXNzZXMgdG8gTVNJIGFuZCBNU0ktWCBzaW5jZSB5b3UgY291bGQgYWxsb3cg
dW50cnVzdGVkDQo+IGd1ZXN0cyB0byB3cml0ZSBkaXJlY3RseSB0byB0aGUgcmVnaXN0ZXJzIGFz
IHRoZXJlJ3MgYW5vdGhlciBwaWVjZSBvZg0KPiBoYXJkd2FyZSB0aGF0IHdvdWxkIGFscmVhZHkg
dHJhbnNsYXRlIHRoZSBpbnRlcnJ1cHRzPw0KDQpZZXMgdGhpcyBpcyBkZWZpbml0ZWx5IHRoZSBj
YXNlLiBUaGUgSVRTIHBhcnQgb2YgdGhlIEdJQyBpbnRlcnJ1cHQgY29udHJvbGxlcg0Kd2lsbCBo
ZWxwIGEgbG90IGFuZCByZWR1Y2UgdGhlIG51bWJlciBvZiB0cmFwcy4NCg0KPiANCj4gSSB0aGlu
ayBpdCdzIGZpbmUgdG8gdXNlIHRoaXMgd29ya2Fyb3VuZCB3aGlsZSB5b3UgZG9uJ3QgaGF2ZSBN
U0kNCj4gc3VwcG9ydCBpbiBvcmRlciB0byBzdGFydCB0ZXN0aW5nIGFuZCB1cHN0cmVhbWluZyBz
dHVmZiwgYnV0IG1heWJlDQo+IHRoYXQgc2hvdWxkbid0IGJlIGNvbW1pdHRlZD8NCg0KVGhhdCB3
YXMgZGVmaW5pdGVseSBub3Qgb3VyIHBsYW4gdG8gY29tbWl0IHRoZSBjb2RlIHdpdGhvdXQgTVNJ
Lg0KQnV0IGFzIHJlcXVlc3RlZCBkdXJpbmcgdGhlIFhlbiBTdW1taXQsIHdlIHRyeSB0byBwdWJs
aXNoIHNvbWUgY29kZQ0KZm9yIGFuIFJGQyBhbmQgYSBkZXNpZ24gZWFybHkgdG8gZ2V0IGNvbW1l
bnQgZnJvbSB0aGUgY29tbXVuaXR5IGFuZA0Kd2UgdHJ5IHRvIGRvIHRoYXQgd2l0aCBzb21ldGhp
bmcgd29ya2luZywgZXZlbiBwYXJ0aWFsbHkgYW5kIHdpdGggbG90cyBvZg0KbGltaXRhdGlvbnMu
DQoNCkJlcnRyYW5kDQoNCg==

