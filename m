Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F62C4D20
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 03:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38219.70939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki6gr-0001IU-5J; Thu, 26 Nov 2020 02:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38219.70939; Thu, 26 Nov 2020 02:07:21 +0000
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
	id 1ki6gq-0001IC-Vb; Thu, 26 Nov 2020 02:07:20 +0000
Received: by outflank-mailman (input) for mailman id 38219;
 Thu, 26 Nov 2020 02:07:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/AcN=FA=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1ki6gp-0001I4-B4
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 02:07:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.70]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8e291bc-3737-49f8-9d3f-ee4b1bb2150f;
 Thu, 26 Nov 2020 02:07:17 +0000 (UTC)
Received: from AM6P191CA0043.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::20)
 by DB8PR08MB5129.eurprd08.prod.outlook.com (2603:10a6:10:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Thu, 26 Nov
 2020 02:07:15 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::1b) by AM6P191CA0043.outlook.office365.com
 (2603:10a6:209:7f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Thu, 26 Nov 2020 02:07:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 26 Nov 2020 02:07:14 +0000
Received: ("Tessian outbound 797fb8e1da56:v71");
 Thu, 26 Nov 2020 02:07:14 +0000
Received: from 2cac11986ffd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A7CFD925-A3DF-419B-AC86-D0FF1C0E13CB.1; 
 Thu, 26 Nov 2020 02:07:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2cac11986ffd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Nov 2020 02:07:09 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB3137.eurprd08.prod.outlook.com (2603:10a6:208:64::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Thu, 26 Nov
 2020 02:07:02 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3564.038; Thu, 26 Nov 2020
 02:07:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/AcN=FA=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
	id 1ki6gp-0001I4-B4
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 02:07:19 +0000
X-Inumbo-ID: a8e291bc-3737-49f8-9d3f-ee4b1bb2150f
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [40.107.20.70])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a8e291bc-3737-49f8-9d3f-ee4b1bb2150f;
	Thu, 26 Nov 2020 02:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPAbLGBAZE5fuf6VcfGW9nHH568YYdBtCzwh5B6dB9I=;
 b=6TN/hNwJkg8zqjdk/lzexsixjfticmITHhstWc05ZQMX9mAJyE+sjO5KvN3+mdxldqB5BTQ4lQ0WewaxYkHyrXEs3cILh76v7fe/b+n4YQt0JVkblMa0DD/vVlhs42fFPNuVAORX1sc2pzIZm9CDgxDFlwiBBrXUBhvo7+NJaBg=
Received: from AM6P191CA0043.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::20)
 by DB8PR08MB5129.eurprd08.prod.outlook.com (2603:10a6:10:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Thu, 26 Nov
 2020 02:07:15 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::1b) by AM6P191CA0043.outlook.office365.com
 (2603:10a6:209:7f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Thu, 26 Nov 2020 02:07:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 26 Nov 2020 02:07:14 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Thu, 26 Nov 2020 02:07:14 +0000
X-CR-MTA-TID: 64aa7808
Received: from 2cac11986ffd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A7CFD925-A3DF-419B-AC86-D0FF1C0E13CB.1;
	Thu, 26 Nov 2020 02:07:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2cac11986ffd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 26 Nov 2020 02:07:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfmj6rsgKSi3nnF8cr2DLVM2fxMk9RO3qgf54poVioCelxpDBfC+u5bRYrH4J241jRlUFH5V2BXADToUD0cpJOtD57KHyeWqIWXPZLLemQoAAXbq89vumiHoZoLMK/I8mi1YnlZH5aOuCtQJ6kk8/awMdVU4of1WcZ4vYtM+gQ/5yDRItFrX8PEgwAksQbLhRaE3UquGGuxMjw0BTgW2oxcBEN4DoSyqCiIybEWNg+nrFpVhGlqQeoSkmqpz73tWsAZUxTYDLErmLABAXGuar3UzhfWCeN3idgM7hHan4Otp+355mnmbCO28IM0wKCJKC11eAGaGsTiMZkmTY2gLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPAbLGBAZE5fuf6VcfGW9nHH568YYdBtCzwh5B6dB9I=;
 b=XpOyIiCy2zkLlMu1cGFAddFyaMXOG0QCTJbnjilrpa9M3u60VtWPn7eYac1Ixk7laQ/WThlm0de/oeDTTnCcaScG5ptCjmoUg59UB4AbCO5pLdqyM4t7hz7NRIFFe4Ol3+6NB7jFkzzjvsZ067UkAkw02zkPKNfd5GJw2YWLs4DeIXtRabkSjvuYbDEt68ajFFvVhYgBiZHqmUf6nxamQn9dhqzoJQm03ROLhPfS4zS8nLYrrs2rzNj7ee+Ch0G9aKcpMobOsi9DjD4IuQ6lfpwjWPiNTkLG7gv1dY9t+TCMEHWXdxay0syZT24dUXJTV6snCQjwbxaQ6QLwfOZSgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPAbLGBAZE5fuf6VcfGW9nHH568YYdBtCzwh5B6dB9I=;
 b=6TN/hNwJkg8zqjdk/lzexsixjfticmITHhstWc05ZQMX9mAJyE+sjO5KvN3+mdxldqB5BTQ4lQ0WewaxYkHyrXEs3cILh76v7fe/b+n4YQt0JVkblMa0DD/vVlhs42fFPNuVAORX1sc2pzIZm9CDgxDFlwiBBrXUBhvo7+NJaBg=
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB3137.eurprd08.prod.outlook.com (2603:10a6:208:64::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Thu, 26 Nov
 2020 02:07:02 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3564.038; Thu, 26 Nov 2020
 02:07:02 +0000
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre
 Przywara <Andre.Przywara@arm.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Topic: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Index: AQHWtnF2jWNIb4RgFU+PRE0mwpdPDam/tA6AgAW2ODCAFDcMgIAAINyA
Date: Thu, 26 Nov 2020 02:07:02 +0000
Message-ID:
 <AM0PR08MB3747912905438DA6D7FF969C9EF90@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20201109082110.1133996-1-penny.zheng@arm.com>
 <cfa63398-8182-b79f-1602-ed068e2319ad@xen.org>
 <AM0PR08MB3747B42FC856B9BDF24646629EE60@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2011251554070.7979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2011251554070.7979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1EB8119D72CAED43B9F871EBF53850AB.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [218.82.32.45]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 36235be0-d1ce-40da-3283-08d891affe93
x-ms-traffictypediagnostic: AM0PR08MB3137:|DB8PR08MB5129:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5129D6A5C02E96C7DE395D779EF90@DB8PR08MB5129.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rinVqLTGeSyCI24k96enHr/GYkjAALn387j2Mdq3C7Z6dgGW5RdxiQSqed0sGVK735vRdiO+7VB89xbCZmyqncIm2WUe6Nh5nAJuH7y+6loQidbSaUYLX0oV6iRsVo8HmHPZktREq2GC9v1s3c/UlNdqnNNkEeL1UkBuLM/M3VUdPouJW7xMzOExsBzRDONx+pzdVvYtVN9ijMB+OoAxjdZ+M+vI8YTv20fzeQOrdRb5bnBVmXvv8zKl2niEP1QIvlzoCI3Q1PSqnE9m/i38Uf1c/KiNrYuyWmFVTsX3xq/TTshqhlFZmJ9LdbrM8LgLCto8ZdOD26g6Dg9HxPnGGg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3747.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(53546011)(6506007)(478600001)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(4326008)(8936002)(9686003)(186003)(6916009)(55016002)(86362001)(8676002)(54906003)(26005)(7696005)(52536014)(316002)(33656002)(5660300002)(2906002)(83380400001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?gb2312?B?TVBiRGUxRFA0cWhqZjl0bnpkWVhDUklFbE9vRXdXRGNNMmZQVkF4SWhPSzBu?=
 =?gb2312?B?akMxUU1xYjBzTjlkcEIxZWJRZUlIK2hBMjFxZUR3NURnZVV5N1VDQi9Tc255?=
 =?gb2312?B?bmVFTGxhd2VTU25UTVlaTzgrTWlCNWZZRzYyNnNlNmZwTWFCb3RNT0lKS3ln?=
 =?gb2312?B?Z2NIZGMrT1RvNGdmVTVzdVc5cktraHd5Qk13cTNHcUFLbkFTZlJvbk1ZSkJW?=
 =?gb2312?B?T0xvQTU2TDd2RlJ3eVQyTFpVOXhYemc5K2ZHQ1Q3V0dLUGpBOHBnMjRCYm1w?=
 =?gb2312?B?cUNWS05kbjRWT0lHMERRdi9EbGdoZUgwZWx0S3hxMU1xMGEvOTFIWkdKZnFj?=
 =?gb2312?B?ZnZBMTFNKzZTdk1DOVpTUVlMS1hWSXZVTjc2N3BZSDRmdStrVmRhYTFMT3lv?=
 =?gb2312?B?N1FSK28yazRlRGJkMEd4dHMyRnRUOHQ1TUlTNnhkL3RVZ2syUGtMcFMzVm9w?=
 =?gb2312?B?TTBTQW1weXhpN0RsNk5kK0V4d2w0emcwb3ZOWEhJUnMrZzlNcktENEVIcSti?=
 =?gb2312?B?emE4SnRGUm5mNS9RNktsdGZOS3p3bHdIQlNhUlN6d1ZLVVhMRG9zRisxL0dR?=
 =?gb2312?B?cmlIaDNlQVpLNG1PTHdGc2UzeUdrc0VCQ3pWNW1MOGFrQlRCaGRESUpuUkZY?=
 =?gb2312?B?WS9UOCtlSmFOSVBsemRhcFpaeGUxSmFTZkVxaXZVZTQ1ZFBpT3p1UE1zTGR3?=
 =?gb2312?B?akRCNmNGYks4Q2k4dUtqMDkwRWsyK0E5dEZkSHg3MEZNc29YUitHaXNQaG9N?=
 =?gb2312?B?aG9GbUl4S0IvaHZLS2pGNUg3aUJxUWxsMGVjY1c1UEVFZFdBRVpWNzdmbVVQ?=
 =?gb2312?B?cHRLV0w1ZU9pdmJSRWJVWlp2aHRqRzlLRUFGQ1dMLzBjZGEwMHMxNU5VWit2?=
 =?gb2312?B?d3dIdVduVFAyU1JiNU1KekdRbjBJTEtMaUwrM0tGYllOc3MwM2xlRjFjbWJW?=
 =?gb2312?B?SS9WbjlSVzUrWXZIblJ3KzlpUlhBV05CaHlZZGNXV2RsMEppTnp0eXBCOS8x?=
 =?gb2312?B?TXZXdUhJVmlDclRwRmhLdUVxNXFmRmxPQVVkNU1LZHlQcUYvMFMxQWh5MGxi?=
 =?gb2312?B?RU9ZSVYyb0laTlo3SS9vby9TeVVjdk9EWmZvOERhNEpkL2d5NWtsY25VelB5?=
 =?gb2312?B?b2NadlJuR3hWSmN3YlQwVFJLcmc2d0NkaXFHWWVnbXFIMkorVHFGNzNHUWk3?=
 =?gb2312?B?QVIvbEdRZTdqeTVQMnpYMmJoQzdORE90MkE5UFBEb3RxZmRBTVlhelBseEpj?=
 =?gb2312?B?N29nb1U3N29NeE5QL29LV2ZXVk5aaXNIQjhOa3ArNHdlTHM0dmg5eDlQSEI2?=
 =?gb2312?Q?jFIlO7EzjFIis=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3137
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f567267b-40ba-4b47-a369-08d891aff707
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uaqUbW1DwbCDFJjfvt6e1cBRboxvT1vcb/ok0Wj/5XzLtifcLyc5VWGp9rerhRSi6FaV3uIkNUBK979XO/0Dng5zwpq9hzVvtkzP5jJ2Q/n/jknMV71FiXVMyCz1o0yoH1Z1gmTkzwj/mmVkwm8ywN5at6qeXK4nF0Ai7UZVukyXIm/IviDWB8hkHECnBYfe0+x16TeSd7uRKMz+jA+WXsi10ZK69npk5mybaX4Gkm+OxQPt7T+2eRy1tCaZDM/AaLIhu1SnTMN3lGc8Nasl1V7FERsK0xgRWqgCMFGLNe6YgX4hnNGdDECq6Ptn/qREwm5XSBwxIZ4p8CxzL2AZOyKrSkKBXhqAiBJiwRMm74RYbW4OZyyC2MIyc1oZaUZqXnzhK6APbtZsU95J3s6X2g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(46966005)(6862004)(6506007)(316002)(54906003)(4326008)(8936002)(53546011)(47076004)(356005)(82740400003)(26005)(7696005)(82310400003)(336012)(186003)(8676002)(33656002)(2906002)(70206006)(9686003)(86362001)(5660300002)(70586007)(52536014)(81166007)(83380400001)(55016002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 02:07:14.7999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36235be0-d1ce-40da-3283-08d891affe93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5129

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjDE6jEx
1MIyNsjVIDg6MDANCj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0u
Y29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgc3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZzsgQW5kcmUgUHJ6eXdhcmENCj4gPEFuZHJlLlByenl3YXJhQGFybS5jb20+OyBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+Ow0KPiBLYWx5IFhpbiA8S2Fs
eS5YaW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIXSB4
ZW4vYXJtOiBBZGQgQ29ydGV4LUE3MyBlcnJhdHVtIDg1ODkyMSB3b3JrYXJvdW5kDQo+IA0KPiBS
ZXN1bWluZyB0aGlzIG9sZCB0aHJlYWQuDQo+IA0KPiBPbiBGcmksIDEzIE5vdiAyMDIwLCBXZWkg
Q2hlbiB3cm90ZToNCj4gPiA+IEhpLA0KPiA+ID4NCj4gPiA+IE9uIDA5LzExLzIwMjAgMDg6MjEs
IFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+ID4gPiBDTlRWQ1RfRUwwIG9yIENOVFBDVF9FTDAgY291
bnRlciByZWFkIGluIENvcnRleC1BNzMgKGFsbCB2ZXJzaW9ucykNCj4gPiA+ID4gbWlnaHQgcmV0
dXJuIGEgd3JvbmcgdmFsdWUgd2hlbiB0aGUgY291bnRlciBjcm9zc2VzIGEgMzJiaXQgYm91bmRh
cnkuDQo+ID4gPiA+DQo+ID4gPiA+IFVudGlsIG5vdywgdGhlcmUgaXMgbm8gY2FzZSBmb3IgWGVu
IGl0c2VsZiB0byBhY2Nlc3MgQ05UVkNUX0VMMCwNCj4gPiA+ID4gYW5kIGl0IGFsc28gc2hvdWxk
IGJlIHRoZSBHdWVzdCBPUydzIHJlc3BvbnNpYmlsaXR5IHRvIGRlYWwgd2l0aA0KPiA+ID4gPiB0
aGlzIHBhcnQuDQo+ID4gPiA+DQo+ID4gPiA+IEJ1dCBmb3IgQ05UUENULCB0aGVyZSBleGlzdHMg
c2V2ZXJhbCBjYXNlcyBpbiBYZW4gaW52b2x2aW5nIHJlYWRpbmcNCj4gPiA+ID4gQ05UUENULCBz
byBhIHBvc3NpYmxlIHdvcmthcm91bmQgaXMgdGhhdCBwZXJmb3JtaW5nIHRoZSByZWFkIHR3aWNl
LA0KPiA+ID4gPiBhbmQgdG8gcmV0dXJuIG9uZSBvciB0aGUgb3RoZXIgZGVwZW5kaW5nIG9uIHdo
ZXRoZXIgYSB0cmFuc2l0aW9uIGhhcw0KPiA+ID4gPiB0YWtlbiBwbGFjZS4NCj4gPiA+ID4NCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+
ID4gPg0KPiA+ID4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+
ID4gPg0KPiA+ID4gT24gYSByZWxhdGVkIHRvcGljLCBkbyB3ZSBuZWVkIGEgZml4IHNpbWlsYXIg
dG8gTGludXggY29tbWl0DQo+ID4gPiA3NWExOWEwMjAyZGIgImFybTY0OiBhcmNoX3RpbWVyOiBF
bnN1cmUgY291bnRlciByZWdpc3RlciByZWFkcyBvY2N1cg0KPiA+ID4gd2l0aCBzZXFsb2NrIGhl
bGQiPw0KPiA+ID4NCj4gPg0KPiA+IEkgdGFrZSBhIGxvb2sgYXQgdGhpcyBMaW51eCBjb21taXQs
IGl0IHNlZW1zIHRvIHByZXZlbnQgdGhlIHNlcS1sb2NrIHRvIGJlDQo+ID4gc3BlY3VsYXRlZC4g
IFVzaW5nIGFuIGVuZm9yY2Ugb3JkZXJpbmcgaW5zdGVhZCBvZiBJU0IgYWZ0ZXIgdGhlIHJlYWQg
Y291bnRlcg0KPiA+IG9wZXJhdGlvbiBzZWVtcyB0byBiZSBmb3IgcGVyZm9ybWFuY2UgcmVhc29u
cy4NCj4gPg0KPiA+IEkgaGF2ZSBmb3VuZCB0aGF0IHlvdSBoYWQgcGxhY2VkIGFuIElTQiBiZWZv
cmUgcmVhZCBjb3VudGVyIGluIGdldF9jeWNsZXMNCj4gPiB0byBwcmV2ZW50IGNvdW50ZXIgdmFs
dWUgdG8gYmUgc3BlY3VsYXRlZC4gQnV0IHlvdSBoYXZlbid0IHBsYWNlZCB0aGUgc2Vjb25kDQo+
ID4gSVNCIGFmdGVyIHJlYWRpbmcuIElzIGl0IGJlY2F1c2Ugd2UgaGF2ZW4ndCB1c2VkIHRoZSBn
ZXRfY3ljbGVzIGluIHNlcSBsb2NrDQo+ID4gY3JpdGljYWwgY29udGV4dCAoTWF5YmUgSSBkaWRu
J3QgZmluZCB0aGUgcmlnaHQgcGxhY2UpPyBTbyBzaG91bGQgd2UgbmVlZCB0byBmaXggaXQNCj4g
PiBub3csIG9yIHlvdSBwcmVmZXIgdG8gZml4IGl0IG5vdyBmb3IgZnV0dXJlIHVzYWdlPw0KPiAN
Cj4gTG9va2luZyBhdCB0aGUgY2FsbCBzaXRlcywgaXQgZG9lc24ndCBsb29rIGxpa2Ugd2UgbmVl
ZCBhbnkgSVNCIGFmdGVyDQo+IGdldF9jeWNsZXMgYXMgaXQgaXMgbm90IHVzZWQgaW4gYW55IGNy
aXRpY2FsIGNvbnRleHQuIFRoZXJlIGlzIGFsc28gYQ0KPiBkYXRhIGRlcGVuZGVuY3kgd2l0aCB0
aGUgdmFsdWUgcmV0dXJuZWQgYnkgaXQuDQo+IA0KPiBTbyBJIGFtIHRoaW5raW5nIHdlIGRvbid0
IG5lZWQgYW55IGZpeC4gQXQgbW9zdCB3ZSBuZWVkIGFuIGluLWNvZGUgY29tbWVudD8NCg0KSSBh
Z3JlZSB3aXRoIHlvdSB0byBhZGQgYW4gaW4tY29kZSBjb21tZW50LiBJdCB3aWxsIHJlbWluZCB1
cyBpbiBmdXR1cmUgd2hlbiB3ZQ0KdXNlIHRoZSBnZXRfY3ljbGVzIGluIGNyaXRpY2FsIGNvbnRl
eHQuIEFkZGluZyBpdCBub3cgd2lsbCBwcm9iYWJseSBvbmx5IGxlYWQgdG8NCm1lYW5pbmdsZXNz
IHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uLiBCZWNhdXNlIFhlbiBtYXkgbmV2ZXIgdXNlIGl0IGlu
IGEgc2ltaWxhcg0Kc2NlbmFyaW8uDQoNCkJUVzogDQpDYW4gd2Ugc2VuZCBhIHBhdGNoIHRoYXQg
anVzdCBjb250YWlucyBhIHB1cmUgY29tbWVudCA6ICkNCg0KUmVnYXJkcywNCldlaSBDaGVuDQo=

