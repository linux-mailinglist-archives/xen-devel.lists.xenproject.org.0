Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE35328DF96
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 13:07:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6601.17533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSecY-00073d-Ev; Wed, 14 Oct 2020 11:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6601.17533; Wed, 14 Oct 2020 11:07:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSecY-00073E-Ba; Wed, 14 Oct 2020 11:07:02 +0000
Received: by outflank-mailman (input) for mailman id 6601;
 Wed, 14 Oct 2020 11:07:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PlF3=DV=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1kSecW-000738-GU
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 11:07:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e221a3d3-bd10-452c-9c7f-3849e6bb7908;
 Wed, 14 Oct 2020 11:06:58 +0000 (UTC)
Received: from AM0P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::36)
 by AM6PR08MB5142.eurprd08.prod.outlook.com (2603:10a6:20b:d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 11:06:56 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (10.141.38.4) by AM0P190CA0026.outlook.office365.com (10.141.38.36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Wed, 14 Oct 2020 11:06:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 11:06:55 +0000
Received: ("Tessian outbound ba2270a55485:v64");
 Wed, 14 Oct 2020 11:06:55 +0000
Received: from 0a603f457922.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3239BF0F-C7D4-4363-9FAB-913311D2C476.1; 
 Wed, 14 Oct 2020 11:06:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a603f457922.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Oct 2020 11:06:50 +0000
Received: from AM6PR08MB4641.eurprd08.prod.outlook.com (2603:10a6:20b:d1::16)
 by AM6PR08MB4834.eurprd08.prod.outlook.com (2603:10a6:20b:c9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 11:06:48 +0000
Received: from AM6PR08MB4641.eurprd08.prod.outlook.com
 ([fe80::e0af:a21f:3a7f:aaef]) by AM6PR08MB4641.eurprd08.prod.outlook.com
 ([fe80::e0af:a21f:3a7f:aaef%4]) with mapi id 15.20.3455.032; Wed, 14 Oct 2020
 11:06:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PlF3=DV=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
	id 1kSecW-000738-GU
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 11:07:00 +0000
X-Inumbo-ID: e221a3d3-bd10-452c-9c7f-3849e6bb7908
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [40.107.7.50])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e221a3d3-bd10-452c-9c7f-3849e6bb7908;
	Wed, 14 Oct 2020 11:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8Q0Gq1c21htlzbiP8PjTsEJXSLimefd3TvPnBvIxcQ=;
 b=3Xc1ICzEjmloiNLwEntMwfvwoU6PKKJtXT5Ml4APcmyxR71AIl72c4XuyiSNvUJfyZ1vdb+IKt2Bug4lB6aRQNqSoUfALHqVNSt8k6i0lHSfNpMkhc4qi9YUP5fTNC/xz17uS9MgKzxfe+SNJW1vwg2qtHcVkq2OG8mTSt2sohI=
Received: from AM0P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::36)
 by AM6PR08MB5142.eurprd08.prod.outlook.com (2603:10a6:20b:d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 11:06:56 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (10.141.38.4) by AM0P190CA0026.outlook.office365.com (10.141.38.36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Wed, 14 Oct 2020 11:06:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 11:06:55 +0000
Received: ("Tessian outbound ba2270a55485:v64"); Wed, 14 Oct 2020 11:06:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dfd8289fcd4604ad
X-CR-MTA-TID: 64aa7808
Received: from 0a603f457922.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3239BF0F-C7D4-4363-9FAB-913311D2C476.1;
	Wed, 14 Oct 2020 11:06:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a603f457922.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Oct 2020 11:06:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mim6exswXue7KDyyVzVFO0JwkMbAsQE32DfVeY9PrcS1VcxPGeV939yoU0LJVQUVjJ/Yo9y6iwlYt981wIX/232uosG3QnesXF8Cx8JYYKbjwYIyaIFAzd81IQ0dI+vDKQToLUCre6ilBnbuYCFfVoRV4awLM1FYccydemuS4i7azuswjDdNWtbhoUcwxB7Q7d1xXLD5mg5FHVBektXSID6f0DAaAYxfG0x1OchxRVutvig827UPtEcUx16eoefZUdrpHEJNbZk26MXja6aSh1TEd0ooBVDvBgBpaSl8YhLin+eWPmgFpygVd7u4NZs+l50jQEN8wPbESSliUop4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8Q0Gq1c21htlzbiP8PjTsEJXSLimefd3TvPnBvIxcQ=;
 b=FZJSHeGwnYWXPnyaN9M6puyLU66l57vpODY1Hgk5bcGOsVieenALO7Y/eSF0VFjCuyFwwKvaGWwuoF3l2Jj2IHU/qFbhWeTSWbJZejB0Og051sBGwnnc19lq6uaWlpAYVsmzPCoteylsk2XxaV6OSy330ElrBN59mtEuThNoolZRfk0VyHQgfpxnCNli84WJbJXD5l6zFXEseYu6ueDvzzfbTN9LQ6THdaNxCQSaHnH18wZhkT7xMk930h+k16qNUNOqy852SZIiXLthwF3B0x9060C4r5/1rRwJzXt7fMyfPxUuaWJXGI+FhD5rcoHeSGdj/SlrMR7g7aJHFPm85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8Q0Gq1c21htlzbiP8PjTsEJXSLimefd3TvPnBvIxcQ=;
 b=3Xc1ICzEjmloiNLwEntMwfvwoU6PKKJtXT5Ml4APcmyxR71AIl72c4XuyiSNvUJfyZ1vdb+IKt2Bug4lB6aRQNqSoUfALHqVNSt8k6i0lHSfNpMkhc4qi9YUP5fTNC/xz17uS9MgKzxfe+SNJW1vwg2qtHcVkq2OG8mTSt2sohI=
Received: from AM6PR08MB4641.eurprd08.prod.outlook.com (2603:10a6:20b:d1::16)
 by AM6PR08MB4834.eurprd08.prod.outlook.com (2603:10a6:20b:c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 11:06:48 +0000
Received: from AM6PR08MB4641.eurprd08.prod.outlook.com
 ([fe80::e0af:a21f:3a7f:aaef]) by AM6PR08MB4641.eurprd08.prod.outlook.com
 ([fe80::e0af:a21f:3a7f:aaef%4]) with mapi id 15.20.3455.032; Wed, 14 Oct 2020
 11:06:48 +0000
From: Michal Orzel <Michal.Orzel@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH] xen/arm: Document the erratum #853709 related to Cortex
 A72
Thread-Topic: [PATCH] xen/arm: Document the erratum #853709 related to Cortex
 A72
Thread-Index: AQHWohGlCcemlpx2NkeqO0LskPrcGKmW7SyAgAACWXs=
Date: Wed, 14 Oct 2020 11:06:48 +0000
Message-ID:
 <AM6PR08MB4641ACDB3B63F0A065FBD48389050@AM6PR08MB4641.eurprd08.prod.outlook.com>
References:
 <20201014100541.11687-1-michal.orzel@arm.com>,<ef5fc4c3-5de3-0ec1-fed9-afdb8dd1bfc1@xen.org>
In-Reply-To: <ef5fc4c3-5de3-0ec1-fed9-afdb8dd1bfc1@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 843de3ff-b931-483c-2738-08d870314371
x-ms-traffictypediagnostic: AM6PR08MB4834:|AM6PR08MB5142:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB5142183BBDB495D4BF63E55D89050@AM6PR08MB5142.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 K1EFKhj4hJBReSgTwWhVcJ3oa7ygTRSxUqJ0YK6+QVaQP+Z1CWqvnzyVJBbVaxdsl5V3WgJSUv3qyZwCgfe63eH0DDpWxS0NWnCJ9lio6ElYgXtSCZu6dX2GwaHXp1h2sUXqulvxaLoEoUv9yER3+kVcSLlHz5KzEo/xlHPpHKvnDv6BRet9hQNBupMf2eCQiD2DLil9AGzqS49c/QgQ2U2zbTQRTXnprQuIf/mTh1fUUWx0hRsaG3YU/u1uMzJCyOCle8l4AVVMfJsx+7ru6zf8MDwt9eSpRKaWPvGNhU3+9ospGLNQYlEY3vN20NJzazfm+mziVET+oXZGfTXPHvr54lRoa57ARrMHKiXMyw5855GKIZF5wYCvMjnnDnjZDR1UqrtrnEXoZfFslko/og==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4641.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(66556008)(19627405001)(66446008)(71200400001)(7696005)(66476007)(64756008)(5660300002)(83080400001)(52536014)(26005)(186003)(83380400001)(8936002)(8676002)(76116006)(2906002)(53546011)(6506007)(4326008)(110136005)(55016002)(33656002)(478600001)(66946007)(166002)(54906003)(86362001)(316002)(966005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 GWSgktWNjgnyRokUbJBrpSF0h1a/XgvxKLmuJlH/Xie9xzJlkE0dY73d8Skmsr5hcnTWd1nN66EBDAjUBwASm/VtTFx7D3touJXvLXOUdNdcUJ+caVm5QE9T99pfjLzDhDmJTxty1jHI+7DhgHtVGmSy53fWKuUwc3tYtYskwifKCZ7PvYuiTOp7pFWg3dYVA9x+B+X0X0gFHZ1lUH82/dhDbtt8z8SGI8ixBXBywzp0Ko5DdowSRqE8hi9EzaLnFcDpImoBVgALx+YfVUsgKwrtUmrbZ1lm7PwPS1fouM08GwG4y068fvsr9LmfCj1IuRSfq2f9BqxTIeFdcP2KDQ10RcsDUXZSLelvVhy8WA19/gDWtnKDy0fFrhqXGS1si1YUYneKQvi1nsN3ctv1/EbCNdIBPhSW/9u7zkHmmV9Jr3MAdIcaq356nH3m6QQppJr2OC/LV7UXCHnFaM0otk5lChRQB4QbBcAryXWJpfv33AWHcyeXBstJ0OkeeUH+5UO6eDeO7wF3jQQ9RTBetpFv2cvkIFeJLPgLirv/cGH3ySjgz42+ccPaA5RsmIseddkFUoTp7NrUiFNPoiF+N+bF5XnHWpOg2ymyt/tXysyf6+Br0/zZrqafkLbg/UANUI9JEEty69mEa86/4zltGQ==
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB4641ACDB3B63F0A065FBD48389050AM6PR08MB4641eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4834
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3ed70886-3fc4-4a03-5543-08d870313ef9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uf2mK0wAc3BHNUGf8pclitmyp5QJi6/5E4yGiBEI6tleJjKE5IHqy+wfG7/InhnNiK5tu6HhAWtAwKv//3FRUOxrDMyZ50CxW4vVQy5UoXMNnjs0Wa9AP8ojDUS3GNzUTlQ7jDXm+iP6lNWcGcsDrRIT79qIQREg3JR7rotgKksgH+yAkTZfzaWvmsH+pN3vTeZJdFKwARM2hVfzL3PY1+EVAouI3ylD7IFYJ8VxPyFSN3UKh3EIE5hLtGpaP2Xw2NQcAKxTSW64yGGqYJwGuqsHgPZQvES/UUaTjDGsVa5oUcUJqSuSmFRkxlwmalMvpJqjK6CtSGPlTQs25+MDfzPYrIlA7JtoZaA90wP463rLxnIHY7hRyPP5X5rAremZd83wr7NZdRw2nzxG+Dw2CEWC+YF83KtLwk9EX5PBDT+e+/5kvKrBOv+HogmyyErQkpmYl/VE1TGcHapbx91MsmvGLosvReF4HbU792/rzxU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966005)(19627405001)(5660300002)(70206006)(52536014)(26005)(83080400001)(356005)(186003)(2906002)(83380400001)(8936002)(8676002)(336012)(4326008)(6506007)(53546011)(47076004)(55016002)(33656002)(478600001)(7696005)(70586007)(81166007)(166002)(82740400003)(316002)(36906005)(82310400003)(86362001)(966005)(54906003)(9686003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 11:06:55.9378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 843de3ff-b931-483c-2738-08d870314371
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5142

--_000_AM6PR08MB4641ACDB3B63F0A065FBD48389050AM6PR08MB4641eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

I agree. You can update the commit message.
Thanks for review.

Michal

________________________________
From: Julien Grall <julien@xen.org>
Sent: Wednesday, October 14, 2020 12:56 PM
To: Michal Orzel <Michal.Orzel@arm.com>; xen-devel@lists.xenproject.org <xe=
n-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>; Volodymyr Babchuk <Volodym=
yr_Babchuk@epam.com>; Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH] xen/arm: Document the erratum #853709 related to Corte=
x A72

Hi Michal,

On 14/10/2020 11:05, Michal Orzel wrote:
> Workaround for Cortex-A57 erratum #852523 is already
> in Xen but Cortex-A72 erratum #853709 is not although
> it applies to the same issue.

This commit message is a bit confusing because it implies that Xen
doesn't workaround #852523. However, we do workaround it (there is no
runtime check) but not document it.

So how about the following commit message?

"The Cortex-A72 erratum #853709 is the same as the Cortex-A57 erratum
#852523. As the latter is already workaround, we only need to update the
documentation."

> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Other than the commit message, I have cross-checked with the
documentation ([1]):

Reviewed-by: Julien Grall <jgrall@amazon.com>

I can update the commit message on commit.

Cheers,

> ---
>   docs/misc/arm/silicon-errata.txt | 1 +
>   xen/arch/arm/domain.c            | 6 ++++--
>   2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-err=
ata.txt
> index e15d0923e9..1f18a9df58 100644
> --- a/docs/misc/arm/silicon-errata.txt
> +++ b/docs/misc/arm/silicon-errata.txt
> @@ -50,6 +50,7 @@ stable hypervisors.
>   | ARM            | Cortex-A57      | #834220         | ARM64_ERRATUM_83=
4220    |
>   | ARM            | Cortex-A57      | #1319537        | N/A             =
        |
>   | ARM            | Cortex-A72      | #1319367        | N/A             =
        |
> +| ARM            | Cortex-A72      | #853709         | N/A              =
       |
>   | ARM            | Cortex-A76      | #1165522        | N/A             =
        |
>   | ARM            | Neoverse-N1     | #1165522        | N/A
>   | ARM            | MMU-500         | #842869         | N/A             =
        |
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 3b37f899b9..18cafcdda7 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -216,7 +216,8 @@ static void ctxt_switch_to(struct vcpu *n)
>       WRITE_SYSREG64(n->arch.ttbr1, TTBR1_EL1);
>
>       /*
> -     * Erratum #852523: DACR32_EL2 must be restored before one of the
> +     * Erratum #852523 (Cortex-A57) or erratum #853709 (Cortex-A72):
> +     * DACR32_EL2 must be restored before one of the
>        * following sysregs: SCTLR_EL1, TCR_EL1, TTBR0_EL1, TTBR1_EL1 or
>        * CONTEXTIDR_EL1.
>        */
> @@ -245,7 +246,8 @@ static void ctxt_switch_to(struct vcpu *n)
>
>       /*
>        * This write to sysreg CONTEXTIDR_EL1 ensures we don't hit erratum
> -     * #852523. I.e DACR32_EL2 is not correctly synchronized.
> +     * #852523 (Cortex-A57) or #853709 (Cortex-A72).
> +     * I.e DACR32_EL2 is not correctly synchronized.
>        */
>       WRITE_SYSREG(n->arch.contextidr, CONTEXTIDR_EL1);
>       WRITE_SYSREG(n->arch.tpidr_el0, TPIDR_EL0);
>

[1] https://developer.arm.com/documentation/epm012079/11/

--
Julien Grall

--_000_AM6PR08MB4641ACDB3B63F0A065FBD48389050AM6PR08MB4641eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Julien,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I agree. You can update the commit message.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for review.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Michal<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Julien Grall &lt;ju=
lien@xen.org&gt;<br>
<b>Sent:</b> Wednesday, October 14, 2020 12:56 PM<br>
<b>To:</b> Michal Orzel &lt;Michal.Orzel@arm.com&gt;; xen-devel@lists.xenpr=
oject.org &lt;xen-devel@lists.xenproject.org&gt;<br>
<b>Cc:</b> Stefano Stabellini &lt;sstabellini@kernel.org&gt;; Volodymyr Bab=
chuk &lt;Volodymyr_Babchuk@epam.com&gt;; Bertrand Marquis &lt;Bertrand.Marq=
uis@arm.com&gt;<br>
<b>Subject:</b> Re: [PATCH] xen/arm: Document the erratum #853709 related t=
o Cortex A72</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hi Michal,<br>
<br>
On 14/10/2020 11:05, Michal Orzel wrote:<br>
&gt; Workaround for Cortex-A57 erratum #852523 is already<br>
&gt; in Xen but Cortex-A72 erratum #853709 is not although<br>
&gt; it applies to the same issue.<br>
<br>
This commit message is a bit confusing because it implies that Xen <br>
doesn't workaround #852523. However, we do workaround it (there is no <br>
runtime check) but not document it.<br>
<br>
So how about the following commit message?<br>
<br>
&quot;The Cortex-A72 erratum #853709 is the same as the Cortex-A57 erratum =
<br>
#852523. As the latter is already workaround, we only need to update the <b=
r>
documentation.&quot;<br>
<br>
&gt; Signed-off-by: Michal Orzel &lt;michal.orzel@arm.com&gt;<br>
<br>
Other than the commit message, I have cross-checked with the <br>
documentation ([1]):<br>
<br>
Reviewed-by: Julien Grall &lt;jgrall@amazon.com&gt;<br>
<br>
I can update the commit message on commit.<br>
<br>
Cheers,<br>
<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; docs/misc/arm/silicon-errata.txt | 1 +<br>
&gt;&nbsp;&nbsp; xen/arch/arm/domain.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 6 ++++--<br>
&gt;&nbsp;&nbsp; 2 files changed, 5 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-=
errata.txt<br>
&gt; index e15d0923e9..1f18a9df58 100644<br>
&gt; --- a/docs/misc/arm/silicon-errata.txt<br>
&gt; +++ b/docs/misc/arm/silicon-errata.txt<br>
&gt; @@ -50,6 +50,7 @@ stable hypervisors.<br>
&gt;&nbsp;&nbsp; | ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | Cortex-A57&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | #834220&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ARM64_ERRATUM_834220&nbsp;&nbsp;&=
nbsp; |<br>
&gt;&nbsp;&nbsp; | ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | Cortex-A57&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | #1319537&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | N/A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |<br>
&gt;&nbsp;&nbsp; | ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | Cortex-A72&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | #1319367&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | N/A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |<br>
&gt; +| ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | Cortex-A72&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | #853709&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; | N/A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; |<br>
&gt;&nbsp;&nbsp; | ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | Cortex-A76&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | #1165522&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | N/A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |<br>
&gt;&nbsp;&nbsp; | ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | Neoverse-N1&nbsp;&nbsp;&nbsp;&nbsp; | #1165522&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | N/A<br>
&gt;&nbsp;&nbsp; | ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | MMU-500&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | #=
842869&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | N/A&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
&gt; diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c<br>
&gt; index 3b37f899b9..18cafcdda7 100644<br>
&gt; --- a/xen/arch/arm/domain.c<br>
&gt; +++ b/xen/arch/arm/domain.c<br>
&gt; @@ -216,7 +216,8 @@ static void ctxt_switch_to(struct vcpu *n)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE_SYSREG64(n-&gt;arch.ttbr1, T=
TBR1_EL1);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; * Erratum #852523: DACR32_EL2 must be restor=
ed before one of the<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; * Erratum #852523 (Cortex-A57) or erratum #8=
53709 (Cortex-A72):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; * DACR32_EL2 must be restored before one of =
the<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * following sysregs: SCTLR_E=
L1, TCR_EL1, TTBR0_EL1, TTBR1_EL1 or<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * CONTEXTIDR_EL1.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; @@ -245,7 +246,8 @@ static void ctxt_switch_to(struct vcpu *n)<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * This write to sysreg CONTE=
XTIDR_EL1 ensures we don't hit erratum<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; * #852523. I.e DACR32_EL2 is not correctly s=
ynchronized.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; * #852523 (Cortex-A57) or #853709 (Cortex-A7=
2).<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; * I.e DACR32_EL2 is not correctly synchroniz=
ed.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE_SYSREG(n-&gt;arch.contextidr=
, CONTEXTIDR_EL1);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE_SYSREG(n-&gt;arch.tpidr_el0,=
 TPIDR_EL0);<br>
&gt; <br>
<br>
[1] <a href=3D"https://developer.arm.com/documentation/epm012079/11/">https=
://developer.arm.com/documentation/epm012079/11/</a><br>
<br>
-- <br>
Julien Grall<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR08MB4641ACDB3B63F0A065FBD48389050AM6PR08MB4641eurp_--

