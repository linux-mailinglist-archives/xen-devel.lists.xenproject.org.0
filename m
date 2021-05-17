Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB57538247C
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 08:38:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128045.240470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liWtQ-00084F-AM; Mon, 17 May 2021 06:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128045.240470; Mon, 17 May 2021 06:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liWtQ-00081t-6I; Mon, 17 May 2021 06:38:20 +0000
Received: by outflank-mailman (input) for mailman id 128045;
 Mon, 17 May 2021 06:38:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+8Xj=KM=arm.com=henry.wang@srs-us1.protection.inumbo.net>)
 id 1liWtP-00081m-0F
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 06:38:19 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::609])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff0bc462-95e1-48ac-9603-2426e63be582;
 Mon, 17 May 2021 06:38:15 +0000 (UTC)
Received: from DB6PR0501CA0030.eurprd05.prod.outlook.com (2603:10a6:4:67::16)
 by DB6PR0801MB1909.eurprd08.prod.outlook.com (2603:10a6:4:72::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 06:38:12 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::1f) by DB6PR0501CA0030.outlook.office365.com
 (2603:10a6:4:67::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Mon, 17 May 2021 06:38:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 17 May 2021 06:38:12 +0000
Received: ("Tessian outbound 1e34f83e4964:v91");
 Mon, 17 May 2021 06:38:12 +0000
Received: from 7391579a5213.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F4469669-9969-47EB-BFAF-6E39D6A32153.1; 
 Mon, 17 May 2021 06:38:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7391579a5213.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 May 2021 06:38:06 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by PA4PR08MB6064.eurprd08.prod.outlook.com (2603:10a6:102:e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 06:38:05 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad%3]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:38:05 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ff0bc462-95e1-48ac-9603-2426e63be582
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdVtVJ+9fSc+lGKAXBgShaRNGr2ufhmlajbFBoKDwZA=;
 b=8/giHiCPUc8p+qLimNTdW2XWo/daG0rwQWBzlQFcJAQTV/4Y2Hkkuq6cxhN0HUYXcxI+cejTs+sM9C7ozPOJg75WjPSaaTcMIGSu/5CH4cfMfFnloE8vh1/AchHkeRSZ5KYWC1ZW4s2AIXwnWl/QkWg3r4aJQ5gY0igIdwjAyX8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TM5Mv1nLuPDOyq99HJQHCH5uzzG/SwS2I/ZiV4G5uyijcyZT+WLJRlJQI8PPtJyKh7zK+LPtRfuTHRyGKbAVBqspYTtB+hhhKaefa2LbDu9vh1PIaWlXPvYdYQBmr+uoPVO/bTMBX7hswdeKb25q39IpLpGTciVm5qU2G6djxKuGWbcQl7EbNLYxHniczzy3ChjSdSdl4zHfrRcoimxNJk+337BqjSB5tSn8ZDFGA4NWsMeZB+0u3Gxw7huv5j2h2o/qsetP4Z7d5N784mdWOqPqoUy4uDthytRD8s+5ALZ9wyq7Ud2PwtOiKhQGnYr123u5DyZfjKPByLhOzkxqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdVtVJ+9fSc+lGKAXBgShaRNGr2ufhmlajbFBoKDwZA=;
 b=lxsC34kjeIDwQE00tM3unUdU2W+EpkU8lnO2ujJKIveVHKOOUZA0PVI2IoOTKLW2OKNP/SyiAc6sXOKSSGxxGOjgIRxvV8wo7hcHQjlPKuv3msY8AEBAkgRaYr5UDPCEDdk1AgpDXypDdtghl4o8t69/0cl3DXBLZ5u8NH/cuMwe0J9tmx7WxVnldNZwtqZXQN7cXa9ZxHMxSR/ud35LfkqTHovd09NSbe1XECBydD+aS4xft4D0o2ibzgn+959GpdU8wWF8HCfeB+LA8hWAZbp0LY8d8AR5FpFfAkIWApmMDYsBVU4+bGoQ4uRVeyeQuM9B34VHCt18d1A6E5NBUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdVtVJ+9fSc+lGKAXBgShaRNGr2ufhmlajbFBoKDwZA=;
 b=8/giHiCPUc8p+qLimNTdW2XWo/daG0rwQWBzlQFcJAQTV/4Y2Hkkuq6cxhN0HUYXcxI+cejTs+sM9C7ozPOJg75WjPSaaTcMIGSu/5CH4cfMfFnloE8vh1/AchHkeRSZ5KYWC1ZW4s2AIXwnWl/QkWg3r4aJQ5gY0igIdwjAyX8=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: RE: Discussion of Xenheap problems on AArch64
Thread-Topic: Discussion of Xenheap problems on AArch64
Thread-Index:
 Adc2dyA8lkZGRqbyRiSglHolanVkwQAFhaqAAACgy/AA4CfqgABHcHyAADhcqlAABznSAAGrycWAALiGZgAAEDKF4ACJdUUAABHcYPAAVJTsgABJ8qkw
Date: Mon, 17 May 2021 06:38:05 +0000
Message-ID:
 <PA4PR08MB6253AB1B1286086E4EDE60A2922D9@PA4PR08MB6253.eurprd08.prod.outlook.com>
References:
 <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
 <PA4PR08MB62538BBA256E66A0415F0C7192479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <f14aa1d6-35d2-a9a3-0672-7f0d3ae3ec89@xen.org>
 <PA4PR08MB62534C4130B59CAA9A8A8BF792419@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <PA4PR08MB6253FBC7F5E690DB74F2E11F92409@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <2a65b8c0-fccc-2ccc-f736-7f3f666e84d1@xen.org>
 <PA4PR08MB62537A958107CD234831E0B892579@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <ba649865-410b-e1be-39a3-c4cac802f464@xen.org>
 <PA4PR08MB6253F85E184CA51BDB99786992539@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <ba1bc084-5a5b-1410-acba-33bfca7c4f6a@xen.org>
 <PA4PR08MB6253E95579D8277D7FD1BE9A92509@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <7247122c-127d-705c-78a5-7f9460f5821a@xen.org>
In-Reply-To: <7247122c-127d-705c-78a5-7f9460f5821a@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C1F9BDF1B6D2F84DB05CB25F5DBE09BA.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.112]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ef257bcc-0f14-4320-c309-08d918fe57d5
x-ms-traffictypediagnostic: PA4PR08MB6064:|DB6PR0801MB1909:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1909B15A7C8F512FCF270990922D9@DB6PR0801MB1909.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AJyel+PhWjfMta/g2AJg6onpjZJ7BMynJClf7ZRWGppOHVbc3FEIDZIKnnz+tU/YpBTf8kmBbabAKaG+WfQAR5LM/YaONK4cX3xQxkUoSXPYbg9Ya1IZdyl3a18XcWwKb4qE0yLzl5DRd6VbHPyFS7KJopQrbqAX36+JPHpS8Pj4IEoKzL33jKmh1mib1n/3LPuZVN4L5pJT1YOqX+e/pK5Up0jMBIhWUwwGykyquwD7dPnDUpnAvDUnrl+WE/ZpBuo+8n+/HfcJMVDd0mtav+T5jcBZZXaBjsY6gVpaV7ljmgHbFsV94JRiS34qwHdzNVe7m45XlFVj8zatlIbQTr/KxVHgCvE/sALYfbr6J29kXJOHquNe3AlfvqGXk3uzx1I/M6azCWGdV9OGXCPZUhoGkfoKygpzLdaO1xNgTkuZt4nxKpIMpiEIkagodidRjp1AqDlKsAZZG9NWXHZyhWjMEJmt2xAluE2W4+LfxIoXcCbq4rknahsCipD24c4SB82phFANTgKw4KIlpe3BmVF34yQ5+a1zqydspFMvNRKC6w5za1yOhMyr8NofFynYoIPHmrYhh/qVnBHDYIjCPePf5LJrLi7t73BZcmuoqHY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(55016002)(186003)(316002)(110136005)(66946007)(54906003)(71200400001)(86362001)(8676002)(6506007)(2906002)(9686003)(8936002)(4326008)(5660300002)(66556008)(76116006)(33656002)(66446008)(7696005)(64756008)(83380400001)(26005)(38100700002)(66476007)(122000001)(478600001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?N3piMW8rZmxoQkdIMVAwYVY0YTlmenl6TmxyVFczV3o4cDg3azdNM0hOVjV1?=
 =?utf-8?B?WjVYM21JSGNPZWszNnQwVktRQ3ZRbWxKQ25ObUVSK2VPMVVwN2VCWlFoa1JN?=
 =?utf-8?B?ZnpscFQrVGwxOFdzSHJDOWZTZVR6aUlyVWMwNjN6NUF4MTlsQUNRN1NCNXUy?=
 =?utf-8?B?N05PV0hzbWYweG5KSUNaQWZDNTVTR1RHNjllZkhkclgwWTd4MnpWTkZzTlNT?=
 =?utf-8?B?dmtkNDIvUkxqQldLWEdRcTZySTV0Vm9NTUpEYzFlVWJrMlBETGpjVkFzVmpO?=
 =?utf-8?B?bGgwK0FmYnNSNlpEYW44K0tCZ2NEdVVjcEdDS1Z6TG56b3lhTEZhNXZQY2Z0?=
 =?utf-8?B?M0RPT0g5Y09mU1EwVm9vcnpwV0JsajdMMlpNTVVFSU1xV0l1cnpoaTFSVUFp?=
 =?utf-8?B?T05UdnNodzE3YzlSU2paSTJKZFpLMGJiWndiejc0TGFFY2I0dDJ2ZGw3SUYx?=
 =?utf-8?B?VW5ya2pxejlnQ3ZKTkZIbGxraWF3bEJIOVFySlFnblJCZ3dKWjA4UmlOSnk5?=
 =?utf-8?B?SEpqV3V5bklPaXFLOTB2SlkreGt5THNrQmxUb1hHMVBDN2JiSzVhNEpjWk9a?=
 =?utf-8?B?QkdwQnpyek1NLzc1M2FncGN6eUZQdDlNRm5leTQ4L3gyV1dFSDR6cjdSQVh5?=
 =?utf-8?B?Q0VXNkJLREZFT25ZSEpwNmlBR1AwbG5uN09XRUhCNExDMmd1a0JlOWsrNnZE?=
 =?utf-8?B?QzJrUjVpczNaNTBvaWw1SzBCdlRUSVdMenBkN2Y3VmpPNVgxUVVObDExcUR2?=
 =?utf-8?B?b1lSZWFDdzJRdzFtS1BOczVIQUJaYUovU0ZLdGw2UWNmK21uR2xVeVhoejVJ?=
 =?utf-8?B?MktDUnc4QVdkSHZ5eGZBRTNEWEJvM3ZZb1IzTSt2UWZCT3dRSTlDcE9yak00?=
 =?utf-8?B?R0NLcWlXY0xaYTJOQUs2ZUF4S2N6cEFZWkVxaXdVN2FXUXVUVzd2b1ZLZTNP?=
 =?utf-8?B?MmptZnlPclN4UlRETDBGbXFlbDZWa0tPVnl3SE40M0treXBTdW14NVFKTGxa?=
 =?utf-8?B?Z3FUU1pIMnJ1ZDlDREtuZzUwNUlvOC9hWW1qTkgyaHRuU09yNU9PaGtUYzNk?=
 =?utf-8?B?MTAvWXRCZmRGSWtqeTIyMHo5Zko5WVpGejZEa1FzZkJZblpmOTA4dUpSMTNl?=
 =?utf-8?B?ajByVTlRZjNMcUZNS0ZNTFZ4OUV2WXZtdUo3eHJMa253VW5ZSFQrdGZ6azdy?=
 =?utf-8?B?ejg4RFRxLzFnKys2WFpIQ0tRWnZNYzc0OXYxaHUwd1F5VUpJYVIzZjZnZ3RD?=
 =?utf-8?B?NnFBaGJZUTU2eHllTHl5ZjQ2UHR2VTEzV0JNOEZBanlERExjSWtmQmJoZTN4?=
 =?utf-8?B?a2liQmF5bnh1ZUI1Q00veHZ6VHBsSW04VjFXOHpiTmFuSWhON2xibzNyRlE3?=
 =?utf-8?B?U3IzUWhoTGRWN2xsUkhDd2tVNXhqbFM1dVRGQVA4QnFIbmRVOWZtNmgvRmRX?=
 =?utf-8?B?b1BXZkRZTUJLWEZWZGZxWVNhRGFnZkxQelhYOUJjSXJtN1N2RStLV2pPVUJR?=
 =?utf-8?B?R3pZR0ZYbkJEbk1YVStrTG9uL0Z6RGMweWJoUXY3ZkdmTlpJd0NiVFpCMXl2?=
 =?utf-8?B?MUorNk9xa2lVRXg5a3VPUW9lUVllckhMNmtwdEhXby9rYU9LaDl3azNBNUZU?=
 =?utf-8?B?dFBDVWs4MGo1T04ybVgzSm4reXg1UVFETjVodVUvZGIvWFpqcGxvVUpKK3pJ?=
 =?utf-8?B?MGFvSk9UdFRkcURxRlk4cWR0R0Z2Q1BiM1R1OEdqM1ByYzdhR1BjdE0rc3Nz?=
 =?utf-8?Q?VppdL0+o4PiYfYpqGMJ14MZ3cgyxKdQKeKImApp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6064
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f0bdd7d3-cfa5-4aea-35a9-08d918fe53a3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZmmsYU/mW1kRfwAs01JEasa9CkB4WQ4BTx24AZlC1CuNXuMEIqYyGh9xDRV3yr4dw+EGw3zAb+uhHNqh1KAAwwhIpyBUotLjfOJ6oZmbwUkYHvWeJpK0P3lRl35UoIlLpIKsbm4g1Wf3k7Z08x/aGNvu6pKWpCu2kbxQ2pIV7xGM7ZB/hkGfxEd2yho8z1hNqDtzt298w6oIPfb3cd4anaG2P+QCewXRM6doOrw3lAZmLVNgjM0e5E2QjnuEeVFtM90zQLdMVRbfuoAhjW46ndZm+UQHR0yWEH4+I4w46e4DI5bfi4BzNaosilp+IL4jOkdwNM9K+cif9kLiV6Yt1KldtGzKqwlSUPgpoMZe9aFZ/w5TcbTzSSwu+WDuyseYfFVfi+enrCj3MHDE4y6aewCzkqenPaqwFOaE2rLisj0KhCG9uXDW5x7a/24UFt7fI0uhHPqlpQDuDGFAklywZw9231a1gJQtHp25W2Vl+hUwvQZ7en4OxiJub9VxoRknTav7N23eKGeS+55n9uqu9mFskjQID9z7u1CTf1Fixl7tlTbxOHUSyKvKJc+wQsC8/wUGX68ZOxghy6cgTEuODjdWpa6F8zgeZYPUOpICJQhrgAFIWU1nRGz3RC1Cwxo/1RCK4SL9N9Mb211YFA+M+YfK56drPOkBSnnaB+ozT24=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(46966006)(86362001)(9686003)(83380400001)(186003)(82740400003)(7696005)(36860700001)(47076005)(2906002)(356005)(70586007)(55016002)(8676002)(6506007)(110136005)(54906003)(70206006)(478600001)(5660300002)(8936002)(4326008)(81166007)(26005)(82310400003)(33656002)(316002)(336012)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:38:12.3942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef257bcc-0f14-4320-c309-08d918fe57d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1909

DQo+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQpIaSBKdWxpZW4sDQoNCj4g
SGkgSGVucnksDQo+IA0KPiA+Pj4+IFsuLi5dDQo+IA0KPiBBaCB5ZXMsIHdlIGRvbid0IGhhdmUg
YSB2YXJpYW50IHdpdGggXy4gSSB0aG91Z2h0IGNvbXBpbGVkIHRlc3QgYmVmb3JlDQo+IHNlbmRp
bmcgaXQgOiguDQoNCk5vIHdvcnJpZXMgOikNCg0KPiANCj4gPg0KPiA+IChYRU4pIC0tLS0tLS0t
LS1iYW5rcz0yLS0tLS0tLS0NCj4gPiAoWEVOKSAtLS0tLS0tLS0tc3RhcnQ9ODAwMDAwMDAtLS0t
LS0tLQ0KPiA+IChYRU4pIC0tLS0tLS0tLS1zaXplPTdGMDAwMDAwLS0tLS0tLS0NCj4gPiAoWEVO
KSAtLS0tLS0tLS0tc3RhcnQ9RjkwMDAwMDAwMC0tLS0tLS0tDQo+ID4gKFhFTikgLS0tLS0tLS0t
LXNpemU9ODAwMDAwMDAtLS0tLS0tLQ0KPiA+IChYRU4pIENoZWNraW5nIGZvciBpbml0cmQgaW4g
L2Nob3Nlbg0KPiA+IChYRU4pIFJBTTogMDAwMDAwMDA4MDAwMDAwMCAtIDAwMDAwMDAwZmVmZmZm
ZmYNCj4gPiAoWEVOKSBSQU06IDAwMDAwMGY5MDAwMDAwMDAgLSAwMDAwMDBmOTdmZmZmZmZmDQo+
ID4gKFhFTikNCj4gPiAoWEVOKSBNT0RVTEVbMF06IDAwMDAwMDAwODQwMDAwMDAgLSAwMDAwMDAw
MDg0MTQ2NGM4IFhlbg0KPiA+IChYRU4pIE1PRFVMRVsxXTogMDAwMDAwMDA4NDE0NjRjOCAtIDAw
MDAwMDAwODQxNDhjOWIgRGV2aWNlIFRyZWUNCj4gPiAoWEVOKSBNT0RVTEVbMl06IDAwMDAwMDAw
ODAwODAwMDAgLSAwMDAwMDAwMDgxMDgwMDAwIEtlcm5lbA0KPiA+IChYRU4pICBSRVNWRFswXTog
MDAwMDAwMDA4MDAwMDAwMCAtIDAwMDAwMDAwODAwMTAwMDANCj4gPiAoWEVOKQ0KPiA+IChYRU4p
IENvbW1hbmQgbGluZTogbm9yZWJvb3QgZG9tMF9tZW09MTAyNE0gY29uc29sZT1kdHVhcnQNCj4g
PiBkdHVhcnQ9c2VyaWFsMCBib290c2NydWI9MA0KPiA+IChYRU4pIFBGTiBjb21wcmVzc2lvbiBv
biBiaXRzIDIxLi4uMjINCj4gPiAoWEVOKSBpbml0X2Jvb3RfcGFnZXM6IHBzIDAwMDAwMDAwODAw
MTAwMDAgcGUgMDAwMDAwMDA4MDA4MDAwMA0KPiANCj4gVGhlIHNpemUgb2YgdGhpcyByZWdpb24g
aXMgNDQ4TUIuDQo+IA0KPiA+IChYRU4pIGluaXRfYm9vdF9wYWdlczogcHMgMDAwMDAwMDA4MTA4
MDAwMCBwZSAwMDAwMDAwMDg0MDAwMDAwDQo+IA0KPiBUaGUgc2l6ZSBvZiB0aGlzIHJlZ2lvbiBp
cyA0N01CLg0KPiANCj4gPiAoWEVOKSBpbml0X2Jvb3RfcGFnZXM6IHBzIDAwMDAwMDAwODQxNDkw
MDAgcGUgMDAwMDAwMDBmZjAwMDAwMA0KPiANCj4gVGhlIHNpemUgb2YgdGhpcyByZWdpb24gaXMg
MTk2Nk1CLg0KPiANCj4gDQo+ID4gKFhFTikgYWxsb2NfYm9vdF9wYWdlczogbnJfcGZucyAxIHBm
bl9hbGlnbiAxDQo+ID4gKFhFTikgYWxsb2NfYm9vdF9wYWdlczogbnJfcGZucyAxIHBmbl9hbGln
biAxDQo+ID4gKFhFTikgYWxsb2NfYm9vdF9wYWdlczogbnJfcGZucyAxIHBmbl9hbGlnbiAxDQo+
ID4gKFhFTikgaW5pdF9ib290X3BhZ2VzOiBwcyAwMDAwMDBmOTAwMDAwMDAwIHBlIDAwMDAwMGY5
ODAwMDAwMDANCj4gDQo+IFRoZSBzaXplIG9mIHRoaXMgcmVnaW9uIGlzIDIwNDhNQi4NCj4gDQo+
ID4gKFhFTikgYWxsb2NfYm9vdF9wYWdlczogbnJfcGZucyA5MDkzMTIgcGZuX2FsaWduIDgxOTIN
Cj4gDQo+IFRoaXMgaXMgYXNraW5nIGZvciAzNTUyTUIgb2YgY29udGlndW91cyBtZW1vcnkgd2hp
Y2ggY2Fubm90IGJlDQo+IGFjY29tbW9kYXRlZC4gSW4gYW55IGNhc2UsIHRoaXMgaXMgcXVpdGUg
YSBsYXJnZSByZWdpb24gdG8gYXNrLg0KPiANCj4gU2FtZS4uLg0KPiANCj4gPiAoWEVOKSBYZW4g
QlVHIGF0IHBhZ2VfYWxsb2MuYzo0MzYNCj4gPg0KPiA+IFRvIGNvbXBhcmUgd2l0aCB0aGUgbWF4
aW11bSBzdGFydCBhZGRyZXNzIChmODAwMDAwMDAwKSBvZiBzZWNvbmQgcGFydA0KPiBtZW0NCj4g
PiB3aGVyZSB4ZW4gYm9vdHMgY29ycmVjdGx5LCBJIGFsc28gYXR0YWNoZWQgdGhlIGxvZyBmb3Ig
eW91ciBpbmZvcm1hdGlvbjoNCj4gPg0KPiA+IChYRU4pIC0tLS0tLS0tLS1iYW5rcz0yLS0tLS0t
LS0NCj4gPiAoWEVOKSAtLS0tLS0tLS0tc3RhcnQ9ODAwMDAwMDAtLS0tLS0tLQ0KPiA+IChYRU4p
IC0tLS0tLS0tLS1zaXplPTdGMDAwMDAwLS0tLS0tLS0NCj4gPiAoWEVOKSAtLS0tLS0tLS0tc3Rh
cnQ9RjgwMDAwMDAwMC0tLS0tLS0tDQo+ID4gKFhFTikgLS0tLS0tLS0tLXNpemU9ODAwMDAwMDAt
LS0tLS0tLQ0KPiA+IChYRU4pIENoZWNraW5nIGZvciBpbml0cmQgaW4gL2Nob3Nlbg0KPiA+IChY
RU4pIFJBTTogMDAwMDAwMDA4MDAwMDAwMCAtIDAwMDAwMDAwZmVmZmZmZmYNCj4gPiAoWEVOKSBS
QU06IDAwMDAwMGY4MDAwMDAwMDAgLSAwMDAwMDBmODdmZmZmZmZmDQo+ID4gKFhFTikNCj4gPiAo
WEVOKSBNT0RVTEVbMF06IDAwMDAwMDAwODQwMDAwMDAgLSAwMDAwMDAwMDg0MTQ2NGM4IFhlbg0K
PiA+IChYRU4pIE1PRFVMRVsxXTogMDAwMDAwMDA4NDE0NjRjOCAtIDAwMDAwMDAwODQxNDhjOWIg
RGV2aWNlIFRyZWUNCj4gPiAoWEVOKSBNT0RVTEVbMl06IDAwMDAwMDAwODAwODAwMDAgLSAwMDAw
MDAwMDgxMDgwMDAwIEtlcm5lbA0KPiA+IChYRU4pICBSRVNWRFswXTogMDAwMDAwMDA4MDAwMDAw
MCAtIDAwMDAwMDAwODAwMTAwMDANCj4gPiAoWEVOKQ0KPiA+IChYRU4pIENvbW1hbmQgbGluZTog
bm9yZWJvb3QgZG9tMF9tZW09MTAyNE0gY29uc29sZT1kdHVhcnQNCj4gPiBkdHVhcnQ9c2VyaWFs
MCBib290c2NydWI9MA0KPiA+IChYRU4pIFBGTiBjb21wcmVzc2lvbiBvbiBiaXRzIDIwLi4uMjIN
Cj4gPiAoWEVOKSBpbml0X2Jvb3RfcGFnZXM6IHBzIDAwMDAwMDAwODAwMTAwMDAgcGUgMDAwMDAw
MDA4MDA4MDAwMA0KPiA+IChYRU4pIGluaXRfYm9vdF9wYWdlczogcHMgMDAwMDAwMDA4MTA4MDAw
MCBwZSAwMDAwMDAwMDg0MDAwMDAwDQo+ID4gKFhFTikgaW5pdF9ib290X3BhZ2VzOiBwcyAwMDAw
MDAwMDg0MTQ5MDAwIHBlIDAwMDAwMDAwZmYwMDAwMDANCj4gPiAoWEVOKSBhbGxvY19ib290X3Bh
Z2VzOiBucl9wZm5zIDEgcGZuX2FsaWduIDENCj4gPiAoWEVOKSBhbGxvY19ib290X3BhZ2VzOiBu
cl9wZm5zIDEgcGZuX2FsaWduIDENCj4gPiAoWEVOKSBhbGxvY19ib290X3BhZ2VzOiBucl9wZm5z
IDEgcGZuX2FsaWduIDENCj4gPiAoWEVOKSBpbml0X2Jvb3RfcGFnZXM6IHBzIDAwMDAwMGY4MDAw
MDAwMDAgcGUgMDAwMDAwZjg4MDAwMDAwMA0KPiA+IChYRU4pIGFsbG9jX2Jvb3RfcGFnZXM6IG5y
X3BmbnMgNDUwNTYwIHBmbl9hbGlnbiA4MTkyDQo+IA0KPiAuLi4gaGVyZS4gV2UgYXJlIHRyeWlu
ZyB0byBhbGxvY2F0ZSBhIDEuNUdCIGZyYW1ldGFibGUuIFlvdSBoYXZlIG9ubHkNCj4gNEdCIG9m
IG1lbW9yeSBzbyB0aGUgZnJhbWV0YWJsZSBzaG91bGQgYmUgYSBsb3Qgc21hbGxlciAoZmV3IHRl
bnMgb2YgTUIpLg0KPiANCj4gVGhpcyBpcyBoYXBwZW5pbmcgYmVjYXVzZSBQRFggaXMgbm90IGFi
bGUgdG8gZmluZCBtYW55IGJpdHMgdG8gY29tcHJlc3MuDQo+IEkgYW0gbm90IHN1cmUgd2UgY2Fu
IGNvbXByZXNzIG1vcmUgd2l0aCB0aGUgY3VycmVudCBQRFggYWxnb3JpdGhtLiBUaGlzDQo+IG1h
eSByZXF1aXJlIHNvbWUgZXh0ZW5zaXZlIGltcHJvdmVtZW50IHRvIHJlZHVjZSB0aGUgZm9vdHBy
aW50Lg0KDQpZZXMgeW91IGFyZSByaWdodCwgdGhlbiBJIGRvbid0IGhhdmUgYW55IG1vcmUgcXVl
c3Rpb25zLiBUaGFua3MgdmVyeSBtdWNoDQpmb3IgdGhlIGRldGFpbGVkIGV4cGxhbmF0aW9uLg0K
DQo+IA0KPiBPbiBhIHByZXZpb3VzIGUtbWFpbCwgeW91IHNhaWQgeW91IHR3ZWFrZWQgdGhlIEZW
UCBtb2RlbCB0byBzZXQgdGhvc2UNCj4gcmVnaW9ucy4gV2VyZSB5b3UgdHJ5aW5nIHRvIG1pbWlj
ayB0aGUgbWVtb3J5IGxheW91dCBvZiBhIHJlYWwgSFcNCj4gKGVpdGhlciBjdXJyZW50IG9yIGZ1
dHVyZSk/DQoNCk5vdCByZWFsbHksIEkgd2FzIGp1c3QgdHJ5aW5nIHRvIGNvdmVyIGFzIG1hbnkg
Y2FzZXMgYXMgcG9zc2libGUgYW5kIHRoZXNlDQpyZWdpb25zIHdlcmUganVzdCBwaWNrZWQgZm9y
IHRlc3RpbmcgeW91ciBwYXRjaHNldCBpbiBkaWZmZXJlbnQgc2NlbmFyaW9zLg0KDQpBcyB0aGUg
aXNzdWUgaXMgcmVsYXRlZCB0byB0aGUgUERYIGFsZ29yaXRobSBpbnN0ZWFkIG9mIHRoZSBoZWFw
IGFsbG9jYXRpb24sDQphbmQgdGhlICJhbGxvY2F0aW5nIGEgYmlnIGhlYXAgb3IgdHdvIGhlYXAg
YmFua3Mgd2l0aCBhIGJpZyBnYXAiIGlzIHRlc3RlZCwNCkkgdGhpbmsgdGhpcyBwYXRjaHNldCBp
cyBwZXJmZWN0IF5eIFRoYW5rIHlvdS4NCg0KS2luZCByZWdhcmRzLA0KDQpIZW5yeQ0KDQo+IA0K
PiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

