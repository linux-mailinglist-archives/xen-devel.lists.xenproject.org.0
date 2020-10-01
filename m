Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A825A2803F5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1474.4669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1Sd-0002KO-82; Thu, 01 Oct 2020 16:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474.4669; Thu, 01 Oct 2020 16:29:39 +0000
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
	id 1kO1Sd-0002Jz-3H; Thu, 01 Oct 2020 16:29:39 +0000
Received: by outflank-mailman (input) for mailman id 1474;
 Thu, 01 Oct 2020 16:29:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e2ni=DI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kO1Sc-0002Ju-75
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:29:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d3ab11e-b1ab-48e1-a55b-c3dc854ecc6f;
 Thu, 01 Oct 2020 16:29:37 +0000 (UTC)
Received: from AM6PR01CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::45) by HE1PR0801MB1849.eurprd08.prod.outlook.com
 (2603:10a6:3:89::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 16:29:35 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::56) by AM6PR01CA0068.outlook.office365.com
 (2603:10a6:20b:e0::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend
 Transport; Thu, 1 Oct 2020 16:29:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 16:29:35 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Thu, 01 Oct 2020 16:29:35 +0000
Received: from 67050f35ac7b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5578BA16-5339-44A9-95BA-D52C0AF14065.1; 
 Thu, 01 Oct 2020 16:29:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 67050f35ac7b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Oct 2020 16:29:28 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2693.eurprd08.prod.outlook.com (2603:10a6:6:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Thu, 1 Oct
 2020 16:29:27 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 16:29:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=e2ni=DI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kO1Sc-0002Ju-75
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:29:38 +0000
X-Inumbo-ID: 5d3ab11e-b1ab-48e1-a55b-c3dc854ecc6f
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [40.107.20.85])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5d3ab11e-b1ab-48e1-a55b-c3dc854ecc6f;
	Thu, 01 Oct 2020 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xDoGWmtH2d2BMf+8KbENi8tLb+ymvojVAsNjpS/JRQ=;
 b=aXcyUknnMhXIcqPiF3me7i6KhQzFN39Or1smigrsOQ+7So37x3MxlL879zoNdflIVRJLlD6R2cJ/uDZOSBi6nDtgzbukSrUyLKPs6VhVOihJUq6k2FVfBrOJgYahZyTq8N7Txly9BZAWTG0BrY1yXPauLt6PcSsJX+xoWBm6CSc=
Received: from AM6PR01CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::45) by HE1PR0801MB1849.eurprd08.prod.outlook.com
 (2603:10a6:3:89::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 16:29:35 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::56) by AM6PR01CA0068.outlook.office365.com
 (2603:10a6:20b:e0::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend
 Transport; Thu, 1 Oct 2020 16:29:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 16:29:35 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Thu, 01 Oct 2020 16:29:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d4e67d40d793941
X-CR-MTA-TID: 64aa7808
Received: from 67050f35ac7b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5578BA16-5339-44A9-95BA-D52C0AF14065.1;
	Thu, 01 Oct 2020 16:29:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 67050f35ac7b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 01 Oct 2020 16:29:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1krPdmyZzIOAP3fxor8vIoeU9EylVYyQCpQdOwSV3XfN4UG5CJCF0l33zWR8Fs/jD29QNU8ieIPXIwy+8+nZi7v8KQHDG61YYIS7TLRWqTrfUsEO9MV51603ZYSKURwxJA/lqF3Dcz1C61+N49FLKoek8SZ+UdCmWbnakKfGkHuyponaNsCNe0s9mQvVYfczo1samkzCY66QooNTHfETozYIhdTEs6TWZkubTPXlfbib/Yhzt3BD37EWX5ZsjfEPUSKvnZ7HHwnR9zXi9yvjCuTKwrG9hZDlOXhjv96TbrtJmW4D6zrq5yKmC83qwLkK19gJYgHvoHbkqVEauQ2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xDoGWmtH2d2BMf+8KbENi8tLb+ymvojVAsNjpS/JRQ=;
 b=c8flpHVdEZ/fllMVJJQljuAlgCSdjGVtHJJKFl+2QetZ6RTc59zU9IH9m6ny8cLFCiyhoCAcF9DqBkzC1giybKT0EYHmHFC4nvKSXzWnEknEOosgHOmqAAGZ0rwYs9SCQls0HnLvQooZBXwOybTzObjUlx1BBZlt02y6sRDogMbFi6143azal9nzrB4O0HKQp4lAInsOYITsYn4F14YG9dXdQKtNnTFpxF//laxPiwzJgqNl1D602CBozzXIyz/FdpQD/w2mg+BKHJaNbbgYvym5s/M9wSdVLiTyS/8aHjpuebIGrCcv+8FH1DFDC0NsAsJg2C0MqQ4kAsFOIqyv8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xDoGWmtH2d2BMf+8KbENi8tLb+ymvojVAsNjpS/JRQ=;
 b=aXcyUknnMhXIcqPiF3me7i6KhQzFN39Or1smigrsOQ+7So37x3MxlL879zoNdflIVRJLlD6R2cJ/uDZOSBi6nDtgzbukSrUyLKPs6VhVOihJUq6k2FVfBrOJgYahZyTq8N7Txly9BZAWTG0BrY1yXPauLt6PcSsJX+xoWBm6CSc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2693.eurprd08.prod.outlook.com (2603:10a6:6:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Thu, 1 Oct
 2020 16:29:27 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 16:29:27 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Ping: [PATCH 0/6] tools/include: adjustments to the population of
 xen/
Thread-Topic: Ping: [PATCH 0/6] tools/include: adjustments to the population
 of xen/
Thread-Index: AQHWh2uA51KvLc+DNUCjQhMwaVDUdqmDCd+AgAAHWYA=
Date: Thu, 1 Oct 2020 16:29:27 +0000
Message-ID: <9F53B61A-5A50-46DD-BF5B-75F48C91FCFC@arm.com>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
 <673fdaf3-e770-67c8-0a6c-6cdec79df38a@suse.com>
In-Reply-To: <673fdaf3-e770-67c8-0a6c-6cdec79df38a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c1d7708c-7902-4e4d-f411-08d866272f31
x-ms-traffictypediagnostic: DB6PR08MB2693:|HE1PR0801MB1849:
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB1849DC43081A5E82E345DEF49D300@HE1PR0801MB1849.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 I/4If7INilnVzAj9b7wF9GxDiqzs4AnfY050BJdqHKvLFNJpeDe+u1yryOafdol4KTrRgWzozibRqGwWuS2gK2F4tZBX0I1PB4eXSZSuj/HpKv5VQtGWJ4ldE+iy1GoyUiTz0jYvRtuDpzxMQT8qdNdOMgD3mkbJLHUJdTa4UhxpbSlQxe+I3cdY75ybH5fjqjiiZDSLrQI22+6HhiIAdzhA5ji5SGLgDqbO3VXz16SSYqlLTbWMAQ8f4cBFQLGxJlJOH+mEb+4LGxrFNRTjO6l2pAxIOQgX+Ysx2AdZbeqEgA7cuGjgyCaaI6RslWttQ9MSgiANpbE/vI3SX31dpg3V1o4cy828QwMG7cnMyrY89qJcRugYDxegG94rC4gH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(396003)(346002)(366004)(33656002)(54906003)(86362001)(2906002)(8936002)(71200400001)(186003)(5660300002)(36756003)(6512007)(478600001)(2616005)(8676002)(64756008)(66446008)(66946007)(76116006)(91956017)(6506007)(6916009)(6486002)(53546011)(316002)(4326008)(66556008)(26005)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 iRdslZTQUWCzyVZ4flWm3mFmXku1x9Ism6TYU2bNGo25YaKqoGlnS4LOwcQ55mX1d5zqoDgm0Bbkt5X1Xu6L1dGumZTmlodvOA2pAA1ztZrONxBwiXBawj7esYrBTe9k4ZfDp1oOXmpV9dv7a5s4wv3UU9Os7prEq1RPa/OQbagkQ/aCx4cq3YQKf2I9V96G8VYng2OR1VOsykenpf9ET5W9n+o0fI2SuVZJzhUCDIm+nCb48JEeICvI4TYuTraxlJYlvt90H0hevX2x5+0KxjPW0bJguk40WTyKujR6qISjt+6NpJmQ74IYwjqk3haalIJ11cihBOQemegGMSSW+rojnAn8hWzQw34Zxa+11JaWDbRxu4irV6mFq1uywVQaxA0RcUPvL20oLobS27koNJ9NXlN4bj0ypUpUz3TCCypHNO7xKFPfITCAX4Lm/hJyA4Z5AzGfyyyTFomK9jpco6iZPfniULNgy3z48Nl6/gwR0zjo7a82GS7gygufN0QwMUGqoarSFYdj6mLytTuA0CmIIjKjfzLTCIdxVZz5DkO6FmiuFFZ6XYChj3RszjfZ6l8QGUqGbijIGT3bE8fjnefWI7tRCpkm83JmVz4S02PisXUPnDD/b/NPFykMNUAyZmcSKQA+tH3hciybq+LOSA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6BDF005340F094EB5C73C2E176AF8B5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2693
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a60316bf-19f6-47e1-13c3-08d866272a9f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qTF8g85Xohjunur4V7BUewNN0kIku4gfwUXc/+np3BGwbt6iGCJocCWvqK31oew08GIErmQHb95n4xxpECv4g5wnZkxUo9bIQ6deTjSeHwK0IWQ/G8ECm4QrqGLr73CCphDhZGnLnxOekRzkugFIxyPAZ9KluvZRgRgeyR5mn6jTfhIHPJwtYeS6Ffwk1vCc9tCjUhXn5XLlQhUE/ns2QCDbe8NXSBQ/n9fuM17iI70bmkDj37Ns47mWB9HWiy2jF+YDRQ8UxPojy4E4NRHZJLo9JZZmx8nTauROSLQs3XEHL8rTz8p3NiziBxxHwb2nGdSGRsFD3kZTHd52VWz6tfUgUGlAh/KMBMafLzgekAO4fyF+Z4Uh6Upf67SoldfpmgvQiQyA1xiBij3SU6iIJA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(376002)(136003)(46966005)(6862004)(6506007)(8676002)(53546011)(26005)(5660300002)(186003)(36756003)(478600001)(70586007)(36906005)(316002)(54906003)(70206006)(47076004)(6486002)(6512007)(8936002)(356005)(86362001)(2906002)(82740400003)(82310400003)(81166007)(4326008)(2616005)(33656002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 16:29:35.3906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d7708c-7902-4e4d-f411-08d866272f31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1849

SGkgSmFuLA0KDQo+IE9uIDEgT2N0IDIwMjAsIGF0IDE3OjAzLCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTAuMDkuMjAyMCAxNDowOSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+PiBXaGlsZSBsb29raW5nIGF0IHdoYXQgaXQgd291bGQgdGFrZSB0byBtb3Zl
IGFyb3VuZCBsaWJlbGYvDQo+PiBpbiB0aGUgaHlwZXJ2aXNvciBzdWJ0cmVlLCBJJ3ZlIHJ1biBp
bnRvIHRoaXMgcnVsZSwgd2hpY2ggSQ0KPj4gdGhpbmsgY2FuIGRvIHdpdGggYSBmZXcgaW1wcm92
ZW1lbnRzIGFuZCBzb21lIHNpbXBsaWZpY2F0aW9uLg0KPj4gDQo+PiAxOiBhZGp1c3QgcG9wdWxh
dGlvbiBvZiBhY3BpLw0KPj4gMjogZml4IChkcm9wKSBkZXBlbmRlbmNpZXMgb2Ygd2hlbiB0byBw
b3B1bGF0ZSB4ZW4vDQo+PiAzOiBhZGp1c3QgcG9wdWxhdGlvbiBvZiBwdWJsaWMgaGVhZGVycyBp
bnRvIHhlbi8NCj4+IDQ6IHByb3Blcmx5IGluc3RhbGwgQXJtIHB1YmxpYyBoZWFkZXJzDQo+PiA1
OiBhZGp1c3QgeDg2LXNwZWNpZmljIHBvcHVsYXRpb24gb2YgeGVuLw0KPj4gNjogZHJvcCByZW1h
aW5pbmcgLWYgZnJvbSBsbiBpbnZvY2F0aW9ucw0KPiANCj4gTWF5IEkgYXNrIGZvciBhbiBhY2sg
b3Igb3RoZXJ3aXNlIGhlcmU/DQoNClRoaXMgaXMgZ29pbmcgdGhlIHJpZ2h0IHdheSBidXQgd2l0
aCB0aGlzIHNlcmllIChvbiB0b3Agb2YgY3VycmVudCBzdGFnaW5nDQpzdGF0dXMpLCBJIGhhdmUg
YSBjb21waWxhdGlvbiBlcnJvciBpbiBZb2N0byB3aGlsZSBjb21waWxpbmcgcWVtdToNCiBJbiBm
aWxlIGluY2x1ZGVkIGZyb20gL21lZGlhL2V4dGVuZC1kcml2ZS9iZXJtYXIwMS9EZXZlbG9wbWVu
dC94ZW4tZGV2L3lvY3RvLWJ1aWxkL2J1aWxkL2RvbTAtZnZwLnByai90bXAvd29yay9hcm12OGEt
cG9reS1saW51eC9xZW11LzUuMS4wLXIwL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL3hlbmd1
ZXN0Lmg6MjUsDQp8ICAgICAgICAgICAgICAgICAgZnJvbSAvbWVkaWEvZXh0ZW5kLWRyaXZlL2Jl
cm1hcjAxL0RldmVsb3BtZW50L3hlbi1kZXYveW9jdG8tYnVpbGQvYnVpbGQvZG9tMC1mdnAucHJq
L3RtcC93b3JrL2FybXY4YS1wb2t5LWxpbnV4L3FlbXUvNS4xLjAtcjAvcWVtdS01LjEuMC9ody9p
Mzg2L3hlbi94ZW5fcGxhdGZvcm0uYzo0MToNCnwgL21lZGlhL2V4dGVuZC1kcml2ZS9iZXJtYXIw
MS9EZXZlbG9wbWVudC94ZW4tZGV2L3lvY3RvLWJ1aWxkL2J1aWxkL2RvbTAtZnZwLnByai90bXAv
d29yay9hcm12OGEtcG9reS1saW51eC9xZW11LzUuMS4wLXIwL3JlY2lwZS1zeXNyb290L3Vzci9p
bmNsdWRlL3hlbmN0cmxfZG9tLmg6MTk6MTA6IGZhdGFsIGVycm9yOiB4ZW4vbGliZWxmL2xpYmVs
Zi5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQp8ICAgIDE5IHwgI2luY2x1ZGUgPHhlbi9s
aWJlbGYvbGliZWxmLmg+DQp8ICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
DQp8IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuDQp8IC9tZWRpYS9leHRlbmQtZHJpdmUvYmVybWFy
MDEvRGV2ZWxvcG1lbnQveGVuLWRldi95b2N0by1idWlsZC9idWlsZC9kb20wLWZ2cC5wcmovdG1w
L3dvcmsvYXJtdjhhLXBva3ktbGludXgvcWVtdS81LjEuMC1yMC9xZW11LTUuMS4wL3J1bGVzLm1h
azo2OTogcmVjaXBlIGZvciB0YXJnZXQgJ2h3L2kzODYveGVuL3hlbl9wbGF0Zm9ybS5v4oCZIGZh
aWxlZA0KDQpYZW4gaXMgdXNpbmcgeGVuY3RybF9kb20uaCB3aGljaCBuZWVkIHRoZSBsaWJlbGYu
aCBoZWFkZXIgZnJvbSB4ZW4uDQoNClJlZ2FyZHMNCkJlcnRyYW5kDQoNCg==

